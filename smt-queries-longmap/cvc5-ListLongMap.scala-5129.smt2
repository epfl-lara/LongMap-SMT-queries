; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69656 () Bool)

(assert start!69656)

(declare-fun b!811604 () Bool)

(declare-fun res!554651 () Bool)

(declare-fun e!449195 () Bool)

(assert (=> b!811604 (=> (not res!554651) (not e!449195))))

(declare-datatypes ((array!44095 0))(
  ( (array!44096 (arr!21117 (Array (_ BitVec 32) (_ BitVec 64))) (size!21538 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44095)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811604 (= res!554651 (validKeyInArray!0 (select (arr!21117 a!3170) j!153)))))

(declare-fun b!811605 () Bool)

(declare-fun res!554653 () Bool)

(assert (=> b!811605 (=> (not res!554653) (not e!449195))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!811605 (= res!554653 (and (= (size!21538 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21538 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21538 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811606 () Bool)

(declare-fun res!554649 () Bool)

(assert (=> b!811606 (=> (not res!554649) (not e!449195))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811606 (= res!554649 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811607 () Bool)

(declare-fun e!449192 () Bool)

(declare-fun e!449194 () Bool)

(assert (=> b!811607 (= e!449192 e!449194)))

(declare-fun res!554648 () Bool)

(assert (=> b!811607 (=> (not res!554648) (not e!449194))))

(declare-datatypes ((SeekEntryResult!8708 0))(
  ( (MissingZero!8708 (index!37203 (_ BitVec 32))) (Found!8708 (index!37204 (_ BitVec 32))) (Intermediate!8708 (undefined!9520 Bool) (index!37205 (_ BitVec 32)) (x!68017 (_ BitVec 32))) (Undefined!8708) (MissingVacant!8708 (index!37206 (_ BitVec 32))) )
))
(declare-fun lt!363918 () SeekEntryResult!8708)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363919 () SeekEntryResult!8708)

(assert (=> b!811607 (= res!554648 (and (= lt!363919 lt!363918) (= lt!363918 (Found!8708 j!153)) (not (= (select (arr!21117 a!3170) index!1236) (select (arr!21117 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44095 (_ BitVec 32)) SeekEntryResult!8708)

(assert (=> b!811607 (= lt!363918 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21117 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44095 (_ BitVec 32)) SeekEntryResult!8708)

(assert (=> b!811607 (= lt!363919 (seekEntryOrOpen!0 (select (arr!21117 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811608 () Bool)

(declare-fun res!554647 () Bool)

(declare-fun e!449193 () Bool)

(assert (=> b!811608 (=> (not res!554647) (not e!449193))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!811608 (= res!554647 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21538 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21117 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21538 a!3170)) (= (select (arr!21117 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811609 () Bool)

(assert (=> b!811609 (= e!449194 (not true))))

(declare-fun lt!363916 () array!44095)

(declare-fun lt!363914 () (_ BitVec 64))

(declare-fun lt!363920 () (_ BitVec 32))

(assert (=> b!811609 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363920 vacantAfter!23 lt!363914 lt!363916 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363920 vacantBefore!23 (select (arr!21117 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27678 0))(
  ( (Unit!27679) )
))
(declare-fun lt!363915 () Unit!27678)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44095 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27678)

(assert (=> b!811609 (= lt!363915 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363920 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811609 (= lt!363920 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811610 () Bool)

(declare-fun res!554652 () Bool)

(assert (=> b!811610 (=> (not res!554652) (not e!449195))))

(assert (=> b!811610 (= res!554652 (validKeyInArray!0 k!2044))))

(declare-fun b!811611 () Bool)

(declare-fun res!554657 () Bool)

(assert (=> b!811611 (=> (not res!554657) (not e!449193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44095 (_ BitVec 32)) Bool)

(assert (=> b!811611 (= res!554657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!554655 () Bool)

(assert (=> start!69656 (=> (not res!554655) (not e!449195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69656 (= res!554655 (validMask!0 mask!3266))))

(assert (=> start!69656 e!449195))

(assert (=> start!69656 true))

(declare-fun array_inv!16913 (array!44095) Bool)

(assert (=> start!69656 (array_inv!16913 a!3170)))

(declare-fun b!811612 () Bool)

(declare-fun res!554654 () Bool)

(assert (=> b!811612 (=> (not res!554654) (not e!449193))))

(declare-datatypes ((List!15080 0))(
  ( (Nil!15077) (Cons!15076 (h!16205 (_ BitVec 64)) (t!21395 List!15080)) )
))
(declare-fun arrayNoDuplicates!0 (array!44095 (_ BitVec 32) List!15080) Bool)

(assert (=> b!811612 (= res!554654 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15077))))

(declare-fun b!811613 () Bool)

(assert (=> b!811613 (= e!449193 e!449192)))

(declare-fun res!554656 () Bool)

(assert (=> b!811613 (=> (not res!554656) (not e!449192))))

(assert (=> b!811613 (= res!554656 (= (seekEntryOrOpen!0 lt!363914 lt!363916 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363914 lt!363916 mask!3266)))))

(assert (=> b!811613 (= lt!363914 (select (store (arr!21117 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811613 (= lt!363916 (array!44096 (store (arr!21117 a!3170) i!1163 k!2044) (size!21538 a!3170)))))

(declare-fun b!811614 () Bool)

(assert (=> b!811614 (= e!449195 e!449193)))

(declare-fun res!554650 () Bool)

(assert (=> b!811614 (=> (not res!554650) (not e!449193))))

(declare-fun lt!363917 () SeekEntryResult!8708)

(assert (=> b!811614 (= res!554650 (or (= lt!363917 (MissingZero!8708 i!1163)) (= lt!363917 (MissingVacant!8708 i!1163))))))

(assert (=> b!811614 (= lt!363917 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69656 res!554655) b!811605))

(assert (= (and b!811605 res!554653) b!811604))

(assert (= (and b!811604 res!554651) b!811610))

(assert (= (and b!811610 res!554652) b!811606))

(assert (= (and b!811606 res!554649) b!811614))

(assert (= (and b!811614 res!554650) b!811611))

(assert (= (and b!811611 res!554657) b!811612))

(assert (= (and b!811612 res!554654) b!811608))

(assert (= (and b!811608 res!554647) b!811613))

(assert (= (and b!811613 res!554656) b!811607))

(assert (= (and b!811607 res!554648) b!811609))

(declare-fun m!754007 () Bool)

(assert (=> b!811608 m!754007))

(declare-fun m!754009 () Bool)

(assert (=> b!811608 m!754009))

(declare-fun m!754011 () Bool)

(assert (=> b!811604 m!754011))

(assert (=> b!811604 m!754011))

(declare-fun m!754013 () Bool)

(assert (=> b!811604 m!754013))

(declare-fun m!754015 () Bool)

(assert (=> b!811612 m!754015))

(declare-fun m!754017 () Bool)

(assert (=> b!811610 m!754017))

(declare-fun m!754019 () Bool)

(assert (=> b!811607 m!754019))

(assert (=> b!811607 m!754011))

(assert (=> b!811607 m!754011))

(declare-fun m!754021 () Bool)

(assert (=> b!811607 m!754021))

(assert (=> b!811607 m!754011))

(declare-fun m!754023 () Bool)

(assert (=> b!811607 m!754023))

(declare-fun m!754025 () Bool)

(assert (=> b!811611 m!754025))

(declare-fun m!754027 () Bool)

(assert (=> start!69656 m!754027))

(declare-fun m!754029 () Bool)

(assert (=> start!69656 m!754029))

(declare-fun m!754031 () Bool)

(assert (=> b!811613 m!754031))

(declare-fun m!754033 () Bool)

(assert (=> b!811613 m!754033))

(declare-fun m!754035 () Bool)

(assert (=> b!811613 m!754035))

(declare-fun m!754037 () Bool)

(assert (=> b!811613 m!754037))

(declare-fun m!754039 () Bool)

(assert (=> b!811614 m!754039))

(assert (=> b!811609 m!754011))

(declare-fun m!754041 () Bool)

(assert (=> b!811609 m!754041))

(declare-fun m!754043 () Bool)

(assert (=> b!811609 m!754043))

(assert (=> b!811609 m!754011))

(declare-fun m!754045 () Bool)

(assert (=> b!811609 m!754045))

(declare-fun m!754047 () Bool)

(assert (=> b!811609 m!754047))

(declare-fun m!754049 () Bool)

(assert (=> b!811606 m!754049))

(push 1)

