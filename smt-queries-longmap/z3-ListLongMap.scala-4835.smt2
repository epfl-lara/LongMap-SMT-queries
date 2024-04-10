; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66484 () Bool)

(assert start!66484)

(declare-fun b!766329 () Bool)

(declare-fun res!518471 () Bool)

(declare-fun e!426742 () Bool)

(assert (=> b!766329 (=> (not res!518471) (not e!426742))))

(declare-datatypes ((array!42263 0))(
  ( (array!42264 (arr!20236 (Array (_ BitVec 32) (_ BitVec 64))) (size!20657 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42263)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42263 (_ BitVec 32)) Bool)

(assert (=> b!766329 (= res!518471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766330 () Bool)

(declare-fun e!426744 () Bool)

(assert (=> b!766330 (= e!426742 e!426744)))

(declare-fun res!518473 () Bool)

(assert (=> b!766330 (=> (not res!518473) (not e!426744))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7836 0))(
  ( (MissingZero!7836 (index!33712 (_ BitVec 32))) (Found!7836 (index!33713 (_ BitVec 32))) (Intermediate!7836 (undefined!8648 Bool) (index!33714 (_ BitVec 32)) (x!64618 (_ BitVec 32))) (Undefined!7836) (MissingVacant!7836 (index!33715 (_ BitVec 32))) )
))
(declare-fun lt!340887 () SeekEntryResult!7836)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42263 (_ BitVec 32)) SeekEntryResult!7836)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766330 (= res!518473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20236 a!3186) j!159) mask!3328) (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!340887))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766330 (= lt!340887 (Intermediate!7836 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766331 () Bool)

(declare-fun res!518478 () Bool)

(assert (=> b!766331 (=> (not res!518478) (not e!426744))))

(declare-fun e!426745 () Bool)

(assert (=> b!766331 (= res!518478 e!426745)))

(declare-fun c!84319 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!766331 (= c!84319 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766332 () Bool)

(declare-fun res!518482 () Bool)

(declare-fun e!426746 () Bool)

(assert (=> b!766332 (=> (not res!518482) (not e!426746))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766332 (= res!518482 (and (= (size!20657 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20657 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20657 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766333 () Bool)

(declare-fun e!426741 () Bool)

(declare-fun e!426739 () Bool)

(assert (=> b!766333 (= e!426741 (not e!426739))))

(declare-fun res!518479 () Bool)

(assert (=> b!766333 (=> res!518479 e!426739)))

(declare-fun lt!340891 () SeekEntryResult!7836)

(get-info :version)

(assert (=> b!766333 (= res!518479 (or (not ((_ is Intermediate!7836) lt!340891)) (bvsge x!1131 (x!64618 lt!340891))))))

(declare-fun e!426747 () Bool)

(assert (=> b!766333 e!426747))

(declare-fun res!518472 () Bool)

(assert (=> b!766333 (=> (not res!518472) (not e!426747))))

(assert (=> b!766333 (= res!518472 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26398 0))(
  ( (Unit!26399) )
))
(declare-fun lt!340890 () Unit!26398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26398)

(assert (=> b!766333 (= lt!340890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!518485 () Bool)

(assert (=> start!66484 (=> (not res!518485) (not e!426746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66484 (= res!518485 (validMask!0 mask!3328))))

(assert (=> start!66484 e!426746))

(assert (=> start!66484 true))

(declare-fun array_inv!16032 (array!42263) Bool)

(assert (=> start!66484 (array_inv!16032 a!3186)))

(declare-fun b!766334 () Bool)

(declare-fun res!518470 () Bool)

(assert (=> b!766334 (=> (not res!518470) (not e!426742))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!766334 (= res!518470 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20657 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20657 a!3186))))))

(declare-fun b!766335 () Bool)

(assert (=> b!766335 (= e!426746 e!426742)))

(declare-fun res!518476 () Bool)

(assert (=> b!766335 (=> (not res!518476) (not e!426742))))

(declare-fun lt!340886 () SeekEntryResult!7836)

(assert (=> b!766335 (= res!518476 (or (= lt!340886 (MissingZero!7836 i!1173)) (= lt!340886 (MissingVacant!7836 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42263 (_ BitVec 32)) SeekEntryResult!7836)

(assert (=> b!766335 (= lt!340886 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!426740 () Bool)

(declare-fun b!766336 () Bool)

(declare-fun lt!340884 () SeekEntryResult!7836)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42263 (_ BitVec 32)) SeekEntryResult!7836)

(assert (=> b!766336 (= e!426740 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!340884))))

(declare-fun b!766337 () Bool)

(assert (=> b!766337 (= e!426747 e!426740)))

(declare-fun res!518477 () Bool)

(assert (=> b!766337 (=> (not res!518477) (not e!426740))))

(assert (=> b!766337 (= res!518477 (= (seekEntryOrOpen!0 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!340884))))

(assert (=> b!766337 (= lt!340884 (Found!7836 j!159))))

(declare-fun b!766338 () Bool)

(declare-fun res!518481 () Bool)

(assert (=> b!766338 (=> (not res!518481) (not e!426746))))

(declare-fun arrayContainsKey!0 (array!42263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766338 (= res!518481 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766339 () Bool)

(assert (=> b!766339 (= e!426744 e!426741)))

(declare-fun res!518483 () Bool)

(assert (=> b!766339 (=> (not res!518483) (not e!426741))))

(declare-fun lt!340888 () SeekEntryResult!7836)

(assert (=> b!766339 (= res!518483 (= lt!340888 lt!340891))))

(declare-fun lt!340892 () array!42263)

(declare-fun lt!340889 () (_ BitVec 64))

(assert (=> b!766339 (= lt!340891 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340889 lt!340892 mask!3328))))

(assert (=> b!766339 (= lt!340888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340889 mask!3328) lt!340889 lt!340892 mask!3328))))

(assert (=> b!766339 (= lt!340889 (select (store (arr!20236 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766339 (= lt!340892 (array!42264 (store (arr!20236 a!3186) i!1173 k0!2102) (size!20657 a!3186)))))

(declare-fun b!766340 () Bool)

(assert (=> b!766340 (= e!426745 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!340887))))

(declare-fun b!766341 () Bool)

(assert (=> b!766341 (= e!426745 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) (Found!7836 j!159)))))

(declare-fun b!766342 () Bool)

(declare-fun res!518474 () Bool)

(assert (=> b!766342 (=> (not res!518474) (not e!426744))))

(assert (=> b!766342 (= res!518474 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20236 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766343 () Bool)

(declare-fun res!518484 () Bool)

(assert (=> b!766343 (=> (not res!518484) (not e!426746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766343 (= res!518484 (validKeyInArray!0 (select (arr!20236 a!3186) j!159)))))

(declare-fun b!766344 () Bool)

(assert (=> b!766344 (= e!426739 true)))

(declare-fun lt!340885 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766344 (= lt!340885 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766345 () Bool)

(declare-fun res!518480 () Bool)

(assert (=> b!766345 (=> (not res!518480) (not e!426742))))

(declare-datatypes ((List!14238 0))(
  ( (Nil!14235) (Cons!14234 (h!15324 (_ BitVec 64)) (t!20553 List!14238)) )
))
(declare-fun arrayNoDuplicates!0 (array!42263 (_ BitVec 32) List!14238) Bool)

(assert (=> b!766345 (= res!518480 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14235))))

(declare-fun b!766346 () Bool)

(declare-fun res!518475 () Bool)

(assert (=> b!766346 (=> (not res!518475) (not e!426746))))

(assert (=> b!766346 (= res!518475 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66484 res!518485) b!766332))

(assert (= (and b!766332 res!518482) b!766343))

(assert (= (and b!766343 res!518484) b!766346))

(assert (= (and b!766346 res!518475) b!766338))

(assert (= (and b!766338 res!518481) b!766335))

(assert (= (and b!766335 res!518476) b!766329))

(assert (= (and b!766329 res!518471) b!766345))

(assert (= (and b!766345 res!518480) b!766334))

(assert (= (and b!766334 res!518470) b!766330))

(assert (= (and b!766330 res!518473) b!766342))

(assert (= (and b!766342 res!518474) b!766331))

(assert (= (and b!766331 c!84319) b!766340))

(assert (= (and b!766331 (not c!84319)) b!766341))

(assert (= (and b!766331 res!518478) b!766339))

(assert (= (and b!766339 res!518483) b!766333))

(assert (= (and b!766333 res!518472) b!766337))

(assert (= (and b!766337 res!518477) b!766336))

(assert (= (and b!766333 (not res!518479)) b!766344))

(declare-fun m!712329 () Bool)

(assert (=> b!766341 m!712329))

(assert (=> b!766341 m!712329))

(declare-fun m!712331 () Bool)

(assert (=> b!766341 m!712331))

(declare-fun m!712333 () Bool)

(assert (=> b!766339 m!712333))

(declare-fun m!712335 () Bool)

(assert (=> b!766339 m!712335))

(declare-fun m!712337 () Bool)

(assert (=> b!766339 m!712337))

(declare-fun m!712339 () Bool)

(assert (=> b!766339 m!712339))

(assert (=> b!766339 m!712333))

(declare-fun m!712341 () Bool)

(assert (=> b!766339 m!712341))

(declare-fun m!712343 () Bool)

(assert (=> b!766346 m!712343))

(declare-fun m!712345 () Bool)

(assert (=> start!66484 m!712345))

(declare-fun m!712347 () Bool)

(assert (=> start!66484 m!712347))

(declare-fun m!712349 () Bool)

(assert (=> b!766329 m!712349))

(assert (=> b!766343 m!712329))

(assert (=> b!766343 m!712329))

(declare-fun m!712351 () Bool)

(assert (=> b!766343 m!712351))

(declare-fun m!712353 () Bool)

(assert (=> b!766335 m!712353))

(declare-fun m!712355 () Bool)

(assert (=> b!766342 m!712355))

(declare-fun m!712357 () Bool)

(assert (=> b!766333 m!712357))

(declare-fun m!712359 () Bool)

(assert (=> b!766333 m!712359))

(declare-fun m!712361 () Bool)

(assert (=> b!766344 m!712361))

(assert (=> b!766330 m!712329))

(assert (=> b!766330 m!712329))

(declare-fun m!712363 () Bool)

(assert (=> b!766330 m!712363))

(assert (=> b!766330 m!712363))

(assert (=> b!766330 m!712329))

(declare-fun m!712365 () Bool)

(assert (=> b!766330 m!712365))

(assert (=> b!766336 m!712329))

(assert (=> b!766336 m!712329))

(declare-fun m!712367 () Bool)

(assert (=> b!766336 m!712367))

(declare-fun m!712369 () Bool)

(assert (=> b!766345 m!712369))

(assert (=> b!766337 m!712329))

(assert (=> b!766337 m!712329))

(declare-fun m!712371 () Bool)

(assert (=> b!766337 m!712371))

(declare-fun m!712373 () Bool)

(assert (=> b!766338 m!712373))

(assert (=> b!766340 m!712329))

(assert (=> b!766340 m!712329))

(declare-fun m!712375 () Bool)

(assert (=> b!766340 m!712375))

(check-sat (not b!766345) (not b!766339) (not start!66484) (not b!766333) (not b!766330) (not b!766346) (not b!766338) (not b!766341) (not b!766335) (not b!766337) (not b!766343) (not b!766329) (not b!766344) (not b!766340) (not b!766336))
(check-sat)
