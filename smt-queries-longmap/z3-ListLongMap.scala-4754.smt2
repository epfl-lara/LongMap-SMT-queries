; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65564 () Bool)

(assert start!65564)

(declare-fun b!749399 () Bool)

(declare-fun res!505747 () Bool)

(declare-fun e!418143 () Bool)

(assert (=> b!749399 (=> (not res!505747) (not e!418143))))

(declare-datatypes ((array!41754 0))(
  ( (array!41755 (arr!19991 (Array (_ BitVec 32) (_ BitVec 64))) (size!20412 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41754)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749399 (= res!505747 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749400 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!418144 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7588 0))(
  ( (MissingZero!7588 (index!32720 (_ BitVec 32))) (Found!7588 (index!32721 (_ BitVec 32))) (Intermediate!7588 (undefined!8400 Bool) (index!32722 (_ BitVec 32)) (x!63661 (_ BitVec 32))) (Undefined!7588) (MissingVacant!7588 (index!32723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41754 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!749400 (= e!418144 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) (Found!7588 j!159)))))

(declare-fun b!749401 () Bool)

(declare-fun res!505752 () Bool)

(declare-fun e!418141 () Bool)

(assert (=> b!749401 (=> (not res!505752) (not e!418141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41754 (_ BitVec 32)) Bool)

(assert (=> b!749401 (= res!505752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749402 () Bool)

(declare-fun res!505753 () Bool)

(assert (=> b!749402 (=> (not res!505753) (not e!418141))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749402 (= res!505753 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20412 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20412 a!3186))))))

(declare-fun b!749403 () Bool)

(declare-fun res!505745 () Bool)

(declare-fun e!418146 () Bool)

(assert (=> b!749403 (=> res!505745 e!418146)))

(declare-fun lt!333049 () SeekEntryResult!7588)

(assert (=> b!749403 (= res!505745 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333049)))))

(declare-fun lt!333051 () (_ BitVec 64))

(declare-fun e!418142 () Bool)

(declare-fun b!749404 () Bool)

(declare-fun lt!333050 () array!41754)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41754 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!749404 (= e!418142 (= (seekEntryOrOpen!0 lt!333051 lt!333050 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333051 lt!333050 mask!3328)))))

(declare-fun res!505755 () Bool)

(assert (=> start!65564 (=> (not res!505755) (not e!418143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65564 (= res!505755 (validMask!0 mask!3328))))

(assert (=> start!65564 e!418143))

(assert (=> start!65564 true))

(declare-fun array_inv!15874 (array!41754) Bool)

(assert (=> start!65564 (array_inv!15874 a!3186)))

(declare-fun b!749405 () Bool)

(declare-fun res!505754 () Bool)

(assert (=> b!749405 (=> (not res!505754) (not e!418143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749405 (= res!505754 (validKeyInArray!0 (select (arr!19991 a!3186) j!159)))))

(declare-fun b!749406 () Bool)

(declare-fun res!505742 () Bool)

(assert (=> b!749406 (=> (not res!505742) (not e!418141))))

(declare-datatypes ((List!14032 0))(
  ( (Nil!14029) (Cons!14028 (h!15100 (_ BitVec 64)) (t!20338 List!14032)) )
))
(declare-fun arrayNoDuplicates!0 (array!41754 (_ BitVec 32) List!14032) Bool)

(assert (=> b!749406 (= res!505742 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14029))))

(declare-fun b!749407 () Bool)

(declare-fun res!505748 () Bool)

(declare-fun e!418148 () Bool)

(assert (=> b!749407 (=> (not res!505748) (not e!418148))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749407 (= res!505748 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19991 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749408 () Bool)

(declare-fun res!505744 () Bool)

(assert (=> b!749408 (=> (not res!505744) (not e!418148))))

(assert (=> b!749408 (= res!505744 e!418144)))

(declare-fun c!82212 () Bool)

(assert (=> b!749408 (= c!82212 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!418145 () Bool)

(declare-fun b!749409 () Bool)

(assert (=> b!749409 (= e!418145 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333049))))

(declare-fun b!749410 () Bool)

(declare-fun res!505743 () Bool)

(assert (=> b!749410 (=> (not res!505743) (not e!418143))))

(assert (=> b!749410 (= res!505743 (validKeyInArray!0 k0!2102))))

(declare-fun b!749411 () Bool)

(assert (=> b!749411 (= e!418143 e!418141)))

(declare-fun res!505740 () Bool)

(assert (=> b!749411 (=> (not res!505740) (not e!418141))))

(declare-fun lt!333052 () SeekEntryResult!7588)

(assert (=> b!749411 (= res!505740 (or (= lt!333052 (MissingZero!7588 i!1173)) (= lt!333052 (MissingVacant!7588 i!1173))))))

(assert (=> b!749411 (= lt!333052 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749412 () Bool)

(declare-fun e!418150 () Bool)

(assert (=> b!749412 (= e!418146 e!418150)))

(declare-fun res!505739 () Bool)

(assert (=> b!749412 (=> res!505739 e!418150)))

(declare-fun lt!333046 () (_ BitVec 64))

(assert (=> b!749412 (= res!505739 (= lt!333046 lt!333051))))

(assert (=> b!749412 (= lt!333046 (select (store (arr!19991 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749413 () Bool)

(declare-fun res!505741 () Bool)

(assert (=> b!749413 (=> (not res!505741) (not e!418143))))

(assert (=> b!749413 (= res!505741 (and (= (size!20412 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20412 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20412 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749414 () Bool)

(declare-fun lt!333048 () SeekEntryResult!7588)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41754 (_ BitVec 32)) SeekEntryResult!7588)

(assert (=> b!749414 (= e!418144 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333048))))

(declare-fun b!749415 () Bool)

(declare-fun e!418140 () Bool)

(assert (=> b!749415 (= e!418148 e!418140)))

(declare-fun res!505751 () Bool)

(assert (=> b!749415 (=> (not res!505751) (not e!418140))))

(declare-fun lt!333047 () SeekEntryResult!7588)

(declare-fun lt!333053 () SeekEntryResult!7588)

(assert (=> b!749415 (= res!505751 (= lt!333047 lt!333053))))

(assert (=> b!749415 (= lt!333053 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333051 lt!333050 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749415 (= lt!333047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333051 mask!3328) lt!333051 lt!333050 mask!3328))))

(assert (=> b!749415 (= lt!333051 (select (store (arr!19991 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749415 (= lt!333050 (array!41755 (store (arr!19991 a!3186) i!1173 k0!2102) (size!20412 a!3186)))))

(declare-fun b!749416 () Bool)

(assert (=> b!749416 (= e!418141 e!418148)))

(declare-fun res!505749 () Bool)

(assert (=> b!749416 (=> (not res!505749) (not e!418148))))

(assert (=> b!749416 (= res!505749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19991 a!3186) j!159) mask!3328) (select (arr!19991 a!3186) j!159) a!3186 mask!3328) lt!333048))))

(assert (=> b!749416 (= lt!333048 (Intermediate!7588 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749417 () Bool)

(declare-datatypes ((Unit!25712 0))(
  ( (Unit!25713) )
))
(declare-fun e!418147 () Unit!25712)

(declare-fun Unit!25714 () Unit!25712)

(assert (=> b!749417 (= e!418147 Unit!25714)))

(declare-fun b!749418 () Bool)

(assert (=> b!749418 (= e!418150 true)))

(assert (=> b!749418 e!418142))

(declare-fun res!505738 () Bool)

(assert (=> b!749418 (=> (not res!505738) (not e!418142))))

(assert (=> b!749418 (= res!505738 (= lt!333046 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333054 () Unit!25712)

(assert (=> b!749418 (= lt!333054 e!418147)))

(declare-fun c!82211 () Bool)

(assert (=> b!749418 (= c!82211 (= lt!333046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749419 () Bool)

(assert (=> b!749419 (= e!418140 (not e!418146))))

(declare-fun res!505750 () Bool)

(assert (=> b!749419 (=> res!505750 e!418146)))

(get-info :version)

(assert (=> b!749419 (= res!505750 (or (not ((_ is Intermediate!7588) lt!333053)) (bvslt x!1131 (x!63661 lt!333053)) (not (= x!1131 (x!63661 lt!333053))) (not (= index!1321 (index!32722 lt!333053)))))))

(assert (=> b!749419 e!418145))

(declare-fun res!505746 () Bool)

(assert (=> b!749419 (=> (not res!505746) (not e!418145))))

(declare-fun lt!333056 () SeekEntryResult!7588)

(assert (=> b!749419 (= res!505746 (= lt!333056 lt!333049))))

(assert (=> b!749419 (= lt!333049 (Found!7588 j!159))))

(assert (=> b!749419 (= lt!333056 (seekEntryOrOpen!0 (select (arr!19991 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749419 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333055 () Unit!25712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25712)

(assert (=> b!749419 (= lt!333055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749420 () Bool)

(declare-fun Unit!25715 () Unit!25712)

(assert (=> b!749420 (= e!418147 Unit!25715)))

(assert (=> b!749420 false))

(assert (= (and start!65564 res!505755) b!749413))

(assert (= (and b!749413 res!505741) b!749405))

(assert (= (and b!749405 res!505754) b!749410))

(assert (= (and b!749410 res!505743) b!749399))

(assert (= (and b!749399 res!505747) b!749411))

(assert (= (and b!749411 res!505740) b!749401))

(assert (= (and b!749401 res!505752) b!749406))

(assert (= (and b!749406 res!505742) b!749402))

(assert (= (and b!749402 res!505753) b!749416))

(assert (= (and b!749416 res!505749) b!749407))

(assert (= (and b!749407 res!505748) b!749408))

(assert (= (and b!749408 c!82212) b!749414))

(assert (= (and b!749408 (not c!82212)) b!749400))

(assert (= (and b!749408 res!505744) b!749415))

(assert (= (and b!749415 res!505751) b!749419))

(assert (= (and b!749419 res!505746) b!749409))

(assert (= (and b!749419 (not res!505750)) b!749403))

(assert (= (and b!749403 (not res!505745)) b!749412))

(assert (= (and b!749412 (not res!505739)) b!749418))

(assert (= (and b!749418 c!82211) b!749420))

(assert (= (and b!749418 (not c!82211)) b!749417))

(assert (= (and b!749418 res!505738) b!749404))

(declare-fun m!698453 () Bool)

(assert (=> b!749407 m!698453))

(declare-fun m!698455 () Bool)

(assert (=> b!749410 m!698455))

(declare-fun m!698457 () Bool)

(assert (=> b!749403 m!698457))

(assert (=> b!749403 m!698457))

(declare-fun m!698459 () Bool)

(assert (=> b!749403 m!698459))

(declare-fun m!698461 () Bool)

(assert (=> b!749415 m!698461))

(declare-fun m!698463 () Bool)

(assert (=> b!749415 m!698463))

(declare-fun m!698465 () Bool)

(assert (=> b!749415 m!698465))

(assert (=> b!749415 m!698461))

(declare-fun m!698467 () Bool)

(assert (=> b!749415 m!698467))

(declare-fun m!698469 () Bool)

(assert (=> b!749415 m!698469))

(declare-fun m!698471 () Bool)

(assert (=> start!65564 m!698471))

(declare-fun m!698473 () Bool)

(assert (=> start!65564 m!698473))

(assert (=> b!749400 m!698457))

(assert (=> b!749400 m!698457))

(assert (=> b!749400 m!698459))

(declare-fun m!698475 () Bool)

(assert (=> b!749404 m!698475))

(declare-fun m!698477 () Bool)

(assert (=> b!749404 m!698477))

(assert (=> b!749416 m!698457))

(assert (=> b!749416 m!698457))

(declare-fun m!698479 () Bool)

(assert (=> b!749416 m!698479))

(assert (=> b!749416 m!698479))

(assert (=> b!749416 m!698457))

(declare-fun m!698481 () Bool)

(assert (=> b!749416 m!698481))

(declare-fun m!698483 () Bool)

(assert (=> b!749411 m!698483))

(declare-fun m!698485 () Bool)

(assert (=> b!749399 m!698485))

(assert (=> b!749409 m!698457))

(assert (=> b!749409 m!698457))

(declare-fun m!698487 () Bool)

(assert (=> b!749409 m!698487))

(assert (=> b!749405 m!698457))

(assert (=> b!749405 m!698457))

(declare-fun m!698489 () Bool)

(assert (=> b!749405 m!698489))

(assert (=> b!749419 m!698457))

(assert (=> b!749419 m!698457))

(declare-fun m!698491 () Bool)

(assert (=> b!749419 m!698491))

(declare-fun m!698493 () Bool)

(assert (=> b!749419 m!698493))

(declare-fun m!698495 () Bool)

(assert (=> b!749419 m!698495))

(declare-fun m!698497 () Bool)

(assert (=> b!749401 m!698497))

(assert (=> b!749412 m!698467))

(declare-fun m!698499 () Bool)

(assert (=> b!749412 m!698499))

(declare-fun m!698501 () Bool)

(assert (=> b!749406 m!698501))

(assert (=> b!749414 m!698457))

(assert (=> b!749414 m!698457))

(declare-fun m!698503 () Bool)

(assert (=> b!749414 m!698503))

(check-sat (not b!749416) (not b!749410) (not b!749399) (not b!749406) (not b!749419) (not b!749403) (not b!749404) (not b!749415) (not b!749401) (not b!749409) (not start!65564) (not b!749414) (not b!749411) (not b!749400) (not b!749405))
(check-sat)
