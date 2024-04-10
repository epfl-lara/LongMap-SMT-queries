; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30442 () Bool)

(assert start!30442)

(declare-fun b!304782 () Bool)

(declare-fun e!191490 () Bool)

(declare-fun e!191489 () Bool)

(assert (=> b!304782 (= e!191490 e!191489)))

(declare-fun res!162135 () Bool)

(assert (=> b!304782 (=> (not res!162135) (not e!191489))))

(declare-datatypes ((array!15497 0))(
  ( (array!15498 (arr!7335 (Array (_ BitVec 32) (_ BitVec 64))) (size!7687 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15497)

(declare-datatypes ((SeekEntryResult!2475 0))(
  ( (MissingZero!2475 (index!12076 (_ BitVec 32))) (Found!2475 (index!12077 (_ BitVec 32))) (Intermediate!2475 (undefined!3287 Bool) (index!12078 (_ BitVec 32)) (x!30333 (_ BitVec 32))) (Undefined!2475) (MissingVacant!2475 (index!12079 (_ BitVec 32))) )
))
(declare-fun lt!150527 () SeekEntryResult!2475)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!150528 () SeekEntryResult!2475)

(assert (=> b!304782 (= res!162135 (and (= lt!150528 lt!150527) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7335 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7335 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7335 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15497 (_ BitVec 32)) SeekEntryResult!2475)

(assert (=> b!304782 (= lt!150528 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304783 () Bool)

(declare-fun res!162134 () Bool)

(declare-fun e!191488 () Bool)

(assert (=> b!304783 (=> (not res!162134) (not e!191488))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304783 (= res!162134 (and (= (size!7687 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7687 a!3293))))))

(declare-fun b!304784 () Bool)

(declare-fun res!162132 () Bool)

(assert (=> b!304784 (=> (not res!162132) (not e!191488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304784 (= res!162132 (validKeyInArray!0 k0!2441))))

(declare-fun b!304785 () Bool)

(assert (=> b!304785 (= e!191488 e!191490)))

(declare-fun res!162128 () Bool)

(assert (=> b!304785 (=> (not res!162128) (not e!191490))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304785 (= res!162128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150527))))

(assert (=> b!304785 (= lt!150527 (Intermediate!2475 false resIndex!52 resX!52))))

(declare-fun res!162131 () Bool)

(assert (=> start!30442 (=> (not res!162131) (not e!191488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30442 (= res!162131 (validMask!0 mask!3709))))

(assert (=> start!30442 e!191488))

(declare-fun array_inv!5298 (array!15497) Bool)

(assert (=> start!30442 (array_inv!5298 a!3293)))

(assert (=> start!30442 true))

(declare-fun b!304786 () Bool)

(declare-fun res!162127 () Bool)

(assert (=> b!304786 (=> (not res!162127) (not e!191488))))

(declare-fun arrayContainsKey!0 (array!15497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304786 (= res!162127 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304787 () Bool)

(declare-fun res!162133 () Bool)

(assert (=> b!304787 (=> (not res!162133) (not e!191490))))

(assert (=> b!304787 (= res!162133 (and (= (select (arr!7335 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7687 a!3293))))))

(declare-fun b!304788 () Bool)

(declare-fun res!162129 () Bool)

(assert (=> b!304788 (=> (not res!162129) (not e!191488))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15497 (_ BitVec 32)) SeekEntryResult!2475)

(assert (=> b!304788 (= res!162129 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2475 i!1240)))))

(declare-fun b!304789 () Bool)

(assert (=> b!304789 (= e!191489 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304789 (= lt!150528 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304790 () Bool)

(declare-fun res!162130 () Bool)

(assert (=> b!304790 (=> (not res!162130) (not e!191488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15497 (_ BitVec 32)) Bool)

(assert (=> b!304790 (= res!162130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30442 res!162131) b!304783))

(assert (= (and b!304783 res!162134) b!304784))

(assert (= (and b!304784 res!162132) b!304786))

(assert (= (and b!304786 res!162127) b!304788))

(assert (= (and b!304788 res!162129) b!304790))

(assert (= (and b!304790 res!162130) b!304785))

(assert (= (and b!304785 res!162128) b!304787))

(assert (= (and b!304787 res!162133) b!304782))

(assert (= (and b!304782 res!162135) b!304789))

(declare-fun m!315865 () Bool)

(assert (=> b!304782 m!315865))

(declare-fun m!315867 () Bool)

(assert (=> b!304782 m!315867))

(declare-fun m!315869 () Bool)

(assert (=> start!30442 m!315869))

(declare-fun m!315871 () Bool)

(assert (=> start!30442 m!315871))

(declare-fun m!315873 () Bool)

(assert (=> b!304788 m!315873))

(declare-fun m!315875 () Bool)

(assert (=> b!304785 m!315875))

(assert (=> b!304785 m!315875))

(declare-fun m!315877 () Bool)

(assert (=> b!304785 m!315877))

(declare-fun m!315879 () Bool)

(assert (=> b!304787 m!315879))

(declare-fun m!315881 () Bool)

(assert (=> b!304789 m!315881))

(assert (=> b!304789 m!315881))

(declare-fun m!315883 () Bool)

(assert (=> b!304789 m!315883))

(declare-fun m!315885 () Bool)

(assert (=> b!304786 m!315885))

(declare-fun m!315887 () Bool)

(assert (=> b!304790 m!315887))

(declare-fun m!315889 () Bool)

(assert (=> b!304784 m!315889))

(check-sat (not b!304788) (not b!304790) (not b!304786) (not b!304784) (not b!304789) (not b!304785) (not start!30442) (not b!304782))
(check-sat)
