; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68328 () Bool)

(assert start!68328)

(declare-fun b!793865 () Bool)

(declare-fun e!440845 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793865 (= e!440845 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793866 () Bool)

(declare-fun res!538532 () Bool)

(declare-fun e!440847 () Bool)

(assert (=> b!793866 (=> (not res!538532) (not e!440847))))

(declare-datatypes ((array!43135 0))(
  ( (array!43136 (arr!20648 (Array (_ BitVec 32) (_ BitVec 64))) (size!21069 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43135)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43135 (_ BitVec 32)) Bool)

(assert (=> b!793866 (= res!538532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793867 () Bool)

(declare-fun res!538529 () Bool)

(declare-fun e!440846 () Bool)

(assert (=> b!793867 (=> (not res!538529) (not e!440846))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793867 (= res!538529 (validKeyInArray!0 k0!2044))))

(declare-fun b!793868 () Bool)

(declare-fun res!538524 () Bool)

(assert (=> b!793868 (=> (not res!538524) (not e!440846))))

(declare-fun arrayContainsKey!0 (array!43135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793868 (= res!538524 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793869 () Bool)

(declare-fun res!538531 () Bool)

(assert (=> b!793869 (=> (not res!538531) (not e!440846))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793869 (= res!538531 (and (= (size!21069 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21069 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21069 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793870 () Bool)

(declare-fun res!538533 () Bool)

(assert (=> b!793870 (=> (not res!538533) (not e!440846))))

(assert (=> b!793870 (= res!538533 (validKeyInArray!0 (select (arr!20648 a!3170) j!153)))))

(declare-fun b!793871 () Bool)

(assert (=> b!793871 (= e!440847 e!440845)))

(declare-fun res!538528 () Bool)

(assert (=> b!793871 (=> (not res!538528) (not e!440845))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!353757 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353758 () array!43135)

(declare-datatypes ((SeekEntryResult!8236 0))(
  ( (MissingZero!8236 (index!35312 (_ BitVec 32))) (Found!8236 (index!35313 (_ BitVec 32))) (Intermediate!8236 (undefined!9048 Bool) (index!35314 (_ BitVec 32)) (x!66253 (_ BitVec 32))) (Undefined!8236) (MissingVacant!8236 (index!35315 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43135 (_ BitVec 32)) SeekEntryResult!8236)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43135 (_ BitVec 32)) SeekEntryResult!8236)

(assert (=> b!793871 (= res!538528 (= (seekEntryOrOpen!0 lt!353757 lt!353758 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353757 lt!353758 mask!3266)))))

(assert (=> b!793871 (= lt!353757 (select (store (arr!20648 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793871 (= lt!353758 (array!43136 (store (arr!20648 a!3170) i!1163 k0!2044) (size!21069 a!3170)))))

(declare-fun res!538525 () Bool)

(assert (=> start!68328 (=> (not res!538525) (not e!440846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68328 (= res!538525 (validMask!0 mask!3266))))

(assert (=> start!68328 e!440846))

(assert (=> start!68328 true))

(declare-fun array_inv!16531 (array!43135) Bool)

(assert (=> start!68328 (array_inv!16531 a!3170)))

(declare-fun b!793872 () Bool)

(declare-fun res!538527 () Bool)

(assert (=> b!793872 (=> (not res!538527) (not e!440847))))

(declare-datatypes ((List!14650 0))(
  ( (Nil!14647) (Cons!14646 (h!15775 (_ BitVec 64)) (t!20956 List!14650)) )
))
(declare-fun arrayNoDuplicates!0 (array!43135 (_ BitVec 32) List!14650) Bool)

(assert (=> b!793872 (= res!538527 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14647))))

(declare-fun b!793873 () Bool)

(assert (=> b!793873 (= e!440846 e!440847)))

(declare-fun res!538526 () Bool)

(assert (=> b!793873 (=> (not res!538526) (not e!440847))))

(declare-fun lt!353759 () SeekEntryResult!8236)

(assert (=> b!793873 (= res!538526 (or (= lt!353759 (MissingZero!8236 i!1163)) (= lt!353759 (MissingVacant!8236 i!1163))))))

(assert (=> b!793873 (= lt!353759 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793874 () Bool)

(declare-fun res!538530 () Bool)

(assert (=> b!793874 (=> (not res!538530) (not e!440847))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793874 (= res!538530 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21069 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20648 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21069 a!3170)) (= (select (arr!20648 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68328 res!538525) b!793869))

(assert (= (and b!793869 res!538531) b!793870))

(assert (= (and b!793870 res!538533) b!793867))

(assert (= (and b!793867 res!538529) b!793868))

(assert (= (and b!793868 res!538524) b!793873))

(assert (= (and b!793873 res!538526) b!793866))

(assert (= (and b!793866 res!538532) b!793872))

(assert (= (and b!793872 res!538527) b!793874))

(assert (= (and b!793874 res!538530) b!793871))

(assert (= (and b!793871 res!538528) b!793865))

(declare-fun m!733891 () Bool)

(assert (=> b!793866 m!733891))

(declare-fun m!733893 () Bool)

(assert (=> b!793867 m!733893))

(declare-fun m!733895 () Bool)

(assert (=> b!793870 m!733895))

(assert (=> b!793870 m!733895))

(declare-fun m!733897 () Bool)

(assert (=> b!793870 m!733897))

(declare-fun m!733899 () Bool)

(assert (=> b!793874 m!733899))

(declare-fun m!733901 () Bool)

(assert (=> b!793874 m!733901))

(declare-fun m!733903 () Bool)

(assert (=> b!793871 m!733903))

(declare-fun m!733905 () Bool)

(assert (=> b!793871 m!733905))

(declare-fun m!733907 () Bool)

(assert (=> b!793871 m!733907))

(declare-fun m!733909 () Bool)

(assert (=> b!793871 m!733909))

(declare-fun m!733911 () Bool)

(assert (=> b!793873 m!733911))

(declare-fun m!733913 () Bool)

(assert (=> b!793872 m!733913))

(declare-fun m!733915 () Bool)

(assert (=> b!793868 m!733915))

(declare-fun m!733917 () Bool)

(assert (=> start!68328 m!733917))

(declare-fun m!733919 () Bool)

(assert (=> start!68328 m!733919))

(check-sat (not b!793870) (not b!793872) (not start!68328) (not b!793868) (not b!793871) (not b!793866) (not b!793873) (not b!793867))
(check-sat)
