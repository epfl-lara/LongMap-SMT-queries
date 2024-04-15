; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119802 () Bool)

(assert start!119802)

(declare-fun b!1395236 () Bool)

(declare-fun e!789911 () Bool)

(assert (=> b!1395236 (= e!789911 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95386 0))(
  ( (array!95387 (arr!46050 (Array (_ BitVec 32) (_ BitVec 64))) (size!46602 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95386)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10393 0))(
  ( (MissingZero!10393 (index!43943 (_ BitVec 32))) (Found!10393 (index!43944 (_ BitVec 32))) (Intermediate!10393 (undefined!11205 Bool) (index!43945 (_ BitVec 32)) (x!125600 (_ BitVec 32))) (Undefined!10393) (MissingVacant!10393 (index!43946 (_ BitVec 32))) )
))
(declare-fun lt!612762 () SeekEntryResult!10393)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95386 (_ BitVec 32)) SeekEntryResult!10393)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395236 (= lt!612762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95387 (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46602 a!2901)) mask!2840))))

(declare-fun b!1395237 () Bool)

(declare-fun res!934536 () Bool)

(declare-fun e!789910 () Bool)

(assert (=> b!1395237 (=> (not res!934536) (not e!789910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95386 (_ BitVec 32)) Bool)

(assert (=> b!1395237 (= res!934536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!934534 () Bool)

(assert (=> start!119802 (=> (not res!934534) (not e!789910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119802 (= res!934534 (validMask!0 mask!2840))))

(assert (=> start!119802 e!789910))

(assert (=> start!119802 true))

(declare-fun array_inv!35283 (array!95386) Bool)

(assert (=> start!119802 (array_inv!35283 a!2901)))

(declare-fun b!1395238 () Bool)

(declare-fun res!934531 () Bool)

(assert (=> b!1395238 (=> (not res!934531) (not e!789910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395238 (= res!934531 (validKeyInArray!0 (select (arr!46050 a!2901) i!1037)))))

(declare-fun e!789908 () Bool)

(declare-fun b!1395239 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95386 (_ BitVec 32)) SeekEntryResult!10393)

(assert (=> b!1395239 (= e!789908 (= (seekEntryOrOpen!0 (select (arr!46050 a!2901) j!112) a!2901 mask!2840) (Found!10393 j!112)))))

(declare-fun b!1395240 () Bool)

(declare-fun res!934533 () Bool)

(assert (=> b!1395240 (=> (not res!934533) (not e!789910))))

(assert (=> b!1395240 (= res!934533 (and (= (size!46602 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46602 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46602 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395241 () Bool)

(declare-fun res!934532 () Bool)

(assert (=> b!1395241 (=> (not res!934532) (not e!789910))))

(assert (=> b!1395241 (= res!934532 (validKeyInArray!0 (select (arr!46050 a!2901) j!112)))))

(declare-fun b!1395242 () Bool)

(declare-fun res!934530 () Bool)

(assert (=> b!1395242 (=> (not res!934530) (not e!789910))))

(declare-datatypes ((List!32647 0))(
  ( (Nil!32644) (Cons!32643 (h!33879 (_ BitVec 64)) (t!47333 List!32647)) )
))
(declare-fun arrayNoDuplicates!0 (array!95386 (_ BitVec 32) List!32647) Bool)

(assert (=> b!1395242 (= res!934530 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32644))))

(declare-fun b!1395243 () Bool)

(assert (=> b!1395243 (= e!789910 (not e!789911))))

(declare-fun res!934535 () Bool)

(assert (=> b!1395243 (=> res!934535 e!789911)))

(declare-fun lt!612763 () SeekEntryResult!10393)

(assert (=> b!1395243 (= res!934535 (or (not (is-Intermediate!10393 lt!612763)) (undefined!11205 lt!612763)))))

(assert (=> b!1395243 e!789908))

(declare-fun res!934537 () Bool)

(assert (=> b!1395243 (=> (not res!934537) (not e!789908))))

(assert (=> b!1395243 (= res!934537 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46633 0))(
  ( (Unit!46634) )
))
(declare-fun lt!612764 () Unit!46633)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46633)

(assert (=> b!1395243 (= lt!612764 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395243 (= lt!612763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46050 a!2901) j!112) mask!2840) (select (arr!46050 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119802 res!934534) b!1395240))

(assert (= (and b!1395240 res!934533) b!1395238))

(assert (= (and b!1395238 res!934531) b!1395241))

(assert (= (and b!1395241 res!934532) b!1395237))

(assert (= (and b!1395237 res!934536) b!1395242))

(assert (= (and b!1395242 res!934530) b!1395243))

(assert (= (and b!1395243 res!934537) b!1395239))

(assert (= (and b!1395243 (not res!934535)) b!1395236))

(declare-fun m!1281225 () Bool)

(assert (=> b!1395236 m!1281225))

(declare-fun m!1281227 () Bool)

(assert (=> b!1395236 m!1281227))

(assert (=> b!1395236 m!1281227))

(declare-fun m!1281229 () Bool)

(assert (=> b!1395236 m!1281229))

(assert (=> b!1395236 m!1281229))

(assert (=> b!1395236 m!1281227))

(declare-fun m!1281231 () Bool)

(assert (=> b!1395236 m!1281231))

(declare-fun m!1281233 () Bool)

(assert (=> b!1395242 m!1281233))

(declare-fun m!1281235 () Bool)

(assert (=> b!1395239 m!1281235))

(assert (=> b!1395239 m!1281235))

(declare-fun m!1281237 () Bool)

(assert (=> b!1395239 m!1281237))

(assert (=> b!1395243 m!1281235))

(declare-fun m!1281239 () Bool)

(assert (=> b!1395243 m!1281239))

(assert (=> b!1395243 m!1281235))

(declare-fun m!1281241 () Bool)

(assert (=> b!1395243 m!1281241))

(assert (=> b!1395243 m!1281239))

(assert (=> b!1395243 m!1281235))

(declare-fun m!1281243 () Bool)

(assert (=> b!1395243 m!1281243))

(declare-fun m!1281245 () Bool)

(assert (=> b!1395243 m!1281245))

(declare-fun m!1281247 () Bool)

(assert (=> b!1395238 m!1281247))

(assert (=> b!1395238 m!1281247))

(declare-fun m!1281249 () Bool)

(assert (=> b!1395238 m!1281249))

(declare-fun m!1281251 () Bool)

(assert (=> b!1395237 m!1281251))

(declare-fun m!1281253 () Bool)

(assert (=> start!119802 m!1281253))

(declare-fun m!1281255 () Bool)

(assert (=> start!119802 m!1281255))

(assert (=> b!1395241 m!1281235))

(assert (=> b!1395241 m!1281235))

(declare-fun m!1281257 () Bool)

(assert (=> b!1395241 m!1281257))

(push 1)

(assert (not b!1395242))

(assert (not b!1395239))

(assert (not b!1395238))

(assert (not start!119802))

(assert (not b!1395241))

(assert (not b!1395236))

(assert (not b!1395243))

(assert (not b!1395237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

