; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44022 () Bool)

(assert start!44022)

(declare-fun b!485497 () Bool)

(declare-fun e!285863 () Bool)

(declare-datatypes ((array!31404 0))(
  ( (array!31405 (arr!15100 (Array (_ BitVec 32) (_ BitVec 64))) (size!15464 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31404)

(assert (=> b!485497 (= e!285863 (and (bvslt #b00000000000000000000000000000000 (size!15464 a!3235)) (bvsge (size!15464 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!485494 () Bool)

(declare-fun res!289151 () Bool)

(assert (=> b!485494 (=> (not res!289151) (not e!285863))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485494 (= res!289151 (and (= (size!15464 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15464 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15464 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485496 () Bool)

(declare-fun res!289152 () Bool)

(assert (=> b!485496 (=> (not res!289152) (not e!285863))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485496 (= res!289152 (validKeyInArray!0 k0!2280))))

(declare-fun b!485495 () Bool)

(declare-fun res!289153 () Bool)

(assert (=> b!485495 (=> (not res!289153) (not e!285863))))

(assert (=> b!485495 (= res!289153 (validKeyInArray!0 (select (arr!15100 a!3235) j!176)))))

(declare-fun res!289150 () Bool)

(assert (=> start!44022 (=> (not res!289150) (not e!285863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44022 (= res!289150 (validMask!0 mask!3524))))

(assert (=> start!44022 e!285863))

(assert (=> start!44022 true))

(declare-fun array_inv!10959 (array!31404) Bool)

(assert (=> start!44022 (array_inv!10959 a!3235)))

(assert (= (and start!44022 res!289150) b!485494))

(assert (= (and b!485494 res!289151) b!485495))

(assert (= (and b!485495 res!289153) b!485496))

(assert (= (and b!485496 res!289152) b!485497))

(declare-fun m!465847 () Bool)

(assert (=> b!485496 m!465847))

(declare-fun m!465849 () Bool)

(assert (=> b!485495 m!465849))

(assert (=> b!485495 m!465849))

(declare-fun m!465851 () Bool)

(assert (=> b!485495 m!465851))

(declare-fun m!465853 () Bool)

(assert (=> start!44022 m!465853))

(declare-fun m!465855 () Bool)

(assert (=> start!44022 m!465855))

(check-sat (not start!44022) (not b!485496) (not b!485495))
(check-sat)
(get-model)

(declare-fun d!77451 () Bool)

(assert (=> d!77451 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44022 d!77451))

(declare-fun d!77463 () Bool)

(assert (=> d!77463 (= (array_inv!10959 a!3235) (bvsge (size!15464 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44022 d!77463))

(declare-fun d!77465 () Bool)

(assert (=> d!77465 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485496 d!77465))

(declare-fun d!77467 () Bool)

(assert (=> d!77467 (= (validKeyInArray!0 (select (arr!15100 a!3235) j!176)) (and (not (= (select (arr!15100 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15100 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485495 d!77467))

(check-sat)
