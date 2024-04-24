; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26412 () Bool)

(assert start!26412)

(declare-fun b!274028 () Bool)

(declare-fun e!175522 () Bool)

(assert (=> b!274028 (= e!175522 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13508 0))(
  ( (array!13509 (arr!6403 (Array (_ BitVec 32) (_ BitVec 64))) (size!6755 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13508)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13508 (_ BitVec 32)) Bool)

(assert (=> b!274028 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8591 0))(
  ( (Unit!8592) )
))
(declare-fun lt!136746 () Unit!8591)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8591)

(assert (=> b!274028 (= lt!136746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136743 () array!13508)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1526 0))(
  ( (MissingZero!1526 (index!8274 (_ BitVec 32))) (Found!1526 (index!8275 (_ BitVec 32))) (Intermediate!1526 (undefined!2338 Bool) (index!8276 (_ BitVec 32)) (x!26683 (_ BitVec 32))) (Undefined!1526) (MissingVacant!1526 (index!8277 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13508 (_ BitVec 32)) SeekEntryResult!1526)

(assert (=> b!274028 (= (seekEntryOrOpen!0 (select (arr!6403 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6403 a!3325) i!1267 k0!2581) startIndex!26) lt!136743 mask!3868))))

(declare-fun lt!136745 () Unit!8591)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8591)

(assert (=> b!274028 (= lt!136745 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4124 0))(
  ( (Nil!4121) (Cons!4120 (h!4787 (_ BitVec 64)) (t!9198 List!4124)) )
))
(declare-fun arrayNoDuplicates!0 (array!13508 (_ BitVec 32) List!4124) Bool)

(assert (=> b!274028 (arrayNoDuplicates!0 lt!136743 #b00000000000000000000000000000000 Nil!4121)))

(declare-fun lt!136742 () Unit!8591)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13508 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4124) Unit!8591)

(assert (=> b!274028 (= lt!136742 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4121))))

(declare-fun b!274029 () Bool)

(declare-fun res!137997 () Bool)

(declare-fun e!175523 () Bool)

(assert (=> b!274029 (=> (not res!137997) (not e!175523))))

(assert (=> b!274029 (= res!137997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274030 () Bool)

(declare-fun res!137999 () Bool)

(assert (=> b!274030 (=> (not res!137999) (not e!175522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274030 (= res!137999 (validKeyInArray!0 (select (arr!6403 a!3325) startIndex!26)))))

(declare-fun b!274031 () Bool)

(assert (=> b!274031 (= e!175523 e!175522)))

(declare-fun res!137995 () Bool)

(assert (=> b!274031 (=> (not res!137995) (not e!175522))))

(assert (=> b!274031 (= res!137995 (not (= startIndex!26 i!1267)))))

(assert (=> b!274031 (= lt!136743 (array!13509 (store (arr!6403 a!3325) i!1267 k0!2581) (size!6755 a!3325)))))

(declare-fun b!274032 () Bool)

(declare-fun res!137996 () Bool)

(declare-fun e!175520 () Bool)

(assert (=> b!274032 (=> (not res!137996) (not e!175520))))

(assert (=> b!274032 (= res!137996 (validKeyInArray!0 k0!2581))))

(declare-fun b!274034 () Bool)

(declare-fun res!137993 () Bool)

(assert (=> b!274034 (=> (not res!137993) (not e!175520))))

(assert (=> b!274034 (= res!137993 (and (= (size!6755 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6755 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6755 a!3325))))))

(declare-fun b!274035 () Bool)

(declare-fun res!137994 () Bool)

(assert (=> b!274035 (=> (not res!137994) (not e!175520))))

(assert (=> b!274035 (= res!137994 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4121))))

(declare-fun b!274036 () Bool)

(assert (=> b!274036 (= e!175520 e!175523)))

(declare-fun res!138000 () Bool)

(assert (=> b!274036 (=> (not res!138000) (not e!175523))))

(declare-fun lt!136744 () SeekEntryResult!1526)

(assert (=> b!274036 (= res!138000 (or (= lt!136744 (MissingZero!1526 i!1267)) (= lt!136744 (MissingVacant!1526 i!1267))))))

(assert (=> b!274036 (= lt!136744 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274033 () Bool)

(declare-fun res!137992 () Bool)

(assert (=> b!274033 (=> (not res!137992) (not e!175520))))

(declare-fun arrayContainsKey!0 (array!13508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274033 (= res!137992 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!137998 () Bool)

(assert (=> start!26412 (=> (not res!137998) (not e!175520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26412 (= res!137998 (validMask!0 mask!3868))))

(assert (=> start!26412 e!175520))

(declare-fun array_inv!4353 (array!13508) Bool)

(assert (=> start!26412 (array_inv!4353 a!3325)))

(assert (=> start!26412 true))

(assert (= (and start!26412 res!137998) b!274034))

(assert (= (and b!274034 res!137993) b!274032))

(assert (= (and b!274032 res!137996) b!274035))

(assert (= (and b!274035 res!137994) b!274033))

(assert (= (and b!274033 res!137992) b!274036))

(assert (= (and b!274036 res!138000) b!274029))

(assert (= (and b!274029 res!137997) b!274031))

(assert (= (and b!274031 res!137995) b!274030))

(assert (= (and b!274030 res!137999) b!274028))

(declare-fun m!289559 () Bool)

(assert (=> b!274033 m!289559))

(declare-fun m!289561 () Bool)

(assert (=> b!274031 m!289561))

(declare-fun m!289563 () Bool)

(assert (=> start!26412 m!289563))

(declare-fun m!289565 () Bool)

(assert (=> start!26412 m!289565))

(declare-fun m!289567 () Bool)

(assert (=> b!274036 m!289567))

(declare-fun m!289569 () Bool)

(assert (=> b!274029 m!289569))

(declare-fun m!289571 () Bool)

(assert (=> b!274032 m!289571))

(declare-fun m!289573 () Bool)

(assert (=> b!274030 m!289573))

(assert (=> b!274030 m!289573))

(declare-fun m!289575 () Bool)

(assert (=> b!274030 m!289575))

(declare-fun m!289577 () Bool)

(assert (=> b!274035 m!289577))

(declare-fun m!289579 () Bool)

(assert (=> b!274028 m!289579))

(declare-fun m!289581 () Bool)

(assert (=> b!274028 m!289581))

(declare-fun m!289583 () Bool)

(assert (=> b!274028 m!289583))

(declare-fun m!289585 () Bool)

(assert (=> b!274028 m!289585))

(assert (=> b!274028 m!289581))

(assert (=> b!274028 m!289561))

(declare-fun m!289587 () Bool)

(assert (=> b!274028 m!289587))

(assert (=> b!274028 m!289573))

(declare-fun m!289589 () Bool)

(assert (=> b!274028 m!289589))

(declare-fun m!289591 () Bool)

(assert (=> b!274028 m!289591))

(assert (=> b!274028 m!289573))

(declare-fun m!289593 () Bool)

(assert (=> b!274028 m!289593))

(check-sat (not b!274036) (not b!274028) (not b!274033) (not b!274035) (not b!274032) (not b!274029) (not b!274030) (not start!26412))
(check-sat)
