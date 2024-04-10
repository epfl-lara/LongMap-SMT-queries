; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69554 () Bool)

(assert start!69554)

(declare-fun b!810596 () Bool)

(declare-fun res!553882 () Bool)

(declare-fun e!448681 () Bool)

(assert (=> b!810596 (=> (not res!553882) (not e!448681))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44050 0))(
  ( (array!44051 (arr!21096 (Array (_ BitVec 32) (_ BitVec 64))) (size!21517 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44050)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810596 (= res!553882 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21517 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21096 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21517 a!3170)) (= (select (arr!21096 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810597 () Bool)

(declare-fun res!553880 () Bool)

(declare-fun e!448682 () Bool)

(assert (=> b!810597 (=> (not res!553880) (not e!448682))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810597 (= res!553880 (validKeyInArray!0 (select (arr!21096 a!3170) j!153)))))

(declare-fun res!553883 () Bool)

(assert (=> start!69554 (=> (not res!553883) (not e!448682))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69554 (= res!553883 (validMask!0 mask!3266))))

(assert (=> start!69554 e!448682))

(assert (=> start!69554 true))

(declare-fun array_inv!16892 (array!44050) Bool)

(assert (=> start!69554 (array_inv!16892 a!3170)))

(declare-fun b!810598 () Bool)

(declare-fun res!553881 () Bool)

(assert (=> b!810598 (=> (not res!553881) (not e!448681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44050 (_ BitVec 32)) Bool)

(assert (=> b!810598 (= res!553881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810599 () Bool)

(declare-fun e!448679 () Bool)

(assert (=> b!810599 (= e!448679 (not true))))

(declare-fun lt!363326 () (_ BitVec 64))

(declare-fun lt!363325 () array!44050)

(declare-fun lt!363320 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8687 0))(
  ( (MissingZero!8687 (index!37116 (_ BitVec 32))) (Found!8687 (index!37117 (_ BitVec 32))) (Intermediate!8687 (undefined!9499 Bool) (index!37118 (_ BitVec 32)) (x!67931 (_ BitVec 32))) (Undefined!8687) (MissingVacant!8687 (index!37119 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44050 (_ BitVec 32)) SeekEntryResult!8687)

(assert (=> b!810599 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363320 vacantAfter!23 lt!363326 lt!363325 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363320 vacantBefore!23 (select (arr!21096 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27636 0))(
  ( (Unit!27637) )
))
(declare-fun lt!363322 () Unit!27636)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44050 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27636)

(assert (=> b!810599 (= lt!363322 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363320 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810599 (= lt!363320 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810600 () Bool)

(declare-fun res!553878 () Bool)

(assert (=> b!810600 (=> (not res!553878) (not e!448682))))

(assert (=> b!810600 (= res!553878 (validKeyInArray!0 k!2044))))

(declare-fun b!810601 () Bool)

(assert (=> b!810601 (= e!448682 e!448681)))

(declare-fun res!553875 () Bool)

(assert (=> b!810601 (=> (not res!553875) (not e!448681))))

(declare-fun lt!363323 () SeekEntryResult!8687)

(assert (=> b!810601 (= res!553875 (or (= lt!363323 (MissingZero!8687 i!1163)) (= lt!363323 (MissingVacant!8687 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44050 (_ BitVec 32)) SeekEntryResult!8687)

(assert (=> b!810601 (= lt!363323 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810602 () Bool)

(declare-fun res!553874 () Bool)

(assert (=> b!810602 (=> (not res!553874) (not e!448681))))

(declare-datatypes ((List!15059 0))(
  ( (Nil!15056) (Cons!15055 (h!16184 (_ BitVec 64)) (t!21374 List!15059)) )
))
(declare-fun arrayNoDuplicates!0 (array!44050 (_ BitVec 32) List!15059) Bool)

(assert (=> b!810602 (= res!553874 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15056))))

(declare-fun b!810603 () Bool)

(declare-fun res!553876 () Bool)

(assert (=> b!810603 (=> (not res!553876) (not e!448682))))

(assert (=> b!810603 (= res!553876 (and (= (size!21517 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21517 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21517 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810604 () Bool)

(declare-fun e!448678 () Bool)

(assert (=> b!810604 (= e!448678 e!448679)))

(declare-fun res!553879 () Bool)

(assert (=> b!810604 (=> (not res!553879) (not e!448679))))

(declare-fun lt!363324 () SeekEntryResult!8687)

(declare-fun lt!363321 () SeekEntryResult!8687)

(assert (=> b!810604 (= res!553879 (and (= lt!363321 lt!363324) (= lt!363324 (Found!8687 j!153)) (not (= (select (arr!21096 a!3170) index!1236) (select (arr!21096 a!3170) j!153)))))))

(assert (=> b!810604 (= lt!363324 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21096 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810604 (= lt!363321 (seekEntryOrOpen!0 (select (arr!21096 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810605 () Bool)

(declare-fun res!553877 () Bool)

(assert (=> b!810605 (=> (not res!553877) (not e!448682))))

(declare-fun arrayContainsKey!0 (array!44050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810605 (= res!553877 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810606 () Bool)

(assert (=> b!810606 (= e!448681 e!448678)))

(declare-fun res!553873 () Bool)

(assert (=> b!810606 (=> (not res!553873) (not e!448678))))

(assert (=> b!810606 (= res!553873 (= (seekEntryOrOpen!0 lt!363326 lt!363325 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363326 lt!363325 mask!3266)))))

(assert (=> b!810606 (= lt!363326 (select (store (arr!21096 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810606 (= lt!363325 (array!44051 (store (arr!21096 a!3170) i!1163 k!2044) (size!21517 a!3170)))))

(assert (= (and start!69554 res!553883) b!810603))

(assert (= (and b!810603 res!553876) b!810597))

(assert (= (and b!810597 res!553880) b!810600))

(assert (= (and b!810600 res!553878) b!810605))

(assert (= (and b!810605 res!553877) b!810601))

(assert (= (and b!810601 res!553875) b!810598))

(assert (= (and b!810598 res!553881) b!810602))

(assert (= (and b!810602 res!553874) b!810596))

(assert (= (and b!810596 res!553882) b!810606))

(assert (= (and b!810606 res!553873) b!810604))

(assert (= (and b!810604 res!553879) b!810599))

(declare-fun m!752789 () Bool)

(assert (=> b!810602 m!752789))

(declare-fun m!752791 () Bool)

(assert (=> start!69554 m!752791))

(declare-fun m!752793 () Bool)

(assert (=> start!69554 m!752793))

(declare-fun m!752795 () Bool)

(assert (=> b!810598 m!752795))

(declare-fun m!752797 () Bool)

(assert (=> b!810600 m!752797))

(declare-fun m!752799 () Bool)

(assert (=> b!810601 m!752799))

(declare-fun m!752801 () Bool)

(assert (=> b!810606 m!752801))

(declare-fun m!752803 () Bool)

(assert (=> b!810606 m!752803))

(declare-fun m!752805 () Bool)

(assert (=> b!810606 m!752805))

(declare-fun m!752807 () Bool)

(assert (=> b!810606 m!752807))

(declare-fun m!752809 () Bool)

(assert (=> b!810597 m!752809))

(assert (=> b!810597 m!752809))

(declare-fun m!752811 () Bool)

(assert (=> b!810597 m!752811))

(declare-fun m!752813 () Bool)

(assert (=> b!810604 m!752813))

(assert (=> b!810604 m!752809))

(assert (=> b!810604 m!752809))

(declare-fun m!752815 () Bool)

(assert (=> b!810604 m!752815))

(assert (=> b!810604 m!752809))

(declare-fun m!752817 () Bool)

(assert (=> b!810604 m!752817))

(declare-fun m!752819 () Bool)

(assert (=> b!810599 m!752819))

(assert (=> b!810599 m!752809))

(declare-fun m!752821 () Bool)

(assert (=> b!810599 m!752821))

(declare-fun m!752823 () Bool)

(assert (=> b!810599 m!752823))

(assert (=> b!810599 m!752809))

(declare-fun m!752825 () Bool)

(assert (=> b!810599 m!752825))

(declare-fun m!752827 () Bool)

(assert (=> b!810605 m!752827))

(declare-fun m!752829 () Bool)

(assert (=> b!810596 m!752829))

(declare-fun m!752831 () Bool)

(assert (=> b!810596 m!752831))

(push 1)

