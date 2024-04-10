; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119804 () Bool)

(assert start!119804)

(declare-fun b!1395293 () Bool)

(declare-fun res!934542 () Bool)

(declare-fun e!789938 () Bool)

(assert (=> b!1395293 (=> (not res!934542) (not e!789938))))

(declare-datatypes ((array!95435 0))(
  ( (array!95436 (arr!46074 (Array (_ BitVec 32) (_ BitVec 64))) (size!46624 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95435)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395293 (= res!934542 (validKeyInArray!0 (select (arr!46074 a!2901) i!1037)))))

(declare-fun b!1395294 () Bool)

(declare-fun res!934541 () Bool)

(assert (=> b!1395294 (=> (not res!934541) (not e!789938))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395294 (= res!934541 (and (= (size!46624 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46624 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46624 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395295 () Bool)

(declare-fun res!934539 () Bool)

(assert (=> b!1395295 (=> (not res!934539) (not e!789938))))

(assert (=> b!1395295 (= res!934539 (validKeyInArray!0 (select (arr!46074 a!2901) j!112)))))

(declare-fun b!1395296 () Bool)

(declare-fun e!789936 () Bool)

(assert (=> b!1395296 (= e!789936 true)))

(declare-datatypes ((SeekEntryResult!10391 0))(
  ( (MissingZero!10391 (index!43935 (_ BitVec 32))) (Found!10391 (index!43936 (_ BitVec 32))) (Intermediate!10391 (undefined!11203 Bool) (index!43937 (_ BitVec 32)) (x!125601 (_ BitVec 32))) (Undefined!10391) (MissingVacant!10391 (index!43938 (_ BitVec 32))) )
))
(declare-fun lt!612943 () SeekEntryResult!10391)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95435 (_ BitVec 32)) SeekEntryResult!10391)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395296 (= lt!612943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46074 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46074 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95436 (store (arr!46074 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46624 a!2901)) mask!2840))))

(declare-fun b!1395297 () Bool)

(assert (=> b!1395297 (= e!789938 (not e!789936))))

(declare-fun res!934538 () Bool)

(assert (=> b!1395297 (=> res!934538 e!789936)))

(declare-fun lt!612944 () SeekEntryResult!10391)

(get-info :version)

(assert (=> b!1395297 (= res!934538 (or (not ((_ is Intermediate!10391) lt!612944)) (undefined!11203 lt!612944)))))

(declare-fun e!789937 () Bool)

(assert (=> b!1395297 e!789937))

(declare-fun res!934540 () Bool)

(assert (=> b!1395297 (=> (not res!934540) (not e!789937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95435 (_ BitVec 32)) Bool)

(assert (=> b!1395297 (= res!934540 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46786 0))(
  ( (Unit!46787) )
))
(declare-fun lt!612945 () Unit!46786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46786)

(assert (=> b!1395297 (= lt!612945 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395297 (= lt!612944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46074 a!2901) j!112) mask!2840) (select (arr!46074 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934543 () Bool)

(assert (=> start!119804 (=> (not res!934543) (not e!789938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119804 (= res!934543 (validMask!0 mask!2840))))

(assert (=> start!119804 e!789938))

(assert (=> start!119804 true))

(declare-fun array_inv!35102 (array!95435) Bool)

(assert (=> start!119804 (array_inv!35102 a!2901)))

(declare-fun b!1395298 () Bool)

(declare-fun res!934536 () Bool)

(assert (=> b!1395298 (=> (not res!934536) (not e!789938))))

(assert (=> b!1395298 (= res!934536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395299 () Bool)

(declare-fun res!934537 () Bool)

(assert (=> b!1395299 (=> (not res!934537) (not e!789938))))

(declare-datatypes ((List!32593 0))(
  ( (Nil!32590) (Cons!32589 (h!33825 (_ BitVec 64)) (t!47287 List!32593)) )
))
(declare-fun arrayNoDuplicates!0 (array!95435 (_ BitVec 32) List!32593) Bool)

(assert (=> b!1395299 (= res!934537 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32590))))

(declare-fun b!1395300 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95435 (_ BitVec 32)) SeekEntryResult!10391)

(assert (=> b!1395300 (= e!789937 (= (seekEntryOrOpen!0 (select (arr!46074 a!2901) j!112) a!2901 mask!2840) (Found!10391 j!112)))))

(assert (= (and start!119804 res!934543) b!1395294))

(assert (= (and b!1395294 res!934541) b!1395293))

(assert (= (and b!1395293 res!934542) b!1395295))

(assert (= (and b!1395295 res!934539) b!1395298))

(assert (= (and b!1395298 res!934536) b!1395299))

(assert (= (and b!1395299 res!934537) b!1395297))

(assert (= (and b!1395297 res!934540) b!1395300))

(assert (= (and b!1395297 (not res!934538)) b!1395296))

(declare-fun m!1281727 () Bool)

(assert (=> start!119804 m!1281727))

(declare-fun m!1281729 () Bool)

(assert (=> start!119804 m!1281729))

(declare-fun m!1281731 () Bool)

(assert (=> b!1395295 m!1281731))

(assert (=> b!1395295 m!1281731))

(declare-fun m!1281733 () Bool)

(assert (=> b!1395295 m!1281733))

(declare-fun m!1281735 () Bool)

(assert (=> b!1395293 m!1281735))

(assert (=> b!1395293 m!1281735))

(declare-fun m!1281737 () Bool)

(assert (=> b!1395293 m!1281737))

(declare-fun m!1281739 () Bool)

(assert (=> b!1395296 m!1281739))

(declare-fun m!1281741 () Bool)

(assert (=> b!1395296 m!1281741))

(assert (=> b!1395296 m!1281741))

(declare-fun m!1281743 () Bool)

(assert (=> b!1395296 m!1281743))

(assert (=> b!1395296 m!1281743))

(assert (=> b!1395296 m!1281741))

(declare-fun m!1281745 () Bool)

(assert (=> b!1395296 m!1281745))

(assert (=> b!1395300 m!1281731))

(assert (=> b!1395300 m!1281731))

(declare-fun m!1281747 () Bool)

(assert (=> b!1395300 m!1281747))

(declare-fun m!1281749 () Bool)

(assert (=> b!1395298 m!1281749))

(declare-fun m!1281751 () Bool)

(assert (=> b!1395299 m!1281751))

(assert (=> b!1395297 m!1281731))

(declare-fun m!1281753 () Bool)

(assert (=> b!1395297 m!1281753))

(assert (=> b!1395297 m!1281731))

(declare-fun m!1281755 () Bool)

(assert (=> b!1395297 m!1281755))

(assert (=> b!1395297 m!1281753))

(assert (=> b!1395297 m!1281731))

(declare-fun m!1281757 () Bool)

(assert (=> b!1395297 m!1281757))

(declare-fun m!1281759 () Bool)

(assert (=> b!1395297 m!1281759))

(check-sat (not b!1395297) (not start!119804) (not b!1395296) (not b!1395295) (not b!1395299) (not b!1395300) (not b!1395298) (not b!1395293))
(check-sat)
