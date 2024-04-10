; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129246 () Bool)

(assert start!129246)

(declare-fun res!1037460 () Bool)

(declare-fun e!846666 () Bool)

(assert (=> start!129246 (=> (not res!1037460) (not e!846666))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129246 (= res!1037460 (validMask!0 mask!2512))))

(assert (=> start!129246 e!846666))

(assert (=> start!129246 true))

(declare-datatypes ((array!101102 0))(
  ( (array!101103 (arr!48788 (Array (_ BitVec 32) (_ BitVec 64))) (size!49338 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101102)

(declare-fun array_inv!37816 (array!101102) Bool)

(assert (=> start!129246 (array_inv!37816 a!2804)))

(declare-fun b!1517552 () Bool)

(declare-fun res!1037463 () Bool)

(assert (=> b!1517552 (=> (not res!1037463) (not e!846666))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1517552 (= res!1037463 (and (= (size!49338 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49338 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49338 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517553 () Bool)

(declare-fun e!846669 () Bool)

(assert (=> b!1517553 (= e!846669 true)))

(declare-fun lt!657830 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12959 0))(
  ( (MissingZero!12959 (index!54231 (_ BitVec 32))) (Found!12959 (index!54232 (_ BitVec 32))) (Intermediate!12959 (undefined!13771 Bool) (index!54233 (_ BitVec 32)) (x!135917 (_ BitVec 32))) (Undefined!12959) (MissingVacant!12959 (index!54234 (_ BitVec 32))) )
))
(declare-fun lt!657828 () SeekEntryResult!12959)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101102 (_ BitVec 32)) SeekEntryResult!12959)

(assert (=> b!1517553 (= lt!657828 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657830 (select (arr!48788 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517554 () Bool)

(declare-fun res!1037461 () Bool)

(assert (=> b!1517554 (=> (not res!1037461) (not e!846666))))

(declare-datatypes ((List!35271 0))(
  ( (Nil!35268) (Cons!35267 (h!36679 (_ BitVec 64)) (t!49965 List!35271)) )
))
(declare-fun arrayNoDuplicates!0 (array!101102 (_ BitVec 32) List!35271) Bool)

(assert (=> b!1517554 (= res!1037461 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35268))))

(declare-fun b!1517555 () Bool)

(declare-fun res!1037459 () Bool)

(assert (=> b!1517555 (=> (not res!1037459) (not e!846666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517555 (= res!1037459 (validKeyInArray!0 (select (arr!48788 a!2804) i!961)))))

(declare-fun b!1517556 () Bool)

(declare-fun e!846670 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101102 (_ BitVec 32)) SeekEntryResult!12959)

(assert (=> b!1517556 (= e!846670 (= (seekEntry!0 (select (arr!48788 a!2804) j!70) a!2804 mask!2512) (Found!12959 j!70)))))

(declare-fun b!1517557 () Bool)

(declare-fun res!1037465 () Bool)

(assert (=> b!1517557 (=> (not res!1037465) (not e!846666))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517557 (= res!1037465 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49338 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49338 a!2804))))))

(declare-fun b!1517558 () Bool)

(declare-fun res!1037466 () Bool)

(declare-fun e!846665 () Bool)

(assert (=> b!1517558 (=> (not res!1037466) (not e!846665))))

(declare-fun lt!657831 () SeekEntryResult!12959)

(assert (=> b!1517558 (= res!1037466 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48788 a!2804) j!70) a!2804 mask!2512) lt!657831))))

(declare-fun b!1517559 () Bool)

(declare-fun e!846667 () Bool)

(assert (=> b!1517559 (= e!846667 e!846669)))

(declare-fun res!1037455 () Bool)

(assert (=> b!1517559 (=> res!1037455 e!846669)))

(assert (=> b!1517559 (= res!1037455 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657830 #b00000000000000000000000000000000) (bvsge lt!657830 (size!49338 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517559 (= lt!657830 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517560 () Bool)

(declare-fun res!1037467 () Bool)

(assert (=> b!1517560 (=> (not res!1037467) (not e!846665))))

(declare-fun lt!657829 () SeekEntryResult!12959)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517560 (= res!1037467 (= lt!657829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48788 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48788 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101103 (store (arr!48788 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49338 a!2804)) mask!2512)))))

(declare-fun b!1517561 () Bool)

(assert (=> b!1517561 (= e!846665 (not e!846667))))

(declare-fun res!1037458 () Bool)

(assert (=> b!1517561 (=> res!1037458 e!846667)))

(assert (=> b!1517561 (= res!1037458 (or (not (= (select (arr!48788 a!2804) j!70) (select (store (arr!48788 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517561 e!846670))

(declare-fun res!1037456 () Bool)

(assert (=> b!1517561 (=> (not res!1037456) (not e!846670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101102 (_ BitVec 32)) Bool)

(assert (=> b!1517561 (= res!1037456 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50786 0))(
  ( (Unit!50787) )
))
(declare-fun lt!657832 () Unit!50786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50786)

(assert (=> b!1517561 (= lt!657832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517562 () Bool)

(assert (=> b!1517562 (= e!846666 e!846665)))

(declare-fun res!1037464 () Bool)

(assert (=> b!1517562 (=> (not res!1037464) (not e!846665))))

(assert (=> b!1517562 (= res!1037464 (= lt!657829 lt!657831))))

(assert (=> b!1517562 (= lt!657831 (Intermediate!12959 false resIndex!21 resX!21))))

(assert (=> b!1517562 (= lt!657829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48788 a!2804) j!70) mask!2512) (select (arr!48788 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517563 () Bool)

(declare-fun res!1037457 () Bool)

(assert (=> b!1517563 (=> (not res!1037457) (not e!846666))))

(assert (=> b!1517563 (= res!1037457 (validKeyInArray!0 (select (arr!48788 a!2804) j!70)))))

(declare-fun b!1517564 () Bool)

(declare-fun res!1037462 () Bool)

(assert (=> b!1517564 (=> (not res!1037462) (not e!846666))))

(assert (=> b!1517564 (= res!1037462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129246 res!1037460) b!1517552))

(assert (= (and b!1517552 res!1037463) b!1517555))

(assert (= (and b!1517555 res!1037459) b!1517563))

(assert (= (and b!1517563 res!1037457) b!1517564))

(assert (= (and b!1517564 res!1037462) b!1517554))

(assert (= (and b!1517554 res!1037461) b!1517557))

(assert (= (and b!1517557 res!1037465) b!1517562))

(assert (= (and b!1517562 res!1037464) b!1517558))

(assert (= (and b!1517558 res!1037466) b!1517560))

(assert (= (and b!1517560 res!1037467) b!1517561))

(assert (= (and b!1517561 res!1037456) b!1517556))

(assert (= (and b!1517561 (not res!1037458)) b!1517559))

(assert (= (and b!1517559 (not res!1037455)) b!1517553))

(declare-fun m!1400845 () Bool)

(assert (=> b!1517564 m!1400845))

(declare-fun m!1400847 () Bool)

(assert (=> b!1517563 m!1400847))

(assert (=> b!1517563 m!1400847))

(declare-fun m!1400849 () Bool)

(assert (=> b!1517563 m!1400849))

(assert (=> b!1517556 m!1400847))

(assert (=> b!1517556 m!1400847))

(declare-fun m!1400851 () Bool)

(assert (=> b!1517556 m!1400851))

(assert (=> b!1517562 m!1400847))

(assert (=> b!1517562 m!1400847))

(declare-fun m!1400853 () Bool)

(assert (=> b!1517562 m!1400853))

(assert (=> b!1517562 m!1400853))

(assert (=> b!1517562 m!1400847))

(declare-fun m!1400855 () Bool)

(assert (=> b!1517562 m!1400855))

(declare-fun m!1400857 () Bool)

(assert (=> b!1517554 m!1400857))

(assert (=> b!1517553 m!1400847))

(assert (=> b!1517553 m!1400847))

(declare-fun m!1400859 () Bool)

(assert (=> b!1517553 m!1400859))

(assert (=> b!1517561 m!1400847))

(declare-fun m!1400861 () Bool)

(assert (=> b!1517561 m!1400861))

(declare-fun m!1400863 () Bool)

(assert (=> b!1517561 m!1400863))

(declare-fun m!1400865 () Bool)

(assert (=> b!1517561 m!1400865))

(declare-fun m!1400867 () Bool)

(assert (=> b!1517561 m!1400867))

(declare-fun m!1400869 () Bool)

(assert (=> b!1517555 m!1400869))

(assert (=> b!1517555 m!1400869))

(declare-fun m!1400871 () Bool)

(assert (=> b!1517555 m!1400871))

(declare-fun m!1400873 () Bool)

(assert (=> b!1517559 m!1400873))

(declare-fun m!1400875 () Bool)

(assert (=> start!129246 m!1400875))

(declare-fun m!1400877 () Bool)

(assert (=> start!129246 m!1400877))

(assert (=> b!1517560 m!1400863))

(assert (=> b!1517560 m!1400865))

(assert (=> b!1517560 m!1400865))

(declare-fun m!1400879 () Bool)

(assert (=> b!1517560 m!1400879))

(assert (=> b!1517560 m!1400879))

(assert (=> b!1517560 m!1400865))

(declare-fun m!1400881 () Bool)

(assert (=> b!1517560 m!1400881))

(assert (=> b!1517558 m!1400847))

(assert (=> b!1517558 m!1400847))

(declare-fun m!1400883 () Bool)

(assert (=> b!1517558 m!1400883))

(push 1)

