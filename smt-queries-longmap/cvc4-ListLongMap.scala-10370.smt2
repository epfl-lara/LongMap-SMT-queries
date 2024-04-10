; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122092 () Bool)

(assert start!122092)

(declare-fun b!1416782 () Bool)

(declare-fun e!801862 () Bool)

(assert (=> b!1416782 (= e!801862 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96727 0))(
  ( (array!96728 (arr!46693 (Array (_ BitVec 32) (_ BitVec 64))) (size!47243 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96727)

(declare-datatypes ((SeekEntryResult!11004 0))(
  ( (MissingZero!11004 (index!46408 (_ BitVec 32))) (Found!11004 (index!46409 (_ BitVec 32))) (Intermediate!11004 (undefined!11816 Bool) (index!46410 (_ BitVec 32)) (x!128009 (_ BitVec 32))) (Undefined!11004) (MissingVacant!11004 (index!46411 (_ BitVec 32))) )
))
(declare-fun lt!625114 () SeekEntryResult!11004)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96727 (_ BitVec 32)) SeekEntryResult!11004)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416782 (= lt!625114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46693 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46693 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96728 (store (arr!46693 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47243 a!2901)) mask!2840))))

(declare-fun b!1416783 () Bool)

(declare-fun res!952666 () Bool)

(declare-fun e!801860 () Bool)

(assert (=> b!1416783 (=> (not res!952666) (not e!801860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96727 (_ BitVec 32)) Bool)

(assert (=> b!1416783 (= res!952666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416784 () Bool)

(declare-fun res!952662 () Bool)

(assert (=> b!1416784 (=> (not res!952662) (not e!801860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416784 (= res!952662 (validKeyInArray!0 (select (arr!46693 a!2901) i!1037)))))

(declare-fun b!1416785 () Bool)

(assert (=> b!1416785 (= e!801860 (not e!801862))))

(declare-fun res!952663 () Bool)

(assert (=> b!1416785 (=> res!952663 e!801862)))

(declare-fun lt!625115 () SeekEntryResult!11004)

(assert (=> b!1416785 (= res!952663 (or (not (is-Intermediate!11004 lt!625115)) (undefined!11816 lt!625115)))))

(declare-fun e!801863 () Bool)

(assert (=> b!1416785 e!801863))

(declare-fun res!952664 () Bool)

(assert (=> b!1416785 (=> (not res!952664) (not e!801863))))

(assert (=> b!1416785 (= res!952664 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47982 0))(
  ( (Unit!47983) )
))
(declare-fun lt!625116 () Unit!47982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47982)

(assert (=> b!1416785 (= lt!625116 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416785 (= lt!625115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46693 a!2901) j!112) mask!2840) (select (arr!46693 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416787 () Bool)

(declare-fun res!952659 () Bool)

(assert (=> b!1416787 (=> (not res!952659) (not e!801860))))

(assert (=> b!1416787 (= res!952659 (validKeyInArray!0 (select (arr!46693 a!2901) j!112)))))

(declare-fun b!1416786 () Bool)

(declare-fun res!952661 () Bool)

(assert (=> b!1416786 (=> (not res!952661) (not e!801860))))

(assert (=> b!1416786 (= res!952661 (and (= (size!47243 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47243 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47243 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952665 () Bool)

(assert (=> start!122092 (=> (not res!952665) (not e!801860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122092 (= res!952665 (validMask!0 mask!2840))))

(assert (=> start!122092 e!801860))

(assert (=> start!122092 true))

(declare-fun array_inv!35721 (array!96727) Bool)

(assert (=> start!122092 (array_inv!35721 a!2901)))

(declare-fun b!1416788 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96727 (_ BitVec 32)) SeekEntryResult!11004)

(assert (=> b!1416788 (= e!801863 (= (seekEntryOrOpen!0 (select (arr!46693 a!2901) j!112) a!2901 mask!2840) (Found!11004 j!112)))))

(declare-fun b!1416789 () Bool)

(declare-fun res!952660 () Bool)

(assert (=> b!1416789 (=> (not res!952660) (not e!801860))))

(declare-datatypes ((List!33212 0))(
  ( (Nil!33209) (Cons!33208 (h!34498 (_ BitVec 64)) (t!47906 List!33212)) )
))
(declare-fun arrayNoDuplicates!0 (array!96727 (_ BitVec 32) List!33212) Bool)

(assert (=> b!1416789 (= res!952660 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33209))))

(assert (= (and start!122092 res!952665) b!1416786))

(assert (= (and b!1416786 res!952661) b!1416784))

(assert (= (and b!1416784 res!952662) b!1416787))

(assert (= (and b!1416787 res!952659) b!1416783))

(assert (= (and b!1416783 res!952666) b!1416789))

(assert (= (and b!1416789 res!952660) b!1416785))

(assert (= (and b!1416785 res!952664) b!1416788))

(assert (= (and b!1416785 (not res!952663)) b!1416782))

(declare-fun m!1307441 () Bool)

(assert (=> b!1416787 m!1307441))

(assert (=> b!1416787 m!1307441))

(declare-fun m!1307443 () Bool)

(assert (=> b!1416787 m!1307443))

(assert (=> b!1416788 m!1307441))

(assert (=> b!1416788 m!1307441))

(declare-fun m!1307445 () Bool)

(assert (=> b!1416788 m!1307445))

(declare-fun m!1307447 () Bool)

(assert (=> b!1416789 m!1307447))

(declare-fun m!1307449 () Bool)

(assert (=> b!1416784 m!1307449))

(assert (=> b!1416784 m!1307449))

(declare-fun m!1307451 () Bool)

(assert (=> b!1416784 m!1307451))

(declare-fun m!1307453 () Bool)

(assert (=> start!122092 m!1307453))

(declare-fun m!1307455 () Bool)

(assert (=> start!122092 m!1307455))

(declare-fun m!1307457 () Bool)

(assert (=> b!1416782 m!1307457))

(declare-fun m!1307459 () Bool)

(assert (=> b!1416782 m!1307459))

(assert (=> b!1416782 m!1307459))

(declare-fun m!1307461 () Bool)

(assert (=> b!1416782 m!1307461))

(assert (=> b!1416782 m!1307461))

(assert (=> b!1416782 m!1307459))

(declare-fun m!1307463 () Bool)

(assert (=> b!1416782 m!1307463))

(assert (=> b!1416785 m!1307441))

(declare-fun m!1307465 () Bool)

(assert (=> b!1416785 m!1307465))

(assert (=> b!1416785 m!1307441))

(declare-fun m!1307467 () Bool)

(assert (=> b!1416785 m!1307467))

(assert (=> b!1416785 m!1307465))

(assert (=> b!1416785 m!1307441))

(declare-fun m!1307469 () Bool)

(assert (=> b!1416785 m!1307469))

(declare-fun m!1307471 () Bool)

(assert (=> b!1416785 m!1307471))

(declare-fun m!1307473 () Bool)

(assert (=> b!1416783 m!1307473))

(push 1)

(assert (not b!1416783))

(assert (not b!1416785))

(assert (not start!122092))

(assert (not b!1416787))

(assert (not b!1416788))

(assert (not b!1416789))

(assert (not b!1416782))

(assert (not b!1416784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

