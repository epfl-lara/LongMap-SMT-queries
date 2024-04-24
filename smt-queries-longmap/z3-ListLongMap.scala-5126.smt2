; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69806 () Bool)

(assert start!69806)

(declare-fun b!812195 () Bool)

(declare-fun e!449628 () Bool)

(declare-fun e!449629 () Bool)

(assert (=> b!812195 (= e!449628 e!449629)))

(declare-fun res!554691 () Bool)

(assert (=> b!812195 (=> (not res!554691) (not e!449629))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!364088 () (_ BitVec 64))

(declare-datatypes ((array!44077 0))(
  ( (array!44078 (arr!21103 (Array (_ BitVec 32) (_ BitVec 64))) (size!21523 (_ BitVec 32))) )
))
(declare-fun lt!364086 () array!44077)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8650 0))(
  ( (MissingZero!8650 (index!36971 (_ BitVec 32))) (Found!8650 (index!36972 (_ BitVec 32))) (Intermediate!8650 (undefined!9462 Bool) (index!36973 (_ BitVec 32)) (x!67949 (_ BitVec 32))) (Undefined!8650) (MissingVacant!8650 (index!36974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44077 (_ BitVec 32)) SeekEntryResult!8650)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44077 (_ BitVec 32)) SeekEntryResult!8650)

(assert (=> b!812195 (= res!554691 (= (seekEntryOrOpen!0 lt!364088 lt!364086 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!364088 lt!364086 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!44077)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!812195 (= lt!364088 (select (store (arr!21103 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!812195 (= lt!364086 (array!44078 (store (arr!21103 a!3170) i!1163 k0!2044) (size!21523 a!3170)))))

(declare-fun res!554690 () Bool)

(declare-fun e!449632 () Bool)

(assert (=> start!69806 (=> (not res!554690) (not e!449632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69806 (= res!554690 (validMask!0 mask!3266))))

(assert (=> start!69806 e!449632))

(assert (=> start!69806 true))

(declare-fun array_inv!16962 (array!44077) Bool)

(assert (=> start!69806 (array_inv!16962 a!3170)))

(declare-fun b!812196 () Bool)

(declare-fun res!554695 () Bool)

(assert (=> b!812196 (=> (not res!554695) (not e!449632))))

(declare-fun arrayContainsKey!0 (array!44077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812196 (= res!554695 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!812197 () Bool)

(declare-fun res!554697 () Bool)

(assert (=> b!812197 (=> (not res!554697) (not e!449632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812197 (= res!554697 (validKeyInArray!0 (select (arr!21103 a!3170) j!153)))))

(declare-fun b!812198 () Bool)

(declare-fun res!554698 () Bool)

(assert (=> b!812198 (=> (not res!554698) (not e!449628))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!812198 (= res!554698 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21523 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21103 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21523 a!3170)) (= (select (arr!21103 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!812199 () Bool)

(assert (=> b!812199 (= e!449632 e!449628)))

(declare-fun res!554693 () Bool)

(assert (=> b!812199 (=> (not res!554693) (not e!449628))))

(declare-fun lt!364085 () SeekEntryResult!8650)

(assert (=> b!812199 (= res!554693 (or (= lt!364085 (MissingZero!8650 i!1163)) (= lt!364085 (MissingVacant!8650 i!1163))))))

(assert (=> b!812199 (= lt!364085 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!812200 () Bool)

(declare-fun res!554699 () Bool)

(assert (=> b!812200 (=> (not res!554699) (not e!449628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44077 (_ BitVec 32)) Bool)

(assert (=> b!812200 (= res!554699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!812201 () Bool)

(declare-fun res!554700 () Bool)

(assert (=> b!812201 (=> (not res!554700) (not e!449632))))

(assert (=> b!812201 (= res!554700 (validKeyInArray!0 k0!2044))))

(declare-fun b!812202 () Bool)

(declare-fun res!554694 () Bool)

(assert (=> b!812202 (=> (not res!554694) (not e!449632))))

(assert (=> b!812202 (= res!554694 (and (= (size!21523 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21523 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21523 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!812203 () Bool)

(declare-fun res!554696 () Bool)

(assert (=> b!812203 (=> (not res!554696) (not e!449628))))

(declare-datatypes ((List!14973 0))(
  ( (Nil!14970) (Cons!14969 (h!16104 (_ BitVec 64)) (t!21280 List!14973)) )
))
(declare-fun arrayNoDuplicates!0 (array!44077 (_ BitVec 32) List!14973) Bool)

(assert (=> b!812203 (= res!554696 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14970))))

(declare-fun b!812204 () Bool)

(declare-fun e!449630 () Bool)

(assert (=> b!812204 (= e!449629 e!449630)))

(declare-fun res!554692 () Bool)

(assert (=> b!812204 (=> (not res!554692) (not e!449630))))

(declare-fun lt!364084 () SeekEntryResult!8650)

(declare-fun lt!364082 () SeekEntryResult!8650)

(assert (=> b!812204 (= res!554692 (and (= lt!364082 lt!364084) (= lt!364084 (Found!8650 j!153)) (not (= (select (arr!21103 a!3170) index!1236) (select (arr!21103 a!3170) j!153)))))))

(assert (=> b!812204 (= lt!364084 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21103 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!812204 (= lt!364082 (seekEntryOrOpen!0 (select (arr!21103 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!812205 () Bool)

(assert (=> b!812205 (= e!449630 (not true))))

(declare-fun lt!364087 () (_ BitVec 32))

(assert (=> b!812205 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364087 vacantAfter!23 lt!364088 lt!364086 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364087 vacantBefore!23 (select (arr!21103 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27645 0))(
  ( (Unit!27646) )
))
(declare-fun lt!364083 () Unit!27645)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44077 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27645)

(assert (=> b!812205 (= lt!364083 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!364087 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!812205 (= lt!364087 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (= (and start!69806 res!554690) b!812202))

(assert (= (and b!812202 res!554694) b!812197))

(assert (= (and b!812197 res!554697) b!812201))

(assert (= (and b!812201 res!554700) b!812196))

(assert (= (and b!812196 res!554695) b!812199))

(assert (= (and b!812199 res!554693) b!812200))

(assert (= (and b!812200 res!554699) b!812203))

(assert (= (and b!812203 res!554696) b!812198))

(assert (= (and b!812198 res!554698) b!812195))

(assert (= (and b!812195 res!554691) b!812204))

(assert (= (and b!812204 res!554692) b!812205))

(declare-fun m!754897 () Bool)

(assert (=> b!812203 m!754897))

(declare-fun m!754899 () Bool)

(assert (=> b!812201 m!754899))

(declare-fun m!754901 () Bool)

(assert (=> start!69806 m!754901))

(declare-fun m!754903 () Bool)

(assert (=> start!69806 m!754903))

(declare-fun m!754905 () Bool)

(assert (=> b!812198 m!754905))

(declare-fun m!754907 () Bool)

(assert (=> b!812198 m!754907))

(declare-fun m!754909 () Bool)

(assert (=> b!812196 m!754909))

(declare-fun m!754911 () Bool)

(assert (=> b!812204 m!754911))

(declare-fun m!754913 () Bool)

(assert (=> b!812204 m!754913))

(assert (=> b!812204 m!754913))

(declare-fun m!754915 () Bool)

(assert (=> b!812204 m!754915))

(assert (=> b!812204 m!754913))

(declare-fun m!754917 () Bool)

(assert (=> b!812204 m!754917))

(declare-fun m!754919 () Bool)

(assert (=> b!812195 m!754919))

(declare-fun m!754921 () Bool)

(assert (=> b!812195 m!754921))

(declare-fun m!754923 () Bool)

(assert (=> b!812195 m!754923))

(declare-fun m!754925 () Bool)

(assert (=> b!812195 m!754925))

(declare-fun m!754927 () Bool)

(assert (=> b!812200 m!754927))

(declare-fun m!754929 () Bool)

(assert (=> b!812199 m!754929))

(assert (=> b!812205 m!754913))

(declare-fun m!754931 () Bool)

(assert (=> b!812205 m!754931))

(declare-fun m!754933 () Bool)

(assert (=> b!812205 m!754933))

(declare-fun m!754935 () Bool)

(assert (=> b!812205 m!754935))

(assert (=> b!812205 m!754913))

(declare-fun m!754937 () Bool)

(assert (=> b!812205 m!754937))

(assert (=> b!812197 m!754913))

(assert (=> b!812197 m!754913))

(declare-fun m!754939 () Bool)

(assert (=> b!812197 m!754939))

(check-sat (not b!812203) (not b!812200) (not b!812195) (not b!812201) (not b!812199) (not b!812196) (not b!812204) (not b!812205) (not b!812197) (not start!69806))
(check-sat)
