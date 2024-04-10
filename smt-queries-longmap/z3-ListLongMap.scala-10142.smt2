; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119618 () Bool)

(assert start!119618)

(declare-fun b!1393355 () Bool)

(declare-fun e!788975 () Bool)

(declare-fun e!788977 () Bool)

(assert (=> b!1393355 (= e!788975 (not e!788977))))

(declare-fun res!932766 () Bool)

(assert (=> b!1393355 (=> res!932766 e!788977)))

(declare-datatypes ((SeekEntryResult!10325 0))(
  ( (MissingZero!10325 (index!43671 (_ BitVec 32))) (Found!10325 (index!43672 (_ BitVec 32))) (Intermediate!10325 (undefined!11137 Bool) (index!43673 (_ BitVec 32)) (x!125353 (_ BitVec 32))) (Undefined!10325) (MissingVacant!10325 (index!43674 (_ BitVec 32))) )
))
(declare-fun lt!611960 () SeekEntryResult!10325)

(get-info :version)

(assert (=> b!1393355 (= res!932766 (or (not ((_ is Intermediate!10325) lt!611960)) (undefined!11137 lt!611960)))))

(declare-fun e!788976 () Bool)

(assert (=> b!1393355 e!788976))

(declare-fun res!932764 () Bool)

(assert (=> b!1393355 (=> (not res!932764) (not e!788976))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95300 0))(
  ( (array!95301 (arr!46008 (Array (_ BitVec 32) (_ BitVec 64))) (size!46558 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95300)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95300 (_ BitVec 32)) Bool)

(assert (=> b!1393355 (= res!932764 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46654 0))(
  ( (Unit!46655) )
))
(declare-fun lt!611961 () Unit!46654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95300 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46654)

(assert (=> b!1393355 (= lt!611961 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95300 (_ BitVec 32)) SeekEntryResult!10325)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393355 (= lt!611960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46008 a!2901) j!112) mask!2840) (select (arr!46008 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393356 () Bool)

(declare-fun res!932769 () Bool)

(assert (=> b!1393356 (=> (not res!932769) (not e!788975))))

(declare-datatypes ((List!32527 0))(
  ( (Nil!32524) (Cons!32523 (h!33756 (_ BitVec 64)) (t!47221 List!32527)) )
))
(declare-fun arrayNoDuplicates!0 (array!95300 (_ BitVec 32) List!32527) Bool)

(assert (=> b!1393356 (= res!932769 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32524))))

(declare-fun b!1393357 () Bool)

(declare-fun res!932770 () Bool)

(assert (=> b!1393357 (=> (not res!932770) (not e!788975))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393357 (= res!932770 (validKeyInArray!0 (select (arr!46008 a!2901) i!1037)))))

(declare-fun b!1393358 () Bool)

(declare-fun res!932768 () Bool)

(assert (=> b!1393358 (=> (not res!932768) (not e!788975))))

(assert (=> b!1393358 (= res!932768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!932767 () Bool)

(assert (=> start!119618 (=> (not res!932767) (not e!788975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119618 (= res!932767 (validMask!0 mask!2840))))

(assert (=> start!119618 e!788975))

(assert (=> start!119618 true))

(declare-fun array_inv!35036 (array!95300) Bool)

(assert (=> start!119618 (array_inv!35036 a!2901)))

(declare-fun b!1393359 () Bool)

(declare-fun res!932763 () Bool)

(assert (=> b!1393359 (=> (not res!932763) (not e!788975))))

(assert (=> b!1393359 (= res!932763 (and (= (size!46558 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46558 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46558 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393360 () Bool)

(declare-fun res!932765 () Bool)

(assert (=> b!1393360 (=> (not res!932765) (not e!788975))))

(assert (=> b!1393360 (= res!932765 (validKeyInArray!0 (select (arr!46008 a!2901) j!112)))))

(declare-fun b!1393361 () Bool)

(assert (=> b!1393361 (= e!788977 true)))

(declare-fun lt!611959 () SeekEntryResult!10325)

(assert (=> b!1393361 (= lt!611959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46008 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46008 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95301 (store (arr!46008 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46558 a!2901)) mask!2840))))

(declare-fun b!1393362 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95300 (_ BitVec 32)) SeekEntryResult!10325)

(assert (=> b!1393362 (= e!788976 (= (seekEntryOrOpen!0 (select (arr!46008 a!2901) j!112) a!2901 mask!2840) (Found!10325 j!112)))))

(assert (= (and start!119618 res!932767) b!1393359))

(assert (= (and b!1393359 res!932763) b!1393357))

(assert (= (and b!1393357 res!932770) b!1393360))

(assert (= (and b!1393360 res!932765) b!1393358))

(assert (= (and b!1393358 res!932768) b!1393356))

(assert (= (and b!1393356 res!932769) b!1393355))

(assert (= (and b!1393355 res!932764) b!1393362))

(assert (= (and b!1393355 (not res!932766)) b!1393361))

(declare-fun m!1279231 () Bool)

(assert (=> b!1393362 m!1279231))

(assert (=> b!1393362 m!1279231))

(declare-fun m!1279233 () Bool)

(assert (=> b!1393362 m!1279233))

(assert (=> b!1393360 m!1279231))

(assert (=> b!1393360 m!1279231))

(declare-fun m!1279235 () Bool)

(assert (=> b!1393360 m!1279235))

(declare-fun m!1279237 () Bool)

(assert (=> start!119618 m!1279237))

(declare-fun m!1279239 () Bool)

(assert (=> start!119618 m!1279239))

(declare-fun m!1279241 () Bool)

(assert (=> b!1393361 m!1279241))

(declare-fun m!1279243 () Bool)

(assert (=> b!1393361 m!1279243))

(assert (=> b!1393361 m!1279243))

(declare-fun m!1279245 () Bool)

(assert (=> b!1393361 m!1279245))

(assert (=> b!1393361 m!1279245))

(assert (=> b!1393361 m!1279243))

(declare-fun m!1279247 () Bool)

(assert (=> b!1393361 m!1279247))

(declare-fun m!1279249 () Bool)

(assert (=> b!1393357 m!1279249))

(assert (=> b!1393357 m!1279249))

(declare-fun m!1279251 () Bool)

(assert (=> b!1393357 m!1279251))

(declare-fun m!1279253 () Bool)

(assert (=> b!1393356 m!1279253))

(assert (=> b!1393355 m!1279231))

(declare-fun m!1279255 () Bool)

(assert (=> b!1393355 m!1279255))

(assert (=> b!1393355 m!1279231))

(declare-fun m!1279257 () Bool)

(assert (=> b!1393355 m!1279257))

(assert (=> b!1393355 m!1279255))

(assert (=> b!1393355 m!1279231))

(declare-fun m!1279259 () Bool)

(assert (=> b!1393355 m!1279259))

(declare-fun m!1279261 () Bool)

(assert (=> b!1393355 m!1279261))

(declare-fun m!1279263 () Bool)

(assert (=> b!1393358 m!1279263))

(check-sat (not b!1393360) (not b!1393361) (not b!1393355) (not b!1393357) (not b!1393356) (not b!1393362) (not start!119618) (not b!1393358))
