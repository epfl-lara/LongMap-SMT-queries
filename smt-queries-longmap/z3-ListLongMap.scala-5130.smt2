; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69664 () Bool)

(assert start!69664)

(declare-fun b!811741 () Bool)

(declare-fun res!554793 () Bool)

(declare-fun e!449257 () Bool)

(assert (=> b!811741 (=> (not res!554793) (not e!449257))))

(declare-datatypes ((array!44103 0))(
  ( (array!44104 (arr!21121 (Array (_ BitVec 32) (_ BitVec 64))) (size!21542 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44103)

(declare-datatypes ((List!15084 0))(
  ( (Nil!15081) (Cons!15080 (h!16209 (_ BitVec 64)) (t!21399 List!15084)) )
))
(declare-fun arrayNoDuplicates!0 (array!44103 (_ BitVec 32) List!15084) Bool)

(assert (=> b!811741 (= res!554793 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15081))))

(declare-fun b!811742 () Bool)

(declare-fun res!554787 () Bool)

(assert (=> b!811742 (=> (not res!554787) (not e!449257))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811742 (= res!554787 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21542 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21121 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21542 a!3170)) (= (select (arr!21121 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811743 () Bool)

(declare-fun res!554795 () Bool)

(declare-fun e!449261 () Bool)

(assert (=> b!811743 (=> (not res!554795) (not e!449261))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811743 (= res!554795 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811744 () Bool)

(declare-fun res!554794 () Bool)

(assert (=> b!811744 (=> (not res!554794) (not e!449261))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!811744 (= res!554794 (and (= (size!21542 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21542 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21542 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!554788 () Bool)

(assert (=> start!69664 (=> (not res!554788) (not e!449261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69664 (= res!554788 (validMask!0 mask!3266))))

(assert (=> start!69664 e!449261))

(assert (=> start!69664 true))

(declare-fun array_inv!16917 (array!44103) Bool)

(assert (=> start!69664 (array_inv!16917 a!3170)))

(declare-fun b!811745 () Bool)

(assert (=> b!811745 (= e!449261 e!449257)))

(declare-fun res!554791 () Bool)

(assert (=> b!811745 (=> (not res!554791) (not e!449257))))

(declare-datatypes ((SeekEntryResult!8712 0))(
  ( (MissingZero!8712 (index!37219 (_ BitVec 32))) (Found!8712 (index!37220 (_ BitVec 32))) (Intermediate!8712 (undefined!9524 Bool) (index!37221 (_ BitVec 32)) (x!68029 (_ BitVec 32))) (Undefined!8712) (MissingVacant!8712 (index!37222 (_ BitVec 32))) )
))
(declare-fun lt!364016 () SeekEntryResult!8712)

(assert (=> b!811745 (= res!554791 (or (= lt!364016 (MissingZero!8712 i!1163)) (= lt!364016 (MissingVacant!8712 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44103 (_ BitVec 32)) SeekEntryResult!8712)

(assert (=> b!811745 (= lt!364016 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811746 () Bool)

(declare-fun res!554784 () Bool)

(assert (=> b!811746 (=> (not res!554784) (not e!449261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811746 (= res!554784 (validKeyInArray!0 k0!2044))))

(declare-fun b!811747 () Bool)

(declare-fun res!554785 () Bool)

(assert (=> b!811747 (=> (not res!554785) (not e!449257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44103 (_ BitVec 32)) Bool)

(assert (=> b!811747 (= res!554785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811748 () Bool)

(declare-fun e!449258 () Bool)

(declare-fun e!449260 () Bool)

(assert (=> b!811748 (= e!449258 e!449260)))

(declare-fun res!554789 () Bool)

(assert (=> b!811748 (=> (not res!554789) (not e!449260))))

(declare-fun lt!364015 () SeekEntryResult!8712)

(declare-fun lt!364017 () SeekEntryResult!8712)

(assert (=> b!811748 (= res!554789 (and (= lt!364015 lt!364017) (not (= (select (arr!21121 a!3170) index!1236) (select (arr!21121 a!3170) j!153)))))))

(assert (=> b!811748 (= lt!364017 (Found!8712 j!153))))

(declare-fun lt!364014 () SeekEntryResult!8712)

(declare-fun b!811749 () Bool)

(assert (=> b!811749 (= e!449260 (not (or (not (= lt!364014 lt!364017)) (= lt!364014 lt!364015))))))

(declare-fun lt!364013 () (_ BitVec 64))

(declare-fun lt!364020 () array!44103)

(declare-fun lt!364022 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44103 (_ BitVec 32)) SeekEntryResult!8712)

(assert (=> b!811749 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364022 vacantAfter!23 lt!364013 lt!364020 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364022 vacantBefore!23 (select (arr!21121 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27686 0))(
  ( (Unit!27687) )
))
(declare-fun lt!364021 () Unit!27686)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44103 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27686)

(assert (=> b!811749 (= lt!364021 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!364022 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811749 (= lt!364022 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811750 () Bool)

(declare-fun res!554790 () Bool)

(assert (=> b!811750 (=> (not res!554790) (not e!449261))))

(assert (=> b!811750 (= res!554790 (validKeyInArray!0 (select (arr!21121 a!3170) j!153)))))

(declare-fun b!811751 () Bool)

(declare-fun e!449256 () Bool)

(assert (=> b!811751 (= e!449256 e!449258)))

(declare-fun res!554792 () Bool)

(assert (=> b!811751 (=> (not res!554792) (not e!449258))))

(declare-fun lt!364018 () SeekEntryResult!8712)

(assert (=> b!811751 (= res!554792 (= lt!364018 lt!364015))))

(assert (=> b!811751 (= lt!364015 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21121 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811751 (= lt!364018 (seekEntryOrOpen!0 (select (arr!21121 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811752 () Bool)

(assert (=> b!811752 (= e!449257 e!449256)))

(declare-fun res!554786 () Bool)

(assert (=> b!811752 (=> (not res!554786) (not e!449256))))

(declare-fun lt!364019 () SeekEntryResult!8712)

(assert (=> b!811752 (= res!554786 (= lt!364019 lt!364014))))

(assert (=> b!811752 (= lt!364014 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!364013 lt!364020 mask!3266))))

(assert (=> b!811752 (= lt!364019 (seekEntryOrOpen!0 lt!364013 lt!364020 mask!3266))))

(assert (=> b!811752 (= lt!364013 (select (store (arr!21121 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811752 (= lt!364020 (array!44104 (store (arr!21121 a!3170) i!1163 k0!2044) (size!21542 a!3170)))))

(assert (= (and start!69664 res!554788) b!811744))

(assert (= (and b!811744 res!554794) b!811750))

(assert (= (and b!811750 res!554790) b!811746))

(assert (= (and b!811746 res!554784) b!811743))

(assert (= (and b!811743 res!554795) b!811745))

(assert (= (and b!811745 res!554791) b!811747))

(assert (= (and b!811747 res!554785) b!811741))

(assert (= (and b!811741 res!554793) b!811742))

(assert (= (and b!811742 res!554787) b!811752))

(assert (= (and b!811752 res!554786) b!811751))

(assert (= (and b!811751 res!554792) b!811748))

(assert (= (and b!811748 res!554789) b!811749))

(declare-fun m!754183 () Bool)

(assert (=> b!811748 m!754183))

(declare-fun m!754185 () Bool)

(assert (=> b!811748 m!754185))

(declare-fun m!754187 () Bool)

(assert (=> b!811752 m!754187))

(declare-fun m!754189 () Bool)

(assert (=> b!811752 m!754189))

(declare-fun m!754191 () Bool)

(assert (=> b!811752 m!754191))

(declare-fun m!754193 () Bool)

(assert (=> b!811752 m!754193))

(declare-fun m!754195 () Bool)

(assert (=> b!811741 m!754195))

(declare-fun m!754197 () Bool)

(assert (=> b!811749 m!754197))

(assert (=> b!811749 m!754185))

(declare-fun m!754199 () Bool)

(assert (=> b!811749 m!754199))

(declare-fun m!754201 () Bool)

(assert (=> b!811749 m!754201))

(declare-fun m!754203 () Bool)

(assert (=> b!811749 m!754203))

(assert (=> b!811749 m!754185))

(declare-fun m!754205 () Bool)

(assert (=> b!811742 m!754205))

(declare-fun m!754207 () Bool)

(assert (=> b!811742 m!754207))

(declare-fun m!754209 () Bool)

(assert (=> start!69664 m!754209))

(declare-fun m!754211 () Bool)

(assert (=> start!69664 m!754211))

(declare-fun m!754213 () Bool)

(assert (=> b!811747 m!754213))

(declare-fun m!754215 () Bool)

(assert (=> b!811746 m!754215))

(declare-fun m!754217 () Bool)

(assert (=> b!811745 m!754217))

(assert (=> b!811750 m!754185))

(assert (=> b!811750 m!754185))

(declare-fun m!754219 () Bool)

(assert (=> b!811750 m!754219))

(declare-fun m!754221 () Bool)

(assert (=> b!811743 m!754221))

(assert (=> b!811751 m!754185))

(assert (=> b!811751 m!754185))

(declare-fun m!754223 () Bool)

(assert (=> b!811751 m!754223))

(assert (=> b!811751 m!754185))

(declare-fun m!754225 () Bool)

(assert (=> b!811751 m!754225))

(check-sat (not b!811752) (not b!811751) (not b!811741) (not b!811746) (not b!811747) (not b!811743) (not start!69664) (not b!811745) (not b!811750) (not b!811749))
(check-sat)
