; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130074 () Bool)

(assert start!130074)

(declare-fun b!1526440 () Bool)

(declare-fun res!1044478 () Bool)

(declare-fun e!850837 () Bool)

(assert (=> b!1526440 (=> (not res!1044478) (not e!850837))))

(declare-datatypes ((array!101487 0))(
  ( (array!101488 (arr!48970 (Array (_ BitVec 32) (_ BitVec 64))) (size!49520 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101487)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526440 (= res!1044478 (validKeyInArray!0 (select (arr!48970 a!2804) j!70)))))

(declare-fun b!1526441 () Bool)

(declare-fun res!1044480 () Bool)

(declare-fun e!850836 () Bool)

(assert (=> b!1526441 (=> (not res!1044480) (not e!850836))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13135 0))(
  ( (MissingZero!13135 (index!54935 (_ BitVec 32))) (Found!13135 (index!54936 (_ BitVec 32))) (Intermediate!13135 (undefined!13947 Bool) (index!54937 (_ BitVec 32)) (x!136629 (_ BitVec 32))) (Undefined!13135) (MissingVacant!13135 (index!54938 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101487 (_ BitVec 32)) SeekEntryResult!13135)

(assert (=> b!1526441 (= res!1044480 (= (seekEntry!0 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) (Found!13135 j!70)))))

(declare-fun b!1526442 () Bool)

(declare-fun res!1044486 () Bool)

(assert (=> b!1526442 (=> (not res!1044486) (not e!850837))))

(declare-datatypes ((List!35453 0))(
  ( (Nil!35450) (Cons!35449 (h!36882 (_ BitVec 64)) (t!50147 List!35453)) )
))
(declare-fun arrayNoDuplicates!0 (array!101487 (_ BitVec 32) List!35453) Bool)

(assert (=> b!1526442 (= res!1044486 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35450))))

(declare-fun b!1526443 () Bool)

(declare-fun e!850832 () Bool)

(declare-fun e!850835 () Bool)

(assert (=> b!1526443 (= e!850832 e!850835)))

(declare-fun res!1044487 () Bool)

(assert (=> b!1526443 (=> (not res!1044487) (not e!850835))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101487 (_ BitVec 32)) SeekEntryResult!13135)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101487 (_ BitVec 32)) SeekEntryResult!13135)

(assert (=> b!1526443 (= res!1044487 (= (seekEntryOrOpen!0 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48970 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526444 () Bool)

(declare-fun e!850831 () Bool)

(assert (=> b!1526444 (= e!850831 (not true))))

(assert (=> b!1526444 e!850836))

(declare-fun res!1044481 () Bool)

(assert (=> b!1526444 (=> (not res!1044481) (not e!850836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101487 (_ BitVec 32)) Bool)

(assert (=> b!1526444 (= res!1044481 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51054 0))(
  ( (Unit!51055) )
))
(declare-fun lt!661074 () Unit!51054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51054)

(assert (=> b!1526444 (= lt!661074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526445 () Bool)

(declare-fun res!1044476 () Bool)

(assert (=> b!1526445 (=> (not res!1044476) (not e!850837))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526445 (= res!1044476 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49520 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49520 a!2804))))))

(declare-fun b!1526446 () Bool)

(declare-fun res!1044485 () Bool)

(assert (=> b!1526446 (=> (not res!1044485) (not e!850837))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526446 (= res!1044485 (and (= (size!49520 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49520 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49520 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526447 () Bool)

(declare-fun e!850833 () Bool)

(assert (=> b!1526447 (= e!850833 e!850831)))

(declare-fun res!1044484 () Bool)

(assert (=> b!1526447 (=> (not res!1044484) (not e!850831))))

(declare-fun lt!661078 () (_ BitVec 64))

(declare-fun lt!661077 () array!101487)

(declare-fun lt!661076 () SeekEntryResult!13135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101487 (_ BitVec 32)) SeekEntryResult!13135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526447 (= res!1044484 (= lt!661076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661078 mask!2512) lt!661078 lt!661077 mask!2512)))))

(assert (=> b!1526447 (= lt!661078 (select (store (arr!48970 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526447 (= lt!661077 (array!101488 (store (arr!48970 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49520 a!2804)))))

(declare-fun b!1526448 () Bool)

(assert (=> b!1526448 (= e!850837 e!850833)))

(declare-fun res!1044482 () Bool)

(assert (=> b!1526448 (=> (not res!1044482) (not e!850833))))

(declare-fun lt!661075 () SeekEntryResult!13135)

(assert (=> b!1526448 (= res!1044482 (= lt!661076 lt!661075))))

(assert (=> b!1526448 (= lt!661075 (Intermediate!13135 false resIndex!21 resX!21))))

(assert (=> b!1526448 (= lt!661076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48970 a!2804) j!70) mask!2512) (select (arr!48970 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526449 () Bool)

(assert (=> b!1526449 (= e!850835 (= (seekEntryOrOpen!0 lt!661078 lt!661077 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661078 lt!661077 mask!2512)))))

(declare-fun res!1044475 () Bool)

(assert (=> start!130074 (=> (not res!1044475) (not e!850837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130074 (= res!1044475 (validMask!0 mask!2512))))

(assert (=> start!130074 e!850837))

(assert (=> start!130074 true))

(declare-fun array_inv!37998 (array!101487) Bool)

(assert (=> start!130074 (array_inv!37998 a!2804)))

(declare-fun b!1526450 () Bool)

(declare-fun res!1044479 () Bool)

(assert (=> b!1526450 (=> (not res!1044479) (not e!850833))))

(assert (=> b!1526450 (= res!1044479 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) lt!661075))))

(declare-fun b!1526451 () Bool)

(declare-fun res!1044474 () Bool)

(assert (=> b!1526451 (=> (not res!1044474) (not e!850837))))

(assert (=> b!1526451 (= res!1044474 (validKeyInArray!0 (select (arr!48970 a!2804) i!961)))))

(declare-fun b!1526452 () Bool)

(assert (=> b!1526452 (= e!850836 e!850832)))

(declare-fun res!1044483 () Bool)

(assert (=> b!1526452 (=> res!1044483 e!850832)))

(assert (=> b!1526452 (= res!1044483 (or (not (= (select (arr!48970 a!2804) j!70) lt!661078)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48970 a!2804) index!487) (select (arr!48970 a!2804) j!70)) (not (= (select (arr!48970 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526453 () Bool)

(declare-fun res!1044477 () Bool)

(assert (=> b!1526453 (=> (not res!1044477) (not e!850837))))

(assert (=> b!1526453 (= res!1044477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130074 res!1044475) b!1526446))

(assert (= (and b!1526446 res!1044485) b!1526451))

(assert (= (and b!1526451 res!1044474) b!1526440))

(assert (= (and b!1526440 res!1044478) b!1526453))

(assert (= (and b!1526453 res!1044477) b!1526442))

(assert (= (and b!1526442 res!1044486) b!1526445))

(assert (= (and b!1526445 res!1044476) b!1526448))

(assert (= (and b!1526448 res!1044482) b!1526450))

(assert (= (and b!1526450 res!1044479) b!1526447))

(assert (= (and b!1526447 res!1044484) b!1526444))

(assert (= (and b!1526444 res!1044481) b!1526441))

(assert (= (and b!1526441 res!1044480) b!1526452))

(assert (= (and b!1526452 (not res!1044483)) b!1526443))

(assert (= (and b!1526443 res!1044487) b!1526449))

(declare-fun m!1409243 () Bool)

(assert (=> b!1526451 m!1409243))

(assert (=> b!1526451 m!1409243))

(declare-fun m!1409245 () Bool)

(assert (=> b!1526451 m!1409245))

(declare-fun m!1409247 () Bool)

(assert (=> b!1526453 m!1409247))

(declare-fun m!1409249 () Bool)

(assert (=> b!1526444 m!1409249))

(declare-fun m!1409251 () Bool)

(assert (=> b!1526444 m!1409251))

(declare-fun m!1409253 () Bool)

(assert (=> b!1526443 m!1409253))

(assert (=> b!1526443 m!1409253))

(declare-fun m!1409255 () Bool)

(assert (=> b!1526443 m!1409255))

(assert (=> b!1526443 m!1409253))

(declare-fun m!1409257 () Bool)

(assert (=> b!1526443 m!1409257))

(assert (=> b!1526450 m!1409253))

(assert (=> b!1526450 m!1409253))

(declare-fun m!1409259 () Bool)

(assert (=> b!1526450 m!1409259))

(assert (=> b!1526441 m!1409253))

(assert (=> b!1526441 m!1409253))

(declare-fun m!1409261 () Bool)

(assert (=> b!1526441 m!1409261))

(assert (=> b!1526452 m!1409253))

(declare-fun m!1409263 () Bool)

(assert (=> b!1526452 m!1409263))

(declare-fun m!1409265 () Bool)

(assert (=> b!1526449 m!1409265))

(declare-fun m!1409267 () Bool)

(assert (=> b!1526449 m!1409267))

(declare-fun m!1409269 () Bool)

(assert (=> b!1526447 m!1409269))

(assert (=> b!1526447 m!1409269))

(declare-fun m!1409271 () Bool)

(assert (=> b!1526447 m!1409271))

(declare-fun m!1409273 () Bool)

(assert (=> b!1526447 m!1409273))

(declare-fun m!1409275 () Bool)

(assert (=> b!1526447 m!1409275))

(declare-fun m!1409277 () Bool)

(assert (=> b!1526442 m!1409277))

(declare-fun m!1409279 () Bool)

(assert (=> start!130074 m!1409279))

(declare-fun m!1409281 () Bool)

(assert (=> start!130074 m!1409281))

(assert (=> b!1526448 m!1409253))

(assert (=> b!1526448 m!1409253))

(declare-fun m!1409283 () Bool)

(assert (=> b!1526448 m!1409283))

(assert (=> b!1526448 m!1409283))

(assert (=> b!1526448 m!1409253))

(declare-fun m!1409285 () Bool)

(assert (=> b!1526448 m!1409285))

(assert (=> b!1526440 m!1409253))

(assert (=> b!1526440 m!1409253))

(declare-fun m!1409287 () Bool)

(assert (=> b!1526440 m!1409287))

(push 1)

