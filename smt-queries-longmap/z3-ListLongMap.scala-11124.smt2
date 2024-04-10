; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130042 () Bool)

(assert start!130042)

(declare-fun b!1525768 () Bool)

(declare-fun res!1043813 () Bool)

(declare-fun e!850495 () Bool)

(assert (=> b!1525768 (=> (not res!1043813) (not e!850495))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101455 0))(
  ( (array!101456 (arr!48954 (Array (_ BitVec 32) (_ BitVec 64))) (size!49504 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101455)

(declare-datatypes ((SeekEntryResult!13119 0))(
  ( (MissingZero!13119 (index!54871 (_ BitVec 32))) (Found!13119 (index!54872 (_ BitVec 32))) (Intermediate!13119 (undefined!13931 Bool) (index!54873 (_ BitVec 32)) (x!136573 (_ BitVec 32))) (Undefined!13119) (MissingVacant!13119 (index!54874 (_ BitVec 32))) )
))
(declare-fun lt!660837 () SeekEntryResult!13119)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13119)

(assert (=> b!1525768 (= res!1043813 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) lt!660837))))

(declare-fun b!1525769 () Bool)

(declare-fun res!1043815 () Bool)

(declare-fun e!850500 () Bool)

(assert (=> b!1525769 (=> (not res!1043815) (not e!850500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525769 (= res!1043815 (validKeyInArray!0 (select (arr!48954 a!2804) j!70)))))

(declare-fun res!1043806 () Bool)

(assert (=> start!130042 (=> (not res!1043806) (not e!850500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130042 (= res!1043806 (validMask!0 mask!2512))))

(assert (=> start!130042 e!850500))

(assert (=> start!130042 true))

(declare-fun array_inv!37982 (array!101455) Bool)

(assert (=> start!130042 (array_inv!37982 a!2804)))

(declare-fun b!1525770 () Bool)

(declare-fun res!1043808 () Bool)

(declare-fun e!850501 () Bool)

(assert (=> b!1525770 (=> (not res!1043808) (not e!850501))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13119)

(assert (=> b!1525770 (= res!1043808 (= (seekEntry!0 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) (Found!13119 j!70)))))

(declare-fun b!1525771 () Bool)

(declare-fun e!850498 () Bool)

(assert (=> b!1525771 (= e!850495 e!850498)))

(declare-fun res!1043809 () Bool)

(assert (=> b!1525771 (=> (not res!1043809) (not e!850498))))

(declare-fun lt!660838 () SeekEntryResult!13119)

(declare-fun lt!660836 () (_ BitVec 64))

(declare-fun lt!660835 () array!101455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525771 (= res!1043809 (= lt!660838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660836 mask!2512) lt!660836 lt!660835 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525771 (= lt!660836 (select (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525771 (= lt!660835 (array!101456 (store (arr!48954 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49504 a!2804)))))

(declare-fun b!1525772 () Bool)

(declare-fun e!850496 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13119)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101455 (_ BitVec 32)) SeekEntryResult!13119)

(assert (=> b!1525772 (= e!850496 (= (seekEntryOrOpen!0 lt!660836 lt!660835 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660836 lt!660835 mask!2512)))))

(declare-fun b!1525773 () Bool)

(assert (=> b!1525773 (= e!850498 (not true))))

(assert (=> b!1525773 e!850501))

(declare-fun res!1043814 () Bool)

(assert (=> b!1525773 (=> (not res!1043814) (not e!850501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101455 (_ BitVec 32)) Bool)

(assert (=> b!1525773 (= res!1043814 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51022 0))(
  ( (Unit!51023) )
))
(declare-fun lt!660834 () Unit!51022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51022)

(assert (=> b!1525773 (= lt!660834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525774 () Bool)

(declare-fun res!1043811 () Bool)

(assert (=> b!1525774 (=> (not res!1043811) (not e!850500))))

(assert (=> b!1525774 (= res!1043811 (validKeyInArray!0 (select (arr!48954 a!2804) i!961)))))

(declare-fun b!1525775 () Bool)

(declare-fun res!1043802 () Bool)

(assert (=> b!1525775 (=> (not res!1043802) (not e!850500))))

(declare-datatypes ((List!35437 0))(
  ( (Nil!35434) (Cons!35433 (h!36866 (_ BitVec 64)) (t!50131 List!35437)) )
))
(declare-fun arrayNoDuplicates!0 (array!101455 (_ BitVec 32) List!35437) Bool)

(assert (=> b!1525775 (= res!1043802 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35434))))

(declare-fun b!1525776 () Bool)

(assert (=> b!1525776 (= e!850500 e!850495)))

(declare-fun res!1043804 () Bool)

(assert (=> b!1525776 (=> (not res!1043804) (not e!850495))))

(assert (=> b!1525776 (= res!1043804 (= lt!660838 lt!660837))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525776 (= lt!660837 (Intermediate!13119 false resIndex!21 resX!21))))

(assert (=> b!1525776 (= lt!660838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48954 a!2804) j!70) mask!2512) (select (arr!48954 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525777 () Bool)

(declare-fun res!1043807 () Bool)

(assert (=> b!1525777 (=> (not res!1043807) (not e!850500))))

(assert (=> b!1525777 (= res!1043807 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49504 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49504 a!2804))))))

(declare-fun b!1525778 () Bool)

(declare-fun res!1043812 () Bool)

(assert (=> b!1525778 (=> (not res!1043812) (not e!850500))))

(assert (=> b!1525778 (= res!1043812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525779 () Bool)

(declare-fun res!1043803 () Bool)

(assert (=> b!1525779 (=> (not res!1043803) (not e!850500))))

(assert (=> b!1525779 (= res!1043803 (and (= (size!49504 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49504 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49504 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525780 () Bool)

(declare-fun e!850499 () Bool)

(assert (=> b!1525780 (= e!850501 e!850499)))

(declare-fun res!1043805 () Bool)

(assert (=> b!1525780 (=> res!1043805 e!850499)))

(assert (=> b!1525780 (= res!1043805 (or (not (= (select (arr!48954 a!2804) j!70) lt!660836)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48954 a!2804) index!487) (select (arr!48954 a!2804) j!70)) (not (= (select (arr!48954 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525781 () Bool)

(assert (=> b!1525781 (= e!850499 e!850496)))

(declare-fun res!1043810 () Bool)

(assert (=> b!1525781 (=> (not res!1043810) (not e!850496))))

(assert (=> b!1525781 (= res!1043810 (= (seekEntryOrOpen!0 (select (arr!48954 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48954 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130042 res!1043806) b!1525779))

(assert (= (and b!1525779 res!1043803) b!1525774))

(assert (= (and b!1525774 res!1043811) b!1525769))

(assert (= (and b!1525769 res!1043815) b!1525778))

(assert (= (and b!1525778 res!1043812) b!1525775))

(assert (= (and b!1525775 res!1043802) b!1525777))

(assert (= (and b!1525777 res!1043807) b!1525776))

(assert (= (and b!1525776 res!1043804) b!1525768))

(assert (= (and b!1525768 res!1043813) b!1525771))

(assert (= (and b!1525771 res!1043809) b!1525773))

(assert (= (and b!1525773 res!1043814) b!1525770))

(assert (= (and b!1525770 res!1043808) b!1525780))

(assert (= (and b!1525780 (not res!1043805)) b!1525781))

(assert (= (and b!1525781 res!1043810) b!1525772))

(declare-fun m!1408507 () Bool)

(assert (=> b!1525771 m!1408507))

(assert (=> b!1525771 m!1408507))

(declare-fun m!1408509 () Bool)

(assert (=> b!1525771 m!1408509))

(declare-fun m!1408511 () Bool)

(assert (=> b!1525771 m!1408511))

(declare-fun m!1408513 () Bool)

(assert (=> b!1525771 m!1408513))

(declare-fun m!1408515 () Bool)

(assert (=> b!1525780 m!1408515))

(declare-fun m!1408517 () Bool)

(assert (=> b!1525780 m!1408517))

(declare-fun m!1408519 () Bool)

(assert (=> b!1525773 m!1408519))

(declare-fun m!1408521 () Bool)

(assert (=> b!1525773 m!1408521))

(declare-fun m!1408523 () Bool)

(assert (=> b!1525775 m!1408523))

(assert (=> b!1525781 m!1408515))

(assert (=> b!1525781 m!1408515))

(declare-fun m!1408525 () Bool)

(assert (=> b!1525781 m!1408525))

(assert (=> b!1525781 m!1408515))

(declare-fun m!1408527 () Bool)

(assert (=> b!1525781 m!1408527))

(assert (=> b!1525770 m!1408515))

(assert (=> b!1525770 m!1408515))

(declare-fun m!1408529 () Bool)

(assert (=> b!1525770 m!1408529))

(declare-fun m!1408531 () Bool)

(assert (=> b!1525778 m!1408531))

(assert (=> b!1525768 m!1408515))

(assert (=> b!1525768 m!1408515))

(declare-fun m!1408533 () Bool)

(assert (=> b!1525768 m!1408533))

(assert (=> b!1525769 m!1408515))

(assert (=> b!1525769 m!1408515))

(declare-fun m!1408535 () Bool)

(assert (=> b!1525769 m!1408535))

(assert (=> b!1525776 m!1408515))

(assert (=> b!1525776 m!1408515))

(declare-fun m!1408537 () Bool)

(assert (=> b!1525776 m!1408537))

(assert (=> b!1525776 m!1408537))

(assert (=> b!1525776 m!1408515))

(declare-fun m!1408539 () Bool)

(assert (=> b!1525776 m!1408539))

(declare-fun m!1408541 () Bool)

(assert (=> b!1525774 m!1408541))

(assert (=> b!1525774 m!1408541))

(declare-fun m!1408543 () Bool)

(assert (=> b!1525774 m!1408543))

(declare-fun m!1408545 () Bool)

(assert (=> start!130042 m!1408545))

(declare-fun m!1408547 () Bool)

(assert (=> start!130042 m!1408547))

(declare-fun m!1408549 () Bool)

(assert (=> b!1525772 m!1408549))

(declare-fun m!1408551 () Bool)

(assert (=> b!1525772 m!1408551))

(check-sat (not start!130042) (not b!1525778) (not b!1525773) (not b!1525776) (not b!1525769) (not b!1525772) (not b!1525768) (not b!1525770) (not b!1525771) (not b!1525781) (not b!1525774) (not b!1525775))
(check-sat)
