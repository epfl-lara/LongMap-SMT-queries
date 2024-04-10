; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126930 () Bool)

(assert start!126930)

(declare-fun b!1491922 () Bool)

(declare-fun e!835841 () Bool)

(declare-fun e!835846 () Bool)

(assert (=> b!1491922 (= e!835841 e!835846)))

(declare-fun res!1015041 () Bool)

(assert (=> b!1491922 (=> (not res!1015041) (not e!835846))))

(declare-datatypes ((SeekEntryResult!12363 0))(
  ( (MissingZero!12363 (index!51844 (_ BitVec 32))) (Found!12363 (index!51845 (_ BitVec 32))) (Intermediate!12363 (undefined!13175 Bool) (index!51846 (_ BitVec 32)) (x!133427 (_ BitVec 32))) (Undefined!12363) (MissingVacant!12363 (index!51847 (_ BitVec 32))) )
))
(declare-fun lt!650439 () SeekEntryResult!12363)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491922 (= res!1015041 (= lt!650439 (Intermediate!12363 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99703 0))(
  ( (array!99704 (arr!48123 (Array (_ BitVec 32) (_ BitVec 64))) (size!48673 (_ BitVec 32))) )
))
(declare-fun lt!650438 () array!99703)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650440 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99703 (_ BitVec 32)) SeekEntryResult!12363)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491922 (= lt!650439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650440 mask!2687) lt!650440 lt!650438 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99703)

(assert (=> b!1491922 (= lt!650440 (select (store (arr!48123 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491923 () Bool)

(declare-fun res!1015046 () Bool)

(declare-fun e!835847 () Bool)

(assert (=> b!1491923 (=> (not res!1015046) (not e!835847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99703 (_ BitVec 32)) Bool)

(assert (=> b!1491923 (= res!1015046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491924 () Bool)

(declare-fun e!835840 () Bool)

(assert (=> b!1491924 (= e!835846 (not e!835840))))

(declare-fun res!1015036 () Bool)

(assert (=> b!1491924 (=> res!1015036 e!835840)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1491924 (= res!1015036 (or (and (= (select (arr!48123 a!2862) index!646) (select (store (arr!48123 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48123 a!2862) index!646) (select (arr!48123 a!2862) j!93))) (= (select (arr!48123 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835843 () Bool)

(assert (=> b!1491924 e!835843))

(declare-fun res!1015045 () Bool)

(assert (=> b!1491924 (=> (not res!1015045) (not e!835843))))

(assert (=> b!1491924 (= res!1015045 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50066 0))(
  ( (Unit!50067) )
))
(declare-fun lt!650441 () Unit!50066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50066)

(assert (=> b!1491924 (= lt!650441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491925 () Bool)

(declare-fun res!1015050 () Bool)

(assert (=> b!1491925 (=> (not res!1015050) (not e!835846))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491925 (= res!1015050 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491926 () Bool)

(declare-fun res!1015051 () Bool)

(assert (=> b!1491926 (=> (not res!1015051) (not e!835841))))

(declare-fun lt!650437 () SeekEntryResult!12363)

(assert (=> b!1491926 (= res!1015051 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48123 a!2862) j!93) a!2862 mask!2687) lt!650437))))

(declare-fun b!1491927 () Bool)

(declare-fun e!835842 () Bool)

(assert (=> b!1491927 (= e!835842 e!835841)))

(declare-fun res!1015042 () Bool)

(assert (=> b!1491927 (=> (not res!1015042) (not e!835841))))

(assert (=> b!1491927 (= res!1015042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48123 a!2862) j!93) mask!2687) (select (arr!48123 a!2862) j!93) a!2862 mask!2687) lt!650437))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491927 (= lt!650437 (Intermediate!12363 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491928 () Bool)

(declare-fun res!1015039 () Bool)

(assert (=> b!1491928 (=> (not res!1015039) (not e!835847))))

(declare-datatypes ((List!34624 0))(
  ( (Nil!34621) (Cons!34620 (h!36003 (_ BitVec 64)) (t!49318 List!34624)) )
))
(declare-fun arrayNoDuplicates!0 (array!99703 (_ BitVec 32) List!34624) Bool)

(assert (=> b!1491928 (= res!1015039 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34621))))

(declare-fun res!1015047 () Bool)

(assert (=> start!126930 (=> (not res!1015047) (not e!835847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126930 (= res!1015047 (validMask!0 mask!2687))))

(assert (=> start!126930 e!835847))

(assert (=> start!126930 true))

(declare-fun array_inv!37151 (array!99703) Bool)

(assert (=> start!126930 (array_inv!37151 a!2862)))

(declare-fun b!1491929 () Bool)

(declare-fun res!1015048 () Bool)

(assert (=> b!1491929 (=> (not res!1015048) (not e!835846))))

(declare-fun e!835844 () Bool)

(assert (=> b!1491929 (= res!1015048 e!835844)))

(declare-fun c!137970 () Bool)

(assert (=> b!1491929 (= c!137970 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491930 () Bool)

(declare-fun res!1015043 () Bool)

(assert (=> b!1491930 (=> (not res!1015043) (not e!835847))))

(assert (=> b!1491930 (= res!1015043 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48673 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48673 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48673 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491931 () Bool)

(assert (=> b!1491931 (= e!835847 e!835842)))

(declare-fun res!1015044 () Bool)

(assert (=> b!1491931 (=> (not res!1015044) (not e!835842))))

(assert (=> b!1491931 (= res!1015044 (= (select (store (arr!48123 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491931 (= lt!650438 (array!99704 (store (arr!48123 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48673 a!2862)))))

(declare-fun b!1491932 () Bool)

(assert (=> b!1491932 (= e!835843 (or (= (select (arr!48123 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48123 a!2862) intermediateBeforeIndex!19) (select (arr!48123 a!2862) j!93))))))

(declare-fun b!1491933 () Bool)

(declare-fun res!1015038 () Bool)

(assert (=> b!1491933 (=> (not res!1015038) (not e!835847))))

(assert (=> b!1491933 (= res!1015038 (and (= (size!48673 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48673 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48673 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491934 () Bool)

(assert (=> b!1491934 (= e!835844 (= lt!650439 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650440 lt!650438 mask!2687)))))

(declare-fun b!1491935 () Bool)

(declare-fun res!1015049 () Bool)

(assert (=> b!1491935 (=> (not res!1015049) (not e!835847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491935 (= res!1015049 (validKeyInArray!0 (select (arr!48123 a!2862) j!93)))))

(declare-fun b!1491936 () Bool)

(declare-fun res!1015040 () Bool)

(assert (=> b!1491936 (=> (not res!1015040) (not e!835843))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99703 (_ BitVec 32)) SeekEntryResult!12363)

(assert (=> b!1491936 (= res!1015040 (= (seekEntryOrOpen!0 (select (arr!48123 a!2862) j!93) a!2862 mask!2687) (Found!12363 j!93)))))

(declare-fun b!1491937 () Bool)

(declare-fun res!1015037 () Bool)

(assert (=> b!1491937 (=> (not res!1015037) (not e!835847))))

(assert (=> b!1491937 (= res!1015037 (validKeyInArray!0 (select (arr!48123 a!2862) i!1006)))))

(declare-fun b!1491938 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99703 (_ BitVec 32)) SeekEntryResult!12363)

(assert (=> b!1491938 (= e!835844 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650440 lt!650438 mask!2687) (seekEntryOrOpen!0 lt!650440 lt!650438 mask!2687)))))

(declare-fun b!1491939 () Bool)

(assert (=> b!1491939 (= e!835840 true)))

(declare-fun lt!650442 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491939 (= lt!650442 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!126930 res!1015047) b!1491933))

(assert (= (and b!1491933 res!1015038) b!1491937))

(assert (= (and b!1491937 res!1015037) b!1491935))

(assert (= (and b!1491935 res!1015049) b!1491923))

(assert (= (and b!1491923 res!1015046) b!1491928))

(assert (= (and b!1491928 res!1015039) b!1491930))

(assert (= (and b!1491930 res!1015043) b!1491931))

(assert (= (and b!1491931 res!1015044) b!1491927))

(assert (= (and b!1491927 res!1015042) b!1491926))

(assert (= (and b!1491926 res!1015051) b!1491922))

(assert (= (and b!1491922 res!1015041) b!1491929))

(assert (= (and b!1491929 c!137970) b!1491934))

(assert (= (and b!1491929 (not c!137970)) b!1491938))

(assert (= (and b!1491929 res!1015048) b!1491925))

(assert (= (and b!1491925 res!1015050) b!1491924))

(assert (= (and b!1491924 res!1015045) b!1491936))

(assert (= (and b!1491936 res!1015040) b!1491932))

(assert (= (and b!1491924 (not res!1015036)) b!1491939))

(declare-fun m!1376027 () Bool)

(assert (=> b!1491927 m!1376027))

(assert (=> b!1491927 m!1376027))

(declare-fun m!1376029 () Bool)

(assert (=> b!1491927 m!1376029))

(assert (=> b!1491927 m!1376029))

(assert (=> b!1491927 m!1376027))

(declare-fun m!1376031 () Bool)

(assert (=> b!1491927 m!1376031))

(declare-fun m!1376033 () Bool)

(assert (=> b!1491932 m!1376033))

(assert (=> b!1491932 m!1376027))

(declare-fun m!1376035 () Bool)

(assert (=> b!1491924 m!1376035))

(declare-fun m!1376037 () Bool)

(assert (=> b!1491924 m!1376037))

(declare-fun m!1376039 () Bool)

(assert (=> b!1491924 m!1376039))

(declare-fun m!1376041 () Bool)

(assert (=> b!1491924 m!1376041))

(declare-fun m!1376043 () Bool)

(assert (=> b!1491924 m!1376043))

(assert (=> b!1491924 m!1376027))

(declare-fun m!1376045 () Bool)

(assert (=> b!1491938 m!1376045))

(declare-fun m!1376047 () Bool)

(assert (=> b!1491938 m!1376047))

(declare-fun m!1376049 () Bool)

(assert (=> b!1491923 m!1376049))

(assert (=> b!1491936 m!1376027))

(assert (=> b!1491936 m!1376027))

(declare-fun m!1376051 () Bool)

(assert (=> b!1491936 m!1376051))

(assert (=> b!1491935 m!1376027))

(assert (=> b!1491935 m!1376027))

(declare-fun m!1376053 () Bool)

(assert (=> b!1491935 m!1376053))

(declare-fun m!1376055 () Bool)

(assert (=> b!1491934 m!1376055))

(declare-fun m!1376057 () Bool)

(assert (=> b!1491922 m!1376057))

(assert (=> b!1491922 m!1376057))

(declare-fun m!1376059 () Bool)

(assert (=> b!1491922 m!1376059))

(assert (=> b!1491922 m!1376037))

(declare-fun m!1376061 () Bool)

(assert (=> b!1491922 m!1376061))

(declare-fun m!1376063 () Bool)

(assert (=> start!126930 m!1376063))

(declare-fun m!1376065 () Bool)

(assert (=> start!126930 m!1376065))

(declare-fun m!1376067 () Bool)

(assert (=> b!1491928 m!1376067))

(assert (=> b!1491926 m!1376027))

(assert (=> b!1491926 m!1376027))

(declare-fun m!1376069 () Bool)

(assert (=> b!1491926 m!1376069))

(assert (=> b!1491931 m!1376037))

(declare-fun m!1376071 () Bool)

(assert (=> b!1491931 m!1376071))

(declare-fun m!1376073 () Bool)

(assert (=> b!1491937 m!1376073))

(assert (=> b!1491937 m!1376073))

(declare-fun m!1376075 () Bool)

(assert (=> b!1491937 m!1376075))

(declare-fun m!1376077 () Bool)

(assert (=> b!1491939 m!1376077))

(check-sat (not b!1491927) (not b!1491928) (not b!1491923) (not b!1491939) (not b!1491935) (not b!1491937) (not b!1491924) (not b!1491926) (not b!1491934) (not b!1491938) (not b!1491922) (not start!126930) (not b!1491936))
(check-sat)
