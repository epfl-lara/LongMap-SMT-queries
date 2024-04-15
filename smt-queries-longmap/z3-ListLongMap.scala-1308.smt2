; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26408 () Bool)

(assert start!26408)

(declare-fun b!273753 () Bool)

(declare-fun res!137799 () Bool)

(declare-fun e!175361 () Bool)

(assert (=> b!273753 (=> (not res!137799) (not e!175361))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273753 (= res!137799 (validKeyInArray!0 k0!2581))))

(declare-fun b!273754 () Bool)

(declare-fun e!175360 () Bool)

(declare-fun e!175362 () Bool)

(assert (=> b!273754 (= e!175360 e!175362)))

(declare-fun res!137796 () Bool)

(assert (=> b!273754 (=> (not res!137796) (not e!175362))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273754 (= res!137796 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13494 0))(
  ( (array!13495 (arr!6396 (Array (_ BitVec 32) (_ BitVec 64))) (size!6749 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13494)

(declare-fun lt!136461 () array!13494)

(assert (=> b!273754 (= lt!136461 (array!13495 (store (arr!6396 a!3325) i!1267 k0!2581) (size!6749 a!3325)))))

(declare-fun b!273755 () Bool)

(assert (=> b!273755 (= e!175361 e!175360)))

(declare-fun res!137797 () Bool)

(assert (=> b!273755 (=> (not res!137797) (not e!175360))))

(declare-datatypes ((SeekEntryResult!1553 0))(
  ( (MissingZero!1553 (index!8382 (_ BitVec 32))) (Found!1553 (index!8383 (_ BitVec 32))) (Intermediate!1553 (undefined!2365 Bool) (index!8384 (_ BitVec 32)) (x!26701 (_ BitVec 32))) (Undefined!1553) (MissingVacant!1553 (index!8385 (_ BitVec 32))) )
))
(declare-fun lt!136460 () SeekEntryResult!1553)

(assert (=> b!273755 (= res!137797 (or (= lt!136460 (MissingZero!1553 i!1267)) (= lt!136460 (MissingVacant!1553 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13494 (_ BitVec 32)) SeekEntryResult!1553)

(assert (=> b!273755 (= lt!136460 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!137801 () Bool)

(assert (=> start!26408 (=> (not res!137801) (not e!175361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26408 (= res!137801 (validMask!0 mask!3868))))

(assert (=> start!26408 e!175361))

(declare-fun array_inv!4368 (array!13494) Bool)

(assert (=> start!26408 (array_inv!4368 a!3325)))

(assert (=> start!26408 true))

(declare-fun b!273756 () Bool)

(declare-fun res!137800 () Bool)

(assert (=> b!273756 (=> (not res!137800) (not e!175361))))

(declare-datatypes ((List!4177 0))(
  ( (Nil!4174) (Cons!4173 (h!4840 (_ BitVec 64)) (t!9250 List!4177)) )
))
(declare-fun arrayNoDuplicates!0 (array!13494 (_ BitVec 32) List!4177) Bool)

(assert (=> b!273756 (= res!137800 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4174))))

(declare-fun b!273757 () Bool)

(assert (=> b!273757 (= e!175362 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13494 (_ BitVec 32)) Bool)

(assert (=> b!273757 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8559 0))(
  ( (Unit!8560) )
))
(declare-fun lt!136459 () Unit!8559)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> b!273757 (= lt!136459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273757 (= (seekEntryOrOpen!0 (select (arr!6396 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6396 a!3325) i!1267 k0!2581) startIndex!26) lt!136461 mask!3868))))

(declare-fun lt!136457 () Unit!8559)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8559)

(assert (=> b!273757 (= lt!136457 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273757 (arrayNoDuplicates!0 lt!136461 #b00000000000000000000000000000000 Nil!4174)))

(declare-fun lt!136458 () Unit!8559)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4177) Unit!8559)

(assert (=> b!273757 (= lt!136458 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4174))))

(declare-fun b!273758 () Bool)

(declare-fun res!137802 () Bool)

(assert (=> b!273758 (=> (not res!137802) (not e!175361))))

(assert (=> b!273758 (= res!137802 (and (= (size!6749 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6749 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6749 a!3325))))))

(declare-fun b!273759 () Bool)

(declare-fun res!137798 () Bool)

(assert (=> b!273759 (=> (not res!137798) (not e!175362))))

(assert (=> b!273759 (= res!137798 (validKeyInArray!0 (select (arr!6396 a!3325) startIndex!26)))))

(declare-fun b!273760 () Bool)

(declare-fun res!137803 () Bool)

(assert (=> b!273760 (=> (not res!137803) (not e!175361))))

(declare-fun arrayContainsKey!0 (array!13494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273760 (= res!137803 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273761 () Bool)

(declare-fun res!137795 () Bool)

(assert (=> b!273761 (=> (not res!137795) (not e!175360))))

(assert (=> b!273761 (= res!137795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26408 res!137801) b!273758))

(assert (= (and b!273758 res!137802) b!273753))

(assert (= (and b!273753 res!137799) b!273756))

(assert (= (and b!273756 res!137800) b!273760))

(assert (= (and b!273760 res!137803) b!273755))

(assert (= (and b!273755 res!137797) b!273761))

(assert (= (and b!273761 res!137795) b!273754))

(assert (= (and b!273754 res!137796) b!273759))

(assert (= (and b!273759 res!137798) b!273757))

(declare-fun m!288653 () Bool)

(assert (=> b!273757 m!288653))

(declare-fun m!288655 () Bool)

(assert (=> b!273757 m!288655))

(declare-fun m!288657 () Bool)

(assert (=> b!273757 m!288657))

(declare-fun m!288659 () Bool)

(assert (=> b!273757 m!288659))

(declare-fun m!288661 () Bool)

(assert (=> b!273757 m!288661))

(declare-fun m!288663 () Bool)

(assert (=> b!273757 m!288663))

(declare-fun m!288665 () Bool)

(assert (=> b!273757 m!288665))

(assert (=> b!273757 m!288655))

(declare-fun m!288667 () Bool)

(assert (=> b!273757 m!288667))

(declare-fun m!288669 () Bool)

(assert (=> b!273757 m!288669))

(assert (=> b!273757 m!288663))

(declare-fun m!288671 () Bool)

(assert (=> b!273757 m!288671))

(assert (=> b!273759 m!288663))

(assert (=> b!273759 m!288663))

(declare-fun m!288673 () Bool)

(assert (=> b!273759 m!288673))

(declare-fun m!288675 () Bool)

(assert (=> b!273755 m!288675))

(assert (=> b!273754 m!288657))

(declare-fun m!288677 () Bool)

(assert (=> b!273753 m!288677))

(declare-fun m!288679 () Bool)

(assert (=> b!273756 m!288679))

(declare-fun m!288681 () Bool)

(assert (=> start!26408 m!288681))

(declare-fun m!288683 () Bool)

(assert (=> start!26408 m!288683))

(declare-fun m!288685 () Bool)

(assert (=> b!273761 m!288685))

(declare-fun m!288687 () Bool)

(assert (=> b!273760 m!288687))

(check-sat (not b!273759) (not b!273761) (not b!273755) (not b!273757) (not start!26408) (not b!273753) (not b!273760) (not b!273756))
(check-sat)
