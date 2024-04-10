; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30940 () Bool)

(assert start!30940)

(declare-fun b!310638 () Bool)

(declare-fun res!167091 () Bool)

(declare-fun e!193919 () Bool)

(assert (=> b!310638 (=> (not res!167091) (not e!193919))))

(declare-datatypes ((array!15842 0))(
  ( (array!15843 (arr!7503 (Array (_ BitVec 32) (_ BitVec 64))) (size!7855 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15842)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310638 (= res!167091 (and (= (select (arr!7503 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7855 a!3293))))))

(declare-fun e!193920 () Bool)

(declare-fun lt!152037 () array!15842)

(declare-fun lt!152035 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!310639 () Bool)

(declare-datatypes ((SeekEntryResult!2643 0))(
  ( (MissingZero!2643 (index!12748 (_ BitVec 32))) (Found!2643 (index!12749 (_ BitVec 32))) (Intermediate!2643 (undefined!3455 Bool) (index!12750 (_ BitVec 32)) (x!30976 (_ BitVec 32))) (Undefined!2643) (MissingVacant!2643 (index!12751 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15842 (_ BitVec 32)) SeekEntryResult!2643)

(assert (=> b!310639 (= e!193920 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152037 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152035 k0!2441 lt!152037 mask!3709)))))

(assert (=> b!310639 (= lt!152037 (array!15843 (store (arr!7503 a!3293) i!1240 k0!2441) (size!7855 a!3293)))))

(declare-fun b!310640 () Bool)

(declare-fun res!167097 () Bool)

(declare-fun e!193918 () Bool)

(assert (=> b!310640 (=> (not res!167097) (not e!193918))))

(assert (=> b!310640 (= res!167097 (and (= (size!7855 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7855 a!3293))))))

(declare-fun b!310641 () Bool)

(declare-fun res!167098 () Bool)

(assert (=> b!310641 (=> (not res!167098) (not e!193918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15842 (_ BitVec 32)) Bool)

(assert (=> b!310641 (= res!167098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310642 () Bool)

(declare-fun e!193917 () Bool)

(assert (=> b!310642 (= e!193917 (not true))))

(assert (=> b!310642 e!193920))

(declare-fun res!167095 () Bool)

(assert (=> b!310642 (=> (not res!167095) (not e!193920))))

(declare-fun lt!152034 () SeekEntryResult!2643)

(assert (=> b!310642 (= res!167095 (= lt!152034 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152035 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310642 (= lt!152035 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310643 () Bool)

(declare-fun res!167093 () Bool)

(assert (=> b!310643 (=> (not res!167093) (not e!193918))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15842 (_ BitVec 32)) SeekEntryResult!2643)

(assert (=> b!310643 (= res!167093 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2643 i!1240)))))

(declare-fun b!310644 () Bool)

(declare-fun res!167096 () Bool)

(assert (=> b!310644 (=> (not res!167096) (not e!193918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310644 (= res!167096 (validKeyInArray!0 k0!2441))))

(declare-fun b!310645 () Bool)

(declare-fun res!167099 () Bool)

(assert (=> b!310645 (=> (not res!167099) (not e!193918))))

(declare-fun arrayContainsKey!0 (array!15842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310645 (= res!167099 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310646 () Bool)

(assert (=> b!310646 (= e!193918 e!193919)))

(declare-fun res!167094 () Bool)

(assert (=> b!310646 (=> (not res!167094) (not e!193919))))

(declare-fun lt!152036 () SeekEntryResult!2643)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310646 (= res!167094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152036))))

(assert (=> b!310646 (= lt!152036 (Intermediate!2643 false resIndex!52 resX!52))))

(declare-fun b!310637 () Bool)

(assert (=> b!310637 (= e!193919 e!193917)))

(declare-fun res!167100 () Bool)

(assert (=> b!310637 (=> (not res!167100) (not e!193917))))

(assert (=> b!310637 (= res!167100 (and (= lt!152034 lt!152036) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7503 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310637 (= lt!152034 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!167092 () Bool)

(assert (=> start!30940 (=> (not res!167092) (not e!193918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30940 (= res!167092 (validMask!0 mask!3709))))

(assert (=> start!30940 e!193918))

(declare-fun array_inv!5466 (array!15842) Bool)

(assert (=> start!30940 (array_inv!5466 a!3293)))

(assert (=> start!30940 true))

(assert (= (and start!30940 res!167092) b!310640))

(assert (= (and b!310640 res!167097) b!310644))

(assert (= (and b!310644 res!167096) b!310645))

(assert (= (and b!310645 res!167099) b!310643))

(assert (= (and b!310643 res!167093) b!310641))

(assert (= (and b!310641 res!167098) b!310646))

(assert (= (and b!310646 res!167094) b!310638))

(assert (= (and b!310638 res!167091) b!310637))

(assert (= (and b!310637 res!167100) b!310642))

(assert (= (and b!310642 res!167095) b!310639))

(declare-fun m!320557 () Bool)

(assert (=> b!310645 m!320557))

(declare-fun m!320559 () Bool)

(assert (=> b!310644 m!320559))

(declare-fun m!320561 () Bool)

(assert (=> b!310639 m!320561))

(declare-fun m!320563 () Bool)

(assert (=> b!310639 m!320563))

(declare-fun m!320565 () Bool)

(assert (=> b!310639 m!320565))

(declare-fun m!320567 () Bool)

(assert (=> b!310643 m!320567))

(declare-fun m!320569 () Bool)

(assert (=> b!310638 m!320569))

(declare-fun m!320571 () Bool)

(assert (=> start!30940 m!320571))

(declare-fun m!320573 () Bool)

(assert (=> start!30940 m!320573))

(declare-fun m!320575 () Bool)

(assert (=> b!310637 m!320575))

(declare-fun m!320577 () Bool)

(assert (=> b!310637 m!320577))

(declare-fun m!320579 () Bool)

(assert (=> b!310641 m!320579))

(declare-fun m!320581 () Bool)

(assert (=> b!310642 m!320581))

(declare-fun m!320583 () Bool)

(assert (=> b!310642 m!320583))

(declare-fun m!320585 () Bool)

(assert (=> b!310646 m!320585))

(assert (=> b!310646 m!320585))

(declare-fun m!320587 () Bool)

(assert (=> b!310646 m!320587))

(check-sat (not b!310646) (not b!310641) (not b!310639) (not b!310645) (not b!310642) (not start!30940) (not b!310637) (not b!310644) (not b!310643))
(check-sat)
