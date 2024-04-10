; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30240 () Bool)

(assert start!30240)

(declare-fun b!302568 () Bool)

(declare-fun res!160054 () Bool)

(declare-fun e!190703 () Bool)

(assert (=> b!302568 (=> (not res!160054) (not e!190703))))

(declare-datatypes ((array!15346 0))(
  ( (array!15347 (arr!7261 (Array (_ BitVec 32) (_ BitVec 64))) (size!7613 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15346)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2401 0))(
  ( (MissingZero!2401 (index!11780 (_ BitVec 32))) (Found!2401 (index!11781 (_ BitVec 32))) (Intermediate!2401 (undefined!3213 Bool) (index!11782 (_ BitVec 32)) (x!30050 (_ BitVec 32))) (Undefined!2401) (MissingVacant!2401 (index!11783 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15346 (_ BitVec 32)) SeekEntryResult!2401)

(assert (=> b!302568 (= res!160054 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2401 i!1240)))))

(declare-fun b!302569 () Bool)

(declare-fun res!160061 () Bool)

(assert (=> b!302569 (=> (not res!160061) (not e!190703))))

(assert (=> b!302569 (= res!160061 (and (= (size!7613 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7613 a!3293))))))

(declare-fun b!302570 () Bool)

(declare-fun res!160056 () Bool)

(assert (=> b!302570 (=> (not res!160056) (not e!190703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15346 (_ BitVec 32)) Bool)

(assert (=> b!302570 (= res!160056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302571 () Bool)

(declare-fun res!160057 () Bool)

(assert (=> b!302571 (=> (not res!160057) (not e!190703))))

(declare-fun arrayContainsKey!0 (array!15346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302571 (= res!160057 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302572 () Bool)

(declare-fun res!160058 () Bool)

(declare-fun e!190705 () Bool)

(assert (=> b!302572 (=> (not res!160058) (not e!190705))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302572 (= res!160058 (and (= (select (arr!7261 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7613 a!3293))))))

(declare-fun b!302573 () Bool)

(assert (=> b!302573 (= e!190703 e!190705)))

(declare-fun res!160059 () Bool)

(assert (=> b!302573 (=> (not res!160059) (not e!190705))))

(declare-fun lt!150105 () SeekEntryResult!2401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15346 (_ BitVec 32)) SeekEntryResult!2401)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302573 (= res!160059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150105))))

(assert (=> b!302573 (= lt!150105 (Intermediate!2401 false resIndex!52 resX!52))))

(declare-fun res!160062 () Bool)

(assert (=> start!30240 (=> (not res!160062) (not e!190703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30240 (= res!160062 (validMask!0 mask!3709))))

(assert (=> start!30240 e!190703))

(declare-fun array_inv!5224 (array!15346) Bool)

(assert (=> start!30240 (array_inv!5224 a!3293)))

(assert (=> start!30240 true))

(declare-fun b!302574 () Bool)

(declare-fun res!160055 () Bool)

(assert (=> b!302574 (=> (not res!160055) (not e!190703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302574 (= res!160055 (validKeyInArray!0 k!2441))))

(declare-fun b!302575 () Bool)

(assert (=> b!302575 (= e!190705 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7261 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7261 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7261 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!302576 () Bool)

(declare-fun res!160060 () Bool)

(assert (=> b!302576 (=> (not res!160060) (not e!190705))))

(assert (=> b!302576 (= res!160060 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150105))))

(assert (= (and start!30240 res!160062) b!302569))

(assert (= (and b!302569 res!160061) b!302574))

(assert (= (and b!302574 res!160055) b!302571))

(assert (= (and b!302571 res!160057) b!302568))

(assert (= (and b!302568 res!160054) b!302570))

(assert (= (and b!302570 res!160056) b!302573))

(assert (= (and b!302573 res!160059) b!302572))

(assert (= (and b!302572 res!160058) b!302576))

(assert (= (and b!302576 res!160060) b!302575))

(declare-fun m!314071 () Bool)

(assert (=> b!302575 m!314071))

(declare-fun m!314073 () Bool)

(assert (=> b!302573 m!314073))

(assert (=> b!302573 m!314073))

(declare-fun m!314075 () Bool)

(assert (=> b!302573 m!314075))

(declare-fun m!314077 () Bool)

(assert (=> b!302571 m!314077))

(declare-fun m!314079 () Bool)

(assert (=> b!302576 m!314079))

(declare-fun m!314081 () Bool)

(assert (=> b!302572 m!314081))

(declare-fun m!314083 () Bool)

(assert (=> start!30240 m!314083))

(declare-fun m!314085 () Bool)

(assert (=> start!30240 m!314085))

(declare-fun m!314087 () Bool)

(assert (=> b!302570 m!314087))

(declare-fun m!314089 () Bool)

(assert (=> b!302568 m!314089))

(declare-fun m!314091 () Bool)

(assert (=> b!302574 m!314091))

(push 1)

(assert (not b!302573))

(assert (not b!302570))

(assert (not b!302576))

(assert (not b!302571))

(assert (not b!302568))

(assert (not b!302574))

(assert (not start!30240))

(check-sat)

(pop 1)

