; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44052 () Bool)

(assert start!44052)

(declare-fun res!289195 () Bool)

(declare-fun e!285920 () Bool)

(assert (=> start!44052 (=> (not res!289195) (not e!285920))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44052 (= res!289195 (validMask!0 mask!3524))))

(assert (=> start!44052 e!285920))

(assert (=> start!44052 true))

(declare-datatypes ((array!31420 0))(
  ( (array!31421 (arr!15108 (Array (_ BitVec 32) (_ BitVec 64))) (size!15472 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31420)

(declare-fun array_inv!10904 (array!31420) Bool)

(assert (=> start!44052 (array_inv!10904 a!3235)))

(declare-fun b!485593 () Bool)

(declare-fun res!289197 () Bool)

(assert (=> b!485593 (=> (not res!289197) (not e!285920))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485593 (= res!289197 (and (= (size!15472 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15472 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15472 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485594 () Bool)

(declare-fun res!289196 () Bool)

(assert (=> b!485594 (=> (not res!289196) (not e!285920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485594 (= res!289196 (validKeyInArray!0 (select (arr!15108 a!3235) j!176)))))

(declare-fun b!485595 () Bool)

(assert (=> b!485595 (= e!285920 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!485596 () Bool)

(declare-fun res!289199 () Bool)

(assert (=> b!485596 (=> (not res!289199) (not e!285920))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!485596 (= res!289199 (validKeyInArray!0 k!2280))))

(declare-fun b!485597 () Bool)

(declare-fun res!289198 () Bool)

(assert (=> b!485597 (=> (not res!289198) (not e!285920))))

(declare-fun arrayContainsKey!0 (array!31420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485597 (= res!289198 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44052 res!289195) b!485593))

(assert (= (and b!485593 res!289197) b!485594))

(assert (= (and b!485594 res!289196) b!485596))

(assert (= (and b!485596 res!289199) b!485597))

(assert (= (and b!485597 res!289198) b!485595))

(declare-fun m!465693 () Bool)

(assert (=> start!44052 m!465693))

(declare-fun m!465695 () Bool)

(assert (=> start!44052 m!465695))

(declare-fun m!465697 () Bool)

(assert (=> b!485594 m!465697))

(assert (=> b!485594 m!465697))

(declare-fun m!465699 () Bool)

(assert (=> b!485594 m!465699))

(declare-fun m!465701 () Bool)

(assert (=> b!485596 m!465701))

(declare-fun m!465703 () Bool)

(assert (=> b!485597 m!465703))

(push 1)

(assert (not b!485596))

(assert (not start!44052))

(assert (not b!485594))

(assert (not b!485597))

(check-sat)

