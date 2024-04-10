; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26128 () Bool)

(assert start!26128)

(declare-fun b!269669 () Bool)

(declare-fun res!133827 () Bool)

(declare-fun e!173938 () Bool)

(assert (=> b!269669 (=> (not res!133827) (not e!173938))))

(declare-datatypes ((array!13225 0))(
  ( (array!13226 (arr!6262 (Array (_ BitVec 32) (_ BitVec 64))) (size!6614 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13225)

(declare-datatypes ((List!4070 0))(
  ( (Nil!4067) (Cons!4066 (h!4733 (_ BitVec 64)) (t!9152 List!4070)) )
))
(declare-fun arrayNoDuplicates!0 (array!13225 (_ BitVec 32) List!4070) Bool)

(assert (=> b!269669 (= res!133827 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4067))))

(declare-fun b!269670 () Bool)

(declare-fun e!173936 () Bool)

(assert (=> b!269670 (= e!173938 e!173936)))

(declare-fun res!133829 () Bool)

(assert (=> b!269670 (=> (not res!133829) (not e!173936))))

(declare-datatypes ((SeekEntryResult!1420 0))(
  ( (MissingZero!1420 (index!7850 (_ BitVec 32))) (Found!1420 (index!7851 (_ BitVec 32))) (Intermediate!1420 (undefined!2232 Bool) (index!7852 (_ BitVec 32)) (x!26193 (_ BitVec 32))) (Undefined!1420) (MissingVacant!1420 (index!7853 (_ BitVec 32))) )
))
(declare-fun lt!135268 () SeekEntryResult!1420)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269670 (= res!133829 (or (= lt!135268 (MissingZero!1420 i!1267)) (= lt!135268 (MissingVacant!1420 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13225 (_ BitVec 32)) SeekEntryResult!1420)

(assert (=> b!269670 (= lt!135268 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269671 () Bool)

(declare-fun res!133824 () Bool)

(assert (=> b!269671 (=> (not res!133824) (not e!173938))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269671 (= res!133824 (and (= (size!6614 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6614 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6614 a!3325))))))

(declare-fun b!269672 () Bool)

(declare-fun res!133826 () Bool)

(assert (=> b!269672 (=> (not res!133826) (not e!173938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269672 (= res!133826 (validKeyInArray!0 k!2581))))

(declare-fun b!269673 () Bool)

(declare-datatypes ((Unit!8365 0))(
  ( (Unit!8366) )
))
(declare-fun e!173937 () Unit!8365)

(declare-fun lt!135267 () Unit!8365)

(assert (=> b!269673 (= e!173937 lt!135267)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8365)

(assert (=> b!269673 (= lt!135267 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13225 (_ BitVec 32)) Bool)

(assert (=> b!269673 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13226 (store (arr!6262 a!3325) i!1267 k!2581) (size!6614 a!3325)) mask!3868)))

(declare-fun b!269674 () Bool)

(declare-fun res!133830 () Bool)

(assert (=> b!269674 (=> (not res!133830) (not e!173938))))

(declare-fun arrayContainsKey!0 (array!13225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269674 (= res!133830 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269675 () Bool)

(declare-fun res!133823 () Bool)

(assert (=> b!269675 (=> (not res!133823) (not e!173936))))

(assert (=> b!269675 (= res!133823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269677 () Bool)

(declare-fun res!133825 () Bool)

(assert (=> b!269677 (=> (not res!133825) (not e!173936))))

(assert (=> b!269677 (= res!133825 (= startIndex!26 i!1267))))

(declare-fun b!269678 () Bool)

(declare-fun Unit!8367 () Unit!8365)

(assert (=> b!269678 (= e!173937 Unit!8367)))

(declare-fun res!133828 () Bool)

(assert (=> start!26128 (=> (not res!133828) (not e!173938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26128 (= res!133828 (validMask!0 mask!3868))))

(assert (=> start!26128 e!173938))

(declare-fun array_inv!4225 (array!13225) Bool)

(assert (=> start!26128 (array_inv!4225 a!3325)))

(assert (=> start!26128 true))

(declare-fun b!269676 () Bool)

(assert (=> b!269676 (= e!173936 false)))

(declare-fun lt!135266 () Unit!8365)

(assert (=> b!269676 (= lt!135266 e!173937)))

(declare-fun c!45474 () Bool)

(assert (=> b!269676 (= c!45474 (bvslt startIndex!26 (bvsub (size!6614 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26128 res!133828) b!269671))

(assert (= (and b!269671 res!133824) b!269672))

(assert (= (and b!269672 res!133826) b!269669))

(assert (= (and b!269669 res!133827) b!269674))

(assert (= (and b!269674 res!133830) b!269670))

(assert (= (and b!269670 res!133829) b!269675))

(assert (= (and b!269675 res!133823) b!269677))

(assert (= (and b!269677 res!133825) b!269676))

(assert (= (and b!269676 c!45474) b!269673))

(assert (= (and b!269676 (not c!45474)) b!269678))

(declare-fun m!285451 () Bool)

(assert (=> b!269675 m!285451))

(declare-fun m!285453 () Bool)

(assert (=> b!269672 m!285453))

(declare-fun m!285455 () Bool)

(assert (=> b!269669 m!285455))

(declare-fun m!285457 () Bool)

(assert (=> b!269674 m!285457))

(declare-fun m!285459 () Bool)

(assert (=> start!26128 m!285459))

(declare-fun m!285461 () Bool)

(assert (=> start!26128 m!285461))

(declare-fun m!285463 () Bool)

(assert (=> b!269670 m!285463))

(declare-fun m!285465 () Bool)

(assert (=> b!269673 m!285465))

(declare-fun m!285467 () Bool)

(assert (=> b!269673 m!285467))

(declare-fun m!285469 () Bool)

(assert (=> b!269673 m!285469))

(push 1)

(assert (not b!269675))

(assert (not b!269669))

(assert (not start!26128))

(assert (not b!269672))

(assert (not b!269670))

(assert (not b!269673))

