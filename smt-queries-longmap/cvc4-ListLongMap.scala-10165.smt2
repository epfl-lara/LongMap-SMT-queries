; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119812 () Bool)

(assert start!119812)

(declare-fun b!1395397 () Bool)

(declare-fun res!934644 () Bool)

(declare-fun e!789984 () Bool)

(assert (=> b!1395397 (=> (not res!934644) (not e!789984))))

(declare-datatypes ((array!95443 0))(
  ( (array!95444 (arr!46078 (Array (_ BitVec 32) (_ BitVec 64))) (size!46628 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95443)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395397 (= res!934644 (validKeyInArray!0 (select (arr!46078 a!2901) i!1037)))))

(declare-fun b!1395398 () Bool)

(declare-fun res!934643 () Bool)

(assert (=> b!1395398 (=> (not res!934643) (not e!789984))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95443 (_ BitVec 32)) Bool)

(assert (=> b!1395398 (= res!934643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395399 () Bool)

(declare-fun e!789985 () Bool)

(assert (=> b!1395399 (= e!789985 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1395400 () Bool)

(declare-fun e!789983 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10395 0))(
  ( (MissingZero!10395 (index!43951 (_ BitVec 32))) (Found!10395 (index!43952 (_ BitVec 32))) (Intermediate!10395 (undefined!11207 Bool) (index!43953 (_ BitVec 32)) (x!125613 (_ BitVec 32))) (Undefined!10395) (MissingVacant!10395 (index!43954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95443 (_ BitVec 32)) SeekEntryResult!10395)

(assert (=> b!1395400 (= e!789983 (= (seekEntryOrOpen!0 (select (arr!46078 a!2901) j!112) a!2901 mask!2840) (Found!10395 j!112)))))

(declare-fun b!1395401 () Bool)

(declare-fun res!934642 () Bool)

(assert (=> b!1395401 (=> res!934642 e!789985)))

(declare-fun lt!612971 () SeekEntryResult!10395)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95443 (_ BitVec 32)) SeekEntryResult!10395)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395401 (= res!934642 (= lt!612971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46078 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46078 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95444 (store (arr!46078 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46628 a!2901)) mask!2840)))))

(declare-fun res!934646 () Bool)

(assert (=> start!119812 (=> (not res!934646) (not e!789984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119812 (= res!934646 (validMask!0 mask!2840))))

(assert (=> start!119812 e!789984))

(assert (=> start!119812 true))

(declare-fun array_inv!35106 (array!95443) Bool)

(assert (=> start!119812 (array_inv!35106 a!2901)))

(declare-fun b!1395402 () Bool)

(assert (=> b!1395402 (= e!789984 (not e!789985))))

(declare-fun res!934647 () Bool)

(assert (=> b!1395402 (=> res!934647 e!789985)))

(assert (=> b!1395402 (= res!934647 (or (not (is-Intermediate!10395 lt!612971)) (undefined!11207 lt!612971)))))

(assert (=> b!1395402 e!789983))

(declare-fun res!934648 () Bool)

(assert (=> b!1395402 (=> (not res!934648) (not e!789983))))

(assert (=> b!1395402 (= res!934648 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46794 0))(
  ( (Unit!46795) )
))
(declare-fun lt!612972 () Unit!46794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46794)

(assert (=> b!1395402 (= lt!612972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395402 (= lt!612971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46078 a!2901) j!112) mask!2840) (select (arr!46078 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395403 () Bool)

(declare-fun res!934645 () Bool)

(assert (=> b!1395403 (=> (not res!934645) (not e!789984))))

(assert (=> b!1395403 (= res!934645 (validKeyInArray!0 (select (arr!46078 a!2901) j!112)))))

(declare-fun b!1395404 () Bool)

(declare-fun res!934640 () Bool)

(assert (=> b!1395404 (=> (not res!934640) (not e!789984))))

(assert (=> b!1395404 (= res!934640 (and (= (size!46628 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46628 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46628 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395405 () Bool)

(declare-fun res!934641 () Bool)

(assert (=> b!1395405 (=> (not res!934641) (not e!789984))))

(declare-datatypes ((List!32597 0))(
  ( (Nil!32594) (Cons!32593 (h!33829 (_ BitVec 64)) (t!47291 List!32597)) )
))
(declare-fun arrayNoDuplicates!0 (array!95443 (_ BitVec 32) List!32597) Bool)

(assert (=> b!1395405 (= res!934641 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32594))))

(assert (= (and start!119812 res!934646) b!1395404))

(assert (= (and b!1395404 res!934640) b!1395397))

(assert (= (and b!1395397 res!934644) b!1395403))

(assert (= (and b!1395403 res!934645) b!1395398))

(assert (= (and b!1395398 res!934643) b!1395405))

(assert (= (and b!1395405 res!934641) b!1395402))

(assert (= (and b!1395402 res!934648) b!1395400))

(assert (= (and b!1395402 (not res!934647)) b!1395401))

(assert (= (and b!1395401 (not res!934642)) b!1395399))

(declare-fun m!1281863 () Bool)

(assert (=> b!1395402 m!1281863))

(declare-fun m!1281865 () Bool)

(assert (=> b!1395402 m!1281865))

(assert (=> b!1395402 m!1281863))

(declare-fun m!1281867 () Bool)

(assert (=> b!1395402 m!1281867))

(assert (=> b!1395402 m!1281865))

(assert (=> b!1395402 m!1281863))

(declare-fun m!1281869 () Bool)

(assert (=> b!1395402 m!1281869))

(declare-fun m!1281871 () Bool)

(assert (=> b!1395402 m!1281871))

(assert (=> b!1395403 m!1281863))

(assert (=> b!1395403 m!1281863))

(declare-fun m!1281873 () Bool)

(assert (=> b!1395403 m!1281873))

(assert (=> b!1395400 m!1281863))

(assert (=> b!1395400 m!1281863))

(declare-fun m!1281875 () Bool)

(assert (=> b!1395400 m!1281875))

(declare-fun m!1281877 () Bool)

(assert (=> b!1395401 m!1281877))

(declare-fun m!1281879 () Bool)

(assert (=> b!1395401 m!1281879))

(assert (=> b!1395401 m!1281879))

(declare-fun m!1281881 () Bool)

(assert (=> b!1395401 m!1281881))

(assert (=> b!1395401 m!1281881))

(assert (=> b!1395401 m!1281879))

(declare-fun m!1281883 () Bool)

(assert (=> b!1395401 m!1281883))

(declare-fun m!1281885 () Bool)

(assert (=> b!1395405 m!1281885))

(declare-fun m!1281887 () Bool)

(assert (=> b!1395397 m!1281887))

(assert (=> b!1395397 m!1281887))

(declare-fun m!1281889 () Bool)

(assert (=> b!1395397 m!1281889))

(declare-fun m!1281891 () Bool)

(assert (=> start!119812 m!1281891))

(declare-fun m!1281893 () Bool)

(assert (=> start!119812 m!1281893))

(declare-fun m!1281895 () Bool)

(assert (=> b!1395398 m!1281895))

(push 1)

(assert (not b!1395400))

(assert (not b!1395402))

(assert (not b!1395397))

(assert (not start!119812))

(assert (not b!1395405))

