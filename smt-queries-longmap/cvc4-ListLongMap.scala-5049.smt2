; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68808 () Bool)

(assert start!68808)

(declare-fun b!802013 () Bool)

(declare-fun res!546538 () Bool)

(declare-fun e!444517 () Bool)

(assert (=> b!802013 (=> (not res!546538) (not e!444517))))

(declare-datatypes ((array!43598 0))(
  ( (array!43599 (arr!20879 (Array (_ BitVec 32) (_ BitVec 64))) (size!21300 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43598)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802013 (= res!546538 (validKeyInArray!0 (select (arr!20879 a!3170) j!153)))))

(declare-fun b!802014 () Bool)

(declare-fun res!546542 () Bool)

(declare-fun e!444515 () Bool)

(assert (=> b!802014 (=> (not res!546542) (not e!444515))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802014 (= res!546542 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21300 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20879 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21300 a!3170)) (= (select (arr!20879 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!546537 () Bool)

(assert (=> start!68808 (=> (not res!546537) (not e!444517))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68808 (= res!546537 (validMask!0 mask!3266))))

(assert (=> start!68808 e!444517))

(assert (=> start!68808 true))

(declare-fun array_inv!16675 (array!43598) Bool)

(assert (=> start!68808 (array_inv!16675 a!3170)))

(declare-fun b!802015 () Bool)

(declare-fun e!444518 () Bool)

(assert (=> b!802015 (= e!444515 e!444518)))

(declare-fun res!546535 () Bool)

(assert (=> b!802015 (=> (not res!546535) (not e!444518))))

(declare-fun lt!358584 () array!43598)

(declare-fun lt!358583 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8470 0))(
  ( (MissingZero!8470 (index!36248 (_ BitVec 32))) (Found!8470 (index!36249 (_ BitVec 32))) (Intermediate!8470 (undefined!9282 Bool) (index!36250 (_ BitVec 32)) (x!67100 (_ BitVec 32))) (Undefined!8470) (MissingVacant!8470 (index!36251 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43598 (_ BitVec 32)) SeekEntryResult!8470)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43598 (_ BitVec 32)) SeekEntryResult!8470)

(assert (=> b!802015 (= res!546535 (= (seekEntryOrOpen!0 lt!358583 lt!358584 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358583 lt!358584 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!802015 (= lt!358583 (select (store (arr!20879 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802015 (= lt!358584 (array!43599 (store (arr!20879 a!3170) i!1163 k!2044) (size!21300 a!3170)))))

(declare-fun b!802016 () Bool)

(declare-fun e!444516 () Bool)

(assert (=> b!802016 (= e!444516 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!358587 () (_ BitVec 32))

(assert (=> b!802016 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358587 vacantAfter!23 lt!358583 lt!358584 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358587 vacantBefore!23 (select (arr!20879 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27480 0))(
  ( (Unit!27481) )
))
(declare-fun lt!358585 () Unit!27480)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43598 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27480)

(assert (=> b!802016 (= lt!358585 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358587 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802016 (= lt!358587 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802017 () Bool)

(declare-fun res!546539 () Bool)

(assert (=> b!802017 (=> (not res!546539) (not e!444517))))

(assert (=> b!802017 (= res!546539 (and (= (size!21300 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21300 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21300 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802018 () Bool)

(declare-fun res!546534 () Bool)

(assert (=> b!802018 (=> (not res!546534) (not e!444517))))

(declare-fun arrayContainsKey!0 (array!43598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802018 (= res!546534 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802019 () Bool)

(assert (=> b!802019 (= e!444517 e!444515)))

(declare-fun res!546536 () Bool)

(assert (=> b!802019 (=> (not res!546536) (not e!444515))))

(declare-fun lt!358588 () SeekEntryResult!8470)

(assert (=> b!802019 (= res!546536 (or (= lt!358588 (MissingZero!8470 i!1163)) (= lt!358588 (MissingVacant!8470 i!1163))))))

(assert (=> b!802019 (= lt!358588 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802020 () Bool)

(assert (=> b!802020 (= e!444518 e!444516)))

(declare-fun res!546541 () Bool)

(assert (=> b!802020 (=> (not res!546541) (not e!444516))))

(declare-fun lt!358586 () SeekEntryResult!8470)

(declare-fun lt!358589 () SeekEntryResult!8470)

(assert (=> b!802020 (= res!546541 (and (= lt!358586 lt!358589) (= lt!358589 (Found!8470 j!153)) (not (= (select (arr!20879 a!3170) index!1236) (select (arr!20879 a!3170) j!153)))))))

(assert (=> b!802020 (= lt!358589 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20879 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802020 (= lt!358586 (seekEntryOrOpen!0 (select (arr!20879 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802021 () Bool)

(declare-fun res!546532 () Bool)

(assert (=> b!802021 (=> (not res!546532) (not e!444517))))

(assert (=> b!802021 (= res!546532 (validKeyInArray!0 k!2044))))

(declare-fun b!802022 () Bool)

(declare-fun res!546540 () Bool)

(assert (=> b!802022 (=> (not res!546540) (not e!444515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43598 (_ BitVec 32)) Bool)

(assert (=> b!802022 (= res!546540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802023 () Bool)

(declare-fun res!546533 () Bool)

(assert (=> b!802023 (=> (not res!546533) (not e!444515))))

(declare-datatypes ((List!14842 0))(
  ( (Nil!14839) (Cons!14838 (h!15967 (_ BitVec 64)) (t!21157 List!14842)) )
))
(declare-fun arrayNoDuplicates!0 (array!43598 (_ BitVec 32) List!14842) Bool)

(assert (=> b!802023 (= res!546533 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14839))))

(assert (= (and start!68808 res!546537) b!802017))

(assert (= (and b!802017 res!546539) b!802013))

(assert (= (and b!802013 res!546538) b!802021))

(assert (= (and b!802021 res!546532) b!802018))

(assert (= (and b!802018 res!546534) b!802019))

(assert (= (and b!802019 res!546536) b!802022))

(assert (= (and b!802022 res!546540) b!802023))

(assert (= (and b!802023 res!546533) b!802014))

(assert (= (and b!802014 res!546542) b!802015))

(assert (= (and b!802015 res!546535) b!802020))

(assert (= (and b!802020 res!546541) b!802016))

(declare-fun m!743319 () Bool)

(assert (=> b!802018 m!743319))

(declare-fun m!743321 () Bool)

(assert (=> b!802020 m!743321))

(declare-fun m!743323 () Bool)

(assert (=> b!802020 m!743323))

(assert (=> b!802020 m!743323))

(declare-fun m!743325 () Bool)

(assert (=> b!802020 m!743325))

(assert (=> b!802020 m!743323))

(declare-fun m!743327 () Bool)

(assert (=> b!802020 m!743327))

(assert (=> b!802013 m!743323))

(assert (=> b!802013 m!743323))

(declare-fun m!743329 () Bool)

(assert (=> b!802013 m!743329))

(declare-fun m!743331 () Bool)

(assert (=> start!68808 m!743331))

(declare-fun m!743333 () Bool)

(assert (=> start!68808 m!743333))

(declare-fun m!743335 () Bool)

(assert (=> b!802023 m!743335))

(declare-fun m!743337 () Bool)

(assert (=> b!802019 m!743337))

(declare-fun m!743339 () Bool)

(assert (=> b!802021 m!743339))

(declare-fun m!743341 () Bool)

(assert (=> b!802015 m!743341))

(declare-fun m!743343 () Bool)

(assert (=> b!802015 m!743343))

(declare-fun m!743345 () Bool)

(assert (=> b!802015 m!743345))

(declare-fun m!743347 () Bool)

(assert (=> b!802015 m!743347))

(declare-fun m!743349 () Bool)

(assert (=> b!802014 m!743349))

(declare-fun m!743351 () Bool)

(assert (=> b!802014 m!743351))

(assert (=> b!802016 m!743323))

(declare-fun m!743353 () Bool)

(assert (=> b!802016 m!743353))

(declare-fun m!743355 () Bool)

(assert (=> b!802016 m!743355))

(assert (=> b!802016 m!743323))

(declare-fun m!743357 () Bool)

(assert (=> b!802016 m!743357))

(declare-fun m!743359 () Bool)

(assert (=> b!802016 m!743359))

(declare-fun m!743361 () Bool)

(assert (=> b!802022 m!743361))

(push 1)

(assert (not b!802013))

(assert (not b!802021))

(assert (not b!802018))

(assert (not b!802016))

(assert (not b!802020))

(assert (not b!802023))

(assert (not b!802022))

(assert (not start!68808))

(assert (not b!802019))

(assert (not b!802015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

