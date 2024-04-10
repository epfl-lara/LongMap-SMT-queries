; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67732 () Bool)

(assert start!67732)

(declare-fun b!785966 () Bool)

(declare-fun e!436940 () Bool)

(declare-fun e!436929 () Bool)

(assert (=> b!785966 (= e!436940 e!436929)))

(declare-fun res!532103 () Bool)

(assert (=> b!785966 (=> (not res!532103) (not e!436929))))

(declare-datatypes ((array!42772 0))(
  ( (array!42773 (arr!20474 (Array (_ BitVec 32) (_ BitVec 64))) (size!20895 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42772)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8074 0))(
  ( (MissingZero!8074 (index!34664 (_ BitVec 32))) (Found!8074 (index!34665 (_ BitVec 32))) (Intermediate!8074 (undefined!8886 Bool) (index!34666 (_ BitVec 32)) (x!65606 (_ BitVec 32))) (Undefined!8074) (MissingVacant!8074 (index!34667 (_ BitVec 32))) )
))
(declare-fun lt!350491 () SeekEntryResult!8074)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42772 (_ BitVec 32)) SeekEntryResult!8074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785966 (= res!532103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20474 a!3186) j!159) mask!3328) (select (arr!20474 a!3186) j!159) a!3186 mask!3328) lt!350491))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785966 (= lt!350491 (Intermediate!8074 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785967 () Bool)

(declare-fun res!532111 () Bool)

(assert (=> b!785967 (=> (not res!532111) (not e!436929))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785967 (= res!532111 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20474 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!532106 () Bool)

(declare-fun e!436935 () Bool)

(assert (=> start!67732 (=> (not res!532106) (not e!436935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67732 (= res!532106 (validMask!0 mask!3328))))

(assert (=> start!67732 e!436935))

(assert (=> start!67732 true))

(declare-fun array_inv!16270 (array!42772) Bool)

(assert (=> start!67732 (array_inv!16270 a!3186)))

(declare-fun b!785968 () Bool)

(declare-fun e!436931 () Bool)

(assert (=> b!785968 (= e!436929 e!436931)))

(declare-fun res!532109 () Bool)

(assert (=> b!785968 (=> (not res!532109) (not e!436931))))

(declare-fun lt!350487 () SeekEntryResult!8074)

(declare-fun lt!350481 () SeekEntryResult!8074)

(assert (=> b!785968 (= res!532109 (= lt!350487 lt!350481))))

(declare-fun lt!350482 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!350492 () array!42772)

(assert (=> b!785968 (= lt!350481 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350482 lt!350492 mask!3328))))

(assert (=> b!785968 (= lt!350487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350482 mask!3328) lt!350482 lt!350492 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!785968 (= lt!350482 (select (store (arr!20474 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785968 (= lt!350492 (array!42773 (store (arr!20474 a!3186) i!1173 k!2102) (size!20895 a!3186)))))

(declare-fun b!785969 () Bool)

(declare-datatypes ((Unit!27184 0))(
  ( (Unit!27185) )
))
(declare-fun e!436939 () Unit!27184)

(declare-fun Unit!27186 () Unit!27184)

(assert (=> b!785969 (= e!436939 Unit!27186)))

(declare-fun b!785970 () Bool)

(declare-fun res!532115 () Bool)

(assert (=> b!785970 (=> (not res!532115) (not e!436940))))

(declare-datatypes ((List!14476 0))(
  ( (Nil!14473) (Cons!14472 (h!15595 (_ BitVec 64)) (t!20791 List!14476)) )
))
(declare-fun arrayNoDuplicates!0 (array!42772 (_ BitVec 32) List!14476) Bool)

(assert (=> b!785970 (= res!532115 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14473))))

(declare-fun b!785971 () Bool)

(declare-fun e!436933 () Bool)

(declare-fun lt!350486 () SeekEntryResult!8074)

(declare-fun lt!350490 () SeekEntryResult!8074)

(assert (=> b!785971 (= e!436933 (= lt!350486 lt!350490))))

(declare-fun b!785972 () Bool)

(declare-fun e!436932 () Bool)

(assert (=> b!785972 (= e!436931 (not e!436932))))

(declare-fun res!532108 () Bool)

(assert (=> b!785972 (=> res!532108 e!436932)))

(assert (=> b!785972 (= res!532108 (or (not (is-Intermediate!8074 lt!350481)) (bvslt x!1131 (x!65606 lt!350481)) (not (= x!1131 (x!65606 lt!350481))) (not (= index!1321 (index!34666 lt!350481)))))))

(declare-fun e!436934 () Bool)

(assert (=> b!785972 e!436934))

(declare-fun res!532097 () Bool)

(assert (=> b!785972 (=> (not res!532097) (not e!436934))))

(declare-fun lt!350483 () SeekEntryResult!8074)

(assert (=> b!785972 (= res!532097 (= lt!350486 lt!350483))))

(assert (=> b!785972 (= lt!350483 (Found!8074 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42772 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!785972 (= lt!350486 (seekEntryOrOpen!0 (select (arr!20474 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42772 (_ BitVec 32)) Bool)

(assert (=> b!785972 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350488 () Unit!27184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27184)

(assert (=> b!785972 (= lt!350488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785973 () Bool)

(declare-fun e!436938 () Bool)

(declare-fun e!436936 () Bool)

(assert (=> b!785973 (= e!436938 e!436936)))

(declare-fun res!532113 () Bool)

(assert (=> b!785973 (=> res!532113 e!436936)))

(declare-fun lt!350484 () (_ BitVec 64))

(assert (=> b!785973 (= res!532113 (= lt!350484 lt!350482))))

(assert (=> b!785973 (= lt!350484 (select (store (arr!20474 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785974 () Bool)

(assert (=> b!785974 (= e!436935 e!436940)))

(declare-fun res!532099 () Bool)

(assert (=> b!785974 (=> (not res!532099) (not e!436940))))

(declare-fun lt!350485 () SeekEntryResult!8074)

(assert (=> b!785974 (= res!532099 (or (= lt!350485 (MissingZero!8074 i!1173)) (= lt!350485 (MissingVacant!8074 i!1173))))))

(assert (=> b!785974 (= lt!350485 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785975 () Bool)

(declare-fun res!532112 () Bool)

(assert (=> b!785975 (=> (not res!532112) (not e!436935))))

(declare-fun arrayContainsKey!0 (array!42772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785975 (= res!532112 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785976 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42772 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!785976 (= e!436934 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20474 a!3186) j!159) a!3186 mask!3328) lt!350483))))

(declare-fun b!785977 () Bool)

(declare-fun res!532107 () Bool)

(assert (=> b!785977 (=> (not res!532107) (not e!436935))))

(assert (=> b!785977 (= res!532107 (and (= (size!20895 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20895 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20895 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785978 () Bool)

(declare-fun res!532110 () Bool)

(assert (=> b!785978 (=> (not res!532110) (not e!436935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785978 (= res!532110 (validKeyInArray!0 (select (arr!20474 a!3186) j!159)))))

(declare-fun b!785979 () Bool)

(declare-fun e!436930 () Bool)

(assert (=> b!785979 (= e!436930 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20474 a!3186) j!159) a!3186 mask!3328) (Found!8074 j!159)))))

(declare-fun b!785980 () Bool)

(assert (=> b!785980 (= e!436932 e!436938)))

(declare-fun res!532104 () Bool)

(assert (=> b!785980 (=> res!532104 e!436938)))

(assert (=> b!785980 (= res!532104 (not (= lt!350490 lt!350483)))))

(assert (=> b!785980 (= lt!350490 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20474 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785981 () Bool)

(declare-fun res!532098 () Bool)

(assert (=> b!785981 (=> (not res!532098) (not e!436929))))

(assert (=> b!785981 (= res!532098 e!436930)))

(declare-fun c!87343 () Bool)

(assert (=> b!785981 (= c!87343 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785982 () Bool)

(declare-fun res!532101 () Bool)

(assert (=> b!785982 (=> (not res!532101) (not e!436933))))

(assert (=> b!785982 (= res!532101 (= (seekEntryOrOpen!0 lt!350482 lt!350492 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350482 lt!350492 mask!3328)))))

(declare-fun b!785983 () Bool)

(declare-fun res!532105 () Bool)

(assert (=> b!785983 (=> (not res!532105) (not e!436935))))

(assert (=> b!785983 (= res!532105 (validKeyInArray!0 k!2102))))

(declare-fun b!785984 () Bool)

(assert (=> b!785984 (= e!436936 true)))

(assert (=> b!785984 e!436933))

(declare-fun res!532100 () Bool)

(assert (=> b!785984 (=> (not res!532100) (not e!436933))))

(assert (=> b!785984 (= res!532100 (= lt!350484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350489 () Unit!27184)

(assert (=> b!785984 (= lt!350489 e!436939)))

(declare-fun c!87342 () Bool)

(assert (=> b!785984 (= c!87342 (= lt!350484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785985 () Bool)

(declare-fun res!532114 () Bool)

(assert (=> b!785985 (=> (not res!532114) (not e!436940))))

(assert (=> b!785985 (= res!532114 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20895 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20895 a!3186))))))

(declare-fun b!785986 () Bool)

(declare-fun res!532102 () Bool)

(assert (=> b!785986 (=> (not res!532102) (not e!436940))))

(assert (=> b!785986 (= res!532102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785987 () Bool)

(declare-fun Unit!27187 () Unit!27184)

(assert (=> b!785987 (= e!436939 Unit!27187)))

(assert (=> b!785987 false))

(declare-fun b!785988 () Bool)

(assert (=> b!785988 (= e!436930 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20474 a!3186) j!159) a!3186 mask!3328) lt!350491))))

(assert (= (and start!67732 res!532106) b!785977))

(assert (= (and b!785977 res!532107) b!785978))

(assert (= (and b!785978 res!532110) b!785983))

(assert (= (and b!785983 res!532105) b!785975))

(assert (= (and b!785975 res!532112) b!785974))

(assert (= (and b!785974 res!532099) b!785986))

(assert (= (and b!785986 res!532102) b!785970))

(assert (= (and b!785970 res!532115) b!785985))

(assert (= (and b!785985 res!532114) b!785966))

(assert (= (and b!785966 res!532103) b!785967))

(assert (= (and b!785967 res!532111) b!785981))

(assert (= (and b!785981 c!87343) b!785988))

(assert (= (and b!785981 (not c!87343)) b!785979))

(assert (= (and b!785981 res!532098) b!785968))

(assert (= (and b!785968 res!532109) b!785972))

(assert (= (and b!785972 res!532097) b!785976))

(assert (= (and b!785972 (not res!532108)) b!785980))

(assert (= (and b!785980 (not res!532104)) b!785973))

(assert (= (and b!785973 (not res!532113)) b!785984))

(assert (= (and b!785984 c!87342) b!785987))

(assert (= (and b!785984 (not c!87342)) b!785969))

(assert (= (and b!785984 res!532100) b!785982))

(assert (= (and b!785982 res!532101) b!785971))

(declare-fun m!727909 () Bool)

(assert (=> b!785988 m!727909))

(assert (=> b!785988 m!727909))

(declare-fun m!727911 () Bool)

(assert (=> b!785988 m!727911))

(declare-fun m!727913 () Bool)

(assert (=> start!67732 m!727913))

(declare-fun m!727915 () Bool)

(assert (=> start!67732 m!727915))

(declare-fun m!727917 () Bool)

(assert (=> b!785970 m!727917))

(declare-fun m!727919 () Bool)

(assert (=> b!785974 m!727919))

(assert (=> b!785978 m!727909))

(assert (=> b!785978 m!727909))

(declare-fun m!727921 () Bool)

(assert (=> b!785978 m!727921))

(assert (=> b!785980 m!727909))

(assert (=> b!785980 m!727909))

(declare-fun m!727923 () Bool)

(assert (=> b!785980 m!727923))

(declare-fun m!727925 () Bool)

(assert (=> b!785983 m!727925))

(assert (=> b!785979 m!727909))

(assert (=> b!785979 m!727909))

(assert (=> b!785979 m!727923))

(declare-fun m!727927 () Bool)

(assert (=> b!785986 m!727927))

(assert (=> b!785966 m!727909))

(assert (=> b!785966 m!727909))

(declare-fun m!727929 () Bool)

(assert (=> b!785966 m!727929))

(assert (=> b!785966 m!727929))

(assert (=> b!785966 m!727909))

(declare-fun m!727931 () Bool)

(assert (=> b!785966 m!727931))

(declare-fun m!727933 () Bool)

(assert (=> b!785975 m!727933))

(assert (=> b!785972 m!727909))

(assert (=> b!785972 m!727909))

(declare-fun m!727935 () Bool)

(assert (=> b!785972 m!727935))

(declare-fun m!727937 () Bool)

(assert (=> b!785972 m!727937))

(declare-fun m!727939 () Bool)

(assert (=> b!785972 m!727939))

(declare-fun m!727941 () Bool)

(assert (=> b!785973 m!727941))

(declare-fun m!727943 () Bool)

(assert (=> b!785973 m!727943))

(assert (=> b!785968 m!727941))

(declare-fun m!727945 () Bool)

(assert (=> b!785968 m!727945))

(declare-fun m!727947 () Bool)

(assert (=> b!785968 m!727947))

(declare-fun m!727949 () Bool)

(assert (=> b!785968 m!727949))

(declare-fun m!727951 () Bool)

(assert (=> b!785968 m!727951))

(assert (=> b!785968 m!727949))

(declare-fun m!727953 () Bool)

(assert (=> b!785982 m!727953))

(declare-fun m!727955 () Bool)

(assert (=> b!785982 m!727955))

(declare-fun m!727957 () Bool)

(assert (=> b!785967 m!727957))

(assert (=> b!785976 m!727909))

(assert (=> b!785976 m!727909))

(declare-fun m!727959 () Bool)

(assert (=> b!785976 m!727959))

(push 1)

