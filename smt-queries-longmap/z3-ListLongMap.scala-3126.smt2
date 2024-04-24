; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44042 () Bool)

(assert start!44042)

(declare-fun b!485532 () Bool)

(declare-fun res!289188 () Bool)

(declare-fun e!285882 () Bool)

(assert (=> b!485532 (=> (not res!289188) (not e!285882))))

(declare-datatypes ((array!31411 0))(
  ( (array!31412 (arr!15103 (Array (_ BitVec 32) (_ BitVec 64))) (size!15467 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31411)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485532 (= res!289188 (validKeyInArray!0 (select (arr!15103 a!3235) j!176)))))

(declare-fun res!289189 () Bool)

(assert (=> start!44042 (=> (not res!289189) (not e!285882))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44042 (= res!289189 (validMask!0 mask!3524))))

(assert (=> start!44042 e!285882))

(assert (=> start!44042 true))

(declare-fun array_inv!10962 (array!31411) Bool)

(assert (=> start!44042 (array_inv!10962 a!3235)))

(declare-fun b!485533 () Bool)

(assert (=> b!485533 (= e!285882 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!485534 () Bool)

(declare-fun res!289191 () Bool)

(assert (=> b!485534 (=> (not res!289191) (not e!285882))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485534 (= res!289191 (and (= (size!15467 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15467 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15467 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485535 () Bool)

(declare-fun res!289192 () Bool)

(assert (=> b!485535 (=> (not res!289192) (not e!285882))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485535 (= res!289192 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485536 () Bool)

(declare-fun res!289190 () Bool)

(assert (=> b!485536 (=> (not res!289190) (not e!285882))))

(assert (=> b!485536 (= res!289190 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44042 res!289189) b!485534))

(assert (= (and b!485534 res!289191) b!485532))

(assert (= (and b!485532 res!289188) b!485536))

(assert (= (and b!485536 res!289190) b!485535))

(assert (= (and b!485535 res!289192) b!485533))

(declare-fun m!465877 () Bool)

(assert (=> b!485532 m!465877))

(assert (=> b!485532 m!465877))

(declare-fun m!465879 () Bool)

(assert (=> b!485532 m!465879))

(declare-fun m!465881 () Bool)

(assert (=> start!44042 m!465881))

(declare-fun m!465883 () Bool)

(assert (=> start!44042 m!465883))

(declare-fun m!465885 () Bool)

(assert (=> b!485535 m!465885))

(declare-fun m!465887 () Bool)

(assert (=> b!485536 m!465887))

(check-sat (not b!485535) (not start!44042) (not b!485532) (not b!485536))
(check-sat)
