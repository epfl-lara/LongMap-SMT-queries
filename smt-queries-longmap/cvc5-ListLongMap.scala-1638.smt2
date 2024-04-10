; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30608 () Bool)

(assert start!30608)

(declare-fun b!307068 () Bool)

(declare-fun res!163822 () Bool)

(declare-fun e!192397 () Bool)

(assert (=> b!307068 (=> (not res!163822) (not e!192397))))

(declare-datatypes ((array!15612 0))(
  ( (array!15613 (arr!7391 (Array (_ BitVec 32) (_ BitVec 64))) (size!7743 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15612)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307068 (= res!163822 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307070 () Bool)

(declare-fun res!163825 () Bool)

(assert (=> b!307070 (=> (not res!163825) (not e!192397))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307070 (= res!163825 (and (= (size!7743 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7743 a!3293))))))

(declare-fun b!307071 () Bool)

(declare-fun res!163828 () Bool)

(declare-fun e!192396 () Bool)

(assert (=> b!307071 (=> (not res!163828) (not e!192396))))

(declare-datatypes ((SeekEntryResult!2531 0))(
  ( (MissingZero!2531 (index!12300 (_ BitVec 32))) (Found!2531 (index!12301 (_ BitVec 32))) (Intermediate!2531 (undefined!3343 Bool) (index!12302 (_ BitVec 32)) (x!30550 (_ BitVec 32))) (Undefined!2531) (MissingVacant!2531 (index!12303 (_ BitVec 32))) )
))
(declare-fun lt!151089 () SeekEntryResult!2531)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15612 (_ BitVec 32)) SeekEntryResult!2531)

(assert (=> b!307071 (= res!163828 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151089))))

(declare-fun b!307072 () Bool)

(declare-fun res!163830 () Bool)

(assert (=> b!307072 (=> (not res!163830) (not e!192397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15612 (_ BitVec 32)) Bool)

(assert (=> b!307072 (= res!163830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307073 () Bool)

(declare-fun res!163829 () Bool)

(assert (=> b!307073 (=> (not res!163829) (not e!192397))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15612 (_ BitVec 32)) SeekEntryResult!2531)

(assert (=> b!307073 (= res!163829 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2531 i!1240)))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun b!307074 () Bool)

(assert (=> b!307074 (= e!192396 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7391 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun res!163826 () Bool)

(assert (=> start!30608 (=> (not res!163826) (not e!192397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30608 (= res!163826 (validMask!0 mask!3709))))

(assert (=> start!30608 e!192397))

(declare-fun array_inv!5354 (array!15612) Bool)

(assert (=> start!30608 (array_inv!5354 a!3293)))

(assert (=> start!30608 true))

(declare-fun b!307069 () Bool)

(assert (=> b!307069 (= e!192397 e!192396)))

(declare-fun res!163824 () Bool)

(assert (=> b!307069 (=> (not res!163824) (not e!192396))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307069 (= res!163824 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151089))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307069 (= lt!151089 (Intermediate!2531 false resIndex!52 resX!52))))

(declare-fun b!307075 () Bool)

(declare-fun res!163827 () Bool)

(assert (=> b!307075 (=> (not res!163827) (not e!192396))))

(assert (=> b!307075 (= res!163827 (and (= (select (arr!7391 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7743 a!3293))))))

(declare-fun b!307076 () Bool)

(declare-fun res!163823 () Bool)

(assert (=> b!307076 (=> (not res!163823) (not e!192397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307076 (= res!163823 (validKeyInArray!0 k!2441))))

(assert (= (and start!30608 res!163826) b!307070))

(assert (= (and b!307070 res!163825) b!307076))

(assert (= (and b!307076 res!163823) b!307068))

(assert (= (and b!307068 res!163822) b!307073))

(assert (= (and b!307073 res!163829) b!307072))

(assert (= (and b!307072 res!163830) b!307069))

(assert (= (and b!307069 res!163824) b!307075))

(assert (= (and b!307075 res!163827) b!307071))

(assert (= (and b!307071 res!163828) b!307074))

(declare-fun m!317441 () Bool)

(assert (=> b!307068 m!317441))

(declare-fun m!317443 () Bool)

(assert (=> b!307073 m!317443))

(declare-fun m!317445 () Bool)

(assert (=> b!307076 m!317445))

(declare-fun m!317447 () Bool)

(assert (=> b!307069 m!317447))

(assert (=> b!307069 m!317447))

(declare-fun m!317449 () Bool)

(assert (=> b!307069 m!317449))

(declare-fun m!317451 () Bool)

(assert (=> b!307071 m!317451))

(declare-fun m!317453 () Bool)

(assert (=> b!307074 m!317453))

(declare-fun m!317455 () Bool)

(assert (=> start!30608 m!317455))

(declare-fun m!317457 () Bool)

(assert (=> start!30608 m!317457))

(declare-fun m!317459 () Bool)

(assert (=> b!307075 m!317459))

(declare-fun m!317461 () Bool)

(assert (=> b!307072 m!317461))

(push 1)

