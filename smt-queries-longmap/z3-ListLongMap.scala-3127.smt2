; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44060 () Bool)

(assert start!44060)

(declare-fun res!289259 () Bool)

(declare-fun e!285945 () Bool)

(assert (=> start!44060 (=> (not res!289259) (not e!285945))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44060 (= res!289259 (validMask!0 mask!3524))))

(assert (=> start!44060 e!285945))

(assert (=> start!44060 true))

(declare-datatypes ((array!31428 0))(
  ( (array!31429 (arr!15112 (Array (_ BitVec 32) (_ BitVec 64))) (size!15476 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31428)

(declare-fun array_inv!10908 (array!31428) Bool)

(assert (=> start!44060 (array_inv!10908 a!3235)))

(declare-fun b!485653 () Bool)

(declare-fun res!289257 () Bool)

(assert (=> b!485653 (=> (not res!289257) (not e!285945))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485653 (= res!289257 (validKeyInArray!0 k0!2280))))

(declare-fun b!485654 () Bool)

(declare-fun res!289255 () Bool)

(assert (=> b!485654 (=> (not res!289255) (not e!285945))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485654 (= res!289255 (validKeyInArray!0 (select (arr!15112 a!3235) j!176)))))

(declare-fun b!485655 () Bool)

(assert (=> b!485655 (= e!285945 false)))

(declare-datatypes ((SeekEntryResult!3579 0))(
  ( (MissingZero!3579 (index!16495 (_ BitVec 32))) (Found!3579 (index!16496 (_ BitVec 32))) (Intermediate!3579 (undefined!4391 Bool) (index!16497 (_ BitVec 32)) (x!45639 (_ BitVec 32))) (Undefined!3579) (MissingVacant!3579 (index!16498 (_ BitVec 32))) )
))
(declare-fun lt!219553 () SeekEntryResult!3579)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31428 (_ BitVec 32)) SeekEntryResult!3579)

(assert (=> b!485655 (= lt!219553 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485656 () Bool)

(declare-fun res!289256 () Bool)

(assert (=> b!485656 (=> (not res!289256) (not e!285945))))

(declare-fun arrayContainsKey!0 (array!31428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485656 (= res!289256 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485657 () Bool)

(declare-fun res!289258 () Bool)

(assert (=> b!485657 (=> (not res!289258) (not e!285945))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485657 (= res!289258 (and (= (size!15476 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15476 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15476 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44060 res!289259) b!485657))

(assert (= (and b!485657 res!289258) b!485654))

(assert (= (and b!485654 res!289255) b!485653))

(assert (= (and b!485653 res!289257) b!485656))

(assert (= (and b!485656 res!289256) b!485655))

(declare-fun m!465743 () Bool)

(assert (=> start!44060 m!465743))

(declare-fun m!465745 () Bool)

(assert (=> start!44060 m!465745))

(declare-fun m!465747 () Bool)

(assert (=> b!485655 m!465747))

(declare-fun m!465749 () Bool)

(assert (=> b!485656 m!465749))

(declare-fun m!465751 () Bool)

(assert (=> b!485654 m!465751))

(assert (=> b!485654 m!465751))

(declare-fun m!465753 () Bool)

(assert (=> b!485654 m!465753))

(declare-fun m!465755 () Bool)

(assert (=> b!485653 m!465755))

(check-sat (not b!485656) (not b!485653) (not b!485655) (not b!485654) (not start!44060))
