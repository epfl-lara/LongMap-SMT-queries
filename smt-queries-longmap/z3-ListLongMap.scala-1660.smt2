; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30780 () Bool)

(assert start!30780)

(declare-fun b!308818 () Bool)

(declare-fun res!165579 () Bool)

(declare-fun e!192983 () Bool)

(assert (=> b!308818 (=> (not res!165579) (not e!192983))))

(declare-datatypes ((array!15737 0))(
  ( (array!15738 (arr!7452 (Array (_ BitVec 32) (_ BitVec 64))) (size!7805 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15737)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308818 (= res!165579 (and (= (size!7805 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7805 a!3293))))))

(declare-fun b!308819 () Bool)

(declare-fun res!165578 () Bool)

(assert (=> b!308819 (=> (not res!165578) (not e!192983))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308819 (= res!165578 (validKeyInArray!0 k0!2441))))

(declare-fun b!308820 () Bool)

(declare-fun res!165581 () Bool)

(assert (=> b!308820 (=> (not res!165581) (not e!192983))))

(declare-datatypes ((SeekEntryResult!2591 0))(
  ( (MissingZero!2591 (index!12540 (_ BitVec 32))) (Found!2591 (index!12541 (_ BitVec 32))) (Intermediate!2591 (undefined!3403 Bool) (index!12542 (_ BitVec 32)) (x!30790 (_ BitVec 32))) (Undefined!2591) (MissingVacant!2591 (index!12543 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15737 (_ BitVec 32)) SeekEntryResult!2591)

(assert (=> b!308820 (= res!165581 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2591 i!1240)))))

(declare-fun res!165582 () Bool)

(assert (=> start!30780 (=> (not res!165582) (not e!192983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30780 (= res!165582 (validMask!0 mask!3709))))

(assert (=> start!30780 e!192983))

(declare-fun array_inv!5424 (array!15737) Bool)

(assert (=> start!30780 (array_inv!5424 a!3293)))

(assert (=> start!30780 true))

(declare-fun b!308821 () Bool)

(declare-fun res!165580 () Bool)

(assert (=> b!308821 (=> (not res!165580) (not e!192983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15737 (_ BitVec 32)) Bool)

(assert (=> b!308821 (= res!165580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308822 () Bool)

(declare-fun e!192985 () Bool)

(assert (=> b!308822 (= e!192983 e!192985)))

(declare-fun res!165585 () Bool)

(assert (=> b!308822 (=> (not res!165585) (not e!192985))))

(declare-fun lt!151276 () SeekEntryResult!2591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15737 (_ BitVec 32)) SeekEntryResult!2591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308822 (= res!165585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151276))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308822 (= lt!151276 (Intermediate!2591 false resIndex!52 resX!52))))

(declare-fun b!308823 () Bool)

(declare-fun res!165583 () Bool)

(assert (=> b!308823 (=> (not res!165583) (not e!192985))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308823 (= res!165583 (and (= (select (arr!7452 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7805 a!3293))))))

(declare-fun b!308824 () Bool)

(declare-fun e!192984 () Bool)

(assert (=> b!308824 (= e!192984 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!151277 () SeekEntryResult!2591)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308824 (= lt!151277 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308825 () Bool)

(declare-fun res!165577 () Bool)

(assert (=> b!308825 (=> (not res!165577) (not e!192983))))

(declare-fun arrayContainsKey!0 (array!15737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308825 (= res!165577 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308826 () Bool)

(assert (=> b!308826 (= e!192985 e!192984)))

(declare-fun res!165584 () Bool)

(assert (=> b!308826 (=> (not res!165584) (not e!192984))))

(assert (=> b!308826 (= res!165584 (and (= lt!151277 lt!151276) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7452 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308826 (= lt!151277 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30780 res!165582) b!308818))

(assert (= (and b!308818 res!165579) b!308819))

(assert (= (and b!308819 res!165578) b!308825))

(assert (= (and b!308825 res!165577) b!308820))

(assert (= (and b!308820 res!165581) b!308821))

(assert (= (and b!308821 res!165580) b!308822))

(assert (= (and b!308822 res!165585) b!308823))

(assert (= (and b!308823 res!165583) b!308826))

(assert (= (and b!308826 res!165584) b!308824))

(declare-fun m!318379 () Bool)

(assert (=> b!308825 m!318379))

(declare-fun m!318381 () Bool)

(assert (=> b!308820 m!318381))

(declare-fun m!318383 () Bool)

(assert (=> b!308824 m!318383))

(assert (=> b!308824 m!318383))

(declare-fun m!318385 () Bool)

(assert (=> b!308824 m!318385))

(declare-fun m!318387 () Bool)

(assert (=> b!308826 m!318387))

(declare-fun m!318389 () Bool)

(assert (=> b!308826 m!318389))

(declare-fun m!318391 () Bool)

(assert (=> b!308822 m!318391))

(assert (=> b!308822 m!318391))

(declare-fun m!318393 () Bool)

(assert (=> b!308822 m!318393))

(declare-fun m!318395 () Bool)

(assert (=> b!308821 m!318395))

(declare-fun m!318397 () Bool)

(assert (=> start!30780 m!318397))

(declare-fun m!318399 () Bool)

(assert (=> start!30780 m!318399))

(declare-fun m!318401 () Bool)

(assert (=> b!308819 m!318401))

(declare-fun m!318403 () Bool)

(assert (=> b!308823 m!318403))

(check-sat (not b!308825) (not b!308824) (not start!30780) (not b!308826) (not b!308821) (not b!308822) (not b!308820) (not b!308819))
(check-sat)
