; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120536 () Bool)

(assert start!120536)

(declare-fun b!1403553 () Bool)

(declare-fun res!942066 () Bool)

(declare-fun e!794697 () Bool)

(assert (=> b!1403553 (=> (not res!942066) (not e!794697))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95945 0))(
  ( (array!95946 (arr!46323 (Array (_ BitVec 32) (_ BitVec 64))) (size!46873 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95945)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403553 (= res!942066 (and (= (size!46873 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46873 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46873 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403554 () Bool)

(assert (=> b!1403554 (= e!794697 (not true))))

(declare-fun e!794699 () Bool)

(assert (=> b!1403554 e!794699))

(declare-fun res!942068 () Bool)

(assert (=> b!1403554 (=> (not res!942068) (not e!794699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95945 (_ BitVec 32)) Bool)

(assert (=> b!1403554 (= res!942068 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47284 0))(
  ( (Unit!47285) )
))
(declare-fun lt!618441 () Unit!47284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47284)

(assert (=> b!1403554 (= lt!618441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10640 0))(
  ( (MissingZero!10640 (index!44937 (_ BitVec 32))) (Found!10640 (index!44938 (_ BitVec 32))) (Intermediate!10640 (undefined!11452 Bool) (index!44939 (_ BitVec 32)) (x!126547 (_ BitVec 32))) (Undefined!10640) (MissingVacant!10640 (index!44940 (_ BitVec 32))) )
))
(declare-fun lt!618440 () SeekEntryResult!10640)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95945 (_ BitVec 32)) SeekEntryResult!10640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403554 (= lt!618440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46323 a!2901) j!112) mask!2840) (select (arr!46323 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403555 () Bool)

(declare-fun res!942067 () Bool)

(assert (=> b!1403555 (=> (not res!942067) (not e!794697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403555 (= res!942067 (validKeyInArray!0 (select (arr!46323 a!2901) j!112)))))

(declare-fun b!1403556 () Bool)

(declare-fun res!942065 () Bool)

(assert (=> b!1403556 (=> (not res!942065) (not e!794697))))

(assert (=> b!1403556 (= res!942065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942070 () Bool)

(assert (=> start!120536 (=> (not res!942070) (not e!794697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120536 (= res!942070 (validMask!0 mask!2840))))

(assert (=> start!120536 e!794697))

(assert (=> start!120536 true))

(declare-fun array_inv!35351 (array!95945) Bool)

(assert (=> start!120536 (array_inv!35351 a!2901)))

(declare-fun b!1403557 () Bool)

(declare-fun res!942064 () Bool)

(assert (=> b!1403557 (=> (not res!942064) (not e!794697))))

(declare-datatypes ((List!32842 0))(
  ( (Nil!32839) (Cons!32838 (h!34086 (_ BitVec 64)) (t!47536 List!32842)) )
))
(declare-fun arrayNoDuplicates!0 (array!95945 (_ BitVec 32) List!32842) Bool)

(assert (=> b!1403557 (= res!942064 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32839))))

(declare-fun b!1403558 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95945 (_ BitVec 32)) SeekEntryResult!10640)

(assert (=> b!1403558 (= e!794699 (= (seekEntryOrOpen!0 (select (arr!46323 a!2901) j!112) a!2901 mask!2840) (Found!10640 j!112)))))

(declare-fun b!1403559 () Bool)

(declare-fun res!942069 () Bool)

(assert (=> b!1403559 (=> (not res!942069) (not e!794697))))

(assert (=> b!1403559 (= res!942069 (validKeyInArray!0 (select (arr!46323 a!2901) i!1037)))))

(assert (= (and start!120536 res!942070) b!1403553))

(assert (= (and b!1403553 res!942066) b!1403559))

(assert (= (and b!1403559 res!942069) b!1403555))

(assert (= (and b!1403555 res!942067) b!1403556))

(assert (= (and b!1403556 res!942065) b!1403557))

(assert (= (and b!1403557 res!942064) b!1403554))

(assert (= (and b!1403554 res!942068) b!1403558))

(declare-fun m!1292237 () Bool)

(assert (=> b!1403559 m!1292237))

(assert (=> b!1403559 m!1292237))

(declare-fun m!1292239 () Bool)

(assert (=> b!1403559 m!1292239))

(declare-fun m!1292241 () Bool)

(assert (=> b!1403556 m!1292241))

(declare-fun m!1292243 () Bool)

(assert (=> start!120536 m!1292243))

(declare-fun m!1292245 () Bool)

(assert (=> start!120536 m!1292245))

(declare-fun m!1292247 () Bool)

(assert (=> b!1403554 m!1292247))

(declare-fun m!1292249 () Bool)

(assert (=> b!1403554 m!1292249))

(assert (=> b!1403554 m!1292247))

(declare-fun m!1292251 () Bool)

(assert (=> b!1403554 m!1292251))

(assert (=> b!1403554 m!1292249))

(assert (=> b!1403554 m!1292247))

(declare-fun m!1292253 () Bool)

(assert (=> b!1403554 m!1292253))

(declare-fun m!1292255 () Bool)

(assert (=> b!1403554 m!1292255))

(assert (=> b!1403558 m!1292247))

(assert (=> b!1403558 m!1292247))

(declare-fun m!1292257 () Bool)

(assert (=> b!1403558 m!1292257))

(assert (=> b!1403555 m!1292247))

(assert (=> b!1403555 m!1292247))

(declare-fun m!1292259 () Bool)

(assert (=> b!1403555 m!1292259))

(declare-fun m!1292261 () Bool)

(assert (=> b!1403557 m!1292261))

(check-sat (not b!1403555) (not b!1403558) (not b!1403554) (not b!1403556) (not b!1403559) (not start!120536) (not b!1403557))
