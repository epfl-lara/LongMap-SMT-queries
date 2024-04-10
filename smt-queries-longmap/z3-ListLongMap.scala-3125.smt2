; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44036 () Bool)

(assert start!44036)

(declare-fun b!485567 () Bool)

(declare-fun res!289169 () Bool)

(declare-fun e!285909 () Bool)

(assert (=> b!485567 (=> (not res!289169) (not e!285909))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31415 0))(
  ( (array!31416 (arr!15106 (Array (_ BitVec 32) (_ BitVec 64))) (size!15470 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31415)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485567 (= res!289169 (and (= (size!15470 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15470 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15470 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485568 () Bool)

(declare-fun res!289172 () Bool)

(assert (=> b!485568 (=> (not res!289172) (not e!285909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485568 (= res!289172 (validKeyInArray!0 (select (arr!15106 a!3235) j!176)))))

(declare-fun res!289171 () Bool)

(assert (=> start!44036 (=> (not res!289171) (not e!285909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44036 (= res!289171 (validMask!0 mask!3524))))

(assert (=> start!44036 e!285909))

(assert (=> start!44036 true))

(declare-fun array_inv!10902 (array!31415) Bool)

(assert (=> start!44036 (array_inv!10902 a!3235)))

(declare-fun b!485569 () Bool)

(declare-fun res!289170 () Bool)

(assert (=> b!485569 (=> (not res!289170) (not e!285909))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!485569 (= res!289170 (validKeyInArray!0 k0!2280))))

(declare-fun b!485570 () Bool)

(assert (=> b!485570 (= e!285909 (and (bvslt #b00000000000000000000000000000000 (size!15470 a!3235)) (bvsge (size!15470 a!3235) #b01111111111111111111111111111111)))))

(assert (= (and start!44036 res!289171) b!485567))

(assert (= (and b!485567 res!289169) b!485568))

(assert (= (and b!485568 res!289172) b!485569))

(assert (= (and b!485569 res!289170) b!485570))

(declare-fun m!465673 () Bool)

(assert (=> b!485568 m!465673))

(assert (=> b!485568 m!465673))

(declare-fun m!465675 () Bool)

(assert (=> b!485568 m!465675))

(declare-fun m!465677 () Bool)

(assert (=> start!44036 m!465677))

(declare-fun m!465679 () Bool)

(assert (=> start!44036 m!465679))

(declare-fun m!465681 () Bool)

(assert (=> b!485569 m!465681))

(check-sat (not start!44036) (not b!485569) (not b!485568))
(check-sat)
(get-model)

(declare-fun d!77421 () Bool)

(assert (=> d!77421 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44036 d!77421))

(declare-fun d!77429 () Bool)

(assert (=> d!77429 (= (array_inv!10902 a!3235) (bvsge (size!15470 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44036 d!77429))

(declare-fun d!77431 () Bool)

(assert (=> d!77431 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485569 d!77431))

(declare-fun d!77433 () Bool)

(assert (=> d!77433 (= (validKeyInArray!0 (select (arr!15106 a!3235) j!176)) (and (not (= (select (arr!15106 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15106 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485568 d!77433))

(check-sat)
