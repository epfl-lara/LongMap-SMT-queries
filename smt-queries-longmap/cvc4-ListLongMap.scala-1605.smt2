; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30306 () Bool)

(assert start!30306)

(declare-fun b!303406 () Bool)

(declare-fun res!160899 () Bool)

(declare-fun e!190948 () Bool)

(assert (=> b!303406 (=> (not res!160899) (not e!190948))))

(declare-datatypes ((array!15412 0))(
  ( (array!15413 (arr!7294 (Array (_ BitVec 32) (_ BitVec 64))) (size!7646 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15412)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303406 (= res!160899 (and (= (size!7646 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7646 a!3293))))))

(declare-fun b!303407 () Bool)

(declare-fun res!160892 () Bool)

(assert (=> b!303407 (=> (not res!160892) (not e!190948))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303407 (= res!160892 (validKeyInArray!0 k!2441))))

(declare-fun b!303408 () Bool)

(declare-fun res!160894 () Bool)

(assert (=> b!303408 (=> (not res!160894) (not e!190948))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303408 (= res!160894 (and (= (select (arr!7294 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7646 a!3293))))))

(declare-fun res!160896 () Bool)

(assert (=> start!30306 (=> (not res!160896) (not e!190948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30306 (= res!160896 (validMask!0 mask!3709))))

(assert (=> start!30306 e!190948))

(declare-fun array_inv!5257 (array!15412) Bool)

(assert (=> start!30306 (array_inv!5257 a!3293)))

(assert (=> start!30306 true))

(declare-fun b!303409 () Bool)

(declare-fun res!160893 () Bool)

(assert (=> b!303409 (=> (not res!160893) (not e!190948))))

(declare-datatypes ((SeekEntryResult!2434 0))(
  ( (MissingZero!2434 (index!11912 (_ BitVec 32))) (Found!2434 (index!11913 (_ BitVec 32))) (Intermediate!2434 (undefined!3246 Bool) (index!11914 (_ BitVec 32)) (x!30171 (_ BitVec 32))) (Undefined!2434) (MissingVacant!2434 (index!11915 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15412 (_ BitVec 32)) SeekEntryResult!2434)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303409 (= res!160893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2434 false resIndex!52 resX!52)))))

(declare-fun b!303410 () Bool)

(declare-fun res!160898 () Bool)

(assert (=> b!303410 (=> (not res!160898) (not e!190948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15412 (_ BitVec 32)) Bool)

(assert (=> b!303410 (= res!160898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303411 () Bool)

(declare-fun res!160895 () Bool)

(assert (=> b!303411 (=> (not res!160895) (not e!190948))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15412 (_ BitVec 32)) SeekEntryResult!2434)

(assert (=> b!303411 (= res!160895 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2434 i!1240)))))

(declare-fun b!303412 () Bool)

(declare-fun res!160897 () Bool)

(assert (=> b!303412 (=> (not res!160897) (not e!190948))))

(declare-fun arrayContainsKey!0 (array!15412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303412 (= res!160897 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303413 () Bool)

(assert (=> b!303413 (= e!190948 false)))

(declare-fun lt!150204 () SeekEntryResult!2434)

(assert (=> b!303413 (= lt!150204 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30306 res!160896) b!303406))

(assert (= (and b!303406 res!160899) b!303407))

(assert (= (and b!303407 res!160892) b!303412))

(assert (= (and b!303412 res!160897) b!303411))

(assert (= (and b!303411 res!160895) b!303410))

(assert (= (and b!303410 res!160898) b!303409))

(assert (= (and b!303409 res!160893) b!303408))

(assert (= (and b!303408 res!160894) b!303413))

(declare-fun m!314763 () Bool)

(assert (=> b!303411 m!314763))

(declare-fun m!314765 () Bool)

(assert (=> b!303408 m!314765))

(declare-fun m!314767 () Bool)

(assert (=> start!30306 m!314767))

(declare-fun m!314769 () Bool)

(assert (=> start!30306 m!314769))

(declare-fun m!314771 () Bool)

(assert (=> b!303410 m!314771))

(declare-fun m!314773 () Bool)

(assert (=> b!303412 m!314773))

(declare-fun m!314775 () Bool)

(assert (=> b!303409 m!314775))

(assert (=> b!303409 m!314775))

(declare-fun m!314777 () Bool)

(assert (=> b!303409 m!314777))

(declare-fun m!314779 () Bool)

(assert (=> b!303413 m!314779))

(declare-fun m!314781 () Bool)

(assert (=> b!303407 m!314781))

(push 1)

(assert (not b!303413))

(assert (not b!303409))

(assert (not b!303411))

(assert (not b!303412))

(assert (not b!303410))

(assert (not start!30306))

(assert (not b!303407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

