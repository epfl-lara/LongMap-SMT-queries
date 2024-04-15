; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121182 () Bool)

(assert start!121182)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96289 0))(
  ( (array!96290 (arr!46488 (Array (_ BitVec 32) (_ BitVec 64))) (size!47040 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96289)

(declare-fun b!1408997 () Bool)

(declare-fun e!797378 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10825 0))(
  ( (MissingZero!10825 (index!45677 (_ BitVec 32))) (Found!10825 (index!45678 (_ BitVec 32))) (Intermediate!10825 (undefined!11637 Bool) (index!45679 (_ BitVec 32)) (x!127263 (_ BitVec 32))) (Undefined!10825) (MissingVacant!10825 (index!45680 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96289 (_ BitVec 32)) SeekEntryResult!10825)

(assert (=> b!1408997 (= e!797378 (= (seekEntryOrOpen!0 (select (arr!46488 a!2901) j!112) a!2901 mask!2840) (Found!10825 j!112)))))

(declare-fun b!1408998 () Bool)

(declare-fun res!946773 () Bool)

(declare-fun e!797376 () Bool)

(assert (=> b!1408998 (=> (not res!946773) (not e!797376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408998 (= res!946773 (validKeyInArray!0 (select (arr!46488 a!2901) j!112)))))

(declare-fun b!1408999 () Bool)

(declare-fun e!797377 () Bool)

(assert (=> b!1408999 (= e!797376 (not e!797377))))

(declare-fun res!946770 () Bool)

(assert (=> b!1408999 (=> res!946770 e!797377)))

(declare-fun lt!620398 () SeekEntryResult!10825)

(assert (=> b!1408999 (= res!946770 (or (not (is-Intermediate!10825 lt!620398)) (undefined!11637 lt!620398)))))

(assert (=> b!1408999 e!797378))

(declare-fun res!946775 () Bool)

(assert (=> b!1408999 (=> (not res!946775) (not e!797378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96289 (_ BitVec 32)) Bool)

(assert (=> b!1408999 (= res!946775 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47467 0))(
  ( (Unit!47468) )
))
(declare-fun lt!620399 () Unit!47467)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47467)

(assert (=> b!1408999 (= lt!620399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96289 (_ BitVec 32)) SeekEntryResult!10825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408999 (= lt!620398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46488 a!2901) j!112) mask!2840) (select (arr!46488 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409000 () Bool)

(declare-fun res!946771 () Bool)

(assert (=> b!1409000 (=> (not res!946771) (not e!797376))))

(assert (=> b!1409000 (= res!946771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409001 () Bool)

(declare-fun res!946774 () Bool)

(assert (=> b!1409001 (=> (not res!946774) (not e!797376))))

(declare-datatypes ((List!33085 0))(
  ( (Nil!33082) (Cons!33081 (h!34344 (_ BitVec 64)) (t!47771 List!33085)) )
))
(declare-fun arrayNoDuplicates!0 (array!96289 (_ BitVec 32) List!33085) Bool)

(assert (=> b!1409001 (= res!946774 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33082))))

(declare-fun b!1409002 () Bool)

(assert (=> b!1409002 (= e!797377 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620397 () SeekEntryResult!10825)

(assert (=> b!1409002 (= lt!620397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96290 (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47040 a!2901)) mask!2840))))

(declare-fun b!1409003 () Bool)

(declare-fun res!946772 () Bool)

(assert (=> b!1409003 (=> (not res!946772) (not e!797376))))

(assert (=> b!1409003 (= res!946772 (and (= (size!47040 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47040 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47040 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409004 () Bool)

(declare-fun res!946776 () Bool)

(assert (=> b!1409004 (=> (not res!946776) (not e!797376))))

(assert (=> b!1409004 (= res!946776 (validKeyInArray!0 (select (arr!46488 a!2901) i!1037)))))

(declare-fun res!946777 () Bool)

(assert (=> start!121182 (=> (not res!946777) (not e!797376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121182 (= res!946777 (validMask!0 mask!2840))))

(assert (=> start!121182 e!797376))

(assert (=> start!121182 true))

(declare-fun array_inv!35721 (array!96289) Bool)

(assert (=> start!121182 (array_inv!35721 a!2901)))

(assert (= (and start!121182 res!946777) b!1409003))

(assert (= (and b!1409003 res!946772) b!1409004))

(assert (= (and b!1409004 res!946776) b!1408998))

(assert (= (and b!1408998 res!946773) b!1409000))

(assert (= (and b!1409000 res!946771) b!1409001))

(assert (= (and b!1409001 res!946774) b!1408999))

(assert (= (and b!1408999 res!946775) b!1408997))

(assert (= (and b!1408999 (not res!946770)) b!1409002))

(declare-fun m!1298109 () Bool)

(assert (=> b!1409002 m!1298109))

(declare-fun m!1298111 () Bool)

(assert (=> b!1409002 m!1298111))

(assert (=> b!1409002 m!1298111))

(declare-fun m!1298113 () Bool)

(assert (=> b!1409002 m!1298113))

(assert (=> b!1409002 m!1298113))

(assert (=> b!1409002 m!1298111))

(declare-fun m!1298115 () Bool)

(assert (=> b!1409002 m!1298115))

(declare-fun m!1298117 () Bool)

(assert (=> b!1408997 m!1298117))

(assert (=> b!1408997 m!1298117))

(declare-fun m!1298119 () Bool)

(assert (=> b!1408997 m!1298119))

(declare-fun m!1298121 () Bool)

(assert (=> b!1409001 m!1298121))

(assert (=> b!1408998 m!1298117))

(assert (=> b!1408998 m!1298117))

(declare-fun m!1298123 () Bool)

(assert (=> b!1408998 m!1298123))

(declare-fun m!1298125 () Bool)

(assert (=> b!1409004 m!1298125))

(assert (=> b!1409004 m!1298125))

(declare-fun m!1298127 () Bool)

(assert (=> b!1409004 m!1298127))

(declare-fun m!1298129 () Bool)

(assert (=> start!121182 m!1298129))

(declare-fun m!1298131 () Bool)

(assert (=> start!121182 m!1298131))

(assert (=> b!1408999 m!1298117))

(declare-fun m!1298133 () Bool)

(assert (=> b!1408999 m!1298133))

(assert (=> b!1408999 m!1298117))

(declare-fun m!1298135 () Bool)

(assert (=> b!1408999 m!1298135))

(assert (=> b!1408999 m!1298133))

(assert (=> b!1408999 m!1298117))

(declare-fun m!1298137 () Bool)

(assert (=> b!1408999 m!1298137))

(declare-fun m!1298139 () Bool)

(assert (=> b!1408999 m!1298139))

(declare-fun m!1298141 () Bool)

(assert (=> b!1409000 m!1298141))

(push 1)

(assert (not b!1408998))

(assert (not b!1409001))

(assert (not b!1408999))

(assert (not start!121182))

(assert (not b!1409004))

(assert (not b!1408997))

(assert (not b!1409002))

(assert (not b!1409000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

