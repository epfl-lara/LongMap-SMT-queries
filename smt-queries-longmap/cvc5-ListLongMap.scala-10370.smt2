; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122088 () Bool)

(assert start!122088)

(declare-fun b!1416701 () Bool)

(declare-fun res!952631 () Bool)

(declare-fun e!801824 () Bool)

(assert (=> b!1416701 (=> (not res!952631) (not e!801824))))

(declare-datatypes ((array!96676 0))(
  ( (array!96677 (arr!46668 (Array (_ BitVec 32) (_ BitVec 64))) (size!47220 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96676)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416701 (= res!952631 (validKeyInArray!0 (select (arr!46668 a!2901) i!1037)))))

(declare-fun b!1416702 () Bool)

(declare-fun res!952633 () Bool)

(assert (=> b!1416702 (=> (not res!952633) (not e!801824))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416702 (= res!952633 (and (= (size!47220 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47220 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47220 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!801823 () Bool)

(declare-fun b!1416703 () Bool)

(declare-datatypes ((SeekEntryResult!11005 0))(
  ( (MissingZero!11005 (index!46412 (_ BitVec 32))) (Found!11005 (index!46413 (_ BitVec 32))) (Intermediate!11005 (undefined!11817 Bool) (index!46414 (_ BitVec 32)) (x!128007 (_ BitVec 32))) (Undefined!11005) (MissingVacant!11005 (index!46415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96676 (_ BitVec 32)) SeekEntryResult!11005)

(assert (=> b!1416703 (= e!801823 (= (seekEntryOrOpen!0 (select (arr!46668 a!2901) j!112) a!2901 mask!2840) (Found!11005 j!112)))))

(declare-fun res!952636 () Bool)

(assert (=> start!122088 (=> (not res!952636) (not e!801824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122088 (= res!952636 (validMask!0 mask!2840))))

(assert (=> start!122088 e!801824))

(assert (=> start!122088 true))

(declare-fun array_inv!35901 (array!96676) Bool)

(assert (=> start!122088 (array_inv!35901 a!2901)))

(declare-fun b!1416704 () Bool)

(declare-fun res!952629 () Bool)

(assert (=> b!1416704 (=> (not res!952629) (not e!801824))))

(declare-datatypes ((List!33265 0))(
  ( (Nil!33262) (Cons!33261 (h!34551 (_ BitVec 64)) (t!47951 List!33265)) )
))
(declare-fun arrayNoDuplicates!0 (array!96676 (_ BitVec 32) List!33265) Bool)

(assert (=> b!1416704 (= res!952629 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33262))))

(declare-fun b!1416705 () Bool)

(declare-fun res!952632 () Bool)

(assert (=> b!1416705 (=> (not res!952632) (not e!801824))))

(assert (=> b!1416705 (= res!952632 (validKeyInArray!0 (select (arr!46668 a!2901) j!112)))))

(declare-fun b!1416706 () Bool)

(declare-fun e!801822 () Bool)

(assert (=> b!1416706 (= e!801822 true)))

(declare-fun lt!624924 () SeekEntryResult!11005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96676 (_ BitVec 32)) SeekEntryResult!11005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416706 (= lt!624924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46668 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46668 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96677 (store (arr!46668 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47220 a!2901)) mask!2840))))

(declare-fun b!1416707 () Bool)

(assert (=> b!1416707 (= e!801824 (not e!801822))))

(declare-fun res!952630 () Bool)

(assert (=> b!1416707 (=> res!952630 e!801822)))

(declare-fun lt!624925 () SeekEntryResult!11005)

(assert (=> b!1416707 (= res!952630 (or (not (is-Intermediate!11005 lt!624925)) (undefined!11817 lt!624925)))))

(assert (=> b!1416707 e!801823))

(declare-fun res!952635 () Bool)

(assert (=> b!1416707 (=> (not res!952635) (not e!801823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96676 (_ BitVec 32)) Bool)

(assert (=> b!1416707 (= res!952635 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47827 0))(
  ( (Unit!47828) )
))
(declare-fun lt!624926 () Unit!47827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47827)

(assert (=> b!1416707 (= lt!624926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416707 (= lt!624925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46668 a!2901) j!112) mask!2840) (select (arr!46668 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416708 () Bool)

(declare-fun res!952634 () Bool)

(assert (=> b!1416708 (=> (not res!952634) (not e!801824))))

(assert (=> b!1416708 (= res!952634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!122088 res!952636) b!1416702))

(assert (= (and b!1416702 res!952633) b!1416701))

(assert (= (and b!1416701 res!952631) b!1416705))

(assert (= (and b!1416705 res!952632) b!1416708))

(assert (= (and b!1416708 res!952634) b!1416704))

(assert (= (and b!1416704 res!952629) b!1416707))

(assert (= (and b!1416707 res!952635) b!1416703))

(assert (= (and b!1416707 (not res!952630)) b!1416706))

(declare-fun m!1306905 () Bool)

(assert (=> b!1416706 m!1306905))

(declare-fun m!1306907 () Bool)

(assert (=> b!1416706 m!1306907))

(assert (=> b!1416706 m!1306907))

(declare-fun m!1306909 () Bool)

(assert (=> b!1416706 m!1306909))

(assert (=> b!1416706 m!1306909))

(assert (=> b!1416706 m!1306907))

(declare-fun m!1306911 () Bool)

(assert (=> b!1416706 m!1306911))

(declare-fun m!1306913 () Bool)

(assert (=> b!1416701 m!1306913))

(assert (=> b!1416701 m!1306913))

(declare-fun m!1306915 () Bool)

(assert (=> b!1416701 m!1306915))

(declare-fun m!1306917 () Bool)

(assert (=> b!1416705 m!1306917))

(assert (=> b!1416705 m!1306917))

(declare-fun m!1306919 () Bool)

(assert (=> b!1416705 m!1306919))

(declare-fun m!1306921 () Bool)

(assert (=> b!1416704 m!1306921))

(assert (=> b!1416707 m!1306917))

(declare-fun m!1306923 () Bool)

(assert (=> b!1416707 m!1306923))

(assert (=> b!1416707 m!1306917))

(declare-fun m!1306925 () Bool)

(assert (=> b!1416707 m!1306925))

(assert (=> b!1416707 m!1306923))

(assert (=> b!1416707 m!1306917))

(declare-fun m!1306927 () Bool)

(assert (=> b!1416707 m!1306927))

(declare-fun m!1306929 () Bool)

(assert (=> b!1416707 m!1306929))

(declare-fun m!1306931 () Bool)

(assert (=> start!122088 m!1306931))

(declare-fun m!1306933 () Bool)

(assert (=> start!122088 m!1306933))

(assert (=> b!1416703 m!1306917))

(assert (=> b!1416703 m!1306917))

(declare-fun m!1306935 () Bool)

(assert (=> b!1416703 m!1306935))

(declare-fun m!1306937 () Bool)

(assert (=> b!1416708 m!1306937))

(push 1)

(assert (not b!1416708))

(assert (not b!1416701))

(assert (not b!1416703))

(assert (not b!1416707))

(assert (not b!1416706))

(assert (not b!1416705))

(assert (not b!1416704))

(assert (not start!122088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

