; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126620 () Bool)

(assert start!126620)

(declare-fun b!1486830 () Bool)

(declare-fun e!833416 () Bool)

(declare-fun e!833414 () Bool)

(assert (=> b!1486830 (= e!833416 e!833414)))

(declare-fun res!1011340 () Bool)

(assert (=> b!1486830 (=> res!1011340 e!833414)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!648422 () (_ BitVec 32))

(declare-datatypes ((array!99517 0))(
  ( (array!99518 (arr!48034 (Array (_ BitVec 32) (_ BitVec 64))) (size!48586 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99517)

(assert (=> b!1486830 (= res!1011340 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648422 #b00000000000000000000000000000000) (bvsge lt!648422 (size!48586 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486830 (= lt!648422 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486831 () Bool)

(declare-fun res!1011346 () Bool)

(declare-fun e!833413 () Bool)

(assert (=> b!1486831 (=> (not res!1011346) (not e!833413))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486831 (= res!1011346 (and (= (size!48586 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48586 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48586 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486832 () Bool)

(declare-fun res!1011337 () Bool)

(declare-fun e!833407 () Bool)

(assert (=> b!1486832 (=> (not res!1011337) (not e!833407))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1486832 (= res!1011337 (or (= (select (arr!48034 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48034 a!2862) intermediateBeforeIndex!19) (select (arr!48034 a!2862) j!93))))))

(declare-fun b!1486833 () Bool)

(declare-fun e!833411 () Bool)

(assert (=> b!1486833 (= e!833411 (not e!833416))))

(declare-fun res!1011351 () Bool)

(assert (=> b!1486833 (=> res!1011351 e!833416)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486833 (= res!1011351 (or (and (= (select (arr!48034 a!2862) index!646) (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48034 a!2862) index!646) (select (arr!48034 a!2862) j!93))) (= (select (arr!48034 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486833 e!833407))

(declare-fun res!1011352 () Bool)

(assert (=> b!1486833 (=> (not res!1011352) (not e!833407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99517 (_ BitVec 32)) Bool)

(assert (=> b!1486833 (= res!1011352 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49779 0))(
  ( (Unit!49780) )
))
(declare-fun lt!648417 () Unit!49779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49779)

(assert (=> b!1486833 (= lt!648417 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486834 () Bool)

(declare-fun res!1011345 () Bool)

(assert (=> b!1486834 (=> (not res!1011345) (not e!833413))))

(declare-datatypes ((List!34613 0))(
  ( (Nil!34610) (Cons!34609 (h!35986 (_ BitVec 64)) (t!49299 List!34613)) )
))
(declare-fun arrayNoDuplicates!0 (array!99517 (_ BitVec 32) List!34613) Bool)

(assert (=> b!1486834 (= res!1011345 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34610))))

(declare-fun res!1011335 () Bool)

(assert (=> start!126620 (=> (not res!1011335) (not e!833413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126620 (= res!1011335 (validMask!0 mask!2687))))

(assert (=> start!126620 e!833413))

(assert (=> start!126620 true))

(declare-fun array_inv!37267 (array!99517) Bool)

(assert (=> start!126620 (array_inv!37267 a!2862)))

(declare-fun b!1486835 () Bool)

(declare-fun res!1011334 () Bool)

(assert (=> b!1486835 (=> (not res!1011334) (not e!833413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486835 (= res!1011334 (validKeyInArray!0 (select (arr!48034 a!2862) j!93)))))

(declare-fun b!1486836 () Bool)

(declare-fun e!833412 () Bool)

(declare-fun e!833410 () Bool)

(assert (=> b!1486836 (= e!833412 e!833410)))

(declare-fun res!1011343 () Bool)

(assert (=> b!1486836 (=> (not res!1011343) (not e!833410))))

(declare-datatypes ((SeekEntryResult!12299 0))(
  ( (MissingZero!12299 (index!51588 (_ BitVec 32))) (Found!12299 (index!51589 (_ BitVec 32))) (Intermediate!12299 (undefined!13111 Bool) (index!51590 (_ BitVec 32)) (x!133164 (_ BitVec 32))) (Undefined!12299) (MissingVacant!12299 (index!51591 (_ BitVec 32))) )
))
(declare-fun lt!648421 () SeekEntryResult!12299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99517 (_ BitVec 32)) SeekEntryResult!12299)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486836 (= res!1011343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648421))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486836 (= lt!648421 (Intermediate!12299 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486837 () Bool)

(assert (=> b!1486837 (= e!833414 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648422 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648421))))

(declare-fun b!1486838 () Bool)

(declare-fun e!833409 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!648416 () (_ BitVec 64))

(declare-fun lt!648418 () array!99517)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99517 (_ BitVec 32)) SeekEntryResult!12299)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99517 (_ BitVec 32)) SeekEntryResult!12299)

(assert (=> b!1486838 (= e!833409 (= (seekEntryOrOpen!0 lt!648416 lt!648418 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648416 lt!648418 mask!2687)))))

(declare-fun b!1486839 () Bool)

(declare-fun e!833417 () Bool)

(assert (=> b!1486839 (= e!833417 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648416 lt!648418 mask!2687) (seekEntryOrOpen!0 lt!648416 lt!648418 mask!2687)))))

(declare-fun b!1486840 () Bool)

(declare-fun res!1011339 () Bool)

(assert (=> b!1486840 (=> (not res!1011339) (not e!833413))))

(assert (=> b!1486840 (= res!1011339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486841 () Bool)

(declare-fun res!1011336 () Bool)

(assert (=> b!1486841 (=> (not res!1011336) (not e!833413))))

(assert (=> b!1486841 (= res!1011336 (validKeyInArray!0 (select (arr!48034 a!2862) i!1006)))))

(declare-fun b!1486842 () Bool)

(declare-fun res!1011338 () Bool)

(assert (=> b!1486842 (=> (not res!1011338) (not e!833413))))

(assert (=> b!1486842 (= res!1011338 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48586 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48586 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48586 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486843 () Bool)

(declare-fun e!833408 () Bool)

(assert (=> b!1486843 (= e!833408 e!833409)))

(declare-fun res!1011342 () Bool)

(assert (=> b!1486843 (=> (not res!1011342) (not e!833409))))

(declare-fun lt!648419 () (_ BitVec 64))

(assert (=> b!1486843 (= res!1011342 (and (= index!646 intermediateAfterIndex!19) (= lt!648419 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486844 () Bool)

(assert (=> b!1486844 (= e!833407 e!833408)))

(declare-fun res!1011348 () Bool)

(assert (=> b!1486844 (=> res!1011348 e!833408)))

(assert (=> b!1486844 (= res!1011348 (or (and (= (select (arr!48034 a!2862) index!646) lt!648419) (= (select (arr!48034 a!2862) index!646) (select (arr!48034 a!2862) j!93))) (= (select (arr!48034 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486844 (= lt!648419 (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486845 () Bool)

(declare-fun res!1011349 () Bool)

(assert (=> b!1486845 (=> (not res!1011349) (not e!833411))))

(assert (=> b!1486845 (= res!1011349 e!833417)))

(declare-fun c!137275 () Bool)

(assert (=> b!1486845 (= c!137275 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486846 () Bool)

(declare-fun res!1011341 () Bool)

(assert (=> b!1486846 (=> (not res!1011341) (not e!833407))))

(assert (=> b!1486846 (= res!1011341 (= (seekEntryOrOpen!0 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) (Found!12299 j!93)))))

(declare-fun b!1486847 () Bool)

(declare-fun res!1011344 () Bool)

(assert (=> b!1486847 (=> (not res!1011344) (not e!833410))))

(assert (=> b!1486847 (= res!1011344 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648421))))

(declare-fun b!1486848 () Bool)

(declare-fun res!1011333 () Bool)

(assert (=> b!1486848 (=> (not res!1011333) (not e!833411))))

(assert (=> b!1486848 (= res!1011333 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!648420 () SeekEntryResult!12299)

(declare-fun b!1486849 () Bool)

(assert (=> b!1486849 (= e!833417 (= lt!648420 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648416 lt!648418 mask!2687)))))

(declare-fun b!1486850 () Bool)

(assert (=> b!1486850 (= e!833410 e!833411)))

(declare-fun res!1011347 () Bool)

(assert (=> b!1486850 (=> (not res!1011347) (not e!833411))))

(assert (=> b!1486850 (= res!1011347 (= lt!648420 (Intermediate!12299 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486850 (= lt!648420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648416 mask!2687) lt!648416 lt!648418 mask!2687))))

(assert (=> b!1486850 (= lt!648416 (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486851 () Bool)

(assert (=> b!1486851 (= e!833413 e!833412)))

(declare-fun res!1011350 () Bool)

(assert (=> b!1486851 (=> (not res!1011350) (not e!833412))))

(assert (=> b!1486851 (= res!1011350 (= (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486851 (= lt!648418 (array!99518 (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48586 a!2862)))))

(assert (= (and start!126620 res!1011335) b!1486831))

(assert (= (and b!1486831 res!1011346) b!1486841))

(assert (= (and b!1486841 res!1011336) b!1486835))

(assert (= (and b!1486835 res!1011334) b!1486840))

(assert (= (and b!1486840 res!1011339) b!1486834))

(assert (= (and b!1486834 res!1011345) b!1486842))

(assert (= (and b!1486842 res!1011338) b!1486851))

(assert (= (and b!1486851 res!1011350) b!1486836))

(assert (= (and b!1486836 res!1011343) b!1486847))

(assert (= (and b!1486847 res!1011344) b!1486850))

(assert (= (and b!1486850 res!1011347) b!1486845))

(assert (= (and b!1486845 c!137275) b!1486849))

(assert (= (and b!1486845 (not c!137275)) b!1486839))

(assert (= (and b!1486845 res!1011349) b!1486848))

(assert (= (and b!1486848 res!1011333) b!1486833))

(assert (= (and b!1486833 res!1011352) b!1486846))

(assert (= (and b!1486846 res!1011341) b!1486832))

(assert (= (and b!1486832 res!1011337) b!1486844))

(assert (= (and b!1486844 (not res!1011348)) b!1486843))

(assert (= (and b!1486843 res!1011342) b!1486838))

(assert (= (and b!1486833 (not res!1011351)) b!1486830))

(assert (= (and b!1486830 (not res!1011340)) b!1486837))

(declare-fun m!1371039 () Bool)

(assert (=> b!1486841 m!1371039))

(assert (=> b!1486841 m!1371039))

(declare-fun m!1371041 () Bool)

(assert (=> b!1486841 m!1371041))

(declare-fun m!1371043 () Bool)

(assert (=> b!1486851 m!1371043))

(declare-fun m!1371045 () Bool)

(assert (=> b!1486851 m!1371045))

(declare-fun m!1371047 () Bool)

(assert (=> b!1486850 m!1371047))

(assert (=> b!1486850 m!1371047))

(declare-fun m!1371049 () Bool)

(assert (=> b!1486850 m!1371049))

(assert (=> b!1486850 m!1371043))

(declare-fun m!1371051 () Bool)

(assert (=> b!1486850 m!1371051))

(declare-fun m!1371053 () Bool)

(assert (=> b!1486830 m!1371053))

(declare-fun m!1371055 () Bool)

(assert (=> b!1486838 m!1371055))

(declare-fun m!1371057 () Bool)

(assert (=> b!1486838 m!1371057))

(declare-fun m!1371059 () Bool)

(assert (=> b!1486847 m!1371059))

(assert (=> b!1486847 m!1371059))

(declare-fun m!1371061 () Bool)

(assert (=> b!1486847 m!1371061))

(declare-fun m!1371063 () Bool)

(assert (=> b!1486844 m!1371063))

(assert (=> b!1486844 m!1371059))

(assert (=> b!1486844 m!1371043))

(declare-fun m!1371065 () Bool)

(assert (=> b!1486844 m!1371065))

(assert (=> b!1486839 m!1371057))

(assert (=> b!1486839 m!1371055))

(declare-fun m!1371067 () Bool)

(assert (=> b!1486834 m!1371067))

(assert (=> b!1486837 m!1371059))

(assert (=> b!1486837 m!1371059))

(declare-fun m!1371069 () Bool)

(assert (=> b!1486837 m!1371069))

(declare-fun m!1371071 () Bool)

(assert (=> b!1486833 m!1371071))

(assert (=> b!1486833 m!1371043))

(assert (=> b!1486833 m!1371065))

(assert (=> b!1486833 m!1371063))

(declare-fun m!1371073 () Bool)

(assert (=> b!1486833 m!1371073))

(assert (=> b!1486833 m!1371059))

(declare-fun m!1371075 () Bool)

(assert (=> b!1486840 m!1371075))

(assert (=> b!1486846 m!1371059))

(assert (=> b!1486846 m!1371059))

(declare-fun m!1371077 () Bool)

(assert (=> b!1486846 m!1371077))

(declare-fun m!1371079 () Bool)

(assert (=> b!1486849 m!1371079))

(declare-fun m!1371081 () Bool)

(assert (=> start!126620 m!1371081))

(declare-fun m!1371083 () Bool)

(assert (=> start!126620 m!1371083))

(assert (=> b!1486836 m!1371059))

(assert (=> b!1486836 m!1371059))

(declare-fun m!1371085 () Bool)

(assert (=> b!1486836 m!1371085))

(assert (=> b!1486836 m!1371085))

(assert (=> b!1486836 m!1371059))

(declare-fun m!1371087 () Bool)

(assert (=> b!1486836 m!1371087))

(assert (=> b!1486835 m!1371059))

(assert (=> b!1486835 m!1371059))

(declare-fun m!1371089 () Bool)

(assert (=> b!1486835 m!1371089))

(declare-fun m!1371091 () Bool)

(assert (=> b!1486832 m!1371091))

(assert (=> b!1486832 m!1371059))

(check-sat (not b!1486834) (not b!1486838) (not b!1486837) (not start!126620) (not b!1486840) (not b!1486850) (not b!1486846) (not b!1486830) (not b!1486839) (not b!1486849) (not b!1486833) (not b!1486835) (not b!1486841) (not b!1486847) (not b!1486836))
(check-sat)
(get-model)

(declare-fun d!156275 () Bool)

(declare-fun res!1011477 () Bool)

(declare-fun e!833490 () Bool)

(assert (=> d!156275 (=> res!1011477 e!833490)))

(assert (=> d!156275 (= res!1011477 (bvsge j!93 (size!48586 a!2862)))))

(assert (=> d!156275 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!833490)))

(declare-fun b!1486992 () Bool)

(declare-fun e!833492 () Bool)

(assert (=> b!1486992 (= e!833490 e!833492)))

(declare-fun c!137284 () Bool)

(assert (=> b!1486992 (= c!137284 (validKeyInArray!0 (select (arr!48034 a!2862) j!93)))))

(declare-fun b!1486993 () Bool)

(declare-fun e!833491 () Bool)

(declare-fun call!67862 () Bool)

(assert (=> b!1486993 (= e!833491 call!67862)))

(declare-fun b!1486994 () Bool)

(assert (=> b!1486994 (= e!833492 e!833491)))

(declare-fun lt!648471 () (_ BitVec 64))

(assert (=> b!1486994 (= lt!648471 (select (arr!48034 a!2862) j!93))))

(declare-fun lt!648472 () Unit!49779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99517 (_ BitVec 64) (_ BitVec 32)) Unit!49779)

(assert (=> b!1486994 (= lt!648472 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648471 j!93))))

(declare-fun arrayContainsKey!0 (array!99517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1486994 (arrayContainsKey!0 a!2862 lt!648471 #b00000000000000000000000000000000)))

(declare-fun lt!648473 () Unit!49779)

(assert (=> b!1486994 (= lt!648473 lt!648472)))

(declare-fun res!1011478 () Bool)

(assert (=> b!1486994 (= res!1011478 (= (seekEntryOrOpen!0 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) (Found!12299 j!93)))))

(assert (=> b!1486994 (=> (not res!1011478) (not e!833491))))

(declare-fun b!1486995 () Bool)

(assert (=> b!1486995 (= e!833492 call!67862)))

(declare-fun bm!67859 () Bool)

(assert (=> bm!67859 (= call!67862 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156275 (not res!1011477)) b!1486992))

(assert (= (and b!1486992 c!137284) b!1486994))

(assert (= (and b!1486992 (not c!137284)) b!1486995))

(assert (= (and b!1486994 res!1011478) b!1486993))

(assert (= (or b!1486993 b!1486995) bm!67859))

(assert (=> b!1486992 m!1371059))

(assert (=> b!1486992 m!1371059))

(assert (=> b!1486992 m!1371089))

(assert (=> b!1486994 m!1371059))

(declare-fun m!1371201 () Bool)

(assert (=> b!1486994 m!1371201))

(declare-fun m!1371203 () Bool)

(assert (=> b!1486994 m!1371203))

(assert (=> b!1486994 m!1371059))

(assert (=> b!1486994 m!1371077))

(declare-fun m!1371205 () Bool)

(assert (=> bm!67859 m!1371205))

(assert (=> b!1486833 d!156275))

(declare-fun d!156277 () Bool)

(assert (=> d!156277 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648476 () Unit!49779)

(declare-fun choose!38 (array!99517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49779)

(assert (=> d!156277 (= lt!648476 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156277 (validMask!0 mask!2687)))

(assert (=> d!156277 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648476)))

(declare-fun bs!42736 () Bool)

(assert (= bs!42736 d!156277))

(assert (=> bs!42736 m!1371073))

(declare-fun m!1371207 () Bool)

(assert (=> bs!42736 m!1371207))

(assert (=> bs!42736 m!1371081))

(assert (=> b!1486833 d!156277))

(declare-fun d!156279 () Bool)

(declare-fun res!1011479 () Bool)

(declare-fun e!833493 () Bool)

(assert (=> d!156279 (=> res!1011479 e!833493)))

(assert (=> d!156279 (= res!1011479 (bvsge #b00000000000000000000000000000000 (size!48586 a!2862)))))

(assert (=> d!156279 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!833493)))

(declare-fun b!1486996 () Bool)

(declare-fun e!833495 () Bool)

(assert (=> b!1486996 (= e!833493 e!833495)))

(declare-fun c!137285 () Bool)

(assert (=> b!1486996 (= c!137285 (validKeyInArray!0 (select (arr!48034 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1486997 () Bool)

(declare-fun e!833494 () Bool)

(declare-fun call!67863 () Bool)

(assert (=> b!1486997 (= e!833494 call!67863)))

(declare-fun b!1486998 () Bool)

(assert (=> b!1486998 (= e!833495 e!833494)))

(declare-fun lt!648477 () (_ BitVec 64))

(assert (=> b!1486998 (= lt!648477 (select (arr!48034 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648478 () Unit!49779)

(assert (=> b!1486998 (= lt!648478 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648477 #b00000000000000000000000000000000))))

(assert (=> b!1486998 (arrayContainsKey!0 a!2862 lt!648477 #b00000000000000000000000000000000)))

(declare-fun lt!648479 () Unit!49779)

(assert (=> b!1486998 (= lt!648479 lt!648478)))

(declare-fun res!1011480 () Bool)

(assert (=> b!1486998 (= res!1011480 (= (seekEntryOrOpen!0 (select (arr!48034 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12299 #b00000000000000000000000000000000)))))

(assert (=> b!1486998 (=> (not res!1011480) (not e!833494))))

(declare-fun b!1486999 () Bool)

(assert (=> b!1486999 (= e!833495 call!67863)))

(declare-fun bm!67860 () Bool)

(assert (=> bm!67860 (= call!67863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156279 (not res!1011479)) b!1486996))

(assert (= (and b!1486996 c!137285) b!1486998))

(assert (= (and b!1486996 (not c!137285)) b!1486999))

(assert (= (and b!1486998 res!1011480) b!1486997))

(assert (= (or b!1486997 b!1486999) bm!67860))

(declare-fun m!1371209 () Bool)

(assert (=> b!1486996 m!1371209))

(assert (=> b!1486996 m!1371209))

(declare-fun m!1371211 () Bool)

(assert (=> b!1486996 m!1371211))

(assert (=> b!1486998 m!1371209))

(declare-fun m!1371213 () Bool)

(assert (=> b!1486998 m!1371213))

(declare-fun m!1371215 () Bool)

(assert (=> b!1486998 m!1371215))

(assert (=> b!1486998 m!1371209))

(declare-fun m!1371217 () Bool)

(assert (=> b!1486998 m!1371217))

(declare-fun m!1371219 () Bool)

(assert (=> bm!67860 m!1371219))

(assert (=> b!1486840 d!156279))

(declare-fun b!1487018 () Bool)

(declare-fun e!833509 () Bool)

(declare-fun lt!648484 () SeekEntryResult!12299)

(assert (=> b!1487018 (= e!833509 (bvsge (x!133164 lt!648484) #b01111111111111111111111111111110))))

(declare-fun b!1487019 () Bool)

(assert (=> b!1487019 (and (bvsge (index!51590 lt!648484) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648484) (size!48586 lt!648418)))))

(declare-fun res!1011488 () Bool)

(assert (=> b!1487019 (= res!1011488 (= (select (arr!48034 lt!648418) (index!51590 lt!648484)) lt!648416))))

(declare-fun e!833510 () Bool)

(assert (=> b!1487019 (=> res!1011488 e!833510)))

(declare-fun e!833508 () Bool)

(assert (=> b!1487019 (= e!833508 e!833510)))

(declare-fun b!1487020 () Bool)

(assert (=> b!1487020 (and (bvsge (index!51590 lt!648484) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648484) (size!48586 lt!648418)))))

(declare-fun res!1011487 () Bool)

(assert (=> b!1487020 (= res!1011487 (= (select (arr!48034 lt!648418) (index!51590 lt!648484)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487020 (=> res!1011487 e!833510)))

(declare-fun d!156281 () Bool)

(assert (=> d!156281 e!833509))

(declare-fun c!137294 () Bool)

(get-info :version)

(assert (=> d!156281 (= c!137294 (and ((_ is Intermediate!12299) lt!648484) (undefined!13111 lt!648484)))))

(declare-fun e!833507 () SeekEntryResult!12299)

(assert (=> d!156281 (= lt!648484 e!833507)))

(declare-fun c!137293 () Bool)

(assert (=> d!156281 (= c!137293 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648485 () (_ BitVec 64))

(assert (=> d!156281 (= lt!648485 (select (arr!48034 lt!648418) (toIndex!0 lt!648416 mask!2687)))))

(assert (=> d!156281 (validMask!0 mask!2687)))

(assert (=> d!156281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648416 mask!2687) lt!648416 lt!648418 mask!2687) lt!648484)))

(declare-fun b!1487021 () Bool)

(assert (=> b!1487021 (and (bvsge (index!51590 lt!648484) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648484) (size!48586 lt!648418)))))

(assert (=> b!1487021 (= e!833510 (= (select (arr!48034 lt!648418) (index!51590 lt!648484)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487022 () Bool)

(declare-fun e!833506 () SeekEntryResult!12299)

(assert (=> b!1487022 (= e!833506 (Intermediate!12299 false (toIndex!0 lt!648416 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487023 () Bool)

(assert (=> b!1487023 (= e!833509 e!833508)))

(declare-fun res!1011489 () Bool)

(assert (=> b!1487023 (= res!1011489 (and ((_ is Intermediate!12299) lt!648484) (not (undefined!13111 lt!648484)) (bvslt (x!133164 lt!648484) #b01111111111111111111111111111110) (bvsge (x!133164 lt!648484) #b00000000000000000000000000000000) (bvsge (x!133164 lt!648484) #b00000000000000000000000000000000)))))

(assert (=> b!1487023 (=> (not res!1011489) (not e!833508))))

(declare-fun b!1487024 () Bool)

(assert (=> b!1487024 (= e!833507 (Intermediate!12299 true (toIndex!0 lt!648416 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487025 () Bool)

(assert (=> b!1487025 (= e!833506 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648416 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648416 lt!648418 mask!2687))))

(declare-fun b!1487026 () Bool)

(assert (=> b!1487026 (= e!833507 e!833506)))

(declare-fun c!137292 () Bool)

(assert (=> b!1487026 (= c!137292 (or (= lt!648485 lt!648416) (= (bvadd lt!648485 lt!648485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156281 c!137293) b!1487024))

(assert (= (and d!156281 (not c!137293)) b!1487026))

(assert (= (and b!1487026 c!137292) b!1487022))

(assert (= (and b!1487026 (not c!137292)) b!1487025))

(assert (= (and d!156281 c!137294) b!1487018))

(assert (= (and d!156281 (not c!137294)) b!1487023))

(assert (= (and b!1487023 res!1011489) b!1487019))

(assert (= (and b!1487019 (not res!1011488)) b!1487020))

(assert (= (and b!1487020 (not res!1011487)) b!1487021))

(declare-fun m!1371221 () Bool)

(assert (=> b!1487021 m!1371221))

(assert (=> d!156281 m!1371047))

(declare-fun m!1371223 () Bool)

(assert (=> d!156281 m!1371223))

(assert (=> d!156281 m!1371081))

(assert (=> b!1487020 m!1371221))

(assert (=> b!1487019 m!1371221))

(assert (=> b!1487025 m!1371047))

(declare-fun m!1371225 () Bool)

(assert (=> b!1487025 m!1371225))

(assert (=> b!1487025 m!1371225))

(declare-fun m!1371227 () Bool)

(assert (=> b!1487025 m!1371227))

(assert (=> b!1486850 d!156281))

(declare-fun d!156283 () Bool)

(declare-fun lt!648491 () (_ BitVec 32))

(declare-fun lt!648490 () (_ BitVec 32))

(assert (=> d!156283 (= lt!648491 (bvmul (bvxor lt!648490 (bvlshr lt!648490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156283 (= lt!648490 ((_ extract 31 0) (bvand (bvxor lt!648416 (bvlshr lt!648416 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156283 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011490 (let ((h!35989 ((_ extract 31 0) (bvand (bvxor lt!648416 (bvlshr lt!648416 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133168 (bvmul (bvxor h!35989 (bvlshr h!35989 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133168 (bvlshr x!133168 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011490 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011490 #b00000000000000000000000000000000))))))

(assert (=> d!156283 (= (toIndex!0 lt!648416 mask!2687) (bvand (bvxor lt!648491 (bvlshr lt!648491 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1486850 d!156283))

(declare-fun d!156285 () Bool)

(declare-fun lt!648494 () (_ BitVec 32))

(assert (=> d!156285 (and (bvsge lt!648494 #b00000000000000000000000000000000) (bvslt lt!648494 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156285 (= lt!648494 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156285 (validMask!0 mask!2687)))

(assert (=> d!156285 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648494)))

(declare-fun bs!42737 () Bool)

(assert (= bs!42737 d!156285))

(declare-fun m!1371229 () Bool)

(assert (=> bs!42737 m!1371229))

(assert (=> bs!42737 m!1371081))

(assert (=> b!1486830 d!156285))

(declare-fun d!156287 () Bool)

(assert (=> d!156287 (= (validKeyInArray!0 (select (arr!48034 a!2862) i!1006)) (and (not (= (select (arr!48034 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48034 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1486841 d!156287))

(declare-fun b!1487027 () Bool)

(declare-fun e!833514 () Bool)

(declare-fun lt!648495 () SeekEntryResult!12299)

(assert (=> b!1487027 (= e!833514 (bvsge (x!133164 lt!648495) #b01111111111111111111111111111110))))

(declare-fun b!1487028 () Bool)

(assert (=> b!1487028 (and (bvsge (index!51590 lt!648495) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648495) (size!48586 a!2862)))))

(declare-fun res!1011492 () Bool)

(assert (=> b!1487028 (= res!1011492 (= (select (arr!48034 a!2862) (index!51590 lt!648495)) (select (arr!48034 a!2862) j!93)))))

(declare-fun e!833515 () Bool)

(assert (=> b!1487028 (=> res!1011492 e!833515)))

(declare-fun e!833513 () Bool)

(assert (=> b!1487028 (= e!833513 e!833515)))

(declare-fun b!1487029 () Bool)

(assert (=> b!1487029 (and (bvsge (index!51590 lt!648495) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648495) (size!48586 a!2862)))))

(declare-fun res!1011491 () Bool)

(assert (=> b!1487029 (= res!1011491 (= (select (arr!48034 a!2862) (index!51590 lt!648495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487029 (=> res!1011491 e!833515)))

(declare-fun d!156289 () Bool)

(assert (=> d!156289 e!833514))

(declare-fun c!137297 () Bool)

(assert (=> d!156289 (= c!137297 (and ((_ is Intermediate!12299) lt!648495) (undefined!13111 lt!648495)))))

(declare-fun e!833512 () SeekEntryResult!12299)

(assert (=> d!156289 (= lt!648495 e!833512)))

(declare-fun c!137296 () Bool)

(assert (=> d!156289 (= c!137296 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!648496 () (_ BitVec 64))

(assert (=> d!156289 (= lt!648496 (select (arr!48034 a!2862) lt!648422))))

(assert (=> d!156289 (validMask!0 mask!2687)))

(assert (=> d!156289 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648422 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648495)))

(declare-fun b!1487030 () Bool)

(assert (=> b!1487030 (and (bvsge (index!51590 lt!648495) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648495) (size!48586 a!2862)))))

(assert (=> b!1487030 (= e!833515 (= (select (arr!48034 a!2862) (index!51590 lt!648495)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487031 () Bool)

(declare-fun e!833511 () SeekEntryResult!12299)

(assert (=> b!1487031 (= e!833511 (Intermediate!12299 false lt!648422 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487032 () Bool)

(assert (=> b!1487032 (= e!833514 e!833513)))

(declare-fun res!1011493 () Bool)

(assert (=> b!1487032 (= res!1011493 (and ((_ is Intermediate!12299) lt!648495) (not (undefined!13111 lt!648495)) (bvslt (x!133164 lt!648495) #b01111111111111111111111111111110) (bvsge (x!133164 lt!648495) #b00000000000000000000000000000000) (bvsge (x!133164 lt!648495) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1487032 (=> (not res!1011493) (not e!833513))))

(declare-fun b!1487033 () Bool)

(assert (=> b!1487033 (= e!833512 (Intermediate!12299 true lt!648422 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487034 () Bool)

(assert (=> b!1487034 (= e!833511 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!648422 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487035 () Bool)

(assert (=> b!1487035 (= e!833512 e!833511)))

(declare-fun c!137295 () Bool)

(assert (=> b!1487035 (= c!137295 (or (= lt!648496 (select (arr!48034 a!2862) j!93)) (= (bvadd lt!648496 lt!648496) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156289 c!137296) b!1487033))

(assert (= (and d!156289 (not c!137296)) b!1487035))

(assert (= (and b!1487035 c!137295) b!1487031))

(assert (= (and b!1487035 (not c!137295)) b!1487034))

(assert (= (and d!156289 c!137297) b!1487027))

(assert (= (and d!156289 (not c!137297)) b!1487032))

(assert (= (and b!1487032 res!1011493) b!1487028))

(assert (= (and b!1487028 (not res!1011492)) b!1487029))

(assert (= (and b!1487029 (not res!1011491)) b!1487030))

(declare-fun m!1371231 () Bool)

(assert (=> b!1487030 m!1371231))

(declare-fun m!1371233 () Bool)

(assert (=> d!156289 m!1371233))

(assert (=> d!156289 m!1371081))

(assert (=> b!1487029 m!1371231))

(assert (=> b!1487028 m!1371231))

(declare-fun m!1371235 () Bool)

(assert (=> b!1487034 m!1371235))

(assert (=> b!1487034 m!1371235))

(assert (=> b!1487034 m!1371059))

(declare-fun m!1371237 () Bool)

(assert (=> b!1487034 m!1371237))

(assert (=> b!1486837 d!156289))

(declare-fun b!1487048 () Bool)

(declare-fun c!137306 () Bool)

(declare-fun lt!648501 () (_ BitVec 64))

(assert (=> b!1487048 (= c!137306 (= lt!648501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833524 () SeekEntryResult!12299)

(declare-fun e!833523 () SeekEntryResult!12299)

(assert (=> b!1487048 (= e!833524 e!833523)))

(declare-fun d!156291 () Bool)

(declare-fun lt!648502 () SeekEntryResult!12299)

(assert (=> d!156291 (and (or ((_ is Undefined!12299) lt!648502) (not ((_ is Found!12299) lt!648502)) (and (bvsge (index!51589 lt!648502) #b00000000000000000000000000000000) (bvslt (index!51589 lt!648502) (size!48586 lt!648418)))) (or ((_ is Undefined!12299) lt!648502) ((_ is Found!12299) lt!648502) (not ((_ is MissingVacant!12299) lt!648502)) (not (= (index!51591 lt!648502) intermediateAfterIndex!19)) (and (bvsge (index!51591 lt!648502) #b00000000000000000000000000000000) (bvslt (index!51591 lt!648502) (size!48586 lt!648418)))) (or ((_ is Undefined!12299) lt!648502) (ite ((_ is Found!12299) lt!648502) (= (select (arr!48034 lt!648418) (index!51589 lt!648502)) lt!648416) (and ((_ is MissingVacant!12299) lt!648502) (= (index!51591 lt!648502) intermediateAfterIndex!19) (= (select (arr!48034 lt!648418) (index!51591 lt!648502)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!833522 () SeekEntryResult!12299)

(assert (=> d!156291 (= lt!648502 e!833522)))

(declare-fun c!137305 () Bool)

(assert (=> d!156291 (= c!137305 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156291 (= lt!648501 (select (arr!48034 lt!648418) index!646))))

(assert (=> d!156291 (validMask!0 mask!2687)))

(assert (=> d!156291 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648416 lt!648418 mask!2687) lt!648502)))

(declare-fun b!1487049 () Bool)

(assert (=> b!1487049 (= e!833524 (Found!12299 index!646))))

(declare-fun b!1487050 () Bool)

(assert (=> b!1487050 (= e!833522 e!833524)))

(declare-fun c!137304 () Bool)

(assert (=> b!1487050 (= c!137304 (= lt!648501 lt!648416))))

(declare-fun b!1487051 () Bool)

(assert (=> b!1487051 (= e!833522 Undefined!12299)))

(declare-fun b!1487052 () Bool)

(assert (=> b!1487052 (= e!833523 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648416 lt!648418 mask!2687))))

(declare-fun b!1487053 () Bool)

(assert (=> b!1487053 (= e!833523 (MissingVacant!12299 intermediateAfterIndex!19))))

(assert (= (and d!156291 c!137305) b!1487051))

(assert (= (and d!156291 (not c!137305)) b!1487050))

(assert (= (and b!1487050 c!137304) b!1487049))

(assert (= (and b!1487050 (not c!137304)) b!1487048))

(assert (= (and b!1487048 c!137306) b!1487053))

(assert (= (and b!1487048 (not c!137306)) b!1487052))

(declare-fun m!1371239 () Bool)

(assert (=> d!156291 m!1371239))

(declare-fun m!1371241 () Bool)

(assert (=> d!156291 m!1371241))

(declare-fun m!1371243 () Bool)

(assert (=> d!156291 m!1371243))

(assert (=> d!156291 m!1371081))

(assert (=> b!1487052 m!1371053))

(assert (=> b!1487052 m!1371053))

(declare-fun m!1371245 () Bool)

(assert (=> b!1487052 m!1371245))

(assert (=> b!1486839 d!156291))

(declare-fun b!1487079 () Bool)

(declare-fun e!833537 () SeekEntryResult!12299)

(declare-fun e!833539 () SeekEntryResult!12299)

(assert (=> b!1487079 (= e!833537 e!833539)))

(declare-fun lt!648513 () (_ BitVec 64))

(declare-fun lt!648515 () SeekEntryResult!12299)

(assert (=> b!1487079 (= lt!648513 (select (arr!48034 lt!648418) (index!51590 lt!648515)))))

(declare-fun c!137319 () Bool)

(assert (=> b!1487079 (= c!137319 (= lt!648513 lt!648416))))

(declare-fun b!1487080 () Bool)

(declare-fun c!137320 () Bool)

(assert (=> b!1487080 (= c!137320 (= lt!648513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833538 () SeekEntryResult!12299)

(assert (=> b!1487080 (= e!833539 e!833538)))

(declare-fun b!1487081 () Bool)

(assert (=> b!1487081 (= e!833539 (Found!12299 (index!51590 lt!648515)))))

(declare-fun b!1487078 () Bool)

(assert (=> b!1487078 (= e!833537 Undefined!12299)))

(declare-fun d!156293 () Bool)

(declare-fun lt!648514 () SeekEntryResult!12299)

(assert (=> d!156293 (and (or ((_ is Undefined!12299) lt!648514) (not ((_ is Found!12299) lt!648514)) (and (bvsge (index!51589 lt!648514) #b00000000000000000000000000000000) (bvslt (index!51589 lt!648514) (size!48586 lt!648418)))) (or ((_ is Undefined!12299) lt!648514) ((_ is Found!12299) lt!648514) (not ((_ is MissingZero!12299) lt!648514)) (and (bvsge (index!51588 lt!648514) #b00000000000000000000000000000000) (bvslt (index!51588 lt!648514) (size!48586 lt!648418)))) (or ((_ is Undefined!12299) lt!648514) ((_ is Found!12299) lt!648514) ((_ is MissingZero!12299) lt!648514) (not ((_ is MissingVacant!12299) lt!648514)) (and (bvsge (index!51591 lt!648514) #b00000000000000000000000000000000) (bvslt (index!51591 lt!648514) (size!48586 lt!648418)))) (or ((_ is Undefined!12299) lt!648514) (ite ((_ is Found!12299) lt!648514) (= (select (arr!48034 lt!648418) (index!51589 lt!648514)) lt!648416) (ite ((_ is MissingZero!12299) lt!648514) (= (select (arr!48034 lt!648418) (index!51588 lt!648514)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12299) lt!648514) (= (select (arr!48034 lt!648418) (index!51591 lt!648514)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156293 (= lt!648514 e!833537)))

(declare-fun c!137321 () Bool)

(assert (=> d!156293 (= c!137321 (and ((_ is Intermediate!12299) lt!648515) (undefined!13111 lt!648515)))))

(assert (=> d!156293 (= lt!648515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648416 mask!2687) lt!648416 lt!648418 mask!2687))))

(assert (=> d!156293 (validMask!0 mask!2687)))

(assert (=> d!156293 (= (seekEntryOrOpen!0 lt!648416 lt!648418 mask!2687) lt!648514)))

(declare-fun b!1487082 () Bool)

(assert (=> b!1487082 (= e!833538 (seekKeyOrZeroReturnVacant!0 (x!133164 lt!648515) (index!51590 lt!648515) (index!51590 lt!648515) lt!648416 lt!648418 mask!2687))))

(declare-fun b!1487083 () Bool)

(assert (=> b!1487083 (= e!833538 (MissingZero!12299 (index!51590 lt!648515)))))

(assert (= (and d!156293 c!137321) b!1487078))

(assert (= (and d!156293 (not c!137321)) b!1487079))

(assert (= (and b!1487079 c!137319) b!1487081))

(assert (= (and b!1487079 (not c!137319)) b!1487080))

(assert (= (and b!1487080 c!137320) b!1487083))

(assert (= (and b!1487080 (not c!137320)) b!1487082))

(declare-fun m!1371247 () Bool)

(assert (=> b!1487079 m!1371247))

(declare-fun m!1371249 () Bool)

(assert (=> d!156293 m!1371249))

(assert (=> d!156293 m!1371047))

(assert (=> d!156293 m!1371049))

(assert (=> d!156293 m!1371047))

(assert (=> d!156293 m!1371081))

(declare-fun m!1371251 () Bool)

(assert (=> d!156293 m!1371251))

(declare-fun m!1371253 () Bool)

(assert (=> d!156293 m!1371253))

(declare-fun m!1371255 () Bool)

(assert (=> b!1487082 m!1371255))

(assert (=> b!1486839 d!156293))

(assert (=> b!1486838 d!156293))

(assert (=> b!1486838 d!156291))

(declare-fun b!1487090 () Bool)

(declare-fun e!833547 () Bool)

(declare-fun lt!648516 () SeekEntryResult!12299)

(assert (=> b!1487090 (= e!833547 (bvsge (x!133164 lt!648516) #b01111111111111111111111111111110))))

(declare-fun b!1487091 () Bool)

(assert (=> b!1487091 (and (bvsge (index!51590 lt!648516) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648516) (size!48586 lt!648418)))))

(declare-fun res!1011501 () Bool)

(assert (=> b!1487091 (= res!1011501 (= (select (arr!48034 lt!648418) (index!51590 lt!648516)) lt!648416))))

(declare-fun e!833548 () Bool)

(assert (=> b!1487091 (=> res!1011501 e!833548)))

(declare-fun e!833546 () Bool)

(assert (=> b!1487091 (= e!833546 e!833548)))

(declare-fun b!1487092 () Bool)

(assert (=> b!1487092 (and (bvsge (index!51590 lt!648516) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648516) (size!48586 lt!648418)))))

(declare-fun res!1011500 () Bool)

(assert (=> b!1487092 (= res!1011500 (= (select (arr!48034 lt!648418) (index!51590 lt!648516)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487092 (=> res!1011500 e!833548)))

(declare-fun d!156299 () Bool)

(assert (=> d!156299 e!833547))

(declare-fun c!137324 () Bool)

(assert (=> d!156299 (= c!137324 (and ((_ is Intermediate!12299) lt!648516) (undefined!13111 lt!648516)))))

(declare-fun e!833545 () SeekEntryResult!12299)

(assert (=> d!156299 (= lt!648516 e!833545)))

(declare-fun c!137323 () Bool)

(assert (=> d!156299 (= c!137323 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648517 () (_ BitVec 64))

(assert (=> d!156299 (= lt!648517 (select (arr!48034 lt!648418) index!646))))

(assert (=> d!156299 (validMask!0 mask!2687)))

(assert (=> d!156299 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648416 lt!648418 mask!2687) lt!648516)))

(declare-fun b!1487093 () Bool)

(assert (=> b!1487093 (and (bvsge (index!51590 lt!648516) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648516) (size!48586 lt!648418)))))

(assert (=> b!1487093 (= e!833548 (= (select (arr!48034 lt!648418) (index!51590 lt!648516)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487094 () Bool)

(declare-fun e!833544 () SeekEntryResult!12299)

(assert (=> b!1487094 (= e!833544 (Intermediate!12299 false index!646 x!665))))

(declare-fun b!1487095 () Bool)

(assert (=> b!1487095 (= e!833547 e!833546)))

(declare-fun res!1011502 () Bool)

(assert (=> b!1487095 (= res!1011502 (and ((_ is Intermediate!12299) lt!648516) (not (undefined!13111 lt!648516)) (bvslt (x!133164 lt!648516) #b01111111111111111111111111111110) (bvsge (x!133164 lt!648516) #b00000000000000000000000000000000) (bvsge (x!133164 lt!648516) x!665)))))

(assert (=> b!1487095 (=> (not res!1011502) (not e!833546))))

(declare-fun b!1487096 () Bool)

(assert (=> b!1487096 (= e!833545 (Intermediate!12299 true index!646 x!665))))

(declare-fun b!1487097 () Bool)

(assert (=> b!1487097 (= e!833544 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648416 lt!648418 mask!2687))))

(declare-fun b!1487098 () Bool)

(assert (=> b!1487098 (= e!833545 e!833544)))

(declare-fun c!137322 () Bool)

(assert (=> b!1487098 (= c!137322 (or (= lt!648517 lt!648416) (= (bvadd lt!648517 lt!648517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156299 c!137323) b!1487096))

(assert (= (and d!156299 (not c!137323)) b!1487098))

(assert (= (and b!1487098 c!137322) b!1487094))

(assert (= (and b!1487098 (not c!137322)) b!1487097))

(assert (= (and d!156299 c!137324) b!1487090))

(assert (= (and d!156299 (not c!137324)) b!1487095))

(assert (= (and b!1487095 res!1011502) b!1487091))

(assert (= (and b!1487091 (not res!1011501)) b!1487092))

(assert (= (and b!1487092 (not res!1011500)) b!1487093))

(declare-fun m!1371257 () Bool)

(assert (=> b!1487093 m!1371257))

(assert (=> d!156299 m!1371243))

(assert (=> d!156299 m!1371081))

(assert (=> b!1487092 m!1371257))

(assert (=> b!1487091 m!1371257))

(assert (=> b!1487097 m!1371053))

(assert (=> b!1487097 m!1371053))

(declare-fun m!1371259 () Bool)

(assert (=> b!1487097 m!1371259))

(assert (=> b!1486849 d!156299))

(declare-fun d!156301 () Bool)

(assert (=> d!156301 (= (validKeyInArray!0 (select (arr!48034 a!2862) j!93)) (and (not (= (select (arr!48034 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48034 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1486835 d!156301))

(declare-fun b!1487136 () Bool)

(declare-fun e!833574 () Bool)

(declare-fun e!833572 () Bool)

(assert (=> b!1487136 (= e!833574 e!833572)))

(declare-fun res!1011514 () Bool)

(assert (=> b!1487136 (=> (not res!1011514) (not e!833572))))

(declare-fun e!833571 () Bool)

(assert (=> b!1487136 (= res!1011514 (not e!833571))))

(declare-fun res!1011512 () Bool)

(assert (=> b!1487136 (=> (not res!1011512) (not e!833571))))

(assert (=> b!1487136 (= res!1011512 (validKeyInArray!0 (select (arr!48034 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487137 () Bool)

(declare-fun e!833573 () Bool)

(declare-fun call!67866 () Bool)

(assert (=> b!1487137 (= e!833573 call!67866)))

(declare-fun bm!67863 () Bool)

(declare-fun c!137339 () Bool)

(assert (=> bm!67863 (= call!67866 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137339 (Cons!34609 (select (arr!48034 a!2862) #b00000000000000000000000000000000) Nil!34610) Nil!34610)))))

(declare-fun b!1487138 () Bool)

(declare-fun contains!9885 (List!34613 (_ BitVec 64)) Bool)

(assert (=> b!1487138 (= e!833571 (contains!9885 Nil!34610 (select (arr!48034 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487140 () Bool)

(assert (=> b!1487140 (= e!833572 e!833573)))

(assert (=> b!1487140 (= c!137339 (validKeyInArray!0 (select (arr!48034 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156303 () Bool)

(declare-fun res!1011513 () Bool)

(assert (=> d!156303 (=> res!1011513 e!833574)))

(assert (=> d!156303 (= res!1011513 (bvsge #b00000000000000000000000000000000 (size!48586 a!2862)))))

(assert (=> d!156303 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34610) e!833574)))

(declare-fun b!1487139 () Bool)

(assert (=> b!1487139 (= e!833573 call!67866)))

(assert (= (and d!156303 (not res!1011513)) b!1487136))

(assert (= (and b!1487136 res!1011512) b!1487138))

(assert (= (and b!1487136 res!1011514) b!1487140))

(assert (= (and b!1487140 c!137339) b!1487139))

(assert (= (and b!1487140 (not c!137339)) b!1487137))

(assert (= (or b!1487139 b!1487137) bm!67863))

(assert (=> b!1487136 m!1371209))

(assert (=> b!1487136 m!1371209))

(assert (=> b!1487136 m!1371211))

(assert (=> bm!67863 m!1371209))

(declare-fun m!1371277 () Bool)

(assert (=> bm!67863 m!1371277))

(assert (=> b!1487138 m!1371209))

(assert (=> b!1487138 m!1371209))

(declare-fun m!1371279 () Bool)

(assert (=> b!1487138 m!1371279))

(assert (=> b!1487140 m!1371209))

(assert (=> b!1487140 m!1371209))

(assert (=> b!1487140 m!1371211))

(assert (=> b!1486834 d!156303))

(declare-fun b!1487141 () Bool)

(declare-fun e!833578 () Bool)

(declare-fun lt!648526 () SeekEntryResult!12299)

(assert (=> b!1487141 (= e!833578 (bvsge (x!133164 lt!648526) #b01111111111111111111111111111110))))

(declare-fun b!1487142 () Bool)

(assert (=> b!1487142 (and (bvsge (index!51590 lt!648526) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648526) (size!48586 a!2862)))))

(declare-fun res!1011516 () Bool)

(assert (=> b!1487142 (= res!1011516 (= (select (arr!48034 a!2862) (index!51590 lt!648526)) (select (arr!48034 a!2862) j!93)))))

(declare-fun e!833579 () Bool)

(assert (=> b!1487142 (=> res!1011516 e!833579)))

(declare-fun e!833577 () Bool)

(assert (=> b!1487142 (= e!833577 e!833579)))

(declare-fun b!1487143 () Bool)

(assert (=> b!1487143 (and (bvsge (index!51590 lt!648526) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648526) (size!48586 a!2862)))))

(declare-fun res!1011515 () Bool)

(assert (=> b!1487143 (= res!1011515 (= (select (arr!48034 a!2862) (index!51590 lt!648526)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487143 (=> res!1011515 e!833579)))

(declare-fun d!156311 () Bool)

(assert (=> d!156311 e!833578))

(declare-fun c!137342 () Bool)

(assert (=> d!156311 (= c!137342 (and ((_ is Intermediate!12299) lt!648526) (undefined!13111 lt!648526)))))

(declare-fun e!833576 () SeekEntryResult!12299)

(assert (=> d!156311 (= lt!648526 e!833576)))

(declare-fun c!137341 () Bool)

(assert (=> d!156311 (= c!137341 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648527 () (_ BitVec 64))

(assert (=> d!156311 (= lt!648527 (select (arr!48034 a!2862) (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687)))))

(assert (=> d!156311 (validMask!0 mask!2687)))

(assert (=> d!156311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648526)))

(declare-fun b!1487144 () Bool)

(assert (=> b!1487144 (and (bvsge (index!51590 lt!648526) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648526) (size!48586 a!2862)))))

(assert (=> b!1487144 (= e!833579 (= (select (arr!48034 a!2862) (index!51590 lt!648526)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833575 () SeekEntryResult!12299)

(declare-fun b!1487145 () Bool)

(assert (=> b!1487145 (= e!833575 (Intermediate!12299 false (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487146 () Bool)

(assert (=> b!1487146 (= e!833578 e!833577)))

(declare-fun res!1011517 () Bool)

(assert (=> b!1487146 (= res!1011517 (and ((_ is Intermediate!12299) lt!648526) (not (undefined!13111 lt!648526)) (bvslt (x!133164 lt!648526) #b01111111111111111111111111111110) (bvsge (x!133164 lt!648526) #b00000000000000000000000000000000) (bvsge (x!133164 lt!648526) #b00000000000000000000000000000000)))))

(assert (=> b!1487146 (=> (not res!1011517) (not e!833577))))

(declare-fun b!1487147 () Bool)

(assert (=> b!1487147 (= e!833576 (Intermediate!12299 true (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487148 () Bool)

(assert (=> b!1487148 (= e!833575 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487149 () Bool)

(assert (=> b!1487149 (= e!833576 e!833575)))

(declare-fun c!137340 () Bool)

(assert (=> b!1487149 (= c!137340 (or (= lt!648527 (select (arr!48034 a!2862) j!93)) (= (bvadd lt!648527 lt!648527) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156311 c!137341) b!1487147))

(assert (= (and d!156311 (not c!137341)) b!1487149))

(assert (= (and b!1487149 c!137340) b!1487145))

(assert (= (and b!1487149 (not c!137340)) b!1487148))

(assert (= (and d!156311 c!137342) b!1487141))

(assert (= (and d!156311 (not c!137342)) b!1487146))

(assert (= (and b!1487146 res!1011517) b!1487142))

(assert (= (and b!1487142 (not res!1011516)) b!1487143))

(assert (= (and b!1487143 (not res!1011515)) b!1487144))

(declare-fun m!1371281 () Bool)

(assert (=> b!1487144 m!1371281))

(assert (=> d!156311 m!1371085))

(declare-fun m!1371283 () Bool)

(assert (=> d!156311 m!1371283))

(assert (=> d!156311 m!1371081))

(assert (=> b!1487143 m!1371281))

(assert (=> b!1487142 m!1371281))

(assert (=> b!1487148 m!1371085))

(declare-fun m!1371285 () Bool)

(assert (=> b!1487148 m!1371285))

(assert (=> b!1487148 m!1371285))

(assert (=> b!1487148 m!1371059))

(declare-fun m!1371287 () Bool)

(assert (=> b!1487148 m!1371287))

(assert (=> b!1486836 d!156311))

(declare-fun d!156313 () Bool)

(declare-fun lt!648529 () (_ BitVec 32))

(declare-fun lt!648528 () (_ BitVec 32))

(assert (=> d!156313 (= lt!648529 (bvmul (bvxor lt!648528 (bvlshr lt!648528 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156313 (= lt!648528 ((_ extract 31 0) (bvand (bvxor (select (arr!48034 a!2862) j!93) (bvlshr (select (arr!48034 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156313 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011490 (let ((h!35989 ((_ extract 31 0) (bvand (bvxor (select (arr!48034 a!2862) j!93) (bvlshr (select (arr!48034 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133168 (bvmul (bvxor h!35989 (bvlshr h!35989 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133168 (bvlshr x!133168 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011490 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011490 #b00000000000000000000000000000000))))))

(assert (=> d!156313 (= (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) (bvand (bvxor lt!648529 (bvlshr lt!648529 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1486836 d!156313))

(declare-fun b!1487150 () Bool)

(declare-fun e!833583 () Bool)

(declare-fun lt!648530 () SeekEntryResult!12299)

(assert (=> b!1487150 (= e!833583 (bvsge (x!133164 lt!648530) #b01111111111111111111111111111110))))

(declare-fun b!1487151 () Bool)

(assert (=> b!1487151 (and (bvsge (index!51590 lt!648530) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648530) (size!48586 a!2862)))))

(declare-fun res!1011519 () Bool)

(assert (=> b!1487151 (= res!1011519 (= (select (arr!48034 a!2862) (index!51590 lt!648530)) (select (arr!48034 a!2862) j!93)))))

(declare-fun e!833584 () Bool)

(assert (=> b!1487151 (=> res!1011519 e!833584)))

(declare-fun e!833582 () Bool)

(assert (=> b!1487151 (= e!833582 e!833584)))

(declare-fun b!1487152 () Bool)

(assert (=> b!1487152 (and (bvsge (index!51590 lt!648530) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648530) (size!48586 a!2862)))))

(declare-fun res!1011518 () Bool)

(assert (=> b!1487152 (= res!1011518 (= (select (arr!48034 a!2862) (index!51590 lt!648530)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487152 (=> res!1011518 e!833584)))

(declare-fun d!156315 () Bool)

(assert (=> d!156315 e!833583))

(declare-fun c!137345 () Bool)

(assert (=> d!156315 (= c!137345 (and ((_ is Intermediate!12299) lt!648530) (undefined!13111 lt!648530)))))

(declare-fun e!833581 () SeekEntryResult!12299)

(assert (=> d!156315 (= lt!648530 e!833581)))

(declare-fun c!137344 () Bool)

(assert (=> d!156315 (= c!137344 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648531 () (_ BitVec 64))

(assert (=> d!156315 (= lt!648531 (select (arr!48034 a!2862) index!646))))

(assert (=> d!156315 (validMask!0 mask!2687)))

(assert (=> d!156315 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648530)))

(declare-fun b!1487153 () Bool)

(assert (=> b!1487153 (and (bvsge (index!51590 lt!648530) #b00000000000000000000000000000000) (bvslt (index!51590 lt!648530) (size!48586 a!2862)))))

(assert (=> b!1487153 (= e!833584 (= (select (arr!48034 a!2862) (index!51590 lt!648530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487154 () Bool)

(declare-fun e!833580 () SeekEntryResult!12299)

(assert (=> b!1487154 (= e!833580 (Intermediate!12299 false index!646 x!665))))

(declare-fun b!1487155 () Bool)

(assert (=> b!1487155 (= e!833583 e!833582)))

(declare-fun res!1011520 () Bool)

(assert (=> b!1487155 (= res!1011520 (and ((_ is Intermediate!12299) lt!648530) (not (undefined!13111 lt!648530)) (bvslt (x!133164 lt!648530) #b01111111111111111111111111111110) (bvsge (x!133164 lt!648530) #b00000000000000000000000000000000) (bvsge (x!133164 lt!648530) x!665)))))

(assert (=> b!1487155 (=> (not res!1011520) (not e!833582))))

(declare-fun b!1487156 () Bool)

(assert (=> b!1487156 (= e!833581 (Intermediate!12299 true index!646 x!665))))

(declare-fun b!1487157 () Bool)

(assert (=> b!1487157 (= e!833580 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487158 () Bool)

(assert (=> b!1487158 (= e!833581 e!833580)))

(declare-fun c!137343 () Bool)

(assert (=> b!1487158 (= c!137343 (or (= lt!648531 (select (arr!48034 a!2862) j!93)) (= (bvadd lt!648531 lt!648531) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!156315 c!137344) b!1487156))

(assert (= (and d!156315 (not c!137344)) b!1487158))

(assert (= (and b!1487158 c!137343) b!1487154))

(assert (= (and b!1487158 (not c!137343)) b!1487157))

(assert (= (and d!156315 c!137345) b!1487150))

(assert (= (and d!156315 (not c!137345)) b!1487155))

(assert (= (and b!1487155 res!1011520) b!1487151))

(assert (= (and b!1487151 (not res!1011519)) b!1487152))

(assert (= (and b!1487152 (not res!1011518)) b!1487153))

(declare-fun m!1371289 () Bool)

(assert (=> b!1487153 m!1371289))

(assert (=> d!156315 m!1371063))

(assert (=> d!156315 m!1371081))

(assert (=> b!1487152 m!1371289))

(assert (=> b!1487151 m!1371289))

(assert (=> b!1487157 m!1371053))

(assert (=> b!1487157 m!1371053))

(assert (=> b!1487157 m!1371059))

(declare-fun m!1371291 () Bool)

(assert (=> b!1487157 m!1371291))

(assert (=> b!1486847 d!156315))

(declare-fun b!1487160 () Bool)

(declare-fun e!833585 () SeekEntryResult!12299)

(declare-fun e!833587 () SeekEntryResult!12299)

(assert (=> b!1487160 (= e!833585 e!833587)))

(declare-fun lt!648532 () (_ BitVec 64))

(declare-fun lt!648534 () SeekEntryResult!12299)

(assert (=> b!1487160 (= lt!648532 (select (arr!48034 a!2862) (index!51590 lt!648534)))))

(declare-fun c!137346 () Bool)

(assert (=> b!1487160 (= c!137346 (= lt!648532 (select (arr!48034 a!2862) j!93)))))

(declare-fun b!1487161 () Bool)

(declare-fun c!137347 () Bool)

(assert (=> b!1487161 (= c!137347 (= lt!648532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833586 () SeekEntryResult!12299)

(assert (=> b!1487161 (= e!833587 e!833586)))

(declare-fun b!1487162 () Bool)

(assert (=> b!1487162 (= e!833587 (Found!12299 (index!51590 lt!648534)))))

(declare-fun b!1487159 () Bool)

(assert (=> b!1487159 (= e!833585 Undefined!12299)))

(declare-fun d!156317 () Bool)

(declare-fun lt!648533 () SeekEntryResult!12299)

(assert (=> d!156317 (and (or ((_ is Undefined!12299) lt!648533) (not ((_ is Found!12299) lt!648533)) (and (bvsge (index!51589 lt!648533) #b00000000000000000000000000000000) (bvslt (index!51589 lt!648533) (size!48586 a!2862)))) (or ((_ is Undefined!12299) lt!648533) ((_ is Found!12299) lt!648533) (not ((_ is MissingZero!12299) lt!648533)) (and (bvsge (index!51588 lt!648533) #b00000000000000000000000000000000) (bvslt (index!51588 lt!648533) (size!48586 a!2862)))) (or ((_ is Undefined!12299) lt!648533) ((_ is Found!12299) lt!648533) ((_ is MissingZero!12299) lt!648533) (not ((_ is MissingVacant!12299) lt!648533)) (and (bvsge (index!51591 lt!648533) #b00000000000000000000000000000000) (bvslt (index!51591 lt!648533) (size!48586 a!2862)))) (or ((_ is Undefined!12299) lt!648533) (ite ((_ is Found!12299) lt!648533) (= (select (arr!48034 a!2862) (index!51589 lt!648533)) (select (arr!48034 a!2862) j!93)) (ite ((_ is MissingZero!12299) lt!648533) (= (select (arr!48034 a!2862) (index!51588 lt!648533)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12299) lt!648533) (= (select (arr!48034 a!2862) (index!51591 lt!648533)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156317 (= lt!648533 e!833585)))

(declare-fun c!137348 () Bool)

(assert (=> d!156317 (= c!137348 (and ((_ is Intermediate!12299) lt!648534) (undefined!13111 lt!648534)))))

(assert (=> d!156317 (= lt!648534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156317 (validMask!0 mask!2687)))

(assert (=> d!156317 (= (seekEntryOrOpen!0 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648533)))

(declare-fun b!1487163 () Bool)

(assert (=> b!1487163 (= e!833586 (seekKeyOrZeroReturnVacant!0 (x!133164 lt!648534) (index!51590 lt!648534) (index!51590 lt!648534) (select (arr!48034 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487164 () Bool)

(assert (=> b!1487164 (= e!833586 (MissingZero!12299 (index!51590 lt!648534)))))

(assert (= (and d!156317 c!137348) b!1487159))

(assert (= (and d!156317 (not c!137348)) b!1487160))

(assert (= (and b!1487160 c!137346) b!1487162))

(assert (= (and b!1487160 (not c!137346)) b!1487161))

(assert (= (and b!1487161 c!137347) b!1487164))

(assert (= (and b!1487161 (not c!137347)) b!1487163))

(declare-fun m!1371293 () Bool)

(assert (=> b!1487160 m!1371293))

(declare-fun m!1371295 () Bool)

(assert (=> d!156317 m!1371295))

(assert (=> d!156317 m!1371085))

(assert (=> d!156317 m!1371059))

(assert (=> d!156317 m!1371087))

(assert (=> d!156317 m!1371059))

(assert (=> d!156317 m!1371085))

(assert (=> d!156317 m!1371081))

(declare-fun m!1371297 () Bool)

(assert (=> d!156317 m!1371297))

(declare-fun m!1371299 () Bool)

(assert (=> d!156317 m!1371299))

(assert (=> b!1487163 m!1371059))

(declare-fun m!1371301 () Bool)

(assert (=> b!1487163 m!1371301))

(assert (=> b!1486846 d!156317))

(declare-fun d!156319 () Bool)

(assert (=> d!156319 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126620 d!156319))

(declare-fun d!156321 () Bool)

(assert (=> d!156321 (= (array_inv!37267 a!2862) (bvsge (size!48586 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126620 d!156321))

(check-sat (not d!156277) (not b!1487138) (not d!156285) (not b!1487052) (not d!156317) (not d!156311) (not b!1487148) (not b!1486992) (not bm!67863) (not d!156289) (not b!1487097) (not b!1486998) (not d!156315) (not d!156281) (not b!1487034) (not b!1487082) (not d!156291) (not bm!67860) (not b!1487157) (not b!1487136) (not b!1487025) (not b!1486994) (not b!1487140) (not d!156299) (not b!1486996) (not d!156293) (not bm!67859) (not b!1487163))
(check-sat)
