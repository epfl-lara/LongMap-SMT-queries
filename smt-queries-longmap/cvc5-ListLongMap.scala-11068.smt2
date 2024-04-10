; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129240 () Bool)

(assert start!129240)

(declare-fun b!1517435 () Bool)

(declare-fun res!1037346 () Bool)

(declare-fun e!846614 () Bool)

(assert (=> b!1517435 (=> (not res!1037346) (not e!846614))))

(declare-datatypes ((array!101096 0))(
  ( (array!101097 (arr!48785 (Array (_ BitVec 32) (_ BitVec 64))) (size!49335 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101096)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517435 (= res!1037346 (validKeyInArray!0 (select (arr!48785 a!2804) j!70)))))

(declare-fun b!1517436 () Bool)

(declare-fun res!1037341 () Bool)

(declare-fun e!846616 () Bool)

(assert (=> b!1517436 (=> (not res!1037341) (not e!846616))))

(declare-datatypes ((SeekEntryResult!12956 0))(
  ( (MissingZero!12956 (index!54219 (_ BitVec 32))) (Found!12956 (index!54220 (_ BitVec 32))) (Intermediate!12956 (undefined!13768 Bool) (index!54221 (_ BitVec 32)) (x!135906 (_ BitVec 32))) (Undefined!12956) (MissingVacant!12956 (index!54222 (_ BitVec 32))) )
))
(declare-fun lt!657785 () SeekEntryResult!12956)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101096 (_ BitVec 32)) SeekEntryResult!12956)

(assert (=> b!1517436 (= res!1037341 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48785 a!2804) j!70) a!2804 mask!2512) lt!657785))))

(declare-fun b!1517437 () Bool)

(declare-fun res!1037339 () Bool)

(assert (=> b!1517437 (=> (not res!1037339) (not e!846614))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517437 (= res!1037339 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49335 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49335 a!2804))))))

(declare-fun b!1517438 () Bool)

(declare-fun res!1037348 () Bool)

(assert (=> b!1517438 (=> (not res!1037348) (not e!846614))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517438 (= res!1037348 (validKeyInArray!0 (select (arr!48785 a!2804) i!961)))))

(declare-fun b!1517439 () Bool)

(declare-fun e!846613 () Bool)

(assert (=> b!1517439 (= e!846616 (not e!846613))))

(declare-fun res!1037340 () Bool)

(assert (=> b!1517439 (=> res!1037340 e!846613)))

(assert (=> b!1517439 (= res!1037340 (or (not (= (select (arr!48785 a!2804) j!70) (select (store (arr!48785 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846611 () Bool)

(assert (=> b!1517439 e!846611))

(declare-fun res!1037347 () Bool)

(assert (=> b!1517439 (=> (not res!1037347) (not e!846611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101096 (_ BitVec 32)) Bool)

(assert (=> b!1517439 (= res!1037347 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50780 0))(
  ( (Unit!50781) )
))
(declare-fun lt!657787 () Unit!50780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50780)

(assert (=> b!1517439 (= lt!657787 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517440 () Bool)

(declare-fun res!1037349 () Bool)

(assert (=> b!1517440 (=> (not res!1037349) (not e!846614))))

(assert (=> b!1517440 (= res!1037349 (and (= (size!49335 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49335 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49335 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517441 () Bool)

(declare-fun res!1037343 () Bool)

(assert (=> b!1517441 (=> (not res!1037343) (not e!846614))))

(declare-datatypes ((List!35268 0))(
  ( (Nil!35265) (Cons!35264 (h!36676 (_ BitVec 64)) (t!49962 List!35268)) )
))
(declare-fun arrayNoDuplicates!0 (array!101096 (_ BitVec 32) List!35268) Bool)

(assert (=> b!1517441 (= res!1037343 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35265))))

(declare-fun res!1037344 () Bool)

(assert (=> start!129240 (=> (not res!1037344) (not e!846614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129240 (= res!1037344 (validMask!0 mask!2512))))

(assert (=> start!129240 e!846614))

(assert (=> start!129240 true))

(declare-fun array_inv!37813 (array!101096) Bool)

(assert (=> start!129240 (array_inv!37813 a!2804)))

(declare-fun b!1517442 () Bool)

(declare-fun res!1037342 () Bool)

(assert (=> b!1517442 (=> (not res!1037342) (not e!846614))))

(assert (=> b!1517442 (= res!1037342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517443 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101096 (_ BitVec 32)) SeekEntryResult!12956)

(assert (=> b!1517443 (= e!846611 (= (seekEntry!0 (select (arr!48785 a!2804) j!70) a!2804 mask!2512) (Found!12956 j!70)))))

(declare-fun b!1517444 () Bool)

(declare-fun e!846612 () Bool)

(assert (=> b!1517444 (= e!846612 true)))

(declare-fun lt!657784 () (_ BitVec 32))

(declare-fun lt!657786 () SeekEntryResult!12956)

(assert (=> b!1517444 (= lt!657786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657784 (select (arr!48785 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517445 () Bool)

(declare-fun res!1037338 () Bool)

(assert (=> b!1517445 (=> (not res!1037338) (not e!846616))))

(declare-fun lt!657783 () SeekEntryResult!12956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517445 (= res!1037338 (= lt!657783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48785 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48785 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101097 (store (arr!48785 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49335 a!2804)) mask!2512)))))

(declare-fun b!1517446 () Bool)

(assert (=> b!1517446 (= e!846613 e!846612)))

(declare-fun res!1037345 () Bool)

(assert (=> b!1517446 (=> res!1037345 e!846612)))

(assert (=> b!1517446 (= res!1037345 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657784 #b00000000000000000000000000000000) (bvsge lt!657784 (size!49335 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517446 (= lt!657784 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517447 () Bool)

(assert (=> b!1517447 (= e!846614 e!846616)))

(declare-fun res!1037350 () Bool)

(assert (=> b!1517447 (=> (not res!1037350) (not e!846616))))

(assert (=> b!1517447 (= res!1037350 (= lt!657783 lt!657785))))

(assert (=> b!1517447 (= lt!657785 (Intermediate!12956 false resIndex!21 resX!21))))

(assert (=> b!1517447 (= lt!657783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48785 a!2804) j!70) mask!2512) (select (arr!48785 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129240 res!1037344) b!1517440))

(assert (= (and b!1517440 res!1037349) b!1517438))

(assert (= (and b!1517438 res!1037348) b!1517435))

(assert (= (and b!1517435 res!1037346) b!1517442))

(assert (= (and b!1517442 res!1037342) b!1517441))

(assert (= (and b!1517441 res!1037343) b!1517437))

(assert (= (and b!1517437 res!1037339) b!1517447))

(assert (= (and b!1517447 res!1037350) b!1517436))

(assert (= (and b!1517436 res!1037341) b!1517445))

(assert (= (and b!1517445 res!1037338) b!1517439))

(assert (= (and b!1517439 res!1037347) b!1517443))

(assert (= (and b!1517439 (not res!1037340)) b!1517446))

(assert (= (and b!1517446 (not res!1037345)) b!1517444))

(declare-fun m!1400725 () Bool)

(assert (=> b!1517442 m!1400725))

(declare-fun m!1400727 () Bool)

(assert (=> b!1517438 m!1400727))

(assert (=> b!1517438 m!1400727))

(declare-fun m!1400729 () Bool)

(assert (=> b!1517438 m!1400729))

(declare-fun m!1400731 () Bool)

(assert (=> b!1517447 m!1400731))

(assert (=> b!1517447 m!1400731))

(declare-fun m!1400733 () Bool)

(assert (=> b!1517447 m!1400733))

(assert (=> b!1517447 m!1400733))

(assert (=> b!1517447 m!1400731))

(declare-fun m!1400735 () Bool)

(assert (=> b!1517447 m!1400735))

(assert (=> b!1517435 m!1400731))

(assert (=> b!1517435 m!1400731))

(declare-fun m!1400737 () Bool)

(assert (=> b!1517435 m!1400737))

(declare-fun m!1400739 () Bool)

(assert (=> start!129240 m!1400739))

(declare-fun m!1400741 () Bool)

(assert (=> start!129240 m!1400741))

(declare-fun m!1400743 () Bool)

(assert (=> b!1517445 m!1400743))

(declare-fun m!1400745 () Bool)

(assert (=> b!1517445 m!1400745))

(assert (=> b!1517445 m!1400745))

(declare-fun m!1400747 () Bool)

(assert (=> b!1517445 m!1400747))

(assert (=> b!1517445 m!1400747))

(assert (=> b!1517445 m!1400745))

(declare-fun m!1400749 () Bool)

(assert (=> b!1517445 m!1400749))

(assert (=> b!1517436 m!1400731))

(assert (=> b!1517436 m!1400731))

(declare-fun m!1400751 () Bool)

(assert (=> b!1517436 m!1400751))

(assert (=> b!1517444 m!1400731))

(assert (=> b!1517444 m!1400731))

(declare-fun m!1400753 () Bool)

(assert (=> b!1517444 m!1400753))

(declare-fun m!1400755 () Bool)

(assert (=> b!1517441 m!1400755))

(assert (=> b!1517439 m!1400731))

(declare-fun m!1400757 () Bool)

(assert (=> b!1517439 m!1400757))

(assert (=> b!1517439 m!1400743))

(assert (=> b!1517439 m!1400745))

(declare-fun m!1400759 () Bool)

(assert (=> b!1517439 m!1400759))

(assert (=> b!1517443 m!1400731))

(assert (=> b!1517443 m!1400731))

(declare-fun m!1400761 () Bool)

(assert (=> b!1517443 m!1400761))

(declare-fun m!1400763 () Bool)

(assert (=> b!1517446 m!1400763))

(push 1)

