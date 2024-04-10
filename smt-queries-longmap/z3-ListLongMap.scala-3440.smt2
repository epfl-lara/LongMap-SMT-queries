; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47762 () Bool)

(assert start!47762)

(declare-fun b!525802 () Bool)

(declare-fun res!322523 () Bool)

(declare-fun e!306544 () Bool)

(assert (=> b!525802 (=> (not res!322523) (not e!306544))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33399 0))(
  ( (array!33400 (arr!16051 (Array (_ BitVec 32) (_ BitVec 64))) (size!16415 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33399)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525802 (= res!322523 (and (= (size!16415 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16415 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16415 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525803 () Bool)

(declare-datatypes ((Unit!16524 0))(
  ( (Unit!16525) )
))
(declare-fun e!306540 () Unit!16524)

(declare-fun Unit!16526 () Unit!16524)

(assert (=> b!525803 (= e!306540 Unit!16526)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!241657 () Unit!16524)

(declare-fun lt!241659 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4518 0))(
  ( (MissingZero!4518 (index!20284 (_ BitVec 32))) (Found!4518 (index!20285 (_ BitVec 32))) (Intermediate!4518 (undefined!5330 Bool) (index!20286 (_ BitVec 32)) (x!49259 (_ BitVec 32))) (Undefined!4518) (MissingVacant!4518 (index!20287 (_ BitVec 32))) )
))
(declare-fun lt!241654 () SeekEntryResult!4518)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33399 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16524)

(assert (=> b!525803 (= lt!241657 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241659 #b00000000000000000000000000000000 (index!20286 lt!241654) (x!49259 lt!241654) mask!3524))))

(declare-fun lt!241662 () (_ BitVec 64))

(declare-fun res!322516 () Bool)

(declare-fun lt!241655 () array!33399)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33399 (_ BitVec 32)) SeekEntryResult!4518)

(assert (=> b!525803 (= res!322516 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241659 lt!241662 lt!241655 mask!3524) (Intermediate!4518 false (index!20286 lt!241654) (x!49259 lt!241654))))))

(declare-fun e!306546 () Bool)

(assert (=> b!525803 (=> (not res!322516) (not e!306546))))

(assert (=> b!525803 e!306546))

(declare-fun res!322518 () Bool)

(assert (=> start!47762 (=> (not res!322518) (not e!306544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47762 (= res!322518 (validMask!0 mask!3524))))

(assert (=> start!47762 e!306544))

(assert (=> start!47762 true))

(declare-fun array_inv!11847 (array!33399) Bool)

(assert (=> start!47762 (array_inv!11847 a!3235)))

(declare-fun b!525804 () Bool)

(assert (=> b!525804 (= e!306546 false)))

(declare-fun b!525805 () Bool)

(declare-fun e!306541 () Bool)

(declare-fun e!306542 () Bool)

(assert (=> b!525805 (= e!306541 (not e!306542))))

(declare-fun res!322520 () Bool)

(assert (=> b!525805 (=> res!322520 e!306542)))

(declare-fun lt!241658 () (_ BitVec 32))

(assert (=> b!525805 (= res!322520 (= lt!241654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241658 lt!241662 lt!241655 mask!3524)))))

(assert (=> b!525805 (= lt!241654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241659 (select (arr!16051 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525805 (= lt!241658 (toIndex!0 lt!241662 mask!3524))))

(assert (=> b!525805 (= lt!241662 (select (store (arr!16051 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525805 (= lt!241659 (toIndex!0 (select (arr!16051 a!3235) j!176) mask!3524))))

(assert (=> b!525805 (= lt!241655 (array!33400 (store (arr!16051 a!3235) i!1204 k0!2280) (size!16415 a!3235)))))

(declare-fun e!306545 () Bool)

(assert (=> b!525805 e!306545))

(declare-fun res!322519 () Bool)

(assert (=> b!525805 (=> (not res!322519) (not e!306545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33399 (_ BitVec 32)) Bool)

(assert (=> b!525805 (= res!322519 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241661 () Unit!16524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16524)

(assert (=> b!525805 (= lt!241661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525806 () Bool)

(declare-fun res!322521 () Bool)

(assert (=> b!525806 (=> (not res!322521) (not e!306544))))

(declare-fun arrayContainsKey!0 (array!33399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525806 (= res!322521 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525807 () Bool)

(declare-fun res!322517 () Bool)

(assert (=> b!525807 (=> (not res!322517) (not e!306541))))

(declare-datatypes ((List!10209 0))(
  ( (Nil!10206) (Cons!10205 (h!11136 (_ BitVec 64)) (t!16437 List!10209)) )
))
(declare-fun arrayNoDuplicates!0 (array!33399 (_ BitVec 32) List!10209) Bool)

(assert (=> b!525807 (= res!322517 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10206))))

(declare-fun b!525808 () Bool)

(declare-fun Unit!16527 () Unit!16524)

(assert (=> b!525808 (= e!306540 Unit!16527)))

(declare-fun b!525809 () Bool)

(assert (=> b!525809 (= e!306544 e!306541)))

(declare-fun res!322526 () Bool)

(assert (=> b!525809 (=> (not res!322526) (not e!306541))))

(declare-fun lt!241660 () SeekEntryResult!4518)

(assert (=> b!525809 (= res!322526 (or (= lt!241660 (MissingZero!4518 i!1204)) (= lt!241660 (MissingVacant!4518 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33399 (_ BitVec 32)) SeekEntryResult!4518)

(assert (=> b!525809 (= lt!241660 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525810 () Bool)

(assert (=> b!525810 (= e!306545 (= (seekEntryOrOpen!0 (select (arr!16051 a!3235) j!176) a!3235 mask!3524) (Found!4518 j!176)))))

(declare-fun b!525811 () Bool)

(declare-fun res!322515 () Bool)

(assert (=> b!525811 (=> (not res!322515) (not e!306544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525811 (= res!322515 (validKeyInArray!0 k0!2280))))

(declare-fun b!525812 () Bool)

(assert (=> b!525812 (= e!306542 true)))

(assert (=> b!525812 (= (index!20286 lt!241654) i!1204)))

(declare-fun lt!241656 () Unit!16524)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33399 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16524)

(assert (=> b!525812 (= lt!241656 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241659 #b00000000000000000000000000000000 (index!20286 lt!241654) (x!49259 lt!241654) mask!3524))))

(assert (=> b!525812 (and (or (= (select (arr!16051 a!3235) (index!20286 lt!241654)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16051 a!3235) (index!20286 lt!241654)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16051 a!3235) (index!20286 lt!241654)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16051 a!3235) (index!20286 lt!241654)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241663 () Unit!16524)

(assert (=> b!525812 (= lt!241663 e!306540)))

(declare-fun c!61949 () Bool)

(assert (=> b!525812 (= c!61949 (= (select (arr!16051 a!3235) (index!20286 lt!241654)) (select (arr!16051 a!3235) j!176)))))

(assert (=> b!525812 (and (bvslt (x!49259 lt!241654) #b01111111111111111111111111111110) (or (= (select (arr!16051 a!3235) (index!20286 lt!241654)) (select (arr!16051 a!3235) j!176)) (= (select (arr!16051 a!3235) (index!20286 lt!241654)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16051 a!3235) (index!20286 lt!241654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525813 () Bool)

(declare-fun res!322525 () Bool)

(assert (=> b!525813 (=> (not res!322525) (not e!306544))))

(assert (=> b!525813 (= res!322525 (validKeyInArray!0 (select (arr!16051 a!3235) j!176)))))

(declare-fun b!525814 () Bool)

(declare-fun res!322524 () Bool)

(assert (=> b!525814 (=> (not res!322524) (not e!306541))))

(assert (=> b!525814 (= res!322524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525815 () Bool)

(declare-fun res!322522 () Bool)

(assert (=> b!525815 (=> res!322522 e!306542)))

(get-info :version)

(assert (=> b!525815 (= res!322522 (or (undefined!5330 lt!241654) (not ((_ is Intermediate!4518) lt!241654))))))

(assert (= (and start!47762 res!322518) b!525802))

(assert (= (and b!525802 res!322523) b!525813))

(assert (= (and b!525813 res!322525) b!525811))

(assert (= (and b!525811 res!322515) b!525806))

(assert (= (and b!525806 res!322521) b!525809))

(assert (= (and b!525809 res!322526) b!525814))

(assert (= (and b!525814 res!322524) b!525807))

(assert (= (and b!525807 res!322517) b!525805))

(assert (= (and b!525805 res!322519) b!525810))

(assert (= (and b!525805 (not res!322520)) b!525815))

(assert (= (and b!525815 (not res!322522)) b!525812))

(assert (= (and b!525812 c!61949) b!525803))

(assert (= (and b!525812 (not c!61949)) b!525808))

(assert (= (and b!525803 res!322516) b!525804))

(declare-fun m!506477 () Bool)

(assert (=> b!525806 m!506477))

(declare-fun m!506479 () Bool)

(assert (=> b!525813 m!506479))

(assert (=> b!525813 m!506479))

(declare-fun m!506481 () Bool)

(assert (=> b!525813 m!506481))

(declare-fun m!506483 () Bool)

(assert (=> b!525809 m!506483))

(declare-fun m!506485 () Bool)

(assert (=> b!525807 m!506485))

(declare-fun m!506487 () Bool)

(assert (=> b!525803 m!506487))

(declare-fun m!506489 () Bool)

(assert (=> b!525803 m!506489))

(declare-fun m!506491 () Bool)

(assert (=> b!525812 m!506491))

(declare-fun m!506493 () Bool)

(assert (=> b!525812 m!506493))

(assert (=> b!525812 m!506479))

(declare-fun m!506495 () Bool)

(assert (=> b!525814 m!506495))

(assert (=> b!525810 m!506479))

(assert (=> b!525810 m!506479))

(declare-fun m!506497 () Bool)

(assert (=> b!525810 m!506497))

(declare-fun m!506499 () Bool)

(assert (=> b!525811 m!506499))

(declare-fun m!506501 () Bool)

(assert (=> start!47762 m!506501))

(declare-fun m!506503 () Bool)

(assert (=> start!47762 m!506503))

(declare-fun m!506505 () Bool)

(assert (=> b!525805 m!506505))

(declare-fun m!506507 () Bool)

(assert (=> b!525805 m!506507))

(declare-fun m!506509 () Bool)

(assert (=> b!525805 m!506509))

(assert (=> b!525805 m!506479))

(declare-fun m!506511 () Bool)

(assert (=> b!525805 m!506511))

(assert (=> b!525805 m!506479))

(declare-fun m!506513 () Bool)

(assert (=> b!525805 m!506513))

(declare-fun m!506515 () Bool)

(assert (=> b!525805 m!506515))

(assert (=> b!525805 m!506479))

(declare-fun m!506517 () Bool)

(assert (=> b!525805 m!506517))

(declare-fun m!506519 () Bool)

(assert (=> b!525805 m!506519))

(check-sat (not b!525810) (not b!525803) (not b!525805) (not b!525812) (not b!525809) (not b!525806) (not start!47762) (not b!525814) (not b!525807) (not b!525813) (not b!525811))
(check-sat)
