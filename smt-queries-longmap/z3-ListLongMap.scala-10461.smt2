; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123170 () Bool)

(assert start!123170)

(declare-fun res!961917 () Bool)

(declare-fun e!806443 () Bool)

(assert (=> start!123170 (=> (not res!961917) (not e!806443))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123170 (= res!961917 (validMask!0 mask!2608))))

(assert (=> start!123170 e!806443))

(assert (=> start!123170 true))

(declare-datatypes ((array!97406 0))(
  ( (array!97407 (arr!47017 (Array (_ BitVec 32) (_ BitVec 64))) (size!47568 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97406)

(declare-fun array_inv!36298 (array!97406) Bool)

(assert (=> start!123170 (array_inv!36298 a!2831)))

(declare-fun b!1427360 () Bool)

(declare-fun res!961913 () Bool)

(assert (=> b!1427360 (=> (not res!961913) (not e!806443))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427360 (= res!961913 (and (= (size!47568 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47568 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47568 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427361 () Bool)

(declare-fun res!961911 () Bool)

(assert (=> b!1427361 (=> (not res!961911) (not e!806443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97406 (_ BitVec 32)) Bool)

(assert (=> b!1427361 (= res!961911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427362 () Bool)

(declare-fun res!961912 () Bool)

(declare-fun e!806444 () Bool)

(assert (=> b!1427362 (=> (not res!961912) (not e!806444))))

(declare-datatypes ((SeekEntryResult!11198 0))(
  ( (MissingZero!11198 (index!47184 (_ BitVec 32))) (Found!11198 (index!47185 (_ BitVec 32))) (Intermediate!11198 (undefined!12010 Bool) (index!47186 (_ BitVec 32)) (x!128977 (_ BitVec 32))) (Undefined!11198) (MissingVacant!11198 (index!47187 (_ BitVec 32))) )
))
(declare-fun lt!628481 () SeekEntryResult!11198)

(declare-fun lt!628484 () array!97406)

(declare-fun lt!628483 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97406 (_ BitVec 32)) SeekEntryResult!11198)

(assert (=> b!1427362 (= res!961912 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628483 lt!628484 mask!2608) lt!628481))))

(declare-fun b!1427363 () Bool)

(declare-fun res!961909 () Bool)

(assert (=> b!1427363 (=> (not res!961909) (not e!806443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427363 (= res!961909 (validKeyInArray!0 (select (arr!47017 a!2831) j!81)))))

(declare-fun b!1427364 () Bool)

(declare-fun res!961916 () Bool)

(assert (=> b!1427364 (=> (not res!961916) (not e!806443))))

(declare-datatypes ((List!33514 0))(
  ( (Nil!33511) (Cons!33510 (h!34823 (_ BitVec 64)) (t!48200 List!33514)) )
))
(declare-fun arrayNoDuplicates!0 (array!97406 (_ BitVec 32) List!33514) Bool)

(assert (=> b!1427364 (= res!961916 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33511))))

(declare-fun b!1427365 () Bool)

(declare-fun e!806442 () Bool)

(assert (=> b!1427365 (= e!806443 e!806442)))

(declare-fun res!961918 () Bool)

(assert (=> b!1427365 (=> (not res!961918) (not e!806442))))

(declare-fun lt!628482 () SeekEntryResult!11198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427365 (= res!961918 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!628482))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427365 (= lt!628482 (Intermediate!11198 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427366 () Bool)

(declare-fun res!961914 () Bool)

(assert (=> b!1427366 (=> (not res!961914) (not e!806444))))

(assert (=> b!1427366 (= res!961914 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!628482))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun b!1427367 () Bool)

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1427367 (= e!806444 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsgt #b00000000000000000000000000000000 (size!47568 a!2831))))))

(declare-fun b!1427368 () Bool)

(assert (=> b!1427368 (= e!806442 e!806444)))

(declare-fun res!961915 () Bool)

(assert (=> b!1427368 (=> (not res!961915) (not e!806444))))

(assert (=> b!1427368 (= res!961915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628483 mask!2608) lt!628483 lt!628484 mask!2608) lt!628481))))

(assert (=> b!1427368 (= lt!628481 (Intermediate!11198 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427368 (= lt!628483 (select (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427368 (= lt!628484 (array!97407 (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47568 a!2831)))))

(declare-fun b!1427369 () Bool)

(declare-fun res!961908 () Bool)

(assert (=> b!1427369 (=> (not res!961908) (not e!806443))))

(assert (=> b!1427369 (= res!961908 (validKeyInArray!0 (select (arr!47017 a!2831) i!982)))))

(declare-fun b!1427370 () Bool)

(declare-fun res!961910 () Bool)

(assert (=> b!1427370 (=> (not res!961910) (not e!806443))))

(assert (=> b!1427370 (= res!961910 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47568 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47568 a!2831))))))

(assert (= (and start!123170 res!961917) b!1427360))

(assert (= (and b!1427360 res!961913) b!1427369))

(assert (= (and b!1427369 res!961908) b!1427363))

(assert (= (and b!1427363 res!961909) b!1427361))

(assert (= (and b!1427361 res!961911) b!1427364))

(assert (= (and b!1427364 res!961916) b!1427370))

(assert (= (and b!1427370 res!961910) b!1427365))

(assert (= (and b!1427365 res!961918) b!1427368))

(assert (= (and b!1427368 res!961915) b!1427366))

(assert (= (and b!1427366 res!961914) b!1427362))

(assert (= (and b!1427362 res!961912) b!1427367))

(declare-fun m!1318089 () Bool)

(assert (=> b!1427364 m!1318089))

(declare-fun m!1318091 () Bool)

(assert (=> b!1427361 m!1318091))

(declare-fun m!1318093 () Bool)

(assert (=> b!1427363 m!1318093))

(assert (=> b!1427363 m!1318093))

(declare-fun m!1318095 () Bool)

(assert (=> b!1427363 m!1318095))

(assert (=> b!1427365 m!1318093))

(assert (=> b!1427365 m!1318093))

(declare-fun m!1318097 () Bool)

(assert (=> b!1427365 m!1318097))

(assert (=> b!1427365 m!1318097))

(assert (=> b!1427365 m!1318093))

(declare-fun m!1318099 () Bool)

(assert (=> b!1427365 m!1318099))

(assert (=> b!1427366 m!1318093))

(assert (=> b!1427366 m!1318093))

(declare-fun m!1318101 () Bool)

(assert (=> b!1427366 m!1318101))

(declare-fun m!1318103 () Bool)

(assert (=> start!123170 m!1318103))

(declare-fun m!1318105 () Bool)

(assert (=> start!123170 m!1318105))

(declare-fun m!1318107 () Bool)

(assert (=> b!1427362 m!1318107))

(declare-fun m!1318109 () Bool)

(assert (=> b!1427368 m!1318109))

(assert (=> b!1427368 m!1318109))

(declare-fun m!1318111 () Bool)

(assert (=> b!1427368 m!1318111))

(declare-fun m!1318113 () Bool)

(assert (=> b!1427368 m!1318113))

(declare-fun m!1318115 () Bool)

(assert (=> b!1427368 m!1318115))

(declare-fun m!1318117 () Bool)

(assert (=> b!1427369 m!1318117))

(assert (=> b!1427369 m!1318117))

(declare-fun m!1318119 () Bool)

(assert (=> b!1427369 m!1318119))

(check-sat (not b!1427364) (not b!1427365) (not b!1427369) (not b!1427368) (not b!1427362) (not b!1427366) (not b!1427361) (not start!123170) (not b!1427363))
(check-sat)
