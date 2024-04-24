; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120182 () Bool)

(assert start!120182)

(declare-fun b!1398019 () Bool)

(declare-fun e!791557 () Bool)

(declare-fun e!791559 () Bool)

(assert (=> b!1398019 (= e!791557 e!791559)))

(declare-fun res!936250 () Bool)

(assert (=> b!1398019 (=> res!936250 e!791559)))

(declare-datatypes ((array!95633 0))(
  ( (array!95634 (arr!46168 (Array (_ BitVec 32) (_ BitVec 64))) (size!46719 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95633)

(declare-fun lt!614168 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10388 0))(
  ( (MissingZero!10388 (index!43923 (_ BitVec 32))) (Found!10388 (index!43924 (_ BitVec 32))) (Intermediate!10388 (undefined!11200 Bool) (index!43925 (_ BitVec 32)) (x!125741 (_ BitVec 32))) (Undefined!10388) (MissingVacant!10388 (index!43926 (_ BitVec 32))) )
))
(declare-fun lt!614170 () SeekEntryResult!10388)

(declare-fun lt!614165 () SeekEntryResult!10388)

(get-info :version)

(assert (=> b!1398019 (= res!936250 (or (= lt!614170 lt!614165) (not ((_ is Intermediate!10388) lt!614165)) (bvslt (x!125741 lt!614170) #b00000000000000000000000000000000) (bvsgt (x!125741 lt!614170) #b01111111111111111111111111111110) (bvslt lt!614168 #b00000000000000000000000000000000) (bvsge lt!614168 (size!46719 a!2901)) (bvslt (index!43925 lt!614170) #b00000000000000000000000000000000) (bvsge (index!43925 lt!614170) (size!46719 a!2901)) (not (= lt!614170 (Intermediate!10388 false (index!43925 lt!614170) (x!125741 lt!614170)))) (not (= lt!614165 (Intermediate!10388 (undefined!11200 lt!614165) (index!43925 lt!614165) (x!125741 lt!614165))))))))

(declare-fun lt!614166 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!614167 () array!95633)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95633 (_ BitVec 32)) SeekEntryResult!10388)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398019 (= lt!614165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614166 mask!2840) lt!614166 lt!614167 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398019 (= lt!614166 (select (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398019 (= lt!614167 (array!95634 (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46719 a!2901)))))

(declare-fun res!936252 () Bool)

(declare-fun e!791558 () Bool)

(assert (=> start!120182 (=> (not res!936252) (not e!791558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120182 (= res!936252 (validMask!0 mask!2840))))

(assert (=> start!120182 e!791558))

(assert (=> start!120182 true))

(declare-fun array_inv!35449 (array!95633) Bool)

(assert (=> start!120182 (array_inv!35449 a!2901)))

(declare-fun b!1398020 () Bool)

(declare-fun res!936251 () Bool)

(assert (=> b!1398020 (=> (not res!936251) (not e!791558))))

(assert (=> b!1398020 (= res!936251 (and (= (size!46719 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46719 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46719 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398021 () Bool)

(declare-fun res!936255 () Bool)

(assert (=> b!1398021 (=> (not res!936255) (not e!791558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398021 (= res!936255 (validKeyInArray!0 (select (arr!46168 a!2901) j!112)))))

(declare-fun b!1398022 () Bool)

(assert (=> b!1398022 (= e!791558 (not e!791557))))

(declare-fun res!936248 () Bool)

(assert (=> b!1398022 (=> res!936248 e!791557)))

(assert (=> b!1398022 (= res!936248 (or (not ((_ is Intermediate!10388) lt!614170)) (undefined!11200 lt!614170)))))

(declare-fun e!791560 () Bool)

(assert (=> b!1398022 e!791560))

(declare-fun res!936254 () Bool)

(assert (=> b!1398022 (=> (not res!936254) (not e!791560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95633 (_ BitVec 32)) Bool)

(assert (=> b!1398022 (= res!936254 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46807 0))(
  ( (Unit!46808) )
))
(declare-fun lt!614169 () Unit!46807)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46807)

(assert (=> b!1398022 (= lt!614169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398022 (= lt!614170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614168 (select (arr!46168 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398022 (= lt!614168 (toIndex!0 (select (arr!46168 a!2901) j!112) mask!2840))))

(declare-fun b!1398023 () Bool)

(assert (=> b!1398023 (= e!791559 true)))

(declare-fun lt!614171 () SeekEntryResult!10388)

(assert (=> b!1398023 (= lt!614171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614168 lt!614166 lt!614167 mask!2840))))

(declare-fun b!1398024 () Bool)

(declare-fun res!936249 () Bool)

(assert (=> b!1398024 (=> (not res!936249) (not e!791558))))

(assert (=> b!1398024 (= res!936249 (validKeyInArray!0 (select (arr!46168 a!2901) i!1037)))))

(declare-fun b!1398025 () Bool)

(declare-fun res!936256 () Bool)

(assert (=> b!1398025 (=> (not res!936256) (not e!791558))))

(assert (=> b!1398025 (= res!936256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398026 () Bool)

(declare-fun res!936253 () Bool)

(assert (=> b!1398026 (=> (not res!936253) (not e!791558))))

(declare-datatypes ((List!32674 0))(
  ( (Nil!32671) (Cons!32670 (h!33920 (_ BitVec 64)) (t!47360 List!32674)) )
))
(declare-fun arrayNoDuplicates!0 (array!95633 (_ BitVec 32) List!32674) Bool)

(assert (=> b!1398026 (= res!936253 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32671))))

(declare-fun b!1398027 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95633 (_ BitVec 32)) SeekEntryResult!10388)

(assert (=> b!1398027 (= e!791560 (= (seekEntryOrOpen!0 (select (arr!46168 a!2901) j!112) a!2901 mask!2840) (Found!10388 j!112)))))

(assert (= (and start!120182 res!936252) b!1398020))

(assert (= (and b!1398020 res!936251) b!1398024))

(assert (= (and b!1398024 res!936249) b!1398021))

(assert (= (and b!1398021 res!936255) b!1398025))

(assert (= (and b!1398025 res!936256) b!1398026))

(assert (= (and b!1398026 res!936253) b!1398022))

(assert (= (and b!1398022 res!936254) b!1398027))

(assert (= (and b!1398022 (not res!936248)) b!1398019))

(assert (= (and b!1398019 (not res!936250)) b!1398023))

(declare-fun m!1284835 () Bool)

(assert (=> b!1398023 m!1284835))

(declare-fun m!1284837 () Bool)

(assert (=> b!1398025 m!1284837))

(declare-fun m!1284839 () Bool)

(assert (=> b!1398027 m!1284839))

(assert (=> b!1398027 m!1284839))

(declare-fun m!1284841 () Bool)

(assert (=> b!1398027 m!1284841))

(assert (=> b!1398021 m!1284839))

(assert (=> b!1398021 m!1284839))

(declare-fun m!1284843 () Bool)

(assert (=> b!1398021 m!1284843))

(declare-fun m!1284845 () Bool)

(assert (=> start!120182 m!1284845))

(declare-fun m!1284847 () Bool)

(assert (=> start!120182 m!1284847))

(declare-fun m!1284849 () Bool)

(assert (=> b!1398019 m!1284849))

(assert (=> b!1398019 m!1284849))

(declare-fun m!1284851 () Bool)

(assert (=> b!1398019 m!1284851))

(declare-fun m!1284853 () Bool)

(assert (=> b!1398019 m!1284853))

(declare-fun m!1284855 () Bool)

(assert (=> b!1398019 m!1284855))

(declare-fun m!1284857 () Bool)

(assert (=> b!1398026 m!1284857))

(declare-fun m!1284859 () Bool)

(assert (=> b!1398024 m!1284859))

(assert (=> b!1398024 m!1284859))

(declare-fun m!1284861 () Bool)

(assert (=> b!1398024 m!1284861))

(assert (=> b!1398022 m!1284839))

(declare-fun m!1284863 () Bool)

(assert (=> b!1398022 m!1284863))

(assert (=> b!1398022 m!1284839))

(declare-fun m!1284865 () Bool)

(assert (=> b!1398022 m!1284865))

(assert (=> b!1398022 m!1284839))

(declare-fun m!1284867 () Bool)

(assert (=> b!1398022 m!1284867))

(declare-fun m!1284869 () Bool)

(assert (=> b!1398022 m!1284869))

(check-sat (not b!1398021) (not start!120182) (not b!1398022) (not b!1398019) (not b!1398025) (not b!1398024) (not b!1398027) (not b!1398023) (not b!1398026))
(check-sat)
