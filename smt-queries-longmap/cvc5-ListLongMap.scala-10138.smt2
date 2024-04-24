; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119784 () Bool)

(assert start!119784)

(declare-fun b!1394231 () Bool)

(declare-fun res!932957 () Bool)

(declare-fun e!789584 () Bool)

(assert (=> b!1394231 (=> (not res!932957) (not e!789584))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95388 0))(
  ( (array!95389 (arr!46050 (Array (_ BitVec 32) (_ BitVec 64))) (size!46601 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95388)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394231 (= res!932957 (and (= (size!46601 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46601 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46601 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394232 () Bool)

(declare-fun res!932955 () Bool)

(assert (=> b!1394232 (=> (not res!932955) (not e!789584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95388 (_ BitVec 32)) Bool)

(assert (=> b!1394232 (= res!932955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394233 () Bool)

(declare-fun e!789582 () Bool)

(assert (=> b!1394233 (= e!789584 (not e!789582))))

(declare-fun res!932958 () Bool)

(assert (=> b!1394233 (=> res!932958 e!789582)))

(declare-datatypes ((SeekEntryResult!10270 0))(
  ( (MissingZero!10270 (index!43451 (_ BitVec 32))) (Found!10270 (index!43452 (_ BitVec 32))) (Intermediate!10270 (undefined!11082 Bool) (index!43453 (_ BitVec 32)) (x!125285 (_ BitVec 32))) (Undefined!10270) (MissingVacant!10270 (index!43454 (_ BitVec 32))) )
))
(declare-fun lt!612258 () SeekEntryResult!10270)

(assert (=> b!1394233 (= res!932958 (or (not (is-Intermediate!10270 lt!612258)) (undefined!11082 lt!612258)))))

(declare-fun e!789581 () Bool)

(assert (=> b!1394233 e!789581))

(declare-fun res!932956 () Bool)

(assert (=> b!1394233 (=> (not res!932956) (not e!789581))))

(assert (=> b!1394233 (= res!932956 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46571 0))(
  ( (Unit!46572) )
))
(declare-fun lt!612259 () Unit!46571)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46571)

(assert (=> b!1394233 (= lt!612259 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95388 (_ BitVec 32)) SeekEntryResult!10270)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394233 (= lt!612258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46050 a!2901) j!112) mask!2840) (select (arr!46050 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394234 () Bool)

(declare-fun res!932959 () Bool)

(assert (=> b!1394234 (=> (not res!932959) (not e!789584))))

(declare-datatypes ((List!32556 0))(
  ( (Nil!32553) (Cons!32552 (h!33793 (_ BitVec 64)) (t!47242 List!32556)) )
))
(declare-fun arrayNoDuplicates!0 (array!95388 (_ BitVec 32) List!32556) Bool)

(assert (=> b!1394234 (= res!932959 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32553))))

(declare-fun b!1394236 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95388 (_ BitVec 32)) SeekEntryResult!10270)

(assert (=> b!1394236 (= e!789581 (= (seekEntryOrOpen!0 (select (arr!46050 a!2901) j!112) a!2901 mask!2840) (Found!10270 j!112)))))

(declare-fun b!1394237 () Bool)

(assert (=> b!1394237 (= e!789582 true)))

(declare-fun lt!612260 () SeekEntryResult!10270)

(assert (=> b!1394237 (= lt!612260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95389 (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46601 a!2901)) mask!2840))))

(declare-fun b!1394238 () Bool)

(declare-fun res!932962 () Bool)

(assert (=> b!1394238 (=> (not res!932962) (not e!789584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394238 (= res!932962 (validKeyInArray!0 (select (arr!46050 a!2901) i!1037)))))

(declare-fun b!1394235 () Bool)

(declare-fun res!932961 () Bool)

(assert (=> b!1394235 (=> (not res!932961) (not e!789584))))

(assert (=> b!1394235 (= res!932961 (validKeyInArray!0 (select (arr!46050 a!2901) j!112)))))

(declare-fun res!932960 () Bool)

(assert (=> start!119784 (=> (not res!932960) (not e!789584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119784 (= res!932960 (validMask!0 mask!2840))))

(assert (=> start!119784 e!789584))

(assert (=> start!119784 true))

(declare-fun array_inv!35331 (array!95388) Bool)

(assert (=> start!119784 (array_inv!35331 a!2901)))

(assert (= (and start!119784 res!932960) b!1394231))

(assert (= (and b!1394231 res!932957) b!1394238))

(assert (= (and b!1394238 res!932962) b!1394235))

(assert (= (and b!1394235 res!932961) b!1394232))

(assert (= (and b!1394232 res!932955) b!1394234))

(assert (= (and b!1394234 res!932959) b!1394233))

(assert (= (and b!1394233 res!932956) b!1394236))

(assert (= (and b!1394233 (not res!932958)) b!1394237))

(declare-fun m!1280229 () Bool)

(assert (=> b!1394234 m!1280229))

(declare-fun m!1280231 () Bool)

(assert (=> b!1394235 m!1280231))

(assert (=> b!1394235 m!1280231))

(declare-fun m!1280233 () Bool)

(assert (=> b!1394235 m!1280233))

(declare-fun m!1280235 () Bool)

(assert (=> start!119784 m!1280235))

(declare-fun m!1280237 () Bool)

(assert (=> start!119784 m!1280237))

(declare-fun m!1280239 () Bool)

(assert (=> b!1394237 m!1280239))

(declare-fun m!1280241 () Bool)

(assert (=> b!1394237 m!1280241))

(assert (=> b!1394237 m!1280241))

(declare-fun m!1280243 () Bool)

(assert (=> b!1394237 m!1280243))

(assert (=> b!1394237 m!1280243))

(assert (=> b!1394237 m!1280241))

(declare-fun m!1280245 () Bool)

(assert (=> b!1394237 m!1280245))

(declare-fun m!1280247 () Bool)

(assert (=> b!1394232 m!1280247))

(assert (=> b!1394236 m!1280231))

(assert (=> b!1394236 m!1280231))

(declare-fun m!1280249 () Bool)

(assert (=> b!1394236 m!1280249))

(assert (=> b!1394233 m!1280231))

(declare-fun m!1280251 () Bool)

(assert (=> b!1394233 m!1280251))

(assert (=> b!1394233 m!1280231))

(declare-fun m!1280253 () Bool)

(assert (=> b!1394233 m!1280253))

(assert (=> b!1394233 m!1280251))

(assert (=> b!1394233 m!1280231))

(declare-fun m!1280255 () Bool)

(assert (=> b!1394233 m!1280255))

(declare-fun m!1280257 () Bool)

(assert (=> b!1394233 m!1280257))

(declare-fun m!1280259 () Bool)

(assert (=> b!1394238 m!1280259))

(assert (=> b!1394238 m!1280259))

(declare-fun m!1280261 () Bool)

(assert (=> b!1394238 m!1280261))

(push 1)

(assert (not start!119784))

(assert (not b!1394235))

(assert (not b!1394237))

(assert (not b!1394236))

(assert (not b!1394234))

(assert (not b!1394233))

(assert (not b!1394232))

(assert (not b!1394238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

