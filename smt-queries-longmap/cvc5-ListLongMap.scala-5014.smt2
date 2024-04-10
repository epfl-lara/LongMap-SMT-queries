; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68594 () Bool)

(assert start!68594)

(declare-fun b!798077 () Bool)

(declare-fun res!542598 () Bool)

(declare-fun e!442724 () Bool)

(assert (=> b!798077 (=> (not res!542598) (not e!442724))))

(declare-datatypes ((array!43384 0))(
  ( (array!43385 (arr!20772 (Array (_ BitVec 32) (_ BitVec 64))) (size!21193 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43384)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43384 (_ BitVec 32)) Bool)

(assert (=> b!798077 (= res!542598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798078 () Bool)

(declare-fun res!542603 () Bool)

(declare-fun e!442722 () Bool)

(assert (=> b!798078 (=> (not res!542603) (not e!442722))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798078 (= res!542603 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798079 () Bool)

(declare-fun e!442720 () Bool)

(assert (=> b!798079 (= e!442720 (not true))))

(declare-datatypes ((SeekEntryResult!8363 0))(
  ( (MissingZero!8363 (index!35820 (_ BitVec 32))) (Found!8363 (index!35821 (_ BitVec 32))) (Intermediate!8363 (undefined!9175 Bool) (index!35822 (_ BitVec 32)) (x!66713 (_ BitVec 32))) (Undefined!8363) (MissingVacant!8363 (index!35823 (_ BitVec 32))) )
))
(declare-fun lt!356187 () SeekEntryResult!8363)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798079 (= lt!356187 (Found!8363 index!1236))))

(declare-fun b!798081 () Bool)

(declare-fun e!442723 () Bool)

(assert (=> b!798081 (= e!442723 e!442720)))

(declare-fun res!542596 () Bool)

(assert (=> b!798081 (=> (not res!542596) (not e!442720))))

(declare-fun lt!356189 () SeekEntryResult!8363)

(declare-fun lt!356184 () SeekEntryResult!8363)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798081 (= res!542596 (and (= lt!356184 lt!356189) (= lt!356189 (Found!8363 j!153)) (= (select (arr!20772 a!3170) index!1236) (select (arr!20772 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43384 (_ BitVec 32)) SeekEntryResult!8363)

(assert (=> b!798081 (= lt!356189 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20772 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43384 (_ BitVec 32)) SeekEntryResult!8363)

(assert (=> b!798081 (= lt!356184 (seekEntryOrOpen!0 (select (arr!20772 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798082 () Bool)

(declare-fun res!542600 () Bool)

(assert (=> b!798082 (=> (not res!542600) (not e!442724))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798082 (= res!542600 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21193 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20772 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21193 a!3170)) (= (select (arr!20772 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798083 () Bool)

(declare-fun res!542597 () Bool)

(assert (=> b!798083 (=> (not res!542597) (not e!442724))))

(declare-datatypes ((List!14735 0))(
  ( (Nil!14732) (Cons!14731 (h!15860 (_ BitVec 64)) (t!21050 List!14735)) )
))
(declare-fun arrayNoDuplicates!0 (array!43384 (_ BitVec 32) List!14735) Bool)

(assert (=> b!798083 (= res!542597 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14732))))

(declare-fun b!798084 () Bool)

(declare-fun res!542602 () Bool)

(assert (=> b!798084 (=> (not res!542602) (not e!442722))))

(assert (=> b!798084 (= res!542602 (and (= (size!21193 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21193 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21193 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798085 () Bool)

(declare-fun res!542601 () Bool)

(assert (=> b!798085 (=> (not res!542601) (not e!442722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798085 (= res!542601 (validKeyInArray!0 (select (arr!20772 a!3170) j!153)))))

(declare-fun b!798086 () Bool)

(assert (=> b!798086 (= e!442724 e!442723)))

(declare-fun res!542599 () Bool)

(assert (=> b!798086 (=> (not res!542599) (not e!442723))))

(declare-fun lt!356186 () SeekEntryResult!8363)

(assert (=> b!798086 (= res!542599 (= lt!356186 lt!356187))))

(declare-fun lt!356183 () array!43384)

(declare-fun lt!356185 () (_ BitVec 64))

(assert (=> b!798086 (= lt!356187 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356185 lt!356183 mask!3266))))

(assert (=> b!798086 (= lt!356186 (seekEntryOrOpen!0 lt!356185 lt!356183 mask!3266))))

(assert (=> b!798086 (= lt!356185 (select (store (arr!20772 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798086 (= lt!356183 (array!43385 (store (arr!20772 a!3170) i!1163 k!2044) (size!21193 a!3170)))))

(declare-fun b!798087 () Bool)

(declare-fun res!542605 () Bool)

(assert (=> b!798087 (=> (not res!542605) (not e!442722))))

(assert (=> b!798087 (= res!542605 (validKeyInArray!0 k!2044))))

(declare-fun b!798080 () Bool)

(assert (=> b!798080 (= e!442722 e!442724)))

(declare-fun res!542604 () Bool)

(assert (=> b!798080 (=> (not res!542604) (not e!442724))))

(declare-fun lt!356188 () SeekEntryResult!8363)

(assert (=> b!798080 (= res!542604 (or (= lt!356188 (MissingZero!8363 i!1163)) (= lt!356188 (MissingVacant!8363 i!1163))))))

(assert (=> b!798080 (= lt!356188 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!542606 () Bool)

(assert (=> start!68594 (=> (not res!542606) (not e!442722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68594 (= res!542606 (validMask!0 mask!3266))))

(assert (=> start!68594 e!442722))

(assert (=> start!68594 true))

(declare-fun array_inv!16568 (array!43384) Bool)

(assert (=> start!68594 (array_inv!16568 a!3170)))

(assert (= (and start!68594 res!542606) b!798084))

(assert (= (and b!798084 res!542602) b!798085))

(assert (= (and b!798085 res!542601) b!798087))

(assert (= (and b!798087 res!542605) b!798078))

(assert (= (and b!798078 res!542603) b!798080))

(assert (= (and b!798080 res!542604) b!798077))

(assert (= (and b!798077 res!542598) b!798083))

(assert (= (and b!798083 res!542597) b!798082))

(assert (= (and b!798082 res!542600) b!798086))

(assert (= (and b!798086 res!542599) b!798081))

(assert (= (and b!798081 res!542596) b!798079))

(declare-fun m!738959 () Bool)

(assert (=> b!798081 m!738959))

(declare-fun m!738961 () Bool)

(assert (=> b!798081 m!738961))

(assert (=> b!798081 m!738961))

(declare-fun m!738963 () Bool)

(assert (=> b!798081 m!738963))

(assert (=> b!798081 m!738961))

(declare-fun m!738965 () Bool)

(assert (=> b!798081 m!738965))

(declare-fun m!738967 () Bool)

(assert (=> b!798083 m!738967))

(declare-fun m!738969 () Bool)

(assert (=> b!798087 m!738969))

(declare-fun m!738971 () Bool)

(assert (=> b!798080 m!738971))

(declare-fun m!738973 () Bool)

(assert (=> b!798077 m!738973))

(declare-fun m!738975 () Bool)

(assert (=> b!798078 m!738975))

(declare-fun m!738977 () Bool)

(assert (=> b!798086 m!738977))

(declare-fun m!738979 () Bool)

(assert (=> b!798086 m!738979))

(declare-fun m!738981 () Bool)

(assert (=> b!798086 m!738981))

(declare-fun m!738983 () Bool)

(assert (=> b!798086 m!738983))

(declare-fun m!738985 () Bool)

(assert (=> start!68594 m!738985))

(declare-fun m!738987 () Bool)

(assert (=> start!68594 m!738987))

(declare-fun m!738989 () Bool)

(assert (=> b!798082 m!738989))

(declare-fun m!738991 () Bool)

(assert (=> b!798082 m!738991))

(assert (=> b!798085 m!738961))

(assert (=> b!798085 m!738961))

(declare-fun m!738993 () Bool)

(assert (=> b!798085 m!738993))

(push 1)

