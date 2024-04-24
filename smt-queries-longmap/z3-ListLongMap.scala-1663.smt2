; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30798 () Bool)

(assert start!30798)

(declare-fun b!309283 () Bool)

(declare-fun e!193236 () Bool)

(assert (=> b!309283 (= e!193236 (not true))))

(declare-datatypes ((array!15764 0))(
  ( (array!15765 (arr!7465 (Array (_ BitVec 32) (_ BitVec 64))) (size!7817 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15764)

(declare-datatypes ((SeekEntryResult!2570 0))(
  ( (MissingZero!2570 (index!12456 (_ BitVec 32))) (Found!2570 (index!12457 (_ BitVec 32))) (Intermediate!2570 (undefined!3382 Bool) (index!12458 (_ BitVec 32)) (x!30795 (_ BitVec 32))) (Undefined!2570) (MissingVacant!2570 (index!12459 (_ BitVec 32))) )
))
(declare-fun lt!151584 () SeekEntryResult!2570)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15764 (_ BitVec 32)) SeekEntryResult!2570)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309283 (= lt!151584 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309284 () Bool)

(declare-fun e!193235 () Bool)

(declare-fun e!193234 () Bool)

(assert (=> b!309284 (= e!193235 e!193234)))

(declare-fun res!165951 () Bool)

(assert (=> b!309284 (=> (not res!165951) (not e!193234))))

(declare-fun lt!151583 () SeekEntryResult!2570)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309284 (= res!165951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151583))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309284 (= lt!151583 (Intermediate!2570 false resIndex!52 resX!52))))

(declare-fun b!309285 () Bool)

(declare-fun res!165952 () Bool)

(assert (=> b!309285 (=> (not res!165952) (not e!193235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15764 (_ BitVec 32)) Bool)

(assert (=> b!309285 (= res!165952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!165948 () Bool)

(assert (=> start!30798 (=> (not res!165948) (not e!193235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30798 (= res!165948 (validMask!0 mask!3709))))

(assert (=> start!30798 e!193235))

(declare-fun array_inv!5415 (array!15764) Bool)

(assert (=> start!30798 (array_inv!5415 a!3293)))

(assert (=> start!30798 true))

(declare-fun b!309286 () Bool)

(declare-fun res!165949 () Bool)

(assert (=> b!309286 (=> (not res!165949) (not e!193235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309286 (= res!165949 (validKeyInArray!0 k0!2441))))

(declare-fun b!309287 () Bool)

(declare-fun res!165950 () Bool)

(assert (=> b!309287 (=> (not res!165950) (not e!193235))))

(declare-fun arrayContainsKey!0 (array!15764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309287 (= res!165950 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309288 () Bool)

(declare-fun res!165954 () Bool)

(assert (=> b!309288 (=> (not res!165954) (not e!193234))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309288 (= res!165954 (and (= (select (arr!7465 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7817 a!3293))))))

(declare-fun b!309289 () Bool)

(declare-fun res!165946 () Bool)

(assert (=> b!309289 (=> (not res!165946) (not e!193235))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15764 (_ BitVec 32)) SeekEntryResult!2570)

(assert (=> b!309289 (= res!165946 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2570 i!1240)))))

(declare-fun b!309290 () Bool)

(declare-fun res!165953 () Bool)

(assert (=> b!309290 (=> (not res!165953) (not e!193235))))

(assert (=> b!309290 (= res!165953 (and (= (size!7817 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7817 a!3293))))))

(declare-fun b!309291 () Bool)

(assert (=> b!309291 (= e!193234 e!193236)))

(declare-fun res!165947 () Bool)

(assert (=> b!309291 (=> (not res!165947) (not e!193236))))

(assert (=> b!309291 (= res!165947 (and (= lt!151584 lt!151583) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7465 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309291 (= lt!151584 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30798 res!165948) b!309290))

(assert (= (and b!309290 res!165953) b!309286))

(assert (= (and b!309286 res!165949) b!309287))

(assert (= (and b!309287 res!165950) b!309289))

(assert (= (and b!309289 res!165946) b!309285))

(assert (= (and b!309285 res!165952) b!309284))

(assert (= (and b!309284 res!165951) b!309288))

(assert (= (and b!309288 res!165954) b!309291))

(assert (= (and b!309291 res!165947) b!309283))

(declare-fun m!319471 () Bool)

(assert (=> b!309288 m!319471))

(declare-fun m!319473 () Bool)

(assert (=> b!309291 m!319473))

(declare-fun m!319475 () Bool)

(assert (=> b!309291 m!319475))

(declare-fun m!319477 () Bool)

(assert (=> b!309286 m!319477))

(declare-fun m!319479 () Bool)

(assert (=> start!30798 m!319479))

(declare-fun m!319481 () Bool)

(assert (=> start!30798 m!319481))

(declare-fun m!319483 () Bool)

(assert (=> b!309283 m!319483))

(assert (=> b!309283 m!319483))

(declare-fun m!319485 () Bool)

(assert (=> b!309283 m!319485))

(declare-fun m!319487 () Bool)

(assert (=> b!309287 m!319487))

(declare-fun m!319489 () Bool)

(assert (=> b!309289 m!319489))

(declare-fun m!319491 () Bool)

(assert (=> b!309284 m!319491))

(assert (=> b!309284 m!319491))

(declare-fun m!319493 () Bool)

(assert (=> b!309284 m!319493))

(declare-fun m!319495 () Bool)

(assert (=> b!309285 m!319495))

(check-sat (not b!309287) (not start!30798) (not b!309286) (not b!309283) (not b!309285) (not b!309291) (not b!309289) (not b!309284))
(check-sat)
