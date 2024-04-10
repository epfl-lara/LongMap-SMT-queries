; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65844 () Bool)

(assert start!65844)

(declare-fun b!758517 () Bool)

(declare-fun e!422887 () Bool)

(declare-fun e!422890 () Bool)

(assert (=> b!758517 (= e!422887 e!422890)))

(declare-fun res!513173 () Bool)

(assert (=> b!758517 (=> (not res!513173) (not e!422890))))

(declare-datatypes ((SeekEntryResult!7722 0))(
  ( (MissingZero!7722 (index!33256 (_ BitVec 32))) (Found!7722 (index!33257 (_ BitVec 32))) (Intermediate!7722 (undefined!8534 Bool) (index!33258 (_ BitVec 32)) (x!64144 (_ BitVec 32))) (Undefined!7722) (MissingVacant!7722 (index!33259 (_ BitVec 32))) )
))
(declare-fun lt!337924 () SeekEntryResult!7722)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758517 (= res!513173 (or (= lt!337924 (MissingZero!7722 i!1173)) (= lt!337924 (MissingVacant!7722 i!1173))))))

(declare-datatypes ((array!42017 0))(
  ( (array!42018 (arr!20122 (Array (_ BitVec 32) (_ BitVec 64))) (size!20543 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42017)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42017 (_ BitVec 32)) SeekEntryResult!7722)

(assert (=> b!758517 (= lt!337924 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758519 () Bool)

(declare-fun res!513167 () Bool)

(assert (=> b!758519 (=> (not res!513167) (not e!422890))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758519 (= res!513167 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20543 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20543 a!3186))))))

(declare-fun b!758520 () Bool)

(declare-fun e!422886 () Bool)

(declare-fun e!422888 () Bool)

(assert (=> b!758520 (= e!422886 e!422888)))

(declare-fun res!513164 () Bool)

(assert (=> b!758520 (=> res!513164 e!422888)))

(declare-fun lt!337926 () SeekEntryResult!7722)

(declare-fun lt!337930 () SeekEntryResult!7722)

(assert (=> b!758520 (= res!513164 (not (= lt!337926 lt!337930)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42017 (_ BitVec 32)) SeekEntryResult!7722)

(assert (=> b!758520 (= lt!337926 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20122 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758521 () Bool)

(declare-fun e!422896 () Bool)

(assert (=> b!758521 (= e!422896 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!337921 () SeekEntryResult!7722)

(assert (=> b!758521 (= lt!337921 lt!337926)))

(declare-datatypes ((Unit!26268 0))(
  ( (Unit!26269) )
))
(declare-fun lt!337920 () Unit!26268)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26268)

(assert (=> b!758521 (= lt!337920 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758522 () Bool)

(declare-fun e!422891 () Bool)

(assert (=> b!758522 (= e!422890 e!422891)))

(declare-fun res!513158 () Bool)

(assert (=> b!758522 (=> (not res!513158) (not e!422891))))

(declare-fun lt!337934 () SeekEntryResult!7722)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42017 (_ BitVec 32)) SeekEntryResult!7722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758522 (= res!513158 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20122 a!3186) j!159) mask!3328) (select (arr!20122 a!3186) j!159) a!3186 mask!3328) lt!337934))))

(assert (=> b!758522 (= lt!337934 (Intermediate!7722 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758523 () Bool)

(declare-fun e!422895 () Bool)

(assert (=> b!758523 (= e!422895 (not e!422886))))

(declare-fun res!513163 () Bool)

(assert (=> b!758523 (=> res!513163 e!422886)))

(declare-fun lt!337929 () SeekEntryResult!7722)

(get-info :version)

(assert (=> b!758523 (= res!513163 (or (not ((_ is Intermediate!7722) lt!337929)) (bvslt x!1131 (x!64144 lt!337929)) (not (= x!1131 (x!64144 lt!337929))) (not (= index!1321 (index!33258 lt!337929)))))))

(declare-fun e!422889 () Bool)

(assert (=> b!758523 e!422889))

(declare-fun res!513160 () Bool)

(assert (=> b!758523 (=> (not res!513160) (not e!422889))))

(declare-fun lt!337925 () SeekEntryResult!7722)

(assert (=> b!758523 (= res!513160 (= lt!337925 lt!337930))))

(assert (=> b!758523 (= lt!337930 (Found!7722 j!159))))

(assert (=> b!758523 (= lt!337925 (seekEntryOrOpen!0 (select (arr!20122 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42017 (_ BitVec 32)) Bool)

(assert (=> b!758523 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337928 () Unit!26268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26268)

(assert (=> b!758523 (= lt!337928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758524 () Bool)

(declare-fun e!422897 () Unit!26268)

(declare-fun Unit!26270 () Unit!26268)

(assert (=> b!758524 (= e!422897 Unit!26270)))

(assert (=> b!758524 false))

(declare-fun b!758525 () Bool)

(assert (=> b!758525 (= e!422891 e!422895)))

(declare-fun res!513161 () Bool)

(assert (=> b!758525 (=> (not res!513161) (not e!422895))))

(declare-fun lt!337931 () SeekEntryResult!7722)

(assert (=> b!758525 (= res!513161 (= lt!337931 lt!337929))))

(declare-fun lt!337933 () (_ BitVec 64))

(declare-fun lt!337927 () array!42017)

(assert (=> b!758525 (= lt!337929 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337933 lt!337927 mask!3328))))

(assert (=> b!758525 (= lt!337931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337933 mask!3328) lt!337933 lt!337927 mask!3328))))

(assert (=> b!758525 (= lt!337933 (select (store (arr!20122 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758525 (= lt!337927 (array!42018 (store (arr!20122 a!3186) i!1173 k0!2102) (size!20543 a!3186)))))

(declare-fun e!422892 () Bool)

(declare-fun b!758526 () Bool)

(assert (=> b!758526 (= e!422892 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20122 a!3186) j!159) a!3186 mask!3328) (Found!7722 j!159)))))

(declare-fun b!758527 () Bool)

(assert (=> b!758527 (= e!422892 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20122 a!3186) j!159) a!3186 mask!3328) lt!337934))))

(declare-fun b!758528 () Bool)

(declare-fun res!513162 () Bool)

(assert (=> b!758528 (=> (not res!513162) (not e!422890))))

(assert (=> b!758528 (= res!513162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758529 () Bool)

(declare-fun res!513166 () Bool)

(assert (=> b!758529 (=> (not res!513166) (not e!422887))))

(declare-fun arrayContainsKey!0 (array!42017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758529 (= res!513166 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!513157 () Bool)

(assert (=> start!65844 (=> (not res!513157) (not e!422887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65844 (= res!513157 (validMask!0 mask!3328))))

(assert (=> start!65844 e!422887))

(assert (=> start!65844 true))

(declare-fun array_inv!15918 (array!42017) Bool)

(assert (=> start!65844 (array_inv!15918 a!3186)))

(declare-fun b!758518 () Bool)

(assert (=> b!758518 (= e!422889 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20122 a!3186) j!159) a!3186 mask!3328) lt!337930))))

(declare-fun b!758530 () Bool)

(declare-fun res!513156 () Bool)

(assert (=> b!758530 (=> (not res!513156) (not e!422887))))

(assert (=> b!758530 (= res!513156 (and (= (size!20543 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20543 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20543 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758531 () Bool)

(declare-fun Unit!26271 () Unit!26268)

(assert (=> b!758531 (= e!422897 Unit!26271)))

(declare-fun b!758532 () Bool)

(declare-fun e!422893 () Bool)

(assert (=> b!758532 (= e!422893 e!422896)))

(declare-fun res!513165 () Bool)

(assert (=> b!758532 (=> res!513165 e!422896)))

(assert (=> b!758532 (= res!513165 (or (not (= (select (arr!20122 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!337922 () SeekEntryResult!7722)

(assert (=> b!758532 (and (= lt!337922 lt!337921) (= lt!337925 lt!337926))))

(assert (=> b!758532 (= lt!337921 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337933 lt!337927 mask!3328))))

(assert (=> b!758532 (= lt!337922 (seekEntryOrOpen!0 lt!337933 lt!337927 mask!3328))))

(declare-fun lt!337932 () (_ BitVec 64))

(assert (=> b!758532 (= lt!337932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337923 () Unit!26268)

(assert (=> b!758532 (= lt!337923 e!422897)))

(declare-fun c!83061 () Bool)

(assert (=> b!758532 (= c!83061 (= lt!337932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758533 () Bool)

(declare-fun res!513170 () Bool)

(assert (=> b!758533 (=> (not res!513170) (not e!422891))))

(assert (=> b!758533 (= res!513170 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20122 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758534 () Bool)

(declare-fun res!513172 () Bool)

(assert (=> b!758534 (=> (not res!513172) (not e!422890))))

(declare-datatypes ((List!14124 0))(
  ( (Nil!14121) (Cons!14120 (h!15192 (_ BitVec 64)) (t!20439 List!14124)) )
))
(declare-fun arrayNoDuplicates!0 (array!42017 (_ BitVec 32) List!14124) Bool)

(assert (=> b!758534 (= res!513172 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14121))))

(declare-fun b!758535 () Bool)

(assert (=> b!758535 (= e!422888 e!422893)))

(declare-fun res!513159 () Bool)

(assert (=> b!758535 (=> res!513159 e!422893)))

(assert (=> b!758535 (= res!513159 (= lt!337932 lt!337933))))

(assert (=> b!758535 (= lt!337932 (select (store (arr!20122 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758536 () Bool)

(declare-fun res!513171 () Bool)

(assert (=> b!758536 (=> (not res!513171) (not e!422887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758536 (= res!513171 (validKeyInArray!0 (select (arr!20122 a!3186) j!159)))))

(declare-fun b!758537 () Bool)

(declare-fun res!513168 () Bool)

(assert (=> b!758537 (=> (not res!513168) (not e!422887))))

(assert (=> b!758537 (= res!513168 (validKeyInArray!0 k0!2102))))

(declare-fun b!758538 () Bool)

(declare-fun res!513169 () Bool)

(assert (=> b!758538 (=> (not res!513169) (not e!422891))))

(assert (=> b!758538 (= res!513169 e!422892)))

(declare-fun c!83062 () Bool)

(assert (=> b!758538 (= c!83062 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65844 res!513157) b!758530))

(assert (= (and b!758530 res!513156) b!758536))

(assert (= (and b!758536 res!513171) b!758537))

(assert (= (and b!758537 res!513168) b!758529))

(assert (= (and b!758529 res!513166) b!758517))

(assert (= (and b!758517 res!513173) b!758528))

(assert (= (and b!758528 res!513162) b!758534))

(assert (= (and b!758534 res!513172) b!758519))

(assert (= (and b!758519 res!513167) b!758522))

(assert (= (and b!758522 res!513158) b!758533))

(assert (= (and b!758533 res!513170) b!758538))

(assert (= (and b!758538 c!83062) b!758527))

(assert (= (and b!758538 (not c!83062)) b!758526))

(assert (= (and b!758538 res!513169) b!758525))

(assert (= (and b!758525 res!513161) b!758523))

(assert (= (and b!758523 res!513160) b!758518))

(assert (= (and b!758523 (not res!513163)) b!758520))

(assert (= (and b!758520 (not res!513164)) b!758535))

(assert (= (and b!758535 (not res!513159)) b!758532))

(assert (= (and b!758532 c!83061) b!758524))

(assert (= (and b!758532 (not c!83061)) b!758531))

(assert (= (and b!758532 (not res!513165)) b!758521))

(declare-fun m!705987 () Bool)

(assert (=> b!758528 m!705987))

(declare-fun m!705989 () Bool)

(assert (=> b!758525 m!705989))

(declare-fun m!705991 () Bool)

(assert (=> b!758525 m!705991))

(declare-fun m!705993 () Bool)

(assert (=> b!758525 m!705993))

(declare-fun m!705995 () Bool)

(assert (=> b!758525 m!705995))

(assert (=> b!758525 m!705991))

(declare-fun m!705997 () Bool)

(assert (=> b!758525 m!705997))

(declare-fun m!705999 () Bool)

(assert (=> b!758522 m!705999))

(assert (=> b!758522 m!705999))

(declare-fun m!706001 () Bool)

(assert (=> b!758522 m!706001))

(assert (=> b!758522 m!706001))

(assert (=> b!758522 m!705999))

(declare-fun m!706003 () Bool)

(assert (=> b!758522 m!706003))

(declare-fun m!706005 () Bool)

(assert (=> b!758529 m!706005))

(declare-fun m!706007 () Bool)

(assert (=> start!65844 m!706007))

(declare-fun m!706009 () Bool)

(assert (=> start!65844 m!706009))

(assert (=> b!758520 m!705999))

(assert (=> b!758520 m!705999))

(declare-fun m!706011 () Bool)

(assert (=> b!758520 m!706011))

(assert (=> b!758535 m!705993))

(declare-fun m!706013 () Bool)

(assert (=> b!758535 m!706013))

(assert (=> b!758536 m!705999))

(assert (=> b!758536 m!705999))

(declare-fun m!706015 () Bool)

(assert (=> b!758536 m!706015))

(declare-fun m!706017 () Bool)

(assert (=> b!758517 m!706017))

(assert (=> b!758526 m!705999))

(assert (=> b!758526 m!705999))

(assert (=> b!758526 m!706011))

(assert (=> b!758518 m!705999))

(assert (=> b!758518 m!705999))

(declare-fun m!706019 () Bool)

(assert (=> b!758518 m!706019))

(declare-fun m!706021 () Bool)

(assert (=> b!758521 m!706021))

(declare-fun m!706023 () Bool)

(assert (=> b!758532 m!706023))

(declare-fun m!706025 () Bool)

(assert (=> b!758532 m!706025))

(declare-fun m!706027 () Bool)

(assert (=> b!758532 m!706027))

(declare-fun m!706029 () Bool)

(assert (=> b!758534 m!706029))

(declare-fun m!706031 () Bool)

(assert (=> b!758537 m!706031))

(assert (=> b!758523 m!705999))

(assert (=> b!758523 m!705999))

(declare-fun m!706033 () Bool)

(assert (=> b!758523 m!706033))

(declare-fun m!706035 () Bool)

(assert (=> b!758523 m!706035))

(declare-fun m!706037 () Bool)

(assert (=> b!758523 m!706037))

(declare-fun m!706039 () Bool)

(assert (=> b!758533 m!706039))

(assert (=> b!758527 m!705999))

(assert (=> b!758527 m!705999))

(declare-fun m!706041 () Bool)

(assert (=> b!758527 m!706041))

(check-sat (not b!758525) (not start!65844) (not b!758518) (not b!758529) (not b!758528) (not b!758536) (not b!758520) (not b!758517) (not b!758522) (not b!758537) (not b!758526) (not b!758523) (not b!758532) (not b!758527) (not b!758534) (not b!758521))
(check-sat)
