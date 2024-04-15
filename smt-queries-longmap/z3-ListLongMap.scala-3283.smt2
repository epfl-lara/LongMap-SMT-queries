; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45630 () Bool)

(assert start!45630)

(declare-fun b!503028 () Bool)

(declare-fun res!304494 () Bool)

(declare-fun e!294582 () Bool)

(assert (=> b!503028 (=> (not res!304494) (not e!294582))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32396 0))(
  ( (array!32397 (arr!15578 (Array (_ BitVec 32) (_ BitVec 64))) (size!15943 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32396)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503028 (= res!304494 (and (= (size!15943 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15943 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15943 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503029 () Bool)

(declare-fun res!304487 () Bool)

(assert (=> b!503029 (=> (not res!304487) (not e!294582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503029 (= res!304487 (validKeyInArray!0 (select (arr!15578 a!3235) j!176)))))

(declare-fun b!503030 () Bool)

(declare-fun res!304492 () Bool)

(declare-fun e!294576 () Bool)

(assert (=> b!503030 (=> (not res!304492) (not e!294576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32396 (_ BitVec 32)) Bool)

(assert (=> b!503030 (= res!304492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-datatypes ((SeekEntryResult!4042 0))(
  ( (MissingZero!4042 (index!18356 (_ BitVec 32))) (Found!4042 (index!18357 (_ BitVec 32))) (Intermediate!4042 (undefined!4854 Bool) (index!18358 (_ BitVec 32)) (x!47390 (_ BitVec 32))) (Undefined!4042) (MissingVacant!4042 (index!18359 (_ BitVec 32))) )
))
(declare-fun lt!228701 () SeekEntryResult!4042)

(declare-fun e!294579 () Bool)

(declare-fun lt!228707 () (_ BitVec 32))

(declare-fun b!503031 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32396 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!503031 (= e!294579 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228707 (index!18358 lt!228701) (select (arr!15578 a!3235) j!176) a!3235 mask!3524) (Found!4042 j!176))))))

(declare-fun res!304491 () Bool)

(assert (=> start!45630 (=> (not res!304491) (not e!294582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45630 (= res!304491 (validMask!0 mask!3524))))

(assert (=> start!45630 e!294582))

(assert (=> start!45630 true))

(declare-fun array_inv!11461 (array!32396) Bool)

(assert (=> start!45630 (array_inv!11461 a!3235)))

(declare-fun b!503032 () Bool)

(declare-fun res!304495 () Bool)

(assert (=> b!503032 (=> (not res!304495) (not e!294582))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!503032 (= res!304495 (validKeyInArray!0 k0!2280))))

(declare-fun b!503033 () Bool)

(declare-fun res!304496 () Bool)

(assert (=> b!503033 (=> (not res!304496) (not e!294576))))

(declare-datatypes ((List!9775 0))(
  ( (Nil!9772) (Cons!9771 (h!10648 (_ BitVec 64)) (t!15994 List!9775)) )
))
(declare-fun arrayNoDuplicates!0 (array!32396 (_ BitVec 32) List!9775) Bool)

(assert (=> b!503033 (= res!304496 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9772))))

(declare-fun e!294575 () Bool)

(declare-fun b!503034 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32396 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!503034 (= e!294575 (= (seekEntryOrOpen!0 (select (arr!15578 a!3235) j!176) a!3235 mask!3524) (Found!4042 j!176)))))

(declare-fun b!503035 () Bool)

(declare-fun res!304486 () Bool)

(declare-fun e!294580 () Bool)

(assert (=> b!503035 (=> res!304486 e!294580)))

(get-info :version)

(assert (=> b!503035 (= res!304486 (or (undefined!4854 lt!228701) (not ((_ is Intermediate!4042) lt!228701))))))

(declare-fun b!503036 () Bool)

(declare-fun res!304488 () Bool)

(assert (=> b!503036 (=> (not res!304488) (not e!294582))))

(declare-fun arrayContainsKey!0 (array!32396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503036 (= res!304488 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503037 () Bool)

(declare-fun e!294577 () Bool)

(assert (=> b!503037 (= e!294577 true)))

(declare-fun lt!228702 () SeekEntryResult!4042)

(declare-fun lt!228705 () array!32396)

(declare-fun lt!228709 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32396 (_ BitVec 32)) SeekEntryResult!4042)

(assert (=> b!503037 (= lt!228702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228707 lt!228709 lt!228705 mask!3524))))

(declare-fun b!503038 () Bool)

(declare-fun e!294578 () Bool)

(assert (=> b!503038 (= e!294578 false)))

(declare-fun b!503039 () Bool)

(assert (=> b!503039 (= e!294580 e!294577)))

(declare-fun res!304498 () Bool)

(assert (=> b!503039 (=> res!304498 e!294577)))

(assert (=> b!503039 (= res!304498 (or (bvsgt (x!47390 lt!228701) #b01111111111111111111111111111110) (bvslt lt!228707 #b00000000000000000000000000000000) (bvsge lt!228707 (size!15943 a!3235)) (bvslt (index!18358 lt!228701) #b00000000000000000000000000000000) (bvsge (index!18358 lt!228701) (size!15943 a!3235)) (not (= lt!228701 (Intermediate!4042 false (index!18358 lt!228701) (x!47390 lt!228701))))))))

(assert (=> b!503039 (= (index!18358 lt!228701) i!1204)))

(declare-datatypes ((Unit!15238 0))(
  ( (Unit!15239) )
))
(declare-fun lt!228704 () Unit!15238)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32396 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15238)

(assert (=> b!503039 (= lt!228704 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228707 #b00000000000000000000000000000000 (index!18358 lt!228701) (x!47390 lt!228701) mask!3524))))

(assert (=> b!503039 (and (or (= (select (arr!15578 a!3235) (index!18358 lt!228701)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15578 a!3235) (index!18358 lt!228701)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15578 a!3235) (index!18358 lt!228701)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15578 a!3235) (index!18358 lt!228701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228708 () Unit!15238)

(declare-fun e!294581 () Unit!15238)

(assert (=> b!503039 (= lt!228708 e!294581)))

(declare-fun c!59550 () Bool)

(assert (=> b!503039 (= c!59550 (= (select (arr!15578 a!3235) (index!18358 lt!228701)) (select (arr!15578 a!3235) j!176)))))

(assert (=> b!503039 (and (bvslt (x!47390 lt!228701) #b01111111111111111111111111111110) (or (= (select (arr!15578 a!3235) (index!18358 lt!228701)) (select (arr!15578 a!3235) j!176)) (= (select (arr!15578 a!3235) (index!18358 lt!228701)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15578 a!3235) (index!18358 lt!228701)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503040 () Bool)

(assert (=> b!503040 (= e!294576 (not e!294580))))

(declare-fun res!304497 () Bool)

(assert (=> b!503040 (=> res!304497 e!294580)))

(declare-fun lt!228703 () (_ BitVec 32))

(assert (=> b!503040 (= res!304497 (= lt!228701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228703 lt!228709 lt!228705 mask!3524)))))

(assert (=> b!503040 (= lt!228701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228707 (select (arr!15578 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503040 (= lt!228703 (toIndex!0 lt!228709 mask!3524))))

(assert (=> b!503040 (= lt!228709 (select (store (arr!15578 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503040 (= lt!228707 (toIndex!0 (select (arr!15578 a!3235) j!176) mask!3524))))

(assert (=> b!503040 (= lt!228705 (array!32397 (store (arr!15578 a!3235) i!1204 k0!2280) (size!15943 a!3235)))))

(assert (=> b!503040 e!294575))

(declare-fun res!304489 () Bool)

(assert (=> b!503040 (=> (not res!304489) (not e!294575))))

(assert (=> b!503040 (= res!304489 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228699 () Unit!15238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15238)

(assert (=> b!503040 (= lt!228699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503041 () Bool)

(declare-fun Unit!15240 () Unit!15238)

(assert (=> b!503041 (= e!294581 Unit!15240)))

(declare-fun lt!228700 () Unit!15238)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32396 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15238)

(assert (=> b!503041 (= lt!228700 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228707 #b00000000000000000000000000000000 (index!18358 lt!228701) (x!47390 lt!228701) mask!3524))))

(declare-fun res!304499 () Bool)

(assert (=> b!503041 (= res!304499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228707 lt!228709 lt!228705 mask!3524) (Intermediate!4042 false (index!18358 lt!228701) (x!47390 lt!228701))))))

(assert (=> b!503041 (=> (not res!304499) (not e!294578))))

(assert (=> b!503041 e!294578))

(declare-fun b!503042 () Bool)

(declare-fun res!304493 () Bool)

(assert (=> b!503042 (=> res!304493 e!294577)))

(assert (=> b!503042 (= res!304493 e!294579)))

(declare-fun res!304485 () Bool)

(assert (=> b!503042 (=> (not res!304485) (not e!294579))))

(assert (=> b!503042 (= res!304485 (bvsgt #b00000000000000000000000000000000 (x!47390 lt!228701)))))

(declare-fun b!503043 () Bool)

(declare-fun Unit!15241 () Unit!15238)

(assert (=> b!503043 (= e!294581 Unit!15241)))

(declare-fun b!503044 () Bool)

(assert (=> b!503044 (= e!294582 e!294576)))

(declare-fun res!304490 () Bool)

(assert (=> b!503044 (=> (not res!304490) (not e!294576))))

(declare-fun lt!228706 () SeekEntryResult!4042)

(assert (=> b!503044 (= res!304490 (or (= lt!228706 (MissingZero!4042 i!1204)) (= lt!228706 (MissingVacant!4042 i!1204))))))

(assert (=> b!503044 (= lt!228706 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45630 res!304491) b!503028))

(assert (= (and b!503028 res!304494) b!503029))

(assert (= (and b!503029 res!304487) b!503032))

(assert (= (and b!503032 res!304495) b!503036))

(assert (= (and b!503036 res!304488) b!503044))

(assert (= (and b!503044 res!304490) b!503030))

(assert (= (and b!503030 res!304492) b!503033))

(assert (= (and b!503033 res!304496) b!503040))

(assert (= (and b!503040 res!304489) b!503034))

(assert (= (and b!503040 (not res!304497)) b!503035))

(assert (= (and b!503035 (not res!304486)) b!503039))

(assert (= (and b!503039 c!59550) b!503041))

(assert (= (and b!503039 (not c!59550)) b!503043))

(assert (= (and b!503041 res!304499) b!503038))

(assert (= (and b!503039 (not res!304498)) b!503042))

(assert (= (and b!503042 res!304485) b!503031))

(assert (= (and b!503042 (not res!304493)) b!503037))

(declare-fun m!483397 () Bool)

(assert (=> b!503029 m!483397))

(assert (=> b!503029 m!483397))

(declare-fun m!483399 () Bool)

(assert (=> b!503029 m!483399))

(declare-fun m!483401 () Bool)

(assert (=> b!503039 m!483401))

(declare-fun m!483403 () Bool)

(assert (=> b!503039 m!483403))

(assert (=> b!503039 m!483397))

(declare-fun m!483405 () Bool)

(assert (=> b!503033 m!483405))

(declare-fun m!483407 () Bool)

(assert (=> start!45630 m!483407))

(declare-fun m!483409 () Bool)

(assert (=> start!45630 m!483409))

(declare-fun m!483411 () Bool)

(assert (=> b!503030 m!483411))

(declare-fun m!483413 () Bool)

(assert (=> b!503041 m!483413))

(declare-fun m!483415 () Bool)

(assert (=> b!503041 m!483415))

(declare-fun m!483417 () Bool)

(assert (=> b!503032 m!483417))

(assert (=> b!503037 m!483415))

(assert (=> b!503034 m!483397))

(assert (=> b!503034 m!483397))

(declare-fun m!483419 () Bool)

(assert (=> b!503034 m!483419))

(declare-fun m!483421 () Bool)

(assert (=> b!503044 m!483421))

(declare-fun m!483423 () Bool)

(assert (=> b!503036 m!483423))

(assert (=> b!503031 m!483397))

(assert (=> b!503031 m!483397))

(declare-fun m!483425 () Bool)

(assert (=> b!503031 m!483425))

(declare-fun m!483427 () Bool)

(assert (=> b!503040 m!483427))

(declare-fun m!483429 () Bool)

(assert (=> b!503040 m!483429))

(declare-fun m!483431 () Bool)

(assert (=> b!503040 m!483431))

(declare-fun m!483433 () Bool)

(assert (=> b!503040 m!483433))

(assert (=> b!503040 m!483397))

(declare-fun m!483435 () Bool)

(assert (=> b!503040 m!483435))

(assert (=> b!503040 m!483397))

(declare-fun m!483437 () Bool)

(assert (=> b!503040 m!483437))

(assert (=> b!503040 m!483397))

(declare-fun m!483439 () Bool)

(assert (=> b!503040 m!483439))

(declare-fun m!483441 () Bool)

(assert (=> b!503040 m!483441))

(check-sat (not b!503044) (not b!503040) (not b!503033) (not b!503034) (not b!503032) (not start!45630) (not b!503029) (not b!503041) (not b!503030) (not b!503037) (not b!503039) (not b!503036) (not b!503031))
(check-sat)
