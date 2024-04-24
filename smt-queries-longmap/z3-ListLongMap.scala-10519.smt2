; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124266 () Bool)

(assert start!124266)

(declare-fun b!1437736 () Bool)

(declare-fun res!969832 () Bool)

(declare-fun e!811445 () Bool)

(assert (=> b!1437736 (=> (not res!969832) (not e!811445))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97798 0))(
  ( (array!97799 (arr!47191 (Array (_ BitVec 32) (_ BitVec 64))) (size!47742 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97798)

(assert (=> b!1437736 (= res!969832 (and (= (size!47742 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47742 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47742 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437737 () Bool)

(declare-fun res!969830 () Bool)

(assert (=> b!1437737 (=> (not res!969830) (not e!811445))))

(declare-datatypes ((List!33679 0))(
  ( (Nil!33676) (Cons!33675 (h!35021 (_ BitVec 64)) (t!48365 List!33679)) )
))
(declare-fun arrayNoDuplicates!0 (array!97798 (_ BitVec 32) List!33679) Bool)

(assert (=> b!1437737 (= res!969830 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33676))))

(declare-fun b!1437738 () Bool)

(declare-fun res!969827 () Bool)

(assert (=> b!1437738 (=> (not res!969827) (not e!811445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437738 (= res!969827 (validKeyInArray!0 (select (arr!47191 a!2862) i!1006)))))

(declare-fun b!1437739 () Bool)

(assert (=> b!1437739 (= e!811445 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632602 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437739 (= lt!632602 (toIndex!0 (select (arr!47191 a!2862) j!93) mask!2687))))

(declare-fun res!969828 () Bool)

(assert (=> start!124266 (=> (not res!969828) (not e!811445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124266 (= res!969828 (validMask!0 mask!2687))))

(assert (=> start!124266 e!811445))

(assert (=> start!124266 true))

(declare-fun array_inv!36472 (array!97798) Bool)

(assert (=> start!124266 (array_inv!36472 a!2862)))

(declare-fun b!1437740 () Bool)

(declare-fun res!969831 () Bool)

(assert (=> b!1437740 (=> (not res!969831) (not e!811445))))

(assert (=> b!1437740 (= res!969831 (validKeyInArray!0 (select (arr!47191 a!2862) j!93)))))

(declare-fun b!1437741 () Bool)

(declare-fun res!969833 () Bool)

(assert (=> b!1437741 (=> (not res!969833) (not e!811445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97798 (_ BitVec 32)) Bool)

(assert (=> b!1437741 (= res!969833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437742 () Bool)

(declare-fun res!969829 () Bool)

(assert (=> b!1437742 (=> (not res!969829) (not e!811445))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437742 (= res!969829 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47742 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47742 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47742 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124266 res!969828) b!1437736))

(assert (= (and b!1437736 res!969832) b!1437738))

(assert (= (and b!1437738 res!969827) b!1437740))

(assert (= (and b!1437740 res!969831) b!1437741))

(assert (= (and b!1437741 res!969833) b!1437737))

(assert (= (and b!1437737 res!969830) b!1437742))

(assert (= (and b!1437742 res!969829) b!1437739))

(declare-fun m!1327159 () Bool)

(assert (=> b!1437738 m!1327159))

(assert (=> b!1437738 m!1327159))

(declare-fun m!1327161 () Bool)

(assert (=> b!1437738 m!1327161))

(declare-fun m!1327163 () Bool)

(assert (=> b!1437739 m!1327163))

(assert (=> b!1437739 m!1327163))

(declare-fun m!1327165 () Bool)

(assert (=> b!1437739 m!1327165))

(assert (=> b!1437740 m!1327163))

(assert (=> b!1437740 m!1327163))

(declare-fun m!1327167 () Bool)

(assert (=> b!1437740 m!1327167))

(declare-fun m!1327169 () Bool)

(assert (=> b!1437741 m!1327169))

(declare-fun m!1327171 () Bool)

(assert (=> b!1437742 m!1327171))

(declare-fun m!1327173 () Bool)

(assert (=> b!1437742 m!1327173))

(declare-fun m!1327175 () Bool)

(assert (=> start!124266 m!1327175))

(declare-fun m!1327177 () Bool)

(assert (=> start!124266 m!1327177))

(declare-fun m!1327179 () Bool)

(assert (=> b!1437737 m!1327179))

(check-sat (not b!1437739) (not start!124266) (not b!1437741) (not b!1437737) (not b!1437740) (not b!1437738))
(check-sat)
