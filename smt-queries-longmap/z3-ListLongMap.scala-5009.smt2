; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68688 () Bool)

(assert start!68688)

(declare-fun res!542358 () Bool)

(declare-fun e!442890 () Bool)

(assert (=> start!68688 (=> (not res!542358) (not e!442890))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68688 (= res!542358 (validMask!0 mask!3266))))

(assert (=> start!68688 e!442890))

(assert (=> start!68688 true))

(declare-datatypes ((array!43352 0))(
  ( (array!43353 (arr!20752 (Array (_ BitVec 32) (_ BitVec 64))) (size!21172 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43352)

(declare-fun array_inv!16611 (array!43352) Bool)

(assert (=> start!68688 (array_inv!16611 a!3170)))

(declare-fun b!798201 () Bool)

(declare-fun e!442889 () Bool)

(declare-fun e!442887 () Bool)

(assert (=> b!798201 (= e!442889 e!442887)))

(declare-fun res!542354 () Bool)

(assert (=> b!798201 (=> (not res!542354) (not e!442887))))

(declare-datatypes ((SeekEntryResult!8299 0))(
  ( (MissingZero!8299 (index!35564 (_ BitVec 32))) (Found!8299 (index!35565 (_ BitVec 32))) (Intermediate!8299 (undefined!9111 Bool) (index!35566 (_ BitVec 32)) (x!66620 (_ BitVec 32))) (Undefined!8299) (MissingVacant!8299 (index!35567 (_ BitVec 32))) )
))
(declare-fun lt!356115 () SeekEntryResult!8299)

(declare-fun lt!356122 () SeekEntryResult!8299)

(assert (=> b!798201 (= res!542354 (= lt!356115 lt!356122))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356121 () array!43352)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356119 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43352 (_ BitVec 32)) SeekEntryResult!8299)

(assert (=> b!798201 (= lt!356122 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356119 lt!356121 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43352 (_ BitVec 32)) SeekEntryResult!8299)

(assert (=> b!798201 (= lt!356115 (seekEntryOrOpen!0 lt!356119 lt!356121 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798201 (= lt!356119 (select (store (arr!20752 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798201 (= lt!356121 (array!43353 (store (arr!20752 a!3170) i!1163 k0!2044) (size!21172 a!3170)))))

(declare-fun b!798202 () Bool)

(declare-fun e!442885 () Bool)

(declare-fun e!442886 () Bool)

(assert (=> b!798202 (= e!442885 e!442886)))

(declare-fun res!542355 () Bool)

(assert (=> b!798202 (=> (not res!542355) (not e!442886))))

(declare-fun lt!356116 () SeekEntryResult!8299)

(declare-fun lt!356118 () SeekEntryResult!8299)

(assert (=> b!798202 (= res!542355 (and (= lt!356118 lt!356116) (= (select (arr!20752 a!3170) index!1236) (select (arr!20752 a!3170) j!153))))))

(assert (=> b!798202 (= lt!356116 (Found!8299 j!153))))

(declare-fun b!798203 () Bool)

(declare-fun res!542351 () Bool)

(assert (=> b!798203 (=> (not res!542351) (not e!442890))))

(assert (=> b!798203 (= res!542351 (and (= (size!21172 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21172 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21172 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798204 () Bool)

(assert (=> b!798204 (= e!442887 e!442885)))

(declare-fun res!542352 () Bool)

(assert (=> b!798204 (=> (not res!542352) (not e!442885))))

(declare-fun lt!356120 () SeekEntryResult!8299)

(assert (=> b!798204 (= res!542352 (= lt!356120 lt!356118))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798204 (= lt!356118 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20752 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798204 (= lt!356120 (seekEntryOrOpen!0 (select (arr!20752 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798205 () Bool)

(declare-fun res!542346 () Bool)

(assert (=> b!798205 (=> (not res!542346) (not e!442889))))

(assert (=> b!798205 (= res!542346 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21172 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20752 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21172 a!3170)) (= (select (arr!20752 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798206 () Bool)

(declare-fun res!542357 () Bool)

(assert (=> b!798206 (=> (not res!542357) (not e!442890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798206 (= res!542357 (validKeyInArray!0 k0!2044))))

(declare-fun b!798207 () Bool)

(declare-fun e!442891 () Bool)

(assert (=> b!798207 (= e!442891 (validKeyInArray!0 lt!356119))))

(declare-fun b!798208 () Bool)

(declare-fun res!542348 () Bool)

(assert (=> b!798208 (=> (not res!542348) (not e!442890))))

(assert (=> b!798208 (= res!542348 (validKeyInArray!0 (select (arr!20752 a!3170) j!153)))))

(declare-fun b!798209 () Bool)

(declare-fun res!542353 () Bool)

(assert (=> b!798209 (=> (not res!542353) (not e!442889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43352 (_ BitVec 32)) Bool)

(assert (=> b!798209 (= res!542353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798210 () Bool)

(assert (=> b!798210 (= e!442890 e!442889)))

(declare-fun res!542356 () Bool)

(assert (=> b!798210 (=> (not res!542356) (not e!442889))))

(declare-fun lt!356117 () SeekEntryResult!8299)

(assert (=> b!798210 (= res!542356 (or (= lt!356117 (MissingZero!8299 i!1163)) (= lt!356117 (MissingVacant!8299 i!1163))))))

(assert (=> b!798210 (= lt!356117 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798211 () Bool)

(assert (=> b!798211 (= e!442886 (not e!442891))))

(declare-fun res!542350 () Bool)

(assert (=> b!798211 (=> res!542350 e!442891)))

(assert (=> b!798211 (= res!542350 (or (not (= lt!356122 lt!356116)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20752 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!798211 (= lt!356122 (Found!8299 index!1236))))

(declare-fun b!798212 () Bool)

(declare-fun res!542349 () Bool)

(assert (=> b!798212 (=> (not res!542349) (not e!442890))))

(declare-fun arrayContainsKey!0 (array!43352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798212 (= res!542349 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798213 () Bool)

(declare-fun res!542347 () Bool)

(assert (=> b!798213 (=> (not res!542347) (not e!442889))))

(declare-datatypes ((List!14622 0))(
  ( (Nil!14619) (Cons!14618 (h!15753 (_ BitVec 64)) (t!20929 List!14622)) )
))
(declare-fun arrayNoDuplicates!0 (array!43352 (_ BitVec 32) List!14622) Bool)

(assert (=> b!798213 (= res!542347 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14619))))

(assert (= (and start!68688 res!542358) b!798203))

(assert (= (and b!798203 res!542351) b!798208))

(assert (= (and b!798208 res!542348) b!798206))

(assert (= (and b!798206 res!542357) b!798212))

(assert (= (and b!798212 res!542349) b!798210))

(assert (= (and b!798210 res!542356) b!798209))

(assert (= (and b!798209 res!542353) b!798213))

(assert (= (and b!798213 res!542347) b!798205))

(assert (= (and b!798205 res!542346) b!798201))

(assert (= (and b!798201 res!542354) b!798204))

(assert (= (and b!798204 res!542352) b!798202))

(assert (= (and b!798202 res!542355) b!798211))

(assert (= (and b!798211 (not res!542350)) b!798207))

(declare-fun m!739487 () Bool)

(assert (=> b!798209 m!739487))

(declare-fun m!739489 () Bool)

(assert (=> b!798212 m!739489))

(declare-fun m!739491 () Bool)

(assert (=> b!798202 m!739491))

(declare-fun m!739493 () Bool)

(assert (=> b!798202 m!739493))

(declare-fun m!739495 () Bool)

(assert (=> b!798213 m!739495))

(declare-fun m!739497 () Bool)

(assert (=> b!798210 m!739497))

(declare-fun m!739499 () Bool)

(assert (=> start!68688 m!739499))

(declare-fun m!739501 () Bool)

(assert (=> start!68688 m!739501))

(assert (=> b!798208 m!739493))

(assert (=> b!798208 m!739493))

(declare-fun m!739503 () Bool)

(assert (=> b!798208 m!739503))

(assert (=> b!798204 m!739493))

(assert (=> b!798204 m!739493))

(declare-fun m!739505 () Bool)

(assert (=> b!798204 m!739505))

(assert (=> b!798204 m!739493))

(declare-fun m!739507 () Bool)

(assert (=> b!798204 m!739507))

(declare-fun m!739509 () Bool)

(assert (=> b!798207 m!739509))

(declare-fun m!739511 () Bool)

(assert (=> b!798201 m!739511))

(declare-fun m!739513 () Bool)

(assert (=> b!798201 m!739513))

(declare-fun m!739515 () Bool)

(assert (=> b!798201 m!739515))

(declare-fun m!739517 () Bool)

(assert (=> b!798201 m!739517))

(declare-fun m!739519 () Bool)

(assert (=> b!798205 m!739519))

(declare-fun m!739521 () Bool)

(assert (=> b!798205 m!739521))

(assert (=> b!798211 m!739515))

(declare-fun m!739523 () Bool)

(assert (=> b!798211 m!739523))

(declare-fun m!739525 () Bool)

(assert (=> b!798206 m!739525))

(check-sat (not b!798208) (not b!798210) (not b!798212) (not b!798201) (not start!68688) (not b!798213) (not b!798209) (not b!798204) (not b!798206) (not b!798207))
(check-sat)
