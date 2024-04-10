; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129594 () Bool)

(assert start!129594)

(declare-fun b!1521340 () Bool)

(declare-fun res!1040567 () Bool)

(declare-fun e!848503 () Bool)

(assert (=> b!1521340 (=> (not res!1040567) (not e!848503))))

(declare-datatypes ((array!101269 0))(
  ( (array!101270 (arr!48867 (Array (_ BitVec 32) (_ BitVec 64))) (size!49417 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101269)

(declare-datatypes ((List!35350 0))(
  ( (Nil!35347) (Cons!35346 (h!36767 (_ BitVec 64)) (t!50044 List!35350)) )
))
(declare-fun arrayNoDuplicates!0 (array!101269 (_ BitVec 32) List!35350) Bool)

(assert (=> b!1521340 (= res!1040567 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35347))))

(declare-fun b!1521341 () Bool)

(declare-fun res!1040566 () Bool)

(assert (=> b!1521341 (=> (not res!1040566) (not e!848503))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521341 (= res!1040566 (validKeyInArray!0 (select (arr!48867 a!2804) j!70)))))

(declare-fun b!1521342 () Bool)

(declare-fun res!1040568 () Bool)

(assert (=> b!1521342 (=> (not res!1040568) (not e!848503))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521342 (= res!1040568 (validKeyInArray!0 (select (arr!48867 a!2804) i!961)))))

(declare-fun b!1521343 () Bool)

(declare-fun res!1040569 () Bool)

(assert (=> b!1521343 (=> (not res!1040569) (not e!848503))))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1521343 (= res!1040569 (and (= (size!49417 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49417 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49417 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521344 () Bool)

(assert (=> b!1521344 (= e!848503 false)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13032 0))(
  ( (MissingZero!13032 (index!54523 (_ BitVec 32))) (Found!13032 (index!54524 (_ BitVec 32))) (Intermediate!13032 (undefined!13844 Bool) (index!54525 (_ BitVec 32)) (x!136220 (_ BitVec 32))) (Undefined!13032) (MissingVacant!13032 (index!54526 (_ BitVec 32))) )
))
(declare-fun lt!659338 () SeekEntryResult!13032)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101269 (_ BitVec 32)) SeekEntryResult!13032)

(assert (=> b!1521344 (= lt!659338 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48867 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521345 () Bool)

(declare-fun res!1040565 () Bool)

(assert (=> b!1521345 (=> (not res!1040565) (not e!848503))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521345 (= res!1040565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48867 a!2804) j!70) mask!2512) (select (arr!48867 a!2804) j!70) a!2804 mask!2512) (Intermediate!13032 false resIndex!21 resX!21)))))

(declare-fun b!1521346 () Bool)

(declare-fun res!1040562 () Bool)

(assert (=> b!1521346 (=> (not res!1040562) (not e!848503))))

(assert (=> b!1521346 (= res!1040562 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49417 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49417 a!2804))))))

(declare-fun b!1521347 () Bool)

(declare-fun res!1040564 () Bool)

(assert (=> b!1521347 (=> (not res!1040564) (not e!848503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101269 (_ BitVec 32)) Bool)

(assert (=> b!1521347 (= res!1040564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1040563 () Bool)

(assert (=> start!129594 (=> (not res!1040563) (not e!848503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129594 (= res!1040563 (validMask!0 mask!2512))))

(assert (=> start!129594 e!848503))

(assert (=> start!129594 true))

(declare-fun array_inv!37895 (array!101269) Bool)

(assert (=> start!129594 (array_inv!37895 a!2804)))

(assert (= (and start!129594 res!1040563) b!1521343))

(assert (= (and b!1521343 res!1040569) b!1521342))

(assert (= (and b!1521342 res!1040568) b!1521341))

(assert (= (and b!1521341 res!1040566) b!1521347))

(assert (= (and b!1521347 res!1040564) b!1521340))

(assert (= (and b!1521340 res!1040567) b!1521346))

(assert (= (and b!1521346 res!1040562) b!1521345))

(assert (= (and b!1521345 res!1040565) b!1521344))

(declare-fun m!1404441 () Bool)

(assert (=> b!1521347 m!1404441))

(declare-fun m!1404443 () Bool)

(assert (=> b!1521340 m!1404443))

(declare-fun m!1404445 () Bool)

(assert (=> b!1521341 m!1404445))

(assert (=> b!1521341 m!1404445))

(declare-fun m!1404447 () Bool)

(assert (=> b!1521341 m!1404447))

(assert (=> b!1521344 m!1404445))

(assert (=> b!1521344 m!1404445))

(declare-fun m!1404449 () Bool)

(assert (=> b!1521344 m!1404449))

(assert (=> b!1521345 m!1404445))

(assert (=> b!1521345 m!1404445))

(declare-fun m!1404451 () Bool)

(assert (=> b!1521345 m!1404451))

(assert (=> b!1521345 m!1404451))

(assert (=> b!1521345 m!1404445))

(declare-fun m!1404453 () Bool)

(assert (=> b!1521345 m!1404453))

(declare-fun m!1404455 () Bool)

(assert (=> start!129594 m!1404455))

(declare-fun m!1404457 () Bool)

(assert (=> start!129594 m!1404457))

(declare-fun m!1404459 () Bool)

(assert (=> b!1521342 m!1404459))

(assert (=> b!1521342 m!1404459))

(declare-fun m!1404461 () Bool)

(assert (=> b!1521342 m!1404461))

(check-sat (not b!1521342) (not b!1521340) (not b!1521345) (not start!129594) (not b!1521341) (not b!1521344) (not b!1521347))
