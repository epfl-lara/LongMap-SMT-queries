; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68826 () Bool)

(assert start!68826)

(declare-fun res!546830 () Bool)

(declare-fun e!444651 () Bool)

(assert (=> start!68826 (=> (not res!546830) (not e!444651))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68826 (= res!546830 (validMask!0 mask!3266))))

(assert (=> start!68826 e!444651))

(assert (=> start!68826 true))

(declare-datatypes ((array!43616 0))(
  ( (array!43617 (arr!20888 (Array (_ BitVec 32) (_ BitVec 64))) (size!21309 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43616)

(declare-fun array_inv!16684 (array!43616) Bool)

(assert (=> start!68826 (array_inv!16684 a!3170)))

(declare-fun b!802310 () Bool)

(declare-fun e!444649 () Bool)

(declare-fun e!444650 () Bool)

(assert (=> b!802310 (= e!444649 e!444650)))

(declare-fun res!546833 () Bool)

(assert (=> b!802310 (=> (not res!546833) (not e!444650))))

(declare-fun lt!358775 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358772 () array!43616)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8479 0))(
  ( (MissingZero!8479 (index!36284 (_ BitVec 32))) (Found!8479 (index!36285 (_ BitVec 32))) (Intermediate!8479 (undefined!9291 Bool) (index!36286 (_ BitVec 32)) (x!67133 (_ BitVec 32))) (Undefined!8479) (MissingVacant!8479 (index!36287 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43616 (_ BitVec 32)) SeekEntryResult!8479)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43616 (_ BitVec 32)) SeekEntryResult!8479)

(assert (=> b!802310 (= res!546833 (= (seekEntryOrOpen!0 lt!358775 lt!358772 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358775 lt!358772 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802310 (= lt!358775 (select (store (arr!20888 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802310 (= lt!358772 (array!43617 (store (arr!20888 a!3170) i!1163 k!2044) (size!21309 a!3170)))))

(declare-fun b!802311 () Bool)

(declare-fun res!546838 () Bool)

(assert (=> b!802311 (=> (not res!546838) (not e!444651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802311 (= res!546838 (validKeyInArray!0 k!2044))))

(declare-fun b!802312 () Bool)

(declare-fun res!546832 () Bool)

(assert (=> b!802312 (=> (not res!546832) (not e!444649))))

(declare-datatypes ((List!14851 0))(
  ( (Nil!14848) (Cons!14847 (h!15976 (_ BitVec 64)) (t!21166 List!14851)) )
))
(declare-fun arrayNoDuplicates!0 (array!43616 (_ BitVec 32) List!14851) Bool)

(assert (=> b!802312 (= res!546832 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14848))))

(declare-fun b!802313 () Bool)

(declare-fun res!546834 () Bool)

(assert (=> b!802313 (=> (not res!546834) (not e!444649))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802313 (= res!546834 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21309 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20888 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21309 a!3170)) (= (select (arr!20888 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802314 () Bool)

(declare-fun e!444653 () Bool)

(assert (=> b!802314 (= e!444650 e!444653)))

(declare-fun res!546829 () Bool)

(assert (=> b!802314 (=> (not res!546829) (not e!444653))))

(declare-fun lt!358777 () SeekEntryResult!8479)

(declare-fun lt!358778 () SeekEntryResult!8479)

(assert (=> b!802314 (= res!546829 (and (= lt!358777 lt!358778) (= lt!358778 (Found!8479 j!153)) (not (= (select (arr!20888 a!3170) index!1236) (select (arr!20888 a!3170) j!153)))))))

(assert (=> b!802314 (= lt!358778 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20888 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802314 (= lt!358777 (seekEntryOrOpen!0 (select (arr!20888 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802315 () Bool)

(declare-fun res!546836 () Bool)

(assert (=> b!802315 (=> (not res!546836) (not e!444651))))

(assert (=> b!802315 (= res!546836 (and (= (size!21309 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21309 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21309 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802316 () Bool)

(assert (=> b!802316 (= e!444651 e!444649)))

(declare-fun res!546837 () Bool)

(assert (=> b!802316 (=> (not res!546837) (not e!444649))))

(declare-fun lt!358773 () SeekEntryResult!8479)

(assert (=> b!802316 (= res!546837 (or (= lt!358773 (MissingZero!8479 i!1163)) (= lt!358773 (MissingVacant!8479 i!1163))))))

(assert (=> b!802316 (= lt!358773 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802317 () Bool)

(declare-fun res!546839 () Bool)

(assert (=> b!802317 (=> (not res!546839) (not e!444651))))

(assert (=> b!802317 (= res!546839 (validKeyInArray!0 (select (arr!20888 a!3170) j!153)))))

(declare-fun b!802318 () Bool)

(declare-fun res!546831 () Bool)

(assert (=> b!802318 (=> (not res!546831) (not e!444649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43616 (_ BitVec 32)) Bool)

(assert (=> b!802318 (= res!546831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802319 () Bool)

(declare-fun res!546835 () Bool)

(assert (=> b!802319 (=> (not res!546835) (not e!444651))))

(declare-fun arrayContainsKey!0 (array!43616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802319 (= res!546835 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802320 () Bool)

(assert (=> b!802320 (= e!444653 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20888 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358776 () (_ BitVec 32))

(assert (=> b!802320 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358776 vacantAfter!23 lt!358775 lt!358772 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358776 vacantBefore!23 (select (arr!20888 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27498 0))(
  ( (Unit!27499) )
))
(declare-fun lt!358774 () Unit!27498)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43616 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27498)

(assert (=> b!802320 (= lt!358774 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358776 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802320 (= lt!358776 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68826 res!546830) b!802315))

(assert (= (and b!802315 res!546836) b!802317))

(assert (= (and b!802317 res!546839) b!802311))

(assert (= (and b!802311 res!546838) b!802319))

(assert (= (and b!802319 res!546835) b!802316))

(assert (= (and b!802316 res!546837) b!802318))

(assert (= (and b!802318 res!546831) b!802312))

(assert (= (and b!802312 res!546832) b!802313))

(assert (= (and b!802313 res!546834) b!802310))

(assert (= (and b!802310 res!546833) b!802314))

(assert (= (and b!802314 res!546829) b!802320))

(declare-fun m!743719 () Bool)

(assert (=> b!802312 m!743719))

(declare-fun m!743721 () Bool)

(assert (=> b!802313 m!743721))

(declare-fun m!743723 () Bool)

(assert (=> b!802313 m!743723))

(declare-fun m!743725 () Bool)

(assert (=> start!68826 m!743725))

(declare-fun m!743727 () Bool)

(assert (=> start!68826 m!743727))

(declare-fun m!743729 () Bool)

(assert (=> b!802316 m!743729))

(declare-fun m!743731 () Bool)

(assert (=> b!802317 m!743731))

(assert (=> b!802317 m!743731))

(declare-fun m!743733 () Bool)

(assert (=> b!802317 m!743733))

(assert (=> b!802320 m!743731))

(declare-fun m!743735 () Bool)

(assert (=> b!802320 m!743735))

(declare-fun m!743737 () Bool)

(assert (=> b!802320 m!743737))

(assert (=> b!802320 m!743731))

(declare-fun m!743739 () Bool)

(assert (=> b!802320 m!743739))

(declare-fun m!743741 () Bool)

(assert (=> b!802320 m!743741))

(declare-fun m!743743 () Bool)

(assert (=> b!802320 m!743743))

(declare-fun m!743745 () Bool)

(assert (=> b!802320 m!743745))

(declare-fun m!743747 () Bool)

(assert (=> b!802314 m!743747))

(assert (=> b!802314 m!743731))

(assert (=> b!802314 m!743731))

(declare-fun m!743749 () Bool)

(assert (=> b!802314 m!743749))

(assert (=> b!802314 m!743731))

(declare-fun m!743751 () Bool)

(assert (=> b!802314 m!743751))

(declare-fun m!743753 () Bool)

(assert (=> b!802310 m!743753))

(declare-fun m!743755 () Bool)

(assert (=> b!802310 m!743755))

(assert (=> b!802310 m!743745))

(declare-fun m!743757 () Bool)

(assert (=> b!802310 m!743757))

(declare-fun m!743759 () Bool)

(assert (=> b!802318 m!743759))

(declare-fun m!743761 () Bool)

(assert (=> b!802311 m!743761))

(declare-fun m!743763 () Bool)

(assert (=> b!802319 m!743763))

(push 1)

(assert (not b!802319))

(assert (not b!802320))

(assert (not b!802314))

(assert (not b!802312))

(assert (not b!802310))

(assert (not b!802318))

(assert (not b!802311))

(assert (not b!802316))

(assert (not start!68826))

(assert (not b!802317))

(check-sat)

