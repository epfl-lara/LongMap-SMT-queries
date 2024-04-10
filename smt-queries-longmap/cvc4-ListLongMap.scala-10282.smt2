; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120856 () Bool)

(assert start!120856)

(declare-fun b!1406216 () Bool)

(declare-fun e!795931 () Bool)

(declare-fun e!795930 () Bool)

(assert (=> b!1406216 (= e!795931 (not e!795930))))

(declare-fun res!944439 () Bool)

(assert (=> b!1406216 (=> res!944439 e!795930)))

(declare-datatypes ((SeekEntryResult!10740 0))(
  ( (MissingZero!10740 (index!45337 (_ BitVec 32))) (Found!10740 (index!45338 (_ BitVec 32))) (Intermediate!10740 (undefined!11552 Bool) (index!45339 (_ BitVec 32)) (x!126939 (_ BitVec 32))) (Undefined!10740) (MissingVacant!10740 (index!45340 (_ BitVec 32))) )
))
(declare-fun lt!619300 () SeekEntryResult!10740)

(assert (=> b!1406216 (= res!944439 (or (not (is-Intermediate!10740 lt!619300)) (undefined!11552 lt!619300)))))

(declare-fun e!795929 () Bool)

(assert (=> b!1406216 e!795929))

(declare-fun res!944437 () Bool)

(assert (=> b!1406216 (=> (not res!944437) (not e!795929))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96163 0))(
  ( (array!96164 (arr!46429 (Array (_ BitVec 32) (_ BitVec 64))) (size!46979 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96163)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96163 (_ BitVec 32)) Bool)

(assert (=> b!1406216 (= res!944437 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47454 0))(
  ( (Unit!47455) )
))
(declare-fun lt!619301 () Unit!47454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47454)

(assert (=> b!1406216 (= lt!619301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96163 (_ BitVec 32)) SeekEntryResult!10740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406216 (= lt!619300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46429 a!2901) j!112) mask!2840) (select (arr!46429 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406217 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96163 (_ BitVec 32)) SeekEntryResult!10740)

(assert (=> b!1406217 (= e!795929 (= (seekEntryOrOpen!0 (select (arr!46429 a!2901) j!112) a!2901 mask!2840) (Found!10740 j!112)))))

(declare-fun b!1406218 () Bool)

(declare-fun res!944433 () Bool)

(assert (=> b!1406218 (=> (not res!944433) (not e!795931))))

(assert (=> b!1406218 (= res!944433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406219 () Bool)

(declare-fun res!944436 () Bool)

(assert (=> b!1406219 (=> (not res!944436) (not e!795931))))

(declare-datatypes ((List!32948 0))(
  ( (Nil!32945) (Cons!32944 (h!34198 (_ BitVec 64)) (t!47642 List!32948)) )
))
(declare-fun arrayNoDuplicates!0 (array!96163 (_ BitVec 32) List!32948) Bool)

(assert (=> b!1406219 (= res!944436 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32945))))

(declare-fun b!1406220 () Bool)

(declare-fun res!944440 () Bool)

(assert (=> b!1406220 (=> (not res!944440) (not e!795931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406220 (= res!944440 (validKeyInArray!0 (select (arr!46429 a!2901) j!112)))))

(declare-fun b!1406221 () Bool)

(declare-fun res!944435 () Bool)

(assert (=> b!1406221 (=> (not res!944435) (not e!795931))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406221 (= res!944435 (validKeyInArray!0 (select (arr!46429 a!2901) i!1037)))))

(declare-fun b!1406222 () Bool)

(assert (=> b!1406222 (= e!795930 true)))

(declare-fun lt!619302 () SeekEntryResult!10740)

(assert (=> b!1406222 (= lt!619302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96164 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46979 a!2901)) mask!2840))))

(declare-fun b!1406223 () Bool)

(declare-fun res!944438 () Bool)

(assert (=> b!1406223 (=> (not res!944438) (not e!795931))))

(assert (=> b!1406223 (= res!944438 (and (= (size!46979 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46979 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46979 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944434 () Bool)

(assert (=> start!120856 (=> (not res!944434) (not e!795931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120856 (= res!944434 (validMask!0 mask!2840))))

(assert (=> start!120856 e!795931))

(assert (=> start!120856 true))

(declare-fun array_inv!35457 (array!96163) Bool)

(assert (=> start!120856 (array_inv!35457 a!2901)))

(assert (= (and start!120856 res!944434) b!1406223))

(assert (= (and b!1406223 res!944438) b!1406221))

(assert (= (and b!1406221 res!944435) b!1406220))

(assert (= (and b!1406220 res!944440) b!1406218))

(assert (= (and b!1406218 res!944433) b!1406219))

(assert (= (and b!1406219 res!944436) b!1406216))

(assert (= (and b!1406216 res!944437) b!1406217))

(assert (= (and b!1406216 (not res!944439)) b!1406222))

(declare-fun m!1295267 () Bool)

(assert (=> b!1406217 m!1295267))

(assert (=> b!1406217 m!1295267))

(declare-fun m!1295269 () Bool)

(assert (=> b!1406217 m!1295269))

(declare-fun m!1295271 () Bool)

(assert (=> b!1406221 m!1295271))

(assert (=> b!1406221 m!1295271))

(declare-fun m!1295273 () Bool)

(assert (=> b!1406221 m!1295273))

(assert (=> b!1406220 m!1295267))

(assert (=> b!1406220 m!1295267))

(declare-fun m!1295275 () Bool)

(assert (=> b!1406220 m!1295275))

(declare-fun m!1295277 () Bool)

(assert (=> b!1406218 m!1295277))

(assert (=> b!1406216 m!1295267))

(declare-fun m!1295279 () Bool)

(assert (=> b!1406216 m!1295279))

(assert (=> b!1406216 m!1295267))

(declare-fun m!1295281 () Bool)

(assert (=> b!1406216 m!1295281))

(assert (=> b!1406216 m!1295279))

(assert (=> b!1406216 m!1295267))

(declare-fun m!1295283 () Bool)

(assert (=> b!1406216 m!1295283))

(declare-fun m!1295285 () Bool)

(assert (=> b!1406216 m!1295285))

(declare-fun m!1295287 () Bool)

(assert (=> start!120856 m!1295287))

(declare-fun m!1295289 () Bool)

(assert (=> start!120856 m!1295289))

(declare-fun m!1295291 () Bool)

(assert (=> b!1406222 m!1295291))

(declare-fun m!1295293 () Bool)

(assert (=> b!1406222 m!1295293))

(assert (=> b!1406222 m!1295293))

(declare-fun m!1295295 () Bool)

(assert (=> b!1406222 m!1295295))

(assert (=> b!1406222 m!1295295))

(assert (=> b!1406222 m!1295293))

(declare-fun m!1295297 () Bool)

(assert (=> b!1406222 m!1295297))

(declare-fun m!1295299 () Bool)

(assert (=> b!1406219 m!1295299))

(push 1)

(assert (not b!1406219))

(assert (not b!1406216))

(assert (not b!1406217))

(assert (not b!1406221))

(assert (not b!1406218))

(assert (not start!120856))

(assert (not b!1406220))

(assert (not b!1406222))

(check-sat)

(pop 1)

(push 1)

