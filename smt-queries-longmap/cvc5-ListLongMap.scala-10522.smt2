; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124102 () Bool)

(assert start!124102)

(declare-fun b!1436680 () Bool)

(declare-fun res!969566 () Bool)

(declare-fun e!810724 () Bool)

(assert (=> b!1436680 (=> (not res!969566) (not e!810724))))

(declare-datatypes ((array!97706 0))(
  ( (array!97707 (arr!47147 (Array (_ BitVec 32) (_ BitVec 64))) (size!47697 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97706)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436680 (= res!969566 (validKeyInArray!0 (select (arr!47147 a!2862) i!1006)))))

(declare-fun b!1436681 () Bool)

(declare-fun res!969568 () Bool)

(assert (=> b!1436681 (=> (not res!969568) (not e!810724))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97706 (_ BitVec 32)) Bool)

(assert (=> b!1436681 (= res!969568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436682 () Bool)

(declare-fun res!969567 () Bool)

(assert (=> b!1436682 (=> (not res!969567) (not e!810724))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436682 (= res!969567 (and (= (size!47697 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47697 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47697 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436683 () Bool)

(declare-fun res!969562 () Bool)

(assert (=> b!1436683 (=> (not res!969562) (not e!810724))))

(declare-datatypes ((List!33648 0))(
  ( (Nil!33645) (Cons!33644 (h!34982 (_ BitVec 64)) (t!48342 List!33648)) )
))
(declare-fun arrayNoDuplicates!0 (array!97706 (_ BitVec 32) List!33648) Bool)

(assert (=> b!1436683 (= res!969562 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33645))))

(declare-fun b!1436679 () Bool)

(declare-fun res!969564 () Bool)

(assert (=> b!1436679 (=> (not res!969564) (not e!810724))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436679 (= res!969564 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47697 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47697 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47697 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47147 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!969563 () Bool)

(assert (=> start!124102 (=> (not res!969563) (not e!810724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124102 (= res!969563 (validMask!0 mask!2687))))

(assert (=> start!124102 e!810724))

(assert (=> start!124102 true))

(declare-fun array_inv!36175 (array!97706) Bool)

(assert (=> start!124102 (array_inv!36175 a!2862)))

(declare-fun b!1436684 () Bool)

(declare-fun res!969565 () Bool)

(assert (=> b!1436684 (=> (not res!969565) (not e!810724))))

(assert (=> b!1436684 (= res!969565 (validKeyInArray!0 (select (arr!47147 a!2862) j!93)))))

(declare-fun b!1436685 () Bool)

(assert (=> b!1436685 (= e!810724 false)))

(declare-fun lt!632196 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436685 (= lt!632196 (toIndex!0 (select (arr!47147 a!2862) j!93) mask!2687))))

(assert (= (and start!124102 res!969563) b!1436682))

(assert (= (and b!1436682 res!969567) b!1436680))

(assert (= (and b!1436680 res!969566) b!1436684))

(assert (= (and b!1436684 res!969565) b!1436681))

(assert (= (and b!1436681 res!969568) b!1436683))

(assert (= (and b!1436683 res!969562) b!1436679))

(assert (= (and b!1436679 res!969564) b!1436685))

(declare-fun m!1325965 () Bool)

(assert (=> b!1436685 m!1325965))

(assert (=> b!1436685 m!1325965))

(declare-fun m!1325967 () Bool)

(assert (=> b!1436685 m!1325967))

(declare-fun m!1325969 () Bool)

(assert (=> b!1436683 m!1325969))

(declare-fun m!1325971 () Bool)

(assert (=> b!1436681 m!1325971))

(declare-fun m!1325973 () Bool)

(assert (=> b!1436679 m!1325973))

(declare-fun m!1325975 () Bool)

(assert (=> b!1436679 m!1325975))

(assert (=> b!1436684 m!1325965))

(assert (=> b!1436684 m!1325965))

(declare-fun m!1325977 () Bool)

(assert (=> b!1436684 m!1325977))

(declare-fun m!1325979 () Bool)

(assert (=> start!124102 m!1325979))

(declare-fun m!1325981 () Bool)

(assert (=> start!124102 m!1325981))

(declare-fun m!1325983 () Bool)

(assert (=> b!1436680 m!1325983))

(assert (=> b!1436680 m!1325983))

(declare-fun m!1325985 () Bool)

(assert (=> b!1436680 m!1325985))

(push 1)

(assert (not b!1436681))

(assert (not start!124102))

(assert (not b!1436683))

(assert (not b!1436680))

(assert (not b!1436684))

(assert (not b!1436685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

