; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121614 () Bool)

(assert start!121614)

(declare-fun b!1412826 () Bool)

(declare-fun res!949825 () Bool)

(declare-fun e!799536 () Bool)

(assert (=> b!1412826 (=> (not res!949825) (not e!799536))))

(declare-datatypes ((array!96552 0))(
  ( (array!96553 (arr!46613 (Array (_ BitVec 32) (_ BitVec 64))) (size!47163 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96552)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412826 (= res!949825 (validKeyInArray!0 (select (arr!46613 a!2901) j!112)))))

(declare-fun b!1412827 () Bool)

(declare-fun res!949820 () Bool)

(assert (=> b!1412827 (=> (not res!949820) (not e!799536))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96552 (_ BitVec 32)) Bool)

(assert (=> b!1412827 (= res!949820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412828 () Bool)

(declare-fun e!799537 () Bool)

(assert (=> b!1412828 (= e!799536 (not e!799537))))

(declare-fun res!949821 () Bool)

(assert (=> b!1412828 (=> res!949821 e!799537)))

(declare-datatypes ((SeekEntryResult!10924 0))(
  ( (MissingZero!10924 (index!46076 (_ BitVec 32))) (Found!10924 (index!46077 (_ BitVec 32))) (Intermediate!10924 (undefined!11736 Bool) (index!46078 (_ BitVec 32)) (x!127667 (_ BitVec 32))) (Undefined!10924) (MissingVacant!10924 (index!46079 (_ BitVec 32))) )
))
(declare-fun lt!622611 () SeekEntryResult!10924)

(assert (=> b!1412828 (= res!949821 (or (not (is-Intermediate!10924 lt!622611)) (undefined!11736 lt!622611)))))

(declare-fun e!799534 () Bool)

(assert (=> b!1412828 e!799534))

(declare-fun res!949819 () Bool)

(assert (=> b!1412828 (=> (not res!949819) (not e!799534))))

(assert (=> b!1412828 (= res!949819 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47822 0))(
  ( (Unit!47823) )
))
(declare-fun lt!622610 () Unit!47822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47822)

(assert (=> b!1412828 (= lt!622610 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622609 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96552 (_ BitVec 32)) SeekEntryResult!10924)

(assert (=> b!1412828 (= lt!622611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622609 (select (arr!46613 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412828 (= lt!622609 (toIndex!0 (select (arr!46613 a!2901) j!112) mask!2840))))

(declare-fun lt!622605 () (_ BitVec 64))

(declare-fun lt!622606 () array!96552)

(declare-fun b!1412829 () Bool)

(declare-fun lt!622608 () SeekEntryResult!10924)

(declare-fun e!799535 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96552 (_ BitVec 32)) SeekEntryResult!10924)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96552 (_ BitVec 32)) SeekEntryResult!10924)

(assert (=> b!1412829 (= e!799535 (= (seekEntryOrOpen!0 lt!622605 lt!622606 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127667 lt!622608) (index!46078 lt!622608) (index!46078 lt!622608) (select (arr!46613 a!2901) j!112) lt!622606 mask!2840)))))

(declare-fun res!949817 () Bool)

(assert (=> start!121614 (=> (not res!949817) (not e!799536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121614 (= res!949817 (validMask!0 mask!2840))))

(assert (=> start!121614 e!799536))

(assert (=> start!121614 true))

(declare-fun array_inv!35641 (array!96552) Bool)

(assert (=> start!121614 (array_inv!35641 a!2901)))

(declare-fun b!1412830 () Bool)

(declare-fun e!799533 () Bool)

(assert (=> b!1412830 (= e!799537 e!799533)))

(declare-fun res!949824 () Bool)

(assert (=> b!1412830 (=> res!949824 e!799533)))

(assert (=> b!1412830 (= res!949824 (or (= lt!622611 lt!622608) (not (is-Intermediate!10924 lt!622608))))))

(assert (=> b!1412830 (= lt!622608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622605 mask!2840) lt!622605 lt!622606 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412830 (= lt!622605 (select (store (arr!46613 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412830 (= lt!622606 (array!96553 (store (arr!46613 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47163 a!2901)))))

(declare-fun b!1412831 () Bool)

(declare-fun res!949818 () Bool)

(assert (=> b!1412831 (=> (not res!949818) (not e!799536))))

(assert (=> b!1412831 (= res!949818 (validKeyInArray!0 (select (arr!46613 a!2901) i!1037)))))

(declare-fun b!1412832 () Bool)

(declare-fun res!949816 () Bool)

(assert (=> b!1412832 (=> (not res!949816) (not e!799536))))

(assert (=> b!1412832 (= res!949816 (and (= (size!47163 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47163 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47163 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412833 () Bool)

(assert (=> b!1412833 (= e!799534 (= (seekEntryOrOpen!0 (select (arr!46613 a!2901) j!112) a!2901 mask!2840) (Found!10924 j!112)))))

(declare-fun b!1412834 () Bool)

(assert (=> b!1412834 (= e!799533 true)))

(assert (=> b!1412834 e!799535))

(declare-fun res!949823 () Bool)

(assert (=> b!1412834 (=> (not res!949823) (not e!799535))))

(assert (=> b!1412834 (= res!949823 (and (not (undefined!11736 lt!622608)) (= (index!46078 lt!622608) i!1037) (bvslt (x!127667 lt!622608) (x!127667 lt!622611)) (= (select (store (arr!46613 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46078 lt!622608)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622607 () Unit!47822)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47822)

(assert (=> b!1412834 (= lt!622607 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622609 (x!127667 lt!622611) (index!46078 lt!622611) (x!127667 lt!622608) (index!46078 lt!622608) (undefined!11736 lt!622608) mask!2840))))

(declare-fun b!1412835 () Bool)

(declare-fun res!949822 () Bool)

(assert (=> b!1412835 (=> (not res!949822) (not e!799536))))

(declare-datatypes ((List!33132 0))(
  ( (Nil!33129) (Cons!33128 (h!34403 (_ BitVec 64)) (t!47826 List!33132)) )
))
(declare-fun arrayNoDuplicates!0 (array!96552 (_ BitVec 32) List!33132) Bool)

(assert (=> b!1412835 (= res!949822 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33129))))

(assert (= (and start!121614 res!949817) b!1412832))

(assert (= (and b!1412832 res!949816) b!1412831))

(assert (= (and b!1412831 res!949818) b!1412826))

(assert (= (and b!1412826 res!949825) b!1412827))

(assert (= (and b!1412827 res!949820) b!1412835))

(assert (= (and b!1412835 res!949822) b!1412828))

(assert (= (and b!1412828 res!949819) b!1412833))

(assert (= (and b!1412828 (not res!949821)) b!1412830))

(assert (= (and b!1412830 (not res!949824)) b!1412834))

(assert (= (and b!1412834 res!949823) b!1412829))

(declare-fun m!1303005 () Bool)

(assert (=> b!1412830 m!1303005))

(assert (=> b!1412830 m!1303005))

(declare-fun m!1303007 () Bool)

(assert (=> b!1412830 m!1303007))

(declare-fun m!1303009 () Bool)

(assert (=> b!1412830 m!1303009))

(declare-fun m!1303011 () Bool)

(assert (=> b!1412830 m!1303011))

(declare-fun m!1303013 () Bool)

(assert (=> start!121614 m!1303013))

(declare-fun m!1303015 () Bool)

(assert (=> start!121614 m!1303015))

(declare-fun m!1303017 () Bool)

(assert (=> b!1412827 m!1303017))

(declare-fun m!1303019 () Bool)

(assert (=> b!1412829 m!1303019))

(declare-fun m!1303021 () Bool)

(assert (=> b!1412829 m!1303021))

(assert (=> b!1412829 m!1303021))

(declare-fun m!1303023 () Bool)

(assert (=> b!1412829 m!1303023))

(declare-fun m!1303025 () Bool)

(assert (=> b!1412831 m!1303025))

(assert (=> b!1412831 m!1303025))

(declare-fun m!1303027 () Bool)

(assert (=> b!1412831 m!1303027))

(declare-fun m!1303029 () Bool)

(assert (=> b!1412835 m!1303029))

(assert (=> b!1412833 m!1303021))

(assert (=> b!1412833 m!1303021))

(declare-fun m!1303031 () Bool)

(assert (=> b!1412833 m!1303031))

(assert (=> b!1412828 m!1303021))

(declare-fun m!1303033 () Bool)

(assert (=> b!1412828 m!1303033))

(assert (=> b!1412828 m!1303021))

(declare-fun m!1303035 () Bool)

(assert (=> b!1412828 m!1303035))

(declare-fun m!1303037 () Bool)

(assert (=> b!1412828 m!1303037))

(assert (=> b!1412828 m!1303021))

(declare-fun m!1303039 () Bool)

(assert (=> b!1412828 m!1303039))

(assert (=> b!1412834 m!1303009))

(declare-fun m!1303041 () Bool)

(assert (=> b!1412834 m!1303041))

(declare-fun m!1303043 () Bool)

(assert (=> b!1412834 m!1303043))

(assert (=> b!1412826 m!1303021))

(assert (=> b!1412826 m!1303021))

(declare-fun m!1303045 () Bool)

(assert (=> b!1412826 m!1303045))

(push 1)

