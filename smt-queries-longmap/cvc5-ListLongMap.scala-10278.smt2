; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120828 () Bool)

(assert start!120828)

(declare-fun b!1405847 () Bool)

(declare-fun res!944116 () Bool)

(declare-fun e!795746 () Bool)

(assert (=> b!1405847 (=> (not res!944116) (not e!795746))))

(declare-datatypes ((array!96088 0))(
  ( (array!96089 (arr!46392 (Array (_ BitVec 32) (_ BitVec 64))) (size!46944 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96088)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405847 (= res!944116 (validKeyInArray!0 (select (arr!46392 a!2901) j!112)))))

(declare-fun b!1405848 () Bool)

(declare-fun res!944121 () Bool)

(assert (=> b!1405848 (=> (not res!944121) (not e!795746))))

(declare-datatypes ((List!32989 0))(
  ( (Nil!32986) (Cons!32985 (h!34239 (_ BitVec 64)) (t!47675 List!32989)) )
))
(declare-fun arrayNoDuplicates!0 (array!96088 (_ BitVec 32) List!32989) Bool)

(assert (=> b!1405848 (= res!944121 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32986))))

(declare-fun b!1405849 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795747 () Bool)

(declare-datatypes ((SeekEntryResult!10729 0))(
  ( (MissingZero!10729 (index!45293 (_ BitVec 32))) (Found!10729 (index!45294 (_ BitVec 32))) (Intermediate!10729 (undefined!11541 Bool) (index!45295 (_ BitVec 32)) (x!126893 (_ BitVec 32))) (Undefined!10729) (MissingVacant!10729 (index!45296 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96088 (_ BitVec 32)) SeekEntryResult!10729)

(assert (=> b!1405849 (= e!795747 (= (seekEntryOrOpen!0 (select (arr!46392 a!2901) j!112) a!2901 mask!2840) (Found!10729 j!112)))))

(declare-fun b!1405850 () Bool)

(declare-fun res!944118 () Bool)

(assert (=> b!1405850 (=> (not res!944118) (not e!795746))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405850 (= res!944118 (validKeyInArray!0 (select (arr!46392 a!2901) i!1037)))))

(declare-fun b!1405851 () Bool)

(declare-fun res!944119 () Bool)

(assert (=> b!1405851 (=> (not res!944119) (not e!795746))))

(assert (=> b!1405851 (= res!944119 (and (= (size!46944 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46944 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46944 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405852 () Bool)

(declare-fun e!795749 () Bool)

(assert (=> b!1405852 (= e!795749 true)))

(declare-fun lt!619003 () SeekEntryResult!10729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96088 (_ BitVec 32)) SeekEntryResult!10729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405852 (= lt!619003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46392 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46392 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96089 (store (arr!46392 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46944 a!2901)) mask!2840))))

(declare-fun b!1405853 () Bool)

(declare-fun res!944115 () Bool)

(assert (=> b!1405853 (=> (not res!944115) (not e!795746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96088 (_ BitVec 32)) Bool)

(assert (=> b!1405853 (= res!944115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944122 () Bool)

(assert (=> start!120828 (=> (not res!944122) (not e!795746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120828 (= res!944122 (validMask!0 mask!2840))))

(assert (=> start!120828 e!795746))

(assert (=> start!120828 true))

(declare-fun array_inv!35625 (array!96088) Bool)

(assert (=> start!120828 (array_inv!35625 a!2901)))

(declare-fun b!1405854 () Bool)

(assert (=> b!1405854 (= e!795746 (not e!795749))))

(declare-fun res!944117 () Bool)

(assert (=> b!1405854 (=> res!944117 e!795749)))

(declare-fun lt!619004 () SeekEntryResult!10729)

(assert (=> b!1405854 (= res!944117 (or (not (is-Intermediate!10729 lt!619004)) (undefined!11541 lt!619004)))))

(assert (=> b!1405854 e!795747))

(declare-fun res!944120 () Bool)

(assert (=> b!1405854 (=> (not res!944120) (not e!795747))))

(assert (=> b!1405854 (= res!944120 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47275 0))(
  ( (Unit!47276) )
))
(declare-fun lt!619002 () Unit!47275)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47275)

(assert (=> b!1405854 (= lt!619002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405854 (= lt!619004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46392 a!2901) j!112) mask!2840) (select (arr!46392 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120828 res!944122) b!1405851))

(assert (= (and b!1405851 res!944119) b!1405850))

(assert (= (and b!1405850 res!944118) b!1405847))

(assert (= (and b!1405847 res!944116) b!1405853))

(assert (= (and b!1405853 res!944115) b!1405848))

(assert (= (and b!1405848 res!944121) b!1405854))

(assert (= (and b!1405854 res!944120) b!1405849))

(assert (= (and b!1405854 (not res!944117)) b!1405852))

(declare-fun m!1294323 () Bool)

(assert (=> b!1405853 m!1294323))

(declare-fun m!1294325 () Bool)

(assert (=> b!1405850 m!1294325))

(assert (=> b!1405850 m!1294325))

(declare-fun m!1294327 () Bool)

(assert (=> b!1405850 m!1294327))

(declare-fun m!1294329 () Bool)

(assert (=> b!1405854 m!1294329))

(declare-fun m!1294331 () Bool)

(assert (=> b!1405854 m!1294331))

(assert (=> b!1405854 m!1294329))

(declare-fun m!1294333 () Bool)

(assert (=> b!1405854 m!1294333))

(assert (=> b!1405854 m!1294331))

(assert (=> b!1405854 m!1294329))

(declare-fun m!1294335 () Bool)

(assert (=> b!1405854 m!1294335))

(declare-fun m!1294337 () Bool)

(assert (=> b!1405854 m!1294337))

(declare-fun m!1294339 () Bool)

(assert (=> b!1405852 m!1294339))

(declare-fun m!1294341 () Bool)

(assert (=> b!1405852 m!1294341))

(assert (=> b!1405852 m!1294341))

(declare-fun m!1294343 () Bool)

(assert (=> b!1405852 m!1294343))

(assert (=> b!1405852 m!1294343))

(assert (=> b!1405852 m!1294341))

(declare-fun m!1294345 () Bool)

(assert (=> b!1405852 m!1294345))

(declare-fun m!1294347 () Bool)

(assert (=> start!120828 m!1294347))

(declare-fun m!1294349 () Bool)

(assert (=> start!120828 m!1294349))

(declare-fun m!1294351 () Bool)

(assert (=> b!1405848 m!1294351))

(assert (=> b!1405847 m!1294329))

(assert (=> b!1405847 m!1294329))

(declare-fun m!1294353 () Bool)

(assert (=> b!1405847 m!1294353))

(assert (=> b!1405849 m!1294329))

(assert (=> b!1405849 m!1294329))

(declare-fun m!1294355 () Bool)

(assert (=> b!1405849 m!1294355))

(push 1)

(assert (not b!1405848))

(assert (not b!1405849))

(assert (not b!1405853))

(assert (not b!1405847))

(assert (not b!1405852))

(assert (not b!1405854))

(assert (not b!1405850))

(assert (not start!120828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

