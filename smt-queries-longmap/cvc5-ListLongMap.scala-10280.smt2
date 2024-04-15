; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120840 () Bool)

(assert start!120840)

(declare-fun b!1405991 () Bool)

(declare-fun e!795819 () Bool)

(assert (=> b!1405991 (= e!795819 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96100 0))(
  ( (array!96101 (arr!46398 (Array (_ BitVec 32) (_ BitVec 64))) (size!46950 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96100)

(declare-datatypes ((SeekEntryResult!10735 0))(
  ( (MissingZero!10735 (index!45317 (_ BitVec 32))) (Found!10735 (index!45318 (_ BitVec 32))) (Intermediate!10735 (undefined!11547 Bool) (index!45319 (_ BitVec 32)) (x!126915 (_ BitVec 32))) (Undefined!10735) (MissingVacant!10735 (index!45320 (_ BitVec 32))) )
))
(declare-fun lt!619058 () SeekEntryResult!10735)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96100 (_ BitVec 32)) SeekEntryResult!10735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405991 (= lt!619058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46398 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46398 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96101 (store (arr!46398 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46950 a!2901)) mask!2840))))

(declare-fun b!1405992 () Bool)

(declare-fun res!944262 () Bool)

(declare-fun e!795821 () Bool)

(assert (=> b!1405992 (=> (not res!944262) (not e!795821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405992 (= res!944262 (validKeyInArray!0 (select (arr!46398 a!2901) j!112)))))

(declare-fun b!1405993 () Bool)

(declare-fun res!944260 () Bool)

(assert (=> b!1405993 (=> (not res!944260) (not e!795821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96100 (_ BitVec 32)) Bool)

(assert (=> b!1405993 (= res!944260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944265 () Bool)

(assert (=> start!120840 (=> (not res!944265) (not e!795821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120840 (= res!944265 (validMask!0 mask!2840))))

(assert (=> start!120840 e!795821))

(assert (=> start!120840 true))

(declare-fun array_inv!35631 (array!96100) Bool)

(assert (=> start!120840 (array_inv!35631 a!2901)))

(declare-fun b!1405994 () Bool)

(declare-fun res!944266 () Bool)

(assert (=> b!1405994 (=> (not res!944266) (not e!795821))))

(declare-datatypes ((List!32995 0))(
  ( (Nil!32992) (Cons!32991 (h!34245 (_ BitVec 64)) (t!47681 List!32995)) )
))
(declare-fun arrayNoDuplicates!0 (array!96100 (_ BitVec 32) List!32995) Bool)

(assert (=> b!1405994 (= res!944266 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32992))))

(declare-fun e!795818 () Bool)

(declare-fun b!1405995 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96100 (_ BitVec 32)) SeekEntryResult!10735)

(assert (=> b!1405995 (= e!795818 (= (seekEntryOrOpen!0 (select (arr!46398 a!2901) j!112) a!2901 mask!2840) (Found!10735 j!112)))))

(declare-fun b!1405996 () Bool)

(declare-fun res!944263 () Bool)

(assert (=> b!1405996 (=> (not res!944263) (not e!795821))))

(assert (=> b!1405996 (= res!944263 (validKeyInArray!0 (select (arr!46398 a!2901) i!1037)))))

(declare-fun b!1405997 () Bool)

(assert (=> b!1405997 (= e!795821 (not e!795819))))

(declare-fun res!944259 () Bool)

(assert (=> b!1405997 (=> res!944259 e!795819)))

(declare-fun lt!619057 () SeekEntryResult!10735)

(assert (=> b!1405997 (= res!944259 (or (not (is-Intermediate!10735 lt!619057)) (undefined!11547 lt!619057)))))

(assert (=> b!1405997 e!795818))

(declare-fun res!944264 () Bool)

(assert (=> b!1405997 (=> (not res!944264) (not e!795818))))

(assert (=> b!1405997 (= res!944264 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47287 0))(
  ( (Unit!47288) )
))
(declare-fun lt!619056 () Unit!47287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47287)

(assert (=> b!1405997 (= lt!619056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405997 (= lt!619057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46398 a!2901) j!112) mask!2840) (select (arr!46398 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405998 () Bool)

(declare-fun res!944261 () Bool)

(assert (=> b!1405998 (=> (not res!944261) (not e!795821))))

(assert (=> b!1405998 (= res!944261 (and (= (size!46950 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46950 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46950 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120840 res!944265) b!1405998))

(assert (= (and b!1405998 res!944261) b!1405996))

(assert (= (and b!1405996 res!944263) b!1405992))

(assert (= (and b!1405992 res!944262) b!1405993))

(assert (= (and b!1405993 res!944260) b!1405994))

(assert (= (and b!1405994 res!944266) b!1405997))

(assert (= (and b!1405997 res!944264) b!1405995))

(assert (= (and b!1405997 (not res!944259)) b!1405991))

(declare-fun m!1294527 () Bool)

(assert (=> b!1405995 m!1294527))

(assert (=> b!1405995 m!1294527))

(declare-fun m!1294529 () Bool)

(assert (=> b!1405995 m!1294529))

(assert (=> b!1405997 m!1294527))

(declare-fun m!1294531 () Bool)

(assert (=> b!1405997 m!1294531))

(assert (=> b!1405997 m!1294527))

(declare-fun m!1294533 () Bool)

(assert (=> b!1405997 m!1294533))

(assert (=> b!1405997 m!1294531))

(assert (=> b!1405997 m!1294527))

(declare-fun m!1294535 () Bool)

(assert (=> b!1405997 m!1294535))

(declare-fun m!1294537 () Bool)

(assert (=> b!1405997 m!1294537))

(declare-fun m!1294539 () Bool)

(assert (=> b!1405994 m!1294539))

(declare-fun m!1294541 () Bool)

(assert (=> b!1405996 m!1294541))

(assert (=> b!1405996 m!1294541))

(declare-fun m!1294543 () Bool)

(assert (=> b!1405996 m!1294543))

(declare-fun m!1294545 () Bool)

(assert (=> b!1405991 m!1294545))

(declare-fun m!1294547 () Bool)

(assert (=> b!1405991 m!1294547))

(assert (=> b!1405991 m!1294547))

(declare-fun m!1294549 () Bool)

(assert (=> b!1405991 m!1294549))

(assert (=> b!1405991 m!1294549))

(assert (=> b!1405991 m!1294547))

(declare-fun m!1294551 () Bool)

(assert (=> b!1405991 m!1294551))

(declare-fun m!1294553 () Bool)

(assert (=> start!120840 m!1294553))

(declare-fun m!1294555 () Bool)

(assert (=> start!120840 m!1294555))

(declare-fun m!1294557 () Bool)

(assert (=> b!1405993 m!1294557))

(assert (=> b!1405992 m!1294527))

(assert (=> b!1405992 m!1294527))

(declare-fun m!1294559 () Bool)

(assert (=> b!1405992 m!1294559))

(push 1)

(assert (not b!1405996))

(assert (not b!1405995))

(assert (not b!1405991))

(assert (not start!120840))

(assert (not b!1405994))

(assert (not b!1405997))

(assert (not b!1405992))

(assert (not b!1405993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

