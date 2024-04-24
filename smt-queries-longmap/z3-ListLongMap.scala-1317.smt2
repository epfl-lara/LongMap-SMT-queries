; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26460 () Bool)

(assert start!26460)

(declare-fun b!274712 () Bool)

(declare-fun res!138678 () Bool)

(declare-fun e!175847 () Bool)

(assert (=> b!274712 (=> (not res!138678) (not e!175847))))

(declare-datatypes ((array!13556 0))(
  ( (array!13557 (arr!6427 (Array (_ BitVec 32) (_ BitVec 64))) (size!6779 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13556)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274712 (= res!138678 (and (= (size!6779 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6779 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6779 a!3325))))))

(declare-fun b!274713 () Bool)

(declare-fun e!175844 () Bool)

(declare-fun e!175845 () Bool)

(assert (=> b!274713 (= e!175844 e!175845)))

(declare-fun res!138681 () Bool)

(assert (=> b!274713 (=> (not res!138681) (not e!175845))))

(assert (=> b!274713 (= res!138681 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!137139 () array!13556)

(assert (=> b!274713 (= lt!137139 (array!13557 (store (arr!6427 a!3325) i!1267 k0!2581) (size!6779 a!3325)))))

(declare-fun res!138680 () Bool)

(assert (=> start!26460 (=> (not res!138680) (not e!175847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26460 (= res!138680 (validMask!0 mask!3868))))

(assert (=> start!26460 e!175847))

(declare-fun array_inv!4377 (array!13556) Bool)

(assert (=> start!26460 (array_inv!4377 a!3325)))

(assert (=> start!26460 true))

(declare-fun b!274714 () Bool)

(declare-fun res!138684 () Bool)

(assert (=> b!274714 (=> (not res!138684) (not e!175847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274714 (= res!138684 (validKeyInArray!0 k0!2581))))

(declare-fun b!274715 () Bool)

(assert (=> b!274715 (= e!175845 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13556 (_ BitVec 32)) Bool)

(assert (=> b!274715 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8639 0))(
  ( (Unit!8640) )
))
(declare-fun lt!137140 () Unit!8639)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8639)

(assert (=> b!274715 (= lt!137140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1550 0))(
  ( (MissingZero!1550 (index!8370 (_ BitVec 32))) (Found!1550 (index!8371 (_ BitVec 32))) (Intermediate!1550 (undefined!2362 Bool) (index!8372 (_ BitVec 32)) (x!26771 (_ BitVec 32))) (Undefined!1550) (MissingVacant!1550 (index!8373 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13556 (_ BitVec 32)) SeekEntryResult!1550)

(assert (=> b!274715 (= (seekEntryOrOpen!0 (select (arr!6427 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6427 a!3325) i!1267 k0!2581) startIndex!26) lt!137139 mask!3868))))

(declare-fun lt!137141 () Unit!8639)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13556 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8639)

(assert (=> b!274715 (= lt!137141 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4148 0))(
  ( (Nil!4145) (Cons!4144 (h!4811 (_ BitVec 64)) (t!9222 List!4148)) )
))
(declare-fun arrayNoDuplicates!0 (array!13556 (_ BitVec 32) List!4148) Bool)

(assert (=> b!274715 (arrayNoDuplicates!0 lt!137139 #b00000000000000000000000000000000 Nil!4145)))

(declare-fun lt!137138 () Unit!8639)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4148) Unit!8639)

(assert (=> b!274715 (= lt!137138 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4145))))

(declare-fun b!274716 () Bool)

(declare-fun res!138682 () Bool)

(assert (=> b!274716 (=> (not res!138682) (not e!175845))))

(assert (=> b!274716 (= res!138682 (validKeyInArray!0 (select (arr!6427 a!3325) startIndex!26)))))

(declare-fun b!274717 () Bool)

(declare-fun res!138676 () Bool)

(assert (=> b!274717 (=> (not res!138676) (not e!175847))))

(declare-fun arrayContainsKey!0 (array!13556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274717 (= res!138676 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274718 () Bool)

(declare-fun res!138677 () Bool)

(assert (=> b!274718 (=> (not res!138677) (not e!175844))))

(assert (=> b!274718 (= res!138677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274719 () Bool)

(declare-fun res!138679 () Bool)

(assert (=> b!274719 (=> (not res!138679) (not e!175847))))

(assert (=> b!274719 (= res!138679 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4145))))

(declare-fun b!274720 () Bool)

(assert (=> b!274720 (= e!175847 e!175844)))

(declare-fun res!138683 () Bool)

(assert (=> b!274720 (=> (not res!138683) (not e!175844))))

(declare-fun lt!137142 () SeekEntryResult!1550)

(assert (=> b!274720 (= res!138683 (or (= lt!137142 (MissingZero!1550 i!1267)) (= lt!137142 (MissingVacant!1550 i!1267))))))

(assert (=> b!274720 (= lt!137142 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26460 res!138680) b!274712))

(assert (= (and b!274712 res!138678) b!274714))

(assert (= (and b!274714 res!138684) b!274719))

(assert (= (and b!274719 res!138679) b!274717))

(assert (= (and b!274717 res!138676) b!274720))

(assert (= (and b!274720 res!138683) b!274718))

(assert (= (and b!274718 res!138677) b!274713))

(assert (= (and b!274713 res!138681) b!274716))

(assert (= (and b!274716 res!138682) b!274715))

(declare-fun m!290471 () Bool)

(assert (=> b!274715 m!290471))

(declare-fun m!290473 () Bool)

(assert (=> b!274715 m!290473))

(declare-fun m!290475 () Bool)

(assert (=> b!274715 m!290475))

(declare-fun m!290477 () Bool)

(assert (=> b!274715 m!290477))

(declare-fun m!290479 () Bool)

(assert (=> b!274715 m!290479))

(declare-fun m!290481 () Bool)

(assert (=> b!274715 m!290481))

(declare-fun m!290483 () Bool)

(assert (=> b!274715 m!290483))

(declare-fun m!290485 () Bool)

(assert (=> b!274715 m!290485))

(assert (=> b!274715 m!290481))

(declare-fun m!290487 () Bool)

(assert (=> b!274715 m!290487))

(assert (=> b!274715 m!290473))

(declare-fun m!290489 () Bool)

(assert (=> b!274715 m!290489))

(assert (=> b!274713 m!290477))

(declare-fun m!290491 () Bool)

(assert (=> b!274719 m!290491))

(declare-fun m!290493 () Bool)

(assert (=> b!274714 m!290493))

(declare-fun m!290495 () Bool)

(assert (=> start!26460 m!290495))

(declare-fun m!290497 () Bool)

(assert (=> start!26460 m!290497))

(assert (=> b!274716 m!290481))

(assert (=> b!274716 m!290481))

(declare-fun m!290499 () Bool)

(assert (=> b!274716 m!290499))

(declare-fun m!290501 () Bool)

(assert (=> b!274717 m!290501))

(declare-fun m!290503 () Bool)

(assert (=> b!274720 m!290503))

(declare-fun m!290505 () Bool)

(assert (=> b!274718 m!290505))

(check-sat (not b!274717) (not start!26460) (not b!274714) (not b!274718) (not b!274715) (not b!274720) (not b!274719) (not b!274716))
(check-sat)
