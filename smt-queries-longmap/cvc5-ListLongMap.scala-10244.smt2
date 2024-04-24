; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120708 () Bool)

(assert start!120708)

(declare-fun b!1404506 () Bool)

(declare-fun res!942337 () Bool)

(declare-fun e!795346 () Bool)

(assert (=> b!1404506 (=> (not res!942337) (not e!795346))))

(declare-datatypes ((array!96039 0))(
  ( (array!96040 (arr!46368 (Array (_ BitVec 32) (_ BitVec 64))) (size!46919 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96039)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96039 (_ BitVec 32)) Bool)

(assert (=> b!1404506 (= res!942337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942338 () Bool)

(assert (=> start!120708 (=> (not res!942338) (not e!795346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120708 (= res!942338 (validMask!0 mask!2840))))

(assert (=> start!120708 e!795346))

(assert (=> start!120708 true))

(declare-fun array_inv!35649 (array!96039) Bool)

(assert (=> start!120708 (array_inv!35649 a!2901)))

(declare-fun b!1404507 () Bool)

(declare-fun res!942334 () Bool)

(assert (=> b!1404507 (=> (not res!942334) (not e!795346))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404507 (= res!942334 (validKeyInArray!0 (select (arr!46368 a!2901) j!112)))))

(declare-fun b!1404508 () Bool)

(declare-fun e!795344 () Bool)

(assert (=> b!1404508 (= e!795344 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10588 0))(
  ( (MissingZero!10588 (index!44729 (_ BitVec 32))) (Found!10588 (index!44730 (_ BitVec 32))) (Intermediate!10588 (undefined!11400 Bool) (index!44731 (_ BitVec 32)) (x!126490 (_ BitVec 32))) (Undefined!10588) (MissingVacant!10588 (index!44732 (_ BitVec 32))) )
))
(declare-fun lt!618772 () SeekEntryResult!10588)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96039 (_ BitVec 32)) SeekEntryResult!10588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404508 (= lt!618772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46368 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46368 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96040 (store (arr!46368 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46919 a!2901)) mask!2840))))

(declare-fun b!1404509 () Bool)

(assert (=> b!1404509 (= e!795346 (not e!795344))))

(declare-fun res!942333 () Bool)

(assert (=> b!1404509 (=> res!942333 e!795344)))

(declare-fun lt!618771 () SeekEntryResult!10588)

(assert (=> b!1404509 (= res!942333 (or (not (is-Intermediate!10588 lt!618771)) (undefined!11400 lt!618771)))))

(declare-fun e!795347 () Bool)

(assert (=> b!1404509 e!795347))

(declare-fun res!942335 () Bool)

(assert (=> b!1404509 (=> (not res!942335) (not e!795347))))

(assert (=> b!1404509 (= res!942335 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47207 0))(
  ( (Unit!47208) )
))
(declare-fun lt!618773 () Unit!47207)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47207)

(assert (=> b!1404509 (= lt!618773 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1404509 (= lt!618771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46368 a!2901) j!112) mask!2840) (select (arr!46368 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404510 () Bool)

(declare-fun res!942336 () Bool)

(assert (=> b!1404510 (=> (not res!942336) (not e!795346))))

(assert (=> b!1404510 (= res!942336 (and (= (size!46919 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46919 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46919 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404511 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96039 (_ BitVec 32)) SeekEntryResult!10588)

(assert (=> b!1404511 (= e!795347 (= (seekEntryOrOpen!0 (select (arr!46368 a!2901) j!112) a!2901 mask!2840) (Found!10588 j!112)))))

(declare-fun b!1404512 () Bool)

(declare-fun res!942339 () Bool)

(assert (=> b!1404512 (=> (not res!942339) (not e!795346))))

(assert (=> b!1404512 (= res!942339 (validKeyInArray!0 (select (arr!46368 a!2901) i!1037)))))

(declare-fun b!1404513 () Bool)

(declare-fun res!942340 () Bool)

(assert (=> b!1404513 (=> (not res!942340) (not e!795346))))

(declare-datatypes ((List!32874 0))(
  ( (Nil!32871) (Cons!32870 (h!34126 (_ BitVec 64)) (t!47560 List!32874)) )
))
(declare-fun arrayNoDuplicates!0 (array!96039 (_ BitVec 32) List!32874) Bool)

(assert (=> b!1404513 (= res!942340 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32871))))

(assert (= (and start!120708 res!942338) b!1404510))

(assert (= (and b!1404510 res!942336) b!1404512))

(assert (= (and b!1404512 res!942339) b!1404507))

(assert (= (and b!1404507 res!942334) b!1404506))

(assert (= (and b!1404506 res!942337) b!1404513))

(assert (= (and b!1404513 res!942340) b!1404509))

(assert (= (and b!1404509 res!942335) b!1404511))

(assert (= (and b!1404509 (not res!942333)) b!1404508))

(declare-fun m!1293345 () Bool)

(assert (=> b!1404508 m!1293345))

(declare-fun m!1293347 () Bool)

(assert (=> b!1404508 m!1293347))

(assert (=> b!1404508 m!1293347))

(declare-fun m!1293349 () Bool)

(assert (=> b!1404508 m!1293349))

(assert (=> b!1404508 m!1293349))

(assert (=> b!1404508 m!1293347))

(declare-fun m!1293351 () Bool)

(assert (=> b!1404508 m!1293351))

(declare-fun m!1293353 () Bool)

(assert (=> b!1404506 m!1293353))

(declare-fun m!1293355 () Bool)

(assert (=> b!1404507 m!1293355))

(assert (=> b!1404507 m!1293355))

(declare-fun m!1293357 () Bool)

(assert (=> b!1404507 m!1293357))

(declare-fun m!1293359 () Bool)

(assert (=> start!120708 m!1293359))

(declare-fun m!1293361 () Bool)

(assert (=> start!120708 m!1293361))

(assert (=> b!1404509 m!1293355))

(declare-fun m!1293363 () Bool)

(assert (=> b!1404509 m!1293363))

(assert (=> b!1404509 m!1293355))

(declare-fun m!1293365 () Bool)

(assert (=> b!1404509 m!1293365))

(assert (=> b!1404509 m!1293363))

(assert (=> b!1404509 m!1293355))

(declare-fun m!1293367 () Bool)

(assert (=> b!1404509 m!1293367))

(declare-fun m!1293369 () Bool)

(assert (=> b!1404509 m!1293369))

(assert (=> b!1404511 m!1293355))

(assert (=> b!1404511 m!1293355))

(declare-fun m!1293371 () Bool)

(assert (=> b!1404511 m!1293371))

(declare-fun m!1293373 () Bool)

(assert (=> b!1404512 m!1293373))

(assert (=> b!1404512 m!1293373))

(declare-fun m!1293375 () Bool)

(assert (=> b!1404512 m!1293375))

(declare-fun m!1293377 () Bool)

(assert (=> b!1404513 m!1293377))

(push 1)

(assert (not start!120708))

(assert (not b!1404511))

(assert (not b!1404507))

(assert (not b!1404508))

(assert (not b!1404512))

(assert (not b!1404509))

(assert (not b!1404513))

(assert (not b!1404506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

