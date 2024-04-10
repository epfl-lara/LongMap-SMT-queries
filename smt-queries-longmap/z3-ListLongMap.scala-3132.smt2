; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44090 () Bool)

(assert start!44090)

(declare-fun res!289491 () Bool)

(declare-fun e!286035 () Bool)

(assert (=> start!44090 (=> (not res!289491) (not e!286035))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44090 (= res!289491 (validMask!0 mask!3524))))

(assert (=> start!44090 e!286035))

(assert (=> start!44090 true))

(declare-datatypes ((array!31458 0))(
  ( (array!31459 (arr!15127 (Array (_ BitVec 32) (_ BitVec 64))) (size!15491 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31458)

(declare-fun array_inv!10923 (array!31458) Bool)

(assert (=> start!44090 (array_inv!10923 a!3235)))

(declare-fun b!485887 () Bool)

(declare-fun res!289489 () Bool)

(assert (=> b!485887 (=> (not res!289489) (not e!286035))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485887 (= res!289489 (and (= (size!15491 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15491 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15491 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485888 () Bool)

(declare-fun res!289493 () Bool)

(assert (=> b!485888 (=> (not res!289493) (not e!286035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485888 (= res!289493 (validKeyInArray!0 (select (arr!15127 a!3235) j!176)))))

(declare-fun b!485889 () Bool)

(assert (=> b!485889 (= e!286035 false)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3594 0))(
  ( (MissingZero!3594 (index!16555 (_ BitVec 32))) (Found!3594 (index!16556 (_ BitVec 32))) (Intermediate!3594 (undefined!4406 Bool) (index!16557 (_ BitVec 32)) (x!45694 (_ BitVec 32))) (Undefined!3594) (MissingVacant!3594 (index!16558 (_ BitVec 32))) )
))
(declare-fun lt!219589 () SeekEntryResult!3594)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31458 (_ BitVec 32)) SeekEntryResult!3594)

(assert (=> b!485889 (= lt!219589 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485890 () Bool)

(declare-fun res!289490 () Bool)

(assert (=> b!485890 (=> (not res!289490) (not e!286035))))

(assert (=> b!485890 (= res!289490 (validKeyInArray!0 k0!2280))))

(declare-fun b!485891 () Bool)

(declare-fun res!289492 () Bool)

(assert (=> b!485891 (=> (not res!289492) (not e!286035))))

(declare-fun arrayContainsKey!0 (array!31458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485891 (= res!289492 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44090 res!289491) b!485887))

(assert (= (and b!485887 res!289489) b!485888))

(assert (= (and b!485888 res!289493) b!485890))

(assert (= (and b!485890 res!289490) b!485891))

(assert (= (and b!485891 res!289492) b!485889))

(declare-fun m!465953 () Bool)

(assert (=> b!485891 m!465953))

(declare-fun m!465955 () Bool)

(assert (=> start!44090 m!465955))

(declare-fun m!465957 () Bool)

(assert (=> start!44090 m!465957))

(declare-fun m!465959 () Bool)

(assert (=> b!485890 m!465959))

(declare-fun m!465961 () Bool)

(assert (=> b!485888 m!465961))

(assert (=> b!485888 m!465961))

(declare-fun m!465963 () Bool)

(assert (=> b!485888 m!465963))

(declare-fun m!465965 () Bool)

(assert (=> b!485889 m!465965))

(check-sat (not start!44090) (not b!485889) (not b!485891) (not b!485888) (not b!485890))
