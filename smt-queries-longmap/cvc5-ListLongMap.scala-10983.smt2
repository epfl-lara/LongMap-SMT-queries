; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128646 () Bool)

(assert start!128646)

(declare-fun b!1507896 () Bool)

(declare-fun e!842464 () Bool)

(declare-fun e!842462 () Bool)

(assert (=> b!1507896 (= e!842464 e!842462)))

(declare-fun res!1028011 () Bool)

(assert (=> b!1507896 (=> (not res!1028011) (not e!842462))))

(declare-datatypes ((SeekEntryResult!12701 0))(
  ( (MissingZero!12701 (index!53199 (_ BitVec 32))) (Found!12701 (index!53200 (_ BitVec 32))) (Intermediate!12701 (undefined!13513 Bool) (index!53201 (_ BitVec 32)) (x!134959 (_ BitVec 32))) (Undefined!12701) (MissingVacant!12701 (index!53202 (_ BitVec 32))) )
))
(declare-fun lt!654499 () SeekEntryResult!12701)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100580 0))(
  ( (array!100581 (arr!48530 (Array (_ BitVec 32) (_ BitVec 64))) (size!49080 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100580)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100580 (_ BitVec 32)) SeekEntryResult!12701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507896 (= res!1028011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48530 a!2804) j!70) mask!2512) (select (arr!48530 a!2804) j!70) a!2804 mask!2512) lt!654499))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507896 (= lt!654499 (Intermediate!12701 false resIndex!21 resX!21))))

(declare-fun b!1507897 () Bool)

(declare-fun res!1028017 () Bool)

(assert (=> b!1507897 (=> (not res!1028017) (not e!842464))))

(declare-datatypes ((List!35013 0))(
  ( (Nil!35010) (Cons!35009 (h!36415 (_ BitVec 64)) (t!49707 List!35013)) )
))
(declare-fun arrayNoDuplicates!0 (array!100580 (_ BitVec 32) List!35013) Bool)

(assert (=> b!1507897 (= res!1028017 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35010))))

(declare-fun b!1507898 () Bool)

(declare-fun res!1028016 () Bool)

(assert (=> b!1507898 (=> (not res!1028016) (not e!842464))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507898 (= res!1028016 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49080 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49080 a!2804))))))

(declare-fun b!1507899 () Bool)

(declare-fun res!1028010 () Bool)

(assert (=> b!1507899 (=> (not res!1028010) (not e!842462))))

(assert (=> b!1507899 (= res!1028010 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48530 a!2804) j!70) a!2804 mask!2512) lt!654499))))

(declare-fun b!1507900 () Bool)

(declare-fun res!1028009 () Bool)

(assert (=> b!1507900 (=> (not res!1028009) (not e!842464))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507900 (= res!1028009 (and (= (size!49080 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49080 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49080 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507901 () Bool)

(declare-fun res!1028014 () Bool)

(assert (=> b!1507901 (=> (not res!1028014) (not e!842464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507901 (= res!1028014 (validKeyInArray!0 (select (arr!48530 a!2804) j!70)))))

(declare-fun res!1028013 () Bool)

(assert (=> start!128646 (=> (not res!1028013) (not e!842464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128646 (= res!1028013 (validMask!0 mask!2512))))

(assert (=> start!128646 e!842464))

(assert (=> start!128646 true))

(declare-fun array_inv!37558 (array!100580) Bool)

(assert (=> start!128646 (array_inv!37558 a!2804)))

(declare-fun b!1507902 () Bool)

(declare-fun res!1028012 () Bool)

(assert (=> b!1507902 (=> (not res!1028012) (not e!842464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100580 (_ BitVec 32)) Bool)

(assert (=> b!1507902 (= res!1028012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507903 () Bool)

(declare-fun res!1028015 () Bool)

(assert (=> b!1507903 (=> (not res!1028015) (not e!842464))))

(assert (=> b!1507903 (= res!1028015 (validKeyInArray!0 (select (arr!48530 a!2804) i!961)))))

(declare-fun b!1507904 () Bool)

(assert (=> b!1507904 (= e!842462 (bvslt mask!2512 #b00000000000000000000000000000000))))

(assert (= (and start!128646 res!1028013) b!1507900))

(assert (= (and b!1507900 res!1028009) b!1507903))

(assert (= (and b!1507903 res!1028015) b!1507901))

(assert (= (and b!1507901 res!1028014) b!1507902))

(assert (= (and b!1507902 res!1028012) b!1507897))

(assert (= (and b!1507897 res!1028017) b!1507898))

(assert (= (and b!1507898 res!1028016) b!1507896))

(assert (= (and b!1507896 res!1028011) b!1507899))

(assert (= (and b!1507899 res!1028010) b!1507904))

(declare-fun m!1390519 () Bool)

(assert (=> b!1507897 m!1390519))

(declare-fun m!1390521 () Bool)

(assert (=> b!1507901 m!1390521))

(assert (=> b!1507901 m!1390521))

(declare-fun m!1390523 () Bool)

(assert (=> b!1507901 m!1390523))

(declare-fun m!1390525 () Bool)

(assert (=> start!128646 m!1390525))

(declare-fun m!1390527 () Bool)

(assert (=> start!128646 m!1390527))

(assert (=> b!1507896 m!1390521))

(assert (=> b!1507896 m!1390521))

(declare-fun m!1390529 () Bool)

(assert (=> b!1507896 m!1390529))

(assert (=> b!1507896 m!1390529))

(assert (=> b!1507896 m!1390521))

(declare-fun m!1390531 () Bool)

(assert (=> b!1507896 m!1390531))

(declare-fun m!1390533 () Bool)

(assert (=> b!1507903 m!1390533))

(assert (=> b!1507903 m!1390533))

(declare-fun m!1390535 () Bool)

(assert (=> b!1507903 m!1390535))

(declare-fun m!1390537 () Bool)

(assert (=> b!1507902 m!1390537))

(assert (=> b!1507899 m!1390521))

(assert (=> b!1507899 m!1390521))

(declare-fun m!1390539 () Bool)

(assert (=> b!1507899 m!1390539))

(push 1)

(assert (not b!1507897))

(assert (not b!1507899))

(assert (not b!1507901))

(assert (not b!1507896))

(assert (not start!128646))

(assert (not b!1507903))

