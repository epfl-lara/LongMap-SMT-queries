; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68338 () Bool)

(assert start!68338)

(declare-fun b!793974 () Bool)

(declare-fun e!440951 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793974 (= e!440951 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!793975 () Bool)

(declare-fun res!538501 () Bool)

(declare-fun e!440948 () Bool)

(assert (=> b!793975 (=> (not res!538501) (not e!440948))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43128 0))(
  ( (array!43129 (arr!20644 (Array (_ BitVec 32) (_ BitVec 64))) (size!21065 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43128)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793975 (= res!538501 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21065 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20644 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21065 a!3170)) (= (select (arr!20644 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!538494 () Bool)

(declare-fun e!440950 () Bool)

(assert (=> start!68338 (=> (not res!538494) (not e!440950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68338 (= res!538494 (validMask!0 mask!3266))))

(assert (=> start!68338 e!440950))

(assert (=> start!68338 true))

(declare-fun array_inv!16440 (array!43128) Bool)

(assert (=> start!68338 (array_inv!16440 a!3170)))

(declare-fun b!793976 () Bool)

(assert (=> b!793976 (= e!440950 e!440948)))

(declare-fun res!538497 () Bool)

(assert (=> b!793976 (=> (not res!538497) (not e!440948))))

(declare-datatypes ((SeekEntryResult!8235 0))(
  ( (MissingZero!8235 (index!35308 (_ BitVec 32))) (Found!8235 (index!35309 (_ BitVec 32))) (Intermediate!8235 (undefined!9047 Bool) (index!35310 (_ BitVec 32)) (x!66241 (_ BitVec 32))) (Undefined!8235) (MissingVacant!8235 (index!35311 (_ BitVec 32))) )
))
(declare-fun lt!353935 () SeekEntryResult!8235)

(assert (=> b!793976 (= res!538497 (or (= lt!353935 (MissingZero!8235 i!1163)) (= lt!353935 (MissingVacant!8235 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43128 (_ BitVec 32)) SeekEntryResult!8235)

(assert (=> b!793976 (= lt!353935 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793977 () Bool)

(declare-fun res!538500 () Bool)

(assert (=> b!793977 (=> (not res!538500) (not e!440950))))

(declare-fun arrayContainsKey!0 (array!43128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793977 (= res!538500 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793978 () Bool)

(declare-fun res!538493 () Bool)

(assert (=> b!793978 (=> (not res!538493) (not e!440950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793978 (= res!538493 (validKeyInArray!0 k0!2044))))

(declare-fun b!793979 () Bool)

(declare-fun res!538499 () Bool)

(assert (=> b!793979 (=> (not res!538499) (not e!440950))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793979 (= res!538499 (validKeyInArray!0 (select (arr!20644 a!3170) j!153)))))

(declare-fun b!793980 () Bool)

(declare-fun res!538495 () Bool)

(assert (=> b!793980 (=> (not res!538495) (not e!440950))))

(assert (=> b!793980 (= res!538495 (and (= (size!21065 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21065 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21065 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793981 () Bool)

(declare-fun res!538496 () Bool)

(assert (=> b!793981 (=> (not res!538496) (not e!440948))))

(declare-datatypes ((List!14607 0))(
  ( (Nil!14604) (Cons!14603 (h!15732 (_ BitVec 64)) (t!20922 List!14607)) )
))
(declare-fun arrayNoDuplicates!0 (array!43128 (_ BitVec 32) List!14607) Bool)

(assert (=> b!793981 (= res!538496 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14604))))

(declare-fun b!793982 () Bool)

(assert (=> b!793982 (= e!440948 e!440951)))

(declare-fun res!538498 () Bool)

(assert (=> b!793982 (=> (not res!538498) (not e!440951))))

(declare-fun lt!353934 () (_ BitVec 64))

(declare-fun lt!353936 () array!43128)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43128 (_ BitVec 32)) SeekEntryResult!8235)

(assert (=> b!793982 (= res!538498 (= (seekEntryOrOpen!0 lt!353934 lt!353936 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353934 lt!353936 mask!3266)))))

(assert (=> b!793982 (= lt!353934 (select (store (arr!20644 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793982 (= lt!353936 (array!43129 (store (arr!20644 a!3170) i!1163 k0!2044) (size!21065 a!3170)))))

(declare-fun b!793983 () Bool)

(declare-fun res!538502 () Bool)

(assert (=> b!793983 (=> (not res!538502) (not e!440948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43128 (_ BitVec 32)) Bool)

(assert (=> b!793983 (= res!538502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68338 res!538494) b!793980))

(assert (= (and b!793980 res!538495) b!793979))

(assert (= (and b!793979 res!538499) b!793978))

(assert (= (and b!793978 res!538493) b!793977))

(assert (= (and b!793977 res!538500) b!793976))

(assert (= (and b!793976 res!538497) b!793983))

(assert (= (and b!793983 res!538502) b!793981))

(assert (= (and b!793981 res!538496) b!793975))

(assert (= (and b!793975 res!538501) b!793982))

(assert (= (and b!793982 res!538498) b!793974))

(declare-fun m!734483 () Bool)

(assert (=> b!793982 m!734483))

(declare-fun m!734485 () Bool)

(assert (=> b!793982 m!734485))

(declare-fun m!734487 () Bool)

(assert (=> b!793982 m!734487))

(declare-fun m!734489 () Bool)

(assert (=> b!793982 m!734489))

(declare-fun m!734491 () Bool)

(assert (=> b!793975 m!734491))

(declare-fun m!734493 () Bool)

(assert (=> b!793975 m!734493))

(declare-fun m!734495 () Bool)

(assert (=> start!68338 m!734495))

(declare-fun m!734497 () Bool)

(assert (=> start!68338 m!734497))

(declare-fun m!734499 () Bool)

(assert (=> b!793981 m!734499))

(declare-fun m!734501 () Bool)

(assert (=> b!793979 m!734501))

(assert (=> b!793979 m!734501))

(declare-fun m!734503 () Bool)

(assert (=> b!793979 m!734503))

(declare-fun m!734505 () Bool)

(assert (=> b!793983 m!734505))

(declare-fun m!734507 () Bool)

(assert (=> b!793977 m!734507))

(declare-fun m!734509 () Bool)

(assert (=> b!793978 m!734509))

(declare-fun m!734511 () Bool)

(assert (=> b!793976 m!734511))

(check-sat (not b!793983) (not b!793978) (not b!793976) (not b!793982) (not b!793977) (not start!68338) (not b!793979) (not b!793981))
(check-sat)
