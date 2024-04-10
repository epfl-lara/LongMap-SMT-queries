; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30650 () Bool)

(assert start!30650)

(declare-fun b!307608 () Bool)

(declare-fun res!164369 () Bool)

(declare-fun e!192557 () Bool)

(assert (=> b!307608 (=> (not res!164369) (not e!192557))))

(declare-datatypes ((array!15654 0))(
  ( (array!15655 (arr!7412 (Array (_ BitVec 32) (_ BitVec 64))) (size!7764 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15654)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15654 (_ BitVec 32)) Bool)

(assert (=> b!307608 (= res!164369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307609 () Bool)

(declare-fun res!164367 () Bool)

(assert (=> b!307609 (=> (not res!164367) (not e!192557))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307609 (= res!164367 (validKeyInArray!0 k!2441))))

(declare-fun b!307610 () Bool)

(declare-fun res!164365 () Bool)

(declare-fun e!192558 () Bool)

(assert (=> b!307610 (=> (not res!164365) (not e!192558))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307610 (= res!164365 (and (= (select (arr!7412 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7764 a!3293))))))

(declare-fun res!164364 () Bool)

(assert (=> start!30650 (=> (not res!164364) (not e!192557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30650 (= res!164364 (validMask!0 mask!3709))))

(assert (=> start!30650 e!192557))

(declare-fun array_inv!5375 (array!15654) Bool)

(assert (=> start!30650 (array_inv!5375 a!3293)))

(assert (=> start!30650 true))

(declare-fun b!307611 () Bool)

(declare-fun res!164368 () Bool)

(assert (=> b!307611 (=> (not res!164368) (not e!192557))))

(declare-datatypes ((SeekEntryResult!2552 0))(
  ( (MissingZero!2552 (index!12384 (_ BitVec 32))) (Found!2552 (index!12385 (_ BitVec 32))) (Intermediate!2552 (undefined!3364 Bool) (index!12386 (_ BitVec 32)) (x!30627 (_ BitVec 32))) (Undefined!2552) (MissingVacant!2552 (index!12387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15654 (_ BitVec 32)) SeekEntryResult!2552)

(assert (=> b!307611 (= res!164368 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2552 i!1240)))))

(declare-fun b!307612 () Bool)

(assert (=> b!307612 (= e!192558 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7412 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307613 () Bool)

(declare-fun res!164366 () Bool)

(assert (=> b!307613 (=> (not res!164366) (not e!192558))))

(declare-fun lt!151152 () SeekEntryResult!2552)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15654 (_ BitVec 32)) SeekEntryResult!2552)

(assert (=> b!307613 (= res!164366 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151152))))

(declare-fun b!307614 () Bool)

(assert (=> b!307614 (= e!192557 e!192558)))

(declare-fun res!164363 () Bool)

(assert (=> b!307614 (=> (not res!164363) (not e!192558))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307614 (= res!164363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151152))))

(assert (=> b!307614 (= lt!151152 (Intermediate!2552 false resIndex!52 resX!52))))

(declare-fun b!307615 () Bool)

(declare-fun res!164370 () Bool)

(assert (=> b!307615 (=> (not res!164370) (not e!192557))))

(assert (=> b!307615 (= res!164370 (and (= (size!7764 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7764 a!3293))))))

(declare-fun b!307616 () Bool)

(declare-fun res!164362 () Bool)

(assert (=> b!307616 (=> (not res!164362) (not e!192557))))

(declare-fun arrayContainsKey!0 (array!15654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307616 (= res!164362 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30650 res!164364) b!307615))

(assert (= (and b!307615 res!164370) b!307609))

(assert (= (and b!307609 res!164367) b!307616))

(assert (= (and b!307616 res!164362) b!307611))

(assert (= (and b!307611 res!164368) b!307608))

(assert (= (and b!307608 res!164369) b!307614))

(assert (= (and b!307614 res!164363) b!307610))

(assert (= (and b!307610 res!164365) b!307613))

(assert (= (and b!307613 res!164366) b!307612))

(declare-fun m!317885 () Bool)

(assert (=> b!307616 m!317885))

(declare-fun m!317887 () Bool)

(assert (=> b!307610 m!317887))

(declare-fun m!317889 () Bool)

(assert (=> b!307614 m!317889))

(assert (=> b!307614 m!317889))

(declare-fun m!317891 () Bool)

(assert (=> b!307614 m!317891))

(declare-fun m!317893 () Bool)

(assert (=> b!307609 m!317893))

(declare-fun m!317895 () Bool)

(assert (=> b!307608 m!317895))

(declare-fun m!317897 () Bool)

(assert (=> b!307612 m!317897))

(declare-fun m!317899 () Bool)

(assert (=> start!30650 m!317899))

(declare-fun m!317901 () Bool)

(assert (=> start!30650 m!317901))

(declare-fun m!317903 () Bool)

(assert (=> b!307611 m!317903))

(declare-fun m!317905 () Bool)

(assert (=> b!307613 m!317905))

(push 1)

(assert (not b!307609))

(assert (not start!30650))

(assert (not b!307613))

(assert (not b!307616))

(assert (not b!307614))

(assert (not b!307611))

(assert (not b!307608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

