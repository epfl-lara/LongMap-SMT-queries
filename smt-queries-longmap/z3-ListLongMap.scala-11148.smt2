; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130632 () Bool)

(assert start!130632)

(declare-fun b!1531356 () Bool)

(declare-fun res!1047581 () Bool)

(declare-fun e!853596 () Bool)

(assert (=> b!1531356 (=> (not res!1047581) (not e!853596))))

(declare-datatypes ((SeekEntryResult!13136 0))(
  ( (MissingZero!13136 (index!54939 (_ BitVec 32))) (Found!13136 (index!54940 (_ BitVec 32))) (Intermediate!13136 (undefined!13948 Bool) (index!54941 (_ BitVec 32)) (x!136838 (_ BitVec 32))) (Undefined!13136) (MissingVacant!13136 (index!54942 (_ BitVec 32))) )
))
(declare-fun lt!663185 () SeekEntryResult!13136)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101719 0))(
  ( (array!101720 (arr!49078 (Array (_ BitVec 32) (_ BitVec 64))) (size!49629 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101719)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101719 (_ BitVec 32)) SeekEntryResult!13136)

(assert (=> b!1531356 (= res!1047581 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49078 a!2804) j!70) a!2804 mask!2512) lt!663185))))

(declare-fun b!1531358 () Bool)

(declare-fun res!1047580 () Bool)

(assert (=> b!1531358 (=> (not res!1047580) (not e!853596))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!663184 () SeekEntryResult!13136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531358 (= res!1047580 (= lt!663184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49078 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49078 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101720 (store (arr!49078 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49629 a!2804)) mask!2512)))))

(declare-fun b!1531359 () Bool)

(declare-fun res!1047577 () Bool)

(declare-fun e!853595 () Bool)

(assert (=> b!1531359 (=> (not res!1047577) (not e!853595))))

(assert (=> b!1531359 (= res!1047577 (and (= (size!49629 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49629 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49629 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531360 () Bool)

(declare-fun res!1047585 () Bool)

(assert (=> b!1531360 (=> (not res!1047585) (not e!853595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531360 (= res!1047585 (validKeyInArray!0 (select (arr!49078 a!2804) j!70)))))

(declare-fun b!1531361 () Bool)

(declare-fun res!1047588 () Bool)

(assert (=> b!1531361 (=> (not res!1047588) (not e!853595))))

(declare-datatypes ((List!35548 0))(
  ( (Nil!35545) (Cons!35544 (h!36998 (_ BitVec 64)) (t!50234 List!35548)) )
))
(declare-fun arrayNoDuplicates!0 (array!101719 (_ BitVec 32) List!35548) Bool)

(assert (=> b!1531361 (= res!1047588 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35545))))

(declare-fun e!853594 () Bool)

(declare-fun b!1531362 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101719 (_ BitVec 32)) SeekEntryResult!13136)

(assert (=> b!1531362 (= e!853594 (= (seekEntry!0 (select (arr!49078 a!2804) j!70) a!2804 mask!2512) (Found!13136 j!70)))))

(declare-fun b!1531363 () Bool)

(declare-fun res!1047586 () Bool)

(assert (=> b!1531363 (=> (not res!1047586) (not e!853595))))

(assert (=> b!1531363 (= res!1047586 (validKeyInArray!0 (select (arr!49078 a!2804) i!961)))))

(declare-fun b!1531357 () Bool)

(declare-fun res!1047579 () Bool)

(assert (=> b!1531357 (=> (not res!1047579) (not e!853595))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531357 (= res!1047579 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49629 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49629 a!2804))))))

(declare-fun res!1047584 () Bool)

(assert (=> start!130632 (=> (not res!1047584) (not e!853595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130632 (= res!1047584 (validMask!0 mask!2512))))

(assert (=> start!130632 e!853595))

(assert (=> start!130632 true))

(declare-fun array_inv!38359 (array!101719) Bool)

(assert (=> start!130632 (array_inv!38359 a!2804)))

(declare-fun b!1531364 () Bool)

(assert (=> b!1531364 (= e!853595 e!853596)))

(declare-fun res!1047582 () Bool)

(assert (=> b!1531364 (=> (not res!1047582) (not e!853596))))

(assert (=> b!1531364 (= res!1047582 (= lt!663184 lt!663185))))

(assert (=> b!1531364 (= lt!663185 (Intermediate!13136 false resIndex!21 resX!21))))

(assert (=> b!1531364 (= lt!663184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49078 a!2804) j!70) mask!2512) (select (arr!49078 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531365 () Bool)

(declare-fun e!853593 () Bool)

(assert (=> b!1531365 (= e!853596 (not e!853593))))

(declare-fun res!1047587 () Bool)

(assert (=> b!1531365 (=> res!1047587 e!853593)))

(assert (=> b!1531365 (= res!1047587 (or (not (= (select (arr!49078 a!2804) j!70) (select (store (arr!49078 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531365 e!853594))

(declare-fun res!1047578 () Bool)

(assert (=> b!1531365 (=> (not res!1047578) (not e!853594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101719 (_ BitVec 32)) Bool)

(assert (=> b!1531365 (= res!1047578 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51091 0))(
  ( (Unit!51092) )
))
(declare-fun lt!663183 () Unit!51091)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51091)

(assert (=> b!1531365 (= lt!663183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531366 () Bool)

(declare-fun res!1047583 () Bool)

(assert (=> b!1531366 (=> (not res!1047583) (not e!853595))))

(assert (=> b!1531366 (= res!1047583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531367 () Bool)

(assert (=> b!1531367 (= e!853593 true)))

(declare-fun lt!663186 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531367 (= lt!663186 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(assert (= (and start!130632 res!1047584) b!1531359))

(assert (= (and b!1531359 res!1047577) b!1531363))

(assert (= (and b!1531363 res!1047586) b!1531360))

(assert (= (and b!1531360 res!1047585) b!1531366))

(assert (= (and b!1531366 res!1047583) b!1531361))

(assert (= (and b!1531361 res!1047588) b!1531357))

(assert (= (and b!1531357 res!1047579) b!1531364))

(assert (= (and b!1531364 res!1047582) b!1531356))

(assert (= (and b!1531356 res!1047581) b!1531358))

(assert (= (and b!1531358 res!1047580) b!1531365))

(assert (= (and b!1531365 res!1047578) b!1531362))

(assert (= (and b!1531365 (not res!1047587)) b!1531367))

(declare-fun m!1414129 () Bool)

(assert (=> b!1531360 m!1414129))

(assert (=> b!1531360 m!1414129))

(declare-fun m!1414131 () Bool)

(assert (=> b!1531360 m!1414131))

(declare-fun m!1414133 () Bool)

(assert (=> b!1531367 m!1414133))

(assert (=> b!1531364 m!1414129))

(assert (=> b!1531364 m!1414129))

(declare-fun m!1414135 () Bool)

(assert (=> b!1531364 m!1414135))

(assert (=> b!1531364 m!1414135))

(assert (=> b!1531364 m!1414129))

(declare-fun m!1414137 () Bool)

(assert (=> b!1531364 m!1414137))

(assert (=> b!1531362 m!1414129))

(assert (=> b!1531362 m!1414129))

(declare-fun m!1414139 () Bool)

(assert (=> b!1531362 m!1414139))

(declare-fun m!1414141 () Bool)

(assert (=> b!1531361 m!1414141))

(declare-fun m!1414143 () Bool)

(assert (=> b!1531366 m!1414143))

(assert (=> b!1531356 m!1414129))

(assert (=> b!1531356 m!1414129))

(declare-fun m!1414145 () Bool)

(assert (=> b!1531356 m!1414145))

(declare-fun m!1414147 () Bool)

(assert (=> start!130632 m!1414147))

(declare-fun m!1414149 () Bool)

(assert (=> start!130632 m!1414149))

(declare-fun m!1414151 () Bool)

(assert (=> b!1531363 m!1414151))

(assert (=> b!1531363 m!1414151))

(declare-fun m!1414153 () Bool)

(assert (=> b!1531363 m!1414153))

(declare-fun m!1414155 () Bool)

(assert (=> b!1531358 m!1414155))

(declare-fun m!1414157 () Bool)

(assert (=> b!1531358 m!1414157))

(assert (=> b!1531358 m!1414157))

(declare-fun m!1414159 () Bool)

(assert (=> b!1531358 m!1414159))

(assert (=> b!1531358 m!1414159))

(assert (=> b!1531358 m!1414157))

(declare-fun m!1414161 () Bool)

(assert (=> b!1531358 m!1414161))

(assert (=> b!1531365 m!1414129))

(declare-fun m!1414163 () Bool)

(assert (=> b!1531365 m!1414163))

(assert (=> b!1531365 m!1414155))

(assert (=> b!1531365 m!1414157))

(declare-fun m!1414165 () Bool)

(assert (=> b!1531365 m!1414165))

(check-sat (not b!1531358) (not start!130632) (not b!1531366) (not b!1531367) (not b!1531362) (not b!1531360) (not b!1531361) (not b!1531364) (not b!1531356) (not b!1531365) (not b!1531363))
(check-sat)
