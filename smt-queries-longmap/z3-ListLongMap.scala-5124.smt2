; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69734 () Bool)

(assert start!69734)

(declare-fun b!811682 () Bool)

(declare-fun res!554414 () Bool)

(declare-fun e!449341 () Bool)

(assert (=> b!811682 (=> (not res!554414) (not e!449341))))

(declare-datatypes ((array!44062 0))(
  ( (array!44063 (arr!21097 (Array (_ BitVec 32) (_ BitVec 64))) (size!21517 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44062)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811682 (= res!554414 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811683 () Bool)

(declare-fun res!554415 () Bool)

(declare-fun e!449344 () Bool)

(assert (=> b!811683 (=> (not res!554415) (not e!449344))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44062 (_ BitVec 32)) Bool)

(assert (=> b!811683 (= res!554415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!554417 () Bool)

(assert (=> start!69734 (=> (not res!554417) (not e!449341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69734 (= res!554417 (validMask!0 mask!3266))))

(assert (=> start!69734 e!449341))

(assert (=> start!69734 true))

(declare-fun array_inv!16956 (array!44062) Bool)

(assert (=> start!69734 (array_inv!16956 a!3170)))

(declare-fun b!811684 () Bool)

(declare-fun e!449343 () Bool)

(declare-fun e!449342 () Bool)

(assert (=> b!811684 (= e!449343 e!449342)))

(declare-fun res!554419 () Bool)

(assert (=> b!811684 (=> (not res!554419) (not e!449342))))

(declare-datatypes ((SeekEntryResult!8644 0))(
  ( (MissingZero!8644 (index!36944 (_ BitVec 32))) (Found!8644 (index!36945 (_ BitVec 32))) (Intermediate!8644 (undefined!9456 Bool) (index!36946 (_ BitVec 32)) (x!67918 (_ BitVec 32))) (Undefined!8644) (MissingVacant!8644 (index!36947 (_ BitVec 32))) )
))
(declare-fun lt!363809 () SeekEntryResult!8644)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363808 () SeekEntryResult!8644)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811684 (= res!554419 (and (= lt!363808 lt!363809) (= lt!363809 (Found!8644 j!153)) (not (= (select (arr!21097 a!3170) index!1236) (select (arr!21097 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44062 (_ BitVec 32)) SeekEntryResult!8644)

(assert (=> b!811684 (= lt!363809 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21097 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44062 (_ BitVec 32)) SeekEntryResult!8644)

(assert (=> b!811684 (= lt!363808 (seekEntryOrOpen!0 (select (arr!21097 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811685 () Bool)

(declare-fun res!554420 () Bool)

(assert (=> b!811685 (=> (not res!554420) (not e!449341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811685 (= res!554420 (validKeyInArray!0 (select (arr!21097 a!3170) j!153)))))

(declare-fun b!811686 () Bool)

(assert (=> b!811686 (= e!449341 e!449344)))

(declare-fun res!554413 () Bool)

(assert (=> b!811686 (=> (not res!554413) (not e!449344))))

(declare-fun lt!363803 () SeekEntryResult!8644)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811686 (= res!554413 (or (= lt!363803 (MissingZero!8644 i!1163)) (= lt!363803 (MissingVacant!8644 i!1163))))))

(assert (=> b!811686 (= lt!363803 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811687 () Bool)

(declare-fun res!554421 () Bool)

(assert (=> b!811687 (=> (not res!554421) (not e!449341))))

(assert (=> b!811687 (= res!554421 (validKeyInArray!0 k0!2044))))

(declare-fun b!811688 () Bool)

(assert (=> b!811688 (= e!449342 (not true))))

(declare-fun lt!363805 () array!44062)

(declare-fun lt!363804 () (_ BitVec 32))

(declare-fun lt!363807 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!811688 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363804 vacantAfter!23 lt!363807 lt!363805 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363804 vacantBefore!23 (select (arr!21097 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27633 0))(
  ( (Unit!27634) )
))
(declare-fun lt!363806 () Unit!27633)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44062 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27633)

(assert (=> b!811688 (= lt!363806 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363804 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811688 (= lt!363804 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!811689 () Bool)

(declare-fun res!554416 () Bool)

(assert (=> b!811689 (=> (not res!554416) (not e!449344))))

(assert (=> b!811689 (= res!554416 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21517 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21097 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21517 a!3170)) (= (select (arr!21097 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811690 () Bool)

(declare-fun res!554418 () Bool)

(assert (=> b!811690 (=> (not res!554418) (not e!449341))))

(assert (=> b!811690 (= res!554418 (and (= (size!21517 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21517 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21517 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811691 () Bool)

(declare-fun res!554412 () Bool)

(assert (=> b!811691 (=> (not res!554412) (not e!449344))))

(declare-datatypes ((List!14967 0))(
  ( (Nil!14964) (Cons!14963 (h!16098 (_ BitVec 64)) (t!21274 List!14967)) )
))
(declare-fun arrayNoDuplicates!0 (array!44062 (_ BitVec 32) List!14967) Bool)

(assert (=> b!811691 (= res!554412 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14964))))

(declare-fun b!811692 () Bool)

(assert (=> b!811692 (= e!449344 e!449343)))

(declare-fun res!554411 () Bool)

(assert (=> b!811692 (=> (not res!554411) (not e!449343))))

(assert (=> b!811692 (= res!554411 (= (seekEntryOrOpen!0 lt!363807 lt!363805 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363807 lt!363805 mask!3266)))))

(assert (=> b!811692 (= lt!363807 (select (store (arr!21097 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811692 (= lt!363805 (array!44063 (store (arr!21097 a!3170) i!1163 k0!2044) (size!21517 a!3170)))))

(assert (= (and start!69734 res!554417) b!811690))

(assert (= (and b!811690 res!554418) b!811685))

(assert (= (and b!811685 res!554420) b!811687))

(assert (= (and b!811687 res!554421) b!811682))

(assert (= (and b!811682 res!554414) b!811686))

(assert (= (and b!811686 res!554413) b!811683))

(assert (= (and b!811683 res!554415) b!811691))

(assert (= (and b!811691 res!554412) b!811689))

(assert (= (and b!811689 res!554416) b!811692))

(assert (= (and b!811692 res!554411) b!811684))

(assert (= (and b!811684 res!554419) b!811688))

(declare-fun m!754333 () Bool)

(assert (=> b!811682 m!754333))

(declare-fun m!754335 () Bool)

(assert (=> b!811689 m!754335))

(declare-fun m!754337 () Bool)

(assert (=> b!811689 m!754337))

(declare-fun m!754339 () Bool)

(assert (=> b!811692 m!754339))

(declare-fun m!754341 () Bool)

(assert (=> b!811692 m!754341))

(declare-fun m!754343 () Bool)

(assert (=> b!811692 m!754343))

(declare-fun m!754345 () Bool)

(assert (=> b!811692 m!754345))

(declare-fun m!754347 () Bool)

(assert (=> b!811684 m!754347))

(declare-fun m!754349 () Bool)

(assert (=> b!811684 m!754349))

(assert (=> b!811684 m!754349))

(declare-fun m!754351 () Bool)

(assert (=> b!811684 m!754351))

(assert (=> b!811684 m!754349))

(declare-fun m!754353 () Bool)

(assert (=> b!811684 m!754353))

(declare-fun m!754355 () Bool)

(assert (=> b!811686 m!754355))

(declare-fun m!754357 () Bool)

(assert (=> b!811683 m!754357))

(assert (=> b!811685 m!754349))

(assert (=> b!811685 m!754349))

(declare-fun m!754359 () Bool)

(assert (=> b!811685 m!754359))

(declare-fun m!754361 () Bool)

(assert (=> b!811691 m!754361))

(declare-fun m!754363 () Bool)

(assert (=> start!69734 m!754363))

(declare-fun m!754365 () Bool)

(assert (=> start!69734 m!754365))

(declare-fun m!754367 () Bool)

(assert (=> b!811687 m!754367))

(assert (=> b!811688 m!754349))

(declare-fun m!754369 () Bool)

(assert (=> b!811688 m!754369))

(declare-fun m!754371 () Bool)

(assert (=> b!811688 m!754371))

(assert (=> b!811688 m!754349))

(declare-fun m!754373 () Bool)

(assert (=> b!811688 m!754373))

(declare-fun m!754375 () Bool)

(assert (=> b!811688 m!754375))

(check-sat (not b!811692) (not b!811691) (not b!811682) (not b!811688) (not b!811685) (not b!811686) (not b!811687) (not start!69734) (not b!811684) (not b!811683))
(check-sat)
