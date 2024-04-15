; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124252 () Bool)

(assert start!124252)

(declare-fun b!1438047 () Bool)

(declare-fun res!970837 () Bool)

(declare-fun e!811227 () Bool)

(assert (=> b!1438047 (=> (not res!970837) (not e!811227))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97756 0))(
  ( (array!97757 (arr!47170 (Array (_ BitVec 32) (_ BitVec 64))) (size!47722 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97756)

(assert (=> b!1438047 (= res!970837 (and (= (size!47722 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47722 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47722 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438048 () Bool)

(declare-fun res!970846 () Bool)

(assert (=> b!1438048 (=> (not res!970846) (not e!811227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97756 (_ BitVec 32)) Bool)

(assert (=> b!1438048 (= res!970846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438049 () Bool)

(declare-fun res!970838 () Bool)

(assert (=> b!1438049 (=> (not res!970838) (not e!811227))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438049 (= res!970838 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47722 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47722 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47722 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438050 () Bool)

(declare-fun res!970843 () Bool)

(assert (=> b!1438050 (=> (not res!970843) (not e!811227))))

(declare-datatypes ((List!33749 0))(
  ( (Nil!33746) (Cons!33745 (h!35089 (_ BitVec 64)) (t!48435 List!33749)) )
))
(declare-fun arrayNoDuplicates!0 (array!97756 (_ BitVec 32) List!33749) Bool)

(assert (=> b!1438050 (= res!970843 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33746))))

(declare-fun b!1438051 () Bool)

(declare-fun res!970842 () Bool)

(declare-fun e!811225 () Bool)

(assert (=> b!1438051 (=> (not res!970842) (not e!811225))))

(declare-datatypes ((SeekEntryResult!11447 0))(
  ( (MissingZero!11447 (index!48180 (_ BitVec 32))) (Found!11447 (index!48181 (_ BitVec 32))) (Intermediate!11447 (undefined!12259 Bool) (index!48182 (_ BitVec 32)) (x!129911 (_ BitVec 32))) (Undefined!11447) (MissingVacant!11447 (index!48183 (_ BitVec 32))) )
))
(declare-fun lt!632286 () SeekEntryResult!11447)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97756 (_ BitVec 32)) SeekEntryResult!11447)

(assert (=> b!1438051 (= res!970842 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47170 a!2862) j!93) a!2862 mask!2687) lt!632286))))

(declare-fun b!1438052 () Bool)

(declare-fun res!970839 () Bool)

(assert (=> b!1438052 (=> (not res!970839) (not e!811227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438052 (= res!970839 (validKeyInArray!0 (select (arr!47170 a!2862) i!1006)))))

(declare-fun b!1438053 () Bool)

(declare-fun res!970840 () Bool)

(assert (=> b!1438053 (=> (not res!970840) (not e!811227))))

(assert (=> b!1438053 (= res!970840 (validKeyInArray!0 (select (arr!47170 a!2862) j!93)))))

(declare-fun b!1438054 () Bool)

(assert (=> b!1438054 (= e!811227 e!811225)))

(declare-fun res!970841 () Bool)

(assert (=> b!1438054 (=> (not res!970841) (not e!811225))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438054 (= res!970841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47170 a!2862) j!93) mask!2687) (select (arr!47170 a!2862) j!93) a!2862 mask!2687) lt!632286))))

(assert (=> b!1438054 (= lt!632286 (Intermediate!11447 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!970844 () Bool)

(assert (=> start!124252 (=> (not res!970844) (not e!811227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124252 (= res!970844 (validMask!0 mask!2687))))

(assert (=> start!124252 e!811227))

(assert (=> start!124252 true))

(declare-fun array_inv!36403 (array!97756) Bool)

(assert (=> start!124252 (array_inv!36403 a!2862)))

(declare-fun b!1438055 () Bool)

(assert (=> b!1438055 (= e!811225 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438056 () Bool)

(declare-fun res!970845 () Bool)

(assert (=> b!1438056 (=> (not res!970845) (not e!811225))))

(assert (=> b!1438056 (= res!970845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97757 (store (arr!47170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47722 a!2862)) mask!2687) (Intermediate!11447 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (= (and start!124252 res!970844) b!1438047))

(assert (= (and b!1438047 res!970837) b!1438052))

(assert (= (and b!1438052 res!970839) b!1438053))

(assert (= (and b!1438053 res!970840) b!1438048))

(assert (= (and b!1438048 res!970846) b!1438050))

(assert (= (and b!1438050 res!970843) b!1438049))

(assert (= (and b!1438049 res!970838) b!1438054))

(assert (= (and b!1438054 res!970841) b!1438051))

(assert (= (and b!1438051 res!970842) b!1438056))

(assert (= (and b!1438056 res!970845) b!1438055))

(declare-fun m!1326747 () Bool)

(assert (=> start!124252 m!1326747))

(declare-fun m!1326749 () Bool)

(assert (=> start!124252 m!1326749))

(declare-fun m!1326751 () Bool)

(assert (=> b!1438051 m!1326751))

(assert (=> b!1438051 m!1326751))

(declare-fun m!1326753 () Bool)

(assert (=> b!1438051 m!1326753))

(assert (=> b!1438053 m!1326751))

(assert (=> b!1438053 m!1326751))

(declare-fun m!1326755 () Bool)

(assert (=> b!1438053 m!1326755))

(declare-fun m!1326757 () Bool)

(assert (=> b!1438056 m!1326757))

(declare-fun m!1326759 () Bool)

(assert (=> b!1438056 m!1326759))

(assert (=> b!1438056 m!1326759))

(declare-fun m!1326761 () Bool)

(assert (=> b!1438056 m!1326761))

(assert (=> b!1438056 m!1326761))

(assert (=> b!1438056 m!1326759))

(declare-fun m!1326763 () Bool)

(assert (=> b!1438056 m!1326763))

(assert (=> b!1438049 m!1326757))

(declare-fun m!1326765 () Bool)

(assert (=> b!1438049 m!1326765))

(declare-fun m!1326767 () Bool)

(assert (=> b!1438050 m!1326767))

(declare-fun m!1326769 () Bool)

(assert (=> b!1438048 m!1326769))

(assert (=> b!1438054 m!1326751))

(assert (=> b!1438054 m!1326751))

(declare-fun m!1326771 () Bool)

(assert (=> b!1438054 m!1326771))

(assert (=> b!1438054 m!1326771))

(assert (=> b!1438054 m!1326751))

(declare-fun m!1326773 () Bool)

(assert (=> b!1438054 m!1326773))

(declare-fun m!1326775 () Bool)

(assert (=> b!1438052 m!1326775))

(assert (=> b!1438052 m!1326775))

(declare-fun m!1326777 () Bool)

(assert (=> b!1438052 m!1326777))

(check-sat (not b!1438052) (not start!124252) (not b!1438056) (not b!1438048) (not b!1438050) (not b!1438054) (not b!1438051) (not b!1438053))
(check-sat)
