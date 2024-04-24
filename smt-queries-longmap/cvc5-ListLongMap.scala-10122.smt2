; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119472 () Bool)

(assert start!119472)

(declare-fun b!1392159 () Bool)

(declare-fun res!931493 () Bool)

(declare-fun e!788452 () Bool)

(assert (=> b!1392159 (=> (not res!931493) (not e!788452))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95280 0))(
  ( (array!95281 (arr!46002 (Array (_ BitVec 32) (_ BitVec 64))) (size!46553 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95280)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1392159 (= res!931493 (and (= (size!46553 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46553 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46553 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392160 () Bool)

(declare-fun res!931489 () Bool)

(assert (=> b!1392160 (=> (not res!931489) (not e!788452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392160 (= res!931489 (validKeyInArray!0 (select (arr!46002 a!2901) j!112)))))

(declare-fun res!931495 () Bool)

(assert (=> start!119472 (=> (not res!931495) (not e!788452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119472 (= res!931495 (validMask!0 mask!2840))))

(assert (=> start!119472 e!788452))

(assert (=> start!119472 true))

(declare-fun array_inv!35283 (array!95280) Bool)

(assert (=> start!119472 (array_inv!35283 a!2901)))

(declare-fun b!1392161 () Bool)

(declare-fun res!931492 () Bool)

(assert (=> b!1392161 (=> (not res!931492) (not e!788452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95280 (_ BitVec 32)) Bool)

(assert (=> b!1392161 (= res!931492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!788453 () Bool)

(declare-fun b!1392162 () Bool)

(declare-datatypes ((SeekEntryResult!10222 0))(
  ( (MissingZero!10222 (index!43259 (_ BitVec 32))) (Found!10222 (index!43260 (_ BitVec 32))) (Intermediate!10222 (undefined!11034 Bool) (index!43261 (_ BitVec 32)) (x!125085 (_ BitVec 32))) (Undefined!10222) (MissingVacant!10222 (index!43262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95280 (_ BitVec 32)) SeekEntryResult!10222)

(assert (=> b!1392162 (= e!788453 (= (seekEntryOrOpen!0 (select (arr!46002 a!2901) j!112) a!2901 mask!2840) (Found!10222 j!112)))))

(declare-fun b!1392163 () Bool)

(declare-fun res!931490 () Bool)

(assert (=> b!1392163 (=> (not res!931490) (not e!788452))))

(declare-datatypes ((List!32508 0))(
  ( (Nil!32505) (Cons!32504 (h!33733 (_ BitVec 64)) (t!47194 List!32508)) )
))
(declare-fun arrayNoDuplicates!0 (array!95280 (_ BitVec 32) List!32508) Bool)

(assert (=> b!1392163 (= res!931490 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32505))))

(declare-fun b!1392164 () Bool)

(declare-fun res!931491 () Bool)

(assert (=> b!1392164 (=> (not res!931491) (not e!788452))))

(assert (=> b!1392164 (= res!931491 (validKeyInArray!0 (select (arr!46002 a!2901) i!1037)))))

(declare-fun b!1392165 () Bool)

(assert (=> b!1392165 (= e!788452 (not true))))

(assert (=> b!1392165 e!788453))

(declare-fun res!931494 () Bool)

(assert (=> b!1392165 (=> (not res!931494) (not e!788453))))

(assert (=> b!1392165 (= res!931494 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46475 0))(
  ( (Unit!46476) )
))
(declare-fun lt!611431 () Unit!46475)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46475)

(assert (=> b!1392165 (= lt!611431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611432 () SeekEntryResult!10222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95280 (_ BitVec 32)) SeekEntryResult!10222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392165 (= lt!611432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46002 a!2901) j!112) mask!2840) (select (arr!46002 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119472 res!931495) b!1392159))

(assert (= (and b!1392159 res!931493) b!1392164))

(assert (= (and b!1392164 res!931491) b!1392160))

(assert (= (and b!1392160 res!931489) b!1392161))

(assert (= (and b!1392161 res!931492) b!1392163))

(assert (= (and b!1392163 res!931490) b!1392165))

(assert (= (and b!1392165 res!931494) b!1392162))

(declare-fun m!1278221 () Bool)

(assert (=> start!119472 m!1278221))

(declare-fun m!1278223 () Bool)

(assert (=> start!119472 m!1278223))

(declare-fun m!1278225 () Bool)

(assert (=> b!1392161 m!1278225))

(declare-fun m!1278227 () Bool)

(assert (=> b!1392164 m!1278227))

(assert (=> b!1392164 m!1278227))

(declare-fun m!1278229 () Bool)

(assert (=> b!1392164 m!1278229))

(declare-fun m!1278231 () Bool)

(assert (=> b!1392162 m!1278231))

(assert (=> b!1392162 m!1278231))

(declare-fun m!1278233 () Bool)

(assert (=> b!1392162 m!1278233))

(declare-fun m!1278235 () Bool)

(assert (=> b!1392163 m!1278235))

(assert (=> b!1392165 m!1278231))

(declare-fun m!1278237 () Bool)

(assert (=> b!1392165 m!1278237))

(assert (=> b!1392165 m!1278231))

(declare-fun m!1278239 () Bool)

(assert (=> b!1392165 m!1278239))

(assert (=> b!1392165 m!1278237))

(assert (=> b!1392165 m!1278231))

(declare-fun m!1278241 () Bool)

(assert (=> b!1392165 m!1278241))

(declare-fun m!1278243 () Bool)

(assert (=> b!1392165 m!1278243))

(assert (=> b!1392160 m!1278231))

(assert (=> b!1392160 m!1278231))

(declare-fun m!1278245 () Bool)

(assert (=> b!1392160 m!1278245))

(push 1)

(assert (not b!1392160))

(assert (not b!1392165))

(assert (not b!1392164))

(assert (not b!1392163))

(assert (not b!1392162))

(assert (not b!1392161))

(assert (not start!119472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

