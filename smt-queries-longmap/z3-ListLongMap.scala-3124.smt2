; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44016 () Bool)

(assert start!44016)

(declare-fun b!485461 () Bool)

(declare-fun e!285845 () Bool)

(declare-datatypes ((array!31398 0))(
  ( (array!31399 (arr!15097 (Array (_ BitVec 32) (_ BitVec 64))) (size!15461 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31398)

(assert (=> b!485461 (= e!285845 (bvsge #b00000000000000000000000000000000 (size!15461 a!3235)))))

(declare-fun b!485460 () Bool)

(declare-fun res!289115 () Bool)

(assert (=> b!485460 (=> (not res!289115) (not e!285845))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485460 (= res!289115 (validKeyInArray!0 k0!2280))))

(declare-fun b!485459 () Bool)

(declare-fun res!289116 () Bool)

(assert (=> b!485459 (=> (not res!289116) (not e!285845))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485459 (= res!289116 (validKeyInArray!0 (select (arr!15097 a!3235) j!176)))))

(declare-fun res!289114 () Bool)

(assert (=> start!44016 (=> (not res!289114) (not e!285845))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44016 (= res!289114 (validMask!0 mask!3524))))

(assert (=> start!44016 e!285845))

(assert (=> start!44016 true))

(declare-fun array_inv!10956 (array!31398) Bool)

(assert (=> start!44016 (array_inv!10956 a!3235)))

(declare-fun b!485458 () Bool)

(declare-fun res!289117 () Bool)

(assert (=> b!485458 (=> (not res!289117) (not e!285845))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485458 (= res!289117 (and (= (size!15461 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15461 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15461 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44016 res!289114) b!485458))

(assert (= (and b!485458 res!289117) b!485459))

(assert (= (and b!485459 res!289116) b!485460))

(assert (= (and b!485460 res!289115) b!485461))

(declare-fun m!465817 () Bool)

(assert (=> b!485460 m!465817))

(declare-fun m!465819 () Bool)

(assert (=> b!485459 m!465819))

(assert (=> b!485459 m!465819))

(declare-fun m!465821 () Bool)

(assert (=> b!485459 m!465821))

(declare-fun m!465823 () Bool)

(assert (=> start!44016 m!465823))

(declare-fun m!465825 () Bool)

(assert (=> start!44016 m!465825))

(check-sat (not b!485460) (not b!485459) (not start!44016))
(check-sat)
