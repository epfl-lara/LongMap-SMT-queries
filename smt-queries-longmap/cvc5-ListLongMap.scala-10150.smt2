; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119664 () Bool)

(assert start!119664)

(declare-fun b!1393874 () Bool)

(declare-fun res!933339 () Bool)

(declare-fun e!789236 () Bool)

(assert (=> b!1393874 (=> (not res!933339) (not e!789236))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95299 0))(
  ( (array!95300 (arr!46008 (Array (_ BitVec 32) (_ BitVec 64))) (size!46560 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95299)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393874 (= res!933339 (and (= (size!46560 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46560 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46560 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393875 () Bool)

(declare-fun res!933333 () Bool)

(assert (=> b!1393875 (=> (not res!933333) (not e!789236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393875 (= res!933333 (validKeyInArray!0 (select (arr!46008 a!2901) i!1037)))))

(declare-fun b!1393876 () Bool)

(declare-fun e!789238 () Bool)

(declare-datatypes ((SeekEntryResult!10351 0))(
  ( (MissingZero!10351 (index!43775 (_ BitVec 32))) (Found!10351 (index!43776 (_ BitVec 32))) (Intermediate!10351 (undefined!11163 Bool) (index!43777 (_ BitVec 32)) (x!125440 (_ BitVec 32))) (Undefined!10351) (MissingVacant!10351 (index!43778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95299 (_ BitVec 32)) SeekEntryResult!10351)

(assert (=> b!1393876 (= e!789238 (= (seekEntryOrOpen!0 (select (arr!46008 a!2901) j!112) a!2901 mask!2840) (Found!10351 j!112)))))

(declare-fun b!1393877 () Bool)

(declare-fun res!933336 () Bool)

(assert (=> b!1393877 (=> (not res!933336) (not e!789236))))

(declare-datatypes ((List!32605 0))(
  ( (Nil!32602) (Cons!32601 (h!33834 (_ BitVec 64)) (t!47291 List!32605)) )
))
(declare-fun arrayNoDuplicates!0 (array!95299 (_ BitVec 32) List!32605) Bool)

(assert (=> b!1393877 (= res!933336 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32602))))

(declare-fun res!933340 () Bool)

(assert (=> start!119664 (=> (not res!933340) (not e!789236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119664 (= res!933340 (validMask!0 mask!2840))))

(assert (=> start!119664 e!789236))

(assert (=> start!119664 true))

(declare-fun array_inv!35241 (array!95299) Bool)

(assert (=> start!119664 (array_inv!35241 a!2901)))

(declare-fun b!1393878 () Bool)

(declare-fun res!933337 () Bool)

(assert (=> b!1393878 (=> (not res!933337) (not e!789236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95299 (_ BitVec 32)) Bool)

(assert (=> b!1393878 (= res!933337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393879 () Bool)

(declare-fun e!789239 () Bool)

(assert (=> b!1393879 (= e!789236 (not e!789239))))

(declare-fun res!933338 () Bool)

(assert (=> b!1393879 (=> res!933338 e!789239)))

(declare-fun lt!611994 () SeekEntryResult!10351)

(assert (=> b!1393879 (= res!933338 (or (not (is-Intermediate!10351 lt!611994)) (undefined!11163 lt!611994)))))

(assert (=> b!1393879 e!789238))

(declare-fun res!933335 () Bool)

(assert (=> b!1393879 (=> (not res!933335) (not e!789238))))

(assert (=> b!1393879 (= res!933335 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46549 0))(
  ( (Unit!46550) )
))
(declare-fun lt!611996 () Unit!46549)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46549)

(assert (=> b!1393879 (= lt!611996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95299 (_ BitVec 32)) SeekEntryResult!10351)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393879 (= lt!611994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46008 a!2901) j!112) mask!2840) (select (arr!46008 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393880 () Bool)

(assert (=> b!1393880 (= e!789239 true)))

(declare-fun lt!611995 () SeekEntryResult!10351)

(assert (=> b!1393880 (= lt!611995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46008 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46008 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95300 (store (arr!46008 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46560 a!2901)) mask!2840))))

(declare-fun b!1393881 () Bool)

(declare-fun res!933334 () Bool)

(assert (=> b!1393881 (=> (not res!933334) (not e!789236))))

(assert (=> b!1393881 (= res!933334 (validKeyInArray!0 (select (arr!46008 a!2901) j!112)))))

(assert (= (and start!119664 res!933340) b!1393874))

(assert (= (and b!1393874 res!933339) b!1393875))

(assert (= (and b!1393875 res!933333) b!1393881))

(assert (= (and b!1393881 res!933334) b!1393878))

(assert (= (and b!1393878 res!933337) b!1393877))

(assert (= (and b!1393877 res!933336) b!1393879))

(assert (= (and b!1393879 res!933335) b!1393876))

(assert (= (and b!1393879 (not res!933338)) b!1393880))

(declare-fun m!1279545 () Bool)

(assert (=> start!119664 m!1279545))

(declare-fun m!1279547 () Bool)

(assert (=> start!119664 m!1279547))

(declare-fun m!1279549 () Bool)

(assert (=> b!1393875 m!1279549))

(assert (=> b!1393875 m!1279549))

(declare-fun m!1279551 () Bool)

(assert (=> b!1393875 m!1279551))

(declare-fun m!1279553 () Bool)

(assert (=> b!1393876 m!1279553))

(assert (=> b!1393876 m!1279553))

(declare-fun m!1279555 () Bool)

(assert (=> b!1393876 m!1279555))

(assert (=> b!1393881 m!1279553))

(assert (=> b!1393881 m!1279553))

(declare-fun m!1279557 () Bool)

(assert (=> b!1393881 m!1279557))

(declare-fun m!1279559 () Bool)

(assert (=> b!1393880 m!1279559))

(declare-fun m!1279561 () Bool)

(assert (=> b!1393880 m!1279561))

(assert (=> b!1393880 m!1279561))

(declare-fun m!1279563 () Bool)

(assert (=> b!1393880 m!1279563))

(assert (=> b!1393880 m!1279563))

(assert (=> b!1393880 m!1279561))

(declare-fun m!1279565 () Bool)

(assert (=> b!1393880 m!1279565))

(assert (=> b!1393879 m!1279553))

(declare-fun m!1279567 () Bool)

(assert (=> b!1393879 m!1279567))

(assert (=> b!1393879 m!1279553))

(declare-fun m!1279569 () Bool)

(assert (=> b!1393879 m!1279569))

(assert (=> b!1393879 m!1279567))

(assert (=> b!1393879 m!1279553))

(declare-fun m!1279571 () Bool)

(assert (=> b!1393879 m!1279571))

(declare-fun m!1279573 () Bool)

(assert (=> b!1393879 m!1279573))

(declare-fun m!1279575 () Bool)

(assert (=> b!1393878 m!1279575))

(declare-fun m!1279577 () Bool)

(assert (=> b!1393877 m!1279577))

(push 1)

(assert (not b!1393877))

(assert (not b!1393880))

(assert (not b!1393878))

(assert (not b!1393881))

(assert (not b!1393876))

(assert (not start!119664))

(assert (not b!1393879))

(assert (not b!1393875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

