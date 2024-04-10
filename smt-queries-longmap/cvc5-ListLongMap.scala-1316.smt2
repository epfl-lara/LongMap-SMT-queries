; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26454 () Bool)

(assert start!26454)

(declare-fun b!274584 () Bool)

(declare-fun e!175785 () Bool)

(assert (=> b!274584 (= e!175785 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13551 0))(
  ( (array!13552 (arr!6425 (Array (_ BitVec 32) (_ BitVec 64))) (size!6777 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13551)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13551 (_ BitVec 32)) Bool)

(assert (=> b!274584 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8653 0))(
  ( (Unit!8654) )
))
(declare-fun lt!137038 () Unit!8653)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8653)

(assert (=> b!274584 (= lt!137038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137034 () array!13551)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1583 0))(
  ( (MissingZero!1583 (index!8502 (_ BitVec 32))) (Found!1583 (index!8503 (_ BitVec 32))) (Intermediate!1583 (undefined!2395 Bool) (index!8504 (_ BitVec 32)) (x!26796 (_ BitVec 32))) (Undefined!1583) (MissingVacant!1583 (index!8505 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13551 (_ BitVec 32)) SeekEntryResult!1583)

(assert (=> b!274584 (= (seekEntryOrOpen!0 (select (arr!6425 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6425 a!3325) i!1267 k!2581) startIndex!26) lt!137034 mask!3868))))

(declare-fun lt!137037 () Unit!8653)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13551 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8653)

(assert (=> b!274584 (= lt!137037 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4233 0))(
  ( (Nil!4230) (Cons!4229 (h!4896 (_ BitVec 64)) (t!9315 List!4233)) )
))
(declare-fun arrayNoDuplicates!0 (array!13551 (_ BitVec 32) List!4233) Bool)

(assert (=> b!274584 (arrayNoDuplicates!0 lt!137034 #b00000000000000000000000000000000 Nil!4230)))

(declare-fun lt!137035 () Unit!8653)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4233) Unit!8653)

(assert (=> b!274584 (= lt!137035 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4230))))

(declare-fun b!274585 () Bool)

(declare-fun res!138575 () Bool)

(declare-fun e!175784 () Bool)

(assert (=> b!274585 (=> (not res!138575) (not e!175784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274585 (= res!138575 (validKeyInArray!0 k!2581))))

(declare-fun b!274586 () Bool)

(declare-fun e!175787 () Bool)

(assert (=> b!274586 (= e!175787 e!175785)))

(declare-fun res!138579 () Bool)

(assert (=> b!274586 (=> (not res!138579) (not e!175785))))

(assert (=> b!274586 (= res!138579 (not (= startIndex!26 i!1267)))))

(assert (=> b!274586 (= lt!137034 (array!13552 (store (arr!6425 a!3325) i!1267 k!2581) (size!6777 a!3325)))))

(declare-fun b!274587 () Bool)

(declare-fun res!138581 () Bool)

(assert (=> b!274587 (=> (not res!138581) (not e!175787))))

(assert (=> b!274587 (= res!138581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274588 () Bool)

(declare-fun res!138577 () Bool)

(assert (=> b!274588 (=> (not res!138577) (not e!175784))))

(assert (=> b!274588 (= res!138577 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4230))))

(declare-fun res!138576 () Bool)

(assert (=> start!26454 (=> (not res!138576) (not e!175784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26454 (= res!138576 (validMask!0 mask!3868))))

(assert (=> start!26454 e!175784))

(declare-fun array_inv!4388 (array!13551) Bool)

(assert (=> start!26454 (array_inv!4388 a!3325)))

(assert (=> start!26454 true))

(declare-fun b!274589 () Bool)

(assert (=> b!274589 (= e!175784 e!175787)))

(declare-fun res!138574 () Bool)

(assert (=> b!274589 (=> (not res!138574) (not e!175787))))

(declare-fun lt!137036 () SeekEntryResult!1583)

(assert (=> b!274589 (= res!138574 (or (= lt!137036 (MissingZero!1583 i!1267)) (= lt!137036 (MissingVacant!1583 i!1267))))))

(assert (=> b!274589 (= lt!137036 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274590 () Bool)

(declare-fun res!138582 () Bool)

(assert (=> b!274590 (=> (not res!138582) (not e!175785))))

(assert (=> b!274590 (= res!138582 (validKeyInArray!0 (select (arr!6425 a!3325) startIndex!26)))))

(declare-fun b!274591 () Bool)

(declare-fun res!138580 () Bool)

(assert (=> b!274591 (=> (not res!138580) (not e!175784))))

(assert (=> b!274591 (= res!138580 (and (= (size!6777 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6777 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6777 a!3325))))))

(declare-fun b!274592 () Bool)

(declare-fun res!138578 () Bool)

(assert (=> b!274592 (=> (not res!138578) (not e!175784))))

(declare-fun arrayContainsKey!0 (array!13551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274592 (= res!138578 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26454 res!138576) b!274591))

(assert (= (and b!274591 res!138580) b!274585))

(assert (= (and b!274585 res!138575) b!274588))

(assert (= (and b!274588 res!138577) b!274592))

(assert (= (and b!274592 res!138578) b!274589))

(assert (= (and b!274589 res!138574) b!274587))

(assert (= (and b!274587 res!138581) b!274586))

(assert (= (and b!274586 res!138579) b!274590))

(assert (= (and b!274590 res!138582) b!274584))

(declare-fun m!290157 () Bool)

(assert (=> b!274589 m!290157))

(declare-fun m!290159 () Bool)

(assert (=> b!274592 m!290159))

(declare-fun m!290161 () Bool)

(assert (=> b!274590 m!290161))

(assert (=> b!274590 m!290161))

(declare-fun m!290163 () Bool)

(assert (=> b!274590 m!290163))

(declare-fun m!290165 () Bool)

(assert (=> b!274587 m!290165))

(declare-fun m!290167 () Bool)

(assert (=> start!26454 m!290167))

(declare-fun m!290169 () Bool)

(assert (=> start!26454 m!290169))

(declare-fun m!290171 () Bool)

(assert (=> b!274586 m!290171))

(declare-fun m!290173 () Bool)

(assert (=> b!274585 m!290173))

(declare-fun m!290175 () Bool)

(assert (=> b!274588 m!290175))

(declare-fun m!290177 () Bool)

(assert (=> b!274584 m!290177))

(declare-fun m!290179 () Bool)

(assert (=> b!274584 m!290179))

(assert (=> b!274584 m!290171))

(declare-fun m!290181 () Bool)

(assert (=> b!274584 m!290181))

(assert (=> b!274584 m!290161))

(declare-fun m!290183 () Bool)

(assert (=> b!274584 m!290183))

(declare-fun m!290185 () Bool)

(assert (=> b!274584 m!290185))

(assert (=> b!274584 m!290161))

(declare-fun m!290187 () Bool)

(assert (=> b!274584 m!290187))

(assert (=> b!274584 m!290179))

(declare-fun m!290189 () Bool)

(assert (=> b!274584 m!290189))

(declare-fun m!290191 () Bool)

(assert (=> b!274584 m!290191))

(push 1)

