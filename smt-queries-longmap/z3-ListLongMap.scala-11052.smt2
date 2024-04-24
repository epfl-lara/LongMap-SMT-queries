; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129446 () Bool)

(assert start!129446)

(declare-fun b!1517458 () Bool)

(declare-fun e!846927 () Bool)

(declare-fun e!846923 () Bool)

(assert (=> b!1517458 (= e!846927 e!846923)))

(declare-fun res!1036192 () Bool)

(assert (=> b!1517458 (=> (not res!1036192) (not e!846923))))

(declare-fun lt!657678 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12854 0))(
  ( (MissingZero!12854 (index!53811 (_ BitVec 32))) (Found!12854 (index!53812 (_ BitVec 32))) (Intermediate!12854 (undefined!13666 Bool) (index!53813 (_ BitVec 32)) (x!135713 (_ BitVec 32))) (Undefined!12854) (MissingVacant!12854 (index!53814 (_ BitVec 32))) )
))
(declare-fun lt!657676 () SeekEntryResult!12854)

(declare-datatypes ((array!101116 0))(
  ( (array!101117 (arr!48790 (Array (_ BitVec 32) (_ BitVec 64))) (size!49341 (_ BitVec 32))) )
))
(declare-fun lt!657677 () array!101116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12854)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517458 (= res!1036192 (= lt!657676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657678 mask!2512) lt!657678 lt!657677 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101116)

(assert (=> b!1517458 (= lt!657678 (select (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1517458 (= lt!657677 (array!101117 (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49341 a!2804)))))

(declare-fun b!1517460 () Bool)

(declare-fun res!1036185 () Bool)

(declare-fun e!846926 () Bool)

(assert (=> b!1517460 (=> (not res!1036185) (not e!846926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101116 (_ BitVec 32)) Bool)

(assert (=> b!1517460 (= res!1036185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517461 () Bool)

(declare-fun res!1036190 () Bool)

(assert (=> b!1517461 (=> (not res!1036190) (not e!846926))))

(assert (=> b!1517461 (= res!1036190 (and (= (size!49341 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49341 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49341 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517462 () Bool)

(declare-fun res!1036194 () Bool)

(assert (=> b!1517462 (=> (not res!1036194) (not e!846927))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657673 () SeekEntryResult!12854)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517462 (= res!1036194 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) lt!657673))))

(declare-fun b!1517463 () Bool)

(declare-fun res!1036196 () Bool)

(assert (=> b!1517463 (=> (not res!1036196) (not e!846926))))

(declare-datatypes ((List!35260 0))(
  ( (Nil!35257) (Cons!35256 (h!36683 (_ BitVec 64)) (t!49946 List!35260)) )
))
(declare-fun arrayNoDuplicates!0 (array!101116 (_ BitVec 32) List!35260) Bool)

(assert (=> b!1517463 (= res!1036196 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35257))))

(declare-fun b!1517464 () Bool)

(declare-fun e!846925 () Bool)

(assert (=> b!1517464 (= e!846925 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!657675 () SeekEntryResult!12854)

(declare-fun lt!657680 () SeekEntryResult!12854)

(assert (=> b!1517464 (= lt!657675 lt!657680)))

(declare-datatypes ((Unit!50611 0))(
  ( (Unit!50612) )
))
(declare-fun lt!657674 () Unit!50611)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50611)

(assert (=> b!1517464 (= lt!657674 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1517465 () Bool)

(declare-fun res!1036191 () Bool)

(assert (=> b!1517465 (=> (not res!1036191) (not e!846926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517465 (= res!1036191 (validKeyInArray!0 (select (arr!48790 a!2804) i!961)))))

(declare-fun b!1517466 () Bool)

(declare-fun e!846924 () Bool)

(assert (=> b!1517466 (= e!846924 e!846925)))

(declare-fun res!1036184 () Bool)

(assert (=> b!1517466 (=> res!1036184 e!846925)))

(assert (=> b!1517466 (= res!1036184 (not (= lt!657680 (Found!12854 j!70))))))

(declare-fun lt!657679 () SeekEntryResult!12854)

(assert (=> b!1517466 (= lt!657679 lt!657675)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12854)

(assert (=> b!1517466 (= lt!657675 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657678 lt!657677 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12854)

(assert (=> b!1517466 (= lt!657679 (seekEntryOrOpen!0 lt!657678 lt!657677 mask!2512))))

(declare-fun lt!657681 () SeekEntryResult!12854)

(assert (=> b!1517466 (= lt!657681 lt!657680)))

(assert (=> b!1517466 (= lt!657680 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48790 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1517466 (= lt!657681 (seekEntryOrOpen!0 (select (arr!48790 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517467 () Bool)

(declare-fun res!1036189 () Bool)

(assert (=> b!1517467 (=> (not res!1036189) (not e!846926))))

(assert (=> b!1517467 (= res!1036189 (validKeyInArray!0 (select (arr!48790 a!2804) j!70)))))

(declare-fun b!1517459 () Bool)

(assert (=> b!1517459 (= e!846926 e!846927)))

(declare-fun res!1036186 () Bool)

(assert (=> b!1517459 (=> (not res!1036186) (not e!846927))))

(assert (=> b!1517459 (= res!1036186 (= lt!657676 lt!657673))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517459 (= lt!657673 (Intermediate!12854 false resIndex!21 resX!21))))

(assert (=> b!1517459 (= lt!657676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48790 a!2804) j!70) mask!2512) (select (arr!48790 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036195 () Bool)

(assert (=> start!129446 (=> (not res!1036195) (not e!846926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129446 (= res!1036195 (validMask!0 mask!2512))))

(assert (=> start!129446 e!846926))

(assert (=> start!129446 true))

(declare-fun array_inv!38071 (array!101116) Bool)

(assert (=> start!129446 (array_inv!38071 a!2804)))

(declare-fun e!846921 () Bool)

(declare-fun b!1517468 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12854)

(assert (=> b!1517468 (= e!846921 (= (seekEntry!0 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) (Found!12854 j!70)))))

(declare-fun b!1517469 () Bool)

(assert (=> b!1517469 (= e!846923 (not e!846924))))

(declare-fun res!1036193 () Bool)

(assert (=> b!1517469 (=> res!1036193 e!846924)))

(assert (=> b!1517469 (= res!1036193 (or (not (= (select (arr!48790 a!2804) j!70) lt!657678)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48790 a!2804) index!487) (select (arr!48790 a!2804) j!70)) (not (= (select (arr!48790 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1517469 e!846921))

(declare-fun res!1036187 () Bool)

(assert (=> b!1517469 (=> (not res!1036187) (not e!846921))))

(assert (=> b!1517469 (= res!1036187 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657682 () Unit!50611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50611)

(assert (=> b!1517469 (= lt!657682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517470 () Bool)

(declare-fun res!1036188 () Bool)

(assert (=> b!1517470 (=> (not res!1036188) (not e!846926))))

(assert (=> b!1517470 (= res!1036188 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49341 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49341 a!2804))))))

(assert (= (and start!129446 res!1036195) b!1517461))

(assert (= (and b!1517461 res!1036190) b!1517465))

(assert (= (and b!1517465 res!1036191) b!1517467))

(assert (= (and b!1517467 res!1036189) b!1517460))

(assert (= (and b!1517460 res!1036185) b!1517463))

(assert (= (and b!1517463 res!1036196) b!1517470))

(assert (= (and b!1517470 res!1036188) b!1517459))

(assert (= (and b!1517459 res!1036186) b!1517462))

(assert (= (and b!1517462 res!1036194) b!1517458))

(assert (= (and b!1517458 res!1036192) b!1517469))

(assert (= (and b!1517469 res!1036187) b!1517468))

(assert (= (and b!1517469 (not res!1036193)) b!1517466))

(assert (= (and b!1517466 (not res!1036184)) b!1517464))

(declare-fun m!1400571 () Bool)

(assert (=> b!1517462 m!1400571))

(assert (=> b!1517462 m!1400571))

(declare-fun m!1400573 () Bool)

(assert (=> b!1517462 m!1400573))

(declare-fun m!1400575 () Bool)

(assert (=> b!1517464 m!1400575))

(assert (=> b!1517467 m!1400571))

(assert (=> b!1517467 m!1400571))

(declare-fun m!1400577 () Bool)

(assert (=> b!1517467 m!1400577))

(declare-fun m!1400579 () Bool)

(assert (=> start!129446 m!1400579))

(declare-fun m!1400581 () Bool)

(assert (=> start!129446 m!1400581))

(declare-fun m!1400583 () Bool)

(assert (=> b!1517463 m!1400583))

(declare-fun m!1400585 () Bool)

(assert (=> b!1517460 m!1400585))

(declare-fun m!1400587 () Bool)

(assert (=> b!1517458 m!1400587))

(assert (=> b!1517458 m!1400587))

(declare-fun m!1400589 () Bool)

(assert (=> b!1517458 m!1400589))

(declare-fun m!1400591 () Bool)

(assert (=> b!1517458 m!1400591))

(declare-fun m!1400593 () Bool)

(assert (=> b!1517458 m!1400593))

(declare-fun m!1400595 () Bool)

(assert (=> b!1517465 m!1400595))

(assert (=> b!1517465 m!1400595))

(declare-fun m!1400597 () Bool)

(assert (=> b!1517465 m!1400597))

(assert (=> b!1517459 m!1400571))

(assert (=> b!1517459 m!1400571))

(declare-fun m!1400599 () Bool)

(assert (=> b!1517459 m!1400599))

(assert (=> b!1517459 m!1400599))

(assert (=> b!1517459 m!1400571))

(declare-fun m!1400601 () Bool)

(assert (=> b!1517459 m!1400601))

(assert (=> b!1517469 m!1400571))

(declare-fun m!1400603 () Bool)

(assert (=> b!1517469 m!1400603))

(declare-fun m!1400605 () Bool)

(assert (=> b!1517469 m!1400605))

(declare-fun m!1400607 () Bool)

(assert (=> b!1517469 m!1400607))

(assert (=> b!1517466 m!1400571))

(declare-fun m!1400609 () Bool)

(assert (=> b!1517466 m!1400609))

(assert (=> b!1517466 m!1400571))

(declare-fun m!1400611 () Bool)

(assert (=> b!1517466 m!1400611))

(declare-fun m!1400613 () Bool)

(assert (=> b!1517466 m!1400613))

(assert (=> b!1517466 m!1400571))

(declare-fun m!1400615 () Bool)

(assert (=> b!1517466 m!1400615))

(assert (=> b!1517468 m!1400571))

(assert (=> b!1517468 m!1400571))

(declare-fun m!1400617 () Bool)

(assert (=> b!1517468 m!1400617))

(check-sat (not b!1517462) (not b!1517463) (not b!1517460) (not start!129446) (not b!1517458) (not b!1517467) (not b!1517466) (not b!1517468) (not b!1517464) (not b!1517459) (not b!1517469) (not b!1517465))
(check-sat)
