; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44030 () Bool)

(assert start!44030)

(declare-fun b!485534 () Bool)

(declare-fun e!285890 () Bool)

(declare-datatypes ((array!31409 0))(
  ( (array!31410 (arr!15103 (Array (_ BitVec 32) (_ BitVec 64))) (size!15467 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31409)

(assert (=> b!485534 (= e!285890 (bvsge #b00000000000000000000000000000000 (size!15467 a!3235)))))

(declare-fun b!485532 () Bool)

(declare-fun res!289135 () Bool)

(assert (=> b!485532 (=> (not res!289135) (not e!285890))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485532 (= res!289135 (validKeyInArray!0 (select (arr!15103 a!3235) j!176)))))

(declare-fun b!485533 () Bool)

(declare-fun res!289134 () Bool)

(assert (=> b!485533 (=> (not res!289134) (not e!285890))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!485533 (= res!289134 (validKeyInArray!0 k0!2280))))

(declare-fun res!289133 () Bool)

(assert (=> start!44030 (=> (not res!289133) (not e!285890))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44030 (= res!289133 (validMask!0 mask!3524))))

(assert (=> start!44030 e!285890))

(assert (=> start!44030 true))

(declare-fun array_inv!10899 (array!31409) Bool)

(assert (=> start!44030 (array_inv!10899 a!3235)))

(declare-fun b!485531 () Bool)

(declare-fun res!289136 () Bool)

(assert (=> b!485531 (=> (not res!289136) (not e!285890))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485531 (= res!289136 (and (= (size!15467 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15467 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15467 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44030 res!289133) b!485531))

(assert (= (and b!485531 res!289136) b!485532))

(assert (= (and b!485532 res!289135) b!485533))

(assert (= (and b!485533 res!289134) b!485534))

(declare-fun m!465643 () Bool)

(assert (=> b!485532 m!465643))

(assert (=> b!485532 m!465643))

(declare-fun m!465645 () Bool)

(assert (=> b!485532 m!465645))

(declare-fun m!465647 () Bool)

(assert (=> b!485533 m!465647))

(declare-fun m!465649 () Bool)

(assert (=> start!44030 m!465649))

(declare-fun m!465651 () Bool)

(assert (=> start!44030 m!465651))

(check-sat (not b!485533) (not b!485532) (not start!44030))
(check-sat)
