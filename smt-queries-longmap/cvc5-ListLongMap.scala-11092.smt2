; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129574 () Bool)

(assert start!129574)

(declare-fun res!1040325 () Bool)

(declare-fun e!848443 () Bool)

(assert (=> start!129574 (=> (not res!1040325) (not e!848443))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129574 (= res!1040325 (validMask!0 mask!2512))))

(assert (=> start!129574 e!848443))

(assert (=> start!129574 true))

(declare-datatypes ((array!101249 0))(
  ( (array!101250 (arr!48857 (Array (_ BitVec 32) (_ BitVec 64))) (size!49407 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101249)

(declare-fun array_inv!37885 (array!101249) Bool)

(assert (=> start!129574 (array_inv!37885 a!2804)))

(declare-fun b!1521100 () Bool)

(declare-fun res!1040328 () Bool)

(assert (=> b!1521100 (=> (not res!1040328) (not e!848443))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521100 (= res!1040328 (validKeyInArray!0 (select (arr!48857 a!2804) j!70)))))

(declare-fun b!1521101 () Bool)

(declare-fun res!1040329 () Bool)

(assert (=> b!1521101 (=> (not res!1040329) (not e!848443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101249 (_ BitVec 32)) Bool)

(assert (=> b!1521101 (= res!1040329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521102 () Bool)

(declare-fun res!1040324 () Bool)

(assert (=> b!1521102 (=> (not res!1040324) (not e!848443))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13022 0))(
  ( (MissingZero!13022 (index!54483 (_ BitVec 32))) (Found!13022 (index!54484 (_ BitVec 32))) (Intermediate!13022 (undefined!13834 Bool) (index!54485 (_ BitVec 32)) (x!136186 (_ BitVec 32))) (Undefined!13022) (MissingVacant!13022 (index!54486 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101249 (_ BitVec 32)) SeekEntryResult!13022)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521102 (= res!1040324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48857 a!2804) j!70) mask!2512) (select (arr!48857 a!2804) j!70) a!2804 mask!2512) (Intermediate!13022 false resIndex!21 resX!21)))))

(declare-fun b!1521103 () Bool)

(declare-fun res!1040323 () Bool)

(assert (=> b!1521103 (=> (not res!1040323) (not e!848443))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521103 (= res!1040323 (and (= (size!49407 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49407 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49407 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521104 () Bool)

(declare-fun res!1040322 () Bool)

(assert (=> b!1521104 (=> (not res!1040322) (not e!848443))))

(assert (=> b!1521104 (= res!1040322 (validKeyInArray!0 (select (arr!48857 a!2804) i!961)))))

(declare-fun b!1521105 () Bool)

(declare-fun res!1040326 () Bool)

(assert (=> b!1521105 (=> (not res!1040326) (not e!848443))))

(declare-datatypes ((List!35340 0))(
  ( (Nil!35337) (Cons!35336 (h!36757 (_ BitVec 64)) (t!50034 List!35340)) )
))
(declare-fun arrayNoDuplicates!0 (array!101249 (_ BitVec 32) List!35340) Bool)

(assert (=> b!1521105 (= res!1040326 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35337))))

(declare-fun b!1521106 () Bool)

(declare-fun res!1040327 () Bool)

(assert (=> b!1521106 (=> (not res!1040327) (not e!848443))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521106 (= res!1040327 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49407 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49407 a!2804))))))

(declare-fun b!1521107 () Bool)

(assert (=> b!1521107 (= e!848443 false)))

(declare-fun lt!659308 () SeekEntryResult!13022)

(assert (=> b!1521107 (= lt!659308 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48857 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129574 res!1040325) b!1521103))

(assert (= (and b!1521103 res!1040323) b!1521104))

(assert (= (and b!1521104 res!1040322) b!1521100))

(assert (= (and b!1521100 res!1040328) b!1521101))

(assert (= (and b!1521101 res!1040329) b!1521105))

(assert (= (and b!1521105 res!1040326) b!1521106))

(assert (= (and b!1521106 res!1040327) b!1521102))

(assert (= (and b!1521102 res!1040324) b!1521107))

(declare-fun m!1404221 () Bool)

(assert (=> b!1521101 m!1404221))

(declare-fun m!1404223 () Bool)

(assert (=> b!1521102 m!1404223))

(assert (=> b!1521102 m!1404223))

(declare-fun m!1404225 () Bool)

(assert (=> b!1521102 m!1404225))

(assert (=> b!1521102 m!1404225))

(assert (=> b!1521102 m!1404223))

(declare-fun m!1404227 () Bool)

(assert (=> b!1521102 m!1404227))

(declare-fun m!1404229 () Bool)

(assert (=> b!1521105 m!1404229))

(declare-fun m!1404231 () Bool)

(assert (=> start!129574 m!1404231))

(declare-fun m!1404233 () Bool)

(assert (=> start!129574 m!1404233))

(assert (=> b!1521107 m!1404223))

(assert (=> b!1521107 m!1404223))

(declare-fun m!1404235 () Bool)

(assert (=> b!1521107 m!1404235))

(declare-fun m!1404237 () Bool)

(assert (=> b!1521104 m!1404237))

(assert (=> b!1521104 m!1404237))

(declare-fun m!1404239 () Bool)

(assert (=> b!1521104 m!1404239))

(assert (=> b!1521100 m!1404223))

(assert (=> b!1521100 m!1404223))

(declare-fun m!1404241 () Bool)

(assert (=> b!1521100 m!1404241))

(push 1)

(assert (not b!1521102))

(assert (not b!1521101))

(assert (not b!1521107))

(assert (not b!1521105))

(assert (not b!1521104))

(assert (not start!129574))

(assert (not b!1521100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

