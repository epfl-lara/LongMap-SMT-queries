; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121230 () Bool)

(assert start!121230)

(declare-fun b!1409606 () Bool)

(declare-fun res!947332 () Bool)

(declare-fun e!797680 () Bool)

(assert (=> b!1409606 (=> (not res!947332) (not e!797680))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96384 0))(
  ( (array!96385 (arr!46535 (Array (_ BitVec 32) (_ BitVec 64))) (size!47085 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96384)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409606 (= res!947332 (and (= (size!47085 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47085 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47085 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409607 () Bool)

(declare-fun res!947334 () Bool)

(assert (=> b!1409607 (=> (not res!947334) (not e!797680))))

(declare-datatypes ((List!33054 0))(
  ( (Nil!33051) (Cons!33050 (h!34313 (_ BitVec 64)) (t!47748 List!33054)) )
))
(declare-fun arrayNoDuplicates!0 (array!96384 (_ BitVec 32) List!33054) Bool)

(assert (=> b!1409607 (= res!947334 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33051))))

(declare-fun res!947328 () Bool)

(assert (=> start!121230 (=> (not res!947328) (not e!797680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121230 (= res!947328 (validMask!0 mask!2840))))

(assert (=> start!121230 e!797680))

(assert (=> start!121230 true))

(declare-fun array_inv!35563 (array!96384) Bool)

(assert (=> start!121230 (array_inv!35563 a!2901)))

(declare-fun e!797678 () Bool)

(declare-fun b!1409608 () Bool)

(declare-datatypes ((SeekEntryResult!10846 0))(
  ( (MissingZero!10846 (index!45761 (_ BitVec 32))) (Found!10846 (index!45762 (_ BitVec 32))) (Intermediate!10846 (undefined!11658 Bool) (index!45763 (_ BitVec 32)) (x!127351 (_ BitVec 32))) (Undefined!10846) (MissingVacant!10846 (index!45764 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96384 (_ BitVec 32)) SeekEntryResult!10846)

(assert (=> b!1409608 (= e!797678 (= (seekEntryOrOpen!0 (select (arr!46535 a!2901) j!112) a!2901 mask!2840) (Found!10846 j!112)))))

(declare-fun b!1409609 () Bool)

(declare-fun res!947330 () Bool)

(assert (=> b!1409609 (=> (not res!947330) (not e!797680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409609 (= res!947330 (validKeyInArray!0 (select (arr!46535 a!2901) j!112)))))

(declare-fun b!1409610 () Bool)

(declare-fun e!797679 () Bool)

(assert (=> b!1409610 (= e!797679 true)))

(declare-fun lt!620786 () SeekEntryResult!10846)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96384 (_ BitVec 32)) SeekEntryResult!10846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409610 (= lt!620786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46535 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46535 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96385 (store (arr!46535 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47085 a!2901)) mask!2840))))

(declare-fun b!1409611 () Bool)

(declare-fun res!947333 () Bool)

(assert (=> b!1409611 (=> (not res!947333) (not e!797680))))

(assert (=> b!1409611 (= res!947333 (validKeyInArray!0 (select (arr!46535 a!2901) i!1037)))))

(declare-fun b!1409612 () Bool)

(declare-fun res!947335 () Bool)

(assert (=> b!1409612 (=> (not res!947335) (not e!797680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96384 (_ BitVec 32)) Bool)

(assert (=> b!1409612 (= res!947335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409613 () Bool)

(assert (=> b!1409613 (= e!797680 (not e!797679))))

(declare-fun res!947331 () Bool)

(assert (=> b!1409613 (=> res!947331 e!797679)))

(declare-fun lt!620785 () SeekEntryResult!10846)

(assert (=> b!1409613 (= res!947331 (or (not (is-Intermediate!10846 lt!620785)) (undefined!11658 lt!620785)))))

(assert (=> b!1409613 e!797678))

(declare-fun res!947329 () Bool)

(assert (=> b!1409613 (=> (not res!947329) (not e!797678))))

(assert (=> b!1409613 (= res!947329 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47666 0))(
  ( (Unit!47667) )
))
(declare-fun lt!620787 () Unit!47666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47666)

(assert (=> b!1409613 (= lt!620787 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409613 (= lt!620785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46535 a!2901) j!112) mask!2840) (select (arr!46535 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121230 res!947328) b!1409606))

(assert (= (and b!1409606 res!947332) b!1409611))

(assert (= (and b!1409611 res!947333) b!1409609))

(assert (= (and b!1409609 res!947330) b!1409612))

(assert (= (and b!1409612 res!947335) b!1409607))

(assert (= (and b!1409607 res!947334) b!1409613))

(assert (= (and b!1409613 res!947329) b!1409608))

(assert (= (and b!1409613 (not res!947331)) b!1409610))

(declare-fun m!1299393 () Bool)

(assert (=> start!121230 m!1299393))

(declare-fun m!1299395 () Bool)

(assert (=> start!121230 m!1299395))

(declare-fun m!1299397 () Bool)

(assert (=> b!1409611 m!1299397))

(assert (=> b!1409611 m!1299397))

(declare-fun m!1299399 () Bool)

(assert (=> b!1409611 m!1299399))

(declare-fun m!1299401 () Bool)

(assert (=> b!1409613 m!1299401))

(declare-fun m!1299403 () Bool)

(assert (=> b!1409613 m!1299403))

(assert (=> b!1409613 m!1299401))

(declare-fun m!1299405 () Bool)

(assert (=> b!1409613 m!1299405))

(assert (=> b!1409613 m!1299403))

(assert (=> b!1409613 m!1299401))

(declare-fun m!1299407 () Bool)

(assert (=> b!1409613 m!1299407))

(declare-fun m!1299409 () Bool)

(assert (=> b!1409613 m!1299409))

(declare-fun m!1299411 () Bool)

(assert (=> b!1409612 m!1299411))

(assert (=> b!1409608 m!1299401))

(assert (=> b!1409608 m!1299401))

(declare-fun m!1299413 () Bool)

(assert (=> b!1409608 m!1299413))

(declare-fun m!1299415 () Bool)

(assert (=> b!1409607 m!1299415))

(assert (=> b!1409609 m!1299401))

(assert (=> b!1409609 m!1299401))

(declare-fun m!1299417 () Bool)

(assert (=> b!1409609 m!1299417))

(declare-fun m!1299419 () Bool)

(assert (=> b!1409610 m!1299419))

(declare-fun m!1299421 () Bool)

(assert (=> b!1409610 m!1299421))

(assert (=> b!1409610 m!1299421))

(declare-fun m!1299423 () Bool)

(assert (=> b!1409610 m!1299423))

(assert (=> b!1409610 m!1299423))

(assert (=> b!1409610 m!1299421))

(declare-fun m!1299425 () Bool)

(assert (=> b!1409610 m!1299425))

(push 1)

(assert (not b!1409608))

(assert (not b!1409613))

(assert (not b!1409612))

(assert (not b!1409610))

(assert (not b!1409609))

(assert (not b!1409607))

(assert (not start!121230))

(assert (not b!1409611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

