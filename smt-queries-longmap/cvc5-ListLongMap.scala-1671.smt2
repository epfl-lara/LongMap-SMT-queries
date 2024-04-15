; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30904 () Bool)

(assert start!30904)

(declare-fun b!310032 () Bool)

(declare-fun res!166639 () Bool)

(declare-fun e!193578 () Bool)

(assert (=> b!310032 (=> (not res!166639) (not e!193578))))

(declare-datatypes ((array!15810 0))(
  ( (array!15811 (arr!7487 (Array (_ BitVec 32) (_ BitVec 64))) (size!7840 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15810)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310032 (= res!166639 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310033 () Bool)

(declare-fun e!193579 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310033 (= e!193579 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun e!193580 () Bool)

(assert (=> b!310033 e!193580))

(declare-fun res!166641 () Bool)

(assert (=> b!310033 (=> (not res!166641) (not e!193580))))

(declare-datatypes ((SeekEntryResult!2626 0))(
  ( (MissingZero!2626 (index!12680 (_ BitVec 32))) (Found!2626 (index!12681 (_ BitVec 32))) (Intermediate!2626 (undefined!3438 Bool) (index!12682 (_ BitVec 32)) (x!30922 (_ BitVec 32))) (Undefined!2626) (MissingVacant!2626 (index!12683 (_ BitVec 32))) )
))
(declare-fun lt!151669 () SeekEntryResult!2626)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151667 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15810 (_ BitVec 32)) SeekEntryResult!2626)

(assert (=> b!310033 (= res!166641 (= lt!151669 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151667 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310033 (= lt!151667 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310034 () Bool)

(declare-fun res!166637 () Bool)

(assert (=> b!310034 (=> (not res!166637) (not e!193578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310034 (= res!166637 (validKeyInArray!0 k!2441))))

(declare-fun b!310035 () Bool)

(declare-fun res!166632 () Bool)

(assert (=> b!310035 (=> (not res!166632) (not e!193578))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310035 (= res!166632 (and (= (size!7840 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7840 a!3293))))))

(declare-fun res!166633 () Bool)

(assert (=> start!30904 (=> (not res!166633) (not e!193578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30904 (= res!166633 (validMask!0 mask!3709))))

(assert (=> start!30904 e!193578))

(declare-fun array_inv!5459 (array!15810) Bool)

(assert (=> start!30904 (array_inv!5459 a!3293)))

(assert (=> start!30904 true))

(declare-fun b!310036 () Bool)

(declare-fun e!193576 () Bool)

(assert (=> b!310036 (= e!193576 e!193579)))

(declare-fun res!166638 () Bool)

(assert (=> b!310036 (=> (not res!166638) (not e!193579))))

(declare-fun lt!151668 () SeekEntryResult!2626)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310036 (= res!166638 (and (= lt!151669 lt!151668) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7487 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310036 (= lt!151669 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310037 () Bool)

(declare-fun res!166634 () Bool)

(assert (=> b!310037 (=> (not res!166634) (not e!193576))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310037 (= res!166634 (and (= (select (arr!7487 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7840 a!3293))))))

(declare-fun b!310038 () Bool)

(assert (=> b!310038 (= e!193578 e!193576)))

(declare-fun res!166635 () Bool)

(assert (=> b!310038 (=> (not res!166635) (not e!193576))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310038 (= res!166635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151668))))

(assert (=> b!310038 (= lt!151668 (Intermediate!2626 false resIndex!52 resX!52))))

(declare-fun b!310039 () Bool)

(declare-fun res!166636 () Bool)

(assert (=> b!310039 (=> (not res!166636) (not e!193578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15810 (_ BitVec 32)) Bool)

(assert (=> b!310039 (= res!166636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310040 () Bool)

(declare-fun res!166640 () Bool)

(assert (=> b!310040 (=> (not res!166640) (not e!193578))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15810 (_ BitVec 32)) SeekEntryResult!2626)

(assert (=> b!310040 (= res!166640 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2626 i!1240)))))

(declare-fun lt!151670 () array!15810)

(declare-fun b!310041 () Bool)

(assert (=> b!310041 (= e!193580 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151670 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151667 k!2441 lt!151670 mask!3709)))))

(assert (=> b!310041 (= lt!151670 (array!15811 (store (arr!7487 a!3293) i!1240 k!2441) (size!7840 a!3293)))))

(assert (= (and start!30904 res!166633) b!310035))

(assert (= (and b!310035 res!166632) b!310034))

(assert (= (and b!310034 res!166637) b!310032))

(assert (= (and b!310032 res!166639) b!310040))

(assert (= (and b!310040 res!166640) b!310039))

(assert (= (and b!310039 res!166636) b!310038))

(assert (= (and b!310038 res!166635) b!310037))

(assert (= (and b!310037 res!166634) b!310036))

(assert (= (and b!310036 res!166638) b!310033))

(assert (= (and b!310033 res!166641) b!310041))

(declare-fun m!319475 () Bool)

(assert (=> b!310034 m!319475))

(declare-fun m!319477 () Bool)

(assert (=> b!310040 m!319477))

(declare-fun m!319479 () Bool)

(assert (=> b!310039 m!319479))

(declare-fun m!319481 () Bool)

(assert (=> b!310032 m!319481))

(declare-fun m!319483 () Bool)

(assert (=> b!310041 m!319483))

(declare-fun m!319485 () Bool)

(assert (=> b!310041 m!319485))

(declare-fun m!319487 () Bool)

(assert (=> b!310041 m!319487))

(declare-fun m!319489 () Bool)

(assert (=> b!310038 m!319489))

(assert (=> b!310038 m!319489))

(declare-fun m!319491 () Bool)

(assert (=> b!310038 m!319491))

(declare-fun m!319493 () Bool)

(assert (=> b!310033 m!319493))

(declare-fun m!319495 () Bool)

(assert (=> b!310033 m!319495))

(declare-fun m!319497 () Bool)

(assert (=> b!310037 m!319497))

(declare-fun m!319499 () Bool)

(assert (=> b!310036 m!319499))

(declare-fun m!319501 () Bool)

(assert (=> b!310036 m!319501))

(declare-fun m!319503 () Bool)

(assert (=> start!30904 m!319503))

(declare-fun m!319505 () Bool)

(assert (=> start!30904 m!319505))

(push 1)

(assert (not b!310032))

(assert (not start!30904))

(assert (not b!310033))

(assert (not b!310038))

(assert (not b!310039))

(assert (not b!310040))

(assert (not b!310041))

(assert (not b!310034))

(assert (not b!310036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

