; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125550 () Bool)

(assert start!125550)

(declare-fun b!1468939 () Bool)

(declare-fun res!997482 () Bool)

(declare-fun e!824750 () Bool)

(assert (=> b!1468939 (=> (not res!997482) (not e!824750))))

(declare-datatypes ((array!98998 0))(
  ( (array!98999 (arr!47787 (Array (_ BitVec 32) (_ BitVec 64))) (size!48337 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98998)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98998 (_ BitVec 32)) Bool)

(assert (=> b!1468939 (= res!997482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468940 () Bool)

(declare-fun res!997485 () Bool)

(declare-fun e!824749 () Bool)

(assert (=> b!1468940 (=> (not res!997485) (not e!824749))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12027 0))(
  ( (MissingZero!12027 (index!50500 (_ BitVec 32))) (Found!12027 (index!50501 (_ BitVec 32))) (Intermediate!12027 (undefined!12839 Bool) (index!50502 (_ BitVec 32)) (x!132084 (_ BitVec 32))) (Undefined!12027) (MissingVacant!12027 (index!50503 (_ BitVec 32))) )
))
(declare-fun lt!642401 () SeekEntryResult!12027)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98998 (_ BitVec 32)) SeekEntryResult!12027)

(assert (=> b!1468940 (= res!997485 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47787 a!2862) j!93) a!2862 mask!2687) lt!642401))))

(declare-fun b!1468941 () Bool)

(declare-fun res!997486 () Bool)

(assert (=> b!1468941 (=> (not res!997486) (not e!824750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468941 (= res!997486 (validKeyInArray!0 (select (arr!47787 a!2862) j!93)))))

(declare-fun b!1468942 () Bool)

(declare-fun res!997480 () Bool)

(assert (=> b!1468942 (=> (not res!997480) (not e!824750))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468942 (= res!997480 (and (= (size!48337 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48337 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48337 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468943 () Bool)

(assert (=> b!1468943 (= e!824749 false)))

(declare-fun lt!642402 () SeekEntryResult!12027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468943 (= lt!642402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47787 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47787 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98999 (store (arr!47787 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48337 a!2862)) mask!2687))))

(declare-fun b!1468944 () Bool)

(declare-fun res!997481 () Bool)

(assert (=> b!1468944 (=> (not res!997481) (not e!824750))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1468944 (= res!997481 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48337 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48337 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48337 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47787 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468945 () Bool)

(assert (=> b!1468945 (= e!824750 e!824749)))

(declare-fun res!997478 () Bool)

(assert (=> b!1468945 (=> (not res!997478) (not e!824749))))

(assert (=> b!1468945 (= res!997478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47787 a!2862) j!93) mask!2687) (select (arr!47787 a!2862) j!93) a!2862 mask!2687) lt!642401))))

(assert (=> b!1468945 (= lt!642401 (Intermediate!12027 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997479 () Bool)

(assert (=> start!125550 (=> (not res!997479) (not e!824750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125550 (= res!997479 (validMask!0 mask!2687))))

(assert (=> start!125550 e!824750))

(assert (=> start!125550 true))

(declare-fun array_inv!36815 (array!98998) Bool)

(assert (=> start!125550 (array_inv!36815 a!2862)))

(declare-fun b!1468946 () Bool)

(declare-fun res!997484 () Bool)

(assert (=> b!1468946 (=> (not res!997484) (not e!824750))))

(assert (=> b!1468946 (= res!997484 (validKeyInArray!0 (select (arr!47787 a!2862) i!1006)))))

(declare-fun b!1468947 () Bool)

(declare-fun res!997483 () Bool)

(assert (=> b!1468947 (=> (not res!997483) (not e!824750))))

(declare-datatypes ((List!34288 0))(
  ( (Nil!34285) (Cons!34284 (h!35634 (_ BitVec 64)) (t!48982 List!34288)) )
))
(declare-fun arrayNoDuplicates!0 (array!98998 (_ BitVec 32) List!34288) Bool)

(assert (=> b!1468947 (= res!997483 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34285))))

(assert (= (and start!125550 res!997479) b!1468942))

(assert (= (and b!1468942 res!997480) b!1468946))

(assert (= (and b!1468946 res!997484) b!1468941))

(assert (= (and b!1468941 res!997486) b!1468939))

(assert (= (and b!1468939 res!997482) b!1468947))

(assert (= (and b!1468947 res!997483) b!1468944))

(assert (= (and b!1468944 res!997481) b!1468945))

(assert (= (and b!1468945 res!997478) b!1468940))

(assert (= (and b!1468940 res!997485) b!1468943))

(declare-fun m!1356093 () Bool)

(assert (=> b!1468944 m!1356093))

(declare-fun m!1356095 () Bool)

(assert (=> b!1468944 m!1356095))

(declare-fun m!1356097 () Bool)

(assert (=> b!1468939 m!1356097))

(declare-fun m!1356099 () Bool)

(assert (=> b!1468941 m!1356099))

(assert (=> b!1468941 m!1356099))

(declare-fun m!1356101 () Bool)

(assert (=> b!1468941 m!1356101))

(assert (=> b!1468943 m!1356093))

(declare-fun m!1356103 () Bool)

(assert (=> b!1468943 m!1356103))

(assert (=> b!1468943 m!1356103))

(declare-fun m!1356105 () Bool)

(assert (=> b!1468943 m!1356105))

(assert (=> b!1468943 m!1356105))

(assert (=> b!1468943 m!1356103))

(declare-fun m!1356107 () Bool)

(assert (=> b!1468943 m!1356107))

(declare-fun m!1356109 () Bool)

(assert (=> b!1468947 m!1356109))

(declare-fun m!1356111 () Bool)

(assert (=> start!125550 m!1356111))

(declare-fun m!1356113 () Bool)

(assert (=> start!125550 m!1356113))

(assert (=> b!1468940 m!1356099))

(assert (=> b!1468940 m!1356099))

(declare-fun m!1356115 () Bool)

(assert (=> b!1468940 m!1356115))

(declare-fun m!1356117 () Bool)

(assert (=> b!1468946 m!1356117))

(assert (=> b!1468946 m!1356117))

(declare-fun m!1356119 () Bool)

(assert (=> b!1468946 m!1356119))

(assert (=> b!1468945 m!1356099))

(assert (=> b!1468945 m!1356099))

(declare-fun m!1356121 () Bool)

(assert (=> b!1468945 m!1356121))

(assert (=> b!1468945 m!1356121))

(assert (=> b!1468945 m!1356099))

(declare-fun m!1356123 () Bool)

(assert (=> b!1468945 m!1356123))

(check-sat (not b!1468947) (not b!1468946) (not b!1468940) (not start!125550) (not b!1468939) (not b!1468941) (not b!1468943) (not b!1468945))
(check-sat)
