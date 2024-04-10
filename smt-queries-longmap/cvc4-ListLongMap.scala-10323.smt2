; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121426 () Bool)

(assert start!121426)

(declare-fun b!1410779 () Bool)

(declare-fun res!948008 () Bool)

(declare-fun e!798359 () Bool)

(assert (=> b!1410779 (=> (not res!948008) (not e!798359))))

(declare-datatypes ((array!96427 0))(
  ( (array!96428 (arr!46552 (Array (_ BitVec 32) (_ BitVec 64))) (size!47102 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96427)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96427 (_ BitVec 32)) Bool)

(assert (=> b!1410779 (= res!948008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410780 () Bool)

(declare-fun res!948006 () Bool)

(assert (=> b!1410780 (=> (not res!948006) (not e!798359))))

(declare-datatypes ((List!33071 0))(
  ( (Nil!33068) (Cons!33067 (h!34339 (_ BitVec 64)) (t!47765 List!33071)) )
))
(declare-fun arrayNoDuplicates!0 (array!96427 (_ BitVec 32) List!33071) Bool)

(assert (=> b!1410780 (= res!948006 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33068))))

(declare-fun b!1410781 () Bool)

(declare-fun res!948012 () Bool)

(assert (=> b!1410781 (=> (not res!948012) (not e!798359))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410781 (= res!948012 (and (= (size!47102 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47102 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47102 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!948011 () Bool)

(assert (=> start!121426 (=> (not res!948011) (not e!798359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121426 (= res!948011 (validMask!0 mask!2840))))

(assert (=> start!121426 e!798359))

(assert (=> start!121426 true))

(declare-fun array_inv!35580 (array!96427) Bool)

(assert (=> start!121426 (array_inv!35580 a!2901)))

(declare-fun b!1410782 () Bool)

(declare-fun e!798362 () Bool)

(assert (=> b!1410782 (= e!798359 (not e!798362))))

(declare-fun res!948013 () Bool)

(assert (=> b!1410782 (=> res!948013 e!798362)))

(declare-datatypes ((SeekEntryResult!10863 0))(
  ( (MissingZero!10863 (index!45829 (_ BitVec 32))) (Found!10863 (index!45830 (_ BitVec 32))) (Intermediate!10863 (undefined!11675 Bool) (index!45831 (_ BitVec 32)) (x!127426 (_ BitVec 32))) (Undefined!10863) (MissingVacant!10863 (index!45832 (_ BitVec 32))) )
))
(declare-fun lt!621334 () SeekEntryResult!10863)

(assert (=> b!1410782 (= res!948013 (or (not (is-Intermediate!10863 lt!621334)) (undefined!11675 lt!621334)))))

(declare-fun e!798361 () Bool)

(assert (=> b!1410782 e!798361))

(declare-fun res!948010 () Bool)

(assert (=> b!1410782 (=> (not res!948010) (not e!798361))))

(assert (=> b!1410782 (= res!948010 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47700 0))(
  ( (Unit!47701) )
))
(declare-fun lt!621336 () Unit!47700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47700)

(assert (=> b!1410782 (= lt!621336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621333 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96427 (_ BitVec 32)) SeekEntryResult!10863)

(assert (=> b!1410782 (= lt!621334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621333 (select (arr!46552 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410782 (= lt!621333 (toIndex!0 (select (arr!46552 a!2901) j!112) mask!2840))))

(declare-fun b!1410783 () Bool)

(declare-fun res!948009 () Bool)

(assert (=> b!1410783 (=> (not res!948009) (not e!798359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410783 (= res!948009 (validKeyInArray!0 (select (arr!46552 a!2901) i!1037)))))

(declare-fun lt!621335 () SeekEntryResult!10863)

(declare-fun b!1410784 () Bool)

(assert (=> b!1410784 (= e!798362 (or (= lt!621334 lt!621335) (not (is-Intermediate!10863 lt!621335)) (bvslt (x!127426 lt!621334) #b00000000000000000000000000000000) (bvsgt (x!127426 lt!621334) #b01111111111111111111111111111110) (bvslt lt!621333 #b00000000000000000000000000000000) (bvsge lt!621333 (size!47102 a!2901)) (bvslt (index!45831 lt!621334) #b00000000000000000000000000000000) (bvsge (index!45831 lt!621334) (size!47102 a!2901)) (not (= lt!621334 (Intermediate!10863 false (index!45831 lt!621334) (x!127426 lt!621334)))) (= lt!621335 (Intermediate!10863 (undefined!11675 lt!621335) (index!45831 lt!621335) (x!127426 lt!621335)))))))

(assert (=> b!1410784 (= lt!621335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46552 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46552 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96428 (store (arr!46552 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47102 a!2901)) mask!2840))))

(declare-fun b!1410785 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96427 (_ BitVec 32)) SeekEntryResult!10863)

(assert (=> b!1410785 (= e!798361 (= (seekEntryOrOpen!0 (select (arr!46552 a!2901) j!112) a!2901 mask!2840) (Found!10863 j!112)))))

(declare-fun b!1410786 () Bool)

(declare-fun res!948007 () Bool)

(assert (=> b!1410786 (=> (not res!948007) (not e!798359))))

(assert (=> b!1410786 (= res!948007 (validKeyInArray!0 (select (arr!46552 a!2901) j!112)))))

(assert (= (and start!121426 res!948011) b!1410781))

(assert (= (and b!1410781 res!948012) b!1410783))

(assert (= (and b!1410783 res!948009) b!1410786))

(assert (= (and b!1410786 res!948007) b!1410779))

(assert (= (and b!1410779 res!948008) b!1410780))

(assert (= (and b!1410780 res!948006) b!1410782))

(assert (= (and b!1410782 res!948010) b!1410785))

(assert (= (and b!1410782 (not res!948013)) b!1410784))

(declare-fun m!1300433 () Bool)

(assert (=> b!1410785 m!1300433))

(assert (=> b!1410785 m!1300433))

(declare-fun m!1300435 () Bool)

(assert (=> b!1410785 m!1300435))

(assert (=> b!1410786 m!1300433))

(assert (=> b!1410786 m!1300433))

(declare-fun m!1300437 () Bool)

(assert (=> b!1410786 m!1300437))

(declare-fun m!1300439 () Bool)

(assert (=> start!121426 m!1300439))

(declare-fun m!1300441 () Bool)

(assert (=> start!121426 m!1300441))

(assert (=> b!1410782 m!1300433))

(declare-fun m!1300443 () Bool)

(assert (=> b!1410782 m!1300443))

(assert (=> b!1410782 m!1300433))

(assert (=> b!1410782 m!1300433))

(declare-fun m!1300445 () Bool)

(assert (=> b!1410782 m!1300445))

(declare-fun m!1300447 () Bool)

(assert (=> b!1410782 m!1300447))

(declare-fun m!1300449 () Bool)

(assert (=> b!1410782 m!1300449))

(declare-fun m!1300451 () Bool)

(assert (=> b!1410779 m!1300451))

(declare-fun m!1300453 () Bool)

(assert (=> b!1410783 m!1300453))

(assert (=> b!1410783 m!1300453))

(declare-fun m!1300455 () Bool)

(assert (=> b!1410783 m!1300455))

(declare-fun m!1300457 () Bool)

(assert (=> b!1410780 m!1300457))

(declare-fun m!1300459 () Bool)

(assert (=> b!1410784 m!1300459))

(declare-fun m!1300461 () Bool)

(assert (=> b!1410784 m!1300461))

(assert (=> b!1410784 m!1300461))

(declare-fun m!1300463 () Bool)

(assert (=> b!1410784 m!1300463))

(assert (=> b!1410784 m!1300463))

(assert (=> b!1410784 m!1300461))

(declare-fun m!1300465 () Bool)

(assert (=> b!1410784 m!1300465))

(push 1)

