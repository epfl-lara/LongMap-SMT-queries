; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121020 () Bool)

(assert start!121020)

(declare-fun b!1407068 () Bool)

(declare-fun e!796526 () Bool)

(declare-fun e!796525 () Bool)

(assert (=> b!1407068 (= e!796526 (not e!796525))))

(declare-fun res!944606 () Bool)

(assert (=> b!1407068 (=> res!944606 e!796525)))

(declare-datatypes ((SeekEntryResult!10684 0))(
  ( (MissingZero!10684 (index!45113 (_ BitVec 32))) (Found!10684 (index!45114 (_ BitVec 32))) (Intermediate!10684 (undefined!11496 Bool) (index!45115 (_ BitVec 32)) (x!126870 (_ BitVec 32))) (Undefined!10684) (MissingVacant!10684 (index!45116 (_ BitVec 32))) )
))
(declare-fun lt!619591 () SeekEntryResult!10684)

(assert (=> b!1407068 (= res!944606 (or (not (is-Intermediate!10684 lt!619591)) (undefined!11496 lt!619591)))))

(declare-fun e!796524 () Bool)

(assert (=> b!1407068 e!796524))

(declare-fun res!944607 () Bool)

(assert (=> b!1407068 (=> (not res!944607) (not e!796524))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96249 0))(
  ( (array!96250 (arr!46470 (Array (_ BitVec 32) (_ BitVec 64))) (size!47021 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96249)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96249 (_ BitVec 32)) Bool)

(assert (=> b!1407068 (= res!944607 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47369 0))(
  ( (Unit!47370) )
))
(declare-fun lt!619592 () Unit!47369)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47369)

(assert (=> b!1407068 (= lt!619592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96249 (_ BitVec 32)) SeekEntryResult!10684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407068 (= lt!619591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46470 a!2901) j!112) mask!2840) (select (arr!46470 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944605 () Bool)

(assert (=> start!121020 (=> (not res!944605) (not e!796526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121020 (= res!944605 (validMask!0 mask!2840))))

(assert (=> start!121020 e!796526))

(assert (=> start!121020 true))

(declare-fun array_inv!35751 (array!96249) Bool)

(assert (=> start!121020 (array_inv!35751 a!2901)))

(declare-fun b!1407069 () Bool)

(declare-fun res!944603 () Bool)

(assert (=> b!1407069 (=> (not res!944603) (not e!796526))))

(declare-datatypes ((List!32976 0))(
  ( (Nil!32973) (Cons!32972 (h!34234 (_ BitVec 64)) (t!47662 List!32976)) )
))
(declare-fun arrayNoDuplicates!0 (array!96249 (_ BitVec 32) List!32976) Bool)

(assert (=> b!1407069 (= res!944603 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32973))))

(declare-fun b!1407070 () Bool)

(assert (=> b!1407070 (= e!796525 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619590 () SeekEntryResult!10684)

(assert (=> b!1407070 (= lt!619590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96250 (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47021 a!2901)) mask!2840))))

(declare-fun b!1407071 () Bool)

(declare-fun res!944601 () Bool)

(assert (=> b!1407071 (=> (not res!944601) (not e!796526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407071 (= res!944601 (validKeyInArray!0 (select (arr!46470 a!2901) i!1037)))))

(declare-fun b!1407072 () Bool)

(declare-fun res!944608 () Bool)

(assert (=> b!1407072 (=> (not res!944608) (not e!796526))))

(assert (=> b!1407072 (= res!944608 (and (= (size!47021 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47021 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47021 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407073 () Bool)

(declare-fun res!944602 () Bool)

(assert (=> b!1407073 (=> (not res!944602) (not e!796526))))

(assert (=> b!1407073 (= res!944602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407074 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96249 (_ BitVec 32)) SeekEntryResult!10684)

(assert (=> b!1407074 (= e!796524 (= (seekEntryOrOpen!0 (select (arr!46470 a!2901) j!112) a!2901 mask!2840) (Found!10684 j!112)))))

(declare-fun b!1407075 () Bool)

(declare-fun res!944604 () Bool)

(assert (=> b!1407075 (=> (not res!944604) (not e!796526))))

(assert (=> b!1407075 (= res!944604 (validKeyInArray!0 (select (arr!46470 a!2901) j!112)))))

(assert (= (and start!121020 res!944605) b!1407072))

(assert (= (and b!1407072 res!944608) b!1407071))

(assert (= (and b!1407071 res!944601) b!1407075))

(assert (= (and b!1407075 res!944604) b!1407073))

(assert (= (and b!1407073 res!944602) b!1407069))

(assert (= (and b!1407069 res!944603) b!1407068))

(assert (= (and b!1407068 res!944607) b!1407074))

(assert (= (and b!1407068 (not res!944606)) b!1407070))

(declare-fun m!1296231 () Bool)

(assert (=> b!1407073 m!1296231))

(declare-fun m!1296233 () Bool)

(assert (=> b!1407069 m!1296233))

(declare-fun m!1296235 () Bool)

(assert (=> b!1407070 m!1296235))

(declare-fun m!1296237 () Bool)

(assert (=> b!1407070 m!1296237))

(assert (=> b!1407070 m!1296237))

(declare-fun m!1296239 () Bool)

(assert (=> b!1407070 m!1296239))

(assert (=> b!1407070 m!1296239))

(assert (=> b!1407070 m!1296237))

(declare-fun m!1296241 () Bool)

(assert (=> b!1407070 m!1296241))

(declare-fun m!1296243 () Bool)

(assert (=> b!1407074 m!1296243))

(assert (=> b!1407074 m!1296243))

(declare-fun m!1296245 () Bool)

(assert (=> b!1407074 m!1296245))

(assert (=> b!1407068 m!1296243))

(declare-fun m!1296247 () Bool)

(assert (=> b!1407068 m!1296247))

(assert (=> b!1407068 m!1296243))

(declare-fun m!1296249 () Bool)

(assert (=> b!1407068 m!1296249))

(assert (=> b!1407068 m!1296247))

(assert (=> b!1407068 m!1296243))

(declare-fun m!1296251 () Bool)

(assert (=> b!1407068 m!1296251))

(declare-fun m!1296253 () Bool)

(assert (=> b!1407068 m!1296253))

(declare-fun m!1296255 () Bool)

(assert (=> start!121020 m!1296255))

(declare-fun m!1296257 () Bool)

(assert (=> start!121020 m!1296257))

(assert (=> b!1407075 m!1296243))

(assert (=> b!1407075 m!1296243))

(declare-fun m!1296259 () Bool)

(assert (=> b!1407075 m!1296259))

(declare-fun m!1296261 () Bool)

(assert (=> b!1407071 m!1296261))

(assert (=> b!1407071 m!1296261))

(declare-fun m!1296263 () Bool)

(assert (=> b!1407071 m!1296263))

(push 1)

(assert (not b!1407075))

(assert (not start!121020))

(assert (not b!1407069))

(assert (not b!1407070))

(assert (not b!1407074))

(assert (not b!1407071))

(assert (not b!1407068))

(assert (not b!1407073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

