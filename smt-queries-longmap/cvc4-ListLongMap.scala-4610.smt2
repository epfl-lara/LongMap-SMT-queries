; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64298 () Bool)

(assert start!64298)

(declare-fun b!722259 () Bool)

(declare-fun e!404868 () Bool)

(assert (=> b!722259 (= e!404868 false)))

(declare-fun lt!320244 () Bool)

(declare-fun e!404866 () Bool)

(assert (=> b!722259 (= lt!320244 e!404866)))

(declare-fun c!79504 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722259 (= c!79504 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722260 () Bool)

(declare-fun res!484001 () Bool)

(declare-fun e!404867 () Bool)

(assert (=> b!722260 (=> (not res!484001) (not e!404867))))

(declare-datatypes ((array!40879 0))(
  ( (array!40880 (arr!19562 (Array (_ BitVec 32) (_ BitVec 64))) (size!19983 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40879)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722260 (= res!484001 (validKeyInArray!0 (select (arr!19562 a!3186) j!159)))))

(declare-fun res!484000 () Bool)

(assert (=> start!64298 (=> (not res!484000) (not e!404867))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64298 (= res!484000 (validMask!0 mask!3328))))

(assert (=> start!64298 e!404867))

(assert (=> start!64298 true))

(declare-fun array_inv!15358 (array!40879) Bool)

(assert (=> start!64298 (array_inv!15358 a!3186)))

(declare-fun b!722261 () Bool)

(declare-fun res!483994 () Bool)

(assert (=> b!722261 (=> (not res!483994) (not e!404867))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!722261 (= res!483994 (validKeyInArray!0 k!2102))))

(declare-fun b!722262 () Bool)

(declare-fun res!483996 () Bool)

(assert (=> b!722262 (=> (not res!483996) (not e!404868))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722262 (= res!483996 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19562 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722263 () Bool)

(declare-fun res!483995 () Bool)

(declare-fun e!404870 () Bool)

(assert (=> b!722263 (=> (not res!483995) (not e!404870))))

(declare-datatypes ((List!13564 0))(
  ( (Nil!13561) (Cons!13560 (h!14614 (_ BitVec 64)) (t!19879 List!13564)) )
))
(declare-fun arrayNoDuplicates!0 (array!40879 (_ BitVec 32) List!13564) Bool)

(assert (=> b!722263 (= res!483995 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13561))))

(declare-datatypes ((SeekEntryResult!7162 0))(
  ( (MissingZero!7162 (index!31016 (_ BitVec 32))) (Found!7162 (index!31017 (_ BitVec 32))) (Intermediate!7162 (undefined!7974 Bool) (index!31018 (_ BitVec 32)) (x!62019 (_ BitVec 32))) (Undefined!7162) (MissingVacant!7162 (index!31019 (_ BitVec 32))) )
))
(declare-fun lt!320245 () SeekEntryResult!7162)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722264 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40879 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!722264 (= e!404866 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19562 a!3186) j!159) a!3186 mask!3328) lt!320245)))))

(declare-fun b!722265 () Bool)

(assert (=> b!722265 (= e!404867 e!404870)))

(declare-fun res!484002 () Bool)

(assert (=> b!722265 (=> (not res!484002) (not e!404870))))

(declare-fun lt!320246 () SeekEntryResult!7162)

(assert (=> b!722265 (= res!484002 (or (= lt!320246 (MissingZero!7162 i!1173)) (= lt!320246 (MissingVacant!7162 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40879 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!722265 (= lt!320246 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722266 () Bool)

(assert (=> b!722266 (= e!404870 e!404868)))

(declare-fun res!483997 () Bool)

(assert (=> b!722266 (=> (not res!483997) (not e!404868))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722266 (= res!483997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19562 a!3186) j!159) mask!3328) (select (arr!19562 a!3186) j!159) a!3186 mask!3328) lt!320245))))

(assert (=> b!722266 (= lt!320245 (Intermediate!7162 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722267 () Bool)

(declare-fun res!483999 () Bool)

(assert (=> b!722267 (=> (not res!483999) (not e!404867))))

(assert (=> b!722267 (= res!483999 (and (= (size!19983 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19983 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19983 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722268 () Bool)

(declare-fun res!484003 () Bool)

(assert (=> b!722268 (=> (not res!484003) (not e!404870))))

(assert (=> b!722268 (= res!484003 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19983 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19983 a!3186))))))

(declare-fun b!722269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40879 (_ BitVec 32)) SeekEntryResult!7162)

(assert (=> b!722269 (= e!404866 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19562 a!3186) j!159) a!3186 mask!3328) (Found!7162 j!159))))))

(declare-fun b!722270 () Bool)

(declare-fun res!483998 () Bool)

(assert (=> b!722270 (=> (not res!483998) (not e!404867))))

(declare-fun arrayContainsKey!0 (array!40879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722270 (= res!483998 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722271 () Bool)

(declare-fun res!484004 () Bool)

(assert (=> b!722271 (=> (not res!484004) (not e!404870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40879 (_ BitVec 32)) Bool)

(assert (=> b!722271 (= res!484004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64298 res!484000) b!722267))

(assert (= (and b!722267 res!483999) b!722260))

(assert (= (and b!722260 res!484001) b!722261))

(assert (= (and b!722261 res!483994) b!722270))

(assert (= (and b!722270 res!483998) b!722265))

(assert (= (and b!722265 res!484002) b!722271))

(assert (= (and b!722271 res!484004) b!722263))

(assert (= (and b!722263 res!483995) b!722268))

(assert (= (and b!722268 res!484003) b!722266))

(assert (= (and b!722266 res!483997) b!722262))

(assert (= (and b!722262 res!483996) b!722259))

(assert (= (and b!722259 c!79504) b!722264))

(assert (= (and b!722259 (not c!79504)) b!722269))

(declare-fun m!676833 () Bool)

(assert (=> b!722266 m!676833))

(assert (=> b!722266 m!676833))

(declare-fun m!676835 () Bool)

(assert (=> b!722266 m!676835))

(assert (=> b!722266 m!676835))

(assert (=> b!722266 m!676833))

(declare-fun m!676837 () Bool)

(assert (=> b!722266 m!676837))

(declare-fun m!676839 () Bool)

(assert (=> start!64298 m!676839))

(declare-fun m!676841 () Bool)

(assert (=> start!64298 m!676841))

(declare-fun m!676843 () Bool)

(assert (=> b!722263 m!676843))

(declare-fun m!676845 () Bool)

(assert (=> b!722270 m!676845))

(assert (=> b!722269 m!676833))

(assert (=> b!722269 m!676833))

(declare-fun m!676847 () Bool)

(assert (=> b!722269 m!676847))

(assert (=> b!722264 m!676833))

(assert (=> b!722264 m!676833))

(declare-fun m!676849 () Bool)

(assert (=> b!722264 m!676849))

(declare-fun m!676851 () Bool)

(assert (=> b!722262 m!676851))

(declare-fun m!676853 () Bool)

(assert (=> b!722265 m!676853))

(assert (=> b!722260 m!676833))

(assert (=> b!722260 m!676833))

(declare-fun m!676855 () Bool)

(assert (=> b!722260 m!676855))

(declare-fun m!676857 () Bool)

(assert (=> b!722271 m!676857))

(declare-fun m!676859 () Bool)

(assert (=> b!722261 m!676859))

(push 1)

(assert (not b!722269))

(assert (not b!722260))

(assert (not b!722265))

(assert (not b!722263))

(assert (not start!64298))

(assert (not b!722270))

(assert (not b!722264))

(assert (not b!722261))

