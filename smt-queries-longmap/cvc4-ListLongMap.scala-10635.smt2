; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124952 () Bool)

(assert start!124952)

(declare-fun b!1452308 () Bool)

(declare-fun res!983450 () Bool)

(declare-fun e!817580 () Bool)

(assert (=> b!1452308 (=> (not res!983450) (not e!817580))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98400 0))(
  ( (array!98401 (arr!47488 (Array (_ BitVec 32) (_ BitVec 64))) (size!48038 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98400)

(assert (=> b!1452308 (= res!983450 (and (= (size!48038 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48038 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48038 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452309 () Bool)

(declare-fun res!983449 () Bool)

(declare-fun e!817586 () Bool)

(assert (=> b!1452309 (=> (not res!983449) (not e!817586))))

(declare-fun e!817582 () Bool)

(assert (=> b!1452309 (= res!983449 e!817582)))

(declare-fun c!133944 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452309 (= c!133944 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1452310 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!817581 () Bool)

(assert (=> b!1452310 (= e!817581 (and (or (= (select (arr!47488 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47488 a!2862) intermediateBeforeIndex!19) (select (arr!47488 a!2862) j!93))) (or (and (= (select (arr!47488 a!2862) index!646) (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47488 a!2862) index!646) (select (arr!47488 a!2862) j!93))) (= (select (arr!47488 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!636907 () array!98400)

(declare-fun b!1452311 () Bool)

(declare-fun lt!636905 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11740 0))(
  ( (MissingZero!11740 (index!49352 (_ BitVec 32))) (Found!11740 (index!49353 (_ BitVec 32))) (Intermediate!11740 (undefined!12552 Bool) (index!49354 (_ BitVec 32)) (x!130997 (_ BitVec 32))) (Undefined!11740) (MissingVacant!11740 (index!49355 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98400 (_ BitVec 32)) SeekEntryResult!11740)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98400 (_ BitVec 32)) SeekEntryResult!11740)

(assert (=> b!1452311 (= e!817582 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636905 lt!636907 mask!2687) (seekEntryOrOpen!0 lt!636905 lt!636907 mask!2687)))))

(declare-fun b!1452312 () Bool)

(declare-fun res!983452 () Bool)

(assert (=> b!1452312 (=> (not res!983452) (not e!817580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452312 (= res!983452 (validKeyInArray!0 (select (arr!47488 a!2862) i!1006)))))

(declare-fun b!1452313 () Bool)

(declare-fun e!817583 () Bool)

(assert (=> b!1452313 (= e!817580 e!817583)))

(declare-fun res!983455 () Bool)

(assert (=> b!1452313 (=> (not res!983455) (not e!817583))))

(assert (=> b!1452313 (= res!983455 (= (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452313 (= lt!636907 (array!98401 (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48038 a!2862)))))

(declare-fun b!1452314 () Bool)

(declare-fun res!983448 () Bool)

(assert (=> b!1452314 (=> (not res!983448) (not e!817580))))

(assert (=> b!1452314 (= res!983448 (validKeyInArray!0 (select (arr!47488 a!2862) j!93)))))

(declare-fun b!1452315 () Bool)

(declare-fun lt!636909 () SeekEntryResult!11740)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98400 (_ BitVec 32)) SeekEntryResult!11740)

(assert (=> b!1452315 (= e!817582 (= lt!636909 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636905 lt!636907 mask!2687)))))

(declare-fun b!1452316 () Bool)

(declare-fun res!983441 () Bool)

(assert (=> b!1452316 (=> (not res!983441) (not e!817580))))

(declare-datatypes ((List!33989 0))(
  ( (Nil!33986) (Cons!33985 (h!35335 (_ BitVec 64)) (t!48683 List!33989)) )
))
(declare-fun arrayNoDuplicates!0 (array!98400 (_ BitVec 32) List!33989) Bool)

(assert (=> b!1452316 (= res!983441 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33986))))

(declare-fun res!983446 () Bool)

(assert (=> start!124952 (=> (not res!983446) (not e!817580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124952 (= res!983446 (validMask!0 mask!2687))))

(assert (=> start!124952 e!817580))

(assert (=> start!124952 true))

(declare-fun array_inv!36516 (array!98400) Bool)

(assert (=> start!124952 (array_inv!36516 a!2862)))

(declare-fun b!1452317 () Bool)

(declare-fun e!817585 () Bool)

(assert (=> b!1452317 (= e!817585 e!817586)))

(declare-fun res!983453 () Bool)

(assert (=> b!1452317 (=> (not res!983453) (not e!817586))))

(assert (=> b!1452317 (= res!983453 (= lt!636909 (Intermediate!11740 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452317 (= lt!636909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636905 mask!2687) lt!636905 lt!636907 mask!2687))))

(assert (=> b!1452317 (= lt!636905 (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452318 () Bool)

(assert (=> b!1452318 (= e!817583 e!817585)))

(declare-fun res!983443 () Bool)

(assert (=> b!1452318 (=> (not res!983443) (not e!817585))))

(declare-fun lt!636908 () SeekEntryResult!11740)

(assert (=> b!1452318 (= res!983443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47488 a!2862) j!93) mask!2687) (select (arr!47488 a!2862) j!93) a!2862 mask!2687) lt!636908))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452318 (= lt!636908 (Intermediate!11740 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452319 () Bool)

(declare-fun res!983444 () Bool)

(assert (=> b!1452319 (=> (not res!983444) (not e!817580))))

(assert (=> b!1452319 (= res!983444 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48038 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48038 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48038 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452320 () Bool)

(assert (=> b!1452320 (= e!817586 (not (or (and (= (select (arr!47488 a!2862) index!646) (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47488 a!2862) index!646) (select (arr!47488 a!2862) j!93))) (= (select (arr!47488 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1452320 e!817581))

(declare-fun res!983442 () Bool)

(assert (=> b!1452320 (=> (not res!983442) (not e!817581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98400 (_ BitVec 32)) Bool)

(assert (=> b!1452320 (= res!983442 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48976 0))(
  ( (Unit!48977) )
))
(declare-fun lt!636906 () Unit!48976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48976)

(assert (=> b!1452320 (= lt!636906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452321 () Bool)

(declare-fun res!983451 () Bool)

(assert (=> b!1452321 (=> (not res!983451) (not e!817580))))

(assert (=> b!1452321 (= res!983451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452322 () Bool)

(declare-fun res!983447 () Bool)

(assert (=> b!1452322 (=> (not res!983447) (not e!817585))))

(assert (=> b!1452322 (= res!983447 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47488 a!2862) j!93) a!2862 mask!2687) lt!636908))))

(declare-fun b!1452323 () Bool)

(declare-fun res!983445 () Bool)

(assert (=> b!1452323 (=> (not res!983445) (not e!817586))))

(assert (=> b!1452323 (= res!983445 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452324 () Bool)

(declare-fun res!983454 () Bool)

(assert (=> b!1452324 (=> (not res!983454) (not e!817581))))

(assert (=> b!1452324 (= res!983454 (= (seekEntryOrOpen!0 (select (arr!47488 a!2862) j!93) a!2862 mask!2687) (Found!11740 j!93)))))

(assert (= (and start!124952 res!983446) b!1452308))

(assert (= (and b!1452308 res!983450) b!1452312))

(assert (= (and b!1452312 res!983452) b!1452314))

(assert (= (and b!1452314 res!983448) b!1452321))

(assert (= (and b!1452321 res!983451) b!1452316))

(assert (= (and b!1452316 res!983441) b!1452319))

(assert (= (and b!1452319 res!983444) b!1452313))

(assert (= (and b!1452313 res!983455) b!1452318))

(assert (= (and b!1452318 res!983443) b!1452322))

(assert (= (and b!1452322 res!983447) b!1452317))

(assert (= (and b!1452317 res!983453) b!1452309))

(assert (= (and b!1452309 c!133944) b!1452315))

(assert (= (and b!1452309 (not c!133944)) b!1452311))

(assert (= (and b!1452309 res!983449) b!1452323))

(assert (= (and b!1452323 res!983445) b!1452320))

(assert (= (and b!1452320 res!983442) b!1452324))

(assert (= (and b!1452324 res!983454) b!1452310))

(declare-fun m!1340885 () Bool)

(assert (=> b!1452322 m!1340885))

(assert (=> b!1452322 m!1340885))

(declare-fun m!1340887 () Bool)

(assert (=> b!1452322 m!1340887))

(assert (=> b!1452324 m!1340885))

(assert (=> b!1452324 m!1340885))

(declare-fun m!1340889 () Bool)

(assert (=> b!1452324 m!1340889))

(declare-fun m!1340891 () Bool)

(assert (=> b!1452316 m!1340891))

(assert (=> b!1452318 m!1340885))

(assert (=> b!1452318 m!1340885))

(declare-fun m!1340893 () Bool)

(assert (=> b!1452318 m!1340893))

(assert (=> b!1452318 m!1340893))

(assert (=> b!1452318 m!1340885))

(declare-fun m!1340895 () Bool)

(assert (=> b!1452318 m!1340895))

(declare-fun m!1340897 () Bool)

(assert (=> b!1452311 m!1340897))

(declare-fun m!1340899 () Bool)

(assert (=> b!1452311 m!1340899))

(declare-fun m!1340901 () Bool)

(assert (=> b!1452312 m!1340901))

(assert (=> b!1452312 m!1340901))

(declare-fun m!1340903 () Bool)

(assert (=> b!1452312 m!1340903))

(declare-fun m!1340905 () Bool)

(assert (=> b!1452313 m!1340905))

(declare-fun m!1340907 () Bool)

(assert (=> b!1452313 m!1340907))

(declare-fun m!1340909 () Bool)

(assert (=> start!124952 m!1340909))

(declare-fun m!1340911 () Bool)

(assert (=> start!124952 m!1340911))

(declare-fun m!1340913 () Bool)

(assert (=> b!1452315 m!1340913))

(declare-fun m!1340915 () Bool)

(assert (=> b!1452317 m!1340915))

(assert (=> b!1452317 m!1340915))

(declare-fun m!1340917 () Bool)

(assert (=> b!1452317 m!1340917))

(assert (=> b!1452317 m!1340905))

(declare-fun m!1340919 () Bool)

(assert (=> b!1452317 m!1340919))

(declare-fun m!1340921 () Bool)

(assert (=> b!1452320 m!1340921))

(assert (=> b!1452320 m!1340905))

(declare-fun m!1340923 () Bool)

(assert (=> b!1452320 m!1340923))

(declare-fun m!1340925 () Bool)

(assert (=> b!1452320 m!1340925))

(declare-fun m!1340927 () Bool)

(assert (=> b!1452320 m!1340927))

(assert (=> b!1452320 m!1340885))

(assert (=> b!1452314 m!1340885))

(assert (=> b!1452314 m!1340885))

(declare-fun m!1340929 () Bool)

(assert (=> b!1452314 m!1340929))

(assert (=> b!1452310 m!1340905))

(declare-fun m!1340931 () Bool)

(assert (=> b!1452310 m!1340931))

(assert (=> b!1452310 m!1340923))

(assert (=> b!1452310 m!1340925))

(assert (=> b!1452310 m!1340885))

(declare-fun m!1340933 () Bool)

(assert (=> b!1452321 m!1340933))

(push 1)

(assert (not b!1452312))

(assert (not b!1452322))

(assert (not b!1452315))

(assert (not start!124952))

(assert (not b!1452314))

(assert (not b!1452317))

(assert (not b!1452324))

(assert (not b!1452316))

(assert (not b!1452321))

(assert (not b!1452311))

(assert (not b!1452318))

(assert (not b!1452320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

