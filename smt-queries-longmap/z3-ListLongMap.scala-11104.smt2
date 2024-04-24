; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130016 () Bool)

(assert start!130016)

(declare-fun b!1524257 () Bool)

(declare-fun res!1042059 () Bool)

(declare-fun e!850094 () Bool)

(assert (=> b!1524257 (=> (not res!1042059) (not e!850094))))

(declare-datatypes ((array!101440 0))(
  ( (array!101441 (arr!48946 (Array (_ BitVec 32) (_ BitVec 64))) (size!49497 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101440)

(declare-datatypes ((List!35416 0))(
  ( (Nil!35413) (Cons!35412 (h!36851 (_ BitVec 64)) (t!50102 List!35416)) )
))
(declare-fun arrayNoDuplicates!0 (array!101440 (_ BitVec 32) List!35416) Bool)

(assert (=> b!1524257 (= res!1042059 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35413))))

(declare-fun b!1524258 () Bool)

(declare-fun res!1042058 () Bool)

(declare-fun e!850093 () Bool)

(assert (=> b!1524258 (=> (not res!1042058) (not e!850093))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13004 0))(
  ( (MissingZero!13004 (index!54411 (_ BitVec 32))) (Found!13004 (index!54412 (_ BitVec 32))) (Intermediate!13004 (undefined!13816 Bool) (index!54413 (_ BitVec 32)) (x!136309 (_ BitVec 32))) (Undefined!13004) (MissingVacant!13004 (index!54414 (_ BitVec 32))) )
))
(declare-fun lt!660322 () SeekEntryResult!13004)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101440 (_ BitVec 32)) SeekEntryResult!13004)

(assert (=> b!1524258 (= res!1042058 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48946 a!2804) j!70) a!2804 mask!2512) lt!660322))))

(declare-fun b!1524260 () Bool)

(declare-fun res!1042057 () Bool)

(assert (=> b!1524260 (=> (not res!1042057) (not e!850094))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524260 (= res!1042057 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49497 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49497 a!2804))))))

(declare-fun b!1524261 () Bool)

(declare-fun res!1042060 () Bool)

(assert (=> b!1524261 (=> (not res!1042060) (not e!850094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524261 (= res!1042060 (validKeyInArray!0 (select (arr!48946 a!2804) j!70)))))

(declare-fun b!1524262 () Bool)

(declare-fun res!1042053 () Bool)

(assert (=> b!1524262 (=> (not res!1042053) (not e!850094))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524262 (= res!1042053 (and (= (size!49497 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49497 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49497 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524263 () Bool)

(declare-fun res!1042055 () Bool)

(assert (=> b!1524263 (=> (not res!1042055) (not e!850094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101440 (_ BitVec 32)) Bool)

(assert (=> b!1524263 (= res!1042055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524259 () Bool)

(declare-fun res!1042061 () Bool)

(assert (=> b!1524259 (=> (not res!1042061) (not e!850094))))

(assert (=> b!1524259 (= res!1042061 (validKeyInArray!0 (select (arr!48946 a!2804) i!961)))))

(declare-fun res!1042056 () Bool)

(assert (=> start!130016 (=> (not res!1042056) (not e!850094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130016 (= res!1042056 (validMask!0 mask!2512))))

(assert (=> start!130016 e!850094))

(assert (=> start!130016 true))

(declare-fun array_inv!38227 (array!101440) Bool)

(assert (=> start!130016 (array_inv!38227 a!2804)))

(declare-fun b!1524264 () Bool)

(assert (=> b!1524264 (= e!850093 false)))

(declare-fun lt!660321 () SeekEntryResult!13004)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524264 (= lt!660321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101441 (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49497 a!2804)) mask!2512))))

(declare-fun b!1524265 () Bool)

(assert (=> b!1524265 (= e!850094 e!850093)))

(declare-fun res!1042054 () Bool)

(assert (=> b!1524265 (=> (not res!1042054) (not e!850093))))

(assert (=> b!1524265 (= res!1042054 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48946 a!2804) j!70) mask!2512) (select (arr!48946 a!2804) j!70) a!2804 mask!2512) lt!660322))))

(assert (=> b!1524265 (= lt!660322 (Intermediate!13004 false resIndex!21 resX!21))))

(assert (= (and start!130016 res!1042056) b!1524262))

(assert (= (and b!1524262 res!1042053) b!1524259))

(assert (= (and b!1524259 res!1042061) b!1524261))

(assert (= (and b!1524261 res!1042060) b!1524263))

(assert (= (and b!1524263 res!1042055) b!1524257))

(assert (= (and b!1524257 res!1042059) b!1524260))

(assert (= (and b!1524260 res!1042057) b!1524265))

(assert (= (and b!1524265 res!1042054) b!1524258))

(assert (= (and b!1524258 res!1042058) b!1524264))

(declare-fun m!1407237 () Bool)

(assert (=> b!1524265 m!1407237))

(assert (=> b!1524265 m!1407237))

(declare-fun m!1407239 () Bool)

(assert (=> b!1524265 m!1407239))

(assert (=> b!1524265 m!1407239))

(assert (=> b!1524265 m!1407237))

(declare-fun m!1407241 () Bool)

(assert (=> b!1524265 m!1407241))

(declare-fun m!1407243 () Bool)

(assert (=> b!1524257 m!1407243))

(declare-fun m!1407245 () Bool)

(assert (=> start!130016 m!1407245))

(declare-fun m!1407247 () Bool)

(assert (=> start!130016 m!1407247))

(declare-fun m!1407249 () Bool)

(assert (=> b!1524259 m!1407249))

(assert (=> b!1524259 m!1407249))

(declare-fun m!1407251 () Bool)

(assert (=> b!1524259 m!1407251))

(declare-fun m!1407253 () Bool)

(assert (=> b!1524263 m!1407253))

(assert (=> b!1524261 m!1407237))

(assert (=> b!1524261 m!1407237))

(declare-fun m!1407255 () Bool)

(assert (=> b!1524261 m!1407255))

(declare-fun m!1407257 () Bool)

(assert (=> b!1524264 m!1407257))

(declare-fun m!1407259 () Bool)

(assert (=> b!1524264 m!1407259))

(assert (=> b!1524264 m!1407259))

(declare-fun m!1407261 () Bool)

(assert (=> b!1524264 m!1407261))

(assert (=> b!1524264 m!1407261))

(assert (=> b!1524264 m!1407259))

(declare-fun m!1407263 () Bool)

(assert (=> b!1524264 m!1407263))

(assert (=> b!1524258 m!1407237))

(assert (=> b!1524258 m!1407237))

(declare-fun m!1407265 () Bool)

(assert (=> b!1524258 m!1407265))

(check-sat (not b!1524264) (not b!1524263) (not b!1524257) (not b!1524261) (not b!1524265) (not b!1524259) (not start!130016) (not b!1524258))
(check-sat)
