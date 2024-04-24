; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30750 () Bool)

(assert start!30750)

(declare-fun b!308635 () Bool)

(declare-fun res!165304 () Bool)

(declare-fun e!192948 () Bool)

(assert (=> b!308635 (=> (not res!165304) (not e!192948))))

(declare-datatypes ((array!15716 0))(
  ( (array!15717 (arr!7441 (Array (_ BitVec 32) (_ BitVec 64))) (size!7793 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15716)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308635 (= res!165304 (and (= (select (arr!7441 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7793 a!3293))))))

(declare-fun b!308636 () Bool)

(declare-fun e!192945 () Bool)

(assert (=> b!308636 (= e!192945 e!192948)))

(declare-fun res!165302 () Bool)

(assert (=> b!308636 (=> (not res!165302) (not e!192948))))

(declare-datatypes ((SeekEntryResult!2546 0))(
  ( (MissingZero!2546 (index!12360 (_ BitVec 32))) (Found!2546 (index!12361 (_ BitVec 32))) (Intermediate!2546 (undefined!3358 Bool) (index!12362 (_ BitVec 32)) (x!30707 (_ BitVec 32))) (Undefined!2546) (MissingVacant!2546 (index!12363 (_ BitVec 32))) )
))
(declare-fun lt!151439 () SeekEntryResult!2546)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15716 (_ BitVec 32)) SeekEntryResult!2546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308636 (= res!165302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151439))))

(assert (=> b!308636 (= lt!151439 (Intermediate!2546 false resIndex!52 resX!52))))

(declare-fun b!308637 () Bool)

(declare-fun e!192947 () Bool)

(assert (=> b!308637 (= e!192947 (not true))))

(declare-fun lt!151440 () SeekEntryResult!2546)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308637 (= lt!151440 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308638 () Bool)

(assert (=> b!308638 (= e!192948 e!192947)))

(declare-fun res!165299 () Bool)

(assert (=> b!308638 (=> (not res!165299) (not e!192947))))

(assert (=> b!308638 (= res!165299 (and (= lt!151440 lt!151439) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7441 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308638 (= lt!151440 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!165301 () Bool)

(assert (=> start!30750 (=> (not res!165301) (not e!192945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30750 (= res!165301 (validMask!0 mask!3709))))

(assert (=> start!30750 e!192945))

(declare-fun array_inv!5391 (array!15716) Bool)

(assert (=> start!30750 (array_inv!5391 a!3293)))

(assert (=> start!30750 true))

(declare-fun b!308639 () Bool)

(declare-fun res!165305 () Bool)

(assert (=> b!308639 (=> (not res!165305) (not e!192945))))

(assert (=> b!308639 (= res!165305 (and (= (size!7793 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7793 a!3293))))))

(declare-fun b!308640 () Bool)

(declare-fun res!165298 () Bool)

(assert (=> b!308640 (=> (not res!165298) (not e!192945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308640 (= res!165298 (validKeyInArray!0 k0!2441))))

(declare-fun b!308641 () Bool)

(declare-fun res!165300 () Bool)

(assert (=> b!308641 (=> (not res!165300) (not e!192945))))

(declare-fun arrayContainsKey!0 (array!15716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308641 (= res!165300 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308642 () Bool)

(declare-fun res!165306 () Bool)

(assert (=> b!308642 (=> (not res!165306) (not e!192945))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15716 (_ BitVec 32)) SeekEntryResult!2546)

(assert (=> b!308642 (= res!165306 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2546 i!1240)))))

(declare-fun b!308643 () Bool)

(declare-fun res!165303 () Bool)

(assert (=> b!308643 (=> (not res!165303) (not e!192945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15716 (_ BitVec 32)) Bool)

(assert (=> b!308643 (= res!165303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30750 res!165301) b!308639))

(assert (= (and b!308639 res!165305) b!308640))

(assert (= (and b!308640 res!165298) b!308641))

(assert (= (and b!308641 res!165300) b!308642))

(assert (= (and b!308642 res!165306) b!308643))

(assert (= (and b!308643 res!165303) b!308636))

(assert (= (and b!308636 res!165302) b!308635))

(assert (= (and b!308635 res!165304) b!308638))

(assert (= (and b!308638 res!165299) b!308637))

(declare-fun m!318847 () Bool)

(assert (=> b!308636 m!318847))

(assert (=> b!308636 m!318847))

(declare-fun m!318849 () Bool)

(assert (=> b!308636 m!318849))

(declare-fun m!318851 () Bool)

(assert (=> start!30750 m!318851))

(declare-fun m!318853 () Bool)

(assert (=> start!30750 m!318853))

(declare-fun m!318855 () Bool)

(assert (=> b!308641 m!318855))

(declare-fun m!318857 () Bool)

(assert (=> b!308635 m!318857))

(declare-fun m!318859 () Bool)

(assert (=> b!308638 m!318859))

(declare-fun m!318861 () Bool)

(assert (=> b!308638 m!318861))

(declare-fun m!318863 () Bool)

(assert (=> b!308643 m!318863))

(declare-fun m!318865 () Bool)

(assert (=> b!308642 m!318865))

(declare-fun m!318867 () Bool)

(assert (=> b!308637 m!318867))

(assert (=> b!308637 m!318867))

(declare-fun m!318869 () Bool)

(assert (=> b!308637 m!318869))

(declare-fun m!318871 () Bool)

(assert (=> b!308640 m!318871))

(check-sat (not b!308636) (not b!308640) (not b!308643) (not b!308641) (not start!30750) (not b!308642) (not b!308638) (not b!308637))
(check-sat)
