; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69644 () Bool)

(assert start!69644)

(declare-fun res!554454 () Bool)

(declare-fun e!449105 () Bool)

(assert (=> start!69644 (=> (not res!554454) (not e!449105))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69644 (= res!554454 (validMask!0 mask!3266))))

(assert (=> start!69644 e!449105))

(assert (=> start!69644 true))

(declare-datatypes ((array!44083 0))(
  ( (array!44084 (arr!21111 (Array (_ BitVec 32) (_ BitVec 64))) (size!21532 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44083)

(declare-fun array_inv!16907 (array!44083) Bool)

(assert (=> start!69644 (array_inv!16907 a!3170)))

(declare-fun b!811406 () Bool)

(declare-fun res!554457 () Bool)

(assert (=> b!811406 (=> (not res!554457) (not e!449105))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811406 (= res!554457 (validKeyInArray!0 k!2044))))

(declare-fun b!811407 () Bool)

(declare-fun e!449104 () Bool)

(assert (=> b!811407 (= e!449104 (not true))))

(declare-fun lt!363790 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363792 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363789 () array!44083)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8702 0))(
  ( (MissingZero!8702 (index!37179 (_ BitVec 32))) (Found!8702 (index!37180 (_ BitVec 32))) (Intermediate!8702 (undefined!9514 Bool) (index!37181 (_ BitVec 32)) (x!67995 (_ BitVec 32))) (Undefined!8702) (MissingVacant!8702 (index!37182 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44083 (_ BitVec 32)) SeekEntryResult!8702)

(assert (=> b!811407 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363792 vacantAfter!23 lt!363790 lt!363789 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363792 vacantBefore!23 (select (arr!21111 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27666 0))(
  ( (Unit!27667) )
))
(declare-fun lt!363793 () Unit!27666)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27666)

(assert (=> b!811407 (= lt!363793 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363792 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811407 (= lt!363792 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811408 () Bool)

(declare-fun res!554453 () Bool)

(assert (=> b!811408 (=> (not res!554453) (not e!449105))))

(assert (=> b!811408 (= res!554453 (and (= (size!21532 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21532 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21532 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811409 () Bool)

(declare-fun res!554449 () Bool)

(assert (=> b!811409 (=> (not res!554449) (not e!449105))))

(declare-fun arrayContainsKey!0 (array!44083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811409 (= res!554449 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811410 () Bool)

(declare-fun res!554455 () Bool)

(declare-fun e!449102 () Bool)

(assert (=> b!811410 (=> (not res!554455) (not e!449102))))

(declare-datatypes ((List!15074 0))(
  ( (Nil!15071) (Cons!15070 (h!16199 (_ BitVec 64)) (t!21389 List!15074)) )
))
(declare-fun arrayNoDuplicates!0 (array!44083 (_ BitVec 32) List!15074) Bool)

(assert (=> b!811410 (= res!554455 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15071))))

(declare-fun b!811411 () Bool)

(declare-fun e!449101 () Bool)

(assert (=> b!811411 (= e!449101 e!449104)))

(declare-fun res!554456 () Bool)

(assert (=> b!811411 (=> (not res!554456) (not e!449104))))

(declare-fun lt!363788 () SeekEntryResult!8702)

(declare-fun lt!363794 () SeekEntryResult!8702)

(assert (=> b!811411 (= res!554456 (and (= lt!363794 lt!363788) (= lt!363788 (Found!8702 j!153)) (not (= (select (arr!21111 a!3170) index!1236) (select (arr!21111 a!3170) j!153)))))))

(assert (=> b!811411 (= lt!363788 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21111 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44083 (_ BitVec 32)) SeekEntryResult!8702)

(assert (=> b!811411 (= lt!363794 (seekEntryOrOpen!0 (select (arr!21111 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811412 () Bool)

(declare-fun res!554451 () Bool)

(assert (=> b!811412 (=> (not res!554451) (not e!449102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44083 (_ BitVec 32)) Bool)

(assert (=> b!811412 (= res!554451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811413 () Bool)

(assert (=> b!811413 (= e!449102 e!449101)))

(declare-fun res!554450 () Bool)

(assert (=> b!811413 (=> (not res!554450) (not e!449101))))

(assert (=> b!811413 (= res!554450 (= (seekEntryOrOpen!0 lt!363790 lt!363789 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363790 lt!363789 mask!3266)))))

(assert (=> b!811413 (= lt!363790 (select (store (arr!21111 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811413 (= lt!363789 (array!44084 (store (arr!21111 a!3170) i!1163 k!2044) (size!21532 a!3170)))))

(declare-fun b!811414 () Bool)

(assert (=> b!811414 (= e!449105 e!449102)))

(declare-fun res!554458 () Bool)

(assert (=> b!811414 (=> (not res!554458) (not e!449102))))

(declare-fun lt!363791 () SeekEntryResult!8702)

(assert (=> b!811414 (= res!554458 (or (= lt!363791 (MissingZero!8702 i!1163)) (= lt!363791 (MissingVacant!8702 i!1163))))))

(assert (=> b!811414 (= lt!363791 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!811415 () Bool)

(declare-fun res!554459 () Bool)

(assert (=> b!811415 (=> (not res!554459) (not e!449105))))

(assert (=> b!811415 (= res!554459 (validKeyInArray!0 (select (arr!21111 a!3170) j!153)))))

(declare-fun b!811416 () Bool)

(declare-fun res!554452 () Bool)

(assert (=> b!811416 (=> (not res!554452) (not e!449102))))

(assert (=> b!811416 (= res!554452 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21532 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21111 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21532 a!3170)) (= (select (arr!21111 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69644 res!554454) b!811408))

(assert (= (and b!811408 res!554453) b!811415))

(assert (= (and b!811415 res!554459) b!811406))

(assert (= (and b!811406 res!554457) b!811409))

(assert (= (and b!811409 res!554449) b!811414))

(assert (= (and b!811414 res!554458) b!811412))

(assert (= (and b!811412 res!554451) b!811410))

(assert (= (and b!811410 res!554455) b!811416))

(assert (= (and b!811416 res!554452) b!811413))

(assert (= (and b!811413 res!554450) b!811411))

(assert (= (and b!811411 res!554456) b!811407))

(declare-fun m!753743 () Bool)

(assert (=> b!811406 m!753743))

(declare-fun m!753745 () Bool)

(assert (=> b!811407 m!753745))

(declare-fun m!753747 () Bool)

(assert (=> b!811407 m!753747))

(declare-fun m!753749 () Bool)

(assert (=> b!811407 m!753749))

(declare-fun m!753751 () Bool)

(assert (=> b!811407 m!753751))

(assert (=> b!811407 m!753745))

(declare-fun m!753753 () Bool)

(assert (=> b!811407 m!753753))

(assert (=> b!811415 m!753745))

(assert (=> b!811415 m!753745))

(declare-fun m!753755 () Bool)

(assert (=> b!811415 m!753755))

(declare-fun m!753757 () Bool)

(assert (=> b!811414 m!753757))

(declare-fun m!753759 () Bool)

(assert (=> b!811413 m!753759))

(declare-fun m!753761 () Bool)

(assert (=> b!811413 m!753761))

(declare-fun m!753763 () Bool)

(assert (=> b!811413 m!753763))

(declare-fun m!753765 () Bool)

(assert (=> b!811413 m!753765))

(declare-fun m!753767 () Bool)

(assert (=> b!811412 m!753767))

(declare-fun m!753769 () Bool)

(assert (=> b!811416 m!753769))

(declare-fun m!753771 () Bool)

(assert (=> b!811416 m!753771))

(declare-fun m!753773 () Bool)

(assert (=> b!811411 m!753773))

(assert (=> b!811411 m!753745))

(assert (=> b!811411 m!753745))

(declare-fun m!753775 () Bool)

(assert (=> b!811411 m!753775))

(assert (=> b!811411 m!753745))

(declare-fun m!753777 () Bool)

(assert (=> b!811411 m!753777))

(declare-fun m!753779 () Bool)

(assert (=> start!69644 m!753779))

(declare-fun m!753781 () Bool)

(assert (=> start!69644 m!753781))

(declare-fun m!753783 () Bool)

(assert (=> b!811409 m!753783))

(declare-fun m!753785 () Bool)

(assert (=> b!811410 m!753785))

(push 1)

