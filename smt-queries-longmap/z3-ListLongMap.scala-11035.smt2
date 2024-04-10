; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129044 () Bool)

(assert start!129044)

(declare-fun b!1513573 () Bool)

(declare-fun e!844741 () Bool)

(declare-fun e!844737 () Bool)

(assert (=> b!1513573 (= e!844741 e!844737)))

(declare-fun res!1033480 () Bool)

(assert (=> b!1513573 (=> res!1033480 e!844737)))

(declare-fun lt!656029 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100900 0))(
  ( (array!100901 (arr!48687 (Array (_ BitVec 32) (_ BitVec 64))) (size!49237 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100900)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513573 (= res!1033480 (or (not (= (select (arr!48687 a!2804) j!70) lt!656029)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48687 a!2804) index!487) (select (arr!48687 a!2804) j!70)) (not (= (select (arr!48687 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1033487 () Bool)

(declare-fun e!844736 () Bool)

(assert (=> start!129044 (=> (not res!1033487) (not e!844736))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129044 (= res!1033487 (validMask!0 mask!2512))))

(assert (=> start!129044 e!844736))

(assert (=> start!129044 true))

(declare-fun array_inv!37715 (array!100900) Bool)

(assert (=> start!129044 (array_inv!37715 a!2804)))

(declare-fun b!1513574 () Bool)

(declare-fun res!1033481 () Bool)

(assert (=> b!1513574 (=> (not res!1033481) (not e!844736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513574 (= res!1033481 (validKeyInArray!0 (select (arr!48687 a!2804) j!70)))))

(declare-fun b!1513575 () Bool)

(declare-fun e!844739 () Bool)

(assert (=> b!1513575 (= e!844739 (not true))))

(assert (=> b!1513575 e!844741))

(declare-fun res!1033477 () Bool)

(assert (=> b!1513575 (=> (not res!1033477) (not e!844741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100900 (_ BitVec 32)) Bool)

(assert (=> b!1513575 (= res!1033477 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50584 0))(
  ( (Unit!50585) )
))
(declare-fun lt!656028 () Unit!50584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50584)

(assert (=> b!1513575 (= lt!656028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513576 () Bool)

(declare-fun res!1033486 () Bool)

(assert (=> b!1513576 (=> (not res!1033486) (not e!844736))))

(assert (=> b!1513576 (= res!1033486 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49237 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49237 a!2804))))))

(declare-fun b!1513577 () Bool)

(declare-fun res!1033488 () Bool)

(assert (=> b!1513577 (=> (not res!1033488) (not e!844736))))

(declare-datatypes ((List!35170 0))(
  ( (Nil!35167) (Cons!35166 (h!36578 (_ BitVec 64)) (t!49864 List!35170)) )
))
(declare-fun arrayNoDuplicates!0 (array!100900 (_ BitVec 32) List!35170) Bool)

(assert (=> b!1513577 (= res!1033488 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35167))))

(declare-fun b!1513578 () Bool)

(declare-fun e!844740 () Bool)

(assert (=> b!1513578 (= e!844740 e!844739)))

(declare-fun res!1033476 () Bool)

(assert (=> b!1513578 (=> (not res!1033476) (not e!844739))))

(declare-datatypes ((SeekEntryResult!12858 0))(
  ( (MissingZero!12858 (index!53827 (_ BitVec 32))) (Found!12858 (index!53828 (_ BitVec 32))) (Intermediate!12858 (undefined!13670 Bool) (index!53829 (_ BitVec 32)) (x!135544 (_ BitVec 32))) (Undefined!12858) (MissingVacant!12858 (index!53830 (_ BitVec 32))) )
))
(declare-fun lt!656027 () SeekEntryResult!12858)

(declare-fun lt!656026 () array!100900)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12858)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513578 (= res!1033476 (= lt!656027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656029 mask!2512) lt!656029 lt!656026 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513578 (= lt!656029 (select (store (arr!48687 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513578 (= lt!656026 (array!100901 (store (arr!48687 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49237 a!2804)))))

(declare-fun b!1513579 () Bool)

(declare-fun res!1033484 () Bool)

(assert (=> b!1513579 (=> (not res!1033484) (not e!844736))))

(assert (=> b!1513579 (= res!1033484 (validKeyInArray!0 (select (arr!48687 a!2804) i!961)))))

(declare-fun e!844735 () Bool)

(declare-fun b!1513580 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12858)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12858)

(assert (=> b!1513580 (= e!844735 (= (seekEntryOrOpen!0 lt!656029 lt!656026 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656029 lt!656026 mask!2512)))))

(declare-fun b!1513581 () Bool)

(assert (=> b!1513581 (= e!844737 e!844735)))

(declare-fun res!1033485 () Bool)

(assert (=> b!1513581 (=> (not res!1033485) (not e!844735))))

(assert (=> b!1513581 (= res!1033485 (= (seekEntryOrOpen!0 (select (arr!48687 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48687 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513582 () Bool)

(declare-fun res!1033478 () Bool)

(assert (=> b!1513582 (=> (not res!1033478) (not e!844740))))

(declare-fun lt!656025 () SeekEntryResult!12858)

(assert (=> b!1513582 (= res!1033478 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48687 a!2804) j!70) a!2804 mask!2512) lt!656025))))

(declare-fun b!1513583 () Bool)

(assert (=> b!1513583 (= e!844736 e!844740)))

(declare-fun res!1033483 () Bool)

(assert (=> b!1513583 (=> (not res!1033483) (not e!844740))))

(assert (=> b!1513583 (= res!1033483 (= lt!656027 lt!656025))))

(assert (=> b!1513583 (= lt!656025 (Intermediate!12858 false resIndex!21 resX!21))))

(assert (=> b!1513583 (= lt!656027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48687 a!2804) j!70) mask!2512) (select (arr!48687 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513584 () Bool)

(declare-fun res!1033489 () Bool)

(assert (=> b!1513584 (=> (not res!1033489) (not e!844736))))

(assert (=> b!1513584 (= res!1033489 (and (= (size!49237 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49237 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49237 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513585 () Bool)

(declare-fun res!1033479 () Bool)

(assert (=> b!1513585 (=> (not res!1033479) (not e!844741))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100900 (_ BitVec 32)) SeekEntryResult!12858)

(assert (=> b!1513585 (= res!1033479 (= (seekEntry!0 (select (arr!48687 a!2804) j!70) a!2804 mask!2512) (Found!12858 j!70)))))

(declare-fun b!1513586 () Bool)

(declare-fun res!1033482 () Bool)

(assert (=> b!1513586 (=> (not res!1033482) (not e!844736))))

(assert (=> b!1513586 (= res!1033482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129044 res!1033487) b!1513584))

(assert (= (and b!1513584 res!1033489) b!1513579))

(assert (= (and b!1513579 res!1033484) b!1513574))

(assert (= (and b!1513574 res!1033481) b!1513586))

(assert (= (and b!1513586 res!1033482) b!1513577))

(assert (= (and b!1513577 res!1033488) b!1513576))

(assert (= (and b!1513576 res!1033486) b!1513583))

(assert (= (and b!1513583 res!1033483) b!1513582))

(assert (= (and b!1513582 res!1033478) b!1513578))

(assert (= (and b!1513578 res!1033476) b!1513575))

(assert (= (and b!1513575 res!1033477) b!1513585))

(assert (= (and b!1513585 res!1033479) b!1513573))

(assert (= (and b!1513573 (not res!1033480)) b!1513581))

(assert (= (and b!1513581 res!1033485) b!1513580))

(declare-fun m!1396445 () Bool)

(assert (=> b!1513575 m!1396445))

(declare-fun m!1396447 () Bool)

(assert (=> b!1513575 m!1396447))

(declare-fun m!1396449 () Bool)

(assert (=> start!129044 m!1396449))

(declare-fun m!1396451 () Bool)

(assert (=> start!129044 m!1396451))

(declare-fun m!1396453 () Bool)

(assert (=> b!1513578 m!1396453))

(assert (=> b!1513578 m!1396453))

(declare-fun m!1396455 () Bool)

(assert (=> b!1513578 m!1396455))

(declare-fun m!1396457 () Bool)

(assert (=> b!1513578 m!1396457))

(declare-fun m!1396459 () Bool)

(assert (=> b!1513578 m!1396459))

(declare-fun m!1396461 () Bool)

(assert (=> b!1513577 m!1396461))

(declare-fun m!1396463 () Bool)

(assert (=> b!1513579 m!1396463))

(assert (=> b!1513579 m!1396463))

(declare-fun m!1396465 () Bool)

(assert (=> b!1513579 m!1396465))

(declare-fun m!1396467 () Bool)

(assert (=> b!1513583 m!1396467))

(assert (=> b!1513583 m!1396467))

(declare-fun m!1396469 () Bool)

(assert (=> b!1513583 m!1396469))

(assert (=> b!1513583 m!1396469))

(assert (=> b!1513583 m!1396467))

(declare-fun m!1396471 () Bool)

(assert (=> b!1513583 m!1396471))

(assert (=> b!1513573 m!1396467))

(declare-fun m!1396473 () Bool)

(assert (=> b!1513573 m!1396473))

(assert (=> b!1513582 m!1396467))

(assert (=> b!1513582 m!1396467))

(declare-fun m!1396475 () Bool)

(assert (=> b!1513582 m!1396475))

(declare-fun m!1396477 () Bool)

(assert (=> b!1513586 m!1396477))

(assert (=> b!1513581 m!1396467))

(assert (=> b!1513581 m!1396467))

(declare-fun m!1396479 () Bool)

(assert (=> b!1513581 m!1396479))

(assert (=> b!1513581 m!1396467))

(declare-fun m!1396481 () Bool)

(assert (=> b!1513581 m!1396481))

(assert (=> b!1513585 m!1396467))

(assert (=> b!1513585 m!1396467))

(declare-fun m!1396483 () Bool)

(assert (=> b!1513585 m!1396483))

(declare-fun m!1396485 () Bool)

(assert (=> b!1513580 m!1396485))

(declare-fun m!1396487 () Bool)

(assert (=> b!1513580 m!1396487))

(assert (=> b!1513574 m!1396467))

(assert (=> b!1513574 m!1396467))

(declare-fun m!1396489 () Bool)

(assert (=> b!1513574 m!1396489))

(check-sat (not b!1513580) (not b!1513585) (not b!1513581) (not b!1513575) (not b!1513583) (not start!129044) (not b!1513577) (not b!1513582) (not b!1513586) (not b!1513574) (not b!1513579) (not b!1513578))
(check-sat)
