; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119608 () Bool)

(assert start!119608)

(declare-fun b!1393235 () Bool)

(declare-fun res!932650 () Bool)

(declare-fun e!788915 () Bool)

(assert (=> b!1393235 (=> (not res!932650) (not e!788915))))

(declare-datatypes ((array!95290 0))(
  ( (array!95291 (arr!46003 (Array (_ BitVec 32) (_ BitVec 64))) (size!46553 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95290)

(declare-datatypes ((List!32522 0))(
  ( (Nil!32519) (Cons!32518 (h!33751 (_ BitVec 64)) (t!47216 List!32522)) )
))
(declare-fun arrayNoDuplicates!0 (array!95290 (_ BitVec 32) List!32522) Bool)

(assert (=> b!1393235 (= res!932650 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32519))))

(declare-fun res!932648 () Bool)

(assert (=> start!119608 (=> (not res!932648) (not e!788915))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119608 (= res!932648 (validMask!0 mask!2840))))

(assert (=> start!119608 e!788915))

(assert (=> start!119608 true))

(declare-fun array_inv!35031 (array!95290) Bool)

(assert (=> start!119608 (array_inv!35031 a!2901)))

(declare-fun e!788918 () Bool)

(declare-fun b!1393236 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10320 0))(
  ( (MissingZero!10320 (index!43651 (_ BitVec 32))) (Found!10320 (index!43652 (_ BitVec 32))) (Intermediate!10320 (undefined!11132 Bool) (index!43653 (_ BitVec 32)) (x!125332 (_ BitVec 32))) (Undefined!10320) (MissingVacant!10320 (index!43654 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95290 (_ BitVec 32)) SeekEntryResult!10320)

(assert (=> b!1393236 (= e!788918 (= (seekEntryOrOpen!0 (select (arr!46003 a!2901) j!112) a!2901 mask!2840) (Found!10320 j!112)))))

(declare-fun b!1393237 () Bool)

(declare-fun res!932643 () Bool)

(assert (=> b!1393237 (=> (not res!932643) (not e!788915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393237 (= res!932643 (validKeyInArray!0 (select (arr!46003 a!2901) j!112)))))

(declare-fun b!1393238 () Bool)

(declare-fun res!932644 () Bool)

(assert (=> b!1393238 (=> (not res!932644) (not e!788915))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393238 (= res!932644 (and (= (size!46553 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46553 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46553 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393239 () Bool)

(declare-fun e!788916 () Bool)

(assert (=> b!1393239 (= e!788916 true)))

(declare-fun lt!611916 () SeekEntryResult!10320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95290 (_ BitVec 32)) SeekEntryResult!10320)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393239 (= lt!611916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46003 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46003 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95291 (store (arr!46003 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46553 a!2901)) mask!2840))))

(declare-fun b!1393240 () Bool)

(declare-fun res!932646 () Bool)

(assert (=> b!1393240 (=> (not res!932646) (not e!788915))))

(assert (=> b!1393240 (= res!932646 (validKeyInArray!0 (select (arr!46003 a!2901) i!1037)))))

(declare-fun b!1393241 () Bool)

(declare-fun res!932645 () Bool)

(assert (=> b!1393241 (=> (not res!932645) (not e!788915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95290 (_ BitVec 32)) Bool)

(assert (=> b!1393241 (= res!932645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393242 () Bool)

(assert (=> b!1393242 (= e!788915 (not e!788916))))

(declare-fun res!932649 () Bool)

(assert (=> b!1393242 (=> res!932649 e!788916)))

(declare-fun lt!611914 () SeekEntryResult!10320)

(assert (=> b!1393242 (= res!932649 (or (not (is-Intermediate!10320 lt!611914)) (undefined!11132 lt!611914)))))

(assert (=> b!1393242 e!788918))

(declare-fun res!932647 () Bool)

(assert (=> b!1393242 (=> (not res!932647) (not e!788918))))

(assert (=> b!1393242 (= res!932647 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46644 0))(
  ( (Unit!46645) )
))
(declare-fun lt!611915 () Unit!46644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46644)

(assert (=> b!1393242 (= lt!611915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393242 (= lt!611914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46003 a!2901) j!112) mask!2840) (select (arr!46003 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119608 res!932648) b!1393238))

(assert (= (and b!1393238 res!932644) b!1393240))

(assert (= (and b!1393240 res!932646) b!1393237))

(assert (= (and b!1393237 res!932643) b!1393241))

(assert (= (and b!1393241 res!932645) b!1393235))

(assert (= (and b!1393235 res!932650) b!1393242))

(assert (= (and b!1393242 res!932647) b!1393236))

(assert (= (and b!1393242 (not res!932649)) b!1393239))

(declare-fun m!1279061 () Bool)

(assert (=> b!1393237 m!1279061))

(assert (=> b!1393237 m!1279061))

(declare-fun m!1279063 () Bool)

(assert (=> b!1393237 m!1279063))

(assert (=> b!1393242 m!1279061))

(declare-fun m!1279065 () Bool)

(assert (=> b!1393242 m!1279065))

(assert (=> b!1393242 m!1279061))

(declare-fun m!1279067 () Bool)

(assert (=> b!1393242 m!1279067))

(assert (=> b!1393242 m!1279065))

(assert (=> b!1393242 m!1279061))

(declare-fun m!1279069 () Bool)

(assert (=> b!1393242 m!1279069))

(declare-fun m!1279071 () Bool)

(assert (=> b!1393242 m!1279071))

(declare-fun m!1279073 () Bool)

(assert (=> b!1393241 m!1279073))

(declare-fun m!1279075 () Bool)

(assert (=> start!119608 m!1279075))

(declare-fun m!1279077 () Bool)

(assert (=> start!119608 m!1279077))

(declare-fun m!1279079 () Bool)

(assert (=> b!1393235 m!1279079))

(declare-fun m!1279081 () Bool)

(assert (=> b!1393239 m!1279081))

(declare-fun m!1279083 () Bool)

(assert (=> b!1393239 m!1279083))

(assert (=> b!1393239 m!1279083))

(declare-fun m!1279085 () Bool)

(assert (=> b!1393239 m!1279085))

(assert (=> b!1393239 m!1279085))

(assert (=> b!1393239 m!1279083))

(declare-fun m!1279087 () Bool)

(assert (=> b!1393239 m!1279087))

(declare-fun m!1279089 () Bool)

(assert (=> b!1393240 m!1279089))

(assert (=> b!1393240 m!1279089))

(declare-fun m!1279091 () Bool)

(assert (=> b!1393240 m!1279091))

(assert (=> b!1393236 m!1279061))

(assert (=> b!1393236 m!1279061))

(declare-fun m!1279093 () Bool)

(assert (=> b!1393236 m!1279093))

(push 1)

(assert (not start!119608))

(assert (not b!1393239))

(assert (not b!1393237))

(assert (not b!1393242))

(assert (not b!1393236))

(assert (not b!1393241))

(assert (not b!1393240))

(assert (not b!1393235))

(check-sat)

