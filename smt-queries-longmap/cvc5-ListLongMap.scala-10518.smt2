; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124042 () Bool)

(assert start!124042)

(declare-fun b!1436346 () Bool)

(declare-fun res!969264 () Bool)

(declare-fun e!810590 () Bool)

(assert (=> b!1436346 (=> (not res!969264) (not e!810590))))

(declare-datatypes ((array!97679 0))(
  ( (array!97680 (arr!47135 (Array (_ BitVec 32) (_ BitVec 64))) (size!47685 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97679)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436346 (= res!969264 (validKeyInArray!0 (select (arr!47135 a!2862) j!93)))))

(declare-fun b!1436347 () Bool)

(declare-fun res!969267 () Bool)

(assert (=> b!1436347 (=> (not res!969267) (not e!810590))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436347 (= res!969267 (validKeyInArray!0 (select (arr!47135 a!2862) i!1006)))))

(declare-fun b!1436348 () Bool)

(declare-fun res!969263 () Bool)

(assert (=> b!1436348 (=> (not res!969263) (not e!810590))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1436348 (= res!969263 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47685 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47685 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47685 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47135 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436349 () Bool)

(declare-fun res!969268 () Bool)

(assert (=> b!1436349 (=> (not res!969268) (not e!810590))))

(declare-datatypes ((List!33636 0))(
  ( (Nil!33633) (Cons!33632 (h!34967 (_ BitVec 64)) (t!48330 List!33636)) )
))
(declare-fun arrayNoDuplicates!0 (array!97679 (_ BitVec 32) List!33636) Bool)

(assert (=> b!1436349 (= res!969268 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33633))))

(declare-fun b!1436350 () Bool)

(declare-fun res!969265 () Bool)

(assert (=> b!1436350 (=> (not res!969265) (not e!810590))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1436350 (= res!969265 (and (= (size!47685 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47685 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47685 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436351 () Bool)

(declare-fun res!969266 () Bool)

(assert (=> b!1436351 (=> (not res!969266) (not e!810590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97679 (_ BitVec 32)) Bool)

(assert (=> b!1436351 (= res!969266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969262 () Bool)

(assert (=> start!124042 (=> (not res!969262) (not e!810590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124042 (= res!969262 (validMask!0 mask!2687))))

(assert (=> start!124042 e!810590))

(assert (=> start!124042 true))

(declare-fun array_inv!36163 (array!97679) Bool)

(assert (=> start!124042 (array_inv!36163 a!2862)))

(declare-fun b!1436352 () Bool)

(assert (=> b!1436352 (= e!810590 false)))

(declare-fun lt!632115 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436352 (= lt!632115 (toIndex!0 (select (arr!47135 a!2862) j!93) mask!2687))))

(assert (= (and start!124042 res!969262) b!1436350))

(assert (= (and b!1436350 res!969265) b!1436347))

(assert (= (and b!1436347 res!969267) b!1436346))

(assert (= (and b!1436346 res!969264) b!1436351))

(assert (= (and b!1436351 res!969266) b!1436349))

(assert (= (and b!1436349 res!969268) b!1436348))

(assert (= (and b!1436348 res!969263) b!1436352))

(declare-fun m!1325653 () Bool)

(assert (=> b!1436347 m!1325653))

(assert (=> b!1436347 m!1325653))

(declare-fun m!1325655 () Bool)

(assert (=> b!1436347 m!1325655))

(declare-fun m!1325657 () Bool)

(assert (=> b!1436348 m!1325657))

(declare-fun m!1325659 () Bool)

(assert (=> b!1436348 m!1325659))

(declare-fun m!1325661 () Bool)

(assert (=> b!1436352 m!1325661))

(assert (=> b!1436352 m!1325661))

(declare-fun m!1325663 () Bool)

(assert (=> b!1436352 m!1325663))

(declare-fun m!1325665 () Bool)

(assert (=> b!1436349 m!1325665))

(declare-fun m!1325667 () Bool)

(assert (=> b!1436351 m!1325667))

(declare-fun m!1325669 () Bool)

(assert (=> start!124042 m!1325669))

(declare-fun m!1325671 () Bool)

(assert (=> start!124042 m!1325671))

(assert (=> b!1436346 m!1325661))

(assert (=> b!1436346 m!1325661))

(declare-fun m!1325673 () Bool)

(assert (=> b!1436346 m!1325673))

(push 1)

(assert (not b!1436351))

(assert (not start!124042))

(assert (not b!1436347))

(assert (not b!1436352))

(assert (not b!1436346))

(assert (not b!1436349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

