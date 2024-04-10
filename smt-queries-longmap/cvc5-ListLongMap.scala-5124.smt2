; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69566 () Bool)

(assert start!69566)

(declare-fun b!810794 () Bool)

(declare-fun res!554080 () Bool)

(declare-fun e!448768 () Bool)

(assert (=> b!810794 (=> (not res!554080) (not e!448768))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44062 0))(
  ( (array!44063 (arr!21102 (Array (_ BitVec 32) (_ BitVec 64))) (size!21523 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44062)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810794 (= res!554080 (and (= (size!21523 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21523 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21523 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810795 () Bool)

(declare-fun e!448772 () Bool)

(declare-fun e!448770 () Bool)

(assert (=> b!810795 (= e!448772 e!448770)))

(declare-fun res!554078 () Bool)

(assert (=> b!810795 (=> (not res!554078) (not e!448770))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363446 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363449 () array!44062)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8693 0))(
  ( (MissingZero!8693 (index!37140 (_ BitVec 32))) (Found!8693 (index!37141 (_ BitVec 32))) (Intermediate!8693 (undefined!9505 Bool) (index!37142 (_ BitVec 32)) (x!67953 (_ BitVec 32))) (Undefined!8693) (MissingVacant!8693 (index!37143 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44062 (_ BitVec 32)) SeekEntryResult!8693)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44062 (_ BitVec 32)) SeekEntryResult!8693)

(assert (=> b!810795 (= res!554078 (= (seekEntryOrOpen!0 lt!363446 lt!363449 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363446 lt!363449 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!810795 (= lt!363446 (select (store (arr!21102 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810795 (= lt!363449 (array!44063 (store (arr!21102 a!3170) i!1163 k!2044) (size!21523 a!3170)))))

(declare-fun b!810796 () Bool)

(declare-fun res!554074 () Bool)

(assert (=> b!810796 (=> (not res!554074) (not e!448768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810796 (= res!554074 (validKeyInArray!0 k!2044))))

(declare-fun b!810797 () Bool)

(assert (=> b!810797 (= e!448768 e!448772)))

(declare-fun res!554081 () Bool)

(assert (=> b!810797 (=> (not res!554081) (not e!448772))))

(declare-fun lt!363448 () SeekEntryResult!8693)

(assert (=> b!810797 (= res!554081 (or (= lt!363448 (MissingZero!8693 i!1163)) (= lt!363448 (MissingVacant!8693 i!1163))))))

(assert (=> b!810797 (= lt!363448 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810798 () Bool)

(declare-fun e!448771 () Bool)

(assert (=> b!810798 (= e!448770 e!448771)))

(declare-fun res!554073 () Bool)

(assert (=> b!810798 (=> (not res!554073) (not e!448771))))

(declare-fun lt!363447 () SeekEntryResult!8693)

(declare-fun lt!363450 () SeekEntryResult!8693)

(assert (=> b!810798 (= res!554073 (and (= lt!363450 lt!363447) (= lt!363447 (Found!8693 j!153)) (not (= (select (arr!21102 a!3170) index!1236) (select (arr!21102 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810798 (= lt!363447 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21102 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810798 (= lt!363450 (seekEntryOrOpen!0 (select (arr!21102 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810799 () Bool)

(declare-fun res!554072 () Bool)

(assert (=> b!810799 (=> (not res!554072) (not e!448768))))

(declare-fun arrayContainsKey!0 (array!44062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810799 (= res!554072 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810800 () Bool)

(declare-fun res!554075 () Bool)

(assert (=> b!810800 (=> (not res!554075) (not e!448772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44062 (_ BitVec 32)) Bool)

(assert (=> b!810800 (= res!554075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810801 () Bool)

(declare-fun res!554076 () Bool)

(assert (=> b!810801 (=> (not res!554076) (not e!448772))))

(assert (=> b!810801 (= res!554076 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21523 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21102 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21523 a!3170)) (= (select (arr!21102 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810802 () Bool)

(assert (=> b!810802 (= e!448771 (not true))))

(declare-fun lt!363452 () (_ BitVec 32))

(assert (=> b!810802 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363452 vacantAfter!23 lt!363446 lt!363449 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363452 vacantBefore!23 (select (arr!21102 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27648 0))(
  ( (Unit!27649) )
))
(declare-fun lt!363451 () Unit!27648)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44062 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27648)

(assert (=> b!810802 (= lt!363451 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363452 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810802 (= lt!363452 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810803 () Bool)

(declare-fun res!554071 () Bool)

(assert (=> b!810803 (=> (not res!554071) (not e!448772))))

(declare-datatypes ((List!15065 0))(
  ( (Nil!15062) (Cons!15061 (h!16190 (_ BitVec 64)) (t!21380 List!15065)) )
))
(declare-fun arrayNoDuplicates!0 (array!44062 (_ BitVec 32) List!15065) Bool)

(assert (=> b!810803 (= res!554071 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15062))))

(declare-fun res!554077 () Bool)

(assert (=> start!69566 (=> (not res!554077) (not e!448768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69566 (= res!554077 (validMask!0 mask!3266))))

(assert (=> start!69566 e!448768))

(assert (=> start!69566 true))

(declare-fun array_inv!16898 (array!44062) Bool)

(assert (=> start!69566 (array_inv!16898 a!3170)))

(declare-fun b!810804 () Bool)

(declare-fun res!554079 () Bool)

(assert (=> b!810804 (=> (not res!554079) (not e!448768))))

(assert (=> b!810804 (= res!554079 (validKeyInArray!0 (select (arr!21102 a!3170) j!153)))))

(assert (= (and start!69566 res!554077) b!810794))

(assert (= (and b!810794 res!554080) b!810804))

(assert (= (and b!810804 res!554079) b!810796))

(assert (= (and b!810796 res!554074) b!810799))

(assert (= (and b!810799 res!554072) b!810797))

(assert (= (and b!810797 res!554081) b!810800))

(assert (= (and b!810800 res!554075) b!810803))

(assert (= (and b!810803 res!554071) b!810801))

(assert (= (and b!810801 res!554076) b!810795))

(assert (= (and b!810795 res!554078) b!810798))

(assert (= (and b!810798 res!554073) b!810802))

(declare-fun m!753053 () Bool)

(assert (=> b!810800 m!753053))

(declare-fun m!753055 () Bool)

(assert (=> b!810798 m!753055))

(declare-fun m!753057 () Bool)

(assert (=> b!810798 m!753057))

(assert (=> b!810798 m!753057))

(declare-fun m!753059 () Bool)

(assert (=> b!810798 m!753059))

(assert (=> b!810798 m!753057))

(declare-fun m!753061 () Bool)

(assert (=> b!810798 m!753061))

(declare-fun m!753063 () Bool)

(assert (=> b!810795 m!753063))

(declare-fun m!753065 () Bool)

(assert (=> b!810795 m!753065))

(declare-fun m!753067 () Bool)

(assert (=> b!810795 m!753067))

(declare-fun m!753069 () Bool)

(assert (=> b!810795 m!753069))

(declare-fun m!753071 () Bool)

(assert (=> b!810799 m!753071))

(declare-fun m!753073 () Bool)

(assert (=> start!69566 m!753073))

(declare-fun m!753075 () Bool)

(assert (=> start!69566 m!753075))

(assert (=> b!810802 m!753057))

(declare-fun m!753077 () Bool)

(assert (=> b!810802 m!753077))

(declare-fun m!753079 () Bool)

(assert (=> b!810802 m!753079))

(assert (=> b!810802 m!753057))

(declare-fun m!753081 () Bool)

(assert (=> b!810802 m!753081))

(declare-fun m!753083 () Bool)

(assert (=> b!810802 m!753083))

(declare-fun m!753085 () Bool)

(assert (=> b!810796 m!753085))

(assert (=> b!810804 m!753057))

(assert (=> b!810804 m!753057))

(declare-fun m!753087 () Bool)

(assert (=> b!810804 m!753087))

(declare-fun m!753089 () Bool)

(assert (=> b!810803 m!753089))

(declare-fun m!753091 () Bool)

(assert (=> b!810801 m!753091))

(declare-fun m!753093 () Bool)

(assert (=> b!810801 m!753093))

(declare-fun m!753095 () Bool)

(assert (=> b!810797 m!753095))

(push 1)

