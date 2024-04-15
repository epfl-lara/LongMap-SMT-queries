; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119436 () Bool)

(assert start!119436)

(declare-fun b!1391924 () Bool)

(declare-fun res!931700 () Bool)

(declare-fun e!788207 () Bool)

(assert (=> b!1391924 (=> (not res!931700) (not e!788207))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95173 0))(
  ( (array!95174 (arr!45948 (Array (_ BitVec 32) (_ BitVec 64))) (size!46500 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95173)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391924 (= res!931700 (and (= (size!46500 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46500 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46500 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391926 () Bool)

(declare-fun res!931697 () Bool)

(assert (=> b!1391926 (=> (not res!931697) (not e!788207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391926 (= res!931697 (validKeyInArray!0 (select (arr!45948 a!2901) i!1037)))))

(declare-fun b!1391927 () Bool)

(declare-fun e!788205 () Bool)

(declare-datatypes ((SeekEntryResult!10291 0))(
  ( (MissingZero!10291 (index!43535 (_ BitVec 32))) (Found!10291 (index!43536 (_ BitVec 32))) (Intermediate!10291 (undefined!11103 Bool) (index!43537 (_ BitVec 32)) (x!125208 (_ BitVec 32))) (Undefined!10291) (MissingVacant!10291 (index!43538 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95173 (_ BitVec 32)) SeekEntryResult!10291)

(assert (=> b!1391927 (= e!788205 (= (seekEntryOrOpen!0 (select (arr!45948 a!2901) j!112) a!2901 mask!2840) (Found!10291 j!112)))))

(declare-fun b!1391928 () Bool)

(declare-fun e!788206 () Bool)

(assert (=> b!1391928 (= e!788206 true)))

(declare-fun lt!611240 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391928 (= lt!611240 (toIndex!0 (select (store (arr!45948 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391929 () Bool)

(declare-fun res!931701 () Bool)

(assert (=> b!1391929 (=> (not res!931701) (not e!788207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95173 (_ BitVec 32)) Bool)

(assert (=> b!1391929 (= res!931701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391930 () Bool)

(assert (=> b!1391930 (= e!788207 (not e!788206))))

(declare-fun res!931702 () Bool)

(assert (=> b!1391930 (=> res!931702 e!788206)))

(declare-fun lt!611238 () SeekEntryResult!10291)

(assert (=> b!1391930 (= res!931702 (or (not (is-Intermediate!10291 lt!611238)) (undefined!11103 lt!611238)))))

(assert (=> b!1391930 e!788205))

(declare-fun res!931696 () Bool)

(assert (=> b!1391930 (=> (not res!931696) (not e!788205))))

(assert (=> b!1391930 (= res!931696 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46429 0))(
  ( (Unit!46430) )
))
(declare-fun lt!611239 () Unit!46429)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46429)

(assert (=> b!1391930 (= lt!611239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95173 (_ BitVec 32)) SeekEntryResult!10291)

(assert (=> b!1391930 (= lt!611238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45948 a!2901) j!112) mask!2840) (select (arr!45948 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391931 () Bool)

(declare-fun res!931699 () Bool)

(assert (=> b!1391931 (=> (not res!931699) (not e!788207))))

(assert (=> b!1391931 (= res!931699 (validKeyInArray!0 (select (arr!45948 a!2901) j!112)))))

(declare-fun res!931698 () Bool)

(assert (=> start!119436 (=> (not res!931698) (not e!788207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119436 (= res!931698 (validMask!0 mask!2840))))

(assert (=> start!119436 e!788207))

(assert (=> start!119436 true))

(declare-fun array_inv!35181 (array!95173) Bool)

(assert (=> start!119436 (array_inv!35181 a!2901)))

(declare-fun b!1391925 () Bool)

(declare-fun res!931695 () Bool)

(assert (=> b!1391925 (=> (not res!931695) (not e!788207))))

(declare-datatypes ((List!32545 0))(
  ( (Nil!32542) (Cons!32541 (h!33768 (_ BitVec 64)) (t!47231 List!32545)) )
))
(declare-fun arrayNoDuplicates!0 (array!95173 (_ BitVec 32) List!32545) Bool)

(assert (=> b!1391925 (= res!931695 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32542))))

(assert (= (and start!119436 res!931698) b!1391924))

(assert (= (and b!1391924 res!931700) b!1391926))

(assert (= (and b!1391926 res!931697) b!1391931))

(assert (= (and b!1391931 res!931699) b!1391929))

(assert (= (and b!1391929 res!931701) b!1391925))

(assert (= (and b!1391925 res!931695) b!1391930))

(assert (= (and b!1391930 res!931696) b!1391927))

(assert (= (and b!1391930 (not res!931702)) b!1391928))

(declare-fun m!1277243 () Bool)

(assert (=> start!119436 m!1277243))

(declare-fun m!1277245 () Bool)

(assert (=> start!119436 m!1277245))

(declare-fun m!1277247 () Bool)

(assert (=> b!1391929 m!1277247))

(declare-fun m!1277249 () Bool)

(assert (=> b!1391930 m!1277249))

(declare-fun m!1277251 () Bool)

(assert (=> b!1391930 m!1277251))

(assert (=> b!1391930 m!1277249))

(declare-fun m!1277253 () Bool)

(assert (=> b!1391930 m!1277253))

(assert (=> b!1391930 m!1277251))

(assert (=> b!1391930 m!1277249))

(declare-fun m!1277255 () Bool)

(assert (=> b!1391930 m!1277255))

(declare-fun m!1277257 () Bool)

(assert (=> b!1391930 m!1277257))

(declare-fun m!1277259 () Bool)

(assert (=> b!1391925 m!1277259))

(assert (=> b!1391931 m!1277249))

(assert (=> b!1391931 m!1277249))

(declare-fun m!1277261 () Bool)

(assert (=> b!1391931 m!1277261))

(declare-fun m!1277263 () Bool)

(assert (=> b!1391928 m!1277263))

(declare-fun m!1277265 () Bool)

(assert (=> b!1391928 m!1277265))

(assert (=> b!1391928 m!1277265))

(declare-fun m!1277267 () Bool)

(assert (=> b!1391928 m!1277267))

(declare-fun m!1277269 () Bool)

(assert (=> b!1391926 m!1277269))

(assert (=> b!1391926 m!1277269))

(declare-fun m!1277271 () Bool)

(assert (=> b!1391926 m!1277271))

(assert (=> b!1391927 m!1277249))

(assert (=> b!1391927 m!1277249))

(declare-fun m!1277273 () Bool)

(assert (=> b!1391927 m!1277273))

(push 1)

(assert (not b!1391931))

(assert (not b!1391926))

(assert (not b!1391930))

(assert (not b!1391928))

(assert (not start!119436))

(assert (not b!1391929))

(assert (not b!1391927))

(assert (not b!1391925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

