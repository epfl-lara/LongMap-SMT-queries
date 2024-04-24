; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122870 () Bool)

(assert start!122870)

(declare-fun b!1422355 () Bool)

(declare-fun e!804401 () Bool)

(declare-fun e!804400 () Bool)

(assert (=> b!1422355 (= e!804401 e!804400)))

(declare-fun res!957110 () Bool)

(assert (=> b!1422355 (=> (not res!957110) (not e!804400))))

(declare-fun lt!626571 () (_ BitVec 64))

(declare-datatypes ((array!97157 0))(
  ( (array!97158 (arr!46894 (Array (_ BitVec 32) (_ BitVec 64))) (size!47445 (_ BitVec 32))) )
))
(declare-fun lt!626569 () array!97157)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11081 0))(
  ( (MissingZero!11081 (index!46716 (_ BitVec 32))) (Found!11081 (index!46717 (_ BitVec 32))) (Intermediate!11081 (undefined!11893 Bool) (index!46718 (_ BitVec 32)) (x!128526 (_ BitVec 32))) (Undefined!11081) (MissingVacant!11081 (index!46719 (_ BitVec 32))) )
))
(declare-fun lt!626570 () SeekEntryResult!11081)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97157 (_ BitVec 32)) SeekEntryResult!11081)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422355 (= res!957110 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626571 mask!2608) lt!626571 lt!626569 mask!2608) lt!626570))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422355 (= lt!626570 (Intermediate!11081 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun a!2831 () array!97157)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1422355 (= lt!626571 (select (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422355 (= lt!626569 (array!97158 (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47445 a!2831)))))

(declare-fun b!1422356 () Bool)

(declare-fun res!957104 () Bool)

(declare-fun e!804398 () Bool)

(assert (=> b!1422356 (=> (not res!957104) (not e!804398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422356 (= res!957104 (validKeyInArray!0 (select (arr!46894 a!2831) i!982)))))

(declare-fun b!1422357 () Bool)

(declare-fun res!957115 () Bool)

(assert (=> b!1422357 (=> (not res!957115) (not e!804398))))

(assert (=> b!1422357 (= res!957115 (and (= (size!47445 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47445 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47445 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422358 () Bool)

(declare-fun res!957114 () Bool)

(assert (=> b!1422358 (=> (not res!957114) (not e!804400))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422358 (= res!957114 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626571 lt!626569 mask!2608) lt!626570))))

(declare-fun b!1422359 () Bool)

(declare-fun res!957112 () Bool)

(assert (=> b!1422359 (=> (not res!957112) (not e!804398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97157 (_ BitVec 32)) Bool)

(assert (=> b!1422359 (= res!957112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422360 () Bool)

(declare-fun res!957106 () Bool)

(assert (=> b!1422360 (=> (not res!957106) (not e!804398))))

(declare-datatypes ((List!33391 0))(
  ( (Nil!33388) (Cons!33387 (h!34697 (_ BitVec 64)) (t!48077 List!33391)) )
))
(declare-fun arrayNoDuplicates!0 (array!97157 (_ BitVec 32) List!33391) Bool)

(assert (=> b!1422360 (= res!957106 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33388))))

(declare-fun b!1422361 () Bool)

(declare-fun res!957107 () Bool)

(assert (=> b!1422361 (=> (not res!957107) (not e!804400))))

(declare-fun lt!626572 () SeekEntryResult!11081)

(assert (=> b!1422361 (= res!957107 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!626572))))

(declare-fun b!1422362 () Bool)

(assert (=> b!1422362 (= e!804400 (not (bvsge mask!2608 #b00000000000000000000000000000000)))))

(assert (=> b!1422362 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48029 0))(
  ( (Unit!48030) )
))
(declare-fun lt!626573 () Unit!48029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48029)

(assert (=> b!1422362 (= lt!626573 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422363 () Bool)

(assert (=> b!1422363 (= e!804398 e!804401)))

(declare-fun res!957109 () Bool)

(assert (=> b!1422363 (=> (not res!957109) (not e!804401))))

(assert (=> b!1422363 (= res!957109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46894 a!2831) j!81) mask!2608) (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!626572))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422363 (= lt!626572 (Intermediate!11081 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422364 () Bool)

(declare-fun res!957113 () Bool)

(assert (=> b!1422364 (=> (not res!957113) (not e!804398))))

(assert (=> b!1422364 (= res!957113 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47445 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47445 a!2831))))))

(declare-fun b!1422365 () Bool)

(declare-fun res!957111 () Bool)

(assert (=> b!1422365 (=> (not res!957111) (not e!804400))))

(assert (=> b!1422365 (= res!957111 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422366 () Bool)

(declare-fun res!957108 () Bool)

(assert (=> b!1422366 (=> (not res!957108) (not e!804398))))

(assert (=> b!1422366 (= res!957108 (validKeyInArray!0 (select (arr!46894 a!2831) j!81)))))

(declare-fun res!957105 () Bool)

(assert (=> start!122870 (=> (not res!957105) (not e!804398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122870 (= res!957105 (validMask!0 mask!2608))))

(assert (=> start!122870 e!804398))

(assert (=> start!122870 true))

(declare-fun array_inv!36175 (array!97157) Bool)

(assert (=> start!122870 (array_inv!36175 a!2831)))

(assert (= (and start!122870 res!957105) b!1422357))

(assert (= (and b!1422357 res!957115) b!1422356))

(assert (= (and b!1422356 res!957104) b!1422366))

(assert (= (and b!1422366 res!957108) b!1422359))

(assert (= (and b!1422359 res!957112) b!1422360))

(assert (= (and b!1422360 res!957106) b!1422364))

(assert (= (and b!1422364 res!957113) b!1422363))

(assert (= (and b!1422363 res!957109) b!1422355))

(assert (= (and b!1422355 res!957110) b!1422361))

(assert (= (and b!1422361 res!957107) b!1422358))

(assert (= (and b!1422358 res!957114) b!1422365))

(assert (= (and b!1422365 res!957111) b!1422362))

(declare-fun m!1313127 () Bool)

(assert (=> b!1422356 m!1313127))

(assert (=> b!1422356 m!1313127))

(declare-fun m!1313129 () Bool)

(assert (=> b!1422356 m!1313129))

(declare-fun m!1313131 () Bool)

(assert (=> b!1422360 m!1313131))

(declare-fun m!1313133 () Bool)

(assert (=> b!1422363 m!1313133))

(assert (=> b!1422363 m!1313133))

(declare-fun m!1313135 () Bool)

(assert (=> b!1422363 m!1313135))

(assert (=> b!1422363 m!1313135))

(assert (=> b!1422363 m!1313133))

(declare-fun m!1313137 () Bool)

(assert (=> b!1422363 m!1313137))

(declare-fun m!1313139 () Bool)

(assert (=> b!1422358 m!1313139))

(assert (=> b!1422366 m!1313133))

(assert (=> b!1422366 m!1313133))

(declare-fun m!1313141 () Bool)

(assert (=> b!1422366 m!1313141))

(assert (=> b!1422361 m!1313133))

(assert (=> b!1422361 m!1313133))

(declare-fun m!1313143 () Bool)

(assert (=> b!1422361 m!1313143))

(declare-fun m!1313145 () Bool)

(assert (=> b!1422355 m!1313145))

(assert (=> b!1422355 m!1313145))

(declare-fun m!1313147 () Bool)

(assert (=> b!1422355 m!1313147))

(declare-fun m!1313149 () Bool)

(assert (=> b!1422355 m!1313149))

(declare-fun m!1313151 () Bool)

(assert (=> b!1422355 m!1313151))

(declare-fun m!1313153 () Bool)

(assert (=> b!1422359 m!1313153))

(declare-fun m!1313155 () Bool)

(assert (=> b!1422362 m!1313155))

(declare-fun m!1313157 () Bool)

(assert (=> b!1422362 m!1313157))

(declare-fun m!1313159 () Bool)

(assert (=> start!122870 m!1313159))

(declare-fun m!1313161 () Bool)

(assert (=> start!122870 m!1313161))

(check-sat (not b!1422361) (not start!122870) (not b!1422359) (not b!1422363) (not b!1422362) (not b!1422356) (not b!1422360) (not b!1422355) (not b!1422358) (not b!1422366))
(check-sat)
