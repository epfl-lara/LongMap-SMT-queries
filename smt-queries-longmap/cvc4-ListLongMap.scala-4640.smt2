; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64544 () Bool)

(assert start!64544)

(declare-fun res!487902 () Bool)

(declare-fun e!406987 () Bool)

(assert (=> start!64544 (=> (not res!487902) (not e!406987))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64544 (= res!487902 (validMask!0 mask!3328))))

(assert (=> start!64544 e!406987))

(assert (=> start!64544 true))

(declare-datatypes ((array!41062 0))(
  ( (array!41063 (arr!19652 (Array (_ BitVec 32) (_ BitVec 64))) (size!20073 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41062)

(declare-fun array_inv!15448 (array!41062) Bool)

(assert (=> start!64544 (array_inv!15448 a!3186)))

(declare-fun b!726973 () Bool)

(declare-fun res!487906 () Bool)

(declare-fun e!406990 () Bool)

(assert (=> b!726973 (=> (not res!487906) (not e!406990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41062 (_ BitVec 32)) Bool)

(assert (=> b!726973 (= res!487906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726974 () Bool)

(declare-fun res!487905 () Bool)

(declare-fun e!406992 () Bool)

(assert (=> b!726974 (=> (not res!487905) (not e!406992))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726974 (= res!487905 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19652 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!726975 () Bool)

(declare-datatypes ((SeekEntryResult!7252 0))(
  ( (MissingZero!7252 (index!31376 (_ BitVec 32))) (Found!7252 (index!31377 (_ BitVec 32))) (Intermediate!7252 (undefined!8064 Bool) (index!31378 (_ BitVec 32)) (x!62358 (_ BitVec 32))) (Undefined!7252) (MissingVacant!7252 (index!31379 (_ BitVec 32))) )
))
(declare-fun lt!321967 () SeekEntryResult!7252)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!406989 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41062 (_ BitVec 32)) SeekEntryResult!7252)

(assert (=> b!726975 (= e!406989 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321967))))

(declare-fun b!726976 () Bool)

(declare-fun e!406986 () Bool)

(declare-fun e!406988 () Bool)

(assert (=> b!726976 (= e!406986 (not e!406988))))

(declare-fun res!487907 () Bool)

(assert (=> b!726976 (=> res!487907 e!406988)))

(declare-fun lt!321966 () SeekEntryResult!7252)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!726976 (= res!487907 (or (not (is-Intermediate!7252 lt!321966)) (bvsge x!1131 (x!62358 lt!321966))))))

(declare-fun e!406994 () Bool)

(assert (=> b!726976 e!406994))

(declare-fun res!487903 () Bool)

(assert (=> b!726976 (=> (not res!487903) (not e!406994))))

(assert (=> b!726976 (= res!487903 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24822 0))(
  ( (Unit!24823) )
))
(declare-fun lt!321969 () Unit!24822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24822)

(assert (=> b!726976 (= lt!321969 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726977 () Bool)

(declare-fun res!487896 () Bool)

(assert (=> b!726977 (=> (not res!487896) (not e!406987))))

(assert (=> b!726977 (= res!487896 (and (= (size!20073 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20073 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20073 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726978 () Bool)

(declare-fun res!487895 () Bool)

(assert (=> b!726978 (=> (not res!487895) (not e!406990))))

(declare-datatypes ((List!13654 0))(
  ( (Nil!13651) (Cons!13650 (h!14707 (_ BitVec 64)) (t!19969 List!13654)) )
))
(declare-fun arrayNoDuplicates!0 (array!41062 (_ BitVec 32) List!13654) Bool)

(assert (=> b!726978 (= res!487895 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13651))))

(declare-fun b!726979 () Bool)

(declare-fun res!487910 () Bool)

(assert (=> b!726979 (=> (not res!487910) (not e!406987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726979 (= res!487910 (validKeyInArray!0 (select (arr!19652 a!3186) j!159)))))

(declare-fun b!726980 () Bool)

(assert (=> b!726980 (= e!406987 e!406990)))

(declare-fun res!487898 () Bool)

(assert (=> b!726980 (=> (not res!487898) (not e!406990))))

(declare-fun lt!321964 () SeekEntryResult!7252)

(assert (=> b!726980 (= res!487898 (or (= lt!321964 (MissingZero!7252 i!1173)) (= lt!321964 (MissingVacant!7252 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41062 (_ BitVec 32)) SeekEntryResult!7252)

(assert (=> b!726980 (= lt!321964 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726981 () Bool)

(assert (=> b!726981 (= e!406988 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321971 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726981 (= lt!321971 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726982 () Bool)

(assert (=> b!726982 (= e!406990 e!406992)))

(declare-fun res!487909 () Bool)

(assert (=> b!726982 (=> (not res!487909) (not e!406992))))

(declare-fun lt!321970 () SeekEntryResult!7252)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41062 (_ BitVec 32)) SeekEntryResult!7252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726982 (= res!487909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19652 a!3186) j!159) mask!3328) (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321970))))

(assert (=> b!726982 (= lt!321970 (Intermediate!7252 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726983 () Bool)

(declare-fun res!487908 () Bool)

(assert (=> b!726983 (=> (not res!487908) (not e!406987))))

(assert (=> b!726983 (= res!487908 (validKeyInArray!0 k!2102))))

(declare-fun b!726984 () Bool)

(declare-fun res!487904 () Bool)

(assert (=> b!726984 (=> (not res!487904) (not e!406990))))

(assert (=> b!726984 (= res!487904 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20073 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20073 a!3186))))))

(declare-fun b!726985 () Bool)

(declare-fun e!406993 () Bool)

(assert (=> b!726985 (= e!406993 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) (Found!7252 j!159)))))

(declare-fun b!726986 () Bool)

(assert (=> b!726986 (= e!406994 e!406989)))

(declare-fun res!487897 () Bool)

(assert (=> b!726986 (=> (not res!487897) (not e!406989))))

(assert (=> b!726986 (= res!487897 (= (seekEntryOrOpen!0 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321967))))

(assert (=> b!726986 (= lt!321967 (Found!7252 j!159))))

(declare-fun b!726987 () Bool)

(declare-fun res!487899 () Bool)

(assert (=> b!726987 (=> (not res!487899) (not e!406992))))

(assert (=> b!726987 (= res!487899 e!406993)))

(declare-fun c!79912 () Bool)

(assert (=> b!726987 (= c!79912 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726988 () Bool)

(declare-fun res!487900 () Bool)

(assert (=> b!726988 (=> (not res!487900) (not e!406987))))

(declare-fun arrayContainsKey!0 (array!41062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726988 (= res!487900 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726989 () Bool)

(assert (=> b!726989 (= e!406992 e!406986)))

(declare-fun res!487901 () Bool)

(assert (=> b!726989 (=> (not res!487901) (not e!406986))))

(declare-fun lt!321963 () SeekEntryResult!7252)

(assert (=> b!726989 (= res!487901 (= lt!321963 lt!321966))))

(declare-fun lt!321965 () (_ BitVec 64))

(declare-fun lt!321968 () array!41062)

(assert (=> b!726989 (= lt!321966 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321965 lt!321968 mask!3328))))

(assert (=> b!726989 (= lt!321963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321965 mask!3328) lt!321965 lt!321968 mask!3328))))

(assert (=> b!726989 (= lt!321965 (select (store (arr!19652 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726989 (= lt!321968 (array!41063 (store (arr!19652 a!3186) i!1173 k!2102) (size!20073 a!3186)))))

(declare-fun b!726990 () Bool)

(assert (=> b!726990 (= e!406993 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19652 a!3186) j!159) a!3186 mask!3328) lt!321970))))

(assert (= (and start!64544 res!487902) b!726977))

(assert (= (and b!726977 res!487896) b!726979))

(assert (= (and b!726979 res!487910) b!726983))

(assert (= (and b!726983 res!487908) b!726988))

(assert (= (and b!726988 res!487900) b!726980))

(assert (= (and b!726980 res!487898) b!726973))

(assert (= (and b!726973 res!487906) b!726978))

(assert (= (and b!726978 res!487895) b!726984))

(assert (= (and b!726984 res!487904) b!726982))

(assert (= (and b!726982 res!487909) b!726974))

(assert (= (and b!726974 res!487905) b!726987))

(assert (= (and b!726987 c!79912) b!726990))

(assert (= (and b!726987 (not c!79912)) b!726985))

(assert (= (and b!726987 res!487899) b!726989))

(assert (= (and b!726989 res!487901) b!726976))

(assert (= (and b!726976 res!487903) b!726986))

(assert (= (and b!726986 res!487897) b!726975))

(assert (= (and b!726976 (not res!487907)) b!726981))

(declare-fun m!680977 () Bool)

(assert (=> b!726990 m!680977))

(assert (=> b!726990 m!680977))

(declare-fun m!680979 () Bool)

(assert (=> b!726990 m!680979))

(declare-fun m!680981 () Bool)

(assert (=> b!726980 m!680981))

(declare-fun m!680983 () Bool)

(assert (=> b!726973 m!680983))

(declare-fun m!680985 () Bool)

(assert (=> b!726974 m!680985))

(declare-fun m!680987 () Bool)

(assert (=> b!726981 m!680987))

(assert (=> b!726982 m!680977))

(assert (=> b!726982 m!680977))

(declare-fun m!680989 () Bool)

(assert (=> b!726982 m!680989))

(assert (=> b!726982 m!680989))

(assert (=> b!726982 m!680977))

(declare-fun m!680991 () Bool)

(assert (=> b!726982 m!680991))

(declare-fun m!680993 () Bool)

(assert (=> start!64544 m!680993))

(declare-fun m!680995 () Bool)

(assert (=> start!64544 m!680995))

(declare-fun m!680997 () Bool)

(assert (=> b!726988 m!680997))

(assert (=> b!726986 m!680977))

(assert (=> b!726986 m!680977))

(declare-fun m!680999 () Bool)

(assert (=> b!726986 m!680999))

(declare-fun m!681001 () Bool)

(assert (=> b!726989 m!681001))

(declare-fun m!681003 () Bool)

(assert (=> b!726989 m!681003))

(declare-fun m!681005 () Bool)

(assert (=> b!726989 m!681005))

(declare-fun m!681007 () Bool)

(assert (=> b!726989 m!681007))

(assert (=> b!726989 m!681001))

(declare-fun m!681009 () Bool)

(assert (=> b!726989 m!681009))

(assert (=> b!726979 m!680977))

(assert (=> b!726979 m!680977))

(declare-fun m!681011 () Bool)

(assert (=> b!726979 m!681011))

(declare-fun m!681013 () Bool)

(assert (=> b!726978 m!681013))

(assert (=> b!726985 m!680977))

(assert (=> b!726985 m!680977))

(declare-fun m!681015 () Bool)

(assert (=> b!726985 m!681015))

(assert (=> b!726975 m!680977))

(assert (=> b!726975 m!680977))

(declare-fun m!681017 () Bool)

(assert (=> b!726975 m!681017))

(declare-fun m!681019 () Bool)

(assert (=> b!726983 m!681019))

(declare-fun m!681021 () Bool)

(assert (=> b!726976 m!681021))

(declare-fun m!681023 () Bool)

(assert (=> b!726976 m!681023))

(push 1)

