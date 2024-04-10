; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126532 () Bool)

(assert start!126532)

(declare-fun b!1484548 () Bool)

(declare-fun res!1009323 () Bool)

(declare-fun e!832335 () Bool)

(assert (=> b!1484548 (=> (not res!1009323) (not e!832335))))

(declare-datatypes ((array!99494 0))(
  ( (array!99495 (arr!48023 (Array (_ BitVec 32) (_ BitVec 64))) (size!48573 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99494)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99494 (_ BitVec 32)) Bool)

(assert (=> b!1484548 (= res!1009323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647797 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1484549 () Bool)

(declare-datatypes ((SeekEntryResult!12263 0))(
  ( (MissingZero!12263 (index!51444 (_ BitVec 32))) (Found!12263 (index!51445 (_ BitVec 32))) (Intermediate!12263 (undefined!13075 Bool) (index!51446 (_ BitVec 32)) (x!133027 (_ BitVec 32))) (Undefined!12263) (MissingVacant!12263 (index!51447 (_ BitVec 32))) )
))
(declare-fun lt!647802 () SeekEntryResult!12263)

(declare-fun lt!647799 () array!99494)

(declare-fun e!832328 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99494 (_ BitVec 32)) SeekEntryResult!12263)

(assert (=> b!1484549 (= e!832328 (= lt!647802 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647797 lt!647799 mask!2687)))))

(declare-fun b!1484551 () Bool)

(declare-fun res!1009328 () Bool)

(assert (=> b!1484551 (=> (not res!1009328) (not e!832335))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484551 (= res!1009328 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48573 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48573 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48573 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484552 () Bool)

(declare-fun e!832334 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99494 (_ BitVec 32)) SeekEntryResult!12263)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99494 (_ BitVec 32)) SeekEntryResult!12263)

(assert (=> b!1484552 (= e!832334 (= (seekEntryOrOpen!0 lt!647797 lt!647799 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647797 lt!647799 mask!2687)))))

(declare-fun b!1484553 () Bool)

(declare-fun res!1009333 () Bool)

(assert (=> b!1484553 (=> (not res!1009333) (not e!832335))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484553 (= res!1009333 (validKeyInArray!0 (select (arr!48023 a!2862) i!1006)))))

(declare-fun b!1484554 () Bool)

(declare-fun e!832332 () Bool)

(declare-fun e!832336 () Bool)

(assert (=> b!1484554 (= e!832332 (not e!832336))))

(declare-fun res!1009319 () Bool)

(assert (=> b!1484554 (=> res!1009319 e!832336)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1484554 (= res!1009319 (or (and (= (select (arr!48023 a!2862) index!646) (select (store (arr!48023 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48023 a!2862) index!646) (select (arr!48023 a!2862) j!93))) (= (select (arr!48023 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832331 () Bool)

(assert (=> b!1484554 e!832331))

(declare-fun res!1009326 () Bool)

(assert (=> b!1484554 (=> (not res!1009326) (not e!832331))))

(assert (=> b!1484554 (= res!1009326 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49866 0))(
  ( (Unit!49867) )
))
(declare-fun lt!647796 () Unit!49866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49866)

(assert (=> b!1484554 (= lt!647796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484555 () Bool)

(declare-fun e!832337 () Bool)

(declare-fun e!832330 () Bool)

(assert (=> b!1484555 (= e!832337 e!832330)))

(declare-fun res!1009331 () Bool)

(assert (=> b!1484555 (=> (not res!1009331) (not e!832330))))

(declare-fun lt!647800 () SeekEntryResult!12263)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484555 (= res!1009331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48023 a!2862) j!93) mask!2687) (select (arr!48023 a!2862) j!93) a!2862 mask!2687) lt!647800))))

(assert (=> b!1484555 (= lt!647800 (Intermediate!12263 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484556 () Bool)

(declare-fun res!1009322 () Bool)

(assert (=> b!1484556 (=> (not res!1009322) (not e!832335))))

(assert (=> b!1484556 (= res!1009322 (validKeyInArray!0 (select (arr!48023 a!2862) j!93)))))

(declare-fun b!1484557 () Bool)

(declare-fun res!1009318 () Bool)

(assert (=> b!1484557 (=> (not res!1009318) (not e!832335))))

(assert (=> b!1484557 (= res!1009318 (and (= (size!48573 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48573 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48573 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484558 () Bool)

(declare-fun res!1009316 () Bool)

(assert (=> b!1484558 (=> (not res!1009316) (not e!832332))))

(assert (=> b!1484558 (= res!1009316 e!832328)))

(declare-fun c!137139 () Bool)

(assert (=> b!1484558 (= c!137139 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484559 () Bool)

(declare-fun res!1009320 () Bool)

(assert (=> b!1484559 (=> (not res!1009320) (not e!832331))))

(assert (=> b!1484559 (= res!1009320 (= (seekEntryOrOpen!0 (select (arr!48023 a!2862) j!93) a!2862 mask!2687) (Found!12263 j!93)))))

(declare-fun res!1009332 () Bool)

(assert (=> start!126532 (=> (not res!1009332) (not e!832335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126532 (= res!1009332 (validMask!0 mask!2687))))

(assert (=> start!126532 e!832335))

(assert (=> start!126532 true))

(declare-fun array_inv!37051 (array!99494) Bool)

(assert (=> start!126532 (array_inv!37051 a!2862)))

(declare-fun b!1484550 () Bool)

(assert (=> b!1484550 (= e!832335 e!832337)))

(declare-fun res!1009329 () Bool)

(assert (=> b!1484550 (=> (not res!1009329) (not e!832337))))

(assert (=> b!1484550 (= res!1009329 (= (select (store (arr!48023 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484550 (= lt!647799 (array!99495 (store (arr!48023 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48573 a!2862)))))

(declare-fun b!1484560 () Bool)

(assert (=> b!1484560 (= e!832328 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647797 lt!647799 mask!2687) (seekEntryOrOpen!0 lt!647797 lt!647799 mask!2687)))))

(declare-fun b!1484561 () Bool)

(declare-fun res!1009327 () Bool)

(assert (=> b!1484561 (=> (not res!1009327) (not e!832335))))

(declare-datatypes ((List!34524 0))(
  ( (Nil!34521) (Cons!34520 (h!35894 (_ BitVec 64)) (t!49218 List!34524)) )
))
(declare-fun arrayNoDuplicates!0 (array!99494 (_ BitVec 32) List!34524) Bool)

(assert (=> b!1484561 (= res!1009327 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34521))))

(declare-fun b!1484562 () Bool)

(assert (=> b!1484562 (= e!832330 e!832332)))

(declare-fun res!1009321 () Bool)

(assert (=> b!1484562 (=> (not res!1009321) (not e!832332))))

(assert (=> b!1484562 (= res!1009321 (= lt!647802 (Intermediate!12263 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484562 (= lt!647802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647797 mask!2687) lt!647797 lt!647799 mask!2687))))

(assert (=> b!1484562 (= lt!647797 (select (store (arr!48023 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484563 () Bool)

(declare-fun res!1009317 () Bool)

(assert (=> b!1484563 (=> (not res!1009317) (not e!832332))))

(assert (=> b!1484563 (= res!1009317 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484564 () Bool)

(declare-fun e!832329 () Bool)

(assert (=> b!1484564 (= e!832329 e!832334)))

(declare-fun res!1009330 () Bool)

(assert (=> b!1484564 (=> (not res!1009330) (not e!832334))))

(declare-fun lt!647801 () (_ BitVec 64))

(assert (=> b!1484564 (= res!1009330 (and (= index!646 intermediateAfterIndex!19) (= lt!647801 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484565 () Bool)

(assert (=> b!1484565 (= e!832336 true)))

(declare-fun lt!647798 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484565 (= lt!647798 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484566 () Bool)

(declare-fun res!1009324 () Bool)

(assert (=> b!1484566 (=> (not res!1009324) (not e!832330))))

(assert (=> b!1484566 (= res!1009324 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48023 a!2862) j!93) a!2862 mask!2687) lt!647800))))

(declare-fun b!1484567 () Bool)

(declare-fun res!1009325 () Bool)

(assert (=> b!1484567 (=> (not res!1009325) (not e!832331))))

(assert (=> b!1484567 (= res!1009325 (or (= (select (arr!48023 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48023 a!2862) intermediateBeforeIndex!19) (select (arr!48023 a!2862) j!93))))))

(declare-fun b!1484568 () Bool)

(assert (=> b!1484568 (= e!832331 e!832329)))

(declare-fun res!1009315 () Bool)

(assert (=> b!1484568 (=> res!1009315 e!832329)))

(assert (=> b!1484568 (= res!1009315 (or (and (= (select (arr!48023 a!2862) index!646) lt!647801) (= (select (arr!48023 a!2862) index!646) (select (arr!48023 a!2862) j!93))) (= (select (arr!48023 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484568 (= lt!647801 (select (store (arr!48023 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(assert (= (and start!126532 res!1009332) b!1484557))

(assert (= (and b!1484557 res!1009318) b!1484553))

(assert (= (and b!1484553 res!1009333) b!1484556))

(assert (= (and b!1484556 res!1009322) b!1484548))

(assert (= (and b!1484548 res!1009323) b!1484561))

(assert (= (and b!1484561 res!1009327) b!1484551))

(assert (= (and b!1484551 res!1009328) b!1484550))

(assert (= (and b!1484550 res!1009329) b!1484555))

(assert (= (and b!1484555 res!1009331) b!1484566))

(assert (= (and b!1484566 res!1009324) b!1484562))

(assert (= (and b!1484562 res!1009321) b!1484558))

(assert (= (and b!1484558 c!137139) b!1484549))

(assert (= (and b!1484558 (not c!137139)) b!1484560))

(assert (= (and b!1484558 res!1009316) b!1484563))

(assert (= (and b!1484563 res!1009317) b!1484554))

(assert (= (and b!1484554 res!1009326) b!1484559))

(assert (= (and b!1484559 res!1009320) b!1484567))

(assert (= (and b!1484567 res!1009325) b!1484568))

(assert (= (and b!1484568 (not res!1009315)) b!1484564))

(assert (= (and b!1484564 res!1009330) b!1484552))

(assert (= (and b!1484554 (not res!1009319)) b!1484565))

(declare-fun m!1369837 () Bool)

(assert (=> b!1484567 m!1369837))

(declare-fun m!1369839 () Bool)

(assert (=> b!1484567 m!1369839))

(assert (=> b!1484556 m!1369839))

(assert (=> b!1484556 m!1369839))

(declare-fun m!1369841 () Bool)

(assert (=> b!1484556 m!1369841))

(declare-fun m!1369843 () Bool)

(assert (=> b!1484562 m!1369843))

(assert (=> b!1484562 m!1369843))

(declare-fun m!1369845 () Bool)

(assert (=> b!1484562 m!1369845))

(declare-fun m!1369847 () Bool)

(assert (=> b!1484562 m!1369847))

(declare-fun m!1369849 () Bool)

(assert (=> b!1484562 m!1369849))

(declare-fun m!1369851 () Bool)

(assert (=> b!1484552 m!1369851))

(declare-fun m!1369853 () Bool)

(assert (=> b!1484552 m!1369853))

(assert (=> b!1484550 m!1369847))

(declare-fun m!1369855 () Bool)

(assert (=> b!1484550 m!1369855))

(declare-fun m!1369857 () Bool)

(assert (=> b!1484561 m!1369857))

(declare-fun m!1369859 () Bool)

(assert (=> b!1484548 m!1369859))

(declare-fun m!1369861 () Bool)

(assert (=> b!1484568 m!1369861))

(assert (=> b!1484568 m!1369839))

(assert (=> b!1484568 m!1369847))

(declare-fun m!1369863 () Bool)

(assert (=> b!1484568 m!1369863))

(declare-fun m!1369865 () Bool)

(assert (=> b!1484549 m!1369865))

(declare-fun m!1369867 () Bool)

(assert (=> start!126532 m!1369867))

(declare-fun m!1369869 () Bool)

(assert (=> start!126532 m!1369869))

(assert (=> b!1484560 m!1369853))

(assert (=> b!1484560 m!1369851))

(declare-fun m!1369871 () Bool)

(assert (=> b!1484553 m!1369871))

(assert (=> b!1484553 m!1369871))

(declare-fun m!1369873 () Bool)

(assert (=> b!1484553 m!1369873))

(declare-fun m!1369875 () Bool)

(assert (=> b!1484554 m!1369875))

(assert (=> b!1484554 m!1369847))

(assert (=> b!1484554 m!1369863))

(assert (=> b!1484554 m!1369861))

(declare-fun m!1369877 () Bool)

(assert (=> b!1484554 m!1369877))

(assert (=> b!1484554 m!1369839))

(assert (=> b!1484559 m!1369839))

(assert (=> b!1484559 m!1369839))

(declare-fun m!1369879 () Bool)

(assert (=> b!1484559 m!1369879))

(declare-fun m!1369881 () Bool)

(assert (=> b!1484565 m!1369881))

(assert (=> b!1484555 m!1369839))

(assert (=> b!1484555 m!1369839))

(declare-fun m!1369883 () Bool)

(assert (=> b!1484555 m!1369883))

(assert (=> b!1484555 m!1369883))

(assert (=> b!1484555 m!1369839))

(declare-fun m!1369885 () Bool)

(assert (=> b!1484555 m!1369885))

(assert (=> b!1484566 m!1369839))

(assert (=> b!1484566 m!1369839))

(declare-fun m!1369887 () Bool)

(assert (=> b!1484566 m!1369887))

(push 1)

