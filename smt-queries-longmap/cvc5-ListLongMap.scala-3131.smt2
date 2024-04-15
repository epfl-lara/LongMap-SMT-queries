; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44074 () Bool)

(assert start!44074)

(declare-fun b!485586 () Bool)

(declare-fun res!289330 () Bool)

(declare-fun e!285848 () Bool)

(assert (=> b!485586 (=> (not res!289330) (not e!285848))))

(declare-datatypes ((array!31452 0))(
  ( (array!31453 (arr!15124 (Array (_ BitVec 32) (_ BitVec 64))) (size!15489 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31452)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485586 (= res!289330 (validKeyInArray!0 (select (arr!15124 a!3235) j!176)))))

(declare-fun b!485587 () Bool)

(declare-fun res!289331 () Bool)

(assert (=> b!485587 (=> (not res!289331) (not e!285848))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485587 (= res!289331 (and (= (size!15489 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15489 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15489 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485588 () Bool)

(declare-fun res!289334 () Bool)

(assert (=> b!485588 (=> (not res!289334) (not e!285848))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485588 (= res!289334 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485590 () Bool)

(declare-fun res!289332 () Bool)

(assert (=> b!485590 (=> (not res!289332) (not e!285848))))

(assert (=> b!485590 (= res!289332 (validKeyInArray!0 k!2280))))

(declare-fun res!289333 () Bool)

(assert (=> start!44074 (=> (not res!289333) (not e!285848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44074 (= res!289333 (validMask!0 mask!3524))))

(assert (=> start!44074 e!285848))

(assert (=> start!44074 true))

(declare-fun array_inv!11007 (array!31452) Bool)

(assert (=> start!44074 (array_inv!11007 a!3235)))

(declare-fun b!485589 () Bool)

(assert (=> b!485589 (= e!285848 false)))

(declare-datatypes ((SeekEntryResult!3588 0))(
  ( (MissingZero!3588 (index!16531 (_ BitVec 32))) (Found!3588 (index!16532 (_ BitVec 32))) (Intermediate!3588 (undefined!4400 Bool) (index!16533 (_ BitVec 32)) (x!45675 (_ BitVec 32))) (Undefined!3588) (MissingVacant!3588 (index!16534 (_ BitVec 32))) )
))
(declare-fun lt!219349 () SeekEntryResult!3588)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31452 (_ BitVec 32)) SeekEntryResult!3588)

(assert (=> b!485589 (= lt!219349 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44074 res!289333) b!485587))

(assert (= (and b!485587 res!289331) b!485586))

(assert (= (and b!485586 res!289330) b!485590))

(assert (= (and b!485590 res!289332) b!485588))

(assert (= (and b!485588 res!289334) b!485589))

(declare-fun m!465193 () Bool)

(assert (=> b!485586 m!465193))

(assert (=> b!485586 m!465193))

(declare-fun m!465195 () Bool)

(assert (=> b!485586 m!465195))

(declare-fun m!465197 () Bool)

(assert (=> b!485588 m!465197))

(declare-fun m!465199 () Bool)

(assert (=> b!485590 m!465199))

(declare-fun m!465201 () Bool)

(assert (=> start!44074 m!465201))

(declare-fun m!465203 () Bool)

(assert (=> start!44074 m!465203))

(declare-fun m!465205 () Bool)

(assert (=> b!485589 m!465205))

(push 1)

(assert (not b!485590))

(assert (not b!485589))

(assert (not b!485588))

(assert (not b!485586))

(assert (not start!44074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

