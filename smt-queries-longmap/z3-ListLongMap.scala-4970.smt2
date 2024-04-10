; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68332 () Bool)

(assert start!68332)

(declare-fun b!793888 () Bool)

(declare-fun e!440917 () Bool)

(declare-fun e!440916 () Bool)

(assert (=> b!793888 (= e!440917 e!440916)))

(declare-fun res!538411 () Bool)

(assert (=> b!793888 (=> (not res!538411) (not e!440916))))

(declare-datatypes ((SeekEntryResult!8232 0))(
  ( (MissingZero!8232 (index!35296 (_ BitVec 32))) (Found!8232 (index!35297 (_ BitVec 32))) (Intermediate!8232 (undefined!9044 Bool) (index!35298 (_ BitVec 32)) (x!66230 (_ BitVec 32))) (Undefined!8232) (MissingVacant!8232 (index!35299 (_ BitVec 32))) )
))
(declare-fun lt!353900 () SeekEntryResult!8232)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793888 (= res!538411 (or (= lt!353900 (MissingZero!8232 i!1163)) (= lt!353900 (MissingVacant!8232 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43122 0))(
  ( (array!43123 (arr!20641 (Array (_ BitVec 32) (_ BitVec 64))) (size!21062 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43122)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43122 (_ BitVec 32)) SeekEntryResult!8232)

(assert (=> b!793888 (= lt!353900 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793889 () Bool)

(assert (=> b!793889 (= e!440916 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!353903 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!353902 () SeekEntryResult!8232)

(declare-fun lt!353899 () array!43122)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43122 (_ BitVec 32)) SeekEntryResult!8232)

(assert (=> b!793889 (= lt!353902 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353903 lt!353899 mask!3266))))

(declare-fun lt!353901 () SeekEntryResult!8232)

(assert (=> b!793889 (= lt!353901 (seekEntryOrOpen!0 lt!353903 lt!353899 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793889 (= lt!353903 (select (store (arr!20641 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793889 (= lt!353899 (array!43123 (store (arr!20641 a!3170) i!1163 k0!2044) (size!21062 a!3170)))))

(declare-fun b!793890 () Bool)

(declare-fun res!538410 () Bool)

(assert (=> b!793890 (=> (not res!538410) (not e!440917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793890 (= res!538410 (validKeyInArray!0 k0!2044))))

(declare-fun b!793891 () Bool)

(declare-fun res!538414 () Bool)

(assert (=> b!793891 (=> (not res!538414) (not e!440916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43122 (_ BitVec 32)) Bool)

(assert (=> b!793891 (= res!538414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!538408 () Bool)

(assert (=> start!68332 (=> (not res!538408) (not e!440917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68332 (= res!538408 (validMask!0 mask!3266))))

(assert (=> start!68332 e!440917))

(assert (=> start!68332 true))

(declare-fun array_inv!16437 (array!43122) Bool)

(assert (=> start!68332 (array_inv!16437 a!3170)))

(declare-fun b!793892 () Bool)

(declare-fun res!538412 () Bool)

(assert (=> b!793892 (=> (not res!538412) (not e!440917))))

(assert (=> b!793892 (= res!538412 (validKeyInArray!0 (select (arr!20641 a!3170) j!153)))))

(declare-fun b!793893 () Bool)

(declare-fun res!538415 () Bool)

(assert (=> b!793893 (=> (not res!538415) (not e!440917))))

(declare-fun arrayContainsKey!0 (array!43122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793893 (= res!538415 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793894 () Bool)

(declare-fun res!538409 () Bool)

(assert (=> b!793894 (=> (not res!538409) (not e!440917))))

(assert (=> b!793894 (= res!538409 (and (= (size!21062 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21062 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21062 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793895 () Bool)

(declare-fun res!538407 () Bool)

(assert (=> b!793895 (=> (not res!538407) (not e!440916))))

(declare-datatypes ((List!14604 0))(
  ( (Nil!14601) (Cons!14600 (h!15729 (_ BitVec 64)) (t!20919 List!14604)) )
))
(declare-fun arrayNoDuplicates!0 (array!43122 (_ BitVec 32) List!14604) Bool)

(assert (=> b!793895 (= res!538407 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14601))))

(declare-fun b!793896 () Bool)

(declare-fun res!538413 () Bool)

(assert (=> b!793896 (=> (not res!538413) (not e!440916))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793896 (= res!538413 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21062 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20641 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21062 a!3170)) (= (select (arr!20641 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68332 res!538408) b!793894))

(assert (= (and b!793894 res!538409) b!793892))

(assert (= (and b!793892 res!538412) b!793890))

(assert (= (and b!793890 res!538410) b!793893))

(assert (= (and b!793893 res!538415) b!793888))

(assert (= (and b!793888 res!538411) b!793891))

(assert (= (and b!793891 res!538414) b!793895))

(assert (= (and b!793895 res!538407) b!793896))

(assert (= (and b!793896 res!538413) b!793889))

(declare-fun m!734393 () Bool)

(assert (=> b!793888 m!734393))

(declare-fun m!734395 () Bool)

(assert (=> b!793892 m!734395))

(assert (=> b!793892 m!734395))

(declare-fun m!734397 () Bool)

(assert (=> b!793892 m!734397))

(declare-fun m!734399 () Bool)

(assert (=> start!68332 m!734399))

(declare-fun m!734401 () Bool)

(assert (=> start!68332 m!734401))

(declare-fun m!734403 () Bool)

(assert (=> b!793889 m!734403))

(declare-fun m!734405 () Bool)

(assert (=> b!793889 m!734405))

(declare-fun m!734407 () Bool)

(assert (=> b!793889 m!734407))

(declare-fun m!734409 () Bool)

(assert (=> b!793889 m!734409))

(declare-fun m!734411 () Bool)

(assert (=> b!793893 m!734411))

(declare-fun m!734413 () Bool)

(assert (=> b!793890 m!734413))

(declare-fun m!734415 () Bool)

(assert (=> b!793895 m!734415))

(declare-fun m!734417 () Bool)

(assert (=> b!793891 m!734417))

(declare-fun m!734419 () Bool)

(assert (=> b!793896 m!734419))

(declare-fun m!734421 () Bool)

(assert (=> b!793896 m!734421))

(check-sat (not b!793891) (not b!793895) (not b!793893) (not start!68332) (not b!793890) (not b!793892) (not b!793889) (not b!793888))
(check-sat)
