; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45728 () Bool)

(assert start!45728)

(declare-fun b!505492 () Bool)

(declare-fun e!295909 () Bool)

(assert (=> b!505492 (= e!295909 false)))

(declare-fun b!505493 () Bool)

(declare-fun res!306556 () Bool)

(declare-fun e!295915 () Bool)

(assert (=> b!505493 (=> res!306556 e!295915)))

(declare-fun lt!230407 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32484 0))(
  ( (array!32485 (arr!15622 (Array (_ BitVec 32) (_ BitVec 64))) (size!15986 (_ BitVec 32))) )
))
(declare-fun lt!230402 () array!32484)

(declare-fun lt!230404 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4089 0))(
  ( (MissingZero!4089 (index!18544 (_ BitVec 32))) (Found!4089 (index!18545 (_ BitVec 32))) (Intermediate!4089 (undefined!4901 Bool) (index!18546 (_ BitVec 32)) (x!47554 (_ BitVec 32))) (Undefined!4089) (MissingVacant!4089 (index!18547 (_ BitVec 32))) )
))
(declare-fun lt!230408 () SeekEntryResult!4089)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32484 (_ BitVec 32)) SeekEntryResult!4089)

(assert (=> b!505493 (= res!306556 (not (= lt!230408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230404 lt!230407 lt!230402 mask!3524))))))

(declare-fun b!505494 () Bool)

(declare-datatypes ((Unit!15432 0))(
  ( (Unit!15433) )
))
(declare-fun e!295912 () Unit!15432)

(declare-fun Unit!15434 () Unit!15432)

(assert (=> b!505494 (= e!295912 Unit!15434)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32484)

(declare-fun lt!230405 () Unit!15432)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230398 () SeekEntryResult!4089)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15432)

(assert (=> b!505494 (= lt!230405 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230404 #b00000000000000000000000000000000 (index!18546 lt!230398) (x!47554 lt!230398) mask!3524))))

(declare-fun res!306563 () Bool)

(assert (=> b!505494 (= res!306563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230404 lt!230407 lt!230402 mask!3524) (Intermediate!4089 false (index!18546 lt!230398) (x!47554 lt!230398))))))

(assert (=> b!505494 (=> (not res!306563) (not e!295909))))

(assert (=> b!505494 e!295909))

(declare-fun b!505495 () Bool)

(declare-fun e!295910 () Bool)

(declare-fun e!295911 () Bool)

(assert (=> b!505495 (= e!295910 (not e!295911))))

(declare-fun res!306553 () Bool)

(assert (=> b!505495 (=> res!306553 e!295911)))

(get-info :version)

(assert (=> b!505495 (= res!306553 (or (= lt!230398 lt!230408) (undefined!4901 lt!230398) (not ((_ is Intermediate!4089) lt!230398))))))

(declare-fun lt!230400 () (_ BitVec 32))

(assert (=> b!505495 (= lt!230408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230400 lt!230407 lt!230402 mask!3524))))

(assert (=> b!505495 (= lt!230398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230404 (select (arr!15622 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505495 (= lt!230400 (toIndex!0 lt!230407 mask!3524))))

(assert (=> b!505495 (= lt!230407 (select (store (arr!15622 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505495 (= lt!230404 (toIndex!0 (select (arr!15622 a!3235) j!176) mask!3524))))

(assert (=> b!505495 (= lt!230402 (array!32485 (store (arr!15622 a!3235) i!1204 k0!2280) (size!15986 a!3235)))))

(declare-fun lt!230406 () SeekEntryResult!4089)

(assert (=> b!505495 (= lt!230406 (Found!4089 j!176))))

(declare-fun e!295917 () Bool)

(assert (=> b!505495 e!295917))

(declare-fun res!306550 () Bool)

(assert (=> b!505495 (=> (not res!306550) (not e!295917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32484 (_ BitVec 32)) Bool)

(assert (=> b!505495 (= res!306550 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230399 () Unit!15432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15432)

(assert (=> b!505495 (= lt!230399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505496 () Bool)

(declare-fun res!306559 () Bool)

(declare-fun e!295913 () Bool)

(assert (=> b!505496 (=> (not res!306559) (not e!295913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505496 (= res!306559 (validKeyInArray!0 (select (arr!15622 a!3235) j!176)))))

(declare-fun b!505497 () Bool)

(declare-fun res!306549 () Bool)

(assert (=> b!505497 (=> (not res!306549) (not e!295910))))

(declare-datatypes ((List!9780 0))(
  ( (Nil!9777) (Cons!9776 (h!10653 (_ BitVec 64)) (t!16008 List!9780)) )
))
(declare-fun arrayNoDuplicates!0 (array!32484 (_ BitVec 32) List!9780) Bool)

(assert (=> b!505497 (= res!306549 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9777))))

(declare-fun b!505499 () Bool)

(declare-fun res!306554 () Bool)

(assert (=> b!505499 (=> (not res!306554) (not e!295913))))

(assert (=> b!505499 (= res!306554 (validKeyInArray!0 k0!2280))))

(declare-fun b!505500 () Bool)

(assert (=> b!505500 (= e!295915 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32484 (_ BitVec 32)) SeekEntryResult!4089)

(assert (=> b!505500 (= (seekEntryOrOpen!0 lt!230407 lt!230402 mask!3524) lt!230406)))

(declare-fun lt!230409 () Unit!15432)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15432)

(assert (=> b!505500 (= lt!230409 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230404 #b00000000000000000000000000000000 (index!18546 lt!230398) (x!47554 lt!230398) mask!3524))))

(declare-fun b!505501 () Bool)

(declare-fun res!306561 () Bool)

(assert (=> b!505501 (=> (not res!306561) (not e!295910))))

(assert (=> b!505501 (= res!306561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505502 () Bool)

(declare-fun res!306558 () Bool)

(assert (=> b!505502 (=> (not res!306558) (not e!295913))))

(declare-fun arrayContainsKey!0 (array!32484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505502 (= res!306558 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505503 () Bool)

(assert (=> b!505503 (= e!295911 e!295915)))

(declare-fun res!306557 () Bool)

(assert (=> b!505503 (=> res!306557 e!295915)))

(assert (=> b!505503 (= res!306557 (or (bvsgt (x!47554 lt!230398) #b01111111111111111111111111111110) (bvslt lt!230404 #b00000000000000000000000000000000) (bvsge lt!230404 (size!15986 a!3235)) (bvslt (index!18546 lt!230398) #b00000000000000000000000000000000) (bvsge (index!18546 lt!230398) (size!15986 a!3235)) (not (= lt!230398 (Intermediate!4089 false (index!18546 lt!230398) (x!47554 lt!230398))))))))

(assert (=> b!505503 (= (index!18546 lt!230398) i!1204)))

(declare-fun lt!230410 () Unit!15432)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15432)

(assert (=> b!505503 (= lt!230410 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230404 #b00000000000000000000000000000000 (index!18546 lt!230398) (x!47554 lt!230398) mask!3524))))

(assert (=> b!505503 (and (or (= (select (arr!15622 a!3235) (index!18546 lt!230398)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15622 a!3235) (index!18546 lt!230398)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15622 a!3235) (index!18546 lt!230398)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15622 a!3235) (index!18546 lt!230398)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230401 () Unit!15432)

(assert (=> b!505503 (= lt!230401 e!295912)))

(declare-fun c!59750 () Bool)

(assert (=> b!505503 (= c!59750 (= (select (arr!15622 a!3235) (index!18546 lt!230398)) (select (arr!15622 a!3235) j!176)))))

(assert (=> b!505503 (and (bvslt (x!47554 lt!230398) #b01111111111111111111111111111110) (or (= (select (arr!15622 a!3235) (index!18546 lt!230398)) (select (arr!15622 a!3235) j!176)) (= (select (arr!15622 a!3235) (index!18546 lt!230398)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15622 a!3235) (index!18546 lt!230398)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505504 () Bool)

(declare-fun res!306560 () Bool)

(assert (=> b!505504 (=> res!306560 e!295915)))

(declare-fun e!295916 () Bool)

(assert (=> b!505504 (= res!306560 e!295916)))

(declare-fun res!306551 () Bool)

(assert (=> b!505504 (=> (not res!306551) (not e!295916))))

(assert (=> b!505504 (= res!306551 (bvsgt #b00000000000000000000000000000000 (x!47554 lt!230398)))))

(declare-fun b!505505 () Bool)

(declare-fun Unit!15435 () Unit!15432)

(assert (=> b!505505 (= e!295912 Unit!15435)))

(declare-fun b!505506 () Bool)

(assert (=> b!505506 (= e!295913 e!295910)))

(declare-fun res!306555 () Bool)

(assert (=> b!505506 (=> (not res!306555) (not e!295910))))

(declare-fun lt!230403 () SeekEntryResult!4089)

(assert (=> b!505506 (= res!306555 (or (= lt!230403 (MissingZero!4089 i!1204)) (= lt!230403 (MissingVacant!4089 i!1204))))))

(assert (=> b!505506 (= lt!230403 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505507 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32484 (_ BitVec 32)) SeekEntryResult!4089)

(assert (=> b!505507 (= e!295916 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230404 (index!18546 lt!230398) (select (arr!15622 a!3235) j!176) a!3235 mask!3524) lt!230406)))))

(declare-fun b!505508 () Bool)

(assert (=> b!505508 (= e!295917 (= (seekEntryOrOpen!0 (select (arr!15622 a!3235) j!176) a!3235 mask!3524) (Found!4089 j!176)))))

(declare-fun b!505498 () Bool)

(declare-fun res!306552 () Bool)

(assert (=> b!505498 (=> (not res!306552) (not e!295913))))

(assert (=> b!505498 (= res!306552 (and (= (size!15986 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15986 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15986 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!306562 () Bool)

(assert (=> start!45728 (=> (not res!306562) (not e!295913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45728 (= res!306562 (validMask!0 mask!3524))))

(assert (=> start!45728 e!295913))

(assert (=> start!45728 true))

(declare-fun array_inv!11418 (array!32484) Bool)

(assert (=> start!45728 (array_inv!11418 a!3235)))

(assert (= (and start!45728 res!306562) b!505498))

(assert (= (and b!505498 res!306552) b!505496))

(assert (= (and b!505496 res!306559) b!505499))

(assert (= (and b!505499 res!306554) b!505502))

(assert (= (and b!505502 res!306558) b!505506))

(assert (= (and b!505506 res!306555) b!505501))

(assert (= (and b!505501 res!306561) b!505497))

(assert (= (and b!505497 res!306549) b!505495))

(assert (= (and b!505495 res!306550) b!505508))

(assert (= (and b!505495 (not res!306553)) b!505503))

(assert (= (and b!505503 c!59750) b!505494))

(assert (= (and b!505503 (not c!59750)) b!505505))

(assert (= (and b!505494 res!306563) b!505492))

(assert (= (and b!505503 (not res!306557)) b!505504))

(assert (= (and b!505504 res!306551) b!505507))

(assert (= (and b!505504 (not res!306560)) b!505493))

(assert (= (and b!505493 (not res!306556)) b!505500))

(declare-fun m!486155 () Bool)

(assert (=> b!505502 m!486155))

(declare-fun m!486157 () Bool)

(assert (=> b!505499 m!486157))

(declare-fun m!486159 () Bool)

(assert (=> b!505500 m!486159))

(declare-fun m!486161 () Bool)

(assert (=> b!505500 m!486161))

(declare-fun m!486163 () Bool)

(assert (=> b!505507 m!486163))

(assert (=> b!505507 m!486163))

(declare-fun m!486165 () Bool)

(assert (=> b!505507 m!486165))

(declare-fun m!486167 () Bool)

(assert (=> b!505501 m!486167))

(declare-fun m!486169 () Bool)

(assert (=> b!505497 m!486169))

(assert (=> b!505496 m!486163))

(assert (=> b!505496 m!486163))

(declare-fun m!486171 () Bool)

(assert (=> b!505496 m!486171))

(declare-fun m!486173 () Bool)

(assert (=> b!505494 m!486173))

(declare-fun m!486175 () Bool)

(assert (=> b!505494 m!486175))

(declare-fun m!486177 () Bool)

(assert (=> b!505503 m!486177))

(declare-fun m!486179 () Bool)

(assert (=> b!505503 m!486179))

(assert (=> b!505503 m!486163))

(assert (=> b!505493 m!486175))

(assert (=> b!505495 m!486163))

(declare-fun m!486181 () Bool)

(assert (=> b!505495 m!486181))

(declare-fun m!486183 () Bool)

(assert (=> b!505495 m!486183))

(declare-fun m!486185 () Bool)

(assert (=> b!505495 m!486185))

(declare-fun m!486187 () Bool)

(assert (=> b!505495 m!486187))

(assert (=> b!505495 m!486163))

(declare-fun m!486189 () Bool)

(assert (=> b!505495 m!486189))

(assert (=> b!505495 m!486163))

(declare-fun m!486191 () Bool)

(assert (=> b!505495 m!486191))

(declare-fun m!486193 () Bool)

(assert (=> b!505495 m!486193))

(declare-fun m!486195 () Bool)

(assert (=> b!505495 m!486195))

(declare-fun m!486197 () Bool)

(assert (=> b!505506 m!486197))

(assert (=> b!505508 m!486163))

(assert (=> b!505508 m!486163))

(declare-fun m!486199 () Bool)

(assert (=> b!505508 m!486199))

(declare-fun m!486201 () Bool)

(assert (=> start!45728 m!486201))

(declare-fun m!486203 () Bool)

(assert (=> start!45728 m!486203))

(check-sat (not b!505501) (not start!45728) (not b!505499) (not b!505495) (not b!505494) (not b!505500) (not b!505502) (not b!505496) (not b!505503) (not b!505508) (not b!505497) (not b!505493) (not b!505507) (not b!505506))
(check-sat)
