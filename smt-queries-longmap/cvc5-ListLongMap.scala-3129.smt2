; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44064 () Bool)

(assert start!44064)

(declare-fun b!485706 () Bool)

(declare-fun res!289365 () Bool)

(declare-fun e!285948 () Bool)

(assert (=> b!485706 (=> (not res!289365) (not e!285948))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31433 0))(
  ( (array!31434 (arr!15114 (Array (_ BitVec 32) (_ BitVec 64))) (size!15478 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31433)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485706 (= res!289365 (and (= (size!15478 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15478 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15478 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485707 () Bool)

(declare-fun res!289363 () Bool)

(assert (=> b!485707 (=> (not res!289363) (not e!285948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485707 (= res!289363 (validKeyInArray!0 (select (arr!15114 a!3235) j!176)))))

(declare-fun res!289364 () Bool)

(assert (=> start!44064 (=> (not res!289364) (not e!285948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44064 (= res!289364 (validMask!0 mask!3524))))

(assert (=> start!44064 e!285948))

(assert (=> start!44064 true))

(declare-fun array_inv!10973 (array!31433) Bool)

(assert (=> start!44064 (array_inv!10973 a!3235)))

(declare-fun b!485708 () Bool)

(declare-fun res!289366 () Bool)

(assert (=> b!485708 (=> (not res!289366) (not e!285948))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485708 (= res!289366 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485709 () Bool)

(declare-fun res!289362 () Bool)

(assert (=> b!485709 (=> (not res!289362) (not e!285948))))

(assert (=> b!485709 (= res!289362 (validKeyInArray!0 k!2280))))

(declare-fun b!485710 () Bool)

(assert (=> b!485710 (= e!285948 false)))

(declare-datatypes ((SeekEntryResult!3537 0))(
  ( (MissingZero!3537 (index!16327 (_ BitVec 32))) (Found!3537 (index!16328 (_ BitVec 32))) (Intermediate!3537 (undefined!4349 Bool) (index!16329 (_ BitVec 32)) (x!45610 (_ BitVec 32))) (Undefined!3537) (MissingVacant!3537 (index!16330 (_ BitVec 32))) )
))
(declare-fun lt!219577 () SeekEntryResult!3537)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31433 (_ BitVec 32)) SeekEntryResult!3537)

(assert (=> b!485710 (= lt!219577 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44064 res!289364) b!485706))

(assert (= (and b!485706 res!289365) b!485707))

(assert (= (and b!485707 res!289363) b!485709))

(assert (= (and b!485709 res!289362) b!485708))

(assert (= (and b!485708 res!289366) b!485710))

(declare-fun m!466025 () Bool)

(assert (=> start!44064 m!466025))

(declare-fun m!466027 () Bool)

(assert (=> start!44064 m!466027))

(declare-fun m!466029 () Bool)

(assert (=> b!485710 m!466029))

(declare-fun m!466031 () Bool)

(assert (=> b!485708 m!466031))

(declare-fun m!466033 () Bool)

(assert (=> b!485709 m!466033))

(declare-fun m!466035 () Bool)

(assert (=> b!485707 m!466035))

(assert (=> b!485707 m!466035))

(declare-fun m!466037 () Bool)

(assert (=> b!485707 m!466037))

(push 1)

(assert (not b!485707))

(assert (not b!485708))

(assert (not start!44064))

(assert (not b!485709))

(assert (not b!485710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

