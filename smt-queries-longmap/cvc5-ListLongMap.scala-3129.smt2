; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44062 () Bool)

(assert start!44062)

(declare-fun b!485496 () Bool)

(declare-fun res!289242 () Bool)

(declare-fun e!285813 () Bool)

(assert (=> b!485496 (=> (not res!289242) (not e!285813))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31440 0))(
  ( (array!31441 (arr!15118 (Array (_ BitVec 32) (_ BitVec 64))) (size!15483 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31440)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485496 (= res!289242 (and (= (size!15483 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15483 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15483 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485497 () Bool)

(assert (=> b!485497 (= e!285813 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3582 0))(
  ( (MissingZero!3582 (index!16507 (_ BitVec 32))) (Found!3582 (index!16508 (_ BitVec 32))) (Intermediate!3582 (undefined!4394 Bool) (index!16509 (_ BitVec 32)) (x!45653 (_ BitVec 32))) (Undefined!3582) (MissingVacant!3582 (index!16510 (_ BitVec 32))) )
))
(declare-fun lt!219331 () SeekEntryResult!3582)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31440 (_ BitVec 32)) SeekEntryResult!3582)

(assert (=> b!485497 (= lt!219331 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485498 () Bool)

(declare-fun res!289241 () Bool)

(assert (=> b!485498 (=> (not res!289241) (not e!285813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485498 (= res!289241 (validKeyInArray!0 (select (arr!15118 a!3235) j!176)))))

(declare-fun b!485500 () Bool)

(declare-fun res!289244 () Bool)

(assert (=> b!485500 (=> (not res!289244) (not e!285813))))

(assert (=> b!485500 (= res!289244 (validKeyInArray!0 k!2280))))

(declare-fun b!485499 () Bool)

(declare-fun res!289240 () Bool)

(assert (=> b!485499 (=> (not res!289240) (not e!285813))))

(declare-fun arrayContainsKey!0 (array!31440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485499 (= res!289240 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289243 () Bool)

(assert (=> start!44062 (=> (not res!289243) (not e!285813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44062 (= res!289243 (validMask!0 mask!3524))))

(assert (=> start!44062 e!285813))

(assert (=> start!44062 true))

(declare-fun array_inv!11001 (array!31440) Bool)

(assert (=> start!44062 (array_inv!11001 a!3235)))

(assert (= (and start!44062 res!289243) b!485496))

(assert (= (and b!485496 res!289242) b!485498))

(assert (= (and b!485498 res!289241) b!485500))

(assert (= (and b!485500 res!289244) b!485499))

(assert (= (and b!485499 res!289240) b!485497))

(declare-fun m!465109 () Bool)

(assert (=> b!485500 m!465109))

(declare-fun m!465111 () Bool)

(assert (=> b!485499 m!465111))

(declare-fun m!465113 () Bool)

(assert (=> b!485498 m!465113))

(assert (=> b!485498 m!465113))

(declare-fun m!465115 () Bool)

(assert (=> b!485498 m!465115))

(declare-fun m!465117 () Bool)

(assert (=> b!485497 m!465117))

(declare-fun m!465119 () Bool)

(assert (=> start!44062 m!465119))

(declare-fun m!465121 () Bool)

(assert (=> start!44062 m!465121))

(push 1)

(assert (not b!485499))

(assert (not b!485498))

(assert (not b!485500))

(assert (not b!485497))

(assert (not start!44062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

