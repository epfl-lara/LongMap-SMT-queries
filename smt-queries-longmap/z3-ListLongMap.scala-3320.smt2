; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45852 () Bool)

(assert start!45852)

(declare-fun res!308831 () Bool)

(declare-fun e!297083 () Bool)

(assert (=> start!45852 (=> (not res!308831) (not e!297083))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45852 (= res!308831 (validMask!0 mask!3524))))

(assert (=> start!45852 e!297083))

(assert (=> start!45852 true))

(declare-datatypes ((array!32618 0))(
  ( (array!32619 (arr!15689 (Array (_ BitVec 32) (_ BitVec 64))) (size!16054 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32618)

(declare-fun array_inv!11572 (array!32618) Bool)

(assert (=> start!45852 (array_inv!11572 a!3235)))

(declare-fun b!507724 () Bool)

(declare-fun res!308829 () Bool)

(assert (=> b!507724 (=> (not res!308829) (not e!297083))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507724 (= res!308829 (validKeyInArray!0 k0!2280))))

(declare-fun b!507725 () Bool)

(declare-fun e!297082 () Bool)

(assert (=> b!507725 (= e!297083 e!297082)))

(declare-fun res!308825 () Bool)

(assert (=> b!507725 (=> (not res!308825) (not e!297082))))

(declare-datatypes ((SeekEntryResult!4153 0))(
  ( (MissingZero!4153 (index!18800 (_ BitVec 32))) (Found!4153 (index!18801 (_ BitVec 32))) (Intermediate!4153 (undefined!4965 Bool) (index!18802 (_ BitVec 32)) (x!47797 (_ BitVec 32))) (Undefined!4153) (MissingVacant!4153 (index!18803 (_ BitVec 32))) )
))
(declare-fun lt!231904 () SeekEntryResult!4153)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507725 (= res!308825 (or (= lt!231904 (MissingZero!4153 i!1204)) (= lt!231904 (MissingVacant!4153 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32618 (_ BitVec 32)) SeekEntryResult!4153)

(assert (=> b!507725 (= lt!231904 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507726 () Bool)

(declare-fun res!308827 () Bool)

(assert (=> b!507726 (=> (not res!308827) (not e!297083))))

(declare-fun arrayContainsKey!0 (array!32618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507726 (= res!308827 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507727 () Bool)

(declare-fun res!308828 () Bool)

(assert (=> b!507727 (=> (not res!308828) (not e!297082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32618 (_ BitVec 32)) Bool)

(assert (=> b!507727 (= res!308828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507728 () Bool)

(assert (=> b!507728 (= e!297082 false)))

(declare-fun lt!231903 () Bool)

(declare-datatypes ((List!9886 0))(
  ( (Nil!9883) (Cons!9882 (h!10759 (_ BitVec 64)) (t!16105 List!9886)) )
))
(declare-fun arrayNoDuplicates!0 (array!32618 (_ BitVec 32) List!9886) Bool)

(assert (=> b!507728 (= lt!231903 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9883))))

(declare-fun b!507729 () Bool)

(declare-fun res!308830 () Bool)

(assert (=> b!507729 (=> (not res!308830) (not e!297083))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507729 (= res!308830 (and (= (size!16054 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16054 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16054 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507730 () Bool)

(declare-fun res!308826 () Bool)

(assert (=> b!507730 (=> (not res!308826) (not e!297083))))

(assert (=> b!507730 (= res!308826 (validKeyInArray!0 (select (arr!15689 a!3235) j!176)))))

(assert (= (and start!45852 res!308831) b!507729))

(assert (= (and b!507729 res!308830) b!507730))

(assert (= (and b!507730 res!308826) b!507724))

(assert (= (and b!507724 res!308829) b!507726))

(assert (= (and b!507726 res!308827) b!507725))

(assert (= (and b!507725 res!308825) b!507727))

(assert (= (and b!507727 res!308828) b!507728))

(declare-fun m!488089 () Bool)

(assert (=> start!45852 m!488089))

(declare-fun m!488091 () Bool)

(assert (=> start!45852 m!488091))

(declare-fun m!488093 () Bool)

(assert (=> b!507725 m!488093))

(declare-fun m!488095 () Bool)

(assert (=> b!507727 m!488095))

(declare-fun m!488097 () Bool)

(assert (=> b!507724 m!488097))

(declare-fun m!488099 () Bool)

(assert (=> b!507726 m!488099))

(declare-fun m!488101 () Bool)

(assert (=> b!507728 m!488101))

(declare-fun m!488103 () Bool)

(assert (=> b!507730 m!488103))

(assert (=> b!507730 m!488103))

(declare-fun m!488105 () Bool)

(assert (=> b!507730 m!488105))

(check-sat (not b!507724) (not b!507727) (not b!507725) (not b!507728) (not b!507730) (not start!45852) (not b!507726))
(check-sat)
