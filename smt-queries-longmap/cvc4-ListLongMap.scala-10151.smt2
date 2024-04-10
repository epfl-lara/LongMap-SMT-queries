; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119674 () Bool)

(assert start!119674)

(declare-fun b!1394027 () Bool)

(declare-fun res!933436 () Bool)

(declare-fun e!789313 () Bool)

(assert (=> b!1394027 (=> (not res!933436) (not e!789313))))

(declare-datatypes ((array!95356 0))(
  ( (array!95357 (arr!46036 (Array (_ BitVec 32) (_ BitVec 64))) (size!46586 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95356)

(declare-datatypes ((List!32555 0))(
  ( (Nil!32552) (Cons!32551 (h!33784 (_ BitVec 64)) (t!47249 List!32555)) )
))
(declare-fun arrayNoDuplicates!0 (array!95356 (_ BitVec 32) List!32555) Bool)

(assert (=> b!1394027 (= res!933436 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32552))))

(declare-fun b!1394028 () Bool)

(declare-fun res!933441 () Bool)

(assert (=> b!1394028 (=> (not res!933441) (not e!789313))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394028 (= res!933441 (and (= (size!46586 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46586 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46586 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394029 () Bool)

(declare-fun res!933440 () Bool)

(assert (=> b!1394029 (=> (not res!933440) (not e!789313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95356 (_ BitVec 32)) Bool)

(assert (=> b!1394029 (= res!933440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394030 () Bool)

(declare-fun res!933437 () Bool)

(assert (=> b!1394030 (=> (not res!933437) (not e!789313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394030 (= res!933437 (validKeyInArray!0 (select (arr!46036 a!2901) j!112)))))

(declare-fun res!933439 () Bool)

(assert (=> start!119674 (=> (not res!933439) (not e!789313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119674 (= res!933439 (validMask!0 mask!2840))))

(assert (=> start!119674 e!789313))

(assert (=> start!119674 true))

(declare-fun array_inv!35064 (array!95356) Bool)

(assert (=> start!119674 (array_inv!35064 a!2901)))

(declare-fun b!1394031 () Bool)

(declare-fun e!789312 () Bool)

(assert (=> b!1394031 (= e!789312 true)))

(declare-datatypes ((SeekEntryResult!10353 0))(
  ( (MissingZero!10353 (index!43783 (_ BitVec 32))) (Found!10353 (index!43784 (_ BitVec 32))) (Intermediate!10353 (undefined!11165 Bool) (index!43785 (_ BitVec 32)) (x!125453 (_ BitVec 32))) (Undefined!10353) (MissingVacant!10353 (index!43786 (_ BitVec 32))) )
))
(declare-fun lt!612211 () SeekEntryResult!10353)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95356 (_ BitVec 32)) SeekEntryResult!10353)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394031 (= lt!612211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95357 (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46586 a!2901)) mask!2840))))

(declare-fun b!1394032 () Bool)

(declare-fun e!789314 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95356 (_ BitVec 32)) SeekEntryResult!10353)

(assert (=> b!1394032 (= e!789314 (= (seekEntryOrOpen!0 (select (arr!46036 a!2901) j!112) a!2901 mask!2840) (Found!10353 j!112)))))

(declare-fun b!1394033 () Bool)

(declare-fun res!933438 () Bool)

(assert (=> b!1394033 (=> (not res!933438) (not e!789313))))

(assert (=> b!1394033 (= res!933438 (validKeyInArray!0 (select (arr!46036 a!2901) i!1037)))))

(declare-fun b!1394034 () Bool)

(assert (=> b!1394034 (= e!789313 (not e!789312))))

(declare-fun res!933442 () Bool)

(assert (=> b!1394034 (=> res!933442 e!789312)))

(declare-fun lt!612213 () SeekEntryResult!10353)

(assert (=> b!1394034 (= res!933442 (or (not (is-Intermediate!10353 lt!612213)) (undefined!11165 lt!612213)))))

(assert (=> b!1394034 e!789314))

(declare-fun res!933435 () Bool)

(assert (=> b!1394034 (=> (not res!933435) (not e!789314))))

(assert (=> b!1394034 (= res!933435 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46710 0))(
  ( (Unit!46711) )
))
(declare-fun lt!612212 () Unit!46710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46710)

(assert (=> b!1394034 (= lt!612212 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394034 (= lt!612213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46036 a!2901) j!112) mask!2840) (select (arr!46036 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119674 res!933439) b!1394028))

(assert (= (and b!1394028 res!933441) b!1394033))

(assert (= (and b!1394033 res!933438) b!1394030))

(assert (= (and b!1394030 res!933437) b!1394029))

(assert (= (and b!1394029 res!933440) b!1394027))

(assert (= (and b!1394027 res!933436) b!1394034))

(assert (= (and b!1394034 res!933435) b!1394032))

(assert (= (and b!1394034 (not res!933442)) b!1394031))

(declare-fun m!1280183 () Bool)

(assert (=> b!1394032 m!1280183))

(assert (=> b!1394032 m!1280183))

(declare-fun m!1280185 () Bool)

(assert (=> b!1394032 m!1280185))

(declare-fun m!1280187 () Bool)

(assert (=> b!1394031 m!1280187))

(declare-fun m!1280189 () Bool)

(assert (=> b!1394031 m!1280189))

(assert (=> b!1394031 m!1280189))

(declare-fun m!1280191 () Bool)

(assert (=> b!1394031 m!1280191))

(assert (=> b!1394031 m!1280191))

(assert (=> b!1394031 m!1280189))

(declare-fun m!1280193 () Bool)

(assert (=> b!1394031 m!1280193))

(assert (=> b!1394034 m!1280183))

(declare-fun m!1280195 () Bool)

(assert (=> b!1394034 m!1280195))

(assert (=> b!1394034 m!1280183))

(declare-fun m!1280197 () Bool)

(assert (=> b!1394034 m!1280197))

(assert (=> b!1394034 m!1280195))

(assert (=> b!1394034 m!1280183))

(declare-fun m!1280199 () Bool)

(assert (=> b!1394034 m!1280199))

(declare-fun m!1280201 () Bool)

(assert (=> b!1394034 m!1280201))

(declare-fun m!1280203 () Bool)

(assert (=> b!1394029 m!1280203))

(declare-fun m!1280205 () Bool)

(assert (=> b!1394033 m!1280205))

(assert (=> b!1394033 m!1280205))

(declare-fun m!1280207 () Bool)

(assert (=> b!1394033 m!1280207))

(declare-fun m!1280209 () Bool)

(assert (=> start!119674 m!1280209))

(declare-fun m!1280211 () Bool)

(assert (=> start!119674 m!1280211))

(assert (=> b!1394030 m!1280183))

(assert (=> b!1394030 m!1280183))

(declare-fun m!1280213 () Bool)

(assert (=> b!1394030 m!1280213))

(declare-fun m!1280215 () Bool)

(assert (=> b!1394027 m!1280215))

(push 1)

(assert (not b!1394031))

(assert (not b!1394029))

(assert (not b!1394027))

(assert (not b!1394032))

(assert (not b!1394033))

(assert (not b!1394034))

(assert (not b!1394030))

(assert (not start!119674))

(check-sat)

(pop 1)

(push 1)

