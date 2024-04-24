; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129068 () Bool)

(assert start!129068)

(declare-fun b!1510592 () Bool)

(declare-fun res!1029322 () Bool)

(declare-fun e!844007 () Bool)

(assert (=> b!1510592 (=> (not res!1029322) (not e!844007))))

(declare-datatypes ((array!100738 0))(
  ( (array!100739 (arr!48601 (Array (_ BitVec 32) (_ BitVec 64))) (size!49152 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100738)

(declare-datatypes ((List!35071 0))(
  ( (Nil!35068) (Cons!35067 (h!36494 (_ BitVec 64)) (t!49757 List!35071)) )
))
(declare-fun arrayNoDuplicates!0 (array!100738 (_ BitVec 32) List!35071) Bool)

(assert (=> b!1510592 (= res!1029322 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35068))))

(declare-fun b!1510593 () Bool)

(declare-fun res!1029318 () Bool)

(assert (=> b!1510593 (=> (not res!1029318) (not e!844007))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1510593 (= res!1029318 (and (= (size!49152 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49152 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49152 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510594 () Bool)

(declare-fun e!844006 () Bool)

(assert (=> b!1510594 (= e!844006 false)))

(declare-fun lt!655398 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510594 (= lt!655398 (toIndex!0 (select (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1510595 () Bool)

(declare-fun res!1029319 () Bool)

(assert (=> b!1510595 (=> (not res!1029319) (not e!844007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100738 (_ BitVec 32)) Bool)

(assert (=> b!1510595 (= res!1029319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510596 () Bool)

(declare-fun res!1029323 () Bool)

(assert (=> b!1510596 (=> (not res!1029323) (not e!844007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510596 (= res!1029323 (validKeyInArray!0 (select (arr!48601 a!2804) i!961)))))

(declare-fun b!1510597 () Bool)

(assert (=> b!1510597 (= e!844007 e!844006)))

(declare-fun res!1029324 () Bool)

(assert (=> b!1510597 (=> (not res!1029324) (not e!844006))))

(declare-datatypes ((SeekEntryResult!12665 0))(
  ( (MissingZero!12665 (index!53055 (_ BitVec 32))) (Found!12665 (index!53056 (_ BitVec 32))) (Intermediate!12665 (undefined!13477 Bool) (index!53057 (_ BitVec 32)) (x!135020 (_ BitVec 32))) (Undefined!12665) (MissingVacant!12665 (index!53058 (_ BitVec 32))) )
))
(declare-fun lt!655399 () SeekEntryResult!12665)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100738 (_ BitVec 32)) SeekEntryResult!12665)

(assert (=> b!1510597 (= res!1029324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48601 a!2804) j!70) mask!2512) (select (arr!48601 a!2804) j!70) a!2804 mask!2512) lt!655399))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510597 (= lt!655399 (Intermediate!12665 false resIndex!21 resX!21))))

(declare-fun b!1510599 () Bool)

(declare-fun res!1029320 () Bool)

(assert (=> b!1510599 (=> (not res!1029320) (not e!844006))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510599 (= res!1029320 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48601 a!2804) j!70) a!2804 mask!2512) lt!655399))))

(declare-fun b!1510600 () Bool)

(declare-fun res!1029326 () Bool)

(assert (=> b!1510600 (=> (not res!1029326) (not e!844007))))

(assert (=> b!1510600 (= res!1029326 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49152 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49152 a!2804))))))

(declare-fun b!1510598 () Bool)

(declare-fun res!1029325 () Bool)

(assert (=> b!1510598 (=> (not res!1029325) (not e!844007))))

(assert (=> b!1510598 (= res!1029325 (validKeyInArray!0 (select (arr!48601 a!2804) j!70)))))

(declare-fun res!1029321 () Bool)

(assert (=> start!129068 (=> (not res!1029321) (not e!844007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129068 (= res!1029321 (validMask!0 mask!2512))))

(assert (=> start!129068 e!844007))

(assert (=> start!129068 true))

(declare-fun array_inv!37882 (array!100738) Bool)

(assert (=> start!129068 (array_inv!37882 a!2804)))

(assert (= (and start!129068 res!1029321) b!1510593))

(assert (= (and b!1510593 res!1029318) b!1510596))

(assert (= (and b!1510596 res!1029323) b!1510598))

(assert (= (and b!1510598 res!1029325) b!1510595))

(assert (= (and b!1510595 res!1029319) b!1510592))

(assert (= (and b!1510592 res!1029322) b!1510600))

(assert (= (and b!1510600 res!1029326) b!1510597))

(assert (= (and b!1510597 res!1029324) b!1510599))

(assert (= (and b!1510599 res!1029320) b!1510594))

(declare-fun m!1392975 () Bool)

(assert (=> start!129068 m!1392975))

(declare-fun m!1392977 () Bool)

(assert (=> start!129068 m!1392977))

(declare-fun m!1392979 () Bool)

(assert (=> b!1510599 m!1392979))

(assert (=> b!1510599 m!1392979))

(declare-fun m!1392981 () Bool)

(assert (=> b!1510599 m!1392981))

(assert (=> b!1510597 m!1392979))

(assert (=> b!1510597 m!1392979))

(declare-fun m!1392983 () Bool)

(assert (=> b!1510597 m!1392983))

(assert (=> b!1510597 m!1392983))

(assert (=> b!1510597 m!1392979))

(declare-fun m!1392985 () Bool)

(assert (=> b!1510597 m!1392985))

(assert (=> b!1510598 m!1392979))

(assert (=> b!1510598 m!1392979))

(declare-fun m!1392987 () Bool)

(assert (=> b!1510598 m!1392987))

(declare-fun m!1392989 () Bool)

(assert (=> b!1510592 m!1392989))

(declare-fun m!1392991 () Bool)

(assert (=> b!1510596 m!1392991))

(assert (=> b!1510596 m!1392991))

(declare-fun m!1392993 () Bool)

(assert (=> b!1510596 m!1392993))

(declare-fun m!1392995 () Bool)

(assert (=> b!1510595 m!1392995))

(declare-fun m!1392997 () Bool)

(assert (=> b!1510594 m!1392997))

(declare-fun m!1392999 () Bool)

(assert (=> b!1510594 m!1392999))

(assert (=> b!1510594 m!1392999))

(declare-fun m!1393001 () Bool)

(assert (=> b!1510594 m!1393001))

(check-sat (not b!1510595) (not b!1510599) (not start!129068) (not b!1510597) (not b!1510596) (not b!1510592) (not b!1510598) (not b!1510594))
(check-sat)
