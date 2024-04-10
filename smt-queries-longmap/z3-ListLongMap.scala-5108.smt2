; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69256 () Bool)

(assert start!69256)

(declare-fun b!808064 () Bool)

(declare-fun e!447335 () Bool)

(declare-fun e!447338 () Bool)

(assert (=> b!808064 (= e!447335 e!447338)))

(declare-fun res!552187 () Bool)

(assert (=> b!808064 (=> (not res!552187) (not e!447338))))

(declare-datatypes ((array!43956 0))(
  ( (array!43957 (arr!21055 (Array (_ BitVec 32) (_ BitVec 64))) (size!21476 (_ BitVec 32))) )
))
(declare-fun lt!362070 () array!43956)

(declare-fun lt!362072 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8646 0))(
  ( (MissingZero!8646 (index!36952 (_ BitVec 32))) (Found!8646 (index!36953 (_ BitVec 32))) (Intermediate!8646 (undefined!9458 Bool) (index!36954 (_ BitVec 32)) (x!67754 (_ BitVec 32))) (Undefined!8646) (MissingVacant!8646 (index!36955 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43956 (_ BitVec 32)) SeekEntryResult!8646)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43956 (_ BitVec 32)) SeekEntryResult!8646)

(assert (=> b!808064 (= res!552187 (= (seekEntryOrOpen!0 lt!362072 lt!362070 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362072 lt!362070 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43956)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808064 (= lt!362072 (select (store (arr!21055 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808064 (= lt!362070 (array!43957 (store (arr!21055 a!3170) i!1163 k0!2044) (size!21476 a!3170)))))

(declare-fun b!808065 () Bool)

(declare-fun res!552190 () Bool)

(assert (=> b!808065 (=> (not res!552190) (not e!447335))))

(declare-datatypes ((List!15018 0))(
  ( (Nil!15015) (Cons!15014 (h!16143 (_ BitVec 64)) (t!21333 List!15018)) )
))
(declare-fun arrayNoDuplicates!0 (array!43956 (_ BitVec 32) List!15018) Bool)

(assert (=> b!808065 (= res!552190 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15015))))

(declare-fun b!808066 () Bool)

(declare-fun res!552191 () Bool)

(declare-fun e!447337 () Bool)

(assert (=> b!808066 (=> (not res!552191) (not e!447337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808066 (= res!552191 (validKeyInArray!0 k0!2044))))

(declare-fun b!808067 () Bool)

(declare-fun res!552193 () Bool)

(assert (=> b!808067 (=> (not res!552193) (not e!447337))))

(declare-fun arrayContainsKey!0 (array!43956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808067 (= res!552193 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808068 () Bool)

(assert (=> b!808068 (= e!447337 e!447335)))

(declare-fun res!552197 () Bool)

(assert (=> b!808068 (=> (not res!552197) (not e!447335))))

(declare-fun lt!362074 () SeekEntryResult!8646)

(assert (=> b!808068 (= res!552197 (or (= lt!362074 (MissingZero!8646 i!1163)) (= lt!362074 (MissingVacant!8646 i!1163))))))

(assert (=> b!808068 (= lt!362074 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808069 () Bool)

(declare-fun res!552194 () Bool)

(assert (=> b!808069 (=> (not res!552194) (not e!447337))))

(assert (=> b!808069 (= res!552194 (and (= (size!21476 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21476 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21476 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808070 () Bool)

(declare-fun e!447336 () Bool)

(assert (=> b!808070 (= e!447336 false)))

(declare-fun lt!362075 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808070 (= lt!362075 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808071 () Bool)

(declare-fun res!552189 () Bool)

(assert (=> b!808071 (=> (not res!552189) (not e!447335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43956 (_ BitVec 32)) Bool)

(assert (=> b!808071 (= res!552189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808073 () Bool)

(declare-fun res!552188 () Bool)

(assert (=> b!808073 (=> (not res!552188) (not e!447337))))

(assert (=> b!808073 (= res!552188 (validKeyInArray!0 (select (arr!21055 a!3170) j!153)))))

(declare-fun b!808074 () Bool)

(assert (=> b!808074 (= e!447338 e!447336)))

(declare-fun res!552192 () Bool)

(assert (=> b!808074 (=> (not res!552192) (not e!447336))))

(declare-fun lt!362071 () SeekEntryResult!8646)

(declare-fun lt!362073 () SeekEntryResult!8646)

(assert (=> b!808074 (= res!552192 (and (= lt!362073 lt!362071) (= lt!362071 (Found!8646 j!153)) (not (= (select (arr!21055 a!3170) index!1236) (select (arr!21055 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808074 (= lt!362071 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21055 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808074 (= lt!362073 (seekEntryOrOpen!0 (select (arr!21055 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!552195 () Bool)

(assert (=> start!69256 (=> (not res!552195) (not e!447337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69256 (= res!552195 (validMask!0 mask!3266))))

(assert (=> start!69256 e!447337))

(assert (=> start!69256 true))

(declare-fun array_inv!16851 (array!43956) Bool)

(assert (=> start!69256 (array_inv!16851 a!3170)))

(declare-fun b!808072 () Bool)

(declare-fun res!552196 () Bool)

(assert (=> b!808072 (=> (not res!552196) (not e!447335))))

(assert (=> b!808072 (= res!552196 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21476 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21055 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21476 a!3170)) (= (select (arr!21055 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69256 res!552195) b!808069))

(assert (= (and b!808069 res!552194) b!808073))

(assert (= (and b!808073 res!552188) b!808066))

(assert (= (and b!808066 res!552191) b!808067))

(assert (= (and b!808067 res!552193) b!808068))

(assert (= (and b!808068 res!552197) b!808071))

(assert (= (and b!808071 res!552189) b!808065))

(assert (= (and b!808065 res!552190) b!808072))

(assert (= (and b!808072 res!552196) b!808064))

(assert (= (and b!808064 res!552187) b!808074))

(assert (= (and b!808074 res!552192) b!808070))

(declare-fun m!750193 () Bool)

(assert (=> b!808070 m!750193))

(declare-fun m!750195 () Bool)

(assert (=> b!808074 m!750195))

(declare-fun m!750197 () Bool)

(assert (=> b!808074 m!750197))

(assert (=> b!808074 m!750197))

(declare-fun m!750199 () Bool)

(assert (=> b!808074 m!750199))

(assert (=> b!808074 m!750197))

(declare-fun m!750201 () Bool)

(assert (=> b!808074 m!750201))

(declare-fun m!750203 () Bool)

(assert (=> b!808066 m!750203))

(declare-fun m!750205 () Bool)

(assert (=> b!808071 m!750205))

(declare-fun m!750207 () Bool)

(assert (=> b!808067 m!750207))

(declare-fun m!750209 () Bool)

(assert (=> b!808065 m!750209))

(declare-fun m!750211 () Bool)

(assert (=> b!808068 m!750211))

(declare-fun m!750213 () Bool)

(assert (=> b!808072 m!750213))

(declare-fun m!750215 () Bool)

(assert (=> b!808072 m!750215))

(declare-fun m!750217 () Bool)

(assert (=> b!808064 m!750217))

(declare-fun m!750219 () Bool)

(assert (=> b!808064 m!750219))

(declare-fun m!750221 () Bool)

(assert (=> b!808064 m!750221))

(declare-fun m!750223 () Bool)

(assert (=> b!808064 m!750223))

(assert (=> b!808073 m!750197))

(assert (=> b!808073 m!750197))

(declare-fun m!750225 () Bool)

(assert (=> b!808073 m!750225))

(declare-fun m!750227 () Bool)

(assert (=> start!69256 m!750227))

(declare-fun m!750229 () Bool)

(assert (=> start!69256 m!750229))

(check-sat (not b!808071) (not b!808066) (not b!808064) (not b!808067) (not b!808074) (not b!808068) (not b!808070) (not b!808073) (not b!808065) (not start!69256))
(check-sat)
