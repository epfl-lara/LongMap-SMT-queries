; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65228 () Bool)

(assert start!65228)

(declare-fun b!739458 () Bool)

(declare-fun res!497270 () Bool)

(declare-fun e!413456 () Bool)

(assert (=> b!739458 (=> (not res!497270) (not e!413456))))

(declare-datatypes ((array!41418 0))(
  ( (array!41419 (arr!19823 (Array (_ BitVec 32) (_ BitVec 64))) (size!20244 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41418)

(declare-datatypes ((List!13864 0))(
  ( (Nil!13861) (Cons!13860 (h!14932 (_ BitVec 64)) (t!20170 List!13864)) )
))
(declare-fun arrayNoDuplicates!0 (array!41418 (_ BitVec 32) List!13864) Bool)

(assert (=> b!739458 (= res!497270 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13861))))

(declare-fun b!739459 () Bool)

(declare-fun res!497281 () Bool)

(declare-fun e!413455 () Bool)

(assert (=> b!739459 (=> res!497281 e!413455)))

(declare-fun e!413459 () Bool)

(assert (=> b!739459 (= res!497281 e!413459)))

(declare-fun c!81477 () Bool)

(declare-fun lt!328270 () Bool)

(assert (=> b!739459 (= c!81477 lt!328270)))

(declare-fun b!739460 () Bool)

(declare-fun res!497277 () Bool)

(declare-fun e!413461 () Bool)

(assert (=> b!739460 (=> (not res!497277) (not e!413461))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739460 (= res!497277 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!739461 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!413458 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7420 0))(
  ( (MissingZero!7420 (index!32048 (_ BitVec 32))) (Found!7420 (index!32049 (_ BitVec 32))) (Intermediate!7420 (undefined!8232 Bool) (index!32050 (_ BitVec 32)) (x!63045 (_ BitVec 32))) (Undefined!7420) (MissingVacant!7420 (index!32051 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41418 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!739461 (= e!413458 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) (Found!7420 j!159)))))

(declare-fun b!739462 () Bool)

(declare-fun res!497272 () Bool)

(assert (=> b!739462 (=> (not res!497272) (not e!413461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739462 (= res!497272 (validKeyInArray!0 k0!2102))))

(declare-fun res!497271 () Bool)

(assert (=> start!65228 (=> (not res!497271) (not e!413461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65228 (= res!497271 (validMask!0 mask!3328))))

(assert (=> start!65228 e!413461))

(assert (=> start!65228 true))

(declare-fun array_inv!15706 (array!41418) Bool)

(assert (=> start!65228 (array_inv!15706 a!3186)))

(declare-fun lt!328264 () (_ BitVec 32))

(declare-fun lt!328275 () SeekEntryResult!7420)

(declare-fun b!739463 () Bool)

(assert (=> b!739463 (= e!413459 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328264 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328275)))))

(declare-fun b!739464 () Bool)

(declare-fun e!413457 () Bool)

(declare-fun e!413460 () Bool)

(assert (=> b!739464 (= e!413457 e!413460)))

(declare-fun res!497269 () Bool)

(assert (=> b!739464 (=> (not res!497269) (not e!413460))))

(declare-fun lt!328266 () SeekEntryResult!7420)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41418 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!739464 (= res!497269 (= (seekEntryOrOpen!0 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328266))))

(assert (=> b!739464 (= lt!328266 (Found!7420 j!159))))

(declare-fun b!739465 () Bool)

(declare-fun res!497273 () Bool)

(assert (=> b!739465 (=> (not res!497273) (not e!413456))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739465 (= res!497273 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20244 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20244 a!3186))))))

(declare-fun b!739466 () Bool)

(declare-fun res!497275 () Bool)

(assert (=> b!739466 (=> (not res!497275) (not e!413461))))

(assert (=> b!739466 (= res!497275 (validKeyInArray!0 (select (arr!19823 a!3186) j!159)))))

(declare-fun b!739467 () Bool)

(declare-datatypes ((Unit!25256 0))(
  ( (Unit!25257) )
))
(declare-fun e!413462 () Unit!25256)

(declare-fun Unit!25258 () Unit!25256)

(assert (=> b!739467 (= e!413462 Unit!25258)))

(declare-fun lt!328276 () SeekEntryResult!7420)

(assert (=> b!739467 (= lt!328276 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739467 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328264 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328275)))

(declare-fun b!739468 () Bool)

(declare-fun e!413453 () Bool)

(assert (=> b!739468 (= e!413453 e!413455)))

(declare-fun res!497279 () Bool)

(assert (=> b!739468 (=> res!497279 e!413455)))

(assert (=> b!739468 (= res!497279 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328264 #b00000000000000000000000000000000) (bvsge lt!328264 (size!20244 a!3186))))))

(declare-fun lt!328267 () Unit!25256)

(assert (=> b!739468 (= lt!328267 e!413462)))

(declare-fun c!81476 () Bool)

(assert (=> b!739468 (= c!81476 lt!328270)))

(assert (=> b!739468 (= lt!328270 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739468 (= lt!328264 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739469 () Bool)

(declare-fun e!413463 () Bool)

(declare-fun e!413464 () Bool)

(assert (=> b!739469 (= e!413463 e!413464)))

(declare-fun res!497285 () Bool)

(assert (=> b!739469 (=> (not res!497285) (not e!413464))))

(declare-fun lt!328272 () SeekEntryResult!7420)

(declare-fun lt!328268 () SeekEntryResult!7420)

(assert (=> b!739469 (= res!497285 (= lt!328272 lt!328268))))

(declare-fun lt!328273 () (_ BitVec 64))

(declare-fun lt!328277 () array!41418)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41418 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!739469 (= lt!328268 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328273 lt!328277 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739469 (= lt!328272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328273 mask!3328) lt!328273 lt!328277 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739469 (= lt!328273 (select (store (arr!19823 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739469 (= lt!328277 (array!41419 (store (arr!19823 a!3186) i!1173 k0!2102) (size!20244 a!3186)))))

(declare-fun lt!328265 () SeekEntryResult!7420)

(declare-fun b!739470 () Bool)

(assert (=> b!739470 (= e!413459 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328264 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328265)))))

(declare-fun b!739471 () Bool)

(declare-fun res!497274 () Bool)

(assert (=> b!739471 (=> (not res!497274) (not e!413463))))

(assert (=> b!739471 (= res!497274 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19823 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739472 () Bool)

(assert (=> b!739472 (= e!413460 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328266))))

(declare-fun b!739473 () Bool)

(declare-fun Unit!25259 () Unit!25256)

(assert (=> b!739473 (= e!413462 Unit!25259)))

(assert (=> b!739473 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328264 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328265)))

(declare-fun b!739474 () Bool)

(assert (=> b!739474 (= e!413461 e!413456)))

(declare-fun res!497283 () Bool)

(assert (=> b!739474 (=> (not res!497283) (not e!413456))))

(declare-fun lt!328269 () SeekEntryResult!7420)

(assert (=> b!739474 (= res!497283 (or (= lt!328269 (MissingZero!7420 i!1173)) (= lt!328269 (MissingVacant!7420 i!1173))))))

(assert (=> b!739474 (= lt!328269 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739475 () Bool)

(assert (=> b!739475 (= e!413455 true)))

(declare-fun lt!328271 () SeekEntryResult!7420)

(assert (=> b!739475 (= lt!328271 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328264 lt!328273 lt!328277 mask!3328))))

(declare-fun b!739476 () Bool)

(assert (=> b!739476 (= e!413464 (not e!413453))))

(declare-fun res!497282 () Bool)

(assert (=> b!739476 (=> res!497282 e!413453)))

(get-info :version)

(assert (=> b!739476 (= res!497282 (or (not ((_ is Intermediate!7420) lt!328268)) (bvsge x!1131 (x!63045 lt!328268))))))

(assert (=> b!739476 (= lt!328275 (Found!7420 j!159))))

(assert (=> b!739476 e!413457))

(declare-fun res!497286 () Bool)

(assert (=> b!739476 (=> (not res!497286) (not e!413457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41418 (_ BitVec 32)) Bool)

(assert (=> b!739476 (= res!497286 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328274 () Unit!25256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25256)

(assert (=> b!739476 (= lt!328274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739477 () Bool)

(declare-fun res!497276 () Bool)

(assert (=> b!739477 (=> (not res!497276) (not e!413463))))

(assert (=> b!739477 (= res!497276 e!413458)))

(declare-fun c!81475 () Bool)

(assert (=> b!739477 (= c!81475 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739478 () Bool)

(declare-fun res!497278 () Bool)

(assert (=> b!739478 (=> (not res!497278) (not e!413461))))

(assert (=> b!739478 (= res!497278 (and (= (size!20244 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20244 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20244 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739479 () Bool)

(assert (=> b!739479 (= e!413456 e!413463)))

(declare-fun res!497280 () Bool)

(assert (=> b!739479 (=> (not res!497280) (not e!413463))))

(assert (=> b!739479 (= res!497280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19823 a!3186) j!159) mask!3328) (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328265))))

(assert (=> b!739479 (= lt!328265 (Intermediate!7420 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739480 () Bool)

(declare-fun res!497284 () Bool)

(assert (=> b!739480 (=> (not res!497284) (not e!413456))))

(assert (=> b!739480 (= res!497284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739481 () Bool)

(assert (=> b!739481 (= e!413458 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19823 a!3186) j!159) a!3186 mask!3328) lt!328265))))

(assert (= (and start!65228 res!497271) b!739478))

(assert (= (and b!739478 res!497278) b!739466))

(assert (= (and b!739466 res!497275) b!739462))

(assert (= (and b!739462 res!497272) b!739460))

(assert (= (and b!739460 res!497277) b!739474))

(assert (= (and b!739474 res!497283) b!739480))

(assert (= (and b!739480 res!497284) b!739458))

(assert (= (and b!739458 res!497270) b!739465))

(assert (= (and b!739465 res!497273) b!739479))

(assert (= (and b!739479 res!497280) b!739471))

(assert (= (and b!739471 res!497274) b!739477))

(assert (= (and b!739477 c!81475) b!739481))

(assert (= (and b!739477 (not c!81475)) b!739461))

(assert (= (and b!739477 res!497276) b!739469))

(assert (= (and b!739469 res!497285) b!739476))

(assert (= (and b!739476 res!497286) b!739464))

(assert (= (and b!739464 res!497269) b!739472))

(assert (= (and b!739476 (not res!497282)) b!739468))

(assert (= (and b!739468 c!81476) b!739473))

(assert (= (and b!739468 (not c!81476)) b!739467))

(assert (= (and b!739468 (not res!497279)) b!739459))

(assert (= (and b!739459 c!81477) b!739470))

(assert (= (and b!739459 (not c!81477)) b!739463))

(assert (= (and b!739459 (not res!497281)) b!739475))

(declare-fun m!690263 () Bool)

(assert (=> start!65228 m!690263))

(declare-fun m!690265 () Bool)

(assert (=> start!65228 m!690265))

(declare-fun m!690267 () Bool)

(assert (=> b!739461 m!690267))

(assert (=> b!739461 m!690267))

(declare-fun m!690269 () Bool)

(assert (=> b!739461 m!690269))

(assert (=> b!739472 m!690267))

(assert (=> b!739472 m!690267))

(declare-fun m!690271 () Bool)

(assert (=> b!739472 m!690271))

(declare-fun m!690273 () Bool)

(assert (=> b!739471 m!690273))

(declare-fun m!690275 () Bool)

(assert (=> b!739468 m!690275))

(assert (=> b!739463 m!690267))

(assert (=> b!739463 m!690267))

(declare-fun m!690277 () Bool)

(assert (=> b!739463 m!690277))

(assert (=> b!739473 m!690267))

(assert (=> b!739473 m!690267))

(declare-fun m!690279 () Bool)

(assert (=> b!739473 m!690279))

(assert (=> b!739470 m!690267))

(assert (=> b!739470 m!690267))

(assert (=> b!739470 m!690279))

(declare-fun m!690281 () Bool)

(assert (=> b!739474 m!690281))

(assert (=> b!739479 m!690267))

(assert (=> b!739479 m!690267))

(declare-fun m!690283 () Bool)

(assert (=> b!739479 m!690283))

(assert (=> b!739479 m!690283))

(assert (=> b!739479 m!690267))

(declare-fun m!690285 () Bool)

(assert (=> b!739479 m!690285))

(declare-fun m!690287 () Bool)

(assert (=> b!739458 m!690287))

(assert (=> b!739467 m!690267))

(assert (=> b!739467 m!690267))

(assert (=> b!739467 m!690269))

(assert (=> b!739467 m!690267))

(assert (=> b!739467 m!690277))

(assert (=> b!739466 m!690267))

(assert (=> b!739466 m!690267))

(declare-fun m!690289 () Bool)

(assert (=> b!739466 m!690289))

(assert (=> b!739481 m!690267))

(assert (=> b!739481 m!690267))

(declare-fun m!690291 () Bool)

(assert (=> b!739481 m!690291))

(declare-fun m!690293 () Bool)

(assert (=> b!739476 m!690293))

(declare-fun m!690295 () Bool)

(assert (=> b!739476 m!690295))

(declare-fun m!690297 () Bool)

(assert (=> b!739462 m!690297))

(assert (=> b!739464 m!690267))

(assert (=> b!739464 m!690267))

(declare-fun m!690299 () Bool)

(assert (=> b!739464 m!690299))

(declare-fun m!690301 () Bool)

(assert (=> b!739460 m!690301))

(declare-fun m!690303 () Bool)

(assert (=> b!739480 m!690303))

(declare-fun m!690305 () Bool)

(assert (=> b!739475 m!690305))

(declare-fun m!690307 () Bool)

(assert (=> b!739469 m!690307))

(declare-fun m!690309 () Bool)

(assert (=> b!739469 m!690309))

(declare-fun m!690311 () Bool)

(assert (=> b!739469 m!690311))

(declare-fun m!690313 () Bool)

(assert (=> b!739469 m!690313))

(declare-fun m!690315 () Bool)

(assert (=> b!739469 m!690315))

(assert (=> b!739469 m!690309))

(check-sat (not b!739473) (not b!739480) (not b!739474) (not b!739468) (not b!739472) (not b!739463) (not b!739461) (not b!739469) (not b!739470) (not b!739481) (not b!739462) (not b!739476) (not b!739460) (not b!739479) (not start!65228) (not b!739475) (not b!739464) (not b!739458) (not b!739467) (not b!739466))
(check-sat)
