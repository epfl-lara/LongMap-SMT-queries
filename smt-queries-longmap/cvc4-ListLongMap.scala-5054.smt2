; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68838 () Bool)

(assert start!68838)

(declare-fun b!802517 () Bool)

(declare-fun e!444752 () Bool)

(declare-fun e!444748 () Bool)

(assert (=> b!802517 (= e!444752 e!444748)))

(declare-fun res!547039 () Bool)

(assert (=> b!802517 (=> (not res!547039) (not e!444748))))

(declare-datatypes ((array!43628 0))(
  ( (array!43629 (arr!20894 (Array (_ BitVec 32) (_ BitVec 64))) (size!21315 (_ BitVec 32))) )
))
(declare-fun lt!358900 () array!43628)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!358899 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8485 0))(
  ( (MissingZero!8485 (index!36308 (_ BitVec 32))) (Found!8485 (index!36309 (_ BitVec 32))) (Intermediate!8485 (undefined!9297 Bool) (index!36310 (_ BitVec 32)) (x!67155 (_ BitVec 32))) (Undefined!8485) (MissingVacant!8485 (index!36311 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43628 (_ BitVec 32)) SeekEntryResult!8485)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43628 (_ BitVec 32)) SeekEntryResult!8485)

(assert (=> b!802517 (= res!547039 (= (seekEntryOrOpen!0 lt!358899 lt!358900 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358899 lt!358900 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun a!3170 () array!43628)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802517 (= lt!358899 (select (store (arr!20894 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802517 (= lt!358900 (array!43629 (store (arr!20894 a!3170) i!1163 k!2044) (size!21315 a!3170)))))

(declare-fun b!802518 () Bool)

(declare-fun res!547042 () Bool)

(declare-fun e!444749 () Bool)

(assert (=> b!802518 (=> (not res!547042) (not e!444749))))

(assert (=> b!802518 (= res!547042 (and (= (size!21315 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21315 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21315 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802519 () Bool)

(declare-fun e!444750 () Bool)

(assert (=> b!802519 (= e!444750 (not true))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!358898 () (_ BitVec 32))

(assert (=> b!802519 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358898 vacantAfter!23 lt!358899 lt!358900 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358898 vacantBefore!23 (select (arr!20894 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27510 0))(
  ( (Unit!27511) )
))
(declare-fun lt!358903 () Unit!27510)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43628 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27510)

(assert (=> b!802519 (= lt!358903 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358898 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802519 (= lt!358898 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802520 () Bool)

(declare-fun res!547041 () Bool)

(assert (=> b!802520 (=> (not res!547041) (not e!444752))))

(assert (=> b!802520 (= res!547041 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21315 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20894 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21315 a!3170)) (= (select (arr!20894 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!547046 () Bool)

(assert (=> start!68838 (=> (not res!547046) (not e!444749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68838 (= res!547046 (validMask!0 mask!3266))))

(assert (=> start!68838 e!444749))

(assert (=> start!68838 true))

(declare-fun array_inv!16690 (array!43628) Bool)

(assert (=> start!68838 (array_inv!16690 a!3170)))

(declare-fun b!802521 () Bool)

(declare-fun res!547043 () Bool)

(assert (=> b!802521 (=> (not res!547043) (not e!444749))))

(declare-fun arrayContainsKey!0 (array!43628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802521 (= res!547043 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802522 () Bool)

(assert (=> b!802522 (= e!444749 e!444752)))

(declare-fun res!547045 () Bool)

(assert (=> b!802522 (=> (not res!547045) (not e!444752))))

(declare-fun lt!358901 () SeekEntryResult!8485)

(assert (=> b!802522 (= res!547045 (or (= lt!358901 (MissingZero!8485 i!1163)) (= lt!358901 (MissingVacant!8485 i!1163))))))

(assert (=> b!802522 (= lt!358901 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802523 () Bool)

(declare-fun res!547037 () Bool)

(assert (=> b!802523 (=> (not res!547037) (not e!444749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802523 (= res!547037 (validKeyInArray!0 (select (arr!20894 a!3170) j!153)))))

(declare-fun b!802524 () Bool)

(assert (=> b!802524 (= e!444748 e!444750)))

(declare-fun res!547038 () Bool)

(assert (=> b!802524 (=> (not res!547038) (not e!444750))))

(declare-fun lt!358904 () SeekEntryResult!8485)

(declare-fun lt!358902 () SeekEntryResult!8485)

(assert (=> b!802524 (= res!547038 (and (= lt!358902 lt!358904) (= lt!358904 (Found!8485 j!153)) (not (= (select (arr!20894 a!3170) index!1236) (select (arr!20894 a!3170) j!153)))))))

(assert (=> b!802524 (= lt!358904 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20894 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802524 (= lt!358902 (seekEntryOrOpen!0 (select (arr!20894 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802525 () Bool)

(declare-fun res!547044 () Bool)

(assert (=> b!802525 (=> (not res!547044) (not e!444749))))

(assert (=> b!802525 (= res!547044 (validKeyInArray!0 k!2044))))

(declare-fun b!802526 () Bool)

(declare-fun res!547036 () Bool)

(assert (=> b!802526 (=> (not res!547036) (not e!444752))))

(declare-datatypes ((List!14857 0))(
  ( (Nil!14854) (Cons!14853 (h!15982 (_ BitVec 64)) (t!21172 List!14857)) )
))
(declare-fun arrayNoDuplicates!0 (array!43628 (_ BitVec 32) List!14857) Bool)

(assert (=> b!802526 (= res!547036 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14854))))

(declare-fun b!802527 () Bool)

(declare-fun res!547040 () Bool)

(assert (=> b!802527 (=> (not res!547040) (not e!444752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43628 (_ BitVec 32)) Bool)

(assert (=> b!802527 (= res!547040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68838 res!547046) b!802518))

(assert (= (and b!802518 res!547042) b!802523))

(assert (= (and b!802523 res!547037) b!802525))

(assert (= (and b!802525 res!547044) b!802521))

(assert (= (and b!802521 res!547043) b!802522))

(assert (= (and b!802522 res!547045) b!802527))

(assert (= (and b!802527 res!547040) b!802526))

(assert (= (and b!802526 res!547036) b!802520))

(assert (= (and b!802520 res!547041) b!802517))

(assert (= (and b!802517 res!547039) b!802524))

(assert (= (and b!802524 res!547038) b!802519))

(declare-fun m!743997 () Bool)

(assert (=> b!802527 m!743997))

(declare-fun m!743999 () Bool)

(assert (=> b!802526 m!743999))

(declare-fun m!744001 () Bool)

(assert (=> b!802517 m!744001))

(declare-fun m!744003 () Bool)

(assert (=> b!802517 m!744003))

(declare-fun m!744005 () Bool)

(assert (=> b!802517 m!744005))

(declare-fun m!744007 () Bool)

(assert (=> b!802517 m!744007))

(declare-fun m!744009 () Bool)

(assert (=> b!802519 m!744009))

(declare-fun m!744011 () Bool)

(assert (=> b!802519 m!744011))

(declare-fun m!744013 () Bool)

(assert (=> b!802519 m!744013))

(declare-fun m!744015 () Bool)

(assert (=> b!802519 m!744015))

(assert (=> b!802519 m!744009))

(declare-fun m!744017 () Bool)

(assert (=> b!802519 m!744017))

(declare-fun m!744019 () Bool)

(assert (=> b!802525 m!744019))

(declare-fun m!744021 () Bool)

(assert (=> b!802521 m!744021))

(assert (=> b!802523 m!744009))

(assert (=> b!802523 m!744009))

(declare-fun m!744023 () Bool)

(assert (=> b!802523 m!744023))

(declare-fun m!744025 () Bool)

(assert (=> b!802520 m!744025))

(declare-fun m!744027 () Bool)

(assert (=> b!802520 m!744027))

(declare-fun m!744029 () Bool)

(assert (=> start!68838 m!744029))

(declare-fun m!744031 () Bool)

(assert (=> start!68838 m!744031))

(declare-fun m!744033 () Bool)

(assert (=> b!802524 m!744033))

(assert (=> b!802524 m!744009))

(assert (=> b!802524 m!744009))

(declare-fun m!744035 () Bool)

(assert (=> b!802524 m!744035))

(assert (=> b!802524 m!744009))

(declare-fun m!744037 () Bool)

(assert (=> b!802524 m!744037))

(declare-fun m!744039 () Bool)

(assert (=> b!802522 m!744039))

(push 1)

(assert (not b!802522))

(assert (not start!68838))

(assert (not b!802521))

(assert (not b!802526))

(assert (not b!802527))

(assert (not b!802517))

(assert (not b!802525))

