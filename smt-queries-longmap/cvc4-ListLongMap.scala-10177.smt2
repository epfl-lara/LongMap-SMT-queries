; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119992 () Bool)

(assert start!119992)

(declare-fun b!1396852 () Bool)

(declare-fun res!935766 () Bool)

(declare-fun e!790804 () Bool)

(assert (=> b!1396852 (=> (not res!935766) (not e!790804))))

(declare-datatypes ((array!95521 0))(
  ( (array!95522 (arr!46114 (Array (_ BitVec 32) (_ BitVec 64))) (size!46664 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95521)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396852 (= res!935766 (validKeyInArray!0 (select (arr!46114 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!790807 () Bool)

(declare-fun b!1396853 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10431 0))(
  ( (MissingZero!10431 (index!44095 (_ BitVec 32))) (Found!10431 (index!44096 (_ BitVec 32))) (Intermediate!10431 (undefined!11243 Bool) (index!44097 (_ BitVec 32)) (x!125757 (_ BitVec 32))) (Undefined!10431) (MissingVacant!10431 (index!44098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95521 (_ BitVec 32)) SeekEntryResult!10431)

(assert (=> b!1396853 (= e!790807 (= (seekEntryOrOpen!0 (select (arr!46114 a!2901) j!112) a!2901 mask!2840) (Found!10431 j!112)))))

(declare-fun b!1396854 () Bool)

(declare-fun res!935769 () Bool)

(assert (=> b!1396854 (=> (not res!935769) (not e!790804))))

(declare-datatypes ((List!32633 0))(
  ( (Nil!32630) (Cons!32629 (h!33871 (_ BitVec 64)) (t!47327 List!32633)) )
))
(declare-fun arrayNoDuplicates!0 (array!95521 (_ BitVec 32) List!32633) Bool)

(assert (=> b!1396854 (= res!935769 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32630))))

(declare-fun res!935773 () Bool)

(assert (=> start!119992 (=> (not res!935773) (not e!790804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119992 (= res!935773 (validMask!0 mask!2840))))

(assert (=> start!119992 e!790804))

(assert (=> start!119992 true))

(declare-fun array_inv!35142 (array!95521) Bool)

(assert (=> start!119992 (array_inv!35142 a!2901)))

(declare-fun b!1396855 () Bool)

(declare-fun res!935771 () Bool)

(assert (=> b!1396855 (=> (not res!935771) (not e!790804))))

(assert (=> b!1396855 (= res!935771 (and (= (size!46664 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46664 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46664 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396856 () Bool)

(declare-fun e!790806 () Bool)

(assert (=> b!1396856 (= e!790804 (not e!790806))))

(declare-fun res!935770 () Bool)

(assert (=> b!1396856 (=> res!935770 e!790806)))

(declare-fun lt!613749 () SeekEntryResult!10431)

(assert (=> b!1396856 (= res!935770 (or (not (is-Intermediate!10431 lt!613749)) (undefined!11243 lt!613749)))))

(assert (=> b!1396856 e!790807))

(declare-fun res!935768 () Bool)

(assert (=> b!1396856 (=> (not res!935768) (not e!790807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95521 (_ BitVec 32)) Bool)

(assert (=> b!1396856 (= res!935768 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46866 0))(
  ( (Unit!46867) )
))
(declare-fun lt!613751 () Unit!46866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46866)

(assert (=> b!1396856 (= lt!613751 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613748 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95521 (_ BitVec 32)) SeekEntryResult!10431)

(assert (=> b!1396856 (= lt!613749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613748 (select (arr!46114 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396856 (= lt!613748 (toIndex!0 (select (arr!46114 a!2901) j!112) mask!2840))))

(declare-fun b!1396857 () Bool)

(declare-fun e!790808 () Bool)

(assert (=> b!1396857 (= e!790806 e!790808)))

(declare-fun res!935772 () Bool)

(assert (=> b!1396857 (=> res!935772 e!790808)))

(declare-fun lt!613750 () SeekEntryResult!10431)

(assert (=> b!1396857 (= res!935772 (or (= lt!613749 lt!613750) (not (is-Intermediate!10431 lt!613750)) (bvslt (x!125757 lt!613749) #b00000000000000000000000000000000) (bvsgt (x!125757 lt!613749) #b01111111111111111111111111111110) (bvslt lt!613748 #b00000000000000000000000000000000) (bvsge lt!613748 (size!46664 a!2901)) (bvslt (index!44097 lt!613749) #b00000000000000000000000000000000) (bvsge (index!44097 lt!613749) (size!46664 a!2901)) (not (= lt!613749 (Intermediate!10431 false (index!44097 lt!613749) (x!125757 lt!613749)))) (not (= lt!613750 (Intermediate!10431 (undefined!11243 lt!613750) (index!44097 lt!613750) (x!125757 lt!613750))))))))

(declare-fun lt!613747 () (_ BitVec 64))

(declare-fun lt!613752 () array!95521)

(assert (=> b!1396857 (= lt!613750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613747 mask!2840) lt!613747 lt!613752 mask!2840))))

(assert (=> b!1396857 (= lt!613747 (select (store (arr!46114 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396857 (= lt!613752 (array!95522 (store (arr!46114 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46664 a!2901)))))

(declare-fun b!1396858 () Bool)

(declare-fun res!935765 () Bool)

(assert (=> b!1396858 (=> (not res!935765) (not e!790804))))

(assert (=> b!1396858 (= res!935765 (validKeyInArray!0 (select (arr!46114 a!2901) j!112)))))

(declare-fun b!1396859 () Bool)

(assert (=> b!1396859 (= e!790808 true)))

(declare-fun lt!613746 () SeekEntryResult!10431)

(assert (=> b!1396859 (= lt!613746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613748 lt!613747 lt!613752 mask!2840))))

(declare-fun b!1396860 () Bool)

(declare-fun res!935767 () Bool)

(assert (=> b!1396860 (=> (not res!935767) (not e!790804))))

(assert (=> b!1396860 (= res!935767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119992 res!935773) b!1396855))

(assert (= (and b!1396855 res!935771) b!1396852))

(assert (= (and b!1396852 res!935766) b!1396858))

(assert (= (and b!1396858 res!935765) b!1396860))

(assert (= (and b!1396860 res!935767) b!1396854))

(assert (= (and b!1396854 res!935769) b!1396856))

(assert (= (and b!1396856 res!935768) b!1396853))

(assert (= (and b!1396856 (not res!935770)) b!1396857))

(assert (= (and b!1396857 (not res!935772)) b!1396859))

(declare-fun m!1283427 () Bool)

(assert (=> b!1396856 m!1283427))

(declare-fun m!1283429 () Bool)

(assert (=> b!1396856 m!1283429))

(assert (=> b!1396856 m!1283427))

(declare-fun m!1283431 () Bool)

(assert (=> b!1396856 m!1283431))

(assert (=> b!1396856 m!1283427))

(declare-fun m!1283433 () Bool)

(assert (=> b!1396856 m!1283433))

(declare-fun m!1283435 () Bool)

(assert (=> b!1396856 m!1283435))

(declare-fun m!1283437 () Bool)

(assert (=> b!1396860 m!1283437))

(declare-fun m!1283439 () Bool)

(assert (=> start!119992 m!1283439))

(declare-fun m!1283441 () Bool)

(assert (=> start!119992 m!1283441))

(declare-fun m!1283443 () Bool)

(assert (=> b!1396852 m!1283443))

(assert (=> b!1396852 m!1283443))

(declare-fun m!1283445 () Bool)

(assert (=> b!1396852 m!1283445))

(declare-fun m!1283447 () Bool)

(assert (=> b!1396859 m!1283447))

(assert (=> b!1396858 m!1283427))

(assert (=> b!1396858 m!1283427))

(declare-fun m!1283449 () Bool)

(assert (=> b!1396858 m!1283449))

(declare-fun m!1283451 () Bool)

(assert (=> b!1396857 m!1283451))

(assert (=> b!1396857 m!1283451))

(declare-fun m!1283453 () Bool)

(assert (=> b!1396857 m!1283453))

(declare-fun m!1283455 () Bool)

(assert (=> b!1396857 m!1283455))

(declare-fun m!1283457 () Bool)

(assert (=> b!1396857 m!1283457))

(declare-fun m!1283459 () Bool)

(assert (=> b!1396854 m!1283459))

(assert (=> b!1396853 m!1283427))

(assert (=> b!1396853 m!1283427))

(declare-fun m!1283461 () Bool)

(assert (=> b!1396853 m!1283461))

(push 1)

