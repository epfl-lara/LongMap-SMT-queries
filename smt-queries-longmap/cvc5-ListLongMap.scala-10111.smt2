; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119352 () Bool)

(assert start!119352)

(declare-fun b!1391238 () Bool)

(declare-fun res!930719 () Bool)

(declare-fun e!788011 () Bool)

(assert (=> b!1391238 (=> (not res!930719) (not e!788011))))

(declare-datatypes ((array!95211 0))(
  ( (array!95212 (arr!45969 (Array (_ BitVec 32) (_ BitVec 64))) (size!46520 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95211)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95211 (_ BitVec 32)) Bool)

(assert (=> b!1391238 (= res!930719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391239 () Bool)

(declare-fun res!930716 () Bool)

(assert (=> b!1391239 (=> (not res!930716) (not e!788011))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391239 (= res!930716 (validKeyInArray!0 (select (arr!45969 a!2901) j!112)))))

(declare-fun b!1391240 () Bool)

(assert (=> b!1391240 (= e!788011 (not true))))

(declare-fun e!788010 () Bool)

(assert (=> b!1391240 e!788010))

(declare-fun res!930717 () Bool)

(assert (=> b!1391240 (=> (not res!930717) (not e!788010))))

(assert (=> b!1391240 (= res!930717 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46409 0))(
  ( (Unit!46410) )
))
(declare-fun lt!611126 () Unit!46409)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46409)

(assert (=> b!1391240 (= lt!611126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10189 0))(
  ( (MissingZero!10189 (index!43127 (_ BitVec 32))) (Found!10189 (index!43128 (_ BitVec 32))) (Intermediate!10189 (undefined!11001 Bool) (index!43129 (_ BitVec 32)) (x!124958 (_ BitVec 32))) (Undefined!10189) (MissingVacant!10189 (index!43130 (_ BitVec 32))) )
))
(declare-fun lt!611125 () SeekEntryResult!10189)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95211 (_ BitVec 32)) SeekEntryResult!10189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391240 (= lt!611125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45969 a!2901) j!112) mask!2840) (select (arr!45969 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391241 () Bool)

(declare-fun res!930718 () Bool)

(assert (=> b!1391241 (=> (not res!930718) (not e!788011))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391241 (= res!930718 (validKeyInArray!0 (select (arr!45969 a!2901) i!1037)))))

(declare-fun b!1391242 () Bool)

(declare-fun res!930721 () Bool)

(assert (=> b!1391242 (=> (not res!930721) (not e!788011))))

(assert (=> b!1391242 (= res!930721 (and (= (size!46520 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46520 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46520 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930720 () Bool)

(assert (=> start!119352 (=> (not res!930720) (not e!788011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119352 (= res!930720 (validMask!0 mask!2840))))

(assert (=> start!119352 e!788011))

(assert (=> start!119352 true))

(declare-fun array_inv!35250 (array!95211) Bool)

(assert (=> start!119352 (array_inv!35250 a!2901)))

(declare-fun b!1391243 () Bool)

(declare-fun res!930715 () Bool)

(assert (=> b!1391243 (=> (not res!930715) (not e!788011))))

(declare-datatypes ((List!32475 0))(
  ( (Nil!32472) (Cons!32471 (h!33697 (_ BitVec 64)) (t!47161 List!32475)) )
))
(declare-fun arrayNoDuplicates!0 (array!95211 (_ BitVec 32) List!32475) Bool)

(assert (=> b!1391243 (= res!930715 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32472))))

(declare-fun b!1391244 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95211 (_ BitVec 32)) SeekEntryResult!10189)

(assert (=> b!1391244 (= e!788010 (= (seekEntryOrOpen!0 (select (arr!45969 a!2901) j!112) a!2901 mask!2840) (Found!10189 j!112)))))

(assert (= (and start!119352 res!930720) b!1391242))

(assert (= (and b!1391242 res!930721) b!1391241))

(assert (= (and b!1391241 res!930718) b!1391239))

(assert (= (and b!1391239 res!930716) b!1391238))

(assert (= (and b!1391238 res!930719) b!1391243))

(assert (= (and b!1391243 res!930715) b!1391240))

(assert (= (and b!1391240 res!930717) b!1391244))

(declare-fun m!1277237 () Bool)

(assert (=> b!1391244 m!1277237))

(assert (=> b!1391244 m!1277237))

(declare-fun m!1277239 () Bool)

(assert (=> b!1391244 m!1277239))

(declare-fun m!1277241 () Bool)

(assert (=> b!1391238 m!1277241))

(declare-fun m!1277243 () Bool)

(assert (=> b!1391243 m!1277243))

(declare-fun m!1277245 () Bool)

(assert (=> start!119352 m!1277245))

(declare-fun m!1277247 () Bool)

(assert (=> start!119352 m!1277247))

(assert (=> b!1391240 m!1277237))

(declare-fun m!1277249 () Bool)

(assert (=> b!1391240 m!1277249))

(assert (=> b!1391240 m!1277237))

(declare-fun m!1277251 () Bool)

(assert (=> b!1391240 m!1277251))

(assert (=> b!1391240 m!1277249))

(assert (=> b!1391240 m!1277237))

(declare-fun m!1277253 () Bool)

(assert (=> b!1391240 m!1277253))

(declare-fun m!1277255 () Bool)

(assert (=> b!1391240 m!1277255))

(assert (=> b!1391239 m!1277237))

(assert (=> b!1391239 m!1277237))

(declare-fun m!1277257 () Bool)

(assert (=> b!1391239 m!1277257))

(declare-fun m!1277259 () Bool)

(assert (=> b!1391241 m!1277259))

(assert (=> b!1391241 m!1277259))

(declare-fun m!1277261 () Bool)

(assert (=> b!1391241 m!1277261))

(push 1)

(assert (not b!1391244))

(assert (not b!1391238))

(assert (not b!1391240))

(assert (not start!119352))

(assert (not b!1391239))

(assert (not b!1391243))

(assert (not b!1391241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

