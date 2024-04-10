; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30908 () Bool)

(assert start!30908)

(declare-fun b!310157 () Bool)

(declare-fun res!166620 () Bool)

(declare-fun e!193677 () Bool)

(assert (=> b!310157 (=> (not res!166620) (not e!193677))))

(declare-datatypes ((array!15810 0))(
  ( (array!15811 (arr!7487 (Array (_ BitVec 32) (_ BitVec 64))) (size!7839 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15810)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310157 (= res!166620 (and (= (select (arr!7487 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7839 a!3293))))))

(declare-fun res!166612 () Bool)

(declare-fun e!193678 () Bool)

(assert (=> start!30908 (=> (not res!166612) (not e!193678))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30908 (= res!166612 (validMask!0 mask!3709))))

(assert (=> start!30908 e!193678))

(declare-fun array_inv!5450 (array!15810) Bool)

(assert (=> start!30908 (array_inv!5450 a!3293)))

(assert (=> start!30908 true))

(declare-fun b!310158 () Bool)

(declare-fun e!193679 () Bool)

(assert (=> b!310158 (= e!193677 e!193679)))

(declare-fun res!166619 () Bool)

(assert (=> b!310158 (=> (not res!166619) (not e!193679))))

(declare-datatypes ((SeekEntryResult!2627 0))(
  ( (MissingZero!2627 (index!12684 (_ BitVec 32))) (Found!2627 (index!12685 (_ BitVec 32))) (Intermediate!2627 (undefined!3439 Bool) (index!12686 (_ BitVec 32)) (x!30920 (_ BitVec 32))) (Undefined!2627) (MissingVacant!2627 (index!12687 (_ BitVec 32))) )
))
(declare-fun lt!151842 () SeekEntryResult!2627)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun lt!151844 () SeekEntryResult!2627)

(assert (=> b!310158 (= res!166619 (and (= lt!151844 lt!151842) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7487 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15810 (_ BitVec 32)) SeekEntryResult!2627)

(assert (=> b!310158 (= lt!151844 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310159 () Bool)

(declare-fun res!166615 () Bool)

(assert (=> b!310159 (=> (not res!166615) (not e!193678))))

(assert (=> b!310159 (= res!166615 (and (= (size!7839 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7839 a!3293))))))

(declare-fun b!310160 () Bool)

(declare-fun res!166614 () Bool)

(assert (=> b!310160 (=> (not res!166614) (not e!193678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310160 (= res!166614 (validKeyInArray!0 k!2441))))

(declare-fun b!310161 () Bool)

(declare-fun lt!151843 () array!15810)

(declare-fun lt!151845 () (_ BitVec 32))

(declare-fun e!193681 () Bool)

(assert (=> b!310161 (= e!193681 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151843 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151845 k!2441 lt!151843 mask!3709)))))

(assert (=> b!310161 (= lt!151843 (array!15811 (store (arr!7487 a!3293) i!1240 k!2441) (size!7839 a!3293)))))

(declare-fun b!310162 () Bool)

(declare-fun res!166611 () Bool)

(assert (=> b!310162 (=> (not res!166611) (not e!193678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15810 (_ BitVec 32)) Bool)

(assert (=> b!310162 (= res!166611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310163 () Bool)

(assert (=> b!310163 (= e!193678 e!193677)))

(declare-fun res!166618 () Bool)

(assert (=> b!310163 (=> (not res!166618) (not e!193677))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310163 (= res!166618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151842))))

(assert (=> b!310163 (= lt!151842 (Intermediate!2627 false resIndex!52 resX!52))))

(declare-fun b!310164 () Bool)

(declare-fun res!166616 () Bool)

(assert (=> b!310164 (=> (not res!166616) (not e!193678))))

(declare-fun arrayContainsKey!0 (array!15810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310164 (= res!166616 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310165 () Bool)

(assert (=> b!310165 (= e!193679 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(assert (=> b!310165 e!193681))

(declare-fun res!166617 () Bool)

(assert (=> b!310165 (=> (not res!166617) (not e!193681))))

(assert (=> b!310165 (= res!166617 (= lt!151844 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151845 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310165 (= lt!151845 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310166 () Bool)

(declare-fun res!166613 () Bool)

(assert (=> b!310166 (=> (not res!166613) (not e!193678))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15810 (_ BitVec 32)) SeekEntryResult!2627)

(assert (=> b!310166 (= res!166613 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2627 i!1240)))))

(assert (= (and start!30908 res!166612) b!310159))

(assert (= (and b!310159 res!166615) b!310160))

(assert (= (and b!310160 res!166614) b!310164))

(assert (= (and b!310164 res!166616) b!310166))

(assert (= (and b!310166 res!166613) b!310162))

(assert (= (and b!310162 res!166611) b!310163))

(assert (= (and b!310163 res!166618) b!310157))

(assert (= (and b!310157 res!166620) b!310158))

(assert (= (and b!310158 res!166619) b!310165))

(assert (= (and b!310165 res!166617) b!310161))

(declare-fun m!320045 () Bool)

(assert (=> b!310166 m!320045))

(declare-fun m!320047 () Bool)

(assert (=> b!310162 m!320047))

(declare-fun m!320049 () Bool)

(assert (=> b!310163 m!320049))

(assert (=> b!310163 m!320049))

(declare-fun m!320051 () Bool)

(assert (=> b!310163 m!320051))

(declare-fun m!320053 () Bool)

(assert (=> b!310158 m!320053))

(declare-fun m!320055 () Bool)

(assert (=> b!310158 m!320055))

(declare-fun m!320057 () Bool)

(assert (=> b!310160 m!320057))

(declare-fun m!320059 () Bool)

(assert (=> start!30908 m!320059))

(declare-fun m!320061 () Bool)

(assert (=> start!30908 m!320061))

(declare-fun m!320063 () Bool)

(assert (=> b!310161 m!320063))

(declare-fun m!320065 () Bool)

(assert (=> b!310161 m!320065))

(declare-fun m!320067 () Bool)

(assert (=> b!310161 m!320067))

(declare-fun m!320069 () Bool)

(assert (=> b!310157 m!320069))

(declare-fun m!320071 () Bool)

(assert (=> b!310165 m!320071))

(declare-fun m!320073 () Bool)

(assert (=> b!310165 m!320073))

(declare-fun m!320075 () Bool)

(assert (=> b!310164 m!320075))

(push 1)

