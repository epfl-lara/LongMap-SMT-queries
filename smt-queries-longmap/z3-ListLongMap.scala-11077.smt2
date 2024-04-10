; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129296 () Bool)

(assert start!129296)

(declare-fun b!1518532 () Bool)

(declare-fun res!1038444 () Bool)

(declare-fun e!847126 () Bool)

(assert (=> b!1518532 (=> (not res!1038444) (not e!847126))))

(declare-datatypes ((array!101152 0))(
  ( (array!101153 (arr!48813 (Array (_ BitVec 32) (_ BitVec 64))) (size!49363 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101152)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518532 (= res!1038444 (validKeyInArray!0 (select (arr!48813 a!2804) i!961)))))

(declare-fun res!1038436 () Bool)

(assert (=> start!129296 (=> (not res!1038436) (not e!847126))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129296 (= res!1038436 (validMask!0 mask!2512))))

(assert (=> start!129296 e!847126))

(assert (=> start!129296 true))

(declare-fun array_inv!37841 (array!101152) Bool)

(assert (=> start!129296 (array_inv!37841 a!2804)))

(declare-fun b!1518533 () Bool)

(declare-fun res!1038443 () Bool)

(assert (=> b!1518533 (=> (not res!1038443) (not e!847126))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518533 (= res!1038443 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49363 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49363 a!2804))))))

(declare-fun b!1518534 () Bool)

(declare-fun res!1038448 () Bool)

(assert (=> b!1518534 (=> (not res!1038448) (not e!847126))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1518534 (= res!1038448 (and (= (size!49363 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49363 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49363 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518535 () Bool)

(declare-fun e!847123 () Bool)

(assert (=> b!1518535 (= e!847123 true)))

(declare-fun lt!658218 () array!101152)

(declare-fun lt!658214 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12984 0))(
  ( (MissingZero!12984 (index!54331 (_ BitVec 32))) (Found!12984 (index!54332 (_ BitVec 32))) (Intermediate!12984 (undefined!13796 Bool) (index!54333 (_ BitVec 32)) (x!136006 (_ BitVec 32))) (Undefined!12984) (MissingVacant!12984 (index!54334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!12984)

(assert (=> b!1518535 (= (seekEntryOrOpen!0 (select (arr!48813 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658214 lt!658218 mask!2512))))

(declare-fun lt!658213 () (_ BitVec 32))

(declare-datatypes ((Unit!50836 0))(
  ( (Unit!50837) )
))
(declare-fun lt!658215 () Unit!50836)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50836)

(assert (=> b!1518535 (= lt!658215 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658213 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518536 () Bool)

(declare-fun e!847120 () Bool)

(declare-fun e!847125 () Bool)

(assert (=> b!1518536 (= e!847120 (not e!847125))))

(declare-fun res!1038446 () Bool)

(assert (=> b!1518536 (=> res!1038446 e!847125)))

(assert (=> b!1518536 (= res!1038446 (or (not (= (select (arr!48813 a!2804) j!70) lt!658214)) (= x!534 resX!21)))))

(declare-fun e!847121 () Bool)

(assert (=> b!1518536 e!847121))

(declare-fun res!1038438 () Bool)

(assert (=> b!1518536 (=> (not res!1038438) (not e!847121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101152 (_ BitVec 32)) Bool)

(assert (=> b!1518536 (= res!1038438 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658216 () Unit!50836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50836)

(assert (=> b!1518536 (= lt!658216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518537 () Bool)

(declare-fun res!1038437 () Bool)

(assert (=> b!1518537 (=> res!1038437 e!847123)))

(declare-fun lt!658217 () SeekEntryResult!12984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!12984)

(assert (=> b!1518537 (= res!1038437 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658213 (select (arr!48813 a!2804) j!70) a!2804 mask!2512) lt!658217)))))

(declare-fun b!1518538 () Bool)

(declare-fun e!847122 () Bool)

(assert (=> b!1518538 (= e!847122 e!847120)))

(declare-fun res!1038439 () Bool)

(assert (=> b!1518538 (=> (not res!1038439) (not e!847120))))

(declare-fun lt!658219 () SeekEntryResult!12984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518538 (= res!1038439 (= lt!658219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658214 mask!2512) lt!658214 lt!658218 mask!2512)))))

(assert (=> b!1518538 (= lt!658214 (select (store (arr!48813 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518538 (= lt!658218 (array!101153 (store (arr!48813 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49363 a!2804)))))

(declare-fun b!1518539 () Bool)

(declare-fun res!1038441 () Bool)

(assert (=> b!1518539 (=> (not res!1038441) (not e!847126))))

(assert (=> b!1518539 (= res!1038441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518540 () Bool)

(assert (=> b!1518540 (= e!847126 e!847122)))

(declare-fun res!1038440 () Bool)

(assert (=> b!1518540 (=> (not res!1038440) (not e!847122))))

(assert (=> b!1518540 (= res!1038440 (= lt!658219 lt!658217))))

(assert (=> b!1518540 (= lt!658217 (Intermediate!12984 false resIndex!21 resX!21))))

(assert (=> b!1518540 (= lt!658219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48813 a!2804) j!70) mask!2512) (select (arr!48813 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518541 () Bool)

(declare-fun res!1038447 () Bool)

(assert (=> b!1518541 (=> (not res!1038447) (not e!847122))))

(assert (=> b!1518541 (= res!1038447 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48813 a!2804) j!70) a!2804 mask!2512) lt!658217))))

(declare-fun b!1518542 () Bool)

(declare-fun res!1038435 () Bool)

(assert (=> b!1518542 (=> (not res!1038435) (not e!847126))))

(assert (=> b!1518542 (= res!1038435 (validKeyInArray!0 (select (arr!48813 a!2804) j!70)))))

(declare-fun b!1518543 () Bool)

(declare-fun res!1038445 () Bool)

(assert (=> b!1518543 (=> (not res!1038445) (not e!847126))))

(declare-datatypes ((List!35296 0))(
  ( (Nil!35293) (Cons!35292 (h!36704 (_ BitVec 64)) (t!49990 List!35296)) )
))
(declare-fun arrayNoDuplicates!0 (array!101152 (_ BitVec 32) List!35296) Bool)

(assert (=> b!1518543 (= res!1038445 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35293))))

(declare-fun b!1518544 () Bool)

(assert (=> b!1518544 (= e!847125 e!847123)))

(declare-fun res!1038442 () Bool)

(assert (=> b!1518544 (=> res!1038442 e!847123)))

(assert (=> b!1518544 (= res!1038442 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658213 #b00000000000000000000000000000000) (bvsge lt!658213 (size!49363 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518544 (= lt!658213 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518545 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!12984)

(assert (=> b!1518545 (= e!847121 (= (seekEntry!0 (select (arr!48813 a!2804) j!70) a!2804 mask!2512) (Found!12984 j!70)))))

(assert (= (and start!129296 res!1038436) b!1518534))

(assert (= (and b!1518534 res!1038448) b!1518532))

(assert (= (and b!1518532 res!1038444) b!1518542))

(assert (= (and b!1518542 res!1038435) b!1518539))

(assert (= (and b!1518539 res!1038441) b!1518543))

(assert (= (and b!1518543 res!1038445) b!1518533))

(assert (= (and b!1518533 res!1038443) b!1518540))

(assert (= (and b!1518540 res!1038440) b!1518541))

(assert (= (and b!1518541 res!1038447) b!1518538))

(assert (= (and b!1518538 res!1038439) b!1518536))

(assert (= (and b!1518536 res!1038438) b!1518545))

(assert (= (and b!1518536 (not res!1038446)) b!1518544))

(assert (= (and b!1518544 (not res!1038442)) b!1518537))

(assert (= (and b!1518537 (not res!1038437)) b!1518535))

(declare-fun m!1401851 () Bool)

(assert (=> b!1518537 m!1401851))

(assert (=> b!1518537 m!1401851))

(declare-fun m!1401853 () Bool)

(assert (=> b!1518537 m!1401853))

(assert (=> b!1518535 m!1401851))

(assert (=> b!1518535 m!1401851))

(declare-fun m!1401855 () Bool)

(assert (=> b!1518535 m!1401855))

(declare-fun m!1401857 () Bool)

(assert (=> b!1518535 m!1401857))

(declare-fun m!1401859 () Bool)

(assert (=> b!1518535 m!1401859))

(declare-fun m!1401861 () Bool)

(assert (=> b!1518539 m!1401861))

(declare-fun m!1401863 () Bool)

(assert (=> b!1518532 m!1401863))

(assert (=> b!1518532 m!1401863))

(declare-fun m!1401865 () Bool)

(assert (=> b!1518532 m!1401865))

(declare-fun m!1401867 () Bool)

(assert (=> b!1518538 m!1401867))

(assert (=> b!1518538 m!1401867))

(declare-fun m!1401869 () Bool)

(assert (=> b!1518538 m!1401869))

(declare-fun m!1401871 () Bool)

(assert (=> b!1518538 m!1401871))

(declare-fun m!1401873 () Bool)

(assert (=> b!1518538 m!1401873))

(assert (=> b!1518545 m!1401851))

(assert (=> b!1518545 m!1401851))

(declare-fun m!1401875 () Bool)

(assert (=> b!1518545 m!1401875))

(declare-fun m!1401877 () Bool)

(assert (=> start!129296 m!1401877))

(declare-fun m!1401879 () Bool)

(assert (=> start!129296 m!1401879))

(declare-fun m!1401881 () Bool)

(assert (=> b!1518544 m!1401881))

(assert (=> b!1518542 m!1401851))

(assert (=> b!1518542 m!1401851))

(declare-fun m!1401883 () Bool)

(assert (=> b!1518542 m!1401883))

(assert (=> b!1518541 m!1401851))

(assert (=> b!1518541 m!1401851))

(declare-fun m!1401885 () Bool)

(assert (=> b!1518541 m!1401885))

(assert (=> b!1518540 m!1401851))

(assert (=> b!1518540 m!1401851))

(declare-fun m!1401887 () Bool)

(assert (=> b!1518540 m!1401887))

(assert (=> b!1518540 m!1401887))

(assert (=> b!1518540 m!1401851))

(declare-fun m!1401889 () Bool)

(assert (=> b!1518540 m!1401889))

(declare-fun m!1401891 () Bool)

(assert (=> b!1518543 m!1401891))

(assert (=> b!1518536 m!1401851))

(declare-fun m!1401893 () Bool)

(assert (=> b!1518536 m!1401893))

(declare-fun m!1401895 () Bool)

(assert (=> b!1518536 m!1401895))

(check-sat (not b!1518542) (not b!1518543) (not b!1518540) (not b!1518538) (not b!1518539) (not start!129296) (not b!1518535) (not b!1518532) (not b!1518541) (not b!1518544) (not b!1518545) (not b!1518537) (not b!1518536))
(check-sat)
