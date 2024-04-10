; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120798 () Bool)

(assert start!120798)

(declare-fun b!1405536 () Bool)

(declare-fun res!943755 () Bool)

(declare-fun e!795599 () Bool)

(assert (=> b!1405536 (=> (not res!943755) (not e!795599))))

(declare-datatypes ((array!96105 0))(
  ( (array!96106 (arr!46400 (Array (_ BitVec 32) (_ BitVec 64))) (size!46950 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96105)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96105 (_ BitVec 32)) Bool)

(assert (=> b!1405536 (= res!943755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405537 () Bool)

(declare-fun res!943757 () Bool)

(assert (=> b!1405537 (=> (not res!943757) (not e!795599))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405537 (= res!943757 (and (= (size!46950 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46950 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46950 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!795597 () Bool)

(declare-fun b!1405538 () Bool)

(declare-datatypes ((SeekEntryResult!10711 0))(
  ( (MissingZero!10711 (index!45221 (_ BitVec 32))) (Found!10711 (index!45222 (_ BitVec 32))) (Intermediate!10711 (undefined!11523 Bool) (index!45223 (_ BitVec 32)) (x!126838 (_ BitVec 32))) (Undefined!10711) (MissingVacant!10711 (index!45224 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96105 (_ BitVec 32)) SeekEntryResult!10711)

(assert (=> b!1405538 (= e!795597 (= (seekEntryOrOpen!0 (select (arr!46400 a!2901) j!112) a!2901 mask!2840) (Found!10711 j!112)))))

(declare-fun b!1405539 () Bool)

(assert (=> b!1405539 (= e!795599 (not true))))

(assert (=> b!1405539 e!795597))

(declare-fun res!943754 () Bool)

(assert (=> b!1405539 (=> (not res!943754) (not e!795597))))

(assert (=> b!1405539 (= res!943754 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47396 0))(
  ( (Unit!47397) )
))
(declare-fun lt!619055 () Unit!47396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47396)

(assert (=> b!1405539 (= lt!619055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619056 () SeekEntryResult!10711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96105 (_ BitVec 32)) SeekEntryResult!10711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405539 (= lt!619056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46400 a!2901) j!112) mask!2840) (select (arr!46400 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943753 () Bool)

(assert (=> start!120798 (=> (not res!943753) (not e!795599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120798 (= res!943753 (validMask!0 mask!2840))))

(assert (=> start!120798 e!795599))

(assert (=> start!120798 true))

(declare-fun array_inv!35428 (array!96105) Bool)

(assert (=> start!120798 (array_inv!35428 a!2901)))

(declare-fun b!1405540 () Bool)

(declare-fun res!943759 () Bool)

(assert (=> b!1405540 (=> (not res!943759) (not e!795599))))

(declare-datatypes ((List!32919 0))(
  ( (Nil!32916) (Cons!32915 (h!34169 (_ BitVec 64)) (t!47613 List!32919)) )
))
(declare-fun arrayNoDuplicates!0 (array!96105 (_ BitVec 32) List!32919) Bool)

(assert (=> b!1405540 (= res!943759 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32916))))

(declare-fun b!1405541 () Bool)

(declare-fun res!943756 () Bool)

(assert (=> b!1405541 (=> (not res!943756) (not e!795599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405541 (= res!943756 (validKeyInArray!0 (select (arr!46400 a!2901) i!1037)))))

(declare-fun b!1405542 () Bool)

(declare-fun res!943758 () Bool)

(assert (=> b!1405542 (=> (not res!943758) (not e!795599))))

(assert (=> b!1405542 (= res!943758 (validKeyInArray!0 (select (arr!46400 a!2901) j!112)))))

(assert (= (and start!120798 res!943753) b!1405537))

(assert (= (and b!1405537 res!943757) b!1405541))

(assert (= (and b!1405541 res!943756) b!1405542))

(assert (= (and b!1405542 res!943758) b!1405536))

(assert (= (and b!1405536 res!943755) b!1405540))

(assert (= (and b!1405540 res!943759) b!1405539))

(assert (= (and b!1405539 res!943754) b!1405538))

(declare-fun m!1294341 () Bool)

(assert (=> b!1405539 m!1294341))

(declare-fun m!1294343 () Bool)

(assert (=> b!1405539 m!1294343))

(assert (=> b!1405539 m!1294341))

(declare-fun m!1294345 () Bool)

(assert (=> b!1405539 m!1294345))

(assert (=> b!1405539 m!1294343))

(assert (=> b!1405539 m!1294341))

(declare-fun m!1294347 () Bool)

(assert (=> b!1405539 m!1294347))

(declare-fun m!1294349 () Bool)

(assert (=> b!1405539 m!1294349))

(declare-fun m!1294351 () Bool)

(assert (=> b!1405541 m!1294351))

(assert (=> b!1405541 m!1294351))

(declare-fun m!1294353 () Bool)

(assert (=> b!1405541 m!1294353))

(declare-fun m!1294355 () Bool)

(assert (=> start!120798 m!1294355))

(declare-fun m!1294357 () Bool)

(assert (=> start!120798 m!1294357))

(declare-fun m!1294359 () Bool)

(assert (=> b!1405536 m!1294359))

(assert (=> b!1405542 m!1294341))

(assert (=> b!1405542 m!1294341))

(declare-fun m!1294361 () Bool)

(assert (=> b!1405542 m!1294361))

(declare-fun m!1294363 () Bool)

(assert (=> b!1405540 m!1294363))

(assert (=> b!1405538 m!1294341))

(assert (=> b!1405538 m!1294341))

(declare-fun m!1294365 () Bool)

(assert (=> b!1405538 m!1294365))

(push 1)

(assert (not b!1405541))

(assert (not start!120798))

(assert (not b!1405539))

(assert (not b!1405538))

(assert (not b!1405540))

(assert (not b!1405542))

(assert (not b!1405536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

