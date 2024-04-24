; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119772 () Bool)

(assert start!119772)

(declare-fun b!1394087 () Bool)

(declare-fun res!932811 () Bool)

(declare-fun e!789509 () Bool)

(assert (=> b!1394087 (=> (not res!932811) (not e!789509))))

(declare-datatypes ((array!95376 0))(
  ( (array!95377 (arr!46044 (Array (_ BitVec 32) (_ BitVec 64))) (size!46595 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95376)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95376 (_ BitVec 32)) Bool)

(assert (=> b!1394087 (= res!932811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394088 () Bool)

(declare-fun res!932816 () Bool)

(assert (=> b!1394088 (=> (not res!932816) (not e!789509))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394088 (= res!932816 (validKeyInArray!0 (select (arr!46044 a!2901) j!112)))))

(declare-fun b!1394089 () Bool)

(declare-fun e!789510 () Bool)

(assert (=> b!1394089 (= e!789510 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10264 0))(
  ( (MissingZero!10264 (index!43427 (_ BitVec 32))) (Found!10264 (index!43428 (_ BitVec 32))) (Intermediate!10264 (undefined!11076 Bool) (index!43429 (_ BitVec 32)) (x!125263 (_ BitVec 32))) (Undefined!10264) (MissingVacant!10264 (index!43430 (_ BitVec 32))) )
))
(declare-fun lt!612206 () SeekEntryResult!10264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95376 (_ BitVec 32)) SeekEntryResult!10264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394089 (= lt!612206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46044 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46044 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95377 (store (arr!46044 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46595 a!2901)) mask!2840))))

(declare-fun res!932815 () Bool)

(assert (=> start!119772 (=> (not res!932815) (not e!789509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119772 (= res!932815 (validMask!0 mask!2840))))

(assert (=> start!119772 e!789509))

(assert (=> start!119772 true))

(declare-fun array_inv!35325 (array!95376) Bool)

(assert (=> start!119772 (array_inv!35325 a!2901)))

(declare-fun e!789511 () Bool)

(declare-fun b!1394090 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95376 (_ BitVec 32)) SeekEntryResult!10264)

(assert (=> b!1394090 (= e!789511 (= (seekEntryOrOpen!0 (select (arr!46044 a!2901) j!112) a!2901 mask!2840) (Found!10264 j!112)))))

(declare-fun b!1394091 () Bool)

(assert (=> b!1394091 (= e!789509 (not e!789510))))

(declare-fun res!932814 () Bool)

(assert (=> b!1394091 (=> res!932814 e!789510)))

(declare-fun lt!612205 () SeekEntryResult!10264)

(assert (=> b!1394091 (= res!932814 (or (not (is-Intermediate!10264 lt!612205)) (undefined!11076 lt!612205)))))

(assert (=> b!1394091 e!789511))

(declare-fun res!932818 () Bool)

(assert (=> b!1394091 (=> (not res!932818) (not e!789511))))

(assert (=> b!1394091 (= res!932818 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46559 0))(
  ( (Unit!46560) )
))
(declare-fun lt!612204 () Unit!46559)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46559)

(assert (=> b!1394091 (= lt!612204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394091 (= lt!612205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46044 a!2901) j!112) mask!2840) (select (arr!46044 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394092 () Bool)

(declare-fun res!932812 () Bool)

(assert (=> b!1394092 (=> (not res!932812) (not e!789509))))

(assert (=> b!1394092 (= res!932812 (and (= (size!46595 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46595 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46595 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394093 () Bool)

(declare-fun res!932813 () Bool)

(assert (=> b!1394093 (=> (not res!932813) (not e!789509))))

(assert (=> b!1394093 (= res!932813 (validKeyInArray!0 (select (arr!46044 a!2901) i!1037)))))

(declare-fun b!1394094 () Bool)

(declare-fun res!932817 () Bool)

(assert (=> b!1394094 (=> (not res!932817) (not e!789509))))

(declare-datatypes ((List!32550 0))(
  ( (Nil!32547) (Cons!32546 (h!33787 (_ BitVec 64)) (t!47236 List!32550)) )
))
(declare-fun arrayNoDuplicates!0 (array!95376 (_ BitVec 32) List!32550) Bool)

(assert (=> b!1394094 (= res!932817 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32547))))

(assert (= (and start!119772 res!932815) b!1394092))

(assert (= (and b!1394092 res!932812) b!1394093))

(assert (= (and b!1394093 res!932813) b!1394088))

(assert (= (and b!1394088 res!932816) b!1394087))

(assert (= (and b!1394087 res!932811) b!1394094))

(assert (= (and b!1394094 res!932817) b!1394091))

(assert (= (and b!1394091 res!932818) b!1394090))

(assert (= (and b!1394091 (not res!932814)) b!1394089))

(declare-fun m!1280025 () Bool)

(assert (=> b!1394089 m!1280025))

(declare-fun m!1280027 () Bool)

(assert (=> b!1394089 m!1280027))

(assert (=> b!1394089 m!1280027))

(declare-fun m!1280029 () Bool)

(assert (=> b!1394089 m!1280029))

(assert (=> b!1394089 m!1280029))

(assert (=> b!1394089 m!1280027))

(declare-fun m!1280031 () Bool)

(assert (=> b!1394089 m!1280031))

(declare-fun m!1280033 () Bool)

(assert (=> b!1394087 m!1280033))

(declare-fun m!1280035 () Bool)

(assert (=> b!1394090 m!1280035))

(assert (=> b!1394090 m!1280035))

(declare-fun m!1280037 () Bool)

(assert (=> b!1394090 m!1280037))

(declare-fun m!1280039 () Bool)

(assert (=> start!119772 m!1280039))

(declare-fun m!1280041 () Bool)

(assert (=> start!119772 m!1280041))

(declare-fun m!1280043 () Bool)

(assert (=> b!1394093 m!1280043))

(assert (=> b!1394093 m!1280043))

(declare-fun m!1280045 () Bool)

(assert (=> b!1394093 m!1280045))

(assert (=> b!1394091 m!1280035))

(declare-fun m!1280047 () Bool)

(assert (=> b!1394091 m!1280047))

(assert (=> b!1394091 m!1280035))

(declare-fun m!1280049 () Bool)

(assert (=> b!1394091 m!1280049))

(assert (=> b!1394091 m!1280047))

(assert (=> b!1394091 m!1280035))

(declare-fun m!1280051 () Bool)

(assert (=> b!1394091 m!1280051))

(declare-fun m!1280053 () Bool)

(assert (=> b!1394091 m!1280053))

(declare-fun m!1280055 () Bool)

(assert (=> b!1394094 m!1280055))

(assert (=> b!1394088 m!1280035))

(assert (=> b!1394088 m!1280035))

(declare-fun m!1280057 () Bool)

(assert (=> b!1394088 m!1280057))

(push 1)

(assert (not b!1394089))

(assert (not b!1394088))

(assert (not b!1394087))

(assert (not b!1394094))

(assert (not b!1394090))

(assert (not b!1394091))

(assert (not start!119772))

(assert (not b!1394093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

