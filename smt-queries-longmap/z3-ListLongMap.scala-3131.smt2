; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44084 () Bool)

(assert start!44084)

(declare-fun b!485842 () Bool)

(declare-fun res!289445 () Bool)

(declare-fun e!286017 () Bool)

(assert (=> b!485842 (=> (not res!289445) (not e!286017))))

(declare-datatypes ((array!31452 0))(
  ( (array!31453 (arr!15124 (Array (_ BitVec 32) (_ BitVec 64))) (size!15488 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31452)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485842 (= res!289445 (validKeyInArray!0 (select (arr!15124 a!3235) j!176)))))

(declare-fun b!485843 () Bool)

(assert (=> b!485843 (= e!286017 false)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3591 0))(
  ( (MissingZero!3591 (index!16543 (_ BitVec 32))) (Found!3591 (index!16544 (_ BitVec 32))) (Intermediate!3591 (undefined!4403 Bool) (index!16545 (_ BitVec 32)) (x!45683 (_ BitVec 32))) (Undefined!3591) (MissingVacant!3591 (index!16546 (_ BitVec 32))) )
))
(declare-fun lt!219580 () SeekEntryResult!3591)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31452 (_ BitVec 32)) SeekEntryResult!3591)

(assert (=> b!485843 (= lt!219580 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485844 () Bool)

(declare-fun res!289446 () Bool)

(assert (=> b!485844 (=> (not res!289446) (not e!286017))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485844 (= res!289446 (and (= (size!15488 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15488 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15488 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289447 () Bool)

(assert (=> start!44084 (=> (not res!289447) (not e!286017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44084 (= res!289447 (validMask!0 mask!3524))))

(assert (=> start!44084 e!286017))

(assert (=> start!44084 true))

(declare-fun array_inv!10920 (array!31452) Bool)

(assert (=> start!44084 (array_inv!10920 a!3235)))

(declare-fun b!485845 () Bool)

(declare-fun res!289448 () Bool)

(assert (=> b!485845 (=> (not res!289448) (not e!286017))))

(assert (=> b!485845 (= res!289448 (validKeyInArray!0 k0!2280))))

(declare-fun b!485846 () Bool)

(declare-fun res!289444 () Bool)

(assert (=> b!485846 (=> (not res!289444) (not e!286017))))

(declare-fun arrayContainsKey!0 (array!31452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485846 (= res!289444 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44084 res!289447) b!485844))

(assert (= (and b!485844 res!289446) b!485842))

(assert (= (and b!485842 res!289445) b!485845))

(assert (= (and b!485845 res!289448) b!485846))

(assert (= (and b!485846 res!289444) b!485843))

(declare-fun m!465911 () Bool)

(assert (=> b!485842 m!465911))

(assert (=> b!485842 m!465911))

(declare-fun m!465913 () Bool)

(assert (=> b!485842 m!465913))

(declare-fun m!465915 () Bool)

(assert (=> b!485846 m!465915))

(declare-fun m!465917 () Bool)

(assert (=> b!485843 m!465917))

(declare-fun m!465919 () Bool)

(assert (=> b!485845 m!465919))

(declare-fun m!465921 () Bool)

(assert (=> start!44084 m!465921))

(declare-fun m!465923 () Bool)

(assert (=> start!44084 m!465923))

(check-sat (not b!485843) (not b!485845) (not b!485846) (not start!44084) (not b!485842))
