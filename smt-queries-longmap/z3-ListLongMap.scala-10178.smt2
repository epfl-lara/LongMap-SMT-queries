; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119996 () Bool)

(assert start!119996)

(declare-fun b!1396906 () Bool)

(declare-fun e!790834 () Bool)

(declare-fun e!790837 () Bool)

(assert (=> b!1396906 (= e!790834 (not e!790837))))

(declare-fun res!935821 () Bool)

(assert (=> b!1396906 (=> res!935821 e!790837)))

(declare-datatypes ((SeekEntryResult!10433 0))(
  ( (MissingZero!10433 (index!44103 (_ BitVec 32))) (Found!10433 (index!44104 (_ BitVec 32))) (Intermediate!10433 (undefined!11245 Bool) (index!44105 (_ BitVec 32)) (x!125767 (_ BitVec 32))) (Undefined!10433) (MissingVacant!10433 (index!44106 (_ BitVec 32))) )
))
(declare-fun lt!613792 () SeekEntryResult!10433)

(get-info :version)

(assert (=> b!1396906 (= res!935821 (or (not ((_ is Intermediate!10433) lt!613792)) (undefined!11245 lt!613792)))))

(declare-fun e!790836 () Bool)

(assert (=> b!1396906 e!790836))

(declare-fun res!935823 () Bool)

(assert (=> b!1396906 (=> (not res!935823) (not e!790836))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95525 0))(
  ( (array!95526 (arr!46116 (Array (_ BitVec 32) (_ BitVec 64))) (size!46666 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95525)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95525 (_ BitVec 32)) Bool)

(assert (=> b!1396906 (= res!935823 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46870 0))(
  ( (Unit!46871) )
))
(declare-fun lt!613793 () Unit!46870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46870)

(assert (=> b!1396906 (= lt!613793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613794 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95525 (_ BitVec 32)) SeekEntryResult!10433)

(assert (=> b!1396906 (= lt!613792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613794 (select (arr!46116 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396906 (= lt!613794 (toIndex!0 (select (arr!46116 a!2901) j!112) mask!2840))))

(declare-fun b!1396907 () Bool)

(declare-fun res!935826 () Bool)

(assert (=> b!1396907 (=> (not res!935826) (not e!790834))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396907 (= res!935826 (and (= (size!46666 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46666 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46666 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!935820 () Bool)

(assert (=> start!119996 (=> (not res!935820) (not e!790834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119996 (= res!935820 (validMask!0 mask!2840))))

(assert (=> start!119996 e!790834))

(assert (=> start!119996 true))

(declare-fun array_inv!35144 (array!95525) Bool)

(assert (=> start!119996 (array_inv!35144 a!2901)))

(declare-fun b!1396908 () Bool)

(declare-fun res!935827 () Bool)

(assert (=> b!1396908 (=> (not res!935827) (not e!790834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396908 (= res!935827 (validKeyInArray!0 (select (arr!46116 a!2901) j!112)))))

(declare-fun b!1396909 () Bool)

(declare-fun res!935825 () Bool)

(assert (=> b!1396909 (=> (not res!935825) (not e!790834))))

(declare-datatypes ((List!32635 0))(
  ( (Nil!32632) (Cons!32631 (h!33873 (_ BitVec 64)) (t!47329 List!32635)) )
))
(declare-fun arrayNoDuplicates!0 (array!95525 (_ BitVec 32) List!32635) Bool)

(assert (=> b!1396909 (= res!935825 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32632))))

(declare-fun b!1396910 () Bool)

(declare-fun res!935824 () Bool)

(assert (=> b!1396910 (=> (not res!935824) (not e!790834))))

(assert (=> b!1396910 (= res!935824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396911 () Bool)

(declare-fun res!935819 () Bool)

(assert (=> b!1396911 (=> (not res!935819) (not e!790834))))

(assert (=> b!1396911 (= res!935819 (validKeyInArray!0 (select (arr!46116 a!2901) i!1037)))))

(declare-fun b!1396912 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95525 (_ BitVec 32)) SeekEntryResult!10433)

(assert (=> b!1396912 (= e!790836 (= (seekEntryOrOpen!0 (select (arr!46116 a!2901) j!112) a!2901 mask!2840) (Found!10433 j!112)))))

(declare-fun b!1396913 () Bool)

(declare-fun e!790835 () Bool)

(assert (=> b!1396913 (= e!790835 true)))

(declare-fun lt!613791 () (_ BitVec 64))

(declare-fun lt!613789 () SeekEntryResult!10433)

(declare-fun lt!613790 () array!95525)

(assert (=> b!1396913 (= lt!613789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613794 lt!613791 lt!613790 mask!2840))))

(declare-fun b!1396914 () Bool)

(assert (=> b!1396914 (= e!790837 e!790835)))

(declare-fun res!935822 () Bool)

(assert (=> b!1396914 (=> res!935822 e!790835)))

(declare-fun lt!613788 () SeekEntryResult!10433)

(assert (=> b!1396914 (= res!935822 (or (= lt!613792 lt!613788) (not ((_ is Intermediate!10433) lt!613788)) (bvslt (x!125767 lt!613792) #b00000000000000000000000000000000) (bvsgt (x!125767 lt!613792) #b01111111111111111111111111111110) (bvslt lt!613794 #b00000000000000000000000000000000) (bvsge lt!613794 (size!46666 a!2901)) (bvslt (index!44105 lt!613792) #b00000000000000000000000000000000) (bvsge (index!44105 lt!613792) (size!46666 a!2901)) (not (= lt!613792 (Intermediate!10433 false (index!44105 lt!613792) (x!125767 lt!613792)))) (not (= lt!613788 (Intermediate!10433 (undefined!11245 lt!613788) (index!44105 lt!613788) (x!125767 lt!613788))))))))

(assert (=> b!1396914 (= lt!613788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613791 mask!2840) lt!613791 lt!613790 mask!2840))))

(assert (=> b!1396914 (= lt!613791 (select (store (arr!46116 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396914 (= lt!613790 (array!95526 (store (arr!46116 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46666 a!2901)))))

(assert (= (and start!119996 res!935820) b!1396907))

(assert (= (and b!1396907 res!935826) b!1396911))

(assert (= (and b!1396911 res!935819) b!1396908))

(assert (= (and b!1396908 res!935827) b!1396910))

(assert (= (and b!1396910 res!935824) b!1396909))

(assert (= (and b!1396909 res!935825) b!1396906))

(assert (= (and b!1396906 res!935823) b!1396912))

(assert (= (and b!1396906 (not res!935821)) b!1396914))

(assert (= (and b!1396914 (not res!935822)) b!1396913))

(declare-fun m!1283499 () Bool)

(assert (=> b!1396912 m!1283499))

(assert (=> b!1396912 m!1283499))

(declare-fun m!1283501 () Bool)

(assert (=> b!1396912 m!1283501))

(declare-fun m!1283503 () Bool)

(assert (=> start!119996 m!1283503))

(declare-fun m!1283505 () Bool)

(assert (=> start!119996 m!1283505))

(declare-fun m!1283507 () Bool)

(assert (=> b!1396909 m!1283507))

(assert (=> b!1396906 m!1283499))

(declare-fun m!1283509 () Bool)

(assert (=> b!1396906 m!1283509))

(assert (=> b!1396906 m!1283499))

(declare-fun m!1283511 () Bool)

(assert (=> b!1396906 m!1283511))

(assert (=> b!1396906 m!1283499))

(declare-fun m!1283513 () Bool)

(assert (=> b!1396906 m!1283513))

(declare-fun m!1283515 () Bool)

(assert (=> b!1396906 m!1283515))

(assert (=> b!1396908 m!1283499))

(assert (=> b!1396908 m!1283499))

(declare-fun m!1283517 () Bool)

(assert (=> b!1396908 m!1283517))

(declare-fun m!1283519 () Bool)

(assert (=> b!1396910 m!1283519))

(declare-fun m!1283521 () Bool)

(assert (=> b!1396913 m!1283521))

(declare-fun m!1283523 () Bool)

(assert (=> b!1396911 m!1283523))

(assert (=> b!1396911 m!1283523))

(declare-fun m!1283525 () Bool)

(assert (=> b!1396911 m!1283525))

(declare-fun m!1283527 () Bool)

(assert (=> b!1396914 m!1283527))

(assert (=> b!1396914 m!1283527))

(declare-fun m!1283529 () Bool)

(assert (=> b!1396914 m!1283529))

(declare-fun m!1283531 () Bool)

(assert (=> b!1396914 m!1283531))

(declare-fun m!1283533 () Bool)

(assert (=> b!1396914 m!1283533))

(check-sat (not b!1396909) (not b!1396914) (not b!1396910) (not b!1396906) (not b!1396908) (not b!1396911) (not b!1396913) (not b!1396912) (not start!119996))
(check-sat)
