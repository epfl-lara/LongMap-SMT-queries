; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27118 () Bool)

(assert start!27118)

(declare-fun b!280415 () Bool)

(declare-fun res!143485 () Bool)

(declare-fun e!178534 () Bool)

(assert (=> b!280415 (=> (not res!143485) (not e!178534))))

(declare-datatypes ((array!13936 0))(
  ( (array!13937 (arr!6610 (Array (_ BitVec 32) (_ BitVec 64))) (size!6962 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13936)

(declare-datatypes ((List!4418 0))(
  ( (Nil!4415) (Cons!4414 (h!5084 (_ BitVec 64)) (t!9500 List!4418)) )
))
(declare-fun arrayNoDuplicates!0 (array!13936 (_ BitVec 32) List!4418) Bool)

(assert (=> b!280415 (= res!143485 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4415))))

(declare-fun b!280416 () Bool)

(declare-fun res!143490 () Bool)

(declare-fun e!178533 () Bool)

(assert (=> b!280416 (=> (not res!143490) (not e!178533))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280416 (= res!143490 (validKeyInArray!0 (select (arr!6610 a!3325) startIndex!26)))))

(declare-fun b!280417 () Bool)

(declare-fun res!143496 () Bool)

(assert (=> b!280417 (=> (not res!143496) (not e!178533))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13936 (_ BitVec 32)) Bool)

(assert (=> b!280417 (= res!143496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280418 () Bool)

(assert (=> b!280418 (= e!178534 e!178533)))

(declare-fun res!143493 () Bool)

(assert (=> b!280418 (=> (not res!143493) (not e!178533))))

(declare-datatypes ((SeekEntryResult!1768 0))(
  ( (MissingZero!1768 (index!9242 (_ BitVec 32))) (Found!1768 (index!9243 (_ BitVec 32))) (Intermediate!1768 (undefined!2580 Bool) (index!9244 (_ BitVec 32)) (x!27478 (_ BitVec 32))) (Undefined!1768) (MissingVacant!1768 (index!9245 (_ BitVec 32))) )
))
(declare-fun lt!138823 () SeekEntryResult!1768)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280418 (= res!143493 (or (= lt!138823 (MissingZero!1768 i!1267)) (= lt!138823 (MissingVacant!1768 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13936 (_ BitVec 32)) SeekEntryResult!1768)

(assert (=> b!280418 (= lt!138823 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280419 () Bool)

(declare-fun res!143495 () Bool)

(assert (=> b!280419 (=> (not res!143495) (not e!178533))))

(assert (=> b!280419 (= res!143495 (not (= startIndex!26 i!1267)))))

(declare-fun b!280420 () Bool)

(declare-fun res!143484 () Bool)

(assert (=> b!280420 (=> (not res!143484) (not e!178533))))

(declare-fun contains!1990 (List!4418 (_ BitVec 64)) Bool)

(assert (=> b!280420 (= res!143484 (not (contains!1990 Nil!4415 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280421 () Bool)

(declare-fun res!143491 () Bool)

(assert (=> b!280421 (=> (not res!143491) (not e!178534))))

(declare-fun arrayContainsKey!0 (array!13936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280421 (= res!143491 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280422 () Bool)

(declare-fun res!143494 () Bool)

(assert (=> b!280422 (=> (not res!143494) (not e!178533))))

(declare-fun noDuplicate!172 (List!4418) Bool)

(assert (=> b!280422 (= res!143494 (noDuplicate!172 Nil!4415))))

(declare-fun b!280423 () Bool)

(declare-fun res!143489 () Bool)

(assert (=> b!280423 (=> (not res!143489) (not e!178534))))

(assert (=> b!280423 (= res!143489 (and (= (size!6962 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6962 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6962 a!3325))))))

(declare-fun b!280424 () Bool)

(declare-fun res!143488 () Bool)

(assert (=> b!280424 (=> (not res!143488) (not e!178534))))

(assert (=> b!280424 (= res!143488 (validKeyInArray!0 k!2581))))

(declare-fun b!280425 () Bool)

(assert (=> b!280425 (= e!178533 false)))

(declare-fun lt!138822 () Bool)

(assert (=> b!280425 (= lt!138822 (contains!1990 Nil!4415 k!2581))))

(declare-fun res!143487 () Bool)

(assert (=> start!27118 (=> (not res!143487) (not e!178534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27118 (= res!143487 (validMask!0 mask!3868))))

(assert (=> start!27118 e!178534))

(declare-fun array_inv!4573 (array!13936) Bool)

(assert (=> start!27118 (array_inv!4573 a!3325)))

(assert (=> start!27118 true))

(declare-fun b!280426 () Bool)

(declare-fun res!143492 () Bool)

(assert (=> b!280426 (=> (not res!143492) (not e!178533))))

(assert (=> b!280426 (= res!143492 (and (bvslt (size!6962 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6962 a!3325))))))

(declare-fun b!280427 () Bool)

(declare-fun res!143486 () Bool)

(assert (=> b!280427 (=> (not res!143486) (not e!178533))))

(assert (=> b!280427 (= res!143486 (not (contains!1990 Nil!4415 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!27118 res!143487) b!280423))

(assert (= (and b!280423 res!143489) b!280424))

(assert (= (and b!280424 res!143488) b!280415))

(assert (= (and b!280415 res!143485) b!280421))

(assert (= (and b!280421 res!143491) b!280418))

(assert (= (and b!280418 res!143493) b!280417))

(assert (= (and b!280417 res!143496) b!280419))

(assert (= (and b!280419 res!143495) b!280416))

(assert (= (and b!280416 res!143490) b!280426))

(assert (= (and b!280426 res!143492) b!280422))

(assert (= (and b!280422 res!143494) b!280427))

(assert (= (and b!280427 res!143486) b!280420))

(assert (= (and b!280420 res!143484) b!280425))

(declare-fun m!294853 () Bool)

(assert (=> b!280415 m!294853))

(declare-fun m!294855 () Bool)

(assert (=> b!280422 m!294855))

(declare-fun m!294857 () Bool)

(assert (=> b!280418 m!294857))

(declare-fun m!294859 () Bool)

(assert (=> b!280424 m!294859))

(declare-fun m!294861 () Bool)

(assert (=> b!280420 m!294861))

(declare-fun m!294863 () Bool)

(assert (=> b!280427 m!294863))

(declare-fun m!294865 () Bool)

(assert (=> start!27118 m!294865))

(declare-fun m!294867 () Bool)

(assert (=> start!27118 m!294867))

(declare-fun m!294869 () Bool)

(assert (=> b!280417 m!294869))

(declare-fun m!294871 () Bool)

(assert (=> b!280416 m!294871))

(assert (=> b!280416 m!294871))

(declare-fun m!294873 () Bool)

(assert (=> b!280416 m!294873))

(declare-fun m!294875 () Bool)

(assert (=> b!280421 m!294875))

(declare-fun m!294877 () Bool)

(assert (=> b!280425 m!294877))

(push 1)

