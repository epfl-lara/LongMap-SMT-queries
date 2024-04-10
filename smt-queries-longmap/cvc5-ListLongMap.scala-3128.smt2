; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44064 () Bool)

(assert start!44064)

(declare-fun b!485685 () Bool)

(declare-fun res!289288 () Bool)

(declare-fun e!285956 () Bool)

(assert (=> b!485685 (=> (not res!289288) (not e!285956))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31432 0))(
  ( (array!31433 (arr!15114 (Array (_ BitVec 32) (_ BitVec 64))) (size!15478 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31432)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485685 (= res!289288 (and (= (size!15478 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15478 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15478 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485686 () Bool)

(declare-fun res!289291 () Bool)

(assert (=> b!485686 (=> (not res!289291) (not e!285956))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3581 0))(
  ( (MissingZero!3581 (index!16503 (_ BitVec 32))) (Found!3581 (index!16504 (_ BitVec 32))) (Intermediate!3581 (undefined!4393 Bool) (index!16505 (_ BitVec 32)) (x!45649 (_ BitVec 32))) (Undefined!3581) (MissingVacant!3581 (index!16506 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31432 (_ BitVec 32)) SeekEntryResult!3581)

(assert (=> b!485686 (= res!289291 (not (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) (MissingZero!3581 i!1204))))))

(declare-fun b!485688 () Bool)

(declare-fun res!289287 () Bool)

(assert (=> b!485688 (=> (not res!289287) (not e!285956))))

(declare-fun arrayContainsKey!0 (array!31432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485688 (= res!289287 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485689 () Bool)

(declare-fun res!289289 () Bool)

(assert (=> b!485689 (=> (not res!289289) (not e!285956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485689 (= res!289289 (validKeyInArray!0 (select (arr!15114 a!3235) j!176)))))

(declare-fun b!485690 () Bool)

(assert (=> b!485690 (= e!285956 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!485687 () Bool)

(declare-fun res!289290 () Bool)

(assert (=> b!485687 (=> (not res!289290) (not e!285956))))

(assert (=> b!485687 (= res!289290 (validKeyInArray!0 k!2280))))

(declare-fun res!289292 () Bool)

(assert (=> start!44064 (=> (not res!289292) (not e!285956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44064 (= res!289292 (validMask!0 mask!3524))))

(assert (=> start!44064 e!285956))

(assert (=> start!44064 true))

(declare-fun array_inv!10910 (array!31432) Bool)

(assert (=> start!44064 (array_inv!10910 a!3235)))

(assert (= (and start!44064 res!289292) b!485685))

(assert (= (and b!485685 res!289288) b!485689))

(assert (= (and b!485689 res!289289) b!485687))

(assert (= (and b!485687 res!289290) b!485688))

(assert (= (and b!485688 res!289287) b!485686))

(assert (= (and b!485686 res!289291) b!485690))

(declare-fun m!465771 () Bool)

(assert (=> b!485689 m!465771))

(assert (=> b!485689 m!465771))

(declare-fun m!465773 () Bool)

(assert (=> b!485689 m!465773))

(declare-fun m!465775 () Bool)

(assert (=> b!485686 m!465775))

(declare-fun m!465777 () Bool)

(assert (=> b!485688 m!465777))

(declare-fun m!465779 () Bool)

(assert (=> b!485687 m!465779))

(declare-fun m!465781 () Bool)

(assert (=> start!44064 m!465781))

(declare-fun m!465783 () Bool)

(assert (=> start!44064 m!465783))

(push 1)

(assert (not start!44064))

(assert (not b!485688))

(assert (not b!485687))

