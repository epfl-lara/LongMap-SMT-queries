; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124502 () Bool)

(assert start!124502)

(declare-fun res!973076 () Bool)

(declare-fun e!812249 () Bool)

(assert (=> start!124502 (=> (not res!973076) (not e!812249))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124502 (= res!973076 (validMask!0 mask!2687))))

(assert (=> start!124502 e!812249))

(assert (=> start!124502 true))

(declare-datatypes ((array!97950 0))(
  ( (array!97951 (arr!47263 (Array (_ BitVec 32) (_ BitVec 64))) (size!47813 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97950)

(declare-fun array_inv!36291 (array!97950) Bool)

(assert (=> start!124502 (array_inv!36291 a!2862)))

(declare-fun b!1440643 () Bool)

(declare-fun res!973075 () Bool)

(assert (=> b!1440643 (=> (not res!973075) (not e!812249))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440643 (= res!973075 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47813 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47813 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47813 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440644 () Bool)

(declare-fun res!973078 () Bool)

(assert (=> b!1440644 (=> (not res!973078) (not e!812249))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440644 (= res!973078 (validKeyInArray!0 (select (arr!47263 a!2862) j!93)))))

(declare-fun b!1440645 () Bool)

(declare-fun e!812248 () Bool)

(assert (=> b!1440645 (= e!812248 false)))

(declare-datatypes ((SeekEntryResult!11515 0))(
  ( (MissingZero!11515 (index!48452 (_ BitVec 32))) (Found!11515 (index!48453 (_ BitVec 32))) (Intermediate!11515 (undefined!12327 Bool) (index!48454 (_ BitVec 32)) (x!130172 (_ BitVec 32))) (Undefined!11515) (MissingVacant!11515 (index!48455 (_ BitVec 32))) )
))
(declare-fun lt!633003 () SeekEntryResult!11515)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97950 (_ BitVec 32)) SeekEntryResult!11515)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440645 (= lt!633003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97951 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47813 a!2862)) mask!2687))))

(declare-fun b!1440646 () Bool)

(declare-fun res!973073 () Bool)

(assert (=> b!1440646 (=> (not res!973073) (not e!812249))))

(declare-datatypes ((List!33764 0))(
  ( (Nil!33761) (Cons!33760 (h!35110 (_ BitVec 64)) (t!48458 List!33764)) )
))
(declare-fun arrayNoDuplicates!0 (array!97950 (_ BitVec 32) List!33764) Bool)

(assert (=> b!1440646 (= res!973073 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33761))))

(declare-fun b!1440647 () Bool)

(assert (=> b!1440647 (= e!812249 e!812248)))

(declare-fun res!973074 () Bool)

(assert (=> b!1440647 (=> (not res!973074) (not e!812248))))

(declare-fun lt!633002 () SeekEntryResult!11515)

(assert (=> b!1440647 (= res!973074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633002))))

(assert (=> b!1440647 (= lt!633002 (Intermediate!11515 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440648 () Bool)

(declare-fun res!973072 () Bool)

(assert (=> b!1440648 (=> (not res!973072) (not e!812249))))

(assert (=> b!1440648 (= res!973072 (and (= (size!47813 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47813 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47813 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440649 () Bool)

(declare-fun res!973077 () Bool)

(assert (=> b!1440649 (=> (not res!973077) (not e!812249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97950 (_ BitVec 32)) Bool)

(assert (=> b!1440649 (= res!973077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440650 () Bool)

(declare-fun res!973070 () Bool)

(assert (=> b!1440650 (=> (not res!973070) (not e!812248))))

(assert (=> b!1440650 (= res!973070 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633002))))

(declare-fun b!1440651 () Bool)

(declare-fun res!973071 () Bool)

(assert (=> b!1440651 (=> (not res!973071) (not e!812249))))

(assert (=> b!1440651 (= res!973071 (validKeyInArray!0 (select (arr!47263 a!2862) i!1006)))))

(assert (= (and start!124502 res!973076) b!1440648))

(assert (= (and b!1440648 res!973072) b!1440651))

(assert (= (and b!1440651 res!973071) b!1440644))

(assert (= (and b!1440644 res!973078) b!1440649))

(assert (= (and b!1440649 res!973077) b!1440646))

(assert (= (and b!1440646 res!973073) b!1440643))

(assert (= (and b!1440643 res!973075) b!1440647))

(assert (= (and b!1440647 res!973074) b!1440650))

(assert (= (and b!1440650 res!973070) b!1440645))

(declare-fun m!1329857 () Bool)

(assert (=> start!124502 m!1329857))

(declare-fun m!1329859 () Bool)

(assert (=> start!124502 m!1329859))

(declare-fun m!1329861 () Bool)

(assert (=> b!1440645 m!1329861))

(declare-fun m!1329863 () Bool)

(assert (=> b!1440645 m!1329863))

(assert (=> b!1440645 m!1329863))

(declare-fun m!1329865 () Bool)

(assert (=> b!1440645 m!1329865))

(assert (=> b!1440645 m!1329865))

(assert (=> b!1440645 m!1329863))

(declare-fun m!1329867 () Bool)

(assert (=> b!1440645 m!1329867))

(declare-fun m!1329869 () Bool)

(assert (=> b!1440651 m!1329869))

(assert (=> b!1440651 m!1329869))

(declare-fun m!1329871 () Bool)

(assert (=> b!1440651 m!1329871))

(declare-fun m!1329873 () Bool)

(assert (=> b!1440650 m!1329873))

(assert (=> b!1440650 m!1329873))

(declare-fun m!1329875 () Bool)

(assert (=> b!1440650 m!1329875))

(declare-fun m!1329877 () Bool)

(assert (=> b!1440649 m!1329877))

(assert (=> b!1440643 m!1329861))

(declare-fun m!1329879 () Bool)

(assert (=> b!1440643 m!1329879))

(declare-fun m!1329881 () Bool)

(assert (=> b!1440646 m!1329881))

(assert (=> b!1440644 m!1329873))

(assert (=> b!1440644 m!1329873))

(declare-fun m!1329883 () Bool)

(assert (=> b!1440644 m!1329883))

(assert (=> b!1440647 m!1329873))

(assert (=> b!1440647 m!1329873))

(declare-fun m!1329885 () Bool)

(assert (=> b!1440647 m!1329885))

(assert (=> b!1440647 m!1329885))

(assert (=> b!1440647 m!1329873))

(declare-fun m!1329887 () Bool)

(assert (=> b!1440647 m!1329887))

(push 1)

(assert (not b!1440647))

(assert (not b!1440651))

(assert (not b!1440644))

(assert (not b!1440650))

(assert (not b!1440645))

(assert (not b!1440649))

(assert (not start!124502))

(assert (not b!1440646))

