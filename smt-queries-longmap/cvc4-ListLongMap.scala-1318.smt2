; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26470 () Bool)

(assert start!26470)

(declare-fun b!274800 () Bool)

(declare-fun res!138792 () Bool)

(declare-fun e!175883 () Bool)

(assert (=> b!274800 (=> (not res!138792) (not e!175883))))

(declare-datatypes ((array!13567 0))(
  ( (array!13568 (arr!6433 (Array (_ BitVec 32) (_ BitVec 64))) (size!6785 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13567)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13567 (_ BitVec 32)) Bool)

(assert (=> b!274800 (= res!138792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274801 () Bool)

(declare-fun res!138795 () Bool)

(declare-fun e!175882 () Bool)

(assert (=> b!274801 (=> (not res!138795) (not e!175882))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274801 (= res!138795 (and (= (size!6785 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6785 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6785 a!3325))))))

(declare-fun b!274802 () Bool)

(declare-fun res!138794 () Bool)

(assert (=> b!274802 (=> (not res!138794) (not e!175882))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274802 (= res!138794 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274803 () Bool)

(declare-fun e!175880 () Bool)

(assert (=> b!274803 (= e!175880 (not true))))

(assert (=> b!274803 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8669 0))(
  ( (Unit!8670) )
))
(declare-fun lt!137158 () Unit!8669)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8669)

(assert (=> b!274803 (= lt!137158 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137155 () array!13567)

(declare-datatypes ((SeekEntryResult!1591 0))(
  ( (MissingZero!1591 (index!8534 (_ BitVec 32))) (Found!1591 (index!8535 (_ BitVec 32))) (Intermediate!1591 (undefined!2403 Bool) (index!8536 (_ BitVec 32)) (x!26820 (_ BitVec 32))) (Undefined!1591) (MissingVacant!1591 (index!8537 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13567 (_ BitVec 32)) SeekEntryResult!1591)

(assert (=> b!274803 (= (seekEntryOrOpen!0 (select (arr!6433 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6433 a!3325) i!1267 k!2581) startIndex!26) lt!137155 mask!3868))))

(declare-fun lt!137156 () Unit!8669)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13567 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8669)

(assert (=> b!274803 (= lt!137156 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4241 0))(
  ( (Nil!4238) (Cons!4237 (h!4904 (_ BitVec 64)) (t!9323 List!4241)) )
))
(declare-fun arrayNoDuplicates!0 (array!13567 (_ BitVec 32) List!4241) Bool)

(assert (=> b!274803 (arrayNoDuplicates!0 lt!137155 #b00000000000000000000000000000000 Nil!4238)))

(declare-fun lt!137154 () Unit!8669)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4241) Unit!8669)

(assert (=> b!274803 (= lt!137154 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4238))))

(declare-fun b!274804 () Bool)

(declare-fun res!138796 () Bool)

(assert (=> b!274804 (=> (not res!138796) (not e!175880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274804 (= res!138796 (validKeyInArray!0 (select (arr!6433 a!3325) startIndex!26)))))

(declare-fun b!274805 () Bool)

(declare-fun res!138790 () Bool)

(assert (=> b!274805 (=> (not res!138790) (not e!175882))))

(assert (=> b!274805 (= res!138790 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4238))))

(declare-fun res!138798 () Bool)

(assert (=> start!26470 (=> (not res!138798) (not e!175882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26470 (= res!138798 (validMask!0 mask!3868))))

(assert (=> start!26470 e!175882))

(declare-fun array_inv!4396 (array!13567) Bool)

(assert (=> start!26470 (array_inv!4396 a!3325)))

(assert (=> start!26470 true))

(declare-fun b!274806 () Bool)

(declare-fun res!138797 () Bool)

(assert (=> b!274806 (=> (not res!138797) (not e!175882))))

(assert (=> b!274806 (= res!138797 (validKeyInArray!0 k!2581))))

(declare-fun b!274807 () Bool)

(assert (=> b!274807 (= e!175883 e!175880)))

(declare-fun res!138793 () Bool)

(assert (=> b!274807 (=> (not res!138793) (not e!175880))))

(assert (=> b!274807 (= res!138793 (not (= startIndex!26 i!1267)))))

(assert (=> b!274807 (= lt!137155 (array!13568 (store (arr!6433 a!3325) i!1267 k!2581) (size!6785 a!3325)))))

(declare-fun b!274808 () Bool)

(assert (=> b!274808 (= e!175882 e!175883)))

(declare-fun res!138791 () Bool)

(assert (=> b!274808 (=> (not res!138791) (not e!175883))))

(declare-fun lt!137157 () SeekEntryResult!1591)

(assert (=> b!274808 (= res!138791 (or (= lt!137157 (MissingZero!1591 i!1267)) (= lt!137157 (MissingVacant!1591 i!1267))))))

(assert (=> b!274808 (= lt!137157 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26470 res!138798) b!274801))

(assert (= (and b!274801 res!138795) b!274806))

(assert (= (and b!274806 res!138797) b!274805))

(assert (= (and b!274805 res!138790) b!274802))

(assert (= (and b!274802 res!138794) b!274808))

(assert (= (and b!274808 res!138791) b!274800))

(assert (= (and b!274800 res!138792) b!274807))

(assert (= (and b!274807 res!138793) b!274804))

(assert (= (and b!274804 res!138796) b!274803))

(declare-fun m!290445 () Bool)

(assert (=> b!274802 m!290445))

(declare-fun m!290447 () Bool)

(assert (=> b!274806 m!290447))

(declare-fun m!290449 () Bool)

(assert (=> b!274808 m!290449))

(declare-fun m!290451 () Bool)

(assert (=> b!274805 m!290451))

(declare-fun m!290453 () Bool)

(assert (=> start!26470 m!290453))

(declare-fun m!290455 () Bool)

(assert (=> start!26470 m!290455))

(declare-fun m!290457 () Bool)

(assert (=> b!274803 m!290457))

(declare-fun m!290459 () Bool)

(assert (=> b!274803 m!290459))

(declare-fun m!290461 () Bool)

(assert (=> b!274803 m!290461))

(declare-fun m!290463 () Bool)

(assert (=> b!274803 m!290463))

(declare-fun m!290465 () Bool)

(assert (=> b!274803 m!290465))

(declare-fun m!290467 () Bool)

(assert (=> b!274803 m!290467))

(declare-fun m!290469 () Bool)

(assert (=> b!274803 m!290469))

(declare-fun m!290471 () Bool)

(assert (=> b!274803 m!290471))

(declare-fun m!290473 () Bool)

(assert (=> b!274803 m!290473))

(assert (=> b!274803 m!290459))

(declare-fun m!290475 () Bool)

(assert (=> b!274803 m!290475))

(assert (=> b!274803 m!290471))

(declare-fun m!290477 () Bool)

(assert (=> b!274800 m!290477))

(assert (=> b!274807 m!290463))

(assert (=> b!274804 m!290471))

(assert (=> b!274804 m!290471))

(declare-fun m!290479 () Bool)

(assert (=> b!274804 m!290479))

(push 1)

