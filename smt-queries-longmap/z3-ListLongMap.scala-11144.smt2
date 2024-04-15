; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130176 () Bool)

(assert start!130176)

(declare-fun b!1528312 () Bool)

(declare-fun e!851788 () Bool)

(declare-fun e!851785 () Bool)

(assert (=> b!1528312 (= e!851788 (not e!851785))))

(declare-fun res!1046203 () Bool)

(assert (=> b!1528312 (=> res!1046203 e!851785)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101524 0))(
  ( (array!101525 (arr!48988 (Array (_ BitVec 32) (_ BitVec 64))) (size!49540 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101524)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!661841 () (_ BitVec 64))

(assert (=> b!1528312 (= res!1046203 (or (not (= (select (arr!48988 a!2804) j!70) lt!661841)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48988 a!2804) index!487) (select (arr!48988 a!2804) j!70)) (not (= (select (arr!48988 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851782 () Bool)

(assert (=> b!1528312 e!851782))

(declare-fun res!1046213 () Bool)

(assert (=> b!1528312 (=> (not res!1046213) (not e!851782))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101524 (_ BitVec 32)) Bool)

(assert (=> b!1528312 (= res!1046213 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50975 0))(
  ( (Unit!50976) )
))
(declare-fun lt!661836 () Unit!50975)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50975)

(assert (=> b!1528312 (= lt!661836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528313 () Bool)

(declare-fun res!1046207 () Bool)

(declare-fun e!851787 () Bool)

(assert (=> b!1528313 (=> (not res!1046207) (not e!851787))))

(assert (=> b!1528313 (= res!1046207 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49540 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49540 a!2804))))))

(declare-fun b!1528314 () Bool)

(declare-fun res!1046212 () Bool)

(assert (=> b!1528314 (=> (not res!1046212) (not e!851787))))

(assert (=> b!1528314 (= res!1046212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528315 () Bool)

(declare-fun e!851783 () Bool)

(assert (=> b!1528315 (= e!851787 e!851783)))

(declare-fun res!1046206 () Bool)

(assert (=> b!1528315 (=> (not res!1046206) (not e!851783))))

(declare-datatypes ((SeekEntryResult!13176 0))(
  ( (MissingZero!13176 (index!55099 (_ BitVec 32))) (Found!13176 (index!55100 (_ BitVec 32))) (Intermediate!13176 (undefined!13988 Bool) (index!55101 (_ BitVec 32)) (x!136794 (_ BitVec 32))) (Undefined!13176) (MissingVacant!13176 (index!55102 (_ BitVec 32))) )
))
(declare-fun lt!661838 () SeekEntryResult!13176)

(declare-fun lt!661840 () SeekEntryResult!13176)

(assert (=> b!1528315 (= res!1046206 (= lt!661838 lt!661840))))

(assert (=> b!1528315 (= lt!661840 (Intermediate!13176 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101524 (_ BitVec 32)) SeekEntryResult!13176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528315 (= lt!661838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48988 a!2804) j!70) mask!2512) (select (arr!48988 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528316 () Bool)

(assert (=> b!1528316 (= e!851783 e!851788)))

(declare-fun res!1046208 () Bool)

(assert (=> b!1528316 (=> (not res!1046208) (not e!851788))))

(declare-fun lt!661837 () array!101524)

(assert (=> b!1528316 (= res!1046208 (= lt!661838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661841 mask!2512) lt!661841 lt!661837 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528316 (= lt!661841 (select (store (arr!48988 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528316 (= lt!661837 (array!101525 (store (arr!48988 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49540 a!2804)))))

(declare-fun b!1528317 () Bool)

(declare-fun res!1046204 () Bool)

(assert (=> b!1528317 (=> (not res!1046204) (not e!851787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528317 (= res!1046204 (validKeyInArray!0 (select (arr!48988 a!2804) i!961)))))

(declare-fun b!1528318 () Bool)

(declare-fun e!851786 () Bool)

(declare-fun lt!661842 () SeekEntryResult!13176)

(declare-fun lt!661845 () SeekEntryResult!13176)

(assert (=> b!1528318 (= e!851786 (= lt!661842 lt!661845))))

(declare-fun lt!661839 () SeekEntryResult!13176)

(declare-fun lt!661843 () SeekEntryResult!13176)

(assert (=> b!1528318 (= lt!661839 lt!661843)))

(declare-fun lt!661844 () Unit!50975)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50975)

(assert (=> b!1528318 (= lt!661844 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun res!1046209 () Bool)

(assert (=> start!130176 (=> (not res!1046209) (not e!851787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130176 (= res!1046209 (validMask!0 mask!2512))))

(assert (=> start!130176 e!851787))

(assert (=> start!130176 true))

(declare-fun array_inv!38221 (array!101524) Bool)

(assert (=> start!130176 (array_inv!38221 a!2804)))

(declare-fun b!1528319 () Bool)

(assert (=> b!1528319 (= e!851785 e!851786)))

(declare-fun res!1046215 () Bool)

(assert (=> b!1528319 (=> res!1046215 e!851786)))

(assert (=> b!1528319 (= res!1046215 (not (= lt!661843 (Found!13176 j!70))))))

(assert (=> b!1528319 (= lt!661845 lt!661839)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101524 (_ BitVec 32)) SeekEntryResult!13176)

(assert (=> b!1528319 (= lt!661839 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661841 lt!661837 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101524 (_ BitVec 32)) SeekEntryResult!13176)

(assert (=> b!1528319 (= lt!661845 (seekEntryOrOpen!0 lt!661841 lt!661837 mask!2512))))

(assert (=> b!1528319 (= lt!661842 lt!661843)))

(assert (=> b!1528319 (= lt!661843 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48988 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528319 (= lt!661842 (seekEntryOrOpen!0 (select (arr!48988 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528320 () Bool)

(declare-fun res!1046214 () Bool)

(assert (=> b!1528320 (=> (not res!1046214) (not e!851787))))

(assert (=> b!1528320 (= res!1046214 (and (= (size!49540 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49540 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49540 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528321 () Bool)

(declare-fun res!1046205 () Bool)

(assert (=> b!1528321 (=> (not res!1046205) (not e!851783))))

(assert (=> b!1528321 (= res!1046205 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48988 a!2804) j!70) a!2804 mask!2512) lt!661840))))

(declare-fun b!1528322 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101524 (_ BitVec 32)) SeekEntryResult!13176)

(assert (=> b!1528322 (= e!851782 (= (seekEntry!0 (select (arr!48988 a!2804) j!70) a!2804 mask!2512) (Found!13176 j!70)))))

(declare-fun b!1528323 () Bool)

(declare-fun res!1046211 () Bool)

(assert (=> b!1528323 (=> (not res!1046211) (not e!851787))))

(assert (=> b!1528323 (= res!1046211 (validKeyInArray!0 (select (arr!48988 a!2804) j!70)))))

(declare-fun b!1528324 () Bool)

(declare-fun res!1046210 () Bool)

(assert (=> b!1528324 (=> (not res!1046210) (not e!851787))))

(declare-datatypes ((List!35549 0))(
  ( (Nil!35546) (Cons!35545 (h!36982 (_ BitVec 64)) (t!50235 List!35549)) )
))
(declare-fun arrayNoDuplicates!0 (array!101524 (_ BitVec 32) List!35549) Bool)

(assert (=> b!1528324 (= res!1046210 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35546))))

(assert (= (and start!130176 res!1046209) b!1528320))

(assert (= (and b!1528320 res!1046214) b!1528317))

(assert (= (and b!1528317 res!1046204) b!1528323))

(assert (= (and b!1528323 res!1046211) b!1528314))

(assert (= (and b!1528314 res!1046212) b!1528324))

(assert (= (and b!1528324 res!1046210) b!1528313))

(assert (= (and b!1528313 res!1046207) b!1528315))

(assert (= (and b!1528315 res!1046206) b!1528321))

(assert (= (and b!1528321 res!1046205) b!1528316))

(assert (= (and b!1528316 res!1046208) b!1528312))

(assert (= (and b!1528312 res!1046213) b!1528322))

(assert (= (and b!1528312 (not res!1046203)) b!1528319))

(assert (= (and b!1528319 (not res!1046215)) b!1528318))

(declare-fun m!1410611 () Bool)

(assert (=> b!1528315 m!1410611))

(assert (=> b!1528315 m!1410611))

(declare-fun m!1410613 () Bool)

(assert (=> b!1528315 m!1410613))

(assert (=> b!1528315 m!1410613))

(assert (=> b!1528315 m!1410611))

(declare-fun m!1410615 () Bool)

(assert (=> b!1528315 m!1410615))

(assert (=> b!1528322 m!1410611))

(assert (=> b!1528322 m!1410611))

(declare-fun m!1410617 () Bool)

(assert (=> b!1528322 m!1410617))

(declare-fun m!1410619 () Bool)

(assert (=> b!1528318 m!1410619))

(assert (=> b!1528312 m!1410611))

(declare-fun m!1410621 () Bool)

(assert (=> b!1528312 m!1410621))

(declare-fun m!1410623 () Bool)

(assert (=> b!1528312 m!1410623))

(declare-fun m!1410625 () Bool)

(assert (=> b!1528312 m!1410625))

(assert (=> b!1528321 m!1410611))

(assert (=> b!1528321 m!1410611))

(declare-fun m!1410627 () Bool)

(assert (=> b!1528321 m!1410627))

(declare-fun m!1410629 () Bool)

(assert (=> b!1528316 m!1410629))

(assert (=> b!1528316 m!1410629))

(declare-fun m!1410631 () Bool)

(assert (=> b!1528316 m!1410631))

(declare-fun m!1410633 () Bool)

(assert (=> b!1528316 m!1410633))

(declare-fun m!1410635 () Bool)

(assert (=> b!1528316 m!1410635))

(declare-fun m!1410637 () Bool)

(assert (=> b!1528317 m!1410637))

(assert (=> b!1528317 m!1410637))

(declare-fun m!1410639 () Bool)

(assert (=> b!1528317 m!1410639))

(assert (=> b!1528319 m!1410611))

(declare-fun m!1410641 () Bool)

(assert (=> b!1528319 m!1410641))

(assert (=> b!1528319 m!1410611))

(declare-fun m!1410643 () Bool)

(assert (=> b!1528319 m!1410643))

(declare-fun m!1410645 () Bool)

(assert (=> b!1528319 m!1410645))

(assert (=> b!1528319 m!1410611))

(declare-fun m!1410647 () Bool)

(assert (=> b!1528319 m!1410647))

(declare-fun m!1410649 () Bool)

(assert (=> b!1528324 m!1410649))

(declare-fun m!1410651 () Bool)

(assert (=> start!130176 m!1410651))

(declare-fun m!1410653 () Bool)

(assert (=> start!130176 m!1410653))

(assert (=> b!1528323 m!1410611))

(assert (=> b!1528323 m!1410611))

(declare-fun m!1410655 () Bool)

(assert (=> b!1528323 m!1410655))

(declare-fun m!1410657 () Bool)

(assert (=> b!1528314 m!1410657))

(check-sat (not b!1528315) (not b!1528322) (not b!1528324) (not start!130176) (not b!1528317) (not b!1528319) (not b!1528318) (not b!1528323) (not b!1528316) (not b!1528314) (not b!1528321) (not b!1528312))
(check-sat)
