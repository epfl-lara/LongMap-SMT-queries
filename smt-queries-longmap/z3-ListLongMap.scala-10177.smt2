; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119984 () Bool)

(assert start!119984)

(declare-fun res!935688 () Bool)

(declare-fun e!790735 () Bool)

(assert (=> start!119984 (=> (not res!935688) (not e!790735))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119984 (= res!935688 (validMask!0 mask!2840))))

(assert (=> start!119984 e!790735))

(assert (=> start!119984 true))

(declare-datatypes ((array!95466 0))(
  ( (array!95467 (arr!46087 (Array (_ BitVec 32) (_ BitVec 64))) (size!46639 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95466)

(declare-fun array_inv!35320 (array!95466) Bool)

(assert (=> start!119984 (array_inv!35320 a!2901)))

(declare-fun b!1396717 () Bool)

(declare-fun e!790739 () Bool)

(assert (=> b!1396717 (= e!790735 (not e!790739))))

(declare-fun res!935681 () Bool)

(assert (=> b!1396717 (=> res!935681 e!790739)))

(declare-datatypes ((SeekEntryResult!10430 0))(
  ( (MissingZero!10430 (index!44091 (_ BitVec 32))) (Found!10430 (index!44092 (_ BitVec 32))) (Intermediate!10430 (undefined!11242 Bool) (index!44093 (_ BitVec 32)) (x!125753 (_ BitVec 32))) (Undefined!10430) (MissingVacant!10430 (index!44094 (_ BitVec 32))) )
))
(declare-fun lt!613518 () SeekEntryResult!10430)

(get-info :version)

(assert (=> b!1396717 (= res!935681 (or (not ((_ is Intermediate!10430) lt!613518)) (undefined!11242 lt!613518)))))

(declare-fun e!790736 () Bool)

(assert (=> b!1396717 e!790736))

(declare-fun res!935689 () Bool)

(assert (=> b!1396717 (=> (not res!935689) (not e!790736))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95466 (_ BitVec 32)) Bool)

(assert (=> b!1396717 (= res!935689 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46707 0))(
  ( (Unit!46708) )
))
(declare-fun lt!613515 () Unit!46707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46707)

(assert (=> b!1396717 (= lt!613515 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613514 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95466 (_ BitVec 32)) SeekEntryResult!10430)

(assert (=> b!1396717 (= lt!613518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613514 (select (arr!46087 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396717 (= lt!613514 (toIndex!0 (select (arr!46087 a!2901) j!112) mask!2840))))

(declare-fun b!1396718 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95466 (_ BitVec 32)) SeekEntryResult!10430)

(assert (=> b!1396718 (= e!790736 (= (seekEntryOrOpen!0 (select (arr!46087 a!2901) j!112) a!2901 mask!2840) (Found!10430 j!112)))))

(declare-fun b!1396719 () Bool)

(declare-fun res!935686 () Bool)

(assert (=> b!1396719 (=> (not res!935686) (not e!790735))))

(declare-datatypes ((List!32684 0))(
  ( (Nil!32681) (Cons!32680 (h!33922 (_ BitVec 64)) (t!47370 List!32684)) )
))
(declare-fun arrayNoDuplicates!0 (array!95466 (_ BitVec 32) List!32684) Bool)

(assert (=> b!1396719 (= res!935686 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32681))))

(declare-fun b!1396720 () Bool)

(declare-fun e!790737 () Bool)

(assert (=> b!1396720 (= e!790737 true)))

(declare-fun lt!613517 () array!95466)

(declare-fun lt!613519 () (_ BitVec 64))

(declare-fun lt!613520 () SeekEntryResult!10430)

(assert (=> b!1396720 (= lt!613520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613514 lt!613519 lt!613517 mask!2840))))

(declare-fun b!1396721 () Bool)

(declare-fun res!935683 () Bool)

(assert (=> b!1396721 (=> (not res!935683) (not e!790735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396721 (= res!935683 (validKeyInArray!0 (select (arr!46087 a!2901) j!112)))))

(declare-fun b!1396722 () Bool)

(assert (=> b!1396722 (= e!790739 e!790737)))

(declare-fun res!935682 () Bool)

(assert (=> b!1396722 (=> res!935682 e!790737)))

(declare-fun lt!613516 () SeekEntryResult!10430)

(assert (=> b!1396722 (= res!935682 (or (= lt!613518 lt!613516) (not ((_ is Intermediate!10430) lt!613516)) (bvslt (x!125753 lt!613518) #b00000000000000000000000000000000) (bvsgt (x!125753 lt!613518) #b01111111111111111111111111111110) (bvslt lt!613514 #b00000000000000000000000000000000) (bvsge lt!613514 (size!46639 a!2901)) (bvslt (index!44093 lt!613518) #b00000000000000000000000000000000) (bvsge (index!44093 lt!613518) (size!46639 a!2901)) (not (= lt!613518 (Intermediate!10430 false (index!44093 lt!613518) (x!125753 lt!613518)))) (not (= lt!613516 (Intermediate!10430 (undefined!11242 lt!613516) (index!44093 lt!613516) (x!125753 lt!613516))))))))

(assert (=> b!1396722 (= lt!613516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613519 mask!2840) lt!613519 lt!613517 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396722 (= lt!613519 (select (store (arr!46087 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396722 (= lt!613517 (array!95467 (store (arr!46087 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46639 a!2901)))))

(declare-fun b!1396723 () Bool)

(declare-fun res!935685 () Bool)

(assert (=> b!1396723 (=> (not res!935685) (not e!790735))))

(assert (=> b!1396723 (= res!935685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396724 () Bool)

(declare-fun res!935684 () Bool)

(assert (=> b!1396724 (=> (not res!935684) (not e!790735))))

(assert (=> b!1396724 (= res!935684 (and (= (size!46639 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46639 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46639 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396725 () Bool)

(declare-fun res!935687 () Bool)

(assert (=> b!1396725 (=> (not res!935687) (not e!790735))))

(assert (=> b!1396725 (= res!935687 (validKeyInArray!0 (select (arr!46087 a!2901) i!1037)))))

(assert (= (and start!119984 res!935688) b!1396724))

(assert (= (and b!1396724 res!935684) b!1396725))

(assert (= (and b!1396725 res!935687) b!1396721))

(assert (= (and b!1396721 res!935683) b!1396723))

(assert (= (and b!1396723 res!935685) b!1396719))

(assert (= (and b!1396719 res!935686) b!1396717))

(assert (= (and b!1396717 res!935689) b!1396718))

(assert (= (and b!1396717 (not res!935681)) b!1396722))

(assert (= (and b!1396722 (not res!935682)) b!1396720))

(declare-fun m!1282819 () Bool)

(assert (=> start!119984 m!1282819))

(declare-fun m!1282821 () Bool)

(assert (=> start!119984 m!1282821))

(declare-fun m!1282823 () Bool)

(assert (=> b!1396721 m!1282823))

(assert (=> b!1396721 m!1282823))

(declare-fun m!1282825 () Bool)

(assert (=> b!1396721 m!1282825))

(assert (=> b!1396718 m!1282823))

(assert (=> b!1396718 m!1282823))

(declare-fun m!1282827 () Bool)

(assert (=> b!1396718 m!1282827))

(assert (=> b!1396717 m!1282823))

(declare-fun m!1282829 () Bool)

(assert (=> b!1396717 m!1282829))

(assert (=> b!1396717 m!1282823))

(declare-fun m!1282831 () Bool)

(assert (=> b!1396717 m!1282831))

(declare-fun m!1282833 () Bool)

(assert (=> b!1396717 m!1282833))

(assert (=> b!1396717 m!1282823))

(declare-fun m!1282835 () Bool)

(assert (=> b!1396717 m!1282835))

(declare-fun m!1282837 () Bool)

(assert (=> b!1396722 m!1282837))

(assert (=> b!1396722 m!1282837))

(declare-fun m!1282839 () Bool)

(assert (=> b!1396722 m!1282839))

(declare-fun m!1282841 () Bool)

(assert (=> b!1396722 m!1282841))

(declare-fun m!1282843 () Bool)

(assert (=> b!1396722 m!1282843))

(declare-fun m!1282845 () Bool)

(assert (=> b!1396725 m!1282845))

(assert (=> b!1396725 m!1282845))

(declare-fun m!1282847 () Bool)

(assert (=> b!1396725 m!1282847))

(declare-fun m!1282849 () Bool)

(assert (=> b!1396719 m!1282849))

(declare-fun m!1282851 () Bool)

(assert (=> b!1396723 m!1282851))

(declare-fun m!1282853 () Bool)

(assert (=> b!1396720 m!1282853))

(check-sat (not b!1396722) (not b!1396720) (not b!1396723) (not start!119984) (not b!1396718) (not b!1396721) (not b!1396725) (not b!1396719) (not b!1396717))
(check-sat)
