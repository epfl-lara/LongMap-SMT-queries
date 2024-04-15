; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120008 () Bool)

(assert start!120008)

(declare-fun b!1397041 () Bool)

(declare-fun res!936013 () Bool)

(declare-fun e!790915 () Bool)

(assert (=> b!1397041 (=> (not res!936013) (not e!790915))))

(declare-datatypes ((array!95490 0))(
  ( (array!95491 (arr!46099 (Array (_ BitVec 32) (_ BitVec 64))) (size!46651 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95490)

(declare-datatypes ((List!32696 0))(
  ( (Nil!32693) (Cons!32692 (h!33934 (_ BitVec 64)) (t!47382 List!32696)) )
))
(declare-fun arrayNoDuplicates!0 (array!95490 (_ BitVec 32) List!32696) Bool)

(assert (=> b!1397041 (= res!936013 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32693))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!790916 () Bool)

(declare-fun b!1397042 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10442 0))(
  ( (MissingZero!10442 (index!44139 (_ BitVec 32))) (Found!10442 (index!44140 (_ BitVec 32))) (Intermediate!10442 (undefined!11254 Bool) (index!44141 (_ BitVec 32)) (x!125797 (_ BitVec 32))) (Undefined!10442) (MissingVacant!10442 (index!44142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95490 (_ BitVec 32)) SeekEntryResult!10442)

(assert (=> b!1397042 (= e!790916 (= (seekEntryOrOpen!0 (select (arr!46099 a!2901) j!112) a!2901 mask!2840) (Found!10442 j!112)))))

(declare-fun b!1397043 () Bool)

(declare-fun res!936012 () Bool)

(assert (=> b!1397043 (=> (not res!936012) (not e!790915))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397043 (= res!936012 (validKeyInArray!0 (select (arr!46099 a!2901) i!1037)))))

(declare-fun b!1397044 () Bool)

(declare-fun res!936006 () Bool)

(assert (=> b!1397044 (=> (not res!936006) (not e!790915))))

(assert (=> b!1397044 (= res!936006 (and (= (size!46651 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46651 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46651 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397045 () Bool)

(declare-fun res!936008 () Bool)

(assert (=> b!1397045 (=> (not res!936008) (not e!790915))))

(assert (=> b!1397045 (= res!936008 (validKeyInArray!0 (select (arr!46099 a!2901) j!112)))))

(declare-fun b!1397046 () Bool)

(declare-fun e!790919 () Bool)

(declare-fun e!790918 () Bool)

(assert (=> b!1397046 (= e!790919 e!790918)))

(declare-fun res!936009 () Bool)

(assert (=> b!1397046 (=> res!936009 e!790918)))

(declare-fun lt!613769 () SeekEntryResult!10442)

(declare-fun lt!613770 () (_ BitVec 32))

(declare-fun lt!613772 () SeekEntryResult!10442)

(get-info :version)

(assert (=> b!1397046 (= res!936009 (or (= lt!613769 lt!613772) (not ((_ is Intermediate!10442) lt!613772)) (bvslt (x!125797 lt!613769) #b00000000000000000000000000000000) (bvsgt (x!125797 lt!613769) #b01111111111111111111111111111110) (bvslt lt!613770 #b00000000000000000000000000000000) (bvsge lt!613770 (size!46651 a!2901)) (bvslt (index!44141 lt!613769) #b00000000000000000000000000000000) (bvsge (index!44141 lt!613769) (size!46651 a!2901)) (not (= lt!613769 (Intermediate!10442 false (index!44141 lt!613769) (x!125797 lt!613769)))) (not (= lt!613772 (Intermediate!10442 (undefined!11254 lt!613772) (index!44141 lt!613772) (x!125797 lt!613772))))))))

(declare-fun lt!613766 () array!95490)

(declare-fun lt!613767 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95490 (_ BitVec 32)) SeekEntryResult!10442)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397046 (= lt!613772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613767 mask!2840) lt!613767 lt!613766 mask!2840))))

(assert (=> b!1397046 (= lt!613767 (select (store (arr!46099 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397046 (= lt!613766 (array!95491 (store (arr!46099 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46651 a!2901)))))

(declare-fun b!1397048 () Bool)

(declare-fun res!936010 () Bool)

(assert (=> b!1397048 (=> (not res!936010) (not e!790915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95490 (_ BitVec 32)) Bool)

(assert (=> b!1397048 (= res!936010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397049 () Bool)

(assert (=> b!1397049 (= e!790915 (not e!790919))))

(declare-fun res!936005 () Bool)

(assert (=> b!1397049 (=> res!936005 e!790919)))

(assert (=> b!1397049 (= res!936005 (or (not ((_ is Intermediate!10442) lt!613769)) (undefined!11254 lt!613769)))))

(assert (=> b!1397049 e!790916))

(declare-fun res!936007 () Bool)

(assert (=> b!1397049 (=> (not res!936007) (not e!790916))))

(assert (=> b!1397049 (= res!936007 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46731 0))(
  ( (Unit!46732) )
))
(declare-fun lt!613771 () Unit!46731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46731)

(assert (=> b!1397049 (= lt!613771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397049 (= lt!613769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613770 (select (arr!46099 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397049 (= lt!613770 (toIndex!0 (select (arr!46099 a!2901) j!112) mask!2840))))

(declare-fun res!936011 () Bool)

(assert (=> start!120008 (=> (not res!936011) (not e!790915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120008 (= res!936011 (validMask!0 mask!2840))))

(assert (=> start!120008 e!790915))

(assert (=> start!120008 true))

(declare-fun array_inv!35332 (array!95490) Bool)

(assert (=> start!120008 (array_inv!35332 a!2901)))

(declare-fun b!1397047 () Bool)

(assert (=> b!1397047 (= e!790918 true)))

(declare-fun lt!613768 () SeekEntryResult!10442)

(assert (=> b!1397047 (= lt!613768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613770 lt!613767 lt!613766 mask!2840))))

(assert (= (and start!120008 res!936011) b!1397044))

(assert (= (and b!1397044 res!936006) b!1397043))

(assert (= (and b!1397043 res!936012) b!1397045))

(assert (= (and b!1397045 res!936008) b!1397048))

(assert (= (and b!1397048 res!936010) b!1397041))

(assert (= (and b!1397041 res!936013) b!1397049))

(assert (= (and b!1397049 res!936007) b!1397042))

(assert (= (and b!1397049 (not res!936005)) b!1397046))

(assert (= (and b!1397046 (not res!936009)) b!1397047))

(declare-fun m!1283251 () Bool)

(assert (=> b!1397042 m!1283251))

(assert (=> b!1397042 m!1283251))

(declare-fun m!1283253 () Bool)

(assert (=> b!1397042 m!1283253))

(declare-fun m!1283255 () Bool)

(assert (=> b!1397047 m!1283255))

(declare-fun m!1283257 () Bool)

(assert (=> b!1397043 m!1283257))

(assert (=> b!1397043 m!1283257))

(declare-fun m!1283259 () Bool)

(assert (=> b!1397043 m!1283259))

(declare-fun m!1283261 () Bool)

(assert (=> b!1397048 m!1283261))

(declare-fun m!1283263 () Bool)

(assert (=> b!1397046 m!1283263))

(assert (=> b!1397046 m!1283263))

(declare-fun m!1283265 () Bool)

(assert (=> b!1397046 m!1283265))

(declare-fun m!1283267 () Bool)

(assert (=> b!1397046 m!1283267))

(declare-fun m!1283269 () Bool)

(assert (=> b!1397046 m!1283269))

(assert (=> b!1397049 m!1283251))

(declare-fun m!1283271 () Bool)

(assert (=> b!1397049 m!1283271))

(declare-fun m!1283273 () Bool)

(assert (=> b!1397049 m!1283273))

(declare-fun m!1283275 () Bool)

(assert (=> b!1397049 m!1283275))

(assert (=> b!1397049 m!1283251))

(declare-fun m!1283277 () Bool)

(assert (=> b!1397049 m!1283277))

(assert (=> b!1397049 m!1283251))

(assert (=> b!1397045 m!1283251))

(assert (=> b!1397045 m!1283251))

(declare-fun m!1283279 () Bool)

(assert (=> b!1397045 m!1283279))

(declare-fun m!1283281 () Bool)

(assert (=> start!120008 m!1283281))

(declare-fun m!1283283 () Bool)

(assert (=> start!120008 m!1283283))

(declare-fun m!1283285 () Bool)

(assert (=> b!1397041 m!1283285))

(check-sat (not b!1397049) (not b!1397048) (not b!1397042) (not start!120008) (not b!1397046) (not b!1397043) (not b!1397045) (not b!1397041) (not b!1397047))
(check-sat)
