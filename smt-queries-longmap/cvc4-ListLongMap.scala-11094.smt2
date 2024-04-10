; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129590 () Bool)

(assert start!129590)

(declare-fun b!1521292 () Bool)

(declare-fun res!1040521 () Bool)

(declare-fun e!848490 () Bool)

(assert (=> b!1521292 (=> (not res!1040521) (not e!848490))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101265 0))(
  ( (array!101266 (arr!48865 (Array (_ BitVec 32) (_ BitVec 64))) (size!49415 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101265)

(assert (=> b!1521292 (= res!1040521 (and (= (size!49415 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49415 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49415 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521293 () Bool)

(declare-fun res!1040514 () Bool)

(assert (=> b!1521293 (=> (not res!1040514) (not e!848490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101265 (_ BitVec 32)) Bool)

(assert (=> b!1521293 (= res!1040514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521294 () Bool)

(declare-fun res!1040516 () Bool)

(assert (=> b!1521294 (=> (not res!1040516) (not e!848490))))

(declare-datatypes ((List!35348 0))(
  ( (Nil!35345) (Cons!35344 (h!36765 (_ BitVec 64)) (t!50042 List!35348)) )
))
(declare-fun arrayNoDuplicates!0 (array!101265 (_ BitVec 32) List!35348) Bool)

(assert (=> b!1521294 (= res!1040516 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35345))))

(declare-fun b!1521295 () Bool)

(declare-fun res!1040518 () Bool)

(assert (=> b!1521295 (=> (not res!1040518) (not e!848490))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13030 0))(
  ( (MissingZero!13030 (index!54515 (_ BitVec 32))) (Found!13030 (index!54516 (_ BitVec 32))) (Intermediate!13030 (undefined!13842 Bool) (index!54517 (_ BitVec 32)) (x!136210 (_ BitVec 32))) (Undefined!13030) (MissingVacant!13030 (index!54518 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101265 (_ BitVec 32)) SeekEntryResult!13030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521295 (= res!1040518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48865 a!2804) j!70) mask!2512) (select (arr!48865 a!2804) j!70) a!2804 mask!2512) (Intermediate!13030 false resIndex!21 resX!21)))))

(declare-fun b!1521296 () Bool)

(declare-fun res!1040517 () Bool)

(assert (=> b!1521296 (=> (not res!1040517) (not e!848490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521296 (= res!1040517 (validKeyInArray!0 (select (arr!48865 a!2804) i!961)))))

(declare-fun b!1521297 () Bool)

(assert (=> b!1521297 (= e!848490 false)))

(declare-fun lt!659332 () SeekEntryResult!13030)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521297 (= lt!659332 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48865 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1040519 () Bool)

(assert (=> start!129590 (=> (not res!1040519) (not e!848490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129590 (= res!1040519 (validMask!0 mask!2512))))

(assert (=> start!129590 e!848490))

(assert (=> start!129590 true))

(declare-fun array_inv!37893 (array!101265) Bool)

(assert (=> start!129590 (array_inv!37893 a!2804)))

(declare-fun b!1521298 () Bool)

(declare-fun res!1040520 () Bool)

(assert (=> b!1521298 (=> (not res!1040520) (not e!848490))))

(assert (=> b!1521298 (= res!1040520 (validKeyInArray!0 (select (arr!48865 a!2804) j!70)))))

(declare-fun b!1521299 () Bool)

(declare-fun res!1040515 () Bool)

(assert (=> b!1521299 (=> (not res!1040515) (not e!848490))))

(assert (=> b!1521299 (= res!1040515 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49415 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49415 a!2804))))))

(assert (= (and start!129590 res!1040519) b!1521292))

(assert (= (and b!1521292 res!1040521) b!1521296))

(assert (= (and b!1521296 res!1040517) b!1521298))

(assert (= (and b!1521298 res!1040520) b!1521293))

(assert (= (and b!1521293 res!1040514) b!1521294))

(assert (= (and b!1521294 res!1040516) b!1521299))

(assert (= (and b!1521299 res!1040515) b!1521295))

(assert (= (and b!1521295 res!1040518) b!1521297))

(declare-fun m!1404397 () Bool)

(assert (=> b!1521293 m!1404397))

(declare-fun m!1404399 () Bool)

(assert (=> b!1521295 m!1404399))

(assert (=> b!1521295 m!1404399))

(declare-fun m!1404401 () Bool)

(assert (=> b!1521295 m!1404401))

(assert (=> b!1521295 m!1404401))

(assert (=> b!1521295 m!1404399))

(declare-fun m!1404403 () Bool)

(assert (=> b!1521295 m!1404403))

(assert (=> b!1521297 m!1404399))

(assert (=> b!1521297 m!1404399))

(declare-fun m!1404405 () Bool)

(assert (=> b!1521297 m!1404405))

(assert (=> b!1521298 m!1404399))

(assert (=> b!1521298 m!1404399))

(declare-fun m!1404407 () Bool)

(assert (=> b!1521298 m!1404407))

(declare-fun m!1404409 () Bool)

(assert (=> start!129590 m!1404409))

(declare-fun m!1404411 () Bool)

(assert (=> start!129590 m!1404411))

(declare-fun m!1404413 () Bool)

(assert (=> b!1521296 m!1404413))

(assert (=> b!1521296 m!1404413))

(declare-fun m!1404415 () Bool)

(assert (=> b!1521296 m!1404415))

(declare-fun m!1404417 () Bool)

(assert (=> b!1521294 m!1404417))

(push 1)

(assert (not b!1521295))

(assert (not start!129590))

(assert (not b!1521296))

(assert (not b!1521298))

(assert (not b!1521297))

(assert (not b!1521294))

(assert (not b!1521293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

