; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68506 () Bool)

(assert start!68506)

(declare-fun b!796544 () Bool)

(declare-fun res!541073 () Bool)

(declare-fun e!441982 () Bool)

(assert (=> b!796544 (=> (not res!541073) (not e!441982))))

(declare-datatypes ((array!43296 0))(
  ( (array!43297 (arr!20728 (Array (_ BitVec 32) (_ BitVec 64))) (size!21149 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43296)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796544 (= res!541073 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796546 () Bool)

(declare-fun res!541065 () Bool)

(assert (=> b!796546 (=> (not res!541065) (not e!441982))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796546 (= res!541065 (and (= (size!21149 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21149 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21149 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796547 () Bool)

(declare-fun res!541070 () Bool)

(declare-fun e!441980 () Bool)

(assert (=> b!796547 (=> (not res!541070) (not e!441980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43296 (_ BitVec 32)) Bool)

(assert (=> b!796547 (= res!541070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796548 () Bool)

(declare-fun res!541067 () Bool)

(assert (=> b!796548 (=> (not res!541067) (not e!441980))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796548 (= res!541067 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21149 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20728 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21149 a!3170)) (= (select (arr!20728 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796549 () Bool)

(declare-fun e!441979 () Bool)

(declare-fun e!441983 () Bool)

(assert (=> b!796549 (= e!441979 e!441983)))

(declare-fun res!541066 () Bool)

(assert (=> b!796549 (=> (not res!541066) (not e!441983))))

(declare-datatypes ((SeekEntryResult!8319 0))(
  ( (MissingZero!8319 (index!35644 (_ BitVec 32))) (Found!8319 (index!35645 (_ BitVec 32))) (Intermediate!8319 (undefined!9131 Bool) (index!35646 (_ BitVec 32)) (x!66549 (_ BitVec 32))) (Undefined!8319) (MissingVacant!8319 (index!35647 (_ BitVec 32))) )
))
(declare-fun lt!355198 () SeekEntryResult!8319)

(declare-fun lt!355200 () SeekEntryResult!8319)

(assert (=> b!796549 (= res!541066 (and (= lt!355198 lt!355200) (= lt!355200 (Found!8319 j!153)) (= (select (arr!20728 a!3170) index!1236) (select (arr!20728 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43296 (_ BitVec 32)) SeekEntryResult!8319)

(assert (=> b!796549 (= lt!355200 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20728 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43296 (_ BitVec 32)) SeekEntryResult!8319)

(assert (=> b!796549 (= lt!355198 (seekEntryOrOpen!0 (select (arr!20728 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796550 () Bool)

(declare-fun res!541069 () Bool)

(assert (=> b!796550 (=> (not res!541069) (not e!441982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796550 (= res!541069 (validKeyInArray!0 (select (arr!20728 a!3170) j!153)))))

(declare-fun b!796551 () Bool)

(assert (=> b!796551 (= e!441980 e!441979)))

(declare-fun res!541071 () Bool)

(assert (=> b!796551 (=> (not res!541071) (not e!441979))))

(declare-fun lt!355196 () SeekEntryResult!8319)

(declare-fun lt!355199 () SeekEntryResult!8319)

(assert (=> b!796551 (= res!541071 (= lt!355196 lt!355199))))

(declare-fun lt!355197 () array!43296)

(declare-fun lt!355201 () (_ BitVec 64))

(assert (=> b!796551 (= lt!355199 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355201 lt!355197 mask!3266))))

(assert (=> b!796551 (= lt!355196 (seekEntryOrOpen!0 lt!355201 lt!355197 mask!3266))))

(assert (=> b!796551 (= lt!355201 (select (store (arr!20728 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796551 (= lt!355197 (array!43297 (store (arr!20728 a!3170) i!1163 k0!2044) (size!21149 a!3170)))))

(declare-fun b!796552 () Bool)

(declare-fun res!541072 () Bool)

(assert (=> b!796552 (=> (not res!541072) (not e!441980))))

(declare-datatypes ((List!14691 0))(
  ( (Nil!14688) (Cons!14687 (h!15816 (_ BitVec 64)) (t!21006 List!14691)) )
))
(declare-fun arrayNoDuplicates!0 (array!43296 (_ BitVec 32) List!14691) Bool)

(assert (=> b!796552 (= res!541072 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14688))))

(declare-fun res!541064 () Bool)

(assert (=> start!68506 (=> (not res!541064) (not e!441982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68506 (= res!541064 (validMask!0 mask!3266))))

(assert (=> start!68506 e!441982))

(assert (=> start!68506 true))

(declare-fun array_inv!16524 (array!43296) Bool)

(assert (=> start!68506 (array_inv!16524 a!3170)))

(declare-fun b!796545 () Bool)

(assert (=> b!796545 (= e!441983 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!796545 (= lt!355199 (Found!8319 index!1236))))

(declare-fun b!796553 () Bool)

(assert (=> b!796553 (= e!441982 e!441980)))

(declare-fun res!541063 () Bool)

(assert (=> b!796553 (=> (not res!541063) (not e!441980))))

(declare-fun lt!355202 () SeekEntryResult!8319)

(assert (=> b!796553 (= res!541063 (or (= lt!355202 (MissingZero!8319 i!1163)) (= lt!355202 (MissingVacant!8319 i!1163))))))

(assert (=> b!796553 (= lt!355202 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796554 () Bool)

(declare-fun res!541068 () Bool)

(assert (=> b!796554 (=> (not res!541068) (not e!441982))))

(assert (=> b!796554 (= res!541068 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68506 res!541064) b!796546))

(assert (= (and b!796546 res!541065) b!796550))

(assert (= (and b!796550 res!541069) b!796554))

(assert (= (and b!796554 res!541068) b!796544))

(assert (= (and b!796544 res!541073) b!796553))

(assert (= (and b!796553 res!541063) b!796547))

(assert (= (and b!796547 res!541070) b!796552))

(assert (= (and b!796552 res!541072) b!796548))

(assert (= (and b!796548 res!541067) b!796551))

(assert (= (and b!796551 res!541071) b!796549))

(assert (= (and b!796549 res!541066) b!796545))

(declare-fun m!737339 () Bool)

(assert (=> b!796551 m!737339))

(declare-fun m!737341 () Bool)

(assert (=> b!796551 m!737341))

(declare-fun m!737343 () Bool)

(assert (=> b!796551 m!737343))

(declare-fun m!737345 () Bool)

(assert (=> b!796551 m!737345))

(declare-fun m!737347 () Bool)

(assert (=> b!796550 m!737347))

(assert (=> b!796550 m!737347))

(declare-fun m!737349 () Bool)

(assert (=> b!796550 m!737349))

(declare-fun m!737351 () Bool)

(assert (=> start!68506 m!737351))

(declare-fun m!737353 () Bool)

(assert (=> start!68506 m!737353))

(declare-fun m!737355 () Bool)

(assert (=> b!796554 m!737355))

(declare-fun m!737357 () Bool)

(assert (=> b!796553 m!737357))

(declare-fun m!737359 () Bool)

(assert (=> b!796552 m!737359))

(declare-fun m!737361 () Bool)

(assert (=> b!796549 m!737361))

(assert (=> b!796549 m!737347))

(assert (=> b!796549 m!737347))

(declare-fun m!737363 () Bool)

(assert (=> b!796549 m!737363))

(assert (=> b!796549 m!737347))

(declare-fun m!737365 () Bool)

(assert (=> b!796549 m!737365))

(declare-fun m!737367 () Bool)

(assert (=> b!796544 m!737367))

(declare-fun m!737369 () Bool)

(assert (=> b!796547 m!737369))

(declare-fun m!737371 () Bool)

(assert (=> b!796548 m!737371))

(declare-fun m!737373 () Bool)

(assert (=> b!796548 m!737373))

(check-sat (not b!796551) (not b!796547) (not start!68506) (not b!796553) (not b!796554) (not b!796552) (not b!796544) (not b!796550) (not b!796549))
(check-sat)
