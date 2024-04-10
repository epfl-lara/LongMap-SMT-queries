; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128808 () Bool)

(assert start!128808)

(declare-fun b!1509338 () Bool)

(declare-fun res!1029244 () Bool)

(declare-fun e!843068 () Bool)

(assert (=> b!1509338 (=> (not res!1029244) (not e!843068))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100664 0))(
  ( (array!100665 (arr!48569 (Array (_ BitVec 32) (_ BitVec 64))) (size!49119 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100664)

(assert (=> b!1509338 (= res!1029244 (and (= (size!49119 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49119 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49119 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1029249 () Bool)

(assert (=> start!128808 (=> (not res!1029249) (not e!843068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128808 (= res!1029249 (validMask!0 mask!2512))))

(assert (=> start!128808 e!843068))

(assert (=> start!128808 true))

(declare-fun array_inv!37597 (array!100664) Bool)

(assert (=> start!128808 (array_inv!37597 a!2804)))

(declare-fun b!1509339 () Bool)

(declare-fun res!1029247 () Bool)

(assert (=> b!1509339 (=> (not res!1029247) (not e!843068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509339 (= res!1029247 (validKeyInArray!0 (select (arr!48569 a!2804) i!961)))))

(declare-fun b!1509340 () Bool)

(declare-fun e!843070 () Bool)

(assert (=> b!1509340 (= e!843070 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100664 (_ BitVec 32)) Bool)

(assert (=> b!1509340 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50348 0))(
  ( (Unit!50349) )
))
(declare-fun lt!654863 () Unit!50348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50348)

(assert (=> b!1509340 (= lt!654863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509341 () Bool)

(declare-fun res!1029245 () Bool)

(assert (=> b!1509341 (=> (not res!1029245) (not e!843068))))

(assert (=> b!1509341 (= res!1029245 (validKeyInArray!0 (select (arr!48569 a!2804) j!70)))))

(declare-fun b!1509342 () Bool)

(assert (=> b!1509342 (= e!843068 e!843070)))

(declare-fun res!1029241 () Bool)

(assert (=> b!1509342 (=> (not res!1029241) (not e!843070))))

(declare-datatypes ((SeekEntryResult!12740 0))(
  ( (MissingZero!12740 (index!53355 (_ BitVec 32))) (Found!12740 (index!53356 (_ BitVec 32))) (Intermediate!12740 (undefined!13552 Bool) (index!53357 (_ BitVec 32)) (x!135114 (_ BitVec 32))) (Undefined!12740) (MissingVacant!12740 (index!53358 (_ BitVec 32))) )
))
(declare-fun lt!654864 () SeekEntryResult!12740)

(declare-fun lt!654865 () SeekEntryResult!12740)

(assert (=> b!1509342 (= res!1029241 (= lt!654864 lt!654865))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509342 (= lt!654865 (Intermediate!12740 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100664 (_ BitVec 32)) SeekEntryResult!12740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509342 (= lt!654864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48569 a!2804) j!70) mask!2512) (select (arr!48569 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509343 () Bool)

(declare-fun res!1029242 () Bool)

(assert (=> b!1509343 (=> (not res!1029242) (not e!843070))))

(assert (=> b!1509343 (= res!1029242 (= lt!654864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48569 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48569 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100665 (store (arr!48569 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49119 a!2804)) mask!2512)))))

(declare-fun b!1509344 () Bool)

(declare-fun res!1029243 () Bool)

(assert (=> b!1509344 (=> (not res!1029243) (not e!843068))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509344 (= res!1029243 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49119 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49119 a!2804))))))

(declare-fun b!1509345 () Bool)

(declare-fun res!1029250 () Bool)

(assert (=> b!1509345 (=> (not res!1029250) (not e!843070))))

(assert (=> b!1509345 (= res!1029250 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48569 a!2804) j!70) a!2804 mask!2512) lt!654865))))

(declare-fun b!1509346 () Bool)

(declare-fun res!1029246 () Bool)

(assert (=> b!1509346 (=> (not res!1029246) (not e!843068))))

(declare-datatypes ((List!35052 0))(
  ( (Nil!35049) (Cons!35048 (h!36460 (_ BitVec 64)) (t!49746 List!35052)) )
))
(declare-fun arrayNoDuplicates!0 (array!100664 (_ BitVec 32) List!35052) Bool)

(assert (=> b!1509346 (= res!1029246 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35049))))

(declare-fun b!1509347 () Bool)

(declare-fun res!1029248 () Bool)

(assert (=> b!1509347 (=> (not res!1029248) (not e!843068))))

(assert (=> b!1509347 (= res!1029248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128808 res!1029249) b!1509338))

(assert (= (and b!1509338 res!1029244) b!1509339))

(assert (= (and b!1509339 res!1029247) b!1509341))

(assert (= (and b!1509341 res!1029245) b!1509347))

(assert (= (and b!1509347 res!1029248) b!1509346))

(assert (= (and b!1509346 res!1029246) b!1509344))

(assert (= (and b!1509344 res!1029243) b!1509342))

(assert (= (and b!1509342 res!1029241) b!1509345))

(assert (= (and b!1509345 res!1029250) b!1509343))

(assert (= (and b!1509343 res!1029242) b!1509340))

(declare-fun m!1391803 () Bool)

(assert (=> b!1509343 m!1391803))

(declare-fun m!1391805 () Bool)

(assert (=> b!1509343 m!1391805))

(assert (=> b!1509343 m!1391805))

(declare-fun m!1391807 () Bool)

(assert (=> b!1509343 m!1391807))

(assert (=> b!1509343 m!1391807))

(assert (=> b!1509343 m!1391805))

(declare-fun m!1391809 () Bool)

(assert (=> b!1509343 m!1391809))

(declare-fun m!1391811 () Bool)

(assert (=> b!1509342 m!1391811))

(assert (=> b!1509342 m!1391811))

(declare-fun m!1391813 () Bool)

(assert (=> b!1509342 m!1391813))

(assert (=> b!1509342 m!1391813))

(assert (=> b!1509342 m!1391811))

(declare-fun m!1391815 () Bool)

(assert (=> b!1509342 m!1391815))

(declare-fun m!1391817 () Bool)

(assert (=> start!128808 m!1391817))

(declare-fun m!1391819 () Bool)

(assert (=> start!128808 m!1391819))

(declare-fun m!1391821 () Bool)

(assert (=> b!1509340 m!1391821))

(declare-fun m!1391823 () Bool)

(assert (=> b!1509340 m!1391823))

(declare-fun m!1391825 () Bool)

(assert (=> b!1509339 m!1391825))

(assert (=> b!1509339 m!1391825))

(declare-fun m!1391827 () Bool)

(assert (=> b!1509339 m!1391827))

(assert (=> b!1509341 m!1391811))

(assert (=> b!1509341 m!1391811))

(declare-fun m!1391829 () Bool)

(assert (=> b!1509341 m!1391829))

(assert (=> b!1509345 m!1391811))

(assert (=> b!1509345 m!1391811))

(declare-fun m!1391831 () Bool)

(assert (=> b!1509345 m!1391831))

(declare-fun m!1391833 () Bool)

(assert (=> b!1509346 m!1391833))

(declare-fun m!1391835 () Bool)

(assert (=> b!1509347 m!1391835))

(push 1)

