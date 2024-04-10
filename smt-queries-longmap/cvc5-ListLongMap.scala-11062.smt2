; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129204 () Bool)

(assert start!129204)

(declare-fun b!1516733 () Bool)

(declare-fun res!1036638 () Bool)

(declare-fun e!846289 () Bool)

(assert (=> b!1516733 (=> (not res!1036638) (not e!846289))))

(declare-datatypes ((array!101060 0))(
  ( (array!101061 (arr!48767 (Array (_ BitVec 32) (_ BitVec 64))) (size!49317 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101060)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516733 (= res!1036638 (validKeyInArray!0 (select (arr!48767 a!2804) i!961)))))

(declare-fun b!1516734 () Bool)

(declare-fun e!846292 () Bool)

(assert (=> b!1516734 (= e!846292 true)))

(declare-datatypes ((SeekEntryResult!12938 0))(
  ( (MissingZero!12938 (index!54147 (_ BitVec 32))) (Found!12938 (index!54148 (_ BitVec 32))) (Intermediate!12938 (undefined!13750 Bool) (index!54149 (_ BitVec 32)) (x!135840 (_ BitVec 32))) (Undefined!12938) (MissingVacant!12938 (index!54150 (_ BitVec 32))) )
))
(declare-fun lt!657515 () SeekEntryResult!12938)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657517 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101060 (_ BitVec 32)) SeekEntryResult!12938)

(assert (=> b!1516734 (= lt!657515 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657517 (select (arr!48767 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516735 () Bool)

(declare-fun res!1036637 () Bool)

(assert (=> b!1516735 (=> (not res!1036637) (not e!846289))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516735 (= res!1036637 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49317 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49317 a!2804))))))

(declare-fun b!1516736 () Bool)

(declare-fun res!1036640 () Bool)

(declare-fun e!846290 () Bool)

(assert (=> b!1516736 (=> (not res!1036640) (not e!846290))))

(declare-fun lt!657513 () SeekEntryResult!12938)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516736 (= res!1036640 (= lt!657513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48767 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48767 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101061 (store (arr!48767 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49317 a!2804)) mask!2512)))))

(declare-fun b!1516737 () Bool)

(declare-fun res!1036644 () Bool)

(assert (=> b!1516737 (=> (not res!1036644) (not e!846289))))

(assert (=> b!1516737 (= res!1036644 (validKeyInArray!0 (select (arr!48767 a!2804) j!70)))))

(declare-fun e!846287 () Bool)

(declare-fun b!1516738 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101060 (_ BitVec 32)) SeekEntryResult!12938)

(assert (=> b!1516738 (= e!846287 (= (seekEntry!0 (select (arr!48767 a!2804) j!70) a!2804 mask!2512) (Found!12938 j!70)))))

(declare-fun b!1516739 () Bool)

(declare-fun res!1036636 () Bool)

(assert (=> b!1516739 (=> (not res!1036636) (not e!846290))))

(declare-fun lt!657516 () SeekEntryResult!12938)

(assert (=> b!1516739 (= res!1036636 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48767 a!2804) j!70) a!2804 mask!2512) lt!657516))))

(declare-fun res!1036645 () Bool)

(assert (=> start!129204 (=> (not res!1036645) (not e!846289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129204 (= res!1036645 (validMask!0 mask!2512))))

(assert (=> start!129204 e!846289))

(assert (=> start!129204 true))

(declare-fun array_inv!37795 (array!101060) Bool)

(assert (=> start!129204 (array_inv!37795 a!2804)))

(declare-fun b!1516740 () Bool)

(declare-fun res!1036641 () Bool)

(assert (=> b!1516740 (=> (not res!1036641) (not e!846289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101060 (_ BitVec 32)) Bool)

(assert (=> b!1516740 (= res!1036641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516741 () Bool)

(declare-fun e!846291 () Bool)

(assert (=> b!1516741 (= e!846291 e!846292)))

(declare-fun res!1036648 () Bool)

(assert (=> b!1516741 (=> res!1036648 e!846292)))

(assert (=> b!1516741 (= res!1036648 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657517 #b00000000000000000000000000000000) (bvsge lt!657517 (size!49317 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516741 (= lt!657517 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516742 () Bool)

(declare-fun res!1036647 () Bool)

(assert (=> b!1516742 (=> (not res!1036647) (not e!846289))))

(assert (=> b!1516742 (= res!1036647 (and (= (size!49317 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49317 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49317 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516743 () Bool)

(assert (=> b!1516743 (= e!846289 e!846290)))

(declare-fun res!1036643 () Bool)

(assert (=> b!1516743 (=> (not res!1036643) (not e!846290))))

(assert (=> b!1516743 (= res!1036643 (= lt!657513 lt!657516))))

(assert (=> b!1516743 (= lt!657516 (Intermediate!12938 false resIndex!21 resX!21))))

(assert (=> b!1516743 (= lt!657513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48767 a!2804) j!70) mask!2512) (select (arr!48767 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516744 () Bool)

(assert (=> b!1516744 (= e!846290 (not e!846291))))

(declare-fun res!1036642 () Bool)

(assert (=> b!1516744 (=> res!1036642 e!846291)))

(assert (=> b!1516744 (= res!1036642 (or (not (= (select (arr!48767 a!2804) j!70) (select (store (arr!48767 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516744 e!846287))

(declare-fun res!1036639 () Bool)

(assert (=> b!1516744 (=> (not res!1036639) (not e!846287))))

(assert (=> b!1516744 (= res!1036639 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50744 0))(
  ( (Unit!50745) )
))
(declare-fun lt!657514 () Unit!50744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50744)

(assert (=> b!1516744 (= lt!657514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516745 () Bool)

(declare-fun res!1036646 () Bool)

(assert (=> b!1516745 (=> (not res!1036646) (not e!846289))))

(declare-datatypes ((List!35250 0))(
  ( (Nil!35247) (Cons!35246 (h!36658 (_ BitVec 64)) (t!49944 List!35250)) )
))
(declare-fun arrayNoDuplicates!0 (array!101060 (_ BitVec 32) List!35250) Bool)

(assert (=> b!1516745 (= res!1036646 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35247))))

(assert (= (and start!129204 res!1036645) b!1516742))

(assert (= (and b!1516742 res!1036647) b!1516733))

(assert (= (and b!1516733 res!1036638) b!1516737))

(assert (= (and b!1516737 res!1036644) b!1516740))

(assert (= (and b!1516740 res!1036641) b!1516745))

(assert (= (and b!1516745 res!1036646) b!1516735))

(assert (= (and b!1516735 res!1036637) b!1516743))

(assert (= (and b!1516743 res!1036643) b!1516739))

(assert (= (and b!1516739 res!1036636) b!1516736))

(assert (= (and b!1516736 res!1036640) b!1516744))

(assert (= (and b!1516744 res!1036639) b!1516738))

(assert (= (and b!1516744 (not res!1036642)) b!1516741))

(assert (= (and b!1516741 (not res!1036648)) b!1516734))

(declare-fun m!1400005 () Bool)

(assert (=> b!1516741 m!1400005))

(declare-fun m!1400007 () Bool)

(assert (=> b!1516740 m!1400007))

(declare-fun m!1400009 () Bool)

(assert (=> b!1516738 m!1400009))

(assert (=> b!1516738 m!1400009))

(declare-fun m!1400011 () Bool)

(assert (=> b!1516738 m!1400011))

(declare-fun m!1400013 () Bool)

(assert (=> b!1516736 m!1400013))

(declare-fun m!1400015 () Bool)

(assert (=> b!1516736 m!1400015))

(assert (=> b!1516736 m!1400015))

(declare-fun m!1400017 () Bool)

(assert (=> b!1516736 m!1400017))

(assert (=> b!1516736 m!1400017))

(assert (=> b!1516736 m!1400015))

(declare-fun m!1400019 () Bool)

(assert (=> b!1516736 m!1400019))

(assert (=> b!1516737 m!1400009))

(assert (=> b!1516737 m!1400009))

(declare-fun m!1400021 () Bool)

(assert (=> b!1516737 m!1400021))

(assert (=> b!1516743 m!1400009))

(assert (=> b!1516743 m!1400009))

(declare-fun m!1400023 () Bool)

(assert (=> b!1516743 m!1400023))

(assert (=> b!1516743 m!1400023))

(assert (=> b!1516743 m!1400009))

(declare-fun m!1400025 () Bool)

(assert (=> b!1516743 m!1400025))

(assert (=> b!1516734 m!1400009))

(assert (=> b!1516734 m!1400009))

(declare-fun m!1400027 () Bool)

(assert (=> b!1516734 m!1400027))

(assert (=> b!1516739 m!1400009))

(assert (=> b!1516739 m!1400009))

(declare-fun m!1400029 () Bool)

(assert (=> b!1516739 m!1400029))

(declare-fun m!1400031 () Bool)

(assert (=> b!1516733 m!1400031))

(assert (=> b!1516733 m!1400031))

(declare-fun m!1400033 () Bool)

(assert (=> b!1516733 m!1400033))

(assert (=> b!1516744 m!1400009))

(declare-fun m!1400035 () Bool)

(assert (=> b!1516744 m!1400035))

(assert (=> b!1516744 m!1400013))

(assert (=> b!1516744 m!1400015))

(declare-fun m!1400037 () Bool)

(assert (=> b!1516744 m!1400037))

(declare-fun m!1400039 () Bool)

(assert (=> start!129204 m!1400039))

(declare-fun m!1400041 () Bool)

(assert (=> start!129204 m!1400041))

(declare-fun m!1400043 () Bool)

(assert (=> b!1516745 m!1400043))

(push 1)

