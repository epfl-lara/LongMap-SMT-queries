; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128744 () Bool)

(assert start!128744)

(declare-fun b!1508834 () Bool)

(declare-fun res!1028951 () Bool)

(declare-fun e!842801 () Bool)

(assert (=> b!1508834 (=> (not res!1028951) (not e!842801))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100600 0))(
  ( (array!100601 (arr!48538 (Array (_ BitVec 32) (_ BitVec 64))) (size!49090 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100600)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508834 (= res!1028951 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49090 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49090 a!2804))))))

(declare-fun b!1508835 () Bool)

(declare-fun res!1028946 () Bool)

(assert (=> b!1508835 (=> (not res!1028946) (not e!842801))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508835 (= res!1028946 (and (= (size!49090 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49090 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49090 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508836 () Bool)

(declare-fun res!1028944 () Bool)

(assert (=> b!1508836 (=> (not res!1028944) (not e!842801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508836 (= res!1028944 (validKeyInArray!0 (select (arr!48538 a!2804) i!961)))))

(declare-fun res!1028943 () Bool)

(assert (=> start!128744 (=> (not res!1028943) (not e!842801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128744 (= res!1028943 (validMask!0 mask!2512))))

(assert (=> start!128744 e!842801))

(assert (=> start!128744 true))

(declare-fun array_inv!37771 (array!100600) Bool)

(assert (=> start!128744 (array_inv!37771 a!2804)))

(declare-fun b!1508837 () Bool)

(declare-fun res!1028950 () Bool)

(assert (=> b!1508837 (=> (not res!1028950) (not e!842801))))

(declare-datatypes ((List!35099 0))(
  ( (Nil!35096) (Cons!35095 (h!36508 (_ BitVec 64)) (t!49785 List!35099)) )
))
(declare-fun arrayNoDuplicates!0 (array!100600 (_ BitVec 32) List!35099) Bool)

(assert (=> b!1508837 (= res!1028950 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35096))))

(declare-fun b!1508838 () Bool)

(declare-fun e!842800 () Bool)

(assert (=> b!1508838 (= e!842801 e!842800)))

(declare-fun res!1028947 () Bool)

(assert (=> b!1508838 (=> (not res!1028947) (not e!842800))))

(declare-datatypes ((SeekEntryResult!12732 0))(
  ( (MissingZero!12732 (index!53323 (_ BitVec 32))) (Found!12732 (index!53324 (_ BitVec 32))) (Intermediate!12732 (undefined!13544 Bool) (index!53325 (_ BitVec 32)) (x!135084 (_ BitVec 32))) (Undefined!12732) (MissingVacant!12732 (index!53326 (_ BitVec 32))) )
))
(declare-fun lt!654530 () SeekEntryResult!12732)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100600 (_ BitVec 32)) SeekEntryResult!12732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508838 (= res!1028947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48538 a!2804) j!70) mask!2512) (select (arr!48538 a!2804) j!70) a!2804 mask!2512) lt!654530))))

(assert (=> b!1508838 (= lt!654530 (Intermediate!12732 false resIndex!21 resX!21))))

(declare-fun b!1508839 () Bool)

(declare-fun res!1028948 () Bool)

(assert (=> b!1508839 (=> (not res!1028948) (not e!842801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100600 (_ BitVec 32)) Bool)

(assert (=> b!1508839 (= res!1028948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508840 () Bool)

(assert (=> b!1508840 (= e!842800 false)))

(declare-fun lt!654531 () SeekEntryResult!12732)

(assert (=> b!1508840 (= lt!654531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48538 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48538 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100601 (store (arr!48538 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49090 a!2804)) mask!2512))))

(declare-fun b!1508841 () Bool)

(declare-fun res!1028945 () Bool)

(assert (=> b!1508841 (=> (not res!1028945) (not e!842801))))

(assert (=> b!1508841 (= res!1028945 (validKeyInArray!0 (select (arr!48538 a!2804) j!70)))))

(declare-fun b!1508842 () Bool)

(declare-fun res!1028949 () Bool)

(assert (=> b!1508842 (=> (not res!1028949) (not e!842800))))

(assert (=> b!1508842 (= res!1028949 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48538 a!2804) j!70) a!2804 mask!2512) lt!654530))))

(assert (= (and start!128744 res!1028943) b!1508835))

(assert (= (and b!1508835 res!1028946) b!1508836))

(assert (= (and b!1508836 res!1028944) b!1508841))

(assert (= (and b!1508841 res!1028945) b!1508839))

(assert (= (and b!1508839 res!1028948) b!1508837))

(assert (= (and b!1508837 res!1028950) b!1508834))

(assert (= (and b!1508834 res!1028951) b!1508838))

(assert (= (and b!1508838 res!1028947) b!1508842))

(assert (= (and b!1508842 res!1028949) b!1508840))

(declare-fun m!1390715 () Bool)

(assert (=> start!128744 m!1390715))

(declare-fun m!1390717 () Bool)

(assert (=> start!128744 m!1390717))

(declare-fun m!1390719 () Bool)

(assert (=> b!1508839 m!1390719))

(declare-fun m!1390721 () Bool)

(assert (=> b!1508837 m!1390721))

(declare-fun m!1390723 () Bool)

(assert (=> b!1508840 m!1390723))

(declare-fun m!1390725 () Bool)

(assert (=> b!1508840 m!1390725))

(assert (=> b!1508840 m!1390725))

(declare-fun m!1390727 () Bool)

(assert (=> b!1508840 m!1390727))

(assert (=> b!1508840 m!1390727))

(assert (=> b!1508840 m!1390725))

(declare-fun m!1390729 () Bool)

(assert (=> b!1508840 m!1390729))

(declare-fun m!1390731 () Bool)

(assert (=> b!1508841 m!1390731))

(assert (=> b!1508841 m!1390731))

(declare-fun m!1390733 () Bool)

(assert (=> b!1508841 m!1390733))

(assert (=> b!1508838 m!1390731))

(assert (=> b!1508838 m!1390731))

(declare-fun m!1390735 () Bool)

(assert (=> b!1508838 m!1390735))

(assert (=> b!1508838 m!1390735))

(assert (=> b!1508838 m!1390731))

(declare-fun m!1390737 () Bool)

(assert (=> b!1508838 m!1390737))

(declare-fun m!1390739 () Bool)

(assert (=> b!1508836 m!1390739))

(assert (=> b!1508836 m!1390739))

(declare-fun m!1390741 () Bool)

(assert (=> b!1508836 m!1390741))

(assert (=> b!1508842 m!1390731))

(assert (=> b!1508842 m!1390731))

(declare-fun m!1390743 () Bool)

(assert (=> b!1508842 m!1390743))

(check-sat (not b!1508837) (not b!1508839) (not b!1508841) (not b!1508840) (not b!1508842) (not start!128744) (not b!1508836) (not b!1508838))
(check-sat)
