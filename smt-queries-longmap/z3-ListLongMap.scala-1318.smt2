; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26468 () Bool)

(assert start!26468)

(declare-fun b!274599 () Bool)

(declare-fun res!138648 () Bool)

(declare-fun e!175758 () Bool)

(assert (=> b!274599 (=> (not res!138648) (not e!175758))))

(declare-datatypes ((array!13554 0))(
  ( (array!13555 (arr!6426 (Array (_ BitVec 32) (_ BitVec 64))) (size!6779 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13554)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274599 (= res!138648 (validKeyInArray!0 (select (arr!6426 a!3325) startIndex!26)))))

(declare-fun b!274600 () Bool)

(declare-fun res!138643 () Bool)

(declare-fun e!175756 () Bool)

(assert (=> b!274600 (=> (not res!138643) (not e!175756))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!274600 (= res!138643 (validKeyInArray!0 k0!2581))))

(declare-fun res!138647 () Bool)

(assert (=> start!26468 (=> (not res!138647) (not e!175756))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26468 (= res!138647 (validMask!0 mask!3868))))

(assert (=> start!26468 e!175756))

(declare-fun array_inv!4398 (array!13554) Bool)

(assert (=> start!26468 (array_inv!4398 a!3325)))

(assert (=> start!26468 true))

(declare-fun b!274601 () Bool)

(declare-fun res!138641 () Bool)

(declare-fun e!175757 () Bool)

(assert (=> b!274601 (=> (not res!138641) (not e!175757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13554 (_ BitVec 32)) Bool)

(assert (=> b!274601 (= res!138641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274602 () Bool)

(declare-fun res!138642 () Bool)

(assert (=> b!274602 (=> (not res!138642) (not e!175756))))

(declare-datatypes ((List!4207 0))(
  ( (Nil!4204) (Cons!4203 (h!4870 (_ BitVec 64)) (t!9280 List!4207)) )
))
(declare-fun arrayNoDuplicates!0 (array!13554 (_ BitVec 32) List!4207) Bool)

(assert (=> b!274602 (= res!138642 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4204))))

(declare-fun b!274603 () Bool)

(declare-fun res!138645 () Bool)

(assert (=> b!274603 (=> (not res!138645) (not e!175756))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274603 (= res!138645 (and (= (size!6779 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6779 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6779 a!3325))))))

(declare-fun b!274604 () Bool)

(assert (=> b!274604 (= e!175756 e!175757)))

(declare-fun res!138644 () Bool)

(assert (=> b!274604 (=> (not res!138644) (not e!175757))))

(declare-datatypes ((SeekEntryResult!1583 0))(
  ( (MissingZero!1583 (index!8502 (_ BitVec 32))) (Found!1583 (index!8503 (_ BitVec 32))) (Intermediate!1583 (undefined!2395 Bool) (index!8504 (_ BitVec 32)) (x!26811 (_ BitVec 32))) (Undefined!1583) (MissingVacant!1583 (index!8505 (_ BitVec 32))) )
))
(declare-fun lt!136947 () SeekEntryResult!1583)

(assert (=> b!274604 (= res!138644 (or (= lt!136947 (MissingZero!1583 i!1267)) (= lt!136947 (MissingVacant!1583 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13554 (_ BitVec 32)) SeekEntryResult!1583)

(assert (=> b!274604 (= lt!136947 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274605 () Bool)

(declare-fun res!138649 () Bool)

(assert (=> b!274605 (=> (not res!138649) (not e!175756))))

(declare-fun arrayContainsKey!0 (array!13554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274605 (= res!138649 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274606 () Bool)

(assert (=> b!274606 (= e!175757 e!175758)))

(declare-fun res!138646 () Bool)

(assert (=> b!274606 (=> (not res!138646) (not e!175758))))

(assert (=> b!274606 (= res!138646 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136945 () array!13554)

(assert (=> b!274606 (= lt!136945 (array!13555 (store (arr!6426 a!3325) i!1267 k0!2581) (size!6779 a!3325)))))

(declare-fun b!274607 () Bool)

(assert (=> b!274607 (= e!175758 (not true))))

(assert (=> b!274607 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8619 0))(
  ( (Unit!8620) )
))
(declare-fun lt!136944 () Unit!8619)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8619)

(assert (=> b!274607 (= lt!136944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274607 (= (seekEntryOrOpen!0 (select (arr!6426 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6426 a!3325) i!1267 k0!2581) startIndex!26) lt!136945 mask!3868))))

(declare-fun lt!136943 () Unit!8619)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13554 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8619)

(assert (=> b!274607 (= lt!136943 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274607 (arrayNoDuplicates!0 lt!136945 #b00000000000000000000000000000000 Nil!4204)))

(declare-fun lt!136946 () Unit!8619)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13554 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4207) Unit!8619)

(assert (=> b!274607 (= lt!136946 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4204))))

(assert (= (and start!26468 res!138647) b!274603))

(assert (= (and b!274603 res!138645) b!274600))

(assert (= (and b!274600 res!138643) b!274602))

(assert (= (and b!274602 res!138642) b!274605))

(assert (= (and b!274605 res!138649) b!274604))

(assert (= (and b!274604 res!138644) b!274601))

(assert (= (and b!274601 res!138641) b!274606))

(assert (= (and b!274606 res!138646) b!274599))

(assert (= (and b!274599 res!138648) b!274607))

(declare-fun m!289781 () Bool)

(assert (=> b!274607 m!289781))

(declare-fun m!289783 () Bool)

(assert (=> b!274607 m!289783))

(declare-fun m!289785 () Bool)

(assert (=> b!274607 m!289785))

(declare-fun m!289787 () Bool)

(assert (=> b!274607 m!289787))

(declare-fun m!289789 () Bool)

(assert (=> b!274607 m!289789))

(declare-fun m!289791 () Bool)

(assert (=> b!274607 m!289791))

(declare-fun m!289793 () Bool)

(assert (=> b!274607 m!289793))

(declare-fun m!289795 () Bool)

(assert (=> b!274607 m!289795))

(assert (=> b!274607 m!289783))

(declare-fun m!289797 () Bool)

(assert (=> b!274607 m!289797))

(assert (=> b!274607 m!289789))

(declare-fun m!289799 () Bool)

(assert (=> b!274607 m!289799))

(declare-fun m!289801 () Bool)

(assert (=> b!274605 m!289801))

(declare-fun m!289803 () Bool)

(assert (=> b!274602 m!289803))

(declare-fun m!289805 () Bool)

(assert (=> start!26468 m!289805))

(declare-fun m!289807 () Bool)

(assert (=> start!26468 m!289807))

(assert (=> b!274599 m!289789))

(assert (=> b!274599 m!289789))

(declare-fun m!289809 () Bool)

(assert (=> b!274599 m!289809))

(declare-fun m!289811 () Bool)

(assert (=> b!274601 m!289811))

(declare-fun m!289813 () Bool)

(assert (=> b!274604 m!289813))

(declare-fun m!289815 () Bool)

(assert (=> b!274600 m!289815))

(assert (=> b!274606 m!289785))

(check-sat (not b!274605) (not b!274600) (not b!274599) (not b!274601) (not b!274602) (not b!274604) (not b!274607) (not start!26468))
(check-sat)
