; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26462 () Bool)

(assert start!26462)

(declare-fun res!138563 () Bool)

(declare-fun e!175722 () Bool)

(assert (=> start!26462 (=> (not res!138563) (not e!175722))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26462 (= res!138563 (validMask!0 mask!3868))))

(assert (=> start!26462 e!175722))

(declare-datatypes ((array!13548 0))(
  ( (array!13549 (arr!6423 (Array (_ BitVec 32) (_ BitVec 64))) (size!6776 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13548)

(declare-fun array_inv!4395 (array!13548) Bool)

(assert (=> start!26462 (array_inv!4395 a!3325)))

(assert (=> start!26462 true))

(declare-fun b!274518 () Bool)

(declare-fun e!175720 () Bool)

(assert (=> b!274518 (= e!175720 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13548 (_ BitVec 32)) Bool)

(assert (=> b!274518 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8613 0))(
  ( (Unit!8614) )
))
(declare-fun lt!136901 () Unit!8613)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8613)

(assert (=> b!274518 (= lt!136901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136899 () array!13548)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1580 0))(
  ( (MissingZero!1580 (index!8490 (_ BitVec 32))) (Found!1580 (index!8491 (_ BitVec 32))) (Intermediate!1580 (undefined!2392 Bool) (index!8492 (_ BitVec 32)) (x!26800 (_ BitVec 32))) (Undefined!1580) (MissingVacant!1580 (index!8493 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13548 (_ BitVec 32)) SeekEntryResult!1580)

(assert (=> b!274518 (= (seekEntryOrOpen!0 (select (arr!6423 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6423 a!3325) i!1267 k0!2581) startIndex!26) lt!136899 mask!3868))))

(declare-fun lt!136902 () Unit!8613)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13548 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8613)

(assert (=> b!274518 (= lt!136902 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4204 0))(
  ( (Nil!4201) (Cons!4200 (h!4867 (_ BitVec 64)) (t!9277 List!4204)) )
))
(declare-fun arrayNoDuplicates!0 (array!13548 (_ BitVec 32) List!4204) Bool)

(assert (=> b!274518 (arrayNoDuplicates!0 lt!136899 #b00000000000000000000000000000000 Nil!4201)))

(declare-fun lt!136900 () Unit!8613)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4204) Unit!8613)

(assert (=> b!274518 (= lt!136900 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4201))))

(declare-fun b!274519 () Bool)

(declare-fun res!138566 () Bool)

(assert (=> b!274519 (=> (not res!138566) (not e!175722))))

(assert (=> b!274519 (= res!138566 (and (= (size!6776 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6776 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6776 a!3325))))))

(declare-fun b!274520 () Bool)

(declare-fun e!175721 () Bool)

(assert (=> b!274520 (= e!175721 e!175720)))

(declare-fun res!138568 () Bool)

(assert (=> b!274520 (=> (not res!138568) (not e!175720))))

(assert (=> b!274520 (= res!138568 (not (= startIndex!26 i!1267)))))

(assert (=> b!274520 (= lt!136899 (array!13549 (store (arr!6423 a!3325) i!1267 k0!2581) (size!6776 a!3325)))))

(declare-fun b!274521 () Bool)

(declare-fun res!138564 () Bool)

(assert (=> b!274521 (=> (not res!138564) (not e!175720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274521 (= res!138564 (validKeyInArray!0 (select (arr!6423 a!3325) startIndex!26)))))

(declare-fun b!274522 () Bool)

(declare-fun res!138565 () Bool)

(assert (=> b!274522 (=> (not res!138565) (not e!175722))))

(declare-fun arrayContainsKey!0 (array!13548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274522 (= res!138565 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274523 () Bool)

(declare-fun res!138562 () Bool)

(assert (=> b!274523 (=> (not res!138562) (not e!175722))))

(assert (=> b!274523 (= res!138562 (validKeyInArray!0 k0!2581))))

(declare-fun b!274524 () Bool)

(declare-fun res!138567 () Bool)

(assert (=> b!274524 (=> (not res!138567) (not e!175722))))

(assert (=> b!274524 (= res!138567 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4201))))

(declare-fun b!274525 () Bool)

(declare-fun res!138560 () Bool)

(assert (=> b!274525 (=> (not res!138560) (not e!175721))))

(assert (=> b!274525 (= res!138560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274526 () Bool)

(assert (=> b!274526 (= e!175722 e!175721)))

(declare-fun res!138561 () Bool)

(assert (=> b!274526 (=> (not res!138561) (not e!175721))))

(declare-fun lt!136898 () SeekEntryResult!1580)

(assert (=> b!274526 (= res!138561 (or (= lt!136898 (MissingZero!1580 i!1267)) (= lt!136898 (MissingVacant!1580 i!1267))))))

(assert (=> b!274526 (= lt!136898 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26462 res!138563) b!274519))

(assert (= (and b!274519 res!138566) b!274523))

(assert (= (and b!274523 res!138562) b!274524))

(assert (= (and b!274524 res!138567) b!274522))

(assert (= (and b!274522 res!138565) b!274526))

(assert (= (and b!274526 res!138561) b!274525))

(assert (= (and b!274525 res!138560) b!274520))

(assert (= (and b!274520 res!138568) b!274521))

(assert (= (and b!274521 res!138564) b!274518))

(declare-fun m!289673 () Bool)

(assert (=> b!274523 m!289673))

(declare-fun m!289675 () Bool)

(assert (=> b!274524 m!289675))

(declare-fun m!289677 () Bool)

(assert (=> b!274526 m!289677))

(declare-fun m!289679 () Bool)

(assert (=> b!274521 m!289679))

(assert (=> b!274521 m!289679))

(declare-fun m!289681 () Bool)

(assert (=> b!274521 m!289681))

(declare-fun m!289683 () Bool)

(assert (=> start!26462 m!289683))

(declare-fun m!289685 () Bool)

(assert (=> start!26462 m!289685))

(declare-fun m!289687 () Bool)

(assert (=> b!274520 m!289687))

(declare-fun m!289689 () Bool)

(assert (=> b!274518 m!289689))

(declare-fun m!289691 () Bool)

(assert (=> b!274518 m!289691))

(declare-fun m!289693 () Bool)

(assert (=> b!274518 m!289693))

(assert (=> b!274518 m!289687))

(declare-fun m!289695 () Bool)

(assert (=> b!274518 m!289695))

(assert (=> b!274518 m!289679))

(declare-fun m!289697 () Bool)

(assert (=> b!274518 m!289697))

(declare-fun m!289699 () Bool)

(assert (=> b!274518 m!289699))

(assert (=> b!274518 m!289693))

(declare-fun m!289701 () Bool)

(assert (=> b!274518 m!289701))

(assert (=> b!274518 m!289679))

(declare-fun m!289703 () Bool)

(assert (=> b!274518 m!289703))

(declare-fun m!289705 () Bool)

(assert (=> b!274525 m!289705))

(declare-fun m!289707 () Bool)

(assert (=> b!274522 m!289707))

(check-sat (not b!274521) (not start!26462) (not b!274526) (not b!274524) (not b!274525) (not b!274522) (not b!274523) (not b!274518))
(check-sat)
