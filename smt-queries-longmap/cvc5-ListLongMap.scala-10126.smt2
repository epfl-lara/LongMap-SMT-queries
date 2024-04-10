; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119358 () Bool)

(assert start!119358)

(declare-fun b!1391457 () Bool)

(declare-fun res!931325 () Bool)

(declare-fun e!787949 () Bool)

(assert (=> b!1391457 (=> (not res!931325) (not e!787949))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95193 0))(
  ( (array!95194 (arr!45959 (Array (_ BitVec 32) (_ BitVec 64))) (size!46509 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95193)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391457 (= res!931325 (and (= (size!46509 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46509 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46509 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391458 () Bool)

(declare-fun res!931328 () Bool)

(assert (=> b!1391458 (=> (not res!931328) (not e!787949))))

(declare-datatypes ((List!32478 0))(
  ( (Nil!32475) (Cons!32474 (h!33698 (_ BitVec 64)) (t!47172 List!32478)) )
))
(declare-fun arrayNoDuplicates!0 (array!95193 (_ BitVec 32) List!32478) Bool)

(assert (=> b!1391458 (= res!931328 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32475))))

(declare-fun e!787947 () Bool)

(declare-fun b!1391459 () Bool)

(declare-datatypes ((SeekEntryResult!10276 0))(
  ( (MissingZero!10276 (index!43475 (_ BitVec 32))) (Found!10276 (index!43476 (_ BitVec 32))) (Intermediate!10276 (undefined!11088 Bool) (index!43477 (_ BitVec 32)) (x!125158 (_ BitVec 32))) (Undefined!10276) (MissingVacant!10276 (index!43478 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95193 (_ BitVec 32)) SeekEntryResult!10276)

(assert (=> b!1391459 (= e!787947 (= (seekEntryOrOpen!0 (select (arr!45959 a!2901) j!112) a!2901 mask!2840) (Found!10276 j!112)))))

(declare-fun b!1391460 () Bool)

(declare-fun res!931330 () Bool)

(assert (=> b!1391460 (=> (not res!931330) (not e!787949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391460 (= res!931330 (validKeyInArray!0 (select (arr!45959 a!2901) i!1037)))))

(declare-fun b!1391461 () Bool)

(declare-fun res!931329 () Bool)

(assert (=> b!1391461 (=> (not res!931329) (not e!787949))))

(assert (=> b!1391461 (= res!931329 (validKeyInArray!0 (select (arr!45959 a!2901) j!112)))))

(declare-fun b!1391463 () Bool)

(declare-fun res!931324 () Bool)

(assert (=> b!1391463 (=> (not res!931324) (not e!787949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95193 (_ BitVec 32)) Bool)

(assert (=> b!1391463 (= res!931324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391462 () Bool)

(declare-fun lt!611211 () SeekEntryResult!10276)

(assert (=> b!1391462 (= e!787949 (not (or (not (is-Intermediate!10276 lt!611211)) (undefined!11088 lt!611211) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1391462 e!787947))

(declare-fun res!931327 () Bool)

(assert (=> b!1391462 (=> (not res!931327) (not e!787947))))

(assert (=> b!1391462 (= res!931327 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46556 0))(
  ( (Unit!46557) )
))
(declare-fun lt!611210 () Unit!46556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46556)

(assert (=> b!1391462 (= lt!611210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95193 (_ BitVec 32)) SeekEntryResult!10276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391462 (= lt!611211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45959 a!2901) j!112) mask!2840) (select (arr!45959 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!931326 () Bool)

(assert (=> start!119358 (=> (not res!931326) (not e!787949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119358 (= res!931326 (validMask!0 mask!2840))))

(assert (=> start!119358 e!787949))

(assert (=> start!119358 true))

(declare-fun array_inv!34987 (array!95193) Bool)

(assert (=> start!119358 (array_inv!34987 a!2901)))

(assert (= (and start!119358 res!931326) b!1391457))

(assert (= (and b!1391457 res!931325) b!1391460))

(assert (= (and b!1391460 res!931330) b!1391461))

(assert (= (and b!1391461 res!931329) b!1391463))

(assert (= (and b!1391463 res!931324) b!1391458))

(assert (= (and b!1391458 res!931328) b!1391462))

(assert (= (and b!1391462 res!931327) b!1391459))

(declare-fun m!1277241 () Bool)

(assert (=> b!1391459 m!1277241))

(assert (=> b!1391459 m!1277241))

(declare-fun m!1277243 () Bool)

(assert (=> b!1391459 m!1277243))

(assert (=> b!1391462 m!1277241))

(declare-fun m!1277245 () Bool)

(assert (=> b!1391462 m!1277245))

(assert (=> b!1391462 m!1277241))

(declare-fun m!1277247 () Bool)

(assert (=> b!1391462 m!1277247))

(assert (=> b!1391462 m!1277245))

(assert (=> b!1391462 m!1277241))

(declare-fun m!1277249 () Bool)

(assert (=> b!1391462 m!1277249))

(declare-fun m!1277251 () Bool)

(assert (=> b!1391462 m!1277251))

(declare-fun m!1277253 () Bool)

(assert (=> b!1391458 m!1277253))

(declare-fun m!1277255 () Bool)

(assert (=> b!1391463 m!1277255))

(assert (=> b!1391461 m!1277241))

(assert (=> b!1391461 m!1277241))

(declare-fun m!1277257 () Bool)

(assert (=> b!1391461 m!1277257))

(declare-fun m!1277259 () Bool)

(assert (=> b!1391460 m!1277259))

(assert (=> b!1391460 m!1277259))

(declare-fun m!1277261 () Bool)

(assert (=> b!1391460 m!1277261))

(declare-fun m!1277263 () Bool)

(assert (=> start!119358 m!1277263))

(declare-fun m!1277265 () Bool)

(assert (=> start!119358 m!1277265))

(push 1)

