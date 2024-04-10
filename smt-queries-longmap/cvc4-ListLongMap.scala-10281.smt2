; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120850 () Bool)

(assert start!120850)

(declare-fun b!1406144 () Bool)

(declare-fun res!944366 () Bool)

(declare-fun e!795893 () Bool)

(assert (=> b!1406144 (=> (not res!944366) (not e!795893))))

(declare-datatypes ((array!96157 0))(
  ( (array!96158 (arr!46426 (Array (_ BitVec 32) (_ BitVec 64))) (size!46976 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96157)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96157 (_ BitVec 32)) Bool)

(assert (=> b!1406144 (= res!944366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406145 () Bool)

(declare-fun res!944367 () Bool)

(assert (=> b!1406145 (=> (not res!944367) (not e!795893))))

(declare-datatypes ((List!32945 0))(
  ( (Nil!32942) (Cons!32941 (h!34195 (_ BitVec 64)) (t!47639 List!32945)) )
))
(declare-fun arrayNoDuplicates!0 (array!96157 (_ BitVec 32) List!32945) Bool)

(assert (=> b!1406145 (= res!944367 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32942))))

(declare-fun b!1406146 () Bool)

(declare-fun e!795894 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10737 0))(
  ( (MissingZero!10737 (index!45325 (_ BitVec 32))) (Found!10737 (index!45326 (_ BitVec 32))) (Intermediate!10737 (undefined!11549 Bool) (index!45327 (_ BitVec 32)) (x!126928 (_ BitVec 32))) (Undefined!10737) (MissingVacant!10737 (index!45328 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96157 (_ BitVec 32)) SeekEntryResult!10737)

(assert (=> b!1406146 (= e!795894 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) j!112) a!2901 mask!2840) (Found!10737 j!112)))))

(declare-fun res!944362 () Bool)

(assert (=> start!120850 (=> (not res!944362) (not e!795893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120850 (= res!944362 (validMask!0 mask!2840))))

(assert (=> start!120850 e!795893))

(assert (=> start!120850 true))

(declare-fun array_inv!35454 (array!96157) Bool)

(assert (=> start!120850 (array_inv!35454 a!2901)))

(declare-fun b!1406147 () Bool)

(declare-fun e!795895 () Bool)

(assert (=> b!1406147 (= e!795895 true)))

(declare-fun lt!619275 () SeekEntryResult!10737)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96157 (_ BitVec 32)) SeekEntryResult!10737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406147 (= lt!619275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96158 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46976 a!2901)) mask!2840))))

(declare-fun b!1406148 () Bool)

(declare-fun res!944365 () Bool)

(assert (=> b!1406148 (=> (not res!944365) (not e!795893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406148 (= res!944365 (validKeyInArray!0 (select (arr!46426 a!2901) i!1037)))))

(declare-fun b!1406149 () Bool)

(declare-fun res!944368 () Bool)

(assert (=> b!1406149 (=> (not res!944368) (not e!795893))))

(assert (=> b!1406149 (= res!944368 (and (= (size!46976 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46976 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46976 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406150 () Bool)

(assert (=> b!1406150 (= e!795893 (not e!795895))))

(declare-fun res!944364 () Bool)

(assert (=> b!1406150 (=> res!944364 e!795895)))

(declare-fun lt!619274 () SeekEntryResult!10737)

(assert (=> b!1406150 (= res!944364 (or (not (is-Intermediate!10737 lt!619274)) (undefined!11549 lt!619274)))))

(assert (=> b!1406150 e!795894))

(declare-fun res!944361 () Bool)

(assert (=> b!1406150 (=> (not res!944361) (not e!795894))))

(assert (=> b!1406150 (= res!944361 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47448 0))(
  ( (Unit!47449) )
))
(declare-fun lt!619273 () Unit!47448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47448)

(assert (=> b!1406150 (= lt!619273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406150 (= lt!619274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406151 () Bool)

(declare-fun res!944363 () Bool)

(assert (=> b!1406151 (=> (not res!944363) (not e!795893))))

(assert (=> b!1406151 (= res!944363 (validKeyInArray!0 (select (arr!46426 a!2901) j!112)))))

(assert (= (and start!120850 res!944362) b!1406149))

(assert (= (and b!1406149 res!944368) b!1406148))

(assert (= (and b!1406148 res!944365) b!1406151))

(assert (= (and b!1406151 res!944363) b!1406144))

(assert (= (and b!1406144 res!944366) b!1406145))

(assert (= (and b!1406145 res!944367) b!1406150))

(assert (= (and b!1406150 res!944361) b!1406146))

(assert (= (and b!1406150 (not res!944364)) b!1406147))

(declare-fun m!1295165 () Bool)

(assert (=> b!1406148 m!1295165))

(assert (=> b!1406148 m!1295165))

(declare-fun m!1295167 () Bool)

(assert (=> b!1406148 m!1295167))

(declare-fun m!1295169 () Bool)

(assert (=> b!1406151 m!1295169))

(assert (=> b!1406151 m!1295169))

(declare-fun m!1295171 () Bool)

(assert (=> b!1406151 m!1295171))

(declare-fun m!1295173 () Bool)

(assert (=> start!120850 m!1295173))

(declare-fun m!1295175 () Bool)

(assert (=> start!120850 m!1295175))

(assert (=> b!1406150 m!1295169))

(declare-fun m!1295177 () Bool)

(assert (=> b!1406150 m!1295177))

(assert (=> b!1406150 m!1295169))

(declare-fun m!1295179 () Bool)

(assert (=> b!1406150 m!1295179))

(assert (=> b!1406150 m!1295177))

(assert (=> b!1406150 m!1295169))

(declare-fun m!1295181 () Bool)

(assert (=> b!1406150 m!1295181))

(declare-fun m!1295183 () Bool)

(assert (=> b!1406150 m!1295183))

(assert (=> b!1406146 m!1295169))

(assert (=> b!1406146 m!1295169))

(declare-fun m!1295185 () Bool)

(assert (=> b!1406146 m!1295185))

(declare-fun m!1295187 () Bool)

(assert (=> b!1406147 m!1295187))

(declare-fun m!1295189 () Bool)

(assert (=> b!1406147 m!1295189))

(assert (=> b!1406147 m!1295189))

(declare-fun m!1295191 () Bool)

(assert (=> b!1406147 m!1295191))

(assert (=> b!1406147 m!1295191))

(assert (=> b!1406147 m!1295189))

(declare-fun m!1295193 () Bool)

(assert (=> b!1406147 m!1295193))

(declare-fun m!1295195 () Bool)

(assert (=> b!1406145 m!1295195))

(declare-fun m!1295197 () Bool)

(assert (=> b!1406144 m!1295197))

(push 1)

(assert (not b!1406148))

(assert (not b!1406144))

(assert (not b!1406147))

(assert (not b!1406151))

(assert (not start!120850))

(assert (not b!1406145))

(assert (not b!1406150))

(assert (not b!1406146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

