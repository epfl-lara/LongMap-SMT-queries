; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44094 () Bool)

(assert start!44094)

(declare-fun b!485740 () Bool)

(declare-fun res!289485 () Bool)

(declare-fun e!285911 () Bool)

(assert (=> b!485740 (=> (not res!289485) (not e!285911))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31472 0))(
  ( (array!31473 (arr!15134 (Array (_ BitVec 32) (_ BitVec 64))) (size!15499 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31472)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485740 (= res!289485 (and (= (size!15499 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15499 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15499 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485741 () Bool)

(declare-fun res!289488 () Bool)

(assert (=> b!485741 (=> (not res!289488) (not e!285911))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485741 (= res!289488 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485742 () Bool)

(declare-fun e!285910 () Bool)

(assert (=> b!485742 (= e!285911 e!285910)))

(declare-fun res!289484 () Bool)

(assert (=> b!485742 (=> (not res!289484) (not e!285910))))

(declare-datatypes ((SeekEntryResult!3598 0))(
  ( (MissingZero!3598 (index!16571 (_ BitVec 32))) (Found!3598 (index!16572 (_ BitVec 32))) (Intermediate!3598 (undefined!4410 Bool) (index!16573 (_ BitVec 32)) (x!45717 (_ BitVec 32))) (Undefined!3598) (MissingVacant!3598 (index!16574 (_ BitVec 32))) )
))
(declare-fun lt!219379 () SeekEntryResult!3598)

(assert (=> b!485742 (= res!289484 (or (= lt!219379 (MissingZero!3598 i!1204)) (= lt!219379 (MissingVacant!3598 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31472 (_ BitVec 32)) SeekEntryResult!3598)

(assert (=> b!485742 (= lt!219379 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485743 () Bool)

(assert (=> b!485743 (= e!285910 (bvsgt #b00000000000000000000000000000000 (size!15499 a!3235)))))

(declare-fun b!485744 () Bool)

(declare-fun res!289486 () Bool)

(assert (=> b!485744 (=> (not res!289486) (not e!285911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485744 (= res!289486 (validKeyInArray!0 k0!2280))))

(declare-fun res!289487 () Bool)

(assert (=> start!44094 (=> (not res!289487) (not e!285911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44094 (= res!289487 (validMask!0 mask!3524))))

(assert (=> start!44094 e!285911))

(assert (=> start!44094 true))

(declare-fun array_inv!11017 (array!31472) Bool)

(assert (=> start!44094 (array_inv!11017 a!3235)))

(declare-fun b!485745 () Bool)

(declare-fun res!289490 () Bool)

(assert (=> b!485745 (=> (not res!289490) (not e!285910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31472 (_ BitVec 32)) Bool)

(assert (=> b!485745 (= res!289490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!485746 () Bool)

(declare-fun res!289489 () Bool)

(assert (=> b!485746 (=> (not res!289489) (not e!285911))))

(assert (=> b!485746 (= res!289489 (validKeyInArray!0 (select (arr!15134 a!3235) j!176)))))

(assert (= (and start!44094 res!289487) b!485740))

(assert (= (and b!485740 res!289485) b!485746))

(assert (= (and b!485746 res!289489) b!485744))

(assert (= (and b!485744 res!289486) b!485741))

(assert (= (and b!485741 res!289488) b!485742))

(assert (= (and b!485742 res!289484) b!485745))

(assert (= (and b!485745 res!289490) b!485743))

(declare-fun m!465333 () Bool)

(assert (=> b!485742 m!465333))

(declare-fun m!465335 () Bool)

(assert (=> b!485744 m!465335))

(declare-fun m!465337 () Bool)

(assert (=> start!44094 m!465337))

(declare-fun m!465339 () Bool)

(assert (=> start!44094 m!465339))

(declare-fun m!465341 () Bool)

(assert (=> b!485741 m!465341))

(declare-fun m!465343 () Bool)

(assert (=> b!485745 m!465343))

(declare-fun m!465345 () Bool)

(assert (=> b!485746 m!465345))

(assert (=> b!485746 m!465345))

(declare-fun m!465347 () Bool)

(assert (=> b!485746 m!465347))

(check-sat (not b!485745) (not b!485746) (not b!485741) (not b!485742) (not start!44094) (not b!485744))
(check-sat)
