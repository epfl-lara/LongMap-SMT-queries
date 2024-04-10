; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123078 () Bool)

(assert start!123078)

(declare-fun b!1427271 () Bool)

(declare-fun res!962313 () Bool)

(declare-fun e!806166 () Bool)

(assert (=> b!1427271 (=> (not res!962313) (not e!806166))))

(declare-datatypes ((array!97341 0))(
  ( (array!97342 (arr!46985 (Array (_ BitVec 32) (_ BitVec 64))) (size!47535 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97341)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427271 (= res!962313 (validKeyInArray!0 (select (arr!46985 a!2831) i!982)))))

(declare-fun res!962310 () Bool)

(assert (=> start!123078 (=> (not res!962310) (not e!806166))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123078 (= res!962310 (validMask!0 mask!2608))))

(assert (=> start!123078 e!806166))

(assert (=> start!123078 true))

(declare-fun array_inv!36013 (array!97341) Bool)

(assert (=> start!123078 (array_inv!36013 a!2831)))

(declare-fun b!1427272 () Bool)

(declare-fun res!962312 () Bool)

(assert (=> b!1427272 (=> (not res!962312) (not e!806166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97341 (_ BitVec 32)) Bool)

(assert (=> b!1427272 (= res!962312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427273 () Bool)

(declare-fun res!962305 () Bool)

(declare-fun e!806168 () Bool)

(assert (=> b!1427273 (=> (not res!962305) (not e!806168))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427273 (= res!962305 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427274 () Bool)

(declare-fun e!806165 () Bool)

(assert (=> b!1427274 (= e!806165 e!806168)))

(declare-fun res!962311 () Bool)

(assert (=> b!1427274 (=> (not res!962311) (not e!806168))))

(declare-fun lt!628506 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11264 0))(
  ( (MissingZero!11264 (index!47448 (_ BitVec 32))) (Found!11264 (index!47449 (_ BitVec 32))) (Intermediate!11264 (undefined!12076 Bool) (index!47450 (_ BitVec 32)) (x!129086 (_ BitVec 32))) (Undefined!11264) (MissingVacant!11264 (index!47451 (_ BitVec 32))) )
))
(declare-fun lt!628507 () SeekEntryResult!11264)

(declare-fun lt!628508 () array!97341)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97341 (_ BitVec 32)) SeekEntryResult!11264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427274 (= res!962311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628506 mask!2608) lt!628506 lt!628508 mask!2608) lt!628507))))

(assert (=> b!1427274 (= lt!628507 (Intermediate!11264 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1427274 (= lt!628506 (select (store (arr!46985 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427274 (= lt!628508 (array!97342 (store (arr!46985 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47535 a!2831)))))

(declare-fun b!1427275 () Bool)

(declare-fun res!962302 () Bool)

(assert (=> b!1427275 (=> (not res!962302) (not e!806168))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628505 () SeekEntryResult!11264)

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1427275 (= res!962302 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46985 a!2831) j!81) a!2831 mask!2608) lt!628505))))

(declare-fun b!1427276 () Bool)

(declare-fun res!962314 () Bool)

(assert (=> b!1427276 (=> (not res!962314) (not e!806166))))

(declare-datatypes ((List!33495 0))(
  ( (Nil!33492) (Cons!33491 (h!34799 (_ BitVec 64)) (t!48189 List!33495)) )
))
(declare-fun arrayNoDuplicates!0 (array!97341 (_ BitVec 32) List!33495) Bool)

(assert (=> b!1427276 (= res!962314 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33492))))

(declare-fun b!1427277 () Bool)

(declare-fun res!962307 () Bool)

(assert (=> b!1427277 (=> (not res!962307) (not e!806168))))

(assert (=> b!1427277 (= res!962307 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628506 lt!628508 mask!2608) lt!628507))))

(declare-fun b!1427278 () Bool)

(declare-fun res!962303 () Bool)

(assert (=> b!1427278 (=> (not res!962303) (not e!806166))))

(assert (=> b!1427278 (= res!962303 (and (= (size!47535 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47535 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47535 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427279 () Bool)

(assert (=> b!1427279 (= e!806166 e!806165)))

(declare-fun res!962308 () Bool)

(assert (=> b!1427279 (=> (not res!962308) (not e!806165))))

(assert (=> b!1427279 (= res!962308 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46985 a!2831) j!81) mask!2608) (select (arr!46985 a!2831) j!81) a!2831 mask!2608) lt!628505))))

(assert (=> b!1427279 (= lt!628505 (Intermediate!11264 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427280 () Bool)

(declare-fun res!962306 () Bool)

(assert (=> b!1427280 (=> (not res!962306) (not e!806166))))

(assert (=> b!1427280 (= res!962306 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47535 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47535 a!2831))))))

(declare-fun b!1427281 () Bool)

(declare-fun e!806167 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97341 (_ BitVec 32)) SeekEntryResult!11264)

(assert (=> b!1427281 (= e!806167 (= (seekEntryOrOpen!0 (select (arr!46985 a!2831) j!81) a!2831 mask!2608) (Found!11264 j!81)))))

(declare-fun b!1427282 () Bool)

(declare-fun res!962309 () Bool)

(assert (=> b!1427282 (=> (not res!962309) (not e!806166))))

(assert (=> b!1427282 (= res!962309 (validKeyInArray!0 (select (arr!46985 a!2831) j!81)))))

(declare-fun b!1427283 () Bool)

(assert (=> b!1427283 (= e!806168 (not true))))

(assert (=> b!1427283 e!806167))

(declare-fun res!962304 () Bool)

(assert (=> b!1427283 (=> (not res!962304) (not e!806167))))

(assert (=> b!1427283 (= res!962304 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48274 0))(
  ( (Unit!48275) )
))
(declare-fun lt!628509 () Unit!48274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48274)

(assert (=> b!1427283 (= lt!628509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123078 res!962310) b!1427278))

(assert (= (and b!1427278 res!962303) b!1427271))

(assert (= (and b!1427271 res!962313) b!1427282))

(assert (= (and b!1427282 res!962309) b!1427272))

(assert (= (and b!1427272 res!962312) b!1427276))

(assert (= (and b!1427276 res!962314) b!1427280))

(assert (= (and b!1427280 res!962306) b!1427279))

(assert (= (and b!1427279 res!962308) b!1427274))

(assert (= (and b!1427274 res!962311) b!1427275))

(assert (= (and b!1427275 res!962302) b!1427277))

(assert (= (and b!1427277 res!962307) b!1427273))

(assert (= (and b!1427273 res!962305) b!1427283))

(assert (= (and b!1427283 res!962304) b!1427281))

(declare-fun m!1317645 () Bool)

(assert (=> b!1427282 m!1317645))

(assert (=> b!1427282 m!1317645))

(declare-fun m!1317647 () Bool)

(assert (=> b!1427282 m!1317647))

(declare-fun m!1317649 () Bool)

(assert (=> b!1427274 m!1317649))

(assert (=> b!1427274 m!1317649))

(declare-fun m!1317651 () Bool)

(assert (=> b!1427274 m!1317651))

(declare-fun m!1317653 () Bool)

(assert (=> b!1427274 m!1317653))

(declare-fun m!1317655 () Bool)

(assert (=> b!1427274 m!1317655))

(declare-fun m!1317657 () Bool)

(assert (=> b!1427276 m!1317657))

(declare-fun m!1317659 () Bool)

(assert (=> b!1427277 m!1317659))

(declare-fun m!1317661 () Bool)

(assert (=> b!1427283 m!1317661))

(declare-fun m!1317663 () Bool)

(assert (=> b!1427283 m!1317663))

(declare-fun m!1317665 () Bool)

(assert (=> b!1427271 m!1317665))

(assert (=> b!1427271 m!1317665))

(declare-fun m!1317667 () Bool)

(assert (=> b!1427271 m!1317667))

(assert (=> b!1427281 m!1317645))

(assert (=> b!1427281 m!1317645))

(declare-fun m!1317669 () Bool)

(assert (=> b!1427281 m!1317669))

(assert (=> b!1427275 m!1317645))

(assert (=> b!1427275 m!1317645))

(declare-fun m!1317671 () Bool)

(assert (=> b!1427275 m!1317671))

(declare-fun m!1317673 () Bool)

(assert (=> b!1427272 m!1317673))

(assert (=> b!1427279 m!1317645))

(assert (=> b!1427279 m!1317645))

(declare-fun m!1317675 () Bool)

(assert (=> b!1427279 m!1317675))

(assert (=> b!1427279 m!1317675))

(assert (=> b!1427279 m!1317645))

(declare-fun m!1317677 () Bool)

(assert (=> b!1427279 m!1317677))

(declare-fun m!1317679 () Bool)

(assert (=> start!123078 m!1317679))

(declare-fun m!1317681 () Bool)

(assert (=> start!123078 m!1317681))

(push 1)

