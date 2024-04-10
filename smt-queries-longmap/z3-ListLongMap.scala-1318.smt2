; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26468 () Bool)

(assert start!26468)

(declare-fun b!274773 () Bool)

(declare-fun e!175869 () Bool)

(declare-fun e!175868 () Bool)

(assert (=> b!274773 (= e!175869 e!175868)))

(declare-fun res!138765 () Bool)

(assert (=> b!274773 (=> (not res!138765) (not e!175868))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274773 (= res!138765 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13565 0))(
  ( (array!13566 (arr!6432 (Array (_ BitVec 32) (_ BitVec 64))) (size!6784 (_ BitVec 32))) )
))
(declare-fun lt!137143 () array!13565)

(declare-fun a!3325 () array!13565)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!274773 (= lt!137143 (array!13566 (store (arr!6432 a!3325) i!1267 k0!2581) (size!6784 a!3325)))))

(declare-fun b!274774 () Bool)

(declare-fun res!138768 () Bool)

(declare-fun e!175870 () Bool)

(assert (=> b!274774 (=> (not res!138768) (not e!175870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274774 (= res!138768 (validKeyInArray!0 k0!2581))))

(declare-fun res!138770 () Bool)

(assert (=> start!26468 (=> (not res!138770) (not e!175870))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26468 (= res!138770 (validMask!0 mask!3868))))

(assert (=> start!26468 e!175870))

(declare-fun array_inv!4395 (array!13565) Bool)

(assert (=> start!26468 (array_inv!4395 a!3325)))

(assert (=> start!26468 true))

(declare-fun b!274775 () Bool)

(assert (=> b!274775 (= e!175870 e!175869)))

(declare-fun res!138764 () Bool)

(assert (=> b!274775 (=> (not res!138764) (not e!175869))))

(declare-datatypes ((SeekEntryResult!1590 0))(
  ( (MissingZero!1590 (index!8530 (_ BitVec 32))) (Found!1590 (index!8531 (_ BitVec 32))) (Intermediate!1590 (undefined!2402 Bool) (index!8532 (_ BitVec 32)) (x!26819 (_ BitVec 32))) (Undefined!1590) (MissingVacant!1590 (index!8533 (_ BitVec 32))) )
))
(declare-fun lt!137139 () SeekEntryResult!1590)

(assert (=> b!274775 (= res!138764 (or (= lt!137139 (MissingZero!1590 i!1267)) (= lt!137139 (MissingVacant!1590 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13565 (_ BitVec 32)) SeekEntryResult!1590)

(assert (=> b!274775 (= lt!137139 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274776 () Bool)

(declare-fun res!138767 () Bool)

(assert (=> b!274776 (=> (not res!138767) (not e!175869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13565 (_ BitVec 32)) Bool)

(assert (=> b!274776 (= res!138767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274777 () Bool)

(declare-fun res!138763 () Bool)

(assert (=> b!274777 (=> (not res!138763) (not e!175870))))

(assert (=> b!274777 (= res!138763 (and (= (size!6784 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6784 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6784 a!3325))))))

(declare-fun b!274778 () Bool)

(declare-fun res!138771 () Bool)

(assert (=> b!274778 (=> (not res!138771) (not e!175870))))

(declare-datatypes ((List!4240 0))(
  ( (Nil!4237) (Cons!4236 (h!4903 (_ BitVec 64)) (t!9322 List!4240)) )
))
(declare-fun arrayNoDuplicates!0 (array!13565 (_ BitVec 32) List!4240) Bool)

(assert (=> b!274778 (= res!138771 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4237))))

(declare-fun b!274779 () Bool)

(declare-fun res!138766 () Bool)

(assert (=> b!274779 (=> (not res!138766) (not e!175868))))

(assert (=> b!274779 (= res!138766 (validKeyInArray!0 (select (arr!6432 a!3325) startIndex!26)))))

(declare-fun b!274780 () Bool)

(declare-fun res!138769 () Bool)

(assert (=> b!274780 (=> (not res!138769) (not e!175870))))

(declare-fun arrayContainsKey!0 (array!13565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274780 (= res!138769 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274781 () Bool)

(assert (=> b!274781 (= e!175868 (not true))))

(assert (=> b!274781 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8667 0))(
  ( (Unit!8668) )
))
(declare-fun lt!137140 () Unit!8667)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8667)

(assert (=> b!274781 (= lt!137140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274781 (= (seekEntryOrOpen!0 (select (arr!6432 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6432 a!3325) i!1267 k0!2581) startIndex!26) lt!137143 mask!3868))))

(declare-fun lt!137141 () Unit!8667)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8667)

(assert (=> b!274781 (= lt!137141 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274781 (arrayNoDuplicates!0 lt!137143 #b00000000000000000000000000000000 Nil!4237)))

(declare-fun lt!137142 () Unit!8667)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4240) Unit!8667)

(assert (=> b!274781 (= lt!137142 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4237))))

(assert (= (and start!26468 res!138770) b!274777))

(assert (= (and b!274777 res!138763) b!274774))

(assert (= (and b!274774 res!138768) b!274778))

(assert (= (and b!274778 res!138771) b!274780))

(assert (= (and b!274780 res!138769) b!274775))

(assert (= (and b!274775 res!138764) b!274776))

(assert (= (and b!274776 res!138767) b!274773))

(assert (= (and b!274773 res!138765) b!274779))

(assert (= (and b!274779 res!138766) b!274781))

(declare-fun m!290409 () Bool)

(assert (=> b!274780 m!290409))

(declare-fun m!290411 () Bool)

(assert (=> b!274778 m!290411))

(declare-fun m!290413 () Bool)

(assert (=> b!274781 m!290413))

(declare-fun m!290415 () Bool)

(assert (=> b!274781 m!290415))

(declare-fun m!290417 () Bool)

(assert (=> b!274781 m!290417))

(declare-fun m!290419 () Bool)

(assert (=> b!274781 m!290419))

(declare-fun m!290421 () Bool)

(assert (=> b!274781 m!290421))

(declare-fun m!290423 () Bool)

(assert (=> b!274781 m!290423))

(declare-fun m!290425 () Bool)

(assert (=> b!274781 m!290425))

(assert (=> b!274781 m!290423))

(declare-fun m!290427 () Bool)

(assert (=> b!274781 m!290427))

(assert (=> b!274781 m!290415))

(declare-fun m!290429 () Bool)

(assert (=> b!274781 m!290429))

(declare-fun m!290431 () Bool)

(assert (=> b!274781 m!290431))

(declare-fun m!290433 () Bool)

(assert (=> b!274776 m!290433))

(declare-fun m!290435 () Bool)

(assert (=> b!274774 m!290435))

(declare-fun m!290437 () Bool)

(assert (=> start!26468 m!290437))

(declare-fun m!290439 () Bool)

(assert (=> start!26468 m!290439))

(declare-fun m!290441 () Bool)

(assert (=> b!274775 m!290441))

(assert (=> b!274773 m!290417))

(assert (=> b!274779 m!290423))

(assert (=> b!274779 m!290423))

(declare-fun m!290443 () Bool)

(assert (=> b!274779 m!290443))

(check-sat (not start!26468) (not b!274776) (not b!274778) (not b!274775) (not b!274779) (not b!274781) (not b!274774) (not b!274780))
(check-sat)
