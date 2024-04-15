; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124088 () Bool)

(assert start!124088)

(declare-fun b!1436652 () Bool)

(declare-fun res!969653 () Bool)

(declare-fun e!810657 () Bool)

(assert (=> b!1436652 (=> (not res!969653) (not e!810657))))

(declare-datatypes ((array!97670 0))(
  ( (array!97671 (arr!47130 (Array (_ BitVec 32) (_ BitVec 64))) (size!47682 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97670)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97670 (_ BitVec 32)) Bool)

(assert (=> b!1436652 (= res!969653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436653 () Bool)

(declare-fun res!969657 () Bool)

(assert (=> b!1436653 (=> (not res!969657) (not e!810657))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436653 (= res!969657 (validKeyInArray!0 (select (arr!47130 a!2862) j!93)))))

(declare-fun res!969652 () Bool)

(assert (=> start!124088 (=> (not res!969652) (not e!810657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124088 (= res!969652 (validMask!0 mask!2687))))

(assert (=> start!124088 e!810657))

(assert (=> start!124088 true))

(declare-fun array_inv!36363 (array!97670) Bool)

(assert (=> start!124088 (array_inv!36363 a!2862)))

(declare-fun b!1436654 () Bool)

(assert (=> b!1436654 (= e!810657 false)))

(declare-datatypes ((SeekEntryResult!11407 0))(
  ( (MissingZero!11407 (index!48020 (_ BitVec 32))) (Found!11407 (index!48021 (_ BitVec 32))) (Intermediate!11407 (undefined!12219 Bool) (index!48022 (_ BitVec 32)) (x!129747 (_ BitVec 32))) (Undefined!11407) (MissingVacant!11407 (index!48023 (_ BitVec 32))) )
))
(declare-fun lt!631986 () SeekEntryResult!11407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97670 (_ BitVec 32)) SeekEntryResult!11407)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436654 (= lt!631986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47130 a!2862) j!93) mask!2687) (select (arr!47130 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436655 () Bool)

(declare-fun res!969654 () Bool)

(assert (=> b!1436655 (=> (not res!969654) (not e!810657))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436655 (= res!969654 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47682 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47682 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47682 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436656 () Bool)

(declare-fun res!969658 () Bool)

(assert (=> b!1436656 (=> (not res!969658) (not e!810657))))

(assert (=> b!1436656 (= res!969658 (validKeyInArray!0 (select (arr!47130 a!2862) i!1006)))))

(declare-fun b!1436657 () Bool)

(declare-fun res!969656 () Bool)

(assert (=> b!1436657 (=> (not res!969656) (not e!810657))))

(assert (=> b!1436657 (= res!969656 (and (= (size!47682 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47682 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47682 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436658 () Bool)

(declare-fun res!969655 () Bool)

(assert (=> b!1436658 (=> (not res!969655) (not e!810657))))

(declare-datatypes ((List!33709 0))(
  ( (Nil!33706) (Cons!33705 (h!35043 (_ BitVec 64)) (t!48395 List!33709)) )
))
(declare-fun arrayNoDuplicates!0 (array!97670 (_ BitVec 32) List!33709) Bool)

(assert (=> b!1436658 (= res!969655 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33706))))

(assert (= (and start!124088 res!969652) b!1436657))

(assert (= (and b!1436657 res!969656) b!1436656))

(assert (= (and b!1436656 res!969658) b!1436653))

(assert (= (and b!1436653 res!969657) b!1436652))

(assert (= (and b!1436652 res!969653) b!1436658))

(assert (= (and b!1436658 res!969655) b!1436655))

(assert (= (and b!1436655 res!969654) b!1436654))

(declare-fun m!1325469 () Bool)

(assert (=> b!1436658 m!1325469))

(declare-fun m!1325471 () Bool)

(assert (=> b!1436653 m!1325471))

(assert (=> b!1436653 m!1325471))

(declare-fun m!1325473 () Bool)

(assert (=> b!1436653 m!1325473))

(declare-fun m!1325475 () Bool)

(assert (=> b!1436656 m!1325475))

(assert (=> b!1436656 m!1325475))

(declare-fun m!1325477 () Bool)

(assert (=> b!1436656 m!1325477))

(declare-fun m!1325479 () Bool)

(assert (=> start!124088 m!1325479))

(declare-fun m!1325481 () Bool)

(assert (=> start!124088 m!1325481))

(declare-fun m!1325483 () Bool)

(assert (=> b!1436652 m!1325483))

(assert (=> b!1436654 m!1325471))

(assert (=> b!1436654 m!1325471))

(declare-fun m!1325485 () Bool)

(assert (=> b!1436654 m!1325485))

(assert (=> b!1436654 m!1325485))

(assert (=> b!1436654 m!1325471))

(declare-fun m!1325487 () Bool)

(assert (=> b!1436654 m!1325487))

(declare-fun m!1325489 () Bool)

(assert (=> b!1436655 m!1325489))

(declare-fun m!1325491 () Bool)

(assert (=> b!1436655 m!1325491))

(push 1)

(assert (not b!1436654))

(assert (not b!1436652))

(assert (not b!1436656))

(assert (not b!1436653))

(assert (not b!1436658))

(assert (not start!124088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

