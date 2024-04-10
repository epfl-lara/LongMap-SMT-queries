; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119616 () Bool)

(assert start!119616)

(declare-fun b!1393331 () Bool)

(declare-fun res!932740 () Bool)

(declare-fun e!788964 () Bool)

(assert (=> b!1393331 (=> (not res!932740) (not e!788964))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95298 0))(
  ( (array!95299 (arr!46007 (Array (_ BitVec 32) (_ BitVec 64))) (size!46557 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95298)

(assert (=> b!1393331 (= res!932740 (and (= (size!46557 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46557 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46557 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393332 () Bool)

(declare-fun e!788963 () Bool)

(assert (=> b!1393332 (= e!788964 (not e!788963))))

(declare-fun res!932741 () Bool)

(assert (=> b!1393332 (=> res!932741 e!788963)))

(declare-datatypes ((SeekEntryResult!10324 0))(
  ( (MissingZero!10324 (index!43667 (_ BitVec 32))) (Found!10324 (index!43668 (_ BitVec 32))) (Intermediate!10324 (undefined!11136 Bool) (index!43669 (_ BitVec 32)) (x!125352 (_ BitVec 32))) (Undefined!10324) (MissingVacant!10324 (index!43670 (_ BitVec 32))) )
))
(declare-fun lt!611950 () SeekEntryResult!10324)

(assert (=> b!1393332 (= res!932741 (or (not (is-Intermediate!10324 lt!611950)) (undefined!11136 lt!611950)))))

(declare-fun e!788966 () Bool)

(assert (=> b!1393332 e!788966))

(declare-fun res!932746 () Bool)

(assert (=> b!1393332 (=> (not res!932746) (not e!788966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95298 (_ BitVec 32)) Bool)

(assert (=> b!1393332 (= res!932746 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46652 0))(
  ( (Unit!46653) )
))
(declare-fun lt!611951 () Unit!46652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46652)

(assert (=> b!1393332 (= lt!611951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95298 (_ BitVec 32)) SeekEntryResult!10324)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393332 (= lt!611950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46007 a!2901) j!112) mask!2840) (select (arr!46007 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393333 () Bool)

(declare-fun res!932742 () Bool)

(assert (=> b!1393333 (=> (not res!932742) (not e!788964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393333 (= res!932742 (validKeyInArray!0 (select (arr!46007 a!2901) i!1037)))))

(declare-fun b!1393334 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95298 (_ BitVec 32)) SeekEntryResult!10324)

(assert (=> b!1393334 (= e!788966 (= (seekEntryOrOpen!0 (select (arr!46007 a!2901) j!112) a!2901 mask!2840) (Found!10324 j!112)))))

(declare-fun b!1393335 () Bool)

(declare-fun res!932744 () Bool)

(assert (=> b!1393335 (=> (not res!932744) (not e!788964))))

(assert (=> b!1393335 (= res!932744 (validKeyInArray!0 (select (arr!46007 a!2901) j!112)))))

(declare-fun b!1393336 () Bool)

(declare-fun res!932739 () Bool)

(assert (=> b!1393336 (=> (not res!932739) (not e!788964))))

(assert (=> b!1393336 (= res!932739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!932745 () Bool)

(assert (=> start!119616 (=> (not res!932745) (not e!788964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119616 (= res!932745 (validMask!0 mask!2840))))

(assert (=> start!119616 e!788964))

(assert (=> start!119616 true))

(declare-fun array_inv!35035 (array!95298) Bool)

(assert (=> start!119616 (array_inv!35035 a!2901)))

(declare-fun b!1393337 () Bool)

(assert (=> b!1393337 (= e!788963 true)))

(declare-fun lt!611952 () SeekEntryResult!10324)

(assert (=> b!1393337 (= lt!611952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46007 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46007 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95299 (store (arr!46007 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46557 a!2901)) mask!2840))))

(declare-fun b!1393338 () Bool)

(declare-fun res!932743 () Bool)

(assert (=> b!1393338 (=> (not res!932743) (not e!788964))))

(declare-datatypes ((List!32526 0))(
  ( (Nil!32523) (Cons!32522 (h!33755 (_ BitVec 64)) (t!47220 List!32526)) )
))
(declare-fun arrayNoDuplicates!0 (array!95298 (_ BitVec 32) List!32526) Bool)

(assert (=> b!1393338 (= res!932743 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32523))))

(assert (= (and start!119616 res!932745) b!1393331))

(assert (= (and b!1393331 res!932740) b!1393333))

(assert (= (and b!1393333 res!932742) b!1393335))

(assert (= (and b!1393335 res!932744) b!1393336))

(assert (= (and b!1393336 res!932739) b!1393338))

(assert (= (and b!1393338 res!932743) b!1393332))

(assert (= (and b!1393332 res!932746) b!1393334))

(assert (= (and b!1393332 (not res!932741)) b!1393337))

(declare-fun m!1279197 () Bool)

(assert (=> b!1393336 m!1279197))

(declare-fun m!1279199 () Bool)

(assert (=> b!1393338 m!1279199))

(declare-fun m!1279201 () Bool)

(assert (=> b!1393332 m!1279201))

(declare-fun m!1279203 () Bool)

(assert (=> b!1393332 m!1279203))

(assert (=> b!1393332 m!1279201))

(declare-fun m!1279205 () Bool)

(assert (=> b!1393332 m!1279205))

(assert (=> b!1393332 m!1279203))

(assert (=> b!1393332 m!1279201))

(declare-fun m!1279207 () Bool)

(assert (=> b!1393332 m!1279207))

(declare-fun m!1279209 () Bool)

(assert (=> b!1393332 m!1279209))

(declare-fun m!1279211 () Bool)

(assert (=> b!1393337 m!1279211))

(declare-fun m!1279213 () Bool)

(assert (=> b!1393337 m!1279213))

(assert (=> b!1393337 m!1279213))

(declare-fun m!1279215 () Bool)

(assert (=> b!1393337 m!1279215))

(assert (=> b!1393337 m!1279215))

(assert (=> b!1393337 m!1279213))

(declare-fun m!1279217 () Bool)

(assert (=> b!1393337 m!1279217))

(assert (=> b!1393335 m!1279201))

(assert (=> b!1393335 m!1279201))

(declare-fun m!1279219 () Bool)

(assert (=> b!1393335 m!1279219))

(declare-fun m!1279221 () Bool)

(assert (=> b!1393333 m!1279221))

(assert (=> b!1393333 m!1279221))

(declare-fun m!1279223 () Bool)

(assert (=> b!1393333 m!1279223))

(assert (=> b!1393334 m!1279201))

(assert (=> b!1393334 m!1279201))

(declare-fun m!1279225 () Bool)

(assert (=> b!1393334 m!1279225))

(declare-fun m!1279227 () Bool)

(assert (=> start!119616 m!1279227))

(declare-fun m!1279229 () Bool)

(assert (=> start!119616 m!1279229))

(push 1)

(assert (not b!1393337))

(assert (not b!1393334))

(assert (not b!1393335))

(assert (not b!1393332))

(assert (not b!1393336))

(assert (not b!1393338))

(assert (not b!1393333))

(assert (not start!119616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

