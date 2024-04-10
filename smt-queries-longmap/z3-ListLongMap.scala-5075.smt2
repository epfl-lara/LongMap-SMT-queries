; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68962 () Bool)

(assert start!68962)

(declare-fun res!548977 () Bool)

(declare-fun e!445661 () Bool)

(assert (=> start!68962 (=> (not res!548977) (not e!445661))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68962 (= res!548977 (validMask!0 mask!3266))))

(assert (=> start!68962 e!445661))

(assert (=> start!68962 true))

(declare-datatypes ((array!43752 0))(
  ( (array!43753 (arr!20956 (Array (_ BitVec 32) (_ BitVec 64))) (size!21377 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43752)

(declare-fun array_inv!16752 (array!43752) Bool)

(assert (=> start!68962 (array_inv!16752 a!3170)))

(declare-fun b!804453 () Bool)

(declare-fun e!445659 () Bool)

(assert (=> b!804453 (= e!445659 false)))

(declare-fun lt!360157 () Bool)

(declare-datatypes ((List!14919 0))(
  ( (Nil!14916) (Cons!14915 (h!16044 (_ BitVec 64)) (t!21234 List!14919)) )
))
(declare-fun arrayNoDuplicates!0 (array!43752 (_ BitVec 32) List!14919) Bool)

(assert (=> b!804453 (= lt!360157 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14916))))

(declare-fun b!804454 () Bool)

(declare-fun res!548973 () Bool)

(assert (=> b!804454 (=> (not res!548973) (not e!445661))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804454 (= res!548973 (and (= (size!21377 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21377 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21377 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804455 () Bool)

(declare-fun res!548975 () Bool)

(assert (=> b!804455 (=> (not res!548975) (not e!445659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43752 (_ BitVec 32)) Bool)

(assert (=> b!804455 (= res!548975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804456 () Bool)

(assert (=> b!804456 (= e!445661 e!445659)))

(declare-fun res!548976 () Bool)

(assert (=> b!804456 (=> (not res!548976) (not e!445659))))

(declare-datatypes ((SeekEntryResult!8547 0))(
  ( (MissingZero!8547 (index!36556 (_ BitVec 32))) (Found!8547 (index!36557 (_ BitVec 32))) (Intermediate!8547 (undefined!9359 Bool) (index!36558 (_ BitVec 32)) (x!67385 (_ BitVec 32))) (Undefined!8547) (MissingVacant!8547 (index!36559 (_ BitVec 32))) )
))
(declare-fun lt!360158 () SeekEntryResult!8547)

(assert (=> b!804456 (= res!548976 (or (= lt!360158 (MissingZero!8547 i!1163)) (= lt!360158 (MissingVacant!8547 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43752 (_ BitVec 32)) SeekEntryResult!8547)

(assert (=> b!804456 (= lt!360158 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804457 () Bool)

(declare-fun res!548974 () Bool)

(assert (=> b!804457 (=> (not res!548974) (not e!445661))))

(declare-fun arrayContainsKey!0 (array!43752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804457 (= res!548974 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804458 () Bool)

(declare-fun res!548978 () Bool)

(assert (=> b!804458 (=> (not res!548978) (not e!445661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804458 (= res!548978 (validKeyInArray!0 (select (arr!20956 a!3170) j!153)))))

(declare-fun b!804459 () Bool)

(declare-fun res!548972 () Bool)

(assert (=> b!804459 (=> (not res!548972) (not e!445661))))

(assert (=> b!804459 (= res!548972 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68962 res!548977) b!804454))

(assert (= (and b!804454 res!548973) b!804458))

(assert (= (and b!804458 res!548978) b!804459))

(assert (= (and b!804459 res!548972) b!804457))

(assert (= (and b!804457 res!548974) b!804456))

(assert (= (and b!804456 res!548976) b!804455))

(assert (= (and b!804455 res!548975) b!804453))

(declare-fun m!746327 () Bool)

(assert (=> b!804453 m!746327))

(declare-fun m!746329 () Bool)

(assert (=> start!68962 m!746329))

(declare-fun m!746331 () Bool)

(assert (=> start!68962 m!746331))

(declare-fun m!746333 () Bool)

(assert (=> b!804459 m!746333))

(declare-fun m!746335 () Bool)

(assert (=> b!804458 m!746335))

(assert (=> b!804458 m!746335))

(declare-fun m!746337 () Bool)

(assert (=> b!804458 m!746337))

(declare-fun m!746339 () Bool)

(assert (=> b!804456 m!746339))

(declare-fun m!746341 () Bool)

(assert (=> b!804455 m!746341))

(declare-fun m!746343 () Bool)

(assert (=> b!804457 m!746343))

(check-sat (not b!804458) (not start!68962) (not b!804459) (not b!804456) (not b!804453) (not b!804457) (not b!804455))
(check-sat)
