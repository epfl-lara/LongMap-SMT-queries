; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68928 () Bool)

(assert start!68928)

(declare-fun b!804083 () Bool)

(declare-fun e!445506 () Bool)

(declare-fun e!445504 () Bool)

(assert (=> b!804083 (= e!445506 e!445504)))

(declare-fun res!548607 () Bool)

(assert (=> b!804083 (=> (not res!548607) (not e!445504))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!360060 () (_ BitVec 64))

(declare-datatypes ((array!43718 0))(
  ( (array!43719 (arr!20939 (Array (_ BitVec 32) (_ BitVec 64))) (size!21360 (_ BitVec 32))) )
))
(declare-fun lt!360059 () array!43718)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8530 0))(
  ( (MissingZero!8530 (index!36488 (_ BitVec 32))) (Found!8530 (index!36489 (_ BitVec 32))) (Intermediate!8530 (undefined!9342 Bool) (index!36490 (_ BitVec 32)) (x!67320 (_ BitVec 32))) (Undefined!8530) (MissingVacant!8530 (index!36491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43718 (_ BitVec 32)) SeekEntryResult!8530)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43718 (_ BitVec 32)) SeekEntryResult!8530)

(assert (=> b!804083 (= res!548607 (= (seekEntryOrOpen!0 lt!360060 lt!360059 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360060 lt!360059 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43718)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804083 (= lt!360060 (select (store (arr!20939 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804083 (= lt!360059 (array!43719 (store (arr!20939 a!3170) i!1163 k!2044) (size!21360 a!3170)))))

(declare-fun b!804084 () Bool)

(declare-fun res!548610 () Bool)

(declare-fun e!445508 () Bool)

(assert (=> b!804084 (=> (not res!548610) (not e!445508))))

(declare-fun arrayContainsKey!0 (array!43718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804084 (= res!548610 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804085 () Bool)

(declare-fun res!548603 () Bool)

(assert (=> b!804085 (=> (not res!548603) (not e!445508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804085 (= res!548603 (validKeyInArray!0 k!2044))))

(declare-fun b!804086 () Bool)

(declare-fun res!548612 () Bool)

(assert (=> b!804086 (=> (not res!548612) (not e!445506))))

(declare-datatypes ((List!14902 0))(
  ( (Nil!14899) (Cons!14898 (h!16027 (_ BitVec 64)) (t!21217 List!14902)) )
))
(declare-fun arrayNoDuplicates!0 (array!43718 (_ BitVec 32) List!14902) Bool)

(assert (=> b!804086 (= res!548612 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14899))))

(declare-fun b!804087 () Bool)

(assert (=> b!804087 (= e!445508 e!445506)))

(declare-fun res!548609 () Bool)

(assert (=> b!804087 (=> (not res!548609) (not e!445506))))

(declare-fun lt!360065 () SeekEntryResult!8530)

(assert (=> b!804087 (= res!548609 (or (= lt!360065 (MissingZero!8530 i!1163)) (= lt!360065 (MissingVacant!8530 i!1163))))))

(assert (=> b!804087 (= lt!360065 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804089 () Bool)

(declare-fun res!548611 () Bool)

(assert (=> b!804089 (=> (not res!548611) (not e!445508))))

(assert (=> b!804089 (= res!548611 (validKeyInArray!0 (select (arr!20939 a!3170) j!153)))))

(declare-fun b!804090 () Bool)

(declare-fun res!548602 () Bool)

(assert (=> b!804090 (=> (not res!548602) (not e!445508))))

(assert (=> b!804090 (= res!548602 (and (= (size!21360 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21360 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21360 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804091 () Bool)

(declare-fun res!548605 () Bool)

(assert (=> b!804091 (=> (not res!548605) (not e!445506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43718 (_ BitVec 32)) Bool)

(assert (=> b!804091 (= res!548605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804092 () Bool)

(declare-fun e!445505 () Bool)

(assert (=> b!804092 (= e!445504 e!445505)))

(declare-fun res!548608 () Bool)

(assert (=> b!804092 (=> (not res!548608) (not e!445505))))

(declare-fun lt!360063 () SeekEntryResult!8530)

(declare-fun lt!360062 () SeekEntryResult!8530)

(assert (=> b!804092 (= res!548608 (and (= lt!360063 lt!360062) (= lt!360062 (Found!8530 j!153)) (not (= (select (arr!20939 a!3170) index!1236) (select (arr!20939 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804092 (= lt!360062 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20939 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!804092 (= lt!360063 (seekEntryOrOpen!0 (select (arr!20939 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804093 () Bool)

(assert (=> b!804093 (= e!445505 (not true))))

(declare-fun lt!360061 () (_ BitVec 32))

(assert (=> b!804093 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360061 vacantAfter!23 lt!360060 lt!360059 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360061 vacantBefore!23 (select (arr!20939 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27600 0))(
  ( (Unit!27601) )
))
(declare-fun lt!360064 () Unit!27600)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43718 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27600)

(assert (=> b!804093 (= lt!360064 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!360061 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804093 (= lt!360061 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!548606 () Bool)

(assert (=> start!68928 (=> (not res!548606) (not e!445508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68928 (= res!548606 (validMask!0 mask!3266))))

(assert (=> start!68928 e!445508))

(assert (=> start!68928 true))

(declare-fun array_inv!16735 (array!43718) Bool)

(assert (=> start!68928 (array_inv!16735 a!3170)))

(declare-fun b!804088 () Bool)

(declare-fun res!548604 () Bool)

(assert (=> b!804088 (=> (not res!548604) (not e!445506))))

(assert (=> b!804088 (= res!548604 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21360 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20939 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21360 a!3170)) (= (select (arr!20939 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68928 res!548606) b!804090))

(assert (= (and b!804090 res!548602) b!804089))

(assert (= (and b!804089 res!548611) b!804085))

(assert (= (and b!804085 res!548603) b!804084))

(assert (= (and b!804084 res!548610) b!804087))

(assert (= (and b!804087 res!548609) b!804091))

(assert (= (and b!804091 res!548605) b!804086))

(assert (= (and b!804086 res!548612) b!804088))

(assert (= (and b!804088 res!548604) b!804083))

(assert (= (and b!804083 res!548607) b!804092))

(assert (= (and b!804092 res!548608) b!804093))

(declare-fun m!745995 () Bool)

(assert (=> b!804084 m!745995))

(declare-fun m!745997 () Bool)

(assert (=> b!804091 m!745997))

(declare-fun m!745999 () Bool)

(assert (=> b!804086 m!745999))

(declare-fun m!746001 () Bool)

(assert (=> b!804089 m!746001))

(assert (=> b!804089 m!746001))

(declare-fun m!746003 () Bool)

(assert (=> b!804089 m!746003))

(assert (=> b!804093 m!746001))

(declare-fun m!746005 () Bool)

(assert (=> b!804093 m!746005))

(declare-fun m!746007 () Bool)

(assert (=> b!804093 m!746007))

(assert (=> b!804093 m!746001))

(declare-fun m!746009 () Bool)

(assert (=> b!804093 m!746009))

(declare-fun m!746011 () Bool)

(assert (=> b!804093 m!746011))

(declare-fun m!746013 () Bool)

(assert (=> b!804092 m!746013))

(assert (=> b!804092 m!746001))

(assert (=> b!804092 m!746001))

(declare-fun m!746015 () Bool)

(assert (=> b!804092 m!746015))

(assert (=> b!804092 m!746001))

(declare-fun m!746017 () Bool)

(assert (=> b!804092 m!746017))

(declare-fun m!746019 () Bool)

(assert (=> b!804083 m!746019))

(declare-fun m!746021 () Bool)

(assert (=> b!804083 m!746021))

(declare-fun m!746023 () Bool)

(assert (=> b!804083 m!746023))

(declare-fun m!746025 () Bool)

(assert (=> b!804083 m!746025))

(declare-fun m!746027 () Bool)

(assert (=> b!804085 m!746027))

(declare-fun m!746029 () Bool)

(assert (=> start!68928 m!746029))

(declare-fun m!746031 () Bool)

(assert (=> start!68928 m!746031))

(declare-fun m!746033 () Bool)

(assert (=> b!804088 m!746033))

(declare-fun m!746035 () Bool)

(assert (=> b!804088 m!746035))

(declare-fun m!746037 () Bool)

(assert (=> b!804087 m!746037))

(push 1)

(assert (not start!68928))

(assert (not b!804093))

(assert (not b!804086))

(assert (not b!804083))

(assert (not b!804091))

(assert (not b!804087))

(assert (not b!804084))

(assert (not b!804089))

(assert (not b!804085))

(assert (not b!804092))

(check-sat)

(pop 1)

