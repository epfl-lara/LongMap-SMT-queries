; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119222 () Bool)

(assert start!119222)

(declare-fun b!1390294 () Bool)

(declare-fun res!929805 () Bool)

(declare-fun e!787649 () Bool)

(assert (=> b!1390294 (=> (not res!929805) (not e!787649))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95114 0))(
  ( (array!95115 (arr!45922 (Array (_ BitVec 32) (_ BitVec 64))) (size!46473 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95114)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390294 (= res!929805 (and (= (size!46473 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46473 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46473 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390295 () Bool)

(declare-fun res!929807 () Bool)

(assert (=> b!1390295 (=> (not res!929807) (not e!787649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390295 (= res!929807 (validKeyInArray!0 (select (arr!45922 a!2901) j!112)))))

(declare-fun b!1390296 () Bool)

(declare-fun res!929809 () Bool)

(assert (=> b!1390296 (=> (not res!929809) (not e!787649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95114 (_ BitVec 32)) Bool)

(assert (=> b!1390296 (= res!929809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390297 () Bool)

(assert (=> b!1390297 (= e!787649 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!610886 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390297 (= lt!610886 (toIndex!0 (select (arr!45922 a!2901) j!112) mask!2840))))

(declare-fun b!1390298 () Bool)

(declare-fun res!929804 () Bool)

(assert (=> b!1390298 (=> (not res!929804) (not e!787649))))

(declare-datatypes ((List!32428 0))(
  ( (Nil!32425) (Cons!32424 (h!33647 (_ BitVec 64)) (t!47114 List!32428)) )
))
(declare-fun arrayNoDuplicates!0 (array!95114 (_ BitVec 32) List!32428) Bool)

(assert (=> b!1390298 (= res!929804 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32425))))

(declare-fun res!929808 () Bool)

(assert (=> start!119222 (=> (not res!929808) (not e!787649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119222 (= res!929808 (validMask!0 mask!2840))))

(assert (=> start!119222 e!787649))

(assert (=> start!119222 true))

(declare-fun array_inv!35203 (array!95114) Bool)

(assert (=> start!119222 (array_inv!35203 a!2901)))

(declare-fun b!1390299 () Bool)

(declare-fun res!929806 () Bool)

(assert (=> b!1390299 (=> (not res!929806) (not e!787649))))

(assert (=> b!1390299 (= res!929806 (validKeyInArray!0 (select (arr!45922 a!2901) i!1037)))))

(assert (= (and start!119222 res!929808) b!1390294))

(assert (= (and b!1390294 res!929805) b!1390299))

(assert (= (and b!1390299 res!929806) b!1390295))

(assert (= (and b!1390295 res!929807) b!1390296))

(assert (= (and b!1390296 res!929809) b!1390298))

(assert (= (and b!1390298 res!929804) b!1390297))

(declare-fun m!1276201 () Bool)

(assert (=> b!1390295 m!1276201))

(assert (=> b!1390295 m!1276201))

(declare-fun m!1276203 () Bool)

(assert (=> b!1390295 m!1276203))

(declare-fun m!1276205 () Bool)

(assert (=> b!1390299 m!1276205))

(assert (=> b!1390299 m!1276205))

(declare-fun m!1276207 () Bool)

(assert (=> b!1390299 m!1276207))

(assert (=> b!1390297 m!1276201))

(assert (=> b!1390297 m!1276201))

(declare-fun m!1276209 () Bool)

(assert (=> b!1390297 m!1276209))

(declare-fun m!1276211 () Bool)

(assert (=> start!119222 m!1276211))

(declare-fun m!1276213 () Bool)

(assert (=> start!119222 m!1276213))

(declare-fun m!1276215 () Bool)

(assert (=> b!1390296 m!1276215))

(declare-fun m!1276217 () Bool)

(assert (=> b!1390298 m!1276217))

(check-sat (not b!1390299) (not b!1390297) (not b!1390298) (not b!1390296) (not start!119222) (not b!1390295))
(check-sat)
