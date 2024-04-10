; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127348 () Bool)

(assert start!127348)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!838220 () Bool)

(declare-fun lt!652140 () (_ BitVec 64))

(declare-fun b!1496602 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99810 0))(
  ( (array!99811 (arr!48169 (Array (_ BitVec 32) (_ BitVec 64))) (size!48719 (_ BitVec 32))) )
))
(declare-fun lt!652142 () array!99810)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12409 0))(
  ( (MissingZero!12409 (index!52028 (_ BitVec 32))) (Found!12409 (index!52029 (_ BitVec 32))) (Intermediate!12409 (undefined!13221 Bool) (index!52030 (_ BitVec 32)) (x!133651 (_ BitVec 32))) (Undefined!12409) (MissingVacant!12409 (index!52031 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99810 (_ BitVec 32)) SeekEntryResult!12409)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99810 (_ BitVec 32)) SeekEntryResult!12409)

(assert (=> b!1496602 (= e!838220 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652140 lt!652142 mask!2687) (seekEntryOrOpen!0 lt!652140 lt!652142 mask!2687)))))

(declare-fun b!1496603 () Bool)

(declare-fun res!1017919 () Bool)

(declare-fun e!838225 () Bool)

(assert (=> b!1496603 (=> (not res!1017919) (not e!838225))))

(declare-fun a!2862 () array!99810)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496603 (= res!1017919 (= (seekEntryOrOpen!0 (select (arr!48169 a!2862) j!93) a!2862 mask!2687) (Found!12409 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1496604 () Bool)

(assert (=> b!1496604 (= e!838225 (or (= (select (arr!48169 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48169 a!2862) intermediateBeforeIndex!19) (select (arr!48169 a!2862) j!93))))))

(declare-fun b!1496605 () Bool)

(declare-fun res!1017922 () Bool)

(declare-fun e!838223 () Bool)

(assert (=> b!1496605 (=> (not res!1017922) (not e!838223))))

(declare-fun lt!652141 () SeekEntryResult!12409)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99810 (_ BitVec 32)) SeekEntryResult!12409)

(assert (=> b!1496605 (= res!1017922 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48169 a!2862) j!93) a!2862 mask!2687) lt!652141))))

(declare-fun b!1496606 () Bool)

(declare-fun res!1017933 () Bool)

(declare-fun e!838224 () Bool)

(assert (=> b!1496606 (=> res!1017933 e!838224)))

(declare-fun lt!652144 () (_ BitVec 32))

(assert (=> b!1496606 (= res!1017933 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652144 (select (arr!48169 a!2862) j!93) a!2862 mask!2687) lt!652141)))))

(declare-fun b!1496607 () Bool)

(declare-fun res!1017921 () Bool)

(declare-fun e!838221 () Bool)

(assert (=> b!1496607 (=> (not res!1017921) (not e!838221))))

(declare-datatypes ((List!34670 0))(
  ( (Nil!34667) (Cons!34666 (h!36063 (_ BitVec 64)) (t!49364 List!34670)) )
))
(declare-fun arrayNoDuplicates!0 (array!99810 (_ BitVec 32) List!34670) Bool)

(assert (=> b!1496607 (= res!1017921 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34667))))

(declare-fun b!1496608 () Bool)

(declare-fun e!838228 () Bool)

(assert (=> b!1496608 (= e!838228 e!838224)))

(declare-fun res!1017926 () Bool)

(assert (=> b!1496608 (=> res!1017926 e!838224)))

(assert (=> b!1496608 (= res!1017926 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652144 #b00000000000000000000000000000000) (bvsge lt!652144 (size!48719 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496608 (= lt!652144 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496609 () Bool)

(declare-fun e!838226 () Bool)

(assert (=> b!1496609 (= e!838226 e!838223)))

(declare-fun res!1017918 () Bool)

(assert (=> b!1496609 (=> (not res!1017918) (not e!838223))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496609 (= res!1017918 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48169 a!2862) j!93) mask!2687) (select (arr!48169 a!2862) j!93) a!2862 mask!2687) lt!652141))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496609 (= lt!652141 (Intermediate!12409 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496610 () Bool)

(declare-fun res!1017927 () Bool)

(assert (=> b!1496610 (=> (not res!1017927) (not e!838221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99810 (_ BitVec 32)) Bool)

(assert (=> b!1496610 (= res!1017927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496611 () Bool)

(declare-fun res!1017920 () Bool)

(assert (=> b!1496611 (=> (not res!1017920) (not e!838221))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496611 (= res!1017920 (validKeyInArray!0 (select (arr!48169 a!2862) i!1006)))))

(declare-fun b!1496612 () Bool)

(assert (=> b!1496612 (= e!838221 e!838226)))

(declare-fun res!1017925 () Bool)

(assert (=> b!1496612 (=> (not res!1017925) (not e!838226))))

(assert (=> b!1496612 (= res!1017925 (= (select (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496612 (= lt!652142 (array!99811 (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48719 a!2862)))))

(declare-fun b!1496613 () Bool)

(declare-fun res!1017917 () Bool)

(assert (=> b!1496613 (=> res!1017917 e!838224)))

(declare-fun e!838219 () Bool)

(assert (=> b!1496613 (= res!1017917 e!838219)))

(declare-fun c!138878 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496613 (= c!138878 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496614 () Bool)

(declare-fun res!1017929 () Bool)

(assert (=> b!1496614 (=> (not res!1017929) (not e!838221))))

(assert (=> b!1496614 (= res!1017929 (and (= (size!48719 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48719 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48719 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496615 () Bool)

(declare-fun res!1017924 () Bool)

(assert (=> b!1496615 (=> (not res!1017924) (not e!838221))))

(assert (=> b!1496615 (= res!1017924 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48719 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48719 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48719 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496616 () Bool)

(assert (=> b!1496616 (= e!838224 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun res!1017930 () Bool)

(assert (=> start!127348 (=> (not res!1017930) (not e!838221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127348 (= res!1017930 (validMask!0 mask!2687))))

(assert (=> start!127348 e!838221))

(assert (=> start!127348 true))

(declare-fun array_inv!37197 (array!99810) Bool)

(assert (=> start!127348 (array_inv!37197 a!2862)))

(declare-fun b!1496617 () Bool)

(declare-fun e!838227 () Bool)

(assert (=> b!1496617 (= e!838223 e!838227)))

(declare-fun res!1017934 () Bool)

(assert (=> b!1496617 (=> (not res!1017934) (not e!838227))))

(declare-fun lt!652143 () SeekEntryResult!12409)

(assert (=> b!1496617 (= res!1017934 (= lt!652143 (Intermediate!12409 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496617 (= lt!652143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652140 mask!2687) lt!652140 lt!652142 mask!2687))))

(assert (=> b!1496617 (= lt!652140 (select (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496618 () Bool)

(assert (=> b!1496618 (= e!838219 (not (= lt!652143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652144 lt!652140 lt!652142 mask!2687))))))

(declare-fun b!1496619 () Bool)

(declare-fun res!1017916 () Bool)

(assert (=> b!1496619 (=> (not res!1017916) (not e!838227))))

(assert (=> b!1496619 (= res!1017916 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496620 () Bool)

(assert (=> b!1496620 (= e!838227 (not e!838228))))

(declare-fun res!1017928 () Bool)

(assert (=> b!1496620 (=> res!1017928 e!838228)))

(assert (=> b!1496620 (= res!1017928 (or (and (= (select (arr!48169 a!2862) index!646) (select (store (arr!48169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48169 a!2862) index!646) (select (arr!48169 a!2862) j!93))) (= (select (arr!48169 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496620 e!838225))

(declare-fun res!1017932 () Bool)

(assert (=> b!1496620 (=> (not res!1017932) (not e!838225))))

(assert (=> b!1496620 (= res!1017932 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50158 0))(
  ( (Unit!50159) )
))
(declare-fun lt!652139 () Unit!50158)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50158)

(assert (=> b!1496620 (= lt!652139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496621 () Bool)

(assert (=> b!1496621 (= e!838220 (= lt!652143 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652140 lt!652142 mask!2687)))))

(declare-fun b!1496622 () Bool)

(declare-fun res!1017931 () Bool)

(assert (=> b!1496622 (=> (not res!1017931) (not e!838221))))

(assert (=> b!1496622 (= res!1017931 (validKeyInArray!0 (select (arr!48169 a!2862) j!93)))))

(declare-fun b!1496623 () Bool)

(assert (=> b!1496623 (= e!838219 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652144 intermediateAfterIndex!19 lt!652140 lt!652142 mask!2687) (seekEntryOrOpen!0 lt!652140 lt!652142 mask!2687))))))

(declare-fun b!1496624 () Bool)

(declare-fun res!1017923 () Bool)

(assert (=> b!1496624 (=> (not res!1017923) (not e!838227))))

(assert (=> b!1496624 (= res!1017923 e!838220)))

(declare-fun c!138877 () Bool)

(assert (=> b!1496624 (= c!138877 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!127348 res!1017930) b!1496614))

(assert (= (and b!1496614 res!1017929) b!1496611))

(assert (= (and b!1496611 res!1017920) b!1496622))

(assert (= (and b!1496622 res!1017931) b!1496610))

(assert (= (and b!1496610 res!1017927) b!1496607))

(assert (= (and b!1496607 res!1017921) b!1496615))

(assert (= (and b!1496615 res!1017924) b!1496612))

(assert (= (and b!1496612 res!1017925) b!1496609))

(assert (= (and b!1496609 res!1017918) b!1496605))

(assert (= (and b!1496605 res!1017922) b!1496617))

(assert (= (and b!1496617 res!1017934) b!1496624))

(assert (= (and b!1496624 c!138877) b!1496621))

(assert (= (and b!1496624 (not c!138877)) b!1496602))

(assert (= (and b!1496624 res!1017923) b!1496619))

(assert (= (and b!1496619 res!1017916) b!1496620))

(assert (= (and b!1496620 res!1017932) b!1496603))

(assert (= (and b!1496603 res!1017919) b!1496604))

(assert (= (and b!1496620 (not res!1017928)) b!1496608))

(assert (= (and b!1496608 (not res!1017926)) b!1496606))

(assert (= (and b!1496606 (not res!1017933)) b!1496613))

(assert (= (and b!1496613 c!138878) b!1496618))

(assert (= (and b!1496613 (not c!138878)) b!1496623))

(assert (= (and b!1496613 (not res!1017917)) b!1496616))

(declare-fun m!1379757 () Bool)

(assert (=> b!1496604 m!1379757))

(declare-fun m!1379759 () Bool)

(assert (=> b!1496604 m!1379759))

(declare-fun m!1379761 () Bool)

(assert (=> b!1496620 m!1379761))

(declare-fun m!1379763 () Bool)

(assert (=> b!1496620 m!1379763))

(declare-fun m!1379765 () Bool)

(assert (=> b!1496620 m!1379765))

(declare-fun m!1379767 () Bool)

(assert (=> b!1496620 m!1379767))

(declare-fun m!1379769 () Bool)

(assert (=> b!1496620 m!1379769))

(assert (=> b!1496620 m!1379759))

(declare-fun m!1379771 () Bool)

(assert (=> b!1496607 m!1379771))

(assert (=> b!1496603 m!1379759))

(assert (=> b!1496603 m!1379759))

(declare-fun m!1379773 () Bool)

(assert (=> b!1496603 m!1379773))

(declare-fun m!1379775 () Bool)

(assert (=> b!1496621 m!1379775))

(declare-fun m!1379777 () Bool)

(assert (=> b!1496623 m!1379777))

(declare-fun m!1379779 () Bool)

(assert (=> b!1496623 m!1379779))

(declare-fun m!1379781 () Bool)

(assert (=> b!1496608 m!1379781))

(declare-fun m!1379783 () Bool)

(assert (=> b!1496618 m!1379783))

(declare-fun m!1379785 () Bool)

(assert (=> b!1496602 m!1379785))

(assert (=> b!1496602 m!1379779))

(declare-fun m!1379787 () Bool)

(assert (=> b!1496617 m!1379787))

(assert (=> b!1496617 m!1379787))

(declare-fun m!1379789 () Bool)

(assert (=> b!1496617 m!1379789))

(assert (=> b!1496617 m!1379763))

(declare-fun m!1379791 () Bool)

(assert (=> b!1496617 m!1379791))

(assert (=> b!1496612 m!1379763))

(declare-fun m!1379793 () Bool)

(assert (=> b!1496612 m!1379793))

(assert (=> b!1496609 m!1379759))

(assert (=> b!1496609 m!1379759))

(declare-fun m!1379795 () Bool)

(assert (=> b!1496609 m!1379795))

(assert (=> b!1496609 m!1379795))

(assert (=> b!1496609 m!1379759))

(declare-fun m!1379797 () Bool)

(assert (=> b!1496609 m!1379797))

(declare-fun m!1379799 () Bool)

(assert (=> start!127348 m!1379799))

(declare-fun m!1379801 () Bool)

(assert (=> start!127348 m!1379801))

(declare-fun m!1379803 () Bool)

(assert (=> b!1496610 m!1379803))

(assert (=> b!1496622 m!1379759))

(assert (=> b!1496622 m!1379759))

(declare-fun m!1379805 () Bool)

(assert (=> b!1496622 m!1379805))

(assert (=> b!1496606 m!1379759))

(assert (=> b!1496606 m!1379759))

(declare-fun m!1379807 () Bool)

(assert (=> b!1496606 m!1379807))

(assert (=> b!1496605 m!1379759))

(assert (=> b!1496605 m!1379759))

(declare-fun m!1379809 () Bool)

(assert (=> b!1496605 m!1379809))

(declare-fun m!1379811 () Bool)

(assert (=> b!1496611 m!1379811))

(assert (=> b!1496611 m!1379811))

(declare-fun m!1379813 () Bool)

(assert (=> b!1496611 m!1379813))

(push 1)

(assert (not b!1496606))

(assert (not b!1496611))

(assert (not b!1496620))

(assert (not b!1496610))

(assert (not b!1496607))

(assert (not b!1496617))

(assert (not b!1496622))

(assert (not b!1496618))

(assert (not b!1496602))

(assert (not b!1496605))

(assert (not b!1496609))

(assert (not b!1496603))

(assert (not b!1496608))

(assert (not start!127348))

(assert (not b!1496623))

(assert (not b!1496621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

