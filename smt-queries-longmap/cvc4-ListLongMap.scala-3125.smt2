; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44038 () Bool)

(assert start!44038)

(declare-fun b!485579 () Bool)

(declare-fun res!289184 () Bool)

(declare-fun e!285914 () Bool)

(assert (=> b!485579 (=> (not res!289184) (not e!285914))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31417 0))(
  ( (array!31418 (arr!15107 (Array (_ BitVec 32) (_ BitVec 64))) (size!15471 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31417)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485579 (= res!289184 (and (= (size!15471 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15471 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15471 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485580 () Bool)

(declare-fun res!289183 () Bool)

(assert (=> b!485580 (=> (not res!289183) (not e!285914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485580 (= res!289183 (validKeyInArray!0 (select (arr!15107 a!3235) j!176)))))

(declare-fun b!485582 () Bool)

(assert (=> b!485582 (= e!285914 (and (bvslt #b00000000000000000000000000000000 (size!15471 a!3235)) (bvsge (size!15471 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!485581 () Bool)

(declare-fun res!289181 () Bool)

(assert (=> b!485581 (=> (not res!289181) (not e!285914))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!485581 (= res!289181 (validKeyInArray!0 k!2280))))

(declare-fun res!289182 () Bool)

(assert (=> start!44038 (=> (not res!289182) (not e!285914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44038 (= res!289182 (validMask!0 mask!3524))))

(assert (=> start!44038 e!285914))

(assert (=> start!44038 true))

(declare-fun array_inv!10903 (array!31417) Bool)

(assert (=> start!44038 (array_inv!10903 a!3235)))

(assert (= (and start!44038 res!289182) b!485579))

(assert (= (and b!485579 res!289184) b!485580))

(assert (= (and b!485580 res!289183) b!485581))

(assert (= (and b!485581 res!289181) b!485582))

(declare-fun m!465683 () Bool)

(assert (=> b!485580 m!465683))

(assert (=> b!485580 m!465683))

(declare-fun m!465685 () Bool)

(assert (=> b!485580 m!465685))

(declare-fun m!465687 () Bool)

(assert (=> b!485581 m!465687))

(declare-fun m!465689 () Bool)

(assert (=> start!44038 m!465689))

(declare-fun m!465691 () Bool)

(assert (=> start!44038 m!465691))

(push 1)

(assert (not b!485580))

(assert (not start!44038))

(assert (not b!485581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

