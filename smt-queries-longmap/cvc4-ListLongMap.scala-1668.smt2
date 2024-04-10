; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30900 () Bool)

(assert start!30900)

(declare-fun b!310038 () Bool)

(declare-fun res!166497 () Bool)

(declare-fun e!193620 () Bool)

(assert (=> b!310038 (=> (not res!166497) (not e!193620))))

(declare-datatypes ((array!15802 0))(
  ( (array!15803 (arr!7483 (Array (_ BitVec 32) (_ BitVec 64))) (size!7835 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15802)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2623 0))(
  ( (MissingZero!2623 (index!12668 (_ BitVec 32))) (Found!2623 (index!12669 (_ BitVec 32))) (Intermediate!2623 (undefined!3435 Bool) (index!12670 (_ BitVec 32)) (x!30900 (_ BitVec 32))) (Undefined!2623) (MissingVacant!2623 (index!12671 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15802 (_ BitVec 32)) SeekEntryResult!2623)

(assert (=> b!310038 (= res!166497 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2623 i!1240)))))

(declare-fun b!310039 () Bool)

(declare-fun res!166492 () Bool)

(assert (=> b!310039 (=> (not res!166492) (not e!193620))))

(declare-fun arrayContainsKey!0 (array!15802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310039 (= res!166492 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310040 () Bool)

(declare-fun res!166496 () Bool)

(assert (=> b!310040 (=> (not res!166496) (not e!193620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310040 (= res!166496 (validKeyInArray!0 k!2441))))

(declare-fun b!310041 () Bool)

(declare-fun e!193621 () Bool)

(declare-fun e!193618 () Bool)

(assert (=> b!310041 (= e!193621 e!193618)))

(declare-fun res!166495 () Bool)

(assert (=> b!310041 (=> (not res!166495) (not e!193618))))

(declare-fun lt!151796 () SeekEntryResult!2623)

(declare-fun lt!151797 () SeekEntryResult!2623)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310041 (= res!166495 (and (= lt!151797 lt!151796) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7483 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15802 (_ BitVec 32)) SeekEntryResult!2623)

(assert (=> b!310041 (= lt!151797 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310042 () Bool)

(declare-fun res!166498 () Bool)

(assert (=> b!310042 (=> (not res!166498) (not e!193621))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310042 (= res!166498 (and (= (select (arr!7483 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7835 a!3293))))))

(declare-fun b!310043 () Bool)

(declare-fun res!166494 () Bool)

(assert (=> b!310043 (=> (not res!166494) (not e!193620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15802 (_ BitVec 32)) Bool)

(assert (=> b!310043 (= res!166494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310044 () Bool)

(assert (=> b!310044 (= e!193618 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310044 (= lt!151797 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!166493 () Bool)

(assert (=> start!30900 (=> (not res!166493) (not e!193620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30900 (= res!166493 (validMask!0 mask!3709))))

(assert (=> start!30900 e!193620))

(declare-fun array_inv!5446 (array!15802) Bool)

(assert (=> start!30900 (array_inv!5446 a!3293)))

(assert (=> start!30900 true))

(declare-fun b!310045 () Bool)

(declare-fun res!166499 () Bool)

(assert (=> b!310045 (=> (not res!166499) (not e!193620))))

(assert (=> b!310045 (= res!166499 (and (= (size!7835 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7835 a!3293))))))

(declare-fun b!310046 () Bool)

(assert (=> b!310046 (= e!193620 e!193621)))

(declare-fun res!166500 () Bool)

(assert (=> b!310046 (=> (not res!166500) (not e!193621))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310046 (= res!166500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151796))))

(assert (=> b!310046 (= lt!151796 (Intermediate!2623 false resIndex!52 resX!52))))

(assert (= (and start!30900 res!166493) b!310045))

(assert (= (and b!310045 res!166499) b!310040))

(assert (= (and b!310040 res!166496) b!310039))

(assert (= (and b!310039 res!166492) b!310038))

(assert (= (and b!310038 res!166497) b!310043))

(assert (= (and b!310043 res!166494) b!310046))

(assert (= (and b!310046 res!166500) b!310042))

(assert (= (and b!310042 res!166498) b!310041))

(assert (= (and b!310041 res!166495) b!310044))

(declare-fun m!319923 () Bool)

(assert (=> b!310043 m!319923))

(declare-fun m!319925 () Bool)

(assert (=> b!310041 m!319925))

(declare-fun m!319927 () Bool)

(assert (=> b!310041 m!319927))

(declare-fun m!319929 () Bool)

(assert (=> b!310040 m!319929))

(declare-fun m!319931 () Bool)

(assert (=> start!30900 m!319931))

(declare-fun m!319933 () Bool)

(assert (=> start!30900 m!319933))

(declare-fun m!319935 () Bool)

(assert (=> b!310039 m!319935))

(declare-fun m!319937 () Bool)

(assert (=> b!310038 m!319937))

(declare-fun m!319939 () Bool)

(assert (=> b!310044 m!319939))

(assert (=> b!310044 m!319939))

(declare-fun m!319941 () Bool)

(assert (=> b!310044 m!319941))

(declare-fun m!319943 () Bool)

(assert (=> b!310042 m!319943))

(declare-fun m!319945 () Bool)

(assert (=> b!310046 m!319945))

(assert (=> b!310046 m!319945))

(declare-fun m!319947 () Bool)

(assert (=> b!310046 m!319947))

(push 1)

(assert (not b!310040))

(assert (not b!310043))

(assert (not b!310041))

