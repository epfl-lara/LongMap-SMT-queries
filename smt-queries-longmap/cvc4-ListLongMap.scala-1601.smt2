; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30282 () Bool)

(assert start!30282)

(declare-fun b!303100 () Bool)

(declare-fun res!160592 () Bool)

(declare-fun e!190857 () Bool)

(assert (=> b!303100 (=> (not res!160592) (not e!190857))))

(declare-datatypes ((array!15388 0))(
  ( (array!15389 (arr!7282 (Array (_ BitVec 32) (_ BitVec 64))) (size!7634 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15388)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303100 (= res!160592 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303101 () Bool)

(declare-fun res!160589 () Bool)

(assert (=> b!303101 (=> (not res!160589) (not e!190857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303101 (= res!160589 (validKeyInArray!0 k!2441))))

(declare-fun b!303102 () Bool)

(declare-fun res!160591 () Bool)

(assert (=> b!303102 (=> (not res!160591) (not e!190857))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2422 0))(
  ( (MissingZero!2422 (index!11864 (_ BitVec 32))) (Found!2422 (index!11865 (_ BitVec 32))) (Intermediate!2422 (undefined!3234 Bool) (index!11866 (_ BitVec 32)) (x!30127 (_ BitVec 32))) (Undefined!2422) (MissingVacant!2422 (index!11867 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15388 (_ BitVec 32)) SeekEntryResult!2422)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303102 (= res!160591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2422 false resIndex!52 resX!52)))))

(declare-fun res!160588 () Bool)

(assert (=> start!30282 (=> (not res!160588) (not e!190857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30282 (= res!160588 (validMask!0 mask!3709))))

(assert (=> start!30282 e!190857))

(declare-fun array_inv!5245 (array!15388) Bool)

(assert (=> start!30282 (array_inv!5245 a!3293)))

(assert (=> start!30282 true))

(declare-fun b!303103 () Bool)

(declare-fun res!160586 () Bool)

(assert (=> b!303103 (=> (not res!160586) (not e!190857))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15388 (_ BitVec 32)) SeekEntryResult!2422)

(assert (=> b!303103 (= res!160586 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2422 i!1240)))))

(declare-fun b!303104 () Bool)

(declare-fun res!160587 () Bool)

(assert (=> b!303104 (=> (not res!160587) (not e!190857))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303104 (= res!160587 (and (= (select (arr!7282 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7634 a!3293))))))

(declare-fun b!303105 () Bool)

(declare-fun res!160593 () Bool)

(assert (=> b!303105 (=> (not res!160593) (not e!190857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15388 (_ BitVec 32)) Bool)

(assert (=> b!303105 (= res!160593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303106 () Bool)

(assert (=> b!303106 (= e!190857 false)))

(declare-fun lt!150168 () SeekEntryResult!2422)

(assert (=> b!303106 (= lt!150168 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303107 () Bool)

(declare-fun res!160590 () Bool)

(assert (=> b!303107 (=> (not res!160590) (not e!190857))))

(assert (=> b!303107 (= res!160590 (and (= (size!7634 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7634 a!3293))))))

(assert (= (and start!30282 res!160588) b!303107))

(assert (= (and b!303107 res!160590) b!303101))

(assert (= (and b!303101 res!160589) b!303100))

(assert (= (and b!303100 res!160592) b!303103))

(assert (= (and b!303103 res!160586) b!303105))

(assert (= (and b!303105 res!160593) b!303102))

(assert (= (and b!303102 res!160591) b!303104))

(assert (= (and b!303104 res!160587) b!303106))

(declare-fun m!314511 () Bool)

(assert (=> b!303105 m!314511))

(declare-fun m!314513 () Bool)

(assert (=> b!303100 m!314513))

(declare-fun m!314515 () Bool)

(assert (=> start!30282 m!314515))

(declare-fun m!314517 () Bool)

(assert (=> start!30282 m!314517))

(declare-fun m!314519 () Bool)

(assert (=> b!303101 m!314519))

(declare-fun m!314521 () Bool)

(assert (=> b!303102 m!314521))

(assert (=> b!303102 m!314521))

(declare-fun m!314523 () Bool)

(assert (=> b!303102 m!314523))

(declare-fun m!314525 () Bool)

(assert (=> b!303104 m!314525))

(declare-fun m!314527 () Bool)

(assert (=> b!303103 m!314527))

(declare-fun m!314529 () Bool)

(assert (=> b!303106 m!314529))

(push 1)

(assert (not b!303106))

(assert (not b!303100))

(assert (not b!303102))

(assert (not b!303101))

(assert (not start!30282))

(assert (not b!303105))

(assert (not b!303103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

