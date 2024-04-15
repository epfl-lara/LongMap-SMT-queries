; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119682 () Bool)

(assert start!119682)

(declare-fun b!1394090 () Bool)

(declare-fun e!789347 () Bool)

(declare-fun e!789346 () Bool)

(assert (=> b!1394090 (= e!789347 (not e!789346))))

(declare-fun res!933553 () Bool)

(assert (=> b!1394090 (=> res!933553 e!789346)))

(declare-datatypes ((SeekEntryResult!10360 0))(
  ( (MissingZero!10360 (index!43811 (_ BitVec 32))) (Found!10360 (index!43812 (_ BitVec 32))) (Intermediate!10360 (undefined!11172 Bool) (index!43813 (_ BitVec 32)) (x!125473 (_ BitVec 32))) (Undefined!10360) (MissingVacant!10360 (index!43814 (_ BitVec 32))) )
))
(declare-fun lt!612075 () SeekEntryResult!10360)

(assert (=> b!1394090 (= res!933553 (or (not (is-Intermediate!10360 lt!612075)) (undefined!11172 lt!612075)))))

(declare-fun e!789344 () Bool)

(assert (=> b!1394090 e!789344))

(declare-fun res!933556 () Bool)

(assert (=> b!1394090 (=> (not res!933556) (not e!789344))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95317 0))(
  ( (array!95318 (arr!46017 (Array (_ BitVec 32) (_ BitVec 64))) (size!46569 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95317)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95317 (_ BitVec 32)) Bool)

(assert (=> b!1394090 (= res!933556 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46567 0))(
  ( (Unit!46568) )
))
(declare-fun lt!612077 () Unit!46567)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46567)

(assert (=> b!1394090 (= lt!612077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95317 (_ BitVec 32)) SeekEntryResult!10360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394090 (= lt!612075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46017 a!2901) j!112) mask!2840) (select (arr!46017 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394091 () Bool)

(declare-fun res!933552 () Bool)

(assert (=> b!1394091 (=> (not res!933552) (not e!789347))))

(declare-datatypes ((List!32614 0))(
  ( (Nil!32611) (Cons!32610 (h!33843 (_ BitVec 64)) (t!47300 List!32614)) )
))
(declare-fun arrayNoDuplicates!0 (array!95317 (_ BitVec 32) List!32614) Bool)

(assert (=> b!1394091 (= res!933552 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32611))))

(declare-fun b!1394092 () Bool)

(declare-fun res!933551 () Bool)

(assert (=> b!1394092 (=> (not res!933551) (not e!789347))))

(assert (=> b!1394092 (= res!933551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933554 () Bool)

(assert (=> start!119682 (=> (not res!933554) (not e!789347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119682 (= res!933554 (validMask!0 mask!2840))))

(assert (=> start!119682 e!789347))

(assert (=> start!119682 true))

(declare-fun array_inv!35250 (array!95317) Bool)

(assert (=> start!119682 (array_inv!35250 a!2901)))

(declare-fun b!1394093 () Bool)

(assert (=> b!1394093 (= e!789346 true)))

(declare-fun lt!612076 () SeekEntryResult!10360)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394093 (= lt!612076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46017 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46017 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95318 (store (arr!46017 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46569 a!2901)) mask!2840))))

(declare-fun b!1394094 () Bool)

(declare-fun res!933555 () Bool)

(assert (=> b!1394094 (=> (not res!933555) (not e!789347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394094 (= res!933555 (validKeyInArray!0 (select (arr!46017 a!2901) i!1037)))))

(declare-fun b!1394095 () Bool)

(declare-fun res!933550 () Bool)

(assert (=> b!1394095 (=> (not res!933550) (not e!789347))))

(assert (=> b!1394095 (= res!933550 (validKeyInArray!0 (select (arr!46017 a!2901) j!112)))))

(declare-fun b!1394096 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95317 (_ BitVec 32)) SeekEntryResult!10360)

(assert (=> b!1394096 (= e!789344 (= (seekEntryOrOpen!0 (select (arr!46017 a!2901) j!112) a!2901 mask!2840) (Found!10360 j!112)))))

(declare-fun b!1394097 () Bool)

(declare-fun res!933549 () Bool)

(assert (=> b!1394097 (=> (not res!933549) (not e!789347))))

(assert (=> b!1394097 (= res!933549 (and (= (size!46569 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46569 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46569 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119682 res!933554) b!1394097))

(assert (= (and b!1394097 res!933549) b!1394094))

(assert (= (and b!1394094 res!933555) b!1394095))

(assert (= (and b!1394095 res!933550) b!1394092))

(assert (= (and b!1394092 res!933551) b!1394091))

(assert (= (and b!1394091 res!933552) b!1394090))

(assert (= (and b!1394090 res!933556) b!1394096))

(assert (= (and b!1394090 (not res!933553)) b!1394093))

(declare-fun m!1279851 () Bool)

(assert (=> b!1394092 m!1279851))

(declare-fun m!1279853 () Bool)

(assert (=> b!1394095 m!1279853))

(assert (=> b!1394095 m!1279853))

(declare-fun m!1279855 () Bool)

(assert (=> b!1394095 m!1279855))

(declare-fun m!1279857 () Bool)

(assert (=> b!1394091 m!1279857))

(declare-fun m!1279859 () Bool)

(assert (=> start!119682 m!1279859))

(declare-fun m!1279861 () Bool)

(assert (=> start!119682 m!1279861))

(declare-fun m!1279863 () Bool)

(assert (=> b!1394093 m!1279863))

(declare-fun m!1279865 () Bool)

(assert (=> b!1394093 m!1279865))

(assert (=> b!1394093 m!1279865))

(declare-fun m!1279867 () Bool)

(assert (=> b!1394093 m!1279867))

(assert (=> b!1394093 m!1279867))

(assert (=> b!1394093 m!1279865))

(declare-fun m!1279869 () Bool)

(assert (=> b!1394093 m!1279869))

(assert (=> b!1394090 m!1279853))

(declare-fun m!1279871 () Bool)

(assert (=> b!1394090 m!1279871))

(assert (=> b!1394090 m!1279853))

(declare-fun m!1279873 () Bool)

(assert (=> b!1394090 m!1279873))

(assert (=> b!1394090 m!1279871))

(assert (=> b!1394090 m!1279853))

(declare-fun m!1279875 () Bool)

(assert (=> b!1394090 m!1279875))

(declare-fun m!1279877 () Bool)

(assert (=> b!1394090 m!1279877))

(declare-fun m!1279879 () Bool)

(assert (=> b!1394094 m!1279879))

(assert (=> b!1394094 m!1279879))

(declare-fun m!1279881 () Bool)

(assert (=> b!1394094 m!1279881))

(assert (=> b!1394096 m!1279853))

(assert (=> b!1394096 m!1279853))

(declare-fun m!1279883 () Bool)

(assert (=> b!1394096 m!1279883))

(push 1)

(assert (not b!1394092))

(assert (not b!1394095))

(assert (not start!119682))

(assert (not b!1394094))

(assert (not b!1394091))

(assert (not b!1394093))

(assert (not b!1394090))

(assert (not b!1394096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

