; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51398 () Bool)

(assert start!51398)

(declare-fun b!561453 () Bool)

(declare-fun e!323535 () Bool)

(declare-fun e!323534 () Bool)

(assert (=> b!561453 (= e!323535 e!323534)))

(declare-fun res!352612 () Bool)

(assert (=> b!561453 (=> (not res!352612) (not e!323534))))

(declare-datatypes ((SeekEntryResult!5381 0))(
  ( (MissingZero!5381 (index!23751 (_ BitVec 32))) (Found!5381 (index!23752 (_ BitVec 32))) (Intermediate!5381 (undefined!6193 Bool) (index!23753 (_ BitVec 32)) (x!52660 (_ BitVec 32))) (Undefined!5381) (MissingVacant!5381 (index!23754 (_ BitVec 32))) )
))
(declare-fun lt!255525 () SeekEntryResult!5381)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561453 (= res!352612 (or (= lt!255525 (MissingZero!5381 i!1132)) (= lt!255525 (MissingVacant!5381 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35263 0))(
  ( (array!35264 (arr!16932 (Array (_ BitVec 32) (_ BitVec 64))) (size!17296 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35263)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35263 (_ BitVec 32)) SeekEntryResult!5381)

(assert (=> b!561453 (= lt!255525 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561454 () Bool)

(declare-fun e!323533 () Bool)

(declare-fun e!323530 () Bool)

(assert (=> b!561454 (= e!323533 e!323530)))

(declare-fun res!352604 () Bool)

(assert (=> b!561454 (=> res!352604 e!323530)))

(declare-fun lt!255523 () SeekEntryResult!5381)

(assert (=> b!561454 (= res!352604 (or (undefined!6193 lt!255523) (not (is-Intermediate!5381 lt!255523))))))

(declare-fun b!561455 () Bool)

(declare-fun res!352614 () Bool)

(assert (=> b!561455 (=> (not res!352614) (not e!323535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561455 (= res!352614 (validKeyInArray!0 k!1914))))

(declare-fun b!561456 () Bool)

(declare-fun res!352613 () Bool)

(assert (=> b!561456 (=> (not res!352613) (not e!323535))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561456 (= res!352613 (validKeyInArray!0 (select (arr!16932 a!3118) j!142)))))

(declare-fun b!561457 () Bool)

(declare-fun res!352616 () Bool)

(assert (=> b!561457 (=> (not res!352616) (not e!323534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35263 (_ BitVec 32)) Bool)

(assert (=> b!561457 (= res!352616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561458 () Bool)

(declare-fun res!352611 () Bool)

(assert (=> b!561458 (=> (not res!352611) (not e!323534))))

(declare-datatypes ((List!11012 0))(
  ( (Nil!11009) (Cons!11008 (h!12011 (_ BitVec 64)) (t!17240 List!11012)) )
))
(declare-fun arrayNoDuplicates!0 (array!35263 (_ BitVec 32) List!11012) Bool)

(assert (=> b!561458 (= res!352611 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11009))))

(declare-fun b!561459 () Bool)

(declare-fun e!323529 () Bool)

(declare-fun e!323528 () Bool)

(assert (=> b!561459 (= e!323529 e!323528)))

(declare-fun res!352609 () Bool)

(assert (=> b!561459 (=> (not res!352609) (not e!323528))))

(declare-fun lt!255520 () SeekEntryResult!5381)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35263 (_ BitVec 32)) SeekEntryResult!5381)

(assert (=> b!561459 (= res!352609 (= lt!255520 (seekKeyOrZeroReturnVacant!0 (x!52660 lt!255523) (index!23753 lt!255523) (index!23753 lt!255523) (select (arr!16932 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561460 () Bool)

(declare-fun e!323531 () Bool)

(assert (=> b!561460 (= e!323534 e!323531)))

(declare-fun res!352610 () Bool)

(assert (=> b!561460 (=> (not res!352610) (not e!323531))))

(declare-fun lt!255521 () (_ BitVec 64))

(declare-fun lt!255518 () (_ BitVec 32))

(declare-fun lt!255519 () array!35263)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35263 (_ BitVec 32)) SeekEntryResult!5381)

(assert (=> b!561460 (= res!352610 (= lt!255523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255518 lt!255521 lt!255519 mask!3119)))))

(declare-fun lt!255524 () (_ BitVec 32))

(assert (=> b!561460 (= lt!255523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255524 (select (arr!16932 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561460 (= lt!255518 (toIndex!0 lt!255521 mask!3119))))

(assert (=> b!561460 (= lt!255521 (select (store (arr!16932 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561460 (= lt!255524 (toIndex!0 (select (arr!16932 a!3118) j!142) mask!3119))))

(assert (=> b!561460 (= lt!255519 (array!35264 (store (arr!16932 a!3118) i!1132 k!1914) (size!17296 a!3118)))))

(declare-fun b!561461 () Bool)

(assert (=> b!561461 (= e!323528 (= (seekEntryOrOpen!0 lt!255521 lt!255519 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52660 lt!255523) (index!23753 lt!255523) (index!23753 lt!255523) lt!255521 lt!255519 mask!3119)))))

(declare-fun b!561462 () Bool)

(assert (=> b!561462 (= e!323531 (not true))))

(assert (=> b!561462 e!323533))

(declare-fun res!352606 () Bool)

(assert (=> b!561462 (=> (not res!352606) (not e!323533))))

(assert (=> b!561462 (= res!352606 (= lt!255520 (Found!5381 j!142)))))

(assert (=> b!561462 (= lt!255520 (seekEntryOrOpen!0 (select (arr!16932 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561462 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17536 0))(
  ( (Unit!17537) )
))
(declare-fun lt!255522 () Unit!17536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17536)

(assert (=> b!561462 (= lt!255522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561452 () Bool)

(assert (=> b!561452 (= e!323530 e!323529)))

(declare-fun res!352608 () Bool)

(assert (=> b!561452 (=> res!352608 e!323529)))

(declare-fun lt!255526 () (_ BitVec 64))

(assert (=> b!561452 (= res!352608 (or (= lt!255526 (select (arr!16932 a!3118) j!142)) (= lt!255526 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561452 (= lt!255526 (select (arr!16932 a!3118) (index!23753 lt!255523)))))

(declare-fun res!352605 () Bool)

(assert (=> start!51398 (=> (not res!352605) (not e!323535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51398 (= res!352605 (validMask!0 mask!3119))))

(assert (=> start!51398 e!323535))

(assert (=> start!51398 true))

(declare-fun array_inv!12728 (array!35263) Bool)

(assert (=> start!51398 (array_inv!12728 a!3118)))

(declare-fun b!561463 () Bool)

(declare-fun res!352615 () Bool)

(assert (=> b!561463 (=> (not res!352615) (not e!323535))))

(declare-fun arrayContainsKey!0 (array!35263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561463 (= res!352615 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561464 () Bool)

(declare-fun res!352607 () Bool)

(assert (=> b!561464 (=> (not res!352607) (not e!323535))))

(assert (=> b!561464 (= res!352607 (and (= (size!17296 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17296 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17296 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51398 res!352605) b!561464))

(assert (= (and b!561464 res!352607) b!561456))

(assert (= (and b!561456 res!352613) b!561455))

(assert (= (and b!561455 res!352614) b!561463))

(assert (= (and b!561463 res!352615) b!561453))

(assert (= (and b!561453 res!352612) b!561457))

(assert (= (and b!561457 res!352616) b!561458))

(assert (= (and b!561458 res!352611) b!561460))

(assert (= (and b!561460 res!352610) b!561462))

(assert (= (and b!561462 res!352606) b!561454))

(assert (= (and b!561454 (not res!352604)) b!561452))

(assert (= (and b!561452 (not res!352608)) b!561459))

(assert (= (and b!561459 res!352609) b!561461))

(declare-fun m!539349 () Bool)

(assert (=> b!561459 m!539349))

(assert (=> b!561459 m!539349))

(declare-fun m!539351 () Bool)

(assert (=> b!561459 m!539351))

(declare-fun m!539353 () Bool)

(assert (=> b!561457 m!539353))

(declare-fun m!539355 () Bool)

(assert (=> b!561461 m!539355))

(declare-fun m!539357 () Bool)

(assert (=> b!561461 m!539357))

(declare-fun m!539359 () Bool)

(assert (=> start!51398 m!539359))

(declare-fun m!539361 () Bool)

(assert (=> start!51398 m!539361))

(assert (=> b!561456 m!539349))

(assert (=> b!561456 m!539349))

(declare-fun m!539363 () Bool)

(assert (=> b!561456 m!539363))

(assert (=> b!561452 m!539349))

(declare-fun m!539365 () Bool)

(assert (=> b!561452 m!539365))

(assert (=> b!561460 m!539349))

(declare-fun m!539367 () Bool)

(assert (=> b!561460 m!539367))

(assert (=> b!561460 m!539349))

(declare-fun m!539369 () Bool)

(assert (=> b!561460 m!539369))

(declare-fun m!539371 () Bool)

(assert (=> b!561460 m!539371))

(declare-fun m!539373 () Bool)

(assert (=> b!561460 m!539373))

(declare-fun m!539375 () Bool)

(assert (=> b!561460 m!539375))

(assert (=> b!561460 m!539349))

(declare-fun m!539377 () Bool)

(assert (=> b!561460 m!539377))

(declare-fun m!539379 () Bool)

(assert (=> b!561463 m!539379))

(declare-fun m!539381 () Bool)

(assert (=> b!561455 m!539381))

(assert (=> b!561462 m!539349))

(assert (=> b!561462 m!539349))

(declare-fun m!539383 () Bool)

(assert (=> b!561462 m!539383))

(declare-fun m!539385 () Bool)

(assert (=> b!561462 m!539385))

(declare-fun m!539387 () Bool)

(assert (=> b!561462 m!539387))

(declare-fun m!539389 () Bool)

(assert (=> b!561453 m!539389))

(declare-fun m!539391 () Bool)

(assert (=> b!561458 m!539391))

(push 1)

