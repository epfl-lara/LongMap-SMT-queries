; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120720 () Bool)

(assert start!120720)

(declare-fun b!1404650 () Bool)

(declare-fun res!942480 () Bool)

(declare-fun e!795416 () Bool)

(assert (=> b!1404650 (=> (not res!942480) (not e!795416))))

(declare-datatypes ((array!96051 0))(
  ( (array!96052 (arr!46374 (Array (_ BitVec 32) (_ BitVec 64))) (size!46925 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96051)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404650 (= res!942480 (validKeyInArray!0 (select (arr!46374 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1404651 () Bool)

(declare-fun e!795418 () Bool)

(declare-datatypes ((SeekEntryResult!10594 0))(
  ( (MissingZero!10594 (index!44753 (_ BitVec 32))) (Found!10594 (index!44754 (_ BitVec 32))) (Intermediate!10594 (undefined!11406 Bool) (index!44755 (_ BitVec 32)) (x!126512 (_ BitVec 32))) (Undefined!10594) (MissingVacant!10594 (index!44756 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96051 (_ BitVec 32)) SeekEntryResult!10594)

(assert (=> b!1404651 (= e!795418 (= (seekEntryOrOpen!0 (select (arr!46374 a!2901) j!112) a!2901 mask!2840) (Found!10594 j!112)))))

(declare-fun b!1404652 () Bool)

(declare-fun res!942482 () Bool)

(assert (=> b!1404652 (=> (not res!942482) (not e!795416))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404652 (= res!942482 (validKeyInArray!0 (select (arr!46374 a!2901) i!1037)))))

(declare-fun b!1404653 () Bool)

(declare-fun res!942479 () Bool)

(assert (=> b!1404653 (=> (not res!942479) (not e!795416))))

(declare-datatypes ((List!32880 0))(
  ( (Nil!32877) (Cons!32876 (h!34132 (_ BitVec 64)) (t!47566 List!32880)) )
))
(declare-fun arrayNoDuplicates!0 (array!96051 (_ BitVec 32) List!32880) Bool)

(assert (=> b!1404653 (= res!942479 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32877))))

(declare-fun res!942483 () Bool)

(assert (=> start!120720 (=> (not res!942483) (not e!795416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120720 (= res!942483 (validMask!0 mask!2840))))

(assert (=> start!120720 e!795416))

(assert (=> start!120720 true))

(declare-fun array_inv!35655 (array!96051) Bool)

(assert (=> start!120720 (array_inv!35655 a!2901)))

(declare-fun b!1404654 () Bool)

(declare-fun res!942484 () Bool)

(assert (=> b!1404654 (=> (not res!942484) (not e!795416))))

(assert (=> b!1404654 (= res!942484 (and (= (size!46925 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46925 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46925 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404655 () Bool)

(declare-fun res!942481 () Bool)

(assert (=> b!1404655 (=> (not res!942481) (not e!795416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96051 (_ BitVec 32)) Bool)

(assert (=> b!1404655 (= res!942481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404656 () Bool)

(declare-fun e!795419 () Bool)

(assert (=> b!1404656 (= e!795416 (not e!795419))))

(declare-fun res!942477 () Bool)

(assert (=> b!1404656 (=> res!942477 e!795419)))

(declare-fun lt!618827 () SeekEntryResult!10594)

(assert (=> b!1404656 (= res!942477 (or (not (is-Intermediate!10594 lt!618827)) (undefined!11406 lt!618827)))))

(assert (=> b!1404656 e!795418))

(declare-fun res!942478 () Bool)

(assert (=> b!1404656 (=> (not res!942478) (not e!795418))))

(assert (=> b!1404656 (= res!942478 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47219 0))(
  ( (Unit!47220) )
))
(declare-fun lt!618825 () Unit!47219)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47219)

(assert (=> b!1404656 (= lt!618825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96051 (_ BitVec 32)) SeekEntryResult!10594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404656 (= lt!618827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) (select (arr!46374 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404657 () Bool)

(assert (=> b!1404657 (= e!795419 true)))

(declare-fun lt!618826 () SeekEntryResult!10594)

(assert (=> b!1404657 (= lt!618826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46374 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46374 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96052 (store (arr!46374 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46925 a!2901)) mask!2840))))

(assert (= (and start!120720 res!942483) b!1404654))

(assert (= (and b!1404654 res!942484) b!1404652))

(assert (= (and b!1404652 res!942482) b!1404650))

(assert (= (and b!1404650 res!942480) b!1404655))

(assert (= (and b!1404655 res!942481) b!1404653))

(assert (= (and b!1404653 res!942479) b!1404656))

(assert (= (and b!1404656 res!942478) b!1404651))

(assert (= (and b!1404656 (not res!942477)) b!1404657))

(declare-fun m!1293549 () Bool)

(assert (=> b!1404653 m!1293549))

(declare-fun m!1293551 () Bool)

(assert (=> start!120720 m!1293551))

(declare-fun m!1293553 () Bool)

(assert (=> start!120720 m!1293553))

(declare-fun m!1293555 () Bool)

(assert (=> b!1404655 m!1293555))

(declare-fun m!1293557 () Bool)

(assert (=> b!1404650 m!1293557))

(assert (=> b!1404650 m!1293557))

(declare-fun m!1293559 () Bool)

(assert (=> b!1404650 m!1293559))

(declare-fun m!1293561 () Bool)

(assert (=> b!1404657 m!1293561))

(declare-fun m!1293563 () Bool)

(assert (=> b!1404657 m!1293563))

(assert (=> b!1404657 m!1293563))

(declare-fun m!1293565 () Bool)

(assert (=> b!1404657 m!1293565))

(assert (=> b!1404657 m!1293565))

(assert (=> b!1404657 m!1293563))

(declare-fun m!1293567 () Bool)

(assert (=> b!1404657 m!1293567))

(declare-fun m!1293569 () Bool)

(assert (=> b!1404652 m!1293569))

(assert (=> b!1404652 m!1293569))

(declare-fun m!1293571 () Bool)

(assert (=> b!1404652 m!1293571))

(assert (=> b!1404656 m!1293557))

(declare-fun m!1293573 () Bool)

(assert (=> b!1404656 m!1293573))

(assert (=> b!1404656 m!1293557))

(declare-fun m!1293575 () Bool)

(assert (=> b!1404656 m!1293575))

(assert (=> b!1404656 m!1293573))

(assert (=> b!1404656 m!1293557))

(declare-fun m!1293577 () Bool)

(assert (=> b!1404656 m!1293577))

(declare-fun m!1293579 () Bool)

(assert (=> b!1404656 m!1293579))

(assert (=> b!1404651 m!1293557))

(assert (=> b!1404651 m!1293557))

(declare-fun m!1293581 () Bool)

(assert (=> b!1404651 m!1293581))

(push 1)

(assert (not b!1404650))

(assert (not b!1404652))

(assert (not start!120720))

(assert (not b!1404656))

(assert (not b!1404651))

(assert (not b!1404657))

(assert (not b!1404653))

(assert (not b!1404655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

