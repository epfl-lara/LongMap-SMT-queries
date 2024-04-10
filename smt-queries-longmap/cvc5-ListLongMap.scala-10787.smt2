; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126220 () Bool)

(assert start!126220)

(declare-fun lt!645846 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1478920 () Bool)

(declare-datatypes ((SeekEntryResult!12182 0))(
  ( (MissingZero!12182 (index!51120 (_ BitVec 32))) (Found!12182 (index!51121 (_ BitVec 32))) (Intermediate!12182 (undefined!12994 Bool) (index!51122 (_ BitVec 32)) (x!132709 (_ BitVec 32))) (Undefined!12182) (MissingVacant!12182 (index!51123 (_ BitVec 32))) )
))
(declare-fun lt!645841 () SeekEntryResult!12182)

(declare-datatypes ((array!99326 0))(
  ( (array!99327 (arr!47942 (Array (_ BitVec 32) (_ BitVec 64))) (size!48492 (_ BitVec 32))) )
))
(declare-fun lt!645845 () array!99326)

(declare-fun e!829586 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99326 (_ BitVec 32)) SeekEntryResult!12182)

(assert (=> b!1478920 (= e!829586 (= lt!645841 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645846 lt!645845 mask!2687)))))

(declare-fun b!1478921 () Bool)

(declare-fun res!1004890 () Bool)

(declare-fun e!829587 () Bool)

(assert (=> b!1478921 (=> (not res!1004890) (not e!829587))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99326)

(assert (=> b!1478921 (= res!1004890 (and (= (size!48492 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48492 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48492 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478922 () Bool)

(declare-fun res!1004896 () Bool)

(assert (=> b!1478922 (=> (not res!1004896) (not e!829587))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478922 (= res!1004896 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48492 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48492 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48492 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478923 () Bool)

(declare-fun res!1004882 () Bool)

(declare-fun e!829590 () Bool)

(assert (=> b!1478923 (=> (not res!1004882) (not e!829590))))

(assert (=> b!1478923 (= res!1004882 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478924 () Bool)

(declare-fun res!1004892 () Bool)

(assert (=> b!1478924 (=> (not res!1004892) (not e!829590))))

(assert (=> b!1478924 (= res!1004892 e!829586)))

(declare-fun c!136539 () Bool)

(assert (=> b!1478924 (= c!136539 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478925 () Bool)

(declare-fun e!829584 () Bool)

(declare-fun e!829588 () Bool)

(assert (=> b!1478925 (= e!829584 e!829588)))

(declare-fun res!1004885 () Bool)

(assert (=> b!1478925 (=> res!1004885 e!829588)))

(assert (=> b!1478925 (= res!1004885 (or (and (= (select (arr!47942 a!2862) index!646) (select (store (arr!47942 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47942 a!2862) index!646) (select (arr!47942 a!2862) j!93))) (not (= (select (arr!47942 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478926 () Bool)

(declare-fun res!1004895 () Bool)

(assert (=> b!1478926 (=> (not res!1004895) (not e!829587))))

(declare-datatypes ((List!34443 0))(
  ( (Nil!34440) (Cons!34439 (h!35807 (_ BitVec 64)) (t!49137 List!34443)) )
))
(declare-fun arrayNoDuplicates!0 (array!99326 (_ BitVec 32) List!34443) Bool)

(assert (=> b!1478926 (= res!1004895 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34440))))

(declare-fun res!1004886 () Bool)

(assert (=> start!126220 (=> (not res!1004886) (not e!829587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126220 (= res!1004886 (validMask!0 mask!2687))))

(assert (=> start!126220 e!829587))

(assert (=> start!126220 true))

(declare-fun array_inv!36970 (array!99326) Bool)

(assert (=> start!126220 (array_inv!36970 a!2862)))

(declare-fun b!1478927 () Bool)

(declare-fun e!829592 () Bool)

(declare-fun e!829589 () Bool)

(assert (=> b!1478927 (= e!829592 e!829589)))

(declare-fun res!1004887 () Bool)

(assert (=> b!1478927 (=> (not res!1004887) (not e!829589))))

(declare-fun lt!645842 () SeekEntryResult!12182)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478927 (= res!1004887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47942 a!2862) j!93) mask!2687) (select (arr!47942 a!2862) j!93) a!2862 mask!2687) lt!645842))))

(assert (=> b!1478927 (= lt!645842 (Intermediate!12182 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478928 () Bool)

(assert (=> b!1478928 (= e!829589 e!829590)))

(declare-fun res!1004891 () Bool)

(assert (=> b!1478928 (=> (not res!1004891) (not e!829590))))

(assert (=> b!1478928 (= res!1004891 (= lt!645841 (Intermediate!12182 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478928 (= lt!645841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645846 mask!2687) lt!645846 lt!645845 mask!2687))))

(assert (=> b!1478928 (= lt!645846 (select (store (arr!47942 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478929 () Bool)

(declare-fun res!1004884 () Bool)

(assert (=> b!1478929 (=> (not res!1004884) (not e!829587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99326 (_ BitVec 32)) Bool)

(assert (=> b!1478929 (= res!1004884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478930 () Bool)

(declare-fun res!1004893 () Bool)

(assert (=> b!1478930 (=> (not res!1004893) (not e!829587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478930 (= res!1004893 (validKeyInArray!0 (select (arr!47942 a!2862) i!1006)))))

(declare-fun b!1478931 () Bool)

(declare-fun e!829585 () Bool)

(assert (=> b!1478931 (= e!829588 e!829585)))

(declare-fun res!1004881 () Bool)

(assert (=> b!1478931 (=> (not res!1004881) (not e!829585))))

(declare-fun lt!645844 () SeekEntryResult!12182)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99326 (_ BitVec 32)) SeekEntryResult!12182)

(assert (=> b!1478931 (= res!1004881 (= lt!645844 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47942 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478932 () Bool)

(declare-fun res!1004883 () Bool)

(assert (=> b!1478932 (=> (not res!1004883) (not e!829589))))

(assert (=> b!1478932 (= res!1004883 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47942 a!2862) j!93) a!2862 mask!2687) lt!645842))))

(declare-fun b!1478933 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99326 (_ BitVec 32)) SeekEntryResult!12182)

(assert (=> b!1478933 (= e!829586 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645846 lt!645845 mask!2687) (seekEntryOrOpen!0 lt!645846 lt!645845 mask!2687)))))

(declare-fun b!1478934 () Bool)

(declare-fun res!1004894 () Bool)

(assert (=> b!1478934 (=> (not res!1004894) (not e!829587))))

(assert (=> b!1478934 (= res!1004894 (validKeyInArray!0 (select (arr!47942 a!2862) j!93)))))

(declare-fun b!1478935 () Bool)

(assert (=> b!1478935 (= e!829587 e!829592)))

(declare-fun res!1004889 () Bool)

(assert (=> b!1478935 (=> (not res!1004889) (not e!829592))))

(assert (=> b!1478935 (= res!1004889 (= (select (store (arr!47942 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478935 (= lt!645845 (array!99327 (store (arr!47942 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48492 a!2862)))))

(declare-fun b!1478936 () Bool)

(assert (=> b!1478936 (= e!829590 (not true))))

(assert (=> b!1478936 e!829584))

(declare-fun res!1004888 () Bool)

(assert (=> b!1478936 (=> (not res!1004888) (not e!829584))))

(assert (=> b!1478936 (= res!1004888 (and (= lt!645844 (Found!12182 j!93)) (or (= (select (arr!47942 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47942 a!2862) intermediateBeforeIndex!19) (select (arr!47942 a!2862) j!93)))))))

(assert (=> b!1478936 (= lt!645844 (seekEntryOrOpen!0 (select (arr!47942 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478936 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49704 0))(
  ( (Unit!49705) )
))
(declare-fun lt!645843 () Unit!49704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49704)

(assert (=> b!1478936 (= lt!645843 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478937 () Bool)

(assert (=> b!1478937 (= e!829585 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126220 res!1004886) b!1478921))

(assert (= (and b!1478921 res!1004890) b!1478930))

(assert (= (and b!1478930 res!1004893) b!1478934))

(assert (= (and b!1478934 res!1004894) b!1478929))

(assert (= (and b!1478929 res!1004884) b!1478926))

(assert (= (and b!1478926 res!1004895) b!1478922))

(assert (= (and b!1478922 res!1004896) b!1478935))

(assert (= (and b!1478935 res!1004889) b!1478927))

(assert (= (and b!1478927 res!1004887) b!1478932))

(assert (= (and b!1478932 res!1004883) b!1478928))

(assert (= (and b!1478928 res!1004891) b!1478924))

(assert (= (and b!1478924 c!136539) b!1478920))

(assert (= (and b!1478924 (not c!136539)) b!1478933))

(assert (= (and b!1478924 res!1004892) b!1478923))

(assert (= (and b!1478923 res!1004882) b!1478936))

(assert (= (and b!1478936 res!1004888) b!1478925))

(assert (= (and b!1478925 (not res!1004885)) b!1478931))

(assert (= (and b!1478931 res!1004881) b!1478937))

(declare-fun m!1364815 () Bool)

(assert (=> b!1478929 m!1364815))

(declare-fun m!1364817 () Bool)

(assert (=> b!1478932 m!1364817))

(assert (=> b!1478932 m!1364817))

(declare-fun m!1364819 () Bool)

(assert (=> b!1478932 m!1364819))

(assert (=> b!1478934 m!1364817))

(assert (=> b!1478934 m!1364817))

(declare-fun m!1364821 () Bool)

(assert (=> b!1478934 m!1364821))

(assert (=> b!1478931 m!1364817))

(assert (=> b!1478931 m!1364817))

(declare-fun m!1364823 () Bool)

(assert (=> b!1478931 m!1364823))

(declare-fun m!1364825 () Bool)

(assert (=> b!1478920 m!1364825))

(declare-fun m!1364827 () Bool)

(assert (=> b!1478930 m!1364827))

(assert (=> b!1478930 m!1364827))

(declare-fun m!1364829 () Bool)

(assert (=> b!1478930 m!1364829))

(declare-fun m!1364831 () Bool)

(assert (=> b!1478935 m!1364831))

(declare-fun m!1364833 () Bool)

(assert (=> b!1478935 m!1364833))

(declare-fun m!1364835 () Bool)

(assert (=> b!1478933 m!1364835))

(declare-fun m!1364837 () Bool)

(assert (=> b!1478933 m!1364837))

(declare-fun m!1364839 () Bool)

(assert (=> b!1478925 m!1364839))

(assert (=> b!1478925 m!1364831))

(declare-fun m!1364841 () Bool)

(assert (=> b!1478925 m!1364841))

(assert (=> b!1478925 m!1364817))

(declare-fun m!1364843 () Bool)

(assert (=> start!126220 m!1364843))

(declare-fun m!1364845 () Bool)

(assert (=> start!126220 m!1364845))

(declare-fun m!1364847 () Bool)

(assert (=> b!1478926 m!1364847))

(declare-fun m!1364849 () Bool)

(assert (=> b!1478928 m!1364849))

(assert (=> b!1478928 m!1364849))

(declare-fun m!1364851 () Bool)

(assert (=> b!1478928 m!1364851))

(assert (=> b!1478928 m!1364831))

(declare-fun m!1364853 () Bool)

(assert (=> b!1478928 m!1364853))

(assert (=> b!1478927 m!1364817))

(assert (=> b!1478927 m!1364817))

(declare-fun m!1364855 () Bool)

(assert (=> b!1478927 m!1364855))

(assert (=> b!1478927 m!1364855))

(assert (=> b!1478927 m!1364817))

(declare-fun m!1364857 () Bool)

(assert (=> b!1478927 m!1364857))

(declare-fun m!1364859 () Bool)

(assert (=> b!1478936 m!1364859))

(declare-fun m!1364861 () Bool)

(assert (=> b!1478936 m!1364861))

(assert (=> b!1478936 m!1364817))

(declare-fun m!1364863 () Bool)

(assert (=> b!1478936 m!1364863))

(declare-fun m!1364865 () Bool)

(assert (=> b!1478936 m!1364865))

(assert (=> b!1478936 m!1364817))

(push 1)

