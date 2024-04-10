; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122088 () Bool)

(assert start!122088)

(declare-fun res!952613 () Bool)

(declare-fun e!801839 () Bool)

(assert (=> start!122088 (=> (not res!952613) (not e!801839))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122088 (= res!952613 (validMask!0 mask!2840))))

(assert (=> start!122088 e!801839))

(assert (=> start!122088 true))

(declare-datatypes ((array!96723 0))(
  ( (array!96724 (arr!46691 (Array (_ BitVec 32) (_ BitVec 64))) (size!47241 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96723)

(declare-fun array_inv!35719 (array!96723) Bool)

(assert (=> start!122088 (array_inv!35719 a!2901)))

(declare-fun b!1416734 () Bool)

(declare-fun e!801838 () Bool)

(assert (=> b!1416734 (= e!801839 (not e!801838))))

(declare-fun res!952616 () Bool)

(assert (=> b!1416734 (=> res!952616 e!801838)))

(declare-datatypes ((SeekEntryResult!11002 0))(
  ( (MissingZero!11002 (index!46400 (_ BitVec 32))) (Found!11002 (index!46401 (_ BitVec 32))) (Intermediate!11002 (undefined!11814 Bool) (index!46402 (_ BitVec 32)) (x!128007 (_ BitVec 32))) (Undefined!11002) (MissingVacant!11002 (index!46403 (_ BitVec 32))) )
))
(declare-fun lt!625096 () SeekEntryResult!11002)

(assert (=> b!1416734 (= res!952616 (or (not (is-Intermediate!11002 lt!625096)) (undefined!11814 lt!625096)))))

(declare-fun e!801837 () Bool)

(assert (=> b!1416734 e!801837))

(declare-fun res!952612 () Bool)

(assert (=> b!1416734 (=> (not res!952612) (not e!801837))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96723 (_ BitVec 32)) Bool)

(assert (=> b!1416734 (= res!952612 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47978 0))(
  ( (Unit!47979) )
))
(declare-fun lt!625097 () Unit!47978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47978)

(assert (=> b!1416734 (= lt!625097 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96723 (_ BitVec 32)) SeekEntryResult!11002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416734 (= lt!625096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46691 a!2901) j!112) mask!2840) (select (arr!46691 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416735 () Bool)

(declare-fun res!952615 () Bool)

(assert (=> b!1416735 (=> (not res!952615) (not e!801839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416735 (= res!952615 (validKeyInArray!0 (select (arr!46691 a!2901) j!112)))))

(declare-fun b!1416736 () Bool)

(declare-fun res!952617 () Bool)

(assert (=> b!1416736 (=> (not res!952617) (not e!801839))))

(assert (=> b!1416736 (= res!952617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416737 () Bool)

(assert (=> b!1416737 (= e!801838 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!625098 () SeekEntryResult!11002)

(assert (=> b!1416737 (= lt!625098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46691 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46691 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96724 (store (arr!46691 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47241 a!2901)) mask!2840))))

(declare-fun b!1416738 () Bool)

(declare-fun res!952618 () Bool)

(assert (=> b!1416738 (=> (not res!952618) (not e!801839))))

(declare-datatypes ((List!33210 0))(
  ( (Nil!33207) (Cons!33206 (h!34496 (_ BitVec 64)) (t!47904 List!33210)) )
))
(declare-fun arrayNoDuplicates!0 (array!96723 (_ BitVec 32) List!33210) Bool)

(assert (=> b!1416738 (= res!952618 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33207))))

(declare-fun b!1416739 () Bool)

(declare-fun res!952611 () Bool)

(assert (=> b!1416739 (=> (not res!952611) (not e!801839))))

(assert (=> b!1416739 (= res!952611 (and (= (size!47241 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47241 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47241 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416740 () Bool)

(declare-fun res!952614 () Bool)

(assert (=> b!1416740 (=> (not res!952614) (not e!801839))))

(assert (=> b!1416740 (= res!952614 (validKeyInArray!0 (select (arr!46691 a!2901) i!1037)))))

(declare-fun b!1416741 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96723 (_ BitVec 32)) SeekEntryResult!11002)

(assert (=> b!1416741 (= e!801837 (= (seekEntryOrOpen!0 (select (arr!46691 a!2901) j!112) a!2901 mask!2840) (Found!11002 j!112)))))

(assert (= (and start!122088 res!952613) b!1416739))

(assert (= (and b!1416739 res!952611) b!1416740))

(assert (= (and b!1416740 res!952614) b!1416735))

(assert (= (and b!1416735 res!952615) b!1416736))

(assert (= (and b!1416736 res!952617) b!1416738))

(assert (= (and b!1416738 res!952618) b!1416734))

(assert (= (and b!1416734 res!952612) b!1416741))

(assert (= (and b!1416734 (not res!952616)) b!1416737))

(declare-fun m!1307373 () Bool)

(assert (=> b!1416741 m!1307373))

(assert (=> b!1416741 m!1307373))

(declare-fun m!1307375 () Bool)

(assert (=> b!1416741 m!1307375))

(declare-fun m!1307377 () Bool)

(assert (=> b!1416737 m!1307377))

(declare-fun m!1307379 () Bool)

(assert (=> b!1416737 m!1307379))

(assert (=> b!1416737 m!1307379))

(declare-fun m!1307381 () Bool)

(assert (=> b!1416737 m!1307381))

(assert (=> b!1416737 m!1307381))

(assert (=> b!1416737 m!1307379))

(declare-fun m!1307383 () Bool)

(assert (=> b!1416737 m!1307383))

(declare-fun m!1307385 () Bool)

(assert (=> start!122088 m!1307385))

(declare-fun m!1307387 () Bool)

(assert (=> start!122088 m!1307387))

(assert (=> b!1416735 m!1307373))

(assert (=> b!1416735 m!1307373))

(declare-fun m!1307389 () Bool)

(assert (=> b!1416735 m!1307389))

(declare-fun m!1307391 () Bool)

(assert (=> b!1416736 m!1307391))

(declare-fun m!1307393 () Bool)

(assert (=> b!1416738 m!1307393))

(assert (=> b!1416734 m!1307373))

(declare-fun m!1307395 () Bool)

(assert (=> b!1416734 m!1307395))

(assert (=> b!1416734 m!1307373))

(declare-fun m!1307397 () Bool)

(assert (=> b!1416734 m!1307397))

(assert (=> b!1416734 m!1307395))

(assert (=> b!1416734 m!1307373))

(declare-fun m!1307399 () Bool)

(assert (=> b!1416734 m!1307399))

(declare-fun m!1307401 () Bool)

(assert (=> b!1416734 m!1307401))

(declare-fun m!1307403 () Bool)

(assert (=> b!1416740 m!1307403))

(assert (=> b!1416740 m!1307403))

(declare-fun m!1307405 () Bool)

(assert (=> b!1416740 m!1307405))

(push 1)

(assert (not b!1416735))

(assert (not b!1416740))

(assert (not b!1416737))

(assert (not b!1416736))

(assert (not start!122088))

(assert (not b!1416741))

(assert (not b!1416738))

(assert (not b!1416734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

