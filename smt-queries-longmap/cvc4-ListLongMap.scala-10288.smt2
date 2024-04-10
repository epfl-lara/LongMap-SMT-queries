; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120892 () Bool)

(assert start!120892)

(declare-fun b!1406648 () Bool)

(declare-fun res!944869 () Bool)

(declare-fun e!796146 () Bool)

(assert (=> b!1406648 (=> (not res!944869) (not e!796146))))

(declare-datatypes ((array!96199 0))(
  ( (array!96200 (arr!46447 (Array (_ BitVec 32) (_ BitVec 64))) (size!46997 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96199)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96199 (_ BitVec 32)) Bool)

(assert (=> b!1406648 (= res!944869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!796145 () Bool)

(declare-fun b!1406649 () Bool)

(declare-datatypes ((SeekEntryResult!10758 0))(
  ( (MissingZero!10758 (index!45409 (_ BitVec 32))) (Found!10758 (index!45410 (_ BitVec 32))) (Intermediate!10758 (undefined!11570 Bool) (index!45411 (_ BitVec 32)) (x!127005 (_ BitVec 32))) (Undefined!10758) (MissingVacant!10758 (index!45412 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96199 (_ BitVec 32)) SeekEntryResult!10758)

(assert (=> b!1406649 (= e!796145 (= (seekEntryOrOpen!0 (select (arr!46447 a!2901) j!112) a!2901 mask!2840) (Found!10758 j!112)))))

(declare-fun b!1406650 () Bool)

(declare-fun res!944871 () Bool)

(assert (=> b!1406650 (=> (not res!944871) (not e!796146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406650 (= res!944871 (validKeyInArray!0 (select (arr!46447 a!2901) j!112)))))

(declare-fun b!1406651 () Bool)

(declare-fun res!944866 () Bool)

(assert (=> b!1406651 (=> (not res!944866) (not e!796146))))

(declare-datatypes ((List!32966 0))(
  ( (Nil!32963) (Cons!32962 (h!34216 (_ BitVec 64)) (t!47660 List!32966)) )
))
(declare-fun arrayNoDuplicates!0 (array!96199 (_ BitVec 32) List!32966) Bool)

(assert (=> b!1406651 (= res!944866 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32963))))

(declare-fun res!944865 () Bool)

(assert (=> start!120892 (=> (not res!944865) (not e!796146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120892 (= res!944865 (validMask!0 mask!2840))))

(assert (=> start!120892 e!796146))

(assert (=> start!120892 true))

(declare-fun array_inv!35475 (array!96199) Bool)

(assert (=> start!120892 (array_inv!35475 a!2901)))

(declare-fun b!1406652 () Bool)

(declare-fun e!796147 () Bool)

(assert (=> b!1406652 (= e!796147 true)))

(declare-fun lt!619462 () SeekEntryResult!10758)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96199 (_ BitVec 32)) SeekEntryResult!10758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406652 (= lt!619462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46447 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46447 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96200 (store (arr!46447 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46997 a!2901)) mask!2840))))

(declare-fun b!1406653 () Bool)

(declare-fun res!944867 () Bool)

(assert (=> b!1406653 (=> (not res!944867) (not e!796146))))

(assert (=> b!1406653 (= res!944867 (validKeyInArray!0 (select (arr!46447 a!2901) i!1037)))))

(declare-fun b!1406654 () Bool)

(assert (=> b!1406654 (= e!796146 (not e!796147))))

(declare-fun res!944870 () Bool)

(assert (=> b!1406654 (=> res!944870 e!796147)))

(declare-fun lt!619464 () SeekEntryResult!10758)

(assert (=> b!1406654 (= res!944870 (or (not (is-Intermediate!10758 lt!619464)) (undefined!11570 lt!619464)))))

(assert (=> b!1406654 e!796145))

(declare-fun res!944872 () Bool)

(assert (=> b!1406654 (=> (not res!944872) (not e!796145))))

(assert (=> b!1406654 (= res!944872 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47490 0))(
  ( (Unit!47491) )
))
(declare-fun lt!619463 () Unit!47490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47490)

(assert (=> b!1406654 (= lt!619463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406654 (= lt!619464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46447 a!2901) j!112) mask!2840) (select (arr!46447 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406655 () Bool)

(declare-fun res!944868 () Bool)

(assert (=> b!1406655 (=> (not res!944868) (not e!796146))))

(assert (=> b!1406655 (= res!944868 (and (= (size!46997 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46997 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46997 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120892 res!944865) b!1406655))

(assert (= (and b!1406655 res!944868) b!1406653))

(assert (= (and b!1406653 res!944867) b!1406650))

(assert (= (and b!1406650 res!944871) b!1406648))

(assert (= (and b!1406648 res!944869) b!1406651))

(assert (= (and b!1406651 res!944866) b!1406654))

(assert (= (and b!1406654 res!944872) b!1406649))

(assert (= (and b!1406654 (not res!944870)) b!1406652))

(declare-fun m!1295879 () Bool)

(assert (=> b!1406653 m!1295879))

(assert (=> b!1406653 m!1295879))

(declare-fun m!1295881 () Bool)

(assert (=> b!1406653 m!1295881))

(declare-fun m!1295883 () Bool)

(assert (=> b!1406650 m!1295883))

(assert (=> b!1406650 m!1295883))

(declare-fun m!1295885 () Bool)

(assert (=> b!1406650 m!1295885))

(declare-fun m!1295887 () Bool)

(assert (=> b!1406651 m!1295887))

(assert (=> b!1406649 m!1295883))

(assert (=> b!1406649 m!1295883))

(declare-fun m!1295889 () Bool)

(assert (=> b!1406649 m!1295889))

(declare-fun m!1295891 () Bool)

(assert (=> b!1406648 m!1295891))

(declare-fun m!1295893 () Bool)

(assert (=> start!120892 m!1295893))

(declare-fun m!1295895 () Bool)

(assert (=> start!120892 m!1295895))

(declare-fun m!1295897 () Bool)

(assert (=> b!1406652 m!1295897))

(declare-fun m!1295899 () Bool)

(assert (=> b!1406652 m!1295899))

(assert (=> b!1406652 m!1295899))

(declare-fun m!1295901 () Bool)

(assert (=> b!1406652 m!1295901))

(assert (=> b!1406652 m!1295901))

(assert (=> b!1406652 m!1295899))

(declare-fun m!1295903 () Bool)

(assert (=> b!1406652 m!1295903))

(assert (=> b!1406654 m!1295883))

(declare-fun m!1295905 () Bool)

(assert (=> b!1406654 m!1295905))

(assert (=> b!1406654 m!1295883))

(declare-fun m!1295907 () Bool)

(assert (=> b!1406654 m!1295907))

(assert (=> b!1406654 m!1295905))

(assert (=> b!1406654 m!1295883))

(declare-fun m!1295909 () Bool)

(assert (=> b!1406654 m!1295909))

(declare-fun m!1295911 () Bool)

(assert (=> b!1406654 m!1295911))

(push 1)

(assert (not b!1406651))

(assert (not b!1406648))

(assert (not b!1406652))

(assert (not start!120892))

(assert (not b!1406654))

(assert (not b!1406649))

(assert (not b!1406650))

(assert (not b!1406653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

