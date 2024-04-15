; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69618 () Bool)

(assert start!69618)

(declare-fun b!811057 () Bool)

(declare-fun e!448906 () Bool)

(declare-fun e!448903 () Bool)

(assert (=> b!811057 (= e!448906 e!448903)))

(declare-fun res!554243 () Bool)

(assert (=> b!811057 (=> (not res!554243) (not e!448903))))

(declare-datatypes ((array!44074 0))(
  ( (array!44075 (arr!21107 (Array (_ BitVec 32) (_ BitVec 64))) (size!21528 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44074)

(declare-datatypes ((SeekEntryResult!8695 0))(
  ( (MissingZero!8695 (index!37151 (_ BitVec 32))) (Found!8695 (index!37152 (_ BitVec 32))) (Intermediate!8695 (undefined!9507 Bool) (index!37153 (_ BitVec 32)) (x!67975 (_ BitVec 32))) (Undefined!8695) (MissingVacant!8695 (index!37154 (_ BitVec 32))) )
))
(declare-fun lt!363490 () SeekEntryResult!8695)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363488 () SeekEntryResult!8695)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811057 (= res!554243 (and (= lt!363488 lt!363490) (= lt!363490 (Found!8695 j!153)) (not (= (select (arr!21107 a!3170) index!1236) (select (arr!21107 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44074 (_ BitVec 32)) SeekEntryResult!8695)

(assert (=> b!811057 (= lt!363490 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44074 (_ BitVec 32)) SeekEntryResult!8695)

(assert (=> b!811057 (= lt!363488 (seekEntryOrOpen!0 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811058 () Bool)

(declare-fun e!448902 () Bool)

(assert (=> b!811058 (= e!448902 e!448906)))

(declare-fun res!554240 () Bool)

(assert (=> b!811058 (=> (not res!554240) (not e!448906))))

(declare-fun lt!363485 () array!44074)

(declare-fun lt!363487 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!811058 (= res!554240 (= (seekEntryOrOpen!0 lt!363487 lt!363485 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363487 lt!363485 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811058 (= lt!363487 (select (store (arr!21107 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811058 (= lt!363485 (array!44075 (store (arr!21107 a!3170) i!1163 k0!2044) (size!21528 a!3170)))))

(declare-fun b!811059 () Bool)

(declare-fun res!554246 () Bool)

(assert (=> b!811059 (=> (not res!554246) (not e!448902))))

(declare-datatypes ((List!15109 0))(
  ( (Nil!15106) (Cons!15105 (h!16234 (_ BitVec 64)) (t!21415 List!15109)) )
))
(declare-fun arrayNoDuplicates!0 (array!44074 (_ BitVec 32) List!15109) Bool)

(assert (=> b!811059 (= res!554246 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15106))))

(declare-fun b!811060 () Bool)

(declare-fun res!554241 () Bool)

(assert (=> b!811060 (=> (not res!554241) (not e!448902))))

(assert (=> b!811060 (= res!554241 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21528 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21107 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21528 a!3170)) (= (select (arr!21107 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811061 () Bool)

(declare-fun res!554244 () Bool)

(declare-fun e!448905 () Bool)

(assert (=> b!811061 (=> (not res!554244) (not e!448905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811061 (= res!554244 (validKeyInArray!0 k0!2044))))

(declare-fun b!811062 () Bool)

(declare-fun res!554245 () Bool)

(assert (=> b!811062 (=> (not res!554245) (not e!448905))))

(assert (=> b!811062 (= res!554245 (and (= (size!21528 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21528 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21528 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811063 () Bool)

(declare-fun res!554249 () Bool)

(assert (=> b!811063 (=> (not res!554249) (not e!448905))))

(declare-fun arrayContainsKey!0 (array!44074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811063 (= res!554249 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!554247 () Bool)

(assert (=> start!69618 (=> (not res!554247) (not e!448905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69618 (= res!554247 (validMask!0 mask!3266))))

(assert (=> start!69618 e!448905))

(assert (=> start!69618 true))

(declare-fun array_inv!16990 (array!44074) Bool)

(assert (=> start!69618 (array_inv!16990 a!3170)))

(declare-fun b!811064 () Bool)

(declare-fun res!554242 () Bool)

(assert (=> b!811064 (=> (not res!554242) (not e!448905))))

(assert (=> b!811064 (= res!554242 (validKeyInArray!0 (select (arr!21107 a!3170) j!153)))))

(declare-fun b!811065 () Bool)

(declare-fun res!554248 () Bool)

(assert (=> b!811065 (=> (not res!554248) (not e!448902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44074 (_ BitVec 32)) Bool)

(assert (=> b!811065 (= res!554248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811066 () Bool)

(assert (=> b!811066 (= e!448905 e!448902)))

(declare-fun res!554250 () Bool)

(assert (=> b!811066 (=> (not res!554250) (not e!448902))))

(declare-fun lt!363489 () SeekEntryResult!8695)

(assert (=> b!811066 (= res!554250 (or (= lt!363489 (MissingZero!8695 i!1163)) (= lt!363489 (MissingVacant!8695 i!1163))))))

(assert (=> b!811066 (= lt!363489 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811067 () Bool)

(assert (=> b!811067 (= e!448903 (not true))))

(declare-fun lt!363486 () (_ BitVec 32))

(assert (=> b!811067 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363486 vacantAfter!23 lt!363487 lt!363485 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363486 vacantBefore!23 (select (arr!21107 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27618 0))(
  ( (Unit!27619) )
))
(declare-fun lt!363491 () Unit!27618)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44074 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27618)

(assert (=> b!811067 (= lt!363491 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363486 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811067 (= lt!363486 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69618 res!554247) b!811062))

(assert (= (and b!811062 res!554245) b!811064))

(assert (= (and b!811064 res!554242) b!811061))

(assert (= (and b!811061 res!554244) b!811063))

(assert (= (and b!811063 res!554249) b!811066))

(assert (= (and b!811066 res!554250) b!811065))

(assert (= (and b!811065 res!554248) b!811059))

(assert (= (and b!811059 res!554246) b!811060))

(assert (= (and b!811060 res!554241) b!811058))

(assert (= (and b!811058 res!554240) b!811057))

(assert (= (and b!811057 res!554243) b!811067))

(declare-fun m!752869 () Bool)

(assert (=> b!811065 m!752869))

(declare-fun m!752871 () Bool)

(assert (=> b!811067 m!752871))

(assert (=> b!811067 m!752871))

(declare-fun m!752873 () Bool)

(assert (=> b!811067 m!752873))

(declare-fun m!752875 () Bool)

(assert (=> b!811067 m!752875))

(declare-fun m!752877 () Bool)

(assert (=> b!811067 m!752877))

(declare-fun m!752879 () Bool)

(assert (=> b!811067 m!752879))

(declare-fun m!752881 () Bool)

(assert (=> b!811061 m!752881))

(assert (=> b!811064 m!752871))

(assert (=> b!811064 m!752871))

(declare-fun m!752883 () Bool)

(assert (=> b!811064 m!752883))

(declare-fun m!752885 () Bool)

(assert (=> b!811063 m!752885))

(declare-fun m!752887 () Bool)

(assert (=> start!69618 m!752887))

(declare-fun m!752889 () Bool)

(assert (=> start!69618 m!752889))

(declare-fun m!752891 () Bool)

(assert (=> b!811057 m!752891))

(assert (=> b!811057 m!752871))

(assert (=> b!811057 m!752871))

(declare-fun m!752893 () Bool)

(assert (=> b!811057 m!752893))

(assert (=> b!811057 m!752871))

(declare-fun m!752895 () Bool)

(assert (=> b!811057 m!752895))

(declare-fun m!752897 () Bool)

(assert (=> b!811059 m!752897))

(declare-fun m!752899 () Bool)

(assert (=> b!811066 m!752899))

(declare-fun m!752901 () Bool)

(assert (=> b!811058 m!752901))

(declare-fun m!752903 () Bool)

(assert (=> b!811058 m!752903))

(declare-fun m!752905 () Bool)

(assert (=> b!811058 m!752905))

(declare-fun m!752907 () Bool)

(assert (=> b!811058 m!752907))

(declare-fun m!752909 () Bool)

(assert (=> b!811060 m!752909))

(declare-fun m!752911 () Bool)

(assert (=> b!811060 m!752911))

(check-sat (not b!811066) (not b!811067) (not b!811059) (not b!811064) (not start!69618) (not b!811061) (not b!811065) (not b!811057) (not b!811058) (not b!811063))
(check-sat)
