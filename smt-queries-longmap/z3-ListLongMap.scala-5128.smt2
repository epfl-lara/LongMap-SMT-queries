; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69818 () Bool)

(assert start!69818)

(declare-fun b!812393 () Bool)

(declare-fun res!554892 () Bool)

(declare-fun e!449718 () Bool)

(assert (=> b!812393 (=> (not res!554892) (not e!449718))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44089 0))(
  ( (array!44090 (arr!21109 (Array (_ BitVec 32) (_ BitVec 64))) (size!21529 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44089)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!812393 (= res!554892 (and (= (size!21529 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21529 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21529 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!812394 () Bool)

(declare-fun res!554890 () Bool)

(declare-fun e!449719 () Bool)

(assert (=> b!812394 (=> (not res!554890) (not e!449719))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!812394 (= res!554890 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21529 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21109 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21529 a!3170)) (= (select (arr!21109 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!812395 () Bool)

(declare-fun e!449721 () Bool)

(declare-fun e!449720 () Bool)

(assert (=> b!812395 (= e!449721 e!449720)))

(declare-fun res!554893 () Bool)

(assert (=> b!812395 (=> (not res!554893) (not e!449720))))

(declare-datatypes ((SeekEntryResult!8656 0))(
  ( (MissingZero!8656 (index!36995 (_ BitVec 32))) (Found!8656 (index!36996 (_ BitVec 32))) (Intermediate!8656 (undefined!9468 Bool) (index!36997 (_ BitVec 32)) (x!67971 (_ BitVec 32))) (Undefined!8656) (MissingVacant!8656 (index!36998 (_ BitVec 32))) )
))
(declare-fun lt!364208 () SeekEntryResult!8656)

(declare-fun lt!364211 () SeekEntryResult!8656)

(assert (=> b!812395 (= res!554893 (and (= lt!364211 lt!364208) (= lt!364208 (Found!8656 j!153)) (not (= (select (arr!21109 a!3170) index!1236) (select (arr!21109 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44089 (_ BitVec 32)) SeekEntryResult!8656)

(assert (=> b!812395 (= lt!364208 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21109 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44089 (_ BitVec 32)) SeekEntryResult!8656)

(assert (=> b!812395 (= lt!364211 (seekEntryOrOpen!0 (select (arr!21109 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!554888 () Bool)

(assert (=> start!69818 (=> (not res!554888) (not e!449718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69818 (= res!554888 (validMask!0 mask!3266))))

(assert (=> start!69818 e!449718))

(assert (=> start!69818 true))

(declare-fun array_inv!16968 (array!44089) Bool)

(assert (=> start!69818 (array_inv!16968 a!3170)))

(declare-fun b!812396 () Bool)

(declare-fun res!554894 () Bool)

(assert (=> b!812396 (=> (not res!554894) (not e!449718))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812396 (= res!554894 (validKeyInArray!0 k0!2044))))

(declare-fun b!812397 () Bool)

(assert (=> b!812397 (= e!449720 (not true))))

(declare-fun lt!364212 () (_ BitVec 32))

(declare-fun lt!364213 () array!44089)

(declare-fun lt!364214 () (_ BitVec 64))

(assert (=> b!812397 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364212 vacantAfter!23 lt!364214 lt!364213 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364212 vacantBefore!23 (select (arr!21109 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27657 0))(
  ( (Unit!27658) )
))
(declare-fun lt!364210 () Unit!27657)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27657)

(assert (=> b!812397 (= lt!364210 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!364212 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!812397 (= lt!364212 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!812398 () Bool)

(declare-fun res!554896 () Bool)

(assert (=> b!812398 (=> (not res!554896) (not e!449718))))

(declare-fun arrayContainsKey!0 (array!44089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812398 (= res!554896 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!812399 () Bool)

(declare-fun res!554898 () Bool)

(assert (=> b!812399 (=> (not res!554898) (not e!449719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44089 (_ BitVec 32)) Bool)

(assert (=> b!812399 (= res!554898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!812400 () Bool)

(assert (=> b!812400 (= e!449718 e!449719)))

(declare-fun res!554895 () Bool)

(assert (=> b!812400 (=> (not res!554895) (not e!449719))))

(declare-fun lt!364209 () SeekEntryResult!8656)

(assert (=> b!812400 (= res!554895 (or (= lt!364209 (MissingZero!8656 i!1163)) (= lt!364209 (MissingVacant!8656 i!1163))))))

(assert (=> b!812400 (= lt!364209 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!812401 () Bool)

(assert (=> b!812401 (= e!449719 e!449721)))

(declare-fun res!554891 () Bool)

(assert (=> b!812401 (=> (not res!554891) (not e!449721))))

(assert (=> b!812401 (= res!554891 (= (seekEntryOrOpen!0 lt!364214 lt!364213 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!364214 lt!364213 mask!3266)))))

(assert (=> b!812401 (= lt!364214 (select (store (arr!21109 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!812401 (= lt!364213 (array!44090 (store (arr!21109 a!3170) i!1163 k0!2044) (size!21529 a!3170)))))

(declare-fun b!812402 () Bool)

(declare-fun res!554897 () Bool)

(assert (=> b!812402 (=> (not res!554897) (not e!449719))))

(declare-datatypes ((List!14979 0))(
  ( (Nil!14976) (Cons!14975 (h!16110 (_ BitVec 64)) (t!21286 List!14979)) )
))
(declare-fun arrayNoDuplicates!0 (array!44089 (_ BitVec 32) List!14979) Bool)

(assert (=> b!812402 (= res!554897 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14976))))

(declare-fun b!812403 () Bool)

(declare-fun res!554889 () Bool)

(assert (=> b!812403 (=> (not res!554889) (not e!449718))))

(assert (=> b!812403 (= res!554889 (validKeyInArray!0 (select (arr!21109 a!3170) j!153)))))

(assert (= (and start!69818 res!554888) b!812393))

(assert (= (and b!812393 res!554892) b!812403))

(assert (= (and b!812403 res!554889) b!812396))

(assert (= (and b!812396 res!554894) b!812398))

(assert (= (and b!812398 res!554896) b!812400))

(assert (= (and b!812400 res!554895) b!812399))

(assert (= (and b!812399 res!554898) b!812402))

(assert (= (and b!812402 res!554897) b!812394))

(assert (= (and b!812394 res!554890) b!812401))

(assert (= (and b!812401 res!554891) b!812395))

(assert (= (and b!812395 res!554893) b!812397))

(declare-fun m!755161 () Bool)

(assert (=> b!812402 m!755161))

(declare-fun m!755163 () Bool)

(assert (=> b!812396 m!755163))

(declare-fun m!755165 () Bool)

(assert (=> b!812401 m!755165))

(declare-fun m!755167 () Bool)

(assert (=> b!812401 m!755167))

(declare-fun m!755169 () Bool)

(assert (=> b!812401 m!755169))

(declare-fun m!755171 () Bool)

(assert (=> b!812401 m!755171))

(declare-fun m!755173 () Bool)

(assert (=> start!69818 m!755173))

(declare-fun m!755175 () Bool)

(assert (=> start!69818 m!755175))

(declare-fun m!755177 () Bool)

(assert (=> b!812398 m!755177))

(declare-fun m!755179 () Bool)

(assert (=> b!812400 m!755179))

(declare-fun m!755181 () Bool)

(assert (=> b!812397 m!755181))

(declare-fun m!755183 () Bool)

(assert (=> b!812397 m!755183))

(declare-fun m!755185 () Bool)

(assert (=> b!812397 m!755185))

(assert (=> b!812397 m!755183))

(declare-fun m!755187 () Bool)

(assert (=> b!812397 m!755187))

(declare-fun m!755189 () Bool)

(assert (=> b!812397 m!755189))

(declare-fun m!755191 () Bool)

(assert (=> b!812399 m!755191))

(assert (=> b!812403 m!755183))

(assert (=> b!812403 m!755183))

(declare-fun m!755193 () Bool)

(assert (=> b!812403 m!755193))

(declare-fun m!755195 () Bool)

(assert (=> b!812395 m!755195))

(assert (=> b!812395 m!755183))

(assert (=> b!812395 m!755183))

(declare-fun m!755197 () Bool)

(assert (=> b!812395 m!755197))

(assert (=> b!812395 m!755183))

(declare-fun m!755199 () Bool)

(assert (=> b!812395 m!755199))

(declare-fun m!755201 () Bool)

(assert (=> b!812394 m!755201))

(declare-fun m!755203 () Bool)

(assert (=> b!812394 m!755203))

(check-sat (not b!812398) (not b!812401) (not b!812397) (not b!812396) (not start!69818) (not b!812395) (not b!812403) (not b!812402) (not b!812400) (not b!812399))
(check-sat)
