; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125414 () Bool)

(assert start!125414)

(declare-fun b!1467360 () Bool)

(declare-fun res!996020 () Bool)

(declare-fun e!824192 () Bool)

(assert (=> b!1467360 (=> (not res!996020) (not e!824192))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98840 0))(
  ( (array!98841 (arr!47709 (Array (_ BitVec 32) (_ BitVec 64))) (size!48261 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98840)

(assert (=> b!1467360 (= res!996020 (and (= (size!48261 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48261 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48261 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!996019 () Bool)

(assert (=> start!125414 (=> (not res!996019) (not e!824192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125414 (= res!996019 (validMask!0 mask!2687))))

(assert (=> start!125414 e!824192))

(assert (=> start!125414 true))

(declare-fun array_inv!36942 (array!98840) Bool)

(assert (=> start!125414 (array_inv!36942 a!2862)))

(declare-fun b!1467361 () Bool)

(declare-fun res!996016 () Bool)

(assert (=> b!1467361 (=> (not res!996016) (not e!824192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98840 (_ BitVec 32)) Bool)

(assert (=> b!1467361 (= res!996016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467362 () Bool)

(declare-fun res!996018 () Bool)

(assert (=> b!1467362 (=> (not res!996018) (not e!824192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467362 (= res!996018 (validKeyInArray!0 (select (arr!47709 a!2862) i!1006)))))

(declare-fun b!1467363 () Bool)

(assert (=> b!1467363 (= e!824192 false)))

(declare-fun lt!641886 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467363 (= lt!641886 (toIndex!0 (select (arr!47709 a!2862) j!93) mask!2687))))

(declare-fun b!1467364 () Bool)

(declare-fun res!996022 () Bool)

(assert (=> b!1467364 (=> (not res!996022) (not e!824192))))

(declare-datatypes ((List!34288 0))(
  ( (Nil!34285) (Cons!34284 (h!35634 (_ BitVec 64)) (t!48974 List!34288)) )
))
(declare-fun arrayNoDuplicates!0 (array!98840 (_ BitVec 32) List!34288) Bool)

(assert (=> b!1467364 (= res!996022 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34285))))

(declare-fun b!1467365 () Bool)

(declare-fun res!996021 () Bool)

(assert (=> b!1467365 (=> (not res!996021) (not e!824192))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467365 (= res!996021 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48261 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48261 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48261 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47709 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467366 () Bool)

(declare-fun res!996017 () Bool)

(assert (=> b!1467366 (=> (not res!996017) (not e!824192))))

(assert (=> b!1467366 (= res!996017 (validKeyInArray!0 (select (arr!47709 a!2862) j!93)))))

(assert (= (and start!125414 res!996019) b!1467360))

(assert (= (and b!1467360 res!996020) b!1467362))

(assert (= (and b!1467362 res!996018) b!1467366))

(assert (= (and b!1467366 res!996017) b!1467361))

(assert (= (and b!1467361 res!996016) b!1467364))

(assert (= (and b!1467364 res!996022) b!1467365))

(assert (= (and b!1467365 res!996021) b!1467363))

(declare-fun m!1353821 () Bool)

(assert (=> b!1467362 m!1353821))

(assert (=> b!1467362 m!1353821))

(declare-fun m!1353823 () Bool)

(assert (=> b!1467362 m!1353823))

(declare-fun m!1353825 () Bool)

(assert (=> b!1467365 m!1353825))

(declare-fun m!1353827 () Bool)

(assert (=> b!1467365 m!1353827))

(declare-fun m!1353829 () Bool)

(assert (=> start!125414 m!1353829))

(declare-fun m!1353831 () Bool)

(assert (=> start!125414 m!1353831))

(declare-fun m!1353833 () Bool)

(assert (=> b!1467364 m!1353833))

(declare-fun m!1353835 () Bool)

(assert (=> b!1467361 m!1353835))

(declare-fun m!1353837 () Bool)

(assert (=> b!1467366 m!1353837))

(assert (=> b!1467366 m!1353837))

(declare-fun m!1353839 () Bool)

(assert (=> b!1467366 m!1353839))

(assert (=> b!1467363 m!1353837))

(assert (=> b!1467363 m!1353837))

(declare-fun m!1353841 () Bool)

(assert (=> b!1467363 m!1353841))

(push 1)

(assert (not b!1467361))

(assert (not b!1467364))

(assert (not b!1467363))

(assert (not start!125414))

(assert (not b!1467362))

(assert (not b!1467366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

