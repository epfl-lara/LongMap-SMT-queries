; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31698 () Bool)

(assert start!31698)

(declare-fun b!316807 () Bool)

(declare-fun res!171638 () Bool)

(declare-fun e!197026 () Bool)

(assert (=> b!316807 (=> (not res!171638) (not e!197026))))

(declare-datatypes ((array!16133 0))(
  ( (array!16134 (arr!7633 (Array (_ BitVec 32) (_ BitVec 64))) (size!7985 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16133)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316807 (= res!171638 (and (= (size!7985 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7985 a!3293))))))

(declare-fun b!316808 () Bool)

(declare-fun e!197027 () Bool)

(assert (=> b!316808 (= e!197027 (not true))))

(declare-datatypes ((SeekEntryResult!2738 0))(
  ( (MissingZero!2738 (index!13128 (_ BitVec 32))) (Found!2738 (index!13129 (_ BitVec 32))) (Intermediate!2738 (undefined!3550 Bool) (index!13130 (_ BitVec 32)) (x!31495 (_ BitVec 32))) (Undefined!2738) (MissingVacant!2738 (index!13131 (_ BitVec 32))) )
))
(declare-fun lt!154754 () SeekEntryResult!2738)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16133 (_ BitVec 32)) SeekEntryResult!2738)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316808 (= lt!154754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316809 () Bool)

(declare-fun e!197025 () Bool)

(assert (=> b!316809 (= e!197025 e!197027)))

(declare-fun res!171637 () Bool)

(assert (=> b!316809 (=> (not res!171637) (not e!197027))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!154755 () SeekEntryResult!2738)

(assert (=> b!316809 (= res!171637 (and (= lt!154754 lt!154755) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7633 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316809 (= lt!154754 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!316810 () Bool)

(declare-fun res!171639 () Bool)

(assert (=> b!316810 (=> (not res!171639) (not e!197026))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16133 (_ BitVec 32)) SeekEntryResult!2738)

(assert (=> b!316810 (= res!171639 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2738 i!1240)))))

(declare-fun b!316811 () Bool)

(declare-fun res!171634 () Bool)

(assert (=> b!316811 (=> (not res!171634) (not e!197025))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316811 (= res!171634 (and (= (select (arr!7633 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7985 a!3293))))))

(declare-fun b!316812 () Bool)

(declare-fun res!171632 () Bool)

(assert (=> b!316812 (=> (not res!171632) (not e!197026))))

(declare-fun arrayContainsKey!0 (array!16133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316812 (= res!171632 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316813 () Bool)

(declare-fun res!171636 () Bool)

(assert (=> b!316813 (=> (not res!171636) (not e!197026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316813 (= res!171636 (validKeyInArray!0 k0!2441))))

(declare-fun b!316814 () Bool)

(assert (=> b!316814 (= e!197026 e!197025)))

(declare-fun res!171635 () Bool)

(assert (=> b!316814 (=> (not res!171635) (not e!197025))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316814 (= res!171635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154755))))

(assert (=> b!316814 (= lt!154755 (Intermediate!2738 false resIndex!52 resX!52))))

(declare-fun res!171633 () Bool)

(assert (=> start!31698 (=> (not res!171633) (not e!197026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31698 (= res!171633 (validMask!0 mask!3709))))

(assert (=> start!31698 e!197026))

(declare-fun array_inv!5583 (array!16133) Bool)

(assert (=> start!31698 (array_inv!5583 a!3293)))

(assert (=> start!31698 true))

(declare-fun b!316815 () Bool)

(declare-fun res!171631 () Bool)

(assert (=> b!316815 (=> (not res!171631) (not e!197026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16133 (_ BitVec 32)) Bool)

(assert (=> b!316815 (= res!171631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31698 res!171633) b!316807))

(assert (= (and b!316807 res!171638) b!316813))

(assert (= (and b!316813 res!171636) b!316812))

(assert (= (and b!316812 res!171632) b!316810))

(assert (= (and b!316810 res!171639) b!316815))

(assert (= (and b!316815 res!171631) b!316814))

(assert (= (and b!316814 res!171635) b!316811))

(assert (= (and b!316811 res!171634) b!316809))

(assert (= (and b!316809 res!171637) b!316808))

(declare-fun m!325771 () Bool)

(assert (=> start!31698 m!325771))

(declare-fun m!325773 () Bool)

(assert (=> start!31698 m!325773))

(declare-fun m!325775 () Bool)

(assert (=> b!316809 m!325775))

(declare-fun m!325777 () Bool)

(assert (=> b!316809 m!325777))

(declare-fun m!325779 () Bool)

(assert (=> b!316812 m!325779))

(declare-fun m!325781 () Bool)

(assert (=> b!316811 m!325781))

(declare-fun m!325783 () Bool)

(assert (=> b!316815 m!325783))

(declare-fun m!325785 () Bool)

(assert (=> b!316814 m!325785))

(assert (=> b!316814 m!325785))

(declare-fun m!325787 () Bool)

(assert (=> b!316814 m!325787))

(declare-fun m!325789 () Bool)

(assert (=> b!316813 m!325789))

(declare-fun m!325791 () Bool)

(assert (=> b!316808 m!325791))

(assert (=> b!316808 m!325791))

(declare-fun m!325793 () Bool)

(assert (=> b!316808 m!325793))

(declare-fun m!325795 () Bool)

(assert (=> b!316810 m!325795))

(check-sat (not b!316814) (not b!316809) (not b!316810) (not b!316815) (not b!316812) (not start!31698) (not b!316813) (not b!316808))
(check-sat)
