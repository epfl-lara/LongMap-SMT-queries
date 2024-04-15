; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65594 () Bool)

(assert start!65594)

(declare-fun b!750389 () Bool)

(declare-fun res!506554 () Bool)

(declare-fun e!418640 () Bool)

(assert (=> b!750389 (=> (not res!506554) (not e!418640))))

(declare-datatypes ((array!41784 0))(
  ( (array!41785 (arr!20006 (Array (_ BitVec 32) (_ BitVec 64))) (size!20427 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41784)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750389 (= res!506554 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!333545 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!333547 () array!41784)

(declare-fun b!750390 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!418638 () Bool)

(declare-datatypes ((SeekEntryResult!7603 0))(
  ( (MissingZero!7603 (index!32780 (_ BitVec 32))) (Found!7603 (index!32781 (_ BitVec 32))) (Intermediate!7603 (undefined!8415 Bool) (index!32782 (_ BitVec 32)) (x!63716 (_ BitVec 32))) (Undefined!7603) (MissingVacant!7603 (index!32783 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41784 (_ BitVec 32)) SeekEntryResult!7603)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41784 (_ BitVec 32)) SeekEntryResult!7603)

(assert (=> b!750390 (= e!418638 (= (seekEntryOrOpen!0 lt!333545 lt!333547 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333545 lt!333547 mask!3328)))))

(declare-fun b!750391 () Bool)

(declare-fun res!506558 () Bool)

(declare-fun e!418644 () Bool)

(assert (=> b!750391 (=> (not res!506558) (not e!418644))))

(declare-datatypes ((List!14047 0))(
  ( (Nil!14044) (Cons!14043 (h!15115 (_ BitVec 64)) (t!20353 List!14047)) )
))
(declare-fun arrayNoDuplicates!0 (array!41784 (_ BitVec 32) List!14047) Bool)

(assert (=> b!750391 (= res!506558 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14044))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!418643 () Bool)

(declare-fun b!750392 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!750392 (= e!418643 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) (Found!7603 j!159)))))

(declare-fun b!750393 () Bool)

(declare-datatypes ((Unit!25772 0))(
  ( (Unit!25773) )
))
(declare-fun e!418637 () Unit!25772)

(declare-fun Unit!25774 () Unit!25772)

(assert (=> b!750393 (= e!418637 Unit!25774)))

(declare-fun b!750394 () Bool)

(declare-fun res!506561 () Bool)

(declare-fun e!418635 () Bool)

(assert (=> b!750394 (=> res!506561 e!418635)))

(declare-fun lt!333550 () SeekEntryResult!7603)

(assert (=> b!750394 (= res!506561 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333550)))))

(declare-fun b!750395 () Bool)

(declare-fun res!506555 () Bool)

(assert (=> b!750395 (=> (not res!506555) (not e!418644))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750395 (= res!506555 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20427 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20427 a!3186))))))

(declare-fun b!750396 () Bool)

(declare-fun res!506553 () Bool)

(assert (=> b!750396 (=> (not res!506553) (not e!418640))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750396 (= res!506553 (and (= (size!20427 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20427 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20427 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750397 () Bool)

(declare-fun res!506564 () Bool)

(assert (=> b!750397 (=> (not res!506564) (not e!418640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750397 (= res!506564 (validKeyInArray!0 (select (arr!20006 a!3186) j!159)))))

(declare-fun b!750398 () Bool)

(declare-fun res!506548 () Bool)

(assert (=> b!750398 (=> (not res!506548) (not e!418640))))

(assert (=> b!750398 (= res!506548 (validKeyInArray!0 k0!2102))))

(declare-fun res!506557 () Bool)

(assert (=> start!65594 (=> (not res!506557) (not e!418640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65594 (= res!506557 (validMask!0 mask!3328))))

(assert (=> start!65594 e!418640))

(assert (=> start!65594 true))

(declare-fun array_inv!15889 (array!41784) Bool)

(assert (=> start!65594 (array_inv!15889 a!3186)))

(declare-fun b!750399 () Bool)

(declare-fun e!418639 () Bool)

(assert (=> b!750399 (= e!418639 (not e!418635))))

(declare-fun res!506552 () Bool)

(assert (=> b!750399 (=> res!506552 e!418635)))

(declare-fun lt!333546 () SeekEntryResult!7603)

(get-info :version)

(assert (=> b!750399 (= res!506552 (or (not ((_ is Intermediate!7603) lt!333546)) (bvslt x!1131 (x!63716 lt!333546)) (not (= x!1131 (x!63716 lt!333546))) (not (= index!1321 (index!32782 lt!333546)))))))

(declare-fun e!418641 () Bool)

(assert (=> b!750399 e!418641))

(declare-fun res!506560 () Bool)

(assert (=> b!750399 (=> (not res!506560) (not e!418641))))

(declare-fun lt!333541 () SeekEntryResult!7603)

(assert (=> b!750399 (= res!506560 (= lt!333541 lt!333550))))

(assert (=> b!750399 (= lt!333550 (Found!7603 j!159))))

(assert (=> b!750399 (= lt!333541 (seekEntryOrOpen!0 (select (arr!20006 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41784 (_ BitVec 32)) Bool)

(assert (=> b!750399 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333542 () Unit!25772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25772)

(assert (=> b!750399 (= lt!333542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750400 () Bool)

(assert (=> b!750400 (= e!418640 e!418644)))

(declare-fun res!506549 () Bool)

(assert (=> b!750400 (=> (not res!506549) (not e!418644))))

(declare-fun lt!333548 () SeekEntryResult!7603)

(assert (=> b!750400 (= res!506549 (or (= lt!333548 (MissingZero!7603 i!1173)) (= lt!333548 (MissingVacant!7603 i!1173))))))

(assert (=> b!750400 (= lt!333548 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750401 () Bool)

(declare-fun res!506562 () Bool)

(declare-fun e!418645 () Bool)

(assert (=> b!750401 (=> (not res!506562) (not e!418645))))

(assert (=> b!750401 (= res!506562 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20006 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750402 () Bool)

(declare-fun Unit!25775 () Unit!25772)

(assert (=> b!750402 (= e!418637 Unit!25775)))

(assert (=> b!750402 false))

(declare-fun b!750403 () Bool)

(assert (=> b!750403 (= e!418644 e!418645)))

(declare-fun res!506556 () Bool)

(assert (=> b!750403 (=> (not res!506556) (not e!418645))))

(declare-fun lt!333543 () SeekEntryResult!7603)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41784 (_ BitVec 32)) SeekEntryResult!7603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750403 (= res!506556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20006 a!3186) j!159) mask!3328) (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333543))))

(assert (=> b!750403 (= lt!333543 (Intermediate!7603 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750404 () Bool)

(declare-fun res!506565 () Bool)

(assert (=> b!750404 (=> (not res!506565) (not e!418644))))

(assert (=> b!750404 (= res!506565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750405 () Bool)

(declare-fun e!418642 () Bool)

(assert (=> b!750405 (= e!418635 e!418642)))

(declare-fun res!506550 () Bool)

(assert (=> b!750405 (=> res!506550 e!418642)))

(declare-fun lt!333544 () (_ BitVec 64))

(assert (=> b!750405 (= res!506550 (= lt!333544 lt!333545))))

(assert (=> b!750405 (= lt!333544 (select (store (arr!20006 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750406 () Bool)

(assert (=> b!750406 (= e!418641 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333550))))

(declare-fun b!750407 () Bool)

(assert (=> b!750407 (= e!418642 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!750407 e!418638))

(declare-fun res!506559 () Bool)

(assert (=> b!750407 (=> (not res!506559) (not e!418638))))

(assert (=> b!750407 (= res!506559 (= lt!333544 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333551 () Unit!25772)

(assert (=> b!750407 (= lt!333551 e!418637)))

(declare-fun c!82301 () Bool)

(assert (=> b!750407 (= c!82301 (= lt!333544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750408 () Bool)

(assert (=> b!750408 (= e!418643 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20006 a!3186) j!159) a!3186 mask!3328) lt!333543))))

(declare-fun b!750409 () Bool)

(assert (=> b!750409 (= e!418645 e!418639)))

(declare-fun res!506563 () Bool)

(assert (=> b!750409 (=> (not res!506563) (not e!418639))))

(declare-fun lt!333549 () SeekEntryResult!7603)

(assert (=> b!750409 (= res!506563 (= lt!333549 lt!333546))))

(assert (=> b!750409 (= lt!333546 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333545 lt!333547 mask!3328))))

(assert (=> b!750409 (= lt!333549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333545 mask!3328) lt!333545 lt!333547 mask!3328))))

(assert (=> b!750409 (= lt!333545 (select (store (arr!20006 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750409 (= lt!333547 (array!41785 (store (arr!20006 a!3186) i!1173 k0!2102) (size!20427 a!3186)))))

(declare-fun b!750410 () Bool)

(declare-fun res!506551 () Bool)

(assert (=> b!750410 (=> (not res!506551) (not e!418645))))

(assert (=> b!750410 (= res!506551 e!418643)))

(declare-fun c!82302 () Bool)

(assert (=> b!750410 (= c!82302 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65594 res!506557) b!750396))

(assert (= (and b!750396 res!506553) b!750397))

(assert (= (and b!750397 res!506564) b!750398))

(assert (= (and b!750398 res!506548) b!750389))

(assert (= (and b!750389 res!506554) b!750400))

(assert (= (and b!750400 res!506549) b!750404))

(assert (= (and b!750404 res!506565) b!750391))

(assert (= (and b!750391 res!506558) b!750395))

(assert (= (and b!750395 res!506555) b!750403))

(assert (= (and b!750403 res!506556) b!750401))

(assert (= (and b!750401 res!506562) b!750410))

(assert (= (and b!750410 c!82302) b!750408))

(assert (= (and b!750410 (not c!82302)) b!750392))

(assert (= (and b!750410 res!506551) b!750409))

(assert (= (and b!750409 res!506563) b!750399))

(assert (= (and b!750399 res!506560) b!750406))

(assert (= (and b!750399 (not res!506552)) b!750394))

(assert (= (and b!750394 (not res!506561)) b!750405))

(assert (= (and b!750405 (not res!506550)) b!750407))

(assert (= (and b!750407 c!82301) b!750402))

(assert (= (and b!750407 (not c!82301)) b!750393))

(assert (= (and b!750407 res!506559) b!750390))

(declare-fun m!699233 () Bool)

(assert (=> start!65594 m!699233))

(declare-fun m!699235 () Bool)

(assert (=> start!65594 m!699235))

(declare-fun m!699237 () Bool)

(assert (=> b!750391 m!699237))

(declare-fun m!699239 () Bool)

(assert (=> b!750399 m!699239))

(assert (=> b!750399 m!699239))

(declare-fun m!699241 () Bool)

(assert (=> b!750399 m!699241))

(declare-fun m!699243 () Bool)

(assert (=> b!750399 m!699243))

(declare-fun m!699245 () Bool)

(assert (=> b!750399 m!699245))

(assert (=> b!750403 m!699239))

(assert (=> b!750403 m!699239))

(declare-fun m!699247 () Bool)

(assert (=> b!750403 m!699247))

(assert (=> b!750403 m!699247))

(assert (=> b!750403 m!699239))

(declare-fun m!699249 () Bool)

(assert (=> b!750403 m!699249))

(declare-fun m!699251 () Bool)

(assert (=> b!750401 m!699251))

(declare-fun m!699253 () Bool)

(assert (=> b!750398 m!699253))

(declare-fun m!699255 () Bool)

(assert (=> b!750400 m!699255))

(assert (=> b!750392 m!699239))

(assert (=> b!750392 m!699239))

(declare-fun m!699257 () Bool)

(assert (=> b!750392 m!699257))

(assert (=> b!750408 m!699239))

(assert (=> b!750408 m!699239))

(declare-fun m!699259 () Bool)

(assert (=> b!750408 m!699259))

(assert (=> b!750397 m!699239))

(assert (=> b!750397 m!699239))

(declare-fun m!699261 () Bool)

(assert (=> b!750397 m!699261))

(assert (=> b!750406 m!699239))

(assert (=> b!750406 m!699239))

(declare-fun m!699263 () Bool)

(assert (=> b!750406 m!699263))

(declare-fun m!699265 () Bool)

(assert (=> b!750409 m!699265))

(declare-fun m!699267 () Bool)

(assert (=> b!750409 m!699267))

(declare-fun m!699269 () Bool)

(assert (=> b!750409 m!699269))

(declare-fun m!699271 () Bool)

(assert (=> b!750409 m!699271))

(assert (=> b!750409 m!699267))

(declare-fun m!699273 () Bool)

(assert (=> b!750409 m!699273))

(declare-fun m!699275 () Bool)

(assert (=> b!750390 m!699275))

(declare-fun m!699277 () Bool)

(assert (=> b!750390 m!699277))

(declare-fun m!699279 () Bool)

(assert (=> b!750389 m!699279))

(declare-fun m!699281 () Bool)

(assert (=> b!750404 m!699281))

(assert (=> b!750394 m!699239))

(assert (=> b!750394 m!699239))

(assert (=> b!750394 m!699257))

(assert (=> b!750405 m!699271))

(declare-fun m!699283 () Bool)

(assert (=> b!750405 m!699283))

(check-sat (not b!750394) (not b!750391) (not b!750398) (not b!750390) (not b!750406) (not b!750409) (not b!750397) (not b!750404) (not b!750400) (not b!750389) (not start!65594) (not b!750399) (not b!750408) (not b!750392) (not b!750403))
(check-sat)
