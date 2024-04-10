; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67116 () Bool)

(assert start!67116)

(declare-datatypes ((array!42471 0))(
  ( (array!42472 (arr!20331 (Array (_ BitVec 32) (_ BitVec 64))) (size!20752 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42471)

(declare-fun e!431350 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7931 0))(
  ( (MissingZero!7931 (index!34092 (_ BitVec 32))) (Found!7931 (index!34093 (_ BitVec 32))) (Intermediate!7931 (undefined!8743 Bool) (index!34094 (_ BitVec 32)) (x!65042 (_ BitVec 32))) (Undefined!7931) (MissingVacant!7931 (index!34095 (_ BitVec 32))) )
))
(declare-fun lt!345181 () SeekEntryResult!7931)

(declare-fun b!774972 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42471 (_ BitVec 32)) SeekEntryResult!7931)

(assert (=> b!774972 (= e!431350 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345181))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!774973 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42471 (_ BitVec 32)) SeekEntryResult!7931)

(assert (=> b!774973 (= e!431350 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) (Found!7931 j!159)))))

(declare-fun b!774974 () Bool)

(declare-fun res!524029 () Bool)

(declare-fun e!431353 () Bool)

(assert (=> b!774974 (=> (not res!524029) (not e!431353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42471 (_ BitVec 32)) Bool)

(assert (=> b!774974 (= res!524029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774975 () Bool)

(declare-fun res!524019 () Bool)

(declare-fun e!431357 () Bool)

(assert (=> b!774975 (=> (not res!524019) (not e!431357))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774975 (= res!524019 (and (= (size!20752 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20752 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20752 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774976 () Bool)

(declare-fun e!431360 () Bool)

(declare-fun e!431355 () Bool)

(assert (=> b!774976 (= e!431360 e!431355)))

(declare-fun res!524018 () Bool)

(assert (=> b!774976 (=> res!524018 e!431355)))

(declare-fun lt!345180 () (_ BitVec 32))

(assert (=> b!774976 (= res!524018 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345180 #b00000000000000000000000000000000) (bvsge lt!345180 (size!20752 a!3186))))))

(declare-datatypes ((Unit!26738 0))(
  ( (Unit!26739) )
))
(declare-fun lt!345174 () Unit!26738)

(declare-fun e!431356 () Unit!26738)

(assert (=> b!774976 (= lt!345174 e!431356)))

(declare-fun c!85877 () Bool)

(declare-fun lt!345184 () Bool)

(assert (=> b!774976 (= c!85877 lt!345184)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774976 (= lt!345184 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774976 (= lt!345180 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!524026 () Bool)

(assert (=> start!67116 (=> (not res!524026) (not e!431357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67116 (= res!524026 (validMask!0 mask!3328))))

(assert (=> start!67116 e!431357))

(assert (=> start!67116 true))

(declare-fun array_inv!16127 (array!42471) Bool)

(assert (=> start!67116 (array_inv!16127 a!3186)))

(declare-fun b!774977 () Bool)

(declare-fun Unit!26740 () Unit!26738)

(assert (=> b!774977 (= e!431356 Unit!26740)))

(assert (=> b!774977 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345180 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345181)))

(declare-fun b!774978 () Bool)

(declare-fun res!524022 () Bool)

(assert (=> b!774978 (=> (not res!524022) (not e!431357))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774978 (= res!524022 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774979 () Bool)

(declare-fun e!431349 () Bool)

(declare-fun lt!345172 () SeekEntryResult!7931)

(assert (=> b!774979 (= e!431349 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345172))))

(declare-fun b!774980 () Bool)

(assert (=> b!774980 (= e!431355 true)))

(declare-fun lt!345183 () array!42471)

(declare-fun lt!345177 () SeekEntryResult!7931)

(declare-fun lt!345175 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42471 (_ BitVec 32)) SeekEntryResult!7931)

(assert (=> b!774980 (= (seekEntryOrOpen!0 lt!345175 lt!345183 mask!3328) lt!345177)))

(declare-fun lt!345179 () Unit!26738)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42471 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26738)

(assert (=> b!774980 (= lt!345179 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345180 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!774981 () Bool)

(declare-fun e!431354 () Bool)

(assert (=> b!774981 (= e!431354 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345180 resIntermediateIndex!5 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345177)))))

(declare-fun b!774982 () Bool)

(declare-fun res!524034 () Bool)

(assert (=> b!774982 (=> (not res!524034) (not e!431353))))

(assert (=> b!774982 (= res!524034 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20752 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20752 a!3186))))))

(declare-fun b!774983 () Bool)

(declare-fun res!524021 () Bool)

(declare-fun e!431358 () Bool)

(assert (=> b!774983 (=> (not res!524021) (not e!431358))))

(assert (=> b!774983 (= res!524021 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20331 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774984 () Bool)

(declare-fun e!431359 () Bool)

(assert (=> b!774984 (= e!431359 (not e!431360))))

(declare-fun res!524028 () Bool)

(assert (=> b!774984 (=> res!524028 e!431360)))

(declare-fun lt!345182 () SeekEntryResult!7931)

(assert (=> b!774984 (= res!524028 (or (not (is-Intermediate!7931 lt!345182)) (bvsge x!1131 (x!65042 lt!345182))))))

(assert (=> b!774984 (= lt!345177 (Found!7931 j!159))))

(declare-fun e!431352 () Bool)

(assert (=> b!774984 e!431352))

(declare-fun res!524020 () Bool)

(assert (=> b!774984 (=> (not res!524020) (not e!431352))))

(assert (=> b!774984 (= res!524020 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345176 () Unit!26738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26738)

(assert (=> b!774984 (= lt!345176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774985 () Bool)

(declare-fun res!524027 () Bool)

(assert (=> b!774985 (=> (not res!524027) (not e!431358))))

(assert (=> b!774985 (= res!524027 e!431350)))

(declare-fun c!85878 () Bool)

(assert (=> b!774985 (= c!85878 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774986 () Bool)

(assert (=> b!774986 (= e!431357 e!431353)))

(declare-fun res!524030 () Bool)

(assert (=> b!774986 (=> (not res!524030) (not e!431353))))

(declare-fun lt!345173 () SeekEntryResult!7931)

(assert (=> b!774986 (= res!524030 (or (= lt!345173 (MissingZero!7931 i!1173)) (= lt!345173 (MissingVacant!7931 i!1173))))))

(assert (=> b!774986 (= lt!345173 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!774987 () Bool)

(assert (=> b!774987 (= e!431354 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345180 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345181)))))

(declare-fun b!774988 () Bool)

(assert (=> b!774988 (= e!431353 e!431358)))

(declare-fun res!524033 () Bool)

(assert (=> b!774988 (=> (not res!524033) (not e!431358))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774988 (= res!524033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20331 a!3186) j!159) mask!3328) (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345181))))

(assert (=> b!774988 (= lt!345181 (Intermediate!7931 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774989 () Bool)

(declare-fun res!524036 () Bool)

(assert (=> b!774989 (=> res!524036 e!431355)))

(assert (=> b!774989 (= res!524036 e!431354)))

(declare-fun c!85879 () Bool)

(assert (=> b!774989 (= c!85879 lt!345184)))

(declare-fun b!774990 () Bool)

(declare-fun res!524024 () Bool)

(assert (=> b!774990 (=> (not res!524024) (not e!431353))))

(declare-datatypes ((List!14333 0))(
  ( (Nil!14330) (Cons!14329 (h!15437 (_ BitVec 64)) (t!20648 List!14333)) )
))
(declare-fun arrayNoDuplicates!0 (array!42471 (_ BitVec 32) List!14333) Bool)

(assert (=> b!774990 (= res!524024 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14330))))

(declare-fun b!774991 () Bool)

(assert (=> b!774991 (= e!431358 e!431359)))

(declare-fun res!524032 () Bool)

(assert (=> b!774991 (=> (not res!524032) (not e!431359))))

(declare-fun lt!345185 () SeekEntryResult!7931)

(assert (=> b!774991 (= res!524032 (= lt!345185 lt!345182))))

(assert (=> b!774991 (= lt!345182 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345175 lt!345183 mask!3328))))

(assert (=> b!774991 (= lt!345185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345175 mask!3328) lt!345175 lt!345183 mask!3328))))

(assert (=> b!774991 (= lt!345175 (select (store (arr!20331 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!774991 (= lt!345183 (array!42472 (store (arr!20331 a!3186) i!1173 k!2102) (size!20752 a!3186)))))

(declare-fun b!774992 () Bool)

(declare-fun res!524025 () Bool)

(assert (=> b!774992 (=> res!524025 e!431355)))

(assert (=> b!774992 (= res!524025 (not (= lt!345185 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345180 lt!345175 lt!345183 mask!3328))))))

(declare-fun b!774993 () Bool)

(declare-fun res!524035 () Bool)

(assert (=> b!774993 (=> (not res!524035) (not e!431357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774993 (= res!524035 (validKeyInArray!0 k!2102))))

(declare-fun b!774994 () Bool)

(assert (=> b!774994 (= e!431352 e!431349)))

(declare-fun res!524023 () Bool)

(assert (=> b!774994 (=> (not res!524023) (not e!431349))))

(assert (=> b!774994 (= res!524023 (= (seekEntryOrOpen!0 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345172))))

(assert (=> b!774994 (= lt!345172 (Found!7931 j!159))))

(declare-fun b!774995 () Bool)

(declare-fun res!524031 () Bool)

(assert (=> b!774995 (=> (not res!524031) (not e!431357))))

(assert (=> b!774995 (= res!524031 (validKeyInArray!0 (select (arr!20331 a!3186) j!159)))))

(declare-fun b!774996 () Bool)

(declare-fun Unit!26741 () Unit!26738)

(assert (=> b!774996 (= e!431356 Unit!26741)))

(declare-fun lt!345178 () SeekEntryResult!7931)

(assert (=> b!774996 (= lt!345178 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20331 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774996 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345180 resIntermediateIndex!5 (select (arr!20331 a!3186) j!159) a!3186 mask!3328) lt!345177)))

(assert (= (and start!67116 res!524026) b!774975))

(assert (= (and b!774975 res!524019) b!774995))

(assert (= (and b!774995 res!524031) b!774993))

(assert (= (and b!774993 res!524035) b!774978))

(assert (= (and b!774978 res!524022) b!774986))

(assert (= (and b!774986 res!524030) b!774974))

(assert (= (and b!774974 res!524029) b!774990))

(assert (= (and b!774990 res!524024) b!774982))

(assert (= (and b!774982 res!524034) b!774988))

(assert (= (and b!774988 res!524033) b!774983))

(assert (= (and b!774983 res!524021) b!774985))

(assert (= (and b!774985 c!85878) b!774972))

(assert (= (and b!774985 (not c!85878)) b!774973))

(assert (= (and b!774985 res!524027) b!774991))

(assert (= (and b!774991 res!524032) b!774984))

(assert (= (and b!774984 res!524020) b!774994))

(assert (= (and b!774994 res!524023) b!774979))

(assert (= (and b!774984 (not res!524028)) b!774976))

(assert (= (and b!774976 c!85877) b!774977))

(assert (= (and b!774976 (not c!85877)) b!774996))

(assert (= (and b!774976 (not res!524018)) b!774989))

(assert (= (and b!774989 c!85879) b!774987))

(assert (= (and b!774989 (not c!85879)) b!774981))

(assert (= (and b!774989 (not res!524036)) b!774992))

(assert (= (and b!774992 (not res!524025)) b!774980))

(declare-fun m!719303 () Bool)

(assert (=> b!774988 m!719303))

(assert (=> b!774988 m!719303))

(declare-fun m!719305 () Bool)

(assert (=> b!774988 m!719305))

(assert (=> b!774988 m!719305))

(assert (=> b!774988 m!719303))

(declare-fun m!719307 () Bool)

(assert (=> b!774988 m!719307))

(declare-fun m!719309 () Bool)

(assert (=> b!774974 m!719309))

(assert (=> b!774979 m!719303))

(assert (=> b!774979 m!719303))

(declare-fun m!719311 () Bool)

(assert (=> b!774979 m!719311))

(declare-fun m!719313 () Bool)

(assert (=> b!774992 m!719313))

(declare-fun m!719315 () Bool)

(assert (=> b!774983 m!719315))

(declare-fun m!719317 () Bool)

(assert (=> b!774978 m!719317))

(declare-fun m!719319 () Bool)

(assert (=> b!774980 m!719319))

(declare-fun m!719321 () Bool)

(assert (=> b!774980 m!719321))

(assert (=> b!774977 m!719303))

(assert (=> b!774977 m!719303))

(declare-fun m!719323 () Bool)

(assert (=> b!774977 m!719323))

(assert (=> b!774994 m!719303))

(assert (=> b!774994 m!719303))

(declare-fun m!719325 () Bool)

(assert (=> b!774994 m!719325))

(assert (=> b!774987 m!719303))

(assert (=> b!774987 m!719303))

(assert (=> b!774987 m!719323))

(declare-fun m!719327 () Bool)

(assert (=> start!67116 m!719327))

(declare-fun m!719329 () Bool)

(assert (=> start!67116 m!719329))

(declare-fun m!719331 () Bool)

(assert (=> b!774986 m!719331))

(declare-fun m!719333 () Bool)

(assert (=> b!774991 m!719333))

(assert (=> b!774991 m!719333))

(declare-fun m!719335 () Bool)

(assert (=> b!774991 m!719335))

(declare-fun m!719337 () Bool)

(assert (=> b!774991 m!719337))

(declare-fun m!719339 () Bool)

(assert (=> b!774991 m!719339))

(declare-fun m!719341 () Bool)

(assert (=> b!774991 m!719341))

(declare-fun m!719343 () Bool)

(assert (=> b!774993 m!719343))

(declare-fun m!719345 () Bool)

(assert (=> b!774976 m!719345))

(assert (=> b!774973 m!719303))

(assert (=> b!774973 m!719303))

(declare-fun m!719347 () Bool)

(assert (=> b!774973 m!719347))

(assert (=> b!774996 m!719303))

(assert (=> b!774996 m!719303))

(assert (=> b!774996 m!719347))

(assert (=> b!774996 m!719303))

(declare-fun m!719349 () Bool)

(assert (=> b!774996 m!719349))

(declare-fun m!719351 () Bool)

(assert (=> b!774990 m!719351))

(declare-fun m!719353 () Bool)

(assert (=> b!774984 m!719353))

(declare-fun m!719355 () Bool)

(assert (=> b!774984 m!719355))

(assert (=> b!774995 m!719303))

(assert (=> b!774995 m!719303))

(declare-fun m!719357 () Bool)

(assert (=> b!774995 m!719357))

(assert (=> b!774981 m!719303))

(assert (=> b!774981 m!719303))

(assert (=> b!774981 m!719349))

(assert (=> b!774972 m!719303))

(assert (=> b!774972 m!719303))

(declare-fun m!719359 () Bool)

(assert (=> b!774972 m!719359))

(push 1)

