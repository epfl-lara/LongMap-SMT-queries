; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123252 () Bool)

(assert start!123252)

(declare-fun b!1429176 () Bool)

(declare-fun res!963808 () Bool)

(declare-fun e!807040 () Bool)

(assert (=> b!1429176 (=> (not res!963808) (not e!807040))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97413 0))(
  ( (array!97414 (arr!47018 (Array (_ BitVec 32) (_ BitVec 64))) (size!47568 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97413)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429176 (= res!963808 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47568 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47568 a!2831))))))

(declare-fun b!1429177 () Bool)

(declare-fun res!963813 () Bool)

(assert (=> b!1429177 (=> (not res!963813) (not e!807040))))

(declare-datatypes ((List!33528 0))(
  ( (Nil!33525) (Cons!33524 (h!34838 (_ BitVec 64)) (t!48222 List!33528)) )
))
(declare-fun arrayNoDuplicates!0 (array!97413 (_ BitVec 32) List!33528) Bool)

(assert (=> b!1429177 (= res!963813 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33525))))

(declare-fun b!1429178 () Bool)

(declare-fun res!963807 () Bool)

(assert (=> b!1429178 (=> (not res!963807) (not e!807040))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429178 (= res!963807 (validKeyInArray!0 (select (arr!47018 a!2831) i!982)))))

(declare-fun b!1429179 () Bool)

(declare-fun res!963814 () Bool)

(declare-fun e!807039 () Bool)

(assert (=> b!1429179 (=> (not res!963814) (not e!807039))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429179 (= res!963814 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429180 () Bool)

(declare-fun res!963811 () Bool)

(assert (=> b!1429180 (=> (not res!963811) (not e!807040))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1429180 (= res!963811 (and (= (size!47568 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47568 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47568 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429181 () Bool)

(declare-fun e!807038 () Bool)

(assert (=> b!1429181 (= e!807038 e!807039)))

(declare-fun res!963805 () Bool)

(assert (=> b!1429181 (=> (not res!963805) (not e!807039))))

(declare-fun lt!629268 () array!97413)

(declare-datatypes ((SeekEntryResult!11297 0))(
  ( (MissingZero!11297 (index!47580 (_ BitVec 32))) (Found!11297 (index!47581 (_ BitVec 32))) (Intermediate!11297 (undefined!12109 Bool) (index!47582 (_ BitVec 32)) (x!129219 (_ BitVec 32))) (Undefined!11297) (MissingVacant!11297 (index!47583 (_ BitVec 32))) )
))
(declare-fun lt!629266 () SeekEntryResult!11297)

(declare-fun lt!629265 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97413 (_ BitVec 32)) SeekEntryResult!11297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429181 (= res!963805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629265 mask!2608) lt!629265 lt!629268 mask!2608) lt!629266))))

(assert (=> b!1429181 (= lt!629266 (Intermediate!11297 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429181 (= lt!629265 (select (store (arr!47018 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429181 (= lt!629268 (array!97414 (store (arr!47018 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47568 a!2831)))))

(declare-fun e!807041 () Bool)

(declare-fun b!1429182 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97413 (_ BitVec 32)) SeekEntryResult!11297)

(assert (=> b!1429182 (= e!807041 (= (seekEntryOrOpen!0 (select (arr!47018 a!2831) j!81) a!2831 mask!2608) (Found!11297 j!81)))))

(declare-fun res!963810 () Bool)

(assert (=> start!123252 (=> (not res!963810) (not e!807040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123252 (= res!963810 (validMask!0 mask!2608))))

(assert (=> start!123252 e!807040))

(assert (=> start!123252 true))

(declare-fun array_inv!36046 (array!97413) Bool)

(assert (=> start!123252 (array_inv!36046 a!2831)))

(declare-fun b!1429183 () Bool)

(declare-fun res!963816 () Bool)

(assert (=> b!1429183 (=> (not res!963816) (not e!807040))))

(assert (=> b!1429183 (= res!963816 (validKeyInArray!0 (select (arr!47018 a!2831) j!81)))))

(declare-fun b!1429184 () Bool)

(assert (=> b!1429184 (= e!807039 (not true))))

(assert (=> b!1429184 e!807041))

(declare-fun res!963809 () Bool)

(assert (=> b!1429184 (=> (not res!963809) (not e!807041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97413 (_ BitVec 32)) Bool)

(assert (=> b!1429184 (= res!963809 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48340 0))(
  ( (Unit!48341) )
))
(declare-fun lt!629264 () Unit!48340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48340)

(assert (=> b!1429184 (= lt!629264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429185 () Bool)

(declare-fun res!963806 () Bool)

(assert (=> b!1429185 (=> (not res!963806) (not e!807040))))

(assert (=> b!1429185 (= res!963806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429186 () Bool)

(assert (=> b!1429186 (= e!807040 e!807038)))

(declare-fun res!963812 () Bool)

(assert (=> b!1429186 (=> (not res!963812) (not e!807038))))

(declare-fun lt!629267 () SeekEntryResult!11297)

(assert (=> b!1429186 (= res!963812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47018 a!2831) j!81) mask!2608) (select (arr!47018 a!2831) j!81) a!2831 mask!2608) lt!629267))))

(assert (=> b!1429186 (= lt!629267 (Intermediate!11297 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429187 () Bool)

(declare-fun res!963817 () Bool)

(assert (=> b!1429187 (=> (not res!963817) (not e!807039))))

(assert (=> b!1429187 (= res!963817 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47018 a!2831) j!81) a!2831 mask!2608) lt!629267))))

(declare-fun b!1429188 () Bool)

(declare-fun res!963815 () Bool)

(assert (=> b!1429188 (=> (not res!963815) (not e!807039))))

(assert (=> b!1429188 (= res!963815 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629265 lt!629268 mask!2608) lt!629266))))

(assert (= (and start!123252 res!963810) b!1429180))

(assert (= (and b!1429180 res!963811) b!1429178))

(assert (= (and b!1429178 res!963807) b!1429183))

(assert (= (and b!1429183 res!963816) b!1429185))

(assert (= (and b!1429185 res!963806) b!1429177))

(assert (= (and b!1429177 res!963813) b!1429176))

(assert (= (and b!1429176 res!963808) b!1429186))

(assert (= (and b!1429186 res!963812) b!1429181))

(assert (= (and b!1429181 res!963805) b!1429187))

(assert (= (and b!1429187 res!963817) b!1429188))

(assert (= (and b!1429188 res!963815) b!1429179))

(assert (= (and b!1429179 res!963814) b!1429184))

(assert (= (and b!1429184 res!963809) b!1429182))

(declare-fun m!1319283 () Bool)

(assert (=> b!1429185 m!1319283))

(declare-fun m!1319285 () Bool)

(assert (=> b!1429181 m!1319285))

(assert (=> b!1429181 m!1319285))

(declare-fun m!1319287 () Bool)

(assert (=> b!1429181 m!1319287))

(declare-fun m!1319289 () Bool)

(assert (=> b!1429181 m!1319289))

(declare-fun m!1319291 () Bool)

(assert (=> b!1429181 m!1319291))

(declare-fun m!1319293 () Bool)

(assert (=> b!1429183 m!1319293))

(assert (=> b!1429183 m!1319293))

(declare-fun m!1319295 () Bool)

(assert (=> b!1429183 m!1319295))

(assert (=> b!1429182 m!1319293))

(assert (=> b!1429182 m!1319293))

(declare-fun m!1319297 () Bool)

(assert (=> b!1429182 m!1319297))

(declare-fun m!1319299 () Bool)

(assert (=> start!123252 m!1319299))

(declare-fun m!1319301 () Bool)

(assert (=> start!123252 m!1319301))

(declare-fun m!1319303 () Bool)

(assert (=> b!1429177 m!1319303))

(declare-fun m!1319305 () Bool)

(assert (=> b!1429184 m!1319305))

(declare-fun m!1319307 () Bool)

(assert (=> b!1429184 m!1319307))

(declare-fun m!1319309 () Bool)

(assert (=> b!1429178 m!1319309))

(assert (=> b!1429178 m!1319309))

(declare-fun m!1319311 () Bool)

(assert (=> b!1429178 m!1319311))

(assert (=> b!1429187 m!1319293))

(assert (=> b!1429187 m!1319293))

(declare-fun m!1319313 () Bool)

(assert (=> b!1429187 m!1319313))

(assert (=> b!1429186 m!1319293))

(assert (=> b!1429186 m!1319293))

(declare-fun m!1319315 () Bool)

(assert (=> b!1429186 m!1319315))

(assert (=> b!1429186 m!1319315))

(assert (=> b!1429186 m!1319293))

(declare-fun m!1319317 () Bool)

(assert (=> b!1429186 m!1319317))

(declare-fun m!1319319 () Bool)

(assert (=> b!1429188 m!1319319))

(push 1)

