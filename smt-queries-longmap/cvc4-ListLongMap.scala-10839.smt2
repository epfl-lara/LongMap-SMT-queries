; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126884 () Bool)

(assert start!126884)

(declare-fun b!1490680 () Bool)

(declare-fun e!835294 () Bool)

(declare-fun e!835293 () Bool)

(assert (=> b!1490680 (= e!835294 (not e!835293))))

(declare-fun res!1013939 () Bool)

(assert (=> b!1490680 (=> res!1013939 e!835293)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99657 0))(
  ( (array!99658 (arr!48100 (Array (_ BitVec 32) (_ BitVec 64))) (size!48650 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99657)

(assert (=> b!1490680 (= res!1013939 (or (and (= (select (arr!48100 a!2862) index!646) (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48100 a!2862) index!646) (select (arr!48100 a!2862) j!93))) (= (select (arr!48100 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835290 () Bool)

(assert (=> b!1490680 e!835290))

(declare-fun res!1013936 () Bool)

(assert (=> b!1490680 (=> (not res!1013936) (not e!835290))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99657 (_ BitVec 32)) Bool)

(assert (=> b!1490680 (= res!1013936 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50020 0))(
  ( (Unit!50021) )
))
(declare-fun lt!650027 () Unit!50020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50020)

(assert (=> b!1490680 (= lt!650027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490681 () Bool)

(declare-fun res!1013945 () Bool)

(assert (=> b!1490681 (=> (not res!1013945) (not e!835294))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490681 (= res!1013945 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490682 () Bool)

(declare-fun res!1013943 () Bool)

(assert (=> b!1490682 (=> (not res!1013943) (not e!835294))))

(declare-fun e!835292 () Bool)

(assert (=> b!1490682 (= res!1013943 e!835292)))

(declare-fun c!137901 () Bool)

(assert (=> b!1490682 (= c!137901 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!650024 () array!99657)

(declare-fun b!1490683 () Bool)

(declare-fun lt!650028 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12340 0))(
  ( (MissingZero!12340 (index!51752 (_ BitVec 32))) (Found!12340 (index!51753 (_ BitVec 32))) (Intermediate!12340 (undefined!13152 Bool) (index!51754 (_ BitVec 32)) (x!133340 (_ BitVec 32))) (Undefined!12340) (MissingVacant!12340 (index!51755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99657 (_ BitVec 32)) SeekEntryResult!12340)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99657 (_ BitVec 32)) SeekEntryResult!12340)

(assert (=> b!1490683 (= e!835292 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650028 lt!650024 mask!2687) (seekEntryOrOpen!0 lt!650028 lt!650024 mask!2687)))))

(declare-fun b!1490685 () Bool)

(declare-fun e!835295 () Bool)

(declare-fun e!835288 () Bool)

(assert (=> b!1490685 (= e!835295 e!835288)))

(declare-fun res!1013938 () Bool)

(assert (=> b!1490685 (=> (not res!1013938) (not e!835288))))

(declare-fun lt!650025 () SeekEntryResult!12340)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99657 (_ BitVec 32)) SeekEntryResult!12340)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490685 (= res!1013938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!650025))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1490685 (= lt!650025 (Intermediate!12340 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490686 () Bool)

(assert (=> b!1490686 (= e!835293 true)))

(declare-fun lt!650026 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490686 (= lt!650026 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490687 () Bool)

(declare-fun res!1013935 () Bool)

(assert (=> b!1490687 (=> (not res!1013935) (not e!835288))))

(assert (=> b!1490687 (= res!1013935 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!650025))))

(declare-fun b!1490688 () Bool)

(declare-fun e!835291 () Bool)

(assert (=> b!1490688 (= e!835291 e!835295)))

(declare-fun res!1013937 () Bool)

(assert (=> b!1490688 (=> (not res!1013937) (not e!835295))))

(assert (=> b!1490688 (= res!1013937 (= (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490688 (= lt!650024 (array!99658 (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48650 a!2862)))))

(declare-fun lt!650023 () SeekEntryResult!12340)

(declare-fun b!1490689 () Bool)

(assert (=> b!1490689 (= e!835292 (= lt!650023 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650028 lt!650024 mask!2687)))))

(declare-fun b!1490690 () Bool)

(declare-fun res!1013944 () Bool)

(assert (=> b!1490690 (=> (not res!1013944) (not e!835291))))

(assert (=> b!1490690 (= res!1013944 (and (= (size!48650 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48650 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48650 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490691 () Bool)

(assert (=> b!1490691 (= e!835288 e!835294)))

(declare-fun res!1013942 () Bool)

(assert (=> b!1490691 (=> (not res!1013942) (not e!835294))))

(assert (=> b!1490691 (= res!1013942 (= lt!650023 (Intermediate!12340 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490691 (= lt!650023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650028 mask!2687) lt!650028 lt!650024 mask!2687))))

(assert (=> b!1490691 (= lt!650028 (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490692 () Bool)

(declare-fun res!1013947 () Bool)

(assert (=> b!1490692 (=> (not res!1013947) (not e!835291))))

(assert (=> b!1490692 (= res!1013947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490693 () Bool)

(declare-fun res!1013933 () Bool)

(assert (=> b!1490693 (=> (not res!1013933) (not e!835290))))

(assert (=> b!1490693 (= res!1013933 (= (seekEntryOrOpen!0 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) (Found!12340 j!93)))))

(declare-fun b!1490684 () Bool)

(declare-fun res!1013940 () Bool)

(assert (=> b!1490684 (=> (not res!1013940) (not e!835291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490684 (= res!1013940 (validKeyInArray!0 (select (arr!48100 a!2862) i!1006)))))

(declare-fun res!1013946 () Bool)

(assert (=> start!126884 (=> (not res!1013946) (not e!835291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126884 (= res!1013946 (validMask!0 mask!2687))))

(assert (=> start!126884 e!835291))

(assert (=> start!126884 true))

(declare-fun array_inv!37128 (array!99657) Bool)

(assert (=> start!126884 (array_inv!37128 a!2862)))

(declare-fun b!1490694 () Bool)

(declare-fun res!1013941 () Bool)

(assert (=> b!1490694 (=> (not res!1013941) (not e!835291))))

(assert (=> b!1490694 (= res!1013941 (validKeyInArray!0 (select (arr!48100 a!2862) j!93)))))

(declare-fun b!1490695 () Bool)

(declare-fun res!1013934 () Bool)

(assert (=> b!1490695 (=> (not res!1013934) (not e!835291))))

(assert (=> b!1490695 (= res!1013934 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48650 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48650 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48650 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490696 () Bool)

(declare-fun res!1013932 () Bool)

(assert (=> b!1490696 (=> (not res!1013932) (not e!835291))))

(declare-datatypes ((List!34601 0))(
  ( (Nil!34598) (Cons!34597 (h!35980 (_ BitVec 64)) (t!49295 List!34601)) )
))
(declare-fun arrayNoDuplicates!0 (array!99657 (_ BitVec 32) List!34601) Bool)

(assert (=> b!1490696 (= res!1013932 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34598))))

(declare-fun b!1490697 () Bool)

(assert (=> b!1490697 (= e!835290 (or (= (select (arr!48100 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48100 a!2862) intermediateBeforeIndex!19) (select (arr!48100 a!2862) j!93))))))

(assert (= (and start!126884 res!1013946) b!1490690))

(assert (= (and b!1490690 res!1013944) b!1490684))

(assert (= (and b!1490684 res!1013940) b!1490694))

(assert (= (and b!1490694 res!1013941) b!1490692))

(assert (= (and b!1490692 res!1013947) b!1490696))

(assert (= (and b!1490696 res!1013932) b!1490695))

(assert (= (and b!1490695 res!1013934) b!1490688))

(assert (= (and b!1490688 res!1013937) b!1490685))

(assert (= (and b!1490685 res!1013938) b!1490687))

(assert (= (and b!1490687 res!1013935) b!1490691))

(assert (= (and b!1490691 res!1013942) b!1490682))

(assert (= (and b!1490682 c!137901) b!1490689))

(assert (= (and b!1490682 (not c!137901)) b!1490683))

(assert (= (and b!1490682 res!1013943) b!1490681))

(assert (= (and b!1490681 res!1013945) b!1490680))

(assert (= (and b!1490680 res!1013936) b!1490693))

(assert (= (and b!1490693 res!1013933) b!1490697))

(assert (= (and b!1490680 (not res!1013939)) b!1490686))

(declare-fun m!1374831 () Bool)

(assert (=> b!1490693 m!1374831))

(assert (=> b!1490693 m!1374831))

(declare-fun m!1374833 () Bool)

(assert (=> b!1490693 m!1374833))

(declare-fun m!1374835 () Bool)

(assert (=> b!1490692 m!1374835))

(assert (=> b!1490694 m!1374831))

(assert (=> b!1490694 m!1374831))

(declare-fun m!1374837 () Bool)

(assert (=> b!1490694 m!1374837))

(declare-fun m!1374839 () Bool)

(assert (=> b!1490684 m!1374839))

(assert (=> b!1490684 m!1374839))

(declare-fun m!1374841 () Bool)

(assert (=> b!1490684 m!1374841))

(declare-fun m!1374843 () Bool)

(assert (=> start!126884 m!1374843))

(declare-fun m!1374845 () Bool)

(assert (=> start!126884 m!1374845))

(declare-fun m!1374847 () Bool)

(assert (=> b!1490689 m!1374847))

(declare-fun m!1374849 () Bool)

(assert (=> b!1490696 m!1374849))

(assert (=> b!1490685 m!1374831))

(assert (=> b!1490685 m!1374831))

(declare-fun m!1374851 () Bool)

(assert (=> b!1490685 m!1374851))

(assert (=> b!1490685 m!1374851))

(assert (=> b!1490685 m!1374831))

(declare-fun m!1374853 () Bool)

(assert (=> b!1490685 m!1374853))

(declare-fun m!1374855 () Bool)

(assert (=> b!1490680 m!1374855))

(declare-fun m!1374857 () Bool)

(assert (=> b!1490680 m!1374857))

(declare-fun m!1374859 () Bool)

(assert (=> b!1490680 m!1374859))

(declare-fun m!1374861 () Bool)

(assert (=> b!1490680 m!1374861))

(declare-fun m!1374863 () Bool)

(assert (=> b!1490680 m!1374863))

(assert (=> b!1490680 m!1374831))

(declare-fun m!1374865 () Bool)

(assert (=> b!1490683 m!1374865))

(declare-fun m!1374867 () Bool)

(assert (=> b!1490683 m!1374867))

(declare-fun m!1374869 () Bool)

(assert (=> b!1490691 m!1374869))

(assert (=> b!1490691 m!1374869))

(declare-fun m!1374871 () Bool)

(assert (=> b!1490691 m!1374871))

(assert (=> b!1490691 m!1374857))

(declare-fun m!1374873 () Bool)

(assert (=> b!1490691 m!1374873))

(assert (=> b!1490687 m!1374831))

(assert (=> b!1490687 m!1374831))

(declare-fun m!1374875 () Bool)

(assert (=> b!1490687 m!1374875))

(assert (=> b!1490688 m!1374857))

(declare-fun m!1374877 () Bool)

(assert (=> b!1490688 m!1374877))

(declare-fun m!1374879 () Bool)

(assert (=> b!1490697 m!1374879))

(assert (=> b!1490697 m!1374831))

(declare-fun m!1374881 () Bool)

(assert (=> b!1490686 m!1374881))

(push 1)

