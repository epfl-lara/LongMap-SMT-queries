; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121432 () Bool)

(assert start!121432)

(declare-fun b!1410851 () Bool)

(declare-fun res!948085 () Bool)

(declare-fun e!798395 () Bool)

(assert (=> b!1410851 (=> (not res!948085) (not e!798395))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96433 0))(
  ( (array!96434 (arr!46555 (Array (_ BitVec 32) (_ BitVec 64))) (size!47105 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96433)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410851 (= res!948085 (and (= (size!47105 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47105 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47105 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410852 () Bool)

(declare-fun res!948079 () Bool)

(assert (=> b!1410852 (=> (not res!948079) (not e!798395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410852 (= res!948079 (validKeyInArray!0 (select (arr!46555 a!2901) j!112)))))

(declare-fun b!1410853 () Bool)

(declare-fun res!948083 () Bool)

(assert (=> b!1410853 (=> (not res!948083) (not e!798395))))

(declare-datatypes ((List!33074 0))(
  ( (Nil!33071) (Cons!33070 (h!34342 (_ BitVec 64)) (t!47768 List!33074)) )
))
(declare-fun arrayNoDuplicates!0 (array!96433 (_ BitVec 32) List!33074) Bool)

(assert (=> b!1410853 (= res!948083 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33071))))

(declare-fun b!1410855 () Bool)

(declare-fun res!948081 () Bool)

(assert (=> b!1410855 (=> (not res!948081) (not e!798395))))

(assert (=> b!1410855 (= res!948081 (validKeyInArray!0 (select (arr!46555 a!2901) i!1037)))))

(declare-fun e!798396 () Bool)

(declare-fun b!1410856 () Bool)

(declare-datatypes ((SeekEntryResult!10866 0))(
  ( (MissingZero!10866 (index!45841 (_ BitVec 32))) (Found!10866 (index!45842 (_ BitVec 32))) (Intermediate!10866 (undefined!11678 Bool) (index!45843 (_ BitVec 32)) (x!127437 (_ BitVec 32))) (Undefined!10866) (MissingVacant!10866 (index!45844 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96433 (_ BitVec 32)) SeekEntryResult!10866)

(assert (=> b!1410856 (= e!798396 (= (seekEntryOrOpen!0 (select (arr!46555 a!2901) j!112) a!2901 mask!2840) (Found!10866 j!112)))))

(declare-fun b!1410857 () Bool)

(declare-fun res!948084 () Bool)

(assert (=> b!1410857 (=> (not res!948084) (not e!798395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96433 (_ BitVec 32)) Bool)

(assert (=> b!1410857 (= res!948084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410858 () Bool)

(declare-fun e!798398 () Bool)

(assert (=> b!1410858 (= e!798398 true)))

(declare-fun lt!621362 () SeekEntryResult!10866)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96433 (_ BitVec 32)) SeekEntryResult!10866)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410858 (= lt!621362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46555 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46555 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96434 (store (arr!46555 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47105 a!2901)) mask!2840))))

(declare-fun res!948080 () Bool)

(assert (=> start!121432 (=> (not res!948080) (not e!798395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121432 (= res!948080 (validMask!0 mask!2840))))

(assert (=> start!121432 e!798395))

(assert (=> start!121432 true))

(declare-fun array_inv!35583 (array!96433) Bool)

(assert (=> start!121432 (array_inv!35583 a!2901)))

(declare-fun b!1410854 () Bool)

(assert (=> b!1410854 (= e!798395 (not e!798398))))

(declare-fun res!948082 () Bool)

(assert (=> b!1410854 (=> res!948082 e!798398)))

(declare-fun lt!621361 () SeekEntryResult!10866)

(assert (=> b!1410854 (= res!948082 (or (not (is-Intermediate!10866 lt!621361)) (undefined!11678 lt!621361)))))

(assert (=> b!1410854 e!798396))

(declare-fun res!948078 () Bool)

(assert (=> b!1410854 (=> (not res!948078) (not e!798396))))

(assert (=> b!1410854 (= res!948078 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47706 0))(
  ( (Unit!47707) )
))
(declare-fun lt!621363 () Unit!47706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47706)

(assert (=> b!1410854 (= lt!621363 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410854 (= lt!621361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46555 a!2901) j!112) mask!2840) (select (arr!46555 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121432 res!948080) b!1410851))

(assert (= (and b!1410851 res!948085) b!1410855))

(assert (= (and b!1410855 res!948081) b!1410852))

(assert (= (and b!1410852 res!948079) b!1410857))

(assert (= (and b!1410857 res!948084) b!1410853))

(assert (= (and b!1410853 res!948083) b!1410854))

(assert (= (and b!1410854 res!948078) b!1410856))

(assert (= (and b!1410854 (not res!948082)) b!1410858))

(declare-fun m!1300535 () Bool)

(assert (=> b!1410855 m!1300535))

(assert (=> b!1410855 m!1300535))

(declare-fun m!1300537 () Bool)

(assert (=> b!1410855 m!1300537))

(declare-fun m!1300539 () Bool)

(assert (=> b!1410852 m!1300539))

(assert (=> b!1410852 m!1300539))

(declare-fun m!1300541 () Bool)

(assert (=> b!1410852 m!1300541))

(assert (=> b!1410856 m!1300539))

(assert (=> b!1410856 m!1300539))

(declare-fun m!1300543 () Bool)

(assert (=> b!1410856 m!1300543))

(declare-fun m!1300545 () Bool)

(assert (=> start!121432 m!1300545))

(declare-fun m!1300547 () Bool)

(assert (=> start!121432 m!1300547))

(declare-fun m!1300549 () Bool)

(assert (=> b!1410857 m!1300549))

(declare-fun m!1300551 () Bool)

(assert (=> b!1410853 m!1300551))

(assert (=> b!1410854 m!1300539))

(declare-fun m!1300553 () Bool)

(assert (=> b!1410854 m!1300553))

(assert (=> b!1410854 m!1300539))

(declare-fun m!1300555 () Bool)

(assert (=> b!1410854 m!1300555))

(assert (=> b!1410854 m!1300553))

(assert (=> b!1410854 m!1300539))

(declare-fun m!1300557 () Bool)

(assert (=> b!1410854 m!1300557))

(declare-fun m!1300559 () Bool)

(assert (=> b!1410854 m!1300559))

(declare-fun m!1300561 () Bool)

(assert (=> b!1410858 m!1300561))

(declare-fun m!1300563 () Bool)

(assert (=> b!1410858 m!1300563))

(assert (=> b!1410858 m!1300563))

(declare-fun m!1300565 () Bool)

(assert (=> b!1410858 m!1300565))

(assert (=> b!1410858 m!1300565))

(assert (=> b!1410858 m!1300563))

(declare-fun m!1300567 () Bool)

(assert (=> b!1410858 m!1300567))

(push 1)

(assert (not b!1410852))

(assert (not b!1410856))

(assert (not b!1410855))

(assert (not b!1410857))

(assert (not start!121432))

(assert (not b!1410858))

(assert (not b!1410854))

(assert (not b!1410853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

