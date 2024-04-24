; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69008 () Bool)

(assert start!69008)

(declare-fun b!803440 () Bool)

(declare-fun e!445339 () Bool)

(declare-fun e!445340 () Bool)

(assert (=> b!803440 (= e!445339 e!445340)))

(declare-fun res!547417 () Bool)

(assert (=> b!803440 (=> (not res!547417) (not e!445340))))

(declare-datatypes ((SeekEntryResult!8437 0))(
  ( (MissingZero!8437 (index!36116 (_ BitVec 32))) (Found!8437 (index!36117 (_ BitVec 32))) (Intermediate!8437 (undefined!9249 Bool) (index!36118 (_ BitVec 32)) (x!67129 (_ BitVec 32))) (Undefined!8437) (MissingVacant!8437 (index!36119 (_ BitVec 32))) )
))
(declare-fun lt!359289 () SeekEntryResult!8437)

(declare-fun lt!359285 () SeekEntryResult!8437)

(assert (=> b!803440 (= res!547417 (= lt!359289 lt!359285))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359283 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43630 0))(
  ( (array!43631 (arr!20890 (Array (_ BitVec 32) (_ BitVec 64))) (size!21310 (_ BitVec 32))) )
))
(declare-fun lt!359286 () array!43630)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43630 (_ BitVec 32)) SeekEntryResult!8437)

(assert (=> b!803440 (= lt!359285 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359283 lt!359286 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43630 (_ BitVec 32)) SeekEntryResult!8437)

(assert (=> b!803440 (= lt!359289 (seekEntryOrOpen!0 lt!359283 lt!359286 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43630)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803440 (= lt!359283 (select (store (arr!20890 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803440 (= lt!359286 (array!43631 (store (arr!20890 a!3170) i!1163 k0!2044) (size!21310 a!3170)))))

(declare-fun b!803441 () Bool)

(declare-fun lt!359290 () SeekEntryResult!8437)

(declare-fun e!445338 () Bool)

(assert (=> b!803441 (= e!445338 (not (or (not (= lt!359285 lt!359290)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!359288 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803441 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359288 vacantAfter!23 lt!359283 lt!359286 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359288 vacantBefore!23 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27499 0))(
  ( (Unit!27500) )
))
(declare-fun lt!359287 () Unit!27499)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43630 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27499)

(assert (=> b!803441 (= lt!359287 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359288 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803441 (= lt!359288 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803442 () Bool)

(declare-fun res!547414 () Bool)

(assert (=> b!803442 (=> (not res!547414) (not e!445339))))

(declare-datatypes ((List!14760 0))(
  ( (Nil!14757) (Cons!14756 (h!15891 (_ BitVec 64)) (t!21067 List!14760)) )
))
(declare-fun arrayNoDuplicates!0 (array!43630 (_ BitVec 32) List!14760) Bool)

(assert (=> b!803442 (= res!547414 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14757))))

(declare-fun b!803443 () Bool)

(declare-fun res!547419 () Bool)

(assert (=> b!803443 (=> (not res!547419) (not e!445339))))

(assert (=> b!803443 (= res!547419 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21310 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20890 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21310 a!3170)) (= (select (arr!20890 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!547412 () Bool)

(declare-fun e!445341 () Bool)

(assert (=> start!69008 (=> (not res!547412) (not e!445341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69008 (= res!547412 (validMask!0 mask!3266))))

(assert (=> start!69008 e!445341))

(assert (=> start!69008 true))

(declare-fun array_inv!16749 (array!43630) Bool)

(assert (=> start!69008 (array_inv!16749 a!3170)))

(declare-fun b!803444 () Bool)

(declare-fun res!547418 () Bool)

(assert (=> b!803444 (=> (not res!547418) (not e!445341))))

(assert (=> b!803444 (= res!547418 (and (= (size!21310 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21310 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21310 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803445 () Bool)

(declare-fun e!445337 () Bool)

(assert (=> b!803445 (= e!445337 e!445338)))

(declare-fun res!547416 () Bool)

(assert (=> b!803445 (=> (not res!547416) (not e!445338))))

(declare-fun lt!359282 () SeekEntryResult!8437)

(assert (=> b!803445 (= res!547416 (and (= lt!359282 lt!359290) (not (= (select (arr!20890 a!3170) index!1236) (select (arr!20890 a!3170) j!153)))))))

(assert (=> b!803445 (= lt!359290 (Found!8437 j!153))))

(declare-fun b!803446 () Bool)

(declare-fun res!547421 () Bool)

(assert (=> b!803446 (=> (not res!547421) (not e!445341))))

(declare-fun arrayContainsKey!0 (array!43630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803446 (= res!547421 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803447 () Bool)

(assert (=> b!803447 (= e!445341 e!445339)))

(declare-fun res!547415 () Bool)

(assert (=> b!803447 (=> (not res!547415) (not e!445339))))

(declare-fun lt!359284 () SeekEntryResult!8437)

(assert (=> b!803447 (= res!547415 (or (= lt!359284 (MissingZero!8437 i!1163)) (= lt!359284 (MissingVacant!8437 i!1163))))))

(assert (=> b!803447 (= lt!359284 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803448 () Bool)

(assert (=> b!803448 (= e!445340 e!445337)))

(declare-fun res!547413 () Bool)

(assert (=> b!803448 (=> (not res!547413) (not e!445337))))

(declare-fun lt!359291 () SeekEntryResult!8437)

(assert (=> b!803448 (= res!547413 (= lt!359291 lt!359282))))

(assert (=> b!803448 (= lt!359282 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803448 (= lt!359291 (seekEntryOrOpen!0 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803449 () Bool)

(declare-fun res!547420 () Bool)

(assert (=> b!803449 (=> (not res!547420) (not e!445341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803449 (= res!547420 (validKeyInArray!0 k0!2044))))

(declare-fun b!803450 () Bool)

(declare-fun res!547422 () Bool)

(assert (=> b!803450 (=> (not res!547422) (not e!445339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43630 (_ BitVec 32)) Bool)

(assert (=> b!803450 (= res!547422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803451 () Bool)

(declare-fun res!547411 () Bool)

(assert (=> b!803451 (=> (not res!547411) (not e!445341))))

(assert (=> b!803451 (= res!547411 (validKeyInArray!0 (select (arr!20890 a!3170) j!153)))))

(assert (= (and start!69008 res!547412) b!803444))

(assert (= (and b!803444 res!547418) b!803451))

(assert (= (and b!803451 res!547411) b!803449))

(assert (= (and b!803449 res!547420) b!803446))

(assert (= (and b!803446 res!547421) b!803447))

(assert (= (and b!803447 res!547415) b!803450))

(assert (= (and b!803450 res!547422) b!803442))

(assert (= (and b!803442 res!547414) b!803443))

(assert (= (and b!803443 res!547419) b!803440))

(assert (= (and b!803440 res!547417) b!803448))

(assert (= (and b!803448 res!547413) b!803445))

(assert (= (and b!803445 res!547416) b!803441))

(declare-fun m!745297 () Bool)

(assert (=> b!803451 m!745297))

(assert (=> b!803451 m!745297))

(declare-fun m!745299 () Bool)

(assert (=> b!803451 m!745299))

(declare-fun m!745301 () Bool)

(assert (=> b!803446 m!745301))

(assert (=> b!803448 m!745297))

(assert (=> b!803448 m!745297))

(declare-fun m!745303 () Bool)

(assert (=> b!803448 m!745303))

(assert (=> b!803448 m!745297))

(declare-fun m!745305 () Bool)

(assert (=> b!803448 m!745305))

(declare-fun m!745307 () Bool)

(assert (=> b!803442 m!745307))

(declare-fun m!745309 () Bool)

(assert (=> b!803445 m!745309))

(assert (=> b!803445 m!745297))

(declare-fun m!745311 () Bool)

(assert (=> b!803441 m!745311))

(declare-fun m!745313 () Bool)

(assert (=> b!803441 m!745313))

(declare-fun m!745315 () Bool)

(assert (=> b!803441 m!745315))

(assert (=> b!803441 m!745297))

(declare-fun m!745317 () Bool)

(assert (=> b!803441 m!745317))

(assert (=> b!803441 m!745297))

(declare-fun m!745319 () Bool)

(assert (=> b!803440 m!745319))

(declare-fun m!745321 () Bool)

(assert (=> b!803440 m!745321))

(declare-fun m!745323 () Bool)

(assert (=> b!803440 m!745323))

(declare-fun m!745325 () Bool)

(assert (=> b!803440 m!745325))

(declare-fun m!745327 () Bool)

(assert (=> b!803450 m!745327))

(declare-fun m!745329 () Bool)

(assert (=> b!803447 m!745329))

(declare-fun m!745331 () Bool)

(assert (=> b!803443 m!745331))

(declare-fun m!745333 () Bool)

(assert (=> b!803443 m!745333))

(declare-fun m!745335 () Bool)

(assert (=> start!69008 m!745335))

(declare-fun m!745337 () Bool)

(assert (=> start!69008 m!745337))

(declare-fun m!745339 () Bool)

(assert (=> b!803449 m!745339))

(check-sat (not b!803448) (not start!69008) (not b!803442) (not b!803440) (not b!803446) (not b!803447) (not b!803451) (not b!803441) (not b!803450) (not b!803449))
(check-sat)
