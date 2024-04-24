; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69056 () Bool)

(assert start!69056)

(declare-datatypes ((SeekEntryResult!8461 0))(
  ( (MissingZero!8461 (index!36212 (_ BitVec 32))) (Found!8461 (index!36213 (_ BitVec 32))) (Intermediate!8461 (undefined!9273 Bool) (index!36214 (_ BitVec 32)) (x!67217 (_ BitVec 32))) (Undefined!8461) (MissingVacant!8461 (index!36215 (_ BitVec 32))) )
))
(declare-fun lt!359921 () SeekEntryResult!8461)

(declare-fun e!445756 () Bool)

(declare-fun lt!359923 () SeekEntryResult!8461)

(declare-fun b!804286 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804286 (= e!445756 (not (or (not (= lt!359923 lt!359921)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!359927 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43678 0))(
  ( (array!43679 (arr!20914 (Array (_ BitVec 32) (_ BitVec 64))) (size!21334 (_ BitVec 32))) )
))
(declare-fun lt!359922 () array!43678)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun a!3170 () array!43678)

(declare-fun lt!359924 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43678 (_ BitVec 32)) SeekEntryResult!8461)

(assert (=> b!804286 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359924 vacantAfter!23 lt!359927 lt!359922 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359924 vacantBefore!23 (select (arr!20914 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27547 0))(
  ( (Unit!27548) )
))
(declare-fun lt!359926 () Unit!27547)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43678 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27547)

(assert (=> b!804286 (= lt!359926 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359924 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804286 (= lt!359924 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804287 () Bool)

(declare-fun e!445753 () Bool)

(declare-fun e!445754 () Bool)

(assert (=> b!804287 (= e!445753 e!445754)))

(declare-fun res!548260 () Bool)

(assert (=> b!804287 (=> (not res!548260) (not e!445754))))

(declare-fun lt!359928 () SeekEntryResult!8461)

(assert (=> b!804287 (= res!548260 (= lt!359928 lt!359923))))

(assert (=> b!804287 (= lt!359923 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359927 lt!359922 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43678 (_ BitVec 32)) SeekEntryResult!8461)

(assert (=> b!804287 (= lt!359928 (seekEntryOrOpen!0 lt!359927 lt!359922 mask!3266))))

(assert (=> b!804287 (= lt!359927 (select (store (arr!20914 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804287 (= lt!359922 (array!43679 (store (arr!20914 a!3170) i!1163 k0!2044) (size!21334 a!3170)))))

(declare-fun b!804288 () Bool)

(declare-fun res!548259 () Bool)

(declare-fun e!445751 () Bool)

(assert (=> b!804288 (=> (not res!548259) (not e!445751))))

(declare-fun arrayContainsKey!0 (array!43678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804288 (= res!548259 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804289 () Bool)

(declare-fun res!548263 () Bool)

(assert (=> b!804289 (=> (not res!548263) (not e!445751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804289 (= res!548263 (validKeyInArray!0 (select (arr!20914 a!3170) j!153)))))

(declare-fun b!804290 () Bool)

(declare-fun res!548265 () Bool)

(assert (=> b!804290 (=> (not res!548265) (not e!445753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43678 (_ BitVec 32)) Bool)

(assert (=> b!804290 (= res!548265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804291 () Bool)

(assert (=> b!804291 (= e!445751 e!445753)))

(declare-fun res!548262 () Bool)

(assert (=> b!804291 (=> (not res!548262) (not e!445753))))

(declare-fun lt!359925 () SeekEntryResult!8461)

(assert (=> b!804291 (= res!548262 (or (= lt!359925 (MissingZero!8461 i!1163)) (= lt!359925 (MissingVacant!8461 i!1163))))))

(assert (=> b!804291 (= lt!359925 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804292 () Bool)

(declare-fun res!548264 () Bool)

(assert (=> b!804292 (=> (not res!548264) (not e!445753))))

(declare-datatypes ((List!14784 0))(
  ( (Nil!14781) (Cons!14780 (h!15915 (_ BitVec 64)) (t!21091 List!14784)) )
))
(declare-fun arrayNoDuplicates!0 (array!43678 (_ BitVec 32) List!14784) Bool)

(assert (=> b!804292 (= res!548264 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14781))))

(declare-fun res!548258 () Bool)

(assert (=> start!69056 (=> (not res!548258) (not e!445751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69056 (= res!548258 (validMask!0 mask!3266))))

(assert (=> start!69056 e!445751))

(assert (=> start!69056 true))

(declare-fun array_inv!16773 (array!43678) Bool)

(assert (=> start!69056 (array_inv!16773 a!3170)))

(declare-fun b!804293 () Bool)

(declare-fun res!548266 () Bool)

(assert (=> b!804293 (=> (not res!548266) (not e!445753))))

(assert (=> b!804293 (= res!548266 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21334 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20914 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21334 a!3170)) (= (select (arr!20914 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804294 () Bool)

(declare-fun e!445752 () Bool)

(assert (=> b!804294 (= e!445754 e!445752)))

(declare-fun res!548257 () Bool)

(assert (=> b!804294 (=> (not res!548257) (not e!445752))))

(declare-fun lt!359930 () SeekEntryResult!8461)

(declare-fun lt!359929 () SeekEntryResult!8461)

(assert (=> b!804294 (= res!548257 (= lt!359930 lt!359929))))

(assert (=> b!804294 (= lt!359929 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20914 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!804294 (= lt!359930 (seekEntryOrOpen!0 (select (arr!20914 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804295 () Bool)

(declare-fun res!548268 () Bool)

(assert (=> b!804295 (=> (not res!548268) (not e!445751))))

(assert (=> b!804295 (= res!548268 (validKeyInArray!0 k0!2044))))

(declare-fun b!804296 () Bool)

(assert (=> b!804296 (= e!445752 e!445756)))

(declare-fun res!548267 () Bool)

(assert (=> b!804296 (=> (not res!548267) (not e!445756))))

(assert (=> b!804296 (= res!548267 (and (= lt!359929 lt!359921) (not (= (select (arr!20914 a!3170) index!1236) (select (arr!20914 a!3170) j!153)))))))

(assert (=> b!804296 (= lt!359921 (Found!8461 j!153))))

(declare-fun b!804297 () Bool)

(declare-fun res!548261 () Bool)

(assert (=> b!804297 (=> (not res!548261) (not e!445751))))

(assert (=> b!804297 (= res!548261 (and (= (size!21334 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21334 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21334 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69056 res!548258) b!804297))

(assert (= (and b!804297 res!548261) b!804289))

(assert (= (and b!804289 res!548263) b!804295))

(assert (= (and b!804295 res!548268) b!804288))

(assert (= (and b!804288 res!548259) b!804291))

(assert (= (and b!804291 res!548262) b!804290))

(assert (= (and b!804290 res!548265) b!804292))

(assert (= (and b!804292 res!548264) b!804293))

(assert (= (and b!804293 res!548266) b!804287))

(assert (= (and b!804287 res!548260) b!804294))

(assert (= (and b!804294 res!548257) b!804296))

(assert (= (and b!804296 res!548267) b!804286))

(declare-fun m!746371 () Bool)

(assert (=> b!804286 m!746371))

(declare-fun m!746373 () Bool)

(assert (=> b!804286 m!746373))

(assert (=> b!804286 m!746371))

(declare-fun m!746375 () Bool)

(assert (=> b!804286 m!746375))

(declare-fun m!746377 () Bool)

(assert (=> b!804286 m!746377))

(declare-fun m!746379 () Bool)

(assert (=> b!804286 m!746379))

(declare-fun m!746381 () Bool)

(assert (=> b!804296 m!746381))

(assert (=> b!804296 m!746371))

(assert (=> b!804294 m!746371))

(assert (=> b!804294 m!746371))

(declare-fun m!746383 () Bool)

(assert (=> b!804294 m!746383))

(assert (=> b!804294 m!746371))

(declare-fun m!746385 () Bool)

(assert (=> b!804294 m!746385))

(assert (=> b!804289 m!746371))

(assert (=> b!804289 m!746371))

(declare-fun m!746387 () Bool)

(assert (=> b!804289 m!746387))

(declare-fun m!746389 () Bool)

(assert (=> b!804290 m!746389))

(declare-fun m!746391 () Bool)

(assert (=> b!804292 m!746391))

(declare-fun m!746393 () Bool)

(assert (=> b!804288 m!746393))

(declare-fun m!746395 () Bool)

(assert (=> b!804293 m!746395))

(declare-fun m!746397 () Bool)

(assert (=> b!804293 m!746397))

(declare-fun m!746399 () Bool)

(assert (=> b!804295 m!746399))

(declare-fun m!746401 () Bool)

(assert (=> start!69056 m!746401))

(declare-fun m!746403 () Bool)

(assert (=> start!69056 m!746403))

(declare-fun m!746405 () Bool)

(assert (=> b!804291 m!746405))

(declare-fun m!746407 () Bool)

(assert (=> b!804287 m!746407))

(declare-fun m!746409 () Bool)

(assert (=> b!804287 m!746409))

(declare-fun m!746411 () Bool)

(assert (=> b!804287 m!746411))

(declare-fun m!746413 () Bool)

(assert (=> b!804287 m!746413))

(check-sat (not b!804289) (not b!804286) (not b!804290) (not b!804287) (not start!69056) (not b!804292) (not b!804291) (not b!804294) (not b!804295) (not b!804288))
(check-sat)
