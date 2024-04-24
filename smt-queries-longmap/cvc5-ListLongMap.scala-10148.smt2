; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119844 () Bool)

(assert start!119844)

(declare-fun b!1394951 () Bool)

(declare-fun e!789942 () Bool)

(assert (=> b!1394951 (= e!789942 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95448 0))(
  ( (array!95449 (arr!46080 (Array (_ BitVec 32) (_ BitVec 64))) (size!46631 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95448)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10300 0))(
  ( (MissingZero!10300 (index!43571 (_ BitVec 32))) (Found!10300 (index!43572 (_ BitVec 32))) (Intermediate!10300 (undefined!11112 Bool) (index!43573 (_ BitVec 32)) (x!125395 (_ BitVec 32))) (Undefined!10300) (MissingVacant!10300 (index!43574 (_ BitVec 32))) )
))
(declare-fun lt!612529 () SeekEntryResult!10300)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95448 (_ BitVec 32)) SeekEntryResult!10300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394951 (= lt!612529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46080 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46080 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95449 (store (arr!46080 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46631 a!2901)) mask!2840))))

(declare-fun b!1394952 () Bool)

(declare-fun res!933682 () Bool)

(declare-fun e!789943 () Bool)

(assert (=> b!1394952 (=> (not res!933682) (not e!789943))))

(assert (=> b!1394952 (= res!933682 (and (= (size!46631 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46631 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46631 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394953 () Bool)

(declare-fun res!933680 () Bool)

(assert (=> b!1394953 (=> (not res!933680) (not e!789943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394953 (= res!933680 (validKeyInArray!0 (select (arr!46080 a!2901) j!112)))))

(declare-fun res!933681 () Bool)

(assert (=> start!119844 (=> (not res!933681) (not e!789943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119844 (= res!933681 (validMask!0 mask!2840))))

(assert (=> start!119844 e!789943))

(assert (=> start!119844 true))

(declare-fun array_inv!35361 (array!95448) Bool)

(assert (=> start!119844 (array_inv!35361 a!2901)))

(declare-fun b!1394954 () Bool)

(assert (=> b!1394954 (= e!789943 (not e!789942))))

(declare-fun res!933676 () Bool)

(assert (=> b!1394954 (=> res!933676 e!789942)))

(declare-fun lt!612530 () SeekEntryResult!10300)

(assert (=> b!1394954 (= res!933676 (or (not (is-Intermediate!10300 lt!612530)) (undefined!11112 lt!612530)))))

(declare-fun e!789941 () Bool)

(assert (=> b!1394954 e!789941))

(declare-fun res!933677 () Bool)

(assert (=> b!1394954 (=> (not res!933677) (not e!789941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95448 (_ BitVec 32)) Bool)

(assert (=> b!1394954 (= res!933677 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46631 0))(
  ( (Unit!46632) )
))
(declare-fun lt!612528 () Unit!46631)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46631)

(assert (=> b!1394954 (= lt!612528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394954 (= lt!612530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46080 a!2901) j!112) mask!2840) (select (arr!46080 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394955 () Bool)

(declare-fun res!933679 () Bool)

(assert (=> b!1394955 (=> (not res!933679) (not e!789943))))

(declare-datatypes ((List!32586 0))(
  ( (Nil!32583) (Cons!32582 (h!33823 (_ BitVec 64)) (t!47272 List!32586)) )
))
(declare-fun arrayNoDuplicates!0 (array!95448 (_ BitVec 32) List!32586) Bool)

(assert (=> b!1394955 (= res!933679 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32583))))

(declare-fun b!1394956 () Bool)

(declare-fun res!933678 () Bool)

(assert (=> b!1394956 (=> (not res!933678) (not e!789943))))

(assert (=> b!1394956 (= res!933678 (validKeyInArray!0 (select (arr!46080 a!2901) i!1037)))))

(declare-fun b!1394957 () Bool)

(declare-fun res!933675 () Bool)

(assert (=> b!1394957 (=> (not res!933675) (not e!789943))))

(assert (=> b!1394957 (= res!933675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394958 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95448 (_ BitVec 32)) SeekEntryResult!10300)

(assert (=> b!1394958 (= e!789941 (= (seekEntryOrOpen!0 (select (arr!46080 a!2901) j!112) a!2901 mask!2840) (Found!10300 j!112)))))

(assert (= (and start!119844 res!933681) b!1394952))

(assert (= (and b!1394952 res!933682) b!1394956))

(assert (= (and b!1394956 res!933678) b!1394953))

(assert (= (and b!1394953 res!933680) b!1394957))

(assert (= (and b!1394957 res!933675) b!1394955))

(assert (= (and b!1394955 res!933679) b!1394954))

(assert (= (and b!1394954 res!933677) b!1394958))

(assert (= (and b!1394954 (not res!933676)) b!1394951))

(declare-fun m!1281249 () Bool)

(assert (=> b!1394955 m!1281249))

(declare-fun m!1281251 () Bool)

(assert (=> start!119844 m!1281251))

(declare-fun m!1281253 () Bool)

(assert (=> start!119844 m!1281253))

(declare-fun m!1281255 () Bool)

(assert (=> b!1394957 m!1281255))

(declare-fun m!1281257 () Bool)

(assert (=> b!1394951 m!1281257))

(declare-fun m!1281259 () Bool)

(assert (=> b!1394951 m!1281259))

(assert (=> b!1394951 m!1281259))

(declare-fun m!1281261 () Bool)

(assert (=> b!1394951 m!1281261))

(assert (=> b!1394951 m!1281261))

(assert (=> b!1394951 m!1281259))

(declare-fun m!1281263 () Bool)

(assert (=> b!1394951 m!1281263))

(declare-fun m!1281265 () Bool)

(assert (=> b!1394956 m!1281265))

(assert (=> b!1394956 m!1281265))

(declare-fun m!1281267 () Bool)

(assert (=> b!1394956 m!1281267))

(declare-fun m!1281269 () Bool)

(assert (=> b!1394953 m!1281269))

(assert (=> b!1394953 m!1281269))

(declare-fun m!1281271 () Bool)

(assert (=> b!1394953 m!1281271))

(assert (=> b!1394958 m!1281269))

(assert (=> b!1394958 m!1281269))

(declare-fun m!1281273 () Bool)

(assert (=> b!1394958 m!1281273))

(assert (=> b!1394954 m!1281269))

(declare-fun m!1281275 () Bool)

(assert (=> b!1394954 m!1281275))

(assert (=> b!1394954 m!1281269))

(declare-fun m!1281277 () Bool)

(assert (=> b!1394954 m!1281277))

(assert (=> b!1394954 m!1281275))

(assert (=> b!1394954 m!1281269))

(declare-fun m!1281279 () Bool)

(assert (=> b!1394954 m!1281279))

(declare-fun m!1281281 () Bool)

(assert (=> b!1394954 m!1281281))

(push 1)

(assert (not b!1394951))

(assert (not b!1394954))

(assert (not b!1394953))

(assert (not b!1394956))

(assert (not b!1394958))

(assert (not b!1394955))

(assert (not start!119844))

(assert (not b!1394957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

