; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125484 () Bool)

(assert start!125484)

(declare-fun b!1468048 () Bool)

(declare-fun res!996588 () Bool)

(declare-fun e!824452 () Bool)

(assert (=> b!1468048 (=> (not res!996588) (not e!824452))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98932 0))(
  ( (array!98933 (arr!47754 (Array (_ BitVec 32) (_ BitVec 64))) (size!48304 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98932)

(assert (=> b!1468048 (= res!996588 (and (= (size!48304 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48304 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48304 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468049 () Bool)

(declare-fun res!996593 () Bool)

(assert (=> b!1468049 (=> (not res!996593) (not e!824452))))

(declare-datatypes ((List!34255 0))(
  ( (Nil!34252) (Cons!34251 (h!35601 (_ BitVec 64)) (t!48949 List!34255)) )
))
(declare-fun arrayNoDuplicates!0 (array!98932 (_ BitVec 32) List!34255) Bool)

(assert (=> b!1468049 (= res!996593 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34252))))

(declare-fun b!1468050 () Bool)

(declare-fun e!824453 () Bool)

(assert (=> b!1468050 (= e!824453 false)))

(declare-datatypes ((SeekEntryResult!11994 0))(
  ( (MissingZero!11994 (index!50368 (_ BitVec 32))) (Found!11994 (index!50369 (_ BitVec 32))) (Intermediate!11994 (undefined!12806 Bool) (index!50370 (_ BitVec 32)) (x!131963 (_ BitVec 32))) (Undefined!11994) (MissingVacant!11994 (index!50371 (_ BitVec 32))) )
))
(declare-fun lt!642204 () SeekEntryResult!11994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98932 (_ BitVec 32)) SeekEntryResult!11994)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468050 (= lt!642204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47754 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47754 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98933 (store (arr!47754 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48304 a!2862)) mask!2687))))

(declare-fun b!1468052 () Bool)

(declare-fun res!996589 () Bool)

(assert (=> b!1468052 (=> (not res!996589) (not e!824452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98932 (_ BitVec 32)) Bool)

(assert (=> b!1468052 (= res!996589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468053 () Bool)

(declare-fun res!996594 () Bool)

(assert (=> b!1468053 (=> (not res!996594) (not e!824453))))

(declare-fun lt!642203 () SeekEntryResult!11994)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468053 (= res!996594 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47754 a!2862) j!93) a!2862 mask!2687) lt!642203))))

(declare-fun b!1468054 () Bool)

(declare-fun res!996590 () Bool)

(assert (=> b!1468054 (=> (not res!996590) (not e!824452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468054 (= res!996590 (validKeyInArray!0 (select (arr!47754 a!2862) j!93)))))

(declare-fun res!996591 () Bool)

(assert (=> start!125484 (=> (not res!996591) (not e!824452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125484 (= res!996591 (validMask!0 mask!2687))))

(assert (=> start!125484 e!824452))

(assert (=> start!125484 true))

(declare-fun array_inv!36782 (array!98932) Bool)

(assert (=> start!125484 (array_inv!36782 a!2862)))

(declare-fun b!1468051 () Bool)

(declare-fun res!996595 () Bool)

(assert (=> b!1468051 (=> (not res!996595) (not e!824452))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468051 (= res!996595 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48304 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48304 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48304 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47754 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468055 () Bool)

(assert (=> b!1468055 (= e!824452 e!824453)))

(declare-fun res!996587 () Bool)

(assert (=> b!1468055 (=> (not res!996587) (not e!824453))))

(assert (=> b!1468055 (= res!996587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47754 a!2862) j!93) mask!2687) (select (arr!47754 a!2862) j!93) a!2862 mask!2687) lt!642203))))

(assert (=> b!1468055 (= lt!642203 (Intermediate!11994 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468056 () Bool)

(declare-fun res!996592 () Bool)

(assert (=> b!1468056 (=> (not res!996592) (not e!824452))))

(assert (=> b!1468056 (= res!996592 (validKeyInArray!0 (select (arr!47754 a!2862) i!1006)))))

(assert (= (and start!125484 res!996591) b!1468048))

(assert (= (and b!1468048 res!996588) b!1468056))

(assert (= (and b!1468056 res!996592) b!1468054))

(assert (= (and b!1468054 res!996590) b!1468052))

(assert (= (and b!1468052 res!996589) b!1468049))

(assert (= (and b!1468049 res!996593) b!1468051))

(assert (= (and b!1468051 res!996595) b!1468055))

(assert (= (and b!1468055 res!996587) b!1468053))

(assert (= (and b!1468053 res!996594) b!1468050))

(declare-fun m!1355037 () Bool)

(assert (=> b!1468051 m!1355037))

(declare-fun m!1355039 () Bool)

(assert (=> b!1468051 m!1355039))

(declare-fun m!1355041 () Bool)

(assert (=> b!1468054 m!1355041))

(assert (=> b!1468054 m!1355041))

(declare-fun m!1355043 () Bool)

(assert (=> b!1468054 m!1355043))

(assert (=> b!1468055 m!1355041))

(assert (=> b!1468055 m!1355041))

(declare-fun m!1355045 () Bool)

(assert (=> b!1468055 m!1355045))

(assert (=> b!1468055 m!1355045))

(assert (=> b!1468055 m!1355041))

(declare-fun m!1355047 () Bool)

(assert (=> b!1468055 m!1355047))

(assert (=> b!1468050 m!1355037))

(declare-fun m!1355049 () Bool)

(assert (=> b!1468050 m!1355049))

(assert (=> b!1468050 m!1355049))

(declare-fun m!1355051 () Bool)

(assert (=> b!1468050 m!1355051))

(assert (=> b!1468050 m!1355051))

(assert (=> b!1468050 m!1355049))

(declare-fun m!1355053 () Bool)

(assert (=> b!1468050 m!1355053))

(declare-fun m!1355055 () Bool)

(assert (=> start!125484 m!1355055))

(declare-fun m!1355057 () Bool)

(assert (=> start!125484 m!1355057))

(declare-fun m!1355059 () Bool)

(assert (=> b!1468056 m!1355059))

(assert (=> b!1468056 m!1355059))

(declare-fun m!1355061 () Bool)

(assert (=> b!1468056 m!1355061))

(declare-fun m!1355063 () Bool)

(assert (=> b!1468052 m!1355063))

(assert (=> b!1468053 m!1355041))

(assert (=> b!1468053 m!1355041))

(declare-fun m!1355065 () Bool)

(assert (=> b!1468053 m!1355065))

(declare-fun m!1355067 () Bool)

(assert (=> b!1468049 m!1355067))

(check-sat (not b!1468050) (not b!1468056) (not b!1468054) (not b!1468049) (not b!1468055) (not b!1468053) (not start!125484) (not b!1468052))
(check-sat)
