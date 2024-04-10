; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30242 () Bool)

(assert start!30242)

(declare-fun b!302593 () Bool)

(declare-fun e!190710 () Bool)

(assert (=> b!302593 (= e!190710 false)))

(declare-datatypes ((array!15348 0))(
  ( (array!15349 (arr!7262 (Array (_ BitVec 32) (_ BitVec 64))) (size!7614 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15348)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2402 0))(
  ( (MissingZero!2402 (index!11784 (_ BitVec 32))) (Found!2402 (index!11785 (_ BitVec 32))) (Intermediate!2402 (undefined!3214 Bool) (index!11786 (_ BitVec 32)) (x!30059 (_ BitVec 32))) (Undefined!2402) (MissingVacant!2402 (index!11787 (_ BitVec 32))) )
))
(declare-fun lt!150108 () SeekEntryResult!2402)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15348 (_ BitVec 32)) SeekEntryResult!2402)

(assert (=> b!302593 (= lt!150108 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302594 () Bool)

(declare-fun res!160081 () Bool)

(assert (=> b!302594 (=> (not res!160081) (not e!190710))))

(declare-fun arrayContainsKey!0 (array!15348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302594 (= res!160081 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302595 () Bool)

(declare-fun res!160082 () Bool)

(assert (=> b!302595 (=> (not res!160082) (not e!190710))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302595 (= res!160082 (and (= (size!7614 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7614 a!3293))))))

(declare-fun res!160084 () Bool)

(assert (=> start!30242 (=> (not res!160084) (not e!190710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30242 (= res!160084 (validMask!0 mask!3709))))

(assert (=> start!30242 e!190710))

(declare-fun array_inv!5225 (array!15348) Bool)

(assert (=> start!30242 (array_inv!5225 a!3293)))

(assert (=> start!30242 true))

(declare-fun b!302596 () Bool)

(declare-fun res!160085 () Bool)

(assert (=> b!302596 (=> (not res!160085) (not e!190710))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302596 (= res!160085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2402 false resIndex!52 resX!52)))))

(declare-fun b!302597 () Bool)

(declare-fun res!160083 () Bool)

(assert (=> b!302597 (=> (not res!160083) (not e!190710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302597 (= res!160083 (validKeyInArray!0 k!2441))))

(declare-fun b!302598 () Bool)

(declare-fun res!160086 () Bool)

(assert (=> b!302598 (=> (not res!160086) (not e!190710))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15348 (_ BitVec 32)) SeekEntryResult!2402)

(assert (=> b!302598 (= res!160086 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2402 i!1240)))))

(declare-fun b!302599 () Bool)

(declare-fun res!160080 () Bool)

(assert (=> b!302599 (=> (not res!160080) (not e!190710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15348 (_ BitVec 32)) Bool)

(assert (=> b!302599 (= res!160080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302600 () Bool)

(declare-fun res!160079 () Bool)

(assert (=> b!302600 (=> (not res!160079) (not e!190710))))

(assert (=> b!302600 (= res!160079 (and (= (select (arr!7262 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7614 a!3293))))))

(assert (= (and start!30242 res!160084) b!302595))

(assert (= (and b!302595 res!160082) b!302597))

(assert (= (and b!302597 res!160083) b!302594))

(assert (= (and b!302594 res!160081) b!302598))

(assert (= (and b!302598 res!160086) b!302599))

(assert (= (and b!302599 res!160080) b!302596))

(assert (= (and b!302596 res!160085) b!302600))

(assert (= (and b!302600 res!160079) b!302593))

(declare-fun m!314093 () Bool)

(assert (=> b!302594 m!314093))

(declare-fun m!314095 () Bool)

(assert (=> b!302597 m!314095))

(declare-fun m!314097 () Bool)

(assert (=> b!302593 m!314097))

(declare-fun m!314099 () Bool)

(assert (=> b!302599 m!314099))

(declare-fun m!314101 () Bool)

(assert (=> b!302596 m!314101))

(assert (=> b!302596 m!314101))

(declare-fun m!314103 () Bool)

(assert (=> b!302596 m!314103))

(declare-fun m!314105 () Bool)

(assert (=> start!30242 m!314105))

(declare-fun m!314107 () Bool)

(assert (=> start!30242 m!314107))

(declare-fun m!314109 () Bool)

(assert (=> b!302598 m!314109))

(declare-fun m!314111 () Bool)

(assert (=> b!302600 m!314111))

(push 1)

(assert (not b!302598))

(assert (not b!302594))

(assert (not b!302597))

(assert (not b!302593))

(assert (not b!302599))

(assert (not b!302596))

(assert (not start!30242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

