; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26728 () Bool)

(assert start!26728)

(declare-fun b!277598 () Bool)

(declare-fun res!141471 () Bool)

(declare-fun e!177113 () Bool)

(assert (=> b!277598 (=> (not res!141471) (not e!177113))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277598 (= res!141471 (validKeyInArray!0 k!2581))))

(declare-fun b!277599 () Bool)

(declare-fun res!141465 () Bool)

(assert (=> b!277599 (=> (not res!141465) (not e!177113))))

(declare-datatypes ((array!13825 0))(
  ( (array!13826 (arr!6562 (Array (_ BitVec 32) (_ BitVec 64))) (size!6914 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13825)

(declare-datatypes ((List!4370 0))(
  ( (Nil!4367) (Cons!4366 (h!5033 (_ BitVec 64)) (t!9452 List!4370)) )
))
(declare-fun arrayNoDuplicates!0 (array!13825 (_ BitVec 32) List!4370) Bool)

(assert (=> b!277599 (= res!141465 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4367))))

(declare-fun b!277600 () Bool)

(declare-datatypes ((Unit!8761 0))(
  ( (Unit!8762) )
))
(declare-fun e!177115 () Unit!8761)

(declare-fun lt!137986 () Unit!8761)

(assert (=> b!277600 (= e!177115 lt!137986)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8761)

(assert (=> b!277600 (= lt!137986 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13825 (_ BitVec 32)) Bool)

(assert (=> b!277600 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13826 (store (arr!6562 a!3325) i!1267 k!2581) (size!6914 a!3325)) mask!3868)))

(declare-fun b!277601 () Bool)

(declare-fun res!141467 () Bool)

(declare-fun e!177114 () Bool)

(assert (=> b!277601 (=> (not res!141467) (not e!177114))))

(assert (=> b!277601 (= res!141467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!141466 () Bool)

(assert (=> start!26728 (=> (not res!141466) (not e!177113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26728 (= res!141466 (validMask!0 mask!3868))))

(assert (=> start!26728 e!177113))

(declare-fun array_inv!4525 (array!13825) Bool)

(assert (=> start!26728 (array_inv!4525 a!3325)))

(assert (=> start!26728 true))

(declare-fun b!277602 () Bool)

(declare-fun res!141464 () Bool)

(assert (=> b!277602 (=> (not res!141464) (not e!177114))))

(assert (=> b!277602 (= res!141464 (= startIndex!26 i!1267))))

(declare-fun b!277603 () Bool)

(assert (=> b!277603 (= e!177113 e!177114)))

(declare-fun res!141468 () Bool)

(assert (=> b!277603 (=> (not res!141468) (not e!177114))))

(declare-datatypes ((SeekEntryResult!1720 0))(
  ( (MissingZero!1720 (index!9050 (_ BitVec 32))) (Found!1720 (index!9051 (_ BitVec 32))) (Intermediate!1720 (undefined!2532 Bool) (index!9052 (_ BitVec 32)) (x!27293 (_ BitVec 32))) (Undefined!1720) (MissingVacant!1720 (index!9053 (_ BitVec 32))) )
))
(declare-fun lt!137985 () SeekEntryResult!1720)

(assert (=> b!277603 (= res!141468 (or (= lt!137985 (MissingZero!1720 i!1267)) (= lt!137985 (MissingVacant!1720 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13825 (_ BitVec 32)) SeekEntryResult!1720)

(assert (=> b!277603 (= lt!137985 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277604 () Bool)

(declare-fun Unit!8763 () Unit!8761)

(assert (=> b!277604 (= e!177115 Unit!8763)))

(declare-fun b!277605 () Bool)

(declare-fun res!141470 () Bool)

(assert (=> b!277605 (=> (not res!141470) (not e!177113))))

(declare-fun arrayContainsKey!0 (array!13825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277605 (= res!141470 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277606 () Bool)

(assert (=> b!277606 (= e!177114 false)))

(declare-fun lt!137984 () Unit!8761)

(assert (=> b!277606 (= lt!137984 e!177115)))

(declare-fun c!45618 () Bool)

(assert (=> b!277606 (= c!45618 (bvslt startIndex!26 (bvsub (size!6914 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277607 () Bool)

(declare-fun res!141469 () Bool)

(assert (=> b!277607 (=> (not res!141469) (not e!177113))))

(assert (=> b!277607 (= res!141469 (and (= (size!6914 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6914 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6914 a!3325))))))

(assert (= (and start!26728 res!141466) b!277607))

(assert (= (and b!277607 res!141469) b!277598))

(assert (= (and b!277598 res!141471) b!277599))

(assert (= (and b!277599 res!141465) b!277605))

(assert (= (and b!277605 res!141470) b!277603))

(assert (= (and b!277603 res!141468) b!277601))

(assert (= (and b!277601 res!141467) b!277602))

(assert (= (and b!277602 res!141464) b!277606))

(assert (= (and b!277606 c!45618) b!277600))

(assert (= (and b!277606 (not c!45618)) b!277604))

(declare-fun m!292591 () Bool)

(assert (=> start!26728 m!292591))

(declare-fun m!292593 () Bool)

(assert (=> start!26728 m!292593))

(declare-fun m!292595 () Bool)

(assert (=> b!277599 m!292595))

(declare-fun m!292597 () Bool)

(assert (=> b!277601 m!292597))

(declare-fun m!292599 () Bool)

(assert (=> b!277600 m!292599))

(declare-fun m!292601 () Bool)

(assert (=> b!277600 m!292601))

(declare-fun m!292603 () Bool)

(assert (=> b!277600 m!292603))

(declare-fun m!292605 () Bool)

(assert (=> b!277605 m!292605))

(declare-fun m!292607 () Bool)

(assert (=> b!277603 m!292607))

(declare-fun m!292609 () Bool)

(assert (=> b!277598 m!292609))

(push 1)

(assert (not start!26728))

(assert (not b!277605))

(assert (not b!277598))

(assert (not b!277603))

(assert (not b!277600))

(assert (not b!277599))

(assert (not b!277601))

(check-sat)

