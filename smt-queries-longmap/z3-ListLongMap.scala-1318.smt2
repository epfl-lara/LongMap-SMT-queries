; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26466 () Bool)

(assert start!26466)

(declare-fun b!274793 () Bool)

(declare-fun res!138765 () Bool)

(declare-fun e!175882 () Bool)

(assert (=> b!274793 (=> (not res!138765) (not e!175882))))

(declare-datatypes ((array!13562 0))(
  ( (array!13563 (arr!6430 (Array (_ BitVec 32) (_ BitVec 64))) (size!6782 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13562)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274793 (= res!138765 (and (= (size!6782 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6782 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6782 a!3325))))))

(declare-fun b!274794 () Bool)

(declare-fun res!138759 () Bool)

(assert (=> b!274794 (=> (not res!138759) (not e!175882))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274794 (= res!138759 (validKeyInArray!0 k0!2581))))

(declare-fun b!274795 () Bool)

(declare-fun e!175883 () Bool)

(declare-fun e!175880 () Bool)

(assert (=> b!274795 (= e!175883 e!175880)))

(declare-fun res!138757 () Bool)

(assert (=> b!274795 (=> (not res!138757) (not e!175880))))

(assert (=> b!274795 (= res!138757 (not (= startIndex!26 i!1267)))))

(declare-fun lt!137185 () array!13562)

(assert (=> b!274795 (= lt!137185 (array!13563 (store (arr!6430 a!3325) i!1267 k0!2581) (size!6782 a!3325)))))

(declare-fun b!274796 () Bool)

(declare-fun res!138758 () Bool)

(assert (=> b!274796 (=> (not res!138758) (not e!175880))))

(assert (=> b!274796 (= res!138758 (validKeyInArray!0 (select (arr!6430 a!3325) startIndex!26)))))

(declare-fun b!274797 () Bool)

(declare-fun res!138763 () Bool)

(assert (=> b!274797 (=> (not res!138763) (not e!175882))))

(declare-datatypes ((List!4151 0))(
  ( (Nil!4148) (Cons!4147 (h!4814 (_ BitVec 64)) (t!9225 List!4151)) )
))
(declare-fun arrayNoDuplicates!0 (array!13562 (_ BitVec 32) List!4151) Bool)

(assert (=> b!274797 (= res!138763 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4148))))

(declare-fun res!138764 () Bool)

(assert (=> start!26466 (=> (not res!138764) (not e!175882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26466 (= res!138764 (validMask!0 mask!3868))))

(assert (=> start!26466 e!175882))

(declare-fun array_inv!4380 (array!13562) Bool)

(assert (=> start!26466 (array_inv!4380 a!3325)))

(assert (=> start!26466 true))

(declare-fun b!274798 () Bool)

(assert (=> b!274798 (= e!175882 e!175883)))

(declare-fun res!138762 () Bool)

(assert (=> b!274798 (=> (not res!138762) (not e!175883))))

(declare-datatypes ((SeekEntryResult!1553 0))(
  ( (MissingZero!1553 (index!8382 (_ BitVec 32))) (Found!1553 (index!8383 (_ BitVec 32))) (Intermediate!1553 (undefined!2365 Bool) (index!8384 (_ BitVec 32)) (x!26782 (_ BitVec 32))) (Undefined!1553) (MissingVacant!1553 (index!8385 (_ BitVec 32))) )
))
(declare-fun lt!137184 () SeekEntryResult!1553)

(assert (=> b!274798 (= res!138762 (or (= lt!137184 (MissingZero!1553 i!1267)) (= lt!137184 (MissingVacant!1553 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13562 (_ BitVec 32)) SeekEntryResult!1553)

(assert (=> b!274798 (= lt!137184 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274799 () Bool)

(declare-fun res!138760 () Bool)

(assert (=> b!274799 (=> (not res!138760) (not e!175883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13562 (_ BitVec 32)) Bool)

(assert (=> b!274799 (= res!138760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274800 () Bool)

(declare-fun res!138761 () Bool)

(assert (=> b!274800 (=> (not res!138761) (not e!175882))))

(declare-fun arrayContainsKey!0 (array!13562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274800 (= res!138761 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274801 () Bool)

(assert (=> b!274801 (= e!175880 (not true))))

(assert (=> b!274801 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8645 0))(
  ( (Unit!8646) )
))
(declare-fun lt!137187 () Unit!8645)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8645)

(assert (=> b!274801 (= lt!137187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274801 (= (seekEntryOrOpen!0 (select (arr!6430 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6430 a!3325) i!1267 k0!2581) startIndex!26) lt!137185 mask!3868))))

(declare-fun lt!137183 () Unit!8645)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13562 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8645)

(assert (=> b!274801 (= lt!137183 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274801 (arrayNoDuplicates!0 lt!137185 #b00000000000000000000000000000000 Nil!4148)))

(declare-fun lt!137186 () Unit!8645)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4151) Unit!8645)

(assert (=> b!274801 (= lt!137186 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4148))))

(assert (= (and start!26466 res!138764) b!274793))

(assert (= (and b!274793 res!138765) b!274794))

(assert (= (and b!274794 res!138759) b!274797))

(assert (= (and b!274797 res!138763) b!274800))

(assert (= (and b!274800 res!138761) b!274798))

(assert (= (and b!274798 res!138762) b!274799))

(assert (= (and b!274799 res!138760) b!274795))

(assert (= (and b!274795 res!138757) b!274796))

(assert (= (and b!274796 res!138758) b!274801))

(declare-fun m!290579 () Bool)

(assert (=> b!274794 m!290579))

(declare-fun m!290581 () Bool)

(assert (=> b!274799 m!290581))

(declare-fun m!290583 () Bool)

(assert (=> start!26466 m!290583))

(declare-fun m!290585 () Bool)

(assert (=> start!26466 m!290585))

(declare-fun m!290587 () Bool)

(assert (=> b!274801 m!290587))

(declare-fun m!290589 () Bool)

(assert (=> b!274801 m!290589))

(declare-fun m!290591 () Bool)

(assert (=> b!274801 m!290591))

(declare-fun m!290593 () Bool)

(assert (=> b!274801 m!290593))

(declare-fun m!290595 () Bool)

(assert (=> b!274801 m!290595))

(declare-fun m!290597 () Bool)

(assert (=> b!274801 m!290597))

(declare-fun m!290599 () Bool)

(assert (=> b!274801 m!290599))

(declare-fun m!290601 () Bool)

(assert (=> b!274801 m!290601))

(assert (=> b!274801 m!290597))

(declare-fun m!290603 () Bool)

(assert (=> b!274801 m!290603))

(assert (=> b!274801 m!290591))

(declare-fun m!290605 () Bool)

(assert (=> b!274801 m!290605))

(declare-fun m!290607 () Bool)

(assert (=> b!274800 m!290607))

(declare-fun m!290609 () Bool)

(assert (=> b!274797 m!290609))

(assert (=> b!274795 m!290593))

(assert (=> b!274796 m!290597))

(assert (=> b!274796 m!290597))

(declare-fun m!290611 () Bool)

(assert (=> b!274796 m!290611))

(declare-fun m!290613 () Bool)

(assert (=> b!274798 m!290613))

(check-sat (not b!274798) (not b!274794) (not b!274796) (not b!274800) (not start!26466) (not b!274797) (not b!274799) (not b!274801))
(check-sat)
