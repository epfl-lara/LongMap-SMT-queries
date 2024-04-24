; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121416 () Bool)

(assert start!121416)

(declare-fun res!947760 () Bool)

(declare-fun e!798404 () Bool)

(assert (=> start!121416 (=> (not res!947760) (not e!798404))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121416 (= res!947760 (validMask!0 mask!2840))))

(assert (=> start!121416 e!798404))

(assert (=> start!121416 true))

(declare-datatypes ((array!96492 0))(
  ( (array!96493 (arr!46587 (Array (_ BitVec 32) (_ BitVec 64))) (size!47138 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96492)

(declare-fun array_inv!35868 (array!96492) Bool)

(assert (=> start!121416 (array_inv!35868 a!2901)))

(declare-fun e!798407 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1410722 () Bool)

(declare-datatypes ((SeekEntryResult!10801 0))(
  ( (MissingZero!10801 (index!45581 (_ BitVec 32))) (Found!10801 (index!45582 (_ BitVec 32))) (Intermediate!10801 (undefined!11613 Bool) (index!45583 (_ BitVec 32)) (x!127317 (_ BitVec 32))) (Undefined!10801) (MissingVacant!10801 (index!45584 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96492 (_ BitVec 32)) SeekEntryResult!10801)

(assert (=> b!1410722 (= e!798407 (= (seekEntryOrOpen!0 (select (arr!46587 a!2901) j!112) a!2901 mask!2840) (Found!10801 j!112)))))

(declare-fun b!1410723 () Bool)

(declare-fun res!947764 () Bool)

(assert (=> b!1410723 (=> (not res!947764) (not e!798404))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410723 (= res!947764 (validKeyInArray!0 (select (arr!46587 a!2901) i!1037)))))

(declare-fun b!1410724 () Bool)

(declare-fun e!798405 () Bool)

(assert (=> b!1410724 (= e!798405 true)))

(declare-fun lt!621174 () SeekEntryResult!10801)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96492 (_ BitVec 32)) SeekEntryResult!10801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410724 (= lt!621174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46587 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46587 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96493 (store (arr!46587 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47138 a!2901)) mask!2840))))

(declare-fun b!1410725 () Bool)

(declare-fun res!947761 () Bool)

(assert (=> b!1410725 (=> (not res!947761) (not e!798404))))

(assert (=> b!1410725 (= res!947761 (validKeyInArray!0 (select (arr!46587 a!2901) j!112)))))

(declare-fun b!1410726 () Bool)

(assert (=> b!1410726 (= e!798404 (not e!798405))))

(declare-fun res!947765 () Bool)

(assert (=> b!1410726 (=> res!947765 e!798405)))

(declare-fun lt!621175 () SeekEntryResult!10801)

(assert (=> b!1410726 (= res!947765 (or (not (is-Intermediate!10801 lt!621175)) (undefined!11613 lt!621175)))))

(assert (=> b!1410726 e!798407))

(declare-fun res!947762 () Bool)

(assert (=> b!1410726 (=> (not res!947762) (not e!798407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96492 (_ BitVec 32)) Bool)

(assert (=> b!1410726 (= res!947762 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47603 0))(
  ( (Unit!47604) )
))
(declare-fun lt!621176 () Unit!47603)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47603)

(assert (=> b!1410726 (= lt!621176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410726 (= lt!621175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46587 a!2901) j!112) mask!2840) (select (arr!46587 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410727 () Bool)

(declare-fun res!947766 () Bool)

(assert (=> b!1410727 (=> (not res!947766) (not e!798404))))

(assert (=> b!1410727 (= res!947766 (and (= (size!47138 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47138 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47138 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410728 () Bool)

(declare-fun res!947767 () Bool)

(assert (=> b!1410728 (=> (not res!947767) (not e!798404))))

(assert (=> b!1410728 (= res!947767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410729 () Bool)

(declare-fun res!947763 () Bool)

(assert (=> b!1410729 (=> (not res!947763) (not e!798404))))

(declare-datatypes ((List!33093 0))(
  ( (Nil!33090) (Cons!33089 (h!34360 (_ BitVec 64)) (t!47779 List!33093)) )
))
(declare-fun arrayNoDuplicates!0 (array!96492 (_ BitVec 32) List!33093) Bool)

(assert (=> b!1410729 (= res!947763 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33090))))

(assert (= (and start!121416 res!947760) b!1410727))

(assert (= (and b!1410727 res!947766) b!1410723))

(assert (= (and b!1410723 res!947764) b!1410725))

(assert (= (and b!1410725 res!947761) b!1410728))

(assert (= (and b!1410728 res!947767) b!1410729))

(assert (= (and b!1410729 res!947763) b!1410726))

(assert (= (and b!1410726 res!947762) b!1410722))

(assert (= (and b!1410726 (not res!947765)) b!1410724))

(declare-fun m!1300731 () Bool)

(assert (=> start!121416 m!1300731))

(declare-fun m!1300733 () Bool)

(assert (=> start!121416 m!1300733))

(declare-fun m!1300735 () Bool)

(assert (=> b!1410725 m!1300735))

(assert (=> b!1410725 m!1300735))

(declare-fun m!1300737 () Bool)

(assert (=> b!1410725 m!1300737))

(declare-fun m!1300739 () Bool)

(assert (=> b!1410724 m!1300739))

(declare-fun m!1300741 () Bool)

(assert (=> b!1410724 m!1300741))

(assert (=> b!1410724 m!1300741))

(declare-fun m!1300743 () Bool)

(assert (=> b!1410724 m!1300743))

(assert (=> b!1410724 m!1300743))

(assert (=> b!1410724 m!1300741))

(declare-fun m!1300745 () Bool)

(assert (=> b!1410724 m!1300745))

(assert (=> b!1410722 m!1300735))

(assert (=> b!1410722 m!1300735))

(declare-fun m!1300747 () Bool)

(assert (=> b!1410722 m!1300747))

(declare-fun m!1300749 () Bool)

(assert (=> b!1410729 m!1300749))

(declare-fun m!1300751 () Bool)

(assert (=> b!1410728 m!1300751))

(declare-fun m!1300753 () Bool)

(assert (=> b!1410723 m!1300753))

(assert (=> b!1410723 m!1300753))

(declare-fun m!1300755 () Bool)

(assert (=> b!1410723 m!1300755))

(assert (=> b!1410726 m!1300735))

(declare-fun m!1300757 () Bool)

(assert (=> b!1410726 m!1300757))

(assert (=> b!1410726 m!1300735))

(declare-fun m!1300759 () Bool)

(assert (=> b!1410726 m!1300759))

(assert (=> b!1410726 m!1300757))

(assert (=> b!1410726 m!1300735))

(declare-fun m!1300761 () Bool)

(assert (=> b!1410726 m!1300761))

(declare-fun m!1300763 () Bool)

(assert (=> b!1410726 m!1300763))

(push 1)

(assert (not b!1410729))

(assert (not start!121416))

(assert (not b!1410723))

(assert (not b!1410724))

(assert (not b!1410725))

(assert (not b!1410728))

(assert (not b!1410722))

(assert (not b!1410726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

