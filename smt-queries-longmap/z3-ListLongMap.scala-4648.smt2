; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64640 () Bool)

(assert start!64640)

(declare-fun b!728328 () Bool)

(declare-fun res!488975 () Bool)

(declare-fun e!407681 () Bool)

(assert (=> b!728328 (=> (not res!488975) (not e!407681))))

(declare-datatypes ((array!41106 0))(
  ( (array!41107 (arr!19673 (Array (_ BitVec 32) (_ BitVec 64))) (size!20094 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41106)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728328 (= res!488975 (and (= (size!20094 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20094 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20094 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728329 () Bool)

(declare-fun res!488972 () Bool)

(declare-fun e!407682 () Bool)

(assert (=> b!728329 (=> (not res!488972) (not e!407682))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!728329 (= res!488972 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19673 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728330 () Bool)

(declare-fun e!407684 () Bool)

(assert (=> b!728330 (= e!407681 e!407684)))

(declare-fun res!488974 () Bool)

(assert (=> b!728330 (=> (not res!488974) (not e!407684))))

(declare-datatypes ((SeekEntryResult!7270 0))(
  ( (MissingZero!7270 (index!31448 (_ BitVec 32))) (Found!7270 (index!31449 (_ BitVec 32))) (Intermediate!7270 (undefined!8082 Bool) (index!31450 (_ BitVec 32)) (x!62447 (_ BitVec 32))) (Undefined!7270) (MissingVacant!7270 (index!31451 (_ BitVec 32))) )
))
(declare-fun lt!322494 () SeekEntryResult!7270)

(assert (=> b!728330 (= res!488974 (or (= lt!322494 (MissingZero!7270 i!1173)) (= lt!322494 (MissingVacant!7270 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41106 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!728330 (= lt!322494 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728331 () Bool)

(declare-fun e!407685 () Bool)

(assert (=> b!728331 (= e!407682 e!407685)))

(declare-fun res!488970 () Bool)

(assert (=> b!728331 (=> (not res!488970) (not e!407685))))

(declare-fun lt!322491 () SeekEntryResult!7270)

(declare-fun lt!322496 () SeekEntryResult!7270)

(assert (=> b!728331 (= res!488970 (= lt!322491 lt!322496))))

(declare-fun lt!322499 () array!41106)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322498 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41106 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!728331 (= lt!322496 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322498 lt!322499 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728331 (= lt!322491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322498 mask!3328) lt!322498 lt!322499 mask!3328))))

(assert (=> b!728331 (= lt!322498 (select (store (arr!19673 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728331 (= lt!322499 (array!41107 (store (arr!19673 a!3186) i!1173 k0!2102) (size!20094 a!3186)))))

(declare-fun b!728332 () Bool)

(declare-fun e!407683 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41106 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!728332 (= e!407683 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) (Found!7270 j!159)))))

(declare-fun b!728333 () Bool)

(declare-fun e!407686 () Bool)

(declare-fun e!407678 () Bool)

(assert (=> b!728333 (= e!407686 e!407678)))

(declare-fun res!488980 () Bool)

(assert (=> b!728333 (=> (not res!488980) (not e!407678))))

(declare-fun lt!322497 () SeekEntryResult!7270)

(assert (=> b!728333 (= res!488980 (= (seekEntryOrOpen!0 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322497))))

(assert (=> b!728333 (= lt!322497 (Found!7270 j!159))))

(declare-fun b!728335 () Bool)

(declare-fun res!488977 () Bool)

(assert (=> b!728335 (=> (not res!488977) (not e!407684))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728335 (= res!488977 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20094 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20094 a!3186))))))

(declare-fun b!728336 () Bool)

(declare-fun res!488968 () Bool)

(assert (=> b!728336 (=> (not res!488968) (not e!407684))))

(declare-datatypes ((List!13714 0))(
  ( (Nil!13711) (Cons!13710 (h!14770 (_ BitVec 64)) (t!20020 List!13714)) )
))
(declare-fun arrayNoDuplicates!0 (array!41106 (_ BitVec 32) List!13714) Bool)

(assert (=> b!728336 (= res!488968 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13711))))

(declare-fun b!728337 () Bool)

(declare-fun e!407680 () Bool)

(assert (=> b!728337 (= e!407680 true)))

(declare-fun lt!322495 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728337 (= lt!322495 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728338 () Bool)

(declare-fun lt!322493 () SeekEntryResult!7270)

(assert (=> b!728338 (= e!407683 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322493))))

(declare-fun b!728339 () Bool)

(declare-fun res!488971 () Bool)

(assert (=> b!728339 (=> (not res!488971) (not e!407681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728339 (= res!488971 (validKeyInArray!0 k0!2102))))

(declare-fun b!728340 () Bool)

(declare-fun res!488979 () Bool)

(assert (=> b!728340 (=> (not res!488979) (not e!407684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41106 (_ BitVec 32)) Bool)

(assert (=> b!728340 (= res!488979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728341 () Bool)

(assert (=> b!728341 (= e!407684 e!407682)))

(declare-fun res!488982 () Bool)

(assert (=> b!728341 (=> (not res!488982) (not e!407682))))

(assert (=> b!728341 (= res!488982 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19673 a!3186) j!159) mask!3328) (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322493))))

(assert (=> b!728341 (= lt!322493 (Intermediate!7270 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728334 () Bool)

(assert (=> b!728334 (= e!407685 (not e!407680))))

(declare-fun res!488976 () Bool)

(assert (=> b!728334 (=> res!488976 e!407680)))

(get-info :version)

(assert (=> b!728334 (= res!488976 (or (not ((_ is Intermediate!7270) lt!322496)) (bvsge x!1131 (x!62447 lt!322496))))))

(assert (=> b!728334 e!407686))

(declare-fun res!488978 () Bool)

(assert (=> b!728334 (=> (not res!488978) (not e!407686))))

(assert (=> b!728334 (= res!488978 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24830 0))(
  ( (Unit!24831) )
))
(declare-fun lt!322492 () Unit!24830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24830)

(assert (=> b!728334 (= lt!322492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!488967 () Bool)

(assert (=> start!64640 (=> (not res!488967) (not e!407681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64640 (= res!488967 (validMask!0 mask!3328))))

(assert (=> start!64640 e!407681))

(assert (=> start!64640 true))

(declare-fun array_inv!15556 (array!41106) Bool)

(assert (=> start!64640 (array_inv!15556 a!3186)))

(declare-fun b!728342 () Bool)

(declare-fun res!488981 () Bool)

(assert (=> b!728342 (=> (not res!488981) (not e!407682))))

(assert (=> b!728342 (= res!488981 e!407683)))

(declare-fun c!80055 () Bool)

(assert (=> b!728342 (= c!80055 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728343 () Bool)

(declare-fun res!488973 () Bool)

(assert (=> b!728343 (=> (not res!488973) (not e!407681))))

(declare-fun arrayContainsKey!0 (array!41106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728343 (= res!488973 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728344 () Bool)

(assert (=> b!728344 (= e!407678 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19673 a!3186) j!159) a!3186 mask!3328) lt!322497))))

(declare-fun b!728345 () Bool)

(declare-fun res!488969 () Bool)

(assert (=> b!728345 (=> (not res!488969) (not e!407681))))

(assert (=> b!728345 (= res!488969 (validKeyInArray!0 (select (arr!19673 a!3186) j!159)))))

(assert (= (and start!64640 res!488967) b!728328))

(assert (= (and b!728328 res!488975) b!728345))

(assert (= (and b!728345 res!488969) b!728339))

(assert (= (and b!728339 res!488971) b!728343))

(assert (= (and b!728343 res!488973) b!728330))

(assert (= (and b!728330 res!488974) b!728340))

(assert (= (and b!728340 res!488979) b!728336))

(assert (= (and b!728336 res!488968) b!728335))

(assert (= (and b!728335 res!488977) b!728341))

(assert (= (and b!728341 res!488982) b!728329))

(assert (= (and b!728329 res!488972) b!728342))

(assert (= (and b!728342 c!80055) b!728338))

(assert (= (and b!728342 (not c!80055)) b!728332))

(assert (= (and b!728342 res!488981) b!728331))

(assert (= (and b!728331 res!488970) b!728334))

(assert (= (and b!728334 res!488978) b!728333))

(assert (= (and b!728333 res!488980) b!728344))

(assert (= (and b!728334 (not res!488976)) b!728337))

(declare-fun m!681557 () Bool)

(assert (=> b!728329 m!681557))

(declare-fun m!681559 () Bool)

(assert (=> b!728344 m!681559))

(assert (=> b!728344 m!681559))

(declare-fun m!681561 () Bool)

(assert (=> b!728344 m!681561))

(assert (=> b!728333 m!681559))

(assert (=> b!728333 m!681559))

(declare-fun m!681563 () Bool)

(assert (=> b!728333 m!681563))

(declare-fun m!681565 () Bool)

(assert (=> b!728343 m!681565))

(declare-fun m!681567 () Bool)

(assert (=> start!64640 m!681567))

(declare-fun m!681569 () Bool)

(assert (=> start!64640 m!681569))

(assert (=> b!728338 m!681559))

(assert (=> b!728338 m!681559))

(declare-fun m!681571 () Bool)

(assert (=> b!728338 m!681571))

(assert (=> b!728345 m!681559))

(assert (=> b!728345 m!681559))

(declare-fun m!681573 () Bool)

(assert (=> b!728345 m!681573))

(declare-fun m!681575 () Bool)

(assert (=> b!728330 m!681575))

(declare-fun m!681577 () Bool)

(assert (=> b!728331 m!681577))

(declare-fun m!681579 () Bool)

(assert (=> b!728331 m!681579))

(declare-fun m!681581 () Bool)

(assert (=> b!728331 m!681581))

(declare-fun m!681583 () Bool)

(assert (=> b!728331 m!681583))

(declare-fun m!681585 () Bool)

(assert (=> b!728331 m!681585))

(assert (=> b!728331 m!681583))

(declare-fun m!681587 () Bool)

(assert (=> b!728339 m!681587))

(assert (=> b!728341 m!681559))

(assert (=> b!728341 m!681559))

(declare-fun m!681589 () Bool)

(assert (=> b!728341 m!681589))

(assert (=> b!728341 m!681589))

(assert (=> b!728341 m!681559))

(declare-fun m!681591 () Bool)

(assert (=> b!728341 m!681591))

(declare-fun m!681593 () Bool)

(assert (=> b!728334 m!681593))

(declare-fun m!681595 () Bool)

(assert (=> b!728334 m!681595))

(declare-fun m!681597 () Bool)

(assert (=> b!728340 m!681597))

(declare-fun m!681599 () Bool)

(assert (=> b!728336 m!681599))

(assert (=> b!728332 m!681559))

(assert (=> b!728332 m!681559))

(declare-fun m!681601 () Bool)

(assert (=> b!728332 m!681601))

(declare-fun m!681603 () Bool)

(assert (=> b!728337 m!681603))

(check-sat (not b!728336) (not b!728332) (not b!728330) (not b!728337) (not b!728343) (not b!728339) (not b!728345) (not b!728331) (not b!728338) (not b!728334) (not start!64640) (not b!728333) (not b!728344) (not b!728340) (not b!728341))
(check-sat)
