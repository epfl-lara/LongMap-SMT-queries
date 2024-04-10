; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68738 () Bool)

(assert start!68738)

(declare-fun b!800718 () Bool)

(declare-fun res!545239 () Bool)

(declare-fun e!443924 () Bool)

(assert (=> b!800718 (=> (not res!545239) (not e!443924))))

(declare-datatypes ((array!43528 0))(
  ( (array!43529 (arr!20844 (Array (_ BitVec 32) (_ BitVec 64))) (size!21265 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43528)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43528 (_ BitVec 32)) Bool)

(assert (=> b!800718 (= res!545239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800719 () Bool)

(declare-fun e!443920 () Bool)

(assert (=> b!800719 (= e!443924 e!443920)))

(declare-fun res!545246 () Bool)

(assert (=> b!800719 (=> (not res!545246) (not e!443920))))

(declare-datatypes ((SeekEntryResult!8435 0))(
  ( (MissingZero!8435 (index!36108 (_ BitVec 32))) (Found!8435 (index!36109 (_ BitVec 32))) (Intermediate!8435 (undefined!9247 Bool) (index!36110 (_ BitVec 32)) (x!66977 (_ BitVec 32))) (Undefined!8435) (MissingVacant!8435 (index!36111 (_ BitVec 32))) )
))
(declare-fun lt!357783 () SeekEntryResult!8435)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357779 () array!43528)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!357784 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43528 (_ BitVec 32)) SeekEntryResult!8435)

(assert (=> b!800719 (= res!545246 (= lt!357783 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357784 lt!357779 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43528 (_ BitVec 32)) SeekEntryResult!8435)

(assert (=> b!800719 (= lt!357783 (seekEntryOrOpen!0 lt!357784 lt!357779 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800719 (= lt!357784 (select (store (arr!20844 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800719 (= lt!357779 (array!43529 (store (arr!20844 a!3170) i!1163 k!2044) (size!21265 a!3170)))))

(declare-fun b!800720 () Bool)

(declare-fun e!443919 () Bool)

(assert (=> b!800720 (= e!443919 false)))

(declare-fun lt!357780 () SeekEntryResult!8435)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!357785 () (_ BitVec 32))

(assert (=> b!800720 (= lt!357780 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357785 vacantBefore!23 (select (arr!20844 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800721 () Bool)

(declare-fun e!443922 () Bool)

(assert (=> b!800721 (= e!443922 e!443924)))

(declare-fun res!545244 () Bool)

(assert (=> b!800721 (=> (not res!545244) (not e!443924))))

(declare-fun lt!357782 () SeekEntryResult!8435)

(assert (=> b!800721 (= res!545244 (or (= lt!357782 (MissingZero!8435 i!1163)) (= lt!357782 (MissingVacant!8435 i!1163))))))

(assert (=> b!800721 (= lt!357782 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800722 () Bool)

(declare-fun e!443921 () Bool)

(assert (=> b!800722 (= e!443921 e!443919)))

(declare-fun res!545249 () Bool)

(assert (=> b!800722 (=> (not res!545249) (not e!443919))))

(assert (=> b!800722 (= res!545249 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357785 #b00000000000000000000000000000000) (bvslt lt!357785 (size!21265 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800722 (= lt!357785 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!545241 () Bool)

(assert (=> start!68738 (=> (not res!545241) (not e!443922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68738 (= res!545241 (validMask!0 mask!3266))))

(assert (=> start!68738 e!443922))

(assert (=> start!68738 true))

(declare-fun array_inv!16640 (array!43528) Bool)

(assert (=> start!68738 (array_inv!16640 a!3170)))

(declare-fun b!800723 () Bool)

(assert (=> b!800723 (= e!443920 e!443921)))

(declare-fun res!545240 () Bool)

(assert (=> b!800723 (=> (not res!545240) (not e!443921))))

(declare-fun lt!357781 () SeekEntryResult!8435)

(declare-fun lt!357778 () SeekEntryResult!8435)

(assert (=> b!800723 (= res!545240 (and (= lt!357781 lt!357778) (= lt!357778 (Found!8435 j!153)) (not (= (select (arr!20844 a!3170) index!1236) (select (arr!20844 a!3170) j!153)))))))

(assert (=> b!800723 (= lt!357778 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20844 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800723 (= lt!357781 (seekEntryOrOpen!0 (select (arr!20844 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800724 () Bool)

(declare-fun res!545238 () Bool)

(assert (=> b!800724 (=> (not res!545238) (not e!443922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800724 (= res!545238 (validKeyInArray!0 (select (arr!20844 a!3170) j!153)))))

(declare-fun b!800725 () Bool)

(declare-fun res!545237 () Bool)

(assert (=> b!800725 (=> (not res!545237) (not e!443922))))

(assert (=> b!800725 (= res!545237 (and (= (size!21265 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21265 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21265 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800726 () Bool)

(declare-fun res!545247 () Bool)

(assert (=> b!800726 (=> (not res!545247) (not e!443924))))

(assert (=> b!800726 (= res!545247 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21265 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20844 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21265 a!3170)) (= (select (arr!20844 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800727 () Bool)

(declare-fun res!545248 () Bool)

(assert (=> b!800727 (=> (not res!545248) (not e!443924))))

(declare-datatypes ((List!14807 0))(
  ( (Nil!14804) (Cons!14803 (h!15932 (_ BitVec 64)) (t!21122 List!14807)) )
))
(declare-fun arrayNoDuplicates!0 (array!43528 (_ BitVec 32) List!14807) Bool)

(assert (=> b!800727 (= res!545248 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14804))))

(declare-fun b!800728 () Bool)

(declare-fun res!545245 () Bool)

(assert (=> b!800728 (=> (not res!545245) (not e!443922))))

(assert (=> b!800728 (= res!545245 (validKeyInArray!0 k!2044))))

(declare-fun b!800729 () Bool)

(declare-fun res!545242 () Bool)

(assert (=> b!800729 (=> (not res!545242) (not e!443919))))

(assert (=> b!800729 (= res!545242 (= lt!357783 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357785 vacantAfter!23 lt!357784 lt!357779 mask!3266)))))

(declare-fun b!800730 () Bool)

(declare-fun res!545243 () Bool)

(assert (=> b!800730 (=> (not res!545243) (not e!443922))))

(declare-fun arrayContainsKey!0 (array!43528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800730 (= res!545243 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68738 res!545241) b!800725))

(assert (= (and b!800725 res!545237) b!800724))

(assert (= (and b!800724 res!545238) b!800728))

(assert (= (and b!800728 res!545245) b!800730))

(assert (= (and b!800730 res!545243) b!800721))

(assert (= (and b!800721 res!545244) b!800718))

(assert (= (and b!800718 res!545239) b!800727))

(assert (= (and b!800727 res!545248) b!800726))

(assert (= (and b!800726 res!545247) b!800719))

(assert (= (and b!800719 res!545246) b!800723))

(assert (= (and b!800723 res!545240) b!800722))

(assert (= (and b!800722 res!545249) b!800729))

(assert (= (and b!800729 res!545242) b!800720))

(declare-fun m!741827 () Bool)

(assert (=> b!800724 m!741827))

(assert (=> b!800724 m!741827))

(declare-fun m!741829 () Bool)

(assert (=> b!800724 m!741829))

(declare-fun m!741831 () Bool)

(assert (=> start!68738 m!741831))

(declare-fun m!741833 () Bool)

(assert (=> start!68738 m!741833))

(declare-fun m!741835 () Bool)

(assert (=> b!800728 m!741835))

(declare-fun m!741837 () Bool)

(assert (=> b!800726 m!741837))

(declare-fun m!741839 () Bool)

(assert (=> b!800726 m!741839))

(declare-fun m!741841 () Bool)

(assert (=> b!800730 m!741841))

(declare-fun m!741843 () Bool)

(assert (=> b!800723 m!741843))

(assert (=> b!800723 m!741827))

(assert (=> b!800723 m!741827))

(declare-fun m!741845 () Bool)

(assert (=> b!800723 m!741845))

(assert (=> b!800723 m!741827))

(declare-fun m!741847 () Bool)

(assert (=> b!800723 m!741847))

(declare-fun m!741849 () Bool)

(assert (=> b!800729 m!741849))

(declare-fun m!741851 () Bool)

(assert (=> b!800722 m!741851))

(assert (=> b!800720 m!741827))

(assert (=> b!800720 m!741827))

(declare-fun m!741853 () Bool)

(assert (=> b!800720 m!741853))

(declare-fun m!741855 () Bool)

(assert (=> b!800727 m!741855))

(declare-fun m!741857 () Bool)

(assert (=> b!800719 m!741857))

(declare-fun m!741859 () Bool)

(assert (=> b!800719 m!741859))

(declare-fun m!741861 () Bool)

(assert (=> b!800719 m!741861))

(declare-fun m!741863 () Bool)

(assert (=> b!800719 m!741863))

(declare-fun m!741865 () Bool)

(assert (=> b!800721 m!741865))

(declare-fun m!741867 () Bool)

(assert (=> b!800718 m!741867))

(push 1)

