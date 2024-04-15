; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121218 () Bool)

(assert start!121218)

(declare-fun res!947204 () Bool)

(declare-fun e!797591 () Bool)

(assert (=> start!121218 (=> (not res!947204) (not e!797591))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121218 (= res!947204 (validMask!0 mask!2840))))

(assert (=> start!121218 e!797591))

(assert (=> start!121218 true))

(declare-datatypes ((array!96325 0))(
  ( (array!96326 (arr!46506 (Array (_ BitVec 32) (_ BitVec 64))) (size!47058 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96325)

(declare-fun array_inv!35739 (array!96325) Bool)

(assert (=> start!121218 (array_inv!35739 a!2901)))

(declare-fun b!1409429 () Bool)

(declare-fun res!947206 () Bool)

(assert (=> b!1409429 (=> (not res!947206) (not e!797591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96325 (_ BitVec 32)) Bool)

(assert (=> b!1409429 (= res!947206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409430 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!797592 () Bool)

(declare-datatypes ((SeekEntryResult!10843 0))(
  ( (MissingZero!10843 (index!45749 (_ BitVec 32))) (Found!10843 (index!45750 (_ BitVec 32))) (Intermediate!10843 (undefined!11655 Bool) (index!45751 (_ BitVec 32)) (x!127329 (_ BitVec 32))) (Undefined!10843) (MissingVacant!10843 (index!45752 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96325 (_ BitVec 32)) SeekEntryResult!10843)

(assert (=> b!1409430 (= e!797592 (= (seekEntryOrOpen!0 (select (arr!46506 a!2901) j!112) a!2901 mask!2840) (Found!10843 j!112)))))

(declare-fun b!1409431 () Bool)

(declare-fun res!947205 () Bool)

(assert (=> b!1409431 (=> (not res!947205) (not e!797591))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409431 (= res!947205 (and (= (size!47058 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47058 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47058 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409432 () Bool)

(declare-fun e!797593 () Bool)

(assert (=> b!1409432 (= e!797593 true)))

(declare-fun lt!620559 () SeekEntryResult!10843)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96325 (_ BitVec 32)) SeekEntryResult!10843)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409432 (= lt!620559 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46506 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46506 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96326 (store (arr!46506 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)) mask!2840))))

(declare-fun b!1409433 () Bool)

(assert (=> b!1409433 (= e!797591 (not e!797593))))

(declare-fun res!947208 () Bool)

(assert (=> b!1409433 (=> res!947208 e!797593)))

(declare-fun lt!620561 () SeekEntryResult!10843)

(assert (=> b!1409433 (= res!947208 (or (not (is-Intermediate!10843 lt!620561)) (undefined!11655 lt!620561)))))

(assert (=> b!1409433 e!797592))

(declare-fun res!947202 () Bool)

(assert (=> b!1409433 (=> (not res!947202) (not e!797592))))

(assert (=> b!1409433 (= res!947202 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47503 0))(
  ( (Unit!47504) )
))
(declare-fun lt!620560 () Unit!47503)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47503)

(assert (=> b!1409433 (= lt!620560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409433 (= lt!620561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46506 a!2901) j!112) mask!2840) (select (arr!46506 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409434 () Bool)

(declare-fun res!947207 () Bool)

(assert (=> b!1409434 (=> (not res!947207) (not e!797591))))

(declare-datatypes ((List!33103 0))(
  ( (Nil!33100) (Cons!33099 (h!34362 (_ BitVec 64)) (t!47789 List!33103)) )
))
(declare-fun arrayNoDuplicates!0 (array!96325 (_ BitVec 32) List!33103) Bool)

(assert (=> b!1409434 (= res!947207 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33100))))

(declare-fun b!1409435 () Bool)

(declare-fun res!947209 () Bool)

(assert (=> b!1409435 (=> (not res!947209) (not e!797591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409435 (= res!947209 (validKeyInArray!0 (select (arr!46506 a!2901) j!112)))))

(declare-fun b!1409436 () Bool)

(declare-fun res!947203 () Bool)

(assert (=> b!1409436 (=> (not res!947203) (not e!797591))))

(assert (=> b!1409436 (= res!947203 (validKeyInArray!0 (select (arr!46506 a!2901) i!1037)))))

(assert (= (and start!121218 res!947204) b!1409431))

(assert (= (and b!1409431 res!947205) b!1409436))

(assert (= (and b!1409436 res!947203) b!1409435))

(assert (= (and b!1409435 res!947209) b!1409429))

(assert (= (and b!1409429 res!947206) b!1409434))

(assert (= (and b!1409434 res!947207) b!1409433))

(assert (= (and b!1409433 res!947202) b!1409430))

(assert (= (and b!1409433 (not res!947208)) b!1409432))

(declare-fun m!1298721 () Bool)

(assert (=> b!1409429 m!1298721))

(declare-fun m!1298723 () Bool)

(assert (=> b!1409433 m!1298723))

(declare-fun m!1298725 () Bool)

(assert (=> b!1409433 m!1298725))

(assert (=> b!1409433 m!1298723))

(declare-fun m!1298727 () Bool)

(assert (=> b!1409433 m!1298727))

(assert (=> b!1409433 m!1298725))

(assert (=> b!1409433 m!1298723))

(declare-fun m!1298729 () Bool)

(assert (=> b!1409433 m!1298729))

(declare-fun m!1298731 () Bool)

(assert (=> b!1409433 m!1298731))

(assert (=> b!1409430 m!1298723))

(assert (=> b!1409430 m!1298723))

(declare-fun m!1298733 () Bool)

(assert (=> b!1409430 m!1298733))

(declare-fun m!1298735 () Bool)

(assert (=> b!1409432 m!1298735))

(declare-fun m!1298737 () Bool)

(assert (=> b!1409432 m!1298737))

(assert (=> b!1409432 m!1298737))

(declare-fun m!1298739 () Bool)

(assert (=> b!1409432 m!1298739))

(assert (=> b!1409432 m!1298739))

(assert (=> b!1409432 m!1298737))

(declare-fun m!1298741 () Bool)

(assert (=> b!1409432 m!1298741))

(declare-fun m!1298743 () Bool)

(assert (=> b!1409436 m!1298743))

(assert (=> b!1409436 m!1298743))

(declare-fun m!1298745 () Bool)

(assert (=> b!1409436 m!1298745))

(declare-fun m!1298747 () Bool)

(assert (=> b!1409434 m!1298747))

(declare-fun m!1298749 () Bool)

(assert (=> start!121218 m!1298749))

(declare-fun m!1298751 () Bool)

(assert (=> start!121218 m!1298751))

(assert (=> b!1409435 m!1298723))

(assert (=> b!1409435 m!1298723))

(declare-fun m!1298753 () Bool)

(assert (=> b!1409435 m!1298753))

(push 1)

(assert (not b!1409430))

(assert (not b!1409433))

(assert (not b!1409434))

(assert (not b!1409429))

(assert (not b!1409435))

(assert (not b!1409436))

(assert (not b!1409432))

(assert (not start!121218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

