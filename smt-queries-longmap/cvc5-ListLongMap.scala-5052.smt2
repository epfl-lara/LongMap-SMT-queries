; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68822 () Bool)

(assert start!68822)

(declare-fun b!802244 () Bool)

(declare-fun res!546765 () Bool)

(declare-fun e!444622 () Bool)

(assert (=> b!802244 (=> (not res!546765) (not e!444622))))

(declare-datatypes ((array!43612 0))(
  ( (array!43613 (arr!20886 (Array (_ BitVec 32) (_ BitVec 64))) (size!21307 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43612)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802244 (= res!546765 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802245 () Bool)

(declare-fun e!444621 () Bool)

(declare-fun e!444623 () Bool)

(assert (=> b!802245 (= e!444621 e!444623)))

(declare-fun res!546772 () Bool)

(assert (=> b!802245 (=> (not res!546772) (not e!444623))))

(declare-datatypes ((SeekEntryResult!8477 0))(
  ( (MissingZero!8477 (index!36276 (_ BitVec 32))) (Found!8477 (index!36277 (_ BitVec 32))) (Intermediate!8477 (undefined!9289 Bool) (index!36278 (_ BitVec 32)) (x!67131 (_ BitVec 32))) (Undefined!8477) (MissingVacant!8477 (index!36279 (_ BitVec 32))) )
))
(declare-fun lt!358730 () SeekEntryResult!8477)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!358732 () SeekEntryResult!8477)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802245 (= res!546772 (and (= lt!358730 lt!358732) (= lt!358732 (Found!8477 j!153)) (not (= (select (arr!20886 a!3170) index!1236) (select (arr!20886 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43612 (_ BitVec 32)) SeekEntryResult!8477)

(assert (=> b!802245 (= lt!358732 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20886 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43612 (_ BitVec 32)) SeekEntryResult!8477)

(assert (=> b!802245 (= lt!358730 (seekEntryOrOpen!0 (select (arr!20886 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802246 () Bool)

(declare-fun e!444619 () Bool)

(assert (=> b!802246 (= e!444619 e!444621)))

(declare-fun res!546773 () Bool)

(assert (=> b!802246 (=> (not res!546773) (not e!444621))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358735 () (_ BitVec 64))

(declare-fun lt!358734 () array!43612)

(assert (=> b!802246 (= res!546773 (= (seekEntryOrOpen!0 lt!358735 lt!358734 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358735 lt!358734 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802246 (= lt!358735 (select (store (arr!20886 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802246 (= lt!358734 (array!43613 (store (arr!20886 a!3170) i!1163 k!2044) (size!21307 a!3170)))))

(declare-fun b!802247 () Bool)

(declare-fun res!546764 () Bool)

(assert (=> b!802247 (=> (not res!546764) (not e!444622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802247 (= res!546764 (validKeyInArray!0 k!2044))))

(declare-fun b!802248 () Bool)

(declare-fun res!546766 () Bool)

(assert (=> b!802248 (=> (not res!546766) (not e!444619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43612 (_ BitVec 32)) Bool)

(assert (=> b!802248 (= res!546766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!546763 () Bool)

(assert (=> start!68822 (=> (not res!546763) (not e!444622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68822 (= res!546763 (validMask!0 mask!3266))))

(assert (=> start!68822 e!444622))

(assert (=> start!68822 true))

(declare-fun array_inv!16682 (array!43612) Bool)

(assert (=> start!68822 (array_inv!16682 a!3170)))

(declare-fun b!802249 () Bool)

(assert (=> b!802249 (= e!444623 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20886 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358736 () (_ BitVec 32))

(assert (=> b!802249 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358736 vacantAfter!23 lt!358735 lt!358734 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358736 vacantBefore!23 (select (arr!20886 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27494 0))(
  ( (Unit!27495) )
))
(declare-fun lt!358733 () Unit!27494)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43612 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27494)

(assert (=> b!802249 (= lt!358733 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358736 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802249 (= lt!358736 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802250 () Bool)

(assert (=> b!802250 (= e!444622 e!444619)))

(declare-fun res!546767 () Bool)

(assert (=> b!802250 (=> (not res!546767) (not e!444619))))

(declare-fun lt!358731 () SeekEntryResult!8477)

(assert (=> b!802250 (= res!546767 (or (= lt!358731 (MissingZero!8477 i!1163)) (= lt!358731 (MissingVacant!8477 i!1163))))))

(assert (=> b!802250 (= lt!358731 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802251 () Bool)

(declare-fun res!546768 () Bool)

(assert (=> b!802251 (=> (not res!546768) (not e!444622))))

(assert (=> b!802251 (= res!546768 (validKeyInArray!0 (select (arr!20886 a!3170) j!153)))))

(declare-fun b!802252 () Bool)

(declare-fun res!546771 () Bool)

(assert (=> b!802252 (=> (not res!546771) (not e!444622))))

(assert (=> b!802252 (= res!546771 (and (= (size!21307 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21307 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21307 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802253 () Bool)

(declare-fun res!546769 () Bool)

(assert (=> b!802253 (=> (not res!546769) (not e!444619))))

(declare-datatypes ((List!14849 0))(
  ( (Nil!14846) (Cons!14845 (h!15974 (_ BitVec 64)) (t!21164 List!14849)) )
))
(declare-fun arrayNoDuplicates!0 (array!43612 (_ BitVec 32) List!14849) Bool)

(assert (=> b!802253 (= res!546769 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14846))))

(declare-fun b!802254 () Bool)

(declare-fun res!546770 () Bool)

(assert (=> b!802254 (=> (not res!546770) (not e!444619))))

(assert (=> b!802254 (= res!546770 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21307 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20886 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21307 a!3170)) (= (select (arr!20886 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68822 res!546763) b!802252))

(assert (= (and b!802252 res!546771) b!802251))

(assert (= (and b!802251 res!546768) b!802247))

(assert (= (and b!802247 res!546764) b!802244))

(assert (= (and b!802244 res!546765) b!802250))

(assert (= (and b!802250 res!546767) b!802248))

(assert (= (and b!802248 res!546766) b!802253))

(assert (= (and b!802253 res!546769) b!802254))

(assert (= (and b!802254 res!546770) b!802246))

(assert (= (and b!802246 res!546773) b!802245))

(assert (= (and b!802245 res!546772) b!802249))

(declare-fun m!743627 () Bool)

(assert (=> b!802244 m!743627))

(declare-fun m!743629 () Bool)

(assert (=> b!802251 m!743629))

(assert (=> b!802251 m!743629))

(declare-fun m!743631 () Bool)

(assert (=> b!802251 m!743631))

(declare-fun m!743633 () Bool)

(assert (=> b!802254 m!743633))

(declare-fun m!743635 () Bool)

(assert (=> b!802254 m!743635))

(declare-fun m!743637 () Bool)

(assert (=> b!802245 m!743637))

(assert (=> b!802245 m!743629))

(assert (=> b!802245 m!743629))

(declare-fun m!743639 () Bool)

(assert (=> b!802245 m!743639))

(assert (=> b!802245 m!743629))

(declare-fun m!743641 () Bool)

(assert (=> b!802245 m!743641))

(declare-fun m!743643 () Bool)

(assert (=> b!802248 m!743643))

(declare-fun m!743645 () Bool)

(assert (=> start!68822 m!743645))

(declare-fun m!743647 () Bool)

(assert (=> start!68822 m!743647))

(declare-fun m!743649 () Bool)

(assert (=> b!802247 m!743649))

(declare-fun m!743651 () Bool)

(assert (=> b!802249 m!743651))

(assert (=> b!802249 m!743629))

(declare-fun m!743653 () Bool)

(assert (=> b!802249 m!743653))

(declare-fun m!743655 () Bool)

(assert (=> b!802249 m!743655))

(assert (=> b!802249 m!743629))

(declare-fun m!743657 () Bool)

(assert (=> b!802249 m!743657))

(declare-fun m!743659 () Bool)

(assert (=> b!802249 m!743659))

(declare-fun m!743661 () Bool)

(assert (=> b!802249 m!743661))

(declare-fun m!743663 () Bool)

(assert (=> b!802246 m!743663))

(declare-fun m!743665 () Bool)

(assert (=> b!802246 m!743665))

(assert (=> b!802246 m!743661))

(declare-fun m!743667 () Bool)

(assert (=> b!802246 m!743667))

(declare-fun m!743669 () Bool)

(assert (=> b!802253 m!743669))

(declare-fun m!743671 () Bool)

(assert (=> b!802250 m!743671))

(push 1)

