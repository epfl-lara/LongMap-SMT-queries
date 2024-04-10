; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130084 () Bool)

(assert start!130084)

(declare-fun b!1526650 () Bool)

(declare-fun res!1044696 () Bool)

(declare-fun e!850940 () Bool)

(assert (=> b!1526650 (=> (not res!1044696) (not e!850940))))

(declare-datatypes ((array!101497 0))(
  ( (array!101498 (arr!48975 (Array (_ BitVec 32) (_ BitVec 64))) (size!49525 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101497)

(declare-datatypes ((List!35458 0))(
  ( (Nil!35455) (Cons!35454 (h!36887 (_ BitVec 64)) (t!50152 List!35458)) )
))
(declare-fun arrayNoDuplicates!0 (array!101497 (_ BitVec 32) List!35458) Bool)

(assert (=> b!1526650 (= res!1044696 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35455))))

(declare-fun b!1526651 () Bool)

(declare-fun res!1044685 () Bool)

(assert (=> b!1526651 (=> (not res!1044685) (not e!850940))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526651 (= res!1044685 (validKeyInArray!0 (select (arr!48975 a!2804) j!70)))))

(declare-fun b!1526652 () Bool)

(declare-fun res!1044691 () Bool)

(assert (=> b!1526652 (=> (not res!1044691) (not e!850940))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526652 (= res!1044691 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49525 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49525 a!2804))))))

(declare-fun res!1044688 () Bool)

(assert (=> start!130084 (=> (not res!1044688) (not e!850940))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130084 (= res!1044688 (validMask!0 mask!2512))))

(assert (=> start!130084 e!850940))

(assert (=> start!130084 true))

(declare-fun array_inv!38003 (array!101497) Bool)

(assert (=> start!130084 (array_inv!38003 a!2804)))

(declare-fun b!1526653 () Bool)

(declare-fun res!1044687 () Bool)

(assert (=> b!1526653 (=> (not res!1044687) (not e!850940))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526653 (= res!1044687 (and (= (size!49525 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49525 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49525 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526654 () Bool)

(declare-fun e!850941 () Bool)

(assert (=> b!1526654 (= e!850940 e!850941)))

(declare-fun res!1044694 () Bool)

(assert (=> b!1526654 (=> (not res!1044694) (not e!850941))))

(declare-datatypes ((SeekEntryResult!13140 0))(
  ( (MissingZero!13140 (index!54955 (_ BitVec 32))) (Found!13140 (index!54956 (_ BitVec 32))) (Intermediate!13140 (undefined!13952 Bool) (index!54957 (_ BitVec 32)) (x!136650 (_ BitVec 32))) (Undefined!13140) (MissingVacant!13140 (index!54958 (_ BitVec 32))) )
))
(declare-fun lt!661149 () SeekEntryResult!13140)

(declare-fun lt!661150 () SeekEntryResult!13140)

(assert (=> b!1526654 (= res!1044694 (= lt!661149 lt!661150))))

(assert (=> b!1526654 (= lt!661150 (Intermediate!13140 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101497 (_ BitVec 32)) SeekEntryResult!13140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526654 (= lt!661149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48975 a!2804) j!70) mask!2512) (select (arr!48975 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526655 () Bool)

(declare-fun res!1044692 () Bool)

(assert (=> b!1526655 (=> (not res!1044692) (not e!850941))))

(assert (=> b!1526655 (= res!1044692 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48975 a!2804) j!70) a!2804 mask!2512) lt!661150))))

(declare-fun b!1526656 () Bool)

(declare-fun e!850942 () Bool)

(assert (=> b!1526656 (= e!850942 (not true))))

(declare-fun e!850937 () Bool)

(assert (=> b!1526656 e!850937))

(declare-fun res!1044697 () Bool)

(assert (=> b!1526656 (=> (not res!1044697) (not e!850937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101497 (_ BitVec 32)) Bool)

(assert (=> b!1526656 (= res!1044697 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51064 0))(
  ( (Unit!51065) )
))
(declare-fun lt!661153 () Unit!51064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51064)

(assert (=> b!1526656 (= lt!661153 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526657 () Bool)

(declare-fun e!850936 () Bool)

(declare-fun e!850939 () Bool)

(assert (=> b!1526657 (= e!850936 e!850939)))

(declare-fun res!1044695 () Bool)

(assert (=> b!1526657 (=> (not res!1044695) (not e!850939))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101497 (_ BitVec 32)) SeekEntryResult!13140)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101497 (_ BitVec 32)) SeekEntryResult!13140)

(assert (=> b!1526657 (= res!1044695 (= (seekEntryOrOpen!0 (select (arr!48975 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48975 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526658 () Bool)

(declare-fun res!1044690 () Bool)

(assert (=> b!1526658 (=> (not res!1044690) (not e!850937))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101497 (_ BitVec 32)) SeekEntryResult!13140)

(assert (=> b!1526658 (= res!1044690 (= (seekEntry!0 (select (arr!48975 a!2804) j!70) a!2804 mask!2512) (Found!13140 j!70)))))

(declare-fun lt!661151 () (_ BitVec 64))

(declare-fun b!1526659 () Bool)

(declare-fun lt!661152 () array!101497)

(assert (=> b!1526659 (= e!850939 (= (seekEntryOrOpen!0 lt!661151 lt!661152 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661151 lt!661152 mask!2512)))))

(declare-fun b!1526660 () Bool)

(declare-fun res!1044689 () Bool)

(assert (=> b!1526660 (=> (not res!1044689) (not e!850940))))

(assert (=> b!1526660 (= res!1044689 (validKeyInArray!0 (select (arr!48975 a!2804) i!961)))))

(declare-fun b!1526661 () Bool)

(assert (=> b!1526661 (= e!850937 e!850936)))

(declare-fun res!1044693 () Bool)

(assert (=> b!1526661 (=> res!1044693 e!850936)))

(assert (=> b!1526661 (= res!1044693 (or (not (= (select (arr!48975 a!2804) j!70) lt!661151)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48975 a!2804) index!487) (select (arr!48975 a!2804) j!70)) (not (= (select (arr!48975 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526662 () Bool)

(assert (=> b!1526662 (= e!850941 e!850942)))

(declare-fun res!1044684 () Bool)

(assert (=> b!1526662 (=> (not res!1044684) (not e!850942))))

(assert (=> b!1526662 (= res!1044684 (= lt!661149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661151 mask!2512) lt!661151 lt!661152 mask!2512)))))

(assert (=> b!1526662 (= lt!661151 (select (store (arr!48975 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526662 (= lt!661152 (array!101498 (store (arr!48975 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49525 a!2804)))))

(declare-fun b!1526663 () Bool)

(declare-fun res!1044686 () Bool)

(assert (=> b!1526663 (=> (not res!1044686) (not e!850940))))

(assert (=> b!1526663 (= res!1044686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130084 res!1044688) b!1526653))

(assert (= (and b!1526653 res!1044687) b!1526660))

(assert (= (and b!1526660 res!1044689) b!1526651))

(assert (= (and b!1526651 res!1044685) b!1526663))

(assert (= (and b!1526663 res!1044686) b!1526650))

(assert (= (and b!1526650 res!1044696) b!1526652))

(assert (= (and b!1526652 res!1044691) b!1526654))

(assert (= (and b!1526654 res!1044694) b!1526655))

(assert (= (and b!1526655 res!1044692) b!1526662))

(assert (= (and b!1526662 res!1044684) b!1526656))

(assert (= (and b!1526656 res!1044697) b!1526658))

(assert (= (and b!1526658 res!1044690) b!1526661))

(assert (= (and b!1526661 (not res!1044693)) b!1526657))

(assert (= (and b!1526657 res!1044695) b!1526659))

(declare-fun m!1409473 () Bool)

(assert (=> b!1526650 m!1409473))

(declare-fun m!1409475 () Bool)

(assert (=> b!1526661 m!1409475))

(declare-fun m!1409477 () Bool)

(assert (=> b!1526661 m!1409477))

(declare-fun m!1409479 () Bool)

(assert (=> b!1526662 m!1409479))

(assert (=> b!1526662 m!1409479))

(declare-fun m!1409481 () Bool)

(assert (=> b!1526662 m!1409481))

(declare-fun m!1409483 () Bool)

(assert (=> b!1526662 m!1409483))

(declare-fun m!1409485 () Bool)

(assert (=> b!1526662 m!1409485))

(declare-fun m!1409487 () Bool)

(assert (=> b!1526656 m!1409487))

(declare-fun m!1409489 () Bool)

(assert (=> b!1526656 m!1409489))

(assert (=> b!1526658 m!1409475))

(assert (=> b!1526658 m!1409475))

(declare-fun m!1409491 () Bool)

(assert (=> b!1526658 m!1409491))

(assert (=> b!1526655 m!1409475))

(assert (=> b!1526655 m!1409475))

(declare-fun m!1409493 () Bool)

(assert (=> b!1526655 m!1409493))

(declare-fun m!1409495 () Bool)

(assert (=> b!1526663 m!1409495))

(declare-fun m!1409497 () Bool)

(assert (=> b!1526659 m!1409497))

(declare-fun m!1409499 () Bool)

(assert (=> b!1526659 m!1409499))

(declare-fun m!1409501 () Bool)

(assert (=> start!130084 m!1409501))

(declare-fun m!1409503 () Bool)

(assert (=> start!130084 m!1409503))

(assert (=> b!1526651 m!1409475))

(assert (=> b!1526651 m!1409475))

(declare-fun m!1409505 () Bool)

(assert (=> b!1526651 m!1409505))

(declare-fun m!1409507 () Bool)

(assert (=> b!1526660 m!1409507))

(assert (=> b!1526660 m!1409507))

(declare-fun m!1409509 () Bool)

(assert (=> b!1526660 m!1409509))

(assert (=> b!1526654 m!1409475))

(assert (=> b!1526654 m!1409475))

(declare-fun m!1409511 () Bool)

(assert (=> b!1526654 m!1409511))

(assert (=> b!1526654 m!1409511))

(assert (=> b!1526654 m!1409475))

(declare-fun m!1409513 () Bool)

(assert (=> b!1526654 m!1409513))

(assert (=> b!1526657 m!1409475))

(assert (=> b!1526657 m!1409475))

(declare-fun m!1409515 () Bool)

(assert (=> b!1526657 m!1409515))

(assert (=> b!1526657 m!1409475))

(declare-fun m!1409517 () Bool)

(assert (=> b!1526657 m!1409517))

(check-sat (not b!1526662) (not start!130084) (not b!1526658) (not b!1526663) (not b!1526651) (not b!1526655) (not b!1526650) (not b!1526656) (not b!1526657) (not b!1526659) (not b!1526654) (not b!1526660))
(check-sat)
