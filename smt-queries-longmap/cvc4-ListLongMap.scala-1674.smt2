; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30936 () Bool)

(assert start!30936)

(declare-fun b!310577 () Bool)

(declare-fun res!167039 () Bool)

(declare-fun e!193890 () Bool)

(assert (=> b!310577 (=> (not res!167039) (not e!193890))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310577 (= res!167039 (validKeyInArray!0 k!2441))))

(declare-fun b!310578 () Bool)

(declare-fun e!193891 () Bool)

(assert (=> b!310578 (= e!193891 (not true))))

(declare-fun e!193887 () Bool)

(assert (=> b!310578 e!193887))

(declare-fun res!167038 () Bool)

(assert (=> b!310578 (=> (not res!167038) (not e!193887))))

(declare-datatypes ((array!15838 0))(
  ( (array!15839 (arr!7501 (Array (_ BitVec 32) (_ BitVec 64))) (size!7853 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15838)

(declare-datatypes ((SeekEntryResult!2641 0))(
  ( (MissingZero!2641 (index!12740 (_ BitVec 32))) (Found!2641 (index!12741 (_ BitVec 32))) (Intermediate!2641 (undefined!3453 Bool) (index!12742 (_ BitVec 32)) (x!30966 (_ BitVec 32))) (Undefined!2641) (MissingVacant!2641 (index!12743 (_ BitVec 32))) )
))
(declare-fun lt!152013 () SeekEntryResult!2641)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!152010 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15838 (_ BitVec 32)) SeekEntryResult!2641)

(assert (=> b!310578 (= res!167038 (= lt!152013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152010 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310578 (= lt!152010 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310579 () Bool)

(declare-fun res!167037 () Bool)

(assert (=> b!310579 (=> (not res!167037) (not e!193890))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310579 (= res!167037 (and (= (size!7853 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7853 a!3293))))))

(declare-fun b!310580 () Bool)

(declare-fun e!193889 () Bool)

(assert (=> b!310580 (= e!193889 e!193891)))

(declare-fun res!167033 () Bool)

(assert (=> b!310580 (=> (not res!167033) (not e!193891))))

(declare-fun lt!152011 () SeekEntryResult!2641)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310580 (= res!167033 (and (= lt!152013 lt!152011) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7501 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310580 (= lt!152013 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310581 () Bool)

(declare-fun lt!152012 () array!15838)

(assert (=> b!310581 (= e!193887 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152012 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152010 k!2441 lt!152012 mask!3709)))))

(assert (=> b!310581 (= lt!152012 (array!15839 (store (arr!7501 a!3293) i!1240 k!2441) (size!7853 a!3293)))))

(declare-fun b!310582 () Bool)

(declare-fun res!167040 () Bool)

(assert (=> b!310582 (=> (not res!167040) (not e!193890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15838 (_ BitVec 32)) Bool)

(assert (=> b!310582 (= res!167040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!167032 () Bool)

(assert (=> start!30936 (=> (not res!167032) (not e!193890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30936 (= res!167032 (validMask!0 mask!3709))))

(assert (=> start!30936 e!193890))

(declare-fun array_inv!5464 (array!15838) Bool)

(assert (=> start!30936 (array_inv!5464 a!3293)))

(assert (=> start!30936 true))

(declare-fun b!310583 () Bool)

(assert (=> b!310583 (= e!193890 e!193889)))

(declare-fun res!167036 () Bool)

(assert (=> b!310583 (=> (not res!167036) (not e!193889))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310583 (= res!167036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152011))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310583 (= lt!152011 (Intermediate!2641 false resIndex!52 resX!52))))

(declare-fun b!310584 () Bool)

(declare-fun res!167031 () Bool)

(assert (=> b!310584 (=> (not res!167031) (not e!193889))))

(assert (=> b!310584 (= res!167031 (and (= (select (arr!7501 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7853 a!3293))))))

(declare-fun b!310585 () Bool)

(declare-fun res!167034 () Bool)

(assert (=> b!310585 (=> (not res!167034) (not e!193890))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15838 (_ BitVec 32)) SeekEntryResult!2641)

(assert (=> b!310585 (= res!167034 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2641 i!1240)))))

(declare-fun b!310586 () Bool)

(declare-fun res!167035 () Bool)

(assert (=> b!310586 (=> (not res!167035) (not e!193890))))

(declare-fun arrayContainsKey!0 (array!15838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310586 (= res!167035 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30936 res!167032) b!310579))

(assert (= (and b!310579 res!167037) b!310577))

(assert (= (and b!310577 res!167039) b!310586))

(assert (= (and b!310586 res!167035) b!310585))

(assert (= (and b!310585 res!167034) b!310582))

(assert (= (and b!310582 res!167040) b!310583))

(assert (= (and b!310583 res!167036) b!310584))

(assert (= (and b!310584 res!167031) b!310580))

(assert (= (and b!310580 res!167033) b!310578))

(assert (= (and b!310578 res!167038) b!310581))

(declare-fun m!320493 () Bool)

(assert (=> b!310578 m!320493))

(declare-fun m!320495 () Bool)

(assert (=> b!310578 m!320495))

(declare-fun m!320497 () Bool)

(assert (=> b!310577 m!320497))

(declare-fun m!320499 () Bool)

(assert (=> b!310581 m!320499))

(declare-fun m!320501 () Bool)

(assert (=> b!310581 m!320501))

(declare-fun m!320503 () Bool)

(assert (=> b!310581 m!320503))

(declare-fun m!320505 () Bool)

(assert (=> b!310580 m!320505))

(declare-fun m!320507 () Bool)

(assert (=> b!310580 m!320507))

(declare-fun m!320509 () Bool)

(assert (=> b!310584 m!320509))

(declare-fun m!320511 () Bool)

(assert (=> b!310586 m!320511))

(declare-fun m!320513 () Bool)

(assert (=> start!30936 m!320513))

(declare-fun m!320515 () Bool)

(assert (=> start!30936 m!320515))

(declare-fun m!320517 () Bool)

(assert (=> b!310585 m!320517))

(declare-fun m!320519 () Bool)

(assert (=> b!310582 m!320519))

(declare-fun m!320521 () Bool)

(assert (=> b!310583 m!320521))

(assert (=> b!310583 m!320521))

(declare-fun m!320523 () Bool)

(assert (=> b!310583 m!320523))

(push 1)

