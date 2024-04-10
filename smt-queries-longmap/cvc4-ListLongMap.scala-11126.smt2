; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130056 () Bool)

(assert start!130056)

(declare-fun res!1044102 () Bool)

(declare-fun e!850645 () Bool)

(assert (=> start!130056 (=> (not res!1044102) (not e!850645))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130056 (= res!1044102 (validMask!0 mask!2512))))

(assert (=> start!130056 e!850645))

(assert (=> start!130056 true))

(declare-datatypes ((array!101469 0))(
  ( (array!101470 (arr!48961 (Array (_ BitVec 32) (_ BitVec 64))) (size!49511 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101469)

(declare-fun array_inv!37989 (array!101469) Bool)

(assert (=> start!130056 (array_inv!37989 a!2804)))

(declare-fun b!1526062 () Bool)

(declare-fun e!850643 () Bool)

(declare-fun e!850646 () Bool)

(assert (=> b!1526062 (= e!850643 e!850646)))

(declare-fun res!1044100 () Bool)

(assert (=> b!1526062 (=> res!1044100 e!850646)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!660940 () (_ BitVec 64))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526062 (= res!1044100 (or (not (= (select (arr!48961 a!2804) j!70) lt!660940)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48961 a!2804) index!487) (select (arr!48961 a!2804) j!70)) (not (= (select (arr!48961 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526063 () Bool)

(declare-fun res!1044104 () Bool)

(assert (=> b!1526063 (=> (not res!1044104) (not e!850645))))

(assert (=> b!1526063 (= res!1044104 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49511 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49511 a!2804))))))

(declare-fun b!1526064 () Bool)

(declare-fun res!1044096 () Bool)

(assert (=> b!1526064 (=> (not res!1044096) (not e!850645))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526064 (= res!1044096 (and (= (size!49511 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49511 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49511 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526065 () Bool)

(declare-fun res!1044106 () Bool)

(assert (=> b!1526065 (=> (not res!1044106) (not e!850645))))

(declare-datatypes ((List!35444 0))(
  ( (Nil!35441) (Cons!35440 (h!36873 (_ BitVec 64)) (t!50138 List!35444)) )
))
(declare-fun arrayNoDuplicates!0 (array!101469 (_ BitVec 32) List!35444) Bool)

(assert (=> b!1526065 (= res!1044106 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35441))))

(declare-fun b!1526066 () Bool)

(declare-fun res!1044109 () Bool)

(assert (=> b!1526066 (=> (not res!1044109) (not e!850645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526066 (= res!1044109 (validKeyInArray!0 (select (arr!48961 a!2804) j!70)))))

(declare-fun b!1526067 () Bool)

(declare-fun res!1044097 () Bool)

(assert (=> b!1526067 (=> (not res!1044097) (not e!850645))))

(assert (=> b!1526067 (= res!1044097 (validKeyInArray!0 (select (arr!48961 a!2804) i!961)))))

(declare-fun b!1526068 () Bool)

(declare-fun e!850644 () Bool)

(declare-fun lt!660942 () array!101469)

(declare-datatypes ((SeekEntryResult!13126 0))(
  ( (MissingZero!13126 (index!54899 (_ BitVec 32))) (Found!13126 (index!54900 (_ BitVec 32))) (Intermediate!13126 (undefined!13938 Bool) (index!54901 (_ BitVec 32)) (x!136596 (_ BitVec 32))) (Undefined!13126) (MissingVacant!13126 (index!54902 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101469 (_ BitVec 32)) SeekEntryResult!13126)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101469 (_ BitVec 32)) SeekEntryResult!13126)

(assert (=> b!1526068 (= e!850644 (= (seekEntryOrOpen!0 lt!660940 lt!660942 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660940 lt!660942 mask!2512)))))

(declare-fun b!1526069 () Bool)

(declare-fun e!850647 () Bool)

(declare-fun e!850648 () Bool)

(assert (=> b!1526069 (= e!850647 e!850648)))

(declare-fun res!1044103 () Bool)

(assert (=> b!1526069 (=> (not res!1044103) (not e!850648))))

(declare-fun lt!660939 () SeekEntryResult!13126)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101469 (_ BitVec 32)) SeekEntryResult!13126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526069 (= res!1044103 (= lt!660939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660940 mask!2512) lt!660940 lt!660942 mask!2512)))))

(assert (=> b!1526069 (= lt!660940 (select (store (arr!48961 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526069 (= lt!660942 (array!101470 (store (arr!48961 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49511 a!2804)))))

(declare-fun b!1526070 () Bool)

(declare-fun res!1044108 () Bool)

(assert (=> b!1526070 (=> (not res!1044108) (not e!850647))))

(declare-fun lt!660943 () SeekEntryResult!13126)

(assert (=> b!1526070 (= res!1044108 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) lt!660943))))

(declare-fun b!1526071 () Bool)

(declare-fun res!1044099 () Bool)

(assert (=> b!1526071 (=> (not res!1044099) (not e!850645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101469 (_ BitVec 32)) Bool)

(assert (=> b!1526071 (= res!1044099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526072 () Bool)

(assert (=> b!1526072 (= e!850645 e!850647)))

(declare-fun res!1044107 () Bool)

(assert (=> b!1526072 (=> (not res!1044107) (not e!850647))))

(assert (=> b!1526072 (= res!1044107 (= lt!660939 lt!660943))))

(assert (=> b!1526072 (= lt!660943 (Intermediate!13126 false resIndex!21 resX!21))))

(assert (=> b!1526072 (= lt!660939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48961 a!2804) j!70) mask!2512) (select (arr!48961 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526073 () Bool)

(assert (=> b!1526073 (= e!850648 (not true))))

(assert (=> b!1526073 e!850643))

(declare-fun res!1044105 () Bool)

(assert (=> b!1526073 (=> (not res!1044105) (not e!850643))))

(assert (=> b!1526073 (= res!1044105 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51036 0))(
  ( (Unit!51037) )
))
(declare-fun lt!660941 () Unit!51036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51036)

(assert (=> b!1526073 (= lt!660941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526074 () Bool)

(declare-fun res!1044101 () Bool)

(assert (=> b!1526074 (=> (not res!1044101) (not e!850643))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101469 (_ BitVec 32)) SeekEntryResult!13126)

(assert (=> b!1526074 (= res!1044101 (= (seekEntry!0 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) (Found!13126 j!70)))))

(declare-fun b!1526075 () Bool)

(assert (=> b!1526075 (= e!850646 e!850644)))

(declare-fun res!1044098 () Bool)

(assert (=> b!1526075 (=> (not res!1044098) (not e!850644))))

(assert (=> b!1526075 (= res!1044098 (= (seekEntryOrOpen!0 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48961 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130056 res!1044102) b!1526064))

(assert (= (and b!1526064 res!1044096) b!1526067))

(assert (= (and b!1526067 res!1044097) b!1526066))

(assert (= (and b!1526066 res!1044109) b!1526071))

(assert (= (and b!1526071 res!1044099) b!1526065))

(assert (= (and b!1526065 res!1044106) b!1526063))

(assert (= (and b!1526063 res!1044104) b!1526072))

(assert (= (and b!1526072 res!1044107) b!1526070))

(assert (= (and b!1526070 res!1044108) b!1526069))

(assert (= (and b!1526069 res!1044103) b!1526073))

(assert (= (and b!1526073 res!1044105) b!1526074))

(assert (= (and b!1526074 res!1044101) b!1526062))

(assert (= (and b!1526062 (not res!1044100)) b!1526075))

(assert (= (and b!1526075 res!1044098) b!1526068))

(declare-fun m!1408829 () Bool)

(assert (=> b!1526067 m!1408829))

(assert (=> b!1526067 m!1408829))

(declare-fun m!1408831 () Bool)

(assert (=> b!1526067 m!1408831))

(declare-fun m!1408833 () Bool)

(assert (=> b!1526066 m!1408833))

(assert (=> b!1526066 m!1408833))

(declare-fun m!1408835 () Bool)

(assert (=> b!1526066 m!1408835))

(declare-fun m!1408837 () Bool)

(assert (=> b!1526069 m!1408837))

(assert (=> b!1526069 m!1408837))

(declare-fun m!1408839 () Bool)

(assert (=> b!1526069 m!1408839))

(declare-fun m!1408841 () Bool)

(assert (=> b!1526069 m!1408841))

(declare-fun m!1408843 () Bool)

(assert (=> b!1526069 m!1408843))

(declare-fun m!1408845 () Bool)

(assert (=> b!1526065 m!1408845))

(declare-fun m!1408847 () Bool)

(assert (=> b!1526071 m!1408847))

(assert (=> b!1526072 m!1408833))

(assert (=> b!1526072 m!1408833))

(declare-fun m!1408849 () Bool)

(assert (=> b!1526072 m!1408849))

(assert (=> b!1526072 m!1408849))

(assert (=> b!1526072 m!1408833))

(declare-fun m!1408851 () Bool)

(assert (=> b!1526072 m!1408851))

(assert (=> b!1526062 m!1408833))

(declare-fun m!1408853 () Bool)

(assert (=> b!1526062 m!1408853))

(declare-fun m!1408855 () Bool)

(assert (=> b!1526073 m!1408855))

(declare-fun m!1408857 () Bool)

(assert (=> b!1526073 m!1408857))

(assert (=> b!1526074 m!1408833))

(assert (=> b!1526074 m!1408833))

(declare-fun m!1408859 () Bool)

(assert (=> b!1526074 m!1408859))

(declare-fun m!1408861 () Bool)

(assert (=> b!1526068 m!1408861))

(declare-fun m!1408863 () Bool)

(assert (=> b!1526068 m!1408863))

(assert (=> b!1526075 m!1408833))

(assert (=> b!1526075 m!1408833))

(declare-fun m!1408865 () Bool)

(assert (=> b!1526075 m!1408865))

(assert (=> b!1526075 m!1408833))

(declare-fun m!1408867 () Bool)

(assert (=> b!1526075 m!1408867))

(assert (=> b!1526070 m!1408833))

(assert (=> b!1526070 m!1408833))

(declare-fun m!1408869 () Bool)

(assert (=> b!1526070 m!1408869))

(declare-fun m!1408871 () Bool)

(assert (=> start!130056 m!1408871))

(declare-fun m!1408873 () Bool)

(assert (=> start!130056 m!1408873))

(push 1)

