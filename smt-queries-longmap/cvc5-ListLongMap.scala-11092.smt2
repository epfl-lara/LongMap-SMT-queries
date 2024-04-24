; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129948 () Bool)

(assert start!129948)

(declare-fun b!1523358 () Bool)

(declare-fun res!1041157 () Bool)

(declare-fun e!849825 () Bool)

(assert (=> b!1523358 (=> (not res!1041157) (not e!849825))))

(declare-datatypes ((array!101372 0))(
  ( (array!101373 (arr!48912 (Array (_ BitVec 32) (_ BitVec 64))) (size!49463 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101372)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101372 (_ BitVec 32)) Bool)

(assert (=> b!1523358 (= res!1041157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523359 () Bool)

(assert (=> b!1523359 (= e!849825 false)))

(declare-datatypes ((SeekEntryResult!12970 0))(
  ( (MissingZero!12970 (index!54275 (_ BitVec 32))) (Found!12970 (index!54276 (_ BitVec 32))) (Intermediate!12970 (undefined!13782 Bool) (index!54277 (_ BitVec 32)) (x!136179 (_ BitVec 32))) (Undefined!12970) (MissingVacant!12970 (index!54278 (_ BitVec 32))) )
))
(declare-fun lt!660154 () SeekEntryResult!12970)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101372 (_ BitVec 32)) SeekEntryResult!12970)

(assert (=> b!1523359 (= lt!660154 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48912 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523360 () Bool)

(declare-fun res!1041160 () Bool)

(assert (=> b!1523360 (=> (not res!1041160) (not e!849825))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523360 (= res!1041160 (and (= (size!49463 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49463 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49463 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1041156 () Bool)

(assert (=> start!129948 (=> (not res!1041156) (not e!849825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129948 (= res!1041156 (validMask!0 mask!2512))))

(assert (=> start!129948 e!849825))

(assert (=> start!129948 true))

(declare-fun array_inv!38193 (array!101372) Bool)

(assert (=> start!129948 (array_inv!38193 a!2804)))

(declare-fun b!1523361 () Bool)

(declare-fun res!1041161 () Bool)

(assert (=> b!1523361 (=> (not res!1041161) (not e!849825))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523361 (= res!1041161 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49463 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49463 a!2804))))))

(declare-fun b!1523362 () Bool)

(declare-fun res!1041159 () Bool)

(assert (=> b!1523362 (=> (not res!1041159) (not e!849825))))

(declare-datatypes ((List!35382 0))(
  ( (Nil!35379) (Cons!35378 (h!36817 (_ BitVec 64)) (t!50068 List!35382)) )
))
(declare-fun arrayNoDuplicates!0 (array!101372 (_ BitVec 32) List!35382) Bool)

(assert (=> b!1523362 (= res!1041159 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35379))))

(declare-fun b!1523363 () Bool)

(declare-fun res!1041155 () Bool)

(assert (=> b!1523363 (=> (not res!1041155) (not e!849825))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523363 (= res!1041155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48912 a!2804) j!70) mask!2512) (select (arr!48912 a!2804) j!70) a!2804 mask!2512) (Intermediate!12970 false resIndex!21 resX!21)))))

(declare-fun b!1523364 () Bool)

(declare-fun res!1041154 () Bool)

(assert (=> b!1523364 (=> (not res!1041154) (not e!849825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523364 (= res!1041154 (validKeyInArray!0 (select (arr!48912 a!2804) i!961)))))

(declare-fun b!1523365 () Bool)

(declare-fun res!1041158 () Bool)

(assert (=> b!1523365 (=> (not res!1041158) (not e!849825))))

(assert (=> b!1523365 (= res!1041158 (validKeyInArray!0 (select (arr!48912 a!2804) j!70)))))

(assert (= (and start!129948 res!1041156) b!1523360))

(assert (= (and b!1523360 res!1041160) b!1523364))

(assert (= (and b!1523364 res!1041154) b!1523365))

(assert (= (and b!1523365 res!1041158) b!1523358))

(assert (= (and b!1523358 res!1041157) b!1523362))

(assert (= (and b!1523362 res!1041159) b!1523361))

(assert (= (and b!1523361 res!1041161) b!1523363))

(assert (= (and b!1523363 res!1041155) b!1523359))

(declare-fun m!1406333 () Bool)

(assert (=> b!1523365 m!1406333))

(assert (=> b!1523365 m!1406333))

(declare-fun m!1406335 () Bool)

(assert (=> b!1523365 m!1406335))

(declare-fun m!1406337 () Bool)

(assert (=> start!129948 m!1406337))

(declare-fun m!1406339 () Bool)

(assert (=> start!129948 m!1406339))

(declare-fun m!1406341 () Bool)

(assert (=> b!1523364 m!1406341))

(assert (=> b!1523364 m!1406341))

(declare-fun m!1406343 () Bool)

(assert (=> b!1523364 m!1406343))

(declare-fun m!1406345 () Bool)

(assert (=> b!1523362 m!1406345))

(declare-fun m!1406347 () Bool)

(assert (=> b!1523358 m!1406347))

(assert (=> b!1523359 m!1406333))

(assert (=> b!1523359 m!1406333))

(declare-fun m!1406349 () Bool)

(assert (=> b!1523359 m!1406349))

(assert (=> b!1523363 m!1406333))

(assert (=> b!1523363 m!1406333))

(declare-fun m!1406351 () Bool)

(assert (=> b!1523363 m!1406351))

(assert (=> b!1523363 m!1406351))

(assert (=> b!1523363 m!1406333))

(declare-fun m!1406353 () Bool)

(assert (=> b!1523363 m!1406353))

(push 1)

(assert (not b!1523358))

(assert (not b!1523365))

(assert (not b!1523362))

(assert (not b!1523359))

(assert (not b!1523363))

(assert (not b!1523364))

(assert (not start!129948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

