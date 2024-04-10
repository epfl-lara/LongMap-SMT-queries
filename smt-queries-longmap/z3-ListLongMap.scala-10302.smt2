; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121136 () Bool)

(assert start!121136)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96290 0))(
  ( (array!96291 (arr!46488 (Array (_ BitVec 32) (_ BitVec 64))) (size!47038 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96290)

(declare-fun e!797116 () Bool)

(declare-fun b!1408478 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10799 0))(
  ( (MissingZero!10799 (index!45573 (_ BitVec 32))) (Found!10799 (index!45574 (_ BitVec 32))) (Intermediate!10799 (undefined!11611 Bool) (index!45575 (_ BitVec 32)) (x!127176 (_ BitVec 32))) (Undefined!10799) (MissingVacant!10799 (index!45576 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96290 (_ BitVec 32)) SeekEntryResult!10799)

(assert (=> b!1408478 (= e!797116 (= (seekEntryOrOpen!0 (select (arr!46488 a!2901) j!112) a!2901 mask!2840) (Found!10799 j!112)))))

(declare-fun b!1408479 () Bool)

(declare-fun e!797117 () Bool)

(declare-fun e!797115 () Bool)

(assert (=> b!1408479 (= e!797117 (not e!797115))))

(declare-fun res!946205 () Bool)

(assert (=> b!1408479 (=> res!946205 e!797115)))

(declare-fun lt!620364 () SeekEntryResult!10799)

(get-info :version)

(assert (=> b!1408479 (= res!946205 (or (not ((_ is Intermediate!10799) lt!620364)) (undefined!11611 lt!620364)))))

(assert (=> b!1408479 e!797116))

(declare-fun res!946207 () Bool)

(assert (=> b!1408479 (=> (not res!946207) (not e!797116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96290 (_ BitVec 32)) Bool)

(assert (=> b!1408479 (= res!946207 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47572 0))(
  ( (Unit!47573) )
))
(declare-fun lt!620362 () Unit!47572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47572)

(assert (=> b!1408479 (= lt!620362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96290 (_ BitVec 32)) SeekEntryResult!10799)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408479 (= lt!620364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46488 a!2901) j!112) mask!2840) (select (arr!46488 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408480 () Bool)

(declare-fun res!946202 () Bool)

(assert (=> b!1408480 (=> (not res!946202) (not e!797117))))

(declare-datatypes ((List!33007 0))(
  ( (Nil!33004) (Cons!33003 (h!34266 (_ BitVec 64)) (t!47701 List!33007)) )
))
(declare-fun arrayNoDuplicates!0 (array!96290 (_ BitVec 32) List!33007) Bool)

(assert (=> b!1408480 (= res!946202 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33004))))

(declare-fun b!1408481 () Bool)

(declare-fun res!946200 () Bool)

(assert (=> b!1408481 (=> (not res!946200) (not e!797117))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408481 (= res!946200 (validKeyInArray!0 (select (arr!46488 a!2901) i!1037)))))

(declare-fun b!1408482 () Bool)

(declare-fun res!946201 () Bool)

(assert (=> b!1408482 (=> (not res!946201) (not e!797117))))

(assert (=> b!1408482 (= res!946201 (and (= (size!47038 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47038 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47038 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408484 () Bool)

(declare-fun res!946204 () Bool)

(assert (=> b!1408484 (=> (not res!946204) (not e!797117))))

(assert (=> b!1408484 (= res!946204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408485 () Bool)

(assert (=> b!1408485 (= e!797115 true)))

(declare-fun lt!620363 () SeekEntryResult!10799)

(assert (=> b!1408485 (= lt!620363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96291 (store (arr!46488 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47038 a!2901)) mask!2840))))

(declare-fun res!946206 () Bool)

(assert (=> start!121136 (=> (not res!946206) (not e!797117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121136 (= res!946206 (validMask!0 mask!2840))))

(assert (=> start!121136 e!797117))

(assert (=> start!121136 true))

(declare-fun array_inv!35516 (array!96290) Bool)

(assert (=> start!121136 (array_inv!35516 a!2901)))

(declare-fun b!1408483 () Bool)

(declare-fun res!946203 () Bool)

(assert (=> b!1408483 (=> (not res!946203) (not e!797117))))

(assert (=> b!1408483 (= res!946203 (validKeyInArray!0 (select (arr!46488 a!2901) j!112)))))

(assert (= (and start!121136 res!946206) b!1408482))

(assert (= (and b!1408482 res!946201) b!1408481))

(assert (= (and b!1408481 res!946200) b!1408483))

(assert (= (and b!1408483 res!946203) b!1408484))

(assert (= (and b!1408484 res!946204) b!1408480))

(assert (= (and b!1408480 res!946202) b!1408479))

(assert (= (and b!1408479 res!946207) b!1408478))

(assert (= (and b!1408479 (not res!946205)) b!1408485))

(declare-fun m!1297795 () Bool)

(assert (=> b!1408478 m!1297795))

(assert (=> b!1408478 m!1297795))

(declare-fun m!1297797 () Bool)

(assert (=> b!1408478 m!1297797))

(declare-fun m!1297799 () Bool)

(assert (=> b!1408484 m!1297799))

(declare-fun m!1297801 () Bool)

(assert (=> start!121136 m!1297801))

(declare-fun m!1297803 () Bool)

(assert (=> start!121136 m!1297803))

(declare-fun m!1297805 () Bool)

(assert (=> b!1408481 m!1297805))

(assert (=> b!1408481 m!1297805))

(declare-fun m!1297807 () Bool)

(assert (=> b!1408481 m!1297807))

(assert (=> b!1408483 m!1297795))

(assert (=> b!1408483 m!1297795))

(declare-fun m!1297809 () Bool)

(assert (=> b!1408483 m!1297809))

(assert (=> b!1408479 m!1297795))

(declare-fun m!1297811 () Bool)

(assert (=> b!1408479 m!1297811))

(assert (=> b!1408479 m!1297795))

(declare-fun m!1297813 () Bool)

(assert (=> b!1408479 m!1297813))

(assert (=> b!1408479 m!1297811))

(assert (=> b!1408479 m!1297795))

(declare-fun m!1297815 () Bool)

(assert (=> b!1408479 m!1297815))

(declare-fun m!1297817 () Bool)

(assert (=> b!1408479 m!1297817))

(declare-fun m!1297819 () Bool)

(assert (=> b!1408485 m!1297819))

(declare-fun m!1297821 () Bool)

(assert (=> b!1408485 m!1297821))

(assert (=> b!1408485 m!1297821))

(declare-fun m!1297823 () Bool)

(assert (=> b!1408485 m!1297823))

(assert (=> b!1408485 m!1297823))

(assert (=> b!1408485 m!1297821))

(declare-fun m!1297825 () Bool)

(assert (=> b!1408485 m!1297825))

(declare-fun m!1297827 () Bool)

(assert (=> b!1408480 m!1297827))

(check-sat (not b!1408483) (not b!1408484) (not b!1408478) (not b!1408481) (not start!121136) (not b!1408480) (not b!1408485) (not b!1408479))
