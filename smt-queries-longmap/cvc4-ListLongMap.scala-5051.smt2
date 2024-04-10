; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68820 () Bool)

(assert start!68820)

(declare-fun e!444607 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun b!802211 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802211 (= e!444607 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-datatypes ((array!43610 0))(
  ( (array!43611 (arr!20885 (Array (_ BitVec 32) (_ BitVec 64))) (size!21306 (_ BitVec 32))) )
))
(declare-fun lt!358710 () array!43610)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun a!3170 () array!43610)

(declare-fun lt!358712 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358709 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8476 0))(
  ( (MissingZero!8476 (index!36272 (_ BitVec 32))) (Found!8476 (index!36273 (_ BitVec 32))) (Intermediate!8476 (undefined!9288 Bool) (index!36274 (_ BitVec 32)) (x!67122 (_ BitVec 32))) (Undefined!8476) (MissingVacant!8476 (index!36275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43610 (_ BitVec 32)) SeekEntryResult!8476)

(assert (=> b!802211 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358709 vacantAfter!23 lt!358712 lt!358710 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358709 vacantBefore!23 (select (arr!20885 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27492 0))(
  ( (Unit!27493) )
))
(declare-fun lt!358715 () Unit!27492)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43610 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27492)

(assert (=> b!802211 (= lt!358715 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358709 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802211 (= lt!358709 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802212 () Bool)

(declare-fun res!546734 () Bool)

(declare-fun e!444606 () Bool)

(assert (=> b!802212 (=> (not res!546734) (not e!444606))))

(declare-datatypes ((List!14848 0))(
  ( (Nil!14845) (Cons!14844 (h!15973 (_ BitVec 64)) (t!21163 List!14848)) )
))
(declare-fun arrayNoDuplicates!0 (array!43610 (_ BitVec 32) List!14848) Bool)

(assert (=> b!802212 (= res!546734 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14845))))

(declare-fun res!546740 () Bool)

(declare-fun e!444604 () Bool)

(assert (=> start!68820 (=> (not res!546740) (not e!444604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68820 (= res!546740 (validMask!0 mask!3266))))

(assert (=> start!68820 e!444604))

(assert (=> start!68820 true))

(declare-fun array_inv!16681 (array!43610) Bool)

(assert (=> start!68820 (array_inv!16681 a!3170)))

(declare-fun b!802213 () Bool)

(declare-fun res!546738 () Bool)

(assert (=> b!802213 (=> (not res!546738) (not e!444604))))

(assert (=> b!802213 (= res!546738 (and (= (size!21306 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21306 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21306 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802214 () Bool)

(declare-fun res!546736 () Bool)

(assert (=> b!802214 (=> (not res!546736) (not e!444604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802214 (= res!546736 (validKeyInArray!0 k!2044))))

(declare-fun b!802215 () Bool)

(declare-fun res!546731 () Bool)

(assert (=> b!802215 (=> (not res!546731) (not e!444604))))

(declare-fun arrayContainsKey!0 (array!43610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802215 (= res!546731 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802216 () Bool)

(declare-fun e!444608 () Bool)

(assert (=> b!802216 (= e!444606 e!444608)))

(declare-fun res!546739 () Bool)

(assert (=> b!802216 (=> (not res!546739) (not e!444608))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43610 (_ BitVec 32)) SeekEntryResult!8476)

(assert (=> b!802216 (= res!546739 (= (seekEntryOrOpen!0 lt!358712 lt!358710 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358712 lt!358710 mask!3266)))))

(assert (=> b!802216 (= lt!358712 (select (store (arr!20885 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802216 (= lt!358710 (array!43611 (store (arr!20885 a!3170) i!1163 k!2044) (size!21306 a!3170)))))

(declare-fun b!802217 () Bool)

(declare-fun res!546732 () Bool)

(assert (=> b!802217 (=> (not res!546732) (not e!444606))))

(assert (=> b!802217 (= res!546732 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21306 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20885 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21306 a!3170)) (= (select (arr!20885 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802218 () Bool)

(assert (=> b!802218 (= e!444604 e!444606)))

(declare-fun res!546730 () Bool)

(assert (=> b!802218 (=> (not res!546730) (not e!444606))))

(declare-fun lt!358711 () SeekEntryResult!8476)

(assert (=> b!802218 (= res!546730 (or (= lt!358711 (MissingZero!8476 i!1163)) (= lt!358711 (MissingVacant!8476 i!1163))))))

(assert (=> b!802218 (= lt!358711 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802219 () Bool)

(assert (=> b!802219 (= e!444608 e!444607)))

(declare-fun res!546733 () Bool)

(assert (=> b!802219 (=> (not res!546733) (not e!444607))))

(declare-fun lt!358713 () SeekEntryResult!8476)

(declare-fun lt!358714 () SeekEntryResult!8476)

(assert (=> b!802219 (= res!546733 (and (= lt!358714 lt!358713) (= lt!358713 (Found!8476 j!153)) (not (= (select (arr!20885 a!3170) index!1236) (select (arr!20885 a!3170) j!153)))))))

(assert (=> b!802219 (= lt!358713 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20885 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802219 (= lt!358714 (seekEntryOrOpen!0 (select (arr!20885 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802220 () Bool)

(declare-fun res!546737 () Bool)

(assert (=> b!802220 (=> (not res!546737) (not e!444606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43610 (_ BitVec 32)) Bool)

(assert (=> b!802220 (= res!546737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802221 () Bool)

(declare-fun res!546735 () Bool)

(assert (=> b!802221 (=> (not res!546735) (not e!444604))))

(assert (=> b!802221 (= res!546735 (validKeyInArray!0 (select (arr!20885 a!3170) j!153)))))

(assert (= (and start!68820 res!546740) b!802213))

(assert (= (and b!802213 res!546738) b!802221))

(assert (= (and b!802221 res!546735) b!802214))

(assert (= (and b!802214 res!546736) b!802215))

(assert (= (and b!802215 res!546731) b!802218))

(assert (= (and b!802218 res!546730) b!802220))

(assert (= (and b!802220 res!546737) b!802212))

(assert (= (and b!802212 res!546734) b!802217))

(assert (= (and b!802217 res!546732) b!802216))

(assert (= (and b!802216 res!546739) b!802219))

(assert (= (and b!802219 res!546733) b!802211))

(declare-fun m!743583 () Bool)

(assert (=> b!802221 m!743583))

(assert (=> b!802221 m!743583))

(declare-fun m!743585 () Bool)

(assert (=> b!802221 m!743585))

(assert (=> b!802211 m!743583))

(declare-fun m!743587 () Bool)

(assert (=> b!802211 m!743587))

(declare-fun m!743589 () Bool)

(assert (=> b!802211 m!743589))

(assert (=> b!802211 m!743583))

(declare-fun m!743591 () Bool)

(assert (=> b!802211 m!743591))

(declare-fun m!743593 () Bool)

(assert (=> b!802211 m!743593))

(declare-fun m!743595 () Bool)

(assert (=> b!802217 m!743595))

(declare-fun m!743597 () Bool)

(assert (=> b!802217 m!743597))

(declare-fun m!743599 () Bool)

(assert (=> b!802212 m!743599))

(declare-fun m!743601 () Bool)

(assert (=> b!802215 m!743601))

(declare-fun m!743603 () Bool)

(assert (=> b!802220 m!743603))

(declare-fun m!743605 () Bool)

(assert (=> start!68820 m!743605))

(declare-fun m!743607 () Bool)

(assert (=> start!68820 m!743607))

(declare-fun m!743609 () Bool)

(assert (=> b!802218 m!743609))

(declare-fun m!743611 () Bool)

(assert (=> b!802214 m!743611))

(declare-fun m!743613 () Bool)

(assert (=> b!802216 m!743613))

(declare-fun m!743615 () Bool)

(assert (=> b!802216 m!743615))

(declare-fun m!743617 () Bool)

(assert (=> b!802216 m!743617))

(declare-fun m!743619 () Bool)

(assert (=> b!802216 m!743619))

(declare-fun m!743621 () Bool)

(assert (=> b!802219 m!743621))

(assert (=> b!802219 m!743583))

(assert (=> b!802219 m!743583))

(declare-fun m!743623 () Bool)

(assert (=> b!802219 m!743623))

(assert (=> b!802219 m!743583))

(declare-fun m!743625 () Bool)

(assert (=> b!802219 m!743625))

(push 1)

(assert (not b!802214))

(assert (not b!802218))

(assert (not b!802221))

(assert (not b!802220))

(assert (not b!802211))

(assert (not b!802215))

(assert (not start!68820))

(assert (not b!802216))

(assert (not b!802219))

(assert (not b!802212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

