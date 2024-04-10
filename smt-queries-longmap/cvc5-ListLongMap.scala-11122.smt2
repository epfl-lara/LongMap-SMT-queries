; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129962 () Bool)

(assert start!129962)

(declare-fun b!1525055 () Bool)

(declare-fun res!1043426 () Bool)

(declare-fun e!850119 () Bool)

(assert (=> b!1525055 (=> (not res!1043426) (not e!850119))))

(declare-datatypes ((array!101438 0))(
  ( (array!101439 (arr!48947 (Array (_ BitVec 32) (_ BitVec 64))) (size!49497 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101438)

(declare-datatypes ((List!35430 0))(
  ( (Nil!35427) (Cons!35426 (h!36856 (_ BitVec 64)) (t!50124 List!35430)) )
))
(declare-fun arrayNoDuplicates!0 (array!101438 (_ BitVec 32) List!35430) Bool)

(assert (=> b!1525055 (= res!1043426 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35427))))

(declare-fun b!1525056 () Bool)

(declare-fun e!850117 () Bool)

(assert (=> b!1525056 (= e!850117 (not true))))

(declare-fun e!850120 () Bool)

(assert (=> b!1525056 e!850120))

(declare-fun res!1043427 () Bool)

(assert (=> b!1525056 (=> (not res!1043427) (not e!850120))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101438 (_ BitVec 32)) Bool)

(assert (=> b!1525056 (= res!1043427 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51008 0))(
  ( (Unit!51009) )
))
(declare-fun lt!660548 () Unit!51008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51008)

(assert (=> b!1525056 (= lt!660548 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1043418 () Bool)

(assert (=> start!129962 (=> (not res!1043418) (not e!850119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129962 (= res!1043418 (validMask!0 mask!2512))))

(assert (=> start!129962 e!850119))

(assert (=> start!129962 true))

(declare-fun array_inv!37975 (array!101438) Bool)

(assert (=> start!129962 (array_inv!37975 a!2804)))

(declare-fun b!1525057 () Bool)

(declare-fun res!1043419 () Bool)

(assert (=> b!1525057 (=> (not res!1043419) (not e!850120))))

(declare-datatypes ((SeekEntryResult!13112 0))(
  ( (MissingZero!13112 (index!54843 (_ BitVec 32))) (Found!13112 (index!54844 (_ BitVec 32))) (Intermediate!13112 (undefined!13924 Bool) (index!54845 (_ BitVec 32)) (x!136541 (_ BitVec 32))) (Undefined!13112) (MissingVacant!13112 (index!54846 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101438 (_ BitVec 32)) SeekEntryResult!13112)

(assert (=> b!1525057 (= res!1043419 (= (seekEntry!0 (select (arr!48947 a!2804) j!70) a!2804 mask!2512) (Found!13112 j!70)))))

(declare-fun b!1525058 () Bool)

(declare-fun res!1043425 () Bool)

(assert (=> b!1525058 (=> (not res!1043425) (not e!850117))))

(declare-fun lt!660549 () SeekEntryResult!13112)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101438 (_ BitVec 32)) SeekEntryResult!13112)

(assert (=> b!1525058 (= res!1043425 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48947 a!2804) j!70) a!2804 mask!2512) lt!660549))))

(declare-fun b!1525059 () Bool)

(declare-fun e!850116 () Bool)

(assert (=> b!1525059 (= e!850120 e!850116)))

(declare-fun res!1043422 () Bool)

(assert (=> b!1525059 (=> res!1043422 e!850116)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525059 (= res!1043422 (or (not (= (select (arr!48947 a!2804) j!70) (select (store (arr!48947 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48947 a!2804) index!487) (select (arr!48947 a!2804) j!70)) (not (= (select (arr!48947 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525060 () Bool)

(declare-fun res!1043423 () Bool)

(assert (=> b!1525060 (=> (not res!1043423) (not e!850117))))

(declare-fun lt!660550 () SeekEntryResult!13112)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525060 (= res!1043423 (= lt!660550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48947 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48947 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101439 (store (arr!48947 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49497 a!2804)) mask!2512)))))

(declare-fun b!1525061 () Bool)

(declare-fun res!1043428 () Bool)

(assert (=> b!1525061 (=> (not res!1043428) (not e!850119))))

(assert (=> b!1525061 (= res!1043428 (and (= (size!49497 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49497 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49497 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525062 () Bool)

(declare-fun res!1043424 () Bool)

(assert (=> b!1525062 (=> (not res!1043424) (not e!850119))))

(assert (=> b!1525062 (= res!1043424 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49497 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49497 a!2804))))))

(declare-fun b!1525063 () Bool)

(declare-fun res!1043416 () Bool)

(assert (=> b!1525063 (=> (not res!1043416) (not e!850119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525063 (= res!1043416 (validKeyInArray!0 (select (arr!48947 a!2804) i!961)))))

(declare-fun b!1525064 () Bool)

(assert (=> b!1525064 (= e!850119 e!850117)))

(declare-fun res!1043421 () Bool)

(assert (=> b!1525064 (=> (not res!1043421) (not e!850117))))

(assert (=> b!1525064 (= res!1043421 (= lt!660550 lt!660549))))

(assert (=> b!1525064 (= lt!660549 (Intermediate!13112 false resIndex!21 resX!21))))

(assert (=> b!1525064 (= lt!660550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48947 a!2804) j!70) mask!2512) (select (arr!48947 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525065 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101438 (_ BitVec 32)) SeekEntryResult!13112)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101438 (_ BitVec 32)) SeekEntryResult!13112)

(assert (=> b!1525065 (= e!850116 (= (seekEntryOrOpen!0 (select (arr!48947 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48947 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525066 () Bool)

(declare-fun res!1043420 () Bool)

(assert (=> b!1525066 (=> (not res!1043420) (not e!850119))))

(assert (=> b!1525066 (= res!1043420 (validKeyInArray!0 (select (arr!48947 a!2804) j!70)))))

(declare-fun b!1525067 () Bool)

(declare-fun res!1043417 () Bool)

(assert (=> b!1525067 (=> (not res!1043417) (not e!850119))))

(assert (=> b!1525067 (= res!1043417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129962 res!1043418) b!1525061))

(assert (= (and b!1525061 res!1043428) b!1525063))

(assert (= (and b!1525063 res!1043416) b!1525066))

(assert (= (and b!1525066 res!1043420) b!1525067))

(assert (= (and b!1525067 res!1043417) b!1525055))

(assert (= (and b!1525055 res!1043426) b!1525062))

(assert (= (and b!1525062 res!1043424) b!1525064))

(assert (= (and b!1525064 res!1043421) b!1525058))

(assert (= (and b!1525058 res!1043425) b!1525060))

(assert (= (and b!1525060 res!1043423) b!1525056))

(assert (= (and b!1525056 res!1043427) b!1525057))

(assert (= (and b!1525057 res!1043419) b!1525059))

(assert (= (and b!1525059 (not res!1043422)) b!1525065))

(declare-fun m!1407939 () Bool)

(assert (=> b!1525065 m!1407939))

(assert (=> b!1525065 m!1407939))

(declare-fun m!1407941 () Bool)

(assert (=> b!1525065 m!1407941))

(assert (=> b!1525065 m!1407939))

(declare-fun m!1407943 () Bool)

(assert (=> b!1525065 m!1407943))

(declare-fun m!1407945 () Bool)

(assert (=> b!1525063 m!1407945))

(assert (=> b!1525063 m!1407945))

(declare-fun m!1407947 () Bool)

(assert (=> b!1525063 m!1407947))

(declare-fun m!1407949 () Bool)

(assert (=> b!1525055 m!1407949))

(declare-fun m!1407951 () Bool)

(assert (=> b!1525060 m!1407951))

(declare-fun m!1407953 () Bool)

(assert (=> b!1525060 m!1407953))

(assert (=> b!1525060 m!1407953))

(declare-fun m!1407955 () Bool)

(assert (=> b!1525060 m!1407955))

(assert (=> b!1525060 m!1407955))

(assert (=> b!1525060 m!1407953))

(declare-fun m!1407957 () Bool)

(assert (=> b!1525060 m!1407957))

(assert (=> b!1525058 m!1407939))

(assert (=> b!1525058 m!1407939))

(declare-fun m!1407959 () Bool)

(assert (=> b!1525058 m!1407959))

(assert (=> b!1525066 m!1407939))

(assert (=> b!1525066 m!1407939))

(declare-fun m!1407961 () Bool)

(assert (=> b!1525066 m!1407961))

(declare-fun m!1407963 () Bool)

(assert (=> start!129962 m!1407963))

(declare-fun m!1407965 () Bool)

(assert (=> start!129962 m!1407965))

(assert (=> b!1525059 m!1407939))

(assert (=> b!1525059 m!1407951))

(assert (=> b!1525059 m!1407953))

(declare-fun m!1407967 () Bool)

(assert (=> b!1525059 m!1407967))

(assert (=> b!1525057 m!1407939))

(assert (=> b!1525057 m!1407939))

(declare-fun m!1407969 () Bool)

(assert (=> b!1525057 m!1407969))

(assert (=> b!1525064 m!1407939))

(assert (=> b!1525064 m!1407939))

(declare-fun m!1407971 () Bool)

(assert (=> b!1525064 m!1407971))

(assert (=> b!1525064 m!1407971))

(assert (=> b!1525064 m!1407939))

(declare-fun m!1407973 () Bool)

(assert (=> b!1525064 m!1407973))

(declare-fun m!1407975 () Bool)

(assert (=> b!1525067 m!1407975))

(declare-fun m!1407977 () Bool)

(assert (=> b!1525056 m!1407977))

(declare-fun m!1407979 () Bool)

(assert (=> b!1525056 m!1407979))

(push 1)

