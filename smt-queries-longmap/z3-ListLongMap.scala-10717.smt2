; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125442 () Bool)

(assert start!125442)

(declare-fun b!1467534 () Bool)

(declare-fun e!824303 () Bool)

(assert (=> b!1467534 (= e!824303 false)))

(declare-fun lt!642117 () (_ BitVec 32))

(declare-datatypes ((array!98890 0))(
  ( (array!98891 (arr!47733 (Array (_ BitVec 32) (_ BitVec 64))) (size!48283 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98890)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467534 (= lt!642117 (toIndex!0 (select (arr!47733 a!2862) j!93) mask!2687))))

(declare-fun b!1467535 () Bool)

(declare-fun res!996078 () Bool)

(assert (=> b!1467535 (=> (not res!996078) (not e!824303))))

(declare-datatypes ((List!34234 0))(
  ( (Nil!34231) (Cons!34230 (h!35580 (_ BitVec 64)) (t!48928 List!34234)) )
))
(declare-fun arrayNoDuplicates!0 (array!98890 (_ BitVec 32) List!34234) Bool)

(assert (=> b!1467535 (= res!996078 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34231))))

(declare-fun b!1467536 () Bool)

(declare-fun res!996077 () Bool)

(assert (=> b!1467536 (=> (not res!996077) (not e!824303))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467536 (= res!996077 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48283 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48283 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48283 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47733 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467537 () Bool)

(declare-fun res!996074 () Bool)

(assert (=> b!1467537 (=> (not res!996074) (not e!824303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467537 (= res!996074 (validKeyInArray!0 (select (arr!47733 a!2862) i!1006)))))

(declare-fun res!996073 () Bool)

(assert (=> start!125442 (=> (not res!996073) (not e!824303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125442 (= res!996073 (validMask!0 mask!2687))))

(assert (=> start!125442 e!824303))

(assert (=> start!125442 true))

(declare-fun array_inv!36761 (array!98890) Bool)

(assert (=> start!125442 (array_inv!36761 a!2862)))

(declare-fun b!1467538 () Bool)

(declare-fun res!996076 () Bool)

(assert (=> b!1467538 (=> (not res!996076) (not e!824303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98890 (_ BitVec 32)) Bool)

(assert (=> b!1467538 (= res!996076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467539 () Bool)

(declare-fun res!996079 () Bool)

(assert (=> b!1467539 (=> (not res!996079) (not e!824303))))

(assert (=> b!1467539 (= res!996079 (validKeyInArray!0 (select (arr!47733 a!2862) j!93)))))

(declare-fun b!1467540 () Bool)

(declare-fun res!996075 () Bool)

(assert (=> b!1467540 (=> (not res!996075) (not e!824303))))

(assert (=> b!1467540 (= res!996075 (and (= (size!48283 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48283 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48283 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125442 res!996073) b!1467540))

(assert (= (and b!1467540 res!996075) b!1467537))

(assert (= (and b!1467537 res!996074) b!1467539))

(assert (= (and b!1467539 res!996079) b!1467538))

(assert (= (and b!1467538 res!996076) b!1467535))

(assert (= (and b!1467535 res!996078) b!1467536))

(assert (= (and b!1467536 res!996077) b!1467534))

(declare-fun m!1354475 () Bool)

(assert (=> b!1467537 m!1354475))

(assert (=> b!1467537 m!1354475))

(declare-fun m!1354477 () Bool)

(assert (=> b!1467537 m!1354477))

(declare-fun m!1354479 () Bool)

(assert (=> b!1467539 m!1354479))

(assert (=> b!1467539 m!1354479))

(declare-fun m!1354481 () Bool)

(assert (=> b!1467539 m!1354481))

(declare-fun m!1354483 () Bool)

(assert (=> b!1467536 m!1354483))

(declare-fun m!1354485 () Bool)

(assert (=> b!1467536 m!1354485))

(declare-fun m!1354487 () Bool)

(assert (=> b!1467538 m!1354487))

(declare-fun m!1354489 () Bool)

(assert (=> start!125442 m!1354489))

(declare-fun m!1354491 () Bool)

(assert (=> start!125442 m!1354491))

(declare-fun m!1354493 () Bool)

(assert (=> b!1467535 m!1354493))

(assert (=> b!1467534 m!1354479))

(assert (=> b!1467534 m!1354479))

(declare-fun m!1354495 () Bool)

(assert (=> b!1467534 m!1354495))

(check-sat (not b!1467537) (not b!1467538) (not b!1467534) (not b!1467535) (not b!1467539) (not start!125442))
