; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129586 () Bool)

(assert start!129586)

(declare-fun b!1521244 () Bool)

(declare-fun e!848479 () Bool)

(assert (=> b!1521244 (= e!848479 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101261 0))(
  ( (array!101262 (arr!48863 (Array (_ BitVec 32) (_ BitVec 64))) (size!49413 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101261)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13028 0))(
  ( (MissingZero!13028 (index!54507 (_ BitVec 32))) (Found!13028 (index!54508 (_ BitVec 32))) (Intermediate!13028 (undefined!13840 Bool) (index!54509 (_ BitVec 32)) (x!136208 (_ BitVec 32))) (Undefined!13028) (MissingVacant!13028 (index!54510 (_ BitVec 32))) )
))
(declare-fun lt!659326 () SeekEntryResult!13028)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101261 (_ BitVec 32)) SeekEntryResult!13028)

(assert (=> b!1521244 (= lt!659326 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48863 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521245 () Bool)

(declare-fun res!1040471 () Bool)

(assert (=> b!1521245 (=> (not res!1040471) (not e!848479))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521245 (= res!1040471 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49413 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49413 a!2804))))))

(declare-fun b!1521246 () Bool)

(declare-fun res!1040472 () Bool)

(assert (=> b!1521246 (=> (not res!1040472) (not e!848479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521246 (= res!1040472 (validKeyInArray!0 (select (arr!48863 a!2804) j!70)))))

(declare-fun b!1521247 () Bool)

(declare-fun res!1040469 () Bool)

(assert (=> b!1521247 (=> (not res!1040469) (not e!848479))))

(declare-datatypes ((List!35346 0))(
  ( (Nil!35343) (Cons!35342 (h!36763 (_ BitVec 64)) (t!50040 List!35346)) )
))
(declare-fun arrayNoDuplicates!0 (array!101261 (_ BitVec 32) List!35346) Bool)

(assert (=> b!1521247 (= res!1040469 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35343))))

(declare-fun b!1521248 () Bool)

(declare-fun res!1040473 () Bool)

(assert (=> b!1521248 (=> (not res!1040473) (not e!848479))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521248 (= res!1040473 (validKeyInArray!0 (select (arr!48863 a!2804) i!961)))))

(declare-fun res!1040467 () Bool)

(assert (=> start!129586 (=> (not res!1040467) (not e!848479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129586 (= res!1040467 (validMask!0 mask!2512))))

(assert (=> start!129586 e!848479))

(assert (=> start!129586 true))

(declare-fun array_inv!37891 (array!101261) Bool)

(assert (=> start!129586 (array_inv!37891 a!2804)))

(declare-fun b!1521249 () Bool)

(declare-fun res!1040470 () Bool)

(assert (=> b!1521249 (=> (not res!1040470) (not e!848479))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521249 (= res!1040470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48863 a!2804) j!70) mask!2512) (select (arr!48863 a!2804) j!70) a!2804 mask!2512) (Intermediate!13028 false resIndex!21 resX!21)))))

(declare-fun b!1521250 () Bool)

(declare-fun res!1040468 () Bool)

(assert (=> b!1521250 (=> (not res!1040468) (not e!848479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101261 (_ BitVec 32)) Bool)

(assert (=> b!1521250 (= res!1040468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521251 () Bool)

(declare-fun res!1040466 () Bool)

(assert (=> b!1521251 (=> (not res!1040466) (not e!848479))))

(assert (=> b!1521251 (= res!1040466 (and (= (size!49413 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49413 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49413 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129586 res!1040467) b!1521251))

(assert (= (and b!1521251 res!1040466) b!1521248))

(assert (= (and b!1521248 res!1040473) b!1521246))

(assert (= (and b!1521246 res!1040472) b!1521250))

(assert (= (and b!1521250 res!1040468) b!1521247))

(assert (= (and b!1521247 res!1040469) b!1521245))

(assert (= (and b!1521245 res!1040471) b!1521249))

(assert (= (and b!1521249 res!1040470) b!1521244))

(declare-fun m!1404353 () Bool)

(assert (=> b!1521248 m!1404353))

(assert (=> b!1521248 m!1404353))

(declare-fun m!1404355 () Bool)

(assert (=> b!1521248 m!1404355))

(declare-fun m!1404357 () Bool)

(assert (=> b!1521244 m!1404357))

(assert (=> b!1521244 m!1404357))

(declare-fun m!1404359 () Bool)

(assert (=> b!1521244 m!1404359))

(declare-fun m!1404361 () Bool)

(assert (=> b!1521247 m!1404361))

(assert (=> b!1521249 m!1404357))

(assert (=> b!1521249 m!1404357))

(declare-fun m!1404363 () Bool)

(assert (=> b!1521249 m!1404363))

(assert (=> b!1521249 m!1404363))

(assert (=> b!1521249 m!1404357))

(declare-fun m!1404365 () Bool)

(assert (=> b!1521249 m!1404365))

(declare-fun m!1404367 () Bool)

(assert (=> start!129586 m!1404367))

(declare-fun m!1404369 () Bool)

(assert (=> start!129586 m!1404369))

(declare-fun m!1404371 () Bool)

(assert (=> b!1521250 m!1404371))

(assert (=> b!1521246 m!1404357))

(assert (=> b!1521246 m!1404357))

(declare-fun m!1404373 () Bool)

(assert (=> b!1521246 m!1404373))

(push 1)

(assert (not b!1521247))

(assert (not b!1521246))

(assert (not b!1521248))

(assert (not start!129586))

(assert (not b!1521244))

(assert (not b!1521250))

(assert (not b!1521249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

