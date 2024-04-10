; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44074 () Bool)

(assert start!44074)

(declare-fun b!485767 () Bool)

(declare-fun res!289370 () Bool)

(declare-fun e!285987 () Bool)

(assert (=> b!485767 (=> (not res!289370) (not e!285987))))

(declare-datatypes ((array!31442 0))(
  ( (array!31443 (arr!15119 (Array (_ BitVec 32) (_ BitVec 64))) (size!15483 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31442)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485767 (= res!289370 (validKeyInArray!0 (select (arr!15119 a!3235) j!176)))))

(declare-fun b!485768 () Bool)

(declare-fun res!289371 () Bool)

(assert (=> b!485768 (=> (not res!289371) (not e!285987))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485768 (= res!289371 (and (= (size!15483 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15483 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15483 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485769 () Bool)

(declare-fun res!289369 () Bool)

(assert (=> b!485769 (=> (not res!289369) (not e!285987))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!485769 (= res!289369 (validKeyInArray!0 k!2280))))

(declare-fun b!485771 () Bool)

(declare-fun res!289373 () Bool)

(assert (=> b!485771 (=> (not res!289373) (not e!285987))))

(declare-fun arrayContainsKey!0 (array!31442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485771 (= res!289373 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485770 () Bool)

(assert (=> b!485770 (= e!285987 false)))

(declare-datatypes ((SeekEntryResult!3586 0))(
  ( (MissingZero!3586 (index!16523 (_ BitVec 32))) (Found!3586 (index!16524 (_ BitVec 32))) (Intermediate!3586 (undefined!4398 Bool) (index!16525 (_ BitVec 32)) (x!45662 (_ BitVec 32))) (Undefined!3586) (MissingVacant!3586 (index!16526 (_ BitVec 32))) )
))
(declare-fun lt!219565 () SeekEntryResult!3586)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31442 (_ BitVec 32)) SeekEntryResult!3586)

(assert (=> b!485770 (= lt!219565 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289372 () Bool)

(assert (=> start!44074 (=> (not res!289372) (not e!285987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44074 (= res!289372 (validMask!0 mask!3524))))

(assert (=> start!44074 e!285987))

(assert (=> start!44074 true))

(declare-fun array_inv!10915 (array!31442) Bool)

(assert (=> start!44074 (array_inv!10915 a!3235)))

(assert (= (and start!44074 res!289372) b!485768))

(assert (= (and b!485768 res!289371) b!485767))

(assert (= (and b!485767 res!289370) b!485769))

(assert (= (and b!485769 res!289369) b!485771))

(assert (= (and b!485771 res!289373) b!485770))

(declare-fun m!465841 () Bool)

(assert (=> start!44074 m!465841))

(declare-fun m!465843 () Bool)

(assert (=> start!44074 m!465843))

(declare-fun m!465845 () Bool)

(assert (=> b!485769 m!465845))

(declare-fun m!465847 () Bool)

(assert (=> b!485767 m!465847))

(assert (=> b!485767 m!465847))

(declare-fun m!465849 () Bool)

(assert (=> b!485767 m!465849))

(declare-fun m!465851 () Bool)

(assert (=> b!485771 m!465851))

(declare-fun m!465853 () Bool)

(assert (=> b!485770 m!465853))

(push 1)

(assert (not b!485770))

(assert (not start!44074))

(assert (not b!485771))

(assert (not b!485767))

(assert (not b!485769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

