; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124220 () Bool)

(assert start!124220)

(declare-fun b!1437494 () Bool)

(declare-fun res!969615 () Bool)

(declare-fun e!811338 () Bool)

(assert (=> b!1437494 (=> (not res!969615) (not e!811338))))

(declare-datatypes ((array!97777 0))(
  ( (array!97778 (arr!47182 (Array (_ BitVec 32) (_ BitVec 64))) (size!47733 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97777)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437494 (= res!969615 (validKeyInArray!0 (select (arr!47182 a!2862) i!1006)))))

(declare-fun b!1437495 () Bool)

(declare-fun res!969616 () Bool)

(assert (=> b!1437495 (=> (not res!969616) (not e!811338))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97777 (_ BitVec 32)) Bool)

(assert (=> b!1437495 (= res!969616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437497 () Bool)

(declare-fun res!969617 () Bool)

(assert (=> b!1437497 (=> (not res!969617) (not e!811338))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1437497 (= res!969617 (and (= (size!47733 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47733 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47733 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437498 () Bool)

(declare-fun res!969618 () Bool)

(assert (=> b!1437498 (=> (not res!969618) (not e!811338))))

(assert (=> b!1437498 (= res!969618 (validKeyInArray!0 (select (arr!47182 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1437499 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437499 (= e!811338 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47733 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47733 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47733 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47182 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun res!969619 () Bool)

(assert (=> start!124220 (=> (not res!969619) (not e!811338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124220 (= res!969619 (validMask!0 mask!2687))))

(assert (=> start!124220 e!811338))

(assert (=> start!124220 true))

(declare-fun array_inv!36463 (array!97777) Bool)

(assert (=> start!124220 (array_inv!36463 a!2862)))

(declare-fun b!1437496 () Bool)

(declare-fun res!969620 () Bool)

(assert (=> b!1437496 (=> (not res!969620) (not e!811338))))

(declare-datatypes ((List!33670 0))(
  ( (Nil!33667) (Cons!33666 (h!35012 (_ BitVec 64)) (t!48356 List!33670)) )
))
(declare-fun arrayNoDuplicates!0 (array!97777 (_ BitVec 32) List!33670) Bool)

(assert (=> b!1437496 (= res!969620 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33667))))

(assert (= (and start!124220 res!969619) b!1437497))

(assert (= (and b!1437497 res!969617) b!1437494))

(assert (= (and b!1437494 res!969615) b!1437498))

(assert (= (and b!1437498 res!969618) b!1437495))

(assert (= (and b!1437495 res!969616) b!1437496))

(assert (= (and b!1437496 res!969620) b!1437499))

(declare-fun m!1326949 () Bool)

(assert (=> b!1437495 m!1326949))

(declare-fun m!1326951 () Bool)

(assert (=> b!1437494 m!1326951))

(assert (=> b!1437494 m!1326951))

(declare-fun m!1326953 () Bool)

(assert (=> b!1437494 m!1326953))

(declare-fun m!1326955 () Bool)

(assert (=> b!1437496 m!1326955))

(declare-fun m!1326957 () Bool)

(assert (=> b!1437499 m!1326957))

(declare-fun m!1326959 () Bool)

(assert (=> b!1437499 m!1326959))

(declare-fun m!1326961 () Bool)

(assert (=> start!124220 m!1326961))

(declare-fun m!1326963 () Bool)

(assert (=> start!124220 m!1326963))

(declare-fun m!1326965 () Bool)

(assert (=> b!1437498 m!1326965))

(assert (=> b!1437498 m!1326965))

(declare-fun m!1326967 () Bool)

(assert (=> b!1437498 m!1326967))

(check-sat (not b!1437494) (not b!1437495) (not b!1437498) (not start!124220) (not b!1437496))
(check-sat)
