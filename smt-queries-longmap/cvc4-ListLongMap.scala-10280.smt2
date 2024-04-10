; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120844 () Bool)

(assert start!120844)

(declare-fun b!1406072 () Bool)

(declare-fun res!944296 () Bool)

(declare-fun e!795860 () Bool)

(assert (=> b!1406072 (=> (not res!944296) (not e!795860))))

(declare-datatypes ((array!96151 0))(
  ( (array!96152 (arr!46423 (Array (_ BitVec 32) (_ BitVec 64))) (size!46973 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96151)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1406072 (= res!944296 (and (= (size!46973 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46973 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46973 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406073 () Bool)

(declare-fun e!795857 () Bool)

(assert (=> b!1406073 (= e!795860 (not e!795857))))

(declare-fun res!944292 () Bool)

(assert (=> b!1406073 (=> res!944292 e!795857)))

(declare-datatypes ((SeekEntryResult!10734 0))(
  ( (MissingZero!10734 (index!45313 (_ BitVec 32))) (Found!10734 (index!45314 (_ BitVec 32))) (Intermediate!10734 (undefined!11546 Bool) (index!45315 (_ BitVec 32)) (x!126917 (_ BitVec 32))) (Undefined!10734) (MissingVacant!10734 (index!45316 (_ BitVec 32))) )
))
(declare-fun lt!619248 () SeekEntryResult!10734)

(assert (=> b!1406073 (= res!944292 (or (not (is-Intermediate!10734 lt!619248)) (undefined!11546 lt!619248)))))

(declare-fun e!795858 () Bool)

(assert (=> b!1406073 e!795858))

(declare-fun res!944291 () Bool)

(assert (=> b!1406073 (=> (not res!944291) (not e!795858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96151 (_ BitVec 32)) Bool)

(assert (=> b!1406073 (= res!944291 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47442 0))(
  ( (Unit!47443) )
))
(declare-fun lt!619247 () Unit!47442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47442)

(assert (=> b!1406073 (= lt!619247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96151 (_ BitVec 32)) SeekEntryResult!10734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406073 (= lt!619248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46423 a!2901) j!112) mask!2840) (select (arr!46423 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406074 () Bool)

(declare-fun res!944294 () Bool)

(assert (=> b!1406074 (=> (not res!944294) (not e!795860))))

(declare-datatypes ((List!32942 0))(
  ( (Nil!32939) (Cons!32938 (h!34192 (_ BitVec 64)) (t!47636 List!32942)) )
))
(declare-fun arrayNoDuplicates!0 (array!96151 (_ BitVec 32) List!32942) Bool)

(assert (=> b!1406074 (= res!944294 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32939))))

(declare-fun b!1406075 () Bool)

(declare-fun res!944290 () Bool)

(assert (=> b!1406075 (=> (not res!944290) (not e!795860))))

(assert (=> b!1406075 (= res!944290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406076 () Bool)

(declare-fun res!944293 () Bool)

(assert (=> b!1406076 (=> (not res!944293) (not e!795860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406076 (= res!944293 (validKeyInArray!0 (select (arr!46423 a!2901) i!1037)))))

(declare-fun b!1406077 () Bool)

(assert (=> b!1406077 (= e!795857 true)))

(declare-fun lt!619246 () SeekEntryResult!10734)

(assert (=> b!1406077 (= lt!619246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46423 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46423 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96152 (store (arr!46423 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46973 a!2901)) mask!2840))))

(declare-fun b!1406078 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96151 (_ BitVec 32)) SeekEntryResult!10734)

(assert (=> b!1406078 (= e!795858 (= (seekEntryOrOpen!0 (select (arr!46423 a!2901) j!112) a!2901 mask!2840) (Found!10734 j!112)))))

(declare-fun res!944295 () Bool)

(assert (=> start!120844 (=> (not res!944295) (not e!795860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120844 (= res!944295 (validMask!0 mask!2840))))

(assert (=> start!120844 e!795860))

(assert (=> start!120844 true))

(declare-fun array_inv!35451 (array!96151) Bool)

(assert (=> start!120844 (array_inv!35451 a!2901)))

(declare-fun b!1406079 () Bool)

(declare-fun res!944289 () Bool)

(assert (=> b!1406079 (=> (not res!944289) (not e!795860))))

(assert (=> b!1406079 (= res!944289 (validKeyInArray!0 (select (arr!46423 a!2901) j!112)))))

(assert (= (and start!120844 res!944295) b!1406072))

(assert (= (and b!1406072 res!944296) b!1406076))

(assert (= (and b!1406076 res!944293) b!1406079))

(assert (= (and b!1406079 res!944289) b!1406075))

(assert (= (and b!1406075 res!944290) b!1406074))

(assert (= (and b!1406074 res!944294) b!1406073))

(assert (= (and b!1406073 res!944291) b!1406078))

(assert (= (and b!1406073 (not res!944292)) b!1406077))

(declare-fun m!1295063 () Bool)

(assert (=> b!1406079 m!1295063))

(assert (=> b!1406079 m!1295063))

(declare-fun m!1295065 () Bool)

(assert (=> b!1406079 m!1295065))

(declare-fun m!1295067 () Bool)

(assert (=> b!1406076 m!1295067))

(assert (=> b!1406076 m!1295067))

(declare-fun m!1295069 () Bool)

(assert (=> b!1406076 m!1295069))

(declare-fun m!1295071 () Bool)

(assert (=> b!1406075 m!1295071))

(declare-fun m!1295073 () Bool)

(assert (=> b!1406074 m!1295073))

(declare-fun m!1295075 () Bool)

(assert (=> start!120844 m!1295075))

(declare-fun m!1295077 () Bool)

(assert (=> start!120844 m!1295077))

(assert (=> b!1406073 m!1295063))

(declare-fun m!1295079 () Bool)

(assert (=> b!1406073 m!1295079))

(assert (=> b!1406073 m!1295063))

(declare-fun m!1295081 () Bool)

(assert (=> b!1406073 m!1295081))

(assert (=> b!1406073 m!1295079))

(assert (=> b!1406073 m!1295063))

(declare-fun m!1295083 () Bool)

(assert (=> b!1406073 m!1295083))

(declare-fun m!1295085 () Bool)

(assert (=> b!1406073 m!1295085))

(assert (=> b!1406078 m!1295063))

(assert (=> b!1406078 m!1295063))

(declare-fun m!1295087 () Bool)

(assert (=> b!1406078 m!1295087))

(declare-fun m!1295089 () Bool)

(assert (=> b!1406077 m!1295089))

(declare-fun m!1295091 () Bool)

(assert (=> b!1406077 m!1295091))

(assert (=> b!1406077 m!1295091))

(declare-fun m!1295093 () Bool)

(assert (=> b!1406077 m!1295093))

(assert (=> b!1406077 m!1295093))

(assert (=> b!1406077 m!1295091))

(declare-fun m!1295095 () Bool)

(assert (=> b!1406077 m!1295095))

(push 1)

(assert (not b!1406079))

(assert (not b!1406077))

(assert (not start!120844))

(assert (not b!1406075))

(assert (not b!1406073))

(assert (not b!1406074))

(assert (not b!1406078))

(assert (not b!1406076))

(check-sat)

(pop 1)

(push 1)

