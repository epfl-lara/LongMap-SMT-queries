; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30642 () Bool)

(assert start!30642)

(declare-fun b!307501 () Bool)

(declare-fun res!164259 () Bool)

(declare-fun e!192522 () Bool)

(assert (=> b!307501 (=> (not res!164259) (not e!192522))))

(declare-datatypes ((array!15646 0))(
  ( (array!15647 (arr!7408 (Array (_ BitVec 32) (_ BitVec 64))) (size!7760 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15646)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2548 0))(
  ( (MissingZero!2548 (index!12368 (_ BitVec 32))) (Found!2548 (index!12369 (_ BitVec 32))) (Intermediate!2548 (undefined!3360 Bool) (index!12370 (_ BitVec 32)) (x!30607 (_ BitVec 32))) (Undefined!2548) (MissingVacant!2548 (index!12371 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15646 (_ BitVec 32)) SeekEntryResult!2548)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307501 (= res!164259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2548 false resIndex!52 resX!52)))))

(declare-fun b!307502 () Bool)

(declare-fun res!164258 () Bool)

(assert (=> b!307502 (=> (not res!164258) (not e!192522))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307502 (= res!164258 (and (= (size!7760 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7760 a!3293))))))

(declare-fun res!164257 () Bool)

(assert (=> start!30642 (=> (not res!164257) (not e!192522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30642 (= res!164257 (validMask!0 mask!3709))))

(assert (=> start!30642 e!192522))

(declare-fun array_inv!5371 (array!15646) Bool)

(assert (=> start!30642 (array_inv!5371 a!3293)))

(assert (=> start!30642 true))

(declare-fun b!307503 () Bool)

(assert (=> b!307503 (= e!192522 false)))

(declare-fun lt!151140 () SeekEntryResult!2548)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307503 (= lt!151140 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307504 () Bool)

(declare-fun res!164262 () Bool)

(assert (=> b!307504 (=> (not res!164262) (not e!192522))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15646 (_ BitVec 32)) SeekEntryResult!2548)

(assert (=> b!307504 (= res!164262 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2548 i!1240)))))

(declare-fun b!307505 () Bool)

(declare-fun res!164255 () Bool)

(assert (=> b!307505 (=> (not res!164255) (not e!192522))))

(assert (=> b!307505 (= res!164255 (and (= (select (arr!7408 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7760 a!3293))))))

(declare-fun b!307506 () Bool)

(declare-fun res!164261 () Bool)

(assert (=> b!307506 (=> (not res!164261) (not e!192522))))

(declare-fun arrayContainsKey!0 (array!15646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307506 (= res!164261 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307507 () Bool)

(declare-fun res!164256 () Bool)

(assert (=> b!307507 (=> (not res!164256) (not e!192522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15646 (_ BitVec 32)) Bool)

(assert (=> b!307507 (= res!164256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307508 () Bool)

(declare-fun res!164260 () Bool)

(assert (=> b!307508 (=> (not res!164260) (not e!192522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307508 (= res!164260 (validKeyInArray!0 k!2441))))

(assert (= (and start!30642 res!164257) b!307502))

(assert (= (and b!307502 res!164258) b!307508))

(assert (= (and b!307508 res!164260) b!307506))

(assert (= (and b!307506 res!164261) b!307504))

(assert (= (and b!307504 res!164262) b!307507))

(assert (= (and b!307507 res!164256) b!307501))

(assert (= (and b!307501 res!164259) b!307505))

(assert (= (and b!307505 res!164255) b!307503))

(declare-fun m!317799 () Bool)

(assert (=> b!307503 m!317799))

(declare-fun m!317801 () Bool)

(assert (=> start!30642 m!317801))

(declare-fun m!317803 () Bool)

(assert (=> start!30642 m!317803))

(declare-fun m!317805 () Bool)

(assert (=> b!307504 m!317805))

(declare-fun m!317807 () Bool)

(assert (=> b!307501 m!317807))

(assert (=> b!307501 m!317807))

(declare-fun m!317809 () Bool)

(assert (=> b!307501 m!317809))

(declare-fun m!317811 () Bool)

(assert (=> b!307508 m!317811))

(declare-fun m!317813 () Bool)

(assert (=> b!307506 m!317813))

(declare-fun m!317815 () Bool)

(assert (=> b!307505 m!317815))

(declare-fun m!317817 () Bool)

(assert (=> b!307507 m!317817))

(push 1)

(assert (not b!307504))

(assert (not b!307503))

(assert (not b!307506))

(assert (not b!307508))

(assert (not b!307507))

(assert (not b!307501))

(assert (not start!30642))

(check-sat)

