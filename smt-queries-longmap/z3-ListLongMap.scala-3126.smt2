; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44040 () Bool)

(assert start!44040)

(declare-fun b!485322 () Bool)

(declare-fun res!289066 () Bool)

(declare-fun e!285746 () Bool)

(assert (=> b!485322 (=> (not res!289066) (not e!285746))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31418 0))(
  ( (array!31419 (arr!15107 (Array (_ BitVec 32) (_ BitVec 64))) (size!15472 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31418)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!485322 (= res!289066 (and (= (size!15472 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15472 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15472 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485323 () Bool)

(declare-fun res!289069 () Bool)

(assert (=> b!485323 (=> (not res!289069) (not e!285746))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485323 (= res!289069 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485324 () Bool)

(declare-fun res!289068 () Bool)

(assert (=> b!485324 (=> (not res!289068) (not e!285746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485324 (= res!289068 (validKeyInArray!0 (select (arr!15107 a!3235) j!176)))))

(declare-fun b!485325 () Bool)

(declare-fun res!289067 () Bool)

(assert (=> b!485325 (=> (not res!289067) (not e!285746))))

(assert (=> b!485325 (= res!289067 (validKeyInArray!0 k0!2280))))

(declare-fun res!289070 () Bool)

(assert (=> start!44040 (=> (not res!289070) (not e!285746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44040 (= res!289070 (validMask!0 mask!3524))))

(assert (=> start!44040 e!285746))

(assert (=> start!44040 true))

(declare-fun array_inv!10990 (array!31418) Bool)

(assert (=> start!44040 (array_inv!10990 a!3235)))

(declare-fun b!485326 () Bool)

(assert (=> b!485326 (= e!285746 (bvslt mask!3524 #b00000000000000000000000000000000))))

(assert (= (and start!44040 res!289070) b!485322))

(assert (= (and b!485322 res!289066) b!485324))

(assert (= (and b!485324 res!289068) b!485325))

(assert (= (and b!485325 res!289067) b!485323))

(assert (= (and b!485323 res!289069) b!485326))

(declare-fun m!464961 () Bool)

(assert (=> b!485323 m!464961))

(declare-fun m!464963 () Bool)

(assert (=> b!485324 m!464963))

(assert (=> b!485324 m!464963))

(declare-fun m!464965 () Bool)

(assert (=> b!485324 m!464965))

(declare-fun m!464967 () Bool)

(assert (=> b!485325 m!464967))

(declare-fun m!464969 () Bool)

(assert (=> start!44040 m!464969))

(declare-fun m!464971 () Bool)

(assert (=> start!44040 m!464971))

(check-sat (not b!485325) (not b!485324) (not b!485323) (not start!44040))
(check-sat)
