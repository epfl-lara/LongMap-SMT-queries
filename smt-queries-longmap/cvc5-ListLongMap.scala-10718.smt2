; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125420 () Bool)

(assert start!125420)

(declare-fun b!1467424 () Bool)

(declare-fun res!996082 () Bool)

(declare-fun e!824211 () Bool)

(assert (=> b!1467424 (=> (not res!996082) (not e!824211))))

(declare-datatypes ((array!98846 0))(
  ( (array!98847 (arr!47712 (Array (_ BitVec 32) (_ BitVec 64))) (size!48264 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98846)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98846 (_ BitVec 32)) Bool)

(assert (=> b!1467424 (= res!996082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467425 () Bool)

(declare-fun res!996081 () Bool)

(assert (=> b!1467425 (=> (not res!996081) (not e!824211))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467425 (= res!996081 (and (= (size!48264 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48264 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48264 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467426 () Bool)

(assert (=> b!1467426 (= e!824211 false)))

(declare-datatypes ((SeekEntryResult!11977 0))(
  ( (MissingZero!11977 (index!50300 (_ BitVec 32))) (Found!11977 (index!50301 (_ BitVec 32))) (Intermediate!11977 (undefined!12789 Bool) (index!50302 (_ BitVec 32)) (x!131893 (_ BitVec 32))) (Undefined!11977) (MissingVacant!11977 (index!50303 (_ BitVec 32))) )
))
(declare-fun lt!641895 () SeekEntryResult!11977)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98846 (_ BitVec 32)) SeekEntryResult!11977)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467426 (= lt!641895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47712 a!2862) j!93) mask!2687) (select (arr!47712 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467427 () Bool)

(declare-fun res!996085 () Bool)

(assert (=> b!1467427 (=> (not res!996085) (not e!824211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467427 (= res!996085 (validKeyInArray!0 (select (arr!47712 a!2862) i!1006)))))

(declare-fun b!1467428 () Bool)

(declare-fun res!996083 () Bool)

(assert (=> b!1467428 (=> (not res!996083) (not e!824211))))

(assert (=> b!1467428 (= res!996083 (validKeyInArray!0 (select (arr!47712 a!2862) j!93)))))

(declare-fun b!1467429 () Bool)

(declare-fun res!996080 () Bool)

(assert (=> b!1467429 (=> (not res!996080) (not e!824211))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467429 (= res!996080 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48264 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48264 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48264 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47712 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467423 () Bool)

(declare-fun res!996079 () Bool)

(assert (=> b!1467423 (=> (not res!996079) (not e!824211))))

(declare-datatypes ((List!34291 0))(
  ( (Nil!34288) (Cons!34287 (h!35637 (_ BitVec 64)) (t!48977 List!34291)) )
))
(declare-fun arrayNoDuplicates!0 (array!98846 (_ BitVec 32) List!34291) Bool)

(assert (=> b!1467423 (= res!996079 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34288))))

(declare-fun res!996084 () Bool)

(assert (=> start!125420 (=> (not res!996084) (not e!824211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125420 (= res!996084 (validMask!0 mask!2687))))

(assert (=> start!125420 e!824211))

(assert (=> start!125420 true))

(declare-fun array_inv!36945 (array!98846) Bool)

(assert (=> start!125420 (array_inv!36945 a!2862)))

(assert (= (and start!125420 res!996084) b!1467425))

(assert (= (and b!1467425 res!996081) b!1467427))

(assert (= (and b!1467427 res!996085) b!1467428))

(assert (= (and b!1467428 res!996083) b!1467424))

(assert (= (and b!1467424 res!996082) b!1467423))

(assert (= (and b!1467423 res!996079) b!1467429))

(assert (= (and b!1467429 res!996080) b!1467426))

(declare-fun m!1353891 () Bool)

(assert (=> b!1467429 m!1353891))

(declare-fun m!1353893 () Bool)

(assert (=> b!1467429 m!1353893))

(declare-fun m!1353895 () Bool)

(assert (=> b!1467423 m!1353895))

(declare-fun m!1353897 () Bool)

(assert (=> b!1467426 m!1353897))

(assert (=> b!1467426 m!1353897))

(declare-fun m!1353899 () Bool)

(assert (=> b!1467426 m!1353899))

(assert (=> b!1467426 m!1353899))

(assert (=> b!1467426 m!1353897))

(declare-fun m!1353901 () Bool)

(assert (=> b!1467426 m!1353901))

(declare-fun m!1353903 () Bool)

(assert (=> b!1467424 m!1353903))

(declare-fun m!1353905 () Bool)

(assert (=> b!1467427 m!1353905))

(assert (=> b!1467427 m!1353905))

(declare-fun m!1353907 () Bool)

(assert (=> b!1467427 m!1353907))

(assert (=> b!1467428 m!1353897))

(assert (=> b!1467428 m!1353897))

(declare-fun m!1353909 () Bool)

(assert (=> b!1467428 m!1353909))

(declare-fun m!1353911 () Bool)

(assert (=> start!125420 m!1353911))

(declare-fun m!1353913 () Bool)

(assert (=> start!125420 m!1353913))

(push 1)

(assert (not b!1467423))

(assert (not b!1467426))

(assert (not b!1467424))

(assert (not b!1467427))

(assert (not b!1467428))

(assert (not start!125420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

