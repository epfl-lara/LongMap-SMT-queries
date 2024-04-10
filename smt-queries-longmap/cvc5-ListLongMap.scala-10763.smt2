; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125896 () Bool)

(assert start!125896)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!827038 () Bool)

(declare-datatypes ((array!99173 0))(
  ( (array!99174 (arr!47870 (Array (_ BitVec 32) (_ BitVec 64))) (size!48420 (_ BitVec 32))) )
))
(declare-fun lt!644082 () array!99173)

(declare-fun b!1473889 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!644079 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12110 0))(
  ( (MissingZero!12110 (index!50832 (_ BitVec 32))) (Found!12110 (index!50833 (_ BitVec 32))) (Intermediate!12110 (undefined!12922 Bool) (index!50834 (_ BitVec 32)) (x!132418 (_ BitVec 32))) (Undefined!12110) (MissingVacant!12110 (index!50835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99173 (_ BitVec 32)) SeekEntryResult!12110)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99173 (_ BitVec 32)) SeekEntryResult!12110)

(assert (=> b!1473889 (= e!827038 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644079 lt!644082 mask!2687) (seekEntryOrOpen!0 lt!644079 lt!644082 mask!2687)))))

(declare-fun res!1001159 () Bool)

(declare-fun e!827037 () Bool)

(assert (=> start!125896 (=> (not res!1001159) (not e!827037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125896 (= res!1001159 (validMask!0 mask!2687))))

(assert (=> start!125896 e!827037))

(assert (=> start!125896 true))

(declare-fun a!2862 () array!99173)

(declare-fun array_inv!36898 (array!99173) Bool)

(assert (=> start!125896 (array_inv!36898 a!2862)))

(declare-fun b!1473890 () Bool)

(declare-fun res!1001158 () Bool)

(assert (=> b!1473890 (=> (not res!1001158) (not e!827037))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473890 (= res!1001158 (validKeyInArray!0 (select (arr!47870 a!2862) j!93)))))

(declare-fun b!1473891 () Bool)

(declare-fun e!827042 () Bool)

(assert (=> b!1473891 (= e!827037 e!827042)))

(declare-fun res!1001156 () Bool)

(assert (=> b!1473891 (=> (not res!1001156) (not e!827042))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473891 (= res!1001156 (= (select (store (arr!47870 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473891 (= lt!644082 (array!99174 (store (arr!47870 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48420 a!2862)))))

(declare-fun lt!644080 () SeekEntryResult!12110)

(declare-fun b!1473892 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99173 (_ BitVec 32)) SeekEntryResult!12110)

(assert (=> b!1473892 (= e!827038 (= lt!644080 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644079 lt!644082 mask!2687)))))

(declare-fun b!1473893 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!827035 () Bool)

(assert (=> b!1473893 (= e!827035 (or (= (select (arr!47870 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47870 a!2862) intermediateBeforeIndex!19) (select (arr!47870 a!2862) j!93))))))

(declare-fun b!1473894 () Bool)

(declare-fun res!1001165 () Bool)

(assert (=> b!1473894 (=> (not res!1001165) (not e!827037))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473894 (= res!1001165 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48420 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48420 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48420 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473895 () Bool)

(declare-fun res!1001166 () Bool)

(assert (=> b!1473895 (=> (not res!1001166) (not e!827037))))

(assert (=> b!1473895 (= res!1001166 (and (= (size!48420 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48420 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48420 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473896 () Bool)

(declare-fun res!1001162 () Bool)

(assert (=> b!1473896 (=> (not res!1001162) (not e!827037))))

(assert (=> b!1473896 (= res!1001162 (validKeyInArray!0 (select (arr!47870 a!2862) i!1006)))))

(declare-fun b!1473897 () Bool)

(declare-fun e!827039 () Bool)

(assert (=> b!1473897 (= e!827039 true)))

(declare-fun lt!644077 () SeekEntryResult!12110)

(assert (=> b!1473897 (= lt!644077 (seekEntryOrOpen!0 lt!644079 lt!644082 mask!2687))))

(declare-fun b!1473898 () Bool)

(declare-fun res!1001164 () Bool)

(declare-fun e!827036 () Bool)

(assert (=> b!1473898 (=> (not res!1001164) (not e!827036))))

(declare-fun lt!644081 () SeekEntryResult!12110)

(assert (=> b!1473898 (= res!1001164 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47870 a!2862) j!93) a!2862 mask!2687) lt!644081))))

(declare-fun b!1473899 () Bool)

(declare-fun res!1001155 () Bool)

(declare-fun e!827041 () Bool)

(assert (=> b!1473899 (=> (not res!1001155) (not e!827041))))

(assert (=> b!1473899 (= res!1001155 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473900 () Bool)

(assert (=> b!1473900 (= e!827036 e!827041)))

(declare-fun res!1001161 () Bool)

(assert (=> b!1473900 (=> (not res!1001161) (not e!827041))))

(assert (=> b!1473900 (= res!1001161 (= lt!644080 (Intermediate!12110 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473900 (= lt!644080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644079 mask!2687) lt!644079 lt!644082 mask!2687))))

(assert (=> b!1473900 (= lt!644079 (select (store (arr!47870 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473901 () Bool)

(assert (=> b!1473901 (= e!827042 e!827036)))

(declare-fun res!1001168 () Bool)

(assert (=> b!1473901 (=> (not res!1001168) (not e!827036))))

(assert (=> b!1473901 (= res!1001168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47870 a!2862) j!93) mask!2687) (select (arr!47870 a!2862) j!93) a!2862 mask!2687) lt!644081))))

(assert (=> b!1473901 (= lt!644081 (Intermediate!12110 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473902 () Bool)

(declare-fun res!1001160 () Bool)

(assert (=> b!1473902 (=> (not res!1001160) (not e!827037))))

(declare-datatypes ((List!34371 0))(
  ( (Nil!34368) (Cons!34367 (h!35726 (_ BitVec 64)) (t!49065 List!34371)) )
))
(declare-fun arrayNoDuplicates!0 (array!99173 (_ BitVec 32) List!34371) Bool)

(assert (=> b!1473902 (= res!1001160 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34368))))

(declare-fun b!1473903 () Bool)

(declare-fun res!1001170 () Bool)

(assert (=> b!1473903 (=> (not res!1001170) (not e!827037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99173 (_ BitVec 32)) Bool)

(assert (=> b!1473903 (= res!1001170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473904 () Bool)

(declare-fun res!1001167 () Bool)

(assert (=> b!1473904 (=> (not res!1001167) (not e!827041))))

(assert (=> b!1473904 (= res!1001167 e!827038)))

(declare-fun c!135882 () Bool)

(assert (=> b!1473904 (= c!135882 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473905 () Bool)

(declare-fun res!1001169 () Bool)

(assert (=> b!1473905 (=> (not res!1001169) (not e!827035))))

(assert (=> b!1473905 (= res!1001169 (= (seekEntryOrOpen!0 (select (arr!47870 a!2862) j!93) a!2862 mask!2687) (Found!12110 j!93)))))

(declare-fun b!1473906 () Bool)

(assert (=> b!1473906 (= e!827041 (not e!827039))))

(declare-fun res!1001163 () Bool)

(assert (=> b!1473906 (=> res!1001163 e!827039)))

(assert (=> b!1473906 (= res!1001163 (or (not (= (select (arr!47870 a!2862) index!646) (select (store (arr!47870 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47870 a!2862) index!646) (select (arr!47870 a!2862) j!93)))))))

(assert (=> b!1473906 e!827035))

(declare-fun res!1001157 () Bool)

(assert (=> b!1473906 (=> (not res!1001157) (not e!827035))))

(assert (=> b!1473906 (= res!1001157 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49560 0))(
  ( (Unit!49561) )
))
(declare-fun lt!644078 () Unit!49560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49560)

(assert (=> b!1473906 (= lt!644078 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125896 res!1001159) b!1473895))

(assert (= (and b!1473895 res!1001166) b!1473896))

(assert (= (and b!1473896 res!1001162) b!1473890))

(assert (= (and b!1473890 res!1001158) b!1473903))

(assert (= (and b!1473903 res!1001170) b!1473902))

(assert (= (and b!1473902 res!1001160) b!1473894))

(assert (= (and b!1473894 res!1001165) b!1473891))

(assert (= (and b!1473891 res!1001156) b!1473901))

(assert (= (and b!1473901 res!1001168) b!1473898))

(assert (= (and b!1473898 res!1001164) b!1473900))

(assert (= (and b!1473900 res!1001161) b!1473904))

(assert (= (and b!1473904 c!135882) b!1473892))

(assert (= (and b!1473904 (not c!135882)) b!1473889))

(assert (= (and b!1473904 res!1001167) b!1473899))

(assert (= (and b!1473899 res!1001155) b!1473906))

(assert (= (and b!1473906 res!1001157) b!1473905))

(assert (= (and b!1473905 res!1001169) b!1473893))

(assert (= (and b!1473906 (not res!1001163)) b!1473897))

(declare-fun m!1360381 () Bool)

(assert (=> b!1473892 m!1360381))

(declare-fun m!1360383 () Bool)

(assert (=> b!1473897 m!1360383))

(declare-fun m!1360385 () Bool)

(assert (=> b!1473905 m!1360385))

(assert (=> b!1473905 m!1360385))

(declare-fun m!1360387 () Bool)

(assert (=> b!1473905 m!1360387))

(declare-fun m!1360389 () Bool)

(assert (=> b!1473902 m!1360389))

(declare-fun m!1360391 () Bool)

(assert (=> b!1473903 m!1360391))

(declare-fun m!1360393 () Bool)

(assert (=> start!125896 m!1360393))

(declare-fun m!1360395 () Bool)

(assert (=> start!125896 m!1360395))

(declare-fun m!1360397 () Bool)

(assert (=> b!1473889 m!1360397))

(assert (=> b!1473889 m!1360383))

(assert (=> b!1473901 m!1360385))

(assert (=> b!1473901 m!1360385))

(declare-fun m!1360399 () Bool)

(assert (=> b!1473901 m!1360399))

(assert (=> b!1473901 m!1360399))

(assert (=> b!1473901 m!1360385))

(declare-fun m!1360401 () Bool)

(assert (=> b!1473901 m!1360401))

(assert (=> b!1473898 m!1360385))

(assert (=> b!1473898 m!1360385))

(declare-fun m!1360403 () Bool)

(assert (=> b!1473898 m!1360403))

(declare-fun m!1360405 () Bool)

(assert (=> b!1473893 m!1360405))

(assert (=> b!1473893 m!1360385))

(declare-fun m!1360407 () Bool)

(assert (=> b!1473906 m!1360407))

(declare-fun m!1360409 () Bool)

(assert (=> b!1473906 m!1360409))

(declare-fun m!1360411 () Bool)

(assert (=> b!1473906 m!1360411))

(declare-fun m!1360413 () Bool)

(assert (=> b!1473906 m!1360413))

(declare-fun m!1360415 () Bool)

(assert (=> b!1473906 m!1360415))

(assert (=> b!1473906 m!1360385))

(assert (=> b!1473890 m!1360385))

(assert (=> b!1473890 m!1360385))

(declare-fun m!1360417 () Bool)

(assert (=> b!1473890 m!1360417))

(declare-fun m!1360419 () Bool)

(assert (=> b!1473900 m!1360419))

(assert (=> b!1473900 m!1360419))

(declare-fun m!1360421 () Bool)

(assert (=> b!1473900 m!1360421))

(assert (=> b!1473900 m!1360409))

(declare-fun m!1360423 () Bool)

(assert (=> b!1473900 m!1360423))

(assert (=> b!1473891 m!1360409))

(declare-fun m!1360425 () Bool)

(assert (=> b!1473891 m!1360425))

(declare-fun m!1360427 () Bool)

(assert (=> b!1473896 m!1360427))

(assert (=> b!1473896 m!1360427))

(declare-fun m!1360429 () Bool)

(assert (=> b!1473896 m!1360429))

(push 1)

