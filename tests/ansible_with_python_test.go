package test

import (
	"fmt"
	"os/exec"
	"testing"

	"github.com/gruntwork-io/terratest/modules/docker"
	"github.com/stretchr/testify/assert"
)

func TestPlaybookCustomModule(t *testing.T) {
	// website::tag::1:: Configure the tag to use on the Docker image.
	tag := "docker-smoke"
	buildOptions := &docker.BuildOptions{
		Tags: []string{tag},
	}
	docker.Build(t, "../", buildOptions)

	cmd := `
	  echo "";
	  echo "------------";
	  docker container create --name dummy docker-smoke; 
	  docker cp ./HelloPython.yml dummy:/;
	  docker cp ./modules/time.py dummy:/tmp;
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

	dockerCmd := `
	  ansible --version &&
	  ANSIBLE_LIBRARY=/tmp ansible-playbook /HelloPython.yml
	`
	opts := &docker.RunOptions{
		Command: []string{"sh", "-c", dockerCmd},
	}
	output := docker.Run(t, tag, opts)
	assert.Contains(t, output, "changed=1")
}
