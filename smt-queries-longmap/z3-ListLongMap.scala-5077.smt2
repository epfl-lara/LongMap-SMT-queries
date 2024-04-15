; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68952 () Bool)

(assert start!68952)

(declare-fun b!804308 () Bool)

(declare-fun res!548969 () Bool)

(declare-fun e!445552 () Bool)

(assert (=> b!804308 (=> (not res!548969) (not e!445552))))

(declare-datatypes ((array!43759 0))(
  ( (array!43760 (arr!20960 (Array (_ BitVec 32) (_ BitVec 64))) (size!21381 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43759)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43759 (_ BitVec 32)) Bool)

(assert (=> b!804308 (= res!548969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804309 () Bool)

(declare-fun res!548967 () Bool)

(declare-fun e!445550 () Bool)

(assert (=> b!804309 (=> (not res!548967) (not e!445550))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804309 (= res!548967 (validKeyInArray!0 (select (arr!20960 a!3170) j!153)))))

(declare-fun res!548973 () Bool)

(assert (=> start!68952 (=> (not res!548973) (not e!445550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68952 (= res!548973 (validMask!0 mask!3266))))

(assert (=> start!68952 e!445550))

(assert (=> start!68952 true))

(declare-fun array_inv!16843 (array!43759) Bool)

(assert (=> start!68952 (array_inv!16843 a!3170)))

(declare-fun b!804310 () Bool)

(assert (=> b!804310 (= e!445550 e!445552)))

(declare-fun res!548972 () Bool)

(assert (=> b!804310 (=> (not res!548972) (not e!445552))))

(declare-datatypes ((SeekEntryResult!8548 0))(
  ( (MissingZero!8548 (index!36560 (_ BitVec 32))) (Found!8548 (index!36561 (_ BitVec 32))) (Intermediate!8548 (undefined!9360 Bool) (index!36562 (_ BitVec 32)) (x!67397 (_ BitVec 32))) (Undefined!8548) (MissingVacant!8548 (index!36563 (_ BitVec 32))) )
))
(declare-fun lt!359947 () SeekEntryResult!8548)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804310 (= res!548972 (or (= lt!359947 (MissingZero!8548 i!1163)) (= lt!359947 (MissingVacant!8548 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43759 (_ BitVec 32)) SeekEntryResult!8548)

(assert (=> b!804310 (= lt!359947 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804311 () Bool)

(declare-fun res!548970 () Bool)

(assert (=> b!804311 (=> (not res!548970) (not e!445550))))

(assert (=> b!804311 (= res!548970 (validKeyInArray!0 k0!2044))))

(declare-fun b!804312 () Bool)

(assert (=> b!804312 (= e!445552 false)))

(declare-fun lt!359948 () Bool)

(declare-datatypes ((List!14962 0))(
  ( (Nil!14959) (Cons!14958 (h!16087 (_ BitVec 64)) (t!21268 List!14962)) )
))
(declare-fun arrayNoDuplicates!0 (array!43759 (_ BitVec 32) List!14962) Bool)

(assert (=> b!804312 (= lt!359948 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14959))))

(declare-fun b!804313 () Bool)

(declare-fun res!548968 () Bool)

(assert (=> b!804313 (=> (not res!548968) (not e!445550))))

(assert (=> b!804313 (= res!548968 (and (= (size!21381 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21381 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21381 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804314 () Bool)

(declare-fun res!548971 () Bool)

(assert (=> b!804314 (=> (not res!548971) (not e!445550))))

(declare-fun arrayContainsKey!0 (array!43759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804314 (= res!548971 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68952 res!548973) b!804313))

(assert (= (and b!804313 res!548968) b!804309))

(assert (= (and b!804309 res!548967) b!804311))

(assert (= (and b!804311 res!548970) b!804314))

(assert (= (and b!804314 res!548971) b!804310))

(assert (= (and b!804310 res!548972) b!804308))

(assert (= (and b!804308 res!548969) b!804312))

(declare-fun m!745675 () Bool)

(assert (=> b!804314 m!745675))

(declare-fun m!745677 () Bool)

(assert (=> b!804312 m!745677))

(declare-fun m!745679 () Bool)

(assert (=> b!804309 m!745679))

(assert (=> b!804309 m!745679))

(declare-fun m!745681 () Bool)

(assert (=> b!804309 m!745681))

(declare-fun m!745683 () Bool)

(assert (=> b!804310 m!745683))

(declare-fun m!745685 () Bool)

(assert (=> start!68952 m!745685))

(declare-fun m!745687 () Bool)

(assert (=> start!68952 m!745687))

(declare-fun m!745689 () Bool)

(assert (=> b!804311 m!745689))

(declare-fun m!745691 () Bool)

(assert (=> b!804308 m!745691))

(check-sat (not b!804310) (not b!804309) (not b!804312) (not b!804311) (not start!68952) (not b!804308) (not b!804314))
(check-sat)
