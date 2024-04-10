; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121206 () Bool)

(assert start!121206)

(declare-fun b!1409318 () Bool)

(declare-fun e!797537 () Bool)

(declare-fun e!797534 () Bool)

(assert (=> b!1409318 (= e!797537 (not e!797534))))

(declare-fun res!947042 () Bool)

(assert (=> b!1409318 (=> res!947042 e!797534)))

(declare-datatypes ((SeekEntryResult!10834 0))(
  ( (MissingZero!10834 (index!45713 (_ BitVec 32))) (Found!10834 (index!45714 (_ BitVec 32))) (Intermediate!10834 (undefined!11646 Bool) (index!45715 (_ BitVec 32)) (x!127307 (_ BitVec 32))) (Undefined!10834) (MissingVacant!10834 (index!45716 (_ BitVec 32))) )
))
(declare-fun lt!620678 () SeekEntryResult!10834)

(assert (=> b!1409318 (= res!947042 (or (not (is-Intermediate!10834 lt!620678)) (undefined!11646 lt!620678)))))

(declare-fun e!797536 () Bool)

(assert (=> b!1409318 e!797536))

(declare-fun res!947040 () Bool)

(assert (=> b!1409318 (=> (not res!947040) (not e!797536))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96360 0))(
  ( (array!96361 (arr!46523 (Array (_ BitVec 32) (_ BitVec 64))) (size!47073 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96360)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96360 (_ BitVec 32)) Bool)

(assert (=> b!1409318 (= res!947040 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47642 0))(
  ( (Unit!47643) )
))
(declare-fun lt!620677 () Unit!47642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47642)

(assert (=> b!1409318 (= lt!620677 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96360 (_ BitVec 32)) SeekEntryResult!10834)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409318 (= lt!620678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46523 a!2901) j!112) mask!2840) (select (arr!46523 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409319 () Bool)

(declare-fun res!947045 () Bool)

(assert (=> b!1409319 (=> (not res!947045) (not e!797537))))

(declare-datatypes ((List!33042 0))(
  ( (Nil!33039) (Cons!33038 (h!34301 (_ BitVec 64)) (t!47736 List!33042)) )
))
(declare-fun arrayNoDuplicates!0 (array!96360 (_ BitVec 32) List!33042) Bool)

(assert (=> b!1409319 (= res!947045 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33039))))

(declare-fun b!1409320 () Bool)

(assert (=> b!1409320 (= e!797534 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620679 () SeekEntryResult!10834)

(assert (=> b!1409320 (= lt!620679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46523 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46523 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96361 (store (arr!46523 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47073 a!2901)) mask!2840))))

(declare-fun b!1409321 () Bool)

(declare-fun res!947043 () Bool)

(assert (=> b!1409321 (=> (not res!947043) (not e!797537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409321 (= res!947043 (validKeyInArray!0 (select (arr!46523 a!2901) i!1037)))))

(declare-fun b!1409322 () Bool)

(declare-fun res!947046 () Bool)

(assert (=> b!1409322 (=> (not res!947046) (not e!797537))))

(assert (=> b!1409322 (= res!947046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409323 () Bool)

(declare-fun res!947044 () Bool)

(assert (=> b!1409323 (=> (not res!947044) (not e!797537))))

(assert (=> b!1409323 (= res!947044 (validKeyInArray!0 (select (arr!46523 a!2901) j!112)))))

(declare-fun res!947047 () Bool)

(assert (=> start!121206 (=> (not res!947047) (not e!797537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121206 (= res!947047 (validMask!0 mask!2840))))

(assert (=> start!121206 e!797537))

(assert (=> start!121206 true))

(declare-fun array_inv!35551 (array!96360) Bool)

(assert (=> start!121206 (array_inv!35551 a!2901)))

(declare-fun b!1409324 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96360 (_ BitVec 32)) SeekEntryResult!10834)

(assert (=> b!1409324 (= e!797536 (= (seekEntryOrOpen!0 (select (arr!46523 a!2901) j!112) a!2901 mask!2840) (Found!10834 j!112)))))

(declare-fun b!1409325 () Bool)

(declare-fun res!947041 () Bool)

(assert (=> b!1409325 (=> (not res!947041) (not e!797537))))

(assert (=> b!1409325 (= res!947041 (and (= (size!47073 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47073 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47073 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121206 res!947047) b!1409325))

(assert (= (and b!1409325 res!947041) b!1409321))

(assert (= (and b!1409321 res!947043) b!1409323))

(assert (= (and b!1409323 res!947044) b!1409322))

(assert (= (and b!1409322 res!947046) b!1409319))

(assert (= (and b!1409319 res!947045) b!1409318))

(assert (= (and b!1409318 res!947040) b!1409324))

(assert (= (and b!1409318 (not res!947042)) b!1409320))

(declare-fun m!1298985 () Bool)

(assert (=> b!1409322 m!1298985))

(declare-fun m!1298987 () Bool)

(assert (=> start!121206 m!1298987))

(declare-fun m!1298989 () Bool)

(assert (=> start!121206 m!1298989))

(declare-fun m!1298991 () Bool)

(assert (=> b!1409323 m!1298991))

(assert (=> b!1409323 m!1298991))

(declare-fun m!1298993 () Bool)

(assert (=> b!1409323 m!1298993))

(declare-fun m!1298995 () Bool)

(assert (=> b!1409320 m!1298995))

(declare-fun m!1298997 () Bool)

(assert (=> b!1409320 m!1298997))

(assert (=> b!1409320 m!1298997))

(declare-fun m!1298999 () Bool)

(assert (=> b!1409320 m!1298999))

(assert (=> b!1409320 m!1298999))

(assert (=> b!1409320 m!1298997))

(declare-fun m!1299001 () Bool)

(assert (=> b!1409320 m!1299001))

(assert (=> b!1409318 m!1298991))

(declare-fun m!1299003 () Bool)

(assert (=> b!1409318 m!1299003))

(assert (=> b!1409318 m!1298991))

(declare-fun m!1299005 () Bool)

(assert (=> b!1409318 m!1299005))

(assert (=> b!1409318 m!1299003))

(assert (=> b!1409318 m!1298991))

(declare-fun m!1299007 () Bool)

(assert (=> b!1409318 m!1299007))

(declare-fun m!1299009 () Bool)

(assert (=> b!1409318 m!1299009))

(declare-fun m!1299011 () Bool)

(assert (=> b!1409321 m!1299011))

(assert (=> b!1409321 m!1299011))

(declare-fun m!1299013 () Bool)

(assert (=> b!1409321 m!1299013))

(declare-fun m!1299015 () Bool)

(assert (=> b!1409319 m!1299015))

(assert (=> b!1409324 m!1298991))

(assert (=> b!1409324 m!1298991))

(declare-fun m!1299017 () Bool)

(assert (=> b!1409324 m!1299017))

(push 1)

(assert (not b!1409319))

(assert (not b!1409324))

(assert (not b!1409318))

(assert (not b!1409321))

(assert (not start!121206))

(assert (not b!1409320))

(assert (not b!1409322))

(assert (not b!1409323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

