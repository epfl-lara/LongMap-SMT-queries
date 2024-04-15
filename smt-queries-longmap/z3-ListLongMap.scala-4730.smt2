; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65420 () Bool)

(assert start!65420)

(declare-fun b!745089 () Bool)

(declare-fun res!502131 () Bool)

(declare-fun e!416141 () Bool)

(assert (=> b!745089 (=> (not res!502131) (not e!416141))))

(declare-datatypes ((array!41610 0))(
  ( (array!41611 (arr!19919 (Array (_ BitVec 32) (_ BitVec 64))) (size!20340 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41610)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!745089 (= res!502131 (and (= (size!20340 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20340 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20340 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745090 () Bool)

(declare-fun res!502125 () Bool)

(declare-fun e!416144 () Bool)

(assert (=> b!745090 (=> (not res!502125) (not e!416144))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745090 (= res!502125 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20340 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20340 a!3186))))))

(declare-fun b!745091 () Bool)

(declare-fun e!416146 () Bool)

(declare-fun e!416140 () Bool)

(assert (=> b!745091 (= e!416146 e!416140)))

(declare-fun res!502118 () Bool)

(assert (=> b!745091 (=> (not res!502118) (not e!416140))))

(declare-datatypes ((SeekEntryResult!7516 0))(
  ( (MissingZero!7516 (index!32432 (_ BitVec 32))) (Found!7516 (index!32433 (_ BitVec 32))) (Intermediate!7516 (undefined!8328 Bool) (index!32434 (_ BitVec 32)) (x!63397 (_ BitVec 32))) (Undefined!7516) (MissingVacant!7516 (index!32435 (_ BitVec 32))) )
))
(declare-fun lt!330889 () SeekEntryResult!7516)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41610 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!745091 (= res!502118 (= (seekEntryOrOpen!0 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!330889))))

(assert (=> b!745091 (= lt!330889 (Found!7516 j!159))))

(declare-fun b!745092 () Bool)

(declare-fun res!502126 () Bool)

(declare-fun e!416139 () Bool)

(assert (=> b!745092 (=> (not res!502126) (not e!416139))))

(declare-fun e!416142 () Bool)

(assert (=> b!745092 (= res!502126 e!416142)))

(declare-fun c!81867 () Bool)

(assert (=> b!745092 (= c!81867 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745093 () Bool)

(declare-fun e!416138 () Bool)

(assert (=> b!745093 (= e!416139 e!416138)))

(declare-fun res!502129 () Bool)

(assert (=> b!745093 (=> (not res!502129) (not e!416138))))

(declare-fun lt!330883 () SeekEntryResult!7516)

(declare-fun lt!330887 () SeekEntryResult!7516)

(assert (=> b!745093 (= res!502129 (= lt!330883 lt!330887))))

(declare-fun lt!330890 () array!41610)

(declare-fun lt!330886 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41610 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!745093 (= lt!330887 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330886 lt!330890 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745093 (= lt!330883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330886 mask!3328) lt!330886 lt!330890 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!745093 (= lt!330886 (select (store (arr!19919 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745093 (= lt!330890 (array!41611 (store (arr!19919 a!3186) i!1173 k0!2102) (size!20340 a!3186)))))

(declare-fun b!745094 () Bool)

(assert (=> b!745094 (= e!416144 e!416139)))

(declare-fun res!502124 () Bool)

(assert (=> b!745094 (=> (not res!502124) (not e!416139))))

(declare-fun lt!330888 () SeekEntryResult!7516)

(assert (=> b!745094 (= res!502124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19919 a!3186) j!159) mask!3328) (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!330888))))

(assert (=> b!745094 (= lt!330888 (Intermediate!7516 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745095 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41610 (_ BitVec 32)) SeekEntryResult!7516)

(assert (=> b!745095 (= e!416140 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!330889))))

(declare-fun b!745096 () Bool)

(assert (=> b!745096 (= e!416142 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) (Found!7516 j!159)))))

(declare-fun res!502130 () Bool)

(assert (=> start!65420 (=> (not res!502130) (not e!416141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65420 (= res!502130 (validMask!0 mask!3328))))

(assert (=> start!65420 e!416141))

(assert (=> start!65420 true))

(declare-fun array_inv!15802 (array!41610) Bool)

(assert (=> start!65420 (array_inv!15802 a!3186)))

(declare-fun b!745097 () Bool)

(declare-fun res!502117 () Bool)

(assert (=> b!745097 (=> (not res!502117) (not e!416141))))

(declare-fun arrayContainsKey!0 (array!41610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745097 (= res!502117 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745098 () Bool)

(declare-fun res!502119 () Bool)

(assert (=> b!745098 (=> (not res!502119) (not e!416144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41610 (_ BitVec 32)) Bool)

(assert (=> b!745098 (= res!502119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745099 () Bool)

(declare-fun res!502120 () Bool)

(assert (=> b!745099 (=> (not res!502120) (not e!416139))))

(assert (=> b!745099 (= res!502120 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19919 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745100 () Bool)

(declare-fun res!502123 () Bool)

(assert (=> b!745100 (=> (not res!502123) (not e!416141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745100 (= res!502123 (validKeyInArray!0 k0!2102))))

(declare-fun b!745101 () Bool)

(declare-fun e!416145 () Bool)

(assert (=> b!745101 (= e!416145 true)))

(declare-fun lt!330882 () SeekEntryResult!7516)

(assert (=> b!745101 (= lt!330882 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19919 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745102 () Bool)

(assert (=> b!745102 (= e!416141 e!416144)))

(declare-fun res!502121 () Bool)

(assert (=> b!745102 (=> (not res!502121) (not e!416144))))

(declare-fun lt!330885 () SeekEntryResult!7516)

(assert (=> b!745102 (= res!502121 (or (= lt!330885 (MissingZero!7516 i!1173)) (= lt!330885 (MissingVacant!7516 i!1173))))))

(assert (=> b!745102 (= lt!330885 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745103 () Bool)

(declare-fun res!502116 () Bool)

(assert (=> b!745103 (=> (not res!502116) (not e!416141))))

(assert (=> b!745103 (= res!502116 (validKeyInArray!0 (select (arr!19919 a!3186) j!159)))))

(declare-fun b!745104 () Bool)

(assert (=> b!745104 (= e!416138 (not e!416145))))

(declare-fun res!502127 () Bool)

(assert (=> b!745104 (=> res!502127 e!416145)))

(get-info :version)

(assert (=> b!745104 (= res!502127 (or (not ((_ is Intermediate!7516) lt!330887)) (bvslt x!1131 (x!63397 lt!330887)) (not (= x!1131 (x!63397 lt!330887))) (not (= index!1321 (index!32434 lt!330887)))))))

(assert (=> b!745104 e!416146))

(declare-fun res!502122 () Bool)

(assert (=> b!745104 (=> (not res!502122) (not e!416146))))

(assert (=> b!745104 (= res!502122 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25484 0))(
  ( (Unit!25485) )
))
(declare-fun lt!330884 () Unit!25484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25484)

(assert (=> b!745104 (= lt!330884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745105 () Bool)

(assert (=> b!745105 (= e!416142 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19919 a!3186) j!159) a!3186 mask!3328) lt!330888))))

(declare-fun b!745106 () Bool)

(declare-fun res!502128 () Bool)

(assert (=> b!745106 (=> (not res!502128) (not e!416144))))

(declare-datatypes ((List!13960 0))(
  ( (Nil!13957) (Cons!13956 (h!15028 (_ BitVec 64)) (t!20266 List!13960)) )
))
(declare-fun arrayNoDuplicates!0 (array!41610 (_ BitVec 32) List!13960) Bool)

(assert (=> b!745106 (= res!502128 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13957))))

(assert (= (and start!65420 res!502130) b!745089))

(assert (= (and b!745089 res!502131) b!745103))

(assert (= (and b!745103 res!502116) b!745100))

(assert (= (and b!745100 res!502123) b!745097))

(assert (= (and b!745097 res!502117) b!745102))

(assert (= (and b!745102 res!502121) b!745098))

(assert (= (and b!745098 res!502119) b!745106))

(assert (= (and b!745106 res!502128) b!745090))

(assert (= (and b!745090 res!502125) b!745094))

(assert (= (and b!745094 res!502124) b!745099))

(assert (= (and b!745099 res!502120) b!745092))

(assert (= (and b!745092 c!81867) b!745105))

(assert (= (and b!745092 (not c!81867)) b!745096))

(assert (= (and b!745092 res!502126) b!745093))

(assert (= (and b!745093 res!502129) b!745104))

(assert (= (and b!745104 res!502122) b!745091))

(assert (= (and b!745091 res!502118) b!745095))

(assert (= (and b!745104 (not res!502127)) b!745101))

(declare-fun m!694973 () Bool)

(assert (=> b!745098 m!694973))

(declare-fun m!694975 () Bool)

(assert (=> b!745100 m!694975))

(declare-fun m!694977 () Bool)

(assert (=> b!745096 m!694977))

(assert (=> b!745096 m!694977))

(declare-fun m!694979 () Bool)

(assert (=> b!745096 m!694979))

(declare-fun m!694981 () Bool)

(assert (=> b!745102 m!694981))

(assert (=> b!745105 m!694977))

(assert (=> b!745105 m!694977))

(declare-fun m!694983 () Bool)

(assert (=> b!745105 m!694983))

(declare-fun m!694985 () Bool)

(assert (=> b!745097 m!694985))

(assert (=> b!745101 m!694977))

(assert (=> b!745101 m!694977))

(assert (=> b!745101 m!694979))

(assert (=> b!745103 m!694977))

(assert (=> b!745103 m!694977))

(declare-fun m!694987 () Bool)

(assert (=> b!745103 m!694987))

(declare-fun m!694989 () Bool)

(assert (=> b!745106 m!694989))

(declare-fun m!694991 () Bool)

(assert (=> b!745093 m!694991))

(declare-fun m!694993 () Bool)

(assert (=> b!745093 m!694993))

(declare-fun m!694995 () Bool)

(assert (=> b!745093 m!694995))

(declare-fun m!694997 () Bool)

(assert (=> b!745093 m!694997))

(assert (=> b!745093 m!694993))

(declare-fun m!694999 () Bool)

(assert (=> b!745093 m!694999))

(assert (=> b!745091 m!694977))

(assert (=> b!745091 m!694977))

(declare-fun m!695001 () Bool)

(assert (=> b!745091 m!695001))

(declare-fun m!695003 () Bool)

(assert (=> b!745099 m!695003))

(declare-fun m!695005 () Bool)

(assert (=> b!745104 m!695005))

(declare-fun m!695007 () Bool)

(assert (=> b!745104 m!695007))

(declare-fun m!695009 () Bool)

(assert (=> start!65420 m!695009))

(declare-fun m!695011 () Bool)

(assert (=> start!65420 m!695011))

(assert (=> b!745094 m!694977))

(assert (=> b!745094 m!694977))

(declare-fun m!695013 () Bool)

(assert (=> b!745094 m!695013))

(assert (=> b!745094 m!695013))

(assert (=> b!745094 m!694977))

(declare-fun m!695015 () Bool)

(assert (=> b!745094 m!695015))

(assert (=> b!745095 m!694977))

(assert (=> b!745095 m!694977))

(declare-fun m!695017 () Bool)

(assert (=> b!745095 m!695017))

(check-sat (not b!745104) (not b!745094) (not b!745097) (not b!745095) (not b!745105) (not b!745106) (not b!745101) (not b!745098) (not b!745096) (not start!65420) (not b!745100) (not b!745091) (not b!745102) (not b!745093) (not b!745103))
(check-sat)
