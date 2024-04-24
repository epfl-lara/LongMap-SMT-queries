; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26400 () Bool)

(assert start!26400)

(declare-fun b!273866 () Bool)

(declare-fun res!137838 () Bool)

(declare-fun e!175450 () Bool)

(assert (=> b!273866 (=> (not res!137838) (not e!175450))))

(declare-datatypes ((array!13496 0))(
  ( (array!13497 (arr!6397 (Array (_ BitVec 32) (_ BitVec 64))) (size!6749 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13496)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273866 (= res!137838 (validKeyInArray!0 (select (arr!6397 a!3325) startIndex!26)))))

(declare-fun b!273867 () Bool)

(declare-fun res!137830 () Bool)

(declare-fun e!175449 () Bool)

(assert (=> b!273867 (=> (not res!137830) (not e!175449))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!273867 (= res!137830 (validKeyInArray!0 k0!2581))))

(declare-fun b!273868 () Bool)

(assert (=> b!273868 (= e!175450 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13496 (_ BitVec 32)) Bool)

(assert (=> b!273868 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8579 0))(
  ( (Unit!8580) )
))
(declare-fun lt!136652 () Unit!8579)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8579)

(assert (=> b!273868 (= lt!136652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136653 () array!13496)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1520 0))(
  ( (MissingZero!1520 (index!8250 (_ BitVec 32))) (Found!1520 (index!8251 (_ BitVec 32))) (Intermediate!1520 (undefined!2332 Bool) (index!8252 (_ BitVec 32)) (x!26661 (_ BitVec 32))) (Undefined!1520) (MissingVacant!1520 (index!8253 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13496 (_ BitVec 32)) SeekEntryResult!1520)

(assert (=> b!273868 (= (seekEntryOrOpen!0 (select (arr!6397 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6397 a!3325) i!1267 k0!2581) startIndex!26) lt!136653 mask!3868))))

(declare-fun lt!136656 () Unit!8579)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8579)

(assert (=> b!273868 (= lt!136656 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4118 0))(
  ( (Nil!4115) (Cons!4114 (h!4781 (_ BitVec 64)) (t!9192 List!4118)) )
))
(declare-fun arrayNoDuplicates!0 (array!13496 (_ BitVec 32) List!4118) Bool)

(assert (=> b!273868 (arrayNoDuplicates!0 lt!136653 #b00000000000000000000000000000000 Nil!4115)))

(declare-fun lt!136654 () Unit!8579)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4118) Unit!8579)

(assert (=> b!273868 (= lt!136654 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4115))))

(declare-fun b!273869 () Bool)

(declare-fun res!137831 () Bool)

(assert (=> b!273869 (=> (not res!137831) (not e!175449))))

(assert (=> b!273869 (= res!137831 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4115))))

(declare-fun res!137835 () Bool)

(assert (=> start!26400 (=> (not res!137835) (not e!175449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26400 (= res!137835 (validMask!0 mask!3868))))

(assert (=> start!26400 e!175449))

(declare-fun array_inv!4347 (array!13496) Bool)

(assert (=> start!26400 (array_inv!4347 a!3325)))

(assert (=> start!26400 true))

(declare-fun b!273870 () Bool)

(declare-fun e!175451 () Bool)

(assert (=> b!273870 (= e!175451 e!175450)))

(declare-fun res!137833 () Bool)

(assert (=> b!273870 (=> (not res!137833) (not e!175450))))

(assert (=> b!273870 (= res!137833 (not (= startIndex!26 i!1267)))))

(assert (=> b!273870 (= lt!136653 (array!13497 (store (arr!6397 a!3325) i!1267 k0!2581) (size!6749 a!3325)))))

(declare-fun b!273871 () Bool)

(declare-fun res!137832 () Bool)

(assert (=> b!273871 (=> (not res!137832) (not e!175449))))

(assert (=> b!273871 (= res!137832 (and (= (size!6749 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6749 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6749 a!3325))))))

(declare-fun b!273872 () Bool)

(assert (=> b!273872 (= e!175449 e!175451)))

(declare-fun res!137834 () Bool)

(assert (=> b!273872 (=> (not res!137834) (not e!175451))))

(declare-fun lt!136655 () SeekEntryResult!1520)

(assert (=> b!273872 (= res!137834 (or (= lt!136655 (MissingZero!1520 i!1267)) (= lt!136655 (MissingVacant!1520 i!1267))))))

(assert (=> b!273872 (= lt!136655 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273873 () Bool)

(declare-fun res!137836 () Bool)

(assert (=> b!273873 (=> (not res!137836) (not e!175451))))

(assert (=> b!273873 (= res!137836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273874 () Bool)

(declare-fun res!137837 () Bool)

(assert (=> b!273874 (=> (not res!137837) (not e!175449))))

(declare-fun arrayContainsKey!0 (array!13496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273874 (= res!137837 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26400 res!137835) b!273871))

(assert (= (and b!273871 res!137832) b!273867))

(assert (= (and b!273867 res!137830) b!273869))

(assert (= (and b!273869 res!137831) b!273874))

(assert (= (and b!273874 res!137837) b!273872))

(assert (= (and b!273872 res!137834) b!273873))

(assert (= (and b!273873 res!137836) b!273870))

(assert (= (and b!273870 res!137833) b!273866))

(assert (= (and b!273866 res!137838) b!273868))

(declare-fun m!289343 () Bool)

(assert (=> b!273874 m!289343))

(declare-fun m!289345 () Bool)

(assert (=> b!273868 m!289345))

(declare-fun m!289347 () Bool)

(assert (=> b!273868 m!289347))

(declare-fun m!289349 () Bool)

(assert (=> b!273868 m!289349))

(declare-fun m!289351 () Bool)

(assert (=> b!273868 m!289351))

(assert (=> b!273868 m!289349))

(declare-fun m!289353 () Bool)

(assert (=> b!273868 m!289353))

(declare-fun m!289355 () Bool)

(assert (=> b!273868 m!289355))

(declare-fun m!289357 () Bool)

(assert (=> b!273868 m!289357))

(declare-fun m!289359 () Bool)

(assert (=> b!273868 m!289359))

(declare-fun m!289361 () Bool)

(assert (=> b!273868 m!289361))

(assert (=> b!273868 m!289357))

(declare-fun m!289363 () Bool)

(assert (=> b!273868 m!289363))

(declare-fun m!289365 () Bool)

(assert (=> start!26400 m!289365))

(declare-fun m!289367 () Bool)

(assert (=> start!26400 m!289367))

(declare-fun m!289369 () Bool)

(assert (=> b!273873 m!289369))

(declare-fun m!289371 () Bool)

(assert (=> b!273872 m!289371))

(declare-fun m!289373 () Bool)

(assert (=> b!273869 m!289373))

(assert (=> b!273870 m!289353))

(assert (=> b!273866 m!289357))

(assert (=> b!273866 m!289357))

(declare-fun m!289375 () Bool)

(assert (=> b!273866 m!289375))

(declare-fun m!289377 () Bool)

(assert (=> b!273867 m!289377))

(check-sat (not b!273872) (not b!273873) (not b!273874) (not b!273869) (not b!273867) (not b!273866) (not b!273868) (not start!26400))
(check-sat)
