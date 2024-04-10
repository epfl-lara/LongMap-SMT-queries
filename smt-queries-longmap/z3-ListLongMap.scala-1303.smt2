; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26378 () Bool)

(assert start!26378)

(declare-fun b!273522 () Bool)

(declare-fun e!175292 () Bool)

(assert (=> b!273522 (= e!175292 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13475 0))(
  ( (array!13476 (arr!6387 (Array (_ BitVec 32) (_ BitVec 64))) (size!6739 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13475)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13475 (_ BitVec 32)) Bool)

(assert (=> b!273522 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8577 0))(
  ( (Unit!8578) )
))
(declare-fun lt!136430 () Unit!8577)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8577)

(assert (=> b!273522 (= lt!136430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!136428 () array!13475)

(declare-datatypes ((SeekEntryResult!1545 0))(
  ( (MissingZero!1545 (index!8350 (_ BitVec 32))) (Found!1545 (index!8351 (_ BitVec 32))) (Intermediate!1545 (undefined!2357 Bool) (index!8352 (_ BitVec 32)) (x!26654 (_ BitVec 32))) (Undefined!1545) (MissingVacant!1545 (index!8353 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13475 (_ BitVec 32)) SeekEntryResult!1545)

(assert (=> b!273522 (= (seekEntryOrOpen!0 (select (arr!6387 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6387 a!3325) i!1267 k0!2581) startIndex!26) lt!136428 mask!3868))))

(declare-fun lt!136432 () Unit!8577)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8577)

(assert (=> b!273522 (= lt!136432 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4195 0))(
  ( (Nil!4192) (Cons!4191 (h!4858 (_ BitVec 64)) (t!9277 List!4195)) )
))
(declare-fun arrayNoDuplicates!0 (array!13475 (_ BitVec 32) List!4195) Bool)

(assert (=> b!273522 (arrayNoDuplicates!0 lt!136428 #b00000000000000000000000000000000 Nil!4192)))

(declare-fun lt!136429 () Unit!8577)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13475 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4195) Unit!8577)

(assert (=> b!273522 (= lt!136429 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4192))))

(declare-fun b!273523 () Bool)

(declare-fun res!137517 () Bool)

(declare-fun e!175294 () Bool)

(assert (=> b!273523 (=> (not res!137517) (not e!175294))))

(declare-fun arrayContainsKey!0 (array!13475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273523 (= res!137517 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273524 () Bool)

(declare-fun res!137515 () Bool)

(declare-fun e!175295 () Bool)

(assert (=> b!273524 (=> (not res!137515) (not e!175295))))

(assert (=> b!273524 (= res!137515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273525 () Bool)

(declare-fun res!137516 () Bool)

(assert (=> b!273525 (=> (not res!137516) (not e!175292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273525 (= res!137516 (validKeyInArray!0 (select (arr!6387 a!3325) startIndex!26)))))

(declare-fun b!273526 () Bool)

(assert (=> b!273526 (= e!175294 e!175295)))

(declare-fun res!137518 () Bool)

(assert (=> b!273526 (=> (not res!137518) (not e!175295))))

(declare-fun lt!136431 () SeekEntryResult!1545)

(assert (=> b!273526 (= res!137518 (or (= lt!136431 (MissingZero!1545 i!1267)) (= lt!136431 (MissingVacant!1545 i!1267))))))

(assert (=> b!273526 (= lt!136431 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273528 () Bool)

(declare-fun res!137513 () Bool)

(assert (=> b!273528 (=> (not res!137513) (not e!175294))))

(assert (=> b!273528 (= res!137513 (and (= (size!6739 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6739 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6739 a!3325))))))

(declare-fun b!273529 () Bool)

(declare-fun res!137512 () Bool)

(assert (=> b!273529 (=> (not res!137512) (not e!175294))))

(assert (=> b!273529 (= res!137512 (validKeyInArray!0 k0!2581))))

(declare-fun b!273530 () Bool)

(assert (=> b!273530 (= e!175295 e!175292)))

(declare-fun res!137519 () Bool)

(assert (=> b!273530 (=> (not res!137519) (not e!175292))))

(assert (=> b!273530 (= res!137519 (not (= startIndex!26 i!1267)))))

(assert (=> b!273530 (= lt!136428 (array!13476 (store (arr!6387 a!3325) i!1267 k0!2581) (size!6739 a!3325)))))

(declare-fun b!273527 () Bool)

(declare-fun res!137514 () Bool)

(assert (=> b!273527 (=> (not res!137514) (not e!175294))))

(assert (=> b!273527 (= res!137514 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4192))))

(declare-fun res!137520 () Bool)

(assert (=> start!26378 (=> (not res!137520) (not e!175294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26378 (= res!137520 (validMask!0 mask!3868))))

(assert (=> start!26378 e!175294))

(declare-fun array_inv!4350 (array!13475) Bool)

(assert (=> start!26378 (array_inv!4350 a!3325)))

(assert (=> start!26378 true))

(assert (= (and start!26378 res!137520) b!273528))

(assert (= (and b!273528 res!137513) b!273529))

(assert (= (and b!273529 res!137512) b!273527))

(assert (= (and b!273527 res!137514) b!273523))

(assert (= (and b!273523 res!137517) b!273526))

(assert (= (and b!273526 res!137518) b!273524))

(assert (= (and b!273524 res!137515) b!273530))

(assert (= (and b!273530 res!137519) b!273525))

(assert (= (and b!273525 res!137516) b!273522))

(declare-fun m!288741 () Bool)

(assert (=> b!273529 m!288741))

(declare-fun m!288743 () Bool)

(assert (=> b!273530 m!288743))

(declare-fun m!288745 () Bool)

(assert (=> b!273523 m!288745))

(declare-fun m!288747 () Bool)

(assert (=> b!273526 m!288747))

(declare-fun m!288749 () Bool)

(assert (=> b!273522 m!288749))

(declare-fun m!288751 () Bool)

(assert (=> b!273522 m!288751))

(declare-fun m!288753 () Bool)

(assert (=> b!273522 m!288753))

(assert (=> b!273522 m!288753))

(declare-fun m!288755 () Bool)

(assert (=> b!273522 m!288755))

(assert (=> b!273522 m!288743))

(declare-fun m!288757 () Bool)

(assert (=> b!273522 m!288757))

(declare-fun m!288759 () Bool)

(assert (=> b!273522 m!288759))

(declare-fun m!288761 () Bool)

(assert (=> b!273522 m!288761))

(declare-fun m!288763 () Bool)

(assert (=> b!273522 m!288763))

(assert (=> b!273522 m!288759))

(declare-fun m!288765 () Bool)

(assert (=> b!273522 m!288765))

(assert (=> b!273525 m!288759))

(assert (=> b!273525 m!288759))

(declare-fun m!288767 () Bool)

(assert (=> b!273525 m!288767))

(declare-fun m!288769 () Bool)

(assert (=> b!273524 m!288769))

(declare-fun m!288771 () Bool)

(assert (=> b!273527 m!288771))

(declare-fun m!288773 () Bool)

(assert (=> start!26378 m!288773))

(declare-fun m!288775 () Bool)

(assert (=> start!26378 m!288775))

(check-sat (not b!273525) (not b!273522) (not b!273527) (not b!273526) (not start!26378) (not b!273523) (not b!273529) (not b!273524))
(check-sat)
