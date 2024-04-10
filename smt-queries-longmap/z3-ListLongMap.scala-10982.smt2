; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128642 () Bool)

(assert start!128642)

(declare-fun b!1507846 () Bool)

(declare-fun e!842448 () Bool)

(assert (=> b!1507846 (= e!842448 false)))

(declare-datatypes ((SeekEntryResult!12699 0))(
  ( (MissingZero!12699 (index!53191 (_ BitVec 32))) (Found!12699 (index!53192 (_ BitVec 32))) (Intermediate!12699 (undefined!13511 Bool) (index!53193 (_ BitVec 32)) (x!134949 (_ BitVec 32))) (Undefined!12699) (MissingVacant!12699 (index!53194 (_ BitVec 32))) )
))
(declare-fun lt!654493 () SeekEntryResult!12699)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100576 0))(
  ( (array!100577 (arr!48528 (Array (_ BitVec 32) (_ BitVec 64))) (size!49078 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100576)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100576 (_ BitVec 32)) SeekEntryResult!12699)

(assert (=> b!1507846 (= lt!654493 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48528 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507847 () Bool)

(declare-fun res!1027964 () Bool)

(assert (=> b!1507847 (=> (not res!1027964) (not e!842448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507847 (= res!1027964 (validKeyInArray!0 (select (arr!48528 a!2804) j!70)))))

(declare-fun b!1507848 () Bool)

(declare-fun res!1027963 () Bool)

(assert (=> b!1507848 (=> (not res!1027963) (not e!842448))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507848 (= res!1027963 (and (= (size!49078 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49078 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49078 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1027959 () Bool)

(assert (=> start!128642 (=> (not res!1027959) (not e!842448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128642 (= res!1027959 (validMask!0 mask!2512))))

(assert (=> start!128642 e!842448))

(assert (=> start!128642 true))

(declare-fun array_inv!37556 (array!100576) Bool)

(assert (=> start!128642 (array_inv!37556 a!2804)))

(declare-fun b!1507849 () Bool)

(declare-fun res!1027965 () Bool)

(assert (=> b!1507849 (=> (not res!1027965) (not e!842448))))

(assert (=> b!1507849 (= res!1027965 (validKeyInArray!0 (select (arr!48528 a!2804) i!961)))))

(declare-fun b!1507850 () Bool)

(declare-fun res!1027960 () Bool)

(assert (=> b!1507850 (=> (not res!1027960) (not e!842448))))

(declare-datatypes ((List!35011 0))(
  ( (Nil!35008) (Cons!35007 (h!36413 (_ BitVec 64)) (t!49705 List!35011)) )
))
(declare-fun arrayNoDuplicates!0 (array!100576 (_ BitVec 32) List!35011) Bool)

(assert (=> b!1507850 (= res!1027960 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35008))))

(declare-fun b!1507851 () Bool)

(declare-fun res!1027966 () Bool)

(assert (=> b!1507851 (=> (not res!1027966) (not e!842448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100576 (_ BitVec 32)) Bool)

(assert (=> b!1507851 (= res!1027966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507852 () Bool)

(declare-fun res!1027962 () Bool)

(assert (=> b!1507852 (=> (not res!1027962) (not e!842448))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507852 (= res!1027962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48528 a!2804) j!70) mask!2512) (select (arr!48528 a!2804) j!70) a!2804 mask!2512) (Intermediate!12699 false resIndex!21 resX!21)))))

(declare-fun b!1507853 () Bool)

(declare-fun res!1027961 () Bool)

(assert (=> b!1507853 (=> (not res!1027961) (not e!842448))))

(assert (=> b!1507853 (= res!1027961 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49078 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49078 a!2804))))))

(assert (= (and start!128642 res!1027959) b!1507848))

(assert (= (and b!1507848 res!1027963) b!1507849))

(assert (= (and b!1507849 res!1027965) b!1507847))

(assert (= (and b!1507847 res!1027964) b!1507851))

(assert (= (and b!1507851 res!1027966) b!1507850))

(assert (= (and b!1507850 res!1027960) b!1507853))

(assert (= (and b!1507853 res!1027961) b!1507852))

(assert (= (and b!1507852 res!1027962) b!1507846))

(declare-fun m!1390475 () Bool)

(assert (=> b!1507846 m!1390475))

(assert (=> b!1507846 m!1390475))

(declare-fun m!1390477 () Bool)

(assert (=> b!1507846 m!1390477))

(declare-fun m!1390479 () Bool)

(assert (=> b!1507851 m!1390479))

(assert (=> b!1507847 m!1390475))

(assert (=> b!1507847 m!1390475))

(declare-fun m!1390481 () Bool)

(assert (=> b!1507847 m!1390481))

(declare-fun m!1390483 () Bool)

(assert (=> b!1507850 m!1390483))

(declare-fun m!1390485 () Bool)

(assert (=> b!1507849 m!1390485))

(assert (=> b!1507849 m!1390485))

(declare-fun m!1390487 () Bool)

(assert (=> b!1507849 m!1390487))

(assert (=> b!1507852 m!1390475))

(assert (=> b!1507852 m!1390475))

(declare-fun m!1390489 () Bool)

(assert (=> b!1507852 m!1390489))

(assert (=> b!1507852 m!1390489))

(assert (=> b!1507852 m!1390475))

(declare-fun m!1390491 () Bool)

(assert (=> b!1507852 m!1390491))

(declare-fun m!1390493 () Bool)

(assert (=> start!128642 m!1390493))

(declare-fun m!1390495 () Bool)

(assert (=> start!128642 m!1390495))

(check-sat (not start!128642) (not b!1507846) (not b!1507847) (not b!1507850) (not b!1507851) (not b!1507849) (not b!1507852))
