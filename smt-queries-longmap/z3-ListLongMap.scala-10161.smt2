; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119918 () Bool)

(assert start!119918)

(declare-fun b!1395906 () Bool)

(declare-fun res!934639 () Bool)

(declare-fun e!790387 () Bool)

(assert (=> b!1395906 (=> (not res!934639) (not e!790387))))

(declare-datatypes ((array!95522 0))(
  ( (array!95523 (arr!46117 (Array (_ BitVec 32) (_ BitVec 64))) (size!46668 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95522)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395906 (= res!934639 (validKeyInArray!0 (select (arr!46117 a!2901) j!112)))))

(declare-fun b!1395907 () Bool)

(declare-fun res!934634 () Bool)

(assert (=> b!1395907 (=> (not res!934634) (not e!790387))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395907 (= res!934634 (validKeyInArray!0 (select (arr!46117 a!2901) i!1037)))))

(declare-fun b!1395908 () Bool)

(declare-fun e!790388 () Bool)

(declare-fun e!790391 () Bool)

(assert (=> b!1395908 (= e!790388 e!790391)))

(declare-fun res!934637 () Bool)

(assert (=> b!1395908 (=> res!934637 e!790391)))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1395908 (= res!934637 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10337 0))(
  ( (MissingZero!10337 (index!43719 (_ BitVec 32))) (Found!10337 (index!43720 (_ BitVec 32))) (Intermediate!10337 (undefined!11149 Bool) (index!43721 (_ BitVec 32)) (x!125536 (_ BitVec 32))) (Undefined!10337) (MissingVacant!10337 (index!43722 (_ BitVec 32))) )
))
(declare-fun lt!613122 () SeekEntryResult!10337)

(declare-fun lt!613121 () (_ BitVec 64))

(declare-fun lt!613126 () array!95522)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95522 (_ BitVec 32)) SeekEntryResult!10337)

(assert (=> b!1395908 (= lt!613122 (seekEntryOrOpen!0 lt!613121 lt!613126 mask!2840))))

(declare-fun lt!613123 () SeekEntryResult!10337)

(declare-datatypes ((Unit!46705 0))(
  ( (Unit!46706) )
))
(declare-fun lt!613124 () Unit!46705)

(declare-fun lt!613125 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46705)

(assert (=> b!1395908 (= lt!613124 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!613125 (x!125536 lt!613123) (index!43721 lt!613123) mask!2840))))

(declare-fun b!1395909 () Bool)

(assert (=> b!1395909 (= e!790391 (validKeyInArray!0 lt!613121))))

(declare-fun b!1395910 () Bool)

(declare-fun res!934636 () Bool)

(assert (=> b!1395910 (=> (not res!934636) (not e!790387))))

(assert (=> b!1395910 (= res!934636 (and (= (size!46668 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46668 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46668 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395911 () Bool)

(declare-fun e!790389 () Bool)

(assert (=> b!1395911 (= e!790389 e!790388)))

(declare-fun res!934633 () Bool)

(assert (=> b!1395911 (=> res!934633 e!790388)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95522 (_ BitVec 32)) SeekEntryResult!10337)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395911 (= res!934633 (not (= lt!613123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613121 mask!2840) lt!613121 lt!613126 mask!2840))))))

(assert (=> b!1395911 (= lt!613121 (select (store (arr!46117 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395911 (= lt!613126 (array!95523 (store (arr!46117 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46668 a!2901)))))

(declare-fun b!1395912 () Bool)

(declare-fun res!934630 () Bool)

(assert (=> b!1395912 (=> (not res!934630) (not e!790387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95522 (_ BitVec 32)) Bool)

(assert (=> b!1395912 (= res!934630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395914 () Bool)

(declare-fun res!934631 () Bool)

(assert (=> b!1395914 (=> res!934631 e!790388)))

(assert (=> b!1395914 (= res!934631 (or (bvslt (x!125536 lt!613123) #b00000000000000000000000000000000) (bvsgt (x!125536 lt!613123) #b01111111111111111111111111111110) (bvslt lt!613125 #b00000000000000000000000000000000) (bvsge lt!613125 (size!46668 a!2901)) (bvslt (index!43721 lt!613123) #b00000000000000000000000000000000) (bvsge (index!43721 lt!613123) (size!46668 a!2901)) (not (= lt!613123 (Intermediate!10337 false (index!43721 lt!613123) (x!125536 lt!613123))))))))

(declare-fun b!1395915 () Bool)

(assert (=> b!1395915 (= e!790387 (not e!790389))))

(declare-fun res!934632 () Bool)

(assert (=> b!1395915 (=> res!934632 e!790389)))

(get-info :version)

(assert (=> b!1395915 (= res!934632 (or (not ((_ is Intermediate!10337) lt!613123)) (undefined!11149 lt!613123)))))

(assert (=> b!1395915 (= lt!613122 (Found!10337 j!112))))

(assert (=> b!1395915 (= lt!613122 (seekEntryOrOpen!0 (select (arr!46117 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395915 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613127 () Unit!46705)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46705)

(assert (=> b!1395915 (= lt!613127 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395915 (= lt!613123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613125 (select (arr!46117 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395915 (= lt!613125 (toIndex!0 (select (arr!46117 a!2901) j!112) mask!2840))))

(declare-fun b!1395913 () Bool)

(declare-fun res!934635 () Bool)

(assert (=> b!1395913 (=> (not res!934635) (not e!790387))))

(declare-datatypes ((List!32623 0))(
  ( (Nil!32620) (Cons!32619 (h!33860 (_ BitVec 64)) (t!47309 List!32623)) )
))
(declare-fun arrayNoDuplicates!0 (array!95522 (_ BitVec 32) List!32623) Bool)

(assert (=> b!1395913 (= res!934635 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32620))))

(declare-fun res!934638 () Bool)

(assert (=> start!119918 (=> (not res!934638) (not e!790387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119918 (= res!934638 (validMask!0 mask!2840))))

(assert (=> start!119918 e!790387))

(assert (=> start!119918 true))

(declare-fun array_inv!35398 (array!95522) Bool)

(assert (=> start!119918 (array_inv!35398 a!2901)))

(assert (= (and start!119918 res!934638) b!1395910))

(assert (= (and b!1395910 res!934636) b!1395907))

(assert (= (and b!1395907 res!934634) b!1395906))

(assert (= (and b!1395906 res!934639) b!1395912))

(assert (= (and b!1395912 res!934630) b!1395913))

(assert (= (and b!1395913 res!934635) b!1395915))

(assert (= (and b!1395915 (not res!934632)) b!1395911))

(assert (= (and b!1395911 (not res!934633)) b!1395914))

(assert (= (and b!1395914 (not res!934631)) b!1395908))

(assert (= (and b!1395908 (not res!934637)) b!1395909))

(declare-fun m!1282591 () Bool)

(assert (=> b!1395911 m!1282591))

(assert (=> b!1395911 m!1282591))

(declare-fun m!1282593 () Bool)

(assert (=> b!1395911 m!1282593))

(declare-fun m!1282595 () Bool)

(assert (=> b!1395911 m!1282595))

(declare-fun m!1282597 () Bool)

(assert (=> b!1395911 m!1282597))

(declare-fun m!1282599 () Bool)

(assert (=> b!1395912 m!1282599))

(declare-fun m!1282601 () Bool)

(assert (=> start!119918 m!1282601))

(declare-fun m!1282603 () Bool)

(assert (=> start!119918 m!1282603))

(declare-fun m!1282605 () Bool)

(assert (=> b!1395909 m!1282605))

(declare-fun m!1282607 () Bool)

(assert (=> b!1395907 m!1282607))

(assert (=> b!1395907 m!1282607))

(declare-fun m!1282609 () Bool)

(assert (=> b!1395907 m!1282609))

(declare-fun m!1282611 () Bool)

(assert (=> b!1395913 m!1282611))

(declare-fun m!1282613 () Bool)

(assert (=> b!1395906 m!1282613))

(assert (=> b!1395906 m!1282613))

(declare-fun m!1282615 () Bool)

(assert (=> b!1395906 m!1282615))

(assert (=> b!1395915 m!1282613))

(declare-fun m!1282617 () Bool)

(assert (=> b!1395915 m!1282617))

(assert (=> b!1395915 m!1282613))

(assert (=> b!1395915 m!1282613))

(declare-fun m!1282619 () Bool)

(assert (=> b!1395915 m!1282619))

(declare-fun m!1282621 () Bool)

(assert (=> b!1395915 m!1282621))

(assert (=> b!1395915 m!1282613))

(declare-fun m!1282623 () Bool)

(assert (=> b!1395915 m!1282623))

(declare-fun m!1282625 () Bool)

(assert (=> b!1395915 m!1282625))

(declare-fun m!1282627 () Bool)

(assert (=> b!1395908 m!1282627))

(declare-fun m!1282629 () Bool)

(assert (=> b!1395908 m!1282629))

(check-sat (not b!1395911) (not b!1395908) (not b!1395906) (not start!119918) (not b!1395907) (not b!1395915) (not b!1395913) (not b!1395912) (not b!1395909))
(check-sat)
