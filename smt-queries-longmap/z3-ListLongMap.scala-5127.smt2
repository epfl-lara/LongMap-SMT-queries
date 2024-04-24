; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69812 () Bool)

(assert start!69812)

(declare-fun b!812294 () Bool)

(declare-fun e!449673 () Bool)

(declare-fun e!449677 () Bool)

(assert (=> b!812294 (= e!449673 e!449677)))

(declare-fun res!554796 () Bool)

(assert (=> b!812294 (=> (not res!554796) (not e!449677))))

(declare-datatypes ((SeekEntryResult!8653 0))(
  ( (MissingZero!8653 (index!36983 (_ BitVec 32))) (Found!8653 (index!36984 (_ BitVec 32))) (Intermediate!8653 (undefined!9465 Bool) (index!36985 (_ BitVec 32)) (x!67960 (_ BitVec 32))) (Undefined!8653) (MissingVacant!8653 (index!36986 (_ BitVec 32))) )
))
(declare-fun lt!364146 () SeekEntryResult!8653)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!812294 (= res!554796 (or (= lt!364146 (MissingZero!8653 i!1163)) (= lt!364146 (MissingVacant!8653 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!44083 0))(
  ( (array!44084 (arr!21106 (Array (_ BitVec 32) (_ BitVec 64))) (size!21526 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44083)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44083 (_ BitVec 32)) SeekEntryResult!8653)

(assert (=> b!812294 (= lt!364146 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!812295 () Bool)

(declare-fun e!449675 () Bool)

(declare-fun e!449676 () Bool)

(assert (=> b!812295 (= e!449675 e!449676)))

(declare-fun res!554797 () Bool)

(assert (=> b!812295 (=> (not res!554797) (not e!449676))))

(declare-fun lt!364145 () SeekEntryResult!8653)

(declare-fun lt!364149 () SeekEntryResult!8653)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!812295 (= res!554797 (and (= lt!364149 lt!364145) (= lt!364145 (Found!8653 j!153)) (not (= (select (arr!21106 a!3170) index!1236) (select (arr!21106 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44083 (_ BitVec 32)) SeekEntryResult!8653)

(assert (=> b!812295 (= lt!364145 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!812295 (= lt!364149 (seekEntryOrOpen!0 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!812296 () Bool)

(assert (=> b!812296 (= e!449676 (not true))))

(declare-fun lt!364150 () array!44083)

(declare-fun lt!364147 () (_ BitVec 32))

(declare-fun lt!364148 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!812296 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364147 vacantAfter!23 lt!364148 lt!364150 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364147 vacantBefore!23 (select (arr!21106 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27651 0))(
  ( (Unit!27652) )
))
(declare-fun lt!364151 () Unit!27651)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27651)

(assert (=> b!812296 (= lt!364151 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!364147 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!812296 (= lt!364147 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!812297 () Bool)

(declare-fun res!554792 () Bool)

(assert (=> b!812297 (=> (not res!554792) (not e!449673))))

(declare-fun arrayContainsKey!0 (array!44083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812297 (= res!554792 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!812299 () Bool)

(declare-fun res!554794 () Bool)

(assert (=> b!812299 (=> (not res!554794) (not e!449673))))

(assert (=> b!812299 (= res!554794 (and (= (size!21526 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21526 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21526 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!812300 () Bool)

(declare-fun res!554790 () Bool)

(assert (=> b!812300 (=> (not res!554790) (not e!449677))))

(declare-datatypes ((List!14976 0))(
  ( (Nil!14973) (Cons!14972 (h!16107 (_ BitVec 64)) (t!21283 List!14976)) )
))
(declare-fun arrayNoDuplicates!0 (array!44083 (_ BitVec 32) List!14976) Bool)

(assert (=> b!812300 (= res!554790 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14973))))

(declare-fun b!812301 () Bool)

(declare-fun res!554789 () Bool)

(assert (=> b!812301 (=> (not res!554789) (not e!449673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812301 (= res!554789 (validKeyInArray!0 (select (arr!21106 a!3170) j!153)))))

(declare-fun b!812302 () Bool)

(declare-fun res!554795 () Bool)

(assert (=> b!812302 (=> (not res!554795) (not e!449677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44083 (_ BitVec 32)) Bool)

(assert (=> b!812302 (= res!554795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!812303 () Bool)

(assert (=> b!812303 (= e!449677 e!449675)))

(declare-fun res!554798 () Bool)

(assert (=> b!812303 (=> (not res!554798) (not e!449675))))

(assert (=> b!812303 (= res!554798 (= (seekEntryOrOpen!0 lt!364148 lt!364150 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!364148 lt!364150 mask!3266)))))

(assert (=> b!812303 (= lt!364148 (select (store (arr!21106 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!812303 (= lt!364150 (array!44084 (store (arr!21106 a!3170) i!1163 k0!2044) (size!21526 a!3170)))))

(declare-fun b!812304 () Bool)

(declare-fun res!554791 () Bool)

(assert (=> b!812304 (=> (not res!554791) (not e!449673))))

(assert (=> b!812304 (= res!554791 (validKeyInArray!0 k0!2044))))

(declare-fun res!554793 () Bool)

(assert (=> start!69812 (=> (not res!554793) (not e!449673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69812 (= res!554793 (validMask!0 mask!3266))))

(assert (=> start!69812 e!449673))

(assert (=> start!69812 true))

(declare-fun array_inv!16965 (array!44083) Bool)

(assert (=> start!69812 (array_inv!16965 a!3170)))

(declare-fun b!812298 () Bool)

(declare-fun res!554799 () Bool)

(assert (=> b!812298 (=> (not res!554799) (not e!449677))))

(assert (=> b!812298 (= res!554799 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21526 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21106 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21526 a!3170)) (= (select (arr!21106 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69812 res!554793) b!812299))

(assert (= (and b!812299 res!554794) b!812301))

(assert (= (and b!812301 res!554789) b!812304))

(assert (= (and b!812304 res!554791) b!812297))

(assert (= (and b!812297 res!554792) b!812294))

(assert (= (and b!812294 res!554796) b!812302))

(assert (= (and b!812302 res!554795) b!812300))

(assert (= (and b!812300 res!554790) b!812298))

(assert (= (and b!812298 res!554799) b!812303))

(assert (= (and b!812303 res!554798) b!812295))

(assert (= (and b!812295 res!554797) b!812296))

(declare-fun m!755029 () Bool)

(assert (=> b!812300 m!755029))

(declare-fun m!755031 () Bool)

(assert (=> b!812301 m!755031))

(assert (=> b!812301 m!755031))

(declare-fun m!755033 () Bool)

(assert (=> b!812301 m!755033))

(declare-fun m!755035 () Bool)

(assert (=> b!812296 m!755035))

(assert (=> b!812296 m!755031))

(assert (=> b!812296 m!755031))

(declare-fun m!755037 () Bool)

(assert (=> b!812296 m!755037))

(declare-fun m!755039 () Bool)

(assert (=> b!812296 m!755039))

(declare-fun m!755041 () Bool)

(assert (=> b!812296 m!755041))

(declare-fun m!755043 () Bool)

(assert (=> b!812294 m!755043))

(declare-fun m!755045 () Bool)

(assert (=> b!812304 m!755045))

(declare-fun m!755047 () Bool)

(assert (=> b!812298 m!755047))

(declare-fun m!755049 () Bool)

(assert (=> b!812298 m!755049))

(declare-fun m!755051 () Bool)

(assert (=> b!812295 m!755051))

(assert (=> b!812295 m!755031))

(assert (=> b!812295 m!755031))

(declare-fun m!755053 () Bool)

(assert (=> b!812295 m!755053))

(assert (=> b!812295 m!755031))

(declare-fun m!755055 () Bool)

(assert (=> b!812295 m!755055))

(declare-fun m!755057 () Bool)

(assert (=> b!812297 m!755057))

(declare-fun m!755059 () Bool)

(assert (=> b!812303 m!755059))

(declare-fun m!755061 () Bool)

(assert (=> b!812303 m!755061))

(declare-fun m!755063 () Bool)

(assert (=> b!812303 m!755063))

(declare-fun m!755065 () Bool)

(assert (=> b!812303 m!755065))

(declare-fun m!755067 () Bool)

(assert (=> b!812302 m!755067))

(declare-fun m!755069 () Bool)

(assert (=> start!69812 m!755069))

(declare-fun m!755071 () Bool)

(assert (=> start!69812 m!755071))

(check-sat (not b!812302) (not start!69812) (not b!812295) (not b!812303) (not b!812301) (not b!812296) (not b!812297) (not b!812300) (not b!812294) (not b!812304))
(check-sat)
