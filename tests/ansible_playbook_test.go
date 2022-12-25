package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/docker"
	"github.com/stretchr/testify/assert"
)

func fileExists(path string) bool {
	// Check if the file exists
	if _, err := os.Stat(path); err != nil {
		if os.IsNotExist(err) {
			return false
		}
		return false
	}
	return true
}

func TestPlaybook(t *testing.T) {
	// website::tag::1:: Configure the tag to use on the Docker image.
	tag := "docker-smoke"
	buildOptions := &docker.BuildOptions{
		Tags: []string{tag},
	}
	docker.Build(t, "../", buildOptions)

	base := os.Getenv("BASE")
	if base == "" {
		cwd, err := os.Getwd()
		if err != nil {
			t.Fatal(err)
		}
		base = cwd + "/../"
	}

	fmt.Println("====== Base: " + base)

	// website::tag::3:: Run the Docker image.
	opts := &docker.RunOptions{
		Command: []string{"sh", "-c", "ls -la && ansible-playbook /app/HelloWorld.yml"},
		Volumes: []string{
			fmt.Sprintf("%stests:/app", base),
		},
	}
	output := docker.Run(t, tag, opts)
	fmt.Println(output)
	assert.Contains(t, output, "Create a file called 'testfile.txt'")
	if fileExists("./testfile.txt") {
		fmt.Println("File exists")
		assert.True(t, true)
	} else {
		fmt.Println("File does not exist")
		assert.True(t, false)
	}
	if err := os.Remove("./testfile.txt"); err != nil {
		fmt.Println(err)
		assert.True(t, false)
		return
	}
}
