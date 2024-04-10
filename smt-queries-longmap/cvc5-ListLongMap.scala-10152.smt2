; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119676 () Bool)

(assert start!119676)

(declare-fun b!1394051 () Bool)

(declare-fun res!933466 () Bool)

(declare-fun e!789326 () Bool)

(assert (=> b!1394051 (=> (not res!933466) (not e!789326))))

(declare-datatypes ((array!95358 0))(
  ( (array!95359 (arr!46037 (Array (_ BitVec 32) (_ BitVec 64))) (size!46587 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95358)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394051 (= res!933466 (validKeyInArray!0 (select (arr!46037 a!2901) j!112)))))

(declare-fun b!1394052 () Bool)

(declare-fun res!933462 () Bool)

(assert (=> b!1394052 (=> (not res!933462) (not e!789326))))

(declare-datatypes ((List!32556 0))(
  ( (Nil!32553) (Cons!32552 (h!33785 (_ BitVec 64)) (t!47250 List!32556)) )
))
(declare-fun arrayNoDuplicates!0 (array!95358 (_ BitVec 32) List!32556) Bool)

(assert (=> b!1394052 (= res!933462 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32553))))

(declare-fun b!1394053 () Bool)

(declare-fun res!933465 () Bool)

(assert (=> b!1394053 (=> (not res!933465) (not e!789326))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394053 (= res!933465 (and (= (size!46587 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46587 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46587 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394054 () Bool)

(declare-fun res!933464 () Bool)

(assert (=> b!1394054 (=> (not res!933464) (not e!789326))))

(assert (=> b!1394054 (= res!933464 (validKeyInArray!0 (select (arr!46037 a!2901) i!1037)))))

(declare-fun b!1394055 () Bool)

(declare-fun e!789325 () Bool)

(declare-datatypes ((SeekEntryResult!10354 0))(
  ( (MissingZero!10354 (index!43787 (_ BitVec 32))) (Found!10354 (index!43788 (_ BitVec 32))) (Intermediate!10354 (undefined!11166 Bool) (index!43789 (_ BitVec 32)) (x!125462 (_ BitVec 32))) (Undefined!10354) (MissingVacant!10354 (index!43790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95358 (_ BitVec 32)) SeekEntryResult!10354)

(assert (=> b!1394055 (= e!789325 (= (seekEntryOrOpen!0 (select (arr!46037 a!2901) j!112) a!2901 mask!2840) (Found!10354 j!112)))))

(declare-fun res!933459 () Bool)

(assert (=> start!119676 (=> (not res!933459) (not e!789326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119676 (= res!933459 (validMask!0 mask!2840))))

(assert (=> start!119676 e!789326))

(assert (=> start!119676 true))

(declare-fun array_inv!35065 (array!95358) Bool)

(assert (=> start!119676 (array_inv!35065 a!2901)))

(declare-fun b!1394056 () Bool)

(declare-fun e!789324 () Bool)

(assert (=> b!1394056 (= e!789324 true)))

(declare-fun lt!612221 () SeekEntryResult!10354)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95358 (_ BitVec 32)) SeekEntryResult!10354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394056 (= lt!612221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46037 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46037 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95359 (store (arr!46037 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46587 a!2901)) mask!2840))))

(declare-fun b!1394057 () Bool)

(assert (=> b!1394057 (= e!789326 (not e!789324))))

(declare-fun res!933461 () Bool)

(assert (=> b!1394057 (=> res!933461 e!789324)))

(declare-fun lt!612220 () SeekEntryResult!10354)

(assert (=> b!1394057 (= res!933461 (or (not (is-Intermediate!10354 lt!612220)) (undefined!11166 lt!612220)))))

(assert (=> b!1394057 e!789325))

(declare-fun res!933460 () Bool)

(assert (=> b!1394057 (=> (not res!933460) (not e!789325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95358 (_ BitVec 32)) Bool)

(assert (=> b!1394057 (= res!933460 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46712 0))(
  ( (Unit!46713) )
))
(declare-fun lt!612222 () Unit!46712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46712)

(assert (=> b!1394057 (= lt!612222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394057 (= lt!612220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46037 a!2901) j!112) mask!2840) (select (arr!46037 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394058 () Bool)

(declare-fun res!933463 () Bool)

(assert (=> b!1394058 (=> (not res!933463) (not e!789326))))

(assert (=> b!1394058 (= res!933463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119676 res!933459) b!1394053))

(assert (= (and b!1394053 res!933465) b!1394054))

(assert (= (and b!1394054 res!933464) b!1394051))

(assert (= (and b!1394051 res!933466) b!1394058))

(assert (= (and b!1394058 res!933463) b!1394052))

(assert (= (and b!1394052 res!933462) b!1394057))

(assert (= (and b!1394057 res!933460) b!1394055))

(assert (= (and b!1394057 (not res!933461)) b!1394056))

(declare-fun m!1280217 () Bool)

(assert (=> b!1394056 m!1280217))

(declare-fun m!1280219 () Bool)

(assert (=> b!1394056 m!1280219))

(assert (=> b!1394056 m!1280219))

(declare-fun m!1280221 () Bool)

(assert (=> b!1394056 m!1280221))

(assert (=> b!1394056 m!1280221))

(assert (=> b!1394056 m!1280219))

(declare-fun m!1280223 () Bool)

(assert (=> b!1394056 m!1280223))

(declare-fun m!1280225 () Bool)

(assert (=> b!1394055 m!1280225))

(assert (=> b!1394055 m!1280225))

(declare-fun m!1280227 () Bool)

(assert (=> b!1394055 m!1280227))

(assert (=> b!1394057 m!1280225))

(declare-fun m!1280229 () Bool)

(assert (=> b!1394057 m!1280229))

(assert (=> b!1394057 m!1280225))

(declare-fun m!1280231 () Bool)

(assert (=> b!1394057 m!1280231))

(assert (=> b!1394057 m!1280229))

(assert (=> b!1394057 m!1280225))

(declare-fun m!1280233 () Bool)

(assert (=> b!1394057 m!1280233))

(declare-fun m!1280235 () Bool)

(assert (=> b!1394057 m!1280235))

(assert (=> b!1394051 m!1280225))

(assert (=> b!1394051 m!1280225))

(declare-fun m!1280237 () Bool)

(assert (=> b!1394051 m!1280237))

(declare-fun m!1280239 () Bool)

(assert (=> b!1394058 m!1280239))

(declare-fun m!1280241 () Bool)

(assert (=> b!1394052 m!1280241))

(declare-fun m!1280243 () Bool)

(assert (=> start!119676 m!1280243))

(declare-fun m!1280245 () Bool)

(assert (=> start!119676 m!1280245))

(declare-fun m!1280247 () Bool)

(assert (=> b!1394054 m!1280247))

(assert (=> b!1394054 m!1280247))

(declare-fun m!1280249 () Bool)

(assert (=> b!1394054 m!1280249))

(push 1)

(assert (not b!1394052))

(assert (not b!1394051))

(assert (not start!119676))

(assert (not b!1394054))

(assert (not b!1394056))

(assert (not b!1394055))

(assert (not b!1394057))

(assert (not b!1394058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

