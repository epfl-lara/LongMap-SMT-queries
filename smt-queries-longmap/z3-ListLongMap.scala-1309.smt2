; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26414 () Bool)

(assert start!26414)

(declare-fun b!273834 () Bool)

(declare-fun e!175396 () Bool)

(declare-fun e!175397 () Bool)

(assert (=> b!273834 (= e!175396 e!175397)))

(declare-fun res!137881 () Bool)

(assert (=> b!273834 (=> (not res!137881) (not e!175397))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273834 (= res!137881 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13500 0))(
  ( (array!13501 (arr!6399 (Array (_ BitVec 32) (_ BitVec 64))) (size!6752 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13500)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136506 () array!13500)

(assert (=> b!273834 (= lt!136506 (array!13501 (store (arr!6399 a!3325) i!1267 k0!2581) (size!6752 a!3325)))))

(declare-fun res!137884 () Bool)

(declare-fun e!175395 () Bool)

(assert (=> start!26414 (=> (not res!137884) (not e!175395))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26414 (= res!137884 (validMask!0 mask!3868))))

(assert (=> start!26414 e!175395))

(declare-fun array_inv!4371 (array!13500) Bool)

(assert (=> start!26414 (array_inv!4371 a!3325)))

(assert (=> start!26414 true))

(declare-fun b!273835 () Bool)

(assert (=> b!273835 (= e!175397 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13500 (_ BitVec 32)) Bool)

(assert (=> b!273835 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8565 0))(
  ( (Unit!8566) )
))
(declare-fun lt!136505 () Unit!8565)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8565)

(assert (=> b!273835 (= lt!136505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1556 0))(
  ( (MissingZero!1556 (index!8394 (_ BitVec 32))) (Found!1556 (index!8395 (_ BitVec 32))) (Intermediate!1556 (undefined!2368 Bool) (index!8396 (_ BitVec 32)) (x!26712 (_ BitVec 32))) (Undefined!1556) (MissingVacant!1556 (index!8397 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13500 (_ BitVec 32)) SeekEntryResult!1556)

(assert (=> b!273835 (= (seekEntryOrOpen!0 (select (arr!6399 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6399 a!3325) i!1267 k0!2581) startIndex!26) lt!136506 mask!3868))))

(declare-fun lt!136504 () Unit!8565)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8565)

(assert (=> b!273835 (= lt!136504 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4180 0))(
  ( (Nil!4177) (Cons!4176 (h!4843 (_ BitVec 64)) (t!9253 List!4180)) )
))
(declare-fun arrayNoDuplicates!0 (array!13500 (_ BitVec 32) List!4180) Bool)

(assert (=> b!273835 (arrayNoDuplicates!0 lt!136506 #b00000000000000000000000000000000 Nil!4177)))

(declare-fun lt!136502 () Unit!8565)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13500 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4180) Unit!8565)

(assert (=> b!273835 (= lt!136502 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4177))))

(declare-fun b!273836 () Bool)

(declare-fun res!137882 () Bool)

(assert (=> b!273836 (=> (not res!137882) (not e!175395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273836 (= res!137882 (validKeyInArray!0 k0!2581))))

(declare-fun b!273837 () Bool)

(declare-fun res!137876 () Bool)

(assert (=> b!273837 (=> (not res!137876) (not e!175396))))

(assert (=> b!273837 (= res!137876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273838 () Bool)

(declare-fun res!137883 () Bool)

(assert (=> b!273838 (=> (not res!137883) (not e!175395))))

(assert (=> b!273838 (= res!137883 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4177))))

(declare-fun b!273839 () Bool)

(declare-fun res!137878 () Bool)

(assert (=> b!273839 (=> (not res!137878) (not e!175395))))

(declare-fun arrayContainsKey!0 (array!13500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273839 (= res!137878 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273840 () Bool)

(assert (=> b!273840 (= e!175395 e!175396)))

(declare-fun res!137879 () Bool)

(assert (=> b!273840 (=> (not res!137879) (not e!175396))))

(declare-fun lt!136503 () SeekEntryResult!1556)

(assert (=> b!273840 (= res!137879 (or (= lt!136503 (MissingZero!1556 i!1267)) (= lt!136503 (MissingVacant!1556 i!1267))))))

(assert (=> b!273840 (= lt!136503 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273841 () Bool)

(declare-fun res!137877 () Bool)

(assert (=> b!273841 (=> (not res!137877) (not e!175395))))

(assert (=> b!273841 (= res!137877 (and (= (size!6752 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6752 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6752 a!3325))))))

(declare-fun b!273842 () Bool)

(declare-fun res!137880 () Bool)

(assert (=> b!273842 (=> (not res!137880) (not e!175397))))

(assert (=> b!273842 (= res!137880 (validKeyInArray!0 (select (arr!6399 a!3325) startIndex!26)))))

(assert (= (and start!26414 res!137884) b!273841))

(assert (= (and b!273841 res!137877) b!273836))

(assert (= (and b!273836 res!137882) b!273838))

(assert (= (and b!273838 res!137883) b!273839))

(assert (= (and b!273839 res!137878) b!273840))

(assert (= (and b!273840 res!137879) b!273837))

(assert (= (and b!273837 res!137876) b!273834))

(assert (= (and b!273834 res!137881) b!273842))

(assert (= (and b!273842 res!137880) b!273835))

(declare-fun m!288761 () Bool)

(assert (=> b!273839 m!288761))

(declare-fun m!288763 () Bool)

(assert (=> b!273834 m!288763))

(declare-fun m!288765 () Bool)

(assert (=> b!273840 m!288765))

(declare-fun m!288767 () Bool)

(assert (=> b!273837 m!288767))

(declare-fun m!288769 () Bool)

(assert (=> start!26414 m!288769))

(declare-fun m!288771 () Bool)

(assert (=> start!26414 m!288771))

(declare-fun m!288773 () Bool)

(assert (=> b!273836 m!288773))

(declare-fun m!288775 () Bool)

(assert (=> b!273835 m!288775))

(declare-fun m!288777 () Bool)

(assert (=> b!273835 m!288777))

(declare-fun m!288779 () Bool)

(assert (=> b!273835 m!288779))

(assert (=> b!273835 m!288763))

(declare-fun m!288781 () Bool)

(assert (=> b!273835 m!288781))

(declare-fun m!288783 () Bool)

(assert (=> b!273835 m!288783))

(declare-fun m!288785 () Bool)

(assert (=> b!273835 m!288785))

(declare-fun m!288787 () Bool)

(assert (=> b!273835 m!288787))

(assert (=> b!273835 m!288783))

(declare-fun m!288789 () Bool)

(assert (=> b!273835 m!288789))

(assert (=> b!273835 m!288779))

(declare-fun m!288791 () Bool)

(assert (=> b!273835 m!288791))

(assert (=> b!273842 m!288783))

(assert (=> b!273842 m!288783))

(declare-fun m!288793 () Bool)

(assert (=> b!273842 m!288793))

(declare-fun m!288795 () Bool)

(assert (=> b!273838 m!288795))

(check-sat (not b!273839) (not b!273836) (not b!273840) (not start!26414) (not b!273835) (not b!273837) (not b!273838) (not b!273842))
(check-sat)
