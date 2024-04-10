; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126932 () Bool)

(assert start!126932)

(declare-fun b!1491977 () Bool)

(declare-fun res!1015090 () Bool)

(declare-fun e!835870 () Bool)

(assert (=> b!1491977 (=> (not res!1015090) (not e!835870))))

(declare-datatypes ((array!99705 0))(
  ( (array!99706 (arr!48124 (Array (_ BitVec 32) (_ BitVec 64))) (size!48674 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99705)

(declare-datatypes ((List!34625 0))(
  ( (Nil!34622) (Cons!34621 (h!36004 (_ BitVec 64)) (t!49319 List!34625)) )
))
(declare-fun arrayNoDuplicates!0 (array!99705 (_ BitVec 32) List!34625) Bool)

(assert (=> b!1491977 (= res!1015090 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34622))))

(declare-fun b!1491978 () Bool)

(declare-fun e!835869 () Bool)

(assert (=> b!1491978 (= e!835870 e!835869)))

(declare-fun res!1015091 () Bool)

(assert (=> b!1491978 (=> (not res!1015091) (not e!835869))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491978 (= res!1015091 (= (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650458 () array!99705)

(assert (=> b!1491978 (= lt!650458 (array!99706 (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48674 a!2862)))))

(declare-fun b!1491979 () Bool)

(declare-fun e!835871 () Bool)

(assert (=> b!1491979 (= e!835869 e!835871)))

(declare-fun res!1015085 () Bool)

(assert (=> b!1491979 (=> (not res!1015085) (not e!835871))))

(declare-datatypes ((SeekEntryResult!12364 0))(
  ( (MissingZero!12364 (index!51848 (_ BitVec 32))) (Found!12364 (index!51849 (_ BitVec 32))) (Intermediate!12364 (undefined!13176 Bool) (index!51850 (_ BitVec 32)) (x!133428 (_ BitVec 32))) (Undefined!12364) (MissingVacant!12364 (index!51851 (_ BitVec 32))) )
))
(declare-fun lt!650457 () SeekEntryResult!12364)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99705 (_ BitVec 32)) SeekEntryResult!12364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491979 (= res!1015085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48124 a!2862) j!93) mask!2687) (select (arr!48124 a!2862) j!93) a!2862 mask!2687) lt!650457))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491979 (= lt!650457 (Intermediate!12364 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491980 () Bool)

(declare-fun e!835868 () Bool)

(assert (=> b!1491980 (= e!835868 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!650459 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491980 (= lt!650459 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491981 () Bool)

(declare-fun res!1015099 () Bool)

(assert (=> b!1491981 (=> (not res!1015099) (not e!835870))))

(assert (=> b!1491981 (= res!1015099 (and (= (size!48674 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48674 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48674 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!835867 () Bool)

(declare-fun lt!650456 () (_ BitVec 64))

(declare-fun b!1491982 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99705 (_ BitVec 32)) SeekEntryResult!12364)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99705 (_ BitVec 32)) SeekEntryResult!12364)

(assert (=> b!1491982 (= e!835867 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650456 lt!650458 mask!2687) (seekEntryOrOpen!0 lt!650456 lt!650458 mask!2687)))))

(declare-fun b!1491983 () Bool)

(declare-fun res!1015095 () Bool)

(declare-fun e!835864 () Bool)

(assert (=> b!1491983 (=> (not res!1015095) (not e!835864))))

(assert (=> b!1491983 (= res!1015095 (= (seekEntryOrOpen!0 (select (arr!48124 a!2862) j!93) a!2862 mask!2687) (Found!12364 j!93)))))

(declare-fun b!1491984 () Bool)

(declare-fun res!1015093 () Bool)

(assert (=> b!1491984 (=> (not res!1015093) (not e!835870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491984 (= res!1015093 (validKeyInArray!0 (select (arr!48124 a!2862) i!1006)))))

(declare-fun b!1491985 () Bool)

(declare-fun res!1015084 () Bool)

(declare-fun e!835865 () Bool)

(assert (=> b!1491985 (=> (not res!1015084) (not e!835865))))

(assert (=> b!1491985 (= res!1015084 e!835867)))

(declare-fun c!137973 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491985 (= c!137973 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491986 () Bool)

(declare-fun res!1015086 () Bool)

(assert (=> b!1491986 (=> (not res!1015086) (not e!835870))))

(assert (=> b!1491986 (= res!1015086 (validKeyInArray!0 (select (arr!48124 a!2862) j!93)))))

(declare-fun b!1491987 () Bool)

(declare-fun lt!650460 () SeekEntryResult!12364)

(assert (=> b!1491987 (= e!835867 (= lt!650460 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650456 lt!650458 mask!2687)))))

(declare-fun b!1491988 () Bool)

(declare-fun res!1015094 () Bool)

(assert (=> b!1491988 (=> (not res!1015094) (not e!835871))))

(assert (=> b!1491988 (= res!1015094 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48124 a!2862) j!93) a!2862 mask!2687) lt!650457))))

(declare-fun b!1491989 () Bool)

(assert (=> b!1491989 (= e!835865 (not e!835868))))

(declare-fun res!1015089 () Bool)

(assert (=> b!1491989 (=> res!1015089 e!835868)))

(assert (=> b!1491989 (= res!1015089 (or (and (= (select (arr!48124 a!2862) index!646) (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48124 a!2862) index!646) (select (arr!48124 a!2862) j!93))) (= (select (arr!48124 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491989 e!835864))

(declare-fun res!1015096 () Bool)

(assert (=> b!1491989 (=> (not res!1015096) (not e!835864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99705 (_ BitVec 32)) Bool)

(assert (=> b!1491989 (= res!1015096 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50068 0))(
  ( (Unit!50069) )
))
(declare-fun lt!650455 () Unit!50068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50068)

(assert (=> b!1491989 (= lt!650455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491976 () Bool)

(assert (=> b!1491976 (= e!835864 (or (= (select (arr!48124 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48124 a!2862) intermediateBeforeIndex!19) (select (arr!48124 a!2862) j!93))))))

(declare-fun res!1015098 () Bool)

(assert (=> start!126932 (=> (not res!1015098) (not e!835870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126932 (= res!1015098 (validMask!0 mask!2687))))

(assert (=> start!126932 e!835870))

(assert (=> start!126932 true))

(declare-fun array_inv!37152 (array!99705) Bool)

(assert (=> start!126932 (array_inv!37152 a!2862)))

(declare-fun b!1491990 () Bool)

(declare-fun res!1015092 () Bool)

(assert (=> b!1491990 (=> (not res!1015092) (not e!835870))))

(assert (=> b!1491990 (= res!1015092 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48674 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48674 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48674 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491991 () Bool)

(assert (=> b!1491991 (= e!835871 e!835865)))

(declare-fun res!1015087 () Bool)

(assert (=> b!1491991 (=> (not res!1015087) (not e!835865))))

(assert (=> b!1491991 (= res!1015087 (= lt!650460 (Intermediate!12364 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491991 (= lt!650460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650456 mask!2687) lt!650456 lt!650458 mask!2687))))

(assert (=> b!1491991 (= lt!650456 (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491992 () Bool)

(declare-fun res!1015097 () Bool)

(assert (=> b!1491992 (=> (not res!1015097) (not e!835865))))

(assert (=> b!1491992 (= res!1015097 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491993 () Bool)

(declare-fun res!1015088 () Bool)

(assert (=> b!1491993 (=> (not res!1015088) (not e!835870))))

(assert (=> b!1491993 (= res!1015088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126932 res!1015098) b!1491981))

(assert (= (and b!1491981 res!1015099) b!1491984))

(assert (= (and b!1491984 res!1015093) b!1491986))

(assert (= (and b!1491986 res!1015086) b!1491993))

(assert (= (and b!1491993 res!1015088) b!1491977))

(assert (= (and b!1491977 res!1015090) b!1491990))

(assert (= (and b!1491990 res!1015092) b!1491978))

(assert (= (and b!1491978 res!1015091) b!1491979))

(assert (= (and b!1491979 res!1015085) b!1491988))

(assert (= (and b!1491988 res!1015094) b!1491991))

(assert (= (and b!1491991 res!1015087) b!1491985))

(assert (= (and b!1491985 c!137973) b!1491987))

(assert (= (and b!1491985 (not c!137973)) b!1491982))

(assert (= (and b!1491985 res!1015084) b!1491992))

(assert (= (and b!1491992 res!1015097) b!1491989))

(assert (= (and b!1491989 res!1015096) b!1491983))

(assert (= (and b!1491983 res!1015095) b!1491976))

(assert (= (and b!1491989 (not res!1015089)) b!1491980))

(declare-fun m!1376079 () Bool)

(assert (=> b!1491988 m!1376079))

(assert (=> b!1491988 m!1376079))

(declare-fun m!1376081 () Bool)

(assert (=> b!1491988 m!1376081))

(declare-fun m!1376083 () Bool)

(assert (=> b!1491989 m!1376083))

(declare-fun m!1376085 () Bool)

(assert (=> b!1491989 m!1376085))

(declare-fun m!1376087 () Bool)

(assert (=> b!1491989 m!1376087))

(declare-fun m!1376089 () Bool)

(assert (=> b!1491989 m!1376089))

(declare-fun m!1376091 () Bool)

(assert (=> b!1491989 m!1376091))

(assert (=> b!1491989 m!1376079))

(assert (=> b!1491978 m!1376085))

(declare-fun m!1376093 () Bool)

(assert (=> b!1491978 m!1376093))

(assert (=> b!1491986 m!1376079))

(assert (=> b!1491986 m!1376079))

(declare-fun m!1376095 () Bool)

(assert (=> b!1491986 m!1376095))

(declare-fun m!1376097 () Bool)

(assert (=> b!1491993 m!1376097))

(declare-fun m!1376099 () Bool)

(assert (=> start!126932 m!1376099))

(declare-fun m!1376101 () Bool)

(assert (=> start!126932 m!1376101))

(declare-fun m!1376103 () Bool)

(assert (=> b!1491987 m!1376103))

(assert (=> b!1491979 m!1376079))

(assert (=> b!1491979 m!1376079))

(declare-fun m!1376105 () Bool)

(assert (=> b!1491979 m!1376105))

(assert (=> b!1491979 m!1376105))

(assert (=> b!1491979 m!1376079))

(declare-fun m!1376107 () Bool)

(assert (=> b!1491979 m!1376107))

(declare-fun m!1376109 () Bool)

(assert (=> b!1491977 m!1376109))

(declare-fun m!1376111 () Bool)

(assert (=> b!1491984 m!1376111))

(assert (=> b!1491984 m!1376111))

(declare-fun m!1376113 () Bool)

(assert (=> b!1491984 m!1376113))

(declare-fun m!1376115 () Bool)

(assert (=> b!1491982 m!1376115))

(declare-fun m!1376117 () Bool)

(assert (=> b!1491982 m!1376117))

(declare-fun m!1376119 () Bool)

(assert (=> b!1491976 m!1376119))

(assert (=> b!1491976 m!1376079))

(assert (=> b!1491983 m!1376079))

(assert (=> b!1491983 m!1376079))

(declare-fun m!1376121 () Bool)

(assert (=> b!1491983 m!1376121))

(declare-fun m!1376123 () Bool)

(assert (=> b!1491991 m!1376123))

(assert (=> b!1491991 m!1376123))

(declare-fun m!1376125 () Bool)

(assert (=> b!1491991 m!1376125))

(assert (=> b!1491991 m!1376085))

(declare-fun m!1376127 () Bool)

(assert (=> b!1491991 m!1376127))

(declare-fun m!1376129 () Bool)

(assert (=> b!1491980 m!1376129))

(push 1)

