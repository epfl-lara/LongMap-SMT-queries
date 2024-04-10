; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69182 () Bool)

(assert start!69182)

(declare-fun res!550963 () Bool)

(declare-fun e!446775 () Bool)

(assert (=> start!69182 (=> (not res!550963) (not e!446775))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69182 (= res!550963 (validMask!0 mask!3266))))

(assert (=> start!69182 e!446775))

(assert (=> start!69182 true))

(declare-datatypes ((array!43882 0))(
  ( (array!43883 (arr!21018 (Array (_ BitVec 32) (_ BitVec 64))) (size!21439 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43882)

(declare-fun array_inv!16814 (array!43882) Bool)

(assert (=> start!69182 (array_inv!16814 a!3170)))

(declare-fun b!806836 () Bool)

(declare-fun res!550964 () Bool)

(declare-fun e!446777 () Bool)

(assert (=> b!806836 (=> (not res!550964) (not e!446777))))

(declare-datatypes ((List!14981 0))(
  ( (Nil!14978) (Cons!14977 (h!16106 (_ BitVec 64)) (t!21296 List!14981)) )
))
(declare-fun arrayNoDuplicates!0 (array!43882 (_ BitVec 32) List!14981) Bool)

(assert (=> b!806836 (= res!550964 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14978))))

(declare-fun b!806837 () Bool)

(assert (=> b!806837 (= e!446775 e!446777)))

(declare-fun res!550967 () Bool)

(assert (=> b!806837 (=> (not res!550967) (not e!446777))))

(declare-datatypes ((SeekEntryResult!8609 0))(
  ( (MissingZero!8609 (index!36804 (_ BitVec 32))) (Found!8609 (index!36805 (_ BitVec 32))) (Intermediate!8609 (undefined!9421 Bool) (index!36806 (_ BitVec 32)) (x!67621 (_ BitVec 32))) (Undefined!8609) (MissingVacant!8609 (index!36807 (_ BitVec 32))) )
))
(declare-fun lt!361395 () SeekEntryResult!8609)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806837 (= res!550967 (or (= lt!361395 (MissingZero!8609 i!1163)) (= lt!361395 (MissingVacant!8609 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43882 (_ BitVec 32)) SeekEntryResult!8609)

(assert (=> b!806837 (= lt!361395 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806838 () Bool)

(declare-fun res!550970 () Bool)

(assert (=> b!806838 (=> (not res!550970) (not e!446775))))

(declare-fun arrayContainsKey!0 (array!43882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806838 (= res!550970 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806839 () Bool)

(declare-fun res!550960 () Bool)

(assert (=> b!806839 (=> (not res!550960) (not e!446775))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806839 (= res!550960 (and (= (size!21439 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21439 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21439 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806840 () Bool)

(declare-fun res!550962 () Bool)

(assert (=> b!806840 (=> (not res!550962) (not e!446775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806840 (= res!550962 (validKeyInArray!0 k!2044))))

(declare-fun b!806841 () Bool)

(declare-fun res!550968 () Bool)

(assert (=> b!806841 (=> (not res!550968) (not e!446777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43882 (_ BitVec 32)) Bool)

(assert (=> b!806841 (= res!550968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806842 () Bool)

(declare-fun res!550961 () Bool)

(assert (=> b!806842 (=> (not res!550961) (not e!446777))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806842 (= res!550961 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21439 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21018 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21439 a!3170)) (= (select (arr!21018 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun e!446772 () Bool)

(declare-fun lt!361391 () SeekEntryResult!8609)

(declare-fun lt!361396 () SeekEntryResult!8609)

(declare-fun lt!361397 () SeekEntryResult!8609)

(declare-fun b!806843 () Bool)

(assert (=> b!806843 (= e!446772 (not (or (not (= lt!361391 lt!361397)) (= lt!361391 lt!361396))))))

(assert (=> b!806843 (= lt!361391 (Found!8609 index!1236))))

(declare-fun b!806844 () Bool)

(declare-fun e!446773 () Bool)

(assert (=> b!806844 (= e!446777 e!446773)))

(declare-fun res!550959 () Bool)

(assert (=> b!806844 (=> (not res!550959) (not e!446773))))

(declare-fun lt!361394 () SeekEntryResult!8609)

(assert (=> b!806844 (= res!550959 (= lt!361394 lt!361391))))

(declare-fun lt!361392 () (_ BitVec 64))

(declare-fun lt!361393 () array!43882)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43882 (_ BitVec 32)) SeekEntryResult!8609)

(assert (=> b!806844 (= lt!361391 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361392 lt!361393 mask!3266))))

(assert (=> b!806844 (= lt!361394 (seekEntryOrOpen!0 lt!361392 lt!361393 mask!3266))))

(assert (=> b!806844 (= lt!361392 (select (store (arr!21018 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806844 (= lt!361393 (array!43883 (store (arr!21018 a!3170) i!1163 k!2044) (size!21439 a!3170)))))

(declare-fun b!806845 () Bool)

(declare-fun e!446774 () Bool)

(assert (=> b!806845 (= e!446774 e!446772)))

(declare-fun res!550965 () Bool)

(assert (=> b!806845 (=> (not res!550965) (not e!446772))))

(assert (=> b!806845 (= res!550965 (and (= lt!361396 lt!361397) (= (select (arr!21018 a!3170) index!1236) (select (arr!21018 a!3170) j!153))))))

(assert (=> b!806845 (= lt!361397 (Found!8609 j!153))))

(declare-fun b!806846 () Bool)

(assert (=> b!806846 (= e!446773 e!446774)))

(declare-fun res!550966 () Bool)

(assert (=> b!806846 (=> (not res!550966) (not e!446774))))

(declare-fun lt!361390 () SeekEntryResult!8609)

(assert (=> b!806846 (= res!550966 (= lt!361390 lt!361396))))

(assert (=> b!806846 (= lt!361396 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21018 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806846 (= lt!361390 (seekEntryOrOpen!0 (select (arr!21018 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806847 () Bool)

(declare-fun res!550969 () Bool)

(assert (=> b!806847 (=> (not res!550969) (not e!446775))))

(assert (=> b!806847 (= res!550969 (validKeyInArray!0 (select (arr!21018 a!3170) j!153)))))

(assert (= (and start!69182 res!550963) b!806839))

(assert (= (and b!806839 res!550960) b!806847))

(assert (= (and b!806847 res!550969) b!806840))

(assert (= (and b!806840 res!550962) b!806838))

(assert (= (and b!806838 res!550970) b!806837))

(assert (= (and b!806837 res!550967) b!806841))

(assert (= (and b!806841 res!550968) b!806836))

(assert (= (and b!806836 res!550964) b!806842))

(assert (= (and b!806842 res!550961) b!806844))

(assert (= (and b!806844 res!550959) b!806846))

(assert (= (and b!806846 res!550966) b!806845))

(assert (= (and b!806845 res!550965) b!806843))

(declare-fun m!748793 () Bool)

(assert (=> b!806845 m!748793))

(declare-fun m!748795 () Bool)

(assert (=> b!806845 m!748795))

(declare-fun m!748797 () Bool)

(assert (=> b!806837 m!748797))

(declare-fun m!748799 () Bool)

(assert (=> b!806840 m!748799))

(declare-fun m!748801 () Bool)

(assert (=> b!806836 m!748801))

(declare-fun m!748803 () Bool)

(assert (=> start!69182 m!748803))

(declare-fun m!748805 () Bool)

(assert (=> start!69182 m!748805))

(assert (=> b!806846 m!748795))

(assert (=> b!806846 m!748795))

(declare-fun m!748807 () Bool)

(assert (=> b!806846 m!748807))

(assert (=> b!806846 m!748795))

(declare-fun m!748809 () Bool)

(assert (=> b!806846 m!748809))

(assert (=> b!806847 m!748795))

(assert (=> b!806847 m!748795))

(declare-fun m!748811 () Bool)

(assert (=> b!806847 m!748811))

(declare-fun m!748813 () Bool)

(assert (=> b!806842 m!748813))

(declare-fun m!748815 () Bool)

(assert (=> b!806842 m!748815))

(declare-fun m!748817 () Bool)

(assert (=> b!806841 m!748817))

(declare-fun m!748819 () Bool)

(assert (=> b!806838 m!748819))

(declare-fun m!748821 () Bool)

(assert (=> b!806844 m!748821))

(declare-fun m!748823 () Bool)

(assert (=> b!806844 m!748823))

(declare-fun m!748825 () Bool)

(assert (=> b!806844 m!748825))

(declare-fun m!748827 () Bool)

(assert (=> b!806844 m!748827))

(push 1)

