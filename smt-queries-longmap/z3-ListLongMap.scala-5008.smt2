; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68538 () Bool)

(assert start!68538)

(declare-fun b!797190 () Bool)

(declare-fun res!541853 () Bool)

(declare-fun e!442258 () Bool)

(assert (=> b!797190 (=> (not res!541853) (not e!442258))))

(declare-datatypes ((array!43345 0))(
  ( (array!43346 (arr!20753 (Array (_ BitVec 32) (_ BitVec 64))) (size!21174 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43345)

(declare-datatypes ((List!14755 0))(
  ( (Nil!14752) (Cons!14751 (h!15880 (_ BitVec 64)) (t!21061 List!14755)) )
))
(declare-fun arrayNoDuplicates!0 (array!43345 (_ BitVec 32) List!14755) Bool)

(assert (=> b!797190 (= res!541853 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14752))))

(declare-fun b!797191 () Bool)

(declare-fun res!541854 () Bool)

(assert (=> b!797191 (=> (not res!541854) (not e!442258))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797191 (= res!541854 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21174 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20753 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21174 a!3170)) (= (select (arr!20753 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797192 () Bool)

(declare-fun res!541851 () Bool)

(assert (=> b!797192 (=> (not res!541851) (not e!442258))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43345 (_ BitVec 32)) Bool)

(assert (=> b!797192 (= res!541851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797193 () Bool)

(declare-fun res!541852 () Bool)

(declare-fun e!442256 () Bool)

(assert (=> b!797193 (=> (not res!541852) (not e!442256))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797193 (= res!541852 (validKeyInArray!0 (select (arr!20753 a!3170) j!153)))))

(declare-fun b!797194 () Bool)

(assert (=> b!797194 (= e!442256 e!442258)))

(declare-fun res!541856 () Bool)

(assert (=> b!797194 (=> (not res!541856) (not e!442258))))

(declare-datatypes ((SeekEntryResult!8341 0))(
  ( (MissingZero!8341 (index!35732 (_ BitVec 32))) (Found!8341 (index!35733 (_ BitVec 32))) (Intermediate!8341 (undefined!9153 Bool) (index!35734 (_ BitVec 32)) (x!66638 (_ BitVec 32))) (Undefined!8341) (MissingVacant!8341 (index!35735 (_ BitVec 32))) )
))
(declare-fun lt!355537 () SeekEntryResult!8341)

(assert (=> b!797194 (= res!541856 (or (= lt!355537 (MissingZero!8341 i!1163)) (= lt!355537 (MissingVacant!8341 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43345 (_ BitVec 32)) SeekEntryResult!8341)

(assert (=> b!797194 (= lt!355537 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797196 () Bool)

(declare-fun e!442255 () Bool)

(declare-fun e!442257 () Bool)

(assert (=> b!797196 (= e!442255 e!442257)))

(declare-fun res!541855 () Bool)

(assert (=> b!797196 (=> (not res!541855) (not e!442257))))

(declare-fun lt!355531 () SeekEntryResult!8341)

(declare-fun lt!355532 () SeekEntryResult!8341)

(assert (=> b!797196 (= res!541855 (= lt!355531 lt!355532))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43345 (_ BitVec 32)) SeekEntryResult!8341)

(assert (=> b!797196 (= lt!355532 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20753 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797196 (= lt!355531 (seekEntryOrOpen!0 (select (arr!20753 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797197 () Bool)

(declare-fun e!442253 () Bool)

(assert (=> b!797197 (= e!442257 e!442253)))

(declare-fun res!541859 () Bool)

(assert (=> b!797197 (=> (not res!541859) (not e!442253))))

(declare-fun lt!355538 () SeekEntryResult!8341)

(assert (=> b!797197 (= res!541859 (and (= lt!355532 lt!355538) (= (select (arr!20753 a!3170) index!1236) (select (arr!20753 a!3170) j!153))))))

(assert (=> b!797197 (= lt!355538 (Found!8341 j!153))))

(declare-fun b!797198 () Bool)

(declare-fun res!541850 () Bool)

(assert (=> b!797198 (=> (not res!541850) (not e!442256))))

(assert (=> b!797198 (= res!541850 (validKeyInArray!0 k0!2044))))

(declare-fun b!797199 () Bool)

(declare-fun res!541860 () Bool)

(assert (=> b!797199 (=> (not res!541860) (not e!442256))))

(declare-fun arrayContainsKey!0 (array!43345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797199 (= res!541860 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun lt!355533 () SeekEntryResult!8341)

(declare-fun b!797200 () Bool)

(assert (=> b!797200 (= e!442253 (not (or (not (= lt!355533 lt!355538)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20753 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!797200 (= lt!355533 (Found!8341 index!1236))))

(declare-fun b!797201 () Bool)

(assert (=> b!797201 (= e!442258 e!442255)))

(declare-fun res!541858 () Bool)

(assert (=> b!797201 (=> (not res!541858) (not e!442255))))

(declare-fun lt!355534 () SeekEntryResult!8341)

(assert (=> b!797201 (= res!541858 (= lt!355534 lt!355533))))

(declare-fun lt!355536 () (_ BitVec 64))

(declare-fun lt!355535 () array!43345)

(assert (=> b!797201 (= lt!355533 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355536 lt!355535 mask!3266))))

(assert (=> b!797201 (= lt!355534 (seekEntryOrOpen!0 lt!355536 lt!355535 mask!3266))))

(assert (=> b!797201 (= lt!355536 (select (store (arr!20753 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797201 (= lt!355535 (array!43346 (store (arr!20753 a!3170) i!1163 k0!2044) (size!21174 a!3170)))))

(declare-fun res!541849 () Bool)

(assert (=> start!68538 (=> (not res!541849) (not e!442256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68538 (= res!541849 (validMask!0 mask!3266))))

(assert (=> start!68538 e!442256))

(assert (=> start!68538 true))

(declare-fun array_inv!16636 (array!43345) Bool)

(assert (=> start!68538 (array_inv!16636 a!3170)))

(declare-fun b!797195 () Bool)

(declare-fun res!541857 () Bool)

(assert (=> b!797195 (=> (not res!541857) (not e!442256))))

(assert (=> b!797195 (= res!541857 (and (= (size!21174 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21174 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21174 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68538 res!541849) b!797195))

(assert (= (and b!797195 res!541857) b!797193))

(assert (= (and b!797193 res!541852) b!797198))

(assert (= (and b!797198 res!541850) b!797199))

(assert (= (and b!797199 res!541860) b!797194))

(assert (= (and b!797194 res!541856) b!797192))

(assert (= (and b!797192 res!541851) b!797190))

(assert (= (and b!797190 res!541853) b!797191))

(assert (= (and b!797191 res!541854) b!797201))

(assert (= (and b!797201 res!541858) b!797196))

(assert (= (and b!797196 res!541855) b!797197))

(assert (= (and b!797197 res!541859) b!797200))

(declare-fun m!737551 () Bool)

(assert (=> b!797200 m!737551))

(declare-fun m!737553 () Bool)

(assert (=> b!797200 m!737553))

(declare-fun m!737555 () Bool)

(assert (=> b!797199 m!737555))

(declare-fun m!737557 () Bool)

(assert (=> b!797201 m!737557))

(declare-fun m!737559 () Bool)

(assert (=> b!797201 m!737559))

(assert (=> b!797201 m!737551))

(declare-fun m!737561 () Bool)

(assert (=> b!797201 m!737561))

(declare-fun m!737563 () Bool)

(assert (=> start!68538 m!737563))

(declare-fun m!737565 () Bool)

(assert (=> start!68538 m!737565))

(declare-fun m!737567 () Bool)

(assert (=> b!797194 m!737567))

(declare-fun m!737569 () Bool)

(assert (=> b!797197 m!737569))

(declare-fun m!737571 () Bool)

(assert (=> b!797197 m!737571))

(declare-fun m!737573 () Bool)

(assert (=> b!797190 m!737573))

(declare-fun m!737575 () Bool)

(assert (=> b!797192 m!737575))

(assert (=> b!797196 m!737571))

(assert (=> b!797196 m!737571))

(declare-fun m!737577 () Bool)

(assert (=> b!797196 m!737577))

(assert (=> b!797196 m!737571))

(declare-fun m!737579 () Bool)

(assert (=> b!797196 m!737579))

(declare-fun m!737581 () Bool)

(assert (=> b!797191 m!737581))

(declare-fun m!737583 () Bool)

(assert (=> b!797191 m!737583))

(assert (=> b!797193 m!737571))

(assert (=> b!797193 m!737571))

(declare-fun m!737585 () Bool)

(assert (=> b!797193 m!737585))

(declare-fun m!737587 () Bool)

(assert (=> b!797198 m!737587))

(check-sat (not b!797198) (not b!797192) (not b!797199) (not start!68538) (not b!797194) (not b!797190) (not b!797201) (not b!797193) (not b!797196))
(check-sat)
