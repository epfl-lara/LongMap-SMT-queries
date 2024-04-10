; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64348 () Bool)

(assert start!64348)

(declare-fun b!723337 () Bool)

(declare-fun res!484931 () Bool)

(declare-fun e!405264 () Bool)

(assert (=> b!723337 (=> (not res!484931) (not e!405264))))

(declare-datatypes ((array!40929 0))(
  ( (array!40930 (arr!19587 (Array (_ BitVec 32) (_ BitVec 64))) (size!20008 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40929)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!723337 (= res!484931 (and (= (size!20008 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20008 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20008 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723338 () Bool)

(declare-fun res!484933 () Bool)

(assert (=> b!723338 (=> (not res!484933) (not e!405264))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723338 (= res!484933 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!484922 () Bool)

(assert (=> start!64348 (=> (not res!484922) (not e!405264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64348 (= res!484922 (validMask!0 mask!3328))))

(assert (=> start!64348 e!405264))

(assert (=> start!64348 true))

(declare-fun array_inv!15383 (array!40929) Bool)

(assert (=> start!64348 (array_inv!15383 a!3186)))

(declare-fun b!723339 () Bool)

(declare-fun res!484934 () Bool)

(declare-fun e!405263 () Bool)

(assert (=> b!723339 (=> (not res!484934) (not e!405263))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723339 (= res!484934 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19587 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723340 () Bool)

(declare-fun res!484932 () Bool)

(assert (=> b!723340 (=> (not res!484932) (not e!405264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723340 (= res!484932 (validKeyInArray!0 k!2102))))

(declare-fun b!723341 () Bool)

(declare-fun res!484925 () Bool)

(assert (=> b!723341 (=> (not res!484925) (not e!405264))))

(assert (=> b!723341 (= res!484925 (validKeyInArray!0 (select (arr!19587 a!3186) j!159)))))

(declare-fun b!723342 () Bool)

(declare-fun res!484929 () Bool)

(declare-fun e!405266 () Bool)

(assert (=> b!723342 (=> (not res!484929) (not e!405266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40929 (_ BitVec 32)) Bool)

(assert (=> b!723342 (= res!484929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723343 () Bool)

(assert (=> b!723343 (= e!405266 e!405263)))

(declare-fun res!484923 () Bool)

(assert (=> b!723343 (=> (not res!484923) (not e!405263))))

(declare-datatypes ((SeekEntryResult!7187 0))(
  ( (MissingZero!7187 (index!31116 (_ BitVec 32))) (Found!7187 (index!31117 (_ BitVec 32))) (Intermediate!7187 (undefined!7999 Bool) (index!31118 (_ BitVec 32)) (x!62116 (_ BitVec 32))) (Undefined!7187) (MissingVacant!7187 (index!31119 (_ BitVec 32))) )
))
(declare-fun lt!320637 () SeekEntryResult!7187)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40929 (_ BitVec 32)) SeekEntryResult!7187)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723343 (= res!484923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19587 a!3186) j!159) mask!3328) (select (arr!19587 a!3186) j!159) a!3186 mask!3328) lt!320637))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723343 (= lt!320637 (Intermediate!7187 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723344 () Bool)

(declare-fun res!484924 () Bool)

(assert (=> b!723344 (=> (not res!484924) (not e!405266))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!723344 (= res!484924 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20008 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20008 a!3186))))))

(declare-fun b!723345 () Bool)

(declare-fun e!405261 () Bool)

(assert (=> b!723345 (= e!405263 e!405261)))

(declare-fun res!484927 () Bool)

(assert (=> b!723345 (=> (not res!484927) (not e!405261))))

(declare-fun lt!320635 () array!40929)

(declare-fun lt!320639 () (_ BitVec 64))

(assert (=> b!723345 (= res!484927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320639 mask!3328) lt!320639 lt!320635 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320639 lt!320635 mask!3328)))))

(assert (=> b!723345 (= lt!320639 (select (store (arr!19587 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723345 (= lt!320635 (array!40930 (store (arr!19587 a!3186) i!1173 k!2102) (size!20008 a!3186)))))

(declare-fun b!723346 () Bool)

(declare-fun e!405265 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40929 (_ BitVec 32)) SeekEntryResult!7187)

(assert (=> b!723346 (= e!405265 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19587 a!3186) j!159) a!3186 mask!3328) (Found!7187 j!159)))))

(declare-fun b!723347 () Bool)

(assert (=> b!723347 (= e!405264 e!405266)))

(declare-fun res!484930 () Bool)

(assert (=> b!723347 (=> (not res!484930) (not e!405266))))

(declare-fun lt!320636 () SeekEntryResult!7187)

(assert (=> b!723347 (= res!484930 (or (= lt!320636 (MissingZero!7187 i!1173)) (= lt!320636 (MissingVacant!7187 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40929 (_ BitVec 32)) SeekEntryResult!7187)

(assert (=> b!723347 (= lt!320636 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723348 () Bool)

(assert (=> b!723348 (= e!405265 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19587 a!3186) j!159) a!3186 mask!3328) lt!320637))))

(declare-fun b!723349 () Bool)

(declare-fun res!484928 () Bool)

(assert (=> b!723349 (=> (not res!484928) (not e!405263))))

(assert (=> b!723349 (= res!484928 e!405265)))

(declare-fun c!79579 () Bool)

(assert (=> b!723349 (= c!79579 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723350 () Bool)

(declare-fun res!484926 () Bool)

(assert (=> b!723350 (=> (not res!484926) (not e!405266))))

(declare-datatypes ((List!13589 0))(
  ( (Nil!13586) (Cons!13585 (h!14639 (_ BitVec 64)) (t!19904 List!13589)) )
))
(declare-fun arrayNoDuplicates!0 (array!40929 (_ BitVec 32) List!13589) Bool)

(assert (=> b!723350 (= res!484926 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13586))))

(declare-fun b!723351 () Bool)

(assert (=> b!723351 (= e!405261 (not true))))

(assert (=> b!723351 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24692 0))(
  ( (Unit!24693) )
))
(declare-fun lt!320638 () Unit!24692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24692)

(assert (=> b!723351 (= lt!320638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64348 res!484922) b!723337))

(assert (= (and b!723337 res!484931) b!723341))

(assert (= (and b!723341 res!484925) b!723340))

(assert (= (and b!723340 res!484932) b!723338))

(assert (= (and b!723338 res!484933) b!723347))

(assert (= (and b!723347 res!484930) b!723342))

(assert (= (and b!723342 res!484929) b!723350))

(assert (= (and b!723350 res!484926) b!723344))

(assert (= (and b!723344 res!484924) b!723343))

(assert (= (and b!723343 res!484923) b!723339))

(assert (= (and b!723339 res!484934) b!723349))

(assert (= (and b!723349 c!79579) b!723348))

(assert (= (and b!723349 (not c!79579)) b!723346))

(assert (= (and b!723349 res!484928) b!723345))

(assert (= (and b!723345 res!484927) b!723351))

(declare-fun m!677785 () Bool)

(assert (=> b!723343 m!677785))

(assert (=> b!723343 m!677785))

(declare-fun m!677787 () Bool)

(assert (=> b!723343 m!677787))

(assert (=> b!723343 m!677787))

(assert (=> b!723343 m!677785))

(declare-fun m!677789 () Bool)

(assert (=> b!723343 m!677789))

(declare-fun m!677791 () Bool)

(assert (=> b!723347 m!677791))

(assert (=> b!723348 m!677785))

(assert (=> b!723348 m!677785))

(declare-fun m!677793 () Bool)

(assert (=> b!723348 m!677793))

(declare-fun m!677795 () Bool)

(assert (=> b!723350 m!677795))

(declare-fun m!677797 () Bool)

(assert (=> start!64348 m!677797))

(declare-fun m!677799 () Bool)

(assert (=> start!64348 m!677799))

(assert (=> b!723346 m!677785))

(assert (=> b!723346 m!677785))

(declare-fun m!677801 () Bool)

(assert (=> b!723346 m!677801))

(declare-fun m!677803 () Bool)

(assert (=> b!723339 m!677803))

(declare-fun m!677805 () Bool)

(assert (=> b!723345 m!677805))

(declare-fun m!677807 () Bool)

(assert (=> b!723345 m!677807))

(declare-fun m!677809 () Bool)

(assert (=> b!723345 m!677809))

(declare-fun m!677811 () Bool)

(assert (=> b!723345 m!677811))

(assert (=> b!723345 m!677807))

(declare-fun m!677813 () Bool)

(assert (=> b!723345 m!677813))

(assert (=> b!723341 m!677785))

(assert (=> b!723341 m!677785))

(declare-fun m!677815 () Bool)

(assert (=> b!723341 m!677815))

(declare-fun m!677817 () Bool)

(assert (=> b!723340 m!677817))

(declare-fun m!677819 () Bool)

(assert (=> b!723351 m!677819))

(declare-fun m!677821 () Bool)

(assert (=> b!723351 m!677821))

(declare-fun m!677823 () Bool)

(assert (=> b!723338 m!677823))

(declare-fun m!677825 () Bool)

(assert (=> b!723342 m!677825))

(push 1)

