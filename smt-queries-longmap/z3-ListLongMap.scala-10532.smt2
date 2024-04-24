; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124422 () Bool)

(assert start!124422)

(declare-fun b!1438883 () Bool)

(declare-fun res!970843 () Bool)

(declare-fun e!811887 () Bool)

(assert (=> b!1438883 (=> (not res!970843) (not e!811887))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97882 0))(
  ( (array!97883 (arr!47230 (Array (_ BitVec 32) (_ BitVec 64))) (size!47781 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97882)

(assert (=> b!1438883 (= res!970843 (and (= (size!47781 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47781 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47781 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438884 () Bool)

(declare-fun e!811886 () Bool)

(assert (=> b!1438884 (= e!811887 e!811886)))

(declare-fun res!970842 () Bool)

(assert (=> b!1438884 (=> (not res!970842) (not e!811886))))

(declare-datatypes ((SeekEntryResult!11379 0))(
  ( (MissingZero!11379 (index!47908 (_ BitVec 32))) (Found!11379 (index!47909 (_ BitVec 32))) (Intermediate!11379 (undefined!12191 Bool) (index!47910 (_ BitVec 32)) (x!129818 (_ BitVec 32))) (Undefined!11379) (MissingVacant!11379 (index!47911 (_ BitVec 32))) )
))
(declare-fun lt!632817 () SeekEntryResult!11379)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97882 (_ BitVec 32)) SeekEntryResult!11379)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438884 (= res!970842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47230 a!2862) j!93) mask!2687) (select (arr!47230 a!2862) j!93) a!2862 mask!2687) lt!632817))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438884 (= lt!632817 (Intermediate!11379 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438885 () Bool)

(declare-fun res!970841 () Bool)

(assert (=> b!1438885 (=> (not res!970841) (not e!811887))))

(declare-datatypes ((List!33718 0))(
  ( (Nil!33715) (Cons!33714 (h!35066 (_ BitVec 64)) (t!48404 List!33718)) )
))
(declare-fun arrayNoDuplicates!0 (array!97882 (_ BitVec 32) List!33718) Bool)

(assert (=> b!1438885 (= res!970841 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33715))))

(declare-fun b!1438886 () Bool)

(assert (=> b!1438886 (= e!811886 false)))

(declare-fun lt!632818 () (_ BitVec 32))

(assert (=> b!1438886 (= lt!632818 (toIndex!0 (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438887 () Bool)

(declare-fun res!970839 () Bool)

(assert (=> b!1438887 (=> (not res!970839) (not e!811887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438887 (= res!970839 (validKeyInArray!0 (select (arr!47230 a!2862) i!1006)))))

(declare-fun b!1438888 () Bool)

(declare-fun res!970836 () Bool)

(assert (=> b!1438888 (=> (not res!970836) (not e!811887))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1438888 (= res!970836 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47781 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47781 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47781 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970837 () Bool)

(assert (=> start!124422 (=> (not res!970837) (not e!811887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124422 (= res!970837 (validMask!0 mask!2687))))

(assert (=> start!124422 e!811887))

(assert (=> start!124422 true))

(declare-fun array_inv!36511 (array!97882) Bool)

(assert (=> start!124422 (array_inv!36511 a!2862)))

(declare-fun b!1438889 () Bool)

(declare-fun res!970844 () Bool)

(assert (=> b!1438889 (=> (not res!970844) (not e!811886))))

(assert (=> b!1438889 (= res!970844 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47230 a!2862) j!93) a!2862 mask!2687) lt!632817))))

(declare-fun b!1438890 () Bool)

(declare-fun res!970838 () Bool)

(assert (=> b!1438890 (=> (not res!970838) (not e!811887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97882 (_ BitVec 32)) Bool)

(assert (=> b!1438890 (= res!970838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438891 () Bool)

(declare-fun res!970840 () Bool)

(assert (=> b!1438891 (=> (not res!970840) (not e!811887))))

(assert (=> b!1438891 (= res!970840 (validKeyInArray!0 (select (arr!47230 a!2862) j!93)))))

(assert (= (and start!124422 res!970837) b!1438883))

(assert (= (and b!1438883 res!970843) b!1438887))

(assert (= (and b!1438887 res!970839) b!1438891))

(assert (= (and b!1438891 res!970840) b!1438890))

(assert (= (and b!1438890 res!970838) b!1438885))

(assert (= (and b!1438885 res!970841) b!1438888))

(assert (= (and b!1438888 res!970836) b!1438884))

(assert (= (and b!1438884 res!970842) b!1438889))

(assert (= (and b!1438889 res!970844) b!1438886))

(declare-fun m!1328221 () Bool)

(assert (=> b!1438885 m!1328221))

(declare-fun m!1328223 () Bool)

(assert (=> b!1438884 m!1328223))

(assert (=> b!1438884 m!1328223))

(declare-fun m!1328225 () Bool)

(assert (=> b!1438884 m!1328225))

(assert (=> b!1438884 m!1328225))

(assert (=> b!1438884 m!1328223))

(declare-fun m!1328227 () Bool)

(assert (=> b!1438884 m!1328227))

(assert (=> b!1438889 m!1328223))

(assert (=> b!1438889 m!1328223))

(declare-fun m!1328229 () Bool)

(assert (=> b!1438889 m!1328229))

(assert (=> b!1438891 m!1328223))

(assert (=> b!1438891 m!1328223))

(declare-fun m!1328231 () Bool)

(assert (=> b!1438891 m!1328231))

(declare-fun m!1328233 () Bool)

(assert (=> b!1438887 m!1328233))

(assert (=> b!1438887 m!1328233))

(declare-fun m!1328235 () Bool)

(assert (=> b!1438887 m!1328235))

(declare-fun m!1328237 () Bool)

(assert (=> b!1438890 m!1328237))

(declare-fun m!1328239 () Bool)

(assert (=> b!1438888 m!1328239))

(declare-fun m!1328241 () Bool)

(assert (=> b!1438888 m!1328241))

(declare-fun m!1328243 () Bool)

(assert (=> start!124422 m!1328243))

(declare-fun m!1328245 () Bool)

(assert (=> start!124422 m!1328245))

(assert (=> b!1438886 m!1328239))

(declare-fun m!1328247 () Bool)

(assert (=> b!1438886 m!1328247))

(assert (=> b!1438886 m!1328247))

(declare-fun m!1328249 () Bool)

(assert (=> b!1438886 m!1328249))

(check-sat (not b!1438884) (not b!1438885) (not b!1438890) (not b!1438886) (not b!1438891) (not start!124422) (not b!1438887) (not b!1438889))
(check-sat)
