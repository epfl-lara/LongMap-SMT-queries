; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119656 () Bool)

(assert start!119656)

(declare-fun res!933225 () Bool)

(declare-fun e!789204 () Bool)

(assert (=> start!119656 (=> (not res!933225) (not e!789204))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119656 (= res!933225 (validMask!0 mask!2840))))

(assert (=> start!119656 e!789204))

(assert (=> start!119656 true))

(declare-datatypes ((array!95338 0))(
  ( (array!95339 (arr!46027 (Array (_ BitVec 32) (_ BitVec 64))) (size!46577 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95338)

(declare-fun array_inv!35055 (array!95338) Bool)

(assert (=> start!119656 (array_inv!35055 a!2901)))

(declare-fun b!1393811 () Bool)

(declare-fun res!933221 () Bool)

(assert (=> b!1393811 (=> (not res!933221) (not e!789204))))

(declare-datatypes ((List!32546 0))(
  ( (Nil!32543) (Cons!32542 (h!33775 (_ BitVec 64)) (t!47240 List!32546)) )
))
(declare-fun arrayNoDuplicates!0 (array!95338 (_ BitVec 32) List!32546) Bool)

(assert (=> b!1393811 (= res!933221 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32543))))

(declare-fun b!1393812 () Bool)

(declare-fun res!933226 () Bool)

(assert (=> b!1393812 (=> (not res!933226) (not e!789204))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393812 (= res!933226 (validKeyInArray!0 (select (arr!46027 a!2901) j!112)))))

(declare-fun b!1393813 () Bool)

(declare-fun res!933223 () Bool)

(assert (=> b!1393813 (=> (not res!933223) (not e!789204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95338 (_ BitVec 32)) Bool)

(assert (=> b!1393813 (= res!933223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393814 () Bool)

(declare-fun res!933222 () Bool)

(assert (=> b!1393814 (=> (not res!933222) (not e!789204))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393814 (= res!933222 (validKeyInArray!0 (select (arr!46027 a!2901) i!1037)))))

(declare-fun b!1393815 () Bool)

(declare-fun res!933220 () Bool)

(assert (=> b!1393815 (=> (not res!933220) (not e!789204))))

(assert (=> b!1393815 (= res!933220 (and (= (size!46577 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46577 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46577 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!789205 () Bool)

(declare-fun b!1393816 () Bool)

(declare-datatypes ((SeekEntryResult!10344 0))(
  ( (MissingZero!10344 (index!43747 (_ BitVec 32))) (Found!10344 (index!43748 (_ BitVec 32))) (Intermediate!10344 (undefined!11156 Bool) (index!43749 (_ BitVec 32)) (x!125420 (_ BitVec 32))) (Undefined!10344) (MissingVacant!10344 (index!43750 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95338 (_ BitVec 32)) SeekEntryResult!10344)

(assert (=> b!1393816 (= e!789205 (= (seekEntryOrOpen!0 (select (arr!46027 a!2901) j!112) a!2901 mask!2840) (Found!10344 j!112)))))

(declare-fun b!1393817 () Bool)

(declare-fun e!789203 () Bool)

(assert (=> b!1393817 (= e!789203 true)))

(declare-fun lt!612130 () SeekEntryResult!10344)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95338 (_ BitVec 32)) SeekEntryResult!10344)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393817 (= lt!612130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95339 (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46577 a!2901)) mask!2840))))

(declare-fun b!1393818 () Bool)

(assert (=> b!1393818 (= e!789204 (not e!789203))))

(declare-fun res!933219 () Bool)

(assert (=> b!1393818 (=> res!933219 e!789203)))

(declare-fun lt!612131 () SeekEntryResult!10344)

(assert (=> b!1393818 (= res!933219 (or (not (is-Intermediate!10344 lt!612131)) (undefined!11156 lt!612131)))))

(assert (=> b!1393818 e!789205))

(declare-fun res!933224 () Bool)

(assert (=> b!1393818 (=> (not res!933224) (not e!789205))))

(assert (=> b!1393818 (= res!933224 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46692 0))(
  ( (Unit!46693) )
))
(declare-fun lt!612132 () Unit!46692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46692)

(assert (=> b!1393818 (= lt!612132 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393818 (= lt!612131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840) (select (arr!46027 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119656 res!933225) b!1393815))

(assert (= (and b!1393815 res!933220) b!1393814))

(assert (= (and b!1393814 res!933222) b!1393812))

(assert (= (and b!1393812 res!933226) b!1393813))

(assert (= (and b!1393813 res!933223) b!1393811))

(assert (= (and b!1393811 res!933221) b!1393818))

(assert (= (and b!1393818 res!933224) b!1393816))

(assert (= (and b!1393818 (not res!933219)) b!1393817))

(declare-fun m!1279877 () Bool)

(assert (=> b!1393813 m!1279877))

(declare-fun m!1279879 () Bool)

(assert (=> b!1393818 m!1279879))

(declare-fun m!1279881 () Bool)

(assert (=> b!1393818 m!1279881))

(assert (=> b!1393818 m!1279879))

(declare-fun m!1279883 () Bool)

(assert (=> b!1393818 m!1279883))

(assert (=> b!1393818 m!1279881))

(assert (=> b!1393818 m!1279879))

(declare-fun m!1279885 () Bool)

(assert (=> b!1393818 m!1279885))

(declare-fun m!1279887 () Bool)

(assert (=> b!1393818 m!1279887))

(assert (=> b!1393816 m!1279879))

(assert (=> b!1393816 m!1279879))

(declare-fun m!1279889 () Bool)

(assert (=> b!1393816 m!1279889))

(declare-fun m!1279891 () Bool)

(assert (=> b!1393814 m!1279891))

(assert (=> b!1393814 m!1279891))

(declare-fun m!1279893 () Bool)

(assert (=> b!1393814 m!1279893))

(assert (=> b!1393812 m!1279879))

(assert (=> b!1393812 m!1279879))

(declare-fun m!1279895 () Bool)

(assert (=> b!1393812 m!1279895))

(declare-fun m!1279897 () Bool)

(assert (=> start!119656 m!1279897))

(declare-fun m!1279899 () Bool)

(assert (=> start!119656 m!1279899))

(declare-fun m!1279901 () Bool)

(assert (=> b!1393811 m!1279901))

(declare-fun m!1279903 () Bool)

(assert (=> b!1393817 m!1279903))

(declare-fun m!1279905 () Bool)

(assert (=> b!1393817 m!1279905))

(assert (=> b!1393817 m!1279905))

(declare-fun m!1279907 () Bool)

(assert (=> b!1393817 m!1279907))

(assert (=> b!1393817 m!1279907))

(assert (=> b!1393817 m!1279905))

(declare-fun m!1279909 () Bool)

(assert (=> b!1393817 m!1279909))

(push 1)

(assert (not start!119656))

(assert (not b!1393811))

(assert (not b!1393817))

(assert (not b!1393812))

(assert (not b!1393816))

(assert (not b!1393813))

(assert (not b!1393814))

(assert (not b!1393818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

