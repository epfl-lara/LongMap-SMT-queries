; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120614 () Bool)

(assert start!120614)

(declare-fun b!1404313 () Bool)

(declare-fun res!942828 () Bool)

(declare-fun e!794999 () Bool)

(assert (=> b!1404313 (=> (not res!942828) (not e!794999))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96023 0))(
  ( (array!96024 (arr!46362 (Array (_ BitVec 32) (_ BitVec 64))) (size!46912 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96023)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404313 (= res!942828 (and (= (size!46912 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46912 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46912 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404314 () Bool)

(declare-fun res!942824 () Bool)

(assert (=> b!1404314 (=> (not res!942824) (not e!794999))))

(declare-datatypes ((List!32881 0))(
  ( (Nil!32878) (Cons!32877 (h!34125 (_ BitVec 64)) (t!47575 List!32881)) )
))
(declare-fun arrayNoDuplicates!0 (array!96023 (_ BitVec 32) List!32881) Bool)

(assert (=> b!1404314 (= res!942824 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32878))))

(declare-fun b!1404315 () Bool)

(declare-fun res!942825 () Bool)

(assert (=> b!1404315 (=> (not res!942825) (not e!794999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404315 (= res!942825 (validKeyInArray!0 (select (arr!46362 a!2901) j!112)))))

(declare-fun res!942827 () Bool)

(assert (=> start!120614 (=> (not res!942827) (not e!794999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120614 (= res!942827 (validMask!0 mask!2840))))

(assert (=> start!120614 e!794999))

(assert (=> start!120614 true))

(declare-fun array_inv!35390 (array!96023) Bool)

(assert (=> start!120614 (array_inv!35390 a!2901)))

(declare-fun b!1404316 () Bool)

(declare-fun res!942826 () Bool)

(assert (=> b!1404316 (=> (not res!942826) (not e!794999))))

(assert (=> b!1404316 (= res!942826 (validKeyInArray!0 (select (arr!46362 a!2901) i!1037)))))

(declare-fun b!1404317 () Bool)

(assert (=> b!1404317 (= e!794999 (and (bvsle #b00000000000000000000000000000000 (size!46912 a!2901)) (bvsgt j!112 (size!46912 a!2901))))))

(declare-datatypes ((SeekEntryResult!10673 0))(
  ( (MissingZero!10673 (index!45069 (_ BitVec 32))) (Found!10673 (index!45070 (_ BitVec 32))) (Intermediate!10673 (undefined!11485 Bool) (index!45071 (_ BitVec 32)) (x!126684 (_ BitVec 32))) (Undefined!10673) (MissingVacant!10673 (index!45072 (_ BitVec 32))) )
))
(declare-fun lt!618624 () SeekEntryResult!10673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96023 (_ BitVec 32)) SeekEntryResult!10673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404317 (= lt!618624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46362 a!2901) j!112) mask!2840) (select (arr!46362 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404318 () Bool)

(declare-fun res!942829 () Bool)

(assert (=> b!1404318 (=> (not res!942829) (not e!794999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96023 (_ BitVec 32)) Bool)

(assert (=> b!1404318 (= res!942829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120614 res!942827) b!1404313))

(assert (= (and b!1404313 res!942828) b!1404316))

(assert (= (and b!1404316 res!942826) b!1404315))

(assert (= (and b!1404315 res!942825) b!1404318))

(assert (= (and b!1404318 res!942829) b!1404314))

(assert (= (and b!1404314 res!942824) b!1404317))

(declare-fun m!1293137 () Bool)

(assert (=> start!120614 m!1293137))

(declare-fun m!1293139 () Bool)

(assert (=> start!120614 m!1293139))

(declare-fun m!1293141 () Bool)

(assert (=> b!1404316 m!1293141))

(assert (=> b!1404316 m!1293141))

(declare-fun m!1293143 () Bool)

(assert (=> b!1404316 m!1293143))

(declare-fun m!1293145 () Bool)

(assert (=> b!1404318 m!1293145))

(declare-fun m!1293147 () Bool)

(assert (=> b!1404317 m!1293147))

(assert (=> b!1404317 m!1293147))

(declare-fun m!1293149 () Bool)

(assert (=> b!1404317 m!1293149))

(assert (=> b!1404317 m!1293149))

(assert (=> b!1404317 m!1293147))

(declare-fun m!1293151 () Bool)

(assert (=> b!1404317 m!1293151))

(assert (=> b!1404315 m!1293147))

(assert (=> b!1404315 m!1293147))

(declare-fun m!1293153 () Bool)

(assert (=> b!1404315 m!1293153))

(declare-fun m!1293155 () Bool)

(assert (=> b!1404314 m!1293155))

(check-sat (not b!1404318) (not b!1404316) (not b!1404317) (not b!1404314) (not b!1404315) (not start!120614))
(check-sat)
