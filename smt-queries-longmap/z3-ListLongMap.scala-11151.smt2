; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130650 () Bool)

(assert start!130650)

(declare-fun b!1531680 () Bool)

(declare-fun e!853729 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101737 0))(
  ( (array!101738 (arr!49087 (Array (_ BitVec 32) (_ BitVec 64))) (size!49638 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101737)

(declare-datatypes ((SeekEntryResult!13145 0))(
  ( (MissingZero!13145 (index!54975 (_ BitVec 32))) (Found!13145 (index!54976 (_ BitVec 32))) (Intermediate!13145 (undefined!13957 Bool) (index!54977 (_ BitVec 32)) (x!136871 (_ BitVec 32))) (Undefined!13145) (MissingVacant!13145 (index!54978 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101737 (_ BitVec 32)) SeekEntryResult!13145)

(assert (=> b!1531680 (= e!853729 (= (seekEntry!0 (select (arr!49087 a!2804) j!70) a!2804 mask!2512) (Found!13145 j!70)))))

(declare-fun b!1531681 () Bool)

(declare-fun res!1047908 () Bool)

(declare-fun e!853730 () Bool)

(assert (=> b!1531681 (=> (not res!1047908) (not e!853730))))

(declare-fun lt!663292 () SeekEntryResult!13145)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101737 (_ BitVec 32)) SeekEntryResult!13145)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531681 (= res!1047908 (= lt!663292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49087 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49087 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101738 (store (arr!49087 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49638 a!2804)) mask!2512)))))

(declare-fun b!1531682 () Bool)

(declare-fun res!1047902 () Bool)

(declare-fun e!853732 () Bool)

(assert (=> b!1531682 (=> (not res!1047902) (not e!853732))))

(declare-datatypes ((List!35557 0))(
  ( (Nil!35554) (Cons!35553 (h!37007 (_ BitVec 64)) (t!50243 List!35557)) )
))
(declare-fun arrayNoDuplicates!0 (array!101737 (_ BitVec 32) List!35557) Bool)

(assert (=> b!1531682 (= res!1047902 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35554))))

(declare-fun b!1531683 () Bool)

(declare-fun res!1047904 () Bool)

(assert (=> b!1531683 (=> (not res!1047904) (not e!853732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101737 (_ BitVec 32)) Bool)

(assert (=> b!1531683 (= res!1047904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531684 () Bool)

(declare-fun res!1047909 () Bool)

(assert (=> b!1531684 (=> (not res!1047909) (not e!853732))))

(assert (=> b!1531684 (= res!1047909 (and (= (size!49638 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49638 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49638 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531685 () Bool)

(assert (=> b!1531685 (= e!853732 e!853730)))

(declare-fun res!1047901 () Bool)

(assert (=> b!1531685 (=> (not res!1047901) (not e!853730))))

(declare-fun lt!663291 () SeekEntryResult!13145)

(assert (=> b!1531685 (= res!1047901 (= lt!663292 lt!663291))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531685 (= lt!663291 (Intermediate!13145 false resIndex!21 resX!21))))

(assert (=> b!1531685 (= lt!663292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49087 a!2804) j!70) mask!2512) (select (arr!49087 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531686 () Bool)

(declare-fun e!853728 () Bool)

(assert (=> b!1531686 (= e!853730 (not e!853728))))

(declare-fun res!1047905 () Bool)

(assert (=> b!1531686 (=> res!1047905 e!853728)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531686 (= res!1047905 (or (not (= (select (arr!49087 a!2804) j!70) (select (store (arr!49087 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531686 e!853729))

(declare-fun res!1047907 () Bool)

(assert (=> b!1531686 (=> (not res!1047907) (not e!853729))))

(assert (=> b!1531686 (= res!1047907 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51109 0))(
  ( (Unit!51110) )
))
(declare-fun lt!663293 () Unit!51109)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51109)

(assert (=> b!1531686 (= lt!663293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531687 () Bool)

(declare-fun res!1047910 () Bool)

(assert (=> b!1531687 (=> (not res!1047910) (not e!853732))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1531687 (= res!1047910 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49638 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49638 a!2804))))))

(declare-fun b!1531689 () Bool)

(declare-fun res!1047903 () Bool)

(assert (=> b!1531689 (=> (not res!1047903) (not e!853732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531689 (= res!1047903 (validKeyInArray!0 (select (arr!49087 a!2804) j!70)))))

(declare-fun b!1531690 () Bool)

(assert (=> b!1531690 (= e!853728 true)))

(declare-fun lt!663294 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531690 (= lt!663294 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1531691 () Bool)

(declare-fun res!1047906 () Bool)

(assert (=> b!1531691 (=> (not res!1047906) (not e!853732))))

(assert (=> b!1531691 (= res!1047906 (validKeyInArray!0 (select (arr!49087 a!2804) i!961)))))

(declare-fun res!1047911 () Bool)

(assert (=> start!130650 (=> (not res!1047911) (not e!853732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130650 (= res!1047911 (validMask!0 mask!2512))))

(assert (=> start!130650 e!853732))

(assert (=> start!130650 true))

(declare-fun array_inv!38368 (array!101737) Bool)

(assert (=> start!130650 (array_inv!38368 a!2804)))

(declare-fun b!1531688 () Bool)

(declare-fun res!1047912 () Bool)

(assert (=> b!1531688 (=> (not res!1047912) (not e!853730))))

(assert (=> b!1531688 (= res!1047912 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49087 a!2804) j!70) a!2804 mask!2512) lt!663291))))

(assert (= (and start!130650 res!1047911) b!1531684))

(assert (= (and b!1531684 res!1047909) b!1531691))

(assert (= (and b!1531691 res!1047906) b!1531689))

(assert (= (and b!1531689 res!1047903) b!1531683))

(assert (= (and b!1531683 res!1047904) b!1531682))

(assert (= (and b!1531682 res!1047902) b!1531687))

(assert (= (and b!1531687 res!1047910) b!1531685))

(assert (= (and b!1531685 res!1047901) b!1531688))

(assert (= (and b!1531688 res!1047912) b!1531681))

(assert (= (and b!1531681 res!1047908) b!1531686))

(assert (= (and b!1531686 res!1047907) b!1531680))

(assert (= (and b!1531686 (not res!1047905)) b!1531690))

(declare-fun m!1414471 () Bool)

(assert (=> start!130650 m!1414471))

(declare-fun m!1414473 () Bool)

(assert (=> start!130650 m!1414473))

(declare-fun m!1414475 () Bool)

(assert (=> b!1531682 m!1414475))

(declare-fun m!1414477 () Bool)

(assert (=> b!1531688 m!1414477))

(assert (=> b!1531688 m!1414477))

(declare-fun m!1414479 () Bool)

(assert (=> b!1531688 m!1414479))

(assert (=> b!1531689 m!1414477))

(assert (=> b!1531689 m!1414477))

(declare-fun m!1414481 () Bool)

(assert (=> b!1531689 m!1414481))

(declare-fun m!1414483 () Bool)

(assert (=> b!1531681 m!1414483))

(declare-fun m!1414485 () Bool)

(assert (=> b!1531681 m!1414485))

(assert (=> b!1531681 m!1414485))

(declare-fun m!1414487 () Bool)

(assert (=> b!1531681 m!1414487))

(assert (=> b!1531681 m!1414487))

(assert (=> b!1531681 m!1414485))

(declare-fun m!1414489 () Bool)

(assert (=> b!1531681 m!1414489))

(declare-fun m!1414491 () Bool)

(assert (=> b!1531690 m!1414491))

(assert (=> b!1531680 m!1414477))

(assert (=> b!1531680 m!1414477))

(declare-fun m!1414493 () Bool)

(assert (=> b!1531680 m!1414493))

(assert (=> b!1531685 m!1414477))

(assert (=> b!1531685 m!1414477))

(declare-fun m!1414495 () Bool)

(assert (=> b!1531685 m!1414495))

(assert (=> b!1531685 m!1414495))

(assert (=> b!1531685 m!1414477))

(declare-fun m!1414497 () Bool)

(assert (=> b!1531685 m!1414497))

(declare-fun m!1414499 () Bool)

(assert (=> b!1531683 m!1414499))

(declare-fun m!1414501 () Bool)

(assert (=> b!1531691 m!1414501))

(assert (=> b!1531691 m!1414501))

(declare-fun m!1414503 () Bool)

(assert (=> b!1531691 m!1414503))

(assert (=> b!1531686 m!1414477))

(declare-fun m!1414505 () Bool)

(assert (=> b!1531686 m!1414505))

(assert (=> b!1531686 m!1414483))

(assert (=> b!1531686 m!1414485))

(declare-fun m!1414507 () Bool)

(assert (=> b!1531686 m!1414507))

(check-sat (not b!1531685) (not b!1531683) (not b!1531686) (not b!1531682) (not b!1531688) (not b!1531691) (not start!130650) (not b!1531681) (not b!1531680) (not b!1531690) (not b!1531689))
(check-sat)
