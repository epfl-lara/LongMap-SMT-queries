; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119790 () Bool)

(assert start!119790)

(declare-fun res!933034 () Bool)

(declare-fun e!789618 () Bool)

(assert (=> start!119790 (=> (not res!933034) (not e!789618))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119790 (= res!933034 (validMask!0 mask!2840))))

(assert (=> start!119790 e!789618))

(assert (=> start!119790 true))

(declare-datatypes ((array!95394 0))(
  ( (array!95395 (arr!46053 (Array (_ BitVec 32) (_ BitVec 64))) (size!46604 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95394)

(declare-fun array_inv!35334 (array!95394) Bool)

(assert (=> start!119790 (array_inv!35334 a!2901)))

(declare-fun e!789619 () Bool)

(declare-fun b!1394303 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10273 0))(
  ( (MissingZero!10273 (index!43463 (_ BitVec 32))) (Found!10273 (index!43464 (_ BitVec 32))) (Intermediate!10273 (undefined!11085 Bool) (index!43465 (_ BitVec 32)) (x!125296 (_ BitVec 32))) (Undefined!10273) (MissingVacant!10273 (index!43466 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95394 (_ BitVec 32)) SeekEntryResult!10273)

(assert (=> b!1394303 (= e!789619 (= (seekEntryOrOpen!0 (select (arr!46053 a!2901) j!112) a!2901 mask!2840) (Found!10273 j!112)))))

(declare-fun b!1394304 () Bool)

(declare-fun res!933031 () Bool)

(assert (=> b!1394304 (=> (not res!933031) (not e!789618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394304 (= res!933031 (validKeyInArray!0 (select (arr!46053 a!2901) j!112)))))

(declare-fun b!1394305 () Bool)

(declare-fun e!789617 () Bool)

(assert (=> b!1394305 (= e!789617 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612285 () SeekEntryResult!10273)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95394 (_ BitVec 32)) SeekEntryResult!10273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394305 (= lt!612285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46053 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46053 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95395 (store (arr!46053 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46604 a!2901)) mask!2840))))

(declare-fun b!1394306 () Bool)

(declare-fun res!933033 () Bool)

(assert (=> b!1394306 (=> (not res!933033) (not e!789618))))

(declare-datatypes ((List!32559 0))(
  ( (Nil!32556) (Cons!32555 (h!33796 (_ BitVec 64)) (t!47245 List!32559)) )
))
(declare-fun arrayNoDuplicates!0 (array!95394 (_ BitVec 32) List!32559) Bool)

(assert (=> b!1394306 (= res!933033 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32556))))

(declare-fun b!1394307 () Bool)

(assert (=> b!1394307 (= e!789618 (not e!789617))))

(declare-fun res!933030 () Bool)

(assert (=> b!1394307 (=> res!933030 e!789617)))

(declare-fun lt!612286 () SeekEntryResult!10273)

(assert (=> b!1394307 (= res!933030 (or (not (is-Intermediate!10273 lt!612286)) (undefined!11085 lt!612286)))))

(assert (=> b!1394307 e!789619))

(declare-fun res!933027 () Bool)

(assert (=> b!1394307 (=> (not res!933027) (not e!789619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95394 (_ BitVec 32)) Bool)

(assert (=> b!1394307 (= res!933027 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46577 0))(
  ( (Unit!46578) )
))
(declare-fun lt!612287 () Unit!46577)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46577)

(assert (=> b!1394307 (= lt!612287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394307 (= lt!612286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46053 a!2901) j!112) mask!2840) (select (arr!46053 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394308 () Bool)

(declare-fun res!933028 () Bool)

(assert (=> b!1394308 (=> (not res!933028) (not e!789618))))

(assert (=> b!1394308 (= res!933028 (validKeyInArray!0 (select (arr!46053 a!2901) i!1037)))))

(declare-fun b!1394309 () Bool)

(declare-fun res!933029 () Bool)

(assert (=> b!1394309 (=> (not res!933029) (not e!789618))))

(assert (=> b!1394309 (= res!933029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394310 () Bool)

(declare-fun res!933032 () Bool)

(assert (=> b!1394310 (=> (not res!933032) (not e!789618))))

(assert (=> b!1394310 (= res!933032 (and (= (size!46604 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46604 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46604 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119790 res!933034) b!1394310))

(assert (= (and b!1394310 res!933032) b!1394308))

(assert (= (and b!1394308 res!933028) b!1394304))

(assert (= (and b!1394304 res!933031) b!1394309))

(assert (= (and b!1394309 res!933029) b!1394306))

(assert (= (and b!1394306 res!933033) b!1394307))

(assert (= (and b!1394307 res!933027) b!1394303))

(assert (= (and b!1394307 (not res!933030)) b!1394305))

(declare-fun m!1280331 () Bool)

(assert (=> b!1394303 m!1280331))

(assert (=> b!1394303 m!1280331))

(declare-fun m!1280333 () Bool)

(assert (=> b!1394303 m!1280333))

(declare-fun m!1280335 () Bool)

(assert (=> b!1394305 m!1280335))

(declare-fun m!1280337 () Bool)

(assert (=> b!1394305 m!1280337))

(assert (=> b!1394305 m!1280337))

(declare-fun m!1280339 () Bool)

(assert (=> b!1394305 m!1280339))

(assert (=> b!1394305 m!1280339))

(assert (=> b!1394305 m!1280337))

(declare-fun m!1280341 () Bool)

(assert (=> b!1394305 m!1280341))

(declare-fun m!1280343 () Bool)

(assert (=> b!1394309 m!1280343))

(declare-fun m!1280345 () Bool)

(assert (=> b!1394308 m!1280345))

(assert (=> b!1394308 m!1280345))

(declare-fun m!1280347 () Bool)

(assert (=> b!1394308 m!1280347))

(declare-fun m!1280349 () Bool)

(assert (=> start!119790 m!1280349))

(declare-fun m!1280351 () Bool)

(assert (=> start!119790 m!1280351))

(assert (=> b!1394304 m!1280331))

(assert (=> b!1394304 m!1280331))

(declare-fun m!1280353 () Bool)

(assert (=> b!1394304 m!1280353))

(declare-fun m!1280355 () Bool)

(assert (=> b!1394306 m!1280355))

(assert (=> b!1394307 m!1280331))

(declare-fun m!1280357 () Bool)

(assert (=> b!1394307 m!1280357))

(assert (=> b!1394307 m!1280331))

(declare-fun m!1280359 () Bool)

(assert (=> b!1394307 m!1280359))

(assert (=> b!1394307 m!1280357))

(assert (=> b!1394307 m!1280331))

(declare-fun m!1280361 () Bool)

(assert (=> b!1394307 m!1280361))

(declare-fun m!1280363 () Bool)

(assert (=> b!1394307 m!1280363))

(push 1)

(assert (not b!1394309))

(assert (not b!1394307))

(assert (not b!1394305))

(assert (not b!1394304))

(assert (not start!119790))

(assert (not b!1394303))

(assert (not b!1394308))

(assert (not b!1394306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

