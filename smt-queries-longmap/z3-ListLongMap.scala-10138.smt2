; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119594 () Bool)

(assert start!119594)

(declare-fun b!1393068 () Bool)

(declare-fun e!788832 () Bool)

(declare-fun e!788831 () Bool)

(assert (=> b!1393068 (= e!788832 (not e!788831))))

(declare-fun res!932479 () Bool)

(assert (=> b!1393068 (=> res!932479 e!788831)))

(declare-datatypes ((SeekEntryResult!10313 0))(
  ( (MissingZero!10313 (index!43623 (_ BitVec 32))) (Found!10313 (index!43624 (_ BitVec 32))) (Intermediate!10313 (undefined!11125 Bool) (index!43625 (_ BitVec 32)) (x!125309 (_ BitVec 32))) (Undefined!10313) (MissingVacant!10313 (index!43626 (_ BitVec 32))) )
))
(declare-fun lt!611851 () SeekEntryResult!10313)

(get-info :version)

(assert (=> b!1393068 (= res!932479 (or (not ((_ is Intermediate!10313) lt!611851)) (undefined!11125 lt!611851)))))

(declare-fun e!788833 () Bool)

(assert (=> b!1393068 e!788833))

(declare-fun res!932480 () Bool)

(assert (=> b!1393068 (=> (not res!932480) (not e!788833))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95276 0))(
  ( (array!95277 (arr!45996 (Array (_ BitVec 32) (_ BitVec 64))) (size!46546 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95276)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95276 (_ BitVec 32)) Bool)

(assert (=> b!1393068 (= res!932480 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46630 0))(
  ( (Unit!46631) )
))
(declare-fun lt!611852 () Unit!46630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46630)

(assert (=> b!1393068 (= lt!611852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95276 (_ BitVec 32)) SeekEntryResult!10313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393068 (= lt!611851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45996 a!2901) j!112) mask!2840) (select (arr!45996 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393069 () Bool)

(declare-fun res!932476 () Bool)

(assert (=> b!1393069 (=> (not res!932476) (not e!788832))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393069 (= res!932476 (validKeyInArray!0 (select (arr!45996 a!2901) i!1037)))))

(declare-fun b!1393070 () Bool)

(declare-fun res!932475 () Bool)

(assert (=> b!1393070 (=> (not res!932475) (not e!788832))))

(assert (=> b!1393070 (= res!932475 (and (= (size!46546 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46546 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46546 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393071 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95276 (_ BitVec 32)) SeekEntryResult!10313)

(assert (=> b!1393071 (= e!788833 (= (seekEntryOrOpen!0 (select (arr!45996 a!2901) j!112) a!2901 mask!2840) (Found!10313 j!112)))))

(declare-fun b!1393072 () Bool)

(declare-fun res!932478 () Bool)

(assert (=> b!1393072 (=> (not res!932478) (not e!788832))))

(assert (=> b!1393072 (= res!932478 (validKeyInArray!0 (select (arr!45996 a!2901) j!112)))))

(declare-fun res!932477 () Bool)

(assert (=> start!119594 (=> (not res!932477) (not e!788832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119594 (= res!932477 (validMask!0 mask!2840))))

(assert (=> start!119594 e!788832))

(assert (=> start!119594 true))

(declare-fun array_inv!35024 (array!95276) Bool)

(assert (=> start!119594 (array_inv!35024 a!2901)))

(declare-fun b!1393067 () Bool)

(declare-fun res!932481 () Bool)

(assert (=> b!1393067 (=> (not res!932481) (not e!788832))))

(assert (=> b!1393067 (= res!932481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393073 () Bool)

(assert (=> b!1393073 (= e!788831 true)))

(declare-fun lt!611853 () SeekEntryResult!10313)

(assert (=> b!1393073 (= lt!611853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45996 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45996 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95277 (store (arr!45996 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46546 a!2901)) mask!2840))))

(declare-fun b!1393074 () Bool)

(declare-fun res!932482 () Bool)

(assert (=> b!1393074 (=> (not res!932482) (not e!788832))))

(declare-datatypes ((List!32515 0))(
  ( (Nil!32512) (Cons!32511 (h!33744 (_ BitVec 64)) (t!47209 List!32515)) )
))
(declare-fun arrayNoDuplicates!0 (array!95276 (_ BitVec 32) List!32515) Bool)

(assert (=> b!1393074 (= res!932482 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32512))))

(assert (= (and start!119594 res!932477) b!1393070))

(assert (= (and b!1393070 res!932475) b!1393069))

(assert (= (and b!1393069 res!932476) b!1393072))

(assert (= (and b!1393072 res!932478) b!1393067))

(assert (= (and b!1393067 res!932481) b!1393074))

(assert (= (and b!1393074 res!932482) b!1393068))

(assert (= (and b!1393068 res!932480) b!1393071))

(assert (= (and b!1393068 (not res!932479)) b!1393073))

(declare-fun m!1278823 () Bool)

(assert (=> b!1393069 m!1278823))

(assert (=> b!1393069 m!1278823))

(declare-fun m!1278825 () Bool)

(assert (=> b!1393069 m!1278825))

(declare-fun m!1278827 () Bool)

(assert (=> b!1393068 m!1278827))

(declare-fun m!1278829 () Bool)

(assert (=> b!1393068 m!1278829))

(assert (=> b!1393068 m!1278827))

(declare-fun m!1278831 () Bool)

(assert (=> b!1393068 m!1278831))

(assert (=> b!1393068 m!1278829))

(assert (=> b!1393068 m!1278827))

(declare-fun m!1278833 () Bool)

(assert (=> b!1393068 m!1278833))

(declare-fun m!1278835 () Bool)

(assert (=> b!1393068 m!1278835))

(assert (=> b!1393072 m!1278827))

(assert (=> b!1393072 m!1278827))

(declare-fun m!1278837 () Bool)

(assert (=> b!1393072 m!1278837))

(declare-fun m!1278839 () Bool)

(assert (=> b!1393074 m!1278839))

(declare-fun m!1278841 () Bool)

(assert (=> b!1393067 m!1278841))

(declare-fun m!1278843 () Bool)

(assert (=> b!1393073 m!1278843))

(declare-fun m!1278845 () Bool)

(assert (=> b!1393073 m!1278845))

(assert (=> b!1393073 m!1278845))

(declare-fun m!1278847 () Bool)

(assert (=> b!1393073 m!1278847))

(assert (=> b!1393073 m!1278847))

(assert (=> b!1393073 m!1278845))

(declare-fun m!1278849 () Bool)

(assert (=> b!1393073 m!1278849))

(assert (=> b!1393071 m!1278827))

(assert (=> b!1393071 m!1278827))

(declare-fun m!1278851 () Bool)

(assert (=> b!1393071 m!1278851))

(declare-fun m!1278853 () Bool)

(assert (=> start!119594 m!1278853))

(declare-fun m!1278855 () Bool)

(assert (=> start!119594 m!1278855))

(check-sat (not b!1393068) (not b!1393067) (not b!1393072) (not b!1393069) (not b!1393073) (not start!119594) (not b!1393074) (not b!1393071))
