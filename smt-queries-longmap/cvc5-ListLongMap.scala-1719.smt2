; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31712 () Bool)

(assert start!31712)

(declare-fun b!316860 () Bool)

(declare-fun res!171640 () Bool)

(declare-fun e!197061 () Bool)

(assert (=> b!316860 (=> (not res!171640) (not e!197061))))

(declare-datatypes ((array!16134 0))(
  ( (array!16135 (arr!7634 (Array (_ BitVec 32) (_ BitVec 64))) (size!7986 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16134)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16134 (_ BitVec 32)) Bool)

(assert (=> b!316860 (= res!171640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316861 () Bool)

(declare-fun e!197060 () Bool)

(declare-fun e!197062 () Bool)

(assert (=> b!316861 (= e!197060 e!197062)))

(declare-fun res!171634 () Bool)

(assert (=> b!316861 (=> (not res!171634) (not e!197062))))

(declare-datatypes ((SeekEntryResult!2774 0))(
  ( (MissingZero!2774 (index!13272 (_ BitVec 32))) (Found!2774 (index!13273 (_ BitVec 32))) (Intermediate!2774 (undefined!3586 Bool) (index!13274 (_ BitVec 32)) (x!31534 (_ BitVec 32))) (Undefined!2774) (MissingVacant!2774 (index!13275 (_ BitVec 32))) )
))
(declare-fun lt!154737 () SeekEntryResult!2774)

(declare-fun lt!154736 () SeekEntryResult!2774)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316861 (= res!171634 (and (= lt!154736 lt!154737) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7634 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16134 (_ BitVec 32)) SeekEntryResult!2774)

(assert (=> b!316861 (= lt!154736 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!316862 () Bool)

(declare-fun res!171641 () Bool)

(assert (=> b!316862 (=> (not res!171641) (not e!197061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316862 (= res!171641 (validKeyInArray!0 k!2441))))

(declare-fun b!316863 () Bool)

(assert (=> b!316863 (= e!197062 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316863 (= lt!154736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316864 () Bool)

(declare-fun res!171642 () Bool)

(assert (=> b!316864 (=> (not res!171642) (not e!197061))))

(declare-fun arrayContainsKey!0 (array!16134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316864 (= res!171642 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316865 () Bool)

(declare-fun res!171637 () Bool)

(assert (=> b!316865 (=> (not res!171637) (not e!197060))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316865 (= res!171637 (and (= (select (arr!7634 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7986 a!3293))))))

(declare-fun b!316866 () Bool)

(assert (=> b!316866 (= e!197061 e!197060)))

(declare-fun res!171636 () Bool)

(assert (=> b!316866 (=> (not res!171636) (not e!197060))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316866 (= res!171636 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154737))))

(assert (=> b!316866 (= lt!154737 (Intermediate!2774 false resIndex!52 resX!52))))

(declare-fun res!171635 () Bool)

(assert (=> start!31712 (=> (not res!171635) (not e!197061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31712 (= res!171635 (validMask!0 mask!3709))))

(assert (=> start!31712 e!197061))

(declare-fun array_inv!5597 (array!16134) Bool)

(assert (=> start!31712 (array_inv!5597 a!3293)))

(assert (=> start!31712 true))

(declare-fun b!316867 () Bool)

(declare-fun res!171639 () Bool)

(assert (=> b!316867 (=> (not res!171639) (not e!197061))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16134 (_ BitVec 32)) SeekEntryResult!2774)

(assert (=> b!316867 (= res!171639 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2774 i!1240)))))

(declare-fun b!316868 () Bool)

(declare-fun res!171638 () Bool)

(assert (=> b!316868 (=> (not res!171638) (not e!197061))))

(assert (=> b!316868 (= res!171638 (and (= (size!7986 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7986 a!3293))))))

(assert (= (and start!31712 res!171635) b!316868))

(assert (= (and b!316868 res!171638) b!316862))

(assert (= (and b!316862 res!171641) b!316864))

(assert (= (and b!316864 res!171642) b!316867))

(assert (= (and b!316867 res!171639) b!316860))

(assert (= (and b!316860 res!171640) b!316866))

(assert (= (and b!316866 res!171636) b!316865))

(assert (= (and b!316865 res!171637) b!316861))

(assert (= (and b!316861 res!171634) b!316863))

(declare-fun m!325607 () Bool)

(assert (=> b!316865 m!325607))

(declare-fun m!325609 () Bool)

(assert (=> b!316862 m!325609))

(declare-fun m!325611 () Bool)

(assert (=> b!316867 m!325611))

(declare-fun m!325613 () Bool)

(assert (=> b!316866 m!325613))

(assert (=> b!316866 m!325613))

(declare-fun m!325615 () Bool)

(assert (=> b!316866 m!325615))

(declare-fun m!325617 () Bool)

(assert (=> start!31712 m!325617))

(declare-fun m!325619 () Bool)

(assert (=> start!31712 m!325619))

(declare-fun m!325621 () Bool)

(assert (=> b!316863 m!325621))

(assert (=> b!316863 m!325621))

(declare-fun m!325623 () Bool)

(assert (=> b!316863 m!325623))

(declare-fun m!325625 () Bool)

(assert (=> b!316864 m!325625))

(declare-fun m!325627 () Bool)

(assert (=> b!316861 m!325627))

(declare-fun m!325629 () Bool)

(assert (=> b!316861 m!325629))

(declare-fun m!325631 () Bool)

(assert (=> b!316860 m!325631))

(push 1)

