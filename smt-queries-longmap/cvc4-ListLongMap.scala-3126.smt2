; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44056 () Bool)

(assert start!44056)

(declare-fun b!485623 () Bool)

(declare-fun res!289226 () Bool)

(declare-fun e!285933 () Bool)

(assert (=> b!485623 (=> (not res!289226) (not e!285933))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!31424 0))(
  ( (array!31425 (arr!15110 (Array (_ BitVec 32) (_ BitVec 64))) (size!15474 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31424)

(assert (=> b!485623 (= res!289226 (and (= (size!15474 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15474 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15474 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485625 () Bool)

(declare-fun res!289229 () Bool)

(assert (=> b!485625 (=> (not res!289229) (not e!285933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485625 (= res!289229 (validKeyInArray!0 (select (arr!15110 a!3235) j!176)))))

(declare-fun b!485626 () Bool)

(declare-fun res!289228 () Bool)

(assert (=> b!485626 (=> (not res!289228) (not e!285933))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!485626 (= res!289228 (validKeyInArray!0 k!2280))))

(declare-fun b!485627 () Bool)

(declare-fun res!289227 () Bool)

(assert (=> b!485627 (=> (not res!289227) (not e!285933))))

(declare-fun arrayContainsKey!0 (array!31424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485627 (= res!289227 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485624 () Bool)

(assert (=> b!485624 (= e!285933 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun res!289225 () Bool)

(assert (=> start!44056 (=> (not res!289225) (not e!285933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44056 (= res!289225 (validMask!0 mask!3524))))

(assert (=> start!44056 e!285933))

(assert (=> start!44056 true))

(declare-fun array_inv!10906 (array!31424) Bool)

(assert (=> start!44056 (array_inv!10906 a!3235)))

(assert (= (and start!44056 res!289225) b!485623))

(assert (= (and b!485623 res!289226) b!485625))

(assert (= (and b!485625 res!289229) b!485626))

(assert (= (and b!485626 res!289228) b!485627))

(assert (= (and b!485627 res!289227) b!485624))

(declare-fun m!465717 () Bool)

(assert (=> b!485625 m!465717))

(assert (=> b!485625 m!465717))

(declare-fun m!465719 () Bool)

(assert (=> b!485625 m!465719))

(declare-fun m!465721 () Bool)

(assert (=> b!485626 m!465721))

(declare-fun m!465723 () Bool)

(assert (=> b!485627 m!465723))

(declare-fun m!465725 () Bool)

(assert (=> start!44056 m!465725))

(declare-fun m!465727 () Bool)

(assert (=> start!44056 m!465727))

(push 1)

(assert (not start!44056))

(assert (not b!485627))

(assert (not b!485625))

(assert (not b!485626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

