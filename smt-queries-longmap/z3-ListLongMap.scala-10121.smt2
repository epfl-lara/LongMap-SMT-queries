; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119270 () Bool)

(assert start!119270)

(declare-fun b!1390833 () Bool)

(declare-fun res!930903 () Bool)

(declare-fun e!787630 () Bool)

(assert (=> b!1390833 (=> (not res!930903) (not e!787630))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95109 0))(
  ( (array!95110 (arr!45919 (Array (_ BitVec 32) (_ BitVec 64))) (size!46471 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95109)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390833 (= res!930903 (and (= (size!46471 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46471 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46471 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930901 () Bool)

(assert (=> start!119270 (=> (not res!930901) (not e!787630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119270 (= res!930901 (validMask!0 mask!2840))))

(assert (=> start!119270 e!787630))

(assert (=> start!119270 true))

(declare-fun array_inv!35152 (array!95109) Bool)

(assert (=> start!119270 (array_inv!35152 a!2901)))

(declare-fun b!1390834 () Bool)

(declare-datatypes ((SeekEntryResult!10262 0))(
  ( (MissingZero!10262 (index!43419 (_ BitVec 32))) (Found!10262 (index!43420 (_ BitVec 32))) (Intermediate!10262 (undefined!11074 Bool) (index!43421 (_ BitVec 32)) (x!125095 (_ BitVec 32))) (Undefined!10262) (MissingVacant!10262 (index!43422 (_ BitVec 32))) )
))
(declare-fun lt!610814 () SeekEntryResult!10262)

(get-info :version)

(assert (=> b!1390834 (= e!787630 (not (or (not ((_ is Intermediate!10262) lt!610814)) (undefined!11074 lt!610814) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(declare-fun e!787629 () Bool)

(assert (=> b!1390834 e!787629))

(declare-fun res!930900 () Bool)

(assert (=> b!1390834 (=> (not res!930900) (not e!787629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95109 (_ BitVec 32)) Bool)

(assert (=> b!1390834 (= res!930900 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46371 0))(
  ( (Unit!46372) )
))
(declare-fun lt!610813 () Unit!46371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46371)

(assert (=> b!1390834 (= lt!610813 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95109 (_ BitVec 32)) SeekEntryResult!10262)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390834 (= lt!610814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45919 a!2901) j!112) mask!2840) (select (arr!45919 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390835 () Bool)

(declare-fun res!930899 () Bool)

(assert (=> b!1390835 (=> (not res!930899) (not e!787630))))

(declare-datatypes ((List!32516 0))(
  ( (Nil!32513) (Cons!32512 (h!33733 (_ BitVec 64)) (t!47202 List!32516)) )
))
(declare-fun arrayNoDuplicates!0 (array!95109 (_ BitVec 32) List!32516) Bool)

(assert (=> b!1390835 (= res!930899 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32513))))

(declare-fun b!1390836 () Bool)

(declare-fun res!930904 () Bool)

(assert (=> b!1390836 (=> (not res!930904) (not e!787630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390836 (= res!930904 (validKeyInArray!0 (select (arr!45919 a!2901) j!112)))))

(declare-fun b!1390837 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95109 (_ BitVec 32)) SeekEntryResult!10262)

(assert (=> b!1390837 (= e!787629 (= (seekEntryOrOpen!0 (select (arr!45919 a!2901) j!112) a!2901 mask!2840) (Found!10262 j!112)))))

(declare-fun b!1390838 () Bool)

(declare-fun res!930898 () Bool)

(assert (=> b!1390838 (=> (not res!930898) (not e!787630))))

(assert (=> b!1390838 (= res!930898 (validKeyInArray!0 (select (arr!45919 a!2901) i!1037)))))

(declare-fun b!1390839 () Bool)

(declare-fun res!930902 () Bool)

(assert (=> b!1390839 (=> (not res!930902) (not e!787630))))

(assert (=> b!1390839 (= res!930902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119270 res!930901) b!1390833))

(assert (= (and b!1390833 res!930903) b!1390838))

(assert (= (and b!1390838 res!930898) b!1390836))

(assert (= (and b!1390836 res!930904) b!1390839))

(assert (= (and b!1390839 res!930902) b!1390835))

(assert (= (and b!1390835 res!930899) b!1390834))

(assert (= (and b!1390834 res!930900) b!1390837))

(declare-fun m!1276183 () Bool)

(assert (=> b!1390839 m!1276183))

(declare-fun m!1276185 () Bool)

(assert (=> b!1390834 m!1276185))

(declare-fun m!1276187 () Bool)

(assert (=> b!1390834 m!1276187))

(assert (=> b!1390834 m!1276185))

(declare-fun m!1276189 () Bool)

(assert (=> b!1390834 m!1276189))

(assert (=> b!1390834 m!1276187))

(assert (=> b!1390834 m!1276185))

(declare-fun m!1276191 () Bool)

(assert (=> b!1390834 m!1276191))

(declare-fun m!1276193 () Bool)

(assert (=> b!1390834 m!1276193))

(declare-fun m!1276195 () Bool)

(assert (=> b!1390835 m!1276195))

(assert (=> b!1390836 m!1276185))

(assert (=> b!1390836 m!1276185))

(declare-fun m!1276197 () Bool)

(assert (=> b!1390836 m!1276197))

(assert (=> b!1390837 m!1276185))

(assert (=> b!1390837 m!1276185))

(declare-fun m!1276199 () Bool)

(assert (=> b!1390837 m!1276199))

(declare-fun m!1276201 () Bool)

(assert (=> b!1390838 m!1276201))

(assert (=> b!1390838 m!1276201))

(declare-fun m!1276203 () Bool)

(assert (=> b!1390838 m!1276203))

(declare-fun m!1276205 () Bool)

(assert (=> start!119270 m!1276205))

(declare-fun m!1276207 () Bool)

(assert (=> start!119270 m!1276207))

(check-sat (not b!1390837) (not b!1390838) (not b!1390836) (not start!119270) (not b!1390835) (not b!1390839) (not b!1390834))
(check-sat)
