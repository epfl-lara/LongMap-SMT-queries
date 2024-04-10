; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130040 () Bool)

(assert start!130040)

(declare-fun b!1525726 () Bool)

(declare-fun e!850479 () Bool)

(assert (=> b!1525726 (= e!850479 (not true))))

(declare-fun e!850477 () Bool)

(assert (=> b!1525726 e!850477))

(declare-fun res!1043767 () Bool)

(assert (=> b!1525726 (=> (not res!1043767) (not e!850477))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101453 0))(
  ( (array!101454 (arr!48953 (Array (_ BitVec 32) (_ BitVec 64))) (size!49503 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101453)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101453 (_ BitVec 32)) Bool)

(assert (=> b!1525726 (= res!1043767 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51020 0))(
  ( (Unit!51021) )
))
(declare-fun lt!660823 () Unit!51020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51020)

(assert (=> b!1525726 (= lt!660823 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525727 () Bool)

(declare-fun e!850474 () Bool)

(declare-fun e!850475 () Bool)

(assert (=> b!1525727 (= e!850474 e!850475)))

(declare-fun res!1043763 () Bool)

(assert (=> b!1525727 (=> (not res!1043763) (not e!850475))))

(declare-datatypes ((SeekEntryResult!13118 0))(
  ( (MissingZero!13118 (index!54867 (_ BitVec 32))) (Found!13118 (index!54868 (_ BitVec 32))) (Intermediate!13118 (undefined!13930 Bool) (index!54869 (_ BitVec 32)) (x!136572 (_ BitVec 32))) (Undefined!13118) (MissingVacant!13118 (index!54870 (_ BitVec 32))) )
))
(declare-fun lt!660822 () SeekEntryResult!13118)

(declare-fun lt!660819 () SeekEntryResult!13118)

(assert (=> b!1525727 (= res!1043763 (= lt!660822 lt!660819))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525727 (= lt!660819 (Intermediate!13118 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101453 (_ BitVec 32)) SeekEntryResult!13118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525727 (= lt!660822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48953 a!2804) j!70) mask!2512) (select (arr!48953 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525729 () Bool)

(declare-fun res!1043766 () Bool)

(assert (=> b!1525729 (=> (not res!1043766) (not e!850474))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525729 (= res!1043766 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49503 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49503 a!2804))))))

(declare-fun b!1525730 () Bool)

(declare-fun e!850478 () Bool)

(declare-fun e!850480 () Bool)

(assert (=> b!1525730 (= e!850478 e!850480)))

(declare-fun res!1043761 () Bool)

(assert (=> b!1525730 (=> (not res!1043761) (not e!850480))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101453 (_ BitVec 32)) SeekEntryResult!13118)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101453 (_ BitVec 32)) SeekEntryResult!13118)

(assert (=> b!1525730 (= res!1043761 (= (seekEntryOrOpen!0 (select (arr!48953 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48953 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525731 () Bool)

(declare-fun res!1043762 () Bool)

(assert (=> b!1525731 (=> (not res!1043762) (not e!850475))))

(assert (=> b!1525731 (= res!1043762 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48953 a!2804) j!70) a!2804 mask!2512) lt!660819))))

(declare-fun b!1525732 () Bool)

(declare-fun res!1043769 () Bool)

(assert (=> b!1525732 (=> (not res!1043769) (not e!850474))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525732 (= res!1043769 (validKeyInArray!0 (select (arr!48953 a!2804) i!961)))))

(declare-fun b!1525733 () Bool)

(assert (=> b!1525733 (= e!850477 e!850478)))

(declare-fun res!1043768 () Bool)

(assert (=> b!1525733 (=> res!1043768 e!850478)))

(declare-fun lt!660821 () (_ BitVec 64))

(assert (=> b!1525733 (= res!1043768 (or (not (= (select (arr!48953 a!2804) j!70) lt!660821)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48953 a!2804) index!487) (select (arr!48953 a!2804) j!70)) (not (= (select (arr!48953 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525734 () Bool)

(declare-fun res!1043770 () Bool)

(assert (=> b!1525734 (=> (not res!1043770) (not e!850474))))

(assert (=> b!1525734 (= res!1043770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525735 () Bool)

(declare-fun lt!660820 () array!101453)

(assert (=> b!1525735 (= e!850480 (= (seekEntryOrOpen!0 lt!660821 lt!660820 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660821 lt!660820 mask!2512)))))

(declare-fun b!1525736 () Bool)

(declare-fun res!1043773 () Bool)

(assert (=> b!1525736 (=> (not res!1043773) (not e!850474))))

(assert (=> b!1525736 (= res!1043773 (validKeyInArray!0 (select (arr!48953 a!2804) j!70)))))

(declare-fun b!1525737 () Bool)

(declare-fun res!1043760 () Bool)

(assert (=> b!1525737 (=> (not res!1043760) (not e!850477))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101453 (_ BitVec 32)) SeekEntryResult!13118)

(assert (=> b!1525737 (= res!1043760 (= (seekEntry!0 (select (arr!48953 a!2804) j!70) a!2804 mask!2512) (Found!13118 j!70)))))

(declare-fun b!1525738 () Bool)

(assert (=> b!1525738 (= e!850475 e!850479)))

(declare-fun res!1043772 () Bool)

(assert (=> b!1525738 (=> (not res!1043772) (not e!850479))))

(assert (=> b!1525738 (= res!1043772 (= lt!660822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660821 mask!2512) lt!660821 lt!660820 mask!2512)))))

(assert (=> b!1525738 (= lt!660821 (select (store (arr!48953 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525738 (= lt!660820 (array!101454 (store (arr!48953 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49503 a!2804)))))

(declare-fun b!1525739 () Bool)

(declare-fun res!1043764 () Bool)

(assert (=> b!1525739 (=> (not res!1043764) (not e!850474))))

(declare-datatypes ((List!35436 0))(
  ( (Nil!35433) (Cons!35432 (h!36865 (_ BitVec 64)) (t!50130 List!35436)) )
))
(declare-fun arrayNoDuplicates!0 (array!101453 (_ BitVec 32) List!35436) Bool)

(assert (=> b!1525739 (= res!1043764 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35433))))

(declare-fun b!1525728 () Bool)

(declare-fun res!1043771 () Bool)

(assert (=> b!1525728 (=> (not res!1043771) (not e!850474))))

(assert (=> b!1525728 (= res!1043771 (and (= (size!49503 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49503 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49503 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1043765 () Bool)

(assert (=> start!130040 (=> (not res!1043765) (not e!850474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130040 (= res!1043765 (validMask!0 mask!2512))))

(assert (=> start!130040 e!850474))

(assert (=> start!130040 true))

(declare-fun array_inv!37981 (array!101453) Bool)

(assert (=> start!130040 (array_inv!37981 a!2804)))

(assert (= (and start!130040 res!1043765) b!1525728))

(assert (= (and b!1525728 res!1043771) b!1525732))

(assert (= (and b!1525732 res!1043769) b!1525736))

(assert (= (and b!1525736 res!1043773) b!1525734))

(assert (= (and b!1525734 res!1043770) b!1525739))

(assert (= (and b!1525739 res!1043764) b!1525729))

(assert (= (and b!1525729 res!1043766) b!1525727))

(assert (= (and b!1525727 res!1043763) b!1525731))

(assert (= (and b!1525731 res!1043762) b!1525738))

(assert (= (and b!1525738 res!1043772) b!1525726))

(assert (= (and b!1525726 res!1043767) b!1525737))

(assert (= (and b!1525737 res!1043760) b!1525733))

(assert (= (and b!1525733 (not res!1043768)) b!1525730))

(assert (= (and b!1525730 res!1043761) b!1525735))

(declare-fun m!1408461 () Bool)

(assert (=> b!1525727 m!1408461))

(assert (=> b!1525727 m!1408461))

(declare-fun m!1408463 () Bool)

(assert (=> b!1525727 m!1408463))

(assert (=> b!1525727 m!1408463))

(assert (=> b!1525727 m!1408461))

(declare-fun m!1408465 () Bool)

(assert (=> b!1525727 m!1408465))

(assert (=> b!1525730 m!1408461))

(assert (=> b!1525730 m!1408461))

(declare-fun m!1408467 () Bool)

(assert (=> b!1525730 m!1408467))

(assert (=> b!1525730 m!1408461))

(declare-fun m!1408469 () Bool)

(assert (=> b!1525730 m!1408469))

(assert (=> b!1525731 m!1408461))

(assert (=> b!1525731 m!1408461))

(declare-fun m!1408471 () Bool)

(assert (=> b!1525731 m!1408471))

(assert (=> b!1525737 m!1408461))

(assert (=> b!1525737 m!1408461))

(declare-fun m!1408473 () Bool)

(assert (=> b!1525737 m!1408473))

(declare-fun m!1408475 () Bool)

(assert (=> b!1525739 m!1408475))

(declare-fun m!1408477 () Bool)

(assert (=> b!1525735 m!1408477))

(declare-fun m!1408479 () Bool)

(assert (=> b!1525735 m!1408479))

(assert (=> b!1525736 m!1408461))

(assert (=> b!1525736 m!1408461))

(declare-fun m!1408481 () Bool)

(assert (=> b!1525736 m!1408481))

(assert (=> b!1525733 m!1408461))

(declare-fun m!1408483 () Bool)

(assert (=> b!1525733 m!1408483))

(declare-fun m!1408485 () Bool)

(assert (=> start!130040 m!1408485))

(declare-fun m!1408487 () Bool)

(assert (=> start!130040 m!1408487))

(declare-fun m!1408489 () Bool)

(assert (=> b!1525732 m!1408489))

(assert (=> b!1525732 m!1408489))

(declare-fun m!1408491 () Bool)

(assert (=> b!1525732 m!1408491))

(declare-fun m!1408493 () Bool)

(assert (=> b!1525726 m!1408493))

(declare-fun m!1408495 () Bool)

(assert (=> b!1525726 m!1408495))

(declare-fun m!1408497 () Bool)

(assert (=> b!1525734 m!1408497))

(declare-fun m!1408499 () Bool)

(assert (=> b!1525738 m!1408499))

(assert (=> b!1525738 m!1408499))

(declare-fun m!1408501 () Bool)

(assert (=> b!1525738 m!1408501))

(declare-fun m!1408503 () Bool)

(assert (=> b!1525738 m!1408503))

(declare-fun m!1408505 () Bool)

(assert (=> b!1525738 m!1408505))

(push 1)

