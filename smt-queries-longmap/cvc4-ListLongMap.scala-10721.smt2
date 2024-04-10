; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125468 () Bool)

(assert start!125468)

(declare-fun b!1467833 () Bool)

(declare-fun res!996377 () Bool)

(declare-fun e!824381 () Bool)

(assert (=> b!1467833 (=> (not res!996377) (not e!824381))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98916 0))(
  ( (array!98917 (arr!47746 (Array (_ BitVec 32) (_ BitVec 64))) (size!48296 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98916)

(assert (=> b!1467833 (= res!996377 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48296 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48296 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48296 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467834 () Bool)

(declare-fun res!996379 () Bool)

(assert (=> b!1467834 (=> (not res!996379) (not e!824381))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467834 (= res!996379 (validKeyInArray!0 (select (arr!47746 a!2862) j!93)))))

(declare-fun b!1467835 () Bool)

(declare-fun res!996376 () Bool)

(assert (=> b!1467835 (=> (not res!996376) (not e!824381))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98916 (_ BitVec 32)) Bool)

(assert (=> b!1467835 (= res!996376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467836 () Bool)

(declare-fun res!996374 () Bool)

(assert (=> b!1467836 (=> (not res!996374) (not e!824381))))

(assert (=> b!1467836 (= res!996374 (validKeyInArray!0 (select (arr!47746 a!2862) i!1006)))))

(declare-fun b!1467837 () Bool)

(assert (=> b!1467837 (= e!824381 false)))

(declare-datatypes ((SeekEntryResult!11986 0))(
  ( (MissingZero!11986 (index!50336 (_ BitVec 32))) (Found!11986 (index!50337 (_ BitVec 32))) (Intermediate!11986 (undefined!12798 Bool) (index!50338 (_ BitVec 32)) (x!131931 (_ BitVec 32))) (Undefined!11986) (MissingVacant!11986 (index!50339 (_ BitVec 32))) )
))
(declare-fun lt!642156 () SeekEntryResult!11986)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98916 (_ BitVec 32)) SeekEntryResult!11986)

(assert (=> b!1467837 (= lt!642156 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47746 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!996372 () Bool)

(assert (=> start!125468 (=> (not res!996372) (not e!824381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125468 (= res!996372 (validMask!0 mask!2687))))

(assert (=> start!125468 e!824381))

(assert (=> start!125468 true))

(declare-fun array_inv!36774 (array!98916) Bool)

(assert (=> start!125468 (array_inv!36774 a!2862)))

(declare-fun b!1467838 () Bool)

(declare-fun res!996375 () Bool)

(assert (=> b!1467838 (=> (not res!996375) (not e!824381))))

(assert (=> b!1467838 (= res!996375 (and (= (size!48296 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48296 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48296 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467839 () Bool)

(declare-fun res!996378 () Bool)

(assert (=> b!1467839 (=> (not res!996378) (not e!824381))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467839 (= res!996378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47746 a!2862) j!93) mask!2687) (select (arr!47746 a!2862) j!93) a!2862 mask!2687) (Intermediate!11986 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467840 () Bool)

(declare-fun res!996373 () Bool)

(assert (=> b!1467840 (=> (not res!996373) (not e!824381))))

(declare-datatypes ((List!34247 0))(
  ( (Nil!34244) (Cons!34243 (h!35593 (_ BitVec 64)) (t!48941 List!34247)) )
))
(declare-fun arrayNoDuplicates!0 (array!98916 (_ BitVec 32) List!34247) Bool)

(assert (=> b!1467840 (= res!996373 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34244))))

(assert (= (and start!125468 res!996372) b!1467838))

(assert (= (and b!1467838 res!996375) b!1467836))

(assert (= (and b!1467836 res!996374) b!1467834))

(assert (= (and b!1467834 res!996379) b!1467835))

(assert (= (and b!1467835 res!996376) b!1467840))

(assert (= (and b!1467840 res!996373) b!1467833))

(assert (= (and b!1467833 res!996377) b!1467839))

(assert (= (and b!1467839 res!996378) b!1467837))

(declare-fun m!1354799 () Bool)

(assert (=> b!1467833 m!1354799))

(declare-fun m!1354801 () Bool)

(assert (=> b!1467833 m!1354801))

(declare-fun m!1354803 () Bool)

(assert (=> b!1467837 m!1354803))

(assert (=> b!1467837 m!1354803))

(declare-fun m!1354805 () Bool)

(assert (=> b!1467837 m!1354805))

(declare-fun m!1354807 () Bool)

(assert (=> start!125468 m!1354807))

(declare-fun m!1354809 () Bool)

(assert (=> start!125468 m!1354809))

(assert (=> b!1467834 m!1354803))

(assert (=> b!1467834 m!1354803))

(declare-fun m!1354811 () Bool)

(assert (=> b!1467834 m!1354811))

(declare-fun m!1354813 () Bool)

(assert (=> b!1467840 m!1354813))

(declare-fun m!1354815 () Bool)

(assert (=> b!1467836 m!1354815))

(assert (=> b!1467836 m!1354815))

(declare-fun m!1354817 () Bool)

(assert (=> b!1467836 m!1354817))

(declare-fun m!1354819 () Bool)

(assert (=> b!1467835 m!1354819))

(assert (=> b!1467839 m!1354803))

(assert (=> b!1467839 m!1354803))

(declare-fun m!1354821 () Bool)

(assert (=> b!1467839 m!1354821))

(assert (=> b!1467839 m!1354821))

(assert (=> b!1467839 m!1354803))

(declare-fun m!1354823 () Bool)

(assert (=> b!1467839 m!1354823))

(push 1)

(assert (not b!1467836))

(assert (not b!1467840))

(assert (not b!1467839))

(assert (not b!1467834))

(assert (not b!1467835))

(assert (not b!1467837))

(assert (not start!125468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

