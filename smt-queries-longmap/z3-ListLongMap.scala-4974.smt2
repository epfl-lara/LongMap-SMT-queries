; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68334 () Bool)

(assert start!68334)

(declare-fun b!793953 () Bool)

(declare-fun res!538618 () Bool)

(declare-fun e!440879 () Bool)

(assert (=> b!793953 (=> (not res!538618) (not e!440879))))

(declare-datatypes ((array!43141 0))(
  ( (array!43142 (arr!20651 (Array (_ BitVec 32) (_ BitVec 64))) (size!21072 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43141)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793953 (= res!538618 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793955 () Bool)

(declare-fun res!538613 () Bool)

(assert (=> b!793955 (=> (not res!538613) (not e!440879))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793955 (= res!538613 (validKeyInArray!0 (select (arr!20651 a!3170) j!153)))))

(declare-fun b!793956 () Bool)

(declare-fun res!538617 () Bool)

(assert (=> b!793956 (=> (not res!538617) (not e!440879))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793956 (= res!538617 (and (= (size!21072 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21072 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21072 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793957 () Bool)

(declare-fun e!440880 () Bool)

(assert (=> b!793957 (= e!440879 e!440880)))

(declare-fun res!538615 () Bool)

(assert (=> b!793957 (=> (not res!538615) (not e!440880))))

(declare-datatypes ((SeekEntryResult!8239 0))(
  ( (MissingZero!8239 (index!35324 (_ BitVec 32))) (Found!8239 (index!35325 (_ BitVec 32))) (Intermediate!8239 (undefined!9051 Bool) (index!35326 (_ BitVec 32)) (x!66264 (_ BitVec 32))) (Undefined!8239) (MissingVacant!8239 (index!35327 (_ BitVec 32))) )
))
(declare-fun lt!353788 () SeekEntryResult!8239)

(assert (=> b!793957 (= res!538615 (or (= lt!353788 (MissingZero!8239 i!1163)) (= lt!353788 (MissingVacant!8239 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43141 (_ BitVec 32)) SeekEntryResult!8239)

(assert (=> b!793957 (= lt!353788 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793958 () Bool)

(declare-fun res!538612 () Bool)

(assert (=> b!793958 (=> (not res!538612) (not e!440880))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793958 (= res!538612 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21072 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20651 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21072 a!3170)) (= (select (arr!20651 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793959 () Bool)

(assert (=> b!793959 (= e!440880 false)))

(declare-fun lt!353789 () array!43141)

(declare-fun lt!353792 () (_ BitVec 64))

(declare-fun lt!353791 () SeekEntryResult!8239)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43141 (_ BitVec 32)) SeekEntryResult!8239)

(assert (=> b!793959 (= lt!353791 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353792 lt!353789 mask!3266))))

(declare-fun lt!353790 () SeekEntryResult!8239)

(assert (=> b!793959 (= lt!353790 (seekEntryOrOpen!0 lt!353792 lt!353789 mask!3266))))

(assert (=> b!793959 (= lt!353792 (select (store (arr!20651 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793959 (= lt!353789 (array!43142 (store (arr!20651 a!3170) i!1163 k0!2044) (size!21072 a!3170)))))

(declare-fun b!793954 () Bool)

(declare-fun res!538619 () Bool)

(assert (=> b!793954 (=> (not res!538619) (not e!440880))))

(declare-datatypes ((List!14653 0))(
  ( (Nil!14650) (Cons!14649 (h!15778 (_ BitVec 64)) (t!20959 List!14653)) )
))
(declare-fun arrayNoDuplicates!0 (array!43141 (_ BitVec 32) List!14653) Bool)

(assert (=> b!793954 (= res!538619 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14650))))

(declare-fun res!538616 () Bool)

(assert (=> start!68334 (=> (not res!538616) (not e!440879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68334 (= res!538616 (validMask!0 mask!3266))))

(assert (=> start!68334 e!440879))

(assert (=> start!68334 true))

(declare-fun array_inv!16534 (array!43141) Bool)

(assert (=> start!68334 (array_inv!16534 a!3170)))

(declare-fun b!793960 () Bool)

(declare-fun res!538614 () Bool)

(assert (=> b!793960 (=> (not res!538614) (not e!440880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43141 (_ BitVec 32)) Bool)

(assert (=> b!793960 (= res!538614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793961 () Bool)

(declare-fun res!538620 () Bool)

(assert (=> b!793961 (=> (not res!538620) (not e!440879))))

(assert (=> b!793961 (= res!538620 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68334 res!538616) b!793956))

(assert (= (and b!793956 res!538617) b!793955))

(assert (= (and b!793955 res!538613) b!793961))

(assert (= (and b!793961 res!538620) b!793953))

(assert (= (and b!793953 res!538618) b!793957))

(assert (= (and b!793957 res!538615) b!793960))

(assert (= (and b!793960 res!538614) b!793954))

(assert (= (and b!793954 res!538619) b!793958))

(assert (= (and b!793958 res!538612) b!793959))

(declare-fun m!733981 () Bool)

(assert (=> b!793954 m!733981))

(declare-fun m!733983 () Bool)

(assert (=> b!793957 m!733983))

(declare-fun m!733985 () Bool)

(assert (=> b!793959 m!733985))

(declare-fun m!733987 () Bool)

(assert (=> b!793959 m!733987))

(declare-fun m!733989 () Bool)

(assert (=> b!793959 m!733989))

(declare-fun m!733991 () Bool)

(assert (=> b!793959 m!733991))

(declare-fun m!733993 () Bool)

(assert (=> b!793953 m!733993))

(declare-fun m!733995 () Bool)

(assert (=> start!68334 m!733995))

(declare-fun m!733997 () Bool)

(assert (=> start!68334 m!733997))

(declare-fun m!733999 () Bool)

(assert (=> b!793955 m!733999))

(assert (=> b!793955 m!733999))

(declare-fun m!734001 () Bool)

(assert (=> b!793955 m!734001))

(declare-fun m!734003 () Bool)

(assert (=> b!793961 m!734003))

(declare-fun m!734005 () Bool)

(assert (=> b!793958 m!734005))

(declare-fun m!734007 () Bool)

(assert (=> b!793958 m!734007))

(declare-fun m!734009 () Bool)

(assert (=> b!793960 m!734009))

(check-sat (not b!793953) (not b!793959) (not b!793954) (not b!793960) (not b!793961) (not b!793957) (not b!793955) (not start!68334))
(check-sat)
