; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68326 () Bool)

(assert start!68326)

(declare-fun b!793807 () Bool)

(declare-fun e!440890 () Bool)

(declare-fun e!440889 () Bool)

(assert (=> b!793807 (= e!440890 e!440889)))

(declare-fun res!538327 () Bool)

(assert (=> b!793807 (=> (not res!538327) (not e!440889))))

(declare-datatypes ((SeekEntryResult!8229 0))(
  ( (MissingZero!8229 (index!35284 (_ BitVec 32))) (Found!8229 (index!35285 (_ BitVec 32))) (Intermediate!8229 (undefined!9041 Bool) (index!35286 (_ BitVec 32)) (x!66219 (_ BitVec 32))) (Undefined!8229) (MissingVacant!8229 (index!35287 (_ BitVec 32))) )
))
(declare-fun lt!353856 () SeekEntryResult!8229)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793807 (= res!538327 (or (= lt!353856 (MissingZero!8229 i!1163)) (= lt!353856 (MissingVacant!8229 i!1163))))))

(declare-datatypes ((array!43116 0))(
  ( (array!43117 (arr!20638 (Array (_ BitVec 32) (_ BitVec 64))) (size!21059 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43116)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43116 (_ BitVec 32)) SeekEntryResult!8229)

(assert (=> b!793807 (= lt!353856 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793808 () Bool)

(declare-fun res!538333 () Bool)

(assert (=> b!793808 (=> (not res!538333) (not e!440890))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793808 (= res!538333 (validKeyInArray!0 (select (arr!20638 a!3170) j!153)))))

(declare-fun b!793809 () Bool)

(declare-fun res!538334 () Bool)

(assert (=> b!793809 (=> (not res!538334) (not e!440890))))

(assert (=> b!793809 (= res!538334 (validKeyInArray!0 k0!2044))))

(declare-fun b!793810 () Bool)

(declare-fun res!538331 () Bool)

(assert (=> b!793810 (=> (not res!538331) (not e!440890))))

(assert (=> b!793810 (= res!538331 (and (= (size!21059 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21059 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21059 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793811 () Bool)

(declare-fun res!538332 () Bool)

(assert (=> b!793811 (=> (not res!538332) (not e!440890))))

(declare-fun arrayContainsKey!0 (array!43116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793811 (= res!538332 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793812 () Bool)

(declare-fun res!538326 () Bool)

(assert (=> b!793812 (=> (not res!538326) (not e!440889))))

(declare-datatypes ((List!14601 0))(
  ( (Nil!14598) (Cons!14597 (h!15726 (_ BitVec 64)) (t!20916 List!14601)) )
))
(declare-fun arrayNoDuplicates!0 (array!43116 (_ BitVec 32) List!14601) Bool)

(assert (=> b!793812 (= res!538326 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14598))))

(declare-fun b!793813 () Bool)

(assert (=> b!793813 (= e!440889 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353854 () (_ BitVec 64))

(declare-fun lt!353855 () array!43116)

(declare-fun lt!353857 () SeekEntryResult!8229)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43116 (_ BitVec 32)) SeekEntryResult!8229)

(assert (=> b!793813 (= lt!353857 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353854 lt!353855 mask!3266))))

(declare-fun lt!353858 () SeekEntryResult!8229)

(assert (=> b!793813 (= lt!353858 (seekEntryOrOpen!0 lt!353854 lt!353855 mask!3266))))

(assert (=> b!793813 (= lt!353854 (select (store (arr!20638 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793813 (= lt!353855 (array!43117 (store (arr!20638 a!3170) i!1163 k0!2044) (size!21059 a!3170)))))

(declare-fun res!538330 () Bool)

(assert (=> start!68326 (=> (not res!538330) (not e!440890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68326 (= res!538330 (validMask!0 mask!3266))))

(assert (=> start!68326 e!440890))

(assert (=> start!68326 true))

(declare-fun array_inv!16434 (array!43116) Bool)

(assert (=> start!68326 (array_inv!16434 a!3170)))

(declare-fun b!793814 () Bool)

(declare-fun res!538328 () Bool)

(assert (=> b!793814 (=> (not res!538328) (not e!440889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43116 (_ BitVec 32)) Bool)

(assert (=> b!793814 (= res!538328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793815 () Bool)

(declare-fun res!538329 () Bool)

(assert (=> b!793815 (=> (not res!538329) (not e!440889))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793815 (= res!538329 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21059 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20638 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21059 a!3170)) (= (select (arr!20638 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68326 res!538330) b!793810))

(assert (= (and b!793810 res!538331) b!793808))

(assert (= (and b!793808 res!538333) b!793809))

(assert (= (and b!793809 res!538334) b!793811))

(assert (= (and b!793811 res!538332) b!793807))

(assert (= (and b!793807 res!538327) b!793814))

(assert (= (and b!793814 res!538328) b!793812))

(assert (= (and b!793812 res!538326) b!793815))

(assert (= (and b!793815 res!538329) b!793813))

(declare-fun m!734303 () Bool)

(assert (=> b!793815 m!734303))

(declare-fun m!734305 () Bool)

(assert (=> b!793815 m!734305))

(declare-fun m!734307 () Bool)

(assert (=> start!68326 m!734307))

(declare-fun m!734309 () Bool)

(assert (=> start!68326 m!734309))

(declare-fun m!734311 () Bool)

(assert (=> b!793811 m!734311))

(declare-fun m!734313 () Bool)

(assert (=> b!793807 m!734313))

(declare-fun m!734315 () Bool)

(assert (=> b!793812 m!734315))

(declare-fun m!734317 () Bool)

(assert (=> b!793813 m!734317))

(declare-fun m!734319 () Bool)

(assert (=> b!793813 m!734319))

(declare-fun m!734321 () Bool)

(assert (=> b!793813 m!734321))

(declare-fun m!734323 () Bool)

(assert (=> b!793813 m!734323))

(declare-fun m!734325 () Bool)

(assert (=> b!793808 m!734325))

(assert (=> b!793808 m!734325))

(declare-fun m!734327 () Bool)

(assert (=> b!793808 m!734327))

(declare-fun m!734329 () Bool)

(assert (=> b!793809 m!734329))

(declare-fun m!734331 () Bool)

(assert (=> b!793814 m!734331))

(check-sat (not start!68326) (not b!793812) (not b!793813) (not b!793807) (not b!793814) (not b!793809) (not b!793808) (not b!793811))
(check-sat)
