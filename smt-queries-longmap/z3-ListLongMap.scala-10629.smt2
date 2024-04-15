; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124882 () Bool)

(assert start!124882)

(declare-fun b!1451084 () Bool)

(declare-fun res!982462 () Bool)

(declare-fun e!817036 () Bool)

(assert (=> b!1451084 (=> (not res!982462) (not e!817036))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98308 0))(
  ( (array!98309 (arr!47443 (Array (_ BitVec 32) (_ BitVec 64))) (size!47995 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98308)

(assert (=> b!1451084 (= res!982462 (and (= (size!47995 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47995 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47995 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451085 () Bool)

(declare-fun res!982460 () Bool)

(assert (=> b!1451085 (=> (not res!982460) (not e!817036))))

(declare-datatypes ((List!34022 0))(
  ( (Nil!34019) (Cons!34018 (h!35368 (_ BitVec 64)) (t!48708 List!34022)) )
))
(declare-fun arrayNoDuplicates!0 (array!98308 (_ BitVec 32) List!34022) Bool)

(assert (=> b!1451085 (= res!982460 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34019))))

(declare-fun b!1451086 () Bool)

(declare-fun res!982457 () Bool)

(declare-fun e!817038 () Bool)

(assert (=> b!1451086 (=> (not res!982457) (not e!817038))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11720 0))(
  ( (MissingZero!11720 (index!49272 (_ BitVec 32))) (Found!11720 (index!49273 (_ BitVec 32))) (Intermediate!11720 (undefined!12532 Bool) (index!49274 (_ BitVec 32)) (x!130924 (_ BitVec 32))) (Undefined!11720) (MissingVacant!11720 (index!49275 (_ BitVec 32))) )
))
(declare-fun lt!636372 () SeekEntryResult!11720)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98308 (_ BitVec 32)) SeekEntryResult!11720)

(assert (=> b!1451086 (= res!982457 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47443 a!2862) j!93) a!2862 mask!2687) lt!636372))))

(declare-fun b!1451087 () Bool)

(declare-fun e!817041 () Bool)

(assert (=> b!1451087 (= e!817038 e!817041)))

(declare-fun res!982465 () Bool)

(assert (=> b!1451087 (=> (not res!982465) (not e!817041))))

(declare-fun lt!636373 () SeekEntryResult!11720)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451087 (= res!982465 (= lt!636373 (Intermediate!11720 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636374 () (_ BitVec 64))

(declare-fun lt!636375 () array!98308)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451087 (= lt!636373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636374 mask!2687) lt!636374 lt!636375 mask!2687))))

(assert (=> b!1451087 (= lt!636374 (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451088 () Bool)

(declare-fun res!982458 () Bool)

(assert (=> b!1451088 (=> (not res!982458) (not e!817036))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451088 (= res!982458 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47995 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47995 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47995 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451089 () Bool)

(assert (=> b!1451089 (= e!817041 (not (or (and (= (select (arr!47443 a!2862) index!646) (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47443 a!2862) index!646) (select (arr!47443 a!2862) j!93))) (= (select (arr!47443 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!817040 () Bool)

(assert (=> b!1451089 e!817040))

(declare-fun res!982467 () Bool)

(assert (=> b!1451089 (=> (not res!982467) (not e!817040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98308 (_ BitVec 32)) Bool)

(assert (=> b!1451089 (= res!982467 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48777 0))(
  ( (Unit!48778) )
))
(declare-fun lt!636371 () Unit!48777)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48777)

(assert (=> b!1451089 (= lt!636371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!982466 () Bool)

(assert (=> start!124882 (=> (not res!982466) (not e!817036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124882 (= res!982466 (validMask!0 mask!2687))))

(assert (=> start!124882 e!817036))

(assert (=> start!124882 true))

(declare-fun array_inv!36676 (array!98308) Bool)

(assert (=> start!124882 (array_inv!36676 a!2862)))

(declare-fun b!1451090 () Bool)

(declare-fun res!982461 () Bool)

(assert (=> b!1451090 (=> (not res!982461) (not e!817036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451090 (= res!982461 (validKeyInArray!0 (select (arr!47443 a!2862) i!1006)))))

(declare-fun b!1451091 () Bool)

(declare-fun res!982454 () Bool)

(assert (=> b!1451091 (=> (not res!982454) (not e!817036))))

(assert (=> b!1451091 (= res!982454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451092 () Bool)

(declare-fun e!817039 () Bool)

(assert (=> b!1451092 (= e!817039 (= lt!636373 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636374 lt!636375 mask!2687)))))

(declare-fun b!1451093 () Bool)

(declare-fun res!982455 () Bool)

(assert (=> b!1451093 (=> (not res!982455) (not e!817041))))

(assert (=> b!1451093 (= res!982455 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451094 () Bool)

(declare-fun e!817037 () Bool)

(assert (=> b!1451094 (= e!817037 e!817038)))

(declare-fun res!982463 () Bool)

(assert (=> b!1451094 (=> (not res!982463) (not e!817038))))

(assert (=> b!1451094 (= res!982463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47443 a!2862) j!93) mask!2687) (select (arr!47443 a!2862) j!93) a!2862 mask!2687) lt!636372))))

(assert (=> b!1451094 (= lt!636372 (Intermediate!11720 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451095 () Bool)

(declare-fun res!982464 () Bool)

(assert (=> b!1451095 (=> (not res!982464) (not e!817041))))

(assert (=> b!1451095 (= res!982464 e!817039)))

(declare-fun c!133828 () Bool)

(assert (=> b!1451095 (= c!133828 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451096 () Bool)

(declare-fun res!982468 () Bool)

(assert (=> b!1451096 (=> (not res!982468) (not e!817036))))

(assert (=> b!1451096 (= res!982468 (validKeyInArray!0 (select (arr!47443 a!2862) j!93)))))

(declare-fun b!1451097 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98308 (_ BitVec 32)) SeekEntryResult!11720)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98308 (_ BitVec 32)) SeekEntryResult!11720)

(assert (=> b!1451097 (= e!817039 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636374 lt!636375 mask!2687) (seekEntryOrOpen!0 lt!636374 lt!636375 mask!2687)))))

(declare-fun b!1451098 () Bool)

(declare-fun res!982459 () Bool)

(assert (=> b!1451098 (=> (not res!982459) (not e!817040))))

(assert (=> b!1451098 (= res!982459 (= (seekEntryOrOpen!0 (select (arr!47443 a!2862) j!93) a!2862 mask!2687) (Found!11720 j!93)))))

(declare-fun b!1451099 () Bool)

(assert (=> b!1451099 (= e!817036 e!817037)))

(declare-fun res!982456 () Bool)

(assert (=> b!1451099 (=> (not res!982456) (not e!817037))))

(assert (=> b!1451099 (= res!982456 (= (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451099 (= lt!636375 (array!98309 (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47995 a!2862)))))

(declare-fun b!1451100 () Bool)

(assert (=> b!1451100 (= e!817040 (and (or (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) (select (arr!47443 a!2862) j!93))) (or (and (= (select (arr!47443 a!2862) index!646) (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47443 a!2862) index!646) (select (arr!47443 a!2862) j!93))) (= (select (arr!47443 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!124882 res!982466) b!1451084))

(assert (= (and b!1451084 res!982462) b!1451090))

(assert (= (and b!1451090 res!982461) b!1451096))

(assert (= (and b!1451096 res!982468) b!1451091))

(assert (= (and b!1451091 res!982454) b!1451085))

(assert (= (and b!1451085 res!982460) b!1451088))

(assert (= (and b!1451088 res!982458) b!1451099))

(assert (= (and b!1451099 res!982456) b!1451094))

(assert (= (and b!1451094 res!982463) b!1451086))

(assert (= (and b!1451086 res!982457) b!1451087))

(assert (= (and b!1451087 res!982465) b!1451095))

(assert (= (and b!1451095 c!133828) b!1451092))

(assert (= (and b!1451095 (not c!133828)) b!1451097))

(assert (= (and b!1451095 res!982464) b!1451093))

(assert (= (and b!1451093 res!982455) b!1451089))

(assert (= (and b!1451089 res!982467) b!1451098))

(assert (= (and b!1451098 res!982459) b!1451100))

(declare-fun m!1339203 () Bool)

(assert (=> b!1451096 m!1339203))

(assert (=> b!1451096 m!1339203))

(declare-fun m!1339205 () Bool)

(assert (=> b!1451096 m!1339205))

(declare-fun m!1339207 () Bool)

(assert (=> b!1451085 m!1339207))

(declare-fun m!1339209 () Bool)

(assert (=> b!1451092 m!1339209))

(assert (=> b!1451086 m!1339203))

(assert (=> b!1451086 m!1339203))

(declare-fun m!1339211 () Bool)

(assert (=> b!1451086 m!1339211))

(assert (=> b!1451094 m!1339203))

(assert (=> b!1451094 m!1339203))

(declare-fun m!1339213 () Bool)

(assert (=> b!1451094 m!1339213))

(assert (=> b!1451094 m!1339213))

(assert (=> b!1451094 m!1339203))

(declare-fun m!1339215 () Bool)

(assert (=> b!1451094 m!1339215))

(declare-fun m!1339217 () Bool)

(assert (=> b!1451099 m!1339217))

(declare-fun m!1339219 () Bool)

(assert (=> b!1451099 m!1339219))

(declare-fun m!1339221 () Bool)

(assert (=> b!1451090 m!1339221))

(assert (=> b!1451090 m!1339221))

(declare-fun m!1339223 () Bool)

(assert (=> b!1451090 m!1339223))

(declare-fun m!1339225 () Bool)

(assert (=> b!1451091 m!1339225))

(declare-fun m!1339227 () Bool)

(assert (=> start!124882 m!1339227))

(declare-fun m!1339229 () Bool)

(assert (=> start!124882 m!1339229))

(declare-fun m!1339231 () Bool)

(assert (=> b!1451087 m!1339231))

(assert (=> b!1451087 m!1339231))

(declare-fun m!1339233 () Bool)

(assert (=> b!1451087 m!1339233))

(assert (=> b!1451087 m!1339217))

(declare-fun m!1339235 () Bool)

(assert (=> b!1451087 m!1339235))

(declare-fun m!1339237 () Bool)

(assert (=> b!1451089 m!1339237))

(assert (=> b!1451089 m!1339217))

(declare-fun m!1339239 () Bool)

(assert (=> b!1451089 m!1339239))

(declare-fun m!1339241 () Bool)

(assert (=> b!1451089 m!1339241))

(declare-fun m!1339243 () Bool)

(assert (=> b!1451089 m!1339243))

(assert (=> b!1451089 m!1339203))

(assert (=> b!1451100 m!1339217))

(declare-fun m!1339245 () Bool)

(assert (=> b!1451100 m!1339245))

(assert (=> b!1451100 m!1339239))

(assert (=> b!1451100 m!1339241))

(assert (=> b!1451100 m!1339203))

(assert (=> b!1451098 m!1339203))

(assert (=> b!1451098 m!1339203))

(declare-fun m!1339247 () Bool)

(assert (=> b!1451098 m!1339247))

(declare-fun m!1339249 () Bool)

(assert (=> b!1451097 m!1339249))

(declare-fun m!1339251 () Bool)

(assert (=> b!1451097 m!1339251))

(check-sat (not b!1451096) (not start!124882) (not b!1451097) (not b!1451090) (not b!1451091) (not b!1451098) (not b!1451087) (not b!1451085) (not b!1451086) (not b!1451092) (not b!1451089) (not b!1451094))
(check-sat)
