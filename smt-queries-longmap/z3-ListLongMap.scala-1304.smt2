; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26382 () Bool)

(assert start!26382)

(declare-fun b!273623 () Bool)

(declare-fun res!137593 () Bool)

(declare-fun e!175340 () Bool)

(assert (=> b!273623 (=> (not res!137593) (not e!175340))))

(declare-datatypes ((array!13478 0))(
  ( (array!13479 (arr!6388 (Array (_ BitVec 32) (_ BitVec 64))) (size!6740 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13478)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273623 (= res!137593 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273624 () Bool)

(declare-fun res!137589 () Bool)

(declare-fun e!175342 () Bool)

(assert (=> b!273624 (=> (not res!137589) (not e!175342))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13478 (_ BitVec 32)) Bool)

(assert (=> b!273624 (= res!137589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273625 () Bool)

(assert (=> b!273625 (= e!175340 e!175342)))

(declare-fun res!137591 () Bool)

(assert (=> b!273625 (=> (not res!137591) (not e!175342))))

(declare-datatypes ((SeekEntryResult!1511 0))(
  ( (MissingZero!1511 (index!8214 (_ BitVec 32))) (Found!1511 (index!8215 (_ BitVec 32))) (Intermediate!1511 (undefined!2323 Bool) (index!8216 (_ BitVec 32)) (x!26628 (_ BitVec 32))) (Undefined!1511) (MissingVacant!1511 (index!8217 (_ BitVec 32))) )
))
(declare-fun lt!136517 () SeekEntryResult!1511)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273625 (= res!137591 (or (= lt!136517 (MissingZero!1511 i!1267)) (= lt!136517 (MissingVacant!1511 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13478 (_ BitVec 32)) SeekEntryResult!1511)

(assert (=> b!273625 (= lt!136517 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273626 () Bool)

(declare-fun res!137592 () Bool)

(assert (=> b!273626 (=> (not res!137592) (not e!175340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273626 (= res!137592 (validKeyInArray!0 k0!2581))))

(declare-fun res!137595 () Bool)

(assert (=> start!26382 (=> (not res!137595) (not e!175340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26382 (= res!137595 (validMask!0 mask!3868))))

(assert (=> start!26382 e!175340))

(declare-fun array_inv!4338 (array!13478) Bool)

(assert (=> start!26382 (array_inv!4338 a!3325)))

(assert (=> start!26382 true))

(declare-fun b!273627 () Bool)

(declare-fun e!175343 () Bool)

(assert (=> b!273627 (= e!175343 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273627 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8561 0))(
  ( (Unit!8562) )
))
(declare-fun lt!136519 () Unit!8561)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8561)

(assert (=> b!273627 (= lt!136519 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136518 () array!13478)

(assert (=> b!273627 (= (seekEntryOrOpen!0 (select (arr!6388 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6388 a!3325) i!1267 k0!2581) startIndex!26) lt!136518 mask!3868))))

(declare-fun lt!136520 () Unit!8561)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8561)

(assert (=> b!273627 (= lt!136520 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4109 0))(
  ( (Nil!4106) (Cons!4105 (h!4772 (_ BitVec 64)) (t!9183 List!4109)) )
))
(declare-fun arrayNoDuplicates!0 (array!13478 (_ BitVec 32) List!4109) Bool)

(assert (=> b!273627 (arrayNoDuplicates!0 lt!136518 #b00000000000000000000000000000000 Nil!4106)))

(declare-fun lt!136521 () Unit!8561)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13478 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4109) Unit!8561)

(assert (=> b!273627 (= lt!136521 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4106))))

(declare-fun b!273628 () Bool)

(declare-fun res!137587 () Bool)

(assert (=> b!273628 (=> (not res!137587) (not e!175340))))

(assert (=> b!273628 (= res!137587 (and (= (size!6740 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6740 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6740 a!3325))))))

(declare-fun b!273629 () Bool)

(assert (=> b!273629 (= e!175342 e!175343)))

(declare-fun res!137590 () Bool)

(assert (=> b!273629 (=> (not res!137590) (not e!175343))))

(assert (=> b!273629 (= res!137590 (not (= startIndex!26 i!1267)))))

(assert (=> b!273629 (= lt!136518 (array!13479 (store (arr!6388 a!3325) i!1267 k0!2581) (size!6740 a!3325)))))

(declare-fun b!273630 () Bool)

(declare-fun res!137588 () Bool)

(assert (=> b!273630 (=> (not res!137588) (not e!175343))))

(assert (=> b!273630 (= res!137588 (validKeyInArray!0 (select (arr!6388 a!3325) startIndex!26)))))

(declare-fun b!273631 () Bool)

(declare-fun res!137594 () Bool)

(assert (=> b!273631 (=> (not res!137594) (not e!175340))))

(assert (=> b!273631 (= res!137594 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4106))))

(assert (= (and start!26382 res!137595) b!273628))

(assert (= (and b!273628 res!137587) b!273626))

(assert (= (and b!273626 res!137592) b!273631))

(assert (= (and b!273631 res!137594) b!273623))

(assert (= (and b!273623 res!137593) b!273625))

(assert (= (and b!273625 res!137591) b!273624))

(assert (= (and b!273624 res!137589) b!273629))

(assert (= (and b!273629 res!137590) b!273630))

(assert (= (and b!273630 res!137588) b!273627))

(declare-fun m!289019 () Bool)

(assert (=> b!273623 m!289019))

(declare-fun m!289021 () Bool)

(assert (=> b!273625 m!289021))

(declare-fun m!289023 () Bool)

(assert (=> b!273627 m!289023))

(declare-fun m!289025 () Bool)

(assert (=> b!273627 m!289025))

(declare-fun m!289027 () Bool)

(assert (=> b!273627 m!289027))

(declare-fun m!289029 () Bool)

(assert (=> b!273627 m!289029))

(declare-fun m!289031 () Bool)

(assert (=> b!273627 m!289031))

(declare-fun m!289033 () Bool)

(assert (=> b!273627 m!289033))

(declare-fun m!289035 () Bool)

(assert (=> b!273627 m!289035))

(assert (=> b!273627 m!289033))

(declare-fun m!289037 () Bool)

(assert (=> b!273627 m!289037))

(assert (=> b!273627 m!289027))

(declare-fun m!289039 () Bool)

(assert (=> b!273627 m!289039))

(declare-fun m!289041 () Bool)

(assert (=> b!273627 m!289041))

(assert (=> b!273630 m!289033))

(assert (=> b!273630 m!289033))

(declare-fun m!289043 () Bool)

(assert (=> b!273630 m!289043))

(declare-fun m!289045 () Bool)

(assert (=> b!273631 m!289045))

(declare-fun m!289047 () Bool)

(assert (=> b!273624 m!289047))

(assert (=> b!273629 m!289029))

(declare-fun m!289049 () Bool)

(assert (=> start!26382 m!289049))

(declare-fun m!289051 () Bool)

(assert (=> start!26382 m!289051))

(declare-fun m!289053 () Bool)

(assert (=> b!273626 m!289053))

(check-sat (not start!26382) (not b!273626) (not b!273624) (not b!273627) (not b!273623) (not b!273631) (not b!273630) (not b!273625))
(check-sat)
