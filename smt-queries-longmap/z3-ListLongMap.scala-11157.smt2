; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130746 () Bool)

(assert start!130746)

(declare-fun b!1532610 () Bool)

(declare-fun e!854175 () Bool)

(declare-fun e!854174 () Bool)

(assert (=> b!1532610 (= e!854175 e!854174)))

(declare-fun res!1048657 () Bool)

(assert (=> b!1532610 (=> (not res!1048657) (not e!854174))))

(declare-datatypes ((SeekEntryResult!13163 0))(
  ( (MissingZero!13163 (index!55047 (_ BitVec 32))) (Found!13163 (index!55048 (_ BitVec 32))) (Intermediate!13163 (undefined!13975 Bool) (index!55049 (_ BitVec 32)) (x!136946 (_ BitVec 32))) (Undefined!13163) (MissingVacant!13163 (index!55050 (_ BitVec 32))) )
))
(declare-fun lt!663654 () SeekEntryResult!13163)

(declare-fun lt!663652 () SeekEntryResult!13163)

(assert (=> b!1532610 (= res!1048657 (= lt!663654 lt!663652))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1532610 (= lt!663652 (Intermediate!13163 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101776 0))(
  ( (array!101777 (arr!49105 (Array (_ BitVec 32) (_ BitVec 64))) (size!49656 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101776)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101776 (_ BitVec 32)) SeekEntryResult!13163)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532610 (= lt!663654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49105 a!2804) j!70) mask!2512) (select (arr!49105 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532611 () Bool)

(declare-fun res!1048658 () Bool)

(assert (=> b!1532611 (=> (not res!1048658) (not e!854175))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532611 (= res!1048658 (validKeyInArray!0 (select (arr!49105 a!2804) i!961)))))

(declare-fun b!1532612 () Bool)

(declare-fun e!854176 () Bool)

(assert (=> b!1532612 (= e!854174 (not e!854176))))

(declare-fun res!1048648 () Bool)

(assert (=> b!1532612 (=> res!1048648 e!854176)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1532612 (= res!1048648 (or (not (= (select (arr!49105 a!2804) j!70) (select (store (arr!49105 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!854173 () Bool)

(assert (=> b!1532612 e!854173))

(declare-fun res!1048654 () Bool)

(assert (=> b!1532612 (=> (not res!1048654) (not e!854173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101776 (_ BitVec 32)) Bool)

(assert (=> b!1532612 (= res!1048654 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51145 0))(
  ( (Unit!51146) )
))
(declare-fun lt!663653 () Unit!51145)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51145)

(assert (=> b!1532612 (= lt!663653 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532613 () Bool)

(declare-fun res!1048653 () Bool)

(assert (=> b!1532613 (=> (not res!1048653) (not e!854175))))

(assert (=> b!1532613 (= res!1048653 (and (= (size!49656 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49656 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49656 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532614 () Bool)

(declare-fun res!1048652 () Bool)

(assert (=> b!1532614 (=> (not res!1048652) (not e!854175))))

(assert (=> b!1532614 (= res!1048652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532615 () Bool)

(declare-fun res!1048649 () Bool)

(assert (=> b!1532615 (=> (not res!1048649) (not e!854175))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1532615 (= res!1048649 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49656 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49656 a!2804))))))

(declare-fun b!1532616 () Bool)

(declare-fun res!1048656 () Bool)

(assert (=> b!1532616 (=> (not res!1048656) (not e!854174))))

(assert (=> b!1532616 (= res!1048656 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49105 a!2804) j!70) a!2804 mask!2512) lt!663652))))

(declare-fun b!1532617 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101776 (_ BitVec 32)) SeekEntryResult!13163)

(assert (=> b!1532617 (= e!854173 (= (seekEntry!0 (select (arr!49105 a!2804) j!70) a!2804 mask!2512) (Found!13163 j!70)))))

(declare-fun b!1532618 () Bool)

(declare-fun res!1048650 () Bool)

(assert (=> b!1532618 (=> (not res!1048650) (not e!854175))))

(declare-datatypes ((List!35575 0))(
  ( (Nil!35572) (Cons!35571 (h!37028 (_ BitVec 64)) (t!50261 List!35575)) )
))
(declare-fun arrayNoDuplicates!0 (array!101776 (_ BitVec 32) List!35575) Bool)

(assert (=> b!1532618 (= res!1048650 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35572))))

(declare-fun b!1532619 () Bool)

(assert (=> b!1532619 (= e!854176 true)))

(declare-fun lt!663651 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532619 (= lt!663651 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun res!1048655 () Bool)

(assert (=> start!130746 (=> (not res!1048655) (not e!854175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130746 (= res!1048655 (validMask!0 mask!2512))))

(assert (=> start!130746 e!854175))

(assert (=> start!130746 true))

(declare-fun array_inv!38386 (array!101776) Bool)

(assert (=> start!130746 (array_inv!38386 a!2804)))

(declare-fun b!1532620 () Bool)

(declare-fun res!1048651 () Bool)

(assert (=> b!1532620 (=> (not res!1048651) (not e!854175))))

(assert (=> b!1532620 (= res!1048651 (validKeyInArray!0 (select (arr!49105 a!2804) j!70)))))

(declare-fun b!1532621 () Bool)

(declare-fun res!1048659 () Bool)

(assert (=> b!1532621 (=> (not res!1048659) (not e!854174))))

(assert (=> b!1532621 (= res!1048659 (= lt!663654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49105 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49105 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101777 (store (arr!49105 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49656 a!2804)) mask!2512)))))

(assert (= (and start!130746 res!1048655) b!1532613))

(assert (= (and b!1532613 res!1048653) b!1532611))

(assert (= (and b!1532611 res!1048658) b!1532620))

(assert (= (and b!1532620 res!1048651) b!1532614))

(assert (= (and b!1532614 res!1048652) b!1532618))

(assert (= (and b!1532618 res!1048650) b!1532615))

(assert (= (and b!1532615 res!1048649) b!1532610))

(assert (= (and b!1532610 res!1048657) b!1532616))

(assert (= (and b!1532616 res!1048656) b!1532621))

(assert (= (and b!1532621 res!1048659) b!1532612))

(assert (= (and b!1532612 res!1048654) b!1532617))

(assert (= (and b!1532612 (not res!1048648)) b!1532619))

(declare-fun m!1415329 () Bool)

(assert (=> start!130746 m!1415329))

(declare-fun m!1415331 () Bool)

(assert (=> start!130746 m!1415331))

(declare-fun m!1415333 () Bool)

(assert (=> b!1532616 m!1415333))

(assert (=> b!1532616 m!1415333))

(declare-fun m!1415335 () Bool)

(assert (=> b!1532616 m!1415335))

(declare-fun m!1415337 () Bool)

(assert (=> b!1532621 m!1415337))

(declare-fun m!1415339 () Bool)

(assert (=> b!1532621 m!1415339))

(assert (=> b!1532621 m!1415339))

(declare-fun m!1415341 () Bool)

(assert (=> b!1532621 m!1415341))

(assert (=> b!1532621 m!1415341))

(assert (=> b!1532621 m!1415339))

(declare-fun m!1415343 () Bool)

(assert (=> b!1532621 m!1415343))

(assert (=> b!1532620 m!1415333))

(assert (=> b!1532620 m!1415333))

(declare-fun m!1415345 () Bool)

(assert (=> b!1532620 m!1415345))

(declare-fun m!1415347 () Bool)

(assert (=> b!1532611 m!1415347))

(assert (=> b!1532611 m!1415347))

(declare-fun m!1415349 () Bool)

(assert (=> b!1532611 m!1415349))

(assert (=> b!1532610 m!1415333))

(assert (=> b!1532610 m!1415333))

(declare-fun m!1415351 () Bool)

(assert (=> b!1532610 m!1415351))

(assert (=> b!1532610 m!1415351))

(assert (=> b!1532610 m!1415333))

(declare-fun m!1415353 () Bool)

(assert (=> b!1532610 m!1415353))

(declare-fun m!1415355 () Bool)

(assert (=> b!1532618 m!1415355))

(assert (=> b!1532612 m!1415333))

(declare-fun m!1415357 () Bool)

(assert (=> b!1532612 m!1415357))

(assert (=> b!1532612 m!1415337))

(assert (=> b!1532612 m!1415339))

(declare-fun m!1415359 () Bool)

(assert (=> b!1532612 m!1415359))

(assert (=> b!1532617 m!1415333))

(assert (=> b!1532617 m!1415333))

(declare-fun m!1415361 () Bool)

(assert (=> b!1532617 m!1415361))

(declare-fun m!1415363 () Bool)

(assert (=> b!1532614 m!1415363))

(declare-fun m!1415365 () Bool)

(assert (=> b!1532619 m!1415365))

(check-sat (not start!130746) (not b!1532611) (not b!1532621) (not b!1532612) (not b!1532610) (not b!1532617) (not b!1532619) (not b!1532616) (not b!1532618) (not b!1532620) (not b!1532614))
(check-sat)
