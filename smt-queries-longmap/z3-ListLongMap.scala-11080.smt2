; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129260 () Bool)

(assert start!129260)

(declare-fun b!1518528 () Bool)

(declare-fun res!1038649 () Bool)

(declare-fun e!847077 () Bool)

(assert (=> b!1518528 (=> (not res!1038649) (not e!847077))))

(declare-datatypes ((array!101116 0))(
  ( (array!101117 (arr!48796 (Array (_ BitVec 32) (_ BitVec 64))) (size!49348 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101116)

(declare-datatypes ((List!35357 0))(
  ( (Nil!35354) (Cons!35353 (h!36766 (_ BitVec 64)) (t!50043 List!35357)) )
))
(declare-fun arrayNoDuplicates!0 (array!101116 (_ BitVec 32) List!35357) Bool)

(assert (=> b!1518528 (= res!1038649 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35354))))

(declare-fun b!1518529 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!847074 () Bool)

(declare-datatypes ((SeekEntryResult!12990 0))(
  ( (MissingZero!12990 (index!54355 (_ BitVec 32))) (Found!12990 (index!54356 (_ BitVec 32))) (Intermediate!12990 (undefined!13802 Bool) (index!54357 (_ BitVec 32)) (x!136030 (_ BitVec 32))) (Undefined!12990) (MissingVacant!12990 (index!54358 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12990)

(assert (=> b!1518529 (= e!847074 (= (seekEntry!0 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) (Found!12990 j!70)))))

(declare-fun b!1518530 () Bool)

(declare-fun res!1038646 () Bool)

(declare-fun e!847079 () Bool)

(assert (=> b!1518530 (=> res!1038646 e!847079)))

(declare-fun lt!658092 () (_ BitVec 32))

(declare-fun lt!658091 () SeekEntryResult!12990)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12990)

(assert (=> b!1518530 (= res!1038646 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658092 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) lt!658091)))))

(declare-fun b!1518531 () Bool)

(declare-fun res!1038642 () Bool)

(assert (=> b!1518531 (=> (not res!1038642) (not e!847077))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518531 (= res!1038642 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49348 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49348 a!2804))))))

(declare-fun b!1518532 () Bool)

(declare-fun res!1038638 () Bool)

(assert (=> b!1518532 (=> (not res!1038638) (not e!847077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101116 (_ BitVec 32)) Bool)

(assert (=> b!1518532 (= res!1038638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518533 () Bool)

(declare-fun res!1038650 () Bool)

(assert (=> b!1518533 (=> (not res!1038650) (not e!847077))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518533 (= res!1038650 (and (= (size!49348 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49348 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49348 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518535 () Bool)

(declare-fun e!847080 () Bool)

(assert (=> b!1518535 (= e!847080 e!847079)))

(declare-fun res!1038643 () Bool)

(assert (=> b!1518535 (=> res!1038643 e!847079)))

(assert (=> b!1518535 (= res!1038643 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658092 #b00000000000000000000000000000000) (bvsge lt!658092 (size!49348 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518535 (= lt!658092 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518536 () Bool)

(declare-fun e!847078 () Bool)

(assert (=> b!1518536 (= e!847077 e!847078)))

(declare-fun res!1038641 () Bool)

(assert (=> b!1518536 (=> (not res!1038641) (not e!847078))))

(declare-fun lt!658087 () SeekEntryResult!12990)

(assert (=> b!1518536 (= res!1038641 (= lt!658087 lt!658091))))

(assert (=> b!1518536 (= lt!658091 (Intermediate!12990 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518536 (= lt!658087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48796 a!2804) j!70) mask!2512) (select (arr!48796 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518537 () Bool)

(declare-fun e!847075 () Bool)

(assert (=> b!1518537 (= e!847078 e!847075)))

(declare-fun res!1038637 () Bool)

(assert (=> b!1518537 (=> (not res!1038637) (not e!847075))))

(declare-fun lt!658090 () array!101116)

(declare-fun lt!658086 () (_ BitVec 64))

(assert (=> b!1518537 (= res!1038637 (= lt!658087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658086 mask!2512) lt!658086 lt!658090 mask!2512)))))

(assert (=> b!1518537 (= lt!658086 (select (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518537 (= lt!658090 (array!101117 (store (arr!48796 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49348 a!2804)))))

(declare-fun b!1518538 () Bool)

(declare-fun res!1038639 () Bool)

(assert (=> b!1518538 (=> (not res!1038639) (not e!847077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518538 (= res!1038639 (validKeyInArray!0 (select (arr!48796 a!2804) i!961)))))

(declare-fun b!1518539 () Bool)

(assert (=> b!1518539 (= e!847075 (not e!847080))))

(declare-fun res!1038640 () Bool)

(assert (=> b!1518539 (=> res!1038640 e!847080)))

(assert (=> b!1518539 (= res!1038640 (or (not (= (select (arr!48796 a!2804) j!70) lt!658086)) (= x!534 resX!21)))))

(assert (=> b!1518539 e!847074))

(declare-fun res!1038644 () Bool)

(assert (=> b!1518539 (=> (not res!1038644) (not e!847074))))

(assert (=> b!1518539 (= res!1038644 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50687 0))(
  ( (Unit!50688) )
))
(declare-fun lt!658089 () Unit!50687)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50687)

(assert (=> b!1518539 (= lt!658089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518540 () Bool)

(assert (=> b!1518540 (= e!847079 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12990)

(assert (=> b!1518540 (= (seekEntryOrOpen!0 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658086 lt!658090 mask!2512))))

(declare-fun lt!658088 () Unit!50687)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50687)

(assert (=> b!1518540 (= lt!658088 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658092 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518541 () Bool)

(declare-fun res!1038648 () Bool)

(assert (=> b!1518541 (=> (not res!1038648) (not e!847078))))

(assert (=> b!1518541 (= res!1038648 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48796 a!2804) j!70) a!2804 mask!2512) lt!658091))))

(declare-fun res!1038645 () Bool)

(assert (=> start!129260 (=> (not res!1038645) (not e!847077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129260 (= res!1038645 (validMask!0 mask!2512))))

(assert (=> start!129260 e!847077))

(assert (=> start!129260 true))

(declare-fun array_inv!38029 (array!101116) Bool)

(assert (=> start!129260 (array_inv!38029 a!2804)))

(declare-fun b!1518534 () Bool)

(declare-fun res!1038647 () Bool)

(assert (=> b!1518534 (=> (not res!1038647) (not e!847077))))

(assert (=> b!1518534 (= res!1038647 (validKeyInArray!0 (select (arr!48796 a!2804) j!70)))))

(assert (= (and start!129260 res!1038645) b!1518533))

(assert (= (and b!1518533 res!1038650) b!1518538))

(assert (= (and b!1518538 res!1038639) b!1518534))

(assert (= (and b!1518534 res!1038647) b!1518532))

(assert (= (and b!1518532 res!1038638) b!1518528))

(assert (= (and b!1518528 res!1038649) b!1518531))

(assert (= (and b!1518531 res!1038642) b!1518536))

(assert (= (and b!1518536 res!1038641) b!1518541))

(assert (= (and b!1518541 res!1038648) b!1518537))

(assert (= (and b!1518537 res!1038637) b!1518539))

(assert (= (and b!1518539 res!1038644) b!1518529))

(assert (= (and b!1518539 (not res!1038640)) b!1518535))

(assert (= (and b!1518535 (not res!1038643)) b!1518530))

(assert (= (and b!1518530 (not res!1038646)) b!1518540))

(declare-fun m!1401311 () Bool)

(assert (=> b!1518540 m!1401311))

(assert (=> b!1518540 m!1401311))

(declare-fun m!1401313 () Bool)

(assert (=> b!1518540 m!1401313))

(declare-fun m!1401315 () Bool)

(assert (=> b!1518540 m!1401315))

(declare-fun m!1401317 () Bool)

(assert (=> b!1518540 m!1401317))

(assert (=> b!1518534 m!1401311))

(assert (=> b!1518534 m!1401311))

(declare-fun m!1401319 () Bool)

(assert (=> b!1518534 m!1401319))

(declare-fun m!1401321 () Bool)

(assert (=> start!129260 m!1401321))

(declare-fun m!1401323 () Bool)

(assert (=> start!129260 m!1401323))

(assert (=> b!1518539 m!1401311))

(declare-fun m!1401325 () Bool)

(assert (=> b!1518539 m!1401325))

(declare-fun m!1401327 () Bool)

(assert (=> b!1518539 m!1401327))

(declare-fun m!1401329 () Bool)

(assert (=> b!1518532 m!1401329))

(declare-fun m!1401331 () Bool)

(assert (=> b!1518535 m!1401331))

(declare-fun m!1401333 () Bool)

(assert (=> b!1518538 m!1401333))

(assert (=> b!1518538 m!1401333))

(declare-fun m!1401335 () Bool)

(assert (=> b!1518538 m!1401335))

(assert (=> b!1518530 m!1401311))

(assert (=> b!1518530 m!1401311))

(declare-fun m!1401337 () Bool)

(assert (=> b!1518530 m!1401337))

(assert (=> b!1518536 m!1401311))

(assert (=> b!1518536 m!1401311))

(declare-fun m!1401339 () Bool)

(assert (=> b!1518536 m!1401339))

(assert (=> b!1518536 m!1401339))

(assert (=> b!1518536 m!1401311))

(declare-fun m!1401341 () Bool)

(assert (=> b!1518536 m!1401341))

(declare-fun m!1401343 () Bool)

(assert (=> b!1518528 m!1401343))

(declare-fun m!1401345 () Bool)

(assert (=> b!1518537 m!1401345))

(assert (=> b!1518537 m!1401345))

(declare-fun m!1401347 () Bool)

(assert (=> b!1518537 m!1401347))

(declare-fun m!1401349 () Bool)

(assert (=> b!1518537 m!1401349))

(declare-fun m!1401351 () Bool)

(assert (=> b!1518537 m!1401351))

(assert (=> b!1518541 m!1401311))

(assert (=> b!1518541 m!1401311))

(declare-fun m!1401353 () Bool)

(assert (=> b!1518541 m!1401353))

(assert (=> b!1518529 m!1401311))

(assert (=> b!1518529 m!1401311))

(declare-fun m!1401355 () Bool)

(assert (=> b!1518529 m!1401355))

(check-sat (not b!1518529) (not b!1518537) (not b!1518541) (not start!129260) (not b!1518530) (not b!1518532) (not b!1518539) (not b!1518540) (not b!1518536) (not b!1518538) (not b!1518528) (not b!1518534) (not b!1518535))
(check-sat)
