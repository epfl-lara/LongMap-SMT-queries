; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127356 () Bool)

(assert start!127356)

(declare-fun b!1496867 () Bool)

(declare-fun res!1018143 () Bool)

(declare-fun e!838332 () Bool)

(assert (=> b!1496867 (=> (not res!1018143) (not e!838332))))

(declare-datatypes ((array!99818 0))(
  ( (array!99819 (arr!48173 (Array (_ BitVec 32) (_ BitVec 64))) (size!48723 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99818)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99818 (_ BitVec 32)) Bool)

(assert (=> b!1496867 (= res!1018143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496868 () Bool)

(declare-fun e!838334 () Bool)

(declare-fun e!838336 () Bool)

(assert (=> b!1496868 (= e!838334 e!838336)))

(declare-fun res!1018148 () Bool)

(assert (=> b!1496868 (=> (not res!1018148) (not e!838336))))

(declare-datatypes ((SeekEntryResult!12413 0))(
  ( (MissingZero!12413 (index!52044 (_ BitVec 32))) (Found!12413 (index!52045 (_ BitVec 32))) (Intermediate!12413 (undefined!13225 Bool) (index!52046 (_ BitVec 32)) (x!133671 (_ BitVec 32))) (Undefined!12413) (MissingVacant!12413 (index!52047 (_ BitVec 32))) )
))
(declare-fun lt!652239 () SeekEntryResult!12413)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496868 (= res!1018148 (= lt!652239 (Intermediate!12413 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!652233 () array!99818)

(declare-fun lt!652240 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99818 (_ BitVec 32)) SeekEntryResult!12413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496868 (= lt!652239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652240 mask!2687) lt!652240 lt!652233 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1496868 (= lt!652240 (select (store (arr!48173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496869 () Bool)

(declare-fun res!1018134 () Bool)

(assert (=> b!1496869 (=> (not res!1018134) (not e!838332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496869 (= res!1018134 (validKeyInArray!0 (select (arr!48173 a!2862) j!93)))))

(declare-fun b!1496870 () Bool)

(declare-fun res!1018147 () Bool)

(declare-fun e!838333 () Bool)

(assert (=> b!1496870 (=> res!1018147 e!838333)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!652234 () (_ BitVec 32))

(declare-fun lt!652236 () SeekEntryResult!12413)

(assert (=> b!1496870 (= res!1018147 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652234 (select (arr!48173 a!2862) j!93) a!2862 mask!2687) lt!652236)))))

(declare-fun b!1496871 () Bool)

(declare-fun res!1018139 () Bool)

(assert (=> b!1496871 (=> (not res!1018139) (not e!838332))))

(declare-datatypes ((List!34674 0))(
  ( (Nil!34671) (Cons!34670 (h!36067 (_ BitVec 64)) (t!49368 List!34674)) )
))
(declare-fun arrayNoDuplicates!0 (array!99818 (_ BitVec 32) List!34674) Bool)

(assert (=> b!1496871 (= res!1018139 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34671))))

(declare-fun b!1496872 () Bool)

(assert (=> b!1496872 (= e!838333 true)))

(declare-fun lt!652238 () SeekEntryResult!12413)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99818 (_ BitVec 32)) SeekEntryResult!12413)

(assert (=> b!1496872 (= lt!652238 (seekEntryOrOpen!0 lt!652240 lt!652233 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!50166 0))(
  ( (Unit!50167) )
))
(declare-fun lt!652237 () Unit!50166)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50166)

(assert (=> b!1496872 (= lt!652237 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652234 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun e!838330 () Bool)

(declare-fun b!1496873 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99818 (_ BitVec 32)) SeekEntryResult!12413)

(assert (=> b!1496873 (= e!838330 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652240 lt!652233 mask!2687) (seekEntryOrOpen!0 lt!652240 lt!652233 mask!2687)))))

(declare-fun b!1496874 () Bool)

(declare-fun res!1018137 () Bool)

(assert (=> b!1496874 (=> (not res!1018137) (not e!838336))))

(assert (=> b!1496874 (= res!1018137 e!838330)))

(declare-fun c!138902 () Bool)

(assert (=> b!1496874 (= c!138902 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1018145 () Bool)

(assert (=> start!127356 (=> (not res!1018145) (not e!838332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127356 (= res!1018145 (validMask!0 mask!2687))))

(assert (=> start!127356 e!838332))

(assert (=> start!127356 true))

(declare-fun array_inv!37201 (array!99818) Bool)

(assert (=> start!127356 (array_inv!37201 a!2862)))

(declare-fun b!1496875 () Bool)

(declare-fun res!1018138 () Bool)

(assert (=> b!1496875 (=> res!1018138 e!838333)))

(declare-fun e!838328 () Bool)

(assert (=> b!1496875 (= res!1018138 e!838328)))

(declare-fun c!138901 () Bool)

(assert (=> b!1496875 (= c!138901 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496876 () Bool)

(declare-fun res!1018144 () Bool)

(assert (=> b!1496876 (=> (not res!1018144) (not e!838332))))

(assert (=> b!1496876 (= res!1018144 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48723 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48723 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48723 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496877 () Bool)

(declare-fun res!1018146 () Bool)

(assert (=> b!1496877 (=> res!1018146 e!838333)))

(assert (=> b!1496877 (= res!1018146 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496878 () Bool)

(declare-fun e!838335 () Bool)

(assert (=> b!1496878 (= e!838335 e!838334)))

(declare-fun res!1018150 () Bool)

(assert (=> b!1496878 (=> (not res!1018150) (not e!838334))))

(assert (=> b!1496878 (= res!1018150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48173 a!2862) j!93) mask!2687) (select (arr!48173 a!2862) j!93) a!2862 mask!2687) lt!652236))))

(assert (=> b!1496878 (= lt!652236 (Intermediate!12413 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496879 () Bool)

(declare-fun res!1018133 () Bool)

(assert (=> b!1496879 (=> (not res!1018133) (not e!838334))))

(assert (=> b!1496879 (= res!1018133 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48173 a!2862) j!93) a!2862 mask!2687) lt!652236))))

(declare-fun b!1496880 () Bool)

(assert (=> b!1496880 (= e!838328 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652234 intermediateAfterIndex!19 lt!652240 lt!652233 mask!2687) (seekEntryOrOpen!0 lt!652240 lt!652233 mask!2687))))))

(declare-fun b!1496881 () Bool)

(declare-fun res!1018141 () Bool)

(assert (=> b!1496881 (=> (not res!1018141) (not e!838332))))

(assert (=> b!1496881 (= res!1018141 (validKeyInArray!0 (select (arr!48173 a!2862) i!1006)))))

(declare-fun b!1496882 () Bool)

(assert (=> b!1496882 (= e!838330 (= lt!652239 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652240 lt!652233 mask!2687)))))

(declare-fun b!1496883 () Bool)

(declare-fun res!1018142 () Bool)

(assert (=> b!1496883 (=> (not res!1018142) (not e!838336))))

(assert (=> b!1496883 (= res!1018142 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496884 () Bool)

(assert (=> b!1496884 (= e!838332 e!838335)))

(declare-fun res!1018135 () Bool)

(assert (=> b!1496884 (=> (not res!1018135) (not e!838335))))

(assert (=> b!1496884 (= res!1018135 (= (select (store (arr!48173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496884 (= lt!652233 (array!99819 (store (arr!48173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48723 a!2862)))))

(declare-fun b!1496885 () Bool)

(declare-fun res!1018136 () Bool)

(assert (=> b!1496885 (=> (not res!1018136) (not e!838332))))

(assert (=> b!1496885 (= res!1018136 (and (= (size!48723 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48723 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48723 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496886 () Bool)

(declare-fun e!838331 () Bool)

(assert (=> b!1496886 (= e!838331 e!838333)))

(declare-fun res!1018140 () Bool)

(assert (=> b!1496886 (=> res!1018140 e!838333)))

(assert (=> b!1496886 (= res!1018140 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652234 #b00000000000000000000000000000000) (bvsge lt!652234 (size!48723 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496886 (= lt!652234 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496887 () Bool)

(assert (=> b!1496887 (= e!838336 (not e!838331))))

(declare-fun res!1018149 () Bool)

(assert (=> b!1496887 (=> res!1018149 e!838331)))

(assert (=> b!1496887 (= res!1018149 (or (and (= (select (arr!48173 a!2862) index!646) (select (store (arr!48173 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48173 a!2862) index!646) (select (arr!48173 a!2862) j!93))) (= (select (arr!48173 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496887 (and (= lt!652238 (Found!12413 j!93)) (or (= (select (arr!48173 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48173 a!2862) intermediateBeforeIndex!19) (select (arr!48173 a!2862) j!93))))))

(assert (=> b!1496887 (= lt!652238 (seekEntryOrOpen!0 (select (arr!48173 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1496887 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652235 () Unit!50166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50166)

(assert (=> b!1496887 (= lt!652235 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496888 () Bool)

(assert (=> b!1496888 (= e!838328 (not (= lt!652239 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652234 lt!652240 lt!652233 mask!2687))))))

(assert (= (and start!127356 res!1018145) b!1496885))

(assert (= (and b!1496885 res!1018136) b!1496881))

(assert (= (and b!1496881 res!1018141) b!1496869))

(assert (= (and b!1496869 res!1018134) b!1496867))

(assert (= (and b!1496867 res!1018143) b!1496871))

(assert (= (and b!1496871 res!1018139) b!1496876))

(assert (= (and b!1496876 res!1018144) b!1496884))

(assert (= (and b!1496884 res!1018135) b!1496878))

(assert (= (and b!1496878 res!1018150) b!1496879))

(assert (= (and b!1496879 res!1018133) b!1496868))

(assert (= (and b!1496868 res!1018148) b!1496874))

(assert (= (and b!1496874 c!138902) b!1496882))

(assert (= (and b!1496874 (not c!138902)) b!1496873))

(assert (= (and b!1496874 res!1018137) b!1496883))

(assert (= (and b!1496883 res!1018142) b!1496887))

(assert (= (and b!1496887 (not res!1018149)) b!1496886))

(assert (= (and b!1496886 (not res!1018140)) b!1496870))

(assert (= (and b!1496870 (not res!1018147)) b!1496875))

(assert (= (and b!1496875 c!138901) b!1496888))

(assert (= (and b!1496875 (not c!138901)) b!1496880))

(assert (= (and b!1496875 (not res!1018138)) b!1496877))

(assert (= (and b!1496877 (not res!1018146)) b!1496872))

(declare-fun m!1379995 () Bool)

(assert (=> start!127356 m!1379995))

(declare-fun m!1379997 () Bool)

(assert (=> start!127356 m!1379997))

(declare-fun m!1379999 () Bool)

(assert (=> b!1496873 m!1379999))

(declare-fun m!1380001 () Bool)

(assert (=> b!1496873 m!1380001))

(declare-fun m!1380003 () Bool)

(assert (=> b!1496880 m!1380003))

(assert (=> b!1496880 m!1380001))

(declare-fun m!1380005 () Bool)

(assert (=> b!1496887 m!1380005))

(declare-fun m!1380007 () Bool)

(assert (=> b!1496887 m!1380007))

(declare-fun m!1380009 () Bool)

(assert (=> b!1496887 m!1380009))

(declare-fun m!1380011 () Bool)

(assert (=> b!1496887 m!1380011))

(declare-fun m!1380013 () Bool)

(assert (=> b!1496887 m!1380013))

(declare-fun m!1380015 () Bool)

(assert (=> b!1496887 m!1380015))

(declare-fun m!1380017 () Bool)

(assert (=> b!1496887 m!1380017))

(declare-fun m!1380019 () Bool)

(assert (=> b!1496887 m!1380019))

(assert (=> b!1496887 m!1380015))

(declare-fun m!1380021 () Bool)

(assert (=> b!1496882 m!1380021))

(assert (=> b!1496872 m!1380001))

(declare-fun m!1380023 () Bool)

(assert (=> b!1496872 m!1380023))

(declare-fun m!1380025 () Bool)

(assert (=> b!1496881 m!1380025))

(assert (=> b!1496881 m!1380025))

(declare-fun m!1380027 () Bool)

(assert (=> b!1496881 m!1380027))

(assert (=> b!1496879 m!1380015))

(assert (=> b!1496879 m!1380015))

(declare-fun m!1380029 () Bool)

(assert (=> b!1496879 m!1380029))

(assert (=> b!1496869 m!1380015))

(assert (=> b!1496869 m!1380015))

(declare-fun m!1380031 () Bool)

(assert (=> b!1496869 m!1380031))

(declare-fun m!1380033 () Bool)

(assert (=> b!1496871 m!1380033))

(assert (=> b!1496878 m!1380015))

(assert (=> b!1496878 m!1380015))

(declare-fun m!1380035 () Bool)

(assert (=> b!1496878 m!1380035))

(assert (=> b!1496878 m!1380035))

(assert (=> b!1496878 m!1380015))

(declare-fun m!1380037 () Bool)

(assert (=> b!1496878 m!1380037))

(declare-fun m!1380039 () Bool)

(assert (=> b!1496886 m!1380039))

(assert (=> b!1496870 m!1380015))

(assert (=> b!1496870 m!1380015))

(declare-fun m!1380041 () Bool)

(assert (=> b!1496870 m!1380041))

(declare-fun m!1380043 () Bool)

(assert (=> b!1496888 m!1380043))

(declare-fun m!1380045 () Bool)

(assert (=> b!1496867 m!1380045))

(declare-fun m!1380047 () Bool)

(assert (=> b!1496868 m!1380047))

(assert (=> b!1496868 m!1380047))

(declare-fun m!1380049 () Bool)

(assert (=> b!1496868 m!1380049))

(assert (=> b!1496868 m!1380007))

(declare-fun m!1380051 () Bool)

(assert (=> b!1496868 m!1380051))

(assert (=> b!1496884 m!1380007))

(declare-fun m!1380053 () Bool)

(assert (=> b!1496884 m!1380053))

(push 1)

