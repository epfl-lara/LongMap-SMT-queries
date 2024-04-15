; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44086 () Bool)

(assert start!44086)

(declare-fun b!485676 () Bool)

(declare-fun e!285884 () Bool)

(assert (=> b!485676 (= e!285884 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3594 0))(
  ( (MissingZero!3594 (index!16555 (_ BitVec 32))) (Found!3594 (index!16556 (_ BitVec 32))) (Intermediate!3594 (undefined!4406 Bool) (index!16557 (_ BitVec 32)) (x!45697 (_ BitVec 32))) (Undefined!3594) (MissingVacant!3594 (index!16558 (_ BitVec 32))) )
))
(declare-fun lt!219367 () SeekEntryResult!3594)

(declare-datatypes ((array!31464 0))(
  ( (array!31465 (arr!15130 (Array (_ BitVec 32) (_ BitVec 64))) (size!15495 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31464)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31464 (_ BitVec 32)) SeekEntryResult!3594)

(assert (=> b!485676 (= lt!219367 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289423 () Bool)

(assert (=> start!44086 (=> (not res!289423) (not e!285884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44086 (= res!289423 (validMask!0 mask!3524))))

(assert (=> start!44086 e!285884))

(assert (=> start!44086 true))

(declare-fun array_inv!11013 (array!31464) Bool)

(assert (=> start!44086 (array_inv!11013 a!3235)))

(declare-fun b!485677 () Bool)

(declare-fun res!289421 () Bool)

(assert (=> b!485677 (=> (not res!289421) (not e!285884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485677 (= res!289421 (validKeyInArray!0 k!2280))))

(declare-fun b!485678 () Bool)

(declare-fun res!289422 () Bool)

(assert (=> b!485678 (=> (not res!289422) (not e!285884))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485678 (= res!289422 (validKeyInArray!0 (select (arr!15130 a!3235) j!176)))))

(declare-fun b!485679 () Bool)

(declare-fun res!289420 () Bool)

(assert (=> b!485679 (=> (not res!289420) (not e!285884))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485679 (= res!289420 (and (= (size!15495 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15495 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15495 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485680 () Bool)

(declare-fun res!289424 () Bool)

(assert (=> b!485680 (=> (not res!289424) (not e!285884))))

(declare-fun arrayContainsKey!0 (array!31464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485680 (= res!289424 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44086 res!289423) b!485679))

(assert (= (and b!485679 res!289420) b!485678))

(assert (= (and b!485678 res!289422) b!485677))

(assert (= (and b!485677 res!289421) b!485680))

(assert (= (and b!485680 res!289424) b!485676))

(declare-fun m!465277 () Bool)

(assert (=> b!485680 m!465277))

(declare-fun m!465279 () Bool)

(assert (=> b!485676 m!465279))

(declare-fun m!465281 () Bool)

(assert (=> start!44086 m!465281))

(declare-fun m!465283 () Bool)

(assert (=> start!44086 m!465283))

(declare-fun m!465285 () Bool)

(assert (=> b!485677 m!465285))

(declare-fun m!465287 () Bool)

(assert (=> b!485678 m!465287))

(assert (=> b!485678 m!465287))

(declare-fun m!465289 () Bool)

(assert (=> b!485678 m!465289))

(push 1)

(assert (not b!485680))

(assert (not start!44086))

(assert (not b!485676))

(assert (not b!485677))

(assert (not b!485678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

