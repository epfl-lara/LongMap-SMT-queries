; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68764 () Bool)

(assert start!68764)

(declare-fun b!801225 () Bool)

(declare-fun res!545746 () Bool)

(declare-fun e!444157 () Bool)

(assert (=> b!801225 (=> (not res!545746) (not e!444157))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801225 (= res!545746 (validKeyInArray!0 k0!2044))))

(declare-fun b!801226 () Bool)

(declare-fun res!545749 () Bool)

(declare-fun e!444155 () Bool)

(assert (=> b!801226 (=> (not res!545749) (not e!444155))))

(declare-datatypes ((array!43554 0))(
  ( (array!43555 (arr!20857 (Array (_ BitVec 32) (_ BitVec 64))) (size!21278 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43554)

(declare-datatypes ((List!14820 0))(
  ( (Nil!14817) (Cons!14816 (h!15945 (_ BitVec 64)) (t!21135 List!14820)) )
))
(declare-fun arrayNoDuplicates!0 (array!43554 (_ BitVec 32) List!14820) Bool)

(assert (=> b!801226 (= res!545749 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14817))))

(declare-fun b!801227 () Bool)

(assert (=> b!801227 (= e!444157 e!444155)))

(declare-fun res!545747 () Bool)

(assert (=> b!801227 (=> (not res!545747) (not e!444155))))

(declare-datatypes ((SeekEntryResult!8448 0))(
  ( (MissingZero!8448 (index!36160 (_ BitVec 32))) (Found!8448 (index!36161 (_ BitVec 32))) (Intermediate!8448 (undefined!9260 Bool) (index!36162 (_ BitVec 32)) (x!67022 (_ BitVec 32))) (Undefined!8448) (MissingVacant!8448 (index!36163 (_ BitVec 32))) )
))
(declare-fun lt!358091 () SeekEntryResult!8448)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801227 (= res!545747 (or (= lt!358091 (MissingZero!8448 i!1163)) (= lt!358091 (MissingVacant!8448 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43554 (_ BitVec 32)) SeekEntryResult!8448)

(assert (=> b!801227 (= lt!358091 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801228 () Bool)

(declare-fun e!444158 () Bool)

(assert (=> b!801228 (= e!444158 false)))

(declare-fun lt!358096 () SeekEntryResult!8448)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358093 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43554 (_ BitVec 32)) SeekEntryResult!8448)

(assert (=> b!801228 (= lt!358096 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358093 vacantBefore!23 (select (arr!20857 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801229 () Bool)

(declare-fun e!444153 () Bool)

(assert (=> b!801229 (= e!444153 e!444158)))

(declare-fun res!545748 () Bool)

(assert (=> b!801229 (=> (not res!545748) (not e!444158))))

(assert (=> b!801229 (= res!545748 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358093 #b00000000000000000000000000000000) (bvslt lt!358093 (size!21278 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801229 (= lt!358093 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801230 () Bool)

(declare-fun e!444156 () Bool)

(assert (=> b!801230 (= e!444155 e!444156)))

(declare-fun res!545744 () Bool)

(assert (=> b!801230 (=> (not res!545744) (not e!444156))))

(declare-fun lt!358094 () SeekEntryResult!8448)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358095 () array!43554)

(declare-fun lt!358090 () (_ BitVec 64))

(assert (=> b!801230 (= res!545744 (= lt!358094 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358090 lt!358095 mask!3266)))))

(assert (=> b!801230 (= lt!358094 (seekEntryOrOpen!0 lt!358090 lt!358095 mask!3266))))

(assert (=> b!801230 (= lt!358090 (select (store (arr!20857 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801230 (= lt!358095 (array!43555 (store (arr!20857 a!3170) i!1163 k0!2044) (size!21278 a!3170)))))

(declare-fun res!545754 () Bool)

(assert (=> start!68764 (=> (not res!545754) (not e!444157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68764 (= res!545754 (validMask!0 mask!3266))))

(assert (=> start!68764 e!444157))

(assert (=> start!68764 true))

(declare-fun array_inv!16653 (array!43554) Bool)

(assert (=> start!68764 (array_inv!16653 a!3170)))

(declare-fun b!801231 () Bool)

(declare-fun res!545753 () Bool)

(assert (=> b!801231 (=> (not res!545753) (not e!444157))))

(declare-fun arrayContainsKey!0 (array!43554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801231 (= res!545753 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801232 () Bool)

(declare-fun res!545752 () Bool)

(assert (=> b!801232 (=> (not res!545752) (not e!444157))))

(assert (=> b!801232 (= res!545752 (and (= (size!21278 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21278 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21278 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801233 () Bool)

(declare-fun res!545756 () Bool)

(assert (=> b!801233 (=> (not res!545756) (not e!444155))))

(assert (=> b!801233 (= res!545756 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21278 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20857 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21278 a!3170)) (= (select (arr!20857 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801234 () Bool)

(declare-fun res!545750 () Bool)

(assert (=> b!801234 (=> (not res!545750) (not e!444158))))

(assert (=> b!801234 (= res!545750 (= lt!358094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358093 vacantAfter!23 lt!358090 lt!358095 mask!3266)))))

(declare-fun b!801235 () Bool)

(assert (=> b!801235 (= e!444156 e!444153)))

(declare-fun res!545745 () Bool)

(assert (=> b!801235 (=> (not res!545745) (not e!444153))))

(declare-fun lt!358092 () SeekEntryResult!8448)

(declare-fun lt!358097 () SeekEntryResult!8448)

(assert (=> b!801235 (= res!545745 (and (= lt!358092 lt!358097) (= lt!358097 (Found!8448 j!153)) (not (= (select (arr!20857 a!3170) index!1236) (select (arr!20857 a!3170) j!153)))))))

(assert (=> b!801235 (= lt!358097 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20857 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801235 (= lt!358092 (seekEntryOrOpen!0 (select (arr!20857 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801236 () Bool)

(declare-fun res!545755 () Bool)

(assert (=> b!801236 (=> (not res!545755) (not e!444157))))

(assert (=> b!801236 (= res!545755 (validKeyInArray!0 (select (arr!20857 a!3170) j!153)))))

(declare-fun b!801237 () Bool)

(declare-fun res!545751 () Bool)

(assert (=> b!801237 (=> (not res!545751) (not e!444155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43554 (_ BitVec 32)) Bool)

(assert (=> b!801237 (= res!545751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68764 res!545754) b!801232))

(assert (= (and b!801232 res!545752) b!801236))

(assert (= (and b!801236 res!545755) b!801225))

(assert (= (and b!801225 res!545746) b!801231))

(assert (= (and b!801231 res!545753) b!801227))

(assert (= (and b!801227 res!545747) b!801237))

(assert (= (and b!801237 res!545751) b!801226))

(assert (= (and b!801226 res!545749) b!801233))

(assert (= (and b!801233 res!545756) b!801230))

(assert (= (and b!801230 res!545744) b!801235))

(assert (= (and b!801235 res!545745) b!801229))

(assert (= (and b!801229 res!545748) b!801234))

(assert (= (and b!801234 res!545750) b!801228))

(declare-fun m!742373 () Bool)

(assert (=> b!801229 m!742373))

(declare-fun m!742375 () Bool)

(assert (=> b!801230 m!742375))

(declare-fun m!742377 () Bool)

(assert (=> b!801230 m!742377))

(declare-fun m!742379 () Bool)

(assert (=> b!801230 m!742379))

(declare-fun m!742381 () Bool)

(assert (=> b!801230 m!742381))

(declare-fun m!742383 () Bool)

(assert (=> b!801231 m!742383))

(declare-fun m!742385 () Bool)

(assert (=> b!801226 m!742385))

(declare-fun m!742387 () Bool)

(assert (=> b!801225 m!742387))

(declare-fun m!742389 () Bool)

(assert (=> b!801233 m!742389))

(declare-fun m!742391 () Bool)

(assert (=> b!801233 m!742391))

(declare-fun m!742393 () Bool)

(assert (=> b!801235 m!742393))

(declare-fun m!742395 () Bool)

(assert (=> b!801235 m!742395))

(assert (=> b!801235 m!742395))

(declare-fun m!742397 () Bool)

(assert (=> b!801235 m!742397))

(assert (=> b!801235 m!742395))

(declare-fun m!742399 () Bool)

(assert (=> b!801235 m!742399))

(declare-fun m!742401 () Bool)

(assert (=> start!68764 m!742401))

(declare-fun m!742403 () Bool)

(assert (=> start!68764 m!742403))

(declare-fun m!742405 () Bool)

(assert (=> b!801237 m!742405))

(assert (=> b!801228 m!742395))

(assert (=> b!801228 m!742395))

(declare-fun m!742407 () Bool)

(assert (=> b!801228 m!742407))

(assert (=> b!801236 m!742395))

(assert (=> b!801236 m!742395))

(declare-fun m!742409 () Bool)

(assert (=> b!801236 m!742409))

(declare-fun m!742411 () Bool)

(assert (=> b!801227 m!742411))

(declare-fun m!742413 () Bool)

(assert (=> b!801234 m!742413))

(check-sat (not b!801225) (not b!801226) (not b!801231) (not b!801237) (not start!68764) (not b!801230) (not b!801227) (not b!801235) (not b!801234) (not b!801229) (not b!801236) (not b!801228))
(check-sat)
