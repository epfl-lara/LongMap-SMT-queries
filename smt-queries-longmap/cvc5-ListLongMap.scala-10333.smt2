; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121482 () Bool)

(assert start!121482)

(declare-fun res!948787 () Bool)

(declare-fun e!798790 () Bool)

(assert (=> start!121482 (=> (not res!948787) (not e!798790))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121482 (= res!948787 (validMask!0 mask!2840))))

(assert (=> start!121482 e!798790))

(assert (=> start!121482 true))

(declare-datatypes ((array!96483 0))(
  ( (array!96484 (arr!46580 (Array (_ BitVec 32) (_ BitVec 64))) (size!47130 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96483)

(declare-fun array_inv!35608 (array!96483) Bool)

(assert (=> start!121482 (array_inv!35608 a!2901)))

(declare-fun b!1411552 () Bool)

(declare-fun res!948784 () Bool)

(assert (=> b!1411552 (=> (not res!948784) (not e!798790))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411552 (= res!948784 (validKeyInArray!0 (select (arr!46580 a!2901) i!1037)))))

(declare-fun b!1411553 () Bool)

(declare-fun res!948779 () Bool)

(assert (=> b!1411553 (=> (not res!948779) (not e!798790))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411553 (= res!948779 (and (= (size!47130 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47130 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47130 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411554 () Bool)

(declare-fun res!948781 () Bool)

(assert (=> b!1411554 (=> (not res!948781) (not e!798790))))

(declare-datatypes ((List!33099 0))(
  ( (Nil!33096) (Cons!33095 (h!34367 (_ BitVec 64)) (t!47793 List!33099)) )
))
(declare-fun arrayNoDuplicates!0 (array!96483 (_ BitVec 32) List!33099) Bool)

(assert (=> b!1411554 (= res!948781 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33096))))

(declare-fun b!1411555 () Bool)

(declare-fun e!798791 () Bool)

(assert (=> b!1411555 (= e!798790 (not e!798791))))

(declare-fun res!948780 () Bool)

(assert (=> b!1411555 (=> res!948780 e!798791)))

(declare-datatypes ((SeekEntryResult!10891 0))(
  ( (MissingZero!10891 (index!45941 (_ BitVec 32))) (Found!10891 (index!45942 (_ BitVec 32))) (Intermediate!10891 (undefined!11703 Bool) (index!45943 (_ BitVec 32)) (x!127534 (_ BitVec 32))) (Undefined!10891) (MissingVacant!10891 (index!45944 (_ BitVec 32))) )
))
(declare-fun lt!621790 () SeekEntryResult!10891)

(assert (=> b!1411555 (= res!948780 (or (not (is-Intermediate!10891 lt!621790)) (undefined!11703 lt!621790)))))

(declare-fun e!798787 () Bool)

(assert (=> b!1411555 e!798787))

(declare-fun res!948785 () Bool)

(assert (=> b!1411555 (=> (not res!948785) (not e!798787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96483 (_ BitVec 32)) Bool)

(assert (=> b!1411555 (= res!948785 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47756 0))(
  ( (Unit!47757) )
))
(declare-fun lt!621793 () Unit!47756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47756)

(assert (=> b!1411555 (= lt!621793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621795 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96483 (_ BitVec 32)) SeekEntryResult!10891)

(assert (=> b!1411555 (= lt!621790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621795 (select (arr!46580 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411555 (= lt!621795 (toIndex!0 (select (arr!46580 a!2901) j!112) mask!2840))))

(declare-fun b!1411556 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96483 (_ BitVec 32)) SeekEntryResult!10891)

(assert (=> b!1411556 (= e!798787 (= (seekEntryOrOpen!0 (select (arr!46580 a!2901) j!112) a!2901 mask!2840) (Found!10891 j!112)))))

(declare-fun b!1411557 () Bool)

(declare-fun res!948782 () Bool)

(assert (=> b!1411557 (=> (not res!948782) (not e!798790))))

(assert (=> b!1411557 (= res!948782 (validKeyInArray!0 (select (arr!46580 a!2901) j!112)))))

(declare-fun b!1411558 () Bool)

(declare-fun e!798789 () Bool)

(assert (=> b!1411558 (= e!798789 true)))

(declare-fun lt!621792 () SeekEntryResult!10891)

(assert (=> b!1411558 (and (not (undefined!11703 lt!621792)) (= (index!45943 lt!621792) i!1037) (bvslt (x!127534 lt!621792) (x!127534 lt!621790)) (= (select (store (arr!46580 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45943 lt!621792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621794 () Unit!47756)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47756)

(assert (=> b!1411558 (= lt!621794 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621795 (x!127534 lt!621790) (index!45943 lt!621790) (x!127534 lt!621792) (index!45943 lt!621792) (undefined!11703 lt!621792) mask!2840))))

(declare-fun b!1411559 () Bool)

(declare-fun res!948783 () Bool)

(assert (=> b!1411559 (=> (not res!948783) (not e!798790))))

(assert (=> b!1411559 (= res!948783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411560 () Bool)

(assert (=> b!1411560 (= e!798791 e!798789)))

(declare-fun res!948786 () Bool)

(assert (=> b!1411560 (=> res!948786 e!798789)))

(assert (=> b!1411560 (= res!948786 (or (= lt!621790 lt!621792) (not (is-Intermediate!10891 lt!621792))))))

(declare-fun lt!621791 () (_ BitVec 64))

(assert (=> b!1411560 (= lt!621792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621791 mask!2840) lt!621791 (array!96484 (store (arr!46580 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47130 a!2901)) mask!2840))))

(assert (=> b!1411560 (= lt!621791 (select (store (arr!46580 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!121482 res!948787) b!1411553))

(assert (= (and b!1411553 res!948779) b!1411552))

(assert (= (and b!1411552 res!948784) b!1411557))

(assert (= (and b!1411557 res!948782) b!1411559))

(assert (= (and b!1411559 res!948783) b!1411554))

(assert (= (and b!1411554 res!948781) b!1411555))

(assert (= (and b!1411555 res!948785) b!1411556))

(assert (= (and b!1411555 (not res!948780)) b!1411560))

(assert (= (and b!1411560 (not res!948786)) b!1411558))

(declare-fun m!1301445 () Bool)

(assert (=> b!1411559 m!1301445))

(declare-fun m!1301447 () Bool)

(assert (=> b!1411556 m!1301447))

(assert (=> b!1411556 m!1301447))

(declare-fun m!1301449 () Bool)

(assert (=> b!1411556 m!1301449))

(declare-fun m!1301451 () Bool)

(assert (=> b!1411560 m!1301451))

(declare-fun m!1301453 () Bool)

(assert (=> b!1411560 m!1301453))

(assert (=> b!1411560 m!1301451))

(declare-fun m!1301455 () Bool)

(assert (=> b!1411560 m!1301455))

(declare-fun m!1301457 () Bool)

(assert (=> b!1411560 m!1301457))

(declare-fun m!1301459 () Bool)

(assert (=> start!121482 m!1301459))

(declare-fun m!1301461 () Bool)

(assert (=> start!121482 m!1301461))

(declare-fun m!1301463 () Bool)

(assert (=> b!1411554 m!1301463))

(declare-fun m!1301465 () Bool)

(assert (=> b!1411552 m!1301465))

(assert (=> b!1411552 m!1301465))

(declare-fun m!1301467 () Bool)

(assert (=> b!1411552 m!1301467))

(assert (=> b!1411555 m!1301447))

(declare-fun m!1301469 () Bool)

(assert (=> b!1411555 m!1301469))

(assert (=> b!1411555 m!1301447))

(declare-fun m!1301471 () Bool)

(assert (=> b!1411555 m!1301471))

(assert (=> b!1411555 m!1301447))

(declare-fun m!1301473 () Bool)

(assert (=> b!1411555 m!1301473))

(declare-fun m!1301475 () Bool)

(assert (=> b!1411555 m!1301475))

(assert (=> b!1411557 m!1301447))

(assert (=> b!1411557 m!1301447))

(declare-fun m!1301477 () Bool)

(assert (=> b!1411557 m!1301477))

(assert (=> b!1411558 m!1301453))

(declare-fun m!1301479 () Bool)

(assert (=> b!1411558 m!1301479))

(declare-fun m!1301481 () Bool)

(assert (=> b!1411558 m!1301481))

(push 1)

(assert (not b!1411552))

(assert (not b!1411554))

(assert (not b!1411555))

(assert (not start!121482))

(assert (not b!1411560))

(assert (not b!1411559))

(assert (not b!1411558))

(assert (not b!1411556))

(assert (not b!1411557))

