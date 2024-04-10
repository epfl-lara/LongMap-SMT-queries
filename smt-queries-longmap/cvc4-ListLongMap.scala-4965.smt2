; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68304 () Bool)

(assert start!68304)

(declare-fun b!793501 () Bool)

(declare-fun res!538021 () Bool)

(declare-fun e!440781 () Bool)

(assert (=> b!793501 (=> (not res!538021) (not e!440781))))

(declare-datatypes ((array!43094 0))(
  ( (array!43095 (arr!20627 (Array (_ BitVec 32) (_ BitVec 64))) (size!21048 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43094)

(declare-datatypes ((List!14590 0))(
  ( (Nil!14587) (Cons!14586 (h!15715 (_ BitVec 64)) (t!20905 List!14590)) )
))
(declare-fun arrayNoDuplicates!0 (array!43094 (_ BitVec 32) List!14590) Bool)

(assert (=> b!793501 (= res!538021 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14587))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun b!793502 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793502 (= e!440781 (not (validKeyInArray!0 (select (store (arr!20627 a!3170) i!1163 k!2044) j!153))))))

(declare-fun b!793503 () Bool)

(declare-fun res!538028 () Bool)

(assert (=> b!793503 (=> (not res!538028) (not e!440781))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43094 (_ BitVec 32)) Bool)

(assert (=> b!793503 (= res!538028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793504 () Bool)

(declare-fun res!538023 () Bool)

(declare-fun e!440782 () Bool)

(assert (=> b!793504 (=> (not res!538023) (not e!440782))))

(assert (=> b!793504 (= res!538023 (validKeyInArray!0 (select (arr!20627 a!3170) j!153)))))

(declare-fun b!793505 () Bool)

(declare-fun res!538022 () Bool)

(assert (=> b!793505 (=> (not res!538022) (not e!440782))))

(assert (=> b!793505 (= res!538022 (and (= (size!21048 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21048 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21048 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793506 () Bool)

(declare-fun res!538020 () Bool)

(assert (=> b!793506 (=> (not res!538020) (not e!440782))))

(assert (=> b!793506 (= res!538020 (validKeyInArray!0 k!2044))))

(declare-fun res!538026 () Bool)

(assert (=> start!68304 (=> (not res!538026) (not e!440782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68304 (= res!538026 (validMask!0 mask!3266))))

(assert (=> start!68304 e!440782))

(assert (=> start!68304 true))

(declare-fun array_inv!16423 (array!43094) Bool)

(assert (=> start!68304 (array_inv!16423 a!3170)))

(declare-fun b!793507 () Bool)

(declare-fun res!538024 () Bool)

(assert (=> b!793507 (=> (not res!538024) (not e!440782))))

(declare-fun arrayContainsKey!0 (array!43094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793507 (= res!538024 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793508 () Bool)

(assert (=> b!793508 (= e!440782 e!440781)))

(declare-fun res!538025 () Bool)

(assert (=> b!793508 (=> (not res!538025) (not e!440781))))

(declare-datatypes ((SeekEntryResult!8218 0))(
  ( (MissingZero!8218 (index!35240 (_ BitVec 32))) (Found!8218 (index!35241 (_ BitVec 32))) (Intermediate!8218 (undefined!9030 Bool) (index!35242 (_ BitVec 32)) (x!66176 (_ BitVec 32))) (Undefined!8218) (MissingVacant!8218 (index!35243 (_ BitVec 32))) )
))
(declare-fun lt!353711 () SeekEntryResult!8218)

(assert (=> b!793508 (= res!538025 (or (= lt!353711 (MissingZero!8218 i!1163)) (= lt!353711 (MissingVacant!8218 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43094 (_ BitVec 32)) SeekEntryResult!8218)

(assert (=> b!793508 (= lt!353711 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793509 () Bool)

(declare-fun res!538027 () Bool)

(assert (=> b!793509 (=> (not res!538027) (not e!440781))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793509 (= res!538027 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21048 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20627 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21048 a!3170)) (= (select (arr!20627 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20627 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!68304 res!538026) b!793505))

(assert (= (and b!793505 res!538022) b!793504))

(assert (= (and b!793504 res!538023) b!793506))

(assert (= (and b!793506 res!538020) b!793507))

(assert (= (and b!793507 res!538024) b!793508))

(assert (= (and b!793508 res!538025) b!793503))

(assert (= (and b!793503 res!538028) b!793501))

(assert (= (and b!793501 res!538021) b!793509))

(assert (= (and b!793509 res!538027) b!793502))

(declare-fun m!733973 () Bool)

(assert (=> b!793507 m!733973))

(declare-fun m!733975 () Bool)

(assert (=> b!793502 m!733975))

(declare-fun m!733977 () Bool)

(assert (=> b!793502 m!733977))

(assert (=> b!793502 m!733977))

(declare-fun m!733979 () Bool)

(assert (=> b!793502 m!733979))

(declare-fun m!733981 () Bool)

(assert (=> b!793503 m!733981))

(declare-fun m!733983 () Bool)

(assert (=> b!793506 m!733983))

(declare-fun m!733985 () Bool)

(assert (=> start!68304 m!733985))

(declare-fun m!733987 () Bool)

(assert (=> start!68304 m!733987))

(declare-fun m!733989 () Bool)

(assert (=> b!793501 m!733989))

(declare-fun m!733991 () Bool)

(assert (=> b!793509 m!733991))

(declare-fun m!733993 () Bool)

(assert (=> b!793509 m!733993))

(assert (=> b!793509 m!733975))

(declare-fun m!733995 () Bool)

(assert (=> b!793509 m!733995))

(declare-fun m!733997 () Bool)

(assert (=> b!793504 m!733997))

(assert (=> b!793504 m!733997))

(declare-fun m!733999 () Bool)

(assert (=> b!793504 m!733999))

(declare-fun m!734001 () Bool)

(assert (=> b!793508 m!734001))

(push 1)

(assert (not b!793504))

(assert (not b!793502))

(assert (not b!793507))

(assert (not b!793508))

(assert (not start!68304))

(assert (not b!793506))

(assert (not b!793501))

(assert (not b!793503))

