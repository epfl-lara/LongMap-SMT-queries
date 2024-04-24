; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45854 () Bool)

(assert start!45854)

(declare-fun b!507934 () Bool)

(declare-fun res!308950 () Bool)

(declare-fun e!297218 () Bool)

(assert (=> b!507934 (=> (not res!308950) (not e!297218))))

(declare-datatypes ((array!32611 0))(
  ( (array!32612 (arr!15685 (Array (_ BitVec 32) (_ BitVec 64))) (size!16049 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32611)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507934 (= res!308950 (validKeyInArray!0 (select (arr!15685 a!3235) j!176)))))

(declare-fun res!308952 () Bool)

(assert (=> start!45854 (=> (not res!308952) (not e!297218))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45854 (= res!308952 (validMask!0 mask!3524))))

(assert (=> start!45854 e!297218))

(assert (=> start!45854 true))

(declare-fun array_inv!11544 (array!32611) Bool)

(assert (=> start!45854 (array_inv!11544 a!3235)))

(declare-fun b!507935 () Bool)

(declare-fun res!308948 () Bool)

(assert (=> b!507935 (=> (not res!308948) (not e!297218))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507935 (= res!308948 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507936 () Bool)

(declare-fun e!297217 () Bool)

(assert (=> b!507936 (= e!297218 e!297217)))

(declare-fun res!308951 () Bool)

(assert (=> b!507936 (=> (not res!308951) (not e!297217))))

(declare-datatypes ((SeekEntryResult!4108 0))(
  ( (MissingZero!4108 (index!18620 (_ BitVec 32))) (Found!4108 (index!18621 (_ BitVec 32))) (Intermediate!4108 (undefined!4920 Bool) (index!18622 (_ BitVec 32)) (x!47754 (_ BitVec 32))) (Undefined!4108) (MissingVacant!4108 (index!18623 (_ BitVec 32))) )
))
(declare-fun lt!232149 () SeekEntryResult!4108)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507936 (= res!308951 (or (= lt!232149 (MissingZero!4108 i!1204)) (= lt!232149 (MissingVacant!4108 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32611 (_ BitVec 32)) SeekEntryResult!4108)

(assert (=> b!507936 (= lt!232149 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507937 () Bool)

(assert (=> b!507937 (= e!297217 false)))

(declare-fun lt!232150 () Bool)

(declare-datatypes ((List!9750 0))(
  ( (Nil!9747) (Cons!9746 (h!10623 (_ BitVec 64)) (t!15970 List!9750)) )
))
(declare-fun arrayNoDuplicates!0 (array!32611 (_ BitVec 32) List!9750) Bool)

(assert (=> b!507937 (= lt!232150 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9747))))

(declare-fun b!507938 () Bool)

(declare-fun res!308947 () Bool)

(assert (=> b!507938 (=> (not res!308947) (not e!297218))))

(assert (=> b!507938 (= res!308947 (validKeyInArray!0 k0!2280))))

(declare-fun b!507939 () Bool)

(declare-fun res!308953 () Bool)

(assert (=> b!507939 (=> (not res!308953) (not e!297218))))

(assert (=> b!507939 (= res!308953 (and (= (size!16049 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16049 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16049 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507940 () Bool)

(declare-fun res!308949 () Bool)

(assert (=> b!507940 (=> (not res!308949) (not e!297217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32611 (_ BitVec 32)) Bool)

(assert (=> b!507940 (= res!308949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45854 res!308952) b!507939))

(assert (= (and b!507939 res!308953) b!507934))

(assert (= (and b!507934 res!308950) b!507938))

(assert (= (and b!507938 res!308947) b!507935))

(assert (= (and b!507935 res!308948) b!507936))

(assert (= (and b!507936 res!308951) b!507940))

(assert (= (and b!507940 res!308949) b!507937))

(declare-fun m!489025 () Bool)

(assert (=> b!507938 m!489025))

(declare-fun m!489027 () Bool)

(assert (=> b!507940 m!489027))

(declare-fun m!489029 () Bool)

(assert (=> b!507935 m!489029))

(declare-fun m!489031 () Bool)

(assert (=> start!45854 m!489031))

(declare-fun m!489033 () Bool)

(assert (=> start!45854 m!489033))

(declare-fun m!489035 () Bool)

(assert (=> b!507936 m!489035))

(declare-fun m!489037 () Bool)

(assert (=> b!507934 m!489037))

(assert (=> b!507934 m!489037))

(declare-fun m!489039 () Bool)

(assert (=> b!507934 m!489039))

(declare-fun m!489041 () Bool)

(assert (=> b!507937 m!489041))

(check-sat (not b!507936) (not start!45854) (not b!507940) (not b!507937) (not b!507935) (not b!507938) (not b!507934))
(check-sat)
