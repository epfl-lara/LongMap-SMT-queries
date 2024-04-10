; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123158 () Bool)

(assert start!123158)

(declare-fun b!1428087 () Bool)

(declare-fun e!806548 () Bool)

(declare-fun e!806551 () Bool)

(assert (=> b!1428087 (= e!806548 e!806551)))

(declare-fun res!962921 () Bool)

(assert (=> b!1428087 (=> (not res!962921) (not e!806551))))

(declare-datatypes ((array!97370 0))(
  ( (array!97371 (arr!46998 (Array (_ BitVec 32) (_ BitVec 64))) (size!47548 (_ BitVec 32))) )
))
(declare-fun lt!628835 () array!97370)

(declare-datatypes ((SeekEntryResult!11277 0))(
  ( (MissingZero!11277 (index!47500 (_ BitVec 32))) (Found!11277 (index!47501 (_ BitVec 32))) (Intermediate!11277 (undefined!12089 Bool) (index!47502 (_ BitVec 32)) (x!129137 (_ BitVec 32))) (Undefined!11277) (MissingVacant!11277 (index!47503 (_ BitVec 32))) )
))
(declare-fun lt!628833 () SeekEntryResult!11277)

(declare-fun lt!628832 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97370 (_ BitVec 32)) SeekEntryResult!11277)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428087 (= res!962921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628832 mask!2608) lt!628832 lt!628835 mask!2608) lt!628833))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428087 (= lt!628833 (Intermediate!11277 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97370)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428087 (= lt!628832 (select (store (arr!46998 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428087 (= lt!628835 (array!97371 (store (arr!46998 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47548 a!2831)))))

(declare-fun b!1428088 () Bool)

(declare-fun res!962925 () Bool)

(declare-fun e!806549 () Bool)

(assert (=> b!1428088 (=> (not res!962925) (not e!806549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428088 (= res!962925 (validKeyInArray!0 (select (arr!46998 a!2831) i!982)))))

(declare-fun b!1428089 () Bool)

(declare-fun res!962927 () Bool)

(assert (=> b!1428089 (=> (not res!962927) (not e!806549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97370 (_ BitVec 32)) Bool)

(assert (=> b!1428089 (= res!962927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun e!806552 () Bool)

(declare-fun b!1428091 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97370 (_ BitVec 32)) SeekEntryResult!11277)

(assert (=> b!1428091 (= e!806552 (= (seekEntryOrOpen!0 (select (arr!46998 a!2831) j!81) a!2831 mask!2608) (Found!11277 j!81)))))

(declare-fun b!1428092 () Bool)

(declare-fun res!962926 () Bool)

(assert (=> b!1428092 (=> (not res!962926) (not e!806549))))

(assert (=> b!1428092 (= res!962926 (and (= (size!47548 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47548 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47548 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428093 () Bool)

(declare-fun res!962918 () Bool)

(assert (=> b!1428093 (=> (not res!962918) (not e!806549))))

(assert (=> b!1428093 (= res!962918 (validKeyInArray!0 (select (arr!46998 a!2831) j!81)))))

(declare-fun b!1428094 () Bool)

(declare-fun res!962922 () Bool)

(assert (=> b!1428094 (=> (not res!962922) (not e!806551))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428094 (= res!962922 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628832 lt!628835 mask!2608) lt!628833))))

(declare-fun b!1428095 () Bool)

(declare-fun res!962928 () Bool)

(assert (=> b!1428095 (=> (not res!962928) (not e!806549))))

(declare-datatypes ((List!33508 0))(
  ( (Nil!33505) (Cons!33504 (h!34815 (_ BitVec 64)) (t!48202 List!33508)) )
))
(declare-fun arrayNoDuplicates!0 (array!97370 (_ BitVec 32) List!33508) Bool)

(assert (=> b!1428095 (= res!962928 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33505))))

(declare-fun b!1428090 () Bool)

(assert (=> b!1428090 (= e!806551 (not true))))

(assert (=> b!1428090 e!806552))

(declare-fun res!962924 () Bool)

(assert (=> b!1428090 (=> (not res!962924) (not e!806552))))

(assert (=> b!1428090 (= res!962924 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48300 0))(
  ( (Unit!48301) )
))
(declare-fun lt!628834 () Unit!48300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48300)

(assert (=> b!1428090 (= lt!628834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!962929 () Bool)

(assert (=> start!123158 (=> (not res!962929) (not e!806549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123158 (= res!962929 (validMask!0 mask!2608))))

(assert (=> start!123158 e!806549))

(assert (=> start!123158 true))

(declare-fun array_inv!36026 (array!97370) Bool)

(assert (=> start!123158 (array_inv!36026 a!2831)))

(declare-fun b!1428096 () Bool)

(declare-fun res!962917 () Bool)

(assert (=> b!1428096 (=> (not res!962917) (not e!806551))))

(declare-fun lt!628836 () SeekEntryResult!11277)

(assert (=> b!1428096 (= res!962917 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46998 a!2831) j!81) a!2831 mask!2608) lt!628836))))

(declare-fun b!1428097 () Bool)

(assert (=> b!1428097 (= e!806549 e!806548)))

(declare-fun res!962920 () Bool)

(assert (=> b!1428097 (=> (not res!962920) (not e!806548))))

(assert (=> b!1428097 (= res!962920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46998 a!2831) j!81) mask!2608) (select (arr!46998 a!2831) j!81) a!2831 mask!2608) lt!628836))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428097 (= lt!628836 (Intermediate!11277 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428098 () Bool)

(declare-fun res!962923 () Bool)

(assert (=> b!1428098 (=> (not res!962923) (not e!806549))))

(assert (=> b!1428098 (= res!962923 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47548 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47548 a!2831))))))

(declare-fun b!1428099 () Bool)

(declare-fun res!962919 () Bool)

(assert (=> b!1428099 (=> (not res!962919) (not e!806551))))

(assert (=> b!1428099 (= res!962919 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123158 res!962929) b!1428092))

(assert (= (and b!1428092 res!962926) b!1428088))

(assert (= (and b!1428088 res!962925) b!1428093))

(assert (= (and b!1428093 res!962918) b!1428089))

(assert (= (and b!1428089 res!962927) b!1428095))

(assert (= (and b!1428095 res!962928) b!1428098))

(assert (= (and b!1428098 res!962923) b!1428097))

(assert (= (and b!1428097 res!962920) b!1428087))

(assert (= (and b!1428087 res!962921) b!1428096))

(assert (= (and b!1428096 res!962917) b!1428094))

(assert (= (and b!1428094 res!962922) b!1428099))

(assert (= (and b!1428099 res!962919) b!1428090))

(assert (= (and b!1428090 res!962924) b!1428091))

(declare-fun m!1318331 () Bool)

(assert (=> b!1428090 m!1318331))

(declare-fun m!1318333 () Bool)

(assert (=> b!1428090 m!1318333))

(declare-fun m!1318335 () Bool)

(assert (=> b!1428088 m!1318335))

(assert (=> b!1428088 m!1318335))

(declare-fun m!1318337 () Bool)

(assert (=> b!1428088 m!1318337))

(declare-fun m!1318339 () Bool)

(assert (=> b!1428095 m!1318339))

(declare-fun m!1318341 () Bool)

(assert (=> start!123158 m!1318341))

(declare-fun m!1318343 () Bool)

(assert (=> start!123158 m!1318343))

(declare-fun m!1318345 () Bool)

(assert (=> b!1428087 m!1318345))

(assert (=> b!1428087 m!1318345))

(declare-fun m!1318347 () Bool)

(assert (=> b!1428087 m!1318347))

(declare-fun m!1318349 () Bool)

(assert (=> b!1428087 m!1318349))

(declare-fun m!1318351 () Bool)

(assert (=> b!1428087 m!1318351))

(declare-fun m!1318353 () Bool)

(assert (=> b!1428089 m!1318353))

(declare-fun m!1318355 () Bool)

(assert (=> b!1428093 m!1318355))

(assert (=> b!1428093 m!1318355))

(declare-fun m!1318357 () Bool)

(assert (=> b!1428093 m!1318357))

(assert (=> b!1428097 m!1318355))

(assert (=> b!1428097 m!1318355))

(declare-fun m!1318359 () Bool)

(assert (=> b!1428097 m!1318359))

(assert (=> b!1428097 m!1318359))

(assert (=> b!1428097 m!1318355))

(declare-fun m!1318361 () Bool)

(assert (=> b!1428097 m!1318361))

(declare-fun m!1318363 () Bool)

(assert (=> b!1428094 m!1318363))

(assert (=> b!1428091 m!1318355))

(assert (=> b!1428091 m!1318355))

(declare-fun m!1318365 () Bool)

(assert (=> b!1428091 m!1318365))

(assert (=> b!1428096 m!1318355))

(assert (=> b!1428096 m!1318355))

(declare-fun m!1318367 () Bool)

(assert (=> b!1428096 m!1318367))

(check-sat (not b!1428097) (not b!1428088) (not b!1428089) (not b!1428094) (not b!1428090) (not b!1428096) (not b!1428091) (not start!123158) (not b!1428095) (not b!1428087) (not b!1428093))
(check-sat)
