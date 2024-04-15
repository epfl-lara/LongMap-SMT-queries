; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65120 () Bool)

(assert start!65120)

(declare-fun b!735570 () Bool)

(declare-fun res!494354 () Bool)

(declare-fun e!411513 () Bool)

(assert (=> b!735570 (=> (not res!494354) (not e!411513))))

(declare-datatypes ((array!41310 0))(
  ( (array!41311 (arr!19769 (Array (_ BitVec 32) (_ BitVec 64))) (size!20190 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41310)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!735570 (= res!494354 (and (= (size!20190 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20190 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20190 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735571 () Bool)

(declare-fun res!494362 () Bool)

(declare-fun e!411514 () Bool)

(assert (=> b!735571 (=> (not res!494362) (not e!411514))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735571 (= res!494362 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20190 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20190 a!3186))))))

(declare-fun res!494353 () Bool)

(assert (=> start!65120 (=> (not res!494353) (not e!411513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65120 (= res!494353 (validMask!0 mask!3328))))

(assert (=> start!65120 e!411513))

(assert (=> start!65120 true))

(declare-fun array_inv!15652 (array!41310) Bool)

(assert (=> start!65120 (array_inv!15652 a!3186)))

(declare-fun b!735572 () Bool)

(declare-fun res!494363 () Bool)

(declare-fun e!411518 () Bool)

(assert (=> b!735572 (=> (not res!494363) (not e!411518))))

(assert (=> b!735572 (= res!494363 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19769 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735573 () Bool)

(declare-datatypes ((SeekEntryResult!7366 0))(
  ( (MissingZero!7366 (index!31832 (_ BitVec 32))) (Found!7366 (index!31833 (_ BitVec 32))) (Intermediate!7366 (undefined!8178 Bool) (index!31834 (_ BitVec 32)) (x!62847 (_ BitVec 32))) (Undefined!7366) (MissingVacant!7366 (index!31835 (_ BitVec 32))) )
))
(declare-fun lt!326009 () SeekEntryResult!7366)

(declare-fun e!411517 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41310 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!735573 (= e!411517 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326009))))

(declare-fun b!735574 () Bool)

(declare-fun res!494357 () Bool)

(assert (=> b!735574 (=> (not res!494357) (not e!411518))))

(assert (=> b!735574 (= res!494357 e!411517)))

(declare-fun c!80991 () Bool)

(assert (=> b!735574 (= c!80991 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735575 () Bool)

(declare-fun res!494361 () Bool)

(assert (=> b!735575 (=> (not res!494361) (not e!411513))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735575 (= res!494361 (validKeyInArray!0 k0!2102))))

(declare-fun b!735576 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41310 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!735576 (= e!411517 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) (Found!7366 j!159)))))

(declare-fun b!735577 () Bool)

(declare-datatypes ((Unit!25040 0))(
  ( (Unit!25041) )
))
(declare-fun e!411510 () Unit!25040)

(declare-fun Unit!25042 () Unit!25040)

(assert (=> b!735577 (= e!411510 Unit!25042)))

(declare-fun lt!325998 () (_ BitVec 32))

(assert (=> b!735577 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325998 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326009)))

(declare-fun lt!326002 () SeekEntryResult!7366)

(declare-fun b!735578 () Bool)

(declare-fun e!411519 () Bool)

(assert (=> b!735578 (= e!411519 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325998 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326002)))))

(declare-fun b!735579 () Bool)

(assert (=> b!735579 (= e!411514 e!411518)))

(declare-fun res!494358 () Bool)

(assert (=> b!735579 (=> (not res!494358) (not e!411518))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735579 (= res!494358 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19769 a!3186) j!159) mask!3328) (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326009))))

(assert (=> b!735579 (= lt!326009 (Intermediate!7366 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735580 () Bool)

(declare-fun res!494369 () Bool)

(assert (=> b!735580 (=> (not res!494369) (not e!411514))))

(declare-datatypes ((List!13810 0))(
  ( (Nil!13807) (Cons!13806 (h!14878 (_ BitVec 64)) (t!20116 List!13810)) )
))
(declare-fun arrayNoDuplicates!0 (array!41310 (_ BitVec 32) List!13810) Bool)

(assert (=> b!735580 (= res!494369 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13807))))

(declare-fun lt!326001 () SeekEntryResult!7366)

(declare-fun b!735581 () Bool)

(declare-fun e!411516 () Bool)

(assert (=> b!735581 (= e!411516 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326001))))

(declare-fun b!735582 () Bool)

(declare-fun e!411515 () Bool)

(declare-fun e!411520 () Bool)

(assert (=> b!735582 (= e!411515 (not e!411520))))

(declare-fun res!494367 () Bool)

(assert (=> b!735582 (=> res!494367 e!411520)))

(declare-fun lt!325999 () SeekEntryResult!7366)

(get-info :version)

(assert (=> b!735582 (= res!494367 (or (not ((_ is Intermediate!7366) lt!325999)) (bvsge x!1131 (x!62847 lt!325999))))))

(assert (=> b!735582 (= lt!326002 (Found!7366 j!159))))

(declare-fun e!411509 () Bool)

(assert (=> b!735582 e!411509))

(declare-fun res!494364 () Bool)

(assert (=> b!735582 (=> (not res!494364) (not e!411509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41310 (_ BitVec 32)) Bool)

(assert (=> b!735582 (= res!494364 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326004 () Unit!25040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25040)

(assert (=> b!735582 (= lt!326004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735583 () Bool)

(declare-fun e!411511 () Bool)

(assert (=> b!735583 (= e!411520 e!411511)))

(declare-fun res!494370 () Bool)

(assert (=> b!735583 (=> res!494370 e!411511)))

(assert (=> b!735583 (= res!494370 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325998 #b00000000000000000000000000000000) (bvsge lt!325998 (size!20190 a!3186))))))

(declare-fun lt!325997 () Unit!25040)

(assert (=> b!735583 (= lt!325997 e!411510)))

(declare-fun c!80989 () Bool)

(declare-fun lt!326000 () Bool)

(assert (=> b!735583 (= c!80989 lt!326000)))

(assert (=> b!735583 (= lt!326000 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735583 (= lt!325998 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735584 () Bool)

(declare-fun res!494356 () Bool)

(assert (=> b!735584 (=> (not res!494356) (not e!411513))))

(declare-fun arrayContainsKey!0 (array!41310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735584 (= res!494356 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735585 () Bool)

(assert (=> b!735585 (= e!411511 true)))

(declare-fun lt!325996 () SeekEntryResult!7366)

(declare-fun lt!326007 () array!41310)

(declare-fun lt!326003 () (_ BitVec 64))

(assert (=> b!735585 (= lt!325996 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325998 lt!326003 lt!326007 mask!3328))))

(declare-fun b!735586 () Bool)

(declare-fun Unit!25043 () Unit!25040)

(assert (=> b!735586 (= e!411510 Unit!25043)))

(declare-fun lt!326006 () SeekEntryResult!7366)

(assert (=> b!735586 (= lt!326006 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735586 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325998 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326002)))

(declare-fun b!735587 () Bool)

(assert (=> b!735587 (= e!411519 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325998 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326009)))))

(declare-fun b!735588 () Bool)

(assert (=> b!735588 (= e!411513 e!411514)))

(declare-fun res!494360 () Bool)

(assert (=> b!735588 (=> (not res!494360) (not e!411514))))

(declare-fun lt!326008 () SeekEntryResult!7366)

(assert (=> b!735588 (= res!494360 (or (= lt!326008 (MissingZero!7366 i!1173)) (= lt!326008 (MissingVacant!7366 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41310 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!735588 (= lt!326008 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735589 () Bool)

(assert (=> b!735589 (= e!411518 e!411515)))

(declare-fun res!494365 () Bool)

(assert (=> b!735589 (=> (not res!494365) (not e!411515))))

(declare-fun lt!326005 () SeekEntryResult!7366)

(assert (=> b!735589 (= res!494365 (= lt!326005 lt!325999))))

(assert (=> b!735589 (= lt!325999 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326003 lt!326007 mask!3328))))

(assert (=> b!735589 (= lt!326005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326003 mask!3328) lt!326003 lt!326007 mask!3328))))

(assert (=> b!735589 (= lt!326003 (select (store (arr!19769 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735589 (= lt!326007 (array!41311 (store (arr!19769 a!3186) i!1173 k0!2102) (size!20190 a!3186)))))

(declare-fun b!735590 () Bool)

(declare-fun res!494355 () Bool)

(assert (=> b!735590 (=> (not res!494355) (not e!411514))))

(assert (=> b!735590 (= res!494355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735591 () Bool)

(assert (=> b!735591 (= e!411509 e!411516)))

(declare-fun res!494368 () Bool)

(assert (=> b!735591 (=> (not res!494368) (not e!411516))))

(assert (=> b!735591 (= res!494368 (= (seekEntryOrOpen!0 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326001))))

(assert (=> b!735591 (= lt!326001 (Found!7366 j!159))))

(declare-fun b!735592 () Bool)

(declare-fun res!494359 () Bool)

(assert (=> b!735592 (=> res!494359 e!411511)))

(assert (=> b!735592 (= res!494359 e!411519)))

(declare-fun c!80990 () Bool)

(assert (=> b!735592 (= c!80990 lt!326000)))

(declare-fun b!735593 () Bool)

(declare-fun res!494366 () Bool)

(assert (=> b!735593 (=> (not res!494366) (not e!411513))))

(assert (=> b!735593 (= res!494366 (validKeyInArray!0 (select (arr!19769 a!3186) j!159)))))

(assert (= (and start!65120 res!494353) b!735570))

(assert (= (and b!735570 res!494354) b!735593))

(assert (= (and b!735593 res!494366) b!735575))

(assert (= (and b!735575 res!494361) b!735584))

(assert (= (and b!735584 res!494356) b!735588))

(assert (= (and b!735588 res!494360) b!735590))

(assert (= (and b!735590 res!494355) b!735580))

(assert (= (and b!735580 res!494369) b!735571))

(assert (= (and b!735571 res!494362) b!735579))

(assert (= (and b!735579 res!494358) b!735572))

(assert (= (and b!735572 res!494363) b!735574))

(assert (= (and b!735574 c!80991) b!735573))

(assert (= (and b!735574 (not c!80991)) b!735576))

(assert (= (and b!735574 res!494357) b!735589))

(assert (= (and b!735589 res!494365) b!735582))

(assert (= (and b!735582 res!494364) b!735591))

(assert (= (and b!735591 res!494368) b!735581))

(assert (= (and b!735582 (not res!494367)) b!735583))

(assert (= (and b!735583 c!80989) b!735577))

(assert (= (and b!735583 (not c!80989)) b!735586))

(assert (= (and b!735583 (not res!494370)) b!735592))

(assert (= (and b!735592 c!80990) b!735587))

(assert (= (and b!735592 (not c!80990)) b!735578))

(assert (= (and b!735592 (not res!494359)) b!735585))

(declare-fun m!687347 () Bool)

(assert (=> b!735575 m!687347))

(declare-fun m!687349 () Bool)

(assert (=> b!735576 m!687349))

(assert (=> b!735576 m!687349))

(declare-fun m!687351 () Bool)

(assert (=> b!735576 m!687351))

(assert (=> b!735591 m!687349))

(assert (=> b!735591 m!687349))

(declare-fun m!687353 () Bool)

(assert (=> b!735591 m!687353))

(declare-fun m!687355 () Bool)

(assert (=> b!735585 m!687355))

(assert (=> b!735573 m!687349))

(assert (=> b!735573 m!687349))

(declare-fun m!687357 () Bool)

(assert (=> b!735573 m!687357))

(declare-fun m!687359 () Bool)

(assert (=> b!735590 m!687359))

(declare-fun m!687361 () Bool)

(assert (=> b!735588 m!687361))

(assert (=> b!735581 m!687349))

(assert (=> b!735581 m!687349))

(declare-fun m!687363 () Bool)

(assert (=> b!735581 m!687363))

(declare-fun m!687365 () Bool)

(assert (=> b!735582 m!687365))

(declare-fun m!687367 () Bool)

(assert (=> b!735582 m!687367))

(assert (=> b!735578 m!687349))

(assert (=> b!735578 m!687349))

(declare-fun m!687369 () Bool)

(assert (=> b!735578 m!687369))

(declare-fun m!687371 () Bool)

(assert (=> b!735580 m!687371))

(assert (=> b!735579 m!687349))

(assert (=> b!735579 m!687349))

(declare-fun m!687373 () Bool)

(assert (=> b!735579 m!687373))

(assert (=> b!735579 m!687373))

(assert (=> b!735579 m!687349))

(declare-fun m!687375 () Bool)

(assert (=> b!735579 m!687375))

(assert (=> b!735586 m!687349))

(assert (=> b!735586 m!687349))

(assert (=> b!735586 m!687351))

(assert (=> b!735586 m!687349))

(assert (=> b!735586 m!687369))

(declare-fun m!687377 () Bool)

(assert (=> b!735584 m!687377))

(declare-fun m!687379 () Bool)

(assert (=> b!735583 m!687379))

(declare-fun m!687381 () Bool)

(assert (=> b!735572 m!687381))

(declare-fun m!687383 () Bool)

(assert (=> start!65120 m!687383))

(declare-fun m!687385 () Bool)

(assert (=> start!65120 m!687385))

(assert (=> b!735587 m!687349))

(assert (=> b!735587 m!687349))

(declare-fun m!687387 () Bool)

(assert (=> b!735587 m!687387))

(assert (=> b!735577 m!687349))

(assert (=> b!735577 m!687349))

(assert (=> b!735577 m!687387))

(declare-fun m!687389 () Bool)

(assert (=> b!735589 m!687389))

(declare-fun m!687391 () Bool)

(assert (=> b!735589 m!687391))

(declare-fun m!687393 () Bool)

(assert (=> b!735589 m!687393))

(declare-fun m!687395 () Bool)

(assert (=> b!735589 m!687395))

(declare-fun m!687397 () Bool)

(assert (=> b!735589 m!687397))

(assert (=> b!735589 m!687393))

(assert (=> b!735593 m!687349))

(assert (=> b!735593 m!687349))

(declare-fun m!687399 () Bool)

(assert (=> b!735593 m!687399))

(check-sat (not b!735587) (not b!735580) (not b!735581) (not start!65120) (not b!735582) (not b!735584) (not b!735590) (not b!735585) (not b!735578) (not b!735579) (not b!735583) (not b!735588) (not b!735586) (not b!735589) (not b!735576) (not b!735573) (not b!735575) (not b!735593) (not b!735577) (not b!735591))
(check-sat)
