; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120170 () Bool)

(assert start!120170)

(declare-fun b!1397857 () Bool)

(declare-fun e!791468 () Bool)

(assert (=> b!1397857 (= e!791468 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95621 0))(
  ( (array!95622 (arr!46162 (Array (_ BitVec 32) (_ BitVec 64))) (size!46713 (_ BitVec 32))) )
))
(declare-fun lt!614040 () array!95621)

(declare-fun lt!614042 () (_ BitVec 64))

(declare-fun lt!614044 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10382 0))(
  ( (MissingZero!10382 (index!43899 (_ BitVec 32))) (Found!10382 (index!43900 (_ BitVec 32))) (Intermediate!10382 (undefined!11194 Bool) (index!43901 (_ BitVec 32)) (x!125719 (_ BitVec 32))) (Undefined!10382) (MissingVacant!10382 (index!43902 (_ BitVec 32))) )
))
(declare-fun lt!614041 () SeekEntryResult!10382)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95621 (_ BitVec 32)) SeekEntryResult!10382)

(assert (=> b!1397857 (= lt!614041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614044 lt!614042 lt!614040 mask!2840))))

(declare-fun b!1397858 () Bool)

(declare-fun res!936093 () Bool)

(declare-fun e!791467 () Bool)

(assert (=> b!1397858 (=> (not res!936093) (not e!791467))))

(declare-fun a!2901 () array!95621)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397858 (= res!936093 (validKeyInArray!0 (select (arr!46162 a!2901) i!1037)))))

(declare-fun b!1397859 () Bool)

(declare-fun res!936088 () Bool)

(assert (=> b!1397859 (=> (not res!936088) (not e!791467))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397859 (= res!936088 (validKeyInArray!0 (select (arr!46162 a!2901) j!112)))))

(declare-fun b!1397860 () Bool)

(declare-fun res!936090 () Bool)

(assert (=> b!1397860 (=> (not res!936090) (not e!791467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95621 (_ BitVec 32)) Bool)

(assert (=> b!1397860 (= res!936090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!936089 () Bool)

(assert (=> start!120170 (=> (not res!936089) (not e!791467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120170 (= res!936089 (validMask!0 mask!2840))))

(assert (=> start!120170 e!791467))

(assert (=> start!120170 true))

(declare-fun array_inv!35443 (array!95621) Bool)

(assert (=> start!120170 (array_inv!35443 a!2901)))

(declare-fun b!1397861 () Bool)

(declare-fun e!791469 () Bool)

(assert (=> b!1397861 (= e!791469 e!791468)))

(declare-fun res!936091 () Bool)

(assert (=> b!1397861 (=> res!936091 e!791468)))

(declare-fun lt!614045 () SeekEntryResult!10382)

(declare-fun lt!614043 () SeekEntryResult!10382)

(get-info :version)

(assert (=> b!1397861 (= res!936091 (or (= lt!614045 lt!614043) (not ((_ is Intermediate!10382) lt!614043)) (bvslt (x!125719 lt!614045) #b00000000000000000000000000000000) (bvsgt (x!125719 lt!614045) #b01111111111111111111111111111110) (bvslt lt!614044 #b00000000000000000000000000000000) (bvsge lt!614044 (size!46713 a!2901)) (bvslt (index!43901 lt!614045) #b00000000000000000000000000000000) (bvsge (index!43901 lt!614045) (size!46713 a!2901)) (not (= lt!614045 (Intermediate!10382 false (index!43901 lt!614045) (x!125719 lt!614045)))) (not (= lt!614043 (Intermediate!10382 (undefined!11194 lt!614043) (index!43901 lt!614043) (x!125719 lt!614043))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397861 (= lt!614043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614042 mask!2840) lt!614042 lt!614040 mask!2840))))

(assert (=> b!1397861 (= lt!614042 (select (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397861 (= lt!614040 (array!95622 (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46713 a!2901)))))

(declare-fun b!1397862 () Bool)

(declare-fun e!791471 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95621 (_ BitVec 32)) SeekEntryResult!10382)

(assert (=> b!1397862 (= e!791471 (= (seekEntryOrOpen!0 (select (arr!46162 a!2901) j!112) a!2901 mask!2840) (Found!10382 j!112)))))

(declare-fun b!1397863 () Bool)

(assert (=> b!1397863 (= e!791467 (not e!791469))))

(declare-fun res!936086 () Bool)

(assert (=> b!1397863 (=> res!936086 e!791469)))

(assert (=> b!1397863 (= res!936086 (or (not ((_ is Intermediate!10382) lt!614045)) (undefined!11194 lt!614045)))))

(assert (=> b!1397863 e!791471))

(declare-fun res!936092 () Bool)

(assert (=> b!1397863 (=> (not res!936092) (not e!791471))))

(assert (=> b!1397863 (= res!936092 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46795 0))(
  ( (Unit!46796) )
))
(declare-fun lt!614039 () Unit!46795)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46795)

(assert (=> b!1397863 (= lt!614039 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397863 (= lt!614045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614044 (select (arr!46162 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397863 (= lt!614044 (toIndex!0 (select (arr!46162 a!2901) j!112) mask!2840))))

(declare-fun b!1397864 () Bool)

(declare-fun res!936094 () Bool)

(assert (=> b!1397864 (=> (not res!936094) (not e!791467))))

(assert (=> b!1397864 (= res!936094 (and (= (size!46713 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46713 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46713 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397865 () Bool)

(declare-fun res!936087 () Bool)

(assert (=> b!1397865 (=> (not res!936087) (not e!791467))))

(declare-datatypes ((List!32668 0))(
  ( (Nil!32665) (Cons!32664 (h!33914 (_ BitVec 64)) (t!47354 List!32668)) )
))
(declare-fun arrayNoDuplicates!0 (array!95621 (_ BitVec 32) List!32668) Bool)

(assert (=> b!1397865 (= res!936087 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32665))))

(assert (= (and start!120170 res!936089) b!1397864))

(assert (= (and b!1397864 res!936094) b!1397858))

(assert (= (and b!1397858 res!936093) b!1397859))

(assert (= (and b!1397859 res!936088) b!1397860))

(assert (= (and b!1397860 res!936090) b!1397865))

(assert (= (and b!1397865 res!936087) b!1397863))

(assert (= (and b!1397863 res!936092) b!1397862))

(assert (= (and b!1397863 (not res!936086)) b!1397861))

(assert (= (and b!1397861 (not res!936091)) b!1397857))

(declare-fun m!1284619 () Bool)

(assert (=> b!1397865 m!1284619))

(declare-fun m!1284621 () Bool)

(assert (=> b!1397863 m!1284621))

(declare-fun m!1284623 () Bool)

(assert (=> b!1397863 m!1284623))

(assert (=> b!1397863 m!1284621))

(declare-fun m!1284625 () Bool)

(assert (=> b!1397863 m!1284625))

(assert (=> b!1397863 m!1284621))

(declare-fun m!1284627 () Bool)

(assert (=> b!1397863 m!1284627))

(declare-fun m!1284629 () Bool)

(assert (=> b!1397863 m!1284629))

(declare-fun m!1284631 () Bool)

(assert (=> b!1397858 m!1284631))

(assert (=> b!1397858 m!1284631))

(declare-fun m!1284633 () Bool)

(assert (=> b!1397858 m!1284633))

(assert (=> b!1397862 m!1284621))

(assert (=> b!1397862 m!1284621))

(declare-fun m!1284635 () Bool)

(assert (=> b!1397862 m!1284635))

(declare-fun m!1284637 () Bool)

(assert (=> b!1397857 m!1284637))

(declare-fun m!1284639 () Bool)

(assert (=> b!1397860 m!1284639))

(declare-fun m!1284641 () Bool)

(assert (=> start!120170 m!1284641))

(declare-fun m!1284643 () Bool)

(assert (=> start!120170 m!1284643))

(declare-fun m!1284645 () Bool)

(assert (=> b!1397861 m!1284645))

(assert (=> b!1397861 m!1284645))

(declare-fun m!1284647 () Bool)

(assert (=> b!1397861 m!1284647))

(declare-fun m!1284649 () Bool)

(assert (=> b!1397861 m!1284649))

(declare-fun m!1284651 () Bool)

(assert (=> b!1397861 m!1284651))

(assert (=> b!1397859 m!1284621))

(assert (=> b!1397859 m!1284621))

(declare-fun m!1284653 () Bool)

(assert (=> b!1397859 m!1284653))

(check-sat (not b!1397860) (not b!1397862) (not b!1397858) (not b!1397857) (not b!1397865) (not b!1397859) (not b!1397861) (not start!120170) (not b!1397863))
(check-sat)
