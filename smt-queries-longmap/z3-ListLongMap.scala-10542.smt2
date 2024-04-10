; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124350 () Bool)

(assert start!124350)

(declare-fun b!1438834 () Bool)

(declare-fun res!971385 () Bool)

(declare-fun e!811596 () Bool)

(assert (=> b!1438834 (=> (not res!971385) (not e!811596))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97837 0))(
  ( (array!97838 (arr!47208 (Array (_ BitVec 32) (_ BitVec 64))) (size!47758 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97837)

(assert (=> b!1438834 (= res!971385 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47758 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47758 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47758 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438835 () Bool)

(declare-fun res!971384 () Bool)

(assert (=> b!1438835 (=> (not res!971384) (not e!811596))))

(declare-datatypes ((List!33709 0))(
  ( (Nil!33706) (Cons!33705 (h!35052 (_ BitVec 64)) (t!48403 List!33709)) )
))
(declare-fun arrayNoDuplicates!0 (array!97837 (_ BitVec 32) List!33709) Bool)

(assert (=> b!1438835 (= res!971384 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33706))))

(declare-fun b!1438836 () Bool)

(declare-fun res!971386 () Bool)

(assert (=> b!1438836 (=> (not res!971386) (not e!811596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438836 (= res!971386 (validKeyInArray!0 (select (arr!47208 a!2862) i!1006)))))

(declare-fun b!1438837 () Bool)

(declare-fun res!971390 () Bool)

(assert (=> b!1438837 (=> (not res!971390) (not e!811596))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1438837 (= res!971390 (and (= (size!47758 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47758 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47758 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438838 () Bool)

(declare-fun res!971387 () Bool)

(declare-fun e!811597 () Bool)

(assert (=> b!1438838 (=> (not res!971387) (not e!811597))))

(declare-datatypes ((SeekEntryResult!11460 0))(
  ( (MissingZero!11460 (index!48232 (_ BitVec 32))) (Found!11460 (index!48233 (_ BitVec 32))) (Intermediate!11460 (undefined!12272 Bool) (index!48234 (_ BitVec 32)) (x!129967 (_ BitVec 32))) (Undefined!11460) (MissingVacant!11460 (index!48235 (_ BitVec 32))) )
))
(declare-fun lt!632654 () SeekEntryResult!11460)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97837 (_ BitVec 32)) SeekEntryResult!11460)

(assert (=> b!1438838 (= res!971387 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47208 a!2862) j!93) a!2862 mask!2687) lt!632654))))

(declare-fun b!1438840 () Bool)

(assert (=> b!1438840 (= e!811597 false)))

(declare-fun lt!632655 () SeekEntryResult!11460)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438840 (= lt!632655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97838 (store (arr!47208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47758 a!2862)) mask!2687))))

(declare-fun b!1438841 () Bool)

(declare-fun res!971391 () Bool)

(assert (=> b!1438841 (=> (not res!971391) (not e!811596))))

(assert (=> b!1438841 (= res!971391 (validKeyInArray!0 (select (arr!47208 a!2862) j!93)))))

(declare-fun b!1438842 () Bool)

(assert (=> b!1438842 (= e!811596 e!811597)))

(declare-fun res!971389 () Bool)

(assert (=> b!1438842 (=> (not res!971389) (not e!811597))))

(assert (=> b!1438842 (= res!971389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47208 a!2862) j!93) mask!2687) (select (arr!47208 a!2862) j!93) a!2862 mask!2687) lt!632654))))

(assert (=> b!1438842 (= lt!632654 (Intermediate!11460 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438839 () Bool)

(declare-fun res!971388 () Bool)

(assert (=> b!1438839 (=> (not res!971388) (not e!811596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97837 (_ BitVec 32)) Bool)

(assert (=> b!1438839 (= res!971388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971392 () Bool)

(assert (=> start!124350 (=> (not res!971392) (not e!811596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124350 (= res!971392 (validMask!0 mask!2687))))

(assert (=> start!124350 e!811596))

(assert (=> start!124350 true))

(declare-fun array_inv!36236 (array!97837) Bool)

(assert (=> start!124350 (array_inv!36236 a!2862)))

(assert (= (and start!124350 res!971392) b!1438837))

(assert (= (and b!1438837 res!971390) b!1438836))

(assert (= (and b!1438836 res!971386) b!1438841))

(assert (= (and b!1438841 res!971391) b!1438839))

(assert (= (and b!1438839 res!971388) b!1438835))

(assert (= (and b!1438835 res!971384) b!1438834))

(assert (= (and b!1438834 res!971385) b!1438842))

(assert (= (and b!1438842 res!971389) b!1438838))

(assert (= (and b!1438838 res!971387) b!1438840))

(declare-fun m!1327959 () Bool)

(assert (=> b!1438840 m!1327959))

(declare-fun m!1327961 () Bool)

(assert (=> b!1438840 m!1327961))

(assert (=> b!1438840 m!1327961))

(declare-fun m!1327963 () Bool)

(assert (=> b!1438840 m!1327963))

(assert (=> b!1438840 m!1327963))

(assert (=> b!1438840 m!1327961))

(declare-fun m!1327965 () Bool)

(assert (=> b!1438840 m!1327965))

(declare-fun m!1327967 () Bool)

(assert (=> b!1438835 m!1327967))

(declare-fun m!1327969 () Bool)

(assert (=> b!1438839 m!1327969))

(declare-fun m!1327971 () Bool)

(assert (=> b!1438841 m!1327971))

(assert (=> b!1438841 m!1327971))

(declare-fun m!1327973 () Bool)

(assert (=> b!1438841 m!1327973))

(assert (=> b!1438838 m!1327971))

(assert (=> b!1438838 m!1327971))

(declare-fun m!1327975 () Bool)

(assert (=> b!1438838 m!1327975))

(declare-fun m!1327977 () Bool)

(assert (=> start!124350 m!1327977))

(declare-fun m!1327979 () Bool)

(assert (=> start!124350 m!1327979))

(declare-fun m!1327981 () Bool)

(assert (=> b!1438836 m!1327981))

(assert (=> b!1438836 m!1327981))

(declare-fun m!1327983 () Bool)

(assert (=> b!1438836 m!1327983))

(assert (=> b!1438842 m!1327971))

(assert (=> b!1438842 m!1327971))

(declare-fun m!1327985 () Bool)

(assert (=> b!1438842 m!1327985))

(assert (=> b!1438842 m!1327985))

(assert (=> b!1438842 m!1327971))

(declare-fun m!1327987 () Bool)

(assert (=> b!1438842 m!1327987))

(assert (=> b!1438834 m!1327959))

(declare-fun m!1327989 () Bool)

(assert (=> b!1438834 m!1327989))

(check-sat (not b!1438839) (not b!1438840) (not b!1438838) (not b!1438835) (not b!1438841) (not start!124350) (not b!1438842) (not b!1438836))
(check-sat)
