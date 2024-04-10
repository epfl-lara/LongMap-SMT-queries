; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126866 () Bool)

(assert start!126866)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1490190 () Bool)

(declare-fun e!835075 () Bool)

(declare-datatypes ((SeekEntryResult!12331 0))(
  ( (MissingZero!12331 (index!51716 (_ BitVec 32))) (Found!12331 (index!51717 (_ BitVec 32))) (Intermediate!12331 (undefined!13143 Bool) (index!51718 (_ BitVec 32)) (x!133307 (_ BitVec 32))) (Undefined!12331) (MissingVacant!12331 (index!51719 (_ BitVec 32))) )
))
(declare-fun lt!649863 () SeekEntryResult!12331)

(declare-datatypes ((array!99639 0))(
  ( (array!99640 (arr!48091 (Array (_ BitVec 32) (_ BitVec 64))) (size!48641 (_ BitVec 32))) )
))
(declare-fun lt!649859 () array!99639)

(declare-fun lt!649858 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!649862 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99639 (_ BitVec 32)) SeekEntryResult!12331)

(assert (=> b!1490190 (= e!835075 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649862 intermediateAfterIndex!19 lt!649858 lt!649859 mask!2687) lt!649863)))))

(declare-fun res!1013503 () Bool)

(declare-fun e!835077 () Bool)

(assert (=> start!126866 (=> (not res!1013503) (not e!835077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126866 (= res!1013503 (validMask!0 mask!2687))))

(assert (=> start!126866 e!835077))

(assert (=> start!126866 true))

(declare-fun a!2862 () array!99639)

(declare-fun array_inv!37119 (array!99639) Bool)

(assert (=> start!126866 (array_inv!37119 a!2862)))

(declare-fun b!1490191 () Bool)

(declare-fun e!835073 () Bool)

(declare-fun e!835071 () Bool)

(assert (=> b!1490191 (= e!835073 (not e!835071))))

(declare-fun res!1013500 () Bool)

(assert (=> b!1490191 (=> res!1013500 e!835071)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490191 (= res!1013500 (or (and (= (select (arr!48091 a!2862) index!646) (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48091 a!2862) index!646) (select (arr!48091 a!2862) j!93))) (= (select (arr!48091 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!649865 () SeekEntryResult!12331)

(assert (=> b!1490191 (and (= lt!649865 (Found!12331 j!93)) (or (= (select (arr!48091 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48091 a!2862) intermediateBeforeIndex!19) (select (arr!48091 a!2862) j!93))) (let ((bdg!54774 (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48091 a!2862) index!646) bdg!54774) (= (select (arr!48091 a!2862) index!646) (select (arr!48091 a!2862) j!93))) (= (select (arr!48091 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54774 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99639 (_ BitVec 32)) SeekEntryResult!12331)

(assert (=> b!1490191 (= lt!649865 (seekEntryOrOpen!0 (select (arr!48091 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99639 (_ BitVec 32)) Bool)

(assert (=> b!1490191 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50002 0))(
  ( (Unit!50003) )
))
(declare-fun lt!649864 () Unit!50002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50002)

(assert (=> b!1490191 (= lt!649864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490192 () Bool)

(declare-fun res!1013501 () Bool)

(assert (=> b!1490192 (=> (not res!1013501) (not e!835077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490192 (= res!1013501 (validKeyInArray!0 (select (arr!48091 a!2862) j!93)))))

(declare-fun b!1490193 () Bool)

(declare-fun res!1013504 () Bool)

(declare-fun e!835074 () Bool)

(assert (=> b!1490193 (=> res!1013504 e!835074)))

(assert (=> b!1490193 (= res!1013504 e!835075)))

(declare-fun c!137874 () Bool)

(assert (=> b!1490193 (= c!137874 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490194 () Bool)

(declare-fun res!1013506 () Bool)

(assert (=> b!1490194 (=> (not res!1013506) (not e!835077))))

(declare-datatypes ((List!34592 0))(
  ( (Nil!34589) (Cons!34588 (h!35971 (_ BitVec 64)) (t!49286 List!34592)) )
))
(declare-fun arrayNoDuplicates!0 (array!99639 (_ BitVec 32) List!34592) Bool)

(assert (=> b!1490194 (= res!1013506 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34589))))

(declare-fun b!1490195 () Bool)

(assert (=> b!1490195 (= e!835071 e!835074)))

(declare-fun res!1013514 () Bool)

(assert (=> b!1490195 (=> res!1013514 e!835074)))

(assert (=> b!1490195 (= res!1013514 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649862 #b00000000000000000000000000000000) (bvsge lt!649862 (size!48641 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490195 (= lt!649862 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1490195 (= lt!649863 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649858 lt!649859 mask!2687))))

(assert (=> b!1490195 (= lt!649863 (seekEntryOrOpen!0 lt!649858 lt!649859 mask!2687))))

(declare-fun b!1490196 () Bool)

(declare-fun res!1013508 () Bool)

(assert (=> b!1490196 (=> (not res!1013508) (not e!835073))))

(declare-fun e!835079 () Bool)

(assert (=> b!1490196 (= res!1013508 e!835079)))

(declare-fun c!137873 () Bool)

(assert (=> b!1490196 (= c!137873 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490197 () Bool)

(assert (=> b!1490197 (= e!835079 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649858 lt!649859 mask!2687) (seekEntryOrOpen!0 lt!649858 lt!649859 mask!2687)))))

(declare-fun lt!649860 () SeekEntryResult!12331)

(declare-fun b!1490198 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99639 (_ BitVec 32)) SeekEntryResult!12331)

(assert (=> b!1490198 (= e!835079 (= lt!649860 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649858 lt!649859 mask!2687)))))

(declare-fun b!1490199 () Bool)

(assert (=> b!1490199 (= e!835074 true)))

(assert (=> b!1490199 (= lt!649865 lt!649863)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lt!649866 () Unit!50002)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50002)

(assert (=> b!1490199 (= lt!649866 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649862 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1490200 () Bool)

(declare-fun res!1013498 () Bool)

(assert (=> b!1490200 (=> (not res!1013498) (not e!835073))))

(assert (=> b!1490200 (= res!1013498 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490201 () Bool)

(declare-fun e!835072 () Bool)

(assert (=> b!1490201 (= e!835077 e!835072)))

(declare-fun res!1013509 () Bool)

(assert (=> b!1490201 (=> (not res!1013509) (not e!835072))))

(assert (=> b!1490201 (= res!1013509 (= (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490201 (= lt!649859 (array!99640 (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48641 a!2862)))))

(declare-fun b!1490202 () Bool)

(declare-fun res!1013511 () Bool)

(assert (=> b!1490202 (=> (not res!1013511) (not e!835077))))

(assert (=> b!1490202 (= res!1013511 (validKeyInArray!0 (select (arr!48091 a!2862) i!1006)))))

(declare-fun b!1490203 () Bool)

(declare-fun res!1013513 () Bool)

(declare-fun e!835076 () Bool)

(assert (=> b!1490203 (=> (not res!1013513) (not e!835076))))

(declare-fun lt!649861 () SeekEntryResult!12331)

(assert (=> b!1490203 (= res!1013513 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48091 a!2862) j!93) a!2862 mask!2687) lt!649861))))

(declare-fun b!1490204 () Bool)

(assert (=> b!1490204 (= e!835075 (not (= lt!649860 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649862 lt!649858 lt!649859 mask!2687))))))

(declare-fun b!1490205 () Bool)

(declare-fun res!1013502 () Bool)

(assert (=> b!1490205 (=> (not res!1013502) (not e!835077))))

(assert (=> b!1490205 (= res!1013502 (and (= (size!48641 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48641 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48641 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490206 () Bool)

(declare-fun res!1013505 () Bool)

(assert (=> b!1490206 (=> res!1013505 e!835074)))

(assert (=> b!1490206 (= res!1013505 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1490207 () Bool)

(declare-fun res!1013510 () Bool)

(assert (=> b!1490207 (=> (not res!1013510) (not e!835077))))

(assert (=> b!1490207 (= res!1013510 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48641 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48641 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48641 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490208 () Bool)

(assert (=> b!1490208 (= e!835076 e!835073)))

(declare-fun res!1013499 () Bool)

(assert (=> b!1490208 (=> (not res!1013499) (not e!835073))))

(assert (=> b!1490208 (= res!1013499 (= lt!649860 (Intermediate!12331 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490208 (= lt!649860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649858 mask!2687) lt!649858 lt!649859 mask!2687))))

(assert (=> b!1490208 (= lt!649858 (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490209 () Bool)

(declare-fun res!1013515 () Bool)

(assert (=> b!1490209 (=> res!1013515 e!835074)))

(assert (=> b!1490209 (= res!1013515 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649862 (select (arr!48091 a!2862) j!93) a!2862 mask!2687) lt!649861)))))

(declare-fun b!1490210 () Bool)

(assert (=> b!1490210 (= e!835072 e!835076)))

(declare-fun res!1013507 () Bool)

(assert (=> b!1490210 (=> (not res!1013507) (not e!835076))))

(assert (=> b!1490210 (= res!1013507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48091 a!2862) j!93) mask!2687) (select (arr!48091 a!2862) j!93) a!2862 mask!2687) lt!649861))))

(assert (=> b!1490210 (= lt!649861 (Intermediate!12331 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490211 () Bool)

(declare-fun res!1013512 () Bool)

(assert (=> b!1490211 (=> (not res!1013512) (not e!835077))))

(assert (=> b!1490211 (= res!1013512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126866 res!1013503) b!1490205))

(assert (= (and b!1490205 res!1013502) b!1490202))

(assert (= (and b!1490202 res!1013511) b!1490192))

(assert (= (and b!1490192 res!1013501) b!1490211))

(assert (= (and b!1490211 res!1013512) b!1490194))

(assert (= (and b!1490194 res!1013506) b!1490207))

(assert (= (and b!1490207 res!1013510) b!1490201))

(assert (= (and b!1490201 res!1013509) b!1490210))

(assert (= (and b!1490210 res!1013507) b!1490203))

(assert (= (and b!1490203 res!1013513) b!1490208))

(assert (= (and b!1490208 res!1013499) b!1490196))

(assert (= (and b!1490196 c!137873) b!1490198))

(assert (= (and b!1490196 (not c!137873)) b!1490197))

(assert (= (and b!1490196 res!1013508) b!1490200))

(assert (= (and b!1490200 res!1013498) b!1490191))

(assert (= (and b!1490191 (not res!1013500)) b!1490195))

(assert (= (and b!1490195 (not res!1013514)) b!1490209))

(assert (= (and b!1490209 (not res!1013515)) b!1490193))

(assert (= (and b!1490193 c!137874) b!1490204))

(assert (= (and b!1490193 (not c!137874)) b!1490190))

(assert (= (and b!1490193 (not res!1013504)) b!1490206))

(assert (= (and b!1490206 (not res!1013505)) b!1490199))

(declare-fun m!1374355 () Bool)

(assert (=> b!1490201 m!1374355))

(declare-fun m!1374357 () Bool)

(assert (=> b!1490201 m!1374357))

(declare-fun m!1374359 () Bool)

(assert (=> b!1490198 m!1374359))

(declare-fun m!1374361 () Bool)

(assert (=> b!1490211 m!1374361))

(declare-fun m!1374363 () Bool)

(assert (=> b!1490204 m!1374363))

(declare-fun m!1374365 () Bool)

(assert (=> b!1490210 m!1374365))

(assert (=> b!1490210 m!1374365))

(declare-fun m!1374367 () Bool)

(assert (=> b!1490210 m!1374367))

(assert (=> b!1490210 m!1374367))

(assert (=> b!1490210 m!1374365))

(declare-fun m!1374369 () Bool)

(assert (=> b!1490210 m!1374369))

(assert (=> b!1490203 m!1374365))

(assert (=> b!1490203 m!1374365))

(declare-fun m!1374371 () Bool)

(assert (=> b!1490203 m!1374371))

(assert (=> b!1490209 m!1374365))

(assert (=> b!1490209 m!1374365))

(declare-fun m!1374373 () Bool)

(assert (=> b!1490209 m!1374373))

(declare-fun m!1374375 () Bool)

(assert (=> b!1490197 m!1374375))

(declare-fun m!1374377 () Bool)

(assert (=> b!1490197 m!1374377))

(declare-fun m!1374379 () Bool)

(assert (=> b!1490208 m!1374379))

(assert (=> b!1490208 m!1374379))

(declare-fun m!1374381 () Bool)

(assert (=> b!1490208 m!1374381))

(assert (=> b!1490208 m!1374355))

(declare-fun m!1374383 () Bool)

(assert (=> b!1490208 m!1374383))

(declare-fun m!1374385 () Bool)

(assert (=> start!126866 m!1374385))

(declare-fun m!1374387 () Bool)

(assert (=> start!126866 m!1374387))

(declare-fun m!1374389 () Bool)

(assert (=> b!1490190 m!1374389))

(declare-fun m!1374391 () Bool)

(assert (=> b!1490199 m!1374391))

(declare-fun m!1374393 () Bool)

(assert (=> b!1490194 m!1374393))

(declare-fun m!1374395 () Bool)

(assert (=> b!1490202 m!1374395))

(assert (=> b!1490202 m!1374395))

(declare-fun m!1374397 () Bool)

(assert (=> b!1490202 m!1374397))

(declare-fun m!1374399 () Bool)

(assert (=> b!1490195 m!1374399))

(assert (=> b!1490195 m!1374375))

(assert (=> b!1490195 m!1374377))

(declare-fun m!1374401 () Bool)

(assert (=> b!1490191 m!1374401))

(assert (=> b!1490191 m!1374355))

(declare-fun m!1374403 () Bool)

(assert (=> b!1490191 m!1374403))

(declare-fun m!1374405 () Bool)

(assert (=> b!1490191 m!1374405))

(declare-fun m!1374407 () Bool)

(assert (=> b!1490191 m!1374407))

(assert (=> b!1490191 m!1374365))

(declare-fun m!1374409 () Bool)

(assert (=> b!1490191 m!1374409))

(declare-fun m!1374411 () Bool)

(assert (=> b!1490191 m!1374411))

(assert (=> b!1490191 m!1374365))

(assert (=> b!1490192 m!1374365))

(assert (=> b!1490192 m!1374365))

(declare-fun m!1374413 () Bool)

(assert (=> b!1490192 m!1374413))

(push 1)

