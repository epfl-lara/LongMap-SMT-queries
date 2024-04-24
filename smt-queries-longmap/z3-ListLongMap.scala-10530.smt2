; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124368 () Bool)

(assert start!124368)

(declare-fun b!1438532 () Bool)

(declare-fun res!970594 () Bool)

(declare-fun e!811708 () Bool)

(assert (=> b!1438532 (=> (not res!970594) (not e!811708))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97867 0))(
  ( (array!97868 (arr!47224 (Array (_ BitVec 32) (_ BitVec 64))) (size!47775 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97867)

(assert (=> b!1438532 (= res!970594 (and (= (size!47775 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47775 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47775 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438533 () Bool)

(declare-fun res!970591 () Bool)

(assert (=> b!1438533 (=> (not res!970591) (not e!811708))))

(declare-datatypes ((List!33712 0))(
  ( (Nil!33709) (Cons!33708 (h!35057 (_ BitVec 64)) (t!48398 List!33712)) )
))
(declare-fun arrayNoDuplicates!0 (array!97867 (_ BitVec 32) List!33712) Bool)

(assert (=> b!1438533 (= res!970591 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33709))))

(declare-fun b!1438535 () Bool)

(declare-fun e!811709 () Bool)

(assert (=> b!1438535 (= e!811708 e!811709)))

(declare-fun res!970592 () Bool)

(assert (=> b!1438535 (=> (not res!970592) (not e!811709))))

(declare-datatypes ((SeekEntryResult!11373 0))(
  ( (MissingZero!11373 (index!47884 (_ BitVec 32))) (Found!11373 (index!47885 (_ BitVec 32))) (Intermediate!11373 (undefined!12185 Bool) (index!47886 (_ BitVec 32)) (x!129790 (_ BitVec 32))) (Undefined!11373) (MissingVacant!11373 (index!47887 (_ BitVec 32))) )
))
(declare-fun lt!632728 () SeekEntryResult!11373)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97867 (_ BitVec 32)) SeekEntryResult!11373)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438535 (= res!970592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47224 a!2862) j!93) mask!2687) (select (arr!47224 a!2862) j!93) a!2862 mask!2687) lt!632728))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438535 (= lt!632728 (Intermediate!11373 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438536 () Bool)

(declare-fun res!970590 () Bool)

(assert (=> b!1438536 (=> (not res!970590) (not e!811708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438536 (= res!970590 (validKeyInArray!0 (select (arr!47224 a!2862) j!93)))))

(declare-fun b!1438537 () Bool)

(declare-fun res!970595 () Bool)

(assert (=> b!1438537 (=> (not res!970595) (not e!811708))))

(assert (=> b!1438537 (= res!970595 (validKeyInArray!0 (select (arr!47224 a!2862) i!1006)))))

(declare-fun b!1438538 () Bool)

(declare-fun res!970597 () Bool)

(assert (=> b!1438538 (=> (not res!970597) (not e!811708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97867 (_ BitVec 32)) Bool)

(assert (=> b!1438538 (= res!970597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438534 () Bool)

(declare-fun res!970596 () Bool)

(assert (=> b!1438534 (=> (not res!970596) (not e!811708))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438534 (= res!970596 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47775 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47775 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47775 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970598 () Bool)

(assert (=> start!124368 (=> (not res!970598) (not e!811708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124368 (= res!970598 (validMask!0 mask!2687))))

(assert (=> start!124368 e!811708))

(assert (=> start!124368 true))

(declare-fun array_inv!36505 (array!97867) Bool)

(assert (=> start!124368 (array_inv!36505 a!2862)))

(declare-fun b!1438539 () Bool)

(assert (=> b!1438539 (= e!811709 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1438540 () Bool)

(declare-fun res!970593 () Bool)

(assert (=> b!1438540 (=> (not res!970593) (not e!811709))))

(assert (=> b!1438540 (= res!970593 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47224 a!2862) j!93) a!2862 mask!2687) lt!632728))))

(assert (= (and start!124368 res!970598) b!1438532))

(assert (= (and b!1438532 res!970594) b!1438537))

(assert (= (and b!1438537 res!970595) b!1438536))

(assert (= (and b!1438536 res!970590) b!1438538))

(assert (= (and b!1438538 res!970597) b!1438533))

(assert (= (and b!1438533 res!970591) b!1438534))

(assert (= (and b!1438534 res!970596) b!1438535))

(assert (= (and b!1438535 res!970592) b!1438540))

(assert (= (and b!1438540 res!970593) b!1438539))

(declare-fun m!1327969 () Bool)

(assert (=> b!1438533 m!1327969))

(declare-fun m!1327971 () Bool)

(assert (=> b!1438537 m!1327971))

(assert (=> b!1438537 m!1327971))

(declare-fun m!1327973 () Bool)

(assert (=> b!1438537 m!1327973))

(declare-fun m!1327975 () Bool)

(assert (=> b!1438540 m!1327975))

(assert (=> b!1438540 m!1327975))

(declare-fun m!1327977 () Bool)

(assert (=> b!1438540 m!1327977))

(declare-fun m!1327979 () Bool)

(assert (=> b!1438534 m!1327979))

(declare-fun m!1327981 () Bool)

(assert (=> b!1438534 m!1327981))

(assert (=> b!1438535 m!1327975))

(assert (=> b!1438535 m!1327975))

(declare-fun m!1327983 () Bool)

(assert (=> b!1438535 m!1327983))

(assert (=> b!1438535 m!1327983))

(assert (=> b!1438535 m!1327975))

(declare-fun m!1327985 () Bool)

(assert (=> b!1438535 m!1327985))

(assert (=> b!1438536 m!1327975))

(assert (=> b!1438536 m!1327975))

(declare-fun m!1327987 () Bool)

(assert (=> b!1438536 m!1327987))

(declare-fun m!1327989 () Bool)

(assert (=> start!124368 m!1327989))

(declare-fun m!1327991 () Bool)

(assert (=> start!124368 m!1327991))

(declare-fun m!1327993 () Bool)

(assert (=> b!1438538 m!1327993))

(check-sat (not b!1438537) (not b!1438536) (not b!1438533) (not b!1438538) (not start!124368) (not b!1438540) (not b!1438535))
(check-sat)
