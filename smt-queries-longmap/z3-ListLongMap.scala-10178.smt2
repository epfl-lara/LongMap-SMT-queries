; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119990 () Bool)

(assert start!119990)

(declare-fun b!1396798 () Bool)

(declare-fun e!790780 () Bool)

(declare-fun e!790783 () Bool)

(assert (=> b!1396798 (= e!790780 (not e!790783))))

(declare-fun res!935765 () Bool)

(assert (=> b!1396798 (=> res!935765 e!790783)))

(declare-datatypes ((SeekEntryResult!10433 0))(
  ( (MissingZero!10433 (index!44103 (_ BitVec 32))) (Found!10433 (index!44104 (_ BitVec 32))) (Intermediate!10433 (undefined!11245 Bool) (index!44105 (_ BitVec 32)) (x!125764 (_ BitVec 32))) (Undefined!10433) (MissingVacant!10433 (index!44106 (_ BitVec 32))) )
))
(declare-fun lt!613581 () SeekEntryResult!10433)

(get-info :version)

(assert (=> b!1396798 (= res!935765 (or (not ((_ is Intermediate!10433) lt!613581)) (undefined!11245 lt!613581)))))

(declare-fun e!790781 () Bool)

(assert (=> b!1396798 e!790781))

(declare-fun res!935766 () Bool)

(assert (=> b!1396798 (=> (not res!935766) (not e!790781))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95472 0))(
  ( (array!95473 (arr!46090 (Array (_ BitVec 32) (_ BitVec 64))) (size!46642 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95472)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95472 (_ BitVec 32)) Bool)

(assert (=> b!1396798 (= res!935766 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46713 0))(
  ( (Unit!46714) )
))
(declare-fun lt!613582 () Unit!46713)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46713)

(assert (=> b!1396798 (= lt!613582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613579 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95472 (_ BitVec 32)) SeekEntryResult!10433)

(assert (=> b!1396798 (= lt!613581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613579 (select (arr!46090 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396798 (= lt!613579 (toIndex!0 (select (arr!46090 a!2901) j!112) mask!2840))))

(declare-fun b!1396799 () Bool)

(declare-fun e!790784 () Bool)

(assert (=> b!1396799 (= e!790784 true)))

(declare-fun lt!613578 () array!95472)

(declare-fun lt!613580 () SeekEntryResult!10433)

(declare-fun lt!613583 () (_ BitVec 64))

(assert (=> b!1396799 (= lt!613580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613579 lt!613583 lt!613578 mask!2840))))

(declare-fun b!1396800 () Bool)

(declare-fun res!935763 () Bool)

(assert (=> b!1396800 (=> (not res!935763) (not e!790780))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396800 (= res!935763 (validKeyInArray!0 (select (arr!46090 a!2901) i!1037)))))

(declare-fun b!1396801 () Bool)

(declare-fun res!935768 () Bool)

(assert (=> b!1396801 (=> (not res!935768) (not e!790780))))

(assert (=> b!1396801 (= res!935768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396802 () Bool)

(declare-fun res!935770 () Bool)

(assert (=> b!1396802 (=> (not res!935770) (not e!790780))))

(assert (=> b!1396802 (= res!935770 (and (= (size!46642 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46642 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46642 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396803 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95472 (_ BitVec 32)) SeekEntryResult!10433)

(assert (=> b!1396803 (= e!790781 (= (seekEntryOrOpen!0 (select (arr!46090 a!2901) j!112) a!2901 mask!2840) (Found!10433 j!112)))))

(declare-fun b!1396804 () Bool)

(declare-fun res!935762 () Bool)

(assert (=> b!1396804 (=> (not res!935762) (not e!790780))))

(assert (=> b!1396804 (= res!935762 (validKeyInArray!0 (select (arr!46090 a!2901) j!112)))))

(declare-fun b!1396805 () Bool)

(assert (=> b!1396805 (= e!790783 e!790784)))

(declare-fun res!935764 () Bool)

(assert (=> b!1396805 (=> res!935764 e!790784)))

(declare-fun lt!613577 () SeekEntryResult!10433)

(assert (=> b!1396805 (= res!935764 (or (= lt!613581 lt!613577) (not ((_ is Intermediate!10433) lt!613577)) (bvslt (x!125764 lt!613581) #b00000000000000000000000000000000) (bvsgt (x!125764 lt!613581) #b01111111111111111111111111111110) (bvslt lt!613579 #b00000000000000000000000000000000) (bvsge lt!613579 (size!46642 a!2901)) (bvslt (index!44105 lt!613581) #b00000000000000000000000000000000) (bvsge (index!44105 lt!613581) (size!46642 a!2901)) (not (= lt!613581 (Intermediate!10433 false (index!44105 lt!613581) (x!125764 lt!613581)))) (not (= lt!613577 (Intermediate!10433 (undefined!11245 lt!613577) (index!44105 lt!613577) (x!125764 lt!613577))))))))

(assert (=> b!1396805 (= lt!613577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613583 mask!2840) lt!613583 lt!613578 mask!2840))))

(assert (=> b!1396805 (= lt!613583 (select (store (arr!46090 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396805 (= lt!613578 (array!95473 (store (arr!46090 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46642 a!2901)))))

(declare-fun b!1396806 () Bool)

(declare-fun res!935769 () Bool)

(assert (=> b!1396806 (=> (not res!935769) (not e!790780))))

(declare-datatypes ((List!32687 0))(
  ( (Nil!32684) (Cons!32683 (h!33925 (_ BitVec 64)) (t!47373 List!32687)) )
))
(declare-fun arrayNoDuplicates!0 (array!95472 (_ BitVec 32) List!32687) Bool)

(assert (=> b!1396806 (= res!935769 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32684))))

(declare-fun res!935767 () Bool)

(assert (=> start!119990 (=> (not res!935767) (not e!790780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119990 (= res!935767 (validMask!0 mask!2840))))

(assert (=> start!119990 e!790780))

(assert (=> start!119990 true))

(declare-fun array_inv!35323 (array!95472) Bool)

(assert (=> start!119990 (array_inv!35323 a!2901)))

(assert (= (and start!119990 res!935767) b!1396802))

(assert (= (and b!1396802 res!935770) b!1396800))

(assert (= (and b!1396800 res!935763) b!1396804))

(assert (= (and b!1396804 res!935762) b!1396801))

(assert (= (and b!1396801 res!935768) b!1396806))

(assert (= (and b!1396806 res!935769) b!1396798))

(assert (= (and b!1396798 res!935766) b!1396803))

(assert (= (and b!1396798 (not res!935765)) b!1396805))

(assert (= (and b!1396805 (not res!935764)) b!1396799))

(declare-fun m!1282927 () Bool)

(assert (=> b!1396805 m!1282927))

(assert (=> b!1396805 m!1282927))

(declare-fun m!1282929 () Bool)

(assert (=> b!1396805 m!1282929))

(declare-fun m!1282931 () Bool)

(assert (=> b!1396805 m!1282931))

(declare-fun m!1282933 () Bool)

(assert (=> b!1396805 m!1282933))

(declare-fun m!1282935 () Bool)

(assert (=> b!1396801 m!1282935))

(declare-fun m!1282937 () Bool)

(assert (=> start!119990 m!1282937))

(declare-fun m!1282939 () Bool)

(assert (=> start!119990 m!1282939))

(declare-fun m!1282941 () Bool)

(assert (=> b!1396798 m!1282941))

(declare-fun m!1282943 () Bool)

(assert (=> b!1396798 m!1282943))

(assert (=> b!1396798 m!1282941))

(declare-fun m!1282945 () Bool)

(assert (=> b!1396798 m!1282945))

(declare-fun m!1282947 () Bool)

(assert (=> b!1396798 m!1282947))

(assert (=> b!1396798 m!1282941))

(declare-fun m!1282949 () Bool)

(assert (=> b!1396798 m!1282949))

(declare-fun m!1282951 () Bool)

(assert (=> b!1396806 m!1282951))

(assert (=> b!1396804 m!1282941))

(assert (=> b!1396804 m!1282941))

(declare-fun m!1282953 () Bool)

(assert (=> b!1396804 m!1282953))

(declare-fun m!1282955 () Bool)

(assert (=> b!1396799 m!1282955))

(declare-fun m!1282957 () Bool)

(assert (=> b!1396800 m!1282957))

(assert (=> b!1396800 m!1282957))

(declare-fun m!1282959 () Bool)

(assert (=> b!1396800 m!1282959))

(assert (=> b!1396803 m!1282941))

(assert (=> b!1396803 m!1282941))

(declare-fun m!1282961 () Bool)

(assert (=> b!1396803 m!1282961))

(check-sat (not b!1396806) (not b!1396804) (not start!119990) (not b!1396801) (not b!1396800) (not b!1396799) (not b!1396805) (not b!1396798) (not b!1396803))
(check-sat)
