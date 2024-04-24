; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69722 () Bool)

(assert start!69722)

(declare-fun b!811484 () Bool)

(declare-fun res!554213 () Bool)

(declare-fun e!449252 () Bool)

(assert (=> b!811484 (=> (not res!554213) (not e!449252))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44050 0))(
  ( (array!44051 (arr!21091 (Array (_ BitVec 32) (_ BitVec 64))) (size!21511 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44050)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!811484 (= res!554213 (and (= (size!21511 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21511 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21511 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811485 () Bool)

(declare-fun e!449253 () Bool)

(assert (=> b!811485 (= e!449253 (not true))))

(declare-fun lt!363682 () array!44050)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363680 () (_ BitVec 64))

(declare-fun lt!363678 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8638 0))(
  ( (MissingZero!8638 (index!36920 (_ BitVec 32))) (Found!8638 (index!36921 (_ BitVec 32))) (Intermediate!8638 (undefined!9450 Bool) (index!36922 (_ BitVec 32)) (x!67896 (_ BitVec 32))) (Undefined!8638) (MissingVacant!8638 (index!36923 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44050 (_ BitVec 32)) SeekEntryResult!8638)

(assert (=> b!811485 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363678 vacantAfter!23 lt!363680 lt!363682 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363678 vacantBefore!23 (select (arr!21091 a!3170) j!153) a!3170 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27621 0))(
  ( (Unit!27622) )
))
(declare-fun lt!363683 () Unit!27621)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44050 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27621)

(assert (=> b!811485 (= lt!363683 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363678 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811485 (= lt!363678 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!811486 () Bool)

(declare-fun res!554223 () Bool)

(declare-fun e!449251 () Bool)

(assert (=> b!811486 (=> (not res!554223) (not e!449251))))

(assert (=> b!811486 (= res!554223 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21511 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21091 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21511 a!3170)) (= (select (arr!21091 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811487 () Bool)

(declare-fun res!554215 () Bool)

(assert (=> b!811487 (=> (not res!554215) (not e!449252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811487 (= res!554215 (validKeyInArray!0 (select (arr!21091 a!3170) j!153)))))

(declare-fun b!811488 () Bool)

(declare-fun res!554218 () Bool)

(assert (=> b!811488 (=> (not res!554218) (not e!449252))))

(declare-fun arrayContainsKey!0 (array!44050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811488 (= res!554218 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811489 () Bool)

(declare-fun e!449250 () Bool)

(assert (=> b!811489 (= e!449251 e!449250)))

(declare-fun res!554219 () Bool)

(assert (=> b!811489 (=> (not res!554219) (not e!449250))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44050 (_ BitVec 32)) SeekEntryResult!8638)

(assert (=> b!811489 (= res!554219 (= (seekEntryOrOpen!0 lt!363680 lt!363682 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363680 lt!363682 mask!3266)))))

(assert (=> b!811489 (= lt!363680 (select (store (arr!21091 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811489 (= lt!363682 (array!44051 (store (arr!21091 a!3170) i!1163 k0!2044) (size!21511 a!3170)))))

(declare-fun b!811491 () Bool)

(declare-fun res!554220 () Bool)

(assert (=> b!811491 (=> (not res!554220) (not e!449251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44050 (_ BitVec 32)) Bool)

(assert (=> b!811491 (= res!554220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811492 () Bool)

(declare-fun res!554217 () Bool)

(assert (=> b!811492 (=> (not res!554217) (not e!449252))))

(assert (=> b!811492 (= res!554217 (validKeyInArray!0 k0!2044))))

(declare-fun b!811493 () Bool)

(declare-fun res!554216 () Bool)

(assert (=> b!811493 (=> (not res!554216) (not e!449251))))

(declare-datatypes ((List!14961 0))(
  ( (Nil!14958) (Cons!14957 (h!16092 (_ BitVec 64)) (t!21268 List!14961)) )
))
(declare-fun arrayNoDuplicates!0 (array!44050 (_ BitVec 32) List!14961) Bool)

(assert (=> b!811493 (= res!554216 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14958))))

(declare-fun b!811494 () Bool)

(assert (=> b!811494 (= e!449252 e!449251)))

(declare-fun res!554222 () Bool)

(assert (=> b!811494 (=> (not res!554222) (not e!449251))))

(declare-fun lt!363681 () SeekEntryResult!8638)

(assert (=> b!811494 (= res!554222 (or (= lt!363681 (MissingZero!8638 i!1163)) (= lt!363681 (MissingVacant!8638 i!1163))))))

(assert (=> b!811494 (= lt!363681 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811490 () Bool)

(assert (=> b!811490 (= e!449250 e!449253)))

(declare-fun res!554214 () Bool)

(assert (=> b!811490 (=> (not res!554214) (not e!449253))))

(declare-fun lt!363677 () SeekEntryResult!8638)

(declare-fun lt!363679 () SeekEntryResult!8638)

(assert (=> b!811490 (= res!554214 (and (= lt!363679 lt!363677) (= lt!363677 (Found!8638 j!153)) (not (= (select (arr!21091 a!3170) index!1236) (select (arr!21091 a!3170) j!153)))))))

(assert (=> b!811490 (= lt!363677 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21091 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811490 (= lt!363679 (seekEntryOrOpen!0 (select (arr!21091 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!554221 () Bool)

(assert (=> start!69722 (=> (not res!554221) (not e!449252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69722 (= res!554221 (validMask!0 mask!3266))))

(assert (=> start!69722 e!449252))

(assert (=> start!69722 true))

(declare-fun array_inv!16950 (array!44050) Bool)

(assert (=> start!69722 (array_inv!16950 a!3170)))

(assert (= (and start!69722 res!554221) b!811484))

(assert (= (and b!811484 res!554213) b!811487))

(assert (= (and b!811487 res!554215) b!811492))

(assert (= (and b!811492 res!554217) b!811488))

(assert (= (and b!811488 res!554218) b!811494))

(assert (= (and b!811494 res!554222) b!811491))

(assert (= (and b!811491 res!554220) b!811493))

(assert (= (and b!811493 res!554216) b!811486))

(assert (= (and b!811486 res!554223) b!811489))

(assert (= (and b!811489 res!554219) b!811490))

(assert (= (and b!811490 res!554214) b!811485))

(declare-fun m!754069 () Bool)

(assert (=> b!811488 m!754069))

(declare-fun m!754071 () Bool)

(assert (=> b!811494 m!754071))

(declare-fun m!754073 () Bool)

(assert (=> b!811491 m!754073))

(declare-fun m!754075 () Bool)

(assert (=> b!811485 m!754075))

(declare-fun m!754077 () Bool)

(assert (=> b!811485 m!754077))

(assert (=> b!811485 m!754075))

(declare-fun m!754079 () Bool)

(assert (=> b!811485 m!754079))

(declare-fun m!754081 () Bool)

(assert (=> b!811485 m!754081))

(declare-fun m!754083 () Bool)

(assert (=> b!811485 m!754083))

(declare-fun m!754085 () Bool)

(assert (=> b!811489 m!754085))

(declare-fun m!754087 () Bool)

(assert (=> b!811489 m!754087))

(declare-fun m!754089 () Bool)

(assert (=> b!811489 m!754089))

(declare-fun m!754091 () Bool)

(assert (=> b!811489 m!754091))

(assert (=> b!811487 m!754075))

(assert (=> b!811487 m!754075))

(declare-fun m!754093 () Bool)

(assert (=> b!811487 m!754093))

(declare-fun m!754095 () Bool)

(assert (=> start!69722 m!754095))

(declare-fun m!754097 () Bool)

(assert (=> start!69722 m!754097))

(declare-fun m!754099 () Bool)

(assert (=> b!811492 m!754099))

(declare-fun m!754101 () Bool)

(assert (=> b!811486 m!754101))

(declare-fun m!754103 () Bool)

(assert (=> b!811486 m!754103))

(declare-fun m!754105 () Bool)

(assert (=> b!811490 m!754105))

(assert (=> b!811490 m!754075))

(assert (=> b!811490 m!754075))

(declare-fun m!754107 () Bool)

(assert (=> b!811490 m!754107))

(assert (=> b!811490 m!754075))

(declare-fun m!754109 () Bool)

(assert (=> b!811490 m!754109))

(declare-fun m!754111 () Bool)

(assert (=> b!811493 m!754111))

(check-sat (not b!811488) (not b!811489) (not b!811492) (not b!811493) (not start!69722) (not b!811487) (not b!811485) (not b!811490) (not b!811491) (not b!811494))
(check-sat)
