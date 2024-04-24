; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129416 () Bool)

(assert start!129416)

(declare-fun b!1516873 () Bool)

(declare-fun res!1035606 () Bool)

(declare-fun e!846609 () Bool)

(assert (=> b!1516873 (=> (not res!1035606) (not e!846609))))

(declare-datatypes ((array!101086 0))(
  ( (array!101087 (arr!48775 (Array (_ BitVec 32) (_ BitVec 64))) (size!49326 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101086)

(declare-datatypes ((List!35245 0))(
  ( (Nil!35242) (Cons!35241 (h!36668 (_ BitVec 64)) (t!49931 List!35245)) )
))
(declare-fun arrayNoDuplicates!0 (array!101086 (_ BitVec 32) List!35245) Bool)

(assert (=> b!1516873 (= res!1035606 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35242))))

(declare-fun res!1035605 () Bool)

(assert (=> start!129416 (=> (not res!1035605) (not e!846609))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129416 (= res!1035605 (validMask!0 mask!2512))))

(assert (=> start!129416 e!846609))

(assert (=> start!129416 true))

(declare-fun array_inv!38056 (array!101086) Bool)

(assert (=> start!129416 (array_inv!38056 a!2804)))

(declare-fun b!1516874 () Bool)

(declare-fun res!1035604 () Bool)

(declare-fun e!846611 () Bool)

(assert (=> b!1516874 (=> (not res!1035604) (not e!846611))))

(declare-datatypes ((SeekEntryResult!12839 0))(
  ( (MissingZero!12839 (index!53751 (_ BitVec 32))) (Found!12839 (index!53752 (_ BitVec 32))) (Intermediate!12839 (undefined!13651 Bool) (index!53753 (_ BitVec 32)) (x!135658 (_ BitVec 32))) (Undefined!12839) (MissingVacant!12839 (index!53754 (_ BitVec 32))) )
))
(declare-fun lt!657225 () SeekEntryResult!12839)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12839)

(assert (=> b!1516874 (= res!1035604 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48775 a!2804) j!70) a!2804 mask!2512) lt!657225))))

(declare-fun b!1516875 () Bool)

(declare-fun e!846608 () Bool)

(assert (=> b!1516875 (= e!846611 e!846608)))

(declare-fun res!1035602 () Bool)

(assert (=> b!1516875 (=> (not res!1035602) (not e!846608))))

(declare-fun lt!657224 () SeekEntryResult!12839)

(declare-fun lt!657231 () (_ BitVec 64))

(declare-fun lt!657229 () array!101086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516875 (= res!1035602 (= lt!657224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657231 mask!2512) lt!657231 lt!657229 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516875 (= lt!657231 (select (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516875 (= lt!657229 (array!101087 (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49326 a!2804)))))

(declare-fun b!1516876 () Bool)

(declare-fun e!846606 () Bool)

(assert (=> b!1516876 (= e!846606 true)))

(declare-fun lt!657223 () SeekEntryResult!12839)

(declare-fun lt!657232 () SeekEntryResult!12839)

(assert (=> b!1516876 (= lt!657223 lt!657232)))

(declare-datatypes ((Unit!50581 0))(
  ( (Unit!50582) )
))
(declare-fun lt!657230 () Unit!50581)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50581)

(assert (=> b!1516876 (= lt!657230 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1516877 () Bool)

(declare-fun res!1035603 () Bool)

(assert (=> b!1516877 (=> (not res!1035603) (not e!846609))))

(assert (=> b!1516877 (= res!1035603 (and (= (size!49326 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49326 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49326 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516878 () Bool)

(declare-fun res!1035608 () Bool)

(assert (=> b!1516878 (=> (not res!1035608) (not e!846609))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516878 (= res!1035608 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49326 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49326 a!2804))))))

(declare-fun b!1516879 () Bool)

(declare-fun res!1035611 () Bool)

(assert (=> b!1516879 (=> (not res!1035611) (not e!846609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101086 (_ BitVec 32)) Bool)

(assert (=> b!1516879 (= res!1035611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516880 () Bool)

(declare-fun res!1035610 () Bool)

(assert (=> b!1516880 (=> (not res!1035610) (not e!846609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516880 (= res!1035610 (validKeyInArray!0 (select (arr!48775 a!2804) j!70)))))

(declare-fun b!1516881 () Bool)

(declare-fun e!846612 () Bool)

(assert (=> b!1516881 (= e!846612 e!846606)))

(declare-fun res!1035609 () Bool)

(assert (=> b!1516881 (=> res!1035609 e!846606)))

(assert (=> b!1516881 (= res!1035609 (not (= lt!657232 (Found!12839 j!70))))))

(declare-fun lt!657226 () SeekEntryResult!12839)

(assert (=> b!1516881 (= lt!657226 lt!657223)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12839)

(assert (=> b!1516881 (= lt!657223 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657231 lt!657229 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12839)

(assert (=> b!1516881 (= lt!657226 (seekEntryOrOpen!0 lt!657231 lt!657229 mask!2512))))

(declare-fun lt!657227 () SeekEntryResult!12839)

(assert (=> b!1516881 (= lt!657227 lt!657232)))

(assert (=> b!1516881 (= lt!657232 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48775 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1516881 (= lt!657227 (seekEntryOrOpen!0 (select (arr!48775 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!846607 () Bool)

(declare-fun b!1516882 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12839)

(assert (=> b!1516882 (= e!846607 (= (seekEntry!0 (select (arr!48775 a!2804) j!70) a!2804 mask!2512) (Found!12839 j!70)))))

(declare-fun b!1516883 () Bool)

(assert (=> b!1516883 (= e!846608 (not e!846612))))

(declare-fun res!1035607 () Bool)

(assert (=> b!1516883 (=> res!1035607 e!846612)))

(assert (=> b!1516883 (= res!1035607 (or (not (= (select (arr!48775 a!2804) j!70) lt!657231)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48775 a!2804) index!487) (select (arr!48775 a!2804) j!70)) (not (= (select (arr!48775 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1516883 e!846607))

(declare-fun res!1035600 () Bool)

(assert (=> b!1516883 (=> (not res!1035600) (not e!846607))))

(assert (=> b!1516883 (= res!1035600 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657228 () Unit!50581)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50581)

(assert (=> b!1516883 (= lt!657228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516884 () Bool)

(declare-fun res!1035599 () Bool)

(assert (=> b!1516884 (=> (not res!1035599) (not e!846609))))

(assert (=> b!1516884 (= res!1035599 (validKeyInArray!0 (select (arr!48775 a!2804) i!961)))))

(declare-fun b!1516885 () Bool)

(assert (=> b!1516885 (= e!846609 e!846611)))

(declare-fun res!1035601 () Bool)

(assert (=> b!1516885 (=> (not res!1035601) (not e!846611))))

(assert (=> b!1516885 (= res!1035601 (= lt!657224 lt!657225))))

(assert (=> b!1516885 (= lt!657225 (Intermediate!12839 false resIndex!21 resX!21))))

(assert (=> b!1516885 (= lt!657224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48775 a!2804) j!70) mask!2512) (select (arr!48775 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129416 res!1035605) b!1516877))

(assert (= (and b!1516877 res!1035603) b!1516884))

(assert (= (and b!1516884 res!1035599) b!1516880))

(assert (= (and b!1516880 res!1035610) b!1516879))

(assert (= (and b!1516879 res!1035611) b!1516873))

(assert (= (and b!1516873 res!1035606) b!1516878))

(assert (= (and b!1516878 res!1035608) b!1516885))

(assert (= (and b!1516885 res!1035601) b!1516874))

(assert (= (and b!1516874 res!1035604) b!1516875))

(assert (= (and b!1516875 res!1035602) b!1516883))

(assert (= (and b!1516883 res!1035600) b!1516882))

(assert (= (and b!1516883 (not res!1035607)) b!1516881))

(assert (= (and b!1516881 (not res!1035609)) b!1516876))

(declare-fun m!1399851 () Bool)

(assert (=> b!1516875 m!1399851))

(assert (=> b!1516875 m!1399851))

(declare-fun m!1399853 () Bool)

(assert (=> b!1516875 m!1399853))

(declare-fun m!1399855 () Bool)

(assert (=> b!1516875 m!1399855))

(declare-fun m!1399857 () Bool)

(assert (=> b!1516875 m!1399857))

(declare-fun m!1399859 () Bool)

(assert (=> b!1516876 m!1399859))

(declare-fun m!1399861 () Bool)

(assert (=> b!1516885 m!1399861))

(assert (=> b!1516885 m!1399861))

(declare-fun m!1399863 () Bool)

(assert (=> b!1516885 m!1399863))

(assert (=> b!1516885 m!1399863))

(assert (=> b!1516885 m!1399861))

(declare-fun m!1399865 () Bool)

(assert (=> b!1516885 m!1399865))

(assert (=> b!1516881 m!1399861))

(declare-fun m!1399867 () Bool)

(assert (=> b!1516881 m!1399867))

(assert (=> b!1516881 m!1399861))

(declare-fun m!1399869 () Bool)

(assert (=> b!1516881 m!1399869))

(declare-fun m!1399871 () Bool)

(assert (=> b!1516881 m!1399871))

(assert (=> b!1516881 m!1399861))

(declare-fun m!1399873 () Bool)

(assert (=> b!1516881 m!1399873))

(declare-fun m!1399875 () Bool)

(assert (=> b!1516879 m!1399875))

(declare-fun m!1399877 () Bool)

(assert (=> start!129416 m!1399877))

(declare-fun m!1399879 () Bool)

(assert (=> start!129416 m!1399879))

(assert (=> b!1516882 m!1399861))

(assert (=> b!1516882 m!1399861))

(declare-fun m!1399881 () Bool)

(assert (=> b!1516882 m!1399881))

(declare-fun m!1399883 () Bool)

(assert (=> b!1516884 m!1399883))

(assert (=> b!1516884 m!1399883))

(declare-fun m!1399885 () Bool)

(assert (=> b!1516884 m!1399885))

(assert (=> b!1516880 m!1399861))

(assert (=> b!1516880 m!1399861))

(declare-fun m!1399887 () Bool)

(assert (=> b!1516880 m!1399887))

(declare-fun m!1399889 () Bool)

(assert (=> b!1516873 m!1399889))

(assert (=> b!1516874 m!1399861))

(assert (=> b!1516874 m!1399861))

(declare-fun m!1399891 () Bool)

(assert (=> b!1516874 m!1399891))

(assert (=> b!1516883 m!1399861))

(declare-fun m!1399893 () Bool)

(assert (=> b!1516883 m!1399893))

(declare-fun m!1399895 () Bool)

(assert (=> b!1516883 m!1399895))

(declare-fun m!1399897 () Bool)

(assert (=> b!1516883 m!1399897))

(check-sat (not b!1516883) (not b!1516880) (not b!1516873) (not b!1516884) (not b!1516885) (not b!1516879) (not b!1516876) (not start!129416) (not b!1516882) (not b!1516875) (not b!1516881) (not b!1516874))
(check-sat)
