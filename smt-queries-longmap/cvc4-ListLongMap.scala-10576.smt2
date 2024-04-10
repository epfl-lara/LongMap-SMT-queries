; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124598 () Bool)

(assert start!124598)

(declare-fun b!1442642 () Bool)

(declare-fun e!813067 () Bool)

(assert (=> b!1442642 (= e!813067 (not true))))

(declare-fun e!813064 () Bool)

(assert (=> b!1442642 e!813064))

(declare-fun res!974850 () Bool)

(assert (=> b!1442642 (=> (not res!974850) (not e!813064))))

(declare-datatypes ((array!98046 0))(
  ( (array!98047 (arr!47311 (Array (_ BitVec 32) (_ BitVec 64))) (size!47861 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98046)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98046 (_ BitVec 32)) Bool)

(assert (=> b!1442642 (= res!974850 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48622 0))(
  ( (Unit!48623) )
))
(declare-fun lt!633622 () Unit!48622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48622)

(assert (=> b!1442642 (= lt!633622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!813065 () Bool)

(declare-fun lt!633620 () array!98046)

(declare-fun b!1442643 () Bool)

(declare-fun lt!633623 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11563 0))(
  ( (MissingZero!11563 (index!48644 (_ BitVec 32))) (Found!11563 (index!48645 (_ BitVec 32))) (Intermediate!11563 (undefined!12375 Bool) (index!48646 (_ BitVec 32)) (x!130348 (_ BitVec 32))) (Undefined!11563) (MissingVacant!11563 (index!48647 (_ BitVec 32))) )
))
(declare-fun lt!633621 () SeekEntryResult!11563)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98046 (_ BitVec 32)) SeekEntryResult!11563)

(assert (=> b!1442643 (= e!813065 (= lt!633621 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633623 lt!633620 mask!2687)))))

(declare-fun res!974851 () Bool)

(declare-fun e!813062 () Bool)

(assert (=> start!124598 (=> (not res!974851) (not e!813062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124598 (= res!974851 (validMask!0 mask!2687))))

(assert (=> start!124598 e!813062))

(assert (=> start!124598 true))

(declare-fun array_inv!36339 (array!98046) Bool)

(assert (=> start!124598 (array_inv!36339 a!2862)))

(declare-fun b!1442644 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98046 (_ BitVec 32)) SeekEntryResult!11563)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98046 (_ BitVec 32)) SeekEntryResult!11563)

(assert (=> b!1442644 (= e!813065 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633623 lt!633620 mask!2687) (seekEntryOrOpen!0 lt!633623 lt!633620 mask!2687)))))

(declare-fun b!1442645 () Bool)

(declare-fun res!974846 () Bool)

(assert (=> b!1442645 (=> (not res!974846) (not e!813062))))

(assert (=> b!1442645 (= res!974846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442646 () Bool)

(declare-fun res!974847 () Bool)

(assert (=> b!1442646 (=> (not res!974847) (not e!813064))))

(assert (=> b!1442646 (= res!974847 (= (seekEntryOrOpen!0 (select (arr!47311 a!2862) j!93) a!2862 mask!2687) (Found!11563 j!93)))))

(declare-fun b!1442647 () Bool)

(declare-fun e!813068 () Bool)

(assert (=> b!1442647 (= e!813068 e!813067)))

(declare-fun res!974837 () Bool)

(assert (=> b!1442647 (=> (not res!974837) (not e!813067))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442647 (= res!974837 (= lt!633621 (Intermediate!11563 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442647 (= lt!633621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633623 mask!2687) lt!633623 lt!633620 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442647 (= lt!633623 (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442648 () Bool)

(declare-fun res!974849 () Bool)

(assert (=> b!1442648 (=> (not res!974849) (not e!813067))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442648 (= res!974849 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442649 () Bool)

(declare-fun res!974841 () Bool)

(assert (=> b!1442649 (=> (not res!974841) (not e!813062))))

(assert (=> b!1442649 (= res!974841 (and (= (size!47861 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47861 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47861 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442650 () Bool)

(declare-fun res!974844 () Bool)

(assert (=> b!1442650 (=> (not res!974844) (not e!813062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442650 (= res!974844 (validKeyInArray!0 (select (arr!47311 a!2862) j!93)))))

(declare-fun b!1442651 () Bool)

(declare-fun res!974840 () Bool)

(assert (=> b!1442651 (=> (not res!974840) (not e!813062))))

(declare-datatypes ((List!33812 0))(
  ( (Nil!33809) (Cons!33808 (h!35158 (_ BitVec 64)) (t!48506 List!33812)) )
))
(declare-fun arrayNoDuplicates!0 (array!98046 (_ BitVec 32) List!33812) Bool)

(assert (=> b!1442651 (= res!974840 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33809))))

(declare-fun b!1442652 () Bool)

(declare-fun res!974848 () Bool)

(assert (=> b!1442652 (=> (not res!974848) (not e!813062))))

(assert (=> b!1442652 (= res!974848 (validKeyInArray!0 (select (arr!47311 a!2862) i!1006)))))

(declare-fun b!1442653 () Bool)

(declare-fun e!813063 () Bool)

(assert (=> b!1442653 (= e!813062 e!813063)))

(declare-fun res!974839 () Bool)

(assert (=> b!1442653 (=> (not res!974839) (not e!813063))))

(assert (=> b!1442653 (= res!974839 (= (select (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442653 (= lt!633620 (array!98047 (store (arr!47311 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47861 a!2862)))))

(declare-fun b!1442654 () Bool)

(declare-fun res!974838 () Bool)

(assert (=> b!1442654 (=> (not res!974838) (not e!813062))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442654 (= res!974838 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47861 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47861 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47861 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442655 () Bool)

(assert (=> b!1442655 (= e!813063 e!813068)))

(declare-fun res!974845 () Bool)

(assert (=> b!1442655 (=> (not res!974845) (not e!813068))))

(declare-fun lt!633624 () SeekEntryResult!11563)

(assert (=> b!1442655 (= res!974845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47311 a!2862) j!93) mask!2687) (select (arr!47311 a!2862) j!93) a!2862 mask!2687) lt!633624))))

(assert (=> b!1442655 (= lt!633624 (Intermediate!11563 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442656 () Bool)

(declare-fun res!974842 () Bool)

(assert (=> b!1442656 (=> (not res!974842) (not e!813068))))

(assert (=> b!1442656 (= res!974842 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47311 a!2862) j!93) a!2862 mask!2687) lt!633624))))

(declare-fun b!1442657 () Bool)

(assert (=> b!1442657 (= e!813064 (or (= (select (arr!47311 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47311 a!2862) intermediateBeforeIndex!19) (select (arr!47311 a!2862) j!93))))))

(declare-fun b!1442658 () Bool)

(declare-fun res!974843 () Bool)

(assert (=> b!1442658 (=> (not res!974843) (not e!813067))))

(assert (=> b!1442658 (= res!974843 e!813065)))

(declare-fun c!133413 () Bool)

(assert (=> b!1442658 (= c!133413 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124598 res!974851) b!1442649))

(assert (= (and b!1442649 res!974841) b!1442652))

(assert (= (and b!1442652 res!974848) b!1442650))

(assert (= (and b!1442650 res!974844) b!1442645))

(assert (= (and b!1442645 res!974846) b!1442651))

(assert (= (and b!1442651 res!974840) b!1442654))

(assert (= (and b!1442654 res!974838) b!1442653))

(assert (= (and b!1442653 res!974839) b!1442655))

(assert (= (and b!1442655 res!974845) b!1442656))

(assert (= (and b!1442656 res!974842) b!1442647))

(assert (= (and b!1442647 res!974837) b!1442658))

(assert (= (and b!1442658 c!133413) b!1442643))

(assert (= (and b!1442658 (not c!133413)) b!1442644))

(assert (= (and b!1442658 res!974843) b!1442648))

(assert (= (and b!1442648 res!974849) b!1442642))

(assert (= (and b!1442642 res!974850) b!1442646))

(assert (= (and b!1442646 res!974847) b!1442657))

(declare-fun m!1331775 () Bool)

(assert (=> b!1442652 m!1331775))

(assert (=> b!1442652 m!1331775))

(declare-fun m!1331777 () Bool)

(assert (=> b!1442652 m!1331777))

(declare-fun m!1331779 () Bool)

(assert (=> b!1442651 m!1331779))

(declare-fun m!1331781 () Bool)

(assert (=> b!1442657 m!1331781))

(declare-fun m!1331783 () Bool)

(assert (=> b!1442657 m!1331783))

(assert (=> b!1442656 m!1331783))

(assert (=> b!1442656 m!1331783))

(declare-fun m!1331785 () Bool)

(assert (=> b!1442656 m!1331785))

(declare-fun m!1331787 () Bool)

(assert (=> b!1442643 m!1331787))

(declare-fun m!1331789 () Bool)

(assert (=> b!1442644 m!1331789))

(declare-fun m!1331791 () Bool)

(assert (=> b!1442644 m!1331791))

(declare-fun m!1331793 () Bool)

(assert (=> start!124598 m!1331793))

(declare-fun m!1331795 () Bool)

(assert (=> start!124598 m!1331795))

(assert (=> b!1442650 m!1331783))

(assert (=> b!1442650 m!1331783))

(declare-fun m!1331797 () Bool)

(assert (=> b!1442650 m!1331797))

(declare-fun m!1331799 () Bool)

(assert (=> b!1442647 m!1331799))

(assert (=> b!1442647 m!1331799))

(declare-fun m!1331801 () Bool)

(assert (=> b!1442647 m!1331801))

(declare-fun m!1331803 () Bool)

(assert (=> b!1442647 m!1331803))

(declare-fun m!1331805 () Bool)

(assert (=> b!1442647 m!1331805))

(assert (=> b!1442653 m!1331803))

(declare-fun m!1331807 () Bool)

(assert (=> b!1442653 m!1331807))

(declare-fun m!1331809 () Bool)

(assert (=> b!1442645 m!1331809))

(assert (=> b!1442655 m!1331783))

(assert (=> b!1442655 m!1331783))

(declare-fun m!1331811 () Bool)

(assert (=> b!1442655 m!1331811))

(assert (=> b!1442655 m!1331811))

(assert (=> b!1442655 m!1331783))

(declare-fun m!1331813 () Bool)

(assert (=> b!1442655 m!1331813))

(declare-fun m!1331815 () Bool)

(assert (=> b!1442642 m!1331815))

(declare-fun m!1331817 () Bool)

(assert (=> b!1442642 m!1331817))

(assert (=> b!1442646 m!1331783))

(assert (=> b!1442646 m!1331783))

(declare-fun m!1331819 () Bool)

(assert (=> b!1442646 m!1331819))

(push 1)

