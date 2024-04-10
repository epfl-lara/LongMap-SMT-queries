; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45860 () Bool)

(assert start!45860)

(declare-fun b!507953 () Bool)

(declare-fun e!297238 () Bool)

(assert (=> b!507953 (= e!297238 false)))

(declare-fun lt!232126 () Bool)

(declare-datatypes ((array!32616 0))(
  ( (array!32617 (arr!15688 (Array (_ BitVec 32) (_ BitVec 64))) (size!16052 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32616)

(declare-datatypes ((List!9846 0))(
  ( (Nil!9843) (Cons!9842 (h!10719 (_ BitVec 64)) (t!16074 List!9846)) )
))
(declare-fun arrayNoDuplicates!0 (array!32616 (_ BitVec 32) List!9846) Bool)

(assert (=> b!507953 (= lt!232126 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9843))))

(declare-fun b!507954 () Bool)

(declare-fun res!308916 () Bool)

(declare-fun e!297239 () Bool)

(assert (=> b!507954 (=> (not res!308916) (not e!297239))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507954 (= res!308916 (validKeyInArray!0 k0!2280))))

(declare-fun b!507955 () Bool)

(declare-fun res!308914 () Bool)

(assert (=> b!507955 (=> (not res!308914) (not e!297239))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507955 (= res!308914 (and (= (size!16052 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16052 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16052 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507956 () Bool)

(declare-fun res!308915 () Bool)

(assert (=> b!507956 (=> (not res!308915) (not e!297239))))

(assert (=> b!507956 (= res!308915 (validKeyInArray!0 (select (arr!15688 a!3235) j!176)))))

(declare-fun b!507957 () Bool)

(declare-fun res!308918 () Bool)

(assert (=> b!507957 (=> (not res!308918) (not e!297238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32616 (_ BitVec 32)) Bool)

(assert (=> b!507957 (= res!308918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!308913 () Bool)

(assert (=> start!45860 (=> (not res!308913) (not e!297239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45860 (= res!308913 (validMask!0 mask!3524))))

(assert (=> start!45860 e!297239))

(assert (=> start!45860 true))

(declare-fun array_inv!11484 (array!32616) Bool)

(assert (=> start!45860 (array_inv!11484 a!3235)))

(declare-fun b!507958 () Bool)

(assert (=> b!507958 (= e!297239 e!297238)))

(declare-fun res!308912 () Bool)

(assert (=> b!507958 (=> (not res!308912) (not e!297238))))

(declare-datatypes ((SeekEntryResult!4155 0))(
  ( (MissingZero!4155 (index!18808 (_ BitVec 32))) (Found!4155 (index!18809 (_ BitVec 32))) (Intermediate!4155 (undefined!4967 Bool) (index!18810 (_ BitVec 32)) (x!47796 (_ BitVec 32))) (Undefined!4155) (MissingVacant!4155 (index!18811 (_ BitVec 32))) )
))
(declare-fun lt!232125 () SeekEntryResult!4155)

(assert (=> b!507958 (= res!308912 (or (= lt!232125 (MissingZero!4155 i!1204)) (= lt!232125 (MissingVacant!4155 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32616 (_ BitVec 32)) SeekEntryResult!4155)

(assert (=> b!507958 (= lt!232125 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507959 () Bool)

(declare-fun res!308917 () Bool)

(assert (=> b!507959 (=> (not res!308917) (not e!297239))))

(declare-fun arrayContainsKey!0 (array!32616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507959 (= res!308917 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45860 res!308913) b!507955))

(assert (= (and b!507955 res!308914) b!507956))

(assert (= (and b!507956 res!308915) b!507954))

(assert (= (and b!507954 res!308916) b!507959))

(assert (= (and b!507959 res!308917) b!507958))

(assert (= (and b!507958 res!308912) b!507957))

(assert (= (and b!507957 res!308918) b!507953))

(declare-fun m!488805 () Bool)

(assert (=> b!507954 m!488805))

(declare-fun m!488807 () Bool)

(assert (=> b!507956 m!488807))

(assert (=> b!507956 m!488807))

(declare-fun m!488809 () Bool)

(assert (=> b!507956 m!488809))

(declare-fun m!488811 () Bool)

(assert (=> b!507957 m!488811))

(declare-fun m!488813 () Bool)

(assert (=> b!507958 m!488813))

(declare-fun m!488815 () Bool)

(assert (=> b!507959 m!488815))

(declare-fun m!488817 () Bool)

(assert (=> b!507953 m!488817))

(declare-fun m!488819 () Bool)

(assert (=> start!45860 m!488819))

(declare-fun m!488821 () Bool)

(assert (=> start!45860 m!488821))

(check-sat (not b!507954) (not b!507956) (not b!507957) (not b!507958) (not b!507953) (not b!507959) (not start!45860))
(check-sat)
