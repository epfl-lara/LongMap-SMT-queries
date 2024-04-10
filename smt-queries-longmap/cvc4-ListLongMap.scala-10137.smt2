; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119590 () Bool)

(assert start!119590)

(declare-fun b!1393019 () Bool)

(declare-fun e!788807 () Bool)

(declare-fun e!788808 () Bool)

(assert (=> b!1393019 (= e!788807 (not e!788808))))

(declare-fun res!932430 () Bool)

(assert (=> b!1393019 (=> res!932430 e!788808)))

(declare-datatypes ((SeekEntryResult!10311 0))(
  ( (MissingZero!10311 (index!43615 (_ BitVec 32))) (Found!10311 (index!43616 (_ BitVec 32))) (Intermediate!10311 (undefined!11123 Bool) (index!43617 (_ BitVec 32)) (x!125299 (_ BitVec 32))) (Undefined!10311) (MissingVacant!10311 (index!43618 (_ BitVec 32))) )
))
(declare-fun lt!611834 () SeekEntryResult!10311)

(assert (=> b!1393019 (= res!932430 (or (not (is-Intermediate!10311 lt!611834)) (undefined!11123 lt!611834)))))

(declare-fun e!788810 () Bool)

(assert (=> b!1393019 e!788810))

(declare-fun res!932431 () Bool)

(assert (=> b!1393019 (=> (not res!932431) (not e!788810))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95272 0))(
  ( (array!95273 (arr!45994 (Array (_ BitVec 32) (_ BitVec 64))) (size!46544 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95272)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95272 (_ BitVec 32)) Bool)

(assert (=> b!1393019 (= res!932431 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46626 0))(
  ( (Unit!46627) )
))
(declare-fun lt!611835 () Unit!46626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46626)

(assert (=> b!1393019 (= lt!611835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95272 (_ BitVec 32)) SeekEntryResult!10311)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393019 (= lt!611834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45994 a!2901) j!112) mask!2840) (select (arr!45994 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932428 () Bool)

(assert (=> start!119590 (=> (not res!932428) (not e!788807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119590 (= res!932428 (validMask!0 mask!2840))))

(assert (=> start!119590 e!788807))

(assert (=> start!119590 true))

(declare-fun array_inv!35022 (array!95272) Bool)

(assert (=> start!119590 (array_inv!35022 a!2901)))

(declare-fun b!1393020 () Bool)

(declare-fun res!932434 () Bool)

(assert (=> b!1393020 (=> (not res!932434) (not e!788807))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393020 (= res!932434 (and (= (size!46544 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46544 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46544 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393021 () Bool)

(declare-fun res!932429 () Bool)

(assert (=> b!1393021 (=> (not res!932429) (not e!788807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393021 (= res!932429 (validKeyInArray!0 (select (arr!45994 a!2901) j!112)))))

(declare-fun b!1393022 () Bool)

(declare-fun res!932427 () Bool)

(assert (=> b!1393022 (=> (not res!932427) (not e!788807))))

(declare-datatypes ((List!32513 0))(
  ( (Nil!32510) (Cons!32509 (h!33742 (_ BitVec 64)) (t!47207 List!32513)) )
))
(declare-fun arrayNoDuplicates!0 (array!95272 (_ BitVec 32) List!32513) Bool)

(assert (=> b!1393022 (= res!932427 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32510))))

(declare-fun b!1393023 () Bool)

(declare-fun res!932433 () Bool)

(assert (=> b!1393023 (=> (not res!932433) (not e!788807))))

(assert (=> b!1393023 (= res!932433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393024 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95272 (_ BitVec 32)) SeekEntryResult!10311)

(assert (=> b!1393024 (= e!788810 (= (seekEntryOrOpen!0 (select (arr!45994 a!2901) j!112) a!2901 mask!2840) (Found!10311 j!112)))))

(declare-fun b!1393025 () Bool)

(declare-fun res!932432 () Bool)

(assert (=> b!1393025 (=> (not res!932432) (not e!788807))))

(assert (=> b!1393025 (= res!932432 (validKeyInArray!0 (select (arr!45994 a!2901) i!1037)))))

(declare-fun b!1393026 () Bool)

(assert (=> b!1393026 (= e!788808 true)))

(declare-fun lt!611833 () SeekEntryResult!10311)

(assert (=> b!1393026 (= lt!611833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45994 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45994 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95273 (store (arr!45994 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46544 a!2901)) mask!2840))))

(assert (= (and start!119590 res!932428) b!1393020))

(assert (= (and b!1393020 res!932434) b!1393025))

(assert (= (and b!1393025 res!932432) b!1393021))

(assert (= (and b!1393021 res!932429) b!1393023))

(assert (= (and b!1393023 res!932433) b!1393022))

(assert (= (and b!1393022 res!932427) b!1393019))

(assert (= (and b!1393019 res!932431) b!1393024))

(assert (= (and b!1393019 (not res!932430)) b!1393026))

(declare-fun m!1278755 () Bool)

(assert (=> b!1393024 m!1278755))

(assert (=> b!1393024 m!1278755))

(declare-fun m!1278757 () Bool)

(assert (=> b!1393024 m!1278757))

(assert (=> b!1393021 m!1278755))

(assert (=> b!1393021 m!1278755))

(declare-fun m!1278759 () Bool)

(assert (=> b!1393021 m!1278759))

(assert (=> b!1393019 m!1278755))

(declare-fun m!1278761 () Bool)

(assert (=> b!1393019 m!1278761))

(assert (=> b!1393019 m!1278755))

(declare-fun m!1278763 () Bool)

(assert (=> b!1393019 m!1278763))

(assert (=> b!1393019 m!1278761))

(assert (=> b!1393019 m!1278755))

(declare-fun m!1278765 () Bool)

(assert (=> b!1393019 m!1278765))

(declare-fun m!1278767 () Bool)

(assert (=> b!1393019 m!1278767))

(declare-fun m!1278769 () Bool)

(assert (=> start!119590 m!1278769))

(declare-fun m!1278771 () Bool)

(assert (=> start!119590 m!1278771))

(declare-fun m!1278773 () Bool)

(assert (=> b!1393025 m!1278773))

(assert (=> b!1393025 m!1278773))

(declare-fun m!1278775 () Bool)

(assert (=> b!1393025 m!1278775))

(declare-fun m!1278777 () Bool)

(assert (=> b!1393022 m!1278777))

(declare-fun m!1278779 () Bool)

(assert (=> b!1393026 m!1278779))

(declare-fun m!1278781 () Bool)

(assert (=> b!1393026 m!1278781))

(assert (=> b!1393026 m!1278781))

(declare-fun m!1278783 () Bool)

(assert (=> b!1393026 m!1278783))

(assert (=> b!1393026 m!1278783))

(assert (=> b!1393026 m!1278781))

(declare-fun m!1278785 () Bool)

(assert (=> b!1393026 m!1278785))

(declare-fun m!1278787 () Bool)

(assert (=> b!1393023 m!1278787))

(push 1)

(assert (not b!1393021))

(assert (not b!1393023))

(assert (not b!1393025))

(assert (not b!1393024))

(assert (not b!1393022))

(assert (not b!1393019))

(assert (not start!119590))

(assert (not b!1393026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

