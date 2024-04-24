; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68002 () Bool)

(assert start!68002)

(declare-fun b!790031 () Bool)

(declare-fun e!439167 () Bool)

(assert (=> b!790031 (= e!439167 true)))

(declare-fun e!439165 () Bool)

(assert (=> b!790031 e!439165))

(declare-fun res!534961 () Bool)

(assert (=> b!790031 (=> (not res!534961) (not e!439165))))

(declare-fun lt!352488 () (_ BitVec 64))

(assert (=> b!790031 (= res!534961 (= lt!352488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27337 0))(
  ( (Unit!27338) )
))
(declare-fun lt!352491 () Unit!27337)

(declare-fun e!439164 () Unit!27337)

(assert (=> b!790031 (= lt!352491 e!439164)))

(declare-fun c!87956 () Bool)

(assert (=> b!790031 (= c!87956 (= lt!352488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790032 () Bool)

(declare-fun e!439170 () Bool)

(declare-fun e!439174 () Bool)

(assert (=> b!790032 (= e!439170 e!439174)))

(declare-fun res!534950 () Bool)

(assert (=> b!790032 (=> res!534950 e!439174)))

(declare-datatypes ((SeekEntryResult!8068 0))(
  ( (MissingZero!8068 (index!34640 (_ BitVec 32))) (Found!8068 (index!34641 (_ BitVec 32))) (Intermediate!8068 (undefined!8880 Bool) (index!34642 (_ BitVec 32)) (x!65740 (_ BitVec 32))) (Undefined!8068) (MissingVacant!8068 (index!34643 (_ BitVec 32))) )
))
(declare-fun lt!352490 () SeekEntryResult!8068)

(declare-fun lt!352487 () SeekEntryResult!8068)

(assert (=> b!790032 (= res!534950 (not (= lt!352490 lt!352487)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42859 0))(
  ( (array!42860 (arr!20512 (Array (_ BitVec 32) (_ BitVec 64))) (size!20932 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42859)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42859 (_ BitVec 32)) SeekEntryResult!8068)

(assert (=> b!790032 (= lt!352490 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20512 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790033 () Bool)

(declare-fun res!534948 () Bool)

(declare-fun e!439172 () Bool)

(assert (=> b!790033 (=> (not res!534948) (not e!439172))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790033 (= res!534948 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20932 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20932 a!3186))))))

(declare-fun b!790034 () Bool)

(declare-fun e!439166 () Bool)

(assert (=> b!790034 (= e!439166 (not e!439170))))

(declare-fun res!534955 () Bool)

(assert (=> b!790034 (=> res!534955 e!439170)))

(declare-fun lt!352485 () SeekEntryResult!8068)

(get-info :version)

(assert (=> b!790034 (= res!534955 (or (not ((_ is Intermediate!8068) lt!352485)) (bvslt x!1131 (x!65740 lt!352485)) (not (= x!1131 (x!65740 lt!352485))) (not (= index!1321 (index!34642 lt!352485)))))))

(declare-fun e!439168 () Bool)

(assert (=> b!790034 e!439168))

(declare-fun res!534962 () Bool)

(assert (=> b!790034 (=> (not res!534962) (not e!439168))))

(declare-fun lt!352486 () SeekEntryResult!8068)

(assert (=> b!790034 (= res!534962 (= lt!352486 lt!352487))))

(assert (=> b!790034 (= lt!352487 (Found!8068 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42859 (_ BitVec 32)) SeekEntryResult!8068)

(assert (=> b!790034 (= lt!352486 (seekEntryOrOpen!0 (select (arr!20512 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42859 (_ BitVec 32)) Bool)

(assert (=> b!790034 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352483 () Unit!27337)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27337)

(assert (=> b!790034 (= lt!352483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790035 () Bool)

(declare-fun e!439171 () Bool)

(assert (=> b!790035 (= e!439172 e!439171)))

(declare-fun res!534947 () Bool)

(assert (=> b!790035 (=> (not res!534947) (not e!439171))))

(declare-fun lt!352482 () SeekEntryResult!8068)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42859 (_ BitVec 32)) SeekEntryResult!8068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790035 (= res!534947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20512 a!3186) j!159) mask!3328) (select (arr!20512 a!3186) j!159) a!3186 mask!3328) lt!352482))))

(assert (=> b!790035 (= lt!352482 (Intermediate!8068 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!534945 () Bool)

(declare-fun e!439173 () Bool)

(assert (=> start!68002 (=> (not res!534945) (not e!439173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68002 (= res!534945 (validMask!0 mask!3328))))

(assert (=> start!68002 e!439173))

(assert (=> start!68002 true))

(declare-fun array_inv!16371 (array!42859) Bool)

(assert (=> start!68002 (array_inv!16371 a!3186)))

(declare-fun b!790036 () Bool)

(declare-fun Unit!27339 () Unit!27337)

(assert (=> b!790036 (= e!439164 Unit!27339)))

(assert (=> b!790036 false))

(declare-fun b!790037 () Bool)

(assert (=> b!790037 (= e!439168 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20512 a!3186) j!159) a!3186 mask!3328) lt!352487))))

(declare-fun b!790038 () Bool)

(declare-fun e!439163 () Bool)

(assert (=> b!790038 (= e!439163 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20512 a!3186) j!159) a!3186 mask!3328) lt!352482))))

(declare-fun b!790039 () Bool)

(declare-fun res!534956 () Bool)

(assert (=> b!790039 (=> (not res!534956) (not e!439171))))

(assert (=> b!790039 (= res!534956 e!439163)))

(declare-fun c!87955 () Bool)

(assert (=> b!790039 (= c!87955 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790040 () Bool)

(declare-fun res!534946 () Bool)

(assert (=> b!790040 (=> (not res!534946) (not e!439173))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790040 (= res!534946 (and (= (size!20932 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20932 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20932 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790041 () Bool)

(declare-fun res!534959 () Bool)

(assert (=> b!790041 (=> (not res!534959) (not e!439165))))

(declare-fun lt!352492 () (_ BitVec 64))

(declare-fun lt!352489 () array!42859)

(assert (=> b!790041 (= res!534959 (= (seekEntryOrOpen!0 lt!352492 lt!352489 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352492 lt!352489 mask!3328)))))

(declare-fun b!790042 () Bool)

(declare-fun res!534960 () Bool)

(assert (=> b!790042 (=> (not res!534960) (not e!439172))))

(assert (=> b!790042 (= res!534960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790043 () Bool)

(declare-fun res!534949 () Bool)

(assert (=> b!790043 (=> (not res!534949) (not e!439172))))

(declare-datatypes ((List!14421 0))(
  ( (Nil!14418) (Cons!14417 (h!15549 (_ BitVec 64)) (t!20728 List!14421)) )
))
(declare-fun arrayNoDuplicates!0 (array!42859 (_ BitVec 32) List!14421) Bool)

(assert (=> b!790043 (= res!534949 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14418))))

(declare-fun b!790044 () Bool)

(assert (=> b!790044 (= e!439174 e!439167)))

(declare-fun res!534957 () Bool)

(assert (=> b!790044 (=> res!534957 e!439167)))

(assert (=> b!790044 (= res!534957 (= lt!352488 lt!352492))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!790044 (= lt!352488 (select (store (arr!20512 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!790045 () Bool)

(declare-fun res!534953 () Bool)

(assert (=> b!790045 (=> (not res!534953) (not e!439173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790045 (= res!534953 (validKeyInArray!0 (select (arr!20512 a!3186) j!159)))))

(declare-fun b!790046 () Bool)

(declare-fun Unit!27340 () Unit!27337)

(assert (=> b!790046 (= e!439164 Unit!27340)))

(declare-fun b!790047 () Bool)

(assert (=> b!790047 (= e!439173 e!439172)))

(declare-fun res!534954 () Bool)

(assert (=> b!790047 (=> (not res!534954) (not e!439172))))

(declare-fun lt!352484 () SeekEntryResult!8068)

(assert (=> b!790047 (= res!534954 (or (= lt!352484 (MissingZero!8068 i!1173)) (= lt!352484 (MissingVacant!8068 i!1173))))))

(assert (=> b!790047 (= lt!352484 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790048 () Bool)

(assert (=> b!790048 (= e!439171 e!439166)))

(declare-fun res!534952 () Bool)

(assert (=> b!790048 (=> (not res!534952) (not e!439166))))

(declare-fun lt!352481 () SeekEntryResult!8068)

(assert (=> b!790048 (= res!534952 (= lt!352481 lt!352485))))

(assert (=> b!790048 (= lt!352485 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352492 lt!352489 mask!3328))))

(assert (=> b!790048 (= lt!352481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352492 mask!3328) lt!352492 lt!352489 mask!3328))))

(assert (=> b!790048 (= lt!352492 (select (store (arr!20512 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790048 (= lt!352489 (array!42860 (store (arr!20512 a!3186) i!1173 k0!2102) (size!20932 a!3186)))))

(declare-fun b!790049 () Bool)

(assert (=> b!790049 (= e!439163 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20512 a!3186) j!159) a!3186 mask!3328) (Found!8068 j!159)))))

(declare-fun b!790050 () Bool)

(declare-fun res!534958 () Bool)

(assert (=> b!790050 (=> (not res!534958) (not e!439171))))

(assert (=> b!790050 (= res!534958 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20512 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790051 () Bool)

(declare-fun res!534963 () Bool)

(assert (=> b!790051 (=> (not res!534963) (not e!439173))))

(declare-fun arrayContainsKey!0 (array!42859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790051 (= res!534963 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790052 () Bool)

(assert (=> b!790052 (= e!439165 (= lt!352486 lt!352490))))

(declare-fun b!790053 () Bool)

(declare-fun res!534951 () Bool)

(assert (=> b!790053 (=> (not res!534951) (not e!439173))))

(assert (=> b!790053 (= res!534951 (validKeyInArray!0 k0!2102))))

(assert (= (and start!68002 res!534945) b!790040))

(assert (= (and b!790040 res!534946) b!790045))

(assert (= (and b!790045 res!534953) b!790053))

(assert (= (and b!790053 res!534951) b!790051))

(assert (= (and b!790051 res!534963) b!790047))

(assert (= (and b!790047 res!534954) b!790042))

(assert (= (and b!790042 res!534960) b!790043))

(assert (= (and b!790043 res!534949) b!790033))

(assert (= (and b!790033 res!534948) b!790035))

(assert (= (and b!790035 res!534947) b!790050))

(assert (= (and b!790050 res!534958) b!790039))

(assert (= (and b!790039 c!87955) b!790038))

(assert (= (and b!790039 (not c!87955)) b!790049))

(assert (= (and b!790039 res!534956) b!790048))

(assert (= (and b!790048 res!534952) b!790034))

(assert (= (and b!790034 res!534962) b!790037))

(assert (= (and b!790034 (not res!534955)) b!790032))

(assert (= (and b!790032 (not res!534950)) b!790044))

(assert (= (and b!790044 (not res!534957)) b!790031))

(assert (= (and b!790031 c!87956) b!790036))

(assert (= (and b!790031 (not c!87956)) b!790046))

(assert (= (and b!790031 res!534961) b!790041))

(assert (= (and b!790041 res!534959) b!790052))

(declare-fun m!731543 () Bool)

(assert (=> b!790049 m!731543))

(assert (=> b!790049 m!731543))

(declare-fun m!731545 () Bool)

(assert (=> b!790049 m!731545))

(assert (=> b!790037 m!731543))

(assert (=> b!790037 m!731543))

(declare-fun m!731547 () Bool)

(assert (=> b!790037 m!731547))

(declare-fun m!731549 () Bool)

(assert (=> b!790043 m!731549))

(declare-fun m!731551 () Bool)

(assert (=> b!790050 m!731551))

(assert (=> b!790034 m!731543))

(assert (=> b!790034 m!731543))

(declare-fun m!731553 () Bool)

(assert (=> b!790034 m!731553))

(declare-fun m!731555 () Bool)

(assert (=> b!790034 m!731555))

(declare-fun m!731557 () Bool)

(assert (=> b!790034 m!731557))

(declare-fun m!731559 () Bool)

(assert (=> b!790047 m!731559))

(assert (=> b!790045 m!731543))

(assert (=> b!790045 m!731543))

(declare-fun m!731561 () Bool)

(assert (=> b!790045 m!731561))

(declare-fun m!731563 () Bool)

(assert (=> start!68002 m!731563))

(declare-fun m!731565 () Bool)

(assert (=> start!68002 m!731565))

(declare-fun m!731567 () Bool)

(assert (=> b!790042 m!731567))

(declare-fun m!731569 () Bool)

(assert (=> b!790041 m!731569))

(declare-fun m!731571 () Bool)

(assert (=> b!790041 m!731571))

(assert (=> b!790038 m!731543))

(assert (=> b!790038 m!731543))

(declare-fun m!731573 () Bool)

(assert (=> b!790038 m!731573))

(declare-fun m!731575 () Bool)

(assert (=> b!790048 m!731575))

(declare-fun m!731577 () Bool)

(assert (=> b!790048 m!731577))

(declare-fun m!731579 () Bool)

(assert (=> b!790048 m!731579))

(declare-fun m!731581 () Bool)

(assert (=> b!790048 m!731581))

(assert (=> b!790048 m!731581))

(declare-fun m!731583 () Bool)

(assert (=> b!790048 m!731583))

(declare-fun m!731585 () Bool)

(assert (=> b!790051 m!731585))

(assert (=> b!790044 m!731577))

(declare-fun m!731587 () Bool)

(assert (=> b!790044 m!731587))

(assert (=> b!790035 m!731543))

(assert (=> b!790035 m!731543))

(declare-fun m!731589 () Bool)

(assert (=> b!790035 m!731589))

(assert (=> b!790035 m!731589))

(assert (=> b!790035 m!731543))

(declare-fun m!731591 () Bool)

(assert (=> b!790035 m!731591))

(assert (=> b!790032 m!731543))

(assert (=> b!790032 m!731543))

(assert (=> b!790032 m!731545))

(declare-fun m!731593 () Bool)

(assert (=> b!790053 m!731593))

(check-sat (not b!790051) (not b!790037) (not start!68002) (not b!790049) (not b!790032) (not b!790048) (not b!790053) (not b!790042) (not b!790045) (not b!790035) (not b!790047) (not b!790041) (not b!790043) (not b!790034) (not b!790038))
(check-sat)
