; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44088 () Bool)

(assert start!44088)

(declare-fun res!289437 () Bool)

(declare-fun e!285890 () Bool)

(assert (=> start!44088 (=> (not res!289437) (not e!285890))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44088 (= res!289437 (validMask!0 mask!3524))))

(assert (=> start!44088 e!285890))

(assert (=> start!44088 true))

(declare-datatypes ((array!31466 0))(
  ( (array!31467 (arr!15131 (Array (_ BitVec 32) (_ BitVec 64))) (size!15496 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31466)

(declare-fun array_inv!11014 (array!31466) Bool)

(assert (=> start!44088 (array_inv!11014 a!3235)))

(declare-fun b!485691 () Bool)

(declare-fun res!289438 () Bool)

(assert (=> b!485691 (=> (not res!289438) (not e!285890))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485691 (= res!289438 (validKeyInArray!0 k0!2280))))

(declare-fun b!485692 () Bool)

(declare-fun res!289436 () Bool)

(assert (=> b!485692 (=> (not res!289436) (not e!285890))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485692 (= res!289436 (validKeyInArray!0 (select (arr!15131 a!3235) j!176)))))

(declare-fun b!485693 () Bool)

(declare-fun res!289435 () Bool)

(assert (=> b!485693 (=> (not res!289435) (not e!285890))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485693 (= res!289435 (and (= (size!15496 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15496 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15496 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485694 () Bool)

(declare-datatypes ((SeekEntryResult!3595 0))(
  ( (MissingZero!3595 (index!16559 (_ BitVec 32))) (Found!3595 (index!16560 (_ BitVec 32))) (Intermediate!3595 (undefined!4407 Bool) (index!16561 (_ BitVec 32)) (x!45706 (_ BitVec 32))) (Undefined!3595) (MissingVacant!3595 (index!16562 (_ BitVec 32))) )
))
(declare-fun lt!219370 () SeekEntryResult!3595)

(assert (=> b!485694 (= e!285890 (and (or (= lt!219370 (MissingZero!3595 i!1204)) (= lt!219370 (MissingVacant!3595 i!1204))) (bvsgt #b00000000000000000000000000000000 (size!15496 a!3235))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31466 (_ BitVec 32)) SeekEntryResult!3595)

(assert (=> b!485694 (= lt!219370 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485695 () Bool)

(declare-fun res!289439 () Bool)

(assert (=> b!485695 (=> (not res!289439) (not e!285890))))

(declare-fun arrayContainsKey!0 (array!31466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485695 (= res!289439 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44088 res!289437) b!485693))

(assert (= (and b!485693 res!289435) b!485692))

(assert (= (and b!485692 res!289436) b!485691))

(assert (= (and b!485691 res!289438) b!485695))

(assert (= (and b!485695 res!289439) b!485694))

(declare-fun m!465291 () Bool)

(assert (=> b!485694 m!465291))

(declare-fun m!465293 () Bool)

(assert (=> start!44088 m!465293))

(declare-fun m!465295 () Bool)

(assert (=> start!44088 m!465295))

(declare-fun m!465297 () Bool)

(assert (=> b!485692 m!465297))

(assert (=> b!485692 m!465297))

(declare-fun m!465299 () Bool)

(assert (=> b!485692 m!465299))

(declare-fun m!465301 () Bool)

(assert (=> b!485695 m!465301))

(declare-fun m!465303 () Bool)

(assert (=> b!485691 m!465303))

(check-sat (not b!485695) (not b!485694) (not b!485692) (not b!485691) (not start!44088))
(check-sat)
