; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129200 () Bool)

(assert start!129200)

(declare-fun res!1031372 () Bool)

(declare-fun e!844728 () Bool)

(assert (=> start!129200 (=> (not res!1031372) (not e!844728))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129200 (= res!1031372 (validMask!0 mask!2512))))

(assert (=> start!129200 e!844728))

(assert (=> start!129200 true))

(declare-datatypes ((array!100870 0))(
  ( (array!100871 (arr!48667 (Array (_ BitVec 32) (_ BitVec 64))) (size!49218 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100870)

(declare-fun array_inv!37948 (array!100870) Bool)

(assert (=> start!129200 (array_inv!37948 a!2804)))

(declare-fun b!1512639 () Bool)

(declare-fun res!1031373 () Bool)

(assert (=> b!1512639 (=> (not res!1031373) (not e!844728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100870 (_ BitVec 32)) Bool)

(assert (=> b!1512639 (= res!1031373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512640 () Bool)

(declare-fun res!1031370 () Bool)

(assert (=> b!1512640 (=> (not res!1031370) (not e!844728))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1512640 (= res!1031370 (and (= (size!49218 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49218 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49218 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!844729 () Bool)

(declare-fun b!1512641 () Bool)

(declare-datatypes ((SeekEntryResult!12731 0))(
  ( (MissingZero!12731 (index!53319 (_ BitVec 32))) (Found!12731 (index!53320 (_ BitVec 32))) (Intermediate!12731 (undefined!13543 Bool) (index!53321 (_ BitVec 32)) (x!135262 (_ BitVec 32))) (Undefined!12731) (MissingVacant!12731 (index!53322 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12731)

(assert (=> b!1512641 (= e!844729 (= (seekEntry!0 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) (Found!12731 j!70)))))

(declare-fun b!1512642 () Bool)

(declare-fun res!1031374 () Bool)

(assert (=> b!1512642 (=> (not res!1031374) (not e!844728))))

(declare-datatypes ((List!35137 0))(
  ( (Nil!35134) (Cons!35133 (h!36560 (_ BitVec 64)) (t!49823 List!35137)) )
))
(declare-fun arrayNoDuplicates!0 (array!100870 (_ BitVec 32) List!35137) Bool)

(assert (=> b!1512642 (= res!1031374 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35134))))

(declare-fun b!1512643 () Bool)

(declare-fun res!1031367 () Bool)

(declare-fun e!844730 () Bool)

(assert (=> b!1512643 (=> (not res!1031367) (not e!844730))))

(declare-fun lt!655933 () SeekEntryResult!12731)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512643 (= res!1031367 (= lt!655933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100871 (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49218 a!2804)) mask!2512)))))

(declare-fun b!1512644 () Bool)

(declare-fun res!1031368 () Bool)

(assert (=> b!1512644 (=> (not res!1031368) (not e!844728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512644 (= res!1031368 (validKeyInArray!0 (select (arr!48667 a!2804) j!70)))))

(declare-fun b!1512645 () Bool)

(declare-fun res!1031369 () Bool)

(assert (=> b!1512645 (=> (not res!1031369) (not e!844728))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512645 (= res!1031369 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49218 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49218 a!2804))))))

(declare-fun b!1512646 () Bool)

(assert (=> b!1512646 (= e!844728 e!844730)))

(declare-fun res!1031375 () Bool)

(assert (=> b!1512646 (=> (not res!1031375) (not e!844730))))

(declare-fun lt!655931 () SeekEntryResult!12731)

(assert (=> b!1512646 (= res!1031375 (= lt!655933 lt!655931))))

(assert (=> b!1512646 (= lt!655931 (Intermediate!12731 false resIndex!21 resX!21))))

(assert (=> b!1512646 (= lt!655933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48667 a!2804) j!70) mask!2512) (select (arr!48667 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512647 () Bool)

(declare-fun res!1031365 () Bool)

(assert (=> b!1512647 (=> (not res!1031365) (not e!844730))))

(assert (=> b!1512647 (= res!1031365 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) lt!655931))))

(declare-fun b!1512648 () Bool)

(assert (=> b!1512648 (= e!844730 (not true))))

(assert (=> b!1512648 e!844729))

(declare-fun res!1031366 () Bool)

(assert (=> b!1512648 (=> (not res!1031366) (not e!844729))))

(assert (=> b!1512648 (= res!1031366 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50365 0))(
  ( (Unit!50366) )
))
(declare-fun lt!655932 () Unit!50365)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50365)

(assert (=> b!1512648 (= lt!655932 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512649 () Bool)

(declare-fun res!1031371 () Bool)

(assert (=> b!1512649 (=> (not res!1031371) (not e!844728))))

(assert (=> b!1512649 (= res!1031371 (validKeyInArray!0 (select (arr!48667 a!2804) i!961)))))

(assert (= (and start!129200 res!1031372) b!1512640))

(assert (= (and b!1512640 res!1031370) b!1512649))

(assert (= (and b!1512649 res!1031371) b!1512644))

(assert (= (and b!1512644 res!1031368) b!1512639))

(assert (= (and b!1512639 res!1031373) b!1512642))

(assert (= (and b!1512642 res!1031374) b!1512645))

(assert (= (and b!1512645 res!1031369) b!1512646))

(assert (= (and b!1512646 res!1031375) b!1512647))

(assert (= (and b!1512647 res!1031365) b!1512643))

(assert (= (and b!1512643 res!1031367) b!1512648))

(assert (= (and b!1512648 res!1031366) b!1512641))

(declare-fun m!1395231 () Bool)

(assert (=> b!1512642 m!1395231))

(declare-fun m!1395233 () Bool)

(assert (=> b!1512643 m!1395233))

(declare-fun m!1395235 () Bool)

(assert (=> b!1512643 m!1395235))

(assert (=> b!1512643 m!1395235))

(declare-fun m!1395237 () Bool)

(assert (=> b!1512643 m!1395237))

(assert (=> b!1512643 m!1395237))

(assert (=> b!1512643 m!1395235))

(declare-fun m!1395239 () Bool)

(assert (=> b!1512643 m!1395239))

(declare-fun m!1395241 () Bool)

(assert (=> b!1512647 m!1395241))

(assert (=> b!1512647 m!1395241))

(declare-fun m!1395243 () Bool)

(assert (=> b!1512647 m!1395243))

(declare-fun m!1395245 () Bool)

(assert (=> start!129200 m!1395245))

(declare-fun m!1395247 () Bool)

(assert (=> start!129200 m!1395247))

(assert (=> b!1512644 m!1395241))

(assert (=> b!1512644 m!1395241))

(declare-fun m!1395249 () Bool)

(assert (=> b!1512644 m!1395249))

(declare-fun m!1395251 () Bool)

(assert (=> b!1512649 m!1395251))

(assert (=> b!1512649 m!1395251))

(declare-fun m!1395253 () Bool)

(assert (=> b!1512649 m!1395253))

(declare-fun m!1395255 () Bool)

(assert (=> b!1512639 m!1395255))

(assert (=> b!1512646 m!1395241))

(assert (=> b!1512646 m!1395241))

(declare-fun m!1395257 () Bool)

(assert (=> b!1512646 m!1395257))

(assert (=> b!1512646 m!1395257))

(assert (=> b!1512646 m!1395241))

(declare-fun m!1395259 () Bool)

(assert (=> b!1512646 m!1395259))

(assert (=> b!1512641 m!1395241))

(assert (=> b!1512641 m!1395241))

(declare-fun m!1395261 () Bool)

(assert (=> b!1512641 m!1395261))

(declare-fun m!1395263 () Bool)

(assert (=> b!1512648 m!1395263))

(declare-fun m!1395265 () Bool)

(assert (=> b!1512648 m!1395265))

(check-sat (not b!1512644) (not b!1512647) (not b!1512643) (not b!1512639) (not b!1512646) (not b!1512649) (not start!129200) (not b!1512648) (not b!1512641) (not b!1512642))
(check-sat)
