; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64374 () Bool)

(assert start!64374)

(declare-fun b!723945 () Bool)

(declare-fun e!405522 () Bool)

(declare-fun e!405519 () Bool)

(assert (=> b!723945 (= e!405522 e!405519)))

(declare-fun res!485453 () Bool)

(assert (=> b!723945 (=> (not res!485453) (not e!405519))))

(declare-fun lt!320834 () (_ BitVec 64))

(declare-datatypes ((array!40955 0))(
  ( (array!40956 (arr!19600 (Array (_ BitVec 32) (_ BitVec 64))) (size!20021 (_ BitVec 32))) )
))
(declare-fun lt!320832 () array!40955)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7200 0))(
  ( (MissingZero!7200 (index!31168 (_ BitVec 32))) (Found!7200 (index!31169 (_ BitVec 32))) (Intermediate!7200 (undefined!8012 Bool) (index!31170 (_ BitVec 32)) (x!62161 (_ BitVec 32))) (Undefined!7200) (MissingVacant!7200 (index!31171 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40955 (_ BitVec 32)) SeekEntryResult!7200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723945 (= res!485453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320834 mask!3328) lt!320834 lt!320832 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320834 lt!320832 mask!3328)))))

(declare-fun a!3186 () array!40955)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!723945 (= lt!320834 (select (store (arr!19600 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723945 (= lt!320832 (array!40956 (store (arr!19600 a!3186) i!1173 k0!2102) (size!20021 a!3186)))))

(declare-fun b!723947 () Bool)

(declare-fun res!485464 () Bool)

(assert (=> b!723947 (=> (not res!485464) (not e!405522))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723947 (= res!485464 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19600 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!320833 () SeekEntryResult!7200)

(declare-fun e!405523 () Bool)

(declare-fun b!723948 () Bool)

(assert (=> b!723948 (= e!405523 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!320833))))

(declare-fun b!723949 () Bool)

(declare-fun res!485463 () Bool)

(declare-fun e!405518 () Bool)

(assert (=> b!723949 (=> (not res!485463) (not e!405518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723949 (= res!485463 (validKeyInArray!0 k0!2102))))

(declare-fun b!723950 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40955 (_ BitVec 32)) SeekEntryResult!7200)

(assert (=> b!723950 (= e!405523 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) (Found!7200 j!159)))))

(declare-fun b!723951 () Bool)

(declare-fun res!485465 () Bool)

(assert (=> b!723951 (=> (not res!485465) (not e!405522))))

(assert (=> b!723951 (= res!485465 e!405523)))

(declare-fun c!79618 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723951 (= c!79618 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723952 () Bool)

(declare-fun res!485455 () Bool)

(assert (=> b!723952 (=> (not res!485455) (not e!405518))))

(declare-fun arrayContainsKey!0 (array!40955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723952 (= res!485455 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723953 () Bool)

(declare-fun e!405520 () Bool)

(assert (=> b!723953 (= e!405518 e!405520)))

(declare-fun res!485462 () Bool)

(assert (=> b!723953 (=> (not res!485462) (not e!405520))))

(declare-fun lt!320830 () SeekEntryResult!7200)

(assert (=> b!723953 (= res!485462 (or (= lt!320830 (MissingZero!7200 i!1173)) (= lt!320830 (MissingVacant!7200 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40955 (_ BitVec 32)) SeekEntryResult!7200)

(assert (=> b!723953 (= lt!320830 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723954 () Bool)

(declare-fun res!485454 () Bool)

(assert (=> b!723954 (=> (not res!485454) (not e!405520))))

(declare-datatypes ((List!13602 0))(
  ( (Nil!13599) (Cons!13598 (h!14652 (_ BitVec 64)) (t!19917 List!13602)) )
))
(declare-fun arrayNoDuplicates!0 (array!40955 (_ BitVec 32) List!13602) Bool)

(assert (=> b!723954 (= res!485454 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13599))))

(declare-fun b!723955 () Bool)

(declare-fun res!485456 () Bool)

(assert (=> b!723955 (=> (not res!485456) (not e!405518))))

(assert (=> b!723955 (= res!485456 (validKeyInArray!0 (select (arr!19600 a!3186) j!159)))))

(declare-fun b!723956 () Bool)

(assert (=> b!723956 (= e!405520 e!405522)))

(declare-fun res!485459 () Bool)

(assert (=> b!723956 (=> (not res!485459) (not e!405522))))

(assert (=> b!723956 (= res!485459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19600 a!3186) j!159) mask!3328) (select (arr!19600 a!3186) j!159) a!3186 mask!3328) lt!320833))))

(assert (=> b!723956 (= lt!320833 (Intermediate!7200 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723946 () Bool)

(declare-fun res!485452 () Bool)

(assert (=> b!723946 (=> (not res!485452) (not e!405520))))

(assert (=> b!723946 (= res!485452 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20021 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20021 a!3186))))))

(declare-fun res!485461 () Bool)

(assert (=> start!64374 (=> (not res!485461) (not e!405518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64374 (= res!485461 (validMask!0 mask!3328))))

(assert (=> start!64374 e!405518))

(assert (=> start!64374 true))

(declare-fun array_inv!15396 (array!40955) Bool)

(assert (=> start!64374 (array_inv!15396 a!3186)))

(declare-fun b!723957 () Bool)

(assert (=> b!723957 (= e!405519 (not true))))

(declare-fun e!405521 () Bool)

(assert (=> b!723957 e!405521))

(declare-fun res!485458 () Bool)

(assert (=> b!723957 (=> (not res!485458) (not e!405521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40955 (_ BitVec 32)) Bool)

(assert (=> b!723957 (= res!485458 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24718 0))(
  ( (Unit!24719) )
))
(declare-fun lt!320831 () Unit!24718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24718)

(assert (=> b!723957 (= lt!320831 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723958 () Bool)

(declare-fun res!485457 () Bool)

(assert (=> b!723958 (=> (not res!485457) (not e!405520))))

(assert (=> b!723958 (= res!485457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723959 () Bool)

(assert (=> b!723959 (= e!405521 (= (seekEntryOrOpen!0 (select (arr!19600 a!3186) j!159) a!3186 mask!3328) (Found!7200 j!159)))))

(declare-fun b!723960 () Bool)

(declare-fun res!485460 () Bool)

(assert (=> b!723960 (=> (not res!485460) (not e!405518))))

(assert (=> b!723960 (= res!485460 (and (= (size!20021 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20021 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20021 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64374 res!485461) b!723960))

(assert (= (and b!723960 res!485460) b!723955))

(assert (= (and b!723955 res!485456) b!723949))

(assert (= (and b!723949 res!485463) b!723952))

(assert (= (and b!723952 res!485455) b!723953))

(assert (= (and b!723953 res!485462) b!723958))

(assert (= (and b!723958 res!485457) b!723954))

(assert (= (and b!723954 res!485454) b!723946))

(assert (= (and b!723946 res!485452) b!723956))

(assert (= (and b!723956 res!485459) b!723947))

(assert (= (and b!723947 res!485464) b!723951))

(assert (= (and b!723951 c!79618) b!723948))

(assert (= (and b!723951 (not c!79618)) b!723950))

(assert (= (and b!723951 res!485465) b!723945))

(assert (= (and b!723945 res!485453) b!723957))

(assert (= (and b!723957 res!485458) b!723959))

(declare-fun m!678345 () Bool)

(assert (=> b!723959 m!678345))

(assert (=> b!723959 m!678345))

(declare-fun m!678347 () Bool)

(assert (=> b!723959 m!678347))

(assert (=> b!723950 m!678345))

(assert (=> b!723950 m!678345))

(declare-fun m!678349 () Bool)

(assert (=> b!723950 m!678349))

(declare-fun m!678351 () Bool)

(assert (=> b!723952 m!678351))

(declare-fun m!678353 () Bool)

(assert (=> b!723949 m!678353))

(declare-fun m!678355 () Bool)

(assert (=> b!723953 m!678355))

(declare-fun m!678357 () Bool)

(assert (=> b!723958 m!678357))

(declare-fun m!678359 () Bool)

(assert (=> start!64374 m!678359))

(declare-fun m!678361 () Bool)

(assert (=> start!64374 m!678361))

(assert (=> b!723948 m!678345))

(assert (=> b!723948 m!678345))

(declare-fun m!678363 () Bool)

(assert (=> b!723948 m!678363))

(declare-fun m!678365 () Bool)

(assert (=> b!723957 m!678365))

(declare-fun m!678367 () Bool)

(assert (=> b!723957 m!678367))

(assert (=> b!723956 m!678345))

(assert (=> b!723956 m!678345))

(declare-fun m!678369 () Bool)

(assert (=> b!723956 m!678369))

(assert (=> b!723956 m!678369))

(assert (=> b!723956 m!678345))

(declare-fun m!678371 () Bool)

(assert (=> b!723956 m!678371))

(declare-fun m!678373 () Bool)

(assert (=> b!723947 m!678373))

(declare-fun m!678375 () Bool)

(assert (=> b!723945 m!678375))

(declare-fun m!678377 () Bool)

(assert (=> b!723945 m!678377))

(assert (=> b!723945 m!678375))

(declare-fun m!678379 () Bool)

(assert (=> b!723945 m!678379))

(declare-fun m!678381 () Bool)

(assert (=> b!723945 m!678381))

(declare-fun m!678383 () Bool)

(assert (=> b!723945 m!678383))

(declare-fun m!678385 () Bool)

(assert (=> b!723954 m!678385))

(assert (=> b!723955 m!678345))

(assert (=> b!723955 m!678345))

(declare-fun m!678387 () Bool)

(assert (=> b!723955 m!678387))

(check-sat (not b!723955) (not b!723949) (not b!723950) (not start!64374) (not b!723959) (not b!723957) (not b!723953) (not b!723948) (not b!723958) (not b!723956) (not b!723945) (not b!723952) (not b!723954))
(check-sat)
