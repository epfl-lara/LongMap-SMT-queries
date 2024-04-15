; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30654 () Bool)

(assert start!30654)

(declare-fun b!307587 () Bool)

(declare-fun res!164494 () Bool)

(declare-fun e!192464 () Bool)

(assert (=> b!307587 (=> (not res!164494) (not e!192464))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307587 (= res!164494 (validKeyInArray!0 k0!2441))))

(declare-fun b!307588 () Bool)

(declare-fun res!164492 () Bool)

(assert (=> b!307588 (=> (not res!164492) (not e!192464))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15662 0))(
  ( (array!15663 (arr!7416 (Array (_ BitVec 32) (_ BitVec 64))) (size!7769 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15662)

(assert (=> b!307588 (= res!164492 (and (= (size!7769 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7769 a!3293))))))

(declare-fun res!164489 () Bool)

(assert (=> start!30654 (=> (not res!164489) (not e!192464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30654 (= res!164489 (validMask!0 mask!3709))))

(assert (=> start!30654 e!192464))

(declare-fun array_inv!5388 (array!15662) Bool)

(assert (=> start!30654 (array_inv!5388 a!3293)))

(assert (=> start!30654 true))

(declare-fun b!307589 () Bool)

(declare-fun res!164496 () Bool)

(assert (=> b!307589 (=> (not res!164496) (not e!192464))))

(declare-fun arrayContainsKey!0 (array!15662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307589 (= res!164496 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307590 () Bool)

(declare-fun res!164491 () Bool)

(declare-fun e!192462 () Bool)

(assert (=> b!307590 (=> (not res!164491) (not e!192462))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307590 (= res!164491 (and (= (select (arr!7416 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7769 a!3293))))))

(declare-fun b!307591 () Bool)

(declare-fun res!164493 () Bool)

(assert (=> b!307591 (=> (not res!164493) (not e!192462))))

(declare-datatypes ((SeekEntryResult!2555 0))(
  ( (MissingZero!2555 (index!12396 (_ BitVec 32))) (Found!2555 (index!12397 (_ BitVec 32))) (Intermediate!2555 (undefined!3367 Bool) (index!12398 (_ BitVec 32)) (x!30649 (_ BitVec 32))) (Undefined!2555) (MissingVacant!2555 (index!12399 (_ BitVec 32))) )
))
(declare-fun lt!150956 () SeekEntryResult!2555)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15662 (_ BitVec 32)) SeekEntryResult!2555)

(assert (=> b!307591 (= res!164493 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150956))))

(declare-fun b!307592 () Bool)

(assert (=> b!307592 (= e!192462 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!150955 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307592 (= lt!150955 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307593 () Bool)

(declare-fun res!164487 () Bool)

(assert (=> b!307593 (=> (not res!164487) (not e!192464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15662 (_ BitVec 32)) Bool)

(assert (=> b!307593 (= res!164487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307594 () Bool)

(declare-fun res!164495 () Bool)

(assert (=> b!307594 (=> (not res!164495) (not e!192464))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15662 (_ BitVec 32)) SeekEntryResult!2555)

(assert (=> b!307594 (= res!164495 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2555 i!1240)))))

(declare-fun b!307595 () Bool)

(assert (=> b!307595 (= e!192464 e!192462)))

(declare-fun res!164488 () Bool)

(assert (=> b!307595 (=> (not res!164488) (not e!192462))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307595 (= res!164488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150956))))

(assert (=> b!307595 (= lt!150956 (Intermediate!2555 false resIndex!52 resX!52))))

(declare-fun b!307596 () Bool)

(declare-fun res!164490 () Bool)

(assert (=> b!307596 (=> (not res!164490) (not e!192462))))

(assert (=> b!307596 (= res!164490 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7416 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (= (and start!30654 res!164489) b!307588))

(assert (= (and b!307588 res!164492) b!307587))

(assert (= (and b!307587 res!164494) b!307589))

(assert (= (and b!307589 res!164496) b!307594))

(assert (= (and b!307594 res!164495) b!307593))

(assert (= (and b!307593 res!164487) b!307595))

(assert (= (and b!307595 res!164488) b!307590))

(assert (= (and b!307590 res!164491) b!307591))

(assert (= (and b!307591 res!164493) b!307596))

(assert (= (and b!307596 res!164490) b!307592))

(declare-fun m!317359 () Bool)

(assert (=> b!307596 m!317359))

(declare-fun m!317361 () Bool)

(assert (=> start!30654 m!317361))

(declare-fun m!317363 () Bool)

(assert (=> start!30654 m!317363))

(declare-fun m!317365 () Bool)

(assert (=> b!307592 m!317365))

(declare-fun m!317367 () Bool)

(assert (=> b!307590 m!317367))

(declare-fun m!317369 () Bool)

(assert (=> b!307595 m!317369))

(assert (=> b!307595 m!317369))

(declare-fun m!317371 () Bool)

(assert (=> b!307595 m!317371))

(declare-fun m!317373 () Bool)

(assert (=> b!307594 m!317373))

(declare-fun m!317375 () Bool)

(assert (=> b!307593 m!317375))

(declare-fun m!317377 () Bool)

(assert (=> b!307589 m!317377))

(declare-fun m!317379 () Bool)

(assert (=> b!307591 m!317379))

(declare-fun m!317381 () Bool)

(assert (=> b!307587 m!317381))

(check-sat (not b!307593) (not start!30654) (not b!307594) (not b!307592) (not b!307591) (not b!307589) (not b!307587) (not b!307595))
(check-sat)
