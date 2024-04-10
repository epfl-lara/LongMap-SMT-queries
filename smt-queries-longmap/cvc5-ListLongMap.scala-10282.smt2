; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120852 () Bool)

(assert start!120852)

(declare-fun b!1406168 () Bool)

(declare-fun res!944385 () Bool)

(declare-fun e!795907 () Bool)

(assert (=> b!1406168 (=> (not res!944385) (not e!795907))))

(declare-datatypes ((array!96159 0))(
  ( (array!96160 (arr!46427 (Array (_ BitVec 32) (_ BitVec 64))) (size!46977 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96159)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406168 (= res!944385 (validKeyInArray!0 (select (arr!46427 a!2901) i!1037)))))

(declare-fun b!1406170 () Bool)

(declare-fun res!944390 () Bool)

(assert (=> b!1406170 (=> (not res!944390) (not e!795907))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406170 (= res!944390 (and (= (size!46977 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46977 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46977 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406171 () Bool)

(declare-fun res!944386 () Bool)

(assert (=> b!1406171 (=> (not res!944386) (not e!795907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96159 (_ BitVec 32)) Bool)

(assert (=> b!1406171 (= res!944386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406172 () Bool)

(declare-fun e!795905 () Bool)

(assert (=> b!1406172 (= e!795905 true)))

(declare-datatypes ((SeekEntryResult!10738 0))(
  ( (MissingZero!10738 (index!45329 (_ BitVec 32))) (Found!10738 (index!45330 (_ BitVec 32))) (Intermediate!10738 (undefined!11550 Bool) (index!45331 (_ BitVec 32)) (x!126937 (_ BitVec 32))) (Undefined!10738) (MissingVacant!10738 (index!45332 (_ BitVec 32))) )
))
(declare-fun lt!619283 () SeekEntryResult!10738)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96159 (_ BitVec 32)) SeekEntryResult!10738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406172 (= lt!619283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46427 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46427 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96160 (store (arr!46427 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46977 a!2901)) mask!2840))))

(declare-fun b!1406173 () Bool)

(assert (=> b!1406173 (= e!795907 (not e!795905))))

(declare-fun res!944389 () Bool)

(assert (=> b!1406173 (=> res!944389 e!795905)))

(declare-fun lt!619282 () SeekEntryResult!10738)

(assert (=> b!1406173 (= res!944389 (or (not (is-Intermediate!10738 lt!619282)) (undefined!11550 lt!619282)))))

(declare-fun e!795908 () Bool)

(assert (=> b!1406173 e!795908))

(declare-fun res!944392 () Bool)

(assert (=> b!1406173 (=> (not res!944392) (not e!795908))))

(assert (=> b!1406173 (= res!944392 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47450 0))(
  ( (Unit!47451) )
))
(declare-fun lt!619284 () Unit!47450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47450)

(assert (=> b!1406173 (= lt!619284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406173 (= lt!619282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46427 a!2901) j!112) mask!2840) (select (arr!46427 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944387 () Bool)

(assert (=> start!120852 (=> (not res!944387) (not e!795907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120852 (= res!944387 (validMask!0 mask!2840))))

(assert (=> start!120852 e!795907))

(assert (=> start!120852 true))

(declare-fun array_inv!35455 (array!96159) Bool)

(assert (=> start!120852 (array_inv!35455 a!2901)))

(declare-fun b!1406169 () Bool)

(declare-fun res!944388 () Bool)

(assert (=> b!1406169 (=> (not res!944388) (not e!795907))))

(assert (=> b!1406169 (= res!944388 (validKeyInArray!0 (select (arr!46427 a!2901) j!112)))))

(declare-fun b!1406174 () Bool)

(declare-fun res!944391 () Bool)

(assert (=> b!1406174 (=> (not res!944391) (not e!795907))))

(declare-datatypes ((List!32946 0))(
  ( (Nil!32943) (Cons!32942 (h!34196 (_ BitVec 64)) (t!47640 List!32946)) )
))
(declare-fun arrayNoDuplicates!0 (array!96159 (_ BitVec 32) List!32946) Bool)

(assert (=> b!1406174 (= res!944391 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32943))))

(declare-fun b!1406175 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96159 (_ BitVec 32)) SeekEntryResult!10738)

(assert (=> b!1406175 (= e!795908 (= (seekEntryOrOpen!0 (select (arr!46427 a!2901) j!112) a!2901 mask!2840) (Found!10738 j!112)))))

(assert (= (and start!120852 res!944387) b!1406170))

(assert (= (and b!1406170 res!944390) b!1406168))

(assert (= (and b!1406168 res!944385) b!1406169))

(assert (= (and b!1406169 res!944388) b!1406171))

(assert (= (and b!1406171 res!944386) b!1406174))

(assert (= (and b!1406174 res!944391) b!1406173))

(assert (= (and b!1406173 res!944392) b!1406175))

(assert (= (and b!1406173 (not res!944389)) b!1406172))

(declare-fun m!1295199 () Bool)

(assert (=> b!1406175 m!1295199))

(assert (=> b!1406175 m!1295199))

(declare-fun m!1295201 () Bool)

(assert (=> b!1406175 m!1295201))

(declare-fun m!1295203 () Bool)

(assert (=> b!1406174 m!1295203))

(declare-fun m!1295205 () Bool)

(assert (=> b!1406171 m!1295205))

(assert (=> b!1406173 m!1295199))

(declare-fun m!1295207 () Bool)

(assert (=> b!1406173 m!1295207))

(assert (=> b!1406173 m!1295199))

(declare-fun m!1295209 () Bool)

(assert (=> b!1406173 m!1295209))

(assert (=> b!1406173 m!1295207))

(assert (=> b!1406173 m!1295199))

(declare-fun m!1295211 () Bool)

(assert (=> b!1406173 m!1295211))

(declare-fun m!1295213 () Bool)

(assert (=> b!1406173 m!1295213))

(declare-fun m!1295215 () Bool)

(assert (=> b!1406172 m!1295215))

(declare-fun m!1295217 () Bool)

(assert (=> b!1406172 m!1295217))

(assert (=> b!1406172 m!1295217))

(declare-fun m!1295219 () Bool)

(assert (=> b!1406172 m!1295219))

(assert (=> b!1406172 m!1295219))

(assert (=> b!1406172 m!1295217))

(declare-fun m!1295221 () Bool)

(assert (=> b!1406172 m!1295221))

(assert (=> b!1406169 m!1295199))

(assert (=> b!1406169 m!1295199))

(declare-fun m!1295223 () Bool)

(assert (=> b!1406169 m!1295223))

(declare-fun m!1295225 () Bool)

(assert (=> b!1406168 m!1295225))

(assert (=> b!1406168 m!1295225))

(declare-fun m!1295227 () Bool)

(assert (=> b!1406168 m!1295227))

(declare-fun m!1295229 () Bool)

(assert (=> start!120852 m!1295229))

(declare-fun m!1295231 () Bool)

(assert (=> start!120852 m!1295231))

(push 1)

(assert (not start!120852))

(assert (not b!1406173))

(assert (not b!1406169))

(assert (not b!1406175))

(assert (not b!1406172))

(assert (not b!1406168))

(assert (not b!1406174))

(assert (not b!1406171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

