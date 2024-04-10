; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44034 () Bool)

(assert start!44034)

(declare-fun b!485558 () Bool)

(declare-fun e!285902 () Bool)

(declare-datatypes ((array!31413 0))(
  ( (array!31414 (arr!15105 (Array (_ BitVec 32) (_ BitVec 64))) (size!15469 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31413)

(assert (=> b!485558 (= e!285902 (and (bvslt #b00000000000000000000000000000000 (size!15469 a!3235)) (bvsge (size!15469 a!3235) #b01111111111111111111111111111111)))))

(declare-fun res!289158 () Bool)

(assert (=> start!44034 (=> (not res!289158) (not e!285902))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44034 (= res!289158 (validMask!0 mask!3524))))

(assert (=> start!44034 e!285902))

(assert (=> start!44034 true))

(declare-fun array_inv!10901 (array!31413) Bool)

(assert (=> start!44034 (array_inv!10901 a!3235)))

(declare-fun b!485557 () Bool)

(declare-fun res!289157 () Bool)

(assert (=> b!485557 (=> (not res!289157) (not e!285902))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485557 (= res!289157 (validKeyInArray!0 k!2280))))

(declare-fun b!485555 () Bool)

(declare-fun res!289160 () Bool)

(assert (=> b!485555 (=> (not res!289160) (not e!285902))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485555 (= res!289160 (and (= (size!15469 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15469 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15469 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485556 () Bool)

(declare-fun res!289159 () Bool)

(assert (=> b!485556 (=> (not res!289159) (not e!285902))))

(assert (=> b!485556 (= res!289159 (validKeyInArray!0 (select (arr!15105 a!3235) j!176)))))

(assert (= (and start!44034 res!289158) b!485555))

(assert (= (and b!485555 res!289160) b!485556))

(assert (= (and b!485556 res!289159) b!485557))

(assert (= (and b!485557 res!289157) b!485558))

(declare-fun m!465663 () Bool)

(assert (=> start!44034 m!465663))

(declare-fun m!465665 () Bool)

(assert (=> start!44034 m!465665))

(declare-fun m!465667 () Bool)

(assert (=> b!485557 m!465667))

(declare-fun m!465669 () Bool)

(assert (=> b!485556 m!465669))

(assert (=> b!485556 m!465669))

(declare-fun m!465671 () Bool)

(assert (=> b!485556 m!465671))

(push 1)

(assert (not start!44034))

(assert (not b!485557))

(assert (not b!485556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

