; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65474 () Bool)

(assert start!65474)

(declare-fun b!746547 () Bool)

(declare-fun e!416875 () Bool)

(declare-fun e!416870 () Bool)

(assert (=> b!746547 (= e!416875 e!416870)))

(declare-fun res!503416 () Bool)

(assert (=> b!746547 (=> (not res!503416) (not e!416870))))

(declare-datatypes ((SeekEntryResult!7543 0))(
  ( (MissingZero!7543 (index!32540 (_ BitVec 32))) (Found!7543 (index!32541 (_ BitVec 32))) (Intermediate!7543 (undefined!8355 Bool) (index!32542 (_ BitVec 32)) (x!63496 (_ BitVec 32))) (Undefined!7543) (MissingVacant!7543 (index!32543 (_ BitVec 32))) )
))
(declare-fun lt!331685 () SeekEntryResult!7543)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746547 (= res!503416 (or (= lt!331685 (MissingZero!7543 i!1173)) (= lt!331685 (MissingVacant!7543 i!1173))))))

(declare-datatypes ((array!41664 0))(
  ( (array!41665 (arr!19946 (Array (_ BitVec 32) (_ BitVec 64))) (size!20367 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41664)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41664 (_ BitVec 32)) SeekEntryResult!7543)

(assert (=> b!746547 (= lt!331685 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!416868 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!746548 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41664 (_ BitVec 32)) SeekEntryResult!7543)

(assert (=> b!746548 (= e!416868 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19946 a!3186) j!159) a!3186 mask!3328) (Found!7543 j!159)))))

(declare-fun lt!331680 () SeekEntryResult!7543)

(declare-fun b!746549 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41664 (_ BitVec 32)) SeekEntryResult!7543)

(assert (=> b!746549 (= e!416868 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19946 a!3186) j!159) a!3186 mask!3328) lt!331680))))

(declare-fun b!746550 () Bool)

(declare-fun res!503420 () Bool)

(assert (=> b!746550 (=> (not res!503420) (not e!416875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746550 (= res!503420 (validKeyInArray!0 k0!2102))))

(declare-fun b!746552 () Bool)

(declare-fun res!503423 () Bool)

(assert (=> b!746552 (=> (not res!503423) (not e!416870))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746552 (= res!503423 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20367 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20367 a!3186))))))

(declare-fun b!746553 () Bool)

(declare-fun res!503414 () Bool)

(assert (=> b!746553 (=> (not res!503414) (not e!416875))))

(assert (=> b!746553 (= res!503414 (validKeyInArray!0 (select (arr!19946 a!3186) j!159)))))

(declare-fun b!746554 () Bool)

(declare-fun res!503417 () Bool)

(assert (=> b!746554 (=> (not res!503417) (not e!416875))))

(declare-fun arrayContainsKey!0 (array!41664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746554 (= res!503417 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746555 () Bool)

(declare-fun res!503426 () Bool)

(declare-fun e!416867 () Bool)

(assert (=> b!746555 (=> (not res!503426) (not e!416867))))

(assert (=> b!746555 (= res!503426 e!416868)))

(declare-fun c!81948 () Bool)

(assert (=> b!746555 (= c!81948 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746556 () Bool)

(declare-fun e!416871 () Bool)

(assert (=> b!746556 (= e!416871 true)))

(declare-fun lt!331676 () SeekEntryResult!7543)

(declare-fun lt!331681 () SeekEntryResult!7543)

(assert (=> b!746556 (= lt!331676 lt!331681)))

(declare-fun b!746557 () Bool)

(declare-fun e!416873 () Bool)

(assert (=> b!746557 (= e!416873 e!416871)))

(declare-fun res!503421 () Bool)

(assert (=> b!746557 (=> res!503421 e!416871)))

(declare-fun lt!331678 () (_ BitVec 64))

(declare-fun lt!331683 () SeekEntryResult!7543)

(assert (=> b!746557 (= res!503421 (or (not (= lt!331681 lt!331683)) (= (select (store (arr!19946 a!3186) i!1173 k0!2102) index!1321) lt!331678) (not (= (select (store (arr!19946 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746557 (= lt!331681 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19946 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746558 () Bool)

(declare-fun e!416872 () Bool)

(assert (=> b!746558 (= e!416867 e!416872)))

(declare-fun res!503412 () Bool)

(assert (=> b!746558 (=> (not res!503412) (not e!416872))))

(declare-fun lt!331684 () SeekEntryResult!7543)

(declare-fun lt!331682 () SeekEntryResult!7543)

(assert (=> b!746558 (= res!503412 (= lt!331684 lt!331682))))

(declare-fun lt!331677 () array!41664)

(assert (=> b!746558 (= lt!331682 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331678 lt!331677 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746558 (= lt!331684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331678 mask!3328) lt!331678 lt!331677 mask!3328))))

(assert (=> b!746558 (= lt!331678 (select (store (arr!19946 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746558 (= lt!331677 (array!41665 (store (arr!19946 a!3186) i!1173 k0!2102) (size!20367 a!3186)))))

(declare-fun b!746551 () Bool)

(declare-fun res!503415 () Bool)

(assert (=> b!746551 (=> (not res!503415) (not e!416870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41664 (_ BitVec 32)) Bool)

(assert (=> b!746551 (= res!503415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!503425 () Bool)

(assert (=> start!65474 (=> (not res!503425) (not e!416875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65474 (= res!503425 (validMask!0 mask!3328))))

(assert (=> start!65474 e!416875))

(assert (=> start!65474 true))

(declare-fun array_inv!15829 (array!41664) Bool)

(assert (=> start!65474 (array_inv!15829 a!3186)))

(declare-fun e!416869 () Bool)

(declare-fun b!746559 () Bool)

(assert (=> b!746559 (= e!416869 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19946 a!3186) j!159) a!3186 mask!3328) lt!331683))))

(declare-fun b!746560 () Bool)

(declare-fun res!503427 () Bool)

(assert (=> b!746560 (=> (not res!503427) (not e!416867))))

(assert (=> b!746560 (= res!503427 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19946 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746561 () Bool)

(declare-fun res!503424 () Bool)

(assert (=> b!746561 (=> (not res!503424) (not e!416870))))

(declare-datatypes ((List!13987 0))(
  ( (Nil!13984) (Cons!13983 (h!15055 (_ BitVec 64)) (t!20293 List!13987)) )
))
(declare-fun arrayNoDuplicates!0 (array!41664 (_ BitVec 32) List!13987) Bool)

(assert (=> b!746561 (= res!503424 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13984))))

(declare-fun b!746562 () Bool)

(assert (=> b!746562 (= e!416872 (not e!416873))))

(declare-fun res!503418 () Bool)

(assert (=> b!746562 (=> res!503418 e!416873)))

(get-info :version)

(assert (=> b!746562 (= res!503418 (or (not ((_ is Intermediate!7543) lt!331682)) (bvslt x!1131 (x!63496 lt!331682)) (not (= x!1131 (x!63496 lt!331682))) (not (= index!1321 (index!32542 lt!331682)))))))

(assert (=> b!746562 e!416869))

(declare-fun res!503419 () Bool)

(assert (=> b!746562 (=> (not res!503419) (not e!416869))))

(assert (=> b!746562 (= res!503419 (= lt!331676 lt!331683))))

(assert (=> b!746562 (= lt!331683 (Found!7543 j!159))))

(assert (=> b!746562 (= lt!331676 (seekEntryOrOpen!0 (select (arr!19946 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746562 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25538 0))(
  ( (Unit!25539) )
))
(declare-fun lt!331679 () Unit!25538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25538)

(assert (=> b!746562 (= lt!331679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746563 () Bool)

(assert (=> b!746563 (= e!416870 e!416867)))

(declare-fun res!503422 () Bool)

(assert (=> b!746563 (=> (not res!503422) (not e!416867))))

(assert (=> b!746563 (= res!503422 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19946 a!3186) j!159) mask!3328) (select (arr!19946 a!3186) j!159) a!3186 mask!3328) lt!331680))))

(assert (=> b!746563 (= lt!331680 (Intermediate!7543 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746564 () Bool)

(declare-fun res!503413 () Bool)

(assert (=> b!746564 (=> (not res!503413) (not e!416875))))

(assert (=> b!746564 (= res!503413 (and (= (size!20367 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20367 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20367 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65474 res!503425) b!746564))

(assert (= (and b!746564 res!503413) b!746553))

(assert (= (and b!746553 res!503414) b!746550))

(assert (= (and b!746550 res!503420) b!746554))

(assert (= (and b!746554 res!503417) b!746547))

(assert (= (and b!746547 res!503416) b!746551))

(assert (= (and b!746551 res!503415) b!746561))

(assert (= (and b!746561 res!503424) b!746552))

(assert (= (and b!746552 res!503423) b!746563))

(assert (= (and b!746563 res!503422) b!746560))

(assert (= (and b!746560 res!503427) b!746555))

(assert (= (and b!746555 c!81948) b!746549))

(assert (= (and b!746555 (not c!81948)) b!746548))

(assert (= (and b!746555 res!503426) b!746558))

(assert (= (and b!746558 res!503412) b!746562))

(assert (= (and b!746562 res!503419) b!746559))

(assert (= (and b!746562 (not res!503418)) b!746557))

(assert (= (and b!746557 (not res!503421)) b!746556))

(declare-fun m!696257 () Bool)

(assert (=> b!746562 m!696257))

(assert (=> b!746562 m!696257))

(declare-fun m!696259 () Bool)

(assert (=> b!746562 m!696259))

(declare-fun m!696261 () Bool)

(assert (=> b!746562 m!696261))

(declare-fun m!696263 () Bool)

(assert (=> b!746562 m!696263))

(assert (=> b!746563 m!696257))

(assert (=> b!746563 m!696257))

(declare-fun m!696265 () Bool)

(assert (=> b!746563 m!696265))

(assert (=> b!746563 m!696265))

(assert (=> b!746563 m!696257))

(declare-fun m!696267 () Bool)

(assert (=> b!746563 m!696267))

(declare-fun m!696269 () Bool)

(assert (=> b!746554 m!696269))

(declare-fun m!696271 () Bool)

(assert (=> b!746547 m!696271))

(declare-fun m!696273 () Bool)

(assert (=> b!746557 m!696273))

(declare-fun m!696275 () Bool)

(assert (=> b!746557 m!696275))

(assert (=> b!746557 m!696257))

(assert (=> b!746557 m!696257))

(declare-fun m!696277 () Bool)

(assert (=> b!746557 m!696277))

(declare-fun m!696279 () Bool)

(assert (=> b!746560 m!696279))

(declare-fun m!696281 () Bool)

(assert (=> b!746550 m!696281))

(declare-fun m!696283 () Bool)

(assert (=> b!746561 m!696283))

(assert (=> b!746559 m!696257))

(assert (=> b!746559 m!696257))

(declare-fun m!696285 () Bool)

(assert (=> b!746559 m!696285))

(assert (=> b!746548 m!696257))

(assert (=> b!746548 m!696257))

(assert (=> b!746548 m!696277))

(assert (=> b!746553 m!696257))

(assert (=> b!746553 m!696257))

(declare-fun m!696287 () Bool)

(assert (=> b!746553 m!696287))

(declare-fun m!696289 () Bool)

(assert (=> b!746558 m!696289))

(declare-fun m!696291 () Bool)

(assert (=> b!746558 m!696291))

(declare-fun m!696293 () Bool)

(assert (=> b!746558 m!696293))

(assert (=> b!746558 m!696273))

(assert (=> b!746558 m!696289))

(declare-fun m!696295 () Bool)

(assert (=> b!746558 m!696295))

(declare-fun m!696297 () Bool)

(assert (=> b!746551 m!696297))

(declare-fun m!696299 () Bool)

(assert (=> start!65474 m!696299))

(declare-fun m!696301 () Bool)

(assert (=> start!65474 m!696301))

(assert (=> b!746549 m!696257))

(assert (=> b!746549 m!696257))

(declare-fun m!696303 () Bool)

(assert (=> b!746549 m!696303))

(check-sat (not b!746563) (not b!746557) (not b!746554) (not b!746558) (not b!746561) (not b!746553) (not b!746549) (not b!746547) (not b!746562) (not b!746550) (not start!65474) (not b!746559) (not b!746551) (not b!746548))
(check-sat)
