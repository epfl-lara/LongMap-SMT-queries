; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44078 () Bool)

(assert start!44078)

(declare-fun b!485797 () Bool)

(declare-fun res!289401 () Bool)

(declare-fun e!285998 () Bool)

(assert (=> b!485797 (=> (not res!289401) (not e!285998))))

(declare-datatypes ((array!31446 0))(
  ( (array!31447 (arr!15121 (Array (_ BitVec 32) (_ BitVec 64))) (size!15485 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31446)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485797 (= res!289401 (validKeyInArray!0 (select (arr!15121 a!3235) j!176)))))

(declare-fun b!485798 () Bool)

(declare-fun res!289403 () Bool)

(assert (=> b!485798 (=> (not res!289403) (not e!285998))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485798 (= res!289403 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289400 () Bool)

(assert (=> start!44078 (=> (not res!289400) (not e!285998))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44078 (= res!289400 (validMask!0 mask!3524))))

(assert (=> start!44078 e!285998))

(assert (=> start!44078 true))

(declare-fun array_inv!10917 (array!31446) Bool)

(assert (=> start!44078 (array_inv!10917 a!3235)))

(declare-fun b!485799 () Bool)

(assert (=> b!485799 (= e!285998 false)))

(declare-datatypes ((SeekEntryResult!3588 0))(
  ( (MissingZero!3588 (index!16531 (_ BitVec 32))) (Found!3588 (index!16532 (_ BitVec 32))) (Intermediate!3588 (undefined!4400 Bool) (index!16533 (_ BitVec 32)) (x!45672 (_ BitVec 32))) (Undefined!3588) (MissingVacant!3588 (index!16534 (_ BitVec 32))) )
))
(declare-fun lt!219571 () SeekEntryResult!3588)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31446 (_ BitVec 32)) SeekEntryResult!3588)

(assert (=> b!485799 (= lt!219571 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485800 () Bool)

(declare-fun res!289402 () Bool)

(assert (=> b!485800 (=> (not res!289402) (not e!285998))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485800 (= res!289402 (and (= (size!15485 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15485 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15485 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485801 () Bool)

(declare-fun res!289399 () Bool)

(assert (=> b!485801 (=> (not res!289399) (not e!285998))))

(assert (=> b!485801 (= res!289399 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44078 res!289400) b!485800))

(assert (= (and b!485800 res!289402) b!485797))

(assert (= (and b!485797 res!289401) b!485801))

(assert (= (and b!485801 res!289399) b!485798))

(assert (= (and b!485798 res!289403) b!485799))

(declare-fun m!465869 () Bool)

(assert (=> b!485797 m!465869))

(assert (=> b!485797 m!465869))

(declare-fun m!465871 () Bool)

(assert (=> b!485797 m!465871))

(declare-fun m!465873 () Bool)

(assert (=> b!485801 m!465873))

(declare-fun m!465875 () Bool)

(assert (=> start!44078 m!465875))

(declare-fun m!465877 () Bool)

(assert (=> start!44078 m!465877))

(declare-fun m!465879 () Bool)

(assert (=> b!485798 m!465879))

(declare-fun m!465881 () Bool)

(assert (=> b!485799 m!465881))

(check-sat (not b!485797) (not b!485799) (not b!485801) (not start!44078) (not b!485798))
