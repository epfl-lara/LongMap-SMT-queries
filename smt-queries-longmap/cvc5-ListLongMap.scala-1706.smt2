; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31360 () Bool)

(assert start!31360)

(declare-fun b!314165 () Bool)

(declare-fun res!170062 () Bool)

(declare-fun e!195671 () Bool)

(assert (=> b!314165 (=> (not res!170062) (not e!195671))))

(declare-datatypes ((array!16035 0))(
  ( (array!16036 (arr!7592 (Array (_ BitVec 32) (_ BitVec 64))) (size!7945 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16035)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314165 (= res!170062 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314166 () Bool)

(declare-fun res!170064 () Bool)

(assert (=> b!314166 (=> (not res!170064) (not e!195671))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2731 0))(
  ( (MissingZero!2731 (index!13100 (_ BitVec 32))) (Found!2731 (index!13101 (_ BitVec 32))) (Intermediate!2731 (undefined!3543 Bool) (index!13102 (_ BitVec 32)) (x!31340 (_ BitVec 32))) (Undefined!2731) (MissingVacant!2731 (index!13103 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16035 (_ BitVec 32)) SeekEntryResult!2731)

(assert (=> b!314166 (= res!170064 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2731 i!1240)))))

(declare-fun b!314168 () Bool)

(declare-fun res!170063 () Bool)

(assert (=> b!314168 (=> (not res!170063) (not e!195671))))

(assert (=> b!314168 (= res!170063 (and (= (size!7945 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7945 a!3293))))))

(declare-fun b!314169 () Bool)

(declare-fun res!170066 () Bool)

(assert (=> b!314169 (=> (not res!170066) (not e!195671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314169 (= res!170066 (validKeyInArray!0 k!2441))))

(declare-fun b!314170 () Bool)

(declare-fun res!170065 () Bool)

(assert (=> b!314170 (=> (not res!170065) (not e!195671))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314170 (= res!170065 (and (= (select (arr!7592 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7945 a!3293))))))

(declare-fun res!170061 () Bool)

(assert (=> start!31360 (=> (not res!170061) (not e!195671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31360 (= res!170061 (validMask!0 mask!3709))))

(assert (=> start!31360 e!195671))

(declare-fun array_inv!5564 (array!16035) Bool)

(assert (=> start!31360 (array_inv!5564 a!3293)))

(assert (=> start!31360 true))

(declare-fun b!314167 () Bool)

(declare-fun res!170067 () Bool)

(assert (=> b!314167 (=> (not res!170067) (not e!195671))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16035 (_ BitVec 32)) SeekEntryResult!2731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314167 (= res!170067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2731 false resIndex!52 resX!52)))))

(declare-fun b!314171 () Bool)

(assert (=> b!314171 (= e!195671 false)))

(declare-fun lt!153671 () SeekEntryResult!2731)

(assert (=> b!314171 (= lt!153671 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314172 () Bool)

(declare-fun res!170060 () Bool)

(assert (=> b!314172 (=> (not res!170060) (not e!195671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16035 (_ BitVec 32)) Bool)

(assert (=> b!314172 (= res!170060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31360 res!170061) b!314168))

(assert (= (and b!314168 res!170063) b!314169))

(assert (= (and b!314169 res!170066) b!314165))

(assert (= (and b!314165 res!170062) b!314166))

(assert (= (and b!314166 res!170064) b!314172))

(assert (= (and b!314172 res!170060) b!314167))

(assert (= (and b!314167 res!170067) b!314170))

(assert (= (and b!314170 res!170065) b!314171))

(declare-fun m!323267 () Bool)

(assert (=> b!314171 m!323267))

(declare-fun m!323269 () Bool)

(assert (=> b!314166 m!323269))

(declare-fun m!323271 () Bool)

(assert (=> start!31360 m!323271))

(declare-fun m!323273 () Bool)

(assert (=> start!31360 m!323273))

(declare-fun m!323275 () Bool)

(assert (=> b!314167 m!323275))

(assert (=> b!314167 m!323275))

(declare-fun m!323277 () Bool)

(assert (=> b!314167 m!323277))

(declare-fun m!323279 () Bool)

(assert (=> b!314170 m!323279))

(declare-fun m!323281 () Bool)

(assert (=> b!314169 m!323281))

(declare-fun m!323283 () Bool)

(assert (=> b!314165 m!323283))

(declare-fun m!323285 () Bool)

(assert (=> b!314172 m!323285))

(push 1)

(assert (not b!314165))

(assert (not start!31360))

(assert (not b!314166))

(assert (not b!314172))

(assert (not b!314171))

(assert (not b!314167))

(assert (not b!314169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

