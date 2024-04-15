; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65816 () Bool)

(assert start!65816)

(declare-fun b!758003 () Bool)

(declare-fun res!512833 () Bool)

(declare-fun e!422596 () Bool)

(assert (=> b!758003 (=> (not res!512833) (not e!422596))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42006 0))(
  ( (array!42007 (arr!20117 (Array (_ BitVec 32) (_ BitVec 64))) (size!20538 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42006)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758003 (= res!512833 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20538 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20538 a!3186))))))

(declare-fun b!758004 () Bool)

(declare-fun res!512845 () Bool)

(declare-fun e!422590 () Bool)

(assert (=> b!758004 (=> (not res!512845) (not e!422590))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758004 (= res!512845 (validKeyInArray!0 k0!2102))))

(declare-fun b!758005 () Bool)

(declare-fun e!422599 () Bool)

(assert (=> b!758005 (= e!422596 e!422599)))

(declare-fun res!512846 () Bool)

(assert (=> b!758005 (=> (not res!512846) (not e!422599))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7714 0))(
  ( (MissingZero!7714 (index!33224 (_ BitVec 32))) (Found!7714 (index!33225 (_ BitVec 32))) (Intermediate!7714 (undefined!8526 Bool) (index!33226 (_ BitVec 32)) (x!64123 (_ BitVec 32))) (Undefined!7714) (MissingVacant!7714 (index!33227 (_ BitVec 32))) )
))
(declare-fun lt!337508 () SeekEntryResult!7714)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42006 (_ BitVec 32)) SeekEntryResult!7714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758005 (= res!512846 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20117 a!3186) j!159) mask!3328) (select (arr!20117 a!3186) j!159) a!3186 mask!3328) lt!337508))))

(assert (=> b!758005 (= lt!337508 (Intermediate!7714 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758006 () Bool)

(declare-fun e!422591 () Bool)

(declare-fun e!422595 () Bool)

(assert (=> b!758006 (= e!422591 e!422595)))

(declare-fun res!512832 () Bool)

(assert (=> b!758006 (=> res!512832 e!422595)))

(assert (=> b!758006 (= res!512832 (or (not (= (select (arr!20117 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!337511 () SeekEntryResult!7714)

(declare-fun lt!337509 () SeekEntryResult!7714)

(declare-fun lt!337505 () SeekEntryResult!7714)

(declare-fun lt!337512 () SeekEntryResult!7714)

(assert (=> b!758006 (and (= lt!337505 lt!337511) (= lt!337509 lt!337512))))

(declare-fun lt!337510 () array!42006)

(declare-fun lt!337506 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42006 (_ BitVec 32)) SeekEntryResult!7714)

(assert (=> b!758006 (= lt!337511 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337506 lt!337510 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42006 (_ BitVec 32)) SeekEntryResult!7714)

(assert (=> b!758006 (= lt!337505 (seekEntryOrOpen!0 lt!337506 lt!337510 mask!3328))))

(declare-fun lt!337501 () (_ BitVec 64))

(assert (=> b!758006 (= lt!337501 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26216 0))(
  ( (Unit!26217) )
))
(declare-fun lt!337502 () Unit!26216)

(declare-fun e!422593 () Unit!26216)

(assert (=> b!758006 (= lt!337502 e!422593)))

(declare-fun c!82967 () Bool)

(assert (=> b!758006 (= c!82967 (= lt!337501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758007 () Bool)

(declare-fun e!422589 () Bool)

(assert (=> b!758007 (= e!422589 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20117 a!3186) j!159) a!3186 mask!3328) (Found!7714 j!159)))))

(declare-fun b!758008 () Bool)

(declare-fun res!512838 () Bool)

(assert (=> b!758008 (=> (not res!512838) (not e!422590))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758008 (= res!512838 (and (= (size!20538 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20538 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20538 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758009 () Bool)

(declare-fun e!422594 () Bool)

(assert (=> b!758009 (= e!422599 e!422594)))

(declare-fun res!512847 () Bool)

(assert (=> b!758009 (=> (not res!512847) (not e!422594))))

(declare-fun lt!337504 () SeekEntryResult!7714)

(declare-fun lt!337500 () SeekEntryResult!7714)

(assert (=> b!758009 (= res!512847 (= lt!337504 lt!337500))))

(assert (=> b!758009 (= lt!337500 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337506 lt!337510 mask!3328))))

(assert (=> b!758009 (= lt!337504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337506 mask!3328) lt!337506 lt!337510 mask!3328))))

(assert (=> b!758009 (= lt!337506 (select (store (arr!20117 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758009 (= lt!337510 (array!42007 (store (arr!20117 a!3186) i!1173 k0!2102) (size!20538 a!3186)))))

(declare-fun b!758010 () Bool)

(declare-fun res!512831 () Bool)

(assert (=> b!758010 (=> (not res!512831) (not e!422590))))

(declare-fun arrayContainsKey!0 (array!42006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758010 (= res!512831 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758011 () Bool)

(declare-fun res!512840 () Bool)

(assert (=> b!758011 (=> (not res!512840) (not e!422596))))

(declare-datatypes ((List!14158 0))(
  ( (Nil!14155) (Cons!14154 (h!15226 (_ BitVec 64)) (t!20464 List!14158)) )
))
(declare-fun arrayNoDuplicates!0 (array!42006 (_ BitVec 32) List!14158) Bool)

(assert (=> b!758011 (= res!512840 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14155))))

(declare-fun b!758012 () Bool)

(assert (=> b!758012 (= e!422595 true)))

(assert (=> b!758012 (= lt!337511 lt!337512)))

(declare-fun lt!337507 () Unit!26216)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42006 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26216)

(assert (=> b!758012 (= lt!337507 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758013 () Bool)

(declare-fun res!512830 () Bool)

(assert (=> b!758013 (=> (not res!512830) (not e!422599))))

(assert (=> b!758013 (= res!512830 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20117 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758014 () Bool)

(declare-fun e!422598 () Bool)

(assert (=> b!758014 (= e!422594 (not e!422598))))

(declare-fun res!512842 () Bool)

(assert (=> b!758014 (=> res!512842 e!422598)))

(get-info :version)

(assert (=> b!758014 (= res!512842 (or (not ((_ is Intermediate!7714) lt!337500)) (bvslt x!1131 (x!64123 lt!337500)) (not (= x!1131 (x!64123 lt!337500))) (not (= index!1321 (index!33226 lt!337500)))))))

(declare-fun e!422592 () Bool)

(assert (=> b!758014 e!422592))

(declare-fun res!512843 () Bool)

(assert (=> b!758014 (=> (not res!512843) (not e!422592))))

(declare-fun lt!337503 () SeekEntryResult!7714)

(assert (=> b!758014 (= res!512843 (= lt!337509 lt!337503))))

(assert (=> b!758014 (= lt!337503 (Found!7714 j!159))))

(assert (=> b!758014 (= lt!337509 (seekEntryOrOpen!0 (select (arr!20117 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42006 (_ BitVec 32)) Bool)

(assert (=> b!758014 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337513 () Unit!26216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26216)

(assert (=> b!758014 (= lt!337513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!512837 () Bool)

(assert (=> start!65816 (=> (not res!512837) (not e!422590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65816 (= res!512837 (validMask!0 mask!3328))))

(assert (=> start!65816 e!422590))

(assert (=> start!65816 true))

(declare-fun array_inv!16000 (array!42006) Bool)

(assert (=> start!65816 (array_inv!16000 a!3186)))

(declare-fun b!758015 () Bool)

(assert (=> b!758015 (= e!422592 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20117 a!3186) j!159) a!3186 mask!3328) lt!337503))))

(declare-fun b!758016 () Bool)

(declare-fun Unit!26218 () Unit!26216)

(assert (=> b!758016 (= e!422593 Unit!26218)))

(declare-fun b!758017 () Bool)

(declare-fun res!512844 () Bool)

(assert (=> b!758017 (=> (not res!512844) (not e!422590))))

(assert (=> b!758017 (= res!512844 (validKeyInArray!0 (select (arr!20117 a!3186) j!159)))))

(declare-fun b!758018 () Bool)

(declare-fun e!422597 () Bool)

(assert (=> b!758018 (= e!422597 e!422591)))

(declare-fun res!512841 () Bool)

(assert (=> b!758018 (=> res!512841 e!422591)))

(assert (=> b!758018 (= res!512841 (= lt!337501 lt!337506))))

(assert (=> b!758018 (= lt!337501 (select (store (arr!20117 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758019 () Bool)

(assert (=> b!758019 (= e!422589 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20117 a!3186) j!159) a!3186 mask!3328) lt!337508))))

(declare-fun b!758020 () Bool)

(declare-fun res!512835 () Bool)

(assert (=> b!758020 (=> (not res!512835) (not e!422596))))

(assert (=> b!758020 (= res!512835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758021 () Bool)

(declare-fun Unit!26219 () Unit!26216)

(assert (=> b!758021 (= e!422593 Unit!26219)))

(assert (=> b!758021 false))

(declare-fun b!758022 () Bool)

(assert (=> b!758022 (= e!422598 e!422597)))

(declare-fun res!512834 () Bool)

(assert (=> b!758022 (=> res!512834 e!422597)))

(assert (=> b!758022 (= res!512834 (not (= lt!337512 lt!337503)))))

(assert (=> b!758022 (= lt!337512 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20117 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758023 () Bool)

(assert (=> b!758023 (= e!422590 e!422596)))

(declare-fun res!512836 () Bool)

(assert (=> b!758023 (=> (not res!512836) (not e!422596))))

(declare-fun lt!337514 () SeekEntryResult!7714)

(assert (=> b!758023 (= res!512836 (or (= lt!337514 (MissingZero!7714 i!1173)) (= lt!337514 (MissingVacant!7714 i!1173))))))

(assert (=> b!758023 (= lt!337514 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758024 () Bool)

(declare-fun res!512839 () Bool)

(assert (=> b!758024 (=> (not res!512839) (not e!422599))))

(assert (=> b!758024 (= res!512839 e!422589)))

(declare-fun c!82968 () Bool)

(assert (=> b!758024 (= c!82968 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65816 res!512837) b!758008))

(assert (= (and b!758008 res!512838) b!758017))

(assert (= (and b!758017 res!512844) b!758004))

(assert (= (and b!758004 res!512845) b!758010))

(assert (= (and b!758010 res!512831) b!758023))

(assert (= (and b!758023 res!512836) b!758020))

(assert (= (and b!758020 res!512835) b!758011))

(assert (= (and b!758011 res!512840) b!758003))

(assert (= (and b!758003 res!512833) b!758005))

(assert (= (and b!758005 res!512846) b!758013))

(assert (= (and b!758013 res!512830) b!758024))

(assert (= (and b!758024 c!82968) b!758019))

(assert (= (and b!758024 (not c!82968)) b!758007))

(assert (= (and b!758024 res!512839) b!758009))

(assert (= (and b!758009 res!512847) b!758014))

(assert (= (and b!758014 res!512843) b!758015))

(assert (= (and b!758014 (not res!512842)) b!758022))

(assert (= (and b!758022 (not res!512834)) b!758018))

(assert (= (and b!758018 (not res!512841)) b!758006))

(assert (= (and b!758006 c!82967) b!758021))

(assert (= (and b!758006 (not c!82967)) b!758016))

(assert (= (and b!758006 (not res!512832)) b!758012))

(declare-fun m!705005 () Bool)

(assert (=> b!758015 m!705005))

(assert (=> b!758015 m!705005))

(declare-fun m!705007 () Bool)

(assert (=> b!758015 m!705007))

(assert (=> b!758007 m!705005))

(assert (=> b!758007 m!705005))

(declare-fun m!705009 () Bool)

(assert (=> b!758007 m!705009))

(assert (=> b!758017 m!705005))

(assert (=> b!758017 m!705005))

(declare-fun m!705011 () Bool)

(assert (=> b!758017 m!705011))

(declare-fun m!705013 () Bool)

(assert (=> b!758010 m!705013))

(declare-fun m!705015 () Bool)

(assert (=> b!758004 m!705015))

(assert (=> b!758019 m!705005))

(assert (=> b!758019 m!705005))

(declare-fun m!705017 () Bool)

(assert (=> b!758019 m!705017))

(declare-fun m!705019 () Bool)

(assert (=> b!758013 m!705019))

(declare-fun m!705021 () Bool)

(assert (=> start!65816 m!705021))

(declare-fun m!705023 () Bool)

(assert (=> start!65816 m!705023))

(declare-fun m!705025 () Bool)

(assert (=> b!758018 m!705025))

(declare-fun m!705027 () Bool)

(assert (=> b!758018 m!705027))

(declare-fun m!705029 () Bool)

(assert (=> b!758006 m!705029))

(declare-fun m!705031 () Bool)

(assert (=> b!758006 m!705031))

(declare-fun m!705033 () Bool)

(assert (=> b!758006 m!705033))

(declare-fun m!705035 () Bool)

(assert (=> b!758020 m!705035))

(assert (=> b!758022 m!705005))

(assert (=> b!758022 m!705005))

(assert (=> b!758022 m!705009))

(declare-fun m!705037 () Bool)

(assert (=> b!758012 m!705037))

(assert (=> b!758005 m!705005))

(assert (=> b!758005 m!705005))

(declare-fun m!705039 () Bool)

(assert (=> b!758005 m!705039))

(assert (=> b!758005 m!705039))

(assert (=> b!758005 m!705005))

(declare-fun m!705041 () Bool)

(assert (=> b!758005 m!705041))

(declare-fun m!705043 () Bool)

(assert (=> b!758023 m!705043))

(assert (=> b!758014 m!705005))

(assert (=> b!758014 m!705005))

(declare-fun m!705045 () Bool)

(assert (=> b!758014 m!705045))

(declare-fun m!705047 () Bool)

(assert (=> b!758014 m!705047))

(declare-fun m!705049 () Bool)

(assert (=> b!758014 m!705049))

(declare-fun m!705051 () Bool)

(assert (=> b!758009 m!705051))

(declare-fun m!705053 () Bool)

(assert (=> b!758009 m!705053))

(assert (=> b!758009 m!705025))

(declare-fun m!705055 () Bool)

(assert (=> b!758009 m!705055))

(declare-fun m!705057 () Bool)

(assert (=> b!758009 m!705057))

(assert (=> b!758009 m!705051))

(declare-fun m!705059 () Bool)

(assert (=> b!758011 m!705059))

(check-sat (not b!758007) (not b!758017) (not b!758004) (not b!758019) (not b!758006) (not b!758005) (not b!758009) (not start!65816) (not b!758011) (not b!758012) (not b!758014) (not b!758022) (not b!758023) (not b!758015) (not b!758010) (not b!758020))
(check-sat)
