; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121344 () Bool)

(assert start!121344)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96420 0))(
  ( (array!96421 (arr!46551 (Array (_ BitVec 32) (_ BitVec 64))) (size!47102 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96420)

(declare-fun b!1409858 () Bool)

(declare-fun e!797975 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10765 0))(
  ( (MissingZero!10765 (index!45437 (_ BitVec 32))) (Found!10765 (index!45438 (_ BitVec 32))) (Intermediate!10765 (undefined!11577 Bool) (index!45439 (_ BitVec 32)) (x!127185 (_ BitVec 32))) (Undefined!10765) (MissingVacant!10765 (index!45440 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96420 (_ BitVec 32)) SeekEntryResult!10765)

(assert (=> b!1409858 (= e!797975 (= (seekEntryOrOpen!0 (select (arr!46551 a!2901) j!112) a!2901 mask!2840) (Found!10765 j!112)))))

(declare-fun b!1409860 () Bool)

(declare-fun e!797974 () Bool)

(declare-fun e!797972 () Bool)

(assert (=> b!1409860 (= e!797974 (not e!797972))))

(declare-fun res!946901 () Bool)

(assert (=> b!1409860 (=> res!946901 e!797972)))

(declare-fun lt!620850 () SeekEntryResult!10765)

(assert (=> b!1409860 (= res!946901 (or (not (is-Intermediate!10765 lt!620850)) (undefined!11577 lt!620850)))))

(assert (=> b!1409860 e!797975))

(declare-fun res!946902 () Bool)

(assert (=> b!1409860 (=> (not res!946902) (not e!797975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96420 (_ BitVec 32)) Bool)

(assert (=> b!1409860 (= res!946902 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47531 0))(
  ( (Unit!47532) )
))
(declare-fun lt!620852 () Unit!47531)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47531)

(assert (=> b!1409860 (= lt!620852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96420 (_ BitVec 32)) SeekEntryResult!10765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409860 (= lt!620850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46551 a!2901) j!112) mask!2840) (select (arr!46551 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409861 () Bool)

(declare-fun res!946897 () Bool)

(assert (=> b!1409861 (=> (not res!946897) (not e!797974))))

(declare-datatypes ((List!33057 0))(
  ( (Nil!33054) (Cons!33053 (h!34324 (_ BitVec 64)) (t!47743 List!33057)) )
))
(declare-fun arrayNoDuplicates!0 (array!96420 (_ BitVec 32) List!33057) Bool)

(assert (=> b!1409861 (= res!946897 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33054))))

(declare-fun b!1409862 () Bool)

(declare-fun res!946900 () Bool)

(assert (=> b!1409862 (=> (not res!946900) (not e!797974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409862 (= res!946900 (validKeyInArray!0 (select (arr!46551 a!2901) j!112)))))

(declare-fun b!1409863 () Bool)

(declare-fun res!946898 () Bool)

(assert (=> b!1409863 (=> (not res!946898) (not e!797974))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409863 (= res!946898 (and (= (size!47102 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47102 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47102 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409864 () Bool)

(assert (=> b!1409864 (= e!797972 true)))

(declare-fun lt!620851 () SeekEntryResult!10765)

(assert (=> b!1409864 (= lt!620851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46551 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46551 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96421 (store (arr!46551 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47102 a!2901)) mask!2840))))

(declare-fun b!1409865 () Bool)

(declare-fun res!946896 () Bool)

(assert (=> b!1409865 (=> (not res!946896) (not e!797974))))

(assert (=> b!1409865 (= res!946896 (validKeyInArray!0 (select (arr!46551 a!2901) i!1037)))))

(declare-fun res!946903 () Bool)

(assert (=> start!121344 (=> (not res!946903) (not e!797974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121344 (= res!946903 (validMask!0 mask!2840))))

(assert (=> start!121344 e!797974))

(assert (=> start!121344 true))

(declare-fun array_inv!35832 (array!96420) Bool)

(assert (=> start!121344 (array_inv!35832 a!2901)))

(declare-fun b!1409859 () Bool)

(declare-fun res!946899 () Bool)

(assert (=> b!1409859 (=> (not res!946899) (not e!797974))))

(assert (=> b!1409859 (= res!946899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121344 res!946903) b!1409863))

(assert (= (and b!1409863 res!946898) b!1409865))

(assert (= (and b!1409865 res!946896) b!1409862))

(assert (= (and b!1409862 res!946900) b!1409859))

(assert (= (and b!1409859 res!946899) b!1409861))

(assert (= (and b!1409861 res!946897) b!1409860))

(assert (= (and b!1409860 res!946902) b!1409858))

(assert (= (and b!1409860 (not res!946901)) b!1409864))

(declare-fun m!1299507 () Bool)

(assert (=> b!1409861 m!1299507))

(declare-fun m!1299509 () Bool)

(assert (=> start!121344 m!1299509))

(declare-fun m!1299511 () Bool)

(assert (=> start!121344 m!1299511))

(declare-fun m!1299513 () Bool)

(assert (=> b!1409865 m!1299513))

(assert (=> b!1409865 m!1299513))

(declare-fun m!1299515 () Bool)

(assert (=> b!1409865 m!1299515))

(declare-fun m!1299517 () Bool)

(assert (=> b!1409859 m!1299517))

(declare-fun m!1299519 () Bool)

(assert (=> b!1409862 m!1299519))

(assert (=> b!1409862 m!1299519))

(declare-fun m!1299521 () Bool)

(assert (=> b!1409862 m!1299521))

(assert (=> b!1409858 m!1299519))

(assert (=> b!1409858 m!1299519))

(declare-fun m!1299523 () Bool)

(assert (=> b!1409858 m!1299523))

(assert (=> b!1409860 m!1299519))

(declare-fun m!1299525 () Bool)

(assert (=> b!1409860 m!1299525))

(assert (=> b!1409860 m!1299519))

(declare-fun m!1299527 () Bool)

(assert (=> b!1409860 m!1299527))

(assert (=> b!1409860 m!1299525))

(assert (=> b!1409860 m!1299519))

(declare-fun m!1299529 () Bool)

(assert (=> b!1409860 m!1299529))

(declare-fun m!1299531 () Bool)

(assert (=> b!1409860 m!1299531))

(declare-fun m!1299533 () Bool)

(assert (=> b!1409864 m!1299533))

(declare-fun m!1299535 () Bool)

(assert (=> b!1409864 m!1299535))

(assert (=> b!1409864 m!1299535))

(declare-fun m!1299537 () Bool)

(assert (=> b!1409864 m!1299537))

(assert (=> b!1409864 m!1299537))

(assert (=> b!1409864 m!1299535))

(declare-fun m!1299539 () Bool)

(assert (=> b!1409864 m!1299539))

(push 1)

(assert (not b!1409858))

(assert (not b!1409861))

(assert (not b!1409860))

(assert (not b!1409865))

(assert (not start!121344))

(assert (not b!1409859))

(assert (not b!1409862))

(assert (not b!1409864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

