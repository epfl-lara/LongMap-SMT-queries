; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30962 () Bool)

(assert start!30962)

(declare-fun b!310967 () Bool)

(declare-fun res!167424 () Bool)

(declare-fun e!194084 () Bool)

(assert (=> b!310967 (=> (not res!167424) (not e!194084))))

(declare-datatypes ((array!15864 0))(
  ( (array!15865 (arr!7514 (Array (_ BitVec 32) (_ BitVec 64))) (size!7866 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15864)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15864 (_ BitVec 32)) Bool)

(assert (=> b!310967 (= res!167424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310968 () Bool)

(declare-fun e!194086 () Bool)

(assert (=> b!310968 (= e!194086 (not true))))

(declare-fun e!194083 () Bool)

(assert (=> b!310968 e!194083))

(declare-fun res!167429 () Bool)

(assert (=> b!310968 (=> (not res!167429) (not e!194083))))

(declare-datatypes ((SeekEntryResult!2654 0))(
  ( (MissingZero!2654 (index!12792 (_ BitVec 32))) (Found!2654 (index!12793 (_ BitVec 32))) (Intermediate!2654 (undefined!3466 Bool) (index!12794 (_ BitVec 32)) (x!31019 (_ BitVec 32))) (Undefined!2654) (MissingVacant!2654 (index!12795 (_ BitVec 32))) )
))
(declare-fun lt!152169 () SeekEntryResult!2654)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152167 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15864 (_ BitVec 32)) SeekEntryResult!2654)

(assert (=> b!310968 (= res!167429 (= lt!152169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152167 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310968 (= lt!152167 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310969 () Bool)

(declare-fun res!167423 () Bool)

(declare-fun e!194085 () Bool)

(assert (=> b!310969 (=> (not res!167423) (not e!194085))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310969 (= res!167423 (and (= (select (arr!7514 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7866 a!3293))))))

(declare-fun b!310970 () Bool)

(declare-fun res!167421 () Bool)

(assert (=> b!310970 (=> (not res!167421) (not e!194084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310970 (= res!167421 (validKeyInArray!0 k!2441))))

(declare-fun b!310971 () Bool)

(declare-fun res!167426 () Bool)

(assert (=> b!310971 (=> (not res!167426) (not e!194084))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15864 (_ BitVec 32)) SeekEntryResult!2654)

(assert (=> b!310971 (= res!167426 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2654 i!1240)))))

(declare-fun b!310972 () Bool)

(assert (=> b!310972 (= e!194085 e!194086)))

(declare-fun res!167422 () Bool)

(assert (=> b!310972 (=> (not res!167422) (not e!194086))))

(declare-fun lt!152166 () SeekEntryResult!2654)

(assert (=> b!310972 (= res!167422 (and (= lt!152169 lt!152166) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7514 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310972 (= lt!152169 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310973 () Bool)

(assert (=> b!310973 (= e!194084 e!194085)))

(declare-fun res!167430 () Bool)

(assert (=> b!310973 (=> (not res!167430) (not e!194085))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310973 (= res!167430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152166))))

(assert (=> b!310973 (= lt!152166 (Intermediate!2654 false resIndex!52 resX!52))))

(declare-fun res!167427 () Bool)

(assert (=> start!30962 (=> (not res!167427) (not e!194084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30962 (= res!167427 (validMask!0 mask!3709))))

(assert (=> start!30962 e!194084))

(declare-fun array_inv!5477 (array!15864) Bool)

(assert (=> start!30962 (array_inv!5477 a!3293)))

(assert (=> start!30962 true))

(declare-fun b!310974 () Bool)

(declare-fun res!167428 () Bool)

(assert (=> b!310974 (=> (not res!167428) (not e!194084))))

(assert (=> b!310974 (= res!167428 (and (= (size!7866 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7866 a!3293))))))

(declare-fun lt!152168 () array!15864)

(declare-fun b!310975 () Bool)

(assert (=> b!310975 (= e!194083 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152168 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152167 k!2441 lt!152168 mask!3709)))))

(assert (=> b!310975 (= lt!152168 (array!15865 (store (arr!7514 a!3293) i!1240 k!2441) (size!7866 a!3293)))))

(declare-fun b!310976 () Bool)

(declare-fun res!167425 () Bool)

(assert (=> b!310976 (=> (not res!167425) (not e!194084))))

(declare-fun arrayContainsKey!0 (array!15864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310976 (= res!167425 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30962 res!167427) b!310974))

(assert (= (and b!310974 res!167428) b!310970))

(assert (= (and b!310970 res!167421) b!310976))

(assert (= (and b!310976 res!167425) b!310971))

(assert (= (and b!310971 res!167426) b!310967))

(assert (= (and b!310967 res!167424) b!310973))

(assert (= (and b!310973 res!167430) b!310969))

(assert (= (and b!310969 res!167423) b!310972))

(assert (= (and b!310972 res!167422) b!310968))

(assert (= (and b!310968 res!167429) b!310975))

(declare-fun m!320909 () Bool)

(assert (=> b!310971 m!320909))

(declare-fun m!320911 () Bool)

(assert (=> b!310968 m!320911))

(declare-fun m!320913 () Bool)

(assert (=> b!310968 m!320913))

(declare-fun m!320915 () Bool)

(assert (=> b!310967 m!320915))

(declare-fun m!320917 () Bool)

(assert (=> b!310972 m!320917))

(declare-fun m!320919 () Bool)

(assert (=> b!310972 m!320919))

(declare-fun m!320921 () Bool)

(assert (=> start!30962 m!320921))

(declare-fun m!320923 () Bool)

(assert (=> start!30962 m!320923))

(declare-fun m!320925 () Bool)

(assert (=> b!310970 m!320925))

(declare-fun m!320927 () Bool)

(assert (=> b!310969 m!320927))

(declare-fun m!320929 () Bool)

(assert (=> b!310975 m!320929))

(declare-fun m!320931 () Bool)

(assert (=> b!310975 m!320931))

(declare-fun m!320933 () Bool)

(assert (=> b!310975 m!320933))

(declare-fun m!320935 () Bool)

(assert (=> b!310973 m!320935))

(assert (=> b!310973 m!320935))

(declare-fun m!320937 () Bool)

(assert (=> b!310973 m!320937))

(declare-fun m!320939 () Bool)

(assert (=> b!310976 m!320939))

(push 1)

