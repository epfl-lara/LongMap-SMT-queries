; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69184 () Bool)

(assert start!69184)

(declare-fun res!551003 () Bool)

(declare-fun e!446794 () Bool)

(assert (=> start!69184 (=> (not res!551003) (not e!446794))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69184 (= res!551003 (validMask!0 mask!3266))))

(assert (=> start!69184 e!446794))

(assert (=> start!69184 true))

(declare-datatypes ((array!43884 0))(
  ( (array!43885 (arr!21019 (Array (_ BitVec 32) (_ BitVec 64))) (size!21440 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43884)

(declare-fun array_inv!16815 (array!43884) Bool)

(assert (=> start!69184 (array_inv!16815 a!3170)))

(declare-fun b!806872 () Bool)

(declare-fun res!550997 () Bool)

(declare-fun e!446792 () Bool)

(assert (=> b!806872 (=> (not res!550997) (not e!446792))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806872 (= res!550997 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21440 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21019 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21440 a!3170)) (= (select (arr!21019 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806873 () Bool)

(declare-fun e!446795 () Bool)

(declare-fun e!446791 () Bool)

(assert (=> b!806873 (= e!446795 e!446791)))

(declare-fun res!550995 () Bool)

(assert (=> b!806873 (=> (not res!550995) (not e!446791))))

(declare-datatypes ((SeekEntryResult!8610 0))(
  ( (MissingZero!8610 (index!36808 (_ BitVec 32))) (Found!8610 (index!36809 (_ BitVec 32))) (Intermediate!8610 (undefined!9422 Bool) (index!36810 (_ BitVec 32)) (x!67622 (_ BitVec 32))) (Undefined!8610) (MissingVacant!8610 (index!36811 (_ BitVec 32))) )
))
(declare-fun lt!361417 () SeekEntryResult!8610)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!361416 () SeekEntryResult!8610)

(assert (=> b!806873 (= res!550995 (and (= lt!361417 lt!361416) (= (select (arr!21019 a!3170) index!1236) (select (arr!21019 a!3170) j!153))))))

(assert (=> b!806873 (= lt!361416 (Found!8610 j!153))))

(declare-fun b!806874 () Bool)

(declare-fun e!446793 () Bool)

(assert (=> b!806874 (= e!446792 e!446793)))

(declare-fun res!550996 () Bool)

(assert (=> b!806874 (=> (not res!550996) (not e!446793))))

(declare-fun lt!361415 () SeekEntryResult!8610)

(declare-fun lt!361419 () SeekEntryResult!8610)

(assert (=> b!806874 (= res!550996 (= lt!361415 lt!361419))))

(declare-fun lt!361418 () (_ BitVec 64))

(declare-fun lt!361420 () array!43884)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43884 (_ BitVec 32)) SeekEntryResult!8610)

(assert (=> b!806874 (= lt!361419 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361418 lt!361420 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43884 (_ BitVec 32)) SeekEntryResult!8610)

(assert (=> b!806874 (= lt!361415 (seekEntryOrOpen!0 lt!361418 lt!361420 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806874 (= lt!361418 (select (store (arr!21019 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806874 (= lt!361420 (array!43885 (store (arr!21019 a!3170) i!1163 k0!2044) (size!21440 a!3170)))))

(declare-fun b!806875 () Bool)

(declare-fun res!550998 () Bool)

(assert (=> b!806875 (=> (not res!550998) (not e!446794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806875 (= res!550998 (validKeyInArray!0 (select (arr!21019 a!3170) j!153)))))

(declare-fun b!806876 () Bool)

(assert (=> b!806876 (= e!446791 (not (or (not (= lt!361419 lt!361416)) (= lt!361419 lt!361417))))))

(assert (=> b!806876 (= lt!361419 (Found!8610 index!1236))))

(declare-fun b!806877 () Bool)

(declare-fun res!551000 () Bool)

(assert (=> b!806877 (=> (not res!551000) (not e!446794))))

(assert (=> b!806877 (= res!551000 (validKeyInArray!0 k0!2044))))

(declare-fun b!806878 () Bool)

(declare-fun res!551002 () Bool)

(assert (=> b!806878 (=> (not res!551002) (not e!446794))))

(declare-fun arrayContainsKey!0 (array!43884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806878 (= res!551002 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806879 () Bool)

(declare-fun res!551001 () Bool)

(assert (=> b!806879 (=> (not res!551001) (not e!446792))))

(declare-datatypes ((List!14982 0))(
  ( (Nil!14979) (Cons!14978 (h!16107 (_ BitVec 64)) (t!21297 List!14982)) )
))
(declare-fun arrayNoDuplicates!0 (array!43884 (_ BitVec 32) List!14982) Bool)

(assert (=> b!806879 (= res!551001 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14979))))

(declare-fun b!806880 () Bool)

(assert (=> b!806880 (= e!446793 e!446795)))

(declare-fun res!551005 () Bool)

(assert (=> b!806880 (=> (not res!551005) (not e!446795))))

(declare-fun lt!361414 () SeekEntryResult!8610)

(assert (=> b!806880 (= res!551005 (= lt!361414 lt!361417))))

(assert (=> b!806880 (= lt!361417 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21019 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806880 (= lt!361414 (seekEntryOrOpen!0 (select (arr!21019 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806881 () Bool)

(assert (=> b!806881 (= e!446794 e!446792)))

(declare-fun res!551004 () Bool)

(assert (=> b!806881 (=> (not res!551004) (not e!446792))))

(declare-fun lt!361421 () SeekEntryResult!8610)

(assert (=> b!806881 (= res!551004 (or (= lt!361421 (MissingZero!8610 i!1163)) (= lt!361421 (MissingVacant!8610 i!1163))))))

(assert (=> b!806881 (= lt!361421 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806882 () Bool)

(declare-fun res!550999 () Bool)

(assert (=> b!806882 (=> (not res!550999) (not e!446792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43884 (_ BitVec 32)) Bool)

(assert (=> b!806882 (= res!550999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806883 () Bool)

(declare-fun res!551006 () Bool)

(assert (=> b!806883 (=> (not res!551006) (not e!446794))))

(assert (=> b!806883 (= res!551006 (and (= (size!21440 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21440 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21440 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69184 res!551003) b!806883))

(assert (= (and b!806883 res!551006) b!806875))

(assert (= (and b!806875 res!550998) b!806877))

(assert (= (and b!806877 res!551000) b!806878))

(assert (= (and b!806878 res!551002) b!806881))

(assert (= (and b!806881 res!551004) b!806882))

(assert (= (and b!806882 res!550999) b!806879))

(assert (= (and b!806879 res!551001) b!806872))

(assert (= (and b!806872 res!550997) b!806874))

(assert (= (and b!806874 res!550996) b!806880))

(assert (= (and b!806880 res!551005) b!806873))

(assert (= (and b!806873 res!550995) b!806876))

(declare-fun m!748829 () Bool)

(assert (=> b!806873 m!748829))

(declare-fun m!748831 () Bool)

(assert (=> b!806873 m!748831))

(declare-fun m!748833 () Bool)

(assert (=> b!806881 m!748833))

(declare-fun m!748835 () Bool)

(assert (=> start!69184 m!748835))

(declare-fun m!748837 () Bool)

(assert (=> start!69184 m!748837))

(assert (=> b!806880 m!748831))

(assert (=> b!806880 m!748831))

(declare-fun m!748839 () Bool)

(assert (=> b!806880 m!748839))

(assert (=> b!806880 m!748831))

(declare-fun m!748841 () Bool)

(assert (=> b!806880 m!748841))

(declare-fun m!748843 () Bool)

(assert (=> b!806878 m!748843))

(declare-fun m!748845 () Bool)

(assert (=> b!806872 m!748845))

(declare-fun m!748847 () Bool)

(assert (=> b!806872 m!748847))

(declare-fun m!748849 () Bool)

(assert (=> b!806882 m!748849))

(assert (=> b!806875 m!748831))

(assert (=> b!806875 m!748831))

(declare-fun m!748851 () Bool)

(assert (=> b!806875 m!748851))

(declare-fun m!748853 () Bool)

(assert (=> b!806874 m!748853))

(declare-fun m!748855 () Bool)

(assert (=> b!806874 m!748855))

(declare-fun m!748857 () Bool)

(assert (=> b!806874 m!748857))

(declare-fun m!748859 () Bool)

(assert (=> b!806874 m!748859))

(declare-fun m!748861 () Bool)

(assert (=> b!806879 m!748861))

(declare-fun m!748863 () Bool)

(assert (=> b!806877 m!748863))

(check-sat (not start!69184) (not b!806879) (not b!806880) (not b!806877) (not b!806881) (not b!806882) (not b!806874) (not b!806878) (not b!806875))
(check-sat)
