; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30950 () Bool)

(assert start!30950)

(declare-fun lt!152097 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!310787 () Bool)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15852 0))(
  ( (array!15853 (arr!7508 (Array (_ BitVec 32) (_ BitVec 64))) (size!7860 (_ BitVec 32))) )
))
(declare-fun lt!152094 () array!15852)

(declare-fun e!193996 () Bool)

(declare-datatypes ((SeekEntryResult!2648 0))(
  ( (MissingZero!2648 (index!12768 (_ BitVec 32))) (Found!2648 (index!12769 (_ BitVec 32))) (Intermediate!2648 (undefined!3460 Bool) (index!12770 (_ BitVec 32)) (x!30997 (_ BitVec 32))) (Undefined!2648) (MissingVacant!2648 (index!12771 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15852 (_ BitVec 32)) SeekEntryResult!2648)

(assert (=> b!310787 (= e!193996 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152094 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152097 k!2441 lt!152094 mask!3709)))))

(declare-fun a!3293 () array!15852)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310787 (= lt!152094 (array!15853 (store (arr!7508 a!3293) i!1240 k!2441) (size!7860 a!3293)))))

(declare-fun b!310788 () Bool)

(declare-fun e!193995 () Bool)

(assert (=> b!310788 (= e!193995 (not true))))

(assert (=> b!310788 e!193996))

(declare-fun res!167243 () Bool)

(assert (=> b!310788 (=> (not res!167243) (not e!193996))))

(declare-fun lt!152095 () SeekEntryResult!2648)

(assert (=> b!310788 (= res!167243 (= lt!152095 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152097 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310788 (= lt!152097 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310789 () Bool)

(declare-fun res!167244 () Bool)

(declare-fun e!193992 () Bool)

(assert (=> b!310789 (=> (not res!167244) (not e!193992))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15852 (_ BitVec 32)) SeekEntryResult!2648)

(assert (=> b!310789 (= res!167244 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2648 i!1240)))))

(declare-fun res!167241 () Bool)

(assert (=> start!30950 (=> (not res!167241) (not e!193992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30950 (= res!167241 (validMask!0 mask!3709))))

(assert (=> start!30950 e!193992))

(declare-fun array_inv!5471 (array!15852) Bool)

(assert (=> start!30950 (array_inv!5471 a!3293)))

(assert (=> start!30950 true))

(declare-fun b!310790 () Bool)

(declare-fun e!193993 () Bool)

(assert (=> b!310790 (= e!193992 e!193993)))

(declare-fun res!167242 () Bool)

(assert (=> b!310790 (=> (not res!167242) (not e!193993))))

(declare-fun lt!152096 () SeekEntryResult!2648)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310790 (= res!167242 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152096))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310790 (= lt!152096 (Intermediate!2648 false resIndex!52 resX!52))))

(declare-fun b!310791 () Bool)

(assert (=> b!310791 (= e!193993 e!193995)))

(declare-fun res!167250 () Bool)

(assert (=> b!310791 (=> (not res!167250) (not e!193995))))

(assert (=> b!310791 (= res!167250 (and (= lt!152095 lt!152096) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7508 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310791 (= lt!152095 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310792 () Bool)

(declare-fun res!167249 () Bool)

(assert (=> b!310792 (=> (not res!167249) (not e!193992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310792 (= res!167249 (validKeyInArray!0 k!2441))))

(declare-fun b!310793 () Bool)

(declare-fun res!167248 () Bool)

(assert (=> b!310793 (=> (not res!167248) (not e!193992))))

(assert (=> b!310793 (= res!167248 (and (= (size!7860 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7860 a!3293))))))

(declare-fun b!310794 () Bool)

(declare-fun res!167245 () Bool)

(assert (=> b!310794 (=> (not res!167245) (not e!193992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15852 (_ BitVec 32)) Bool)

(assert (=> b!310794 (= res!167245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310795 () Bool)

(declare-fun res!167247 () Bool)

(assert (=> b!310795 (=> (not res!167247) (not e!193993))))

(assert (=> b!310795 (= res!167247 (and (= (select (arr!7508 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7860 a!3293))))))

(declare-fun b!310796 () Bool)

(declare-fun res!167246 () Bool)

(assert (=> b!310796 (=> (not res!167246) (not e!193992))))

(declare-fun arrayContainsKey!0 (array!15852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310796 (= res!167246 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30950 res!167241) b!310793))

(assert (= (and b!310793 res!167248) b!310792))

(assert (= (and b!310792 res!167249) b!310796))

(assert (= (and b!310796 res!167246) b!310789))

(assert (= (and b!310789 res!167244) b!310794))

(assert (= (and b!310794 res!167245) b!310790))

(assert (= (and b!310790 res!167242) b!310795))

(assert (= (and b!310795 res!167247) b!310791))

(assert (= (and b!310791 res!167250) b!310788))

(assert (= (and b!310788 res!167243) b!310787))

(declare-fun m!320717 () Bool)

(assert (=> b!310787 m!320717))

(declare-fun m!320719 () Bool)

(assert (=> b!310787 m!320719))

(declare-fun m!320721 () Bool)

(assert (=> b!310787 m!320721))

(declare-fun m!320723 () Bool)

(assert (=> start!30950 m!320723))

(declare-fun m!320725 () Bool)

(assert (=> start!30950 m!320725))

(declare-fun m!320727 () Bool)

(assert (=> b!310794 m!320727))

(declare-fun m!320729 () Bool)

(assert (=> b!310790 m!320729))

(assert (=> b!310790 m!320729))

(declare-fun m!320731 () Bool)

(assert (=> b!310790 m!320731))

(declare-fun m!320733 () Bool)

(assert (=> b!310789 m!320733))

(declare-fun m!320735 () Bool)

(assert (=> b!310796 m!320735))

(declare-fun m!320737 () Bool)

(assert (=> b!310788 m!320737))

(declare-fun m!320739 () Bool)

(assert (=> b!310788 m!320739))

(declare-fun m!320741 () Bool)

(assert (=> b!310791 m!320741))

(declare-fun m!320743 () Bool)

(assert (=> b!310791 m!320743))

(declare-fun m!320745 () Bool)

(assert (=> b!310795 m!320745))

(declare-fun m!320747 () Bool)

(assert (=> b!310792 m!320747))

(push 1)

