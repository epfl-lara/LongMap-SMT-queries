; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47744 () Bool)

(assert start!47744)

(declare-fun e!306421 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33382 0))(
  ( (array!33383 (arr!16042 (Array (_ BitVec 32) (_ BitVec 64))) (size!16406 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33382)

(declare-fun b!525573 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4465 0))(
  ( (MissingZero!4465 (index!20072 (_ BitVec 32))) (Found!4465 (index!20073 (_ BitVec 32))) (Intermediate!4465 (undefined!5277 Bool) (index!20074 (_ BitVec 32)) (x!49195 (_ BitVec 32))) (Undefined!4465) (MissingVacant!4465 (index!20075 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33382 (_ BitVec 32)) SeekEntryResult!4465)

(assert (=> b!525573 (= e!306421 (= (seekEntryOrOpen!0 (select (arr!16042 a!3235) j!176) a!3235 mask!3524) (Found!4465 j!176)))))

(declare-fun b!525574 () Bool)

(declare-fun res!322373 () Bool)

(declare-fun e!306420 () Bool)

(assert (=> b!525574 (=> (not res!322373) (not e!306420))))

(declare-datatypes ((List!10107 0))(
  ( (Nil!10104) (Cons!10103 (h!11034 (_ BitVec 64)) (t!16327 List!10107)) )
))
(declare-fun arrayNoDuplicates!0 (array!33382 (_ BitVec 32) List!10107) Bool)

(assert (=> b!525574 (= res!322373 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10104))))

(declare-fun b!525575 () Bool)

(declare-fun e!306418 () Bool)

(assert (=> b!525575 (= e!306418 true)))

(declare-fun lt!241546 () SeekEntryResult!4465)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525575 (= (index!20074 lt!241546) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!16471 0))(
  ( (Unit!16472) )
))
(declare-fun lt!241555 () Unit!16471)

(declare-fun lt!241553 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33382 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16471)

(assert (=> b!525575 (= lt!241555 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241553 #b00000000000000000000000000000000 (index!20074 lt!241546) (x!49195 lt!241546) mask!3524))))

(assert (=> b!525575 (and (or (= (select (arr!16042 a!3235) (index!20074 lt!241546)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16042 a!3235) (index!20074 lt!241546)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16042 a!3235) (index!20074 lt!241546)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16042 a!3235) (index!20074 lt!241546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241550 () Unit!16471)

(declare-fun e!306417 () Unit!16471)

(assert (=> b!525575 (= lt!241550 e!306417)))

(declare-fun c!61910 () Bool)

(assert (=> b!525575 (= c!61910 (= (select (arr!16042 a!3235) (index!20074 lt!241546)) (select (arr!16042 a!3235) j!176)))))

(assert (=> b!525575 (and (bvslt (x!49195 lt!241546) #b01111111111111111111111111111110) (or (= (select (arr!16042 a!3235) (index!20074 lt!241546)) (select (arr!16042 a!3235) j!176)) (= (select (arr!16042 a!3235) (index!20074 lt!241546)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16042 a!3235) (index!20074 lt!241546)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525576 () Bool)

(declare-fun res!322365 () Bool)

(declare-fun e!306422 () Bool)

(assert (=> b!525576 (=> (not res!322365) (not e!306422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525576 (= res!322365 (validKeyInArray!0 k0!2280))))

(declare-fun res!322374 () Bool)

(assert (=> start!47744 (=> (not res!322374) (not e!306422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47744 (= res!322374 (validMask!0 mask!3524))))

(assert (=> start!47744 e!306422))

(assert (=> start!47744 true))

(declare-fun array_inv!11901 (array!33382) Bool)

(assert (=> start!47744 (array_inv!11901 a!3235)))

(declare-fun b!525577 () Bool)

(assert (=> b!525577 (= e!306420 (not e!306418))))

(declare-fun res!322369 () Bool)

(assert (=> b!525577 (=> res!322369 e!306418)))

(declare-fun lt!241548 () (_ BitVec 64))

(declare-fun lt!241552 () array!33382)

(declare-fun lt!241551 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33382 (_ BitVec 32)) SeekEntryResult!4465)

(assert (=> b!525577 (= res!322369 (= lt!241546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241551 lt!241548 lt!241552 mask!3524)))))

(assert (=> b!525577 (= lt!241546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241553 (select (arr!16042 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525577 (= lt!241551 (toIndex!0 lt!241548 mask!3524))))

(assert (=> b!525577 (= lt!241548 (select (store (arr!16042 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525577 (= lt!241553 (toIndex!0 (select (arr!16042 a!3235) j!176) mask!3524))))

(assert (=> b!525577 (= lt!241552 (array!33383 (store (arr!16042 a!3235) i!1204 k0!2280) (size!16406 a!3235)))))

(assert (=> b!525577 e!306421))

(declare-fun res!322370 () Bool)

(assert (=> b!525577 (=> (not res!322370) (not e!306421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33382 (_ BitVec 32)) Bool)

(assert (=> b!525577 (= res!322370 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241554 () Unit!16471)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16471)

(assert (=> b!525577 (= lt!241554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525578 () Bool)

(declare-fun res!322371 () Bool)

(assert (=> b!525578 (=> (not res!322371) (not e!306422))))

(assert (=> b!525578 (= res!322371 (and (= (size!16406 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16406 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16406 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525579 () Bool)

(declare-fun res!322364 () Bool)

(assert (=> b!525579 (=> (not res!322364) (not e!306422))))

(declare-fun arrayContainsKey!0 (array!33382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525579 (= res!322364 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525580 () Bool)

(declare-fun res!322366 () Bool)

(assert (=> b!525580 (=> (not res!322366) (not e!306422))))

(assert (=> b!525580 (= res!322366 (validKeyInArray!0 (select (arr!16042 a!3235) j!176)))))

(declare-fun b!525581 () Bool)

(declare-fun Unit!16473 () Unit!16471)

(assert (=> b!525581 (= e!306417 Unit!16473)))

(declare-fun b!525582 () Bool)

(declare-fun res!322375 () Bool)

(assert (=> b!525582 (=> (not res!322375) (not e!306420))))

(assert (=> b!525582 (= res!322375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525583 () Bool)

(declare-fun res!322368 () Bool)

(assert (=> b!525583 (=> res!322368 e!306418)))

(get-info :version)

(assert (=> b!525583 (= res!322368 (or (undefined!5277 lt!241546) (not ((_ is Intermediate!4465) lt!241546))))))

(declare-fun b!525584 () Bool)

(declare-fun e!306419 () Bool)

(assert (=> b!525584 (= e!306419 false)))

(declare-fun b!525585 () Bool)

(assert (=> b!525585 (= e!306422 e!306420)))

(declare-fun res!322372 () Bool)

(assert (=> b!525585 (=> (not res!322372) (not e!306420))))

(declare-fun lt!241549 () SeekEntryResult!4465)

(assert (=> b!525585 (= res!322372 (or (= lt!241549 (MissingZero!4465 i!1204)) (= lt!241549 (MissingVacant!4465 i!1204))))))

(assert (=> b!525585 (= lt!241549 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525586 () Bool)

(declare-fun Unit!16474 () Unit!16471)

(assert (=> b!525586 (= e!306417 Unit!16474)))

(declare-fun lt!241547 () Unit!16471)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33382 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16471)

(assert (=> b!525586 (= lt!241547 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241553 #b00000000000000000000000000000000 (index!20074 lt!241546) (x!49195 lt!241546) mask!3524))))

(declare-fun res!322367 () Bool)

(assert (=> b!525586 (= res!322367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241553 lt!241548 lt!241552 mask!3524) (Intermediate!4465 false (index!20074 lt!241546) (x!49195 lt!241546))))))

(assert (=> b!525586 (=> (not res!322367) (not e!306419))))

(assert (=> b!525586 e!306419))

(assert (= (and start!47744 res!322374) b!525578))

(assert (= (and b!525578 res!322371) b!525580))

(assert (= (and b!525580 res!322366) b!525576))

(assert (= (and b!525576 res!322365) b!525579))

(assert (= (and b!525579 res!322364) b!525585))

(assert (= (and b!525585 res!322372) b!525582))

(assert (= (and b!525582 res!322375) b!525574))

(assert (= (and b!525574 res!322373) b!525577))

(assert (= (and b!525577 res!322370) b!525573))

(assert (= (and b!525577 (not res!322369)) b!525583))

(assert (= (and b!525583 (not res!322368)) b!525575))

(assert (= (and b!525575 c!61910) b!525586))

(assert (= (and b!525575 (not c!61910)) b!525581))

(assert (= (and b!525586 res!322367) b!525584))

(declare-fun m!506485 () Bool)

(assert (=> b!525586 m!506485))

(declare-fun m!506487 () Bool)

(assert (=> b!525586 m!506487))

(declare-fun m!506489 () Bool)

(assert (=> b!525576 m!506489))

(declare-fun m!506491 () Bool)

(assert (=> b!525580 m!506491))

(assert (=> b!525580 m!506491))

(declare-fun m!506493 () Bool)

(assert (=> b!525580 m!506493))

(declare-fun m!506495 () Bool)

(assert (=> b!525577 m!506495))

(declare-fun m!506497 () Bool)

(assert (=> b!525577 m!506497))

(declare-fun m!506499 () Bool)

(assert (=> b!525577 m!506499))

(assert (=> b!525577 m!506491))

(declare-fun m!506501 () Bool)

(assert (=> b!525577 m!506501))

(declare-fun m!506503 () Bool)

(assert (=> b!525577 m!506503))

(assert (=> b!525577 m!506491))

(declare-fun m!506505 () Bool)

(assert (=> b!525577 m!506505))

(declare-fun m!506507 () Bool)

(assert (=> b!525577 m!506507))

(declare-fun m!506509 () Bool)

(assert (=> b!525577 m!506509))

(assert (=> b!525577 m!506491))

(declare-fun m!506511 () Bool)

(assert (=> b!525582 m!506511))

(declare-fun m!506513 () Bool)

(assert (=> b!525579 m!506513))

(assert (=> b!525573 m!506491))

(assert (=> b!525573 m!506491))

(declare-fun m!506515 () Bool)

(assert (=> b!525573 m!506515))

(declare-fun m!506517 () Bool)

(assert (=> b!525574 m!506517))

(declare-fun m!506519 () Bool)

(assert (=> start!47744 m!506519))

(declare-fun m!506521 () Bool)

(assert (=> start!47744 m!506521))

(declare-fun m!506523 () Bool)

(assert (=> b!525585 m!506523))

(declare-fun m!506525 () Bool)

(assert (=> b!525575 m!506525))

(declare-fun m!506527 () Bool)

(assert (=> b!525575 m!506527))

(assert (=> b!525575 m!506491))

(check-sat (not b!525577) (not b!525576) (not b!525575) (not b!525574) (not b!525579) (not b!525582) (not start!47744) (not b!525585) (not b!525573) (not b!525580) (not b!525586))
(check-sat)
