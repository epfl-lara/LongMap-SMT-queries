; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119580 () Bool)

(assert start!119580)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95262 0))(
  ( (array!95263 (arr!45989 (Array (_ BitVec 32) (_ BitVec 64))) (size!46539 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95262)

(declare-fun e!788748 () Bool)

(declare-fun b!1392899 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10306 0))(
  ( (MissingZero!10306 (index!43595 (_ BitVec 32))) (Found!10306 (index!43596 (_ BitVec 32))) (Intermediate!10306 (undefined!11118 Bool) (index!43597 (_ BitVec 32)) (x!125286 (_ BitVec 32))) (Undefined!10306) (MissingVacant!10306 (index!43598 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95262 (_ BitVec 32)) SeekEntryResult!10306)

(assert (=> b!1392899 (= e!788748 (= (seekEntryOrOpen!0 (select (arr!45989 a!2901) j!112) a!2901 mask!2840) (Found!10306 j!112)))))

(declare-fun b!1392900 () Bool)

(declare-fun e!788749 () Bool)

(declare-fun e!788747 () Bool)

(assert (=> b!1392900 (= e!788749 (not e!788747))))

(declare-fun res!932307 () Bool)

(assert (=> b!1392900 (=> res!932307 e!788747)))

(declare-fun lt!611790 () SeekEntryResult!10306)

(assert (=> b!1392900 (= res!932307 (or (not (is-Intermediate!10306 lt!611790)) (undefined!11118 lt!611790)))))

(assert (=> b!1392900 e!788748))

(declare-fun res!932309 () Bool)

(assert (=> b!1392900 (=> (not res!932309) (not e!788748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95262 (_ BitVec 32)) Bool)

(assert (=> b!1392900 (= res!932309 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46616 0))(
  ( (Unit!46617) )
))
(declare-fun lt!611788 () Unit!46616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46616)

(assert (=> b!1392900 (= lt!611788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95262 (_ BitVec 32)) SeekEntryResult!10306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392900 (= lt!611790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45989 a!2901) j!112) mask!2840) (select (arr!45989 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392901 () Bool)

(declare-fun res!932314 () Bool)

(assert (=> b!1392901 (=> (not res!932314) (not e!788749))))

(assert (=> b!1392901 (= res!932314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392902 () Bool)

(declare-fun res!932311 () Bool)

(assert (=> b!1392902 (=> (not res!932311) (not e!788749))))

(declare-datatypes ((List!32508 0))(
  ( (Nil!32505) (Cons!32504 (h!33737 (_ BitVec 64)) (t!47202 List!32508)) )
))
(declare-fun arrayNoDuplicates!0 (array!95262 (_ BitVec 32) List!32508) Bool)

(assert (=> b!1392902 (= res!932311 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32505))))

(declare-fun b!1392903 () Bool)

(declare-fun res!932312 () Bool)

(assert (=> b!1392903 (=> (not res!932312) (not e!788749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392903 (= res!932312 (validKeyInArray!0 (select (arr!45989 a!2901) j!112)))))

(declare-fun res!932313 () Bool)

(assert (=> start!119580 (=> (not res!932313) (not e!788749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119580 (= res!932313 (validMask!0 mask!2840))))

(assert (=> start!119580 e!788749))

(assert (=> start!119580 true))

(declare-fun array_inv!35017 (array!95262) Bool)

(assert (=> start!119580 (array_inv!35017 a!2901)))

(declare-fun b!1392904 () Bool)

(declare-fun res!932310 () Bool)

(assert (=> b!1392904 (=> (not res!932310) (not e!788749))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392904 (= res!932310 (and (= (size!46539 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46539 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46539 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392905 () Bool)

(declare-fun res!932308 () Bool)

(assert (=> b!1392905 (=> (not res!932308) (not e!788749))))

(assert (=> b!1392905 (= res!932308 (validKeyInArray!0 (select (arr!45989 a!2901) i!1037)))))

(declare-fun b!1392906 () Bool)

(assert (=> b!1392906 (= e!788747 true)))

(declare-fun lt!611789 () SeekEntryResult!10306)

(assert (=> b!1392906 (= lt!611789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45989 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45989 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95263 (store (arr!45989 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46539 a!2901)) mask!2840))))

(assert (= (and start!119580 res!932313) b!1392904))

(assert (= (and b!1392904 res!932310) b!1392905))

(assert (= (and b!1392905 res!932308) b!1392903))

(assert (= (and b!1392903 res!932312) b!1392901))

(assert (= (and b!1392901 res!932314) b!1392902))

(assert (= (and b!1392902 res!932311) b!1392900))

(assert (= (and b!1392900 res!932309) b!1392899))

(assert (= (and b!1392900 (not res!932307)) b!1392906))

(declare-fun m!1278585 () Bool)

(assert (=> b!1392906 m!1278585))

(declare-fun m!1278587 () Bool)

(assert (=> b!1392906 m!1278587))

(assert (=> b!1392906 m!1278587))

(declare-fun m!1278589 () Bool)

(assert (=> b!1392906 m!1278589))

(assert (=> b!1392906 m!1278589))

(assert (=> b!1392906 m!1278587))

(declare-fun m!1278591 () Bool)

(assert (=> b!1392906 m!1278591))

(declare-fun m!1278593 () Bool)

(assert (=> start!119580 m!1278593))

(declare-fun m!1278595 () Bool)

(assert (=> start!119580 m!1278595))

(declare-fun m!1278597 () Bool)

(assert (=> b!1392903 m!1278597))

(assert (=> b!1392903 m!1278597))

(declare-fun m!1278599 () Bool)

(assert (=> b!1392903 m!1278599))

(declare-fun m!1278601 () Bool)

(assert (=> b!1392901 m!1278601))

(assert (=> b!1392899 m!1278597))

(assert (=> b!1392899 m!1278597))

(declare-fun m!1278603 () Bool)

(assert (=> b!1392899 m!1278603))

(assert (=> b!1392900 m!1278597))

(declare-fun m!1278605 () Bool)

(assert (=> b!1392900 m!1278605))

(assert (=> b!1392900 m!1278597))

(declare-fun m!1278607 () Bool)

(assert (=> b!1392900 m!1278607))

(assert (=> b!1392900 m!1278605))

(assert (=> b!1392900 m!1278597))

(declare-fun m!1278609 () Bool)

(assert (=> b!1392900 m!1278609))

(declare-fun m!1278611 () Bool)

(assert (=> b!1392900 m!1278611))

(declare-fun m!1278613 () Bool)

(assert (=> b!1392902 m!1278613))

(declare-fun m!1278615 () Bool)

(assert (=> b!1392905 m!1278615))

(assert (=> b!1392905 m!1278615))

(declare-fun m!1278617 () Bool)

(assert (=> b!1392905 m!1278617))

(push 1)

(assert (not b!1392905))

(assert (not b!1392901))

(assert (not b!1392906))

(assert (not start!119580))

(assert (not b!1392902))

(assert (not b!1392903))

(assert (not b!1392900))

(assert (not b!1392899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

