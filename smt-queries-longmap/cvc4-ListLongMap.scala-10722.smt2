; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125474 () Bool)

(assert start!125474)

(declare-fun b!1467913 () Bool)

(declare-fun res!996460 () Bool)

(declare-fun e!824408 () Bool)

(assert (=> b!1467913 (=> (not res!996460) (not e!824408))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98922 0))(
  ( (array!98923 (arr!47749 (Array (_ BitVec 32) (_ BitVec 64))) (size!48299 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98922)

(assert (=> b!1467913 (= res!996460 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48299 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48299 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48299 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467914 () Bool)

(declare-fun res!996452 () Bool)

(assert (=> b!1467914 (=> (not res!996452) (not e!824408))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98922 (_ BitVec 32)) Bool)

(assert (=> b!1467914 (= res!996452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467915 () Bool)

(declare-fun res!996456 () Bool)

(assert (=> b!1467915 (=> (not res!996456) (not e!824408))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467915 (= res!996456 (and (= (size!48299 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48299 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48299 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467916 () Bool)

(declare-fun res!996455 () Bool)

(assert (=> b!1467916 (=> (not res!996455) (not e!824408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467916 (= res!996455 (validKeyInArray!0 (select (arr!47749 a!2862) j!93)))))

(declare-fun b!1467917 () Bool)

(declare-fun res!996459 () Bool)

(declare-fun e!824407 () Bool)

(assert (=> b!1467917 (=> (not res!996459) (not e!824407))))

(declare-datatypes ((SeekEntryResult!11989 0))(
  ( (MissingZero!11989 (index!50348 (_ BitVec 32))) (Found!11989 (index!50349 (_ BitVec 32))) (Intermediate!11989 (undefined!12801 Bool) (index!50350 (_ BitVec 32)) (x!131942 (_ BitVec 32))) (Undefined!11989) (MissingVacant!11989 (index!50351 (_ BitVec 32))) )
))
(declare-fun lt!642173 () SeekEntryResult!11989)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98922 (_ BitVec 32)) SeekEntryResult!11989)

(assert (=> b!1467917 (= res!996459 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47749 a!2862) j!93) a!2862 mask!2687) lt!642173))))

(declare-fun b!1467918 () Bool)

(declare-fun res!996458 () Bool)

(assert (=> b!1467918 (=> (not res!996458) (not e!824408))))

(declare-datatypes ((List!34250 0))(
  ( (Nil!34247) (Cons!34246 (h!35596 (_ BitVec 64)) (t!48944 List!34250)) )
))
(declare-fun arrayNoDuplicates!0 (array!98922 (_ BitVec 32) List!34250) Bool)

(assert (=> b!1467918 (= res!996458 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34247))))

(declare-fun res!996457 () Bool)

(assert (=> start!125474 (=> (not res!996457) (not e!824408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125474 (= res!996457 (validMask!0 mask!2687))))

(assert (=> start!125474 e!824408))

(assert (=> start!125474 true))

(declare-fun array_inv!36777 (array!98922) Bool)

(assert (=> start!125474 (array_inv!36777 a!2862)))

(declare-fun b!1467919 () Bool)

(declare-fun res!996453 () Bool)

(assert (=> b!1467919 (=> (not res!996453) (not e!824408))))

(assert (=> b!1467919 (= res!996453 (validKeyInArray!0 (select (arr!47749 a!2862) i!1006)))))

(declare-fun b!1467920 () Bool)

(assert (=> b!1467920 (= e!824408 e!824407)))

(declare-fun res!996454 () Bool)

(assert (=> b!1467920 (=> (not res!996454) (not e!824407))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467920 (= res!996454 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47749 a!2862) j!93) mask!2687) (select (arr!47749 a!2862) j!93) a!2862 mask!2687) lt!642173))))

(assert (=> b!1467920 (= lt!642173 (Intermediate!11989 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467921 () Bool)

(assert (=> b!1467921 (= e!824407 false)))

(declare-fun lt!642174 () (_ BitVec 32))

(assert (=> b!1467921 (= lt!642174 (toIndex!0 (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!125474 res!996457) b!1467915))

(assert (= (and b!1467915 res!996456) b!1467919))

(assert (= (and b!1467919 res!996453) b!1467916))

(assert (= (and b!1467916 res!996455) b!1467914))

(assert (= (and b!1467914 res!996452) b!1467918))

(assert (= (and b!1467918 res!996458) b!1467913))

(assert (= (and b!1467913 res!996460) b!1467920))

(assert (= (and b!1467920 res!996454) b!1467917))

(assert (= (and b!1467917 res!996459) b!1467921))

(declare-fun m!1354885 () Bool)

(assert (=> b!1467917 m!1354885))

(assert (=> b!1467917 m!1354885))

(declare-fun m!1354887 () Bool)

(assert (=> b!1467917 m!1354887))

(declare-fun m!1354889 () Bool)

(assert (=> b!1467919 m!1354889))

(assert (=> b!1467919 m!1354889))

(declare-fun m!1354891 () Bool)

(assert (=> b!1467919 m!1354891))

(declare-fun m!1354893 () Bool)

(assert (=> b!1467918 m!1354893))

(declare-fun m!1354895 () Bool)

(assert (=> b!1467921 m!1354895))

(declare-fun m!1354897 () Bool)

(assert (=> b!1467921 m!1354897))

(assert (=> b!1467921 m!1354897))

(declare-fun m!1354899 () Bool)

(assert (=> b!1467921 m!1354899))

(assert (=> b!1467913 m!1354895))

(declare-fun m!1354901 () Bool)

(assert (=> b!1467913 m!1354901))

(declare-fun m!1354903 () Bool)

(assert (=> start!125474 m!1354903))

(declare-fun m!1354905 () Bool)

(assert (=> start!125474 m!1354905))

(declare-fun m!1354907 () Bool)

(assert (=> b!1467914 m!1354907))

(assert (=> b!1467920 m!1354885))

(assert (=> b!1467920 m!1354885))

(declare-fun m!1354909 () Bool)

(assert (=> b!1467920 m!1354909))

(assert (=> b!1467920 m!1354909))

(assert (=> b!1467920 m!1354885))

(declare-fun m!1354911 () Bool)

(assert (=> b!1467920 m!1354911))

(assert (=> b!1467916 m!1354885))

(assert (=> b!1467916 m!1354885))

(declare-fun m!1354913 () Bool)

(assert (=> b!1467916 m!1354913))

(push 1)

(assert (not start!125474))

(assert (not b!1467917))

(assert (not b!1467916))

(assert (not b!1467920))

(assert (not b!1467921))

(assert (not b!1467919))

(assert (not b!1467918))

(assert (not b!1467914))

(check-sat)

(pop 1)

