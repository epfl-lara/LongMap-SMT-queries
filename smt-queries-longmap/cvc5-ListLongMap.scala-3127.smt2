; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44058 () Bool)

(assert start!44058)

(declare-fun b!485638 () Bool)

(declare-fun res!289242 () Bool)

(declare-fun e!285938 () Bool)

(assert (=> b!485638 (=> (not res!289242) (not e!285938))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31426 0))(
  ( (array!31427 (arr!15111 (Array (_ BitVec 32) (_ BitVec 64))) (size!15475 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31426)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485638 (= res!289242 (and (= (size!15475 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15475 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15475 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485639 () Bool)

(declare-fun res!289241 () Bool)

(assert (=> b!485639 (=> (not res!289241) (not e!285938))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485639 (= res!289241 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485640 () Bool)

(declare-fun res!289240 () Bool)

(assert (=> b!485640 (=> (not res!289240) (not e!285938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485640 (= res!289240 (validKeyInArray!0 (select (arr!15111 a!3235) j!176)))))

(declare-fun b!485641 () Bool)

(declare-fun res!289243 () Bool)

(assert (=> b!485641 (=> (not res!289243) (not e!285938))))

(assert (=> b!485641 (= res!289243 (validKeyInArray!0 k!2280))))

(declare-fun b!485642 () Bool)

(assert (=> b!485642 (= e!285938 false)))

(declare-datatypes ((SeekEntryResult!3578 0))(
  ( (MissingZero!3578 (index!16491 (_ BitVec 32))) (Found!3578 (index!16492 (_ BitVec 32))) (Intermediate!3578 (undefined!4390 Bool) (index!16493 (_ BitVec 32)) (x!45638 (_ BitVec 32))) (Undefined!3578) (MissingVacant!3578 (index!16494 (_ BitVec 32))) )
))
(declare-fun lt!219550 () SeekEntryResult!3578)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31426 (_ BitVec 32)) SeekEntryResult!3578)

(assert (=> b!485642 (= lt!219550 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289244 () Bool)

(assert (=> start!44058 (=> (not res!289244) (not e!285938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44058 (= res!289244 (validMask!0 mask!3524))))

(assert (=> start!44058 e!285938))

(assert (=> start!44058 true))

(declare-fun array_inv!10907 (array!31426) Bool)

(assert (=> start!44058 (array_inv!10907 a!3235)))

(assert (= (and start!44058 res!289244) b!485638))

(assert (= (and b!485638 res!289242) b!485640))

(assert (= (and b!485640 res!289240) b!485641))

(assert (= (and b!485641 res!289243) b!485639))

(assert (= (and b!485639 res!289241) b!485642))

(declare-fun m!465729 () Bool)

(assert (=> b!485642 m!465729))

(declare-fun m!465731 () Bool)

(assert (=> b!485640 m!465731))

(assert (=> b!485640 m!465731))

(declare-fun m!465733 () Bool)

(assert (=> b!485640 m!465733))

(declare-fun m!465735 () Bool)

(assert (=> start!44058 m!465735))

(declare-fun m!465737 () Bool)

(assert (=> start!44058 m!465737))

(declare-fun m!465739 () Bool)

(assert (=> b!485639 m!465739))

(declare-fun m!465741 () Bool)

(assert (=> b!485641 m!465741))

(push 1)

(assert (not b!485640))

(assert (not b!485642))

(assert (not b!485639))

(assert (not b!485641))

(assert (not start!44058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

