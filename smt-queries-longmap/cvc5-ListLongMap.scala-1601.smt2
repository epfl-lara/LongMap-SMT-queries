; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30278 () Bool)

(assert start!30278)

(declare-fun b!303052 () Bool)

(declare-fun res!160542 () Bool)

(declare-fun e!190845 () Bool)

(assert (=> b!303052 (=> (not res!160542) (not e!190845))))

(declare-datatypes ((array!15384 0))(
  ( (array!15385 (arr!7280 (Array (_ BitVec 32) (_ BitVec 64))) (size!7632 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15384)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!303052 (= res!160542 (and (= (select (arr!7280 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7632 a!3293))))))

(declare-fun b!303053 () Bool)

(declare-fun res!160541 () Bool)

(assert (=> b!303053 (=> (not res!160541) (not e!190845))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303053 (= res!160541 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303054 () Bool)

(declare-fun res!160538 () Bool)

(assert (=> b!303054 (=> (not res!160538) (not e!190845))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!303054 (= res!160538 (and (= (size!7632 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7632 a!3293))))))

(declare-fun b!303055 () Bool)

(declare-fun res!160543 () Bool)

(assert (=> b!303055 (=> (not res!160543) (not e!190845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303055 (= res!160543 (validKeyInArray!0 k!2441))))

(declare-fun b!303056 () Bool)

(declare-fun res!160539 () Bool)

(assert (=> b!303056 (=> (not res!160539) (not e!190845))))

(declare-datatypes ((SeekEntryResult!2420 0))(
  ( (MissingZero!2420 (index!11856 (_ BitVec 32))) (Found!2420 (index!11857 (_ BitVec 32))) (Intermediate!2420 (undefined!3232 Bool) (index!11858 (_ BitVec 32)) (x!30125 (_ BitVec 32))) (Undefined!2420) (MissingVacant!2420 (index!11859 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15384 (_ BitVec 32)) SeekEntryResult!2420)

(assert (=> b!303056 (= res!160539 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2420 i!1240)))))

(declare-fun b!303057 () Bool)

(declare-fun res!160544 () Bool)

(assert (=> b!303057 (=> (not res!160544) (not e!190845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15384 (_ BitVec 32)) Bool)

(assert (=> b!303057 (= res!160544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303058 () Bool)

(assert (=> b!303058 (= e!190845 false)))

(declare-fun lt!150162 () SeekEntryResult!2420)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15384 (_ BitVec 32)) SeekEntryResult!2420)

(assert (=> b!303058 (= lt!150162 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!160545 () Bool)

(assert (=> start!30278 (=> (not res!160545) (not e!190845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30278 (= res!160545 (validMask!0 mask!3709))))

(assert (=> start!30278 e!190845))

(declare-fun array_inv!5243 (array!15384) Bool)

(assert (=> start!30278 (array_inv!5243 a!3293)))

(assert (=> start!30278 true))

(declare-fun b!303059 () Bool)

(declare-fun res!160540 () Bool)

(assert (=> b!303059 (=> (not res!160540) (not e!190845))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303059 (= res!160540 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2420 false resIndex!52 resX!52)))))

(assert (= (and start!30278 res!160545) b!303054))

(assert (= (and b!303054 res!160538) b!303055))

(assert (= (and b!303055 res!160543) b!303053))

(assert (= (and b!303053 res!160541) b!303056))

(assert (= (and b!303056 res!160539) b!303057))

(assert (= (and b!303057 res!160544) b!303059))

(assert (= (and b!303059 res!160540) b!303052))

(assert (= (and b!303052 res!160542) b!303058))

(declare-fun m!314471 () Bool)

(assert (=> start!30278 m!314471))

(declare-fun m!314473 () Bool)

(assert (=> start!30278 m!314473))

(declare-fun m!314475 () Bool)

(assert (=> b!303059 m!314475))

(assert (=> b!303059 m!314475))

(declare-fun m!314477 () Bool)

(assert (=> b!303059 m!314477))

(declare-fun m!314479 () Bool)

(assert (=> b!303056 m!314479))

(declare-fun m!314481 () Bool)

(assert (=> b!303053 m!314481))

(declare-fun m!314483 () Bool)

(assert (=> b!303058 m!314483))

(declare-fun m!314485 () Bool)

(assert (=> b!303055 m!314485))

(declare-fun m!314487 () Bool)

(assert (=> b!303052 m!314487))

(declare-fun m!314489 () Bool)

(assert (=> b!303057 m!314489))

(push 1)

(assert (not b!303055))

(assert (not b!303057))

(assert (not b!303059))

(assert (not start!30278))

(assert (not b!303053))

(assert (not b!303058))

(assert (not b!303056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

