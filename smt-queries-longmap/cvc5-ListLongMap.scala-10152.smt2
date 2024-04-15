; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119676 () Bool)

(assert start!119676)

(declare-fun b!1394018 () Bool)

(declare-fun res!933480 () Bool)

(declare-fun e!789309 () Bool)

(assert (=> b!1394018 (=> (not res!933480) (not e!789309))))

(declare-datatypes ((array!95311 0))(
  ( (array!95312 (arr!46014 (Array (_ BitVec 32) (_ BitVec 64))) (size!46566 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95311)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95311 (_ BitVec 32)) Bool)

(assert (=> b!1394018 (= res!933480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933483 () Bool)

(assert (=> start!119676 (=> (not res!933483) (not e!789309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119676 (= res!933483 (validMask!0 mask!2840))))

(assert (=> start!119676 e!789309))

(assert (=> start!119676 true))

(declare-fun array_inv!35247 (array!95311) Bool)

(assert (=> start!119676 (array_inv!35247 a!2901)))

(declare-fun b!1394019 () Bool)

(declare-fun e!789310 () Bool)

(assert (=> b!1394019 (= e!789309 (not e!789310))))

(declare-fun res!933477 () Bool)

(assert (=> b!1394019 (=> res!933477 e!789310)))

(declare-datatypes ((SeekEntryResult!10357 0))(
  ( (MissingZero!10357 (index!43799 (_ BitVec 32))) (Found!10357 (index!43800 (_ BitVec 32))) (Intermediate!10357 (undefined!11169 Bool) (index!43801 (_ BitVec 32)) (x!125462 (_ BitVec 32))) (Undefined!10357) (MissingVacant!10357 (index!43802 (_ BitVec 32))) )
))
(declare-fun lt!612048 () SeekEntryResult!10357)

(assert (=> b!1394019 (= res!933477 (or (not (is-Intermediate!10357 lt!612048)) (undefined!11169 lt!612048)))))

(declare-fun e!789308 () Bool)

(assert (=> b!1394019 e!789308))

(declare-fun res!933479 () Bool)

(assert (=> b!1394019 (=> (not res!933479) (not e!789308))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394019 (= res!933479 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46561 0))(
  ( (Unit!46562) )
))
(declare-fun lt!612050 () Unit!46561)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46561)

(assert (=> b!1394019 (= lt!612050 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95311 (_ BitVec 32)) SeekEntryResult!10357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394019 (= lt!612048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46014 a!2901) j!112) mask!2840) (select (arr!46014 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394020 () Bool)

(declare-fun res!933484 () Bool)

(assert (=> b!1394020 (=> (not res!933484) (not e!789309))))

(declare-datatypes ((List!32611 0))(
  ( (Nil!32608) (Cons!32607 (h!33840 (_ BitVec 64)) (t!47297 List!32611)) )
))
(declare-fun arrayNoDuplicates!0 (array!95311 (_ BitVec 32) List!32611) Bool)

(assert (=> b!1394020 (= res!933484 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32608))))

(declare-fun b!1394021 () Bool)

(declare-fun res!933478 () Bool)

(assert (=> b!1394021 (=> (not res!933478) (not e!789309))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394021 (= res!933478 (and (= (size!46566 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46566 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46566 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394022 () Bool)

(declare-fun res!933481 () Bool)

(assert (=> b!1394022 (=> (not res!933481) (not e!789309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394022 (= res!933481 (validKeyInArray!0 (select (arr!46014 a!2901) i!1037)))))

(declare-fun b!1394023 () Bool)

(declare-fun res!933482 () Bool)

(assert (=> b!1394023 (=> (not res!933482) (not e!789309))))

(assert (=> b!1394023 (= res!933482 (validKeyInArray!0 (select (arr!46014 a!2901) j!112)))))

(declare-fun b!1394024 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95311 (_ BitVec 32)) SeekEntryResult!10357)

(assert (=> b!1394024 (= e!789308 (= (seekEntryOrOpen!0 (select (arr!46014 a!2901) j!112) a!2901 mask!2840) (Found!10357 j!112)))))

(declare-fun b!1394025 () Bool)

(assert (=> b!1394025 (= e!789310 true)))

(declare-fun lt!612049 () SeekEntryResult!10357)

(assert (=> b!1394025 (= lt!612049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46014 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46014 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95312 (store (arr!46014 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46566 a!2901)) mask!2840))))

(assert (= (and start!119676 res!933483) b!1394021))

(assert (= (and b!1394021 res!933478) b!1394022))

(assert (= (and b!1394022 res!933481) b!1394023))

(assert (= (and b!1394023 res!933482) b!1394018))

(assert (= (and b!1394018 res!933480) b!1394020))

(assert (= (and b!1394020 res!933484) b!1394019))

(assert (= (and b!1394019 res!933479) b!1394024))

(assert (= (and b!1394019 (not res!933477)) b!1394025))

(declare-fun m!1279749 () Bool)

(assert (=> b!1394018 m!1279749))

(declare-fun m!1279751 () Bool)

(assert (=> b!1394024 m!1279751))

(assert (=> b!1394024 m!1279751))

(declare-fun m!1279753 () Bool)

(assert (=> b!1394024 m!1279753))

(declare-fun m!1279755 () Bool)

(assert (=> b!1394025 m!1279755))

(declare-fun m!1279757 () Bool)

(assert (=> b!1394025 m!1279757))

(assert (=> b!1394025 m!1279757))

(declare-fun m!1279759 () Bool)

(assert (=> b!1394025 m!1279759))

(assert (=> b!1394025 m!1279759))

(assert (=> b!1394025 m!1279757))

(declare-fun m!1279761 () Bool)

(assert (=> b!1394025 m!1279761))

(assert (=> b!1394019 m!1279751))

(declare-fun m!1279763 () Bool)

(assert (=> b!1394019 m!1279763))

(assert (=> b!1394019 m!1279751))

(declare-fun m!1279765 () Bool)

(assert (=> b!1394019 m!1279765))

(assert (=> b!1394019 m!1279763))

(assert (=> b!1394019 m!1279751))

(declare-fun m!1279767 () Bool)

(assert (=> b!1394019 m!1279767))

(declare-fun m!1279769 () Bool)

(assert (=> b!1394019 m!1279769))

(assert (=> b!1394023 m!1279751))

(assert (=> b!1394023 m!1279751))

(declare-fun m!1279771 () Bool)

(assert (=> b!1394023 m!1279771))

(declare-fun m!1279773 () Bool)

(assert (=> start!119676 m!1279773))

(declare-fun m!1279775 () Bool)

(assert (=> start!119676 m!1279775))

(declare-fun m!1279777 () Bool)

(assert (=> b!1394020 m!1279777))

(declare-fun m!1279779 () Bool)

(assert (=> b!1394022 m!1279779))

(assert (=> b!1394022 m!1279779))

(declare-fun m!1279781 () Bool)

(assert (=> b!1394022 m!1279781))

(push 1)

(assert (not b!1394022))

(assert (not b!1394020))

(assert (not b!1394019))

(assert (not b!1394018))

(assert (not b!1394024))

(assert (not start!119676))

(assert (not b!1394025))

(assert (not b!1394023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

