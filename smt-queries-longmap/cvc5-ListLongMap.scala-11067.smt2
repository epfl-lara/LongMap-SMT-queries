; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129234 () Bool)

(assert start!129234)

(declare-fun b!1517318 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101090 0))(
  ( (array!101091 (arr!48782 (Array (_ BitVec 32) (_ BitVec 64))) (size!49332 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101090)

(declare-fun e!846560 () Bool)

(declare-datatypes ((SeekEntryResult!12953 0))(
  ( (MissingZero!12953 (index!54207 (_ BitVec 32))) (Found!12953 (index!54208 (_ BitVec 32))) (Intermediate!12953 (undefined!13765 Bool) (index!54209 (_ BitVec 32)) (x!135895 (_ BitVec 32))) (Undefined!12953) (MissingVacant!12953 (index!54210 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101090 (_ BitVec 32)) SeekEntryResult!12953)

(assert (=> b!1517318 (= e!846560 (= (seekEntry!0 (select (arr!48782 a!2804) j!70) a!2804 mask!2512) (Found!12953 j!70)))))

(declare-fun res!1037225 () Bool)

(declare-fun e!846558 () Bool)

(assert (=> start!129234 (=> (not res!1037225) (not e!846558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129234 (= res!1037225 (validMask!0 mask!2512))))

(assert (=> start!129234 e!846558))

(assert (=> start!129234 true))

(declare-fun array_inv!37810 (array!101090) Bool)

(assert (=> start!129234 (array_inv!37810 a!2804)))

(declare-fun b!1517319 () Bool)

(declare-fun e!846561 () Bool)

(assert (=> b!1517319 (= e!846558 e!846561)))

(declare-fun res!1037227 () Bool)

(assert (=> b!1517319 (=> (not res!1037227) (not e!846561))))

(declare-fun lt!657742 () SeekEntryResult!12953)

(declare-fun lt!657738 () SeekEntryResult!12953)

(assert (=> b!1517319 (= res!1037227 (= lt!657742 lt!657738))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517319 (= lt!657738 (Intermediate!12953 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101090 (_ BitVec 32)) SeekEntryResult!12953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517319 (= lt!657742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48782 a!2804) j!70) mask!2512) (select (arr!48782 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517320 () Bool)

(declare-fun res!1037221 () Bool)

(assert (=> b!1517320 (=> (not res!1037221) (not e!846558))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517320 (= res!1037221 (validKeyInArray!0 (select (arr!48782 a!2804) i!961)))))

(declare-fun b!1517321 () Bool)

(declare-fun res!1037222 () Bool)

(assert (=> b!1517321 (=> (not res!1037222) (not e!846558))))

(assert (=> b!1517321 (= res!1037222 (and (= (size!49332 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49332 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49332 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517322 () Bool)

(declare-fun e!846562 () Bool)

(assert (=> b!1517322 (= e!846561 (not e!846562))))

(declare-fun res!1037228 () Bool)

(assert (=> b!1517322 (=> res!1037228 e!846562)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517322 (= res!1037228 (or (not (= (select (arr!48782 a!2804) j!70) (select (store (arr!48782 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517322 e!846560))

(declare-fun res!1037230 () Bool)

(assert (=> b!1517322 (=> (not res!1037230) (not e!846560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101090 (_ BitVec 32)) Bool)

(assert (=> b!1517322 (= res!1037230 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50774 0))(
  ( (Unit!50775) )
))
(declare-fun lt!657740 () Unit!50774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50774)

(assert (=> b!1517322 (= lt!657740 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517323 () Bool)

(declare-fun e!846559 () Bool)

(assert (=> b!1517323 (= e!846562 e!846559)))

(declare-fun res!1037224 () Bool)

(assert (=> b!1517323 (=> res!1037224 e!846559)))

(declare-fun lt!657739 () (_ BitVec 32))

(assert (=> b!1517323 (= res!1037224 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657739 #b00000000000000000000000000000000) (bvsge lt!657739 (size!49332 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517323 (= lt!657739 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517324 () Bool)

(declare-fun res!1037229 () Bool)

(assert (=> b!1517324 (=> (not res!1037229) (not e!846558))))

(assert (=> b!1517324 (= res!1037229 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49332 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49332 a!2804))))))

(declare-fun b!1517325 () Bool)

(assert (=> b!1517325 (= e!846559 true)))

(declare-fun lt!657741 () SeekEntryResult!12953)

(assert (=> b!1517325 (= lt!657741 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657739 (select (arr!48782 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517326 () Bool)

(declare-fun res!1037232 () Bool)

(assert (=> b!1517326 (=> (not res!1037232) (not e!846561))))

(assert (=> b!1517326 (= res!1037232 (= lt!657742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48782 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48782 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101091 (store (arr!48782 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49332 a!2804)) mask!2512)))))

(declare-fun b!1517327 () Bool)

(declare-fun res!1037231 () Bool)

(assert (=> b!1517327 (=> (not res!1037231) (not e!846558))))

(declare-datatypes ((List!35265 0))(
  ( (Nil!35262) (Cons!35261 (h!36673 (_ BitVec 64)) (t!49959 List!35265)) )
))
(declare-fun arrayNoDuplicates!0 (array!101090 (_ BitVec 32) List!35265) Bool)

(assert (=> b!1517327 (= res!1037231 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35262))))

(declare-fun b!1517328 () Bool)

(declare-fun res!1037233 () Bool)

(assert (=> b!1517328 (=> (not res!1037233) (not e!846558))))

(assert (=> b!1517328 (= res!1037233 (validKeyInArray!0 (select (arr!48782 a!2804) j!70)))))

(declare-fun b!1517329 () Bool)

(declare-fun res!1037226 () Bool)

(assert (=> b!1517329 (=> (not res!1037226) (not e!846561))))

(assert (=> b!1517329 (= res!1037226 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48782 a!2804) j!70) a!2804 mask!2512) lt!657738))))

(declare-fun b!1517330 () Bool)

(declare-fun res!1037223 () Bool)

(assert (=> b!1517330 (=> (not res!1037223) (not e!846558))))

(assert (=> b!1517330 (= res!1037223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129234 res!1037225) b!1517321))

(assert (= (and b!1517321 res!1037222) b!1517320))

(assert (= (and b!1517320 res!1037221) b!1517328))

(assert (= (and b!1517328 res!1037233) b!1517330))

(assert (= (and b!1517330 res!1037223) b!1517327))

(assert (= (and b!1517327 res!1037231) b!1517324))

(assert (= (and b!1517324 res!1037229) b!1517319))

(assert (= (and b!1517319 res!1037227) b!1517329))

(assert (= (and b!1517329 res!1037226) b!1517326))

(assert (= (and b!1517326 res!1037232) b!1517322))

(assert (= (and b!1517322 res!1037230) b!1517318))

(assert (= (and b!1517322 (not res!1037228)) b!1517323))

(assert (= (and b!1517323 (not res!1037224)) b!1517325))

(declare-fun m!1400605 () Bool)

(assert (=> b!1517323 m!1400605))

(declare-fun m!1400607 () Bool)

(assert (=> b!1517319 m!1400607))

(assert (=> b!1517319 m!1400607))

(declare-fun m!1400609 () Bool)

(assert (=> b!1517319 m!1400609))

(assert (=> b!1517319 m!1400609))

(assert (=> b!1517319 m!1400607))

(declare-fun m!1400611 () Bool)

(assert (=> b!1517319 m!1400611))

(declare-fun m!1400613 () Bool)

(assert (=> b!1517320 m!1400613))

(assert (=> b!1517320 m!1400613))

(declare-fun m!1400615 () Bool)

(assert (=> b!1517320 m!1400615))

(assert (=> b!1517329 m!1400607))

(assert (=> b!1517329 m!1400607))

(declare-fun m!1400617 () Bool)

(assert (=> b!1517329 m!1400617))

(assert (=> b!1517318 m!1400607))

(assert (=> b!1517318 m!1400607))

(declare-fun m!1400619 () Bool)

(assert (=> b!1517318 m!1400619))

(declare-fun m!1400621 () Bool)

(assert (=> b!1517326 m!1400621))

(declare-fun m!1400623 () Bool)

(assert (=> b!1517326 m!1400623))

(assert (=> b!1517326 m!1400623))

(declare-fun m!1400625 () Bool)

(assert (=> b!1517326 m!1400625))

(assert (=> b!1517326 m!1400625))

(assert (=> b!1517326 m!1400623))

(declare-fun m!1400627 () Bool)

(assert (=> b!1517326 m!1400627))

(assert (=> b!1517322 m!1400607))

(declare-fun m!1400629 () Bool)

(assert (=> b!1517322 m!1400629))

(assert (=> b!1517322 m!1400621))

(assert (=> b!1517322 m!1400623))

(declare-fun m!1400631 () Bool)

(assert (=> b!1517322 m!1400631))

(declare-fun m!1400633 () Bool)

(assert (=> b!1517330 m!1400633))

(assert (=> b!1517328 m!1400607))

(assert (=> b!1517328 m!1400607))

(declare-fun m!1400635 () Bool)

(assert (=> b!1517328 m!1400635))

(declare-fun m!1400637 () Bool)

(assert (=> start!129234 m!1400637))

(declare-fun m!1400639 () Bool)

(assert (=> start!129234 m!1400639))

(declare-fun m!1400641 () Bool)

(assert (=> b!1517327 m!1400641))

(assert (=> b!1517325 m!1400607))

(assert (=> b!1517325 m!1400607))

(declare-fun m!1400643 () Bool)

(assert (=> b!1517325 m!1400643))

(push 1)

