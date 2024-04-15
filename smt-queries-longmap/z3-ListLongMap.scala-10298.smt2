; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121106 () Bool)

(assert start!121106)

(declare-fun b!1408060 () Bool)

(declare-fun e!796919 () Bool)

(declare-fun e!796920 () Bool)

(assert (=> b!1408060 (= e!796919 (not e!796920))))

(declare-fun res!945835 () Bool)

(assert (=> b!1408060 (=> res!945835 e!796920)))

(declare-datatypes ((SeekEntryResult!10787 0))(
  ( (MissingZero!10787 (index!45525 (_ BitVec 32))) (Found!10787 (index!45526 (_ BitVec 32))) (Intermediate!10787 (undefined!11599 Bool) (index!45527 (_ BitVec 32)) (x!127129 (_ BitVec 32))) (Undefined!10787) (MissingVacant!10787 (index!45528 (_ BitVec 32))) )
))
(declare-fun lt!619956 () SeekEntryResult!10787)

(get-info :version)

(assert (=> b!1408060 (= res!945835 (or (not ((_ is Intermediate!10787) lt!619956)) (undefined!11599 lt!619956)))))

(declare-fun lt!619959 () SeekEntryResult!10787)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408060 (= lt!619959 (Found!10787 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96213 0))(
  ( (array!96214 (arr!46450 (Array (_ BitVec 32) (_ BitVec 64))) (size!47002 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96213)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96213 (_ BitVec 32)) SeekEntryResult!10787)

(assert (=> b!1408060 (= lt!619959 (seekEntryOrOpen!0 (select (arr!46450 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96213 (_ BitVec 32)) Bool)

(assert (=> b!1408060 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47391 0))(
  ( (Unit!47392) )
))
(declare-fun lt!619961 () Unit!47391)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47391)

(assert (=> b!1408060 (= lt!619961 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619957 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96213 (_ BitVec 32)) SeekEntryResult!10787)

(assert (=> b!1408060 (= lt!619956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619957 (select (arr!46450 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408060 (= lt!619957 (toIndex!0 (select (arr!46450 a!2901) j!112) mask!2840))))

(declare-fun b!1408061 () Bool)

(declare-fun res!945838 () Bool)

(assert (=> b!1408061 (=> (not res!945838) (not e!796919))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408061 (= res!945838 (validKeyInArray!0 (select (arr!46450 a!2901) i!1037)))))

(declare-fun b!1408062 () Bool)

(declare-fun res!945841 () Bool)

(assert (=> b!1408062 (=> (not res!945841) (not e!796919))))

(assert (=> b!1408062 (= res!945841 (validKeyInArray!0 (select (arr!46450 a!2901) j!112)))))

(declare-fun b!1408063 () Bool)

(declare-fun e!796922 () Bool)

(assert (=> b!1408063 (= e!796922 true)))

(declare-fun lt!619960 () (_ BitVec 64))

(declare-fun lt!619958 () array!96213)

(assert (=> b!1408063 (= lt!619959 (seekEntryOrOpen!0 lt!619960 lt!619958 mask!2840))))

(declare-fun lt!619955 () Unit!47391)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47391)

(assert (=> b!1408063 (= lt!619955 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!619957 (x!127129 lt!619956) (index!45527 lt!619956) mask!2840))))

(declare-fun b!1408064 () Bool)

(declare-fun res!945839 () Bool)

(assert (=> b!1408064 (=> (not res!945839) (not e!796919))))

(assert (=> b!1408064 (= res!945839 (and (= (size!47002 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47002 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47002 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408065 () Bool)

(assert (=> b!1408065 (= e!796920 e!796922)))

(declare-fun res!945837 () Bool)

(assert (=> b!1408065 (=> res!945837 e!796922)))

(assert (=> b!1408065 (= res!945837 (not (= lt!619956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!619960 mask!2840) lt!619960 lt!619958 mask!2840))))))

(assert (=> b!1408065 (= lt!619960 (select (store (arr!46450 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408065 (= lt!619958 (array!96214 (store (arr!46450 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901)))))

(declare-fun res!945833 () Bool)

(assert (=> start!121106 (=> (not res!945833) (not e!796919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121106 (= res!945833 (validMask!0 mask!2840))))

(assert (=> start!121106 e!796919))

(assert (=> start!121106 true))

(declare-fun array_inv!35683 (array!96213) Bool)

(assert (=> start!121106 (array_inv!35683 a!2901)))

(declare-fun b!1408066 () Bool)

(declare-fun res!945840 () Bool)

(assert (=> b!1408066 (=> (not res!945840) (not e!796919))))

(declare-datatypes ((List!33047 0))(
  ( (Nil!33044) (Cons!33043 (h!34306 (_ BitVec 64)) (t!47733 List!33047)) )
))
(declare-fun arrayNoDuplicates!0 (array!96213 (_ BitVec 32) List!33047) Bool)

(assert (=> b!1408066 (= res!945840 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33044))))

(declare-fun b!1408067 () Bool)

(declare-fun res!945834 () Bool)

(assert (=> b!1408067 (=> res!945834 e!796922)))

(assert (=> b!1408067 (= res!945834 (or (bvslt (x!127129 lt!619956) #b00000000000000000000000000000000) (bvsgt (x!127129 lt!619956) #b01111111111111111111111111111110) (bvslt lt!619957 #b00000000000000000000000000000000) (bvsge lt!619957 (size!47002 a!2901)) (bvslt (index!45527 lt!619956) #b00000000000000000000000000000000) (bvsge (index!45527 lt!619956) (size!47002 a!2901)) (not (= lt!619956 (Intermediate!10787 false (index!45527 lt!619956) (x!127129 lt!619956))))))))

(declare-fun b!1408068 () Bool)

(declare-fun res!945836 () Bool)

(assert (=> b!1408068 (=> (not res!945836) (not e!796919))))

(assert (=> b!1408068 (= res!945836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121106 res!945833) b!1408064))

(assert (= (and b!1408064 res!945839) b!1408061))

(assert (= (and b!1408061 res!945838) b!1408062))

(assert (= (and b!1408062 res!945841) b!1408068))

(assert (= (and b!1408068 res!945836) b!1408066))

(assert (= (and b!1408066 res!945840) b!1408060))

(assert (= (and b!1408060 (not res!945835)) b!1408065))

(assert (= (and b!1408065 (not res!945837)) b!1408067))

(assert (= (and b!1408067 (not res!945834)) b!1408063))

(declare-fun m!1296781 () Bool)

(assert (=> b!1408068 m!1296781))

(declare-fun m!1296783 () Bool)

(assert (=> b!1408065 m!1296783))

(assert (=> b!1408065 m!1296783))

(declare-fun m!1296785 () Bool)

(assert (=> b!1408065 m!1296785))

(declare-fun m!1296787 () Bool)

(assert (=> b!1408065 m!1296787))

(declare-fun m!1296789 () Bool)

(assert (=> b!1408065 m!1296789))

(declare-fun m!1296791 () Bool)

(assert (=> b!1408061 m!1296791))

(assert (=> b!1408061 m!1296791))

(declare-fun m!1296793 () Bool)

(assert (=> b!1408061 m!1296793))

(declare-fun m!1296795 () Bool)

(assert (=> b!1408063 m!1296795))

(declare-fun m!1296797 () Bool)

(assert (=> b!1408063 m!1296797))

(declare-fun m!1296799 () Bool)

(assert (=> b!1408060 m!1296799))

(declare-fun m!1296801 () Bool)

(assert (=> b!1408060 m!1296801))

(assert (=> b!1408060 m!1296799))

(declare-fun m!1296803 () Bool)

(assert (=> b!1408060 m!1296803))

(assert (=> b!1408060 m!1296799))

(declare-fun m!1296805 () Bool)

(assert (=> b!1408060 m!1296805))

(assert (=> b!1408060 m!1296799))

(declare-fun m!1296807 () Bool)

(assert (=> b!1408060 m!1296807))

(declare-fun m!1296809 () Bool)

(assert (=> b!1408060 m!1296809))

(declare-fun m!1296811 () Bool)

(assert (=> b!1408066 m!1296811))

(declare-fun m!1296813 () Bool)

(assert (=> start!121106 m!1296813))

(declare-fun m!1296815 () Bool)

(assert (=> start!121106 m!1296815))

(assert (=> b!1408062 m!1296799))

(assert (=> b!1408062 m!1296799))

(declare-fun m!1296817 () Bool)

(assert (=> b!1408062 m!1296817))

(check-sat (not b!1408062) (not b!1408063) (not b!1408061) (not start!121106) (not b!1408060) (not b!1408065) (not b!1408066) (not b!1408068))
(check-sat)
