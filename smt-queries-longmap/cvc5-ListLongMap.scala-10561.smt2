; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124504 () Bool)

(assert start!124504)

(declare-fun b!1440672 () Bool)

(declare-fun e!812257 () Bool)

(declare-fun e!812258 () Bool)

(assert (=> b!1440672 (= e!812257 e!812258)))

(declare-fun res!973103 () Bool)

(assert (=> b!1440672 (=> (not res!973103) (not e!812258))))

(declare-datatypes ((array!97952 0))(
  ( (array!97953 (arr!47264 (Array (_ BitVec 32) (_ BitVec 64))) (size!47814 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97952)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11516 0))(
  ( (MissingZero!11516 (index!48456 (_ BitVec 32))) (Found!11516 (index!48457 (_ BitVec 32))) (Intermediate!11516 (undefined!12328 Bool) (index!48458 (_ BitVec 32)) (x!130181 (_ BitVec 32))) (Undefined!11516) (MissingVacant!11516 (index!48459 (_ BitVec 32))) )
))
(declare-fun lt!633006 () SeekEntryResult!11516)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97952 (_ BitVec 32)) SeekEntryResult!11516)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440672 (= res!973103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47264 a!2862) j!93) mask!2687) (select (arr!47264 a!2862) j!93) a!2862 mask!2687) lt!633006))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440672 (= lt!633006 (Intermediate!11516 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440673 () Bool)

(declare-fun res!973102 () Bool)

(assert (=> b!1440673 (=> (not res!973102) (not e!812257))))

(declare-datatypes ((List!33765 0))(
  ( (Nil!33762) (Cons!33761 (h!35111 (_ BitVec 64)) (t!48459 List!33765)) )
))
(declare-fun arrayNoDuplicates!0 (array!97952 (_ BitVec 32) List!33765) Bool)

(assert (=> b!1440673 (= res!973102 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33762))))

(declare-fun b!1440674 () Bool)

(declare-fun res!973099 () Bool)

(assert (=> b!1440674 (=> (not res!973099) (not e!812257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440674 (= res!973099 (validKeyInArray!0 (select (arr!47264 a!2862) j!93)))))

(declare-fun res!973106 () Bool)

(assert (=> start!124504 (=> (not res!973106) (not e!812257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124504 (= res!973106 (validMask!0 mask!2687))))

(assert (=> start!124504 e!812257))

(assert (=> start!124504 true))

(declare-fun array_inv!36292 (array!97952) Bool)

(assert (=> start!124504 (array_inv!36292 a!2862)))

(declare-fun b!1440675 () Bool)

(declare-fun res!973101 () Bool)

(assert (=> b!1440675 (=> (not res!973101) (not e!812257))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440675 (= res!973101 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47814 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47814 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47814 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47264 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440676 () Bool)

(declare-fun res!973105 () Bool)

(assert (=> b!1440676 (=> (not res!973105) (not e!812258))))

(assert (=> b!1440676 (= res!973105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47264 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47264 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97953 (store (arr!47264 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47814 a!2862)) mask!2687) (Intermediate!11516 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440677 () Bool)

(declare-fun res!973104 () Bool)

(assert (=> b!1440677 (=> (not res!973104) (not e!812257))))

(assert (=> b!1440677 (= res!973104 (and (= (size!47814 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47814 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47814 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440678 () Bool)

(declare-fun res!973100 () Bool)

(assert (=> b!1440678 (=> (not res!973100) (not e!812258))))

(assert (=> b!1440678 (= res!973100 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47264 a!2862) j!93) a!2862 mask!2687) lt!633006))))

(declare-fun b!1440679 () Bool)

(declare-fun res!973108 () Bool)

(assert (=> b!1440679 (=> (not res!973108) (not e!812257))))

(assert (=> b!1440679 (= res!973108 (validKeyInArray!0 (select (arr!47264 a!2862) i!1006)))))

(declare-fun b!1440680 () Bool)

(assert (=> b!1440680 (= e!812258 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440681 () Bool)

(declare-fun res!973107 () Bool)

(assert (=> b!1440681 (=> (not res!973107) (not e!812257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97952 (_ BitVec 32)) Bool)

(assert (=> b!1440681 (= res!973107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124504 res!973106) b!1440677))

(assert (= (and b!1440677 res!973104) b!1440679))

(assert (= (and b!1440679 res!973108) b!1440674))

(assert (= (and b!1440674 res!973099) b!1440681))

(assert (= (and b!1440681 res!973107) b!1440673))

(assert (= (and b!1440673 res!973102) b!1440675))

(assert (= (and b!1440675 res!973101) b!1440672))

(assert (= (and b!1440672 res!973103) b!1440678))

(assert (= (and b!1440678 res!973100) b!1440676))

(assert (= (and b!1440676 res!973105) b!1440680))

(declare-fun m!1329889 () Bool)

(assert (=> b!1440674 m!1329889))

(assert (=> b!1440674 m!1329889))

(declare-fun m!1329891 () Bool)

(assert (=> b!1440674 m!1329891))

(declare-fun m!1329893 () Bool)

(assert (=> b!1440673 m!1329893))

(declare-fun m!1329895 () Bool)

(assert (=> b!1440675 m!1329895))

(declare-fun m!1329897 () Bool)

(assert (=> b!1440675 m!1329897))

(assert (=> b!1440672 m!1329889))

(assert (=> b!1440672 m!1329889))

(declare-fun m!1329899 () Bool)

(assert (=> b!1440672 m!1329899))

(assert (=> b!1440672 m!1329899))

(assert (=> b!1440672 m!1329889))

(declare-fun m!1329901 () Bool)

(assert (=> b!1440672 m!1329901))

(declare-fun m!1329903 () Bool)

(assert (=> b!1440681 m!1329903))

(assert (=> b!1440678 m!1329889))

(assert (=> b!1440678 m!1329889))

(declare-fun m!1329905 () Bool)

(assert (=> b!1440678 m!1329905))

(assert (=> b!1440676 m!1329895))

(declare-fun m!1329907 () Bool)

(assert (=> b!1440676 m!1329907))

(assert (=> b!1440676 m!1329907))

(declare-fun m!1329909 () Bool)

(assert (=> b!1440676 m!1329909))

(assert (=> b!1440676 m!1329909))

(assert (=> b!1440676 m!1329907))

(declare-fun m!1329911 () Bool)

(assert (=> b!1440676 m!1329911))

(declare-fun m!1329913 () Bool)

(assert (=> start!124504 m!1329913))

(declare-fun m!1329915 () Bool)

(assert (=> start!124504 m!1329915))

(declare-fun m!1329917 () Bool)

(assert (=> b!1440679 m!1329917))

(assert (=> b!1440679 m!1329917))

(declare-fun m!1329919 () Bool)

(assert (=> b!1440679 m!1329919))

(push 1)

