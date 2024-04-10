; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30906 () Bool)

(assert start!30906)

(declare-fun b!310127 () Bool)

(declare-fun res!166587 () Bool)

(declare-fun e!193666 () Bool)

(assert (=> b!310127 (=> (not res!166587) (not e!193666))))

(declare-datatypes ((array!15808 0))(
  ( (array!15809 (arr!7486 (Array (_ BitVec 32) (_ BitVec 64))) (size!7838 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15808)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310127 (= res!166587 (and (= (size!7838 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7838 a!3293))))))

(declare-fun b!310128 () Bool)

(declare-fun e!193664 () Bool)

(assert (=> b!310128 (= e!193664 (not true))))

(declare-fun e!193662 () Bool)

(assert (=> b!310128 e!193662))

(declare-fun res!166581 () Bool)

(assert (=> b!310128 (=> (not res!166581) (not e!193662))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun lt!151830 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2626 0))(
  ( (MissingZero!2626 (index!12680 (_ BitVec 32))) (Found!2626 (index!12681 (_ BitVec 32))) (Intermediate!2626 (undefined!3438 Bool) (index!12682 (_ BitVec 32)) (x!30911 (_ BitVec 32))) (Undefined!2626) (MissingVacant!2626 (index!12683 (_ BitVec 32))) )
))
(declare-fun lt!151833 () SeekEntryResult!2626)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15808 (_ BitVec 32)) SeekEntryResult!2626)

(assert (=> b!310128 (= res!166581 (= lt!151833 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151830 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310128 (= lt!151830 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310129 () Bool)

(declare-fun res!166590 () Bool)

(assert (=> b!310129 (=> (not res!166590) (not e!193666))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15808 (_ BitVec 32)) SeekEntryResult!2626)

(assert (=> b!310129 (= res!166590 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2626 i!1240)))))

(declare-fun b!310130 () Bool)

(declare-fun res!166585 () Bool)

(assert (=> b!310130 (=> (not res!166585) (not e!193666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15808 (_ BitVec 32)) Bool)

(assert (=> b!310130 (= res!166585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310131 () Bool)

(declare-fun res!166589 () Bool)

(assert (=> b!310131 (=> (not res!166589) (not e!193666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310131 (= res!166589 (validKeyInArray!0 k!2441))))

(declare-fun res!166584 () Bool)

(assert (=> start!30906 (=> (not res!166584) (not e!193666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30906 (= res!166584 (validMask!0 mask!3709))))

(assert (=> start!30906 e!193666))

(declare-fun array_inv!5449 (array!15808) Bool)

(assert (=> start!30906 (array_inv!5449 a!3293)))

(assert (=> start!30906 true))

(declare-fun lt!151832 () array!15808)

(declare-fun b!310132 () Bool)

(assert (=> b!310132 (= e!193662 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151832 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151830 k!2441 lt!151832 mask!3709)))))

(assert (=> b!310132 (= lt!151832 (array!15809 (store (arr!7486 a!3293) i!1240 k!2441) (size!7838 a!3293)))))

(declare-fun b!310133 () Bool)

(declare-fun res!166588 () Bool)

(assert (=> b!310133 (=> (not res!166588) (not e!193666))))

(declare-fun arrayContainsKey!0 (array!15808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310133 (= res!166588 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310134 () Bool)

(declare-fun e!193665 () Bool)

(assert (=> b!310134 (= e!193665 e!193664)))

(declare-fun res!166586 () Bool)

(assert (=> b!310134 (=> (not res!166586) (not e!193664))))

(declare-fun lt!151831 () SeekEntryResult!2626)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310134 (= res!166586 (and (= lt!151833 lt!151831) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7486 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310134 (= lt!151833 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310135 () Bool)

(assert (=> b!310135 (= e!193666 e!193665)))

(declare-fun res!166582 () Bool)

(assert (=> b!310135 (=> (not res!166582) (not e!193665))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310135 (= res!166582 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151831))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310135 (= lt!151831 (Intermediate!2626 false resIndex!52 resX!52))))

(declare-fun b!310136 () Bool)

(declare-fun res!166583 () Bool)

(assert (=> b!310136 (=> (not res!166583) (not e!193665))))

(assert (=> b!310136 (= res!166583 (and (= (select (arr!7486 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7838 a!3293))))))

(assert (= (and start!30906 res!166584) b!310127))

(assert (= (and b!310127 res!166587) b!310131))

(assert (= (and b!310131 res!166589) b!310133))

(assert (= (and b!310133 res!166588) b!310129))

(assert (= (and b!310129 res!166590) b!310130))

(assert (= (and b!310130 res!166585) b!310135))

(assert (= (and b!310135 res!166582) b!310136))

(assert (= (and b!310136 res!166583) b!310134))

(assert (= (and b!310134 res!166586) b!310128))

(assert (= (and b!310128 res!166581) b!310132))

(declare-fun m!320013 () Bool)

(assert (=> b!310131 m!320013))

(declare-fun m!320015 () Bool)

(assert (=> b!310132 m!320015))

(declare-fun m!320017 () Bool)

(assert (=> b!310132 m!320017))

(declare-fun m!320019 () Bool)

(assert (=> b!310132 m!320019))

(declare-fun m!320021 () Bool)

(assert (=> b!310133 m!320021))

(declare-fun m!320023 () Bool)

(assert (=> b!310134 m!320023))

(declare-fun m!320025 () Bool)

(assert (=> b!310134 m!320025))

(declare-fun m!320027 () Bool)

(assert (=> start!30906 m!320027))

(declare-fun m!320029 () Bool)

(assert (=> start!30906 m!320029))

(declare-fun m!320031 () Bool)

(assert (=> b!310135 m!320031))

(assert (=> b!310135 m!320031))

(declare-fun m!320033 () Bool)

(assert (=> b!310135 m!320033))

(declare-fun m!320035 () Bool)

(assert (=> b!310130 m!320035))

(declare-fun m!320037 () Bool)

(assert (=> b!310128 m!320037))

(declare-fun m!320039 () Bool)

(assert (=> b!310128 m!320039))

(declare-fun m!320041 () Bool)

(assert (=> b!310129 m!320041))

(declare-fun m!320043 () Bool)

(assert (=> b!310136 m!320043))

(push 1)

(assert (not b!310131))

(assert (not b!310129))

(assert (not b!310128))

