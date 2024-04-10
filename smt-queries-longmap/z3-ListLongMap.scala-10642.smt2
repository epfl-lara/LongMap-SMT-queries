; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124992 () Bool)

(assert start!124992)

(declare-fun b!1453406 () Bool)

(declare-fun res!984434 () Bool)

(declare-fun e!818059 () Bool)

(assert (=> b!1453406 (=> (not res!984434) (not e!818059))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453406 (= res!984434 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!984420 () Bool)

(declare-fun e!818063 () Bool)

(assert (=> start!124992 (=> (not res!984420) (not e!818063))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124992 (= res!984420 (validMask!0 mask!2687))))

(assert (=> start!124992 e!818063))

(assert (=> start!124992 true))

(declare-datatypes ((array!98440 0))(
  ( (array!98441 (arr!47508 (Array (_ BitVec 32) (_ BitVec 64))) (size!48058 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98440)

(declare-fun array_inv!36536 (array!98440) Bool)

(assert (=> start!124992 (array_inv!36536 a!2862)))

(declare-fun b!1453407 () Bool)

(declare-fun e!818062 () Bool)

(assert (=> b!1453407 (= e!818063 e!818062)))

(declare-fun res!984432 () Bool)

(assert (=> b!1453407 (=> (not res!984432) (not e!818062))))

(assert (=> b!1453407 (= res!984432 (= (select (store (arr!47508 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637230 () array!98440)

(assert (=> b!1453407 (= lt!637230 (array!98441 (store (arr!47508 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48058 a!2862)))))

(declare-fun b!1453408 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!818060 () Bool)

(declare-fun lt!637231 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11760 0))(
  ( (MissingZero!11760 (index!49432 (_ BitVec 32))) (Found!11760 (index!49433 (_ BitVec 32))) (Intermediate!11760 (undefined!12572 Bool) (index!49434 (_ BitVec 32)) (x!131073 (_ BitVec 32))) (Undefined!11760) (MissingVacant!11760 (index!49435 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98440 (_ BitVec 32)) SeekEntryResult!11760)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98440 (_ BitVec 32)) SeekEntryResult!11760)

(assert (=> b!1453408 (= e!818060 (= (seekEntryOrOpen!0 lt!637231 lt!637230 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637231 lt!637230 mask!2687)))))

(declare-fun b!1453409 () Bool)

(declare-fun e!818057 () Bool)

(assert (=> b!1453409 (= e!818062 e!818057)))

(declare-fun res!984430 () Bool)

(assert (=> b!1453409 (=> (not res!984430) (not e!818057))))

(declare-fun lt!637232 () SeekEntryResult!11760)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98440 (_ BitVec 32)) SeekEntryResult!11760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453409 (= res!984430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47508 a!2862) j!93) mask!2687) (select (arr!47508 a!2862) j!93) a!2862 mask!2687) lt!637232))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453409 (= lt!637232 (Intermediate!11760 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453410 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453410 (= e!818059 (not (or (and (= (select (arr!47508 a!2862) index!646) (select (store (arr!47508 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47508 a!2862) index!646) (select (arr!47508 a!2862) j!93))) (= (select (arr!47508 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!818055 () Bool)

(assert (=> b!1453410 e!818055))

(declare-fun res!984436 () Bool)

(assert (=> b!1453410 (=> (not res!984436) (not e!818055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98440 (_ BitVec 32)) Bool)

(assert (=> b!1453410 (= res!984436 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49016 0))(
  ( (Unit!49017) )
))
(declare-fun lt!637233 () Unit!49016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49016)

(assert (=> b!1453410 (= lt!637233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453411 () Bool)

(declare-fun res!984424 () Bool)

(assert (=> b!1453411 (=> (not res!984424) (not e!818063))))

(assert (=> b!1453411 (= res!984424 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48058 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48058 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48058 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453412 () Bool)

(declare-fun res!984421 () Bool)

(assert (=> b!1453412 (=> (not res!984421) (not e!818063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453412 (= res!984421 (validKeyInArray!0 (select (arr!47508 a!2862) j!93)))))

(declare-fun b!1453413 () Bool)

(declare-fun e!818061 () Bool)

(assert (=> b!1453413 (= e!818055 e!818061)))

(declare-fun res!984428 () Bool)

(assert (=> b!1453413 (=> res!984428 e!818061)))

(declare-fun lt!637229 () (_ BitVec 64))

(assert (=> b!1453413 (= res!984428 (or (and (= (select (arr!47508 a!2862) index!646) lt!637229) (= (select (arr!47508 a!2862) index!646) (select (arr!47508 a!2862) j!93))) (= (select (arr!47508 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453413 (= lt!637229 (select (store (arr!47508 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453414 () Bool)

(declare-fun res!984426 () Bool)

(assert (=> b!1453414 (=> (not res!984426) (not e!818059))))

(declare-fun e!818056 () Bool)

(assert (=> b!1453414 (= res!984426 e!818056)))

(declare-fun c!134004 () Bool)

(assert (=> b!1453414 (= c!134004 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453415 () Bool)

(declare-fun lt!637228 () SeekEntryResult!11760)

(assert (=> b!1453415 (= e!818056 (= lt!637228 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637231 lt!637230 mask!2687)))))

(declare-fun b!1453416 () Bool)

(declare-fun res!984431 () Bool)

(assert (=> b!1453416 (=> (not res!984431) (not e!818063))))

(assert (=> b!1453416 (= res!984431 (validKeyInArray!0 (select (arr!47508 a!2862) i!1006)))))

(declare-fun b!1453417 () Bool)

(assert (=> b!1453417 (= e!818056 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637231 lt!637230 mask!2687) (seekEntryOrOpen!0 lt!637231 lt!637230 mask!2687)))))

(declare-fun b!1453418 () Bool)

(declare-fun res!984425 () Bool)

(assert (=> b!1453418 (=> (not res!984425) (not e!818063))))

(declare-datatypes ((List!34009 0))(
  ( (Nil!34006) (Cons!34005 (h!35355 (_ BitVec 64)) (t!48703 List!34009)) )
))
(declare-fun arrayNoDuplicates!0 (array!98440 (_ BitVec 32) List!34009) Bool)

(assert (=> b!1453418 (= res!984425 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34006))))

(declare-fun b!1453419 () Bool)

(declare-fun res!984429 () Bool)

(assert (=> b!1453419 (=> (not res!984429) (not e!818063))))

(assert (=> b!1453419 (= res!984429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453420 () Bool)

(assert (=> b!1453420 (= e!818057 e!818059)))

(declare-fun res!984427 () Bool)

(assert (=> b!1453420 (=> (not res!984427) (not e!818059))))

(assert (=> b!1453420 (= res!984427 (= lt!637228 (Intermediate!11760 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453420 (= lt!637228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637231 mask!2687) lt!637231 lt!637230 mask!2687))))

(assert (=> b!1453420 (= lt!637231 (select (store (arr!47508 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453421 () Bool)

(declare-fun res!984433 () Bool)

(assert (=> b!1453421 (=> (not res!984433) (not e!818063))))

(assert (=> b!1453421 (= res!984433 (and (= (size!48058 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48058 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48058 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453422 () Bool)

(declare-fun res!984423 () Bool)

(assert (=> b!1453422 (=> (not res!984423) (not e!818055))))

(assert (=> b!1453422 (= res!984423 (or (= (select (arr!47508 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47508 a!2862) intermediateBeforeIndex!19) (select (arr!47508 a!2862) j!93))))))

(declare-fun b!1453423 () Bool)

(declare-fun res!984422 () Bool)

(assert (=> b!1453423 (=> (not res!984422) (not e!818055))))

(assert (=> b!1453423 (= res!984422 (= (seekEntryOrOpen!0 (select (arr!47508 a!2862) j!93) a!2862 mask!2687) (Found!11760 j!93)))))

(declare-fun b!1453424 () Bool)

(declare-fun res!984435 () Bool)

(assert (=> b!1453424 (=> (not res!984435) (not e!818057))))

(assert (=> b!1453424 (= res!984435 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47508 a!2862) j!93) a!2862 mask!2687) lt!637232))))

(declare-fun b!1453425 () Bool)

(assert (=> b!1453425 (= e!818061 e!818060)))

(declare-fun res!984419 () Bool)

(assert (=> b!1453425 (=> (not res!984419) (not e!818060))))

(assert (=> b!1453425 (= res!984419 (and (= index!646 intermediateAfterIndex!19) (= lt!637229 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124992 res!984420) b!1453421))

(assert (= (and b!1453421 res!984433) b!1453416))

(assert (= (and b!1453416 res!984431) b!1453412))

(assert (= (and b!1453412 res!984421) b!1453419))

(assert (= (and b!1453419 res!984429) b!1453418))

(assert (= (and b!1453418 res!984425) b!1453411))

(assert (= (and b!1453411 res!984424) b!1453407))

(assert (= (and b!1453407 res!984432) b!1453409))

(assert (= (and b!1453409 res!984430) b!1453424))

(assert (= (and b!1453424 res!984435) b!1453420))

(assert (= (and b!1453420 res!984427) b!1453414))

(assert (= (and b!1453414 c!134004) b!1453415))

(assert (= (and b!1453414 (not c!134004)) b!1453417))

(assert (= (and b!1453414 res!984426) b!1453406))

(assert (= (and b!1453406 res!984434) b!1453410))

(assert (= (and b!1453410 res!984436) b!1453423))

(assert (= (and b!1453423 res!984422) b!1453422))

(assert (= (and b!1453422 res!984423) b!1453413))

(assert (= (and b!1453413 (not res!984428)) b!1453425))

(assert (= (and b!1453425 res!984419) b!1453408))

(declare-fun m!1341891 () Bool)

(assert (=> b!1453408 m!1341891))

(declare-fun m!1341893 () Bool)

(assert (=> b!1453408 m!1341893))

(declare-fun m!1341895 () Bool)

(assert (=> start!124992 m!1341895))

(declare-fun m!1341897 () Bool)

(assert (=> start!124992 m!1341897))

(declare-fun m!1341899 () Bool)

(assert (=> b!1453418 m!1341899))

(declare-fun m!1341901 () Bool)

(assert (=> b!1453422 m!1341901))

(declare-fun m!1341903 () Bool)

(assert (=> b!1453422 m!1341903))

(assert (=> b!1453424 m!1341903))

(assert (=> b!1453424 m!1341903))

(declare-fun m!1341905 () Bool)

(assert (=> b!1453424 m!1341905))

(declare-fun m!1341907 () Bool)

(assert (=> b!1453420 m!1341907))

(assert (=> b!1453420 m!1341907))

(declare-fun m!1341909 () Bool)

(assert (=> b!1453420 m!1341909))

(declare-fun m!1341911 () Bool)

(assert (=> b!1453420 m!1341911))

(declare-fun m!1341913 () Bool)

(assert (=> b!1453420 m!1341913))

(declare-fun m!1341915 () Bool)

(assert (=> b!1453410 m!1341915))

(assert (=> b!1453410 m!1341911))

(declare-fun m!1341917 () Bool)

(assert (=> b!1453410 m!1341917))

(declare-fun m!1341919 () Bool)

(assert (=> b!1453410 m!1341919))

(declare-fun m!1341921 () Bool)

(assert (=> b!1453410 m!1341921))

(assert (=> b!1453410 m!1341903))

(assert (=> b!1453423 m!1341903))

(assert (=> b!1453423 m!1341903))

(declare-fun m!1341923 () Bool)

(assert (=> b!1453423 m!1341923))

(assert (=> b!1453412 m!1341903))

(assert (=> b!1453412 m!1341903))

(declare-fun m!1341925 () Bool)

(assert (=> b!1453412 m!1341925))

(assert (=> b!1453407 m!1341911))

(declare-fun m!1341927 () Bool)

(assert (=> b!1453407 m!1341927))

(assert (=> b!1453409 m!1341903))

(assert (=> b!1453409 m!1341903))

(declare-fun m!1341929 () Bool)

(assert (=> b!1453409 m!1341929))

(assert (=> b!1453409 m!1341929))

(assert (=> b!1453409 m!1341903))

(declare-fun m!1341931 () Bool)

(assert (=> b!1453409 m!1341931))

(declare-fun m!1341933 () Bool)

(assert (=> b!1453419 m!1341933))

(declare-fun m!1341935 () Bool)

(assert (=> b!1453416 m!1341935))

(assert (=> b!1453416 m!1341935))

(declare-fun m!1341937 () Bool)

(assert (=> b!1453416 m!1341937))

(declare-fun m!1341939 () Bool)

(assert (=> b!1453415 m!1341939))

(assert (=> b!1453413 m!1341919))

(assert (=> b!1453413 m!1341903))

(assert (=> b!1453413 m!1341911))

(assert (=> b!1453413 m!1341917))

(assert (=> b!1453417 m!1341893))

(assert (=> b!1453417 m!1341891))

(check-sat (not start!124992) (not b!1453415) (not b!1453418) (not b!1453416) (not b!1453410) (not b!1453419) (not b!1453420) (not b!1453408) (not b!1453412) (not b!1453423) (not b!1453424) (not b!1453417) (not b!1453409))
(check-sat)
