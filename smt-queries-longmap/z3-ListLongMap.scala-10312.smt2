; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121196 () Bool)

(assert start!121196)

(declare-fun b!1409198 () Bool)

(declare-fun e!797477 () Bool)

(declare-fun e!797476 () Bool)

(assert (=> b!1409198 (= e!797477 (not e!797476))))

(declare-fun res!946922 () Bool)

(assert (=> b!1409198 (=> res!946922 e!797476)))

(declare-datatypes ((SeekEntryResult!10829 0))(
  ( (MissingZero!10829 (index!45693 (_ BitVec 32))) (Found!10829 (index!45694 (_ BitVec 32))) (Intermediate!10829 (undefined!11641 Bool) (index!45695 (_ BitVec 32)) (x!127286 (_ BitVec 32))) (Undefined!10829) (MissingVacant!10829 (index!45696 (_ BitVec 32))) )
))
(declare-fun lt!620633 () SeekEntryResult!10829)

(get-info :version)

(assert (=> b!1409198 (= res!946922 (or (not ((_ is Intermediate!10829) lt!620633)) (undefined!11641 lt!620633)))))

(declare-fun e!797475 () Bool)

(assert (=> b!1409198 e!797475))

(declare-fun res!946920 () Bool)

(assert (=> b!1409198 (=> (not res!946920) (not e!797475))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96350 0))(
  ( (array!96351 (arr!46518 (Array (_ BitVec 32) (_ BitVec 64))) (size!47068 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96350)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96350 (_ BitVec 32)) Bool)

(assert (=> b!1409198 (= res!946920 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47632 0))(
  ( (Unit!47633) )
))
(declare-fun lt!620632 () Unit!47632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47632)

(assert (=> b!1409198 (= lt!620632 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96350 (_ BitVec 32)) SeekEntryResult!10829)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409198 (= lt!620633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46518 a!2901) j!112) mask!2840) (select (arr!46518 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409199 () Bool)

(assert (=> b!1409199 (= e!797476 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620634 () SeekEntryResult!10829)

(assert (=> b!1409199 (= lt!620634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46518 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46518 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96351 (store (arr!46518 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47068 a!2901)) mask!2840))))

(declare-fun b!1409200 () Bool)

(declare-fun res!946923 () Bool)

(assert (=> b!1409200 (=> (not res!946923) (not e!797477))))

(declare-datatypes ((List!33037 0))(
  ( (Nil!33034) (Cons!33033 (h!34296 (_ BitVec 64)) (t!47731 List!33037)) )
))
(declare-fun arrayNoDuplicates!0 (array!96350 (_ BitVec 32) List!33037) Bool)

(assert (=> b!1409200 (= res!946923 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33034))))

(declare-fun b!1409201 () Bool)

(declare-fun res!946925 () Bool)

(assert (=> b!1409201 (=> (not res!946925) (not e!797477))))

(assert (=> b!1409201 (= res!946925 (and (= (size!47068 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47068 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47068 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!946921 () Bool)

(assert (=> start!121196 (=> (not res!946921) (not e!797477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121196 (= res!946921 (validMask!0 mask!2840))))

(assert (=> start!121196 e!797477))

(assert (=> start!121196 true))

(declare-fun array_inv!35546 (array!96350) Bool)

(assert (=> start!121196 (array_inv!35546 a!2901)))

(declare-fun b!1409202 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96350 (_ BitVec 32)) SeekEntryResult!10829)

(assert (=> b!1409202 (= e!797475 (= (seekEntryOrOpen!0 (select (arr!46518 a!2901) j!112) a!2901 mask!2840) (Found!10829 j!112)))))

(declare-fun b!1409203 () Bool)

(declare-fun res!946924 () Bool)

(assert (=> b!1409203 (=> (not res!946924) (not e!797477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409203 (= res!946924 (validKeyInArray!0 (select (arr!46518 a!2901) j!112)))))

(declare-fun b!1409204 () Bool)

(declare-fun res!946927 () Bool)

(assert (=> b!1409204 (=> (not res!946927) (not e!797477))))

(assert (=> b!1409204 (= res!946927 (validKeyInArray!0 (select (arr!46518 a!2901) i!1037)))))

(declare-fun b!1409205 () Bool)

(declare-fun res!946926 () Bool)

(assert (=> b!1409205 (=> (not res!946926) (not e!797477))))

(assert (=> b!1409205 (= res!946926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121196 res!946921) b!1409201))

(assert (= (and b!1409201 res!946925) b!1409204))

(assert (= (and b!1409204 res!946927) b!1409203))

(assert (= (and b!1409203 res!946924) b!1409205))

(assert (= (and b!1409205 res!946926) b!1409200))

(assert (= (and b!1409200 res!946923) b!1409198))

(assert (= (and b!1409198 res!946920) b!1409202))

(assert (= (and b!1409198 (not res!946922)) b!1409199))

(declare-fun m!1298815 () Bool)

(assert (=> b!1409202 m!1298815))

(assert (=> b!1409202 m!1298815))

(declare-fun m!1298817 () Bool)

(assert (=> b!1409202 m!1298817))

(declare-fun m!1298819 () Bool)

(assert (=> b!1409205 m!1298819))

(declare-fun m!1298821 () Bool)

(assert (=> start!121196 m!1298821))

(declare-fun m!1298823 () Bool)

(assert (=> start!121196 m!1298823))

(assert (=> b!1409198 m!1298815))

(declare-fun m!1298825 () Bool)

(assert (=> b!1409198 m!1298825))

(assert (=> b!1409198 m!1298815))

(declare-fun m!1298827 () Bool)

(assert (=> b!1409198 m!1298827))

(assert (=> b!1409198 m!1298825))

(assert (=> b!1409198 m!1298815))

(declare-fun m!1298829 () Bool)

(assert (=> b!1409198 m!1298829))

(declare-fun m!1298831 () Bool)

(assert (=> b!1409198 m!1298831))

(declare-fun m!1298833 () Bool)

(assert (=> b!1409204 m!1298833))

(assert (=> b!1409204 m!1298833))

(declare-fun m!1298835 () Bool)

(assert (=> b!1409204 m!1298835))

(declare-fun m!1298837 () Bool)

(assert (=> b!1409200 m!1298837))

(assert (=> b!1409203 m!1298815))

(assert (=> b!1409203 m!1298815))

(declare-fun m!1298839 () Bool)

(assert (=> b!1409203 m!1298839))

(declare-fun m!1298841 () Bool)

(assert (=> b!1409199 m!1298841))

(declare-fun m!1298843 () Bool)

(assert (=> b!1409199 m!1298843))

(assert (=> b!1409199 m!1298843))

(declare-fun m!1298845 () Bool)

(assert (=> b!1409199 m!1298845))

(assert (=> b!1409199 m!1298845))

(assert (=> b!1409199 m!1298843))

(declare-fun m!1298847 () Bool)

(assert (=> b!1409199 m!1298847))

(check-sat (not b!1409205) (not b!1409202) (not b!1409203) (not b!1409198) (not b!1409204) (not start!121196) (not b!1409199) (not b!1409200))
