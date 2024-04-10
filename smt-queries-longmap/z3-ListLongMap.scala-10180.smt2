; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120008 () Bool)

(assert start!120008)

(declare-fun b!1397068 () Bool)

(declare-fun res!935987 () Bool)

(declare-fun e!790926 () Bool)

(assert (=> b!1397068 (=> (not res!935987) (not e!790926))))

(declare-datatypes ((array!95537 0))(
  ( (array!95538 (arr!46122 (Array (_ BitVec 32) (_ BitVec 64))) (size!46672 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95537)

(declare-datatypes ((List!32641 0))(
  ( (Nil!32638) (Cons!32637 (h!33879 (_ BitVec 64)) (t!47335 List!32641)) )
))
(declare-fun arrayNoDuplicates!0 (array!95537 (_ BitVec 32) List!32641) Bool)

(assert (=> b!1397068 (= res!935987 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32638))))

(declare-fun b!1397069 () Bool)

(declare-fun res!935982 () Bool)

(assert (=> b!1397069 (=> (not res!935982) (not e!790926))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397069 (= res!935982 (validKeyInArray!0 (select (arr!46122 a!2901) j!112)))))

(declare-fun b!1397070 () Bool)

(declare-fun res!935989 () Bool)

(assert (=> b!1397070 (=> (not res!935989) (not e!790926))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95537 (_ BitVec 32)) Bool)

(assert (=> b!1397070 (= res!935989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397071 () Bool)

(declare-fun e!790924 () Bool)

(declare-fun e!790925 () Bool)

(assert (=> b!1397071 (= e!790924 e!790925)))

(declare-fun res!935983 () Bool)

(assert (=> b!1397071 (=> res!935983 e!790925)))

(declare-datatypes ((SeekEntryResult!10439 0))(
  ( (MissingZero!10439 (index!44127 (_ BitVec 32))) (Found!10439 (index!44128 (_ BitVec 32))) (Intermediate!10439 (undefined!11251 Bool) (index!44129 (_ BitVec 32)) (x!125789 (_ BitVec 32))) (Undefined!10439) (MissingVacant!10439 (index!44130 (_ BitVec 32))) )
))
(declare-fun lt!613919 () SeekEntryResult!10439)

(declare-fun lt!613918 () SeekEntryResult!10439)

(declare-fun lt!613916 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1397071 (= res!935983 (or (= lt!613919 lt!613918) (not ((_ is Intermediate!10439) lt!613918)) (bvslt (x!125789 lt!613919) #b00000000000000000000000000000000) (bvsgt (x!125789 lt!613919) #b01111111111111111111111111111110) (bvslt lt!613916 #b00000000000000000000000000000000) (bvsge lt!613916 (size!46672 a!2901)) (bvslt (index!44129 lt!613919) #b00000000000000000000000000000000) (bvsge (index!44129 lt!613919) (size!46672 a!2901)) (not (= lt!613919 (Intermediate!10439 false (index!44129 lt!613919) (x!125789 lt!613919)))) (not (= lt!613918 (Intermediate!10439 (undefined!11251 lt!613918) (index!44129 lt!613918) (x!125789 lt!613918))))))))

(declare-fun lt!613920 () (_ BitVec 64))

(declare-fun lt!613914 () array!95537)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95537 (_ BitVec 32)) SeekEntryResult!10439)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397071 (= lt!613918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613920 mask!2840) lt!613920 lt!613914 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397071 (= lt!613920 (select (store (arr!46122 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397071 (= lt!613914 (array!95538 (store (arr!46122 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46672 a!2901)))))

(declare-fun b!1397072 () Bool)

(assert (=> b!1397072 (= e!790926 (not e!790924))))

(declare-fun res!935988 () Bool)

(assert (=> b!1397072 (=> res!935988 e!790924)))

(assert (=> b!1397072 (= res!935988 (or (not ((_ is Intermediate!10439) lt!613919)) (undefined!11251 lt!613919)))))

(declare-fun e!790927 () Bool)

(assert (=> b!1397072 e!790927))

(declare-fun res!935981 () Bool)

(assert (=> b!1397072 (=> (not res!935981) (not e!790927))))

(assert (=> b!1397072 (= res!935981 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46882 0))(
  ( (Unit!46883) )
))
(declare-fun lt!613915 () Unit!46882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46882)

(assert (=> b!1397072 (= lt!613915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397072 (= lt!613919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613916 (select (arr!46122 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397072 (= lt!613916 (toIndex!0 (select (arr!46122 a!2901) j!112) mask!2840))))

(declare-fun b!1397073 () Bool)

(declare-fun res!935984 () Bool)

(assert (=> b!1397073 (=> (not res!935984) (not e!790926))))

(assert (=> b!1397073 (= res!935984 (and (= (size!46672 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46672 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46672 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397074 () Bool)

(assert (=> b!1397074 (= e!790925 true)))

(declare-fun lt!613917 () SeekEntryResult!10439)

(assert (=> b!1397074 (= lt!613917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613916 lt!613920 lt!613914 mask!2840))))

(declare-fun res!935986 () Bool)

(assert (=> start!120008 (=> (not res!935986) (not e!790926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120008 (= res!935986 (validMask!0 mask!2840))))

(assert (=> start!120008 e!790926))

(assert (=> start!120008 true))

(declare-fun array_inv!35150 (array!95537) Bool)

(assert (=> start!120008 (array_inv!35150 a!2901)))

(declare-fun b!1397075 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95537 (_ BitVec 32)) SeekEntryResult!10439)

(assert (=> b!1397075 (= e!790927 (= (seekEntryOrOpen!0 (select (arr!46122 a!2901) j!112) a!2901 mask!2840) (Found!10439 j!112)))))

(declare-fun b!1397076 () Bool)

(declare-fun res!935985 () Bool)

(assert (=> b!1397076 (=> (not res!935985) (not e!790926))))

(assert (=> b!1397076 (= res!935985 (validKeyInArray!0 (select (arr!46122 a!2901) i!1037)))))

(assert (= (and start!120008 res!935986) b!1397073))

(assert (= (and b!1397073 res!935984) b!1397076))

(assert (= (and b!1397076 res!935985) b!1397069))

(assert (= (and b!1397069 res!935982) b!1397070))

(assert (= (and b!1397070 res!935989) b!1397068))

(assert (= (and b!1397068 res!935987) b!1397072))

(assert (= (and b!1397072 res!935981) b!1397075))

(assert (= (and b!1397072 (not res!935988)) b!1397071))

(assert (= (and b!1397071 (not res!935983)) b!1397074))

(declare-fun m!1283715 () Bool)

(assert (=> b!1397071 m!1283715))

(assert (=> b!1397071 m!1283715))

(declare-fun m!1283717 () Bool)

(assert (=> b!1397071 m!1283717))

(declare-fun m!1283719 () Bool)

(assert (=> b!1397071 m!1283719))

(declare-fun m!1283721 () Bool)

(assert (=> b!1397071 m!1283721))

(declare-fun m!1283723 () Bool)

(assert (=> b!1397074 m!1283723))

(declare-fun m!1283725 () Bool)

(assert (=> start!120008 m!1283725))

(declare-fun m!1283727 () Bool)

(assert (=> start!120008 m!1283727))

(declare-fun m!1283729 () Bool)

(assert (=> b!1397070 m!1283729))

(declare-fun m!1283731 () Bool)

(assert (=> b!1397072 m!1283731))

(declare-fun m!1283733 () Bool)

(assert (=> b!1397072 m!1283733))

(assert (=> b!1397072 m!1283731))

(assert (=> b!1397072 m!1283731))

(declare-fun m!1283735 () Bool)

(assert (=> b!1397072 m!1283735))

(declare-fun m!1283737 () Bool)

(assert (=> b!1397072 m!1283737))

(declare-fun m!1283739 () Bool)

(assert (=> b!1397072 m!1283739))

(declare-fun m!1283741 () Bool)

(assert (=> b!1397068 m!1283741))

(assert (=> b!1397075 m!1283731))

(assert (=> b!1397075 m!1283731))

(declare-fun m!1283743 () Bool)

(assert (=> b!1397075 m!1283743))

(assert (=> b!1397069 m!1283731))

(assert (=> b!1397069 m!1283731))

(declare-fun m!1283745 () Bool)

(assert (=> b!1397069 m!1283745))

(declare-fun m!1283747 () Bool)

(assert (=> b!1397076 m!1283747))

(assert (=> b!1397076 m!1283747))

(declare-fun m!1283749 () Bool)

(assert (=> b!1397076 m!1283749))

(check-sat (not start!120008) (not b!1397075) (not b!1397074) (not b!1397070) (not b!1397071) (not b!1397072) (not b!1397069) (not b!1397076) (not b!1397068))
(check-sat)
