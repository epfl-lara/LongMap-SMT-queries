; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119508 () Bool)

(assert start!119508)

(declare-datatypes ((array!95241 0))(
  ( (array!95242 (arr!45980 (Array (_ BitVec 32) (_ BitVec 64))) (size!46530 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95241)

(declare-fun e!788476 () Bool)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun b!1392403 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392403 (= e!788476 (validKeyInArray!0 (select (store (arr!45980 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1392404 () Bool)

(declare-fun res!931982 () Bool)

(declare-fun e!788473 () Bool)

(assert (=> b!1392404 (=> (not res!931982) (not e!788473))))

(assert (=> b!1392404 (= res!931982 (validKeyInArray!0 (select (arr!45980 a!2901) j!112)))))

(declare-fun b!1392405 () Bool)

(declare-fun res!931980 () Bool)

(assert (=> b!1392405 (=> (not res!931980) (not e!788473))))

(assert (=> b!1392405 (= res!931980 (validKeyInArray!0 (select (arr!45980 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1392406 () Bool)

(declare-fun e!788474 () Bool)

(declare-datatypes ((SeekEntryResult!10297 0))(
  ( (MissingZero!10297 (index!43559 (_ BitVec 32))) (Found!10297 (index!43560 (_ BitVec 32))) (Intermediate!10297 (undefined!11109 Bool) (index!43561 (_ BitVec 32)) (x!125247 (_ BitVec 32))) (Undefined!10297) (MissingVacant!10297 (index!43562 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95241 (_ BitVec 32)) SeekEntryResult!10297)

(assert (=> b!1392406 (= e!788474 (= (seekEntryOrOpen!0 (select (arr!45980 a!2901) j!112) a!2901 mask!2840) (Found!10297 j!112)))))

(declare-fun b!1392407 () Bool)

(declare-fun res!931983 () Bool)

(assert (=> b!1392407 (=> (not res!931983) (not e!788473))))

(assert (=> b!1392407 (= res!931983 (and (= (size!46530 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46530 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46530 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931984 () Bool)

(assert (=> start!119508 (=> (not res!931984) (not e!788473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119508 (= res!931984 (validMask!0 mask!2840))))

(assert (=> start!119508 e!788473))

(assert (=> start!119508 true))

(declare-fun array_inv!35008 (array!95241) Bool)

(assert (=> start!119508 (array_inv!35008 a!2901)))

(declare-fun b!1392408 () Bool)

(declare-fun e!788475 () Bool)

(assert (=> b!1392408 (= e!788473 (not e!788475))))

(declare-fun res!931978 () Bool)

(assert (=> b!1392408 (=> res!931978 e!788475)))

(declare-fun lt!611606 () SeekEntryResult!10297)

(assert (=> b!1392408 (= res!931978 (or (not (is-Intermediate!10297 lt!611606)) (undefined!11109 lt!611606)))))

(assert (=> b!1392408 e!788474))

(declare-fun res!931977 () Bool)

(assert (=> b!1392408 (=> (not res!931977) (not e!788474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95241 (_ BitVec 32)) Bool)

(assert (=> b!1392408 (= res!931977 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46598 0))(
  ( (Unit!46599) )
))
(declare-fun lt!611605 () Unit!46598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46598)

(assert (=> b!1392408 (= lt!611605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95241 (_ BitVec 32)) SeekEntryResult!10297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392408 (= lt!611606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45980 a!2901) j!112) mask!2840) (select (arr!45980 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392409 () Bool)

(assert (=> b!1392409 (= e!788475 e!788476)))

(declare-fun res!931979 () Bool)

(assert (=> b!1392409 (=> res!931979 e!788476)))

(declare-fun lt!611607 () (_ BitVec 32))

(assert (=> b!1392409 (= res!931979 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!611607 #b00000000000000000000000000000000) (bvsge lt!611607 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(assert (=> b!1392409 (= lt!611607 (toIndex!0 (select (store (arr!45980 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392410 () Bool)

(declare-fun res!931976 () Bool)

(assert (=> b!1392410 (=> (not res!931976) (not e!788473))))

(declare-datatypes ((List!32499 0))(
  ( (Nil!32496) (Cons!32495 (h!33725 (_ BitVec 64)) (t!47193 List!32499)) )
))
(declare-fun arrayNoDuplicates!0 (array!95241 (_ BitVec 32) List!32499) Bool)

(assert (=> b!1392410 (= res!931976 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32496))))

(declare-fun b!1392411 () Bool)

(declare-fun res!931981 () Bool)

(assert (=> b!1392411 (=> (not res!931981) (not e!788473))))

(assert (=> b!1392411 (= res!931981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119508 res!931984) b!1392407))

(assert (= (and b!1392407 res!931983) b!1392405))

(assert (= (and b!1392405 res!931980) b!1392404))

(assert (= (and b!1392404 res!931982) b!1392411))

(assert (= (and b!1392411 res!931981) b!1392410))

(assert (= (and b!1392410 res!931976) b!1392408))

(assert (= (and b!1392408 res!931977) b!1392406))

(assert (= (and b!1392408 (not res!931978)) b!1392409))

(assert (= (and b!1392409 (not res!931979)) b!1392403))

(declare-fun m!1278129 () Bool)

(assert (=> start!119508 m!1278129))

(declare-fun m!1278131 () Bool)

(assert (=> start!119508 m!1278131))

(declare-fun m!1278133 () Bool)

(assert (=> b!1392405 m!1278133))

(assert (=> b!1392405 m!1278133))

(declare-fun m!1278135 () Bool)

(assert (=> b!1392405 m!1278135))

(declare-fun m!1278137 () Bool)

(assert (=> b!1392403 m!1278137))

(declare-fun m!1278139 () Bool)

(assert (=> b!1392403 m!1278139))

(assert (=> b!1392403 m!1278139))

(declare-fun m!1278141 () Bool)

(assert (=> b!1392403 m!1278141))

(declare-fun m!1278143 () Bool)

(assert (=> b!1392411 m!1278143))

(declare-fun m!1278145 () Bool)

(assert (=> b!1392410 m!1278145))

(declare-fun m!1278147 () Bool)

(assert (=> b!1392404 m!1278147))

(assert (=> b!1392404 m!1278147))

(declare-fun m!1278149 () Bool)

(assert (=> b!1392404 m!1278149))

(assert (=> b!1392408 m!1278147))

(declare-fun m!1278151 () Bool)

(assert (=> b!1392408 m!1278151))

(assert (=> b!1392408 m!1278147))

(declare-fun m!1278153 () Bool)

(assert (=> b!1392408 m!1278153))

(assert (=> b!1392408 m!1278151))

(assert (=> b!1392408 m!1278147))

(declare-fun m!1278155 () Bool)

(assert (=> b!1392408 m!1278155))

(declare-fun m!1278157 () Bool)

(assert (=> b!1392408 m!1278157))

(assert (=> b!1392406 m!1278147))

(assert (=> b!1392406 m!1278147))

(declare-fun m!1278159 () Bool)

(assert (=> b!1392406 m!1278159))

(assert (=> b!1392409 m!1278137))

(assert (=> b!1392409 m!1278139))

(assert (=> b!1392409 m!1278139))

(declare-fun m!1278161 () Bool)

(assert (=> b!1392409 m!1278161))

(push 1)

