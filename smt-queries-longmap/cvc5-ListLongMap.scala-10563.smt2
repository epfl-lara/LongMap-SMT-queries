; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124516 () Bool)

(assert start!124516)

(declare-fun res!973280 () Bool)

(declare-fun e!812311 () Bool)

(assert (=> start!124516 (=> (not res!973280) (not e!812311))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124516 (= res!973280 (validMask!0 mask!2687))))

(assert (=> start!124516 e!812311))

(assert (=> start!124516 true))

(declare-datatypes ((array!97964 0))(
  ( (array!97965 (arr!47270 (Array (_ BitVec 32) (_ BitVec 64))) (size!47820 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97964)

(declare-fun array_inv!36298 (array!97964) Bool)

(assert (=> start!124516 (array_inv!36298 a!2862)))

(declare-fun b!1440845 () Bool)

(declare-fun res!973281 () Bool)

(assert (=> b!1440845 (=> (not res!973281) (not e!812311))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440845 (= res!973281 (validKeyInArray!0 (select (arr!47270 a!2862) j!93)))))

(declare-fun b!1440846 () Bool)

(declare-fun res!973274 () Bool)

(assert (=> b!1440846 (=> (not res!973274) (not e!812311))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440846 (= res!973274 (validKeyInArray!0 (select (arr!47270 a!2862) i!1006)))))

(declare-fun b!1440847 () Bool)

(declare-fun res!973273 () Bool)

(declare-fun e!812312 () Bool)

(assert (=> b!1440847 (=> (not res!973273) (not e!812312))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1440847 (= res!973273 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440848 () Bool)

(declare-fun res!973276 () Bool)

(assert (=> b!1440848 (=> (not res!973276) (not e!812311))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440848 (= res!973276 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47820 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47820 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47820 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47270 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440849 () Bool)

(declare-fun res!973282 () Bool)

(assert (=> b!1440849 (=> (not res!973282) (not e!812311))))

(assert (=> b!1440849 (= res!973282 (and (= (size!47820 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47820 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47820 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440850 () Bool)

(declare-fun res!973278 () Bool)

(assert (=> b!1440850 (=> (not res!973278) (not e!812312))))

(declare-datatypes ((SeekEntryResult!11522 0))(
  ( (MissingZero!11522 (index!48480 (_ BitVec 32))) (Found!11522 (index!48481 (_ BitVec 32))) (Intermediate!11522 (undefined!12334 Bool) (index!48482 (_ BitVec 32)) (x!130203 (_ BitVec 32))) (Undefined!11522) (MissingVacant!11522 (index!48483 (_ BitVec 32))) )
))
(declare-fun lt!633033 () SeekEntryResult!11522)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97964 (_ BitVec 32)) SeekEntryResult!11522)

(assert (=> b!1440850 (= res!973278 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47270 a!2862) j!93) a!2862 mask!2687) lt!633033))))

(declare-fun b!1440851 () Bool)

(declare-fun res!973279 () Bool)

(assert (=> b!1440851 (=> (not res!973279) (not e!812312))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440851 (= res!973279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47270 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47270 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97965 (store (arr!47270 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47820 a!2862)) mask!2687) (Intermediate!11522 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440852 () Bool)

(assert (=> b!1440852 (= e!812312 (not (validKeyInArray!0 (select (store (arr!47270 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1440853 () Bool)

(declare-fun res!973272 () Bool)

(assert (=> b!1440853 (=> (not res!973272) (not e!812311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97964 (_ BitVec 32)) Bool)

(assert (=> b!1440853 (= res!973272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440854 () Bool)

(assert (=> b!1440854 (= e!812311 e!812312)))

(declare-fun res!973277 () Bool)

(assert (=> b!1440854 (=> (not res!973277) (not e!812312))))

(assert (=> b!1440854 (= res!973277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47270 a!2862) j!93) mask!2687) (select (arr!47270 a!2862) j!93) a!2862 mask!2687) lt!633033))))

(assert (=> b!1440854 (= lt!633033 (Intermediate!11522 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440855 () Bool)

(declare-fun res!973275 () Bool)

(assert (=> b!1440855 (=> (not res!973275) (not e!812311))))

(declare-datatypes ((List!33771 0))(
  ( (Nil!33768) (Cons!33767 (h!35117 (_ BitVec 64)) (t!48465 List!33771)) )
))
(declare-fun arrayNoDuplicates!0 (array!97964 (_ BitVec 32) List!33771) Bool)

(assert (=> b!1440855 (= res!973275 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33768))))

(assert (= (and start!124516 res!973280) b!1440849))

(assert (= (and b!1440849 res!973282) b!1440846))

(assert (= (and b!1440846 res!973274) b!1440845))

(assert (= (and b!1440845 res!973281) b!1440853))

(assert (= (and b!1440853 res!973272) b!1440855))

(assert (= (and b!1440855 res!973275) b!1440848))

(assert (= (and b!1440848 res!973276) b!1440854))

(assert (= (and b!1440854 res!973277) b!1440850))

(assert (= (and b!1440850 res!973278) b!1440851))

(assert (= (and b!1440851 res!973279) b!1440847))

(assert (= (and b!1440847 res!973273) b!1440852))

(declare-fun m!1330081 () Bool)

(assert (=> b!1440846 m!1330081))

(assert (=> b!1440846 m!1330081))

(declare-fun m!1330083 () Bool)

(assert (=> b!1440846 m!1330083))

(declare-fun m!1330085 () Bool)

(assert (=> b!1440854 m!1330085))

(assert (=> b!1440854 m!1330085))

(declare-fun m!1330087 () Bool)

(assert (=> b!1440854 m!1330087))

(assert (=> b!1440854 m!1330087))

(assert (=> b!1440854 m!1330085))

(declare-fun m!1330089 () Bool)

(assert (=> b!1440854 m!1330089))

(declare-fun m!1330091 () Bool)

(assert (=> b!1440851 m!1330091))

(declare-fun m!1330093 () Bool)

(assert (=> b!1440851 m!1330093))

(assert (=> b!1440851 m!1330093))

(declare-fun m!1330095 () Bool)

(assert (=> b!1440851 m!1330095))

(assert (=> b!1440851 m!1330095))

(assert (=> b!1440851 m!1330093))

(declare-fun m!1330097 () Bool)

(assert (=> b!1440851 m!1330097))

(assert (=> b!1440845 m!1330085))

(assert (=> b!1440845 m!1330085))

(declare-fun m!1330099 () Bool)

(assert (=> b!1440845 m!1330099))

(declare-fun m!1330101 () Bool)

(assert (=> start!124516 m!1330101))

(declare-fun m!1330103 () Bool)

(assert (=> start!124516 m!1330103))

(declare-fun m!1330105 () Bool)

(assert (=> b!1440855 m!1330105))

(assert (=> b!1440848 m!1330091))

(declare-fun m!1330107 () Bool)

(assert (=> b!1440848 m!1330107))

(assert (=> b!1440850 m!1330085))

(assert (=> b!1440850 m!1330085))

(declare-fun m!1330109 () Bool)

(assert (=> b!1440850 m!1330109))

(declare-fun m!1330111 () Bool)

(assert (=> b!1440853 m!1330111))

(assert (=> b!1440852 m!1330091))

(assert (=> b!1440852 m!1330093))

(assert (=> b!1440852 m!1330093))

(declare-fun m!1330113 () Bool)

(assert (=> b!1440852 m!1330113))

(push 1)

