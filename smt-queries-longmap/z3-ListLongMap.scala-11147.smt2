; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130626 () Bool)

(assert start!130626)

(declare-fun b!1531248 () Bool)

(declare-fun res!1047470 () Bool)

(declare-fun e!853549 () Bool)

(assert (=> b!1531248 (=> (not res!1047470) (not e!853549))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101713 0))(
  ( (array!101714 (arr!49075 (Array (_ BitVec 32) (_ BitVec 64))) (size!49626 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101713)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531248 (= res!1047470 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49626 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49626 a!2804))))))

(declare-fun b!1531250 () Bool)

(declare-fun res!1047480 () Bool)

(assert (=> b!1531250 (=> (not res!1047480) (not e!853549))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531250 (= res!1047480 (validKeyInArray!0 (select (arr!49075 a!2804) i!961)))))

(declare-fun b!1531251 () Bool)

(declare-fun res!1047479 () Bool)

(declare-fun e!853551 () Bool)

(assert (=> b!1531251 (=> (not res!1047479) (not e!853551))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13133 0))(
  ( (MissingZero!13133 (index!54927 (_ BitVec 32))) (Found!13133 (index!54928 (_ BitVec 32))) (Intermediate!13133 (undefined!13945 Bool) (index!54929 (_ BitVec 32)) (x!136827 (_ BitVec 32))) (Undefined!13133) (MissingVacant!13133 (index!54930 (_ BitVec 32))) )
))
(declare-fun lt!663148 () SeekEntryResult!13133)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101713 (_ BitVec 32)) SeekEntryResult!13133)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531251 (= res!1047479 (= lt!663148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49075 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49075 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101714 (store (arr!49075 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49626 a!2804)) mask!2512)))))

(declare-fun b!1531252 () Bool)

(declare-fun e!853550 () Bool)

(assert (=> b!1531252 (= e!853550 true)))

(declare-fun lt!663150 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531252 (= lt!663150 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1531253 () Bool)

(assert (=> b!1531253 (= e!853551 (not e!853550))))

(declare-fun res!1047476 () Bool)

(assert (=> b!1531253 (=> res!1047476 e!853550)))

(assert (=> b!1531253 (= res!1047476 (or (not (= (select (arr!49075 a!2804) j!70) (select (store (arr!49075 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853548 () Bool)

(assert (=> b!1531253 e!853548))

(declare-fun res!1047473 () Bool)

(assert (=> b!1531253 (=> (not res!1047473) (not e!853548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101713 (_ BitVec 32)) Bool)

(assert (=> b!1531253 (= res!1047473 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51085 0))(
  ( (Unit!51086) )
))
(declare-fun lt!663147 () Unit!51085)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51085)

(assert (=> b!1531253 (= lt!663147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531254 () Bool)

(declare-fun res!1047474 () Bool)

(assert (=> b!1531254 (=> (not res!1047474) (not e!853549))))

(assert (=> b!1531254 (= res!1047474 (and (= (size!49626 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49626 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49626 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531255 () Bool)

(declare-fun res!1047471 () Bool)

(assert (=> b!1531255 (=> (not res!1047471) (not e!853549))))

(assert (=> b!1531255 (= res!1047471 (validKeyInArray!0 (select (arr!49075 a!2804) j!70)))))

(declare-fun b!1531256 () Bool)

(declare-fun res!1047475 () Bool)

(assert (=> b!1531256 (=> (not res!1047475) (not e!853551))))

(declare-fun lt!663149 () SeekEntryResult!13133)

(assert (=> b!1531256 (= res!1047475 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49075 a!2804) j!70) a!2804 mask!2512) lt!663149))))

(declare-fun b!1531257 () Bool)

(assert (=> b!1531257 (= e!853549 e!853551)))

(declare-fun res!1047469 () Bool)

(assert (=> b!1531257 (=> (not res!1047469) (not e!853551))))

(assert (=> b!1531257 (= res!1047469 (= lt!663148 lt!663149))))

(assert (=> b!1531257 (= lt!663149 (Intermediate!13133 false resIndex!21 resX!21))))

(assert (=> b!1531257 (= lt!663148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49075 a!2804) j!70) mask!2512) (select (arr!49075 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531258 () Bool)

(declare-fun res!1047477 () Bool)

(assert (=> b!1531258 (=> (not res!1047477) (not e!853549))))

(assert (=> b!1531258 (= res!1047477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531259 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101713 (_ BitVec 32)) SeekEntryResult!13133)

(assert (=> b!1531259 (= e!853548 (= (seekEntry!0 (select (arr!49075 a!2804) j!70) a!2804 mask!2512) (Found!13133 j!70)))))

(declare-fun b!1531249 () Bool)

(declare-fun res!1047472 () Bool)

(assert (=> b!1531249 (=> (not res!1047472) (not e!853549))))

(declare-datatypes ((List!35545 0))(
  ( (Nil!35542) (Cons!35541 (h!36995 (_ BitVec 64)) (t!50231 List!35545)) )
))
(declare-fun arrayNoDuplicates!0 (array!101713 (_ BitVec 32) List!35545) Bool)

(assert (=> b!1531249 (= res!1047472 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35542))))

(declare-fun res!1047478 () Bool)

(assert (=> start!130626 (=> (not res!1047478) (not e!853549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130626 (= res!1047478 (validMask!0 mask!2512))))

(assert (=> start!130626 e!853549))

(assert (=> start!130626 true))

(declare-fun array_inv!38356 (array!101713) Bool)

(assert (=> start!130626 (array_inv!38356 a!2804)))

(assert (= (and start!130626 res!1047478) b!1531254))

(assert (= (and b!1531254 res!1047474) b!1531250))

(assert (= (and b!1531250 res!1047480) b!1531255))

(assert (= (and b!1531255 res!1047471) b!1531258))

(assert (= (and b!1531258 res!1047477) b!1531249))

(assert (= (and b!1531249 res!1047472) b!1531248))

(assert (= (and b!1531248 res!1047470) b!1531257))

(assert (= (and b!1531257 res!1047469) b!1531256))

(assert (= (and b!1531256 res!1047475) b!1531251))

(assert (= (and b!1531251 res!1047479) b!1531253))

(assert (= (and b!1531253 res!1047473) b!1531259))

(assert (= (and b!1531253 (not res!1047476)) b!1531252))

(declare-fun m!1414015 () Bool)

(assert (=> b!1531251 m!1414015))

(declare-fun m!1414017 () Bool)

(assert (=> b!1531251 m!1414017))

(assert (=> b!1531251 m!1414017))

(declare-fun m!1414019 () Bool)

(assert (=> b!1531251 m!1414019))

(assert (=> b!1531251 m!1414019))

(assert (=> b!1531251 m!1414017))

(declare-fun m!1414021 () Bool)

(assert (=> b!1531251 m!1414021))

(declare-fun m!1414023 () Bool)

(assert (=> start!130626 m!1414023))

(declare-fun m!1414025 () Bool)

(assert (=> start!130626 m!1414025))

(declare-fun m!1414027 () Bool)

(assert (=> b!1531249 m!1414027))

(declare-fun m!1414029 () Bool)

(assert (=> b!1531258 m!1414029))

(declare-fun m!1414031 () Bool)

(assert (=> b!1531255 m!1414031))

(assert (=> b!1531255 m!1414031))

(declare-fun m!1414033 () Bool)

(assert (=> b!1531255 m!1414033))

(assert (=> b!1531259 m!1414031))

(assert (=> b!1531259 m!1414031))

(declare-fun m!1414035 () Bool)

(assert (=> b!1531259 m!1414035))

(assert (=> b!1531253 m!1414031))

(declare-fun m!1414037 () Bool)

(assert (=> b!1531253 m!1414037))

(assert (=> b!1531253 m!1414015))

(assert (=> b!1531253 m!1414017))

(declare-fun m!1414039 () Bool)

(assert (=> b!1531253 m!1414039))

(assert (=> b!1531257 m!1414031))

(assert (=> b!1531257 m!1414031))

(declare-fun m!1414041 () Bool)

(assert (=> b!1531257 m!1414041))

(assert (=> b!1531257 m!1414041))

(assert (=> b!1531257 m!1414031))

(declare-fun m!1414043 () Bool)

(assert (=> b!1531257 m!1414043))

(declare-fun m!1414045 () Bool)

(assert (=> b!1531252 m!1414045))

(assert (=> b!1531256 m!1414031))

(assert (=> b!1531256 m!1414031))

(declare-fun m!1414047 () Bool)

(assert (=> b!1531256 m!1414047))

(declare-fun m!1414049 () Bool)

(assert (=> b!1531250 m!1414049))

(assert (=> b!1531250 m!1414049))

(declare-fun m!1414051 () Bool)

(assert (=> b!1531250 m!1414051))

(check-sat (not b!1531255) (not b!1531251) (not b!1531249) (not b!1531256) (not b!1531257) (not b!1531253) (not start!130626) (not b!1531259) (not b!1531250) (not b!1531252) (not b!1531258))
(check-sat)
