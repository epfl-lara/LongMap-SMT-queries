; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30996 () Bool)

(assert start!30996)

(declare-fun b!311634 () Bool)

(declare-fun res!168143 () Bool)

(declare-fun e!194409 () Bool)

(assert (=> b!311634 (=> (not res!168143) (not e!194409))))

(declare-datatypes ((array!15911 0))(
  ( (array!15912 (arr!7537 (Array (_ BitVec 32) (_ BitVec 64))) (size!7889 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15911)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15911 (_ BitVec 32)) Bool)

(assert (=> b!311634 (= res!168143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!152473 () array!15911)

(declare-fun lt!152472 () (_ BitVec 32))

(declare-fun e!194408 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun b!311635 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2642 0))(
  ( (MissingZero!2642 (index!12744 (_ BitVec 32))) (Found!2642 (index!12745 (_ BitVec 32))) (Intermediate!2642 (undefined!3454 Bool) (index!12746 (_ BitVec 32)) (x!31068 (_ BitVec 32))) (Undefined!2642) (MissingVacant!2642 (index!12747 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15911 (_ BitVec 32)) SeekEntryResult!2642)

(assert (=> b!311635 (= e!194408 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152473 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152472 k0!2441 lt!152473 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311635 (= lt!152473 (array!15912 (store (arr!7537 a!3293) i!1240 k0!2441) (size!7889 a!3293)))))

(declare-fun b!311636 () Bool)

(declare-fun e!194412 () Bool)

(assert (=> b!311636 (= e!194409 e!194412)))

(declare-fun res!168144 () Bool)

(assert (=> b!311636 (=> (not res!168144) (not e!194412))))

(declare-fun lt!152475 () SeekEntryResult!2642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311636 (= res!168144 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152475))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311636 (= lt!152475 (Intermediate!2642 false resIndex!52 resX!52))))

(declare-fun b!311637 () Bool)

(declare-fun e!194410 () Bool)

(assert (=> b!311637 (= e!194410 (not true))))

(assert (=> b!311637 e!194408))

(declare-fun res!168147 () Bool)

(assert (=> b!311637 (=> (not res!168147) (not e!194408))))

(declare-fun lt!152474 () SeekEntryResult!2642)

(assert (=> b!311637 (= res!168147 (= lt!152474 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152472 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311637 (= lt!152472 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311639 () Bool)

(declare-fun res!168146 () Bool)

(assert (=> b!311639 (=> (not res!168146) (not e!194409))))

(assert (=> b!311639 (= res!168146 (and (= (size!7889 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7889 a!3293))))))

(declare-fun b!311640 () Bool)

(declare-fun res!168140 () Bool)

(assert (=> b!311640 (=> (not res!168140) (not e!194409))))

(declare-fun arrayContainsKey!0 (array!15911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311640 (= res!168140 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311641 () Bool)

(assert (=> b!311641 (= e!194412 e!194410)))

(declare-fun res!168138 () Bool)

(assert (=> b!311641 (=> (not res!168138) (not e!194410))))

(assert (=> b!311641 (= res!168138 (and (= lt!152474 lt!152475) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7537 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311641 (= lt!152474 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311642 () Bool)

(declare-fun res!168141 () Bool)

(assert (=> b!311642 (=> (not res!168141) (not e!194409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311642 (= res!168141 (validKeyInArray!0 k0!2441))))

(declare-fun b!311643 () Bool)

(declare-fun res!168139 () Bool)

(assert (=> b!311643 (=> (not res!168139) (not e!194412))))

(assert (=> b!311643 (= res!168139 (and (= (select (arr!7537 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7889 a!3293))))))

(declare-fun b!311638 () Bool)

(declare-fun res!168145 () Bool)

(assert (=> b!311638 (=> (not res!168145) (not e!194409))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15911 (_ BitVec 32)) SeekEntryResult!2642)

(assert (=> b!311638 (= res!168145 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2642 i!1240)))))

(declare-fun res!168142 () Bool)

(assert (=> start!30996 (=> (not res!168142) (not e!194409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30996 (= res!168142 (validMask!0 mask!3709))))

(assert (=> start!30996 e!194409))

(declare-fun array_inv!5487 (array!15911) Bool)

(assert (=> start!30996 (array_inv!5487 a!3293)))

(assert (=> start!30996 true))

(assert (= (and start!30996 res!168142) b!311639))

(assert (= (and b!311639 res!168146) b!311642))

(assert (= (and b!311642 res!168141) b!311640))

(assert (= (and b!311640 res!168140) b!311638))

(assert (= (and b!311638 res!168145) b!311634))

(assert (= (and b!311634 res!168143) b!311636))

(assert (= (and b!311636 res!168144) b!311643))

(assert (= (and b!311643 res!168139) b!311641))

(assert (= (and b!311641 res!168138) b!311637))

(assert (= (and b!311637 res!168147) b!311635))

(declare-fun m!321811 () Bool)

(assert (=> b!311642 m!321811))

(declare-fun m!321813 () Bool)

(assert (=> b!311637 m!321813))

(declare-fun m!321815 () Bool)

(assert (=> b!311637 m!321815))

(declare-fun m!321817 () Bool)

(assert (=> start!30996 m!321817))

(declare-fun m!321819 () Bool)

(assert (=> start!30996 m!321819))

(declare-fun m!321821 () Bool)

(assert (=> b!311640 m!321821))

(declare-fun m!321823 () Bool)

(assert (=> b!311641 m!321823))

(declare-fun m!321825 () Bool)

(assert (=> b!311641 m!321825))

(declare-fun m!321827 () Bool)

(assert (=> b!311643 m!321827))

(declare-fun m!321829 () Bool)

(assert (=> b!311636 m!321829))

(assert (=> b!311636 m!321829))

(declare-fun m!321831 () Bool)

(assert (=> b!311636 m!321831))

(declare-fun m!321833 () Bool)

(assert (=> b!311634 m!321833))

(declare-fun m!321835 () Bool)

(assert (=> b!311635 m!321835))

(declare-fun m!321837 () Bool)

(assert (=> b!311635 m!321837))

(declare-fun m!321839 () Bool)

(assert (=> b!311635 m!321839))

(declare-fun m!321841 () Bool)

(assert (=> b!311638 m!321841))

(check-sat (not start!30996) (not b!311640) (not b!311636) (not b!311637) (not b!311635) (not b!311638) (not b!311642) (not b!311641) (not b!311634))
(check-sat)
