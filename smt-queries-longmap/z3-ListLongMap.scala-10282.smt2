; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120854 () Bool)

(assert start!120854)

(declare-fun res!944413 () Bool)

(declare-fun e!795920 () Bool)

(assert (=> start!120854 (=> (not res!944413) (not e!795920))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120854 (= res!944413 (validMask!0 mask!2840))))

(assert (=> start!120854 e!795920))

(assert (=> start!120854 true))

(declare-datatypes ((array!96161 0))(
  ( (array!96162 (arr!46428 (Array (_ BitVec 32) (_ BitVec 64))) (size!46978 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96161)

(declare-fun array_inv!35456 (array!96161) Bool)

(assert (=> start!120854 (array_inv!35456 a!2901)))

(declare-fun b!1406192 () Bool)

(declare-fun res!944409 () Bool)

(assert (=> b!1406192 (=> (not res!944409) (not e!795920))))

(declare-datatypes ((List!32947 0))(
  ( (Nil!32944) (Cons!32943 (h!34197 (_ BitVec 64)) (t!47641 List!32947)) )
))
(declare-fun arrayNoDuplicates!0 (array!96161 (_ BitVec 32) List!32947) Bool)

(assert (=> b!1406192 (= res!944409 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32944))))

(declare-fun b!1406193 () Bool)

(declare-fun e!795918 () Bool)

(assert (=> b!1406193 (= e!795918 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10739 0))(
  ( (MissingZero!10739 (index!45333 (_ BitVec 32))) (Found!10739 (index!45334 (_ BitVec 32))) (Intermediate!10739 (undefined!11551 Bool) (index!45335 (_ BitVec 32)) (x!126938 (_ BitVec 32))) (Undefined!10739) (MissingVacant!10739 (index!45336 (_ BitVec 32))) )
))
(declare-fun lt!619291 () SeekEntryResult!10739)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96161 (_ BitVec 32)) SeekEntryResult!10739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406193 (= lt!619291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46428 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46428 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96162 (store (arr!46428 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901)) mask!2840))))

(declare-fun b!1406194 () Bool)

(declare-fun res!944411 () Bool)

(assert (=> b!1406194 (=> (not res!944411) (not e!795920))))

(assert (=> b!1406194 (= res!944411 (and (= (size!46978 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46978 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46978 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406195 () Bool)

(declare-fun res!944416 () Bool)

(assert (=> b!1406195 (=> (not res!944416) (not e!795920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406195 (= res!944416 (validKeyInArray!0 (select (arr!46428 a!2901) i!1037)))))

(declare-fun b!1406196 () Bool)

(declare-fun res!944415 () Bool)

(assert (=> b!1406196 (=> (not res!944415) (not e!795920))))

(assert (=> b!1406196 (= res!944415 (validKeyInArray!0 (select (arr!46428 a!2901) j!112)))))

(declare-fun b!1406197 () Bool)

(declare-fun res!944414 () Bool)

(assert (=> b!1406197 (=> (not res!944414) (not e!795920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96161 (_ BitVec 32)) Bool)

(assert (=> b!1406197 (= res!944414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406198 () Bool)

(declare-fun e!795917 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96161 (_ BitVec 32)) SeekEntryResult!10739)

(assert (=> b!1406198 (= e!795917 (= (seekEntryOrOpen!0 (select (arr!46428 a!2901) j!112) a!2901 mask!2840) (Found!10739 j!112)))))

(declare-fun b!1406199 () Bool)

(assert (=> b!1406199 (= e!795920 (not e!795918))))

(declare-fun res!944410 () Bool)

(assert (=> b!1406199 (=> res!944410 e!795918)))

(declare-fun lt!619293 () SeekEntryResult!10739)

(get-info :version)

(assert (=> b!1406199 (= res!944410 (or (not ((_ is Intermediate!10739) lt!619293)) (undefined!11551 lt!619293)))))

(assert (=> b!1406199 e!795917))

(declare-fun res!944412 () Bool)

(assert (=> b!1406199 (=> (not res!944412) (not e!795917))))

(assert (=> b!1406199 (= res!944412 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47452 0))(
  ( (Unit!47453) )
))
(declare-fun lt!619292 () Unit!47452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47452)

(assert (=> b!1406199 (= lt!619292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406199 (= lt!619293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46428 a!2901) j!112) mask!2840) (select (arr!46428 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120854 res!944413) b!1406194))

(assert (= (and b!1406194 res!944411) b!1406195))

(assert (= (and b!1406195 res!944416) b!1406196))

(assert (= (and b!1406196 res!944415) b!1406197))

(assert (= (and b!1406197 res!944414) b!1406192))

(assert (= (and b!1406192 res!944409) b!1406199))

(assert (= (and b!1406199 res!944412) b!1406198))

(assert (= (and b!1406199 (not res!944410)) b!1406193))

(declare-fun m!1295233 () Bool)

(assert (=> b!1406195 m!1295233))

(assert (=> b!1406195 m!1295233))

(declare-fun m!1295235 () Bool)

(assert (=> b!1406195 m!1295235))

(declare-fun m!1295237 () Bool)

(assert (=> b!1406197 m!1295237))

(declare-fun m!1295239 () Bool)

(assert (=> start!120854 m!1295239))

(declare-fun m!1295241 () Bool)

(assert (=> start!120854 m!1295241))

(declare-fun m!1295243 () Bool)

(assert (=> b!1406192 m!1295243))

(declare-fun m!1295245 () Bool)

(assert (=> b!1406196 m!1295245))

(assert (=> b!1406196 m!1295245))

(declare-fun m!1295247 () Bool)

(assert (=> b!1406196 m!1295247))

(declare-fun m!1295249 () Bool)

(assert (=> b!1406193 m!1295249))

(declare-fun m!1295251 () Bool)

(assert (=> b!1406193 m!1295251))

(assert (=> b!1406193 m!1295251))

(declare-fun m!1295253 () Bool)

(assert (=> b!1406193 m!1295253))

(assert (=> b!1406193 m!1295253))

(assert (=> b!1406193 m!1295251))

(declare-fun m!1295255 () Bool)

(assert (=> b!1406193 m!1295255))

(assert (=> b!1406198 m!1295245))

(assert (=> b!1406198 m!1295245))

(declare-fun m!1295257 () Bool)

(assert (=> b!1406198 m!1295257))

(assert (=> b!1406199 m!1295245))

(declare-fun m!1295259 () Bool)

(assert (=> b!1406199 m!1295259))

(assert (=> b!1406199 m!1295245))

(declare-fun m!1295261 () Bool)

(assert (=> b!1406199 m!1295261))

(assert (=> b!1406199 m!1295259))

(assert (=> b!1406199 m!1295245))

(declare-fun m!1295263 () Bool)

(assert (=> b!1406199 m!1295263))

(declare-fun m!1295265 () Bool)

(assert (=> b!1406199 m!1295265))

(check-sat (not b!1406195) (not b!1406196) (not start!120854) (not b!1406197) (not b!1406192) (not b!1406198) (not b!1406199) (not b!1406193))
