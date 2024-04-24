; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44096 () Bool)

(assert start!44096)

(declare-fun res!289610 () Bool)

(declare-fun e!286046 () Bool)

(assert (=> start!44096 (=> (not res!289610) (not e!286046))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44096 (= res!289610 (validMask!0 mask!3524))))

(assert (=> start!44096 e!286046))

(assert (=> start!44096 true))

(declare-datatypes ((array!31465 0))(
  ( (array!31466 (arr!15130 (Array (_ BitVec 32) (_ BitVec 64))) (size!15494 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31465)

(declare-fun array_inv!10989 (array!31465) Bool)

(assert (=> start!44096 (array_inv!10989 a!3235)))

(declare-fun b!485950 () Bool)

(declare-fun res!289612 () Bool)

(assert (=> b!485950 (=> (not res!289612) (not e!286046))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485950 (= res!289612 (validKeyInArray!0 (select (arr!15130 a!3235) j!176)))))

(declare-fun b!485951 () Bool)

(declare-fun res!289607 () Bool)

(declare-fun e!286047 () Bool)

(assert (=> b!485951 (=> (not res!289607) (not e!286047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31465 (_ BitVec 32)) Bool)

(assert (=> b!485951 (= res!289607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!485952 () Bool)

(declare-fun res!289609 () Bool)

(assert (=> b!485952 (=> (not res!289609) (not e!286046))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485952 (= res!289609 (and (= (size!15494 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15494 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15494 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485953 () Bool)

(declare-fun res!289608 () Bool)

(assert (=> b!485953 (=> (not res!289608) (not e!286046))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485953 (= res!289608 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485954 () Bool)

(declare-fun res!289611 () Bool)

(assert (=> b!485954 (=> (not res!289611) (not e!286046))))

(assert (=> b!485954 (= res!289611 (validKeyInArray!0 k0!2280))))

(declare-fun b!485955 () Bool)

(assert (=> b!485955 (= e!286046 e!286047)))

(declare-fun res!289606 () Bool)

(assert (=> b!485955 (=> (not res!289606) (not e!286047))))

(declare-datatypes ((SeekEntryResult!3553 0))(
  ( (MissingZero!3553 (index!16391 (_ BitVec 32))) (Found!3553 (index!16392 (_ BitVec 32))) (Intermediate!3553 (undefined!4365 Bool) (index!16393 (_ BitVec 32)) (x!45674 (_ BitVec 32))) (Undefined!3553) (MissingVacant!3553 (index!16394 (_ BitVec 32))) )
))
(declare-fun lt!219625 () SeekEntryResult!3553)

(assert (=> b!485955 (= res!289606 (or (= lt!219625 (MissingZero!3553 i!1204)) (= lt!219625 (MissingVacant!3553 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31465 (_ BitVec 32)) SeekEntryResult!3553)

(assert (=> b!485955 (= lt!219625 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485956 () Bool)

(assert (=> b!485956 (= e!286047 (bvsgt #b00000000000000000000000000000000 (size!15494 a!3235)))))

(assert (= (and start!44096 res!289610) b!485952))

(assert (= (and b!485952 res!289609) b!485950))

(assert (= (and b!485950 res!289612) b!485954))

(assert (= (and b!485954 res!289611) b!485953))

(assert (= (and b!485953 res!289608) b!485955))

(assert (= (and b!485955 res!289606) b!485951))

(assert (= (and b!485951 res!289607) b!485956))

(declare-fun m!466249 () Bool)

(assert (=> b!485954 m!466249))

(declare-fun m!466251 () Bool)

(assert (=> b!485955 m!466251))

(declare-fun m!466253 () Bool)

(assert (=> start!44096 m!466253))

(declare-fun m!466255 () Bool)

(assert (=> start!44096 m!466255))

(declare-fun m!466257 () Bool)

(assert (=> b!485953 m!466257))

(declare-fun m!466259 () Bool)

(assert (=> b!485951 m!466259))

(declare-fun m!466261 () Bool)

(assert (=> b!485950 m!466261))

(assert (=> b!485950 m!466261))

(declare-fun m!466263 () Bool)

(assert (=> b!485950 m!466263))

(check-sat (not b!485953) (not b!485951) (not start!44096) (not b!485950) (not b!485954) (not b!485955))
(check-sat)
