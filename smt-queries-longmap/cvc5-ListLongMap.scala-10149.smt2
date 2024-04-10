; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119658 () Bool)

(assert start!119658)

(declare-fun b!1393835 () Bool)

(declare-fun res!933247 () Bool)

(declare-fun e!789217 () Bool)

(assert (=> b!1393835 (=> (not res!933247) (not e!789217))))

(declare-datatypes ((array!95340 0))(
  ( (array!95341 (arr!46028 (Array (_ BitVec 32) (_ BitVec 64))) (size!46578 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95340)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393835 (= res!933247 (validKeyInArray!0 (select (arr!46028 a!2901) i!1037)))))

(declare-fun res!933246 () Bool)

(assert (=> start!119658 (=> (not res!933246) (not e!789217))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119658 (= res!933246 (validMask!0 mask!2840))))

(assert (=> start!119658 e!789217))

(assert (=> start!119658 true))

(declare-fun array_inv!35056 (array!95340) Bool)

(assert (=> start!119658 (array_inv!35056 a!2901)))

(declare-fun b!1393836 () Bool)

(declare-fun e!789216 () Bool)

(assert (=> b!1393836 (= e!789216 true)))

(declare-datatypes ((SeekEntryResult!10345 0))(
  ( (MissingZero!10345 (index!43751 (_ BitVec 32))) (Found!10345 (index!43752 (_ BitVec 32))) (Intermediate!10345 (undefined!11157 Bool) (index!43753 (_ BitVec 32)) (x!125429 (_ BitVec 32))) (Undefined!10345) (MissingVacant!10345 (index!43754 (_ BitVec 32))) )
))
(declare-fun lt!612139 () SeekEntryResult!10345)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95340 (_ BitVec 32)) SeekEntryResult!10345)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393836 (= lt!612139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46028 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46028 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95341 (store (arr!46028 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46578 a!2901)) mask!2840))))

(declare-fun b!1393837 () Bool)

(declare-fun res!933250 () Bool)

(assert (=> b!1393837 (=> (not res!933250) (not e!789217))))

(assert (=> b!1393837 (= res!933250 (and (= (size!46578 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46578 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46578 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393838 () Bool)

(assert (=> b!1393838 (= e!789217 (not e!789216))))

(declare-fun res!933244 () Bool)

(assert (=> b!1393838 (=> res!933244 e!789216)))

(declare-fun lt!612141 () SeekEntryResult!10345)

(assert (=> b!1393838 (= res!933244 (or (not (is-Intermediate!10345 lt!612141)) (undefined!11157 lt!612141)))))

(declare-fun e!789215 () Bool)

(assert (=> b!1393838 e!789215))

(declare-fun res!933249 () Bool)

(assert (=> b!1393838 (=> (not res!933249) (not e!789215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95340 (_ BitVec 32)) Bool)

(assert (=> b!1393838 (= res!933249 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46694 0))(
  ( (Unit!46695) )
))
(declare-fun lt!612140 () Unit!46694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46694)

(assert (=> b!1393838 (= lt!612140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393838 (= lt!612141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46028 a!2901) j!112) mask!2840) (select (arr!46028 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393839 () Bool)

(declare-fun res!933248 () Bool)

(assert (=> b!1393839 (=> (not res!933248) (not e!789217))))

(assert (=> b!1393839 (= res!933248 (validKeyInArray!0 (select (arr!46028 a!2901) j!112)))))

(declare-fun b!1393840 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95340 (_ BitVec 32)) SeekEntryResult!10345)

(assert (=> b!1393840 (= e!789215 (= (seekEntryOrOpen!0 (select (arr!46028 a!2901) j!112) a!2901 mask!2840) (Found!10345 j!112)))))

(declare-fun b!1393841 () Bool)

(declare-fun res!933243 () Bool)

(assert (=> b!1393841 (=> (not res!933243) (not e!789217))))

(assert (=> b!1393841 (= res!933243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393842 () Bool)

(declare-fun res!933245 () Bool)

(assert (=> b!1393842 (=> (not res!933245) (not e!789217))))

(declare-datatypes ((List!32547 0))(
  ( (Nil!32544) (Cons!32543 (h!33776 (_ BitVec 64)) (t!47241 List!32547)) )
))
(declare-fun arrayNoDuplicates!0 (array!95340 (_ BitVec 32) List!32547) Bool)

(assert (=> b!1393842 (= res!933245 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32544))))

(assert (= (and start!119658 res!933246) b!1393837))

(assert (= (and b!1393837 res!933250) b!1393835))

(assert (= (and b!1393835 res!933247) b!1393839))

(assert (= (and b!1393839 res!933248) b!1393841))

(assert (= (and b!1393841 res!933243) b!1393842))

(assert (= (and b!1393842 res!933245) b!1393838))

(assert (= (and b!1393838 res!933249) b!1393840))

(assert (= (and b!1393838 (not res!933244)) b!1393836))

(declare-fun m!1279911 () Bool)

(assert (=> b!1393838 m!1279911))

(declare-fun m!1279913 () Bool)

(assert (=> b!1393838 m!1279913))

(assert (=> b!1393838 m!1279911))

(declare-fun m!1279915 () Bool)

(assert (=> b!1393838 m!1279915))

(assert (=> b!1393838 m!1279913))

(assert (=> b!1393838 m!1279911))

(declare-fun m!1279917 () Bool)

(assert (=> b!1393838 m!1279917))

(declare-fun m!1279919 () Bool)

(assert (=> b!1393838 m!1279919))

(declare-fun m!1279921 () Bool)

(assert (=> b!1393835 m!1279921))

(assert (=> b!1393835 m!1279921))

(declare-fun m!1279923 () Bool)

(assert (=> b!1393835 m!1279923))

(declare-fun m!1279925 () Bool)

(assert (=> b!1393836 m!1279925))

(declare-fun m!1279927 () Bool)

(assert (=> b!1393836 m!1279927))

(assert (=> b!1393836 m!1279927))

(declare-fun m!1279929 () Bool)

(assert (=> b!1393836 m!1279929))

(assert (=> b!1393836 m!1279929))

(assert (=> b!1393836 m!1279927))

(declare-fun m!1279931 () Bool)

(assert (=> b!1393836 m!1279931))

(declare-fun m!1279933 () Bool)

(assert (=> b!1393841 m!1279933))

(assert (=> b!1393840 m!1279911))

(assert (=> b!1393840 m!1279911))

(declare-fun m!1279935 () Bool)

(assert (=> b!1393840 m!1279935))

(declare-fun m!1279937 () Bool)

(assert (=> start!119658 m!1279937))

(declare-fun m!1279939 () Bool)

(assert (=> start!119658 m!1279939))

(assert (=> b!1393839 m!1279911))

(assert (=> b!1393839 m!1279911))

(declare-fun m!1279941 () Bool)

(assert (=> b!1393839 m!1279941))

(declare-fun m!1279943 () Bool)

(assert (=> b!1393842 m!1279943))

(push 1)

(assert (not start!119658))

(assert (not b!1393836))

(assert (not b!1393835))

(assert (not b!1393840))

(assert (not b!1393839))

(assert (not b!1393841))

(assert (not b!1393842))

(assert (not b!1393838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

