; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124840 () Bool)

(assert start!124840)

(declare-fun b!1449848 () Bool)

(declare-fun e!816438 () Bool)

(declare-fun e!816429 () Bool)

(assert (=> b!1449848 (= e!816438 e!816429)))

(declare-fun res!981344 () Bool)

(assert (=> b!1449848 (=> (not res!981344) (not e!816429))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11699 0))(
  ( (MissingZero!11699 (index!49188 (_ BitVec 32))) (Found!11699 (index!49189 (_ BitVec 32))) (Intermediate!11699 (undefined!12511 Bool) (index!49190 (_ BitVec 32)) (x!130847 (_ BitVec 32))) (Undefined!11699) (MissingVacant!11699 (index!49191 (_ BitVec 32))) )
))
(declare-fun lt!635903 () SeekEntryResult!11699)

(declare-datatypes ((array!98266 0))(
  ( (array!98267 (arr!47422 (Array (_ BitVec 32) (_ BitVec 64))) (size!47974 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98266)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98266 (_ BitVec 32)) SeekEntryResult!11699)

(assert (=> b!1449848 (= res!981344 (= lt!635903 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47422 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun e!816433 () Bool)

(declare-fun b!1449849 () Bool)

(declare-fun lt!635900 () (_ BitVec 64))

(declare-fun lt!635907 () array!98266)

(declare-fun lt!635902 () SeekEntryResult!11699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98266 (_ BitVec 32)) SeekEntryResult!11699)

(assert (=> b!1449849 (= e!816433 (= lt!635902 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635900 lt!635907 mask!2687)))))

(declare-fun b!1449850 () Bool)

(declare-fun res!981351 () Bool)

(declare-fun e!816432 () Bool)

(assert (=> b!1449850 (=> (not res!981351) (not e!816432))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449850 (= res!981351 (validKeyInArray!0 (select (arr!47422 a!2862) i!1006)))))

(declare-fun b!1449851 () Bool)

(declare-fun e!816436 () Bool)

(assert (=> b!1449851 (= e!816436 true)))

(declare-fun lt!635906 () SeekEntryResult!11699)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449851 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635900 lt!635907 mask!2687) lt!635906)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!48735 0))(
  ( (Unit!48736) )
))
(declare-fun lt!635905 () Unit!48735)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48735)

(assert (=> b!1449851 (= lt!635905 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449852 () Bool)

(declare-fun e!816434 () Bool)

(assert (=> b!1449852 (= e!816432 e!816434)))

(declare-fun res!981352 () Bool)

(assert (=> b!1449852 (=> (not res!981352) (not e!816434))))

(assert (=> b!1449852 (= res!981352 (= (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449852 (= lt!635907 (array!98267 (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47974 a!2862)))))

(declare-fun b!1449854 () Bool)

(declare-fun res!981358 () Bool)

(assert (=> b!1449854 (=> (not res!981358) (not e!816432))))

(assert (=> b!1449854 (= res!981358 (validKeyInArray!0 (select (arr!47422 a!2862) j!93)))))

(declare-fun b!1449855 () Bool)

(declare-fun res!981359 () Bool)

(assert (=> b!1449855 (=> (not res!981359) (not e!816432))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449855 (= res!981359 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47974 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47974 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47974 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449856 () Bool)

(declare-fun res!981360 () Bool)

(assert (=> b!1449856 (=> (not res!981360) (not e!816432))))

(assert (=> b!1449856 (= res!981360 (and (= (size!47974 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47974 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47974 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449857 () Bool)

(declare-fun res!981346 () Bool)

(declare-fun e!816435 () Bool)

(assert (=> b!1449857 (=> (not res!981346) (not e!816435))))

(declare-fun lt!635901 () SeekEntryResult!11699)

(assert (=> b!1449857 (= res!981346 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47422 a!2862) j!93) a!2862 mask!2687) lt!635901))))

(declare-fun b!1449858 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98266 (_ BitVec 32)) SeekEntryResult!11699)

(assert (=> b!1449858 (= e!816433 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635900 lt!635907 mask!2687) (seekEntryOrOpen!0 lt!635900 lt!635907 mask!2687)))))

(declare-fun b!1449859 () Bool)

(declare-fun res!981357 () Bool)

(declare-fun e!816437 () Bool)

(assert (=> b!1449859 (=> (not res!981357) (not e!816437))))

(assert (=> b!1449859 (= res!981357 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449860 () Bool)

(declare-fun res!981353 () Bool)

(assert (=> b!1449860 (=> (not res!981353) (not e!816437))))

(assert (=> b!1449860 (= res!981353 e!816433)))

(declare-fun c!133765 () Bool)

(assert (=> b!1449860 (= c!133765 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449861 () Bool)

(declare-fun res!981350 () Bool)

(assert (=> b!1449861 (=> (not res!981350) (not e!816432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98266 (_ BitVec 32)) Bool)

(assert (=> b!1449861 (= res!981350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449862 () Bool)

(assert (=> b!1449862 (= e!816435 e!816437)))

(declare-fun res!981355 () Bool)

(assert (=> b!1449862 (=> (not res!981355) (not e!816437))))

(assert (=> b!1449862 (= res!981355 (= lt!635902 (Intermediate!11699 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449862 (= lt!635902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635900 mask!2687) lt!635900 lt!635907 mask!2687))))

(assert (=> b!1449862 (= lt!635900 (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449863 () Bool)

(declare-fun res!981347 () Bool)

(assert (=> b!1449863 (=> res!981347 e!816436)))

(assert (=> b!1449863 (= res!981347 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47422 a!2862) j!93) a!2862 mask!2687) lt!635906)))))

(declare-fun b!1449864 () Bool)

(assert (=> b!1449864 (= e!816437 (not e!816436))))

(declare-fun res!981349 () Bool)

(assert (=> b!1449864 (=> res!981349 e!816436)))

(assert (=> b!1449864 (= res!981349 (or (and (= (select (arr!47422 a!2862) index!646) (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47422 a!2862) index!646) (select (arr!47422 a!2862) j!93))) (not (= (select (arr!47422 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816431 () Bool)

(assert (=> b!1449864 e!816431))

(declare-fun res!981345 () Bool)

(assert (=> b!1449864 (=> (not res!981345) (not e!816431))))

(assert (=> b!1449864 (= res!981345 (and (= lt!635903 lt!635906) (or (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) (select (arr!47422 a!2862) j!93)))))))

(assert (=> b!1449864 (= lt!635906 (Found!11699 j!93))))

(assert (=> b!1449864 (= lt!635903 (seekEntryOrOpen!0 (select (arr!47422 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449864 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!635904 () Unit!48735)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48735)

(assert (=> b!1449864 (= lt!635904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449865 () Bool)

(assert (=> b!1449865 (= e!816429 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449866 () Bool)

(declare-fun res!981356 () Bool)

(assert (=> b!1449866 (=> (not res!981356) (not e!816432))))

(declare-datatypes ((List!34001 0))(
  ( (Nil!33998) (Cons!33997 (h!35347 (_ BitVec 64)) (t!48687 List!34001)) )
))
(declare-fun arrayNoDuplicates!0 (array!98266 (_ BitVec 32) List!34001) Bool)

(assert (=> b!1449866 (= res!981356 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33998))))

(declare-fun b!1449867 () Bool)

(assert (=> b!1449867 (= e!816431 e!816438)))

(declare-fun res!981348 () Bool)

(assert (=> b!1449867 (=> res!981348 e!816438)))

(assert (=> b!1449867 (= res!981348 (or (and (= (select (arr!47422 a!2862) index!646) (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47422 a!2862) index!646) (select (arr!47422 a!2862) j!93))) (not (= (select (arr!47422 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449853 () Bool)

(assert (=> b!1449853 (= e!816434 e!816435)))

(declare-fun res!981361 () Bool)

(assert (=> b!1449853 (=> (not res!981361) (not e!816435))))

(assert (=> b!1449853 (= res!981361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47422 a!2862) j!93) mask!2687) (select (arr!47422 a!2862) j!93) a!2862 mask!2687) lt!635901))))

(assert (=> b!1449853 (= lt!635901 (Intermediate!11699 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!981354 () Bool)

(assert (=> start!124840 (=> (not res!981354) (not e!816432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124840 (= res!981354 (validMask!0 mask!2687))))

(assert (=> start!124840 e!816432))

(assert (=> start!124840 true))

(declare-fun array_inv!36655 (array!98266) Bool)

(assert (=> start!124840 (array_inv!36655 a!2862)))

(assert (= (and start!124840 res!981354) b!1449856))

(assert (= (and b!1449856 res!981360) b!1449850))

(assert (= (and b!1449850 res!981351) b!1449854))

(assert (= (and b!1449854 res!981358) b!1449861))

(assert (= (and b!1449861 res!981350) b!1449866))

(assert (= (and b!1449866 res!981356) b!1449855))

(assert (= (and b!1449855 res!981359) b!1449852))

(assert (= (and b!1449852 res!981352) b!1449853))

(assert (= (and b!1449853 res!981361) b!1449857))

(assert (= (and b!1449857 res!981346) b!1449862))

(assert (= (and b!1449862 res!981355) b!1449860))

(assert (= (and b!1449860 c!133765) b!1449849))

(assert (= (and b!1449860 (not c!133765)) b!1449858))

(assert (= (and b!1449860 res!981353) b!1449859))

(assert (= (and b!1449859 res!981357) b!1449864))

(assert (= (and b!1449864 res!981345) b!1449867))

(assert (= (and b!1449867 (not res!981348)) b!1449848))

(assert (= (and b!1449848 res!981344) b!1449865))

(assert (= (and b!1449864 (not res!981349)) b!1449863))

(assert (= (and b!1449863 (not res!981347)) b!1449851))

(declare-fun m!1338039 () Bool)

(assert (=> b!1449850 m!1338039))

(assert (=> b!1449850 m!1338039))

(declare-fun m!1338041 () Bool)

(assert (=> b!1449850 m!1338041))

(declare-fun m!1338043 () Bool)

(assert (=> b!1449854 m!1338043))

(assert (=> b!1449854 m!1338043))

(declare-fun m!1338045 () Bool)

(assert (=> b!1449854 m!1338045))

(declare-fun m!1338047 () Bool)

(assert (=> b!1449851 m!1338047))

(declare-fun m!1338049 () Bool)

(assert (=> b!1449851 m!1338049))

(declare-fun m!1338051 () Bool)

(assert (=> b!1449862 m!1338051))

(assert (=> b!1449862 m!1338051))

(declare-fun m!1338053 () Bool)

(assert (=> b!1449862 m!1338053))

(declare-fun m!1338055 () Bool)

(assert (=> b!1449862 m!1338055))

(declare-fun m!1338057 () Bool)

(assert (=> b!1449862 m!1338057))

(declare-fun m!1338059 () Bool)

(assert (=> b!1449849 m!1338059))

(assert (=> b!1449853 m!1338043))

(assert (=> b!1449853 m!1338043))

(declare-fun m!1338061 () Bool)

(assert (=> b!1449853 m!1338061))

(assert (=> b!1449853 m!1338061))

(assert (=> b!1449853 m!1338043))

(declare-fun m!1338063 () Bool)

(assert (=> b!1449853 m!1338063))

(assert (=> b!1449858 m!1338047))

(declare-fun m!1338065 () Bool)

(assert (=> b!1449858 m!1338065))

(declare-fun m!1338067 () Bool)

(assert (=> b!1449866 m!1338067))

(declare-fun m!1338069 () Bool)

(assert (=> b!1449864 m!1338069))

(assert (=> b!1449864 m!1338055))

(declare-fun m!1338071 () Bool)

(assert (=> b!1449864 m!1338071))

(declare-fun m!1338073 () Bool)

(assert (=> b!1449864 m!1338073))

(declare-fun m!1338075 () Bool)

(assert (=> b!1449864 m!1338075))

(assert (=> b!1449864 m!1338043))

(declare-fun m!1338077 () Bool)

(assert (=> b!1449864 m!1338077))

(declare-fun m!1338079 () Bool)

(assert (=> b!1449864 m!1338079))

(assert (=> b!1449864 m!1338043))

(assert (=> b!1449848 m!1338043))

(assert (=> b!1449848 m!1338043))

(declare-fun m!1338081 () Bool)

(assert (=> b!1449848 m!1338081))

(assert (=> b!1449857 m!1338043))

(assert (=> b!1449857 m!1338043))

(declare-fun m!1338083 () Bool)

(assert (=> b!1449857 m!1338083))

(declare-fun m!1338085 () Bool)

(assert (=> b!1449861 m!1338085))

(assert (=> b!1449867 m!1338075))

(assert (=> b!1449867 m!1338055))

(assert (=> b!1449867 m!1338073))

(assert (=> b!1449867 m!1338043))

(declare-fun m!1338087 () Bool)

(assert (=> start!124840 m!1338087))

(declare-fun m!1338089 () Bool)

(assert (=> start!124840 m!1338089))

(assert (=> b!1449852 m!1338055))

(declare-fun m!1338091 () Bool)

(assert (=> b!1449852 m!1338091))

(assert (=> b!1449863 m!1338043))

(assert (=> b!1449863 m!1338043))

(declare-fun m!1338093 () Bool)

(assert (=> b!1449863 m!1338093))

(check-sat (not b!1449857) (not b!1449851) (not b!1449854) (not b!1449850) (not b!1449863) (not b!1449862) (not b!1449864) (not start!124840) (not b!1449866) (not b!1449858) (not b!1449853) (not b!1449849) (not b!1449848) (not b!1449861))
(check-sat)
