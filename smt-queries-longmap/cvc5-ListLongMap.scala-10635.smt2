; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124948 () Bool)

(assert start!124948)

(declare-fun b!1452206 () Bool)

(declare-fun res!983359 () Bool)

(declare-fun e!817543 () Bool)

(assert (=> b!1452206 (=> (not res!983359) (not e!817543))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11738 0))(
  ( (MissingZero!11738 (index!49344 (_ BitVec 32))) (Found!11738 (index!49345 (_ BitVec 32))) (Intermediate!11738 (undefined!12550 Bool) (index!49346 (_ BitVec 32)) (x!130995 (_ BitVec 32))) (Undefined!11738) (MissingVacant!11738 (index!49347 (_ BitVec 32))) )
))
(declare-fun lt!636876 () SeekEntryResult!11738)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98396 0))(
  ( (array!98397 (arr!47486 (Array (_ BitVec 32) (_ BitVec 64))) (size!48036 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98396)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98396 (_ BitVec 32)) SeekEntryResult!11738)

(assert (=> b!1452206 (= res!983359 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47486 a!2862) j!93) a!2862 mask!2687) lt!636876))))

(declare-fun b!1452207 () Bool)

(declare-fun res!983351 () Bool)

(declare-fun e!817541 () Bool)

(assert (=> b!1452207 (=> (not res!983351) (not e!817541))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452207 (= res!983351 (validKeyInArray!0 (select (arr!47486 a!2862) i!1006)))))

(declare-fun b!1452208 () Bool)

(declare-fun res!983358 () Bool)

(declare-fun e!817539 () Bool)

(assert (=> b!1452208 (=> (not res!983358) (not e!817539))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98396 (_ BitVec 32)) SeekEntryResult!11738)

(assert (=> b!1452208 (= res!983358 (= (seekEntryOrOpen!0 (select (arr!47486 a!2862) j!93) a!2862 mask!2687) (Found!11738 j!93)))))

(declare-fun res!983365 () Bool)

(assert (=> start!124948 (=> (not res!983365) (not e!817541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124948 (= res!983365 (validMask!0 mask!2687))))

(assert (=> start!124948 e!817541))

(assert (=> start!124948 true))

(declare-fun array_inv!36514 (array!98396) Bool)

(assert (=> start!124948 (array_inv!36514 a!2862)))

(declare-fun b!1452209 () Bool)

(declare-fun res!983352 () Bool)

(assert (=> b!1452209 (=> (not res!983352) (not e!817541))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452209 (= res!983352 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48036 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48036 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48036 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452210 () Bool)

(declare-fun res!983356 () Bool)

(assert (=> b!1452210 (=> (not res!983356) (not e!817541))))

(declare-datatypes ((List!33987 0))(
  ( (Nil!33984) (Cons!33983 (h!35333 (_ BitVec 64)) (t!48681 List!33987)) )
))
(declare-fun arrayNoDuplicates!0 (array!98396 (_ BitVec 32) List!33987) Bool)

(assert (=> b!1452210 (= res!983356 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33984))))

(declare-fun b!1452211 () Bool)

(declare-fun res!983357 () Bool)

(assert (=> b!1452211 (=> (not res!983357) (not e!817541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98396 (_ BitVec 32)) Bool)

(assert (=> b!1452211 (= res!983357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452212 () Bool)

(declare-fun lt!636879 () array!98396)

(declare-fun lt!636875 () (_ BitVec 64))

(declare-fun lt!636877 () SeekEntryResult!11738)

(declare-fun e!817544 () Bool)

(assert (=> b!1452212 (= e!817544 (= lt!636877 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636875 lt!636879 mask!2687)))))

(declare-fun b!1452213 () Bool)

(declare-fun res!983361 () Bool)

(declare-fun e!817540 () Bool)

(assert (=> b!1452213 (=> (not res!983361) (not e!817540))))

(assert (=> b!1452213 (= res!983361 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452214 () Bool)

(declare-fun e!817538 () Bool)

(assert (=> b!1452214 (= e!817538 e!817543)))

(declare-fun res!983362 () Bool)

(assert (=> b!1452214 (=> (not res!983362) (not e!817543))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452214 (= res!983362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47486 a!2862) j!93) mask!2687) (select (arr!47486 a!2862) j!93) a!2862 mask!2687) lt!636876))))

(assert (=> b!1452214 (= lt!636876 (Intermediate!11738 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452215 () Bool)

(declare-fun res!983360 () Bool)

(assert (=> b!1452215 (=> (not res!983360) (not e!817541))))

(assert (=> b!1452215 (= res!983360 (validKeyInArray!0 (select (arr!47486 a!2862) j!93)))))

(declare-fun b!1452216 () Bool)

(assert (=> b!1452216 (= e!817540 (not (or (and (= (select (arr!47486 a!2862) index!646) (select (store (arr!47486 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47486 a!2862) index!646) (select (arr!47486 a!2862) j!93))) (= (select (arr!47486 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1452216 e!817539))

(declare-fun res!983363 () Bool)

(assert (=> b!1452216 (=> (not res!983363) (not e!817539))))

(assert (=> b!1452216 (= res!983363 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48972 0))(
  ( (Unit!48973) )
))
(declare-fun lt!636878 () Unit!48972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48972)

(assert (=> b!1452216 (= lt!636878 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452217 () Bool)

(declare-fun res!983353 () Bool)

(assert (=> b!1452217 (=> (not res!983353) (not e!817540))))

(assert (=> b!1452217 (= res!983353 e!817544)))

(declare-fun c!133938 () Bool)

(assert (=> b!1452217 (= c!133938 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452218 () Bool)

(assert (=> b!1452218 (= e!817541 e!817538)))

(declare-fun res!983355 () Bool)

(assert (=> b!1452218 (=> (not res!983355) (not e!817538))))

(assert (=> b!1452218 (= res!983355 (= (select (store (arr!47486 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452218 (= lt!636879 (array!98397 (store (arr!47486 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48036 a!2862)))))

(declare-fun b!1452219 () Bool)

(assert (=> b!1452219 (= e!817543 e!817540)))

(declare-fun res!983354 () Bool)

(assert (=> b!1452219 (=> (not res!983354) (not e!817540))))

(assert (=> b!1452219 (= res!983354 (= lt!636877 (Intermediate!11738 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452219 (= lt!636877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636875 mask!2687) lt!636875 lt!636879 mask!2687))))

(assert (=> b!1452219 (= lt!636875 (select (store (arr!47486 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452220 () Bool)

(assert (=> b!1452220 (= e!817539 (and (or (= (select (arr!47486 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47486 a!2862) intermediateBeforeIndex!19) (select (arr!47486 a!2862) j!93))) (or (and (= (select (arr!47486 a!2862) index!646) (select (store (arr!47486 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47486 a!2862) index!646) (select (arr!47486 a!2862) j!93))) (= (select (arr!47486 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47486 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452221 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98396 (_ BitVec 32)) SeekEntryResult!11738)

(assert (=> b!1452221 (= e!817544 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636875 lt!636879 mask!2687) (seekEntryOrOpen!0 lt!636875 lt!636879 mask!2687)))))

(declare-fun b!1452222 () Bool)

(declare-fun res!983364 () Bool)

(assert (=> b!1452222 (=> (not res!983364) (not e!817541))))

(assert (=> b!1452222 (= res!983364 (and (= (size!48036 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48036 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48036 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124948 res!983365) b!1452222))

(assert (= (and b!1452222 res!983364) b!1452207))

(assert (= (and b!1452207 res!983351) b!1452215))

(assert (= (and b!1452215 res!983360) b!1452211))

(assert (= (and b!1452211 res!983357) b!1452210))

(assert (= (and b!1452210 res!983356) b!1452209))

(assert (= (and b!1452209 res!983352) b!1452218))

(assert (= (and b!1452218 res!983355) b!1452214))

(assert (= (and b!1452214 res!983362) b!1452206))

(assert (= (and b!1452206 res!983359) b!1452219))

(assert (= (and b!1452219 res!983354) b!1452217))

(assert (= (and b!1452217 c!133938) b!1452212))

(assert (= (and b!1452217 (not c!133938)) b!1452221))

(assert (= (and b!1452217 res!983353) b!1452213))

(assert (= (and b!1452213 res!983361) b!1452216))

(assert (= (and b!1452216 res!983363) b!1452208))

(assert (= (and b!1452208 res!983358) b!1452220))

(declare-fun m!1340785 () Bool)

(assert (=> b!1452211 m!1340785))

(declare-fun m!1340787 () Bool)

(assert (=> b!1452214 m!1340787))

(assert (=> b!1452214 m!1340787))

(declare-fun m!1340789 () Bool)

(assert (=> b!1452214 m!1340789))

(assert (=> b!1452214 m!1340789))

(assert (=> b!1452214 m!1340787))

(declare-fun m!1340791 () Bool)

(assert (=> b!1452214 m!1340791))

(declare-fun m!1340793 () Bool)

(assert (=> b!1452221 m!1340793))

(declare-fun m!1340795 () Bool)

(assert (=> b!1452221 m!1340795))

(assert (=> b!1452208 m!1340787))

(assert (=> b!1452208 m!1340787))

(declare-fun m!1340797 () Bool)

(assert (=> b!1452208 m!1340797))

(declare-fun m!1340799 () Bool)

(assert (=> b!1452212 m!1340799))

(declare-fun m!1340801 () Bool)

(assert (=> b!1452218 m!1340801))

(declare-fun m!1340803 () Bool)

(assert (=> b!1452218 m!1340803))

(assert (=> b!1452220 m!1340801))

(declare-fun m!1340805 () Bool)

(assert (=> b!1452220 m!1340805))

(declare-fun m!1340807 () Bool)

(assert (=> b!1452220 m!1340807))

(declare-fun m!1340809 () Bool)

(assert (=> b!1452220 m!1340809))

(assert (=> b!1452220 m!1340787))

(declare-fun m!1340811 () Bool)

(assert (=> b!1452210 m!1340811))

(declare-fun m!1340813 () Bool)

(assert (=> b!1452216 m!1340813))

(assert (=> b!1452216 m!1340801))

(assert (=> b!1452216 m!1340807))

(assert (=> b!1452216 m!1340809))

(declare-fun m!1340815 () Bool)

(assert (=> b!1452216 m!1340815))

(assert (=> b!1452216 m!1340787))

(declare-fun m!1340817 () Bool)

(assert (=> b!1452219 m!1340817))

(assert (=> b!1452219 m!1340817))

(declare-fun m!1340819 () Bool)

(assert (=> b!1452219 m!1340819))

(assert (=> b!1452219 m!1340801))

(declare-fun m!1340821 () Bool)

(assert (=> b!1452219 m!1340821))

(assert (=> b!1452206 m!1340787))

(assert (=> b!1452206 m!1340787))

(declare-fun m!1340823 () Bool)

(assert (=> b!1452206 m!1340823))

(declare-fun m!1340825 () Bool)

(assert (=> start!124948 m!1340825))

(declare-fun m!1340827 () Bool)

(assert (=> start!124948 m!1340827))

(assert (=> b!1452215 m!1340787))

(assert (=> b!1452215 m!1340787))

(declare-fun m!1340829 () Bool)

(assert (=> b!1452215 m!1340829))

(declare-fun m!1340831 () Bool)

(assert (=> b!1452207 m!1340831))

(assert (=> b!1452207 m!1340831))

(declare-fun m!1340833 () Bool)

(assert (=> b!1452207 m!1340833))

(push 1)

(assert (not b!1452215))

(assert (not b!1452221))

(assert (not b!1452211))

(assert (not b!1452214))

(assert (not b!1452208))

(assert (not b!1452207))

(assert (not b!1452206))

(assert (not b!1452212))

(assert (not b!1452219))

(assert (not b!1452210))

(assert (not start!124948))

(assert (not b!1452216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

