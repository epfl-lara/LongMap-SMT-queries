; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129794 () Bool)

(assert start!129794)

(declare-fun b!1523578 () Bool)

(declare-fun e!849391 () Bool)

(declare-fun e!849389 () Bool)

(assert (=> b!1523578 (= e!849391 e!849389)))

(declare-fun res!1042494 () Bool)

(assert (=> b!1523578 (=> (not res!1042494) (not e!849389))))

(declare-datatypes ((SeekEntryResult!13091 0))(
  ( (MissingZero!13091 (index!54759 (_ BitVec 32))) (Found!13091 (index!54760 (_ BitVec 32))) (Intermediate!13091 (undefined!13903 Bool) (index!54761 (_ BitVec 32)) (x!136449 (_ BitVec 32))) (Undefined!13091) (MissingVacant!13091 (index!54762 (_ BitVec 32))) )
))
(declare-fun lt!659990 () SeekEntryResult!13091)

(declare-fun lt!659991 () SeekEntryResult!13091)

(assert (=> b!1523578 (= res!1042494 (= lt!659990 lt!659991))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523578 (= lt!659991 (Intermediate!13091 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101390 0))(
  ( (array!101391 (arr!48926 (Array (_ BitVec 32) (_ BitVec 64))) (size!49476 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101390)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101390 (_ BitVec 32)) SeekEntryResult!13091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523578 (= lt!659990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48926 a!2804) j!70) mask!2512) (select (arr!48926 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523579 () Bool)

(declare-fun res!1042495 () Bool)

(assert (=> b!1523579 (=> (not res!1042495) (not e!849391))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523579 (= res!1042495 (validKeyInArray!0 (select (arr!48926 a!2804) i!961)))))

(declare-fun b!1523580 () Bool)

(declare-fun res!1042493 () Bool)

(assert (=> b!1523580 (=> (not res!1042493) (not e!849391))))

(declare-datatypes ((List!35409 0))(
  ( (Nil!35406) (Cons!35405 (h!36829 (_ BitVec 64)) (t!50103 List!35409)) )
))
(declare-fun arrayNoDuplicates!0 (array!101390 (_ BitVec 32) List!35409) Bool)

(assert (=> b!1523580 (= res!1042493 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35406))))

(declare-fun b!1523582 () Bool)

(assert (=> b!1523582 (= e!849389 (not true))))

(declare-fun e!849390 () Bool)

(assert (=> b!1523582 e!849390))

(declare-fun res!1042490 () Bool)

(assert (=> b!1523582 (=> (not res!1042490) (not e!849390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101390 (_ BitVec 32)) Bool)

(assert (=> b!1523582 (= res!1042490 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50966 0))(
  ( (Unit!50967) )
))
(declare-fun lt!659992 () Unit!50966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50966)

(assert (=> b!1523582 (= lt!659992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523583 () Bool)

(declare-fun res!1042488 () Bool)

(assert (=> b!1523583 (=> (not res!1042488) (not e!849391))))

(assert (=> b!1523583 (= res!1042488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523584 () Bool)

(declare-fun res!1042486 () Bool)

(assert (=> b!1523584 (=> (not res!1042486) (not e!849391))))

(assert (=> b!1523584 (= res!1042486 (validKeyInArray!0 (select (arr!48926 a!2804) j!70)))))

(declare-fun b!1523585 () Bool)

(declare-fun res!1042491 () Bool)

(assert (=> b!1523585 (=> (not res!1042491) (not e!849391))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523585 (= res!1042491 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49476 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49476 a!2804))))))

(declare-fun b!1523586 () Bool)

(declare-fun res!1042492 () Bool)

(assert (=> b!1523586 (=> (not res!1042492) (not e!849389))))

(assert (=> b!1523586 (= res!1042492 (= lt!659990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48926 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48926 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101391 (store (arr!48926 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49476 a!2804)) mask!2512)))))

(declare-fun b!1523587 () Bool)

(declare-fun res!1042487 () Bool)

(assert (=> b!1523587 (=> (not res!1042487) (not e!849391))))

(assert (=> b!1523587 (= res!1042487 (and (= (size!49476 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49476 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49476 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523588 () Bool)

(declare-fun res!1042489 () Bool)

(assert (=> b!1523588 (=> (not res!1042489) (not e!849389))))

(assert (=> b!1523588 (= res!1042489 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48926 a!2804) j!70) a!2804 mask!2512) lt!659991))))

(declare-fun res!1042485 () Bool)

(assert (=> start!129794 (=> (not res!1042485) (not e!849391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129794 (= res!1042485 (validMask!0 mask!2512))))

(assert (=> start!129794 e!849391))

(assert (=> start!129794 true))

(declare-fun array_inv!37954 (array!101390) Bool)

(assert (=> start!129794 (array_inv!37954 a!2804)))

(declare-fun b!1523581 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101390 (_ BitVec 32)) SeekEntryResult!13091)

(assert (=> b!1523581 (= e!849390 (= (seekEntry!0 (select (arr!48926 a!2804) j!70) a!2804 mask!2512) (Found!13091 j!70)))))

(assert (= (and start!129794 res!1042485) b!1523587))

(assert (= (and b!1523587 res!1042487) b!1523579))

(assert (= (and b!1523579 res!1042495) b!1523584))

(assert (= (and b!1523584 res!1042486) b!1523583))

(assert (= (and b!1523583 res!1042488) b!1523580))

(assert (= (and b!1523580 res!1042493) b!1523585))

(assert (= (and b!1523585 res!1042491) b!1523578))

(assert (= (and b!1523578 res!1042494) b!1523588))

(assert (= (and b!1523588 res!1042489) b!1523586))

(assert (= (and b!1523586 res!1042492) b!1523582))

(assert (= (and b!1523582 res!1042490) b!1523581))

(declare-fun m!1406709 () Bool)

(assert (=> b!1523581 m!1406709))

(assert (=> b!1523581 m!1406709))

(declare-fun m!1406711 () Bool)

(assert (=> b!1523581 m!1406711))

(declare-fun m!1406713 () Bool)

(assert (=> b!1523579 m!1406713))

(assert (=> b!1523579 m!1406713))

(declare-fun m!1406715 () Bool)

(assert (=> b!1523579 m!1406715))

(assert (=> b!1523578 m!1406709))

(assert (=> b!1523578 m!1406709))

(declare-fun m!1406717 () Bool)

(assert (=> b!1523578 m!1406717))

(assert (=> b!1523578 m!1406717))

(assert (=> b!1523578 m!1406709))

(declare-fun m!1406719 () Bool)

(assert (=> b!1523578 m!1406719))

(declare-fun m!1406721 () Bool)

(assert (=> start!129794 m!1406721))

(declare-fun m!1406723 () Bool)

(assert (=> start!129794 m!1406723))

(declare-fun m!1406725 () Bool)

(assert (=> b!1523582 m!1406725))

(declare-fun m!1406727 () Bool)

(assert (=> b!1523582 m!1406727))

(declare-fun m!1406729 () Bool)

(assert (=> b!1523583 m!1406729))

(assert (=> b!1523588 m!1406709))

(assert (=> b!1523588 m!1406709))

(declare-fun m!1406731 () Bool)

(assert (=> b!1523588 m!1406731))

(declare-fun m!1406733 () Bool)

(assert (=> b!1523580 m!1406733))

(declare-fun m!1406735 () Bool)

(assert (=> b!1523586 m!1406735))

(declare-fun m!1406737 () Bool)

(assert (=> b!1523586 m!1406737))

(assert (=> b!1523586 m!1406737))

(declare-fun m!1406739 () Bool)

(assert (=> b!1523586 m!1406739))

(assert (=> b!1523586 m!1406739))

(assert (=> b!1523586 m!1406737))

(declare-fun m!1406741 () Bool)

(assert (=> b!1523586 m!1406741))

(assert (=> b!1523584 m!1406709))

(assert (=> b!1523584 m!1406709))

(declare-fun m!1406743 () Bool)

(assert (=> b!1523584 m!1406743))

(push 1)

