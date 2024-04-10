; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47414 () Bool)

(assert start!47414)

(declare-fun b!521662 () Bool)

(declare-fun e!304329 () Bool)

(declare-fun e!304332 () Bool)

(assert (=> b!521662 (= e!304329 (not e!304332))))

(declare-fun res!319432 () Bool)

(assert (=> b!521662 (=> res!319432 e!304332)))

(declare-datatypes ((array!33240 0))(
  ( (array!33241 (arr!15976 (Array (_ BitVec 32) (_ BitVec 64))) (size!16340 (_ BitVec 32))) )
))
(declare-fun lt!239107 () array!33240)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4443 0))(
  ( (MissingZero!4443 (index!19975 (_ BitVec 32))) (Found!4443 (index!19976 (_ BitVec 32))) (Intermediate!4443 (undefined!5255 Bool) (index!19977 (_ BitVec 32)) (x!48957 (_ BitVec 32))) (Undefined!4443) (MissingVacant!4443 (index!19978 (_ BitVec 32))) )
))
(declare-fun lt!239105 () SeekEntryResult!4443)

(declare-fun lt!239106 () (_ BitVec 32))

(declare-fun lt!239103 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33240 (_ BitVec 32)) SeekEntryResult!4443)

(assert (=> b!521662 (= res!319432 (= lt!239105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239106 lt!239103 lt!239107 mask!3524)))))

(declare-fun lt!239102 () (_ BitVec 32))

(declare-fun a!3235 () array!33240)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521662 (= lt!239105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239102 (select (arr!15976 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521662 (= lt!239106 (toIndex!0 lt!239103 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521662 (= lt!239103 (select (store (arr!15976 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521662 (= lt!239102 (toIndex!0 (select (arr!15976 a!3235) j!176) mask!3524))))

(assert (=> b!521662 (= lt!239107 (array!33241 (store (arr!15976 a!3235) i!1204 k0!2280) (size!16340 a!3235)))))

(declare-fun e!304326 () Bool)

(assert (=> b!521662 e!304326))

(declare-fun res!319436 () Bool)

(assert (=> b!521662 (=> (not res!319436) (not e!304326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33240 (_ BitVec 32)) Bool)

(assert (=> b!521662 (= res!319436 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16224 0))(
  ( (Unit!16225) )
))
(declare-fun lt!239110 () Unit!16224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16224)

(assert (=> b!521662 (= lt!239110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521664 () Bool)

(declare-fun res!319434 () Bool)

(assert (=> b!521664 (=> (not res!319434) (not e!304329))))

(assert (=> b!521664 (= res!319434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521665 () Bool)

(declare-fun e!304331 () Unit!16224)

(declare-fun Unit!16226 () Unit!16224)

(assert (=> b!521665 (= e!304331 Unit!16226)))

(declare-fun b!521666 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33240 (_ BitVec 32)) SeekEntryResult!4443)

(assert (=> b!521666 (= e!304326 (= (seekEntryOrOpen!0 (select (arr!15976 a!3235) j!176) a!3235 mask!3524) (Found!4443 j!176)))))

(declare-fun b!521667 () Bool)

(declare-fun res!319437 () Bool)

(declare-fun e!304328 () Bool)

(assert (=> b!521667 (=> (not res!319437) (not e!304328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521667 (= res!319437 (validKeyInArray!0 k0!2280))))

(declare-fun b!521668 () Bool)

(declare-fun res!319433 () Bool)

(assert (=> b!521668 (=> res!319433 e!304332)))

(get-info :version)

(assert (=> b!521668 (= res!319433 (or (undefined!5255 lt!239105) (not ((_ is Intermediate!4443) lt!239105))))))

(declare-fun b!521669 () Bool)

(declare-fun res!319430 () Bool)

(assert (=> b!521669 (=> (not res!319430) (not e!304328))))

(assert (=> b!521669 (= res!319430 (validKeyInArray!0 (select (arr!15976 a!3235) j!176)))))

(declare-fun b!521670 () Bool)

(declare-fun res!319428 () Bool)

(assert (=> b!521670 (=> (not res!319428) (not e!304328))))

(assert (=> b!521670 (= res!319428 (and (= (size!16340 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16340 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16340 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521671 () Bool)

(declare-fun res!319439 () Bool)

(assert (=> b!521671 (=> (not res!319439) (not e!304329))))

(declare-datatypes ((List!10134 0))(
  ( (Nil!10131) (Cons!10130 (h!11052 (_ BitVec 64)) (t!16362 List!10134)) )
))
(declare-fun arrayNoDuplicates!0 (array!33240 (_ BitVec 32) List!10134) Bool)

(assert (=> b!521671 (= res!319439 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10131))))

(declare-fun b!521663 () Bool)

(declare-fun Unit!16227 () Unit!16224)

(assert (=> b!521663 (= e!304331 Unit!16227)))

(declare-fun lt!239109 () Unit!16224)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33240 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16224)

(assert (=> b!521663 (= lt!239109 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239102 #b00000000000000000000000000000000 (index!19977 lt!239105) (x!48957 lt!239105) mask!3524))))

(declare-fun res!319435 () Bool)

(assert (=> b!521663 (= res!319435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239102 lt!239103 lt!239107 mask!3524) (Intermediate!4443 false (index!19977 lt!239105) (x!48957 lt!239105))))))

(declare-fun e!304327 () Bool)

(assert (=> b!521663 (=> (not res!319435) (not e!304327))))

(assert (=> b!521663 e!304327))

(declare-fun res!319431 () Bool)

(assert (=> start!47414 (=> (not res!319431) (not e!304328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47414 (= res!319431 (validMask!0 mask!3524))))

(assert (=> start!47414 e!304328))

(assert (=> start!47414 true))

(declare-fun array_inv!11772 (array!33240) Bool)

(assert (=> start!47414 (array_inv!11772 a!3235)))

(declare-fun b!521672 () Bool)

(assert (=> b!521672 (= e!304327 false)))

(declare-fun b!521673 () Bool)

(assert (=> b!521673 (= e!304328 e!304329)))

(declare-fun res!319438 () Bool)

(assert (=> b!521673 (=> (not res!319438) (not e!304329))))

(declare-fun lt!239104 () SeekEntryResult!4443)

(assert (=> b!521673 (= res!319438 (or (= lt!239104 (MissingZero!4443 i!1204)) (= lt!239104 (MissingVacant!4443 i!1204))))))

(assert (=> b!521673 (= lt!239104 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521674 () Bool)

(declare-fun res!319429 () Bool)

(assert (=> b!521674 (=> (not res!319429) (not e!304328))))

(declare-fun arrayContainsKey!0 (array!33240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521674 (= res!319429 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521675 () Bool)

(assert (=> b!521675 (= e!304332 true)))

(assert (=> b!521675 (and (or (= (select (arr!15976 a!3235) (index!19977 lt!239105)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15976 a!3235) (index!19977 lt!239105)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15976 a!3235) (index!19977 lt!239105)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15976 a!3235) (index!19977 lt!239105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239108 () Unit!16224)

(assert (=> b!521675 (= lt!239108 e!304331)))

(declare-fun c!61418 () Bool)

(assert (=> b!521675 (= c!61418 (= (select (arr!15976 a!3235) (index!19977 lt!239105)) (select (arr!15976 a!3235) j!176)))))

(assert (=> b!521675 (and (bvslt (x!48957 lt!239105) #b01111111111111111111111111111110) (or (= (select (arr!15976 a!3235) (index!19977 lt!239105)) (select (arr!15976 a!3235) j!176)) (= (select (arr!15976 a!3235) (index!19977 lt!239105)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15976 a!3235) (index!19977 lt!239105)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47414 res!319431) b!521670))

(assert (= (and b!521670 res!319428) b!521669))

(assert (= (and b!521669 res!319430) b!521667))

(assert (= (and b!521667 res!319437) b!521674))

(assert (= (and b!521674 res!319429) b!521673))

(assert (= (and b!521673 res!319438) b!521664))

(assert (= (and b!521664 res!319434) b!521671))

(assert (= (and b!521671 res!319439) b!521662))

(assert (= (and b!521662 res!319436) b!521666))

(assert (= (and b!521662 (not res!319432)) b!521668))

(assert (= (and b!521668 (not res!319433)) b!521675))

(assert (= (and b!521675 c!61418) b!521663))

(assert (= (and b!521675 (not c!61418)) b!521665))

(assert (= (and b!521663 res!319435) b!521672))

(declare-fun m!502575 () Bool)

(assert (=> b!521666 m!502575))

(assert (=> b!521666 m!502575))

(declare-fun m!502577 () Bool)

(assert (=> b!521666 m!502577))

(declare-fun m!502579 () Bool)

(assert (=> b!521673 m!502579))

(declare-fun m!502581 () Bool)

(assert (=> b!521662 m!502581))

(declare-fun m!502583 () Bool)

(assert (=> b!521662 m!502583))

(assert (=> b!521662 m!502575))

(declare-fun m!502585 () Bool)

(assert (=> b!521662 m!502585))

(declare-fun m!502587 () Bool)

(assert (=> b!521662 m!502587))

(assert (=> b!521662 m!502575))

(declare-fun m!502589 () Bool)

(assert (=> b!521662 m!502589))

(assert (=> b!521662 m!502575))

(declare-fun m!502591 () Bool)

(assert (=> b!521662 m!502591))

(declare-fun m!502593 () Bool)

(assert (=> b!521662 m!502593))

(declare-fun m!502595 () Bool)

(assert (=> b!521662 m!502595))

(declare-fun m!502597 () Bool)

(assert (=> b!521663 m!502597))

(declare-fun m!502599 () Bool)

(assert (=> b!521663 m!502599))

(declare-fun m!502601 () Bool)

(assert (=> b!521671 m!502601))

(declare-fun m!502603 () Bool)

(assert (=> b!521664 m!502603))

(declare-fun m!502605 () Bool)

(assert (=> start!47414 m!502605))

(declare-fun m!502607 () Bool)

(assert (=> start!47414 m!502607))

(declare-fun m!502609 () Bool)

(assert (=> b!521667 m!502609))

(assert (=> b!521669 m!502575))

(assert (=> b!521669 m!502575))

(declare-fun m!502611 () Bool)

(assert (=> b!521669 m!502611))

(declare-fun m!502613 () Bool)

(assert (=> b!521675 m!502613))

(assert (=> b!521675 m!502575))

(declare-fun m!502615 () Bool)

(assert (=> b!521674 m!502615))

(check-sat (not b!521664) (not b!521674) (not start!47414) (not b!521667) (not b!521663) (not b!521671) (not b!521669) (not b!521666) (not b!521662) (not b!521673))
(check-sat)
