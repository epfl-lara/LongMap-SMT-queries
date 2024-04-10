; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119668 () Bool)

(assert start!119668)

(declare-fun b!1393955 () Bool)

(declare-fun res!933364 () Bool)

(declare-fun e!789275 () Bool)

(assert (=> b!1393955 (=> (not res!933364) (not e!789275))))

(declare-datatypes ((array!95350 0))(
  ( (array!95351 (arr!46033 (Array (_ BitVec 32) (_ BitVec 64))) (size!46583 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95350)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393955 (= res!933364 (validKeyInArray!0 (select (arr!46033 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!789276 () Bool)

(declare-fun b!1393956 () Bool)

(declare-datatypes ((SeekEntryResult!10350 0))(
  ( (MissingZero!10350 (index!43771 (_ BitVec 32))) (Found!10350 (index!43772 (_ BitVec 32))) (Intermediate!10350 (undefined!11162 Bool) (index!43773 (_ BitVec 32)) (x!125442 (_ BitVec 32))) (Undefined!10350) (MissingVacant!10350 (index!43774 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95350 (_ BitVec 32)) SeekEntryResult!10350)

(assert (=> b!1393956 (= e!789276 (= (seekEntryOrOpen!0 (select (arr!46033 a!2901) j!112) a!2901 mask!2840) (Found!10350 j!112)))))

(declare-fun b!1393957 () Bool)

(declare-fun res!933368 () Bool)

(assert (=> b!1393957 (=> (not res!933368) (not e!789275))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393957 (= res!933368 (validKeyInArray!0 (select (arr!46033 a!2901) i!1037)))))

(declare-fun b!1393958 () Bool)

(declare-fun e!789278 () Bool)

(assert (=> b!1393958 (= e!789275 (not e!789278))))

(declare-fun res!933367 () Bool)

(assert (=> b!1393958 (=> res!933367 e!789278)))

(declare-fun lt!612186 () SeekEntryResult!10350)

(assert (=> b!1393958 (= res!933367 (or (not (is-Intermediate!10350 lt!612186)) (undefined!11162 lt!612186)))))

(assert (=> b!1393958 e!789276))

(declare-fun res!933365 () Bool)

(assert (=> b!1393958 (=> (not res!933365) (not e!789276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95350 (_ BitVec 32)) Bool)

(assert (=> b!1393958 (= res!933365 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46704 0))(
  ( (Unit!46705) )
))
(declare-fun lt!612185 () Unit!46704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46704)

(assert (=> b!1393958 (= lt!612185 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95350 (_ BitVec 32)) SeekEntryResult!10350)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393958 (= lt!612186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46033 a!2901) j!112) mask!2840) (select (arr!46033 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393959 () Bool)

(declare-fun res!933366 () Bool)

(assert (=> b!1393959 (=> (not res!933366) (not e!789275))))

(assert (=> b!1393959 (= res!933366 (and (= (size!46583 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46583 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46583 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393960 () Bool)

(declare-fun res!933363 () Bool)

(assert (=> b!1393960 (=> (not res!933363) (not e!789275))))

(assert (=> b!1393960 (= res!933363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393962 () Bool)

(declare-fun res!933369 () Bool)

(assert (=> b!1393962 (=> (not res!933369) (not e!789275))))

(declare-datatypes ((List!32552 0))(
  ( (Nil!32549) (Cons!32548 (h!33781 (_ BitVec 64)) (t!47246 List!32552)) )
))
(declare-fun arrayNoDuplicates!0 (array!95350 (_ BitVec 32) List!32552) Bool)

(assert (=> b!1393962 (= res!933369 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32549))))

(declare-fun b!1393961 () Bool)

(assert (=> b!1393961 (= e!789278 true)))

(declare-fun lt!612184 () SeekEntryResult!10350)

(assert (=> b!1393961 (= lt!612184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46033 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46033 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95351 (store (arr!46033 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46583 a!2901)) mask!2840))))

(declare-fun res!933370 () Bool)

(assert (=> start!119668 (=> (not res!933370) (not e!789275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119668 (= res!933370 (validMask!0 mask!2840))))

(assert (=> start!119668 e!789275))

(assert (=> start!119668 true))

(declare-fun array_inv!35061 (array!95350) Bool)

(assert (=> start!119668 (array_inv!35061 a!2901)))

(assert (= (and start!119668 res!933370) b!1393959))

(assert (= (and b!1393959 res!933366) b!1393957))

(assert (= (and b!1393957 res!933368) b!1393955))

(assert (= (and b!1393955 res!933364) b!1393960))

(assert (= (and b!1393960 res!933363) b!1393962))

(assert (= (and b!1393962 res!933369) b!1393958))

(assert (= (and b!1393958 res!933365) b!1393956))

(assert (= (and b!1393958 (not res!933367)) b!1393961))

(declare-fun m!1280081 () Bool)

(assert (=> b!1393956 m!1280081))

(assert (=> b!1393956 m!1280081))

(declare-fun m!1280083 () Bool)

(assert (=> b!1393956 m!1280083))

(declare-fun m!1280085 () Bool)

(assert (=> start!119668 m!1280085))

(declare-fun m!1280087 () Bool)

(assert (=> start!119668 m!1280087))

(declare-fun m!1280089 () Bool)

(assert (=> b!1393960 m!1280089))

(assert (=> b!1393955 m!1280081))

(assert (=> b!1393955 m!1280081))

(declare-fun m!1280091 () Bool)

(assert (=> b!1393955 m!1280091))

(declare-fun m!1280093 () Bool)

(assert (=> b!1393961 m!1280093))

(declare-fun m!1280095 () Bool)

(assert (=> b!1393961 m!1280095))

(assert (=> b!1393961 m!1280095))

(declare-fun m!1280097 () Bool)

(assert (=> b!1393961 m!1280097))

(assert (=> b!1393961 m!1280097))

(assert (=> b!1393961 m!1280095))

(declare-fun m!1280099 () Bool)

(assert (=> b!1393961 m!1280099))

(assert (=> b!1393958 m!1280081))

(declare-fun m!1280101 () Bool)

(assert (=> b!1393958 m!1280101))

(assert (=> b!1393958 m!1280081))

(declare-fun m!1280103 () Bool)

(assert (=> b!1393958 m!1280103))

(assert (=> b!1393958 m!1280101))

(assert (=> b!1393958 m!1280081))

(declare-fun m!1280105 () Bool)

(assert (=> b!1393958 m!1280105))

(declare-fun m!1280107 () Bool)

(assert (=> b!1393958 m!1280107))

(declare-fun m!1280109 () Bool)

(assert (=> b!1393957 m!1280109))

(assert (=> b!1393957 m!1280109))

(declare-fun m!1280111 () Bool)

(assert (=> b!1393957 m!1280111))

(declare-fun m!1280113 () Bool)

(assert (=> b!1393962 m!1280113))

(push 1)

(assert (not b!1393958))

(assert (not b!1393956))

(assert (not b!1393962))

(assert (not start!119668))

(assert (not b!1393955))

(assert (not b!1393961))

(assert (not b!1393960))

(assert (not b!1393957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

