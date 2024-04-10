; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69650 () Bool)

(assert start!69650)

(declare-fun b!811505 () Bool)

(declare-fun res!554557 () Bool)

(declare-fun e!449147 () Bool)

(assert (=> b!811505 (=> (not res!554557) (not e!449147))))

(declare-datatypes ((array!44089 0))(
  ( (array!44090 (arr!21114 (Array (_ BitVec 32) (_ BitVec 64))) (size!21535 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44089)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44089 (_ BitVec 32)) Bool)

(assert (=> b!811505 (= res!554557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811506 () Bool)

(declare-fun e!449148 () Bool)

(declare-fun e!449150 () Bool)

(assert (=> b!811506 (= e!449148 e!449150)))

(declare-fun res!554548 () Bool)

(assert (=> b!811506 (=> (not res!554548) (not e!449150))))

(declare-datatypes ((SeekEntryResult!8705 0))(
  ( (MissingZero!8705 (index!37191 (_ BitVec 32))) (Found!8705 (index!37192 (_ BitVec 32))) (Intermediate!8705 (undefined!9517 Bool) (index!37193 (_ BitVec 32)) (x!68006 (_ BitVec 32))) (Undefined!8705) (MissingVacant!8705 (index!37194 (_ BitVec 32))) )
))
(declare-fun lt!363856 () SeekEntryResult!8705)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363853 () SeekEntryResult!8705)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811506 (= res!554548 (and (= lt!363856 lt!363853) (= lt!363853 (Found!8705 j!153)) (not (= (select (arr!21114 a!3170) index!1236) (select (arr!21114 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44089 (_ BitVec 32)) SeekEntryResult!8705)

(assert (=> b!811506 (= lt!363853 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21114 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44089 (_ BitVec 32)) SeekEntryResult!8705)

(assert (=> b!811506 (= lt!363856 (seekEntryOrOpen!0 (select (arr!21114 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!554550 () Bool)

(declare-fun e!449149 () Bool)

(assert (=> start!69650 (=> (not res!554550) (not e!449149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69650 (= res!554550 (validMask!0 mask!3266))))

(assert (=> start!69650 e!449149))

(assert (=> start!69650 true))

(declare-fun array_inv!16910 (array!44089) Bool)

(assert (=> start!69650 (array_inv!16910 a!3170)))

(declare-fun b!811507 () Bool)

(assert (=> b!811507 (= e!449150 (not true))))

(declare-fun lt!363854 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363855 () array!44089)

(declare-fun lt!363857 () (_ BitVec 64))

(assert (=> b!811507 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363854 vacantAfter!23 lt!363857 lt!363855 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363854 vacantBefore!23 (select (arr!21114 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27672 0))(
  ( (Unit!27673) )
))
(declare-fun lt!363851 () Unit!27672)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27672)

(assert (=> b!811507 (= lt!363851 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363854 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811507 (= lt!363854 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811508 () Bool)

(declare-fun res!554549 () Bool)

(assert (=> b!811508 (=> (not res!554549) (not e!449149))))

(declare-fun arrayContainsKey!0 (array!44089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811508 (= res!554549 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811509 () Bool)

(declare-fun res!554551 () Bool)

(assert (=> b!811509 (=> (not res!554551) (not e!449149))))

(assert (=> b!811509 (= res!554551 (and (= (size!21535 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21535 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21535 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811510 () Bool)

(declare-fun res!554554 () Bool)

(assert (=> b!811510 (=> (not res!554554) (not e!449147))))

(assert (=> b!811510 (= res!554554 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21535 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21114 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21535 a!3170)) (= (select (arr!21114 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811511 () Bool)

(assert (=> b!811511 (= e!449149 e!449147)))

(declare-fun res!554556 () Bool)

(assert (=> b!811511 (=> (not res!554556) (not e!449147))))

(declare-fun lt!363852 () SeekEntryResult!8705)

(assert (=> b!811511 (= res!554556 (or (= lt!363852 (MissingZero!8705 i!1163)) (= lt!363852 (MissingVacant!8705 i!1163))))))

(assert (=> b!811511 (= lt!363852 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!811512 () Bool)

(declare-fun res!554552 () Bool)

(assert (=> b!811512 (=> (not res!554552) (not e!449147))))

(declare-datatypes ((List!15077 0))(
  ( (Nil!15074) (Cons!15073 (h!16202 (_ BitVec 64)) (t!21392 List!15077)) )
))
(declare-fun arrayNoDuplicates!0 (array!44089 (_ BitVec 32) List!15077) Bool)

(assert (=> b!811512 (= res!554552 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15074))))

(declare-fun b!811513 () Bool)

(declare-fun res!554553 () Bool)

(assert (=> b!811513 (=> (not res!554553) (not e!449149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811513 (= res!554553 (validKeyInArray!0 (select (arr!21114 a!3170) j!153)))))

(declare-fun b!811514 () Bool)

(declare-fun res!554555 () Bool)

(assert (=> b!811514 (=> (not res!554555) (not e!449149))))

(assert (=> b!811514 (= res!554555 (validKeyInArray!0 k!2044))))

(declare-fun b!811515 () Bool)

(assert (=> b!811515 (= e!449147 e!449148)))

(declare-fun res!554558 () Bool)

(assert (=> b!811515 (=> (not res!554558) (not e!449148))))

(assert (=> b!811515 (= res!554558 (= (seekEntryOrOpen!0 lt!363857 lt!363855 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363857 lt!363855 mask!3266)))))

(assert (=> b!811515 (= lt!363857 (select (store (arr!21114 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811515 (= lt!363855 (array!44090 (store (arr!21114 a!3170) i!1163 k!2044) (size!21535 a!3170)))))

(assert (= (and start!69650 res!554550) b!811509))

(assert (= (and b!811509 res!554551) b!811513))

(assert (= (and b!811513 res!554553) b!811514))

(assert (= (and b!811514 res!554555) b!811508))

(assert (= (and b!811508 res!554549) b!811511))

(assert (= (and b!811511 res!554556) b!811505))

(assert (= (and b!811505 res!554557) b!811512))

(assert (= (and b!811512 res!554552) b!811510))

(assert (= (and b!811510 res!554554) b!811515))

(assert (= (and b!811515 res!554558) b!811506))

(assert (= (and b!811506 res!554548) b!811507))

(declare-fun m!753875 () Bool)

(assert (=> b!811506 m!753875))

(declare-fun m!753877 () Bool)

(assert (=> b!811506 m!753877))

(assert (=> b!811506 m!753877))

(declare-fun m!753879 () Bool)

(assert (=> b!811506 m!753879))

(assert (=> b!811506 m!753877))

(declare-fun m!753881 () Bool)

(assert (=> b!811506 m!753881))

(declare-fun m!753883 () Bool)

(assert (=> b!811514 m!753883))

(declare-fun m!753885 () Bool)

(assert (=> b!811512 m!753885))

(declare-fun m!753887 () Bool)

(assert (=> b!811515 m!753887))

(declare-fun m!753889 () Bool)

(assert (=> b!811515 m!753889))

(declare-fun m!753891 () Bool)

(assert (=> b!811515 m!753891))

(declare-fun m!753893 () Bool)

(assert (=> b!811515 m!753893))

(declare-fun m!753895 () Bool)

(assert (=> b!811510 m!753895))

(declare-fun m!753897 () Bool)

(assert (=> b!811510 m!753897))

(declare-fun m!753899 () Bool)

(assert (=> b!811511 m!753899))

(declare-fun m!753901 () Bool)

(assert (=> start!69650 m!753901))

(declare-fun m!753903 () Bool)

(assert (=> start!69650 m!753903))

(assert (=> b!811513 m!753877))

(assert (=> b!811513 m!753877))

(declare-fun m!753905 () Bool)

(assert (=> b!811513 m!753905))

(declare-fun m!753907 () Bool)

(assert (=> b!811508 m!753907))

(assert (=> b!811507 m!753877))

(declare-fun m!753909 () Bool)

(assert (=> b!811507 m!753909))

(declare-fun m!753911 () Bool)

(assert (=> b!811507 m!753911))

(declare-fun m!753913 () Bool)

(assert (=> b!811507 m!753913))

(assert (=> b!811507 m!753877))

(declare-fun m!753915 () Bool)

(assert (=> b!811507 m!753915))

(declare-fun m!753917 () Bool)

(assert (=> b!811505 m!753917))

(push 1)

