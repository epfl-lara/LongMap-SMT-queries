; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31376 () Bool)

(assert start!31376)

(declare-fun b!314464 () Bool)

(declare-fun res!170213 () Bool)

(declare-fun e!195852 () Bool)

(assert (=> b!314464 (=> (not res!170213) (not e!195852))))

(declare-datatypes ((array!16047 0))(
  ( (array!16048 (arr!7598 (Array (_ BitVec 32) (_ BitVec 64))) (size!7950 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16047)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16047 (_ BitVec 32)) Bool)

(assert (=> b!314464 (= res!170213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314465 () Bool)

(declare-fun res!170218 () Bool)

(assert (=> b!314465 (=> (not res!170218) (not e!195852))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314465 (= res!170218 (validKeyInArray!0 k!2441))))

(declare-fun b!314466 () Bool)

(declare-fun res!170217 () Bool)

(assert (=> b!314466 (=> (not res!170217) (not e!195852))))

(declare-fun arrayContainsKey!0 (array!16047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314466 (= res!170217 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314467 () Bool)

(declare-fun res!170214 () Bool)

(assert (=> b!314467 (=> (not res!170214) (not e!195852))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314467 (= res!170214 (and (= (size!7950 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7950 a!3293))))))

(declare-fun b!314468 () Bool)

(assert (=> b!314468 (= e!195852 false)))

(declare-datatypes ((SeekEntryResult!2738 0))(
  ( (MissingZero!2738 (index!13128 (_ BitVec 32))) (Found!2738 (index!13129 (_ BitVec 32))) (Intermediate!2738 (undefined!3550 Bool) (index!13130 (_ BitVec 32)) (x!31360 (_ BitVec 32))) (Undefined!2738) (MissingVacant!2738 (index!13131 (_ BitVec 32))) )
))
(declare-fun lt!153909 () SeekEntryResult!2738)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16047 (_ BitVec 32)) SeekEntryResult!2738)

(assert (=> b!314468 (= lt!153909 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!170216 () Bool)

(assert (=> start!31376 (=> (not res!170216) (not e!195852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31376 (= res!170216 (validMask!0 mask!3709))))

(assert (=> start!31376 e!195852))

(declare-fun array_inv!5561 (array!16047) Bool)

(assert (=> start!31376 (array_inv!5561 a!3293)))

(assert (=> start!31376 true))

(declare-fun b!314469 () Bool)

(declare-fun res!170219 () Bool)

(assert (=> b!314469 (=> (not res!170219) (not e!195852))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314469 (= res!170219 (and (= (select (arr!7598 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7950 a!3293))))))

(declare-fun b!314470 () Bool)

(declare-fun res!170220 () Bool)

(assert (=> b!314470 (=> (not res!170220) (not e!195852))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314470 (= res!170220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2738 false resIndex!52 resX!52)))))

(declare-fun b!314471 () Bool)

(declare-fun res!170215 () Bool)

(assert (=> b!314471 (=> (not res!170215) (not e!195852))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16047 (_ BitVec 32)) SeekEntryResult!2738)

(assert (=> b!314471 (= res!170215 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2738 i!1240)))))

(assert (= (and start!31376 res!170216) b!314467))

(assert (= (and b!314467 res!170214) b!314465))

(assert (= (and b!314465 res!170218) b!314466))

(assert (= (and b!314466 res!170217) b!314471))

(assert (= (and b!314471 res!170215) b!314464))

(assert (= (and b!314464 res!170213) b!314470))

(assert (= (and b!314470 res!170220) b!314469))

(assert (= (and b!314469 res!170219) b!314468))

(declare-fun m!324017 () Bool)

(assert (=> b!314466 m!324017))

(declare-fun m!324019 () Bool)

(assert (=> b!314471 m!324019))

(declare-fun m!324021 () Bool)

(assert (=> b!314470 m!324021))

(assert (=> b!314470 m!324021))

(declare-fun m!324023 () Bool)

(assert (=> b!314470 m!324023))

(declare-fun m!324025 () Bool)

(assert (=> b!314468 m!324025))

(declare-fun m!324027 () Bool)

(assert (=> b!314464 m!324027))

(declare-fun m!324029 () Bool)

(assert (=> start!31376 m!324029))

(declare-fun m!324031 () Bool)

(assert (=> start!31376 m!324031))

(declare-fun m!324033 () Bool)

(assert (=> b!314469 m!324033))

(declare-fun m!324035 () Bool)

(assert (=> b!314465 m!324035))

(push 1)

(assert (not b!314464))

(assert (not b!314465))

(assert (not b!314471))

(assert (not b!314466))

(assert (not b!314468))

(assert (not b!314470))

(assert (not start!31376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

