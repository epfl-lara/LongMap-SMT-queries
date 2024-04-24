; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130022 () Bool)

(assert start!130022)

(declare-fun b!1524341 () Bool)

(declare-fun res!1042136 () Bool)

(declare-fun e!850122 () Bool)

(assert (=> b!1524341 (=> (not res!1042136) (not e!850122))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101446 0))(
  ( (array!101447 (arr!48949 (Array (_ BitVec 32) (_ BitVec 64))) (size!49500 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101446)

(assert (=> b!1524341 (= res!1042136 (and (= (size!49500 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49500 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49500 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524342 () Bool)

(declare-fun e!850121 () Bool)

(assert (=> b!1524342 (= e!850122 e!850121)))

(declare-fun res!1042144 () Bool)

(assert (=> b!1524342 (=> (not res!1042144) (not e!850121))))

(declare-datatypes ((SeekEntryResult!13007 0))(
  ( (MissingZero!13007 (index!54423 (_ BitVec 32))) (Found!13007 (index!54424 (_ BitVec 32))) (Intermediate!13007 (undefined!13819 Bool) (index!54425 (_ BitVec 32)) (x!136320 (_ BitVec 32))) (Undefined!13007) (MissingVacant!13007 (index!54426 (_ BitVec 32))) )
))
(declare-fun lt!660341 () SeekEntryResult!13007)

(declare-fun lt!660343 () SeekEntryResult!13007)

(assert (=> b!1524342 (= res!1042144 (= lt!660341 lt!660343))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524342 (= lt!660343 (Intermediate!13007 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101446 (_ BitVec 32)) SeekEntryResult!13007)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524342 (= lt!660341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48949 a!2804) j!70) mask!2512) (select (arr!48949 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524343 () Bool)

(declare-fun res!1042143 () Bool)

(assert (=> b!1524343 (=> (not res!1042143) (not e!850122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524343 (= res!1042143 (validKeyInArray!0 (select (arr!48949 a!2804) i!961)))))

(declare-fun b!1524344 () Bool)

(declare-fun res!1042138 () Bool)

(assert (=> b!1524344 (=> (not res!1042138) (not e!850122))))

(assert (=> b!1524344 (= res!1042138 (validKeyInArray!0 (select (arr!48949 a!2804) j!70)))))

(declare-fun b!1524345 () Bool)

(declare-fun res!1042140 () Bool)

(assert (=> b!1524345 (=> (not res!1042140) (not e!850122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101446 (_ BitVec 32)) Bool)

(assert (=> b!1524345 (= res!1042140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524346 () Bool)

(declare-fun res!1042139 () Bool)

(assert (=> b!1524346 (=> (not res!1042139) (not e!850121))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524346 (= res!1042139 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48949 a!2804) j!70) a!2804 mask!2512) lt!660343))))

(declare-fun b!1524347 () Bool)

(declare-fun res!1042142 () Bool)

(assert (=> b!1524347 (=> (not res!1042142) (not e!850121))))

(assert (=> b!1524347 (= res!1042142 (= lt!660341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101447 (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49500 a!2804)) mask!2512)))))

(declare-fun res!1042145 () Bool)

(assert (=> start!130022 (=> (not res!1042145) (not e!850122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130022 (= res!1042145 (validMask!0 mask!2512))))

(assert (=> start!130022 e!850122))

(assert (=> start!130022 true))

(declare-fun array_inv!38230 (array!101446) Bool)

(assert (=> start!130022 (array_inv!38230 a!2804)))

(declare-fun b!1524340 () Bool)

(declare-fun res!1042141 () Bool)

(assert (=> b!1524340 (=> (not res!1042141) (not e!850122))))

(declare-datatypes ((List!35419 0))(
  ( (Nil!35416) (Cons!35415 (h!36854 (_ BitVec 64)) (t!50105 List!35419)) )
))
(declare-fun arrayNoDuplicates!0 (array!101446 (_ BitVec 32) List!35419) Bool)

(assert (=> b!1524340 (= res!1042141 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35416))))

(declare-fun b!1524348 () Bool)

(declare-fun res!1042137 () Bool)

(assert (=> b!1524348 (=> (not res!1042137) (not e!850122))))

(assert (=> b!1524348 (= res!1042137 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49500 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49500 a!2804))))))

(declare-fun b!1524349 () Bool)

(assert (=> b!1524349 (= e!850121 (not true))))

(assert (=> b!1524349 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50833 0))(
  ( (Unit!50834) )
))
(declare-fun lt!660342 () Unit!50833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50833)

(assert (=> b!1524349 (= lt!660342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130022 res!1042145) b!1524341))

(assert (= (and b!1524341 res!1042136) b!1524343))

(assert (= (and b!1524343 res!1042143) b!1524344))

(assert (= (and b!1524344 res!1042138) b!1524345))

(assert (= (and b!1524345 res!1042140) b!1524340))

(assert (= (and b!1524340 res!1042141) b!1524348))

(assert (= (and b!1524348 res!1042137) b!1524342))

(assert (= (and b!1524342 res!1042144) b!1524346))

(assert (= (and b!1524346 res!1042139) b!1524347))

(assert (= (and b!1524347 res!1042142) b!1524349))

(declare-fun m!1407327 () Bool)

(assert (=> b!1524344 m!1407327))

(assert (=> b!1524344 m!1407327))

(declare-fun m!1407329 () Bool)

(assert (=> b!1524344 m!1407329))

(assert (=> b!1524342 m!1407327))

(assert (=> b!1524342 m!1407327))

(declare-fun m!1407331 () Bool)

(assert (=> b!1524342 m!1407331))

(assert (=> b!1524342 m!1407331))

(assert (=> b!1524342 m!1407327))

(declare-fun m!1407333 () Bool)

(assert (=> b!1524342 m!1407333))

(declare-fun m!1407335 () Bool)

(assert (=> start!130022 m!1407335))

(declare-fun m!1407337 () Bool)

(assert (=> start!130022 m!1407337))

(declare-fun m!1407339 () Bool)

(assert (=> b!1524347 m!1407339))

(declare-fun m!1407341 () Bool)

(assert (=> b!1524347 m!1407341))

(assert (=> b!1524347 m!1407341))

(declare-fun m!1407343 () Bool)

(assert (=> b!1524347 m!1407343))

(assert (=> b!1524347 m!1407343))

(assert (=> b!1524347 m!1407341))

(declare-fun m!1407345 () Bool)

(assert (=> b!1524347 m!1407345))

(declare-fun m!1407347 () Bool)

(assert (=> b!1524343 m!1407347))

(assert (=> b!1524343 m!1407347))

(declare-fun m!1407349 () Bool)

(assert (=> b!1524343 m!1407349))

(declare-fun m!1407351 () Bool)

(assert (=> b!1524349 m!1407351))

(declare-fun m!1407353 () Bool)

(assert (=> b!1524349 m!1407353))

(declare-fun m!1407355 () Bool)

(assert (=> b!1524345 m!1407355))

(assert (=> b!1524346 m!1407327))

(assert (=> b!1524346 m!1407327))

(declare-fun m!1407357 () Bool)

(assert (=> b!1524346 m!1407357))

(declare-fun m!1407359 () Bool)

(assert (=> b!1524340 m!1407359))

(check-sat (not b!1524345) (not b!1524342) (not b!1524343) (not b!1524346) (not b!1524340) (not start!130022) (not b!1524344) (not b!1524349) (not b!1524347))
(check-sat)
