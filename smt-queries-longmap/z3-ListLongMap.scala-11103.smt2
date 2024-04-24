; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130010 () Bool)

(assert start!130010)

(declare-fun b!1524169 () Bool)

(declare-fun res!1041968 () Bool)

(declare-fun e!850066 () Bool)

(assert (=> b!1524169 (=> (not res!1041968) (not e!850066))))

(declare-datatypes ((array!101434 0))(
  ( (array!101435 (arr!48943 (Array (_ BitVec 32) (_ BitVec 64))) (size!49494 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101434)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524169 (= res!1041968 (validKeyInArray!0 (select (arr!48943 a!2804) i!961)))))

(declare-fun b!1524170 () Bool)

(declare-fun e!850068 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1524170 (= e!850068 (and (bvsle #b00000000000000000000000000000000 (size!49494 a!2804)) (bvsgt j!70 (size!49494 a!2804))))))

(declare-fun b!1524171 () Bool)

(declare-fun res!1041973 () Bool)

(assert (=> b!1524171 (=> (not res!1041973) (not e!850068))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13001 0))(
  ( (MissingZero!13001 (index!54399 (_ BitVec 32))) (Found!13001 (index!54400 (_ BitVec 32))) (Intermediate!13001 (undefined!13813 Bool) (index!54401 (_ BitVec 32)) (x!136298 (_ BitVec 32))) (Undefined!13001) (MissingVacant!13001 (index!54402 (_ BitVec 32))) )
))
(declare-fun lt!660303 () SeekEntryResult!13001)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101434 (_ BitVec 32)) SeekEntryResult!13001)

(assert (=> b!1524171 (= res!1041973 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) lt!660303))))

(declare-fun res!1041970 () Bool)

(assert (=> start!130010 (=> (not res!1041970) (not e!850066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130010 (= res!1041970 (validMask!0 mask!2512))))

(assert (=> start!130010 e!850066))

(assert (=> start!130010 true))

(declare-fun array_inv!38224 (array!101434) Bool)

(assert (=> start!130010 (array_inv!38224 a!2804)))

(declare-fun b!1524172 () Bool)

(declare-fun res!1041967 () Bool)

(assert (=> b!1524172 (=> (not res!1041967) (not e!850066))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524172 (= res!1041967 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49494 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49494 a!2804))))))

(declare-fun b!1524173 () Bool)

(assert (=> b!1524173 (= e!850066 e!850068)))

(declare-fun res!1041965 () Bool)

(assert (=> b!1524173 (=> (not res!1041965) (not e!850068))))

(declare-fun lt!660304 () SeekEntryResult!13001)

(assert (=> b!1524173 (= res!1041965 (= lt!660304 lt!660303))))

(assert (=> b!1524173 (= lt!660303 (Intermediate!13001 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524173 (= lt!660304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) (select (arr!48943 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524174 () Bool)

(declare-fun res!1041969 () Bool)

(assert (=> b!1524174 (=> (not res!1041969) (not e!850066))))

(assert (=> b!1524174 (= res!1041969 (and (= (size!49494 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49494 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49494 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524175 () Bool)

(declare-fun res!1041971 () Bool)

(assert (=> b!1524175 (=> (not res!1041971) (not e!850066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101434 (_ BitVec 32)) Bool)

(assert (=> b!1524175 (= res!1041971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524176 () Bool)

(declare-fun res!1041972 () Bool)

(assert (=> b!1524176 (=> (not res!1041972) (not e!850066))))

(declare-datatypes ((List!35413 0))(
  ( (Nil!35410) (Cons!35409 (h!36848 (_ BitVec 64)) (t!50099 List!35413)) )
))
(declare-fun arrayNoDuplicates!0 (array!101434 (_ BitVec 32) List!35413) Bool)

(assert (=> b!1524176 (= res!1041972 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35410))))

(declare-fun b!1524177 () Bool)

(declare-fun res!1041974 () Bool)

(assert (=> b!1524177 (=> (not res!1041974) (not e!850066))))

(assert (=> b!1524177 (= res!1041974 (validKeyInArray!0 (select (arr!48943 a!2804) j!70)))))

(declare-fun b!1524178 () Bool)

(declare-fun res!1041966 () Bool)

(assert (=> b!1524178 (=> (not res!1041966) (not e!850068))))

(assert (=> b!1524178 (= res!1041966 (= lt!660304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101435 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49494 a!2804)) mask!2512)))))

(assert (= (and start!130010 res!1041970) b!1524174))

(assert (= (and b!1524174 res!1041969) b!1524169))

(assert (= (and b!1524169 res!1041968) b!1524177))

(assert (= (and b!1524177 res!1041974) b!1524175))

(assert (= (and b!1524175 res!1041971) b!1524176))

(assert (= (and b!1524176 res!1041972) b!1524172))

(assert (= (and b!1524172 res!1041967) b!1524173))

(assert (= (and b!1524173 res!1041965) b!1524171))

(assert (= (and b!1524171 res!1041973) b!1524178))

(assert (= (and b!1524178 res!1041966) b!1524170))

(declare-fun m!1407147 () Bool)

(assert (=> b!1524176 m!1407147))

(declare-fun m!1407149 () Bool)

(assert (=> b!1524173 m!1407149))

(assert (=> b!1524173 m!1407149))

(declare-fun m!1407151 () Bool)

(assert (=> b!1524173 m!1407151))

(assert (=> b!1524173 m!1407151))

(assert (=> b!1524173 m!1407149))

(declare-fun m!1407153 () Bool)

(assert (=> b!1524173 m!1407153))

(assert (=> b!1524171 m!1407149))

(assert (=> b!1524171 m!1407149))

(declare-fun m!1407155 () Bool)

(assert (=> b!1524171 m!1407155))

(assert (=> b!1524177 m!1407149))

(assert (=> b!1524177 m!1407149))

(declare-fun m!1407157 () Bool)

(assert (=> b!1524177 m!1407157))

(declare-fun m!1407159 () Bool)

(assert (=> b!1524169 m!1407159))

(assert (=> b!1524169 m!1407159))

(declare-fun m!1407161 () Bool)

(assert (=> b!1524169 m!1407161))

(declare-fun m!1407163 () Bool)

(assert (=> b!1524175 m!1407163))

(declare-fun m!1407165 () Bool)

(assert (=> start!130010 m!1407165))

(declare-fun m!1407167 () Bool)

(assert (=> start!130010 m!1407167))

(declare-fun m!1407169 () Bool)

(assert (=> b!1524178 m!1407169))

(declare-fun m!1407171 () Bool)

(assert (=> b!1524178 m!1407171))

(assert (=> b!1524178 m!1407171))

(declare-fun m!1407173 () Bool)

(assert (=> b!1524178 m!1407173))

(assert (=> b!1524178 m!1407173))

(assert (=> b!1524178 m!1407171))

(declare-fun m!1407175 () Bool)

(assert (=> b!1524178 m!1407175))

(check-sat (not b!1524169) (not b!1524173) (not b!1524177) (not b!1524176) (not b!1524178) (not start!130010) (not b!1524171) (not b!1524175))
(check-sat)
