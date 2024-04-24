; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129458 () Bool)

(assert start!129458)

(declare-fun b!1517694 () Bool)

(declare-fun res!1036431 () Bool)

(declare-fun e!847049 () Bool)

(assert (=> b!1517694 (=> (not res!1036431) (not e!847049))))

(declare-datatypes ((array!101128 0))(
  ( (array!101129 (arr!48796 (Array (_ BitVec 32) (_ BitVec 64))) (size!49347 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101128)

(declare-datatypes ((List!35266 0))(
  ( (Nil!35263) (Cons!35262 (h!36689 (_ BitVec 64)) (t!49952 List!35266)) )
))
(declare-fun arrayNoDuplicates!0 (array!101128 (_ BitVec 32) List!35266) Bool)

(assert (=> b!1517694 (= res!1036431 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35263))))

(declare-fun b!1517695 () Bool)

(declare-fun res!1036421 () Bool)

(assert (=> b!1517695 (=> (not res!1036421) (not e!847049))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517695 (= res!1036421 (validKeyInArray!0 (select (arr!48796 a!2804) i!961)))))

(declare-fun b!1517696 () Bool)

(declare-fun res!1036429 () Bool)

(assert (=> b!1517696 (=> (not res!1036429) (not e!847049))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1517696 (= res!1036429 (and (= (size!49347 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49347 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49347 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517697 () Bool)

(declare-fun res!1036423 () Bool)

(assert (=> b!1517697 (=> (not res!1036423) (not e!847049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101128 (_ BitVec 32)) Bool)

(assert (=> b!1517697 (= res!1036423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517698 () Bool)

(declare-fun e!847054 () Bool)

(assert (=> b!1517698 (= e!847049 e!847054)))

(declare-fun res!1036424 () Bool)

(assert (=> b!1517698 (=> (not res!1036424) (not e!847054))))

(declare-datatypes ((SeekEntryResult!12860 0))(
  ( (MissingZero!12860 (index!53835 (_ BitVec 32))) (Found!12860 (index!53836 (_ BitVec 32))) (Intermediate!12860 (undefined!13672 Bool) (index!53837 (_ BitVec 32)) (x!135735 (_ BitVec 32))) (Undefined!12860) (MissingVacant!12860 (index!53838 (_ BitVec 32))) )
))
(declare-fun lt!657857 () SeekEntryResult!12860)

(declare-fun lt!657855 () SeekEntryResult!12860)

(assert (=> b!1517698 (= res!1036424 (= lt!657857 lt!657855))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517698 (= lt!657855 (Intermediate!12860 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12860)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517698 (= lt!657857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48796 a!2804) j!70) mask!2512) (select (arr!48796 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517699 () Bool)

(declare-fun e!847053 () Bool)

(declare-fun e!847055 () Bool)

(assert (=> b!1517699 (= e!847053 e!847055)))

(declare-fun res!1036427 () Bool)

(assert (=> b!1517699 (=> res!1036427 e!847055)))

(declare-fun lt!657861 () SeekEntryResult!12860)

(assert (=> b!1517699 (= res!1036427 (not (= lt!657861 (Found!12860 j!70))))))

(declare-fun lt!657856 () SeekEntryResult!12860)

(declare-fun lt!657854 () SeekEntryResult!12860)

(assert (=> b!1517699 (= lt!657856 lt!657854)))

(declare-fun lt!657860 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657862 () array!101128)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12860)

(assert (=> b!1517699 (= lt!657854 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657860 lt!657862 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12860)

(assert (=> b!1517699 (= lt!657856 (seekEntryOrOpen!0 lt!657860 lt!657862 mask!2512))))

(declare-fun lt!657859 () SeekEntryResult!12860)

(assert (=> b!1517699 (= lt!657859 lt!657861)))

(assert (=> b!1517699 (= lt!657861 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48796 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1517699 (= lt!657859 (seekEntryOrOpen!0 (select (arr!48796 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036428 () Bool)

(assert (=> start!129458 (=> (not res!1036428) (not e!847049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129458 (= res!1036428 (validMask!0 mask!2512))))

(assert (=> start!129458 e!847049))

(assert (=> start!129458 true))

(declare-fun array_inv!38077 (array!101128) Bool)

(assert (=> start!129458 (array_inv!38077 a!2804)))

(declare-fun b!1517700 () Bool)

(declare-fun e!847056 () Bool)

(assert (=> b!1517700 (= e!847056 (not e!847053))))

(declare-fun res!1036426 () Bool)

(assert (=> b!1517700 (=> res!1036426 e!847053)))

(assert (=> b!1517700 (= res!1036426 (or (not (= (select (arr!48796 a!2804) j!70) lt!657860)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48796 a!2804) index!487) (select (arr!48796 a!2804) j!70)) (not (= (select (arr!48796 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!847051 () Bool)

(assert (=> b!1517700 e!847051))

(declare-fun res!1036425 () Bool)

(assert (=> b!1517700 (=> (not res!1036425) (not e!847051))))

(assert (=> b!1517700 (= res!1036425 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50623 0))(
  ( (Unit!50624) )
))
(declare-fun lt!657853 () Unit!50623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50623)

(assert (=> b!1517700 (= lt!657853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517701 () Bool)

(declare-fun res!1036432 () Bool)

(assert (=> b!1517701 (=> (not res!1036432) (not e!847049))))

(assert (=> b!1517701 (= res!1036432 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49347 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49347 a!2804))))))

(declare-fun b!1517702 () Bool)

(declare-fun e!847052 () Bool)

(assert (=> b!1517702 (= e!847052 (validKeyInArray!0 lt!657860))))

(declare-fun b!1517703 () Bool)

(declare-fun res!1036433 () Bool)

(assert (=> b!1517703 (=> (not res!1036433) (not e!847049))))

(assert (=> b!1517703 (= res!1036433 (validKeyInArray!0 (select (arr!48796 a!2804) j!70)))))

(declare-fun b!1517704 () Bool)

(assert (=> b!1517704 (= e!847054 e!847056)))

(declare-fun res!1036422 () Bool)

(assert (=> b!1517704 (=> (not res!1036422) (not e!847056))))

(assert (=> b!1517704 (= res!1036422 (= lt!657857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657860 mask!2512) lt!657860 lt!657862 mask!2512)))))

(assert (=> b!1517704 (= lt!657860 (select (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1517704 (= lt!657862 (array!101129 (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49347 a!2804)))))

(declare-fun b!1517705 () Bool)

(declare-fun res!1036430 () Bool)

(assert (=> b!1517705 (=> (not res!1036430) (not e!847054))))

(assert (=> b!1517705 (= res!1036430 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) lt!657855))))

(declare-fun b!1517706 () Bool)

(assert (=> b!1517706 (= e!847055 e!847052)))

(declare-fun res!1036420 () Bool)

(assert (=> b!1517706 (=> res!1036420 e!847052)))

(assert (=> b!1517706 (= res!1036420 (bvslt mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1517706 (= lt!657854 lt!657861)))

(declare-fun lt!657858 () Unit!50623)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50623)

(assert (=> b!1517706 (= lt!657858 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1517707 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12860)

(assert (=> b!1517707 (= e!847051 (= (seekEntry!0 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) (Found!12860 j!70)))))

(assert (= (and start!129458 res!1036428) b!1517696))

(assert (= (and b!1517696 res!1036429) b!1517695))

(assert (= (and b!1517695 res!1036421) b!1517703))

(assert (= (and b!1517703 res!1036433) b!1517697))

(assert (= (and b!1517697 res!1036423) b!1517694))

(assert (= (and b!1517694 res!1036431) b!1517701))

(assert (= (and b!1517701 res!1036432) b!1517698))

(assert (= (and b!1517698 res!1036424) b!1517705))

(assert (= (and b!1517705 res!1036430) b!1517704))

(assert (= (and b!1517704 res!1036422) b!1517700))

(assert (= (and b!1517700 res!1036425) b!1517707))

(assert (= (and b!1517700 (not res!1036426)) b!1517699))

(assert (= (and b!1517699 (not res!1036427)) b!1517706))

(assert (= (and b!1517706 (not res!1036420)) b!1517702))

(declare-fun m!1400859 () Bool)

(assert (=> b!1517706 m!1400859))

(declare-fun m!1400861 () Bool)

(assert (=> b!1517707 m!1400861))

(assert (=> b!1517707 m!1400861))

(declare-fun m!1400863 () Bool)

(assert (=> b!1517707 m!1400863))

(assert (=> b!1517699 m!1400861))

(declare-fun m!1400865 () Bool)

(assert (=> b!1517699 m!1400865))

(assert (=> b!1517699 m!1400861))

(declare-fun m!1400867 () Bool)

(assert (=> b!1517699 m!1400867))

(assert (=> b!1517699 m!1400861))

(declare-fun m!1400869 () Bool)

(assert (=> b!1517699 m!1400869))

(declare-fun m!1400871 () Bool)

(assert (=> b!1517699 m!1400871))

(declare-fun m!1400873 () Bool)

(assert (=> b!1517694 m!1400873))

(declare-fun m!1400875 () Bool)

(assert (=> b!1517702 m!1400875))

(declare-fun m!1400877 () Bool)

(assert (=> b!1517697 m!1400877))

(assert (=> b!1517698 m!1400861))

(assert (=> b!1517698 m!1400861))

(declare-fun m!1400879 () Bool)

(assert (=> b!1517698 m!1400879))

(assert (=> b!1517698 m!1400879))

(assert (=> b!1517698 m!1400861))

(declare-fun m!1400881 () Bool)

(assert (=> b!1517698 m!1400881))

(declare-fun m!1400883 () Bool)

(assert (=> b!1517695 m!1400883))

(assert (=> b!1517695 m!1400883))

(declare-fun m!1400885 () Bool)

(assert (=> b!1517695 m!1400885))

(assert (=> b!1517703 m!1400861))

(assert (=> b!1517703 m!1400861))

(declare-fun m!1400887 () Bool)

(assert (=> b!1517703 m!1400887))

(assert (=> b!1517700 m!1400861))

(declare-fun m!1400889 () Bool)

(assert (=> b!1517700 m!1400889))

(declare-fun m!1400891 () Bool)

(assert (=> b!1517700 m!1400891))

(declare-fun m!1400893 () Bool)

(assert (=> b!1517700 m!1400893))

(declare-fun m!1400895 () Bool)

(assert (=> b!1517704 m!1400895))

(assert (=> b!1517704 m!1400895))

(declare-fun m!1400897 () Bool)

(assert (=> b!1517704 m!1400897))

(declare-fun m!1400899 () Bool)

(assert (=> b!1517704 m!1400899))

(declare-fun m!1400901 () Bool)

(assert (=> b!1517704 m!1400901))

(assert (=> b!1517705 m!1400861))

(assert (=> b!1517705 m!1400861))

(declare-fun m!1400903 () Bool)

(assert (=> b!1517705 m!1400903))

(declare-fun m!1400905 () Bool)

(assert (=> start!129458 m!1400905))

(declare-fun m!1400907 () Bool)

(assert (=> start!129458 m!1400907))

(check-sat (not b!1517705) (not b!1517703) (not b!1517699) (not b!1517694) (not b!1517698) (not b!1517702) (not b!1517706) (not b!1517704) (not b!1517700) (not start!129458) (not b!1517707) (not b!1517697) (not b!1517695))
(check-sat)
