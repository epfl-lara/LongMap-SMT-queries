; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68310 () Bool)

(assert start!68310)

(declare-fun b!793582 () Bool)

(declare-fun e!440810 () Bool)

(declare-fun e!440808 () Bool)

(assert (=> b!793582 (= e!440810 e!440808)))

(declare-fun res!538108 () Bool)

(assert (=> b!793582 (=> (not res!538108) (not e!440808))))

(declare-datatypes ((SeekEntryResult!8221 0))(
  ( (MissingZero!8221 (index!35252 (_ BitVec 32))) (Found!8221 (index!35253 (_ BitVec 32))) (Intermediate!8221 (undefined!9033 Bool) (index!35254 (_ BitVec 32)) (x!66187 (_ BitVec 32))) (Undefined!8221) (MissingVacant!8221 (index!35255 (_ BitVec 32))) )
))
(declare-fun lt!353752 () SeekEntryResult!8221)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793582 (= res!538108 (or (= lt!353752 (MissingZero!8221 i!1163)) (= lt!353752 (MissingVacant!8221 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43100 0))(
  ( (array!43101 (arr!20630 (Array (_ BitVec 32) (_ BitVec 64))) (size!21051 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43100)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43100 (_ BitVec 32)) SeekEntryResult!8221)

(assert (=> b!793582 (= lt!353752 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793583 () Bool)

(declare-fun res!538103 () Bool)

(assert (=> b!793583 (=> (not res!538103) (not e!440810))))

(declare-fun arrayContainsKey!0 (array!43100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793583 (= res!538103 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793584 () Bool)

(declare-fun res!538106 () Bool)

(assert (=> b!793584 (=> (not res!538106) (not e!440808))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793584 (= res!538106 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21051 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20630 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21051 a!3170)) (= (select (arr!20630 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793585 () Bool)

(assert (=> b!793585 (= e!440808 false)))

(declare-fun lt!353754 () (_ BitVec 64))

(declare-fun lt!353756 () array!43100)

(declare-fun lt!353753 () SeekEntryResult!8221)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43100 (_ BitVec 32)) SeekEntryResult!8221)

(assert (=> b!793585 (= lt!353753 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353754 lt!353756 mask!3266))))

(declare-fun lt!353755 () SeekEntryResult!8221)

(assert (=> b!793585 (= lt!353755 (seekEntryOrOpen!0 lt!353754 lt!353756 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793585 (= lt!353754 (select (store (arr!20630 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793585 (= lt!353756 (array!43101 (store (arr!20630 a!3170) i!1163 k!2044) (size!21051 a!3170)))))

(declare-fun b!793587 () Bool)

(declare-fun res!538105 () Bool)

(assert (=> b!793587 (=> (not res!538105) (not e!440808))))

(declare-datatypes ((List!14593 0))(
  ( (Nil!14590) (Cons!14589 (h!15718 (_ BitVec 64)) (t!20908 List!14593)) )
))
(declare-fun arrayNoDuplicates!0 (array!43100 (_ BitVec 32) List!14593) Bool)

(assert (=> b!793587 (= res!538105 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14590))))

(declare-fun b!793588 () Bool)

(declare-fun res!538102 () Bool)

(assert (=> b!793588 (=> (not res!538102) (not e!440808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43100 (_ BitVec 32)) Bool)

(assert (=> b!793588 (= res!538102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793589 () Bool)

(declare-fun res!538109 () Bool)

(assert (=> b!793589 (=> (not res!538109) (not e!440810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793589 (= res!538109 (validKeyInArray!0 k!2044))))

(declare-fun b!793590 () Bool)

(declare-fun res!538104 () Bool)

(assert (=> b!793590 (=> (not res!538104) (not e!440810))))

(assert (=> b!793590 (= res!538104 (and (= (size!21051 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21051 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21051 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!538107 () Bool)

(assert (=> start!68310 (=> (not res!538107) (not e!440810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68310 (= res!538107 (validMask!0 mask!3266))))

(assert (=> start!68310 e!440810))

(assert (=> start!68310 true))

(declare-fun array_inv!16426 (array!43100) Bool)

(assert (=> start!68310 (array_inv!16426 a!3170)))

(declare-fun b!793586 () Bool)

(declare-fun res!538101 () Bool)

(assert (=> b!793586 (=> (not res!538101) (not e!440810))))

(assert (=> b!793586 (= res!538101 (validKeyInArray!0 (select (arr!20630 a!3170) j!153)))))

(assert (= (and start!68310 res!538107) b!793590))

(assert (= (and b!793590 res!538104) b!793586))

(assert (= (and b!793586 res!538101) b!793589))

(assert (= (and b!793589 res!538109) b!793583))

(assert (= (and b!793583 res!538103) b!793582))

(assert (= (and b!793582 res!538108) b!793588))

(assert (= (and b!793588 res!538102) b!793587))

(assert (= (and b!793587 res!538105) b!793584))

(assert (= (and b!793584 res!538106) b!793585))

(declare-fun m!734063 () Bool)

(assert (=> b!793582 m!734063))

(declare-fun m!734065 () Bool)

(assert (=> b!793584 m!734065))

(declare-fun m!734067 () Bool)

(assert (=> b!793584 m!734067))

(declare-fun m!734069 () Bool)

(assert (=> b!793583 m!734069))

(declare-fun m!734071 () Bool)

(assert (=> b!793587 m!734071))

(declare-fun m!734073 () Bool)

(assert (=> b!793586 m!734073))

(assert (=> b!793586 m!734073))

(declare-fun m!734075 () Bool)

(assert (=> b!793586 m!734075))

(declare-fun m!734077 () Bool)

(assert (=> b!793589 m!734077))

(declare-fun m!734079 () Bool)

(assert (=> b!793585 m!734079))

(declare-fun m!734081 () Bool)

(assert (=> b!793585 m!734081))

(declare-fun m!734083 () Bool)

(assert (=> b!793585 m!734083))

(declare-fun m!734085 () Bool)

(assert (=> b!793585 m!734085))

(declare-fun m!734087 () Bool)

(assert (=> b!793588 m!734087))

(declare-fun m!734089 () Bool)

(assert (=> start!68310 m!734089))

(declare-fun m!734091 () Bool)

(assert (=> start!68310 m!734091))

(push 1)

(assert (not start!68310))

(assert (not b!793583))

(assert (not b!793589))

(assert (not b!793585))

(assert (not b!793588))

(assert (not b!793582))

