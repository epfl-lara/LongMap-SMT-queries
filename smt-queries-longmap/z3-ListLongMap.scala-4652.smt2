; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64812 () Bool)

(assert start!64812)

(declare-fun b!729971 () Bool)

(declare-fun res!489959 () Bool)

(declare-fun e!408642 () Bool)

(assert (=> b!729971 (=> (not res!489959) (not e!408642))))

(declare-datatypes ((array!41131 0))(
  ( (array!41132 (arr!19681 (Array (_ BitVec 32) (_ BitVec 64))) (size!20101 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41131)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!729971 (= res!489959 (and (= (size!20101 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20101 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20101 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729972 () Bool)

(declare-fun e!408635 () Bool)

(declare-fun e!408638 () Bool)

(assert (=> b!729972 (= e!408635 (not e!408638))))

(declare-fun res!489967 () Bool)

(assert (=> b!729972 (=> res!489967 e!408638)))

(declare-datatypes ((SeekEntryResult!7237 0))(
  ( (MissingZero!7237 (index!31316 (_ BitVec 32))) (Found!7237 (index!31317 (_ BitVec 32))) (Intermediate!7237 (undefined!8049 Bool) (index!31318 (_ BitVec 32)) (x!62463 (_ BitVec 32))) (Undefined!7237) (MissingVacant!7237 (index!31319 (_ BitVec 32))) )
))
(declare-fun lt!323368 () SeekEntryResult!7237)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!729972 (= res!489967 (or (not ((_ is Intermediate!7237) lt!323368)) (bvsge x!1131 (x!62463 lt!323368))))))

(declare-fun e!408640 () Bool)

(assert (=> b!729972 e!408640))

(declare-fun res!489972 () Bool)

(assert (=> b!729972 (=> (not res!489972) (not e!408640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41131 (_ BitVec 32)) Bool)

(assert (=> b!729972 (= res!489972 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24871 0))(
  ( (Unit!24872) )
))
(declare-fun lt!323375 () Unit!24871)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24871)

(assert (=> b!729972 (= lt!323375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729973 () Bool)

(declare-fun res!489968 () Bool)

(declare-fun e!408639 () Bool)

(assert (=> b!729973 (=> (not res!489968) (not e!408639))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!729973 (= res!489968 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19681 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729974 () Bool)

(declare-fun res!489965 () Bool)

(assert (=> b!729974 (=> (not res!489965) (not e!408642))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729974 (= res!489965 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!489973 () Bool)

(assert (=> start!64812 (=> (not res!489973) (not e!408642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64812 (= res!489973 (validMask!0 mask!3328))))

(assert (=> start!64812 e!408642))

(assert (=> start!64812 true))

(declare-fun array_inv!15540 (array!41131) Bool)

(assert (=> start!64812 (array_inv!15540 a!3186)))

(declare-fun b!729975 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408637 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41131 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!729975 (= e!408637 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) (Found!7237 j!159)))))

(declare-fun b!729976 () Bool)

(declare-fun lt!323371 () SeekEntryResult!7237)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41131 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!729976 (= e!408637 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!323371))))

(declare-fun b!729977 () Bool)

(declare-fun res!489971 () Bool)

(assert (=> b!729977 (=> (not res!489971) (not e!408642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729977 (= res!489971 (validKeyInArray!0 (select (arr!19681 a!3186) j!159)))))

(declare-fun b!729978 () Bool)

(declare-fun res!489963 () Bool)

(declare-fun e!408641 () Bool)

(assert (=> b!729978 (=> (not res!489963) (not e!408641))))

(declare-datatypes ((List!13590 0))(
  ( (Nil!13587) (Cons!13586 (h!14652 (_ BitVec 64)) (t!19897 List!13590)) )
))
(declare-fun arrayNoDuplicates!0 (array!41131 (_ BitVec 32) List!13590) Bool)

(assert (=> b!729978 (= res!489963 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13587))))

(declare-fun b!729979 () Bool)

(declare-fun e!408634 () Bool)

(assert (=> b!729979 (= e!408640 e!408634)))

(declare-fun res!489958 () Bool)

(assert (=> b!729979 (=> (not res!489958) (not e!408634))))

(declare-fun lt!323374 () SeekEntryResult!7237)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41131 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!729979 (= res!489958 (= (seekEntryOrOpen!0 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!323374))))

(assert (=> b!729979 (= lt!323374 (Found!7237 j!159))))

(declare-fun b!729980 () Bool)

(assert (=> b!729980 (= e!408639 e!408635)))

(declare-fun res!489961 () Bool)

(assert (=> b!729980 (=> (not res!489961) (not e!408635))))

(declare-fun lt!323369 () SeekEntryResult!7237)

(assert (=> b!729980 (= res!489961 (= lt!323369 lt!323368))))

(declare-fun lt!323372 () array!41131)

(declare-fun lt!323376 () (_ BitVec 64))

(assert (=> b!729980 (= lt!323368 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323376 lt!323372 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729980 (= lt!323369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323376 mask!3328) lt!323376 lt!323372 mask!3328))))

(assert (=> b!729980 (= lt!323376 (select (store (arr!19681 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729980 (= lt!323372 (array!41132 (store (arr!19681 a!3186) i!1173 k0!2102) (size!20101 a!3186)))))

(declare-fun b!729981 () Bool)

(assert (=> b!729981 (= e!408638 true)))

(declare-fun lt!323373 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729981 (= lt!323373 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!729982 () Bool)

(declare-fun res!489966 () Bool)

(assert (=> b!729982 (=> (not res!489966) (not e!408641))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729982 (= res!489966 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20101 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20101 a!3186))))))

(declare-fun b!729983 () Bool)

(assert (=> b!729983 (= e!408641 e!408639)))

(declare-fun res!489964 () Bool)

(assert (=> b!729983 (=> (not res!489964) (not e!408639))))

(assert (=> b!729983 (= res!489964 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19681 a!3186) j!159) mask!3328) (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!323371))))

(assert (=> b!729983 (= lt!323371 (Intermediate!7237 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729984 () Bool)

(declare-fun res!489970 () Bool)

(assert (=> b!729984 (=> (not res!489970) (not e!408639))))

(assert (=> b!729984 (= res!489970 e!408637)))

(declare-fun c!80384 () Bool)

(assert (=> b!729984 (= c!80384 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729985 () Bool)

(declare-fun res!489969 () Bool)

(assert (=> b!729985 (=> (not res!489969) (not e!408641))))

(assert (=> b!729985 (= res!489969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729986 () Bool)

(assert (=> b!729986 (= e!408634 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!323374))))

(declare-fun b!729987 () Bool)

(declare-fun res!489962 () Bool)

(assert (=> b!729987 (=> (not res!489962) (not e!408642))))

(assert (=> b!729987 (= res!489962 (validKeyInArray!0 k0!2102))))

(declare-fun b!729988 () Bool)

(assert (=> b!729988 (= e!408642 e!408641)))

(declare-fun res!489960 () Bool)

(assert (=> b!729988 (=> (not res!489960) (not e!408641))))

(declare-fun lt!323370 () SeekEntryResult!7237)

(assert (=> b!729988 (= res!489960 (or (= lt!323370 (MissingZero!7237 i!1173)) (= lt!323370 (MissingVacant!7237 i!1173))))))

(assert (=> b!729988 (= lt!323370 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64812 res!489973) b!729971))

(assert (= (and b!729971 res!489959) b!729977))

(assert (= (and b!729977 res!489971) b!729987))

(assert (= (and b!729987 res!489962) b!729974))

(assert (= (and b!729974 res!489965) b!729988))

(assert (= (and b!729988 res!489960) b!729985))

(assert (= (and b!729985 res!489969) b!729978))

(assert (= (and b!729978 res!489963) b!729982))

(assert (= (and b!729982 res!489966) b!729983))

(assert (= (and b!729983 res!489964) b!729973))

(assert (= (and b!729973 res!489968) b!729984))

(assert (= (and b!729984 c!80384) b!729976))

(assert (= (and b!729984 (not c!80384)) b!729975))

(assert (= (and b!729984 res!489970) b!729980))

(assert (= (and b!729980 res!489961) b!729972))

(assert (= (and b!729972 res!489972) b!729979))

(assert (= (and b!729979 res!489958) b!729986))

(assert (= (and b!729972 (not res!489967)) b!729981))

(declare-fun m!684027 () Bool)

(assert (=> b!729986 m!684027))

(assert (=> b!729986 m!684027))

(declare-fun m!684029 () Bool)

(assert (=> b!729986 m!684029))

(assert (=> b!729976 m!684027))

(assert (=> b!729976 m!684027))

(declare-fun m!684031 () Bool)

(assert (=> b!729976 m!684031))

(declare-fun m!684033 () Bool)

(assert (=> b!729974 m!684033))

(declare-fun m!684035 () Bool)

(assert (=> b!729972 m!684035))

(declare-fun m!684037 () Bool)

(assert (=> b!729972 m!684037))

(declare-fun m!684039 () Bool)

(assert (=> b!729981 m!684039))

(assert (=> b!729977 m!684027))

(assert (=> b!729977 m!684027))

(declare-fun m!684041 () Bool)

(assert (=> b!729977 m!684041))

(declare-fun m!684043 () Bool)

(assert (=> b!729973 m!684043))

(declare-fun m!684045 () Bool)

(assert (=> b!729980 m!684045))

(declare-fun m!684047 () Bool)

(assert (=> b!729980 m!684047))

(declare-fun m!684049 () Bool)

(assert (=> b!729980 m!684049))

(declare-fun m!684051 () Bool)

(assert (=> b!729980 m!684051))

(declare-fun m!684053 () Bool)

(assert (=> b!729980 m!684053))

(assert (=> b!729980 m!684047))

(declare-fun m!684055 () Bool)

(assert (=> b!729988 m!684055))

(declare-fun m!684057 () Bool)

(assert (=> start!64812 m!684057))

(declare-fun m!684059 () Bool)

(assert (=> start!64812 m!684059))

(assert (=> b!729979 m!684027))

(assert (=> b!729979 m!684027))

(declare-fun m!684061 () Bool)

(assert (=> b!729979 m!684061))

(assert (=> b!729983 m!684027))

(assert (=> b!729983 m!684027))

(declare-fun m!684063 () Bool)

(assert (=> b!729983 m!684063))

(assert (=> b!729983 m!684063))

(assert (=> b!729983 m!684027))

(declare-fun m!684065 () Bool)

(assert (=> b!729983 m!684065))

(assert (=> b!729975 m!684027))

(assert (=> b!729975 m!684027))

(declare-fun m!684067 () Bool)

(assert (=> b!729975 m!684067))

(declare-fun m!684069 () Bool)

(assert (=> b!729985 m!684069))

(declare-fun m!684071 () Bool)

(assert (=> b!729978 m!684071))

(declare-fun m!684073 () Bool)

(assert (=> b!729987 m!684073))

(check-sat (not b!729985) (not b!729975) (not b!729987) (not b!729981) (not b!729979) (not b!729983) (not b!729988) (not b!729976) (not b!729977) (not b!729972) (not b!729980) (not start!64812) (not b!729986) (not b!729974) (not b!729978))
(check-sat)
