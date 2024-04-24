; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121778 () Bool)

(assert start!121778)

(declare-fun b!1413606 () Bool)

(declare-fun res!949912 () Bool)

(declare-fun e!800059 () Bool)

(assert (=> b!1413606 (=> (not res!949912) (not e!800059))))

(declare-datatypes ((array!96638 0))(
  ( (array!96639 (arr!46654 (Array (_ BitVec 32) (_ BitVec 64))) (size!47205 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96638)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413606 (= res!949912 (validKeyInArray!0 (select (arr!46654 a!2901) j!112)))))

(declare-fun b!1413607 () Bool)

(declare-fun e!800060 () Bool)

(declare-fun e!800055 () Bool)

(assert (=> b!1413607 (= e!800060 e!800055)))

(declare-fun res!949914 () Bool)

(assert (=> b!1413607 (=> res!949914 e!800055)))

(declare-datatypes ((SeekEntryResult!10868 0))(
  ( (MissingZero!10868 (index!45852 (_ BitVec 32))) (Found!10868 (index!45853 (_ BitVec 32))) (Intermediate!10868 (undefined!11680 Bool) (index!45854 (_ BitVec 32)) (x!127598 (_ BitVec 32))) (Undefined!10868) (MissingVacant!10868 (index!45855 (_ BitVec 32))) )
))
(declare-fun lt!622752 () SeekEntryResult!10868)

(declare-fun lt!622757 () SeekEntryResult!10868)

(get-info :version)

(assert (=> b!1413607 (= res!949914 (or (= lt!622752 lt!622757) (not ((_ is Intermediate!10868) lt!622757))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622753 () array!96638)

(declare-fun lt!622755 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96638 (_ BitVec 32)) SeekEntryResult!10868)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413607 (= lt!622757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622755 mask!2840) lt!622755 lt!622753 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413607 (= lt!622755 (select (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413607 (= lt!622753 (array!96639 (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47205 a!2901)))))

(declare-fun b!1413608 () Bool)

(declare-fun res!949921 () Bool)

(assert (=> b!1413608 (=> (not res!949921) (not e!800059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96638 (_ BitVec 32)) Bool)

(assert (=> b!1413608 (= res!949921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413609 () Bool)

(assert (=> b!1413609 (= e!800055 true)))

(declare-fun e!800056 () Bool)

(assert (=> b!1413609 e!800056))

(declare-fun res!949916 () Bool)

(assert (=> b!1413609 (=> (not res!949916) (not e!800056))))

(assert (=> b!1413609 (= res!949916 (and (not (undefined!11680 lt!622757)) (= (index!45854 lt!622757) i!1037) (bvslt (x!127598 lt!622757) (x!127598 lt!622752)) (= (select (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45854 lt!622757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47737 0))(
  ( (Unit!47738) )
))
(declare-fun lt!622751 () Unit!47737)

(declare-fun lt!622754 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47737)

(assert (=> b!1413609 (= lt!622751 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622754 (x!127598 lt!622752) (index!45854 lt!622752) (x!127598 lt!622757) (index!45854 lt!622757) (undefined!11680 lt!622757) mask!2840))))

(declare-fun b!1413610 () Bool)

(declare-fun res!949917 () Bool)

(assert (=> b!1413610 (=> (not res!949917) (not e!800059))))

(assert (=> b!1413610 (= res!949917 (and (= (size!47205 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47205 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47205 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413611 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96638 (_ BitVec 32)) SeekEntryResult!10868)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96638 (_ BitVec 32)) SeekEntryResult!10868)

(assert (=> b!1413611 (= e!800056 (= (seekEntryOrOpen!0 lt!622755 lt!622753 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127598 lt!622757) (index!45854 lt!622757) (index!45854 lt!622757) (select (arr!46654 a!2901) j!112) lt!622753 mask!2840)))))

(declare-fun b!1413612 () Bool)

(declare-fun res!949913 () Bool)

(assert (=> b!1413612 (=> (not res!949913) (not e!800059))))

(assert (=> b!1413612 (= res!949913 (validKeyInArray!0 (select (arr!46654 a!2901) i!1037)))))

(declare-fun b!1413613 () Bool)

(declare-fun res!949919 () Bool)

(assert (=> b!1413613 (=> (not res!949919) (not e!800059))))

(declare-datatypes ((List!33160 0))(
  ( (Nil!33157) (Cons!33156 (h!34439 (_ BitVec 64)) (t!47846 List!33160)) )
))
(declare-fun arrayNoDuplicates!0 (array!96638 (_ BitVec 32) List!33160) Bool)

(assert (=> b!1413613 (= res!949919 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33157))))

(declare-fun b!1413614 () Bool)

(declare-fun e!800057 () Bool)

(assert (=> b!1413614 (= e!800057 (= (seekEntryOrOpen!0 (select (arr!46654 a!2901) j!112) a!2901 mask!2840) (Found!10868 j!112)))))

(declare-fun res!949920 () Bool)

(assert (=> start!121778 (=> (not res!949920) (not e!800059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121778 (= res!949920 (validMask!0 mask!2840))))

(assert (=> start!121778 e!800059))

(assert (=> start!121778 true))

(declare-fun array_inv!35935 (array!96638) Bool)

(assert (=> start!121778 (array_inv!35935 a!2901)))

(declare-fun b!1413615 () Bool)

(assert (=> b!1413615 (= e!800059 (not e!800060))))

(declare-fun res!949915 () Bool)

(assert (=> b!1413615 (=> res!949915 e!800060)))

(assert (=> b!1413615 (= res!949915 (or (not ((_ is Intermediate!10868) lt!622752)) (undefined!11680 lt!622752)))))

(assert (=> b!1413615 e!800057))

(declare-fun res!949918 () Bool)

(assert (=> b!1413615 (=> (not res!949918) (not e!800057))))

(assert (=> b!1413615 (= res!949918 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622756 () Unit!47737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47737)

(assert (=> b!1413615 (= lt!622756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413615 (= lt!622752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622754 (select (arr!46654 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413615 (= lt!622754 (toIndex!0 (select (arr!46654 a!2901) j!112) mask!2840))))

(assert (= (and start!121778 res!949920) b!1413610))

(assert (= (and b!1413610 res!949917) b!1413612))

(assert (= (and b!1413612 res!949913) b!1413606))

(assert (= (and b!1413606 res!949912) b!1413608))

(assert (= (and b!1413608 res!949921) b!1413613))

(assert (= (and b!1413613 res!949919) b!1413615))

(assert (= (and b!1413615 res!949918) b!1413614))

(assert (= (and b!1413615 (not res!949915)) b!1413607))

(assert (= (and b!1413607 (not res!949914)) b!1413609))

(assert (= (and b!1413609 res!949916) b!1413611))

(declare-fun m!1303873 () Bool)

(assert (=> b!1413607 m!1303873))

(assert (=> b!1413607 m!1303873))

(declare-fun m!1303875 () Bool)

(assert (=> b!1413607 m!1303875))

(declare-fun m!1303877 () Bool)

(assert (=> b!1413607 m!1303877))

(declare-fun m!1303879 () Bool)

(assert (=> b!1413607 m!1303879))

(assert (=> b!1413609 m!1303877))

(declare-fun m!1303881 () Bool)

(assert (=> b!1413609 m!1303881))

(declare-fun m!1303883 () Bool)

(assert (=> b!1413609 m!1303883))

(declare-fun m!1303885 () Bool)

(assert (=> b!1413611 m!1303885))

(declare-fun m!1303887 () Bool)

(assert (=> b!1413611 m!1303887))

(assert (=> b!1413611 m!1303887))

(declare-fun m!1303889 () Bool)

(assert (=> b!1413611 m!1303889))

(declare-fun m!1303891 () Bool)

(assert (=> b!1413608 m!1303891))

(assert (=> b!1413615 m!1303887))

(declare-fun m!1303893 () Bool)

(assert (=> b!1413615 m!1303893))

(assert (=> b!1413615 m!1303887))

(declare-fun m!1303895 () Bool)

(assert (=> b!1413615 m!1303895))

(declare-fun m!1303897 () Bool)

(assert (=> b!1413615 m!1303897))

(assert (=> b!1413615 m!1303887))

(declare-fun m!1303899 () Bool)

(assert (=> b!1413615 m!1303899))

(declare-fun m!1303901 () Bool)

(assert (=> start!121778 m!1303901))

(declare-fun m!1303903 () Bool)

(assert (=> start!121778 m!1303903))

(declare-fun m!1303905 () Bool)

(assert (=> b!1413613 m!1303905))

(declare-fun m!1303907 () Bool)

(assert (=> b!1413612 m!1303907))

(assert (=> b!1413612 m!1303907))

(declare-fun m!1303909 () Bool)

(assert (=> b!1413612 m!1303909))

(assert (=> b!1413614 m!1303887))

(assert (=> b!1413614 m!1303887))

(declare-fun m!1303911 () Bool)

(assert (=> b!1413614 m!1303911))

(assert (=> b!1413606 m!1303887))

(assert (=> b!1413606 m!1303887))

(declare-fun m!1303913 () Bool)

(assert (=> b!1413606 m!1303913))

(check-sat (not b!1413609) (not b!1413613) (not b!1413606) (not b!1413612) (not b!1413611) (not b!1413615) (not b!1413614) (not start!121778) (not b!1413608) (not b!1413607))
(check-sat)
