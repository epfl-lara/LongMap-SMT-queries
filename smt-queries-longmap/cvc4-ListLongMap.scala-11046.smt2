; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129112 () Bool)

(assert start!129112)

(declare-fun b!1515001 () Bool)

(declare-fun e!845451 () Bool)

(declare-fun e!845455 () Bool)

(assert (=> b!1515001 (= e!845451 e!845455)))

(declare-fun res!1034912 () Bool)

(assert (=> b!1515001 (=> (not res!1034912) (not e!845455))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100968 0))(
  ( (array!100969 (arr!48721 (Array (_ BitVec 32) (_ BitVec 64))) (size!49271 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100968)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12892 0))(
  ( (MissingZero!12892 (index!53963 (_ BitVec 32))) (Found!12892 (index!53964 (_ BitVec 32))) (Intermediate!12892 (undefined!13704 Bool) (index!53965 (_ BitVec 32)) (x!135666 (_ BitVec 32))) (Undefined!12892) (MissingVacant!12892 (index!53966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100968 (_ BitVec 32)) SeekEntryResult!12892)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100968 (_ BitVec 32)) SeekEntryResult!12892)

(assert (=> b!1515001 (= res!1034912 (= (seekEntryOrOpen!0 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48721 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1034911 () Bool)

(declare-fun e!845450 () Bool)

(assert (=> start!129112 (=> (not res!1034911) (not e!845450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129112 (= res!1034911 (validMask!0 mask!2512))))

(assert (=> start!129112 e!845450))

(assert (=> start!129112 true))

(declare-fun array_inv!37749 (array!100968) Bool)

(assert (=> start!129112 (array_inv!37749 a!2804)))

(declare-fun b!1515002 () Bool)

(declare-fun res!1034904 () Bool)

(assert (=> b!1515002 (=> (not res!1034904) (not e!845450))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515002 (= res!1034904 (and (= (size!49271 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49271 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49271 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515003 () Bool)

(declare-fun lt!656538 () array!100968)

(declare-fun lt!656536 () (_ BitVec 64))

(assert (=> b!1515003 (= e!845455 (= (seekEntryOrOpen!0 lt!656536 lt!656538 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656536 lt!656538 mask!2512)))))

(declare-fun b!1515004 () Bool)

(declare-fun e!845449 () Bool)

(assert (=> b!1515004 (= e!845449 e!845451)))

(declare-fun res!1034906 () Bool)

(assert (=> b!1515004 (=> res!1034906 e!845451)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515004 (= res!1034906 (or (not (= (select (arr!48721 a!2804) j!70) lt!656536)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48721 a!2804) index!487) (select (arr!48721 a!2804) j!70)) (not (= (select (arr!48721 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1515005 () Bool)

(declare-fun res!1034914 () Bool)

(declare-fun e!845454 () Bool)

(assert (=> b!1515005 (=> (not res!1034914) (not e!845454))))

(declare-fun lt!656535 () SeekEntryResult!12892)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100968 (_ BitVec 32)) SeekEntryResult!12892)

(assert (=> b!1515005 (= res!1034914 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) lt!656535))))

(declare-fun b!1515006 () Bool)

(declare-fun e!845452 () Bool)

(assert (=> b!1515006 (= e!845454 e!845452)))

(declare-fun res!1034908 () Bool)

(assert (=> b!1515006 (=> (not res!1034908) (not e!845452))))

(declare-fun lt!656539 () SeekEntryResult!12892)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515006 (= res!1034908 (= lt!656539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656536 mask!2512) lt!656536 lt!656538 mask!2512)))))

(assert (=> b!1515006 (= lt!656536 (select (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515006 (= lt!656538 (array!100969 (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49271 a!2804)))))

(declare-fun b!1515007 () Bool)

(declare-fun res!1034909 () Bool)

(assert (=> b!1515007 (=> (not res!1034909) (not e!845450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100968 (_ BitVec 32)) Bool)

(assert (=> b!1515007 (= res!1034909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515008 () Bool)

(declare-fun res!1034905 () Bool)

(assert (=> b!1515008 (=> (not res!1034905) (not e!845450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515008 (= res!1034905 (validKeyInArray!0 (select (arr!48721 a!2804) i!961)))))

(declare-fun b!1515009 () Bool)

(declare-fun res!1034913 () Bool)

(assert (=> b!1515009 (=> (not res!1034913) (not e!845450))))

(assert (=> b!1515009 (= res!1034913 (validKeyInArray!0 (select (arr!48721 a!2804) j!70)))))

(declare-fun b!1515010 () Bool)

(assert (=> b!1515010 (= e!845450 e!845454)))

(declare-fun res!1034915 () Bool)

(assert (=> b!1515010 (=> (not res!1034915) (not e!845454))))

(assert (=> b!1515010 (= res!1034915 (= lt!656539 lt!656535))))

(assert (=> b!1515010 (= lt!656535 (Intermediate!12892 false resIndex!21 resX!21))))

(assert (=> b!1515010 (= lt!656539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48721 a!2804) j!70) mask!2512) (select (arr!48721 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515011 () Bool)

(declare-fun res!1034907 () Bool)

(assert (=> b!1515011 (=> (not res!1034907) (not e!845450))))

(declare-datatypes ((List!35204 0))(
  ( (Nil!35201) (Cons!35200 (h!36612 (_ BitVec 64)) (t!49898 List!35204)) )
))
(declare-fun arrayNoDuplicates!0 (array!100968 (_ BitVec 32) List!35204) Bool)

(assert (=> b!1515011 (= res!1034907 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35201))))

(declare-fun b!1515012 () Bool)

(assert (=> b!1515012 (= e!845452 (not true))))

(assert (=> b!1515012 e!845449))

(declare-fun res!1034916 () Bool)

(assert (=> b!1515012 (=> (not res!1034916) (not e!845449))))

(assert (=> b!1515012 (= res!1034916 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50652 0))(
  ( (Unit!50653) )
))
(declare-fun lt!656537 () Unit!50652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50652)

(assert (=> b!1515012 (= lt!656537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515013 () Bool)

(declare-fun res!1034910 () Bool)

(assert (=> b!1515013 (=> (not res!1034910) (not e!845450))))

(assert (=> b!1515013 (= res!1034910 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49271 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49271 a!2804))))))

(declare-fun b!1515014 () Bool)

(declare-fun res!1034917 () Bool)

(assert (=> b!1515014 (=> (not res!1034917) (not e!845449))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100968 (_ BitVec 32)) SeekEntryResult!12892)

(assert (=> b!1515014 (= res!1034917 (= (seekEntry!0 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) (Found!12892 j!70)))))

(assert (= (and start!129112 res!1034911) b!1515002))

(assert (= (and b!1515002 res!1034904) b!1515008))

(assert (= (and b!1515008 res!1034905) b!1515009))

(assert (= (and b!1515009 res!1034913) b!1515007))

(assert (= (and b!1515007 res!1034909) b!1515011))

(assert (= (and b!1515011 res!1034907) b!1515013))

(assert (= (and b!1515013 res!1034910) b!1515010))

(assert (= (and b!1515010 res!1034915) b!1515005))

(assert (= (and b!1515005 res!1034914) b!1515006))

(assert (= (and b!1515006 res!1034908) b!1515012))

(assert (= (and b!1515012 res!1034916) b!1515014))

(assert (= (and b!1515014 res!1034917) b!1515004))

(assert (= (and b!1515004 (not res!1034906)) b!1515001))

(assert (= (and b!1515001 res!1034912) b!1515003))

(declare-fun m!1398009 () Bool)

(assert (=> b!1515008 m!1398009))

(assert (=> b!1515008 m!1398009))

(declare-fun m!1398011 () Bool)

(assert (=> b!1515008 m!1398011))

(declare-fun m!1398013 () Bool)

(assert (=> b!1515014 m!1398013))

(assert (=> b!1515014 m!1398013))

(declare-fun m!1398015 () Bool)

(assert (=> b!1515014 m!1398015))

(assert (=> b!1515010 m!1398013))

(assert (=> b!1515010 m!1398013))

(declare-fun m!1398017 () Bool)

(assert (=> b!1515010 m!1398017))

(assert (=> b!1515010 m!1398017))

(assert (=> b!1515010 m!1398013))

(declare-fun m!1398019 () Bool)

(assert (=> b!1515010 m!1398019))

(declare-fun m!1398021 () Bool)

(assert (=> start!129112 m!1398021))

(declare-fun m!1398023 () Bool)

(assert (=> start!129112 m!1398023))

(assert (=> b!1515005 m!1398013))

(assert (=> b!1515005 m!1398013))

(declare-fun m!1398025 () Bool)

(assert (=> b!1515005 m!1398025))

(declare-fun m!1398027 () Bool)

(assert (=> b!1515006 m!1398027))

(assert (=> b!1515006 m!1398027))

(declare-fun m!1398029 () Bool)

(assert (=> b!1515006 m!1398029))

(declare-fun m!1398031 () Bool)

(assert (=> b!1515006 m!1398031))

(declare-fun m!1398033 () Bool)

(assert (=> b!1515006 m!1398033))

(declare-fun m!1398035 () Bool)

(assert (=> b!1515012 m!1398035))

(declare-fun m!1398037 () Bool)

(assert (=> b!1515012 m!1398037))

(declare-fun m!1398039 () Bool)

(assert (=> b!1515007 m!1398039))

(declare-fun m!1398041 () Bool)

(assert (=> b!1515003 m!1398041))

(declare-fun m!1398043 () Bool)

(assert (=> b!1515003 m!1398043))

(assert (=> b!1515004 m!1398013))

(declare-fun m!1398045 () Bool)

(assert (=> b!1515004 m!1398045))

(assert (=> b!1515001 m!1398013))

(assert (=> b!1515001 m!1398013))

(declare-fun m!1398047 () Bool)

(assert (=> b!1515001 m!1398047))

(assert (=> b!1515001 m!1398013))

(declare-fun m!1398049 () Bool)

(assert (=> b!1515001 m!1398049))

(declare-fun m!1398051 () Bool)

(assert (=> b!1515011 m!1398051))

(assert (=> b!1515009 m!1398013))

(assert (=> b!1515009 m!1398013))

(declare-fun m!1398053 () Bool)

(assert (=> b!1515009 m!1398053))

(push 1)

