package test

import (
	"fmt"
	"os/exec"
	"testing"

	"github.com/gruntwork-io/terratest/modules/docker"
	"github.com/stretchr/testify/assert"
)

func TestPlaybook(t *testing.T) {
	// website::tag::1:: Configure the tag to use on the Docker image.
	tag := "docker-smoke"
	buildOptions := &docker.BuildOptions{
		Tags: []string{tag},
	}
	docker.Build(t, "../", buildOptions)

	fmt.Println(tag + ":/app/HelloWorld.yml")

	cmd := `
	  echo "";
	  echo "------------";
	  docker container create --name dummy docker-smoke; 
	  docker cp ./HelloWorld.yml dummy:/;
	  docker commit dummy docker-smoke;
	  docker rm dummy;
	  echo "------------";
	  echo "";
	`
	O, err := exec.Command("sh", "-c", cmd).Output()
	fmt.Println(string(O))
	if err != nil {
		t.Fatal(err)
	}

	// website::tag::3:: Run the Docker image.
	opts := &docker.RunOptions{
		Command: []string{"sh", "-c", "ansible-playbook /HelloWorld.yml && [ -e /testfile.txt ] && echo 'O.K.'"},
	}
	output := docker.Run(t, tag, opts)
	fmt.Println(output)
	assert.Contains(t, output, "Create a file called 'testfile.txt'")
	assert.Contains(t, output, "O.K.")
}
