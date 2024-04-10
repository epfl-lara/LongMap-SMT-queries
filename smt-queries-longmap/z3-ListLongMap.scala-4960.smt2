; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68272 () Bool)

(assert start!68272)

(declare-fun b!793122 () Bool)

(declare-fun res!537642 () Bool)

(declare-fun e!440638 () Bool)

(assert (=> b!793122 (=> (not res!537642) (not e!440638))))

(declare-datatypes ((array!43062 0))(
  ( (array!43063 (arr!20611 (Array (_ BitVec 32) (_ BitVec 64))) (size!21032 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43062)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793122 (= res!537642 (validKeyInArray!0 (select (arr!20611 a!3170) j!153)))))

(declare-fun res!537646 () Bool)

(assert (=> start!68272 (=> (not res!537646) (not e!440638))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68272 (= res!537646 (validMask!0 mask!3266))))

(assert (=> start!68272 e!440638))

(assert (=> start!68272 true))

(declare-fun array_inv!16407 (array!43062) Bool)

(assert (=> start!68272 (array_inv!16407 a!3170)))

(declare-fun b!793123 () Bool)

(declare-fun e!440637 () Bool)

(assert (=> b!793123 (= e!440637 false)))

(declare-fun lt!353650 () Bool)

(declare-datatypes ((List!14574 0))(
  ( (Nil!14571) (Cons!14570 (h!15699 (_ BitVec 64)) (t!20889 List!14574)) )
))
(declare-fun arrayNoDuplicates!0 (array!43062 (_ BitVec 32) List!14574) Bool)

(assert (=> b!793123 (= lt!353650 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14571))))

(declare-fun b!793124 () Bool)

(declare-fun res!537645 () Bool)

(assert (=> b!793124 (=> (not res!537645) (not e!440638))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793124 (= res!537645 (and (= (size!21032 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21032 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21032 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793125 () Bool)

(assert (=> b!793125 (= e!440638 e!440637)))

(declare-fun res!537644 () Bool)

(assert (=> b!793125 (=> (not res!537644) (not e!440637))))

(declare-datatypes ((SeekEntryResult!8202 0))(
  ( (MissingZero!8202 (index!35176 (_ BitVec 32))) (Found!8202 (index!35177 (_ BitVec 32))) (Intermediate!8202 (undefined!9014 Bool) (index!35178 (_ BitVec 32)) (x!66120 (_ BitVec 32))) (Undefined!8202) (MissingVacant!8202 (index!35179 (_ BitVec 32))) )
))
(declare-fun lt!353651 () SeekEntryResult!8202)

(assert (=> b!793125 (= res!537644 (or (= lt!353651 (MissingZero!8202 i!1163)) (= lt!353651 (MissingVacant!8202 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43062 (_ BitVec 32)) SeekEntryResult!8202)

(assert (=> b!793125 (= lt!353651 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793126 () Bool)

(declare-fun res!537647 () Bool)

(assert (=> b!793126 (=> (not res!537647) (not e!440637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43062 (_ BitVec 32)) Bool)

(assert (=> b!793126 (= res!537647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793127 () Bool)

(declare-fun res!537641 () Bool)

(assert (=> b!793127 (=> (not res!537641) (not e!440638))))

(declare-fun arrayContainsKey!0 (array!43062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793127 (= res!537641 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793128 () Bool)

(declare-fun res!537643 () Bool)

(assert (=> b!793128 (=> (not res!537643) (not e!440638))))

(assert (=> b!793128 (= res!537643 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68272 res!537646) b!793124))

(assert (= (and b!793124 res!537645) b!793122))

(assert (= (and b!793122 res!537642) b!793128))

(assert (= (and b!793128 res!537643) b!793127))

(assert (= (and b!793127 res!537641) b!793125))

(assert (= (and b!793125 res!537644) b!793126))

(assert (= (and b!793126 res!537647) b!793123))

(declare-fun m!733613 () Bool)

(assert (=> b!793125 m!733613))

(declare-fun m!733615 () Bool)

(assert (=> start!68272 m!733615))

(declare-fun m!733617 () Bool)

(assert (=> start!68272 m!733617))

(declare-fun m!733619 () Bool)

(assert (=> b!793126 m!733619))

(declare-fun m!733621 () Bool)

(assert (=> b!793123 m!733621))

(declare-fun m!733623 () Bool)

(assert (=> b!793127 m!733623))

(declare-fun m!733625 () Bool)

(assert (=> b!793128 m!733625))

(declare-fun m!733627 () Bool)

(assert (=> b!793122 m!733627))

(assert (=> b!793122 m!733627))

(declare-fun m!733629 () Bool)

(assert (=> b!793122 m!733629))

(check-sat (not b!793122) (not start!68272) (not b!793127) (not b!793128) (not b!793126) (not b!793123) (not b!793125))
(check-sat)
