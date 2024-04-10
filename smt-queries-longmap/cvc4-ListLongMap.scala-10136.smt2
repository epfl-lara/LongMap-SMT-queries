; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119584 () Bool)

(assert start!119584)

(declare-fun b!1392947 () Bool)

(declare-fun res!932359 () Bool)

(declare-fun e!788773 () Bool)

(assert (=> b!1392947 (=> (not res!932359) (not e!788773))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95266 0))(
  ( (array!95267 (arr!45991 (Array (_ BitVec 32) (_ BitVec 64))) (size!46541 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95266)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1392947 (= res!932359 (and (= (size!46541 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46541 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46541 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392948 () Bool)

(declare-fun e!788774 () Bool)

(assert (=> b!1392948 (= e!788773 (not e!788774))))

(declare-fun res!932355 () Bool)

(assert (=> b!1392948 (=> res!932355 e!788774)))

(declare-datatypes ((SeekEntryResult!10308 0))(
  ( (MissingZero!10308 (index!43603 (_ BitVec 32))) (Found!10308 (index!43604 (_ BitVec 32))) (Intermediate!10308 (undefined!11120 Bool) (index!43605 (_ BitVec 32)) (x!125288 (_ BitVec 32))) (Undefined!10308) (MissingVacant!10308 (index!43606 (_ BitVec 32))) )
))
(declare-fun lt!611807 () SeekEntryResult!10308)

(assert (=> b!1392948 (= res!932355 (or (not (is-Intermediate!10308 lt!611807)) (undefined!11120 lt!611807)))))

(declare-fun e!788771 () Bool)

(assert (=> b!1392948 e!788771))

(declare-fun res!932357 () Bool)

(assert (=> b!1392948 (=> (not res!932357) (not e!788771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95266 (_ BitVec 32)) Bool)

(assert (=> b!1392948 (= res!932357 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46620 0))(
  ( (Unit!46621) )
))
(declare-fun lt!611808 () Unit!46620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46620)

(assert (=> b!1392948 (= lt!611808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95266 (_ BitVec 32)) SeekEntryResult!10308)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392948 (= lt!611807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) (select (arr!45991 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392949 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95266 (_ BitVec 32)) SeekEntryResult!10308)

(assert (=> b!1392949 (= e!788771 (= (seekEntryOrOpen!0 (select (arr!45991 a!2901) j!112) a!2901 mask!2840) (Found!10308 j!112)))))

(declare-fun b!1392950 () Bool)

(declare-fun res!932361 () Bool)

(assert (=> b!1392950 (=> (not res!932361) (not e!788773))))

(assert (=> b!1392950 (= res!932361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392951 () Bool)

(declare-fun res!932362 () Bool)

(assert (=> b!1392951 (=> (not res!932362) (not e!788773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392951 (= res!932362 (validKeyInArray!0 (select (arr!45991 a!2901) j!112)))))

(declare-fun res!932358 () Bool)

(assert (=> start!119584 (=> (not res!932358) (not e!788773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119584 (= res!932358 (validMask!0 mask!2840))))

(assert (=> start!119584 e!788773))

(assert (=> start!119584 true))

(declare-fun array_inv!35019 (array!95266) Bool)

(assert (=> start!119584 (array_inv!35019 a!2901)))

(declare-fun b!1392952 () Bool)

(declare-fun res!932356 () Bool)

(assert (=> b!1392952 (=> (not res!932356) (not e!788773))))

(declare-datatypes ((List!32510 0))(
  ( (Nil!32507) (Cons!32506 (h!33739 (_ BitVec 64)) (t!47204 List!32510)) )
))
(declare-fun arrayNoDuplicates!0 (array!95266 (_ BitVec 32) List!32510) Bool)

(assert (=> b!1392952 (= res!932356 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32507))))

(declare-fun b!1392953 () Bool)

(assert (=> b!1392953 (= e!788774 true)))

(declare-fun lt!611806 () SeekEntryResult!10308)

(assert (=> b!1392953 (= lt!611806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45991 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45991 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95267 (store (arr!45991 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46541 a!2901)) mask!2840))))

(declare-fun b!1392954 () Bool)

(declare-fun res!932360 () Bool)

(assert (=> b!1392954 (=> (not res!932360) (not e!788773))))

(assert (=> b!1392954 (= res!932360 (validKeyInArray!0 (select (arr!45991 a!2901) i!1037)))))

(assert (= (and start!119584 res!932358) b!1392947))

(assert (= (and b!1392947 res!932359) b!1392954))

(assert (= (and b!1392954 res!932360) b!1392951))

(assert (= (and b!1392951 res!932362) b!1392950))

(assert (= (and b!1392950 res!932361) b!1392952))

(assert (= (and b!1392952 res!932356) b!1392948))

(assert (= (and b!1392948 res!932357) b!1392949))

(assert (= (and b!1392948 (not res!932355)) b!1392953))

(declare-fun m!1278653 () Bool)

(assert (=> b!1392948 m!1278653))

(declare-fun m!1278655 () Bool)

(assert (=> b!1392948 m!1278655))

(assert (=> b!1392948 m!1278653))

(declare-fun m!1278657 () Bool)

(assert (=> b!1392948 m!1278657))

(assert (=> b!1392948 m!1278655))

(assert (=> b!1392948 m!1278653))

(declare-fun m!1278659 () Bool)

(assert (=> b!1392948 m!1278659))

(declare-fun m!1278661 () Bool)

(assert (=> b!1392948 m!1278661))

(declare-fun m!1278663 () Bool)

(assert (=> b!1392953 m!1278663))

(declare-fun m!1278665 () Bool)

(assert (=> b!1392953 m!1278665))

(assert (=> b!1392953 m!1278665))

(declare-fun m!1278667 () Bool)

(assert (=> b!1392953 m!1278667))

(assert (=> b!1392953 m!1278667))

(assert (=> b!1392953 m!1278665))

(declare-fun m!1278669 () Bool)

(assert (=> b!1392953 m!1278669))

(assert (=> b!1392949 m!1278653))

(assert (=> b!1392949 m!1278653))

(declare-fun m!1278671 () Bool)

(assert (=> b!1392949 m!1278671))

(declare-fun m!1278673 () Bool)

(assert (=> b!1392954 m!1278673))

(assert (=> b!1392954 m!1278673))

(declare-fun m!1278675 () Bool)

(assert (=> b!1392954 m!1278675))

(declare-fun m!1278677 () Bool)

(assert (=> b!1392950 m!1278677))

(declare-fun m!1278679 () Bool)

(assert (=> start!119584 m!1278679))

(declare-fun m!1278681 () Bool)

(assert (=> start!119584 m!1278681))

(assert (=> b!1392951 m!1278653))

(assert (=> b!1392951 m!1278653))

(declare-fun m!1278683 () Bool)

(assert (=> b!1392951 m!1278683))

(declare-fun m!1278685 () Bool)

(assert (=> b!1392952 m!1278685))

(push 1)

(assert (not b!1392951))

(assert (not b!1392952))

(assert (not b!1392948))

(assert (not b!1392949))

(assert (not b!1392954))

(assert (not b!1392953))

(assert (not b!1392950))

(assert (not start!119584))

(check-sat)

(pop 1)

(push 1)

