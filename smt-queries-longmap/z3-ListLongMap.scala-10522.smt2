; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124104 () Bool)

(assert start!124104)

(declare-fun b!1436700 () Bool)

(declare-fun res!969587 () Bool)

(declare-fun e!810731 () Bool)

(assert (=> b!1436700 (=> (not res!969587) (not e!810731))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97708 0))(
  ( (array!97709 (arr!47148 (Array (_ BitVec 32) (_ BitVec 64))) (size!47698 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97708)

(assert (=> b!1436700 (= res!969587 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47698 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47698 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47698 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436701 () Bool)

(declare-fun res!969585 () Bool)

(assert (=> b!1436701 (=> (not res!969585) (not e!810731))))

(declare-datatypes ((List!33649 0))(
  ( (Nil!33646) (Cons!33645 (h!34983 (_ BitVec 64)) (t!48343 List!33649)) )
))
(declare-fun arrayNoDuplicates!0 (array!97708 (_ BitVec 32) List!33649) Bool)

(assert (=> b!1436701 (= res!969585 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33646))))

(declare-fun b!1436702 () Bool)

(declare-fun res!969589 () Bool)

(assert (=> b!1436702 (=> (not res!969589) (not e!810731))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436702 (= res!969589 (and (= (size!47698 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47698 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47698 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436703 () Bool)

(declare-fun res!969586 () Bool)

(assert (=> b!1436703 (=> (not res!969586) (not e!810731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97708 (_ BitVec 32)) Bool)

(assert (=> b!1436703 (= res!969586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969588 () Bool)

(assert (=> start!124104 (=> (not res!969588) (not e!810731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124104 (= res!969588 (validMask!0 mask!2687))))

(assert (=> start!124104 e!810731))

(assert (=> start!124104 true))

(declare-fun array_inv!36176 (array!97708) Bool)

(assert (=> start!124104 (array_inv!36176 a!2862)))

(declare-fun b!1436704 () Bool)

(assert (=> b!1436704 (= e!810731 false)))

(declare-fun lt!632199 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436704 (= lt!632199 (toIndex!0 (select (arr!47148 a!2862) j!93) mask!2687))))

(declare-fun b!1436705 () Bool)

(declare-fun res!969584 () Bool)

(assert (=> b!1436705 (=> (not res!969584) (not e!810731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436705 (= res!969584 (validKeyInArray!0 (select (arr!47148 a!2862) j!93)))))

(declare-fun b!1436706 () Bool)

(declare-fun res!969583 () Bool)

(assert (=> b!1436706 (=> (not res!969583) (not e!810731))))

(assert (=> b!1436706 (= res!969583 (validKeyInArray!0 (select (arr!47148 a!2862) i!1006)))))

(assert (= (and start!124104 res!969588) b!1436702))

(assert (= (and b!1436702 res!969589) b!1436706))

(assert (= (and b!1436706 res!969583) b!1436705))

(assert (= (and b!1436705 res!969584) b!1436703))

(assert (= (and b!1436703 res!969586) b!1436701))

(assert (= (and b!1436701 res!969585) b!1436700))

(assert (= (and b!1436700 res!969587) b!1436704))

(declare-fun m!1325987 () Bool)

(assert (=> b!1436701 m!1325987))

(declare-fun m!1325989 () Bool)

(assert (=> b!1436700 m!1325989))

(declare-fun m!1325991 () Bool)

(assert (=> b!1436700 m!1325991))

(declare-fun m!1325993 () Bool)

(assert (=> start!124104 m!1325993))

(declare-fun m!1325995 () Bool)

(assert (=> start!124104 m!1325995))

(declare-fun m!1325997 () Bool)

(assert (=> b!1436705 m!1325997))

(assert (=> b!1436705 m!1325997))

(declare-fun m!1325999 () Bool)

(assert (=> b!1436705 m!1325999))

(declare-fun m!1326001 () Bool)

(assert (=> b!1436706 m!1326001))

(assert (=> b!1436706 m!1326001))

(declare-fun m!1326003 () Bool)

(assert (=> b!1436706 m!1326003))

(declare-fun m!1326005 () Bool)

(assert (=> b!1436703 m!1326005))

(assert (=> b!1436704 m!1325997))

(assert (=> b!1436704 m!1325997))

(declare-fun m!1326007 () Bool)

(assert (=> b!1436704 m!1326007))

(check-sat (not b!1436701) (not start!124104) (not b!1436705) (not b!1436706) (not b!1436704) (not b!1436703))
