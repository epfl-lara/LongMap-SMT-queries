; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26634 () Bool)

(assert start!26634)

(declare-fun b!276488 () Bool)

(declare-fun res!140483 () Bool)

(declare-fun e!176629 () Bool)

(assert (=> b!276488 (=> (not res!140483) (not e!176629))))

(declare-datatypes ((array!13731 0))(
  ( (array!13732 (arr!6515 (Array (_ BitVec 32) (_ BitVec 64))) (size!6867 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13731)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13731 (_ BitVec 32)) Bool)

(assert (=> b!276488 (= res!140483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276489 () Bool)

(declare-fun res!140478 () Bool)

(declare-fun e!176630 () Bool)

(assert (=> b!276489 (=> (not res!140478) (not e!176630))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276489 (= res!140478 (validKeyInArray!0 k!2581))))

(declare-fun b!276490 () Bool)

(declare-fun res!140481 () Bool)

(assert (=> b!276490 (=> (not res!140481) (not e!176630))))

(declare-fun arrayContainsKey!0 (array!13731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276490 (= res!140481 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276491 () Bool)

(assert (=> b!276491 (= e!176630 e!176629)))

(declare-fun res!140482 () Bool)

(assert (=> b!276491 (=> (not res!140482) (not e!176629))))

(declare-datatypes ((SeekEntryResult!1673 0))(
  ( (MissingZero!1673 (index!8862 (_ BitVec 32))) (Found!1673 (index!8863 (_ BitVec 32))) (Intermediate!1673 (undefined!2485 Bool) (index!8864 (_ BitVec 32)) (x!27126 (_ BitVec 32))) (Undefined!1673) (MissingVacant!1673 (index!8865 (_ BitVec 32))) )
))
(declare-fun lt!137656 () SeekEntryResult!1673)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276491 (= res!140482 (or (= lt!137656 (MissingZero!1673 i!1267)) (= lt!137656 (MissingVacant!1673 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13731 (_ BitVec 32)) SeekEntryResult!1673)

(assert (=> b!276491 (= lt!137656 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276492 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276492 (= e!176629 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6867 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!276494 () Bool)

(declare-fun res!140479 () Bool)

(assert (=> b!276494 (=> (not res!140479) (not e!176630))))

(declare-datatypes ((List!4323 0))(
  ( (Nil!4320) (Cons!4319 (h!4986 (_ BitVec 64)) (t!9405 List!4323)) )
))
(declare-fun arrayNoDuplicates!0 (array!13731 (_ BitVec 32) List!4323) Bool)

(assert (=> b!276494 (= res!140479 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4320))))

(declare-fun b!276493 () Bool)

(declare-fun res!140484 () Bool)

(assert (=> b!276493 (=> (not res!140484) (not e!176630))))

(assert (=> b!276493 (= res!140484 (and (= (size!6867 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6867 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6867 a!3325))))))

(declare-fun res!140480 () Bool)

(assert (=> start!26634 (=> (not res!140480) (not e!176630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26634 (= res!140480 (validMask!0 mask!3868))))

(assert (=> start!26634 e!176630))

(declare-fun array_inv!4478 (array!13731) Bool)

(assert (=> start!26634 (array_inv!4478 a!3325)))

(assert (=> start!26634 true))

(assert (= (and start!26634 res!140480) b!276493))

(assert (= (and b!276493 res!140484) b!276489))

(assert (= (and b!276489 res!140478) b!276494))

(assert (= (and b!276494 res!140479) b!276490))

(assert (= (and b!276490 res!140481) b!276491))

(assert (= (and b!276491 res!140482) b!276488))

(assert (= (and b!276488 res!140483) b!276492))

(declare-fun m!291813 () Bool)

(assert (=> b!276489 m!291813))

(declare-fun m!291815 () Bool)

(assert (=> b!276494 m!291815))

(declare-fun m!291817 () Bool)

(assert (=> start!26634 m!291817))

(declare-fun m!291819 () Bool)

(assert (=> start!26634 m!291819))

(declare-fun m!291821 () Bool)

(assert (=> b!276491 m!291821))

(declare-fun m!291823 () Bool)

(assert (=> b!276488 m!291823))

(declare-fun m!291825 () Bool)

(assert (=> b!276490 m!291825))

(push 1)

(assert (not b!276494))

(assert (not start!26634))

(assert (not b!276491))

(assert (not b!276489))

(assert (not b!276490))

(assert (not b!276488))

(check-sat)

