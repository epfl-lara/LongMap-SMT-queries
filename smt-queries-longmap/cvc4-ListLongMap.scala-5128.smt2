; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69654 () Bool)

(assert start!69654)

(declare-fun b!811571 () Bool)

(declare-fun res!554616 () Bool)

(declare-fun e!449179 () Bool)

(assert (=> b!811571 (=> (not res!554616) (not e!449179))))

(declare-datatypes ((array!44093 0))(
  ( (array!44094 (arr!21116 (Array (_ BitVec 32) (_ BitVec 64))) (size!21537 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44093)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44093 (_ BitVec 32)) Bool)

(assert (=> b!811571 (= res!554616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811572 () Bool)

(declare-fun e!449180 () Bool)

(assert (=> b!811572 (= e!449179 e!449180)))

(declare-fun res!554622 () Bool)

(assert (=> b!811572 (=> (not res!554622) (not e!449180))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363894 () array!44093)

(declare-fun lt!363895 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8707 0))(
  ( (MissingZero!8707 (index!37199 (_ BitVec 32))) (Found!8707 (index!37200 (_ BitVec 32))) (Intermediate!8707 (undefined!9519 Bool) (index!37201 (_ BitVec 32)) (x!68008 (_ BitVec 32))) (Undefined!8707) (MissingVacant!8707 (index!37202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44093 (_ BitVec 32)) SeekEntryResult!8707)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44093 (_ BitVec 32)) SeekEntryResult!8707)

(assert (=> b!811572 (= res!554622 (= (seekEntryOrOpen!0 lt!363895 lt!363894 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363895 lt!363894 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811572 (= lt!363895 (select (store (arr!21116 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811572 (= lt!363894 (array!44094 (store (arr!21116 a!3170) i!1163 k!2044) (size!21537 a!3170)))))

(declare-fun b!811573 () Bool)

(declare-fun res!554619 () Bool)

(assert (=> b!811573 (=> (not res!554619) (not e!449179))))

(declare-datatypes ((List!15079 0))(
  ( (Nil!15076) (Cons!15075 (h!16204 (_ BitVec 64)) (t!21394 List!15079)) )
))
(declare-fun arrayNoDuplicates!0 (array!44093 (_ BitVec 32) List!15079) Bool)

(assert (=> b!811573 (= res!554619 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15076))))

(declare-fun b!811574 () Bool)

(declare-fun res!554615 () Bool)

(declare-fun e!449176 () Bool)

(assert (=> b!811574 (=> (not res!554615) (not e!449176))))

(assert (=> b!811574 (= res!554615 (and (= (size!21537 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21537 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21537 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811576 () Bool)

(declare-fun res!554614 () Bool)

(assert (=> b!811576 (=> (not res!554614) (not e!449176))))

(declare-fun arrayContainsKey!0 (array!44093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811576 (= res!554614 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811577 () Bool)

(declare-fun e!449178 () Bool)

(assert (=> b!811577 (= e!449180 e!449178)))

(declare-fun res!554620 () Bool)

(assert (=> b!811577 (=> (not res!554620) (not e!449178))))

(declare-fun lt!363898 () SeekEntryResult!8707)

(declare-fun lt!363897 () SeekEntryResult!8707)

(assert (=> b!811577 (= res!554620 (and (= lt!363898 lt!363897) (= lt!363897 (Found!8707 j!153)) (not (= (select (arr!21116 a!3170) index!1236) (select (arr!21116 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!811577 (= lt!363897 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21116 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811577 (= lt!363898 (seekEntryOrOpen!0 (select (arr!21116 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811578 () Bool)

(declare-fun res!554623 () Bool)

(assert (=> b!811578 (=> (not res!554623) (not e!449179))))

(assert (=> b!811578 (= res!554623 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21537 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21116 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21537 a!3170)) (= (select (arr!21116 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811579 () Bool)

(declare-fun res!554621 () Bool)

(assert (=> b!811579 (=> (not res!554621) (not e!449176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811579 (= res!554621 (validKeyInArray!0 k!2044))))

(declare-fun b!811580 () Bool)

(declare-fun res!554624 () Bool)

(assert (=> b!811580 (=> (not res!554624) (not e!449176))))

(assert (=> b!811580 (= res!554624 (validKeyInArray!0 (select (arr!21116 a!3170) j!153)))))

(declare-fun b!811581 () Bool)

(assert (=> b!811581 (= e!449178 (not true))))

(declare-fun lt!363896 () (_ BitVec 32))

(assert (=> b!811581 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363896 vacantAfter!23 lt!363895 lt!363894 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363896 vacantBefore!23 (select (arr!21116 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27676 0))(
  ( (Unit!27677) )
))
(declare-fun lt!363899 () Unit!27676)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44093 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27676)

(assert (=> b!811581 (= lt!363899 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363896 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811581 (= lt!363896 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!554617 () Bool)

(assert (=> start!69654 (=> (not res!554617) (not e!449176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69654 (= res!554617 (validMask!0 mask!3266))))

(assert (=> start!69654 e!449176))

(assert (=> start!69654 true))

(declare-fun array_inv!16912 (array!44093) Bool)

(assert (=> start!69654 (array_inv!16912 a!3170)))

(declare-fun b!811575 () Bool)

(assert (=> b!811575 (= e!449176 e!449179)))

(declare-fun res!554618 () Bool)

(assert (=> b!811575 (=> (not res!554618) (not e!449179))))

(declare-fun lt!363893 () SeekEntryResult!8707)

(assert (=> b!811575 (= res!554618 (or (= lt!363893 (MissingZero!8707 i!1163)) (= lt!363893 (MissingVacant!8707 i!1163))))))

(assert (=> b!811575 (= lt!363893 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69654 res!554617) b!811574))

(assert (= (and b!811574 res!554615) b!811580))

(assert (= (and b!811580 res!554624) b!811579))

(assert (= (and b!811579 res!554621) b!811576))

(assert (= (and b!811576 res!554614) b!811575))

(assert (= (and b!811575 res!554618) b!811571))

(assert (= (and b!811571 res!554616) b!811573))

(assert (= (and b!811573 res!554619) b!811578))

(assert (= (and b!811578 res!554623) b!811572))

(assert (= (and b!811572 res!554622) b!811577))

(assert (= (and b!811577 res!554620) b!811581))

(declare-fun m!753963 () Bool)

(assert (=> b!811577 m!753963))

(declare-fun m!753965 () Bool)

(assert (=> b!811577 m!753965))

(assert (=> b!811577 m!753965))

(declare-fun m!753967 () Bool)

(assert (=> b!811577 m!753967))

(assert (=> b!811577 m!753965))

(declare-fun m!753969 () Bool)

(assert (=> b!811577 m!753969))

(declare-fun m!753971 () Bool)

(assert (=> start!69654 m!753971))

(declare-fun m!753973 () Bool)

(assert (=> start!69654 m!753973))

(declare-fun m!753975 () Bool)

(assert (=> b!811575 m!753975))

(declare-fun m!753977 () Bool)

(assert (=> b!811579 m!753977))

(assert (=> b!811580 m!753965))

(assert (=> b!811580 m!753965))

(declare-fun m!753979 () Bool)

(assert (=> b!811580 m!753979))

(assert (=> b!811581 m!753965))

(declare-fun m!753981 () Bool)

(assert (=> b!811581 m!753981))

(assert (=> b!811581 m!753965))

(declare-fun m!753983 () Bool)

(assert (=> b!811581 m!753983))

(declare-fun m!753985 () Bool)

(assert (=> b!811581 m!753985))

(declare-fun m!753987 () Bool)

(assert (=> b!811581 m!753987))

(declare-fun m!753989 () Bool)

(assert (=> b!811578 m!753989))

(declare-fun m!753991 () Bool)

(assert (=> b!811578 m!753991))

(declare-fun m!753993 () Bool)

(assert (=> b!811571 m!753993))

(declare-fun m!753995 () Bool)

(assert (=> b!811576 m!753995))

(declare-fun m!753997 () Bool)

(assert (=> b!811572 m!753997))

(declare-fun m!753999 () Bool)

(assert (=> b!811572 m!753999))

(declare-fun m!754001 () Bool)

(assert (=> b!811572 m!754001))

(declare-fun m!754003 () Bool)

(assert (=> b!811572 m!754003))

(declare-fun m!754005 () Bool)

(assert (=> b!811573 m!754005))

(push 1)

