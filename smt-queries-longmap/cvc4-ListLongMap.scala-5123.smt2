; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69564 () Bool)

(assert start!69564)

(declare-fun b!810761 () Bool)

(declare-fun e!448754 () Bool)

(declare-fun e!448756 () Bool)

(assert (=> b!810761 (= e!448754 e!448756)))

(declare-fun res!554039 () Bool)

(assert (=> b!810761 (=> (not res!554039) (not e!448756))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363425 () (_ BitVec 64))

(declare-datatypes ((array!44060 0))(
  ( (array!44061 (arr!21101 (Array (_ BitVec 32) (_ BitVec 64))) (size!21522 (_ BitVec 32))) )
))
(declare-fun lt!363427 () array!44060)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8692 0))(
  ( (MissingZero!8692 (index!37136 (_ BitVec 32))) (Found!8692 (index!37137 (_ BitVec 32))) (Intermediate!8692 (undefined!9504 Bool) (index!37138 (_ BitVec 32)) (x!67944 (_ BitVec 32))) (Undefined!8692) (MissingVacant!8692 (index!37139 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44060 (_ BitVec 32)) SeekEntryResult!8692)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44060 (_ BitVec 32)) SeekEntryResult!8692)

(assert (=> b!810761 (= res!554039 (= (seekEntryOrOpen!0 lt!363425 lt!363427 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363425 lt!363427 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun a!3170 () array!44060)

(assert (=> b!810761 (= lt!363425 (select (store (arr!21101 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810761 (= lt!363427 (array!44061 (store (arr!21101 a!3170) i!1163 k!2044) (size!21522 a!3170)))))

(declare-fun b!810762 () Bool)

(declare-fun res!554046 () Bool)

(declare-fun e!448757 () Bool)

(assert (=> b!810762 (=> (not res!554046) (not e!448757))))

(declare-fun arrayContainsKey!0 (array!44060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810762 (= res!554046 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810763 () Bool)

(declare-fun res!554038 () Bool)

(assert (=> b!810763 (=> (not res!554038) (not e!448757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810763 (= res!554038 (validKeyInArray!0 (select (arr!21101 a!3170) j!153)))))

(declare-fun res!554043 () Bool)

(assert (=> start!69564 (=> (not res!554043) (not e!448757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69564 (= res!554043 (validMask!0 mask!3266))))

(assert (=> start!69564 e!448757))

(assert (=> start!69564 true))

(declare-fun array_inv!16897 (array!44060) Bool)

(assert (=> start!69564 (array_inv!16897 a!3170)))

(declare-fun b!810764 () Bool)

(declare-fun e!448753 () Bool)

(assert (=> b!810764 (= e!448753 (not true))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!363430 () (_ BitVec 32))

(assert (=> b!810764 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363430 vacantAfter!23 lt!363425 lt!363427 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363430 vacantBefore!23 (select (arr!21101 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27646 0))(
  ( (Unit!27647) )
))
(declare-fun lt!363431 () Unit!27646)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44060 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27646)

(assert (=> b!810764 (= lt!363431 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363430 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810764 (= lt!363430 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810765 () Bool)

(declare-fun res!554045 () Bool)

(assert (=> b!810765 (=> (not res!554045) (not e!448754))))

(declare-datatypes ((List!15064 0))(
  ( (Nil!15061) (Cons!15060 (h!16189 (_ BitVec 64)) (t!21379 List!15064)) )
))
(declare-fun arrayNoDuplicates!0 (array!44060 (_ BitVec 32) List!15064) Bool)

(assert (=> b!810765 (= res!554045 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15061))))

(declare-fun b!810766 () Bool)

(declare-fun res!554048 () Bool)

(assert (=> b!810766 (=> (not res!554048) (not e!448754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44060 (_ BitVec 32)) Bool)

(assert (=> b!810766 (= res!554048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810767 () Bool)

(declare-fun res!554047 () Bool)

(assert (=> b!810767 (=> (not res!554047) (not e!448754))))

(assert (=> b!810767 (= res!554047 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21522 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21101 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21522 a!3170)) (= (select (arr!21101 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810768 () Bool)

(assert (=> b!810768 (= e!448756 e!448753)))

(declare-fun res!554044 () Bool)

(assert (=> b!810768 (=> (not res!554044) (not e!448753))))

(declare-fun lt!363429 () SeekEntryResult!8692)

(declare-fun lt!363426 () SeekEntryResult!8692)

(assert (=> b!810768 (= res!554044 (and (= lt!363426 lt!363429) (= lt!363429 (Found!8692 j!153)) (not (= (select (arr!21101 a!3170) index!1236) (select (arr!21101 a!3170) j!153)))))))

(assert (=> b!810768 (= lt!363429 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21101 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810768 (= lt!363426 (seekEntryOrOpen!0 (select (arr!21101 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810769 () Bool)

(assert (=> b!810769 (= e!448757 e!448754)))

(declare-fun res!554042 () Bool)

(assert (=> b!810769 (=> (not res!554042) (not e!448754))))

(declare-fun lt!363428 () SeekEntryResult!8692)

(assert (=> b!810769 (= res!554042 (or (= lt!363428 (MissingZero!8692 i!1163)) (= lt!363428 (MissingVacant!8692 i!1163))))))

(assert (=> b!810769 (= lt!363428 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810770 () Bool)

(declare-fun res!554040 () Bool)

(assert (=> b!810770 (=> (not res!554040) (not e!448757))))

(assert (=> b!810770 (= res!554040 (validKeyInArray!0 k!2044))))

(declare-fun b!810771 () Bool)

(declare-fun res!554041 () Bool)

(assert (=> b!810771 (=> (not res!554041) (not e!448757))))

(assert (=> b!810771 (= res!554041 (and (= (size!21522 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21522 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21522 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69564 res!554043) b!810771))

(assert (= (and b!810771 res!554041) b!810763))

(assert (= (and b!810763 res!554038) b!810770))

(assert (= (and b!810770 res!554040) b!810762))

(assert (= (and b!810762 res!554046) b!810769))

(assert (= (and b!810769 res!554042) b!810766))

(assert (= (and b!810766 res!554048) b!810765))

(assert (= (and b!810765 res!554045) b!810767))

(assert (= (and b!810767 res!554047) b!810761))

(assert (= (and b!810761 res!554039) b!810768))

(assert (= (and b!810768 res!554044) b!810764))

(declare-fun m!753009 () Bool)

(assert (=> b!810768 m!753009))

(declare-fun m!753011 () Bool)

(assert (=> b!810768 m!753011))

(assert (=> b!810768 m!753011))

(declare-fun m!753013 () Bool)

(assert (=> b!810768 m!753013))

(assert (=> b!810768 m!753011))

(declare-fun m!753015 () Bool)

(assert (=> b!810768 m!753015))

(declare-fun m!753017 () Bool)

(assert (=> b!810762 m!753017))

(declare-fun m!753019 () Bool)

(assert (=> b!810765 m!753019))

(declare-fun m!753021 () Bool)

(assert (=> start!69564 m!753021))

(declare-fun m!753023 () Bool)

(assert (=> start!69564 m!753023))

(assert (=> b!810763 m!753011))

(assert (=> b!810763 m!753011))

(declare-fun m!753025 () Bool)

(assert (=> b!810763 m!753025))

(declare-fun m!753027 () Bool)

(assert (=> b!810761 m!753027))

(declare-fun m!753029 () Bool)

(assert (=> b!810761 m!753029))

(declare-fun m!753031 () Bool)

(assert (=> b!810761 m!753031))

(declare-fun m!753033 () Bool)

(assert (=> b!810761 m!753033))

(declare-fun m!753035 () Bool)

(assert (=> b!810767 m!753035))

(declare-fun m!753037 () Bool)

(assert (=> b!810767 m!753037))

(declare-fun m!753039 () Bool)

(assert (=> b!810766 m!753039))

(declare-fun m!753041 () Bool)

(assert (=> b!810770 m!753041))

(declare-fun m!753043 () Bool)

(assert (=> b!810769 m!753043))

(assert (=> b!810764 m!753011))

(declare-fun m!753045 () Bool)

(assert (=> b!810764 m!753045))

(declare-fun m!753047 () Bool)

(assert (=> b!810764 m!753047))

(assert (=> b!810764 m!753011))

(declare-fun m!753049 () Bool)

(assert (=> b!810764 m!753049))

(declare-fun m!753051 () Bool)

(assert (=> b!810764 m!753051))

(push 1)

(assert (not b!810769))

(assert (not b!810765))

(assert (not b!810761))

(assert (not b!810763))

(assert (not b!810770))

