; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65686 () Bool)

(assert start!65686)

(declare-fun b!753080 () Bool)

(declare-fun e!420046 () Bool)

(declare-fun e!420043 () Bool)

(assert (=> b!753080 (= e!420046 e!420043)))

(declare-fun res!508669 () Bool)

(assert (=> b!753080 (=> res!508669 e!420043)))

(declare-fun lt!335045 () (_ BitVec 64))

(declare-fun lt!335036 () (_ BitVec 64))

(assert (=> b!753080 (= res!508669 (= lt!335045 lt!335036))))

(declare-datatypes ((array!41859 0))(
  ( (array!41860 (arr!20043 (Array (_ BitVec 32) (_ BitVec 64))) (size!20464 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41859)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753080 (= lt!335045 (select (store (arr!20043 a!3186) i!1173 k!2102) index!1321))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!420051 () Bool)

(declare-fun b!753081 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7643 0))(
  ( (MissingZero!7643 (index!32940 (_ BitVec 32))) (Found!7643 (index!32941 (_ BitVec 32))) (Intermediate!7643 (undefined!8455 Bool) (index!32942 (_ BitVec 32)) (x!63857 (_ BitVec 32))) (Undefined!7643) (MissingVacant!7643 (index!32943 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41859 (_ BitVec 32)) SeekEntryResult!7643)

(assert (=> b!753081 (= e!420051 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20043 a!3186) j!159) a!3186 mask!3328) (Found!7643 j!159)))))

(declare-fun b!753082 () Bool)

(declare-fun e!420047 () Bool)

(declare-fun lt!335034 () SeekEntryResult!7643)

(declare-fun lt!335035 () SeekEntryResult!7643)

(assert (=> b!753082 (= e!420047 (= lt!335034 lt!335035))))

(declare-fun res!508679 () Bool)

(declare-fun e!420052 () Bool)

(assert (=> start!65686 (=> (not res!508679) (not e!420052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65686 (= res!508679 (validMask!0 mask!3328))))

(assert (=> start!65686 e!420052))

(assert (=> start!65686 true))

(declare-fun array_inv!15839 (array!41859) Bool)

(assert (=> start!65686 (array_inv!15839 a!3186)))

(declare-fun b!753083 () Bool)

(declare-fun e!420044 () Bool)

(assert (=> b!753083 (= e!420052 e!420044)))

(declare-fun res!508670 () Bool)

(assert (=> b!753083 (=> (not res!508670) (not e!420044))))

(declare-fun lt!335044 () SeekEntryResult!7643)

(assert (=> b!753083 (= res!508670 (or (= lt!335044 (MissingZero!7643 i!1173)) (= lt!335044 (MissingVacant!7643 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41859 (_ BitVec 32)) SeekEntryResult!7643)

(assert (=> b!753083 (= lt!335044 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753084 () Bool)

(declare-fun res!508677 () Bool)

(assert (=> b!753084 (=> (not res!508677) (not e!420052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753084 (= res!508677 (validKeyInArray!0 (select (arr!20043 a!3186) j!159)))))

(declare-fun b!753085 () Bool)

(declare-fun e!420049 () Bool)

(declare-fun e!420050 () Bool)

(assert (=> b!753085 (= e!420049 (not e!420050))))

(declare-fun res!508672 () Bool)

(assert (=> b!753085 (=> res!508672 e!420050)))

(declare-fun lt!335038 () SeekEntryResult!7643)

(assert (=> b!753085 (= res!508672 (or (not (is-Intermediate!7643 lt!335038)) (bvslt x!1131 (x!63857 lt!335038)) (not (= x!1131 (x!63857 lt!335038))) (not (= index!1321 (index!32942 lt!335038)))))))

(declare-fun e!420053 () Bool)

(assert (=> b!753085 e!420053))

(declare-fun res!508685 () Bool)

(assert (=> b!753085 (=> (not res!508685) (not e!420053))))

(declare-fun lt!335043 () SeekEntryResult!7643)

(assert (=> b!753085 (= res!508685 (= lt!335034 lt!335043))))

(assert (=> b!753085 (= lt!335043 (Found!7643 j!159))))

(assert (=> b!753085 (= lt!335034 (seekEntryOrOpen!0 (select (arr!20043 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41859 (_ BitVec 32)) Bool)

(assert (=> b!753085 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25952 0))(
  ( (Unit!25953) )
))
(declare-fun lt!335040 () Unit!25952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25952)

(assert (=> b!753085 (= lt!335040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753086 () Bool)

(declare-fun res!508671 () Bool)

(assert (=> b!753086 (=> (not res!508671) (not e!420044))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753086 (= res!508671 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20464 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20464 a!3186))))))

(declare-fun b!753087 () Bool)

(assert (=> b!753087 (= e!420050 e!420046)))

(declare-fun res!508675 () Bool)

(assert (=> b!753087 (=> res!508675 e!420046)))

(assert (=> b!753087 (= res!508675 (not (= lt!335035 lt!335043)))))

(assert (=> b!753087 (= lt!335035 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20043 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753088 () Bool)

(declare-fun e!420042 () Unit!25952)

(declare-fun Unit!25954 () Unit!25952)

(assert (=> b!753088 (= e!420042 Unit!25954)))

(assert (=> b!753088 false))

(declare-fun b!753089 () Bool)

(declare-fun Unit!25955 () Unit!25952)

(assert (=> b!753089 (= e!420042 Unit!25955)))

(declare-fun b!753090 () Bool)

(declare-fun res!508682 () Bool)

(assert (=> b!753090 (=> (not res!508682) (not e!420052))))

(assert (=> b!753090 (= res!508682 (validKeyInArray!0 k!2102))))

(declare-fun b!753091 () Bool)

(declare-fun res!508684 () Bool)

(assert (=> b!753091 (=> (not res!508684) (not e!420044))))

(assert (=> b!753091 (= res!508684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753092 () Bool)

(declare-fun e!420045 () Bool)

(assert (=> b!753092 (= e!420044 e!420045)))

(declare-fun res!508680 () Bool)

(assert (=> b!753092 (=> (not res!508680) (not e!420045))))

(declare-fun lt!335041 () SeekEntryResult!7643)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41859 (_ BitVec 32)) SeekEntryResult!7643)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753092 (= res!508680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20043 a!3186) j!159) mask!3328) (select (arr!20043 a!3186) j!159) a!3186 mask!3328) lt!335041))))

(assert (=> b!753092 (= lt!335041 (Intermediate!7643 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753093 () Bool)

(declare-fun res!508673 () Bool)

(assert (=> b!753093 (=> (not res!508673) (not e!420047))))

(declare-fun lt!335039 () array!41859)

(assert (=> b!753093 (= res!508673 (= (seekEntryOrOpen!0 lt!335036 lt!335039 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335036 lt!335039 mask!3328)))))

(declare-fun b!753094 () Bool)

(declare-fun res!508678 () Bool)

(assert (=> b!753094 (=> (not res!508678) (not e!420045))))

(assert (=> b!753094 (= res!508678 e!420051)))

(declare-fun c!82587 () Bool)

(assert (=> b!753094 (= c!82587 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753095 () Bool)

(declare-fun res!508668 () Bool)

(assert (=> b!753095 (=> (not res!508668) (not e!420052))))

(declare-fun arrayContainsKey!0 (array!41859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753095 (= res!508668 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753096 () Bool)

(assert (=> b!753096 (= e!420053 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20043 a!3186) j!159) a!3186 mask!3328) lt!335043))))

(declare-fun b!753097 () Bool)

(assert (=> b!753097 (= e!420043 true)))

(assert (=> b!753097 e!420047))

(declare-fun res!508683 () Bool)

(assert (=> b!753097 (=> (not res!508683) (not e!420047))))

(assert (=> b!753097 (= res!508683 (= lt!335045 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335042 () Unit!25952)

(assert (=> b!753097 (= lt!335042 e!420042)))

(declare-fun c!82588 () Bool)

(assert (=> b!753097 (= c!82588 (= lt!335045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753098 () Bool)

(declare-fun res!508676 () Bool)

(assert (=> b!753098 (=> (not res!508676) (not e!420045))))

(assert (=> b!753098 (= res!508676 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20043 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753099 () Bool)

(assert (=> b!753099 (= e!420051 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20043 a!3186) j!159) a!3186 mask!3328) lt!335041))))

(declare-fun b!753100 () Bool)

(assert (=> b!753100 (= e!420045 e!420049)))

(declare-fun res!508674 () Bool)

(assert (=> b!753100 (=> (not res!508674) (not e!420049))))

(declare-fun lt!335037 () SeekEntryResult!7643)

(assert (=> b!753100 (= res!508674 (= lt!335037 lt!335038))))

(assert (=> b!753100 (= lt!335038 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335036 lt!335039 mask!3328))))

(assert (=> b!753100 (= lt!335037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335036 mask!3328) lt!335036 lt!335039 mask!3328))))

(assert (=> b!753100 (= lt!335036 (select (store (arr!20043 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753100 (= lt!335039 (array!41860 (store (arr!20043 a!3186) i!1173 k!2102) (size!20464 a!3186)))))

(declare-fun b!753101 () Bool)

(declare-fun res!508667 () Bool)

(assert (=> b!753101 (=> (not res!508667) (not e!420052))))

(assert (=> b!753101 (= res!508667 (and (= (size!20464 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20464 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20464 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753102 () Bool)

(declare-fun res!508681 () Bool)

(assert (=> b!753102 (=> (not res!508681) (not e!420044))))

(declare-datatypes ((List!14045 0))(
  ( (Nil!14042) (Cons!14041 (h!15113 (_ BitVec 64)) (t!20360 List!14045)) )
))
(declare-fun arrayNoDuplicates!0 (array!41859 (_ BitVec 32) List!14045) Bool)

(assert (=> b!753102 (= res!508681 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14042))))

(assert (= (and start!65686 res!508679) b!753101))

(assert (= (and b!753101 res!508667) b!753084))

(assert (= (and b!753084 res!508677) b!753090))

(assert (= (and b!753090 res!508682) b!753095))

(assert (= (and b!753095 res!508668) b!753083))

(assert (= (and b!753083 res!508670) b!753091))

(assert (= (and b!753091 res!508684) b!753102))

(assert (= (and b!753102 res!508681) b!753086))

(assert (= (and b!753086 res!508671) b!753092))

(assert (= (and b!753092 res!508680) b!753098))

(assert (= (and b!753098 res!508676) b!753094))

(assert (= (and b!753094 c!82587) b!753099))

(assert (= (and b!753094 (not c!82587)) b!753081))

(assert (= (and b!753094 res!508678) b!753100))

(assert (= (and b!753100 res!508674) b!753085))

(assert (= (and b!753085 res!508685) b!753096))

(assert (= (and b!753085 (not res!508672)) b!753087))

(assert (= (and b!753087 (not res!508675)) b!753080))

(assert (= (and b!753080 (not res!508669)) b!753097))

(assert (= (and b!753097 c!82588) b!753088))

(assert (= (and b!753097 (not c!82588)) b!753089))

(assert (= (and b!753097 res!508683) b!753093))

(assert (= (and b!753093 res!508673) b!753082))

(declare-fun m!701863 () Bool)

(assert (=> b!753093 m!701863))

(declare-fun m!701865 () Bool)

(assert (=> b!753093 m!701865))

(declare-fun m!701867 () Bool)

(assert (=> b!753100 m!701867))

(declare-fun m!701869 () Bool)

(assert (=> b!753100 m!701869))

(declare-fun m!701871 () Bool)

(assert (=> b!753100 m!701871))

(assert (=> b!753100 m!701869))

(declare-fun m!701873 () Bool)

(assert (=> b!753100 m!701873))

(declare-fun m!701875 () Bool)

(assert (=> b!753100 m!701875))

(declare-fun m!701877 () Bool)

(assert (=> b!753096 m!701877))

(assert (=> b!753096 m!701877))

(declare-fun m!701879 () Bool)

(assert (=> b!753096 m!701879))

(declare-fun m!701881 () Bool)

(assert (=> b!753083 m!701881))

(assert (=> b!753080 m!701871))

(declare-fun m!701883 () Bool)

(assert (=> b!753080 m!701883))

(declare-fun m!701885 () Bool)

(assert (=> b!753090 m!701885))

(assert (=> b!753085 m!701877))

(assert (=> b!753085 m!701877))

(declare-fun m!701887 () Bool)

(assert (=> b!753085 m!701887))

(declare-fun m!701889 () Bool)

(assert (=> b!753085 m!701889))

(declare-fun m!701891 () Bool)

(assert (=> b!753085 m!701891))

(assert (=> b!753099 m!701877))

(assert (=> b!753099 m!701877))

(declare-fun m!701893 () Bool)

(assert (=> b!753099 m!701893))

(declare-fun m!701895 () Bool)

(assert (=> start!65686 m!701895))

(declare-fun m!701897 () Bool)

(assert (=> start!65686 m!701897))

(declare-fun m!701899 () Bool)

(assert (=> b!753091 m!701899))

(declare-fun m!701901 () Bool)

(assert (=> b!753102 m!701901))

(declare-fun m!701903 () Bool)

(assert (=> b!753098 m!701903))

(assert (=> b!753084 m!701877))

(assert (=> b!753084 m!701877))

(declare-fun m!701905 () Bool)

(assert (=> b!753084 m!701905))

(assert (=> b!753087 m!701877))

(assert (=> b!753087 m!701877))

(declare-fun m!701907 () Bool)

(assert (=> b!753087 m!701907))

(declare-fun m!701909 () Bool)

(assert (=> b!753095 m!701909))

(assert (=> b!753092 m!701877))

(assert (=> b!753092 m!701877))

(declare-fun m!701911 () Bool)

(assert (=> b!753092 m!701911))

(assert (=> b!753092 m!701911))

(assert (=> b!753092 m!701877))

(declare-fun m!701913 () Bool)

(assert (=> b!753092 m!701913))

(assert (=> b!753081 m!701877))

(assert (=> b!753081 m!701877))

(assert (=> b!753081 m!701907))

(push 1)

