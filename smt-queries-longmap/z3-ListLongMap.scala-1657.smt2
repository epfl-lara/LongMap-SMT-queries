; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30778 () Bool)

(assert start!30778)

(declare-fun b!308877 () Bool)

(declare-fun res!165490 () Bool)

(declare-fun e!193063 () Bool)

(assert (=> b!308877 (=> (not res!165490) (not e!193063))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308877 (= res!165490 (validKeyInArray!0 k0!2441))))

(declare-fun b!308878 () Bool)

(declare-fun res!165494 () Bool)

(assert (=> b!308878 (=> (not res!165494) (not e!193063))))

(declare-datatypes ((array!15731 0))(
  ( (array!15732 (arr!7449 (Array (_ BitVec 32) (_ BitVec 64))) (size!7801 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15731)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308878 (= res!165494 (and (= (size!7801 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7801 a!3293))))))

(declare-fun b!308879 () Bool)

(declare-fun e!193064 () Bool)

(declare-fun e!193065 () Bool)

(assert (=> b!308879 (= e!193064 e!193065)))

(declare-fun res!165492 () Bool)

(assert (=> b!308879 (=> (not res!165492) (not e!193065))))

(declare-datatypes ((SeekEntryResult!2589 0))(
  ( (MissingZero!2589 (index!12532 (_ BitVec 32))) (Found!2589 (index!12533 (_ BitVec 32))) (Intermediate!2589 (undefined!3401 Bool) (index!12534 (_ BitVec 32)) (x!30769 (_ BitVec 32))) (Undefined!2589) (MissingVacant!2589 (index!12535 (_ BitVec 32))) )
))
(declare-fun lt!151463 () SeekEntryResult!2589)

(declare-fun lt!151464 () SeekEntryResult!2589)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308879 (= res!165492 (and (= lt!151464 lt!151463) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7449 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15731 (_ BitVec 32)) SeekEntryResult!2589)

(assert (=> b!308879 (= lt!151464 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308880 () Bool)

(assert (=> b!308880 (= e!193065 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308880 (= lt!151464 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308881 () Bool)

(assert (=> b!308881 (= e!193063 e!193064)))

(declare-fun res!165496 () Bool)

(assert (=> b!308881 (=> (not res!165496) (not e!193064))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308881 (= res!165496 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151463))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308881 (= lt!151463 (Intermediate!2589 false resIndex!52 resX!52))))

(declare-fun b!308882 () Bool)

(declare-fun res!165497 () Bool)

(assert (=> b!308882 (=> (not res!165497) (not e!193063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15731 (_ BitVec 32)) Bool)

(assert (=> b!308882 (= res!165497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308883 () Bool)

(declare-fun res!165491 () Bool)

(assert (=> b!308883 (=> (not res!165491) (not e!193064))))

(assert (=> b!308883 (= res!165491 (and (= (select (arr!7449 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7801 a!3293))))))

(declare-fun res!165493 () Bool)

(assert (=> start!30778 (=> (not res!165493) (not e!193063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30778 (= res!165493 (validMask!0 mask!3709))))

(assert (=> start!30778 e!193063))

(declare-fun array_inv!5412 (array!15731) Bool)

(assert (=> start!30778 (array_inv!5412 a!3293)))

(assert (=> start!30778 true))

(declare-fun b!308884 () Bool)

(declare-fun res!165495 () Bool)

(assert (=> b!308884 (=> (not res!165495) (not e!193063))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15731 (_ BitVec 32)) SeekEntryResult!2589)

(assert (=> b!308884 (= res!165495 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2589 i!1240)))))

(declare-fun b!308885 () Bool)

(declare-fun res!165498 () Bool)

(assert (=> b!308885 (=> (not res!165498) (not e!193063))))

(declare-fun arrayContainsKey!0 (array!15731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308885 (= res!165498 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30778 res!165493) b!308878))

(assert (= (and b!308878 res!165494) b!308877))

(assert (= (and b!308877 res!165490) b!308885))

(assert (= (and b!308885 res!165498) b!308884))

(assert (= (and b!308884 res!165495) b!308882))

(assert (= (and b!308882 res!165497) b!308881))

(assert (= (and b!308881 res!165496) b!308883))

(assert (= (and b!308883 res!165491) b!308879))

(assert (= (and b!308879 res!165492) b!308880))

(declare-fun m!318901 () Bool)

(assert (=> b!308882 m!318901))

(declare-fun m!318903 () Bool)

(assert (=> b!308880 m!318903))

(assert (=> b!308880 m!318903))

(declare-fun m!318905 () Bool)

(assert (=> b!308880 m!318905))

(declare-fun m!318907 () Bool)

(assert (=> b!308877 m!318907))

(declare-fun m!318909 () Bool)

(assert (=> b!308885 m!318909))

(declare-fun m!318911 () Bool)

(assert (=> b!308881 m!318911))

(assert (=> b!308881 m!318911))

(declare-fun m!318913 () Bool)

(assert (=> b!308881 m!318913))

(declare-fun m!318915 () Bool)

(assert (=> start!30778 m!318915))

(declare-fun m!318917 () Bool)

(assert (=> start!30778 m!318917))

(declare-fun m!318919 () Bool)

(assert (=> b!308884 m!318919))

(declare-fun m!318921 () Bool)

(assert (=> b!308883 m!318921))

(declare-fun m!318923 () Bool)

(assert (=> b!308879 m!318923))

(declare-fun m!318925 () Bool)

(assert (=> b!308879 m!318925))

(check-sat (not b!308880) (not b!308877) (not start!30778) (not b!308884) (not b!308885) (not b!308879) (not b!308882) (not b!308881))
(check-sat)
