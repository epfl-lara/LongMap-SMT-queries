; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44102 () Bool)

(assert start!44102)

(declare-fun b!485977 () Bool)

(declare-fun res!289579 () Bool)

(declare-fun e!286071 () Bool)

(assert (=> b!485977 (=> (not res!289579) (not e!286071))))

(declare-datatypes ((array!31470 0))(
  ( (array!31471 (arr!15133 (Array (_ BitVec 32) (_ BitVec 64))) (size!15497 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31470)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485977 (= res!289579 (validKeyInArray!0 (select (arr!15133 a!3235) j!176)))))

(declare-fun b!485978 () Bool)

(declare-fun res!289583 () Bool)

(assert (=> b!485978 (=> (not res!289583) (not e!286071))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!485978 (= res!289583 (validKeyInArray!0 k0!2280))))

(declare-fun b!485979 () Bool)

(declare-fun res!289581 () Bool)

(assert (=> b!485979 (=> (not res!289581) (not e!286071))))

(declare-fun arrayContainsKey!0 (array!31470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485979 (= res!289581 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289582 () Bool)

(assert (=> start!44102 (=> (not res!289582) (not e!286071))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44102 (= res!289582 (validMask!0 mask!3524))))

(assert (=> start!44102 e!286071))

(assert (=> start!44102 true))

(declare-fun array_inv!10929 (array!31470) Bool)

(assert (=> start!44102 (array_inv!10929 a!3235)))

(declare-fun b!485980 () Bool)

(declare-fun res!289580 () Bool)

(assert (=> b!485980 (=> (not res!289580) (not e!286071))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485980 (= res!289580 (and (= (size!15497 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15497 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15497 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485981 () Bool)

(declare-datatypes ((SeekEntryResult!3600 0))(
  ( (MissingZero!3600 (index!16579 (_ BitVec 32))) (Found!3600 (index!16580 (_ BitVec 32))) (Intermediate!3600 (undefined!4412 Bool) (index!16581 (_ BitVec 32)) (x!45716 (_ BitVec 32))) (Undefined!3600) (MissingVacant!3600 (index!16582 (_ BitVec 32))) )
))
(declare-fun lt!219607 () SeekEntryResult!3600)

(assert (=> b!485981 (= e!286071 (and (or (= lt!219607 (MissingZero!3600 i!1204)) (= lt!219607 (MissingVacant!3600 i!1204))) (bvsgt #b00000000000000000000000000000000 (size!15497 a!3235))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31470 (_ BitVec 32)) SeekEntryResult!3600)

(assert (=> b!485981 (= lt!219607 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44102 res!289582) b!485980))

(assert (= (and b!485980 res!289580) b!485977))

(assert (= (and b!485977 res!289579) b!485978))

(assert (= (and b!485978 res!289583) b!485979))

(assert (= (and b!485979 res!289581) b!485981))

(declare-fun m!466037 () Bool)

(assert (=> b!485981 m!466037))

(declare-fun m!466039 () Bool)

(assert (=> b!485978 m!466039))

(declare-fun m!466041 () Bool)

(assert (=> start!44102 m!466041))

(declare-fun m!466043 () Bool)

(assert (=> start!44102 m!466043))

(declare-fun m!466045 () Bool)

(assert (=> b!485977 m!466045))

(assert (=> b!485977 m!466045))

(declare-fun m!466047 () Bool)

(assert (=> b!485977 m!466047))

(declare-fun m!466049 () Bool)

(assert (=> b!485979 m!466049))

(check-sat (not b!485977) (not start!44102) (not b!485979) (not b!485981) (not b!485978))
(check-sat)
