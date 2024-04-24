; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125784 () Bool)

(assert start!125784)

(declare-fun b!1470053 () Bool)

(declare-fun res!997495 () Bool)

(declare-fun e!825615 () Bool)

(assert (=> b!1470053 (=> (not res!997495) (not e!825615))))

(declare-datatypes ((array!99070 0))(
  ( (array!99071 (arr!47818 (Array (_ BitVec 32) (_ BitVec 64))) (size!48369 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99070)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470053 (= res!997495 (validKeyInArray!0 (select (arr!47818 a!2862) j!93)))))

(declare-fun b!1470054 () Bool)

(declare-fun res!997500 () Bool)

(declare-fun e!825614 () Bool)

(assert (=> b!1470054 (=> (not res!997500) (not e!825614))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11955 0))(
  ( (MissingZero!11955 (index!50212 (_ BitVec 32))) (Found!11955 (index!50213 (_ BitVec 32))) (Intermediate!11955 (undefined!12767 Bool) (index!50214 (_ BitVec 32)) (x!131989 (_ BitVec 32))) (Undefined!11955) (MissingVacant!11955 (index!50215 (_ BitVec 32))) )
))
(declare-fun lt!642906 () SeekEntryResult!11955)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99070 (_ BitVec 32)) SeekEntryResult!11955)

(assert (=> b!1470054 (= res!997500 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47818 a!2862) j!93) a!2862 mask!2687) lt!642906))))

(declare-fun b!1470055 () Bool)

(declare-fun res!997499 () Bool)

(assert (=> b!1470055 (=> (not res!997499) (not e!825615))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470055 (= res!997499 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48369 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48369 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48369 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!997496 () Bool)

(assert (=> start!125784 (=> (not res!997496) (not e!825615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125784 (= res!997496 (validMask!0 mask!2687))))

(assert (=> start!125784 e!825615))

(assert (=> start!125784 true))

(declare-fun array_inv!37099 (array!99070) Bool)

(assert (=> start!125784 (array_inv!37099 a!2862)))

(declare-fun b!1470056 () Bool)

(assert (=> b!1470056 (= e!825614 false)))

(declare-fun lt!642907 () SeekEntryResult!11955)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470056 (= lt!642907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99071 (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48369 a!2862)) mask!2687))))

(declare-fun b!1470057 () Bool)

(declare-fun res!997498 () Bool)

(assert (=> b!1470057 (=> (not res!997498) (not e!825615))))

(declare-datatypes ((List!34306 0))(
  ( (Nil!34303) (Cons!34302 (h!35666 (_ BitVec 64)) (t!48992 List!34306)) )
))
(declare-fun arrayNoDuplicates!0 (array!99070 (_ BitVec 32) List!34306) Bool)

(assert (=> b!1470057 (= res!997498 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34303))))

(declare-fun b!1470058 () Bool)

(declare-fun res!997494 () Bool)

(assert (=> b!1470058 (=> (not res!997494) (not e!825615))))

(assert (=> b!1470058 (= res!997494 (validKeyInArray!0 (select (arr!47818 a!2862) i!1006)))))

(declare-fun b!1470059 () Bool)

(assert (=> b!1470059 (= e!825615 e!825614)))

(declare-fun res!997497 () Bool)

(assert (=> b!1470059 (=> (not res!997497) (not e!825614))))

(assert (=> b!1470059 (= res!997497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47818 a!2862) j!93) mask!2687) (select (arr!47818 a!2862) j!93) a!2862 mask!2687) lt!642906))))

(assert (=> b!1470059 (= lt!642906 (Intermediate!11955 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470060 () Bool)

(declare-fun res!997501 () Bool)

(assert (=> b!1470060 (=> (not res!997501) (not e!825615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99070 (_ BitVec 32)) Bool)

(assert (=> b!1470060 (= res!997501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470061 () Bool)

(declare-fun res!997502 () Bool)

(assert (=> b!1470061 (=> (not res!997502) (not e!825615))))

(assert (=> b!1470061 (= res!997502 (and (= (size!48369 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48369 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48369 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125784 res!997496) b!1470061))

(assert (= (and b!1470061 res!997502) b!1470058))

(assert (= (and b!1470058 res!997494) b!1470053))

(assert (= (and b!1470053 res!997495) b!1470060))

(assert (= (and b!1470060 res!997501) b!1470057))

(assert (= (and b!1470057 res!997498) b!1470055))

(assert (= (and b!1470055 res!997499) b!1470059))

(assert (= (and b!1470059 res!997497) b!1470054))

(assert (= (and b!1470054 res!997500) b!1470056))

(declare-fun m!1357075 () Bool)

(assert (=> b!1470057 m!1357075))

(declare-fun m!1357077 () Bool)

(assert (=> start!125784 m!1357077))

(declare-fun m!1357079 () Bool)

(assert (=> start!125784 m!1357079))

(declare-fun m!1357081 () Bool)

(assert (=> b!1470060 m!1357081))

(declare-fun m!1357083 () Bool)

(assert (=> b!1470055 m!1357083))

(declare-fun m!1357085 () Bool)

(assert (=> b!1470055 m!1357085))

(declare-fun m!1357087 () Bool)

(assert (=> b!1470053 m!1357087))

(assert (=> b!1470053 m!1357087))

(declare-fun m!1357089 () Bool)

(assert (=> b!1470053 m!1357089))

(assert (=> b!1470056 m!1357083))

(declare-fun m!1357091 () Bool)

(assert (=> b!1470056 m!1357091))

(assert (=> b!1470056 m!1357091))

(declare-fun m!1357093 () Bool)

(assert (=> b!1470056 m!1357093))

(assert (=> b!1470056 m!1357093))

(assert (=> b!1470056 m!1357091))

(declare-fun m!1357095 () Bool)

(assert (=> b!1470056 m!1357095))

(assert (=> b!1470059 m!1357087))

(assert (=> b!1470059 m!1357087))

(declare-fun m!1357097 () Bool)

(assert (=> b!1470059 m!1357097))

(assert (=> b!1470059 m!1357097))

(assert (=> b!1470059 m!1357087))

(declare-fun m!1357099 () Bool)

(assert (=> b!1470059 m!1357099))

(assert (=> b!1470054 m!1357087))

(assert (=> b!1470054 m!1357087))

(declare-fun m!1357101 () Bool)

(assert (=> b!1470054 m!1357101))

(declare-fun m!1357103 () Bool)

(assert (=> b!1470058 m!1357103))

(assert (=> b!1470058 m!1357103))

(declare-fun m!1357105 () Bool)

(assert (=> b!1470058 m!1357105))

(check-sat (not b!1470059) (not b!1470053) (not start!125784) (not b!1470058) (not b!1470056) (not b!1470057) (not b!1470054) (not b!1470060))
(check-sat)
