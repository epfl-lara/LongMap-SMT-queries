; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128462 () Bool)

(assert start!128462)

(declare-fun b!1506566 () Bool)

(declare-fun res!1027103 () Bool)

(declare-fun e!841823 () Bool)

(assert (=> b!1506566 (=> (not res!1027103) (not e!841823))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100474 0))(
  ( (array!100475 (arr!48481 (Array (_ BitVec 32) (_ BitVec 64))) (size!49033 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100474)

(assert (=> b!1506566 (= res!1027103 (and (= (size!49033 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49033 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49033 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506568 () Bool)

(declare-fun res!1027098 () Bool)

(assert (=> b!1506568 (=> (not res!1027098) (not e!841823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506568 (= res!1027098 (validKeyInArray!0 (select (arr!48481 a!2804) j!70)))))

(declare-fun b!1506569 () Bool)

(declare-fun e!841822 () Bool)

(assert (=> b!1506569 (= e!841822 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506570 () Bool)

(declare-fun res!1027097 () Bool)

(assert (=> b!1506570 (=> (not res!1027097) (not e!841822))))

(declare-datatypes ((SeekEntryResult!12675 0))(
  ( (MissingZero!12675 (index!53095 (_ BitVec 32))) (Found!12675 (index!53096 (_ BitVec 32))) (Intermediate!12675 (undefined!13487 Bool) (index!53097 (_ BitVec 32)) (x!134851 (_ BitVec 32))) (Undefined!12675) (MissingVacant!12675 (index!53098 (_ BitVec 32))) )
))
(declare-fun lt!653985 () SeekEntryResult!12675)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100474 (_ BitVec 32)) SeekEntryResult!12675)

(assert (=> b!1506570 (= res!1027097 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48481 a!2804) j!70) a!2804 mask!2512) lt!653985))))

(declare-fun b!1506571 () Bool)

(declare-fun res!1027095 () Bool)

(assert (=> b!1506571 (=> (not res!1027095) (not e!841823))))

(declare-datatypes ((List!35042 0))(
  ( (Nil!35039) (Cons!35038 (h!36439 (_ BitVec 64)) (t!49728 List!35042)) )
))
(declare-fun arrayNoDuplicates!0 (array!100474 (_ BitVec 32) List!35042) Bool)

(assert (=> b!1506571 (= res!1027095 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35039))))

(declare-fun b!1506572 () Bool)

(declare-fun res!1027096 () Bool)

(assert (=> b!1506572 (=> (not res!1027096) (not e!841823))))

(assert (=> b!1506572 (= res!1027096 (validKeyInArray!0 (select (arr!48481 a!2804) i!961)))))

(declare-fun res!1027101 () Bool)

(assert (=> start!128462 (=> (not res!1027101) (not e!841823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128462 (= res!1027101 (validMask!0 mask!2512))))

(assert (=> start!128462 e!841823))

(assert (=> start!128462 true))

(declare-fun array_inv!37714 (array!100474) Bool)

(assert (=> start!128462 (array_inv!37714 a!2804)))

(declare-fun b!1506567 () Bool)

(declare-fun res!1027102 () Bool)

(assert (=> b!1506567 (=> (not res!1027102) (not e!841823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100474 (_ BitVec 32)) Bool)

(assert (=> b!1506567 (= res!1027102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506573 () Bool)

(assert (=> b!1506573 (= e!841823 e!841822)))

(declare-fun res!1027100 () Bool)

(assert (=> b!1506573 (=> (not res!1027100) (not e!841822))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506573 (= res!1027100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48481 a!2804) j!70) mask!2512) (select (arr!48481 a!2804) j!70) a!2804 mask!2512) lt!653985))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1506573 (= lt!653985 (Intermediate!12675 false resIndex!21 resX!21))))

(declare-fun b!1506574 () Bool)

(declare-fun res!1027099 () Bool)

(assert (=> b!1506574 (=> (not res!1027099) (not e!841823))))

(assert (=> b!1506574 (= res!1027099 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49033 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49033 a!2804))))))

(assert (= (and start!128462 res!1027101) b!1506566))

(assert (= (and b!1506566 res!1027103) b!1506572))

(assert (= (and b!1506572 res!1027096) b!1506568))

(assert (= (and b!1506568 res!1027098) b!1506567))

(assert (= (and b!1506567 res!1027102) b!1506571))

(assert (= (and b!1506571 res!1027095) b!1506574))

(assert (= (and b!1506574 res!1027099) b!1506573))

(assert (= (and b!1506573 res!1027100) b!1506570))

(assert (= (and b!1506570 res!1027097) b!1506569))

(declare-fun m!1388891 () Bool)

(assert (=> b!1506573 m!1388891))

(assert (=> b!1506573 m!1388891))

(declare-fun m!1388893 () Bool)

(assert (=> b!1506573 m!1388893))

(assert (=> b!1506573 m!1388893))

(assert (=> b!1506573 m!1388891))

(declare-fun m!1388895 () Bool)

(assert (=> b!1506573 m!1388895))

(declare-fun m!1388897 () Bool)

(assert (=> b!1506567 m!1388897))

(declare-fun m!1388899 () Bool)

(assert (=> b!1506572 m!1388899))

(assert (=> b!1506572 m!1388899))

(declare-fun m!1388901 () Bool)

(assert (=> b!1506572 m!1388901))

(declare-fun m!1388903 () Bool)

(assert (=> b!1506571 m!1388903))

(assert (=> b!1506568 m!1388891))

(assert (=> b!1506568 m!1388891))

(declare-fun m!1388905 () Bool)

(assert (=> b!1506568 m!1388905))

(declare-fun m!1388907 () Bool)

(assert (=> start!128462 m!1388907))

(declare-fun m!1388909 () Bool)

(assert (=> start!128462 m!1388909))

(assert (=> b!1506570 m!1388891))

(assert (=> b!1506570 m!1388891))

(declare-fun m!1388911 () Bool)

(assert (=> b!1506570 m!1388911))

(check-sat (not b!1506572) (not b!1506567) (not b!1506570) (not b!1506573) (not start!128462) (not b!1506571) (not b!1506568))
(check-sat)
