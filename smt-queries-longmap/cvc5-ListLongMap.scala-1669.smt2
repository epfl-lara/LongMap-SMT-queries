; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30902 () Bool)

(assert start!30902)

(declare-fun b!310067 () Bool)

(declare-fun res!166523 () Bool)

(declare-fun e!193636 () Bool)

(assert (=> b!310067 (=> (not res!166523) (not e!193636))))

(declare-datatypes ((array!15804 0))(
  ( (array!15805 (arr!7484 (Array (_ BitVec 32) (_ BitVec 64))) (size!7836 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15804)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15804 (_ BitVec 32)) Bool)

(assert (=> b!310067 (= res!166523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310068 () Bool)

(declare-fun e!193633 () Bool)

(assert (=> b!310068 (= e!193633 (not true))))

(declare-fun e!193635 () Bool)

(assert (=> b!310068 e!193635))

(declare-fun res!166529 () Bool)

(assert (=> b!310068 (=> (not res!166529) (not e!193635))))

(declare-datatypes ((SeekEntryResult!2624 0))(
  ( (MissingZero!2624 (index!12672 (_ BitVec 32))) (Found!2624 (index!12673 (_ BitVec 32))) (Intermediate!2624 (undefined!3436 Bool) (index!12674 (_ BitVec 32)) (x!30909 (_ BitVec 32))) (Undefined!2624) (MissingVacant!2624 (index!12675 (_ BitVec 32))) )
))
(declare-fun lt!151809 () SeekEntryResult!2624)

(declare-fun lt!151808 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15804 (_ BitVec 32)) SeekEntryResult!2624)

(assert (=> b!310068 (= res!166529 (= lt!151809 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151808 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310068 (= lt!151808 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310069 () Bool)

(declare-fun res!166526 () Bool)

(assert (=> b!310069 (=> (not res!166526) (not e!193636))))

(declare-fun arrayContainsKey!0 (array!15804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310069 (= res!166526 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310070 () Bool)

(declare-fun e!193632 () Bool)

(assert (=> b!310070 (= e!193632 e!193633)))

(declare-fun res!166524 () Bool)

(assert (=> b!310070 (=> (not res!166524) (not e!193633))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151806 () SeekEntryResult!2624)

(assert (=> b!310070 (= res!166524 (and (= lt!151809 lt!151806) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7484 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310070 (= lt!151809 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310071 () Bool)

(declare-fun lt!151807 () array!15804)

(assert (=> b!310071 (= e!193635 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151807 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151808 k!2441 lt!151807 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310071 (= lt!151807 (array!15805 (store (arr!7484 a!3293) i!1240 k!2441) (size!7836 a!3293)))))

(declare-fun b!310072 () Bool)

(declare-fun res!166530 () Bool)

(assert (=> b!310072 (=> (not res!166530) (not e!193636))))

(assert (=> b!310072 (= res!166530 (and (= (size!7836 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7836 a!3293))))))

(declare-fun b!310073 () Bool)

(assert (=> b!310073 (= e!193636 e!193632)))

(declare-fun res!166528 () Bool)

(assert (=> b!310073 (=> (not res!166528) (not e!193632))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310073 (= res!166528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151806))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310073 (= lt!151806 (Intermediate!2624 false resIndex!52 resX!52))))

(declare-fun b!310074 () Bool)

(declare-fun res!166527 () Bool)

(assert (=> b!310074 (=> (not res!166527) (not e!193632))))

(assert (=> b!310074 (= res!166527 (and (= (select (arr!7484 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7836 a!3293))))))

(declare-fun b!310075 () Bool)

(declare-fun res!166525 () Bool)

(assert (=> b!310075 (=> (not res!166525) (not e!193636))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15804 (_ BitVec 32)) SeekEntryResult!2624)

(assert (=> b!310075 (= res!166525 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2624 i!1240)))))

(declare-fun b!310076 () Bool)

(declare-fun res!166521 () Bool)

(assert (=> b!310076 (=> (not res!166521) (not e!193636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310076 (= res!166521 (validKeyInArray!0 k!2441))))

(declare-fun res!166522 () Bool)

(assert (=> start!30902 (=> (not res!166522) (not e!193636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30902 (= res!166522 (validMask!0 mask!3709))))

(assert (=> start!30902 e!193636))

(declare-fun array_inv!5447 (array!15804) Bool)

(assert (=> start!30902 (array_inv!5447 a!3293)))

(assert (=> start!30902 true))

(assert (= (and start!30902 res!166522) b!310072))

(assert (= (and b!310072 res!166530) b!310076))

(assert (= (and b!310076 res!166521) b!310069))

(assert (= (and b!310069 res!166526) b!310075))

(assert (= (and b!310075 res!166525) b!310067))

(assert (= (and b!310067 res!166523) b!310073))

(assert (= (and b!310073 res!166528) b!310074))

(assert (= (and b!310074 res!166527) b!310070))

(assert (= (and b!310070 res!166524) b!310068))

(assert (= (and b!310068 res!166529) b!310071))

(declare-fun m!319949 () Bool)

(assert (=> b!310073 m!319949))

(assert (=> b!310073 m!319949))

(declare-fun m!319951 () Bool)

(assert (=> b!310073 m!319951))

(declare-fun m!319953 () Bool)

(assert (=> b!310074 m!319953))

(declare-fun m!319955 () Bool)

(assert (=> b!310070 m!319955))

(declare-fun m!319957 () Bool)

(assert (=> b!310070 m!319957))

(declare-fun m!319959 () Bool)

(assert (=> b!310071 m!319959))

(declare-fun m!319961 () Bool)

(assert (=> b!310071 m!319961))

(declare-fun m!319963 () Bool)

(assert (=> b!310071 m!319963))

(declare-fun m!319965 () Bool)

(assert (=> b!310068 m!319965))

(declare-fun m!319967 () Bool)

(assert (=> b!310068 m!319967))

(declare-fun m!319969 () Bool)

(assert (=> start!30902 m!319969))

(declare-fun m!319971 () Bool)

(assert (=> start!30902 m!319971))

(declare-fun m!319973 () Bool)

(assert (=> b!310069 m!319973))

(declare-fun m!319975 () Bool)

(assert (=> b!310076 m!319975))

(declare-fun m!319977 () Bool)

(assert (=> b!310067 m!319977))

(declare-fun m!319979 () Bool)

(assert (=> b!310075 m!319979))

(push 1)

