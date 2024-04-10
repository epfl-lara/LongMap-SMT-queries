; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67130 () Bool)

(assert start!67130)

(declare-fun b!775497 () Bool)

(declare-fun e!431609 () Bool)

(declare-fun e!431611 () Bool)

(assert (=> b!775497 (= e!431609 e!431611)))

(declare-fun res!524424 () Bool)

(assert (=> b!775497 (=> (not res!524424) (not e!431611))))

(declare-datatypes ((SeekEntryResult!7938 0))(
  ( (MissingZero!7938 (index!34120 (_ BitVec 32))) (Found!7938 (index!34121 (_ BitVec 32))) (Intermediate!7938 (undefined!8750 Bool) (index!34122 (_ BitVec 32)) (x!65065 (_ BitVec 32))) (Undefined!7938) (MissingVacant!7938 (index!34123 (_ BitVec 32))) )
))
(declare-fun lt!345477 () SeekEntryResult!7938)

(declare-fun lt!345469 () SeekEntryResult!7938)

(assert (=> b!775497 (= res!524424 (= lt!345477 lt!345469))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42485 0))(
  ( (array!42486 (arr!20338 (Array (_ BitVec 32) (_ BitVec 64))) (size!20759 (_ BitVec 32))) )
))
(declare-fun lt!345475 () array!42485)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!345473 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42485 (_ BitVec 32)) SeekEntryResult!7938)

(assert (=> b!775497 (= lt!345469 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345473 lt!345475 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775497 (= lt!345477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345473 mask!3328) lt!345473 lt!345475 mask!3328))))

(declare-fun a!3186 () array!42485)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!775497 (= lt!345473 (select (store (arr!20338 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775497 (= lt!345475 (array!42486 (store (arr!20338 a!3186) i!1173 k0!2102) (size!20759 a!3186)))))

(declare-fun lt!345470 () SeekEntryResult!7938)

(declare-fun e!431603 () Bool)

(declare-fun b!775498 () Bool)

(assert (=> b!775498 (= e!431603 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345470))))

(declare-fun b!775500 () Bool)

(declare-fun res!524423 () Bool)

(declare-fun e!431604 () Bool)

(assert (=> b!775500 (=> res!524423 e!431604)))

(declare-fun e!431607 () Bool)

(assert (=> b!775500 (= res!524423 e!431607)))

(declare-fun c!85940 () Bool)

(declare-fun lt!345478 () Bool)

(assert (=> b!775500 (= c!85940 lt!345478)))

(declare-fun b!775501 () Bool)

(declare-fun res!524434 () Bool)

(declare-fun e!431610 () Bool)

(assert (=> b!775501 (=> (not res!524434) (not e!431610))))

(declare-fun arrayContainsKey!0 (array!42485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775501 (= res!524434 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775502 () Bool)

(declare-fun e!431602 () Bool)

(declare-fun e!431608 () Bool)

(assert (=> b!775502 (= e!431602 e!431608)))

(declare-fun res!524425 () Bool)

(assert (=> b!775502 (=> (not res!524425) (not e!431608))))

(declare-fun lt!345467 () SeekEntryResult!7938)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42485 (_ BitVec 32)) SeekEntryResult!7938)

(assert (=> b!775502 (= res!524425 (= (seekEntryOrOpen!0 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345467))))

(assert (=> b!775502 (= lt!345467 (Found!7938 j!159))))

(declare-fun b!775503 () Bool)

(declare-datatypes ((Unit!26766 0))(
  ( (Unit!26767) )
))
(declare-fun e!431601 () Unit!26766)

(declare-fun Unit!26768 () Unit!26766)

(assert (=> b!775503 (= e!431601 Unit!26768)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!345472 () SeekEntryResult!7938)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42485 (_ BitVec 32)) SeekEntryResult!7938)

(assert (=> b!775503 (= lt!345472 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!345468 () SeekEntryResult!7938)

(declare-fun lt!345479 () (_ BitVec 32))

(assert (=> b!775503 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345479 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345468)))

(declare-fun b!775504 () Bool)

(assert (=> b!775504 (= e!431604 true)))

(assert (=> b!775504 (= (seekEntryOrOpen!0 lt!345473 lt!345475 mask!3328) lt!345468)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!345471 () Unit!26766)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26766)

(assert (=> b!775504 (= lt!345471 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345479 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775505 () Bool)

(declare-fun res!524429 () Bool)

(declare-fun e!431605 () Bool)

(assert (=> b!775505 (=> (not res!524429) (not e!431605))))

(assert (=> b!775505 (= res!524429 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20759 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20759 a!3186))))))

(declare-fun b!775506 () Bool)

(declare-fun res!524433 () Bool)

(assert (=> b!775506 (=> res!524433 e!431604)))

(assert (=> b!775506 (= res!524433 (not (= lt!345477 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345479 lt!345473 lt!345475 mask!3328))))))

(declare-fun b!775507 () Bool)

(assert (=> b!775507 (= e!431608 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345467))))

(declare-fun b!775508 () Bool)

(declare-fun e!431606 () Bool)

(assert (=> b!775508 (= e!431606 e!431604)))

(declare-fun res!524430 () Bool)

(assert (=> b!775508 (=> res!524430 e!431604)))

(assert (=> b!775508 (= res!524430 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345479 #b00000000000000000000000000000000) (bvsge lt!345479 (size!20759 a!3186))))))

(declare-fun lt!345476 () Unit!26766)

(assert (=> b!775508 (= lt!345476 e!431601)))

(declare-fun c!85942 () Bool)

(assert (=> b!775508 (= c!85942 lt!345478)))

(assert (=> b!775508 (= lt!345478 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775508 (= lt!345479 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775509 () Bool)

(declare-fun res!524417 () Bool)

(assert (=> b!775509 (=> (not res!524417) (not e!431610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775509 (= res!524417 (validKeyInArray!0 (select (arr!20338 a!3186) j!159)))))

(declare-fun b!775510 () Bool)

(assert (=> b!775510 (= e!431607 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345479 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345468)))))

(declare-fun b!775511 () Bool)

(assert (=> b!775511 (= e!431610 e!431605)))

(declare-fun res!524426 () Bool)

(assert (=> b!775511 (=> (not res!524426) (not e!431605))))

(declare-fun lt!345466 () SeekEntryResult!7938)

(assert (=> b!775511 (= res!524426 (or (= lt!345466 (MissingZero!7938 i!1173)) (= lt!345466 (MissingVacant!7938 i!1173))))))

(assert (=> b!775511 (= lt!345466 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775512 () Bool)

(assert (=> b!775512 (= e!431603 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) (Found!7938 j!159)))))

(declare-fun b!775513 () Bool)

(declare-fun res!524419 () Bool)

(assert (=> b!775513 (=> (not res!524419) (not e!431609))))

(assert (=> b!775513 (= res!524419 e!431603)))

(declare-fun c!85941 () Bool)

(assert (=> b!775513 (= c!85941 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775514 () Bool)

(assert (=> b!775514 (= e!431607 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345479 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345470)))))

(declare-fun b!775515 () Bool)

(declare-fun res!524420 () Bool)

(assert (=> b!775515 (=> (not res!524420) (not e!431609))))

(assert (=> b!775515 (= res!524420 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20338 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775499 () Bool)

(declare-fun Unit!26769 () Unit!26766)

(assert (=> b!775499 (= e!431601 Unit!26769)))

(assert (=> b!775499 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345479 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345470)))

(declare-fun res!524418 () Bool)

(assert (=> start!67130 (=> (not res!524418) (not e!431610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67130 (= res!524418 (validMask!0 mask!3328))))

(assert (=> start!67130 e!431610))

(assert (=> start!67130 true))

(declare-fun array_inv!16134 (array!42485) Bool)

(assert (=> start!67130 (array_inv!16134 a!3186)))

(declare-fun b!775516 () Bool)

(declare-fun res!524428 () Bool)

(assert (=> b!775516 (=> (not res!524428) (not e!431610))))

(assert (=> b!775516 (= res!524428 (validKeyInArray!0 k0!2102))))

(declare-fun b!775517 () Bool)

(declare-fun res!524435 () Bool)

(assert (=> b!775517 (=> (not res!524435) (not e!431610))))

(assert (=> b!775517 (= res!524435 (and (= (size!20759 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20759 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20759 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775518 () Bool)

(declare-fun res!524432 () Bool)

(assert (=> b!775518 (=> (not res!524432) (not e!431605))))

(declare-datatypes ((List!14340 0))(
  ( (Nil!14337) (Cons!14336 (h!15444 (_ BitVec 64)) (t!20655 List!14340)) )
))
(declare-fun arrayNoDuplicates!0 (array!42485 (_ BitVec 32) List!14340) Bool)

(assert (=> b!775518 (= res!524432 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14337))))

(declare-fun b!775519 () Bool)

(assert (=> b!775519 (= e!431611 (not e!431606))))

(declare-fun res!524427 () Bool)

(assert (=> b!775519 (=> res!524427 e!431606)))

(get-info :version)

(assert (=> b!775519 (= res!524427 (or (not ((_ is Intermediate!7938) lt!345469)) (bvsge x!1131 (x!65065 lt!345469))))))

(assert (=> b!775519 (= lt!345468 (Found!7938 j!159))))

(assert (=> b!775519 e!431602))

(declare-fun res!524421 () Bool)

(assert (=> b!775519 (=> (not res!524421) (not e!431602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42485 (_ BitVec 32)) Bool)

(assert (=> b!775519 (= res!524421 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345474 () Unit!26766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26766)

(assert (=> b!775519 (= lt!345474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775520 () Bool)

(declare-fun res!524422 () Bool)

(assert (=> b!775520 (=> (not res!524422) (not e!431605))))

(assert (=> b!775520 (= res!524422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775521 () Bool)

(assert (=> b!775521 (= e!431605 e!431609)))

(declare-fun res!524431 () Bool)

(assert (=> b!775521 (=> (not res!524431) (not e!431609))))

(assert (=> b!775521 (= res!524431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20338 a!3186) j!159) mask!3328) (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345470))))

(assert (=> b!775521 (= lt!345470 (Intermediate!7938 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67130 res!524418) b!775517))

(assert (= (and b!775517 res!524435) b!775509))

(assert (= (and b!775509 res!524417) b!775516))

(assert (= (and b!775516 res!524428) b!775501))

(assert (= (and b!775501 res!524434) b!775511))

(assert (= (and b!775511 res!524426) b!775520))

(assert (= (and b!775520 res!524422) b!775518))

(assert (= (and b!775518 res!524432) b!775505))

(assert (= (and b!775505 res!524429) b!775521))

(assert (= (and b!775521 res!524431) b!775515))

(assert (= (and b!775515 res!524420) b!775513))

(assert (= (and b!775513 c!85941) b!775498))

(assert (= (and b!775513 (not c!85941)) b!775512))

(assert (= (and b!775513 res!524419) b!775497))

(assert (= (and b!775497 res!524424) b!775519))

(assert (= (and b!775519 res!524421) b!775502))

(assert (= (and b!775502 res!524425) b!775507))

(assert (= (and b!775519 (not res!524427)) b!775508))

(assert (= (and b!775508 c!85942) b!775499))

(assert (= (and b!775508 (not c!85942)) b!775503))

(assert (= (and b!775508 (not res!524430)) b!775500))

(assert (= (and b!775500 c!85940) b!775514))

(assert (= (and b!775500 (not c!85940)) b!775510))

(assert (= (and b!775500 (not res!524423)) b!775506))

(assert (= (and b!775506 (not res!524433)) b!775504))

(declare-fun m!719709 () Bool)

(assert (=> b!775512 m!719709))

(assert (=> b!775512 m!719709))

(declare-fun m!719711 () Bool)

(assert (=> b!775512 m!719711))

(declare-fun m!719713 () Bool)

(assert (=> b!775518 m!719713))

(declare-fun m!719715 () Bool)

(assert (=> b!775508 m!719715))

(declare-fun m!719717 () Bool)

(assert (=> b!775511 m!719717))

(assert (=> b!775498 m!719709))

(assert (=> b!775498 m!719709))

(declare-fun m!719719 () Bool)

(assert (=> b!775498 m!719719))

(declare-fun m!719721 () Bool)

(assert (=> b!775504 m!719721))

(declare-fun m!719723 () Bool)

(assert (=> b!775504 m!719723))

(declare-fun m!719725 () Bool)

(assert (=> b!775497 m!719725))

(declare-fun m!719727 () Bool)

(assert (=> b!775497 m!719727))

(declare-fun m!719729 () Bool)

(assert (=> b!775497 m!719729))

(assert (=> b!775497 m!719725))

(declare-fun m!719731 () Bool)

(assert (=> b!775497 m!719731))

(declare-fun m!719733 () Bool)

(assert (=> b!775497 m!719733))

(declare-fun m!719735 () Bool)

(assert (=> b!775516 m!719735))

(assert (=> b!775507 m!719709))

(assert (=> b!775507 m!719709))

(declare-fun m!719737 () Bool)

(assert (=> b!775507 m!719737))

(assert (=> b!775509 m!719709))

(assert (=> b!775509 m!719709))

(declare-fun m!719739 () Bool)

(assert (=> b!775509 m!719739))

(declare-fun m!719741 () Bool)

(assert (=> b!775506 m!719741))

(assert (=> b!775499 m!719709))

(assert (=> b!775499 m!719709))

(declare-fun m!719743 () Bool)

(assert (=> b!775499 m!719743))

(assert (=> b!775521 m!719709))

(assert (=> b!775521 m!719709))

(declare-fun m!719745 () Bool)

(assert (=> b!775521 m!719745))

(assert (=> b!775521 m!719745))

(assert (=> b!775521 m!719709))

(declare-fun m!719747 () Bool)

(assert (=> b!775521 m!719747))

(declare-fun m!719749 () Bool)

(assert (=> b!775515 m!719749))

(declare-fun m!719751 () Bool)

(assert (=> b!775520 m!719751))

(declare-fun m!719753 () Bool)

(assert (=> start!67130 m!719753))

(declare-fun m!719755 () Bool)

(assert (=> start!67130 m!719755))

(declare-fun m!719757 () Bool)

(assert (=> b!775501 m!719757))

(declare-fun m!719759 () Bool)

(assert (=> b!775519 m!719759))

(declare-fun m!719761 () Bool)

(assert (=> b!775519 m!719761))

(assert (=> b!775510 m!719709))

(assert (=> b!775510 m!719709))

(declare-fun m!719763 () Bool)

(assert (=> b!775510 m!719763))

(assert (=> b!775502 m!719709))

(assert (=> b!775502 m!719709))

(declare-fun m!719765 () Bool)

(assert (=> b!775502 m!719765))

(assert (=> b!775503 m!719709))

(assert (=> b!775503 m!719709))

(assert (=> b!775503 m!719711))

(assert (=> b!775503 m!719709))

(assert (=> b!775503 m!719763))

(assert (=> b!775514 m!719709))

(assert (=> b!775514 m!719709))

(assert (=> b!775514 m!719743))

(check-sat (not b!775497) (not b!775508) (not b!775512) (not b!775510) (not b!775509) (not b!775501) (not b!775499) (not b!775516) (not b!775520) (not b!775502) (not b!775506) (not b!775507) (not b!775503) (not b!775504) (not b!775498) (not start!67130) (not b!775519) (not b!775518) (not b!775511) (not b!775521) (not b!775514))
(check-sat)
