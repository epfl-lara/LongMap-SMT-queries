; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26394 () Bool)

(assert start!26394)

(declare-fun b!273738 () Bool)

(declare-fun res!137735 () Bool)

(declare-fun e!175389 () Bool)

(assert (=> b!273738 (=> (not res!137735) (not e!175389))))

(declare-datatypes ((array!13491 0))(
  ( (array!13492 (arr!6395 (Array (_ BitVec 32) (_ BitVec 64))) (size!6747 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13491)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13491 (_ BitVec 32)) Bool)

(assert (=> b!273738 (= res!137735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273739 () Bool)

(declare-fun e!175390 () Bool)

(assert (=> b!273739 (= e!175389 e!175390)))

(declare-fun res!137736 () Bool)

(assert (=> b!273739 (=> (not res!137736) (not e!175390))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273739 (= res!137736 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136549 () array!13491)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!273739 (= lt!136549 (array!13492 (store (arr!6395 a!3325) i!1267 k!2581) (size!6747 a!3325)))))

(declare-fun b!273740 () Bool)

(declare-fun res!137729 () Bool)

(declare-fun e!175388 () Bool)

(assert (=> b!273740 (=> (not res!137729) (not e!175388))))

(declare-fun arrayContainsKey!0 (array!13491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273740 (= res!137729 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273741 () Bool)

(declare-fun res!137728 () Bool)

(assert (=> b!273741 (=> (not res!137728) (not e!175388))))

(assert (=> b!273741 (= res!137728 (and (= (size!6747 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6747 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6747 a!3325))))))

(declare-fun b!273742 () Bool)

(assert (=> b!273742 (= e!175390 (not true))))

(assert (=> b!273742 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8593 0))(
  ( (Unit!8594) )
))
(declare-fun lt!136551 () Unit!8593)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8593)

(assert (=> b!273742 (= lt!136551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1553 0))(
  ( (MissingZero!1553 (index!8382 (_ BitVec 32))) (Found!1553 (index!8383 (_ BitVec 32))) (Intermediate!1553 (undefined!2365 Bool) (index!8384 (_ BitVec 32)) (x!26686 (_ BitVec 32))) (Undefined!1553) (MissingVacant!1553 (index!8385 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13491 (_ BitVec 32)) SeekEntryResult!1553)

(assert (=> b!273742 (= (seekEntryOrOpen!0 (select (arr!6395 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6395 a!3325) i!1267 k!2581) startIndex!26) lt!136549 mask!3868))))

(declare-fun lt!136552 () Unit!8593)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8593)

(assert (=> b!273742 (= lt!136552 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4203 0))(
  ( (Nil!4200) (Cons!4199 (h!4866 (_ BitVec 64)) (t!9285 List!4203)) )
))
(declare-fun arrayNoDuplicates!0 (array!13491 (_ BitVec 32) List!4203) Bool)

(assert (=> b!273742 (arrayNoDuplicates!0 lt!136549 #b00000000000000000000000000000000 Nil!4200)))

(declare-fun lt!136548 () Unit!8593)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4203) Unit!8593)

(assert (=> b!273742 (= lt!136548 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4200))))

(declare-fun res!137731 () Bool)

(assert (=> start!26394 (=> (not res!137731) (not e!175388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26394 (= res!137731 (validMask!0 mask!3868))))

(assert (=> start!26394 e!175388))

(declare-fun array_inv!4358 (array!13491) Bool)

(assert (=> start!26394 (array_inv!4358 a!3325)))

(assert (=> start!26394 true))

(declare-fun b!273743 () Bool)

(declare-fun res!137730 () Bool)

(assert (=> b!273743 (=> (not res!137730) (not e!175388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273743 (= res!137730 (validKeyInArray!0 k!2581))))

(declare-fun b!273744 () Bool)

(declare-fun res!137733 () Bool)

(assert (=> b!273744 (=> (not res!137733) (not e!175388))))

(assert (=> b!273744 (= res!137733 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4200))))

(declare-fun b!273745 () Bool)

(assert (=> b!273745 (= e!175388 e!175389)))

(declare-fun res!137734 () Bool)

(assert (=> b!273745 (=> (not res!137734) (not e!175389))))

(declare-fun lt!136550 () SeekEntryResult!1553)

(assert (=> b!273745 (= res!137734 (or (= lt!136550 (MissingZero!1553 i!1267)) (= lt!136550 (MissingVacant!1553 i!1267))))))

(assert (=> b!273745 (= lt!136550 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273746 () Bool)

(declare-fun res!137732 () Bool)

(assert (=> b!273746 (=> (not res!137732) (not e!175390))))

(assert (=> b!273746 (= res!137732 (validKeyInArray!0 (select (arr!6395 a!3325) startIndex!26)))))

(assert (= (and start!26394 res!137731) b!273741))

(assert (= (and b!273741 res!137728) b!273743))

(assert (= (and b!273743 res!137730) b!273744))

(assert (= (and b!273744 res!137733) b!273740))

(assert (= (and b!273740 res!137729) b!273745))

(assert (= (and b!273745 res!137734) b!273738))

(assert (= (and b!273738 res!137735) b!273739))

(assert (= (and b!273739 res!137736) b!273746))

(assert (= (and b!273746 res!137732) b!273742))

(declare-fun m!289029 () Bool)

(assert (=> b!273743 m!289029))

(declare-fun m!289031 () Bool)

(assert (=> b!273740 m!289031))

(declare-fun m!289033 () Bool)

(assert (=> b!273745 m!289033))

(declare-fun m!289035 () Bool)

(assert (=> start!26394 m!289035))

(declare-fun m!289037 () Bool)

(assert (=> start!26394 m!289037))

(declare-fun m!289039 () Bool)

(assert (=> b!273744 m!289039))

(declare-fun m!289041 () Bool)

(assert (=> b!273746 m!289041))

(assert (=> b!273746 m!289041))

(declare-fun m!289043 () Bool)

(assert (=> b!273746 m!289043))

(declare-fun m!289045 () Bool)

(assert (=> b!273739 m!289045))

(declare-fun m!289047 () Bool)

(assert (=> b!273742 m!289047))

(declare-fun m!289049 () Bool)

(assert (=> b!273742 m!289049))

(declare-fun m!289051 () Bool)

(assert (=> b!273742 m!289051))

(assert (=> b!273742 m!289049))

(declare-fun m!289053 () Bool)

(assert (=> b!273742 m!289053))

(assert (=> b!273742 m!289041))

(declare-fun m!289055 () Bool)

(assert (=> b!273742 m!289055))

(declare-fun m!289057 () Bool)

(assert (=> b!273742 m!289057))

(assert (=> b!273742 m!289041))

(declare-fun m!289059 () Bool)

(assert (=> b!273742 m!289059))

(declare-fun m!289061 () Bool)

(assert (=> b!273742 m!289061))

(assert (=> b!273742 m!289045))

(declare-fun m!289063 () Bool)

(assert (=> b!273738 m!289063))

(push 1)

