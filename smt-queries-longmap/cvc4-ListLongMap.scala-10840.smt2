; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126890 () Bool)

(assert start!126890)

(declare-fun b!1490842 () Bool)

(declare-fun res!1014083 () Bool)

(declare-fun e!835364 () Bool)

(assert (=> b!1490842 (=> (not res!1014083) (not e!835364))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12343 0))(
  ( (MissingZero!12343 (index!51764 (_ BitVec 32))) (Found!12343 (index!51765 (_ BitVec 32))) (Intermediate!12343 (undefined!13155 Bool) (index!51766 (_ BitVec 32)) (x!133351 (_ BitVec 32))) (Undefined!12343) (MissingVacant!12343 (index!51767 (_ BitVec 32))) )
))
(declare-fun lt!650082 () SeekEntryResult!12343)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99663 0))(
  ( (array!99664 (arr!48103 (Array (_ BitVec 32) (_ BitVec 64))) (size!48653 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99663)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99663 (_ BitVec 32)) SeekEntryResult!12343)

(assert (=> b!1490842 (= res!1014083 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48103 a!2862) j!93) a!2862 mask!2687) lt!650082))))

(declare-fun b!1490843 () Bool)

(declare-fun res!1014084 () Bool)

(declare-fun e!835363 () Bool)

(assert (=> b!1490843 (=> (not res!1014084) (not e!835363))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99663 (_ BitVec 32)) SeekEntryResult!12343)

(assert (=> b!1490843 (= res!1014084 (= (seekEntryOrOpen!0 (select (arr!48103 a!2862) j!93) a!2862 mask!2687) (Found!12343 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1490845 () Bool)

(assert (=> b!1490845 (= e!835363 (or (= (select (arr!48103 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48103 a!2862) intermediateBeforeIndex!19) (select (arr!48103 a!2862) j!93))))))

(declare-fun b!1490846 () Bool)

(declare-fun e!835367 () Bool)

(declare-fun e!835365 () Bool)

(assert (=> b!1490846 (= e!835367 (not e!835365))))

(declare-fun res!1014090 () Bool)

(assert (=> b!1490846 (=> res!1014090 e!835365)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490846 (= res!1014090 (or (and (= (select (arr!48103 a!2862) index!646) (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48103 a!2862) index!646) (select (arr!48103 a!2862) j!93))) (= (select (arr!48103 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490846 e!835363))

(declare-fun res!1014087 () Bool)

(assert (=> b!1490846 (=> (not res!1014087) (not e!835363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99663 (_ BitVec 32)) Bool)

(assert (=> b!1490846 (= res!1014087 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50026 0))(
  ( (Unit!50027) )
))
(declare-fun lt!650079 () Unit!50026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50026)

(assert (=> b!1490846 (= lt!650079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490847 () Bool)

(assert (=> b!1490847 (= e!835364 e!835367)))

(declare-fun res!1014091 () Bool)

(assert (=> b!1490847 (=> (not res!1014091) (not e!835367))))

(declare-fun lt!650080 () SeekEntryResult!12343)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490847 (= res!1014091 (= lt!650080 (Intermediate!12343 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650081 () array!99663)

(declare-fun lt!650077 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490847 (= lt!650080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650077 mask!2687) lt!650077 lt!650081 mask!2687))))

(assert (=> b!1490847 (= lt!650077 (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490848 () Bool)

(declare-fun res!1014077 () Bool)

(declare-fun e!835360 () Bool)

(assert (=> b!1490848 (=> (not res!1014077) (not e!835360))))

(assert (=> b!1490848 (= res!1014077 (and (= (size!48653 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48653 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48653 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490849 () Bool)

(declare-fun res!1014079 () Bool)

(assert (=> b!1490849 (=> (not res!1014079) (not e!835360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490849 (= res!1014079 (validKeyInArray!0 (select (arr!48103 a!2862) j!93)))))

(declare-fun b!1490850 () Bool)

(declare-fun res!1014076 () Bool)

(assert (=> b!1490850 (=> (not res!1014076) (not e!835367))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490850 (= res!1014076 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490844 () Bool)

(declare-fun e!835366 () Bool)

(assert (=> b!1490844 (= e!835360 e!835366)))

(declare-fun res!1014080 () Bool)

(assert (=> b!1490844 (=> (not res!1014080) (not e!835366))))

(assert (=> b!1490844 (= res!1014080 (= (select (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490844 (= lt!650081 (array!99664 (store (arr!48103 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48653 a!2862)))))

(declare-fun res!1014081 () Bool)

(assert (=> start!126890 (=> (not res!1014081) (not e!835360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126890 (= res!1014081 (validMask!0 mask!2687))))

(assert (=> start!126890 e!835360))

(assert (=> start!126890 true))

(declare-fun array_inv!37131 (array!99663) Bool)

(assert (=> start!126890 (array_inv!37131 a!2862)))

(declare-fun b!1490851 () Bool)

(declare-fun res!1014078 () Bool)

(assert (=> b!1490851 (=> (not res!1014078) (not e!835360))))

(declare-datatypes ((List!34604 0))(
  ( (Nil!34601) (Cons!34600 (h!35983 (_ BitVec 64)) (t!49298 List!34604)) )
))
(declare-fun arrayNoDuplicates!0 (array!99663 (_ BitVec 32) List!34604) Bool)

(assert (=> b!1490851 (= res!1014078 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34601))))

(declare-fun b!1490852 () Bool)

(declare-fun res!1014082 () Bool)

(assert (=> b!1490852 (=> (not res!1014082) (not e!835360))))

(assert (=> b!1490852 (= res!1014082 (validKeyInArray!0 (select (arr!48103 a!2862) i!1006)))))

(declare-fun b!1490853 () Bool)

(declare-fun res!1014088 () Bool)

(assert (=> b!1490853 (=> (not res!1014088) (not e!835367))))

(declare-fun e!835362 () Bool)

(assert (=> b!1490853 (= res!1014088 e!835362)))

(declare-fun c!137910 () Bool)

(assert (=> b!1490853 (= c!137910 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490854 () Bool)

(assert (=> b!1490854 (= e!835366 e!835364)))

(declare-fun res!1014089 () Bool)

(assert (=> b!1490854 (=> (not res!1014089) (not e!835364))))

(assert (=> b!1490854 (= res!1014089 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48103 a!2862) j!93) mask!2687) (select (arr!48103 a!2862) j!93) a!2862 mask!2687) lt!650082))))

(assert (=> b!1490854 (= lt!650082 (Intermediate!12343 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490855 () Bool)

(assert (=> b!1490855 (= e!835365 true)))

(declare-fun lt!650078 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490855 (= lt!650078 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490856 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99663 (_ BitVec 32)) SeekEntryResult!12343)

(assert (=> b!1490856 (= e!835362 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650077 lt!650081 mask!2687) (seekEntryOrOpen!0 lt!650077 lt!650081 mask!2687)))))

(declare-fun b!1490857 () Bool)

(declare-fun res!1014085 () Bool)

(assert (=> b!1490857 (=> (not res!1014085) (not e!835360))))

(assert (=> b!1490857 (= res!1014085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490858 () Bool)

(declare-fun res!1014086 () Bool)

(assert (=> b!1490858 (=> (not res!1014086) (not e!835360))))

(assert (=> b!1490858 (= res!1014086 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48653 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48653 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48653 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490859 () Bool)

(assert (=> b!1490859 (= e!835362 (= lt!650080 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650077 lt!650081 mask!2687)))))

(assert (= (and start!126890 res!1014081) b!1490848))

(assert (= (and b!1490848 res!1014077) b!1490852))

(assert (= (and b!1490852 res!1014082) b!1490849))

(assert (= (and b!1490849 res!1014079) b!1490857))

(assert (= (and b!1490857 res!1014085) b!1490851))

(assert (= (and b!1490851 res!1014078) b!1490858))

(assert (= (and b!1490858 res!1014086) b!1490844))

(assert (= (and b!1490844 res!1014080) b!1490854))

(assert (= (and b!1490854 res!1014089) b!1490842))

(assert (= (and b!1490842 res!1014083) b!1490847))

(assert (= (and b!1490847 res!1014091) b!1490853))

(assert (= (and b!1490853 c!137910) b!1490859))

(assert (= (and b!1490853 (not c!137910)) b!1490856))

(assert (= (and b!1490853 res!1014088) b!1490850))

(assert (= (and b!1490850 res!1014076) b!1490846))

(assert (= (and b!1490846 res!1014087) b!1490843))

(assert (= (and b!1490843 res!1014084) b!1490845))

(assert (= (and b!1490846 (not res!1014090)) b!1490855))

(declare-fun m!1374987 () Bool)

(assert (=> b!1490857 m!1374987))

(declare-fun m!1374989 () Bool)

(assert (=> b!1490842 m!1374989))

(assert (=> b!1490842 m!1374989))

(declare-fun m!1374991 () Bool)

(assert (=> b!1490842 m!1374991))

(declare-fun m!1374993 () Bool)

(assert (=> b!1490846 m!1374993))

(declare-fun m!1374995 () Bool)

(assert (=> b!1490846 m!1374995))

(declare-fun m!1374997 () Bool)

(assert (=> b!1490846 m!1374997))

(declare-fun m!1374999 () Bool)

(assert (=> b!1490846 m!1374999))

(declare-fun m!1375001 () Bool)

(assert (=> b!1490846 m!1375001))

(assert (=> b!1490846 m!1374989))

(declare-fun m!1375003 () Bool)

(assert (=> b!1490847 m!1375003))

(assert (=> b!1490847 m!1375003))

(declare-fun m!1375005 () Bool)

(assert (=> b!1490847 m!1375005))

(assert (=> b!1490847 m!1374995))

(declare-fun m!1375007 () Bool)

(assert (=> b!1490847 m!1375007))

(declare-fun m!1375009 () Bool)

(assert (=> b!1490856 m!1375009))

(declare-fun m!1375011 () Bool)

(assert (=> b!1490856 m!1375011))

(assert (=> b!1490849 m!1374989))

(assert (=> b!1490849 m!1374989))

(declare-fun m!1375013 () Bool)

(assert (=> b!1490849 m!1375013))

(declare-fun m!1375015 () Bool)

(assert (=> b!1490859 m!1375015))

(declare-fun m!1375017 () Bool)

(assert (=> b!1490845 m!1375017))

(assert (=> b!1490845 m!1374989))

(assert (=> b!1490843 m!1374989))

(assert (=> b!1490843 m!1374989))

(declare-fun m!1375019 () Bool)

(assert (=> b!1490843 m!1375019))

(declare-fun m!1375021 () Bool)

(assert (=> start!126890 m!1375021))

(declare-fun m!1375023 () Bool)

(assert (=> start!126890 m!1375023))

(assert (=> b!1490854 m!1374989))

(assert (=> b!1490854 m!1374989))

(declare-fun m!1375025 () Bool)

(assert (=> b!1490854 m!1375025))

(assert (=> b!1490854 m!1375025))

(assert (=> b!1490854 m!1374989))

(declare-fun m!1375027 () Bool)

(assert (=> b!1490854 m!1375027))

(declare-fun m!1375029 () Bool)

(assert (=> b!1490852 m!1375029))

(assert (=> b!1490852 m!1375029))

(declare-fun m!1375031 () Bool)

(assert (=> b!1490852 m!1375031))

(declare-fun m!1375033 () Bool)

(assert (=> b!1490855 m!1375033))

(declare-fun m!1375035 () Bool)

(assert (=> b!1490851 m!1375035))

(assert (=> b!1490844 m!1374995))

(declare-fun m!1375037 () Bool)

(assert (=> b!1490844 m!1375037))

(push 1)

