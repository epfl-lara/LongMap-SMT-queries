; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129266 () Bool)

(assert start!129266)

(declare-fun b!1518655 () Bool)

(declare-fun e!847138 () Bool)

(declare-fun e!847139 () Bool)

(assert (=> b!1518655 (= e!847138 e!847139)))

(declare-fun res!1038769 () Bool)

(assert (=> b!1518655 (=> (not res!1038769) (not e!847139))))

(declare-datatypes ((SeekEntryResult!12993 0))(
  ( (MissingZero!12993 (index!54367 (_ BitVec 32))) (Found!12993 (index!54368 (_ BitVec 32))) (Intermediate!12993 (undefined!13805 Bool) (index!54369 (_ BitVec 32)) (x!136041 (_ BitVec 32))) (Undefined!12993) (MissingVacant!12993 (index!54370 (_ BitVec 32))) )
))
(declare-fun lt!658149 () SeekEntryResult!12993)

(declare-fun lt!658154 () SeekEntryResult!12993)

(assert (=> b!1518655 (= res!1038769 (= lt!658149 lt!658154))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518655 (= lt!658154 (Intermediate!12993 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101122 0))(
  ( (array!101123 (arr!48799 (Array (_ BitVec 32) (_ BitVec 64))) (size!49351 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101122)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518655 (= lt!658149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48799 a!2804) j!70) mask!2512) (select (arr!48799 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518656 () Bool)

(declare-fun res!1038771 () Bool)

(assert (=> b!1518656 (=> (not res!1038771) (not e!847139))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518656 (= res!1038771 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) lt!658154))))

(declare-fun b!1518657 () Bool)

(declare-fun res!1038767 () Bool)

(assert (=> b!1518657 (=> (not res!1038767) (not e!847138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518657 (= res!1038767 (validKeyInArray!0 (select (arr!48799 a!2804) j!70)))))

(declare-fun b!1518658 () Bool)

(declare-fun e!847143 () Bool)

(declare-fun e!847142 () Bool)

(assert (=> b!1518658 (= e!847143 (not e!847142))))

(declare-fun res!1038770 () Bool)

(assert (=> b!1518658 (=> res!1038770 e!847142)))

(declare-fun lt!658150 () (_ BitVec 64))

(assert (=> b!1518658 (= res!1038770 (or (not (= (select (arr!48799 a!2804) j!70) lt!658150)) (= x!534 resX!21)))))

(declare-fun e!847140 () Bool)

(assert (=> b!1518658 e!847140))

(declare-fun res!1038776 () Bool)

(assert (=> b!1518658 (=> (not res!1038776) (not e!847140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101122 (_ BitVec 32)) Bool)

(assert (=> b!1518658 (= res!1038776 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50693 0))(
  ( (Unit!50694) )
))
(declare-fun lt!658152 () Unit!50693)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50693)

(assert (=> b!1518658 (= lt!658152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518659 () Bool)

(declare-fun res!1038774 () Bool)

(assert (=> b!1518659 (=> (not res!1038774) (not e!847138))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518659 (= res!1038774 (validKeyInArray!0 (select (arr!48799 a!2804) i!961)))))

(declare-fun b!1518660 () Bool)

(declare-fun e!847141 () Bool)

(assert (=> b!1518660 (= e!847142 e!847141)))

(declare-fun res!1038765 () Bool)

(assert (=> b!1518660 (=> res!1038765 e!847141)))

(declare-fun lt!658155 () (_ BitVec 32))

(assert (=> b!1518660 (= res!1038765 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658155 #b00000000000000000000000000000000) (bvsge lt!658155 (size!49351 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518660 (= lt!658155 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518661 () Bool)

(declare-fun res!1038773 () Bool)

(assert (=> b!1518661 (=> (not res!1038773) (not e!847138))))

(assert (=> b!1518661 (= res!1038773 (and (= (size!49351 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49351 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49351 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518662 () Bool)

(declare-fun res!1038768 () Bool)

(assert (=> b!1518662 (=> (not res!1038768) (not e!847138))))

(declare-datatypes ((List!35360 0))(
  ( (Nil!35357) (Cons!35356 (h!36769 (_ BitVec 64)) (t!50046 List!35360)) )
))
(declare-fun arrayNoDuplicates!0 (array!101122 (_ BitVec 32) List!35360) Bool)

(assert (=> b!1518662 (= res!1038768 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35357))))

(declare-fun b!1518663 () Bool)

(assert (=> b!1518663 (= e!847141 true)))

(declare-fun lt!658151 () array!101122)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12993)

(assert (=> b!1518663 (= (seekEntryOrOpen!0 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658150 lt!658151 mask!2512))))

(declare-fun lt!658153 () Unit!50693)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50693)

(assert (=> b!1518663 (= lt!658153 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658155 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518664 () Bool)

(assert (=> b!1518664 (= e!847139 e!847143)))

(declare-fun res!1038772 () Bool)

(assert (=> b!1518664 (=> (not res!1038772) (not e!847143))))

(assert (=> b!1518664 (= res!1038772 (= lt!658149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658150 mask!2512) lt!658150 lt!658151 mask!2512)))))

(assert (=> b!1518664 (= lt!658150 (select (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518664 (= lt!658151 (array!101123 (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49351 a!2804)))))

(declare-fun b!1518665 () Bool)

(declare-fun res!1038775 () Bool)

(assert (=> b!1518665 (=> (not res!1038775) (not e!847138))))

(assert (=> b!1518665 (= res!1038775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1038763 () Bool)

(assert (=> start!129266 (=> (not res!1038763) (not e!847138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129266 (= res!1038763 (validMask!0 mask!2512))))

(assert (=> start!129266 e!847138))

(assert (=> start!129266 true))

(declare-fun array_inv!38032 (array!101122) Bool)

(assert (=> start!129266 (array_inv!38032 a!2804)))

(declare-fun b!1518654 () Bool)

(declare-fun res!1038766 () Bool)

(assert (=> b!1518654 (=> (not res!1038766) (not e!847138))))

(assert (=> b!1518654 (= res!1038766 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49351 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49351 a!2804))))))

(declare-fun b!1518666 () Bool)

(declare-fun res!1038764 () Bool)

(assert (=> b!1518666 (=> res!1038764 e!847141)))

(assert (=> b!1518666 (= res!1038764 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658155 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) lt!658154)))))

(declare-fun b!1518667 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12993)

(assert (=> b!1518667 (= e!847140 (= (seekEntry!0 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) (Found!12993 j!70)))))

(assert (= (and start!129266 res!1038763) b!1518661))

(assert (= (and b!1518661 res!1038773) b!1518659))

(assert (= (and b!1518659 res!1038774) b!1518657))

(assert (= (and b!1518657 res!1038767) b!1518665))

(assert (= (and b!1518665 res!1038775) b!1518662))

(assert (= (and b!1518662 res!1038768) b!1518654))

(assert (= (and b!1518654 res!1038766) b!1518655))

(assert (= (and b!1518655 res!1038769) b!1518656))

(assert (= (and b!1518656 res!1038771) b!1518664))

(assert (= (and b!1518664 res!1038772) b!1518658))

(assert (= (and b!1518658 res!1038776) b!1518667))

(assert (= (and b!1518658 (not res!1038770)) b!1518660))

(assert (= (and b!1518660 (not res!1038765)) b!1518666))

(assert (= (and b!1518666 (not res!1038764)) b!1518663))

(declare-fun m!1401449 () Bool)

(assert (=> b!1518655 m!1401449))

(assert (=> b!1518655 m!1401449))

(declare-fun m!1401451 () Bool)

(assert (=> b!1518655 m!1401451))

(assert (=> b!1518655 m!1401451))

(assert (=> b!1518655 m!1401449))

(declare-fun m!1401453 () Bool)

(assert (=> b!1518655 m!1401453))

(assert (=> b!1518666 m!1401449))

(assert (=> b!1518666 m!1401449))

(declare-fun m!1401455 () Bool)

(assert (=> b!1518666 m!1401455))

(assert (=> b!1518657 m!1401449))

(assert (=> b!1518657 m!1401449))

(declare-fun m!1401457 () Bool)

(assert (=> b!1518657 m!1401457))

(declare-fun m!1401459 () Bool)

(assert (=> b!1518662 m!1401459))

(assert (=> b!1518656 m!1401449))

(assert (=> b!1518656 m!1401449))

(declare-fun m!1401461 () Bool)

(assert (=> b!1518656 m!1401461))

(declare-fun m!1401463 () Bool)

(assert (=> b!1518664 m!1401463))

(assert (=> b!1518664 m!1401463))

(declare-fun m!1401465 () Bool)

(assert (=> b!1518664 m!1401465))

(declare-fun m!1401467 () Bool)

(assert (=> b!1518664 m!1401467))

(declare-fun m!1401469 () Bool)

(assert (=> b!1518664 m!1401469))

(declare-fun m!1401471 () Bool)

(assert (=> b!1518665 m!1401471))

(declare-fun m!1401473 () Bool)

(assert (=> b!1518659 m!1401473))

(assert (=> b!1518659 m!1401473))

(declare-fun m!1401475 () Bool)

(assert (=> b!1518659 m!1401475))

(assert (=> b!1518658 m!1401449))

(declare-fun m!1401477 () Bool)

(assert (=> b!1518658 m!1401477))

(declare-fun m!1401479 () Bool)

(assert (=> b!1518658 m!1401479))

(declare-fun m!1401481 () Bool)

(assert (=> b!1518660 m!1401481))

(assert (=> b!1518667 m!1401449))

(assert (=> b!1518667 m!1401449))

(declare-fun m!1401483 () Bool)

(assert (=> b!1518667 m!1401483))

(assert (=> b!1518663 m!1401449))

(assert (=> b!1518663 m!1401449))

(declare-fun m!1401485 () Bool)

(assert (=> b!1518663 m!1401485))

(declare-fun m!1401487 () Bool)

(assert (=> b!1518663 m!1401487))

(declare-fun m!1401489 () Bool)

(assert (=> b!1518663 m!1401489))

(declare-fun m!1401491 () Bool)

(assert (=> start!129266 m!1401491))

(declare-fun m!1401493 () Bool)

(assert (=> start!129266 m!1401493))

(check-sat (not b!1518664) (not b!1518660) (not start!129266) (not b!1518663) (not b!1518655) (not b!1518656) (not b!1518666) (not b!1518658) (not b!1518665) (not b!1518667) (not b!1518662) (not b!1518657) (not b!1518659))
(check-sat)
