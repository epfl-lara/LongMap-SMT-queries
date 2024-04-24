; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124366 () Bool)

(assert start!124366)

(declare-fun b!1438508 () Bool)

(declare-fun res!970566 () Bool)

(declare-fun e!811700 () Bool)

(assert (=> b!1438508 (=> (not res!970566) (not e!811700))))

(declare-datatypes ((array!97865 0))(
  ( (array!97866 (arr!47223 (Array (_ BitVec 32) (_ BitVec 64))) (size!47774 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97865)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97865 (_ BitVec 32)) Bool)

(assert (=> b!1438508 (= res!970566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438509 () Bool)

(declare-fun res!970565 () Bool)

(assert (=> b!1438509 (=> (not res!970565) (not e!811700))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438509 (= res!970565 (validKeyInArray!0 (select (arr!47223 a!2862) i!1006)))))

(declare-fun b!1438510 () Bool)

(assert (=> b!1438510 (= e!811700 false)))

(declare-datatypes ((SeekEntryResult!11372 0))(
  ( (MissingZero!11372 (index!47880 (_ BitVec 32))) (Found!11372 (index!47881 (_ BitVec 32))) (Intermediate!11372 (undefined!12184 Bool) (index!47882 (_ BitVec 32)) (x!129781 (_ BitVec 32))) (Undefined!11372) (MissingVacant!11372 (index!47883 (_ BitVec 32))) )
))
(declare-fun lt!632725 () SeekEntryResult!11372)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97865 (_ BitVec 32)) SeekEntryResult!11372)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438510 (= lt!632725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47223 a!2862) j!93) mask!2687) (select (arr!47223 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438511 () Bool)

(declare-fun res!970567 () Bool)

(assert (=> b!1438511 (=> (not res!970567) (not e!811700))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438511 (= res!970567 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47774 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47774 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47774 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438512 () Bool)

(declare-fun res!970569 () Bool)

(assert (=> b!1438512 (=> (not res!970569) (not e!811700))))

(declare-datatypes ((List!33711 0))(
  ( (Nil!33708) (Cons!33707 (h!35056 (_ BitVec 64)) (t!48397 List!33711)) )
))
(declare-fun arrayNoDuplicates!0 (array!97865 (_ BitVec 32) List!33711) Bool)

(assert (=> b!1438512 (= res!970569 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33708))))

(declare-fun b!1438513 () Bool)

(declare-fun res!970571 () Bool)

(assert (=> b!1438513 (=> (not res!970571) (not e!811700))))

(assert (=> b!1438513 (= res!970571 (and (= (size!47774 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47774 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47774 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438507 () Bool)

(declare-fun res!970568 () Bool)

(assert (=> b!1438507 (=> (not res!970568) (not e!811700))))

(assert (=> b!1438507 (= res!970568 (validKeyInArray!0 (select (arr!47223 a!2862) j!93)))))

(declare-fun res!970570 () Bool)

(assert (=> start!124366 (=> (not res!970570) (not e!811700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124366 (= res!970570 (validMask!0 mask!2687))))

(assert (=> start!124366 e!811700))

(assert (=> start!124366 true))

(declare-fun array_inv!36504 (array!97865) Bool)

(assert (=> start!124366 (array_inv!36504 a!2862)))

(assert (= (and start!124366 res!970570) b!1438513))

(assert (= (and b!1438513 res!970571) b!1438509))

(assert (= (and b!1438509 res!970565) b!1438507))

(assert (= (and b!1438507 res!970568) b!1438508))

(assert (= (and b!1438508 res!970566) b!1438512))

(assert (= (and b!1438512 res!970569) b!1438511))

(assert (= (and b!1438511 res!970567) b!1438510))

(declare-fun m!1327945 () Bool)

(assert (=> b!1438512 m!1327945))

(declare-fun m!1327947 () Bool)

(assert (=> b!1438511 m!1327947))

(declare-fun m!1327949 () Bool)

(assert (=> b!1438511 m!1327949))

(declare-fun m!1327951 () Bool)

(assert (=> b!1438510 m!1327951))

(assert (=> b!1438510 m!1327951))

(declare-fun m!1327953 () Bool)

(assert (=> b!1438510 m!1327953))

(assert (=> b!1438510 m!1327953))

(assert (=> b!1438510 m!1327951))

(declare-fun m!1327955 () Bool)

(assert (=> b!1438510 m!1327955))

(assert (=> b!1438507 m!1327951))

(assert (=> b!1438507 m!1327951))

(declare-fun m!1327957 () Bool)

(assert (=> b!1438507 m!1327957))

(declare-fun m!1327959 () Bool)

(assert (=> start!124366 m!1327959))

(declare-fun m!1327961 () Bool)

(assert (=> start!124366 m!1327961))

(declare-fun m!1327963 () Bool)

(assert (=> b!1438509 m!1327963))

(assert (=> b!1438509 m!1327963))

(declare-fun m!1327965 () Bool)

(assert (=> b!1438509 m!1327965))

(declare-fun m!1327967 () Bool)

(assert (=> b!1438508 m!1327967))

(push 1)

(assert (not b!1438512))

(assert (not start!124366))

(assert (not b!1438510))

(assert (not b!1438508))

(assert (not b!1438509))

(assert (not b!1438507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

