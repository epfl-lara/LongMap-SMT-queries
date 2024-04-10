; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44096 () Bool)

(assert start!44096)

(declare-fun b!485932 () Bool)

(declare-fun res!289535 () Bool)

(declare-fun e!286053 () Bool)

(assert (=> b!485932 (=> (not res!289535) (not e!286053))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31464 0))(
  ( (array!31465 (arr!15130 (Array (_ BitVec 32) (_ BitVec 64))) (size!15494 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31464)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485932 (= res!289535 (and (= (size!15494 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15494 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15494 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289536 () Bool)

(assert (=> start!44096 (=> (not res!289536) (not e!286053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44096 (= res!289536 (validMask!0 mask!3524))))

(assert (=> start!44096 e!286053))

(assert (=> start!44096 true))

(declare-fun array_inv!10926 (array!31464) Bool)

(assert (=> start!44096 (array_inv!10926 a!3235)))

(declare-fun b!485933 () Bool)

(declare-fun res!289534 () Bool)

(assert (=> b!485933 (=> (not res!289534) (not e!286053))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485933 (= res!289534 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485934 () Bool)

(declare-fun res!289538 () Bool)

(assert (=> b!485934 (=> (not res!289538) (not e!286053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485934 (= res!289538 (validKeyInArray!0 k0!2280))))

(declare-fun b!485935 () Bool)

(declare-fun res!289537 () Bool)

(assert (=> b!485935 (=> (not res!289537) (not e!286053))))

(assert (=> b!485935 (= res!289537 (validKeyInArray!0 (select (arr!15130 a!3235) j!176)))))

(declare-fun b!485936 () Bool)

(assert (=> b!485936 (= e!286053 false)))

(declare-datatypes ((SeekEntryResult!3597 0))(
  ( (MissingZero!3597 (index!16567 (_ BitVec 32))) (Found!3597 (index!16568 (_ BitVec 32))) (Intermediate!3597 (undefined!4409 Bool) (index!16569 (_ BitVec 32)) (x!45705 (_ BitVec 32))) (Undefined!3597) (MissingVacant!3597 (index!16570 (_ BitVec 32))) )
))
(declare-fun lt!219598 () SeekEntryResult!3597)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31464 (_ BitVec 32)) SeekEntryResult!3597)

(assert (=> b!485936 (= lt!219598 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44096 res!289536) b!485932))

(assert (= (and b!485932 res!289535) b!485935))

(assert (= (and b!485935 res!289537) b!485934))

(assert (= (and b!485934 res!289538) b!485933))

(assert (= (and b!485933 res!289534) b!485936))

(declare-fun m!465995 () Bool)

(assert (=> start!44096 m!465995))

(declare-fun m!465997 () Bool)

(assert (=> start!44096 m!465997))

(declare-fun m!465999 () Bool)

(assert (=> b!485934 m!465999))

(declare-fun m!466001 () Bool)

(assert (=> b!485935 m!466001))

(assert (=> b!485935 m!466001))

(declare-fun m!466003 () Bool)

(assert (=> b!485935 m!466003))

(declare-fun m!466005 () Bool)

(assert (=> b!485933 m!466005))

(declare-fun m!466007 () Bool)

(assert (=> b!485936 m!466007))

(check-sat (not b!485933) (not b!485934) (not b!485935) (not b!485936) (not start!44096))
