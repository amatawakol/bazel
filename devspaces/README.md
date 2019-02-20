# Bazel Development with DevSpaces 

## DF DevSpaces CLI Installation

You can download the setup file in [this link](https://www.devspaces.io/devspaces/download) and follow the install steps [here](https://support.devspaces.io/article/22-devspaces-client-installation).

* To download the DevSpaces CLI, you need to log in using your GitHub account.

## DF DevSpaces CLI Usage

After installation, you can use DevSpaces CLI by running `devspaces` command in the command line. It will show all actions that you can do with DevSpaces.

### Start a new DevSpace for Bazel

Please, follow these steps to create a new DevSpace and build the Bazel project inside it:

1. Move to `devspaces` folder. This folder contains all resources that are needed to create the DevSpace.

        cd devspaces

1. Create the DevSpace by running the following command. A new window will be shown with the build status.

        devspaces create
    
    * The notification system will shown a message when the build is finished. Then the validation process starts (it takes at least 2 minutes).

1. When the validation process is finished, you can start the the DevSpace by running the following command. 

        devspaces start Bazel

    * The notification system will inform when the start is finished.

1. You can enter the created DevSpace by running the following command. 

        devspaces exec Bazel

### Build and Run Bazel

1. First, you need the source code inside the container. There are two approaches to get that: clone the repository inside the container (a) or bind the local repository with the container (b). 

    a. To clone the repository inside the container you can run the following command:

                git clone https://github.com/trilogy-group/bazel.git

    * If you want to clone the repository inside the `/data` folder you will need to firt clean it (**CAUTION: if it is bonded, the files in local environment will be deleted too**):

                cd /data
                rm -rf .*
                rm -rf *
                git clone https://github.com/trilogy-group/bazel.git .

    b. To bind a folder to the created and started DevSpace, it is needed to follow the steps below:

    * Make sure that the DevSpace is `Running` using the `devspaces ls` command.
    * With a running DevSpace, move to the root folder of the repository in the local machine.
    * Run the below command to bind the current folder:

                devspaces bind Bazel

    * Wait to get all files synced. When you get the sync up to date, everything that is changed, deleted or created inside the local folder or in the `/data` folder inside the container will be synced. The sync is bidirectional. 
    * **Note:** If you want to stop the bind, just move to the bonded folder and run the command:

                devspaces unbind Bazel

1. To run a build inside the DevSpaces, just run the following command inside the repository folder:

        bazel build //src:bazel

    * After the build the resulting binary can be found at `bazel-bin/src/bazel`.

1. Bazel is a build system. Thus, to run it, we need a project that needs to be built. Fortunately, there are some examples in the [bazelbuild/examples](https://github.com/bazelbuild/examples) repository. So, the first thing we need to do is to clone this repository in a place that we want:

        git clone https://github.com/bazelbuild/examples.git

1. There are some examples inside this repository. For this README, we will try `java-maven`. Therefore, go to the `java-maven` folder and run the built bazel to build this project:

        cd java-maven
        /data/bazel-bin/src/bazel build :java-maven
