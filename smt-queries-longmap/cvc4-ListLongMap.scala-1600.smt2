; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30276 () Bool)

(assert start!30276)

(declare-fun res!160518 () Bool)

(declare-fun e!190840 () Bool)

(assert (=> start!30276 (=> (not res!160518) (not e!190840))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30276 (= res!160518 (validMask!0 mask!3709))))

(assert (=> start!30276 e!190840))

(declare-datatypes ((array!15382 0))(
  ( (array!15383 (arr!7279 (Array (_ BitVec 32) (_ BitVec 64))) (size!7631 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15382)

(declare-fun array_inv!5242 (array!15382) Bool)

(assert (=> start!30276 (array_inv!5242 a!3293)))

(assert (=> start!30276 true))

(declare-fun b!303027 () Bool)

(declare-fun res!160521 () Bool)

(declare-fun e!190838 () Bool)

(assert (=> b!303027 (=> (not res!160521) (not e!190838))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303027 (= res!160521 (and (= (select (arr!7279 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7631 a!3293))))))

(declare-fun b!303028 () Bool)

(declare-fun res!160516 () Bool)

(assert (=> b!303028 (=> (not res!160516) (not e!190840))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303028 (= res!160516 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303029 () Bool)

(declare-fun res!160520 () Bool)

(assert (=> b!303029 (=> (not res!160520) (not e!190840))))

(assert (=> b!303029 (= res!160520 (and (= (size!7631 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7631 a!3293))))))

(declare-fun b!303030 () Bool)

(declare-fun res!160514 () Bool)

(assert (=> b!303030 (=> (not res!160514) (not e!190838))))

(declare-datatypes ((SeekEntryResult!2419 0))(
  ( (MissingZero!2419 (index!11852 (_ BitVec 32))) (Found!2419 (index!11853 (_ BitVec 32))) (Intermediate!2419 (undefined!3231 Bool) (index!11854 (_ BitVec 32)) (x!30116 (_ BitVec 32))) (Undefined!2419) (MissingVacant!2419 (index!11855 (_ BitVec 32))) )
))
(declare-fun lt!150159 () SeekEntryResult!2419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15382 (_ BitVec 32)) SeekEntryResult!2419)

(assert (=> b!303030 (= res!160514 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150159))))

(declare-fun b!303031 () Bool)

(assert (=> b!303031 (= e!190840 e!190838)))

(declare-fun res!160513 () Bool)

(assert (=> b!303031 (=> (not res!160513) (not e!190838))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303031 (= res!160513 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150159))))

(assert (=> b!303031 (= lt!150159 (Intermediate!2419 false resIndex!52 resX!52))))

(declare-fun b!303032 () Bool)

(declare-fun res!160517 () Bool)

(assert (=> b!303032 (=> (not res!160517) (not e!190840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15382 (_ BitVec 32)) Bool)

(assert (=> b!303032 (= res!160517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303033 () Bool)

(declare-fun res!160519 () Bool)

(assert (=> b!303033 (=> (not res!160519) (not e!190840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15382 (_ BitVec 32)) SeekEntryResult!2419)

(assert (=> b!303033 (= res!160519 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2419 i!1240)))))

(declare-fun b!303034 () Bool)

(declare-fun res!160515 () Bool)

(assert (=> b!303034 (=> (not res!160515) (not e!190840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303034 (= res!160515 (validKeyInArray!0 k!2441))))

(declare-fun b!303035 () Bool)

(assert (=> b!303035 (= e!190838 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7279 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7279 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7279 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(assert (= (and start!30276 res!160518) b!303029))

(assert (= (and b!303029 res!160520) b!303034))

(assert (= (and b!303034 res!160515) b!303028))

(assert (= (and b!303028 res!160516) b!303033))

(assert (= (and b!303033 res!160519) b!303032))

(assert (= (and b!303032 res!160517) b!303031))

(assert (= (and b!303031 res!160513) b!303027))

(assert (= (and b!303027 res!160521) b!303030))

(assert (= (and b!303030 res!160514) b!303035))

(declare-fun m!314449 () Bool)

(assert (=> b!303035 m!314449))

(declare-fun m!314451 () Bool)

(assert (=> b!303030 m!314451))

(declare-fun m!314453 () Bool)

(assert (=> b!303027 m!314453))

(declare-fun m!314455 () Bool)

(assert (=> b!303031 m!314455))

(assert (=> b!303031 m!314455))

(declare-fun m!314457 () Bool)

(assert (=> b!303031 m!314457))

(declare-fun m!314459 () Bool)

(assert (=> b!303028 m!314459))

(declare-fun m!314461 () Bool)

(assert (=> b!303032 m!314461))

(declare-fun m!314463 () Bool)

(assert (=> b!303034 m!314463))

(declare-fun m!314465 () Bool)

(assert (=> start!30276 m!314465))

(declare-fun m!314467 () Bool)

(assert (=> start!30276 m!314467))

(declare-fun m!314469 () Bool)

(assert (=> b!303033 m!314469))

(push 1)

(assert (not b!303034))

(assert (not b!303031))

(assert (not b!303033))

(assert (not start!30276))

(assert (not b!303028))

(assert (not b!303030))

(assert (not b!303032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

