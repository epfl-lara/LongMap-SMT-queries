; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120702 () Bool)

(assert start!120702)

(declare-fun b!1404434 () Bool)

(declare-fun e!795309 () Bool)

(declare-fun e!795311 () Bool)

(assert (=> b!1404434 (= e!795309 (not e!795311))))

(declare-fun res!942262 () Bool)

(assert (=> b!1404434 (=> res!942262 e!795311)))

(declare-datatypes ((SeekEntryResult!10585 0))(
  ( (MissingZero!10585 (index!44717 (_ BitVec 32))) (Found!10585 (index!44718 (_ BitVec 32))) (Intermediate!10585 (undefined!11397 Bool) (index!44719 (_ BitVec 32)) (x!126479 (_ BitVec 32))) (Undefined!10585) (MissingVacant!10585 (index!44720 (_ BitVec 32))) )
))
(declare-fun lt!618745 () SeekEntryResult!10585)

(assert (=> b!1404434 (= res!942262 (or (not (is-Intermediate!10585 lt!618745)) (undefined!11397 lt!618745)))))

(declare-fun e!795310 () Bool)

(assert (=> b!1404434 e!795310))

(declare-fun res!942263 () Bool)

(assert (=> b!1404434 (=> (not res!942263) (not e!795310))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96033 0))(
  ( (array!96034 (arr!46365 (Array (_ BitVec 32) (_ BitVec 64))) (size!46916 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96033)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96033 (_ BitVec 32)) Bool)

(assert (=> b!1404434 (= res!942263 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47201 0))(
  ( (Unit!47202) )
))
(declare-fun lt!618746 () Unit!47201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47201)

(assert (=> b!1404434 (= lt!618746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96033 (_ BitVec 32)) SeekEntryResult!10585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404434 (= lt!618745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46365 a!2901) j!112) mask!2840) (select (arr!46365 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404435 () Bool)

(declare-fun res!942265 () Bool)

(assert (=> b!1404435 (=> (not res!942265) (not e!795309))))

(assert (=> b!1404435 (= res!942265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404436 () Bool)

(declare-fun res!942264 () Bool)

(assert (=> b!1404436 (=> (not res!942264) (not e!795309))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404436 (= res!942264 (and (= (size!46916 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46916 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46916 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404437 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96033 (_ BitVec 32)) SeekEntryResult!10585)

(assert (=> b!1404437 (= e!795310 (= (seekEntryOrOpen!0 (select (arr!46365 a!2901) j!112) a!2901 mask!2840) (Found!10585 j!112)))))

(declare-fun b!1404439 () Bool)

(declare-fun res!942268 () Bool)

(assert (=> b!1404439 (=> (not res!942268) (not e!795309))))

(declare-datatypes ((List!32871 0))(
  ( (Nil!32868) (Cons!32867 (h!34123 (_ BitVec 64)) (t!47557 List!32871)) )
))
(declare-fun arrayNoDuplicates!0 (array!96033 (_ BitVec 32) List!32871) Bool)

(assert (=> b!1404439 (= res!942268 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32868))))

(declare-fun b!1404440 () Bool)

(assert (=> b!1404440 (= e!795311 true)))

(declare-fun lt!618744 () SeekEntryResult!10585)

(assert (=> b!1404440 (= lt!618744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46365 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46365 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96034 (store (arr!46365 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46916 a!2901)) mask!2840))))

(declare-fun b!1404441 () Bool)

(declare-fun res!942267 () Bool)

(assert (=> b!1404441 (=> (not res!942267) (not e!795309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404441 (= res!942267 (validKeyInArray!0 (select (arr!46365 a!2901) j!112)))))

(declare-fun b!1404438 () Bool)

(declare-fun res!942261 () Bool)

(assert (=> b!1404438 (=> (not res!942261) (not e!795309))))

(assert (=> b!1404438 (= res!942261 (validKeyInArray!0 (select (arr!46365 a!2901) i!1037)))))

(declare-fun res!942266 () Bool)

(assert (=> start!120702 (=> (not res!942266) (not e!795309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120702 (= res!942266 (validMask!0 mask!2840))))

(assert (=> start!120702 e!795309))

(assert (=> start!120702 true))

(declare-fun array_inv!35646 (array!96033) Bool)

(assert (=> start!120702 (array_inv!35646 a!2901)))

(assert (= (and start!120702 res!942266) b!1404436))

(assert (= (and b!1404436 res!942264) b!1404438))

(assert (= (and b!1404438 res!942261) b!1404441))

(assert (= (and b!1404441 res!942267) b!1404435))

(assert (= (and b!1404435 res!942265) b!1404439))

(assert (= (and b!1404439 res!942268) b!1404434))

(assert (= (and b!1404434 res!942263) b!1404437))

(assert (= (and b!1404434 (not res!942262)) b!1404440))

(declare-fun m!1293243 () Bool)

(assert (=> b!1404435 m!1293243))

(declare-fun m!1293245 () Bool)

(assert (=> b!1404439 m!1293245))

(declare-fun m!1293247 () Bool)

(assert (=> start!120702 m!1293247))

(declare-fun m!1293249 () Bool)

(assert (=> start!120702 m!1293249))

(declare-fun m!1293251 () Bool)

(assert (=> b!1404438 m!1293251))

(assert (=> b!1404438 m!1293251))

(declare-fun m!1293253 () Bool)

(assert (=> b!1404438 m!1293253))

(declare-fun m!1293255 () Bool)

(assert (=> b!1404441 m!1293255))

(assert (=> b!1404441 m!1293255))

(declare-fun m!1293257 () Bool)

(assert (=> b!1404441 m!1293257))

(declare-fun m!1293259 () Bool)

(assert (=> b!1404440 m!1293259))

(declare-fun m!1293261 () Bool)

(assert (=> b!1404440 m!1293261))

(assert (=> b!1404440 m!1293261))

(declare-fun m!1293263 () Bool)

(assert (=> b!1404440 m!1293263))

(assert (=> b!1404440 m!1293263))

(assert (=> b!1404440 m!1293261))

(declare-fun m!1293265 () Bool)

(assert (=> b!1404440 m!1293265))

(assert (=> b!1404434 m!1293255))

(declare-fun m!1293267 () Bool)

(assert (=> b!1404434 m!1293267))

(assert (=> b!1404434 m!1293255))

(declare-fun m!1293269 () Bool)

(assert (=> b!1404434 m!1293269))

(assert (=> b!1404434 m!1293267))

(assert (=> b!1404434 m!1293255))

(declare-fun m!1293271 () Bool)

(assert (=> b!1404434 m!1293271))

(declare-fun m!1293273 () Bool)

(assert (=> b!1404434 m!1293273))

(assert (=> b!1404437 m!1293255))

(assert (=> b!1404437 m!1293255))

(declare-fun m!1293275 () Bool)

(assert (=> b!1404437 m!1293275))

(push 1)

(assert (not b!1404437))

(assert (not b!1404438))

(assert (not start!120702))

(assert (not b!1404434))

(assert (not b!1404440))

(assert (not b!1404435))

(assert (not b!1404441))

(assert (not b!1404439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

