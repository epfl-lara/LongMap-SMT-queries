; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68778 () Bool)

(assert start!68778)

(declare-fun b!801598 () Bool)

(declare-fun e!444288 () Bool)

(declare-fun e!444285 () Bool)

(assert (=> b!801598 (= e!444288 e!444285)))

(declare-fun res!546259 () Bool)

(assert (=> b!801598 (=> (not res!546259) (not e!444285))))

(declare-datatypes ((array!43585 0))(
  ( (array!43586 (arr!20873 (Array (_ BitVec 32) (_ BitVec 64))) (size!21294 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43585)

(declare-datatypes ((SeekEntryResult!8461 0))(
  ( (MissingZero!8461 (index!36212 (_ BitVec 32))) (Found!8461 (index!36213 (_ BitVec 32))) (Intermediate!8461 (undefined!9273 Bool) (index!36214 (_ BitVec 32)) (x!67078 (_ BitVec 32))) (Undefined!8461) (MissingVacant!8461 (index!36215 (_ BitVec 32))) )
))
(declare-fun lt!358241 () SeekEntryResult!8461)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358244 () SeekEntryResult!8461)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801598 (= res!546259 (and (= lt!358241 lt!358244) (= lt!358244 (Found!8461 j!153)) (not (= (select (arr!20873 a!3170) index!1236) (select (arr!20873 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43585 (_ BitVec 32)) SeekEntryResult!8461)

(assert (=> b!801598 (= lt!358244 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20873 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43585 (_ BitVec 32)) SeekEntryResult!8461)

(assert (=> b!801598 (= lt!358241 (seekEntryOrOpen!0 (select (arr!20873 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801599 () Bool)

(declare-fun res!546257 () Bool)

(declare-fun e!444289 () Bool)

(assert (=> b!801599 (=> (not res!546257) (not e!444289))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801599 (= res!546257 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801600 () Bool)

(declare-fun res!546258 () Bool)

(declare-fun e!444286 () Bool)

(assert (=> b!801600 (=> (not res!546258) (not e!444286))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801600 (= res!546258 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21294 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20873 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21294 a!3170)) (= (select (arr!20873 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801601 () Bool)

(declare-fun res!546260 () Bool)

(assert (=> b!801601 (=> (not res!546260) (not e!444289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801601 (= res!546260 (validKeyInArray!0 (select (arr!20873 a!3170) j!153)))))

(declare-fun b!801602 () Bool)

(declare-fun res!546262 () Bool)

(assert (=> b!801602 (=> (not res!546262) (not e!444286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43585 (_ BitVec 32)) Bool)

(assert (=> b!801602 (= res!546262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801603 () Bool)

(declare-fun res!546264 () Bool)

(assert (=> b!801603 (=> (not res!546264) (not e!444286))))

(declare-datatypes ((List!14875 0))(
  ( (Nil!14872) (Cons!14871 (h!16000 (_ BitVec 64)) (t!21181 List!14875)) )
))
(declare-fun arrayNoDuplicates!0 (array!43585 (_ BitVec 32) List!14875) Bool)

(assert (=> b!801603 (= res!546264 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14872))))

(declare-fun b!801604 () Bool)

(declare-fun res!546265 () Bool)

(assert (=> b!801604 (=> (not res!546265) (not e!444289))))

(assert (=> b!801604 (= res!546265 (and (= (size!21294 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21294 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21294 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801606 () Bool)

(assert (=> b!801606 (= e!444289 e!444286)))

(declare-fun res!546267 () Bool)

(assert (=> b!801606 (=> (not res!546267) (not e!444286))))

(declare-fun lt!358243 () SeekEntryResult!8461)

(assert (=> b!801606 (= res!546267 (or (= lt!358243 (MissingZero!8461 i!1163)) (= lt!358243 (MissingVacant!8461 i!1163))))))

(assert (=> b!801606 (= lt!358243 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801607 () Bool)

(assert (=> b!801607 (= e!444285 (not true))))

(declare-fun lt!358239 () (_ BitVec 64))

(declare-fun lt!358240 () array!43585)

(declare-fun lt!358238 () (_ BitVec 32))

(assert (=> b!801607 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358238 vacantAfter!23 lt!358239 lt!358240 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358238 vacantBefore!23 (select (arr!20873 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27436 0))(
  ( (Unit!27437) )
))
(declare-fun lt!358242 () Unit!27436)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27436)

(assert (=> b!801607 (= lt!358242 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358238 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801607 (= lt!358238 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801608 () Bool)

(assert (=> b!801608 (= e!444286 e!444288)))

(declare-fun res!546261 () Bool)

(assert (=> b!801608 (=> (not res!546261) (not e!444288))))

(assert (=> b!801608 (= res!546261 (= (seekEntryOrOpen!0 lt!358239 lt!358240 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358239 lt!358240 mask!3266)))))

(assert (=> b!801608 (= lt!358239 (select (store (arr!20873 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801608 (= lt!358240 (array!43586 (store (arr!20873 a!3170) i!1163 k0!2044) (size!21294 a!3170)))))

(declare-fun res!546266 () Bool)

(assert (=> start!68778 (=> (not res!546266) (not e!444289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68778 (= res!546266 (validMask!0 mask!3266))))

(assert (=> start!68778 e!444289))

(assert (=> start!68778 true))

(declare-fun array_inv!16756 (array!43585) Bool)

(assert (=> start!68778 (array_inv!16756 a!3170)))

(declare-fun b!801605 () Bool)

(declare-fun res!546263 () Bool)

(assert (=> b!801605 (=> (not res!546263) (not e!444289))))

(assert (=> b!801605 (= res!546263 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68778 res!546266) b!801604))

(assert (= (and b!801604 res!546265) b!801601))

(assert (= (and b!801601 res!546260) b!801605))

(assert (= (and b!801605 res!546263) b!801599))

(assert (= (and b!801599 res!546257) b!801606))

(assert (= (and b!801606 res!546267) b!801602))

(assert (= (and b!801602 res!546262) b!801603))

(assert (= (and b!801603 res!546264) b!801600))

(assert (= (and b!801600 res!546258) b!801608))

(assert (= (and b!801608 res!546261) b!801598))

(assert (= (and b!801598 res!546259) b!801607))

(declare-fun m!742357 () Bool)

(assert (=> b!801605 m!742357))

(declare-fun m!742359 () Bool)

(assert (=> b!801607 m!742359))

(declare-fun m!742361 () Bool)

(assert (=> b!801607 m!742361))

(assert (=> b!801607 m!742359))

(declare-fun m!742363 () Bool)

(assert (=> b!801607 m!742363))

(declare-fun m!742365 () Bool)

(assert (=> b!801607 m!742365))

(declare-fun m!742367 () Bool)

(assert (=> b!801607 m!742367))

(declare-fun m!742369 () Bool)

(assert (=> start!68778 m!742369))

(declare-fun m!742371 () Bool)

(assert (=> start!68778 m!742371))

(assert (=> b!801601 m!742359))

(assert (=> b!801601 m!742359))

(declare-fun m!742373 () Bool)

(assert (=> b!801601 m!742373))

(declare-fun m!742375 () Bool)

(assert (=> b!801606 m!742375))

(declare-fun m!742377 () Bool)

(assert (=> b!801599 m!742377))

(declare-fun m!742379 () Bool)

(assert (=> b!801602 m!742379))

(declare-fun m!742381 () Bool)

(assert (=> b!801608 m!742381))

(declare-fun m!742383 () Bool)

(assert (=> b!801608 m!742383))

(declare-fun m!742385 () Bool)

(assert (=> b!801608 m!742385))

(declare-fun m!742387 () Bool)

(assert (=> b!801608 m!742387))

(declare-fun m!742389 () Bool)

(assert (=> b!801600 m!742389))

(declare-fun m!742391 () Bool)

(assert (=> b!801600 m!742391))

(declare-fun m!742393 () Bool)

(assert (=> b!801603 m!742393))

(declare-fun m!742395 () Bool)

(assert (=> b!801598 m!742395))

(assert (=> b!801598 m!742359))

(assert (=> b!801598 m!742359))

(declare-fun m!742397 () Bool)

(assert (=> b!801598 m!742397))

(assert (=> b!801598 m!742359))

(declare-fun m!742399 () Bool)

(assert (=> b!801598 m!742399))

(check-sat (not b!801608) (not b!801598) (not b!801603) (not b!801601) (not start!68778) (not b!801602) (not b!801605) (not b!801606) (not b!801599) (not b!801607))
(check-sat)
