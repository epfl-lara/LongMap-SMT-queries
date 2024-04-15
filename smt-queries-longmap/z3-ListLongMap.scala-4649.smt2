; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64646 () Bool)

(assert start!64646)

(declare-fun b!728490 () Bool)

(declare-fun e!407765 () Bool)

(declare-fun e!407764 () Bool)

(assert (=> b!728490 (= e!407765 e!407764)))

(declare-fun res!489111 () Bool)

(assert (=> b!728490 (=> (not res!489111) (not e!407764))))

(declare-datatypes ((SeekEntryResult!7273 0))(
  ( (MissingZero!7273 (index!31460 (_ BitVec 32))) (Found!7273 (index!31461 (_ BitVec 32))) (Intermediate!7273 (undefined!8085 Bool) (index!31462 (_ BitVec 32)) (x!62458 (_ BitVec 32))) (Undefined!7273) (MissingVacant!7273 (index!31463 (_ BitVec 32))) )
))
(declare-fun lt!322576 () SeekEntryResult!7273)

(declare-fun lt!322572 () SeekEntryResult!7273)

(assert (=> b!728490 (= res!489111 (= lt!322576 lt!322572))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41112 0))(
  ( (array!41113 (arr!19676 (Array (_ BitVec 32) (_ BitVec 64))) (size!20097 (_ BitVec 32))) )
))
(declare-fun lt!322573 () array!41112)

(declare-fun lt!322574 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41112 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!728490 (= lt!322572 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322574 lt!322573 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728490 (= lt!322576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322574 mask!3328) lt!322574 lt!322573 mask!3328))))

(declare-fun a!3186 () array!41112)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!728490 (= lt!322574 (select (store (arr!19676 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728490 (= lt!322573 (array!41113 (store (arr!19676 a!3186) i!1173 k0!2102) (size!20097 a!3186)))))

(declare-fun e!407760 () Bool)

(declare-fun b!728491 () Bool)

(declare-fun lt!322579 () SeekEntryResult!7273)

(assert (=> b!728491 (= e!407760 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322579))))

(declare-fun b!728493 () Bool)

(declare-fun e!407767 () Bool)

(declare-fun e!407762 () Bool)

(assert (=> b!728493 (= e!407767 e!407762)))

(declare-fun res!489112 () Bool)

(assert (=> b!728493 (=> (not res!489112) (not e!407762))))

(declare-fun lt!322578 () SeekEntryResult!7273)

(assert (=> b!728493 (= res!489112 (or (= lt!322578 (MissingZero!7273 i!1173)) (= lt!322578 (MissingVacant!7273 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41112 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!728493 (= lt!322578 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728494 () Bool)

(declare-fun res!489120 () Bool)

(assert (=> b!728494 (=> (not res!489120) (not e!407765))))

(assert (=> b!728494 (= res!489120 e!407760)))

(declare-fun c!80064 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728494 (= c!80064 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728495 () Bool)

(assert (=> b!728495 (= e!407762 e!407765)))

(declare-fun res!489116 () Bool)

(assert (=> b!728495 (=> (not res!489116) (not e!407765))))

(assert (=> b!728495 (= res!489116 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19676 a!3186) j!159) mask!3328) (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322579))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!728495 (= lt!322579 (Intermediate!7273 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728496 () Bool)

(declare-fun res!489125 () Bool)

(assert (=> b!728496 (=> (not res!489125) (not e!407767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728496 (= res!489125 (validKeyInArray!0 k0!2102))))

(declare-fun lt!322580 () SeekEntryResult!7273)

(declare-fun e!407761 () Bool)

(declare-fun b!728497 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41112 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!728497 (= e!407761 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322580))))

(declare-fun b!728498 () Bool)

(declare-fun res!489123 () Bool)

(assert (=> b!728498 (=> (not res!489123) (not e!407767))))

(declare-fun arrayContainsKey!0 (array!41112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728498 (= res!489123 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728499 () Bool)

(declare-fun res!489126 () Bool)

(assert (=> b!728499 (=> (not res!489126) (not e!407762))))

(declare-datatypes ((List!13717 0))(
  ( (Nil!13714) (Cons!13713 (h!14773 (_ BitVec 64)) (t!20023 List!13717)) )
))
(declare-fun arrayNoDuplicates!0 (array!41112 (_ BitVec 32) List!13717) Bool)

(assert (=> b!728499 (= res!489126 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13714))))

(declare-fun b!728500 () Bool)

(declare-fun res!489115 () Bool)

(assert (=> b!728500 (=> (not res!489115) (not e!407762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41112 (_ BitVec 32)) Bool)

(assert (=> b!728500 (= res!489115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728501 () Bool)

(declare-fun res!489121 () Bool)

(assert (=> b!728501 (=> (not res!489121) (not e!407765))))

(assert (=> b!728501 (= res!489121 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19676 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728502 () Bool)

(assert (=> b!728502 (= e!407760 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) (Found!7273 j!159)))))

(declare-fun b!728503 () Bool)

(declare-fun e!407759 () Bool)

(assert (=> b!728503 (= e!407764 (not e!407759))))

(declare-fun res!489122 () Bool)

(assert (=> b!728503 (=> res!489122 e!407759)))

(get-info :version)

(assert (=> b!728503 (= res!489122 (or (not ((_ is Intermediate!7273) lt!322572)) (bvsge x!1131 (x!62458 lt!322572))))))

(declare-fun e!407766 () Bool)

(assert (=> b!728503 e!407766))

(declare-fun res!489124 () Bool)

(assert (=> b!728503 (=> (not res!489124) (not e!407766))))

(assert (=> b!728503 (= res!489124 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24836 0))(
  ( (Unit!24837) )
))
(declare-fun lt!322577 () Unit!24836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24836)

(assert (=> b!728503 (= lt!322577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!489114 () Bool)

(assert (=> start!64646 (=> (not res!489114) (not e!407767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64646 (= res!489114 (validMask!0 mask!3328))))

(assert (=> start!64646 e!407767))

(assert (=> start!64646 true))

(declare-fun array_inv!15559 (array!41112) Bool)

(assert (=> start!64646 (array_inv!15559 a!3186)))

(declare-fun b!728492 () Bool)

(assert (=> b!728492 (= e!407759 true)))

(declare-fun lt!322575 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728492 (= lt!322575 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728504 () Bool)

(assert (=> b!728504 (= e!407766 e!407761)))

(declare-fun res!489119 () Bool)

(assert (=> b!728504 (=> (not res!489119) (not e!407761))))

(assert (=> b!728504 (= res!489119 (= (seekEntryOrOpen!0 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322580))))

(assert (=> b!728504 (= lt!322580 (Found!7273 j!159))))

(declare-fun b!728505 () Bool)

(declare-fun res!489118 () Bool)

(assert (=> b!728505 (=> (not res!489118) (not e!407762))))

(assert (=> b!728505 (= res!489118 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20097 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20097 a!3186))))))

(declare-fun b!728506 () Bool)

(declare-fun res!489117 () Bool)

(assert (=> b!728506 (=> (not res!489117) (not e!407767))))

(assert (=> b!728506 (= res!489117 (validKeyInArray!0 (select (arr!19676 a!3186) j!159)))))

(declare-fun b!728507 () Bool)

(declare-fun res!489113 () Bool)

(assert (=> b!728507 (=> (not res!489113) (not e!407767))))

(assert (=> b!728507 (= res!489113 (and (= (size!20097 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20097 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20097 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64646 res!489114) b!728507))

(assert (= (and b!728507 res!489113) b!728506))

(assert (= (and b!728506 res!489117) b!728496))

(assert (= (and b!728496 res!489125) b!728498))

(assert (= (and b!728498 res!489123) b!728493))

(assert (= (and b!728493 res!489112) b!728500))

(assert (= (and b!728500 res!489115) b!728499))

(assert (= (and b!728499 res!489126) b!728505))

(assert (= (and b!728505 res!489118) b!728495))

(assert (= (and b!728495 res!489116) b!728501))

(assert (= (and b!728501 res!489121) b!728494))

(assert (= (and b!728494 c!80064) b!728491))

(assert (= (and b!728494 (not c!80064)) b!728502))

(assert (= (and b!728494 res!489120) b!728490))

(assert (= (and b!728490 res!489111) b!728503))

(assert (= (and b!728503 res!489124) b!728504))

(assert (= (and b!728504 res!489119) b!728497))

(assert (= (and b!728503 (not res!489122)) b!728492))

(declare-fun m!681701 () Bool)

(assert (=> b!728500 m!681701))

(declare-fun m!681703 () Bool)

(assert (=> b!728490 m!681703))

(declare-fun m!681705 () Bool)

(assert (=> b!728490 m!681705))

(declare-fun m!681707 () Bool)

(assert (=> b!728490 m!681707))

(declare-fun m!681709 () Bool)

(assert (=> b!728490 m!681709))

(declare-fun m!681711 () Bool)

(assert (=> b!728490 m!681711))

(assert (=> b!728490 m!681707))

(declare-fun m!681713 () Bool)

(assert (=> b!728495 m!681713))

(assert (=> b!728495 m!681713))

(declare-fun m!681715 () Bool)

(assert (=> b!728495 m!681715))

(assert (=> b!728495 m!681715))

(assert (=> b!728495 m!681713))

(declare-fun m!681717 () Bool)

(assert (=> b!728495 m!681717))

(declare-fun m!681719 () Bool)

(assert (=> b!728496 m!681719))

(declare-fun m!681721 () Bool)

(assert (=> b!728492 m!681721))

(assert (=> b!728502 m!681713))

(assert (=> b!728502 m!681713))

(declare-fun m!681723 () Bool)

(assert (=> b!728502 m!681723))

(declare-fun m!681725 () Bool)

(assert (=> b!728501 m!681725))

(assert (=> b!728491 m!681713))

(assert (=> b!728491 m!681713))

(declare-fun m!681727 () Bool)

(assert (=> b!728491 m!681727))

(assert (=> b!728506 m!681713))

(assert (=> b!728506 m!681713))

(declare-fun m!681729 () Bool)

(assert (=> b!728506 m!681729))

(declare-fun m!681731 () Bool)

(assert (=> b!728498 m!681731))

(declare-fun m!681733 () Bool)

(assert (=> b!728499 m!681733))

(declare-fun m!681735 () Bool)

(assert (=> start!64646 m!681735))

(declare-fun m!681737 () Bool)

(assert (=> start!64646 m!681737))

(assert (=> b!728504 m!681713))

(assert (=> b!728504 m!681713))

(declare-fun m!681739 () Bool)

(assert (=> b!728504 m!681739))

(assert (=> b!728497 m!681713))

(assert (=> b!728497 m!681713))

(declare-fun m!681741 () Bool)

(assert (=> b!728497 m!681741))

(declare-fun m!681743 () Bool)

(assert (=> b!728503 m!681743))

(declare-fun m!681745 () Bool)

(assert (=> b!728503 m!681745))

(declare-fun m!681747 () Bool)

(assert (=> b!728493 m!681747))

(check-sat (not b!728493) (not start!64646) (not b!728506) (not b!728502) (not b!728492) (not b!728504) (not b!728495) (not b!728490) (not b!728500) (not b!728496) (not b!728503) (not b!728497) (not b!728499) (not b!728491) (not b!728498))
(check-sat)
