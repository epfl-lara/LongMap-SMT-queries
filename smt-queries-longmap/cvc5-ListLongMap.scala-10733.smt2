; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125536 () Bool)

(assert start!125536)

(declare-fun b!1468750 () Bool)

(declare-fun e!824685 () Bool)

(declare-fun e!824687 () Bool)

(assert (=> b!1468750 (= e!824685 e!824687)))

(declare-fun res!997292 () Bool)

(assert (=> b!1468750 (=> (not res!997292) (not e!824687))))

(declare-datatypes ((array!98984 0))(
  ( (array!98985 (arr!47780 (Array (_ BitVec 32) (_ BitVec 64))) (size!48330 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98984)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12020 0))(
  ( (MissingZero!12020 (index!50472 (_ BitVec 32))) (Found!12020 (index!50473 (_ BitVec 32))) (Intermediate!12020 (undefined!12832 Bool) (index!50474 (_ BitVec 32)) (x!132061 (_ BitVec 32))) (Undefined!12020) (MissingVacant!12020 (index!50475 (_ BitVec 32))) )
))
(declare-fun lt!642360 () SeekEntryResult!12020)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98984 (_ BitVec 32)) SeekEntryResult!12020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468750 (= res!997292 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47780 a!2862) j!93) mask!2687) (select (arr!47780 a!2862) j!93) a!2862 mask!2687) lt!642360))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468750 (= lt!642360 (Intermediate!12020 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468751 () Bool)

(declare-fun res!997291 () Bool)

(assert (=> b!1468751 (=> (not res!997291) (not e!824685))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468751 (= res!997291 (validKeyInArray!0 (select (arr!47780 a!2862) i!1006)))))

(declare-fun b!1468752 () Bool)

(declare-fun res!997293 () Bool)

(assert (=> b!1468752 (=> (not res!997293) (not e!824687))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1468752 (= res!997293 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47780 a!2862) j!93) a!2862 mask!2687) lt!642360))))

(declare-fun b!1468753 () Bool)

(declare-fun res!997296 () Bool)

(assert (=> b!1468753 (=> (not res!997296) (not e!824685))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468753 (= res!997296 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48330 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48330 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48330 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47780 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!997297 () Bool)

(assert (=> start!125536 (=> (not res!997297) (not e!824685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125536 (= res!997297 (validMask!0 mask!2687))))

(assert (=> start!125536 e!824685))

(assert (=> start!125536 true))

(declare-fun array_inv!36808 (array!98984) Bool)

(assert (=> start!125536 (array_inv!36808 a!2862)))

(declare-fun b!1468754 () Bool)

(declare-fun res!997290 () Bool)

(assert (=> b!1468754 (=> (not res!997290) (not e!824685))))

(assert (=> b!1468754 (= res!997290 (and (= (size!48330 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48330 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48330 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468755 () Bool)

(declare-fun res!997294 () Bool)

(assert (=> b!1468755 (=> (not res!997294) (not e!824685))))

(declare-datatypes ((List!34281 0))(
  ( (Nil!34278) (Cons!34277 (h!35627 (_ BitVec 64)) (t!48975 List!34281)) )
))
(declare-fun arrayNoDuplicates!0 (array!98984 (_ BitVec 32) List!34281) Bool)

(assert (=> b!1468755 (= res!997294 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34278))))

(declare-fun b!1468756 () Bool)

(assert (=> b!1468756 (= e!824687 false)))

(declare-fun lt!642359 () SeekEntryResult!12020)

(assert (=> b!1468756 (= lt!642359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47780 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47780 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98985 (store (arr!47780 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48330 a!2862)) mask!2687))))

(declare-fun b!1468757 () Bool)

(declare-fun res!997289 () Bool)

(assert (=> b!1468757 (=> (not res!997289) (not e!824685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98984 (_ BitVec 32)) Bool)

(assert (=> b!1468757 (= res!997289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468758 () Bool)

(declare-fun res!997295 () Bool)

(assert (=> b!1468758 (=> (not res!997295) (not e!824685))))

(assert (=> b!1468758 (= res!997295 (validKeyInArray!0 (select (arr!47780 a!2862) j!93)))))

(assert (= (and start!125536 res!997297) b!1468754))

(assert (= (and b!1468754 res!997290) b!1468751))

(assert (= (and b!1468751 res!997291) b!1468758))

(assert (= (and b!1468758 res!997295) b!1468757))

(assert (= (and b!1468757 res!997289) b!1468755))

(assert (= (and b!1468755 res!997294) b!1468753))

(assert (= (and b!1468753 res!997296) b!1468750))

(assert (= (and b!1468750 res!997292) b!1468752))

(assert (= (and b!1468752 res!997293) b!1468756))

(declare-fun m!1355869 () Bool)

(assert (=> b!1468750 m!1355869))

(assert (=> b!1468750 m!1355869))

(declare-fun m!1355871 () Bool)

(assert (=> b!1468750 m!1355871))

(assert (=> b!1468750 m!1355871))

(assert (=> b!1468750 m!1355869))

(declare-fun m!1355873 () Bool)

(assert (=> b!1468750 m!1355873))

(declare-fun m!1355875 () Bool)

(assert (=> b!1468753 m!1355875))

(declare-fun m!1355877 () Bool)

(assert (=> b!1468753 m!1355877))

(declare-fun m!1355879 () Bool)

(assert (=> b!1468755 m!1355879))

(assert (=> b!1468756 m!1355875))

(declare-fun m!1355881 () Bool)

(assert (=> b!1468756 m!1355881))

(assert (=> b!1468756 m!1355881))

(declare-fun m!1355883 () Bool)

(assert (=> b!1468756 m!1355883))

(assert (=> b!1468756 m!1355883))

(assert (=> b!1468756 m!1355881))

(declare-fun m!1355885 () Bool)

(assert (=> b!1468756 m!1355885))

(declare-fun m!1355887 () Bool)

(assert (=> b!1468757 m!1355887))

(assert (=> b!1468752 m!1355869))

(assert (=> b!1468752 m!1355869))

(declare-fun m!1355889 () Bool)

(assert (=> b!1468752 m!1355889))

(assert (=> b!1468758 m!1355869))

(assert (=> b!1468758 m!1355869))

(declare-fun m!1355891 () Bool)

(assert (=> b!1468758 m!1355891))

(declare-fun m!1355893 () Bool)

(assert (=> b!1468751 m!1355893))

(assert (=> b!1468751 m!1355893))

(declare-fun m!1355895 () Bool)

(assert (=> b!1468751 m!1355895))

(declare-fun m!1355897 () Bool)

(assert (=> start!125536 m!1355897))

(declare-fun m!1355899 () Bool)

(assert (=> start!125536 m!1355899))

(push 1)

