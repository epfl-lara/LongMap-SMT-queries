; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67088 () Bool)

(assert start!67088)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42462 0))(
  ( (array!42463 (arr!20327 (Array (_ BitVec 32) (_ BitVec 64))) (size!20748 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42462)

(declare-fun b!774497 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7924 0))(
  ( (MissingZero!7924 (index!34064 (_ BitVec 32))) (Found!7924 (index!34065 (_ BitVec 32))) (Intermediate!7924 (undefined!8736 Bool) (index!34066 (_ BitVec 32)) (x!65022 (_ BitVec 32))) (Undefined!7924) (MissingVacant!7924 (index!34067 (_ BitVec 32))) )
))
(declare-fun lt!344818 () SeekEntryResult!7924)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!431097 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42462 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!774497 (= e!431097 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344818))))

(declare-fun b!774498 () Bool)

(declare-fun e!431088 () Bool)

(assert (=> b!774498 (= e!431088 e!431097)))

(declare-fun res!523742 () Bool)

(assert (=> b!774498 (=> (not res!523742) (not e!431097))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42462 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!774498 (= res!523742 (= (seekEntryOrOpen!0 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344818))))

(assert (=> b!774498 (= lt!344818 (Found!7924 j!159))))

(declare-fun e!431090 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!344812 () SeekEntryResult!7924)

(declare-fun b!774499 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42462 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!774499 (= e!431090 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344812))))

(declare-fun res!523755 () Bool)

(declare-fun e!431092 () Bool)

(assert (=> start!67088 (=> (not res!523755) (not e!431092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67088 (= res!523755 (validMask!0 mask!3328))))

(assert (=> start!67088 e!431092))

(assert (=> start!67088 true))

(declare-fun array_inv!16210 (array!42462) Bool)

(assert (=> start!67088 (array_inv!16210 a!3186)))

(declare-fun b!774500 () Bool)

(declare-fun e!431087 () Bool)

(assert (=> b!774500 (= e!431092 e!431087)))

(declare-fun res!523747 () Bool)

(assert (=> b!774500 (=> (not res!523747) (not e!431087))))

(declare-fun lt!344809 () SeekEntryResult!7924)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774500 (= res!523747 (or (= lt!344809 (MissingZero!7924 i!1173)) (= lt!344809 (MissingVacant!7924 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!774500 (= lt!344809 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774501 () Bool)

(declare-fun e!431094 () Bool)

(assert (=> b!774501 (= e!431087 e!431094)))

(declare-fun res!523749 () Bool)

(assert (=> b!774501 (=> (not res!523749) (not e!431094))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774501 (= res!523749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20327 a!3186) j!159) mask!3328) (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344812))))

(assert (=> b!774501 (= lt!344812 (Intermediate!7924 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774502 () Bool)

(declare-fun res!523737 () Bool)

(assert (=> b!774502 (=> (not res!523737) (not e!431094))))

(assert (=> b!774502 (= res!523737 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20327 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774503 () Bool)

(declare-fun e!431098 () Bool)

(declare-fun e!431089 () Bool)

(assert (=> b!774503 (= e!431098 e!431089)))

(declare-fun res!523745 () Bool)

(assert (=> b!774503 (=> res!523745 e!431089)))

(declare-fun lt!344810 () (_ BitVec 32))

(assert (=> b!774503 (= res!523745 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344810 #b00000000000000000000000000000000) (bvsge lt!344810 (size!20748 a!3186))))))

(declare-datatypes ((Unit!26690 0))(
  ( (Unit!26691) )
))
(declare-fun lt!344819 () Unit!26690)

(declare-fun e!431093 () Unit!26690)

(assert (=> b!774503 (= lt!344819 e!431093)))

(declare-fun c!85782 () Bool)

(declare-fun lt!344813 () Bool)

(assert (=> b!774503 (= c!85782 lt!344813)))

(assert (=> b!774503 (= lt!344813 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774503 (= lt!344810 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774504 () Bool)

(declare-fun res!523743 () Bool)

(assert (=> b!774504 (=> res!523743 e!431089)))

(declare-fun e!431091 () Bool)

(assert (=> b!774504 (= res!523743 e!431091)))

(declare-fun c!85780 () Bool)

(assert (=> b!774504 (= c!85780 lt!344813)))

(declare-fun b!774505 () Bool)

(declare-fun res!523738 () Bool)

(assert (=> b!774505 (=> (not res!523738) (not e!431087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42462 (_ BitVec 32)) Bool)

(assert (=> b!774505 (= res!523738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774506 () Bool)

(assert (=> b!774506 (= e!431089 true)))

(declare-fun lt!344814 () (_ BitVec 64))

(declare-fun lt!344817 () SeekEntryResult!7924)

(declare-fun lt!344808 () array!42462)

(assert (=> b!774506 (= (seekEntryOrOpen!0 lt!344814 lt!344808 mask!3328) lt!344817)))

(declare-fun lt!344806 () Unit!26690)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26690)

(assert (=> b!774506 (= lt!344806 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!344810 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!774507 () Bool)

(declare-fun e!431096 () Bool)

(assert (=> b!774507 (= e!431096 (not e!431098))))

(declare-fun res!523741 () Bool)

(assert (=> b!774507 (=> res!523741 e!431098)))

(declare-fun lt!344815 () SeekEntryResult!7924)

(get-info :version)

(assert (=> b!774507 (= res!523741 (or (not ((_ is Intermediate!7924) lt!344815)) (bvsge x!1131 (x!65022 lt!344815))))))

(assert (=> b!774507 (= lt!344817 (Found!7924 j!159))))

(assert (=> b!774507 e!431088))

(declare-fun res!523748 () Bool)

(assert (=> b!774507 (=> (not res!523748) (not e!431088))))

(assert (=> b!774507 (= res!523748 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344807 () Unit!26690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26690)

(assert (=> b!774507 (= lt!344807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774508 () Bool)

(declare-fun res!523744 () Bool)

(assert (=> b!774508 (=> (not res!523744) (not e!431087))))

(declare-datatypes ((List!14368 0))(
  ( (Nil!14365) (Cons!14364 (h!15472 (_ BitVec 64)) (t!20674 List!14368)) )
))
(declare-fun arrayNoDuplicates!0 (array!42462 (_ BitVec 32) List!14368) Bool)

(assert (=> b!774508 (= res!523744 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14365))))

(declare-fun b!774509 () Bool)

(assert (=> b!774509 (= e!431091 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344810 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344817)))))

(declare-fun b!774510 () Bool)

(assert (=> b!774510 (= e!431094 e!431096)))

(declare-fun res!523753 () Bool)

(assert (=> b!774510 (=> (not res!523753) (not e!431096))))

(declare-fun lt!344811 () SeekEntryResult!7924)

(assert (=> b!774510 (= res!523753 (= lt!344811 lt!344815))))

(assert (=> b!774510 (= lt!344815 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344814 lt!344808 mask!3328))))

(assert (=> b!774510 (= lt!344811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344814 mask!3328) lt!344814 lt!344808 mask!3328))))

(assert (=> b!774510 (= lt!344814 (select (store (arr!20327 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774510 (= lt!344808 (array!42463 (store (arr!20327 a!3186) i!1173 k0!2102) (size!20748 a!3186)))))

(declare-fun b!774511 () Bool)

(declare-fun res!523752 () Bool)

(assert (=> b!774511 (=> (not res!523752) (not e!431092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774511 (= res!523752 (validKeyInArray!0 k0!2102))))

(declare-fun b!774512 () Bool)

(declare-fun res!523750 () Bool)

(assert (=> b!774512 (=> (not res!523750) (not e!431087))))

(assert (=> b!774512 (= res!523750 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20748 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20748 a!3186))))))

(declare-fun b!774513 () Bool)

(declare-fun res!523739 () Bool)

(assert (=> b!774513 (=> (not res!523739) (not e!431092))))

(assert (=> b!774513 (= res!523739 (validKeyInArray!0 (select (arr!20327 a!3186) j!159)))))

(declare-fun b!774514 () Bool)

(declare-fun res!523754 () Bool)

(assert (=> b!774514 (=> (not res!523754) (not e!431094))))

(assert (=> b!774514 (= res!523754 e!431090)))

(declare-fun c!85781 () Bool)

(assert (=> b!774514 (= c!85781 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774515 () Bool)

(assert (=> b!774515 (= e!431090 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) (Found!7924 j!159)))))

(declare-fun b!774516 () Bool)

(assert (=> b!774516 (= e!431091 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344810 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344812)))))

(declare-fun b!774517 () Bool)

(declare-fun res!523746 () Bool)

(assert (=> b!774517 (=> (not res!523746) (not e!431092))))

(assert (=> b!774517 (= res!523746 (and (= (size!20748 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20748 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20748 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774518 () Bool)

(declare-fun res!523751 () Bool)

(assert (=> b!774518 (=> res!523751 e!431089)))

(assert (=> b!774518 (= res!523751 (not (= lt!344811 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344810 lt!344814 lt!344808 mask!3328))))))

(declare-fun b!774519 () Bool)

(declare-fun Unit!26692 () Unit!26690)

(assert (=> b!774519 (= e!431093 Unit!26692)))

(declare-fun lt!344816 () SeekEntryResult!7924)

(assert (=> b!774519 (= lt!344816 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774519 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344810 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344817)))

(declare-fun b!774520 () Bool)

(declare-fun res!523740 () Bool)

(assert (=> b!774520 (=> (not res!523740) (not e!431092))))

(declare-fun arrayContainsKey!0 (array!42462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774520 (= res!523740 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774521 () Bool)

(declare-fun Unit!26693 () Unit!26690)

(assert (=> b!774521 (= e!431093 Unit!26693)))

(assert (=> b!774521 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344810 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!344812)))

(assert (= (and start!67088 res!523755) b!774517))

(assert (= (and b!774517 res!523746) b!774513))

(assert (= (and b!774513 res!523739) b!774511))

(assert (= (and b!774511 res!523752) b!774520))

(assert (= (and b!774520 res!523740) b!774500))

(assert (= (and b!774500 res!523747) b!774505))

(assert (= (and b!774505 res!523738) b!774508))

(assert (= (and b!774508 res!523744) b!774512))

(assert (= (and b!774512 res!523750) b!774501))

(assert (= (and b!774501 res!523749) b!774502))

(assert (= (and b!774502 res!523737) b!774514))

(assert (= (and b!774514 c!85781) b!774499))

(assert (= (and b!774514 (not c!85781)) b!774515))

(assert (= (and b!774514 res!523754) b!774510))

(assert (= (and b!774510 res!523753) b!774507))

(assert (= (and b!774507 res!523748) b!774498))

(assert (= (and b!774498 res!523742) b!774497))

(assert (= (and b!774507 (not res!523741)) b!774503))

(assert (= (and b!774503 c!85782) b!774521))

(assert (= (and b!774503 (not c!85782)) b!774519))

(assert (= (and b!774503 (not res!523745)) b!774504))

(assert (= (and b!774504 c!85780) b!774516))

(assert (= (and b!774504 (not c!85780)) b!774509))

(assert (= (and b!774504 (not res!523743)) b!774518))

(assert (= (and b!774518 (not res!523751)) b!774506))

(declare-fun m!718371 () Bool)

(assert (=> b!774510 m!718371))

(declare-fun m!718373 () Bool)

(assert (=> b!774510 m!718373))

(declare-fun m!718375 () Bool)

(assert (=> b!774510 m!718375))

(declare-fun m!718377 () Bool)

(assert (=> b!774510 m!718377))

(assert (=> b!774510 m!718373))

(declare-fun m!718379 () Bool)

(assert (=> b!774510 m!718379))

(declare-fun m!718381 () Bool)

(assert (=> b!774497 m!718381))

(assert (=> b!774497 m!718381))

(declare-fun m!718383 () Bool)

(assert (=> b!774497 m!718383))

(declare-fun m!718385 () Bool)

(assert (=> b!774511 m!718385))

(declare-fun m!718387 () Bool)

(assert (=> start!67088 m!718387))

(declare-fun m!718389 () Bool)

(assert (=> start!67088 m!718389))

(assert (=> b!774499 m!718381))

(assert (=> b!774499 m!718381))

(declare-fun m!718391 () Bool)

(assert (=> b!774499 m!718391))

(declare-fun m!718393 () Bool)

(assert (=> b!774505 m!718393))

(assert (=> b!774501 m!718381))

(assert (=> b!774501 m!718381))

(declare-fun m!718395 () Bool)

(assert (=> b!774501 m!718395))

(assert (=> b!774501 m!718395))

(assert (=> b!774501 m!718381))

(declare-fun m!718397 () Bool)

(assert (=> b!774501 m!718397))

(declare-fun m!718399 () Bool)

(assert (=> b!774500 m!718399))

(assert (=> b!774519 m!718381))

(assert (=> b!774519 m!718381))

(declare-fun m!718401 () Bool)

(assert (=> b!774519 m!718401))

(assert (=> b!774519 m!718381))

(declare-fun m!718403 () Bool)

(assert (=> b!774519 m!718403))

(assert (=> b!774521 m!718381))

(assert (=> b!774521 m!718381))

(declare-fun m!718405 () Bool)

(assert (=> b!774521 m!718405))

(assert (=> b!774515 m!718381))

(assert (=> b!774515 m!718381))

(assert (=> b!774515 m!718401))

(declare-fun m!718407 () Bool)

(assert (=> b!774518 m!718407))

(assert (=> b!774509 m!718381))

(assert (=> b!774509 m!718381))

(assert (=> b!774509 m!718403))

(assert (=> b!774498 m!718381))

(assert (=> b!774498 m!718381))

(declare-fun m!718409 () Bool)

(assert (=> b!774498 m!718409))

(declare-fun m!718411 () Bool)

(assert (=> b!774520 m!718411))

(assert (=> b!774513 m!718381))

(assert (=> b!774513 m!718381))

(declare-fun m!718413 () Bool)

(assert (=> b!774513 m!718413))

(declare-fun m!718415 () Bool)

(assert (=> b!774506 m!718415))

(declare-fun m!718417 () Bool)

(assert (=> b!774506 m!718417))

(declare-fun m!718419 () Bool)

(assert (=> b!774503 m!718419))

(declare-fun m!718421 () Bool)

(assert (=> b!774502 m!718421))

(declare-fun m!718423 () Bool)

(assert (=> b!774508 m!718423))

(assert (=> b!774516 m!718381))

(assert (=> b!774516 m!718381))

(assert (=> b!774516 m!718405))

(declare-fun m!718425 () Bool)

(assert (=> b!774507 m!718425))

(declare-fun m!718427 () Bool)

(assert (=> b!774507 m!718427))

(check-sat (not b!774521) (not b!774498) (not b!774497) (not b!774508) (not b!774510) (not b!774507) (not b!774519) (not b!774511) (not b!774516) (not b!774505) (not b!774520) (not b!774503) (not b!774506) (not b!774509) (not b!774499) (not b!774513) (not b!774501) (not b!774518) (not start!67088) (not b!774500) (not b!774515))
(check-sat)
