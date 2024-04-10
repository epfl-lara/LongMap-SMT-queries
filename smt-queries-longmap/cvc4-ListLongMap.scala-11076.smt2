; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129292 () Bool)

(assert start!129292)

(declare-fun res!1038364 () Bool)

(declare-fun e!847080 () Bool)

(assert (=> start!129292 (=> (not res!1038364) (not e!847080))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129292 (= res!1038364 (validMask!0 mask!2512))))

(assert (=> start!129292 e!847080))

(assert (=> start!129292 true))

(declare-datatypes ((array!101148 0))(
  ( (array!101149 (arr!48811 (Array (_ BitVec 32) (_ BitVec 64))) (size!49361 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101148)

(declare-fun array_inv!37839 (array!101148) Bool)

(assert (=> start!129292 (array_inv!37839 a!2804)))

(declare-fun b!1518449 () Bool)

(declare-fun res!1038356 () Bool)

(assert (=> b!1518449 (=> (not res!1038356) (not e!847080))))

(declare-datatypes ((List!35294 0))(
  ( (Nil!35291) (Cons!35290 (h!36702 (_ BitVec 64)) (t!49988 List!35294)) )
))
(declare-fun arrayNoDuplicates!0 (array!101148 (_ BitVec 32) List!35294) Bool)

(assert (=> b!1518449 (= res!1038356 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35291))))

(declare-fun b!1518450 () Bool)

(declare-fun res!1038362 () Bool)

(assert (=> b!1518450 (=> (not res!1038362) (not e!847080))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1518450 (= res!1038362 (and (= (size!49361 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49361 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49361 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518451 () Bool)

(declare-fun e!847081 () Bool)

(assert (=> b!1518451 (= e!847081 true)))

(declare-fun lt!658174 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12982 0))(
  ( (MissingZero!12982 (index!54323 (_ BitVec 32))) (Found!12982 (index!54324 (_ BitVec 32))) (Intermediate!12982 (undefined!13794 Bool) (index!54325 (_ BitVec 32)) (x!135996 (_ BitVec 32))) (Undefined!12982) (MissingVacant!12982 (index!54326 (_ BitVec 32))) )
))
(declare-fun lt!658173 () SeekEntryResult!12982)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101148 (_ BitVec 32)) SeekEntryResult!12982)

(assert (=> b!1518451 (= lt!658173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658174 (select (arr!48811 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518452 () Bool)

(declare-fun res!1038360 () Bool)

(declare-fun e!847083 () Bool)

(assert (=> b!1518452 (=> (not res!1038360) (not e!847083))))

(declare-fun lt!658175 () SeekEntryResult!12982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518452 (= res!1038360 (= lt!658175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101149 (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49361 a!2804)) mask!2512)))))

(declare-fun b!1518453 () Bool)

(declare-fun res!1038361 () Bool)

(assert (=> b!1518453 (=> (not res!1038361) (not e!847080))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518453 (= res!1038361 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49361 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49361 a!2804))))))

(declare-fun e!847082 () Bool)

(declare-fun b!1518454 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101148 (_ BitVec 32)) SeekEntryResult!12982)

(assert (=> b!1518454 (= e!847082 (= (seekEntry!0 (select (arr!48811 a!2804) j!70) a!2804 mask!2512) (Found!12982 j!70)))))

(declare-fun b!1518455 () Bool)

(declare-fun res!1038357 () Bool)

(assert (=> b!1518455 (=> (not res!1038357) (not e!847080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101148 (_ BitVec 32)) Bool)

(assert (=> b!1518455 (= res!1038357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518456 () Bool)

(declare-fun e!847079 () Bool)

(assert (=> b!1518456 (= e!847079 e!847081)))

(declare-fun res!1038358 () Bool)

(assert (=> b!1518456 (=> res!1038358 e!847081)))

(assert (=> b!1518456 (= res!1038358 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658174 #b00000000000000000000000000000000) (bvsge lt!658174 (size!49361 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518456 (= lt!658174 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518457 () Bool)

(assert (=> b!1518457 (= e!847080 e!847083)))

(declare-fun res!1038354 () Bool)

(assert (=> b!1518457 (=> (not res!1038354) (not e!847083))))

(declare-fun lt!658177 () SeekEntryResult!12982)

(assert (=> b!1518457 (= res!1038354 (= lt!658175 lt!658177))))

(assert (=> b!1518457 (= lt!658177 (Intermediate!12982 false resIndex!21 resX!21))))

(assert (=> b!1518457 (= lt!658175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48811 a!2804) j!70) mask!2512) (select (arr!48811 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518458 () Bool)

(declare-fun res!1038355 () Bool)

(assert (=> b!1518458 (=> (not res!1038355) (not e!847080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518458 (= res!1038355 (validKeyInArray!0 (select (arr!48811 a!2804) j!70)))))

(declare-fun b!1518459 () Bool)

(assert (=> b!1518459 (= e!847083 (not e!847079))))

(declare-fun res!1038352 () Bool)

(assert (=> b!1518459 (=> res!1038352 e!847079)))

(assert (=> b!1518459 (= res!1038352 (or (not (= (select (arr!48811 a!2804) j!70) (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518459 e!847082))

(declare-fun res!1038359 () Bool)

(assert (=> b!1518459 (=> (not res!1038359) (not e!847082))))

(assert (=> b!1518459 (= res!1038359 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50832 0))(
  ( (Unit!50833) )
))
(declare-fun lt!658176 () Unit!50832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50832)

(assert (=> b!1518459 (= lt!658176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518460 () Bool)

(declare-fun res!1038363 () Bool)

(assert (=> b!1518460 (=> (not res!1038363) (not e!847083))))

(assert (=> b!1518460 (= res!1038363 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48811 a!2804) j!70) a!2804 mask!2512) lt!658177))))

(declare-fun b!1518461 () Bool)

(declare-fun res!1038353 () Bool)

(assert (=> b!1518461 (=> (not res!1038353) (not e!847080))))

(assert (=> b!1518461 (= res!1038353 (validKeyInArray!0 (select (arr!48811 a!2804) i!961)))))

(assert (= (and start!129292 res!1038364) b!1518450))

(assert (= (and b!1518450 res!1038362) b!1518461))

(assert (= (and b!1518461 res!1038353) b!1518458))

(assert (= (and b!1518458 res!1038355) b!1518455))

(assert (= (and b!1518455 res!1038357) b!1518449))

(assert (= (and b!1518449 res!1038356) b!1518453))

(assert (= (and b!1518453 res!1038361) b!1518457))

(assert (= (and b!1518457 res!1038354) b!1518460))

(assert (= (and b!1518460 res!1038363) b!1518452))

(assert (= (and b!1518452 res!1038360) b!1518459))

(assert (= (and b!1518459 res!1038359) b!1518454))

(assert (= (and b!1518459 (not res!1038352)) b!1518456))

(assert (= (and b!1518456 (not res!1038358)) b!1518451))

(declare-fun m!1401765 () Bool)

(assert (=> b!1518456 m!1401765))

(declare-fun m!1401767 () Bool)

(assert (=> b!1518461 m!1401767))

(assert (=> b!1518461 m!1401767))

(declare-fun m!1401769 () Bool)

(assert (=> b!1518461 m!1401769))

(declare-fun m!1401771 () Bool)

(assert (=> b!1518455 m!1401771))

(declare-fun m!1401773 () Bool)

(assert (=> b!1518458 m!1401773))

(assert (=> b!1518458 m!1401773))

(declare-fun m!1401775 () Bool)

(assert (=> b!1518458 m!1401775))

(assert (=> b!1518451 m!1401773))

(assert (=> b!1518451 m!1401773))

(declare-fun m!1401777 () Bool)

(assert (=> b!1518451 m!1401777))

(declare-fun m!1401779 () Bool)

(assert (=> b!1518449 m!1401779))

(assert (=> b!1518460 m!1401773))

(assert (=> b!1518460 m!1401773))

(declare-fun m!1401781 () Bool)

(assert (=> b!1518460 m!1401781))

(assert (=> b!1518454 m!1401773))

(assert (=> b!1518454 m!1401773))

(declare-fun m!1401783 () Bool)

(assert (=> b!1518454 m!1401783))

(declare-fun m!1401785 () Bool)

(assert (=> start!129292 m!1401785))

(declare-fun m!1401787 () Bool)

(assert (=> start!129292 m!1401787))

(declare-fun m!1401789 () Bool)

(assert (=> b!1518452 m!1401789))

(declare-fun m!1401791 () Bool)

(assert (=> b!1518452 m!1401791))

(assert (=> b!1518452 m!1401791))

(declare-fun m!1401793 () Bool)

(assert (=> b!1518452 m!1401793))

(assert (=> b!1518452 m!1401793))

(assert (=> b!1518452 m!1401791))

(declare-fun m!1401795 () Bool)

(assert (=> b!1518452 m!1401795))

(assert (=> b!1518459 m!1401773))

(declare-fun m!1401797 () Bool)

(assert (=> b!1518459 m!1401797))

(assert (=> b!1518459 m!1401789))

(assert (=> b!1518459 m!1401791))

(declare-fun m!1401799 () Bool)

(assert (=> b!1518459 m!1401799))

(assert (=> b!1518457 m!1401773))

(assert (=> b!1518457 m!1401773))

(declare-fun m!1401801 () Bool)

(assert (=> b!1518457 m!1401801))

(assert (=> b!1518457 m!1401801))

(assert (=> b!1518457 m!1401773))

(declare-fun m!1401803 () Bool)

(assert (=> b!1518457 m!1401803))

(push 1)

