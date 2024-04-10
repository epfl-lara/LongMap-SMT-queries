; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64300 () Bool)

(assert start!64300)

(declare-fun b!722302 () Bool)

(declare-fun res!484041 () Bool)

(declare-fun e!404884 () Bool)

(assert (=> b!722302 (=> (not res!484041) (not e!404884))))

(declare-datatypes ((array!40881 0))(
  ( (array!40882 (arr!19563 (Array (_ BitVec 32) (_ BitVec 64))) (size!19984 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40881)

(declare-datatypes ((List!13565 0))(
  ( (Nil!13562) (Cons!13561 (h!14615 (_ BitVec 64)) (t!19880 List!13565)) )
))
(declare-fun arrayNoDuplicates!0 (array!40881 (_ BitVec 32) List!13565) Bool)

(assert (=> b!722302 (= res!484041 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13562))))

(declare-fun b!722303 () Bool)

(declare-fun res!484040 () Bool)

(assert (=> b!722303 (=> (not res!484040) (not e!404884))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722303 (= res!484040 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19984 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19984 a!3186))))))

(declare-fun b!722304 () Bool)

(declare-fun res!484037 () Bool)

(declare-fun e!404881 () Bool)

(assert (=> b!722304 (=> (not res!484037) (not e!404881))))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!722304 (= res!484037 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722305 () Bool)

(declare-fun res!484036 () Bool)

(declare-fun e!404885 () Bool)

(assert (=> b!722305 (=> (not res!484036) (not e!404885))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722305 (= res!484036 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722306 () Bool)

(declare-fun res!484043 () Bool)

(assert (=> b!722306 (=> (not res!484043) (not e!404885))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722306 (= res!484043 (and (= (size!19984 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19984 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19984 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722307 () Bool)

(declare-datatypes ((SeekEntryResult!7163 0))(
  ( (MissingZero!7163 (index!31020 (_ BitVec 32))) (Found!7163 (index!31021 (_ BitVec 32))) (Intermediate!7163 (undefined!7975 Bool) (index!31022 (_ BitVec 32)) (x!62028 (_ BitVec 32))) (Undefined!7163) (MissingVacant!7163 (index!31023 (_ BitVec 32))) )
))
(declare-fun lt!320251 () SeekEntryResult!7163)

(declare-fun e!404882 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40881 (_ BitVec 32)) SeekEntryResult!7163)

(assert (=> b!722307 (= e!404882 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19563 a!3186) j!159) a!3186 mask!3328) lt!320251))))

(declare-fun b!722308 () Bool)

(declare-fun res!484034 () Bool)

(assert (=> b!722308 (=> (not res!484034) (not e!404884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40881 (_ BitVec 32)) Bool)

(assert (=> b!722308 (= res!484034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722309 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722309 (= e!404881 (not (validKeyInArray!0 (select (store (arr!19563 a!3186) i!1173 k!2102) j!159))))))

(declare-fun b!722310 () Bool)

(declare-fun res!484032 () Bool)

(assert (=> b!722310 (=> (not res!484032) (not e!404881))))

(assert (=> b!722310 (= res!484032 e!404882)))

(declare-fun c!79507 () Bool)

(assert (=> b!722310 (= c!79507 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722311 () Bool)

(declare-fun res!484042 () Bool)

(assert (=> b!722311 (=> (not res!484042) (not e!404885))))

(assert (=> b!722311 (= res!484042 (validKeyInArray!0 (select (arr!19563 a!3186) j!159)))))

(declare-fun b!722312 () Bool)

(declare-fun res!484035 () Bool)

(assert (=> b!722312 (=> (not res!484035) (not e!404885))))

(assert (=> b!722312 (= res!484035 (validKeyInArray!0 k!2102))))

(declare-fun b!722313 () Bool)

(assert (=> b!722313 (= e!404884 e!404881)))

(declare-fun res!484039 () Bool)

(assert (=> b!722313 (=> (not res!484039) (not e!404881))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722313 (= res!484039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19563 a!3186) j!159) mask!3328) (select (arr!19563 a!3186) j!159) a!3186 mask!3328) lt!320251))))

(assert (=> b!722313 (= lt!320251 (Intermediate!7163 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722314 () Bool)

(declare-fun res!484033 () Bool)

(assert (=> b!722314 (=> (not res!484033) (not e!404881))))

(assert (=> b!722314 (= res!484033 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19563 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!484031 () Bool)

(assert (=> start!64300 (=> (not res!484031) (not e!404885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64300 (= res!484031 (validMask!0 mask!3328))))

(assert (=> start!64300 e!404885))

(assert (=> start!64300 true))

(declare-fun array_inv!15359 (array!40881) Bool)

(assert (=> start!64300 (array_inv!15359 a!3186)))

(declare-fun b!722315 () Bool)

(assert (=> b!722315 (= e!404885 e!404884)))

(declare-fun res!484038 () Bool)

(assert (=> b!722315 (=> (not res!484038) (not e!404884))))

(declare-fun lt!320252 () SeekEntryResult!7163)

(assert (=> b!722315 (= res!484038 (or (= lt!320252 (MissingZero!7163 i!1173)) (= lt!320252 (MissingVacant!7163 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40881 (_ BitVec 32)) SeekEntryResult!7163)

(assert (=> b!722315 (= lt!320252 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722316 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40881 (_ BitVec 32)) SeekEntryResult!7163)

(assert (=> b!722316 (= e!404882 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19563 a!3186) j!159) a!3186 mask!3328) (Found!7163 j!159)))))

(assert (= (and start!64300 res!484031) b!722306))

(assert (= (and b!722306 res!484043) b!722311))

(assert (= (and b!722311 res!484042) b!722312))

(assert (= (and b!722312 res!484035) b!722305))

(assert (= (and b!722305 res!484036) b!722315))

(assert (= (and b!722315 res!484038) b!722308))

(assert (= (and b!722308 res!484034) b!722302))

(assert (= (and b!722302 res!484041) b!722303))

(assert (= (and b!722303 res!484040) b!722313))

(assert (= (and b!722313 res!484039) b!722314))

(assert (= (and b!722314 res!484033) b!722310))

(assert (= (and b!722310 c!79507) b!722307))

(assert (= (and b!722310 (not c!79507)) b!722316))

(assert (= (and b!722310 res!484032) b!722304))

(assert (= (and b!722304 res!484037) b!722309))

(declare-fun m!676861 () Bool)

(assert (=> b!722305 m!676861))

(declare-fun m!676863 () Bool)

(assert (=> b!722312 m!676863))

(declare-fun m!676865 () Bool)

(assert (=> b!722311 m!676865))

(assert (=> b!722311 m!676865))

(declare-fun m!676867 () Bool)

(assert (=> b!722311 m!676867))

(declare-fun m!676869 () Bool)

(assert (=> b!722302 m!676869))

(assert (=> b!722313 m!676865))

(assert (=> b!722313 m!676865))

(declare-fun m!676871 () Bool)

(assert (=> b!722313 m!676871))

(assert (=> b!722313 m!676871))

(assert (=> b!722313 m!676865))

(declare-fun m!676873 () Bool)

(assert (=> b!722313 m!676873))

(declare-fun m!676875 () Bool)

(assert (=> b!722315 m!676875))

(declare-fun m!676877 () Bool)

(assert (=> start!64300 m!676877))

(declare-fun m!676879 () Bool)

(assert (=> start!64300 m!676879))

(assert (=> b!722307 m!676865))

(assert (=> b!722307 m!676865))

(declare-fun m!676881 () Bool)

(assert (=> b!722307 m!676881))

(declare-fun m!676883 () Bool)

(assert (=> b!722309 m!676883))

(declare-fun m!676885 () Bool)

(assert (=> b!722309 m!676885))

(assert (=> b!722309 m!676885))

(declare-fun m!676887 () Bool)

(assert (=> b!722309 m!676887))

(declare-fun m!676889 () Bool)

(assert (=> b!722308 m!676889))

(declare-fun m!676891 () Bool)

(assert (=> b!722314 m!676891))

(assert (=> b!722316 m!676865))

(assert (=> b!722316 m!676865))

(declare-fun m!676893 () Bool)

(assert (=> b!722316 m!676893))

(push 1)

