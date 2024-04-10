; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130054 () Bool)

(assert start!130054)

(declare-fun b!1526020 () Bool)

(declare-fun e!850624 () Bool)

(declare-fun e!850622 () Bool)

(assert (=> b!1526020 (= e!850624 e!850622)))

(declare-fun res!1044056 () Bool)

(assert (=> b!1526020 (=> (not res!1044056) (not e!850622))))

(declare-datatypes ((SeekEntryResult!13125 0))(
  ( (MissingZero!13125 (index!54895 (_ BitVec 32))) (Found!13125 (index!54896 (_ BitVec 32))) (Intermediate!13125 (undefined!13937 Bool) (index!54897 (_ BitVec 32)) (x!136595 (_ BitVec 32))) (Undefined!13125) (MissingVacant!13125 (index!54898 (_ BitVec 32))) )
))
(declare-fun lt!660925 () SeekEntryResult!13125)

(declare-fun lt!660926 () SeekEntryResult!13125)

(assert (=> b!1526020 (= res!1044056 (= lt!660925 lt!660926))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526020 (= lt!660926 (Intermediate!13125 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101467 0))(
  ( (array!101468 (arr!48960 (Array (_ BitVec 32) (_ BitVec 64))) (size!49510 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101467)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526020 (= lt!660925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48960 a!2804) j!70) mask!2512) (select (arr!48960 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526021 () Bool)

(declare-fun e!850627 () Bool)

(declare-fun e!850625 () Bool)

(assert (=> b!1526021 (= e!850627 e!850625)))

(declare-fun res!1044058 () Bool)

(assert (=> b!1526021 (=> (not res!1044058) (not e!850625))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13125)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13125)

(assert (=> b!1526021 (= res!1044058 (= (seekEntryOrOpen!0 (select (arr!48960 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48960 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526022 () Bool)

(declare-fun res!1044062 () Bool)

(assert (=> b!1526022 (=> (not res!1044062) (not e!850624))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526022 (= res!1044062 (and (= (size!49510 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49510 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49510 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526023 () Bool)

(declare-fun lt!660924 () array!101467)

(declare-fun lt!660927 () (_ BitVec 64))

(assert (=> b!1526023 (= e!850625 (= (seekEntryOrOpen!0 lt!660927 lt!660924 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660927 lt!660924 mask!2512)))))

(declare-fun b!1526024 () Bool)

(declare-fun res!1044059 () Bool)

(assert (=> b!1526024 (=> (not res!1044059) (not e!850624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526024 (= res!1044059 (validKeyInArray!0 (select (arr!48960 a!2804) i!961)))))

(declare-fun b!1526025 () Bool)

(declare-fun res!1044060 () Bool)

(assert (=> b!1526025 (=> (not res!1044060) (not e!850624))))

(declare-datatypes ((List!35443 0))(
  ( (Nil!35440) (Cons!35439 (h!36872 (_ BitVec 64)) (t!50137 List!35443)) )
))
(declare-fun arrayNoDuplicates!0 (array!101467 (_ BitVec 32) List!35443) Bool)

(assert (=> b!1526025 (= res!1044060 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35440))))

(declare-fun b!1526026 () Bool)

(declare-fun res!1044057 () Bool)

(declare-fun e!850623 () Bool)

(assert (=> b!1526026 (=> (not res!1044057) (not e!850623))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13125)

(assert (=> b!1526026 (= res!1044057 (= (seekEntry!0 (select (arr!48960 a!2804) j!70) a!2804 mask!2512) (Found!13125 j!70)))))

(declare-fun b!1526027 () Bool)

(declare-fun res!1044065 () Bool)

(assert (=> b!1526027 (=> (not res!1044065) (not e!850624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101467 (_ BitVec 32)) Bool)

(assert (=> b!1526027 (= res!1044065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526028 () Bool)

(declare-fun e!850621 () Bool)

(assert (=> b!1526028 (= e!850621 (not true))))

(assert (=> b!1526028 e!850623))

(declare-fun res!1044055 () Bool)

(assert (=> b!1526028 (=> (not res!1044055) (not e!850623))))

(assert (=> b!1526028 (= res!1044055 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51034 0))(
  ( (Unit!51035) )
))
(declare-fun lt!660928 () Unit!51034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51034)

(assert (=> b!1526028 (= lt!660928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526029 () Bool)

(declare-fun res!1044054 () Bool)

(assert (=> b!1526029 (=> (not res!1044054) (not e!850624))))

(assert (=> b!1526029 (= res!1044054 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49510 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49510 a!2804))))))

(declare-fun b!1526030 () Bool)

(declare-fun res!1044063 () Bool)

(assert (=> b!1526030 (=> (not res!1044063) (not e!850622))))

(assert (=> b!1526030 (= res!1044063 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48960 a!2804) j!70) a!2804 mask!2512) lt!660926))))

(declare-fun b!1526031 () Bool)

(assert (=> b!1526031 (= e!850623 e!850627)))

(declare-fun res!1044061 () Bool)

(assert (=> b!1526031 (=> res!1044061 e!850627)))

(assert (=> b!1526031 (= res!1044061 (or (not (= (select (arr!48960 a!2804) j!70) lt!660927)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48960 a!2804) index!487) (select (arr!48960 a!2804) j!70)) (not (= (select (arr!48960 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1044067 () Bool)

(assert (=> start!130054 (=> (not res!1044067) (not e!850624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130054 (= res!1044067 (validMask!0 mask!2512))))

(assert (=> start!130054 e!850624))

(assert (=> start!130054 true))

(declare-fun array_inv!37988 (array!101467) Bool)

(assert (=> start!130054 (array_inv!37988 a!2804)))

(declare-fun b!1526032 () Bool)

(declare-fun res!1044064 () Bool)

(assert (=> b!1526032 (=> (not res!1044064) (not e!850624))))

(assert (=> b!1526032 (= res!1044064 (validKeyInArray!0 (select (arr!48960 a!2804) j!70)))))

(declare-fun b!1526033 () Bool)

(assert (=> b!1526033 (= e!850622 e!850621)))

(declare-fun res!1044066 () Bool)

(assert (=> b!1526033 (=> (not res!1044066) (not e!850621))))

(assert (=> b!1526033 (= res!1044066 (= lt!660925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660927 mask!2512) lt!660927 lt!660924 mask!2512)))))

(assert (=> b!1526033 (= lt!660927 (select (store (arr!48960 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526033 (= lt!660924 (array!101468 (store (arr!48960 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49510 a!2804)))))

(assert (= (and start!130054 res!1044067) b!1526022))

(assert (= (and b!1526022 res!1044062) b!1526024))

(assert (= (and b!1526024 res!1044059) b!1526032))

(assert (= (and b!1526032 res!1044064) b!1526027))

(assert (= (and b!1526027 res!1044065) b!1526025))

(assert (= (and b!1526025 res!1044060) b!1526029))

(assert (= (and b!1526029 res!1044054) b!1526020))

(assert (= (and b!1526020 res!1044056) b!1526030))

(assert (= (and b!1526030 res!1044063) b!1526033))

(assert (= (and b!1526033 res!1044066) b!1526028))

(assert (= (and b!1526028 res!1044055) b!1526026))

(assert (= (and b!1526026 res!1044057) b!1526031))

(assert (= (and b!1526031 (not res!1044061)) b!1526021))

(assert (= (and b!1526021 res!1044058) b!1526023))

(declare-fun m!1408783 () Bool)

(assert (=> b!1526027 m!1408783))

(declare-fun m!1408785 () Bool)

(assert (=> b!1526026 m!1408785))

(assert (=> b!1526026 m!1408785))

(declare-fun m!1408787 () Bool)

(assert (=> b!1526026 m!1408787))

(assert (=> b!1526020 m!1408785))

(assert (=> b!1526020 m!1408785))

(declare-fun m!1408789 () Bool)

(assert (=> b!1526020 m!1408789))

(assert (=> b!1526020 m!1408789))

(assert (=> b!1526020 m!1408785))

(declare-fun m!1408791 () Bool)

(assert (=> b!1526020 m!1408791))

(declare-fun m!1408793 () Bool)

(assert (=> start!130054 m!1408793))

(declare-fun m!1408795 () Bool)

(assert (=> start!130054 m!1408795))

(assert (=> b!1526031 m!1408785))

(declare-fun m!1408797 () Bool)

(assert (=> b!1526031 m!1408797))

(assert (=> b!1526030 m!1408785))

(assert (=> b!1526030 m!1408785))

(declare-fun m!1408799 () Bool)

(assert (=> b!1526030 m!1408799))

(declare-fun m!1408801 () Bool)

(assert (=> b!1526025 m!1408801))

(declare-fun m!1408803 () Bool)

(assert (=> b!1526024 m!1408803))

(assert (=> b!1526024 m!1408803))

(declare-fun m!1408805 () Bool)

(assert (=> b!1526024 m!1408805))

(assert (=> b!1526032 m!1408785))

(assert (=> b!1526032 m!1408785))

(declare-fun m!1408807 () Bool)

(assert (=> b!1526032 m!1408807))

(declare-fun m!1408809 () Bool)

(assert (=> b!1526023 m!1408809))

(declare-fun m!1408811 () Bool)

(assert (=> b!1526023 m!1408811))

(declare-fun m!1408813 () Bool)

(assert (=> b!1526028 m!1408813))

(declare-fun m!1408815 () Bool)

(assert (=> b!1526028 m!1408815))

(declare-fun m!1408817 () Bool)

(assert (=> b!1526033 m!1408817))

(assert (=> b!1526033 m!1408817))

(declare-fun m!1408819 () Bool)

(assert (=> b!1526033 m!1408819))

(declare-fun m!1408821 () Bool)

(assert (=> b!1526033 m!1408821))

(declare-fun m!1408823 () Bool)

(assert (=> b!1526033 m!1408823))

(assert (=> b!1526021 m!1408785))

(assert (=> b!1526021 m!1408785))

(declare-fun m!1408825 () Bool)

(assert (=> b!1526021 m!1408825))

(assert (=> b!1526021 m!1408785))

(declare-fun m!1408827 () Bool)

(assert (=> b!1526021 m!1408827))

(check-sat (not b!1526030) (not b!1526028) (not b!1526020) (not b!1526023) (not b!1526024) (not b!1526033) (not b!1526032) (not b!1526021) (not b!1526027) (not start!130054) (not b!1526026) (not b!1526025))
(check-sat)
