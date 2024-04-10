; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26390 () Bool)

(assert start!26390)

(declare-fun b!273684 () Bool)

(declare-fun res!137677 () Bool)

(declare-fun e!175364 () Bool)

(assert (=> b!273684 (=> (not res!137677) (not e!175364))))

(declare-datatypes ((array!13487 0))(
  ( (array!13488 (arr!6393 (Array (_ BitVec 32) (_ BitVec 64))) (size!6745 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13487)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13487 (_ BitVec 32)) Bool)

(assert (=> b!273684 (= res!137677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273685 () Bool)

(declare-fun res!137678 () Bool)

(declare-fun e!175365 () Bool)

(assert (=> b!273685 (=> (not res!137678) (not e!175365))))

(declare-datatypes ((List!4201 0))(
  ( (Nil!4198) (Cons!4197 (h!4864 (_ BitVec 64)) (t!9283 List!4201)) )
))
(declare-fun arrayNoDuplicates!0 (array!13487 (_ BitVec 32) List!4201) Bool)

(assert (=> b!273685 (= res!137678 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4198))))

(declare-fun b!273686 () Bool)

(declare-fun res!137679 () Bool)

(declare-fun e!175367 () Bool)

(assert (=> b!273686 (=> (not res!137679) (not e!175367))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273686 (= res!137679 (validKeyInArray!0 (select (arr!6393 a!3325) startIndex!26)))))

(declare-fun b!273687 () Bool)

(declare-fun res!137682 () Bool)

(assert (=> b!273687 (=> (not res!137682) (not e!175365))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!273687 (= res!137682 (validKeyInArray!0 k0!2581))))

(declare-fun b!273688 () Bool)

(declare-fun res!137680 () Bool)

(assert (=> b!273688 (=> (not res!137680) (not e!175365))))

(declare-fun arrayContainsKey!0 (array!13487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273688 (= res!137680 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273689 () Bool)

(assert (=> b!273689 (= e!175367 (not true))))

(assert (=> b!273689 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8589 0))(
  ( (Unit!8590) )
))
(declare-fun lt!136520 () Unit!8589)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8589)

(assert (=> b!273689 (= lt!136520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136519 () array!13487)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1551 0))(
  ( (MissingZero!1551 (index!8374 (_ BitVec 32))) (Found!1551 (index!8375 (_ BitVec 32))) (Intermediate!1551 (undefined!2363 Bool) (index!8376 (_ BitVec 32)) (x!26676 (_ BitVec 32))) (Undefined!1551) (MissingVacant!1551 (index!8377 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13487 (_ BitVec 32)) SeekEntryResult!1551)

(assert (=> b!273689 (= (seekEntryOrOpen!0 (select (arr!6393 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6393 a!3325) i!1267 k0!2581) startIndex!26) lt!136519 mask!3868))))

(declare-fun lt!136522 () Unit!8589)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13487 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8589)

(assert (=> b!273689 (= lt!136522 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273689 (arrayNoDuplicates!0 lt!136519 #b00000000000000000000000000000000 Nil!4198)))

(declare-fun lt!136518 () Unit!8589)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4201) Unit!8589)

(assert (=> b!273689 (= lt!136518 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4198))))

(declare-fun res!137675 () Bool)

(assert (=> start!26390 (=> (not res!137675) (not e!175365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26390 (= res!137675 (validMask!0 mask!3868))))

(assert (=> start!26390 e!175365))

(declare-fun array_inv!4356 (array!13487) Bool)

(assert (=> start!26390 (array_inv!4356 a!3325)))

(assert (=> start!26390 true))

(declare-fun b!273690 () Bool)

(declare-fun res!137681 () Bool)

(assert (=> b!273690 (=> (not res!137681) (not e!175365))))

(assert (=> b!273690 (= res!137681 (and (= (size!6745 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6745 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6745 a!3325))))))

(declare-fun b!273691 () Bool)

(assert (=> b!273691 (= e!175364 e!175367)))

(declare-fun res!137674 () Bool)

(assert (=> b!273691 (=> (not res!137674) (not e!175367))))

(assert (=> b!273691 (= res!137674 (not (= startIndex!26 i!1267)))))

(assert (=> b!273691 (= lt!136519 (array!13488 (store (arr!6393 a!3325) i!1267 k0!2581) (size!6745 a!3325)))))

(declare-fun b!273692 () Bool)

(assert (=> b!273692 (= e!175365 e!175364)))

(declare-fun res!137676 () Bool)

(assert (=> b!273692 (=> (not res!137676) (not e!175364))))

(declare-fun lt!136521 () SeekEntryResult!1551)

(assert (=> b!273692 (= res!137676 (or (= lt!136521 (MissingZero!1551 i!1267)) (= lt!136521 (MissingVacant!1551 i!1267))))))

(assert (=> b!273692 (= lt!136521 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26390 res!137675) b!273690))

(assert (= (and b!273690 res!137681) b!273687))

(assert (= (and b!273687 res!137682) b!273685))

(assert (= (and b!273685 res!137678) b!273688))

(assert (= (and b!273688 res!137680) b!273692))

(assert (= (and b!273692 res!137676) b!273684))

(assert (= (and b!273684 res!137677) b!273691))

(assert (= (and b!273691 res!137674) b!273686))

(assert (= (and b!273686 res!137679) b!273689))

(declare-fun m!288957 () Bool)

(assert (=> start!26390 m!288957))

(declare-fun m!288959 () Bool)

(assert (=> start!26390 m!288959))

(declare-fun m!288961 () Bool)

(assert (=> b!273687 m!288961))

(declare-fun m!288963 () Bool)

(assert (=> b!273684 m!288963))

(declare-fun m!288965 () Bool)

(assert (=> b!273692 m!288965))

(declare-fun m!288967 () Bool)

(assert (=> b!273685 m!288967))

(declare-fun m!288969 () Bool)

(assert (=> b!273686 m!288969))

(assert (=> b!273686 m!288969))

(declare-fun m!288971 () Bool)

(assert (=> b!273686 m!288971))

(declare-fun m!288973 () Bool)

(assert (=> b!273688 m!288973))

(declare-fun m!288975 () Bool)

(assert (=> b!273689 m!288975))

(declare-fun m!288977 () Bool)

(assert (=> b!273689 m!288977))

(assert (=> b!273689 m!288977))

(declare-fun m!288979 () Bool)

(assert (=> b!273689 m!288979))

(declare-fun m!288981 () Bool)

(assert (=> b!273689 m!288981))

(declare-fun m!288983 () Bool)

(assert (=> b!273689 m!288983))

(assert (=> b!273689 m!288969))

(declare-fun m!288985 () Bool)

(assert (=> b!273689 m!288985))

(declare-fun m!288987 () Bool)

(assert (=> b!273689 m!288987))

(declare-fun m!288989 () Bool)

(assert (=> b!273689 m!288989))

(assert (=> b!273689 m!288969))

(declare-fun m!288991 () Bool)

(assert (=> b!273689 m!288991))

(assert (=> b!273691 m!288981))

(check-sat (not b!273687) (not b!273684) (not b!273692) (not b!273689) (not b!273686) (not start!26390) (not b!273688) (not b!273685))
(check-sat)
