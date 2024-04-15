; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30510 () Bool)

(assert start!30510)

(declare-fun b!305128 () Bool)

(declare-fun res!162466 () Bool)

(declare-fun e!191629 () Bool)

(assert (=> b!305128 (=> (not res!162466) (not e!191629))))

(declare-datatypes ((array!15518 0))(
  ( (array!15519 (arr!7344 (Array (_ BitVec 32) (_ BitVec 64))) (size!7697 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15518)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305128 (= res!162466 (and (= (size!7697 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7697 a!3293))))))

(declare-fun res!162462 () Bool)

(assert (=> start!30510 (=> (not res!162462) (not e!191629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30510 (= res!162462 (validMask!0 mask!3709))))

(assert (=> start!30510 e!191629))

(declare-fun array_inv!5316 (array!15518) Bool)

(assert (=> start!30510 (array_inv!5316 a!3293)))

(assert (=> start!30510 true))

(declare-fun b!305129 () Bool)

(declare-fun e!191628 () Bool)

(assert (=> b!305129 (= e!191628 (not true))))

(declare-datatypes ((SeekEntryResult!2483 0))(
  ( (MissingZero!2483 (index!12108 (_ BitVec 32))) (Found!2483 (index!12109 (_ BitVec 32))) (Intermediate!2483 (undefined!3295 Bool) (index!12110 (_ BitVec 32)) (x!30385 (_ BitVec 32))) (Undefined!2483) (MissingVacant!2483 (index!12111 (_ BitVec 32))) )
))
(declare-fun lt!150505 () SeekEntryResult!2483)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15518 (_ BitVec 32)) SeekEntryResult!2483)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305129 (= lt!150505 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305130 () Bool)

(declare-fun res!162461 () Bool)

(assert (=> b!305130 (=> (not res!162461) (not e!191629))))

(declare-fun arrayContainsKey!0 (array!15518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305130 (= res!162461 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305131 () Bool)

(declare-fun res!162464 () Bool)

(assert (=> b!305131 (=> (not res!162464) (not e!191629))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15518 (_ BitVec 32)) SeekEntryResult!2483)

(assert (=> b!305131 (= res!162464 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2483 i!1240)))))

(declare-fun b!305132 () Bool)

(declare-fun res!162468 () Bool)

(assert (=> b!305132 (=> (not res!162468) (not e!191629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305132 (= res!162468 (validKeyInArray!0 k0!2441))))

(declare-fun b!305133 () Bool)

(declare-fun e!191630 () Bool)

(assert (=> b!305133 (= e!191630 e!191628)))

(declare-fun res!162463 () Bool)

(assert (=> b!305133 (=> (not res!162463) (not e!191628))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!150506 () SeekEntryResult!2483)

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305133 (= res!162463 (and (= lt!150505 lt!150506) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7344 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7344 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7344 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305133 (= lt!150505 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!305134 () Bool)

(assert (=> b!305134 (= e!191629 e!191630)))

(declare-fun res!162467 () Bool)

(assert (=> b!305134 (=> (not res!162467) (not e!191630))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305134 (= res!162467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150506))))

(assert (=> b!305134 (= lt!150506 (Intermediate!2483 false resIndex!52 resX!52))))

(declare-fun b!305135 () Bool)

(declare-fun res!162460 () Bool)

(assert (=> b!305135 (=> (not res!162460) (not e!191629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15518 (_ BitVec 32)) Bool)

(assert (=> b!305135 (= res!162460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305136 () Bool)

(declare-fun res!162465 () Bool)

(assert (=> b!305136 (=> (not res!162465) (not e!191630))))

(assert (=> b!305136 (= res!162465 (and (= (select (arr!7344 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7697 a!3293))))))

(assert (= (and start!30510 res!162462) b!305128))

(assert (= (and b!305128 res!162466) b!305132))

(assert (= (and b!305132 res!162468) b!305130))

(assert (= (and b!305130 res!162461) b!305131))

(assert (= (and b!305131 res!162464) b!305135))

(assert (= (and b!305135 res!162460) b!305134))

(assert (= (and b!305134 res!162467) b!305136))

(assert (= (and b!305136 res!162465) b!305133))

(assert (= (and b!305133 res!162463) b!305129))

(declare-fun m!315637 () Bool)

(assert (=> b!305136 m!315637))

(declare-fun m!315639 () Bool)

(assert (=> b!305130 m!315639))

(declare-fun m!315641 () Bool)

(assert (=> start!30510 m!315641))

(declare-fun m!315643 () Bool)

(assert (=> start!30510 m!315643))

(declare-fun m!315645 () Bool)

(assert (=> b!305133 m!315645))

(declare-fun m!315647 () Bool)

(assert (=> b!305133 m!315647))

(declare-fun m!315649 () Bool)

(assert (=> b!305132 m!315649))

(declare-fun m!315651 () Bool)

(assert (=> b!305135 m!315651))

(declare-fun m!315653 () Bool)

(assert (=> b!305131 m!315653))

(declare-fun m!315655 () Bool)

(assert (=> b!305129 m!315655))

(assert (=> b!305129 m!315655))

(declare-fun m!315657 () Bool)

(assert (=> b!305129 m!315657))

(declare-fun m!315659 () Bool)

(assert (=> b!305134 m!315659))

(assert (=> b!305134 m!315659))

(declare-fun m!315661 () Bool)

(assert (=> b!305134 m!315661))

(check-sat (not b!305133) (not start!30510) (not b!305132) (not b!305135) (not b!305134) (not b!305130) (not b!305129) (not b!305131))
(check-sat)
