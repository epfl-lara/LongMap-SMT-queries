; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119680 () Bool)

(assert start!119680)

(declare-fun b!1394099 () Bool)

(declare-fun res!933507 () Bool)

(declare-fun e!789347 () Bool)

(assert (=> b!1394099 (=> (not res!933507) (not e!789347))))

(declare-datatypes ((array!95362 0))(
  ( (array!95363 (arr!46039 (Array (_ BitVec 32) (_ BitVec 64))) (size!46589 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95362)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394099 (= res!933507 (validKeyInArray!0 (select (arr!46039 a!2901) j!112)))))

(declare-fun res!933511 () Bool)

(assert (=> start!119680 (=> (not res!933511) (not e!789347))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119680 (= res!933511 (validMask!0 mask!2840))))

(assert (=> start!119680 e!789347))

(assert (=> start!119680 true))

(declare-fun array_inv!35067 (array!95362) Bool)

(assert (=> start!119680 (array_inv!35067 a!2901)))

(declare-fun b!1394100 () Bool)

(declare-fun res!933512 () Bool)

(assert (=> b!1394100 (=> (not res!933512) (not e!789347))))

(declare-datatypes ((List!32558 0))(
  ( (Nil!32555) (Cons!32554 (h!33787 (_ BitVec 64)) (t!47252 List!32558)) )
))
(declare-fun arrayNoDuplicates!0 (array!95362 (_ BitVec 32) List!32558) Bool)

(assert (=> b!1394100 (= res!933512 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32555))))

(declare-fun b!1394101 () Bool)

(declare-fun e!789350 () Bool)

(assert (=> b!1394101 (= e!789350 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10356 0))(
  ( (MissingZero!10356 (index!43795 (_ BitVec 32))) (Found!10356 (index!43796 (_ BitVec 32))) (Intermediate!10356 (undefined!11168 Bool) (index!43797 (_ BitVec 32)) (x!125464 (_ BitVec 32))) (Undefined!10356) (MissingVacant!10356 (index!43798 (_ BitVec 32))) )
))
(declare-fun lt!612240 () SeekEntryResult!10356)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95362 (_ BitVec 32)) SeekEntryResult!10356)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394101 (= lt!612240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95363 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46589 a!2901)) mask!2840))))

(declare-fun e!789349 () Bool)

(declare-fun b!1394102 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95362 (_ BitVec 32)) SeekEntryResult!10356)

(assert (=> b!1394102 (= e!789349 (= (seekEntryOrOpen!0 (select (arr!46039 a!2901) j!112) a!2901 mask!2840) (Found!10356 j!112)))))

(declare-fun b!1394103 () Bool)

(declare-fun res!933510 () Bool)

(assert (=> b!1394103 (=> (not res!933510) (not e!789347))))

(assert (=> b!1394103 (= res!933510 (validKeyInArray!0 (select (arr!46039 a!2901) i!1037)))))

(declare-fun b!1394104 () Bool)

(assert (=> b!1394104 (= e!789347 (not e!789350))))

(declare-fun res!933513 () Bool)

(assert (=> b!1394104 (=> res!933513 e!789350)))

(declare-fun lt!612238 () SeekEntryResult!10356)

(assert (=> b!1394104 (= res!933513 (or (not (is-Intermediate!10356 lt!612238)) (undefined!11168 lt!612238)))))

(assert (=> b!1394104 e!789349))

(declare-fun res!933509 () Bool)

(assert (=> b!1394104 (=> (not res!933509) (not e!789349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95362 (_ BitVec 32)) Bool)

(assert (=> b!1394104 (= res!933509 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46716 0))(
  ( (Unit!46717) )
))
(declare-fun lt!612239 () Unit!46716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46716)

(assert (=> b!1394104 (= lt!612239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394104 (= lt!612238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) (select (arr!46039 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394105 () Bool)

(declare-fun res!933514 () Bool)

(assert (=> b!1394105 (=> (not res!933514) (not e!789347))))

(assert (=> b!1394105 (= res!933514 (and (= (size!46589 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46589 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46589 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394106 () Bool)

(declare-fun res!933508 () Bool)

(assert (=> b!1394106 (=> (not res!933508) (not e!789347))))

(assert (=> b!1394106 (= res!933508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119680 res!933511) b!1394105))

(assert (= (and b!1394105 res!933514) b!1394103))

(assert (= (and b!1394103 res!933510) b!1394099))

(assert (= (and b!1394099 res!933507) b!1394106))

(assert (= (and b!1394106 res!933508) b!1394100))

(assert (= (and b!1394100 res!933512) b!1394104))

(assert (= (and b!1394104 res!933509) b!1394102))

(assert (= (and b!1394104 (not res!933513)) b!1394101))

(declare-fun m!1280285 () Bool)

(assert (=> b!1394099 m!1280285))

(assert (=> b!1394099 m!1280285))

(declare-fun m!1280287 () Bool)

(assert (=> b!1394099 m!1280287))

(assert (=> b!1394102 m!1280285))

(assert (=> b!1394102 m!1280285))

(declare-fun m!1280289 () Bool)

(assert (=> b!1394102 m!1280289))

(declare-fun m!1280291 () Bool)

(assert (=> b!1394106 m!1280291))

(declare-fun m!1280293 () Bool)

(assert (=> b!1394103 m!1280293))

(assert (=> b!1394103 m!1280293))

(declare-fun m!1280295 () Bool)

(assert (=> b!1394103 m!1280295))

(declare-fun m!1280297 () Bool)

(assert (=> b!1394100 m!1280297))

(assert (=> b!1394104 m!1280285))

(declare-fun m!1280299 () Bool)

(assert (=> b!1394104 m!1280299))

(assert (=> b!1394104 m!1280285))

(declare-fun m!1280301 () Bool)

(assert (=> b!1394104 m!1280301))

(assert (=> b!1394104 m!1280299))

(assert (=> b!1394104 m!1280285))

(declare-fun m!1280303 () Bool)

(assert (=> b!1394104 m!1280303))

(declare-fun m!1280305 () Bool)

(assert (=> b!1394104 m!1280305))

(declare-fun m!1280307 () Bool)

(assert (=> start!119680 m!1280307))

(declare-fun m!1280309 () Bool)

(assert (=> start!119680 m!1280309))

(declare-fun m!1280311 () Bool)

(assert (=> b!1394101 m!1280311))

(declare-fun m!1280313 () Bool)

(assert (=> b!1394101 m!1280313))

(assert (=> b!1394101 m!1280313))

(declare-fun m!1280315 () Bool)

(assert (=> b!1394101 m!1280315))

(assert (=> b!1394101 m!1280315))

(assert (=> b!1394101 m!1280313))

(declare-fun m!1280317 () Bool)

(assert (=> b!1394101 m!1280317))

(push 1)

(assert (not b!1394104))

(assert (not start!119680))

(assert (not b!1394100))

(assert (not b!1394099))

(assert (not b!1394106))

(assert (not b!1394102))

(assert (not b!1394101))

(assert (not b!1394103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

