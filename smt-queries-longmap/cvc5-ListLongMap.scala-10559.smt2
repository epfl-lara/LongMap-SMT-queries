; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124492 () Bool)

(assert start!124492)

(declare-fun b!1440494 () Bool)

(declare-fun res!972926 () Bool)

(declare-fun e!812202 () Bool)

(assert (=> b!1440494 (=> (not res!972926) (not e!812202))))

(declare-datatypes ((array!97940 0))(
  ( (array!97941 (arr!47258 (Array (_ BitVec 32) (_ BitVec 64))) (size!47808 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97940)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440494 (= res!972926 (validKeyInArray!0 (select (arr!47258 a!2862) i!1006)))))

(declare-fun b!1440495 () Bool)

(declare-fun res!972930 () Bool)

(declare-fun e!812204 () Bool)

(assert (=> b!1440495 (=> (not res!972930) (not e!812204))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11510 0))(
  ( (MissingZero!11510 (index!48432 (_ BitVec 32))) (Found!11510 (index!48433 (_ BitVec 32))) (Intermediate!11510 (undefined!12322 Bool) (index!48434 (_ BitVec 32)) (x!130159 (_ BitVec 32))) (Undefined!11510) (MissingVacant!11510 (index!48435 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97940 (_ BitVec 32)) SeekEntryResult!11510)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440495 (= res!972930 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47258 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47258 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97941 (store (arr!47258 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47808 a!2862)) mask!2687) (Intermediate!11510 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun res!972921 () Bool)

(assert (=> start!124492 (=> (not res!972921) (not e!812202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124492 (= res!972921 (validMask!0 mask!2687))))

(assert (=> start!124492 e!812202))

(assert (=> start!124492 true))

(declare-fun array_inv!36286 (array!97940) Bool)

(assert (=> start!124492 (array_inv!36286 a!2862)))

(declare-fun b!1440496 () Bool)

(declare-fun res!972922 () Bool)

(assert (=> b!1440496 (=> (not res!972922) (not e!812202))))

(assert (=> b!1440496 (= res!972922 (and (= (size!47808 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47808 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47808 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440497 () Bool)

(declare-fun res!972929 () Bool)

(assert (=> b!1440497 (=> (not res!972929) (not e!812202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97940 (_ BitVec 32)) Bool)

(assert (=> b!1440497 (= res!972929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440498 () Bool)

(declare-fun res!972928 () Bool)

(assert (=> b!1440498 (=> (not res!972928) (not e!812202))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440498 (= res!972928 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47808 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47808 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47808 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47258 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440499 () Bool)

(declare-fun res!972931 () Bool)

(assert (=> b!1440499 (=> (not res!972931) (not e!812202))))

(assert (=> b!1440499 (= res!972931 (validKeyInArray!0 (select (arr!47258 a!2862) j!93)))))

(declare-fun b!1440500 () Bool)

(declare-fun res!972924 () Bool)

(assert (=> b!1440500 (=> (not res!972924) (not e!812204))))

(assert (=> b!1440500 (= res!972924 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440501 () Bool)

(declare-fun res!972925 () Bool)

(assert (=> b!1440501 (=> (not res!972925) (not e!812204))))

(declare-fun lt!632979 () SeekEntryResult!11510)

(assert (=> b!1440501 (= res!972925 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47258 a!2862) j!93) a!2862 mask!2687) lt!632979))))

(declare-fun b!1440502 () Bool)

(assert (=> b!1440502 (= e!812202 e!812204)))

(declare-fun res!972923 () Bool)

(assert (=> b!1440502 (=> (not res!972923) (not e!812204))))

(assert (=> b!1440502 (= res!972923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47258 a!2862) j!93) mask!2687) (select (arr!47258 a!2862) j!93) a!2862 mask!2687) lt!632979))))

(assert (=> b!1440502 (= lt!632979 (Intermediate!11510 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440503 () Bool)

(declare-fun res!972927 () Bool)

(assert (=> b!1440503 (=> (not res!972927) (not e!812202))))

(declare-datatypes ((List!33759 0))(
  ( (Nil!33756) (Cons!33755 (h!35105 (_ BitVec 64)) (t!48453 List!33759)) )
))
(declare-fun arrayNoDuplicates!0 (array!97940 (_ BitVec 32) List!33759) Bool)

(assert (=> b!1440503 (= res!972927 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33756))))

(declare-fun b!1440504 () Bool)

(assert (=> b!1440504 (= e!812204 (not (validKeyInArray!0 (select (store (arr!47258 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(assert (= (and start!124492 res!972921) b!1440496))

(assert (= (and b!1440496 res!972922) b!1440494))

(assert (= (and b!1440494 res!972926) b!1440499))

(assert (= (and b!1440499 res!972931) b!1440497))

(assert (= (and b!1440497 res!972929) b!1440503))

(assert (= (and b!1440503 res!972927) b!1440498))

(assert (= (and b!1440498 res!972928) b!1440502))

(assert (= (and b!1440502 res!972923) b!1440501))

(assert (= (and b!1440501 res!972925) b!1440495))

(assert (= (and b!1440495 res!972930) b!1440500))

(assert (= (and b!1440500 res!972924) b!1440504))

(declare-fun m!1329691 () Bool)

(assert (=> b!1440503 m!1329691))

(declare-fun m!1329693 () Bool)

(assert (=> b!1440497 m!1329693))

(declare-fun m!1329695 () Bool)

(assert (=> b!1440502 m!1329695))

(assert (=> b!1440502 m!1329695))

(declare-fun m!1329697 () Bool)

(assert (=> b!1440502 m!1329697))

(assert (=> b!1440502 m!1329697))

(assert (=> b!1440502 m!1329695))

(declare-fun m!1329699 () Bool)

(assert (=> b!1440502 m!1329699))

(assert (=> b!1440501 m!1329695))

(assert (=> b!1440501 m!1329695))

(declare-fun m!1329701 () Bool)

(assert (=> b!1440501 m!1329701))

(assert (=> b!1440499 m!1329695))

(assert (=> b!1440499 m!1329695))

(declare-fun m!1329703 () Bool)

(assert (=> b!1440499 m!1329703))

(declare-fun m!1329705 () Bool)

(assert (=> start!124492 m!1329705))

(declare-fun m!1329707 () Bool)

(assert (=> start!124492 m!1329707))

(declare-fun m!1329709 () Bool)

(assert (=> b!1440504 m!1329709))

(declare-fun m!1329711 () Bool)

(assert (=> b!1440504 m!1329711))

(assert (=> b!1440504 m!1329711))

(declare-fun m!1329713 () Bool)

(assert (=> b!1440504 m!1329713))

(declare-fun m!1329715 () Bool)

(assert (=> b!1440494 m!1329715))

(assert (=> b!1440494 m!1329715))

(declare-fun m!1329717 () Bool)

(assert (=> b!1440494 m!1329717))

(assert (=> b!1440498 m!1329709))

(declare-fun m!1329719 () Bool)

(assert (=> b!1440498 m!1329719))

(assert (=> b!1440495 m!1329709))

(assert (=> b!1440495 m!1329711))

(assert (=> b!1440495 m!1329711))

(declare-fun m!1329721 () Bool)

(assert (=> b!1440495 m!1329721))

(assert (=> b!1440495 m!1329721))

(assert (=> b!1440495 m!1329711))

(declare-fun m!1329723 () Bool)

(assert (=> b!1440495 m!1329723))

(push 1)

