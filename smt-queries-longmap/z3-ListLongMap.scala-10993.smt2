; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128792 () Bool)

(assert start!128792)

(declare-fun b!1509120 () Bool)

(declare-fun res!1029023 () Bool)

(declare-fun e!842998 () Bool)

(assert (=> b!1509120 (=> (not res!1029023) (not e!842998))))

(declare-datatypes ((array!100648 0))(
  ( (array!100649 (arr!48561 (Array (_ BitVec 32) (_ BitVec 64))) (size!49111 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100648)

(declare-datatypes ((List!35044 0))(
  ( (Nil!35041) (Cons!35040 (h!36452 (_ BitVec 64)) (t!49738 List!35044)) )
))
(declare-fun arrayNoDuplicates!0 (array!100648 (_ BitVec 32) List!35044) Bool)

(assert (=> b!1509120 (= res!1029023 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35041))))

(declare-fun b!1509121 () Bool)

(declare-fun res!1029029 () Bool)

(assert (=> b!1509121 (=> (not res!1029029) (not e!842998))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1509121 (= res!1029029 (and (= (size!49111 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49111 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49111 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509122 () Bool)

(declare-fun res!1029028 () Bool)

(declare-fun e!842996 () Bool)

(assert (=> b!1509122 (=> (not res!1029028) (not e!842996))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12732 0))(
  ( (MissingZero!12732 (index!53323 (_ BitVec 32))) (Found!12732 (index!53324 (_ BitVec 32))) (Intermediate!12732 (undefined!13544 Bool) (index!53325 (_ BitVec 32)) (x!135082 (_ BitVec 32))) (Undefined!12732) (MissingVacant!12732 (index!53326 (_ BitVec 32))) )
))
(declare-fun lt!654814 () SeekEntryResult!12732)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100648 (_ BitVec 32)) SeekEntryResult!12732)

(assert (=> b!1509122 (= res!1029028 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48561 a!2804) j!70) a!2804 mask!2512) lt!654814))))

(declare-fun res!1029030 () Bool)

(assert (=> start!128792 (=> (not res!1029030) (not e!842998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128792 (= res!1029030 (validMask!0 mask!2512))))

(assert (=> start!128792 e!842998))

(assert (=> start!128792 true))

(declare-fun array_inv!37589 (array!100648) Bool)

(assert (=> start!128792 (array_inv!37589 a!2804)))

(declare-fun b!1509123 () Bool)

(declare-fun res!1029026 () Bool)

(assert (=> b!1509123 (=> (not res!1029026) (not e!842998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509123 (= res!1029026 (validKeyInArray!0 (select (arr!48561 a!2804) i!961)))))

(declare-fun b!1509124 () Bool)

(declare-fun res!1029024 () Bool)

(assert (=> b!1509124 (=> (not res!1029024) (not e!842998))))

(assert (=> b!1509124 (= res!1029024 (validKeyInArray!0 (select (arr!48561 a!2804) j!70)))))

(declare-fun b!1509125 () Bool)

(assert (=> b!1509125 (= e!842996 false)))

(declare-fun lt!654813 () SeekEntryResult!12732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509125 (= lt!654813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48561 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48561 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100649 (store (arr!48561 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49111 a!2804)) mask!2512))))

(declare-fun b!1509126 () Bool)

(assert (=> b!1509126 (= e!842998 e!842996)))

(declare-fun res!1029031 () Bool)

(assert (=> b!1509126 (=> (not res!1029031) (not e!842996))))

(assert (=> b!1509126 (= res!1029031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48561 a!2804) j!70) mask!2512) (select (arr!48561 a!2804) j!70) a!2804 mask!2512) lt!654814))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509126 (= lt!654814 (Intermediate!12732 false resIndex!21 resX!21))))

(declare-fun b!1509127 () Bool)

(declare-fun res!1029027 () Bool)

(assert (=> b!1509127 (=> (not res!1029027) (not e!842998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100648 (_ BitVec 32)) Bool)

(assert (=> b!1509127 (= res!1029027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509128 () Bool)

(declare-fun res!1029025 () Bool)

(assert (=> b!1509128 (=> (not res!1029025) (not e!842998))))

(assert (=> b!1509128 (= res!1029025 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49111 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49111 a!2804))))))

(assert (= (and start!128792 res!1029030) b!1509121))

(assert (= (and b!1509121 res!1029029) b!1509123))

(assert (= (and b!1509123 res!1029026) b!1509124))

(assert (= (and b!1509124 res!1029024) b!1509127))

(assert (= (and b!1509127 res!1029027) b!1509120))

(assert (= (and b!1509120 res!1029023) b!1509128))

(assert (= (and b!1509128 res!1029025) b!1509126))

(assert (= (and b!1509126 res!1029031) b!1509122))

(assert (= (and b!1509122 res!1029028) b!1509125))

(declare-fun m!1391563 () Bool)

(assert (=> start!128792 m!1391563))

(declare-fun m!1391565 () Bool)

(assert (=> start!128792 m!1391565))

(declare-fun m!1391567 () Bool)

(assert (=> b!1509123 m!1391567))

(assert (=> b!1509123 m!1391567))

(declare-fun m!1391569 () Bool)

(assert (=> b!1509123 m!1391569))

(declare-fun m!1391571 () Bool)

(assert (=> b!1509127 m!1391571))

(declare-fun m!1391573 () Bool)

(assert (=> b!1509122 m!1391573))

(assert (=> b!1509122 m!1391573))

(declare-fun m!1391575 () Bool)

(assert (=> b!1509122 m!1391575))

(assert (=> b!1509126 m!1391573))

(assert (=> b!1509126 m!1391573))

(declare-fun m!1391577 () Bool)

(assert (=> b!1509126 m!1391577))

(assert (=> b!1509126 m!1391577))

(assert (=> b!1509126 m!1391573))

(declare-fun m!1391579 () Bool)

(assert (=> b!1509126 m!1391579))

(declare-fun m!1391581 () Bool)

(assert (=> b!1509125 m!1391581))

(declare-fun m!1391583 () Bool)

(assert (=> b!1509125 m!1391583))

(assert (=> b!1509125 m!1391583))

(declare-fun m!1391585 () Bool)

(assert (=> b!1509125 m!1391585))

(assert (=> b!1509125 m!1391585))

(assert (=> b!1509125 m!1391583))

(declare-fun m!1391587 () Bool)

(assert (=> b!1509125 m!1391587))

(assert (=> b!1509124 m!1391573))

(assert (=> b!1509124 m!1391573))

(declare-fun m!1391589 () Bool)

(assert (=> b!1509124 m!1391589))

(declare-fun m!1391591 () Bool)

(assert (=> b!1509120 m!1391591))

(check-sat (not b!1509123) (not b!1509124) (not start!128792) (not b!1509125) (not b!1509122) (not b!1509126) (not b!1509127) (not b!1509120))
(check-sat)
