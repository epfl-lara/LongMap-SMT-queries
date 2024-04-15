; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30918 () Bool)

(assert start!30918)

(declare-fun b!310242 () Bool)

(declare-fun res!166851 () Bool)

(declare-fun e!193684 () Bool)

(assert (=> b!310242 (=> (not res!166851) (not e!193684))))

(declare-datatypes ((array!15824 0))(
  ( (array!15825 (arr!7494 (Array (_ BitVec 32) (_ BitVec 64))) (size!7847 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15824)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310242 (= res!166851 (and (= (select (arr!7494 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7847 a!3293))))))

(declare-fun e!193685 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!151754 () (_ BitVec 32))

(declare-fun b!310244 () Bool)

(declare-fun lt!151753 () array!15824)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2633 0))(
  ( (MissingZero!2633 (index!12708 (_ BitVec 32))) (Found!2633 (index!12709 (_ BitVec 32))) (Intermediate!2633 (undefined!3445 Bool) (index!12710 (_ BitVec 32)) (x!30953 (_ BitVec 32))) (Undefined!2633) (MissingVacant!2633 (index!12711 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15824 (_ BitVec 32)) SeekEntryResult!2633)

(assert (=> b!310244 (= e!193685 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151753 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151754 k0!2441 lt!151753 mask!3709)))))

(assert (=> b!310244 (= lt!151753 (array!15825 (store (arr!7494 a!3293) i!1240 k0!2441) (size!7847 a!3293)))))

(declare-fun b!310245 () Bool)

(declare-fun res!166842 () Bool)

(declare-fun e!193683 () Bool)

(assert (=> b!310245 (=> (not res!166842) (not e!193683))))

(assert (=> b!310245 (= res!166842 (and (= (size!7847 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7847 a!3293))))))

(declare-fun b!310246 () Bool)

(declare-fun e!193682 () Bool)

(assert (=> b!310246 (= e!193682 (not true))))

(assert (=> b!310246 e!193685))

(declare-fun res!166843 () Bool)

(assert (=> b!310246 (=> (not res!166843) (not e!193685))))

(declare-fun lt!151751 () SeekEntryResult!2633)

(assert (=> b!310246 (= res!166843 (= lt!151751 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151754 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310246 (= lt!151754 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310247 () Bool)

(assert (=> b!310247 (= e!193684 e!193682)))

(declare-fun res!166849 () Bool)

(assert (=> b!310247 (=> (not res!166849) (not e!193682))))

(declare-fun lt!151752 () SeekEntryResult!2633)

(assert (=> b!310247 (= res!166849 (and (= lt!151751 lt!151752) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7494 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310247 (= lt!151751 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310248 () Bool)

(declare-fun res!166848 () Bool)

(assert (=> b!310248 (=> (not res!166848) (not e!193683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15824 (_ BitVec 32)) Bool)

(assert (=> b!310248 (= res!166848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310249 () Bool)

(declare-fun res!166846 () Bool)

(assert (=> b!310249 (=> (not res!166846) (not e!193683))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15824 (_ BitVec 32)) SeekEntryResult!2633)

(assert (=> b!310249 (= res!166846 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2633 i!1240)))))

(declare-fun b!310243 () Bool)

(declare-fun res!166845 () Bool)

(assert (=> b!310243 (=> (not res!166845) (not e!193683))))

(declare-fun arrayContainsKey!0 (array!15824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310243 (= res!166845 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166850 () Bool)

(assert (=> start!30918 (=> (not res!166850) (not e!193683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30918 (= res!166850 (validMask!0 mask!3709))))

(assert (=> start!30918 e!193683))

(declare-fun array_inv!5466 (array!15824) Bool)

(assert (=> start!30918 (array_inv!5466 a!3293)))

(assert (=> start!30918 true))

(declare-fun b!310250 () Bool)

(declare-fun res!166847 () Bool)

(assert (=> b!310250 (=> (not res!166847) (not e!193683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310250 (= res!166847 (validKeyInArray!0 k0!2441))))

(declare-fun b!310251 () Bool)

(assert (=> b!310251 (= e!193683 e!193684)))

(declare-fun res!166844 () Bool)

(assert (=> b!310251 (=> (not res!166844) (not e!193684))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310251 (= res!166844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151752))))

(assert (=> b!310251 (= lt!151752 (Intermediate!2633 false resIndex!52 resX!52))))

(assert (= (and start!30918 res!166850) b!310245))

(assert (= (and b!310245 res!166842) b!310250))

(assert (= (and b!310250 res!166847) b!310243))

(assert (= (and b!310243 res!166845) b!310249))

(assert (= (and b!310249 res!166846) b!310248))

(assert (= (and b!310248 res!166848) b!310251))

(assert (= (and b!310251 res!166844) b!310242))

(assert (= (and b!310242 res!166851) b!310247))

(assert (= (and b!310247 res!166849) b!310246))

(assert (= (and b!310246 res!166843) b!310244))

(declare-fun m!319699 () Bool)

(assert (=> b!310250 m!319699))

(declare-fun m!319701 () Bool)

(assert (=> start!30918 m!319701))

(declare-fun m!319703 () Bool)

(assert (=> start!30918 m!319703))

(declare-fun m!319705 () Bool)

(assert (=> b!310244 m!319705))

(declare-fun m!319707 () Bool)

(assert (=> b!310244 m!319707))

(declare-fun m!319709 () Bool)

(assert (=> b!310244 m!319709))

(declare-fun m!319711 () Bool)

(assert (=> b!310242 m!319711))

(declare-fun m!319713 () Bool)

(assert (=> b!310249 m!319713))

(declare-fun m!319715 () Bool)

(assert (=> b!310251 m!319715))

(assert (=> b!310251 m!319715))

(declare-fun m!319717 () Bool)

(assert (=> b!310251 m!319717))

(declare-fun m!319719 () Bool)

(assert (=> b!310248 m!319719))

(declare-fun m!319721 () Bool)

(assert (=> b!310243 m!319721))

(declare-fun m!319723 () Bool)

(assert (=> b!310247 m!319723))

(declare-fun m!319725 () Bool)

(assert (=> b!310247 m!319725))

(declare-fun m!319727 () Bool)

(assert (=> b!310246 m!319727))

(declare-fun m!319729 () Bool)

(assert (=> b!310246 m!319729))

(check-sat (not start!30918) (not b!310246) (not b!310250) (not b!310248) (not b!310243) (not b!310251) (not b!310249) (not b!310247) (not b!310244))
(check-sat)
