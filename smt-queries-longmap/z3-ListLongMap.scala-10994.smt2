; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129098 () Bool)

(assert start!129098)

(declare-fun b!1511006 () Bool)

(declare-fun res!1029739 () Bool)

(declare-fun e!844150 () Bool)

(assert (=> b!1511006 (=> (not res!1029739) (not e!844150))))

(declare-datatypes ((array!100768 0))(
  ( (array!100769 (arr!48616 (Array (_ BitVec 32) (_ BitVec 64))) (size!49167 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100768)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511006 (= res!1029739 (validKeyInArray!0 (select (arr!48616 a!2804) i!961)))))

(declare-fun b!1511007 () Bool)

(declare-fun res!1029735 () Bool)

(assert (=> b!1511007 (=> (not res!1029735) (not e!844150))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100768 (_ BitVec 32)) Bool)

(assert (=> b!1511007 (= res!1029735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511008 () Bool)

(declare-fun res!1029733 () Bool)

(declare-fun e!844151 () Bool)

(assert (=> b!1511008 (=> (not res!1029733) (not e!844151))))

(declare-datatypes ((SeekEntryResult!12680 0))(
  ( (MissingZero!12680 (index!53115 (_ BitVec 32))) (Found!12680 (index!53116 (_ BitVec 32))) (Intermediate!12680 (undefined!13492 Bool) (index!53117 (_ BitVec 32)) (x!135075 (_ BitVec 32))) (Undefined!12680) (MissingVacant!12680 (index!53118 (_ BitVec 32))) )
))
(declare-fun lt!655489 () SeekEntryResult!12680)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100768 (_ BitVec 32)) SeekEntryResult!12680)

(assert (=> b!1511008 (= res!1029733 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48616 a!2804) j!70) a!2804 mask!2512) lt!655489))))

(declare-fun b!1511009 () Bool)

(assert (=> b!1511009 (= e!844151 false)))

(declare-fun lt!655488 () SeekEntryResult!12680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511009 (= lt!655488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100769 (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49167 a!2804)) mask!2512))))

(declare-fun res!1029732 () Bool)

(assert (=> start!129098 (=> (not res!1029732) (not e!844150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129098 (= res!1029732 (validMask!0 mask!2512))))

(assert (=> start!129098 e!844150))

(assert (=> start!129098 true))

(declare-fun array_inv!37897 (array!100768) Bool)

(assert (=> start!129098 (array_inv!37897 a!2804)))

(declare-fun b!1511010 () Bool)

(declare-fun res!1029737 () Bool)

(assert (=> b!1511010 (=> (not res!1029737) (not e!844150))))

(assert (=> b!1511010 (= res!1029737 (validKeyInArray!0 (select (arr!48616 a!2804) j!70)))))

(declare-fun b!1511011 () Bool)

(declare-fun res!1029736 () Bool)

(assert (=> b!1511011 (=> (not res!1029736) (not e!844150))))

(assert (=> b!1511011 (= res!1029736 (and (= (size!49167 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49167 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49167 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511012 () Bool)

(declare-fun res!1029738 () Bool)

(assert (=> b!1511012 (=> (not res!1029738) (not e!844150))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511012 (= res!1029738 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49167 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49167 a!2804))))))

(declare-fun b!1511013 () Bool)

(declare-fun res!1029740 () Bool)

(assert (=> b!1511013 (=> (not res!1029740) (not e!844150))))

(declare-datatypes ((List!35086 0))(
  ( (Nil!35083) (Cons!35082 (h!36509 (_ BitVec 64)) (t!49772 List!35086)) )
))
(declare-fun arrayNoDuplicates!0 (array!100768 (_ BitVec 32) List!35086) Bool)

(assert (=> b!1511013 (= res!1029740 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35083))))

(declare-fun b!1511014 () Bool)

(assert (=> b!1511014 (= e!844150 e!844151)))

(declare-fun res!1029734 () Bool)

(assert (=> b!1511014 (=> (not res!1029734) (not e!844151))))

(assert (=> b!1511014 (= res!1029734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48616 a!2804) j!70) mask!2512) (select (arr!48616 a!2804) j!70) a!2804 mask!2512) lt!655489))))

(assert (=> b!1511014 (= lt!655489 (Intermediate!12680 false resIndex!21 resX!21))))

(assert (= (and start!129098 res!1029732) b!1511011))

(assert (= (and b!1511011 res!1029736) b!1511006))

(assert (= (and b!1511006 res!1029739) b!1511010))

(assert (= (and b!1511010 res!1029737) b!1511007))

(assert (= (and b!1511007 res!1029735) b!1511013))

(assert (= (and b!1511013 res!1029740) b!1511012))

(assert (= (and b!1511012 res!1029738) b!1511014))

(assert (= (and b!1511014 res!1029734) b!1511008))

(assert (= (and b!1511008 res!1029733) b!1511009))

(declare-fun m!1393419 () Bool)

(assert (=> b!1511013 m!1393419))

(declare-fun m!1393421 () Bool)

(assert (=> start!129098 m!1393421))

(declare-fun m!1393423 () Bool)

(assert (=> start!129098 m!1393423))

(declare-fun m!1393425 () Bool)

(assert (=> b!1511006 m!1393425))

(assert (=> b!1511006 m!1393425))

(declare-fun m!1393427 () Bool)

(assert (=> b!1511006 m!1393427))

(declare-fun m!1393429 () Bool)

(assert (=> b!1511010 m!1393429))

(assert (=> b!1511010 m!1393429))

(declare-fun m!1393431 () Bool)

(assert (=> b!1511010 m!1393431))

(declare-fun m!1393433 () Bool)

(assert (=> b!1511009 m!1393433))

(declare-fun m!1393435 () Bool)

(assert (=> b!1511009 m!1393435))

(assert (=> b!1511009 m!1393435))

(declare-fun m!1393437 () Bool)

(assert (=> b!1511009 m!1393437))

(assert (=> b!1511009 m!1393437))

(assert (=> b!1511009 m!1393435))

(declare-fun m!1393439 () Bool)

(assert (=> b!1511009 m!1393439))

(assert (=> b!1511014 m!1393429))

(assert (=> b!1511014 m!1393429))

(declare-fun m!1393441 () Bool)

(assert (=> b!1511014 m!1393441))

(assert (=> b!1511014 m!1393441))

(assert (=> b!1511014 m!1393429))

(declare-fun m!1393443 () Bool)

(assert (=> b!1511014 m!1393443))

(assert (=> b!1511008 m!1393429))

(assert (=> b!1511008 m!1393429))

(declare-fun m!1393445 () Bool)

(assert (=> b!1511008 m!1393445))

(declare-fun m!1393447 () Bool)

(assert (=> b!1511007 m!1393447))

(check-sat (not b!1511013) (not b!1511008) (not b!1511009) (not b!1511007) (not b!1511014) (not b!1511006) (not start!129098) (not b!1511010))
(check-sat)
