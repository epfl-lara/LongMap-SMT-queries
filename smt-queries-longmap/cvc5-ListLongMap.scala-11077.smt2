; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129294 () Bool)

(assert start!129294)

(declare-fun b!1518490 () Bool)

(declare-fun e!847099 () Bool)

(assert (=> b!1518490 (= e!847099 true)))

(declare-datatypes ((array!101150 0))(
  ( (array!101151 (arr!48812 (Array (_ BitVec 32) (_ BitVec 64))) (size!49362 (_ BitVec 32))) )
))
(declare-fun lt!658192 () array!101150)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun a!2804 () array!101150)

(declare-fun lt!658198 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12983 0))(
  ( (MissingZero!12983 (index!54327 (_ BitVec 32))) (Found!12983 (index!54328 (_ BitVec 32))) (Intermediate!12983 (undefined!13795 Bool) (index!54329 (_ BitVec 32)) (x!136005 (_ BitVec 32))) (Undefined!12983) (MissingVacant!12983 (index!54330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101150 (_ BitVec 32)) SeekEntryResult!12983)

(assert (=> b!1518490 (= (seekEntryOrOpen!0 (select (arr!48812 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658198 lt!658192 mask!2512))))

(declare-fun lt!658194 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((Unit!50834 0))(
  ( (Unit!50835) )
))
(declare-fun lt!658197 () Unit!50834)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50834)

(assert (=> b!1518490 (= lt!658197 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658194 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518491 () Bool)

(declare-fun e!847100 () Bool)

(assert (=> b!1518491 (= e!847100 e!847099)))

(declare-fun res!1038401 () Bool)

(assert (=> b!1518491 (=> res!1038401 e!847099)))

(assert (=> b!1518491 (= res!1038401 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658194 #b00000000000000000000000000000000) (bvsge lt!658194 (size!49362 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518491 (= lt!658194 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518492 () Bool)

(declare-fun res!1038394 () Bool)

(assert (=> b!1518492 (=> res!1038394 e!847099)))

(declare-fun lt!658195 () SeekEntryResult!12983)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101150 (_ BitVec 32)) SeekEntryResult!12983)

(assert (=> b!1518492 (= res!1038394 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658194 (select (arr!48812 a!2804) j!70) a!2804 mask!2512) lt!658195)))))

(declare-fun b!1518493 () Bool)

(declare-fun res!1038393 () Bool)

(declare-fun e!847105 () Bool)

(assert (=> b!1518493 (=> (not res!1038393) (not e!847105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518493 (= res!1038393 (validKeyInArray!0 (select (arr!48812 a!2804) j!70)))))

(declare-fun b!1518494 () Bool)

(declare-fun res!1038402 () Bool)

(declare-fun e!847102 () Bool)

(assert (=> b!1518494 (=> (not res!1038402) (not e!847102))))

(assert (=> b!1518494 (= res!1038402 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48812 a!2804) j!70) a!2804 mask!2512) lt!658195))))

(declare-fun b!1518496 () Bool)

(declare-fun res!1038397 () Bool)

(assert (=> b!1518496 (=> (not res!1038397) (not e!847105))))

(declare-datatypes ((List!35295 0))(
  ( (Nil!35292) (Cons!35291 (h!36703 (_ BitVec 64)) (t!49989 List!35295)) )
))
(declare-fun arrayNoDuplicates!0 (array!101150 (_ BitVec 32) List!35295) Bool)

(assert (=> b!1518496 (= res!1038397 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35292))))

(declare-fun b!1518497 () Bool)

(declare-fun res!1038405 () Bool)

(assert (=> b!1518497 (=> (not res!1038405) (not e!847105))))

(assert (=> b!1518497 (= res!1038405 (and (= (size!49362 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49362 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49362 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518498 () Bool)

(declare-fun e!847103 () Bool)

(assert (=> b!1518498 (= e!847103 (not e!847100))))

(declare-fun res!1038406 () Bool)

(assert (=> b!1518498 (=> res!1038406 e!847100)))

(assert (=> b!1518498 (= res!1038406 (or (not (= (select (arr!48812 a!2804) j!70) lt!658198)) (= x!534 resX!21)))))

(declare-fun e!847101 () Bool)

(assert (=> b!1518498 e!847101))

(declare-fun res!1038404 () Bool)

(assert (=> b!1518498 (=> (not res!1038404) (not e!847101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101150 (_ BitVec 32)) Bool)

(assert (=> b!1518498 (= res!1038404 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658193 () Unit!50834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50834)

(assert (=> b!1518498 (= lt!658193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518499 () Bool)

(declare-fun res!1038399 () Bool)

(assert (=> b!1518499 (=> (not res!1038399) (not e!847105))))

(assert (=> b!1518499 (= res!1038399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518500 () Bool)

(assert (=> b!1518500 (= e!847102 e!847103)))

(declare-fun res!1038398 () Bool)

(assert (=> b!1518500 (=> (not res!1038398) (not e!847103))))

(declare-fun lt!658196 () SeekEntryResult!12983)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518500 (= res!1038398 (= lt!658196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658198 mask!2512) lt!658198 lt!658192 mask!2512)))))

(assert (=> b!1518500 (= lt!658198 (select (store (arr!48812 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518500 (= lt!658192 (array!101151 (store (arr!48812 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49362 a!2804)))))

(declare-fun b!1518501 () Bool)

(assert (=> b!1518501 (= e!847105 e!847102)))

(declare-fun res!1038395 () Bool)

(assert (=> b!1518501 (=> (not res!1038395) (not e!847102))))

(assert (=> b!1518501 (= res!1038395 (= lt!658196 lt!658195))))

(assert (=> b!1518501 (= lt!658195 (Intermediate!12983 false resIndex!21 resX!21))))

(assert (=> b!1518501 (= lt!658196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48812 a!2804) j!70) mask!2512) (select (arr!48812 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518495 () Bool)

(declare-fun res!1038400 () Bool)

(assert (=> b!1518495 (=> (not res!1038400) (not e!847105))))

(assert (=> b!1518495 (= res!1038400 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49362 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49362 a!2804))))))

(declare-fun res!1038396 () Bool)

(assert (=> start!129294 (=> (not res!1038396) (not e!847105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129294 (= res!1038396 (validMask!0 mask!2512))))

(assert (=> start!129294 e!847105))

(assert (=> start!129294 true))

(declare-fun array_inv!37840 (array!101150) Bool)

(assert (=> start!129294 (array_inv!37840 a!2804)))

(declare-fun b!1518502 () Bool)

(declare-fun res!1038403 () Bool)

(assert (=> b!1518502 (=> (not res!1038403) (not e!847105))))

(assert (=> b!1518502 (= res!1038403 (validKeyInArray!0 (select (arr!48812 a!2804) i!961)))))

(declare-fun b!1518503 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101150 (_ BitVec 32)) SeekEntryResult!12983)

(assert (=> b!1518503 (= e!847101 (= (seekEntry!0 (select (arr!48812 a!2804) j!70) a!2804 mask!2512) (Found!12983 j!70)))))

(assert (= (and start!129294 res!1038396) b!1518497))

(assert (= (and b!1518497 res!1038405) b!1518502))

(assert (= (and b!1518502 res!1038403) b!1518493))

(assert (= (and b!1518493 res!1038393) b!1518499))

(assert (= (and b!1518499 res!1038399) b!1518496))

(assert (= (and b!1518496 res!1038397) b!1518495))

(assert (= (and b!1518495 res!1038400) b!1518501))

(assert (= (and b!1518501 res!1038395) b!1518494))

(assert (= (and b!1518494 res!1038402) b!1518500))

(assert (= (and b!1518500 res!1038398) b!1518498))

(assert (= (and b!1518498 res!1038404) b!1518503))

(assert (= (and b!1518498 (not res!1038406)) b!1518491))

(assert (= (and b!1518491 (not res!1038401)) b!1518492))

(assert (= (and b!1518492 (not res!1038394)) b!1518490))

(declare-fun m!1401805 () Bool)

(assert (=> b!1518501 m!1401805))

(assert (=> b!1518501 m!1401805))

(declare-fun m!1401807 () Bool)

(assert (=> b!1518501 m!1401807))

(assert (=> b!1518501 m!1401807))

(assert (=> b!1518501 m!1401805))

(declare-fun m!1401809 () Bool)

(assert (=> b!1518501 m!1401809))

(declare-fun m!1401811 () Bool)

(assert (=> b!1518502 m!1401811))

(assert (=> b!1518502 m!1401811))

(declare-fun m!1401813 () Bool)

(assert (=> b!1518502 m!1401813))

(declare-fun m!1401815 () Bool)

(assert (=> b!1518499 m!1401815))

(assert (=> b!1518493 m!1401805))

(assert (=> b!1518493 m!1401805))

(declare-fun m!1401817 () Bool)

(assert (=> b!1518493 m!1401817))

(assert (=> b!1518490 m!1401805))

(assert (=> b!1518490 m!1401805))

(declare-fun m!1401819 () Bool)

(assert (=> b!1518490 m!1401819))

(declare-fun m!1401821 () Bool)

(assert (=> b!1518490 m!1401821))

(declare-fun m!1401823 () Bool)

(assert (=> b!1518490 m!1401823))

(declare-fun m!1401825 () Bool)

(assert (=> b!1518491 m!1401825))

(declare-fun m!1401827 () Bool)

(assert (=> start!129294 m!1401827))

(declare-fun m!1401829 () Bool)

(assert (=> start!129294 m!1401829))

(assert (=> b!1518494 m!1401805))

(assert (=> b!1518494 m!1401805))

(declare-fun m!1401831 () Bool)

(assert (=> b!1518494 m!1401831))

(assert (=> b!1518503 m!1401805))

(assert (=> b!1518503 m!1401805))

(declare-fun m!1401833 () Bool)

(assert (=> b!1518503 m!1401833))

(declare-fun m!1401835 () Bool)

(assert (=> b!1518496 m!1401835))

(assert (=> b!1518492 m!1401805))

(assert (=> b!1518492 m!1401805))

(declare-fun m!1401837 () Bool)

(assert (=> b!1518492 m!1401837))

(declare-fun m!1401839 () Bool)

(assert (=> b!1518500 m!1401839))

(assert (=> b!1518500 m!1401839))

(declare-fun m!1401841 () Bool)

(assert (=> b!1518500 m!1401841))

(declare-fun m!1401843 () Bool)

(assert (=> b!1518500 m!1401843))

(declare-fun m!1401845 () Bool)

(assert (=> b!1518500 m!1401845))

(assert (=> b!1518498 m!1401805))

(declare-fun m!1401847 () Bool)

(assert (=> b!1518498 m!1401847))

(declare-fun m!1401849 () Bool)

(assert (=> b!1518498 m!1401849))

(push 1)

