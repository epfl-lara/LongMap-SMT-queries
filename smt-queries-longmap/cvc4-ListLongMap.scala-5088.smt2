; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69090 () Bool)

(assert start!69090)

(declare-fun b!805838 () Bool)

(declare-fun res!550167 () Bool)

(declare-fun e!446270 () Bool)

(assert (=> b!805838 (=> (not res!550167) (not e!446270))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43835 0))(
  ( (array!43836 (arr!20996 (Array (_ BitVec 32) (_ BitVec 64))) (size!21417 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43835)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805838 (= res!550167 (and (= (size!21417 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21417 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21417 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805839 () Bool)

(declare-fun e!446272 () Bool)

(declare-fun e!446269 () Bool)

(assert (=> b!805839 (= e!446272 e!446269)))

(declare-fun res!550159 () Bool)

(assert (=> b!805839 (=> (not res!550159) (not e!446269))))

(declare-datatypes ((SeekEntryResult!8587 0))(
  ( (MissingZero!8587 (index!36716 (_ BitVec 32))) (Found!8587 (index!36717 (_ BitVec 32))) (Intermediate!8587 (undefined!9399 Bool) (index!36718 (_ BitVec 32)) (x!67532 (_ BitVec 32))) (Undefined!8587) (MissingVacant!8587 (index!36719 (_ BitVec 32))) )
))
(declare-fun lt!360827 () SeekEntryResult!8587)

(declare-fun lt!360822 () SeekEntryResult!8587)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805839 (= res!550159 (and (= lt!360822 lt!360827) (= lt!360827 (Found!8587 j!153)) (= (select (arr!20996 a!3170) index!1236) (select (arr!20996 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43835 (_ BitVec 32)) SeekEntryResult!8587)

(assert (=> b!805839 (= lt!360827 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20996 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43835 (_ BitVec 32)) SeekEntryResult!8587)

(assert (=> b!805839 (= lt!360822 (seekEntryOrOpen!0 (select (arr!20996 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805840 () Bool)

(declare-fun res!550164 () Bool)

(declare-fun e!446273 () Bool)

(assert (=> b!805840 (=> (not res!550164) (not e!446273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43835 (_ BitVec 32)) Bool)

(assert (=> b!805840 (= res!550164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805841 () Bool)

(declare-fun res!550160 () Bool)

(assert (=> b!805841 (=> (not res!550160) (not e!446270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805841 (= res!550160 (validKeyInArray!0 (select (arr!20996 a!3170) j!153)))))

(declare-fun b!805842 () Bool)

(declare-fun res!550161 () Bool)

(assert (=> b!805842 (=> (not res!550161) (not e!446273))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!805842 (= res!550161 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21417 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20996 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21417 a!3170)) (= (select (arr!20996 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805843 () Bool)

(declare-fun res!550169 () Bool)

(assert (=> b!805843 (=> (not res!550169) (not e!446273))))

(declare-datatypes ((List!14959 0))(
  ( (Nil!14956) (Cons!14955 (h!16084 (_ BitVec 64)) (t!21274 List!14959)) )
))
(declare-fun arrayNoDuplicates!0 (array!43835 (_ BitVec 32) List!14959) Bool)

(assert (=> b!805843 (= res!550169 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14956))))

(declare-fun b!805844 () Bool)

(assert (=> b!805844 (= e!446270 e!446273)))

(declare-fun res!550165 () Bool)

(assert (=> b!805844 (=> (not res!550165) (not e!446273))))

(declare-fun lt!360821 () SeekEntryResult!8587)

(assert (=> b!805844 (= res!550165 (or (= lt!360821 (MissingZero!8587 i!1163)) (= lt!360821 (MissingVacant!8587 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!805844 (= lt!360821 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805846 () Bool)

(declare-fun res!550166 () Bool)

(assert (=> b!805846 (=> (not res!550166) (not e!446270))))

(declare-fun arrayContainsKey!0 (array!43835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805846 (= res!550166 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805847 () Bool)

(assert (=> b!805847 (= e!446273 e!446272)))

(declare-fun res!550162 () Bool)

(assert (=> b!805847 (=> (not res!550162) (not e!446272))))

(declare-fun lt!360825 () SeekEntryResult!8587)

(declare-fun lt!360824 () SeekEntryResult!8587)

(assert (=> b!805847 (= res!550162 (= lt!360825 lt!360824))))

(declare-fun lt!360823 () (_ BitVec 64))

(declare-fun lt!360826 () array!43835)

(assert (=> b!805847 (= lt!360824 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360823 lt!360826 mask!3266))))

(assert (=> b!805847 (= lt!360825 (seekEntryOrOpen!0 lt!360823 lt!360826 mask!3266))))

(assert (=> b!805847 (= lt!360823 (select (store (arr!20996 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805847 (= lt!360826 (array!43836 (store (arr!20996 a!3170) i!1163 k!2044) (size!21417 a!3170)))))

(declare-fun b!805848 () Bool)

(declare-fun res!550163 () Bool)

(assert (=> b!805848 (=> (not res!550163) (not e!446270))))

(assert (=> b!805848 (= res!550163 (validKeyInArray!0 k!2044))))

(declare-fun b!805845 () Bool)

(assert (=> b!805845 (= e!446269 (not true))))

(assert (=> b!805845 (= lt!360824 (Found!8587 index!1236))))

(declare-fun res!550168 () Bool)

(assert (=> start!69090 (=> (not res!550168) (not e!446270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69090 (= res!550168 (validMask!0 mask!3266))))

(assert (=> start!69090 e!446270))

(assert (=> start!69090 true))

(declare-fun array_inv!16792 (array!43835) Bool)

(assert (=> start!69090 (array_inv!16792 a!3170)))

(assert (= (and start!69090 res!550168) b!805838))

(assert (= (and b!805838 res!550167) b!805841))

(assert (= (and b!805841 res!550160) b!805848))

(assert (= (and b!805848 res!550163) b!805846))

(assert (= (and b!805846 res!550166) b!805844))

(assert (= (and b!805844 res!550165) b!805840))

(assert (= (and b!805840 res!550164) b!805843))

(assert (= (and b!805843 res!550169) b!805842))

(assert (= (and b!805842 res!550161) b!805847))

(assert (= (and b!805847 res!550162) b!805839))

(assert (= (and b!805839 res!550159) b!805845))

(declare-fun m!747773 () Bool)

(assert (=> b!805848 m!747773))

(declare-fun m!747775 () Bool)

(assert (=> b!805844 m!747775))

(declare-fun m!747777 () Bool)

(assert (=> b!805840 m!747777))

(declare-fun m!747779 () Bool)

(assert (=> b!805842 m!747779))

(declare-fun m!747781 () Bool)

(assert (=> b!805842 m!747781))

(declare-fun m!747783 () Bool)

(assert (=> b!805846 m!747783))

(declare-fun m!747785 () Bool)

(assert (=> b!805847 m!747785))

(declare-fun m!747787 () Bool)

(assert (=> b!805847 m!747787))

(declare-fun m!747789 () Bool)

(assert (=> b!805847 m!747789))

(declare-fun m!747791 () Bool)

(assert (=> b!805847 m!747791))

(declare-fun m!747793 () Bool)

(assert (=> start!69090 m!747793))

(declare-fun m!747795 () Bool)

(assert (=> start!69090 m!747795))

(declare-fun m!747797 () Bool)

(assert (=> b!805843 m!747797))

(declare-fun m!747799 () Bool)

(assert (=> b!805841 m!747799))

(assert (=> b!805841 m!747799))

(declare-fun m!747801 () Bool)

(assert (=> b!805841 m!747801))

(declare-fun m!747803 () Bool)

(assert (=> b!805839 m!747803))

(assert (=> b!805839 m!747799))

(assert (=> b!805839 m!747799))

(declare-fun m!747805 () Bool)

(assert (=> b!805839 m!747805))

(assert (=> b!805839 m!747799))

(declare-fun m!747807 () Bool)

(assert (=> b!805839 m!747807))

(push 1)

(assert (not b!805841))

(assert (not b!805846))

(assert (not start!69090))

(assert (not b!805843))

(assert (not b!805839))

(assert (not b!805844))

(assert (not b!805848))

(assert (not b!805840))

(assert (not b!805847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

