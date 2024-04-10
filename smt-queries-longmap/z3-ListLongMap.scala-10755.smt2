; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125790 () Bool)

(assert start!125790)

(declare-fun e!826304 () Bool)

(declare-fun lt!643536 () (_ BitVec 64))

(declare-fun b!1472315 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99124 0))(
  ( (array!99125 (arr!47847 (Array (_ BitVec 32) (_ BitVec 64))) (size!48397 (_ BitVec 32))) )
))
(declare-fun lt!643539 () array!99124)

(declare-datatypes ((SeekEntryResult!12087 0))(
  ( (MissingZero!12087 (index!50740 (_ BitVec 32))) (Found!12087 (index!50741 (_ BitVec 32))) (Intermediate!12087 (undefined!12899 Bool) (index!50742 (_ BitVec 32)) (x!132322 (_ BitVec 32))) (Undefined!12087) (MissingVacant!12087 (index!50743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99124 (_ BitVec 32)) SeekEntryResult!12087)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99124 (_ BitVec 32)) SeekEntryResult!12087)

(assert (=> b!1472315 (= e!826304 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643536 lt!643539 mask!2687) (seekEntryOrOpen!0 lt!643536 lt!643539 mask!2687)))))

(declare-fun b!1472316 () Bool)

(declare-fun res!999995 () Bool)

(declare-fun e!826300 () Bool)

(assert (=> b!1472316 (=> (not res!999995) (not e!826300))))

(declare-fun a!2862 () array!99124)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472316 (= res!999995 (validKeyInArray!0 (select (arr!47847 a!2862) j!93)))))

(declare-fun b!1472317 () Bool)

(declare-fun res!999999 () Bool)

(assert (=> b!1472317 (=> (not res!999999) (not e!826300))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472317 (= res!999999 (validKeyInArray!0 (select (arr!47847 a!2862) i!1006)))))

(declare-fun b!1472318 () Bool)

(declare-fun e!826302 () Bool)

(assert (=> b!1472318 (= e!826300 e!826302)))

(declare-fun res!999994 () Bool)

(assert (=> b!1472318 (=> (not res!999994) (not e!826302))))

(assert (=> b!1472318 (= res!999994 (= (select (store (arr!47847 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472318 (= lt!643539 (array!99125 (store (arr!47847 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48397 a!2862)))))

(declare-fun b!1472319 () Bool)

(declare-fun res!1000006 () Bool)

(assert (=> b!1472319 (=> (not res!1000006) (not e!826300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99124 (_ BitVec 32)) Bool)

(assert (=> b!1472319 (= res!1000006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472320 () Bool)

(declare-fun res!999998 () Bool)

(assert (=> b!1472320 (=> (not res!999998) (not e!826300))))

(declare-datatypes ((List!34348 0))(
  ( (Nil!34345) (Cons!34344 (h!35700 (_ BitVec 64)) (t!49042 List!34348)) )
))
(declare-fun arrayNoDuplicates!0 (array!99124 (_ BitVec 32) List!34348) Bool)

(assert (=> b!1472320 (= res!999998 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34345))))

(declare-fun res!999992 () Bool)

(assert (=> start!125790 (=> (not res!999992) (not e!826300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125790 (= res!999992 (validMask!0 mask!2687))))

(assert (=> start!125790 e!826300))

(assert (=> start!125790 true))

(declare-fun array_inv!36875 (array!99124) Bool)

(assert (=> start!125790 (array_inv!36875 a!2862)))

(declare-fun b!1472321 () Bool)

(declare-fun res!1000001 () Bool)

(declare-fun e!826298 () Bool)

(assert (=> b!1472321 (=> (not res!1000001) (not e!826298))))

(assert (=> b!1472321 (= res!1000001 e!826304)))

(declare-fun c!135675 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472321 (= c!135675 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!643538 () SeekEntryResult!12087)

(declare-fun b!1472322 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99124 (_ BitVec 32)) SeekEntryResult!12087)

(assert (=> b!1472322 (= e!826304 (= lt!643538 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643536 lt!643539 mask!2687)))))

(declare-fun b!1472323 () Bool)

(declare-fun res!999996 () Bool)

(assert (=> b!1472323 (=> (not res!999996) (not e!826300))))

(assert (=> b!1472323 (= res!999996 (and (= (size!48397 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48397 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48397 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472324 () Bool)

(declare-fun e!826301 () Bool)

(assert (=> b!1472324 (= e!826302 e!826301)))

(declare-fun res!1000005 () Bool)

(assert (=> b!1472324 (=> (not res!1000005) (not e!826301))))

(declare-fun lt!643537 () SeekEntryResult!12087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472324 (= res!1000005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47847 a!2862) j!93) mask!2687) (select (arr!47847 a!2862) j!93) a!2862 mask!2687) lt!643537))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472324 (= lt!643537 (Intermediate!12087 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472325 () Bool)

(assert (=> b!1472325 (= e!826298 (not true))))

(declare-fun e!826299 () Bool)

(assert (=> b!1472325 e!826299))

(declare-fun res!999997 () Bool)

(assert (=> b!1472325 (=> (not res!999997) (not e!826299))))

(assert (=> b!1472325 (= res!999997 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49514 0))(
  ( (Unit!49515) )
))
(declare-fun lt!643535 () Unit!49514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49514)

(assert (=> b!1472325 (= lt!643535 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472326 () Bool)

(assert (=> b!1472326 (= e!826301 e!826298)))

(declare-fun res!1000002 () Bool)

(assert (=> b!1472326 (=> (not res!1000002) (not e!826298))))

(assert (=> b!1472326 (= res!1000002 (= lt!643538 (Intermediate!12087 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472326 (= lt!643538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643536 mask!2687) lt!643536 lt!643539 mask!2687))))

(assert (=> b!1472326 (= lt!643536 (select (store (arr!47847 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472327 () Bool)

(declare-fun res!1000000 () Bool)

(assert (=> b!1472327 (=> (not res!1000000) (not e!826299))))

(assert (=> b!1472327 (= res!1000000 (= (seekEntryOrOpen!0 (select (arr!47847 a!2862) j!93) a!2862 mask!2687) (Found!12087 j!93)))))

(declare-fun b!1472328 () Bool)

(assert (=> b!1472328 (= e!826299 (or (= (select (arr!47847 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47847 a!2862) intermediateBeforeIndex!19) (select (arr!47847 a!2862) j!93))))))

(declare-fun b!1472329 () Bool)

(declare-fun res!999993 () Bool)

(assert (=> b!1472329 (=> (not res!999993) (not e!826298))))

(assert (=> b!1472329 (= res!999993 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472330 () Bool)

(declare-fun res!1000003 () Bool)

(assert (=> b!1472330 (=> (not res!1000003) (not e!826301))))

(assert (=> b!1472330 (= res!1000003 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47847 a!2862) j!93) a!2862 mask!2687) lt!643537))))

(declare-fun b!1472331 () Bool)

(declare-fun res!1000004 () Bool)

(assert (=> b!1472331 (=> (not res!1000004) (not e!826300))))

(assert (=> b!1472331 (= res!1000004 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48397 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48397 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48397 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125790 res!999992) b!1472323))

(assert (= (and b!1472323 res!999996) b!1472317))

(assert (= (and b!1472317 res!999999) b!1472316))

(assert (= (and b!1472316 res!999995) b!1472319))

(assert (= (and b!1472319 res!1000006) b!1472320))

(assert (= (and b!1472320 res!999998) b!1472331))

(assert (= (and b!1472331 res!1000004) b!1472318))

(assert (= (and b!1472318 res!999994) b!1472324))

(assert (= (and b!1472324 res!1000005) b!1472330))

(assert (= (and b!1472330 res!1000003) b!1472326))

(assert (= (and b!1472326 res!1000002) b!1472321))

(assert (= (and b!1472321 c!135675) b!1472322))

(assert (= (and b!1472321 (not c!135675)) b!1472315))

(assert (= (and b!1472321 res!1000001) b!1472329))

(assert (= (and b!1472329 res!999993) b!1472325))

(assert (= (and b!1472325 res!999997) b!1472327))

(assert (= (and b!1472327 res!1000000) b!1472328))

(declare-fun m!1359041 () Bool)

(assert (=> b!1472316 m!1359041))

(assert (=> b!1472316 m!1359041))

(declare-fun m!1359043 () Bool)

(assert (=> b!1472316 m!1359043))

(declare-fun m!1359045 () Bool)

(assert (=> b!1472325 m!1359045))

(declare-fun m!1359047 () Bool)

(assert (=> b!1472325 m!1359047))

(declare-fun m!1359049 () Bool)

(assert (=> b!1472322 m!1359049))

(assert (=> b!1472327 m!1359041))

(assert (=> b!1472327 m!1359041))

(declare-fun m!1359051 () Bool)

(assert (=> b!1472327 m!1359051))

(declare-fun m!1359053 () Bool)

(assert (=> start!125790 m!1359053))

(declare-fun m!1359055 () Bool)

(assert (=> start!125790 m!1359055))

(assert (=> b!1472324 m!1359041))

(assert (=> b!1472324 m!1359041))

(declare-fun m!1359057 () Bool)

(assert (=> b!1472324 m!1359057))

(assert (=> b!1472324 m!1359057))

(assert (=> b!1472324 m!1359041))

(declare-fun m!1359059 () Bool)

(assert (=> b!1472324 m!1359059))

(assert (=> b!1472330 m!1359041))

(assert (=> b!1472330 m!1359041))

(declare-fun m!1359061 () Bool)

(assert (=> b!1472330 m!1359061))

(declare-fun m!1359063 () Bool)

(assert (=> b!1472319 m!1359063))

(declare-fun m!1359065 () Bool)

(assert (=> b!1472318 m!1359065))

(declare-fun m!1359067 () Bool)

(assert (=> b!1472318 m!1359067))

(declare-fun m!1359069 () Bool)

(assert (=> b!1472326 m!1359069))

(assert (=> b!1472326 m!1359069))

(declare-fun m!1359071 () Bool)

(assert (=> b!1472326 m!1359071))

(assert (=> b!1472326 m!1359065))

(declare-fun m!1359073 () Bool)

(assert (=> b!1472326 m!1359073))

(declare-fun m!1359075 () Bool)

(assert (=> b!1472320 m!1359075))

(declare-fun m!1359077 () Bool)

(assert (=> b!1472317 m!1359077))

(assert (=> b!1472317 m!1359077))

(declare-fun m!1359079 () Bool)

(assert (=> b!1472317 m!1359079))

(declare-fun m!1359081 () Bool)

(assert (=> b!1472328 m!1359081))

(assert (=> b!1472328 m!1359041))

(declare-fun m!1359083 () Bool)

(assert (=> b!1472315 m!1359083))

(declare-fun m!1359085 () Bool)

(assert (=> b!1472315 m!1359085))

(check-sat (not start!125790) (not b!1472320) (not b!1472322) (not b!1472327) (not b!1472330) (not b!1472315) (not b!1472316) (not b!1472319) (not b!1472325) (not b!1472326) (not b!1472317) (not b!1472324))
(check-sat)
