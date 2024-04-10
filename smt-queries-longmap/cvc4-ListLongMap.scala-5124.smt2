; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69570 () Bool)

(assert start!69570)

(declare-fun b!810860 () Bool)

(declare-fun e!448802 () Bool)

(assert (=> b!810860 (= e!448802 (not true))))

(declare-fun lt!363490 () (_ BitVec 64))

(declare-datatypes ((array!44066 0))(
  ( (array!44067 (arr!21104 (Array (_ BitVec 32) (_ BitVec 64))) (size!21525 (_ BitVec 32))) )
))
(declare-fun lt!363493 () array!44066)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun a!3170 () array!44066)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!363489 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8695 0))(
  ( (MissingZero!8695 (index!37148 (_ BitVec 32))) (Found!8695 (index!37149 (_ BitVec 32))) (Intermediate!8695 (undefined!9507 Bool) (index!37150 (_ BitVec 32)) (x!67955 (_ BitVec 32))) (Undefined!8695) (MissingVacant!8695 (index!37151 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44066 (_ BitVec 32)) SeekEntryResult!8695)

(assert (=> b!810860 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363489 vacantAfter!23 lt!363490 lt!363493 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363489 vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27652 0))(
  ( (Unit!27653) )
))
(declare-fun lt!363491 () Unit!27652)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44066 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27652)

(assert (=> b!810860 (= lt!363491 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363489 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810860 (= lt!363489 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810861 () Bool)

(declare-fun e!448799 () Bool)

(assert (=> b!810861 (= e!448799 e!448802)))

(declare-fun res!554146 () Bool)

(assert (=> b!810861 (=> (not res!554146) (not e!448802))))

(declare-fun lt!363492 () SeekEntryResult!8695)

(declare-fun lt!363494 () SeekEntryResult!8695)

(assert (=> b!810861 (= res!554146 (and (= lt!363492 lt!363494) (= lt!363494 (Found!8695 j!153)) (not (= (select (arr!21104 a!3170) index!1236) (select (arr!21104 a!3170) j!153)))))))

(assert (=> b!810861 (= lt!363494 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44066 (_ BitVec 32)) SeekEntryResult!8695)

(assert (=> b!810861 (= lt!363492 (seekEntryOrOpen!0 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810862 () Bool)

(declare-fun e!448801 () Bool)

(declare-fun e!448800 () Bool)

(assert (=> b!810862 (= e!448801 e!448800)))

(declare-fun res!554140 () Bool)

(assert (=> b!810862 (=> (not res!554140) (not e!448800))))

(declare-fun lt!363488 () SeekEntryResult!8695)

(assert (=> b!810862 (= res!554140 (or (= lt!363488 (MissingZero!8695 i!1163)) (= lt!363488 (MissingVacant!8695 i!1163))))))

(assert (=> b!810862 (= lt!363488 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810863 () Bool)

(declare-fun res!554147 () Bool)

(assert (=> b!810863 (=> (not res!554147) (not e!448800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44066 (_ BitVec 32)) Bool)

(assert (=> b!810863 (= res!554147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810864 () Bool)

(declare-fun res!554141 () Bool)

(assert (=> b!810864 (=> (not res!554141) (not e!448800))))

(assert (=> b!810864 (= res!554141 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21525 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21104 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21525 a!3170)) (= (select (arr!21104 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810865 () Bool)

(declare-fun res!554137 () Bool)

(assert (=> b!810865 (=> (not res!554137) (not e!448801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810865 (= res!554137 (validKeyInArray!0 (select (arr!21104 a!3170) j!153)))))

(declare-fun b!810866 () Bool)

(declare-fun res!554142 () Bool)

(assert (=> b!810866 (=> (not res!554142) (not e!448801))))

(declare-fun arrayContainsKey!0 (array!44066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810866 (= res!554142 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810867 () Bool)

(declare-fun res!554144 () Bool)

(assert (=> b!810867 (=> (not res!554144) (not e!448800))))

(declare-datatypes ((List!15067 0))(
  ( (Nil!15064) (Cons!15063 (h!16192 (_ BitVec 64)) (t!21382 List!15067)) )
))
(declare-fun arrayNoDuplicates!0 (array!44066 (_ BitVec 32) List!15067) Bool)

(assert (=> b!810867 (= res!554144 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15064))))

(declare-fun res!554143 () Bool)

(assert (=> start!69570 (=> (not res!554143) (not e!448801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69570 (= res!554143 (validMask!0 mask!3266))))

(assert (=> start!69570 e!448801))

(assert (=> start!69570 true))

(declare-fun array_inv!16900 (array!44066) Bool)

(assert (=> start!69570 (array_inv!16900 a!3170)))

(declare-fun b!810868 () Bool)

(declare-fun res!554139 () Bool)

(assert (=> b!810868 (=> (not res!554139) (not e!448801))))

(assert (=> b!810868 (= res!554139 (validKeyInArray!0 k!2044))))

(declare-fun b!810869 () Bool)

(assert (=> b!810869 (= e!448800 e!448799)))

(declare-fun res!554145 () Bool)

(assert (=> b!810869 (=> (not res!554145) (not e!448799))))

(assert (=> b!810869 (= res!554145 (= (seekEntryOrOpen!0 lt!363490 lt!363493 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363490 lt!363493 mask!3266)))))

(assert (=> b!810869 (= lt!363490 (select (store (arr!21104 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810869 (= lt!363493 (array!44067 (store (arr!21104 a!3170) i!1163 k!2044) (size!21525 a!3170)))))

(declare-fun b!810870 () Bool)

(declare-fun res!554138 () Bool)

(assert (=> b!810870 (=> (not res!554138) (not e!448801))))

(assert (=> b!810870 (= res!554138 (and (= (size!21525 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21525 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21525 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69570 res!554143) b!810870))

(assert (= (and b!810870 res!554138) b!810865))

(assert (= (and b!810865 res!554137) b!810868))

(assert (= (and b!810868 res!554139) b!810866))

(assert (= (and b!810866 res!554142) b!810862))

(assert (= (and b!810862 res!554140) b!810863))

(assert (= (and b!810863 res!554147) b!810867))

(assert (= (and b!810867 res!554144) b!810864))

(assert (= (and b!810864 res!554141) b!810869))

(assert (= (and b!810869 res!554145) b!810861))

(assert (= (and b!810861 res!554146) b!810860))

(declare-fun m!753141 () Bool)

(assert (=> start!69570 m!753141))

(declare-fun m!753143 () Bool)

(assert (=> start!69570 m!753143))

(declare-fun m!753145 () Bool)

(assert (=> b!810860 m!753145))

(declare-fun m!753147 () Bool)

(assert (=> b!810860 m!753147))

(assert (=> b!810860 m!753145))

(declare-fun m!753149 () Bool)

(assert (=> b!810860 m!753149))

(declare-fun m!753151 () Bool)

(assert (=> b!810860 m!753151))

(declare-fun m!753153 () Bool)

(assert (=> b!810860 m!753153))

(declare-fun m!753155 () Bool)

(assert (=> b!810863 m!753155))

(declare-fun m!753157 () Bool)

(assert (=> b!810869 m!753157))

(declare-fun m!753159 () Bool)

(assert (=> b!810869 m!753159))

(declare-fun m!753161 () Bool)

(assert (=> b!810869 m!753161))

(declare-fun m!753163 () Bool)

(assert (=> b!810869 m!753163))

(assert (=> b!810865 m!753145))

(assert (=> b!810865 m!753145))

(declare-fun m!753165 () Bool)

(assert (=> b!810865 m!753165))

(declare-fun m!753167 () Bool)

(assert (=> b!810867 m!753167))

(declare-fun m!753169 () Bool)

(assert (=> b!810868 m!753169))

(declare-fun m!753171 () Bool)

(assert (=> b!810862 m!753171))

(declare-fun m!753173 () Bool)

(assert (=> b!810861 m!753173))

(assert (=> b!810861 m!753145))

(assert (=> b!810861 m!753145))

(declare-fun m!753175 () Bool)

(assert (=> b!810861 m!753175))

(assert (=> b!810861 m!753145))

(declare-fun m!753177 () Bool)

(assert (=> b!810861 m!753177))

(declare-fun m!753179 () Bool)

(assert (=> b!810864 m!753179))

(declare-fun m!753181 () Bool)

(assert (=> b!810864 m!753181))

(declare-fun m!753183 () Bool)

(assert (=> b!810866 m!753183))

(push 1)

(assert (not b!810867))

(assert (not b!810861))

(assert (not b!810868))

(assert (not b!810860))

(assert (not b!810865))

