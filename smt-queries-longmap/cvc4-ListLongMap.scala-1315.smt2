; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26452 () Bool)

(assert start!26452)

(declare-fun b!274556 () Bool)

(declare-fun e!175773 () Bool)

(declare-fun e!175775 () Bool)

(assert (=> b!274556 (= e!175773 e!175775)))

(declare-fun res!138552 () Bool)

(assert (=> b!274556 (=> (not res!138552) (not e!175775))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274556 (= res!138552 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13549 0))(
  ( (array!13550 (arr!6424 (Array (_ BitVec 32) (_ BitVec 64))) (size!6776 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13549)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!137023 () array!13549)

(assert (=> b!274556 (= lt!137023 (array!13550 (store (arr!6424 a!3325) i!1267 k!2581) (size!6776 a!3325)))))

(declare-fun b!274557 () Bool)

(declare-fun res!138550 () Bool)

(assert (=> b!274557 (=> (not res!138550) (not e!175773))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13549 (_ BitVec 32)) Bool)

(assert (=> b!274557 (= res!138550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274558 () Bool)

(declare-fun e!175772 () Bool)

(assert (=> b!274558 (= e!175772 (bvsle startIndex!26 (size!6776 a!3325)))))

(assert (=> b!274558 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!137023 mask!3868)))

(declare-datatypes ((Unit!8651 0))(
  ( (Unit!8652) )
))
(declare-fun lt!137020 () Unit!8651)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13549 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8651)

(assert (=> b!274558 (= lt!137020 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274559 () Bool)

(assert (=> b!274559 (= e!175775 (not e!175772))))

(declare-fun res!138549 () Bool)

(assert (=> b!274559 (=> res!138549 e!175772)))

(assert (=> b!274559 (= res!138549 (or (bvsge startIndex!26 (bvsub (size!6776 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274559 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!137022 () Unit!8651)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8651)

(assert (=> b!274559 (= lt!137022 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1582 0))(
  ( (MissingZero!1582 (index!8498 (_ BitVec 32))) (Found!1582 (index!8499 (_ BitVec 32))) (Intermediate!1582 (undefined!2394 Bool) (index!8500 (_ BitVec 32)) (x!26787 (_ BitVec 32))) (Undefined!1582) (MissingVacant!1582 (index!8501 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13549 (_ BitVec 32)) SeekEntryResult!1582)

(assert (=> b!274559 (= (seekEntryOrOpen!0 (select (arr!6424 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6424 a!3325) i!1267 k!2581) startIndex!26) lt!137023 mask!3868))))

(declare-fun lt!137018 () Unit!8651)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13549 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8651)

(assert (=> b!274559 (= lt!137018 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4232 0))(
  ( (Nil!4229) (Cons!4228 (h!4895 (_ BitVec 64)) (t!9314 List!4232)) )
))
(declare-fun arrayNoDuplicates!0 (array!13549 (_ BitVec 32) List!4232) Bool)

(assert (=> b!274559 (arrayNoDuplicates!0 lt!137023 #b00000000000000000000000000000000 Nil!4229)))

(declare-fun lt!137021 () Unit!8651)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4232) Unit!8651)

(assert (=> b!274559 (= lt!137021 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4229))))

(declare-fun b!274560 () Bool)

(declare-fun res!138551 () Bool)

(declare-fun e!175774 () Bool)

(assert (=> b!274560 (=> (not res!138551) (not e!175774))))

(declare-fun arrayContainsKey!0 (array!13549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274560 (= res!138551 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274561 () Bool)

(assert (=> b!274561 (= e!175774 e!175773)))

(declare-fun res!138548 () Bool)

(assert (=> b!274561 (=> (not res!138548) (not e!175773))))

(declare-fun lt!137019 () SeekEntryResult!1582)

(assert (=> b!274561 (= res!138548 (or (= lt!137019 (MissingZero!1582 i!1267)) (= lt!137019 (MissingVacant!1582 i!1267))))))

(assert (=> b!274561 (= lt!137019 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!138547 () Bool)

(assert (=> start!26452 (=> (not res!138547) (not e!175774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26452 (= res!138547 (validMask!0 mask!3868))))

(assert (=> start!26452 e!175774))

(declare-fun array_inv!4387 (array!13549) Bool)

(assert (=> start!26452 (array_inv!4387 a!3325)))

(assert (=> start!26452 true))

(declare-fun b!274562 () Bool)

(declare-fun res!138554 () Bool)

(assert (=> b!274562 (=> (not res!138554) (not e!175774))))

(assert (=> b!274562 (= res!138554 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4229))))

(declare-fun b!274563 () Bool)

(declare-fun res!138546 () Bool)

(assert (=> b!274563 (=> (not res!138546) (not e!175775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274563 (= res!138546 (validKeyInArray!0 (select (arr!6424 a!3325) startIndex!26)))))

(declare-fun b!274564 () Bool)

(declare-fun res!138555 () Bool)

(assert (=> b!274564 (=> (not res!138555) (not e!175774))))

(assert (=> b!274564 (= res!138555 (validKeyInArray!0 k!2581))))

(declare-fun b!274565 () Bool)

(declare-fun res!138553 () Bool)

(assert (=> b!274565 (=> (not res!138553) (not e!175774))))

(assert (=> b!274565 (= res!138553 (and (= (size!6776 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6776 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6776 a!3325))))))

(assert (= (and start!26452 res!138547) b!274565))

(assert (= (and b!274565 res!138553) b!274564))

(assert (= (and b!274564 res!138555) b!274562))

(assert (= (and b!274562 res!138554) b!274560))

(assert (= (and b!274560 res!138551) b!274561))

(assert (= (and b!274561 res!138548) b!274557))

(assert (= (and b!274557 res!138550) b!274556))

(assert (= (and b!274556 res!138552) b!274563))

(assert (= (and b!274563 res!138546) b!274559))

(assert (= (and b!274559 (not res!138549)) b!274558))

(declare-fun m!290117 () Bool)

(assert (=> b!274557 m!290117))

(declare-fun m!290119 () Bool)

(assert (=> start!26452 m!290119))

(declare-fun m!290121 () Bool)

(assert (=> start!26452 m!290121))

(declare-fun m!290123 () Bool)

(assert (=> b!274561 m!290123))

(declare-fun m!290125 () Bool)

(assert (=> b!274559 m!290125))

(declare-fun m!290127 () Bool)

(assert (=> b!274559 m!290127))

(declare-fun m!290129 () Bool)

(assert (=> b!274559 m!290129))

(declare-fun m!290131 () Bool)

(assert (=> b!274559 m!290131))

(declare-fun m!290133 () Bool)

(assert (=> b!274559 m!290133))

(assert (=> b!274559 m!290131))

(declare-fun m!290135 () Bool)

(assert (=> b!274559 m!290135))

(declare-fun m!290137 () Bool)

(assert (=> b!274559 m!290137))

(assert (=> b!274559 m!290125))

(declare-fun m!290139 () Bool)

(assert (=> b!274559 m!290139))

(declare-fun m!290141 () Bool)

(assert (=> b!274559 m!290141))

(declare-fun m!290143 () Bool)

(assert (=> b!274559 m!290143))

(declare-fun m!290145 () Bool)

(assert (=> b!274560 m!290145))

(assert (=> b!274556 m!290127))

(declare-fun m!290147 () Bool)

(assert (=> b!274562 m!290147))

(declare-fun m!290149 () Bool)

(assert (=> b!274564 m!290149))

(declare-fun m!290151 () Bool)

(assert (=> b!274558 m!290151))

(declare-fun m!290153 () Bool)

(assert (=> b!274558 m!290153))

(assert (=> b!274563 m!290131))

(assert (=> b!274563 m!290131))

(declare-fun m!290155 () Bool)

(assert (=> b!274563 m!290155))

(push 1)

(assert (not b!274562))

(assert (not b!274564))

(assert (not b!274561))

(assert (not b!274560))

(assert (not b!274558))

(assert (not start!26452))

(assert (not b!274563))

(assert (not b!274557))

(assert (not b!274559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

