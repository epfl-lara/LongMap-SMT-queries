; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124442 () Bool)

(assert start!124442)

(declare-fun res!972560 () Bool)

(declare-fun e!811998 () Bool)

(assert (=> start!124442 (=> (not res!972560) (not e!811998))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124442 (= res!972560 (validMask!0 mask!2687))))

(assert (=> start!124442 e!811998))

(assert (=> start!124442 true))

(declare-datatypes ((array!97868 0))(
  ( (array!97869 (arr!47223 (Array (_ BitVec 32) (_ BitVec 64))) (size!47775 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97868)

(declare-fun array_inv!36456 (array!97868) Bool)

(assert (=> start!124442 (array_inv!36456 a!2862)))

(declare-fun b!1440015 () Bool)

(declare-fun e!811997 () Bool)

(assert (=> b!1440015 (= e!811998 e!811997)))

(declare-fun res!972564 () Bool)

(assert (=> b!1440015 (=> (not res!972564) (not e!811997))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11500 0))(
  ( (MissingZero!11500 (index!48392 (_ BitVec 32))) (Found!11500 (index!48393 (_ BitVec 32))) (Intermediate!11500 (undefined!12312 Bool) (index!48394 (_ BitVec 32)) (x!130112 (_ BitVec 32))) (Undefined!11500) (MissingVacant!11500 (index!48395 (_ BitVec 32))) )
))
(declare-fun lt!632697 () SeekEntryResult!11500)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97868 (_ BitVec 32)) SeekEntryResult!11500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440015 (= res!972564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47223 a!2862) j!93) mask!2687) (select (arr!47223 a!2862) j!93) a!2862 mask!2687) lt!632697))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440015 (= lt!632697 (Intermediate!11500 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440016 () Bool)

(declare-fun res!972561 () Bool)

(assert (=> b!1440016 (=> (not res!972561) (not e!811997))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440016 (= res!972561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97869 (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47775 a!2862)) mask!2687) (Intermediate!11500 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440017 () Bool)

(declare-fun res!972562 () Bool)

(assert (=> b!1440017 (=> (not res!972562) (not e!811998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440017 (= res!972562 (validKeyInArray!0 (select (arr!47223 a!2862) j!93)))))

(declare-fun b!1440018 () Bool)

(declare-fun res!972566 () Bool)

(assert (=> b!1440018 (=> (not res!972566) (not e!811998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97868 (_ BitVec 32)) Bool)

(assert (=> b!1440018 (= res!972566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440019 () Bool)

(declare-fun res!972563 () Bool)

(assert (=> b!1440019 (=> (not res!972563) (not e!811998))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440019 (= res!972563 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47775 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47775 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47775 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440020 () Bool)

(declare-fun res!972568 () Bool)

(assert (=> b!1440020 (=> (not res!972568) (not e!811998))))

(declare-datatypes ((List!33802 0))(
  ( (Nil!33799) (Cons!33798 (h!35148 (_ BitVec 64)) (t!48488 List!33802)) )
))
(declare-fun arrayNoDuplicates!0 (array!97868 (_ BitVec 32) List!33802) Bool)

(assert (=> b!1440020 (= res!972568 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33799))))

(declare-fun b!1440021 () Bool)

(declare-fun res!972565 () Bool)

(assert (=> b!1440021 (=> (not res!972565) (not e!811997))))

(assert (=> b!1440021 (= res!972565 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47223 a!2862) j!93) a!2862 mask!2687) lt!632697))))

(declare-fun b!1440022 () Bool)

(declare-fun res!972559 () Bool)

(assert (=> b!1440022 (=> (not res!972559) (not e!811998))))

(assert (=> b!1440022 (= res!972559 (and (= (size!47775 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47775 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47775 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440023 () Bool)

(assert (=> b!1440023 (= e!811997 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440024 () Bool)

(declare-fun res!972567 () Bool)

(assert (=> b!1440024 (=> (not res!972567) (not e!811998))))

(assert (=> b!1440024 (= res!972567 (validKeyInArray!0 (select (arr!47223 a!2862) i!1006)))))

(assert (= (and start!124442 res!972560) b!1440022))

(assert (= (and b!1440022 res!972559) b!1440024))

(assert (= (and b!1440024 res!972567) b!1440017))

(assert (= (and b!1440017 res!972562) b!1440018))

(assert (= (and b!1440018 res!972566) b!1440020))

(assert (= (and b!1440020 res!972568) b!1440019))

(assert (= (and b!1440019 res!972563) b!1440015))

(assert (= (and b!1440015 res!972564) b!1440021))

(assert (= (and b!1440021 res!972565) b!1440016))

(assert (= (and b!1440016 res!972561) b!1440023))

(declare-fun m!1328695 () Bool)

(assert (=> start!124442 m!1328695))

(declare-fun m!1328697 () Bool)

(assert (=> start!124442 m!1328697))

(declare-fun m!1328699 () Bool)

(assert (=> b!1440019 m!1328699))

(declare-fun m!1328701 () Bool)

(assert (=> b!1440019 m!1328701))

(declare-fun m!1328703 () Bool)

(assert (=> b!1440021 m!1328703))

(assert (=> b!1440021 m!1328703))

(declare-fun m!1328705 () Bool)

(assert (=> b!1440021 m!1328705))

(declare-fun m!1328707 () Bool)

(assert (=> b!1440024 m!1328707))

(assert (=> b!1440024 m!1328707))

(declare-fun m!1328709 () Bool)

(assert (=> b!1440024 m!1328709))

(assert (=> b!1440017 m!1328703))

(assert (=> b!1440017 m!1328703))

(declare-fun m!1328711 () Bool)

(assert (=> b!1440017 m!1328711))

(assert (=> b!1440015 m!1328703))

(assert (=> b!1440015 m!1328703))

(declare-fun m!1328713 () Bool)

(assert (=> b!1440015 m!1328713))

(assert (=> b!1440015 m!1328713))

(assert (=> b!1440015 m!1328703))

(declare-fun m!1328715 () Bool)

(assert (=> b!1440015 m!1328715))

(declare-fun m!1328717 () Bool)

(assert (=> b!1440018 m!1328717))

(assert (=> b!1440016 m!1328699))

(declare-fun m!1328719 () Bool)

(assert (=> b!1440016 m!1328719))

(assert (=> b!1440016 m!1328719))

(declare-fun m!1328721 () Bool)

(assert (=> b!1440016 m!1328721))

(assert (=> b!1440016 m!1328721))

(assert (=> b!1440016 m!1328719))

(declare-fun m!1328723 () Bool)

(assert (=> b!1440016 m!1328723))

(declare-fun m!1328725 () Bool)

(assert (=> b!1440020 m!1328725))

(push 1)

(assert (not b!1440024))

(assert (not b!1440017))

(assert (not b!1440018))

(assert (not b!1440020))

(assert (not start!124442))

(assert (not b!1440021))

(assert (not b!1440015))

(assert (not b!1440016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

