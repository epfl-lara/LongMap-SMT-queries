; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65172 () Bool)

(assert start!65172)

(declare-fun b!736972 () Bool)

(declare-fun e!412239 () Bool)

(assert (=> b!736972 (= e!412239 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7386 0))(
  ( (MissingZero!7386 (index!31912 (_ BitVec 32))) (Found!7386 (index!31913 (_ BitVec 32))) (Intermediate!7386 (undefined!8198 Bool) (index!31914 (_ BitVec 32)) (x!62912 (_ BitVec 32))) (Undefined!7386) (MissingVacant!7386 (index!31915 (_ BitVec 32))) )
))
(declare-fun lt!326918 () SeekEntryResult!7386)

(declare-fun lt!326909 () (_ BitVec 32))

(declare-fun lt!326917 () (_ BitVec 64))

(declare-datatypes ((array!41345 0))(
  ( (array!41346 (arr!19786 (Array (_ BitVec 32) (_ BitVec 64))) (size!20207 (_ BitVec 32))) )
))
(declare-fun lt!326910 () array!41345)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41345 (_ BitVec 32)) SeekEntryResult!7386)

(assert (=> b!736972 (= lt!326918 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326909 lt!326917 lt!326910 mask!3328))))

(declare-fun b!736973 () Bool)

(declare-fun res!495327 () Bool)

(declare-fun e!412249 () Bool)

(assert (=> b!736973 (=> (not res!495327) (not e!412249))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736973 (= res!495327 (validKeyInArray!0 k0!2102))))

(declare-fun b!736974 () Bool)

(declare-fun res!495331 () Bool)

(declare-fun e!412241 () Bool)

(assert (=> b!736974 (=> (not res!495331) (not e!412241))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!41345)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736974 (= res!495331 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20207 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20207 a!3186))))))

(declare-fun b!736975 () Bool)

(declare-fun e!412245 () Bool)

(declare-fun e!412243 () Bool)

(assert (=> b!736975 (= e!412245 (not e!412243))))

(declare-fun res!495329 () Bool)

(assert (=> b!736975 (=> res!495329 e!412243)))

(declare-fun lt!326913 () SeekEntryResult!7386)

(get-info :version)

(assert (=> b!736975 (= res!495329 (or (not ((_ is Intermediate!7386) lt!326913)) (bvsge x!1131 (x!62912 lt!326913))))))

(declare-fun lt!326912 () SeekEntryResult!7386)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!736975 (= lt!326912 (Found!7386 j!159))))

(declare-fun e!412242 () Bool)

(assert (=> b!736975 e!412242))

(declare-fun res!495336 () Bool)

(assert (=> b!736975 (=> (not res!495336) (not e!412242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41345 (_ BitVec 32)) Bool)

(assert (=> b!736975 (= res!495336 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25140 0))(
  ( (Unit!25141) )
))
(declare-fun lt!326914 () Unit!25140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25140)

(assert (=> b!736975 (= lt!326914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736976 () Bool)

(declare-fun res!495333 () Bool)

(declare-fun e!412244 () Bool)

(assert (=> b!736976 (=> (not res!495333) (not e!412244))))

(declare-fun e!412248 () Bool)

(assert (=> b!736976 (= res!495333 e!412248)))

(declare-fun c!81205 () Bool)

(assert (=> b!736976 (= c!81205 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736977 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41345 (_ BitVec 32)) SeekEntryResult!7386)

(assert (=> b!736977 (= e!412248 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) (Found!7386 j!159)))))

(declare-fun b!736978 () Bool)

(assert (=> b!736978 (= e!412241 e!412244)))

(declare-fun res!495340 () Bool)

(assert (=> b!736978 (=> (not res!495340) (not e!412244))))

(declare-fun lt!326919 () SeekEntryResult!7386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736978 (= res!495340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19786 a!3186) j!159) mask!3328) (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326919))))

(assert (=> b!736978 (= lt!326919 (Intermediate!7386 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736979 () Bool)

(declare-fun e!412250 () Unit!25140)

(declare-fun Unit!25142 () Unit!25140)

(assert (=> b!736979 (= e!412250 Unit!25142)))

(declare-fun lt!326921 () SeekEntryResult!7386)

(assert (=> b!736979 (= lt!326921 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736979 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326909 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326912)))

(declare-fun b!736980 () Bool)

(declare-fun res!495330 () Bool)

(assert (=> b!736980 (=> (not res!495330) (not e!412244))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736980 (= res!495330 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19786 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736981 () Bool)

(declare-fun res!495337 () Bool)

(assert (=> b!736981 (=> (not res!495337) (not e!412249))))

(assert (=> b!736981 (= res!495337 (validKeyInArray!0 (select (arr!19786 a!3186) j!159)))))

(declare-fun b!736982 () Bool)

(declare-fun res!495332 () Bool)

(assert (=> b!736982 (=> (not res!495332) (not e!412241))))

(assert (=> b!736982 (= res!495332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736983 () Bool)

(assert (=> b!736983 (= e!412249 e!412241)))

(declare-fun res!495339 () Bool)

(assert (=> b!736983 (=> (not res!495339) (not e!412241))))

(declare-fun lt!326920 () SeekEntryResult!7386)

(assert (=> b!736983 (= res!495339 (or (= lt!326920 (MissingZero!7386 i!1173)) (= lt!326920 (MissingVacant!7386 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41345 (_ BitVec 32)) SeekEntryResult!7386)

(assert (=> b!736983 (= lt!326920 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736984 () Bool)

(declare-fun Unit!25143 () Unit!25140)

(assert (=> b!736984 (= e!412250 Unit!25143)))

(assert (=> b!736984 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326909 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326919)))

(declare-fun b!736985 () Bool)

(declare-fun res!495328 () Bool)

(assert (=> b!736985 (=> res!495328 e!412239)))

(declare-fun e!412246 () Bool)

(assert (=> b!736985 (= res!495328 e!412246)))

(declare-fun c!81204 () Bool)

(declare-fun lt!326916 () Bool)

(assert (=> b!736985 (= c!81204 lt!326916)))

(declare-fun b!736986 () Bool)

(assert (=> b!736986 (= e!412243 e!412239)))

(declare-fun res!495335 () Bool)

(assert (=> b!736986 (=> res!495335 e!412239)))

(assert (=> b!736986 (= res!495335 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326909 #b00000000000000000000000000000000) (bvsge lt!326909 (size!20207 a!3186))))))

(declare-fun lt!326908 () Unit!25140)

(assert (=> b!736986 (= lt!326908 e!412250)))

(declare-fun c!81203 () Bool)

(assert (=> b!736986 (= c!81203 lt!326916)))

(assert (=> b!736986 (= lt!326916 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736986 (= lt!326909 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736987 () Bool)

(declare-fun res!495334 () Bool)

(assert (=> b!736987 (=> (not res!495334) (not e!412249))))

(assert (=> b!736987 (= res!495334 (and (= (size!20207 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20207 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20207 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736988 () Bool)

(assert (=> b!736988 (= e!412246 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326909 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326919)))))

(declare-fun lt!326915 () SeekEntryResult!7386)

(declare-fun e!412240 () Bool)

(declare-fun b!736989 () Bool)

(assert (=> b!736989 (= e!412240 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326915))))

(declare-fun b!736990 () Bool)

(declare-fun res!495343 () Bool)

(assert (=> b!736990 (=> (not res!495343) (not e!412241))))

(declare-datatypes ((List!13788 0))(
  ( (Nil!13785) (Cons!13784 (h!14856 (_ BitVec 64)) (t!20103 List!13788)) )
))
(declare-fun arrayNoDuplicates!0 (array!41345 (_ BitVec 32) List!13788) Bool)

(assert (=> b!736990 (= res!495343 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13785))))

(declare-fun b!736991 () Bool)

(declare-fun res!495342 () Bool)

(assert (=> b!736991 (=> (not res!495342) (not e!412249))))

(declare-fun arrayContainsKey!0 (array!41345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736991 (= res!495342 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!495341 () Bool)

(assert (=> start!65172 (=> (not res!495341) (not e!412249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65172 (= res!495341 (validMask!0 mask!3328))))

(assert (=> start!65172 e!412249))

(assert (=> start!65172 true))

(declare-fun array_inv!15582 (array!41345) Bool)

(assert (=> start!65172 (array_inv!15582 a!3186)))

(declare-fun b!736992 () Bool)

(assert (=> b!736992 (= e!412242 e!412240)))

(declare-fun res!495338 () Bool)

(assert (=> b!736992 (=> (not res!495338) (not e!412240))))

(assert (=> b!736992 (= res!495338 (= (seekEntryOrOpen!0 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326915))))

(assert (=> b!736992 (= lt!326915 (Found!7386 j!159))))

(declare-fun b!736993 () Bool)

(assert (=> b!736993 (= e!412246 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326909 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326912)))))

(declare-fun b!736994 () Bool)

(assert (=> b!736994 (= e!412248 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!326919))))

(declare-fun b!736995 () Bool)

(assert (=> b!736995 (= e!412244 e!412245)))

(declare-fun res!495344 () Bool)

(assert (=> b!736995 (=> (not res!495344) (not e!412245))))

(declare-fun lt!326911 () SeekEntryResult!7386)

(assert (=> b!736995 (= res!495344 (= lt!326911 lt!326913))))

(assert (=> b!736995 (= lt!326913 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326917 lt!326910 mask!3328))))

(assert (=> b!736995 (= lt!326911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326917 mask!3328) lt!326917 lt!326910 mask!3328))))

(assert (=> b!736995 (= lt!326917 (select (store (arr!19786 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736995 (= lt!326910 (array!41346 (store (arr!19786 a!3186) i!1173 k0!2102) (size!20207 a!3186)))))

(assert (= (and start!65172 res!495341) b!736987))

(assert (= (and b!736987 res!495334) b!736981))

(assert (= (and b!736981 res!495337) b!736973))

(assert (= (and b!736973 res!495327) b!736991))

(assert (= (and b!736991 res!495342) b!736983))

(assert (= (and b!736983 res!495339) b!736982))

(assert (= (and b!736982 res!495332) b!736990))

(assert (= (and b!736990 res!495343) b!736974))

(assert (= (and b!736974 res!495331) b!736978))

(assert (= (and b!736978 res!495340) b!736980))

(assert (= (and b!736980 res!495330) b!736976))

(assert (= (and b!736976 c!81205) b!736994))

(assert (= (and b!736976 (not c!81205)) b!736977))

(assert (= (and b!736976 res!495333) b!736995))

(assert (= (and b!736995 res!495344) b!736975))

(assert (= (and b!736975 res!495336) b!736992))

(assert (= (and b!736992 res!495338) b!736989))

(assert (= (and b!736975 (not res!495329)) b!736986))

(assert (= (and b!736986 c!81203) b!736984))

(assert (= (and b!736986 (not c!81203)) b!736979))

(assert (= (and b!736986 (not res!495335)) b!736985))

(assert (= (and b!736985 c!81204) b!736988))

(assert (= (and b!736985 (not c!81204)) b!736993))

(assert (= (and b!736985 (not res!495328)) b!736972))

(declare-fun m!688969 () Bool)

(assert (=> b!736981 m!688969))

(assert (=> b!736981 m!688969))

(declare-fun m!688971 () Bool)

(assert (=> b!736981 m!688971))

(assert (=> b!736977 m!688969))

(assert (=> b!736977 m!688969))

(declare-fun m!688973 () Bool)

(assert (=> b!736977 m!688973))

(assert (=> b!736993 m!688969))

(assert (=> b!736993 m!688969))

(declare-fun m!688975 () Bool)

(assert (=> b!736993 m!688975))

(assert (=> b!736992 m!688969))

(assert (=> b!736992 m!688969))

(declare-fun m!688977 () Bool)

(assert (=> b!736992 m!688977))

(declare-fun m!688979 () Bool)

(assert (=> b!736995 m!688979))

(declare-fun m!688981 () Bool)

(assert (=> b!736995 m!688981))

(declare-fun m!688983 () Bool)

(assert (=> b!736995 m!688983))

(declare-fun m!688985 () Bool)

(assert (=> b!736995 m!688985))

(assert (=> b!736995 m!688983))

(declare-fun m!688987 () Bool)

(assert (=> b!736995 m!688987))

(declare-fun m!688989 () Bool)

(assert (=> b!736973 m!688989))

(declare-fun m!688991 () Bool)

(assert (=> b!736975 m!688991))

(declare-fun m!688993 () Bool)

(assert (=> b!736975 m!688993))

(declare-fun m!688995 () Bool)

(assert (=> b!736986 m!688995))

(declare-fun m!688997 () Bool)

(assert (=> b!736972 m!688997))

(declare-fun m!688999 () Bool)

(assert (=> b!736982 m!688999))

(declare-fun m!689001 () Bool)

(assert (=> b!736983 m!689001))

(assert (=> b!736989 m!688969))

(assert (=> b!736989 m!688969))

(declare-fun m!689003 () Bool)

(assert (=> b!736989 m!689003))

(assert (=> b!736979 m!688969))

(assert (=> b!736979 m!688969))

(assert (=> b!736979 m!688973))

(assert (=> b!736979 m!688969))

(assert (=> b!736979 m!688975))

(declare-fun m!689005 () Bool)

(assert (=> b!736990 m!689005))

(assert (=> b!736988 m!688969))

(assert (=> b!736988 m!688969))

(declare-fun m!689007 () Bool)

(assert (=> b!736988 m!689007))

(declare-fun m!689009 () Bool)

(assert (=> b!736991 m!689009))

(declare-fun m!689011 () Bool)

(assert (=> start!65172 m!689011))

(declare-fun m!689013 () Bool)

(assert (=> start!65172 m!689013))

(declare-fun m!689015 () Bool)

(assert (=> b!736980 m!689015))

(assert (=> b!736994 m!688969))

(assert (=> b!736994 m!688969))

(declare-fun m!689017 () Bool)

(assert (=> b!736994 m!689017))

(assert (=> b!736984 m!688969))

(assert (=> b!736984 m!688969))

(assert (=> b!736984 m!689007))

(assert (=> b!736978 m!688969))

(assert (=> b!736978 m!688969))

(declare-fun m!689019 () Bool)

(assert (=> b!736978 m!689019))

(assert (=> b!736978 m!689019))

(assert (=> b!736978 m!688969))

(declare-fun m!689021 () Bool)

(assert (=> b!736978 m!689021))

(check-sat (not b!736972) (not b!736993) (not b!736989) (not b!736994) (not b!736975) (not b!736984) (not start!65172) (not b!736981) (not b!736990) (not b!736992) (not b!736979) (not b!736986) (not b!736978) (not b!736983) (not b!736991) (not b!736977) (not b!736995) (not b!736973) (not b!736988) (not b!736982))
(check-sat)
