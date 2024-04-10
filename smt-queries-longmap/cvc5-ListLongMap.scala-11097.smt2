; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129604 () Bool)

(assert start!129604)

(declare-fun b!1521462 () Bool)

(declare-fun res!1040686 () Bool)

(declare-fun e!848534 () Bool)

(assert (=> b!1521462 (=> (not res!1040686) (not e!848534))))

(declare-datatypes ((array!101279 0))(
  ( (array!101280 (arr!48872 (Array (_ BitVec 32) (_ BitVec 64))) (size!49422 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101279)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521462 (= res!1040686 (validKeyInArray!0 (select (arr!48872 a!2804) i!961)))))

(declare-fun b!1521463 () Bool)

(declare-fun e!848536 () Bool)

(assert (=> b!1521463 (= e!848534 e!848536)))

(declare-fun res!1040684 () Bool)

(assert (=> b!1521463 (=> (not res!1040684) (not e!848536))))

(declare-datatypes ((SeekEntryResult!13037 0))(
  ( (MissingZero!13037 (index!54543 (_ BitVec 32))) (Found!13037 (index!54544 (_ BitVec 32))) (Intermediate!13037 (undefined!13849 Bool) (index!54545 (_ BitVec 32)) (x!136241 (_ BitVec 32))) (Undefined!13037) (MissingVacant!13037 (index!54546 (_ BitVec 32))) )
))
(declare-fun lt!659355 () SeekEntryResult!13037)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101279 (_ BitVec 32)) SeekEntryResult!13037)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521463 (= res!1040684 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48872 a!2804) j!70) mask!2512) (select (arr!48872 a!2804) j!70) a!2804 mask!2512) lt!659355))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521463 (= lt!659355 (Intermediate!13037 false resIndex!21 resX!21))))

(declare-fun b!1521464 () Bool)

(declare-fun res!1040689 () Bool)

(assert (=> b!1521464 (=> (not res!1040689) (not e!848536))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521464 (= res!1040689 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48872 a!2804) j!70) a!2804 mask!2512) lt!659355))))

(declare-fun b!1521465 () Bool)

(declare-fun res!1040688 () Bool)

(assert (=> b!1521465 (=> (not res!1040688) (not e!848534))))

(assert (=> b!1521465 (= res!1040688 (validKeyInArray!0 (select (arr!48872 a!2804) j!70)))))

(declare-fun res!1040687 () Bool)

(assert (=> start!129604 (=> (not res!1040687) (not e!848534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129604 (= res!1040687 (validMask!0 mask!2512))))

(assert (=> start!129604 e!848534))

(assert (=> start!129604 true))

(declare-fun array_inv!37900 (array!101279) Bool)

(assert (=> start!129604 (array_inv!37900 a!2804)))

(declare-fun b!1521466 () Bool)

(declare-fun res!1040690 () Bool)

(assert (=> b!1521466 (=> (not res!1040690) (not e!848534))))

(assert (=> b!1521466 (= res!1040690 (and (= (size!49422 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49422 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49422 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521467 () Bool)

(declare-fun res!1040692 () Bool)

(assert (=> b!1521467 (=> (not res!1040692) (not e!848534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101279 (_ BitVec 32)) Bool)

(assert (=> b!1521467 (= res!1040692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521468 () Bool)

(declare-fun res!1040691 () Bool)

(assert (=> b!1521468 (=> (not res!1040691) (not e!848534))))

(declare-datatypes ((List!35355 0))(
  ( (Nil!35352) (Cons!35351 (h!36772 (_ BitVec 64)) (t!50049 List!35355)) )
))
(declare-fun arrayNoDuplicates!0 (array!101279 (_ BitVec 32) List!35355) Bool)

(assert (=> b!1521468 (= res!1040691 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35352))))

(declare-fun b!1521469 () Bool)

(assert (=> b!1521469 (= e!848536 false)))

(declare-fun lt!659356 () (_ BitVec 32))

(assert (=> b!1521469 (= lt!659356 (toIndex!0 (select (store (arr!48872 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1521470 () Bool)

(declare-fun res!1040685 () Bool)

(assert (=> b!1521470 (=> (not res!1040685) (not e!848534))))

(assert (=> b!1521470 (= res!1040685 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49422 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49422 a!2804))))))

(assert (= (and start!129604 res!1040687) b!1521466))

(assert (= (and b!1521466 res!1040690) b!1521462))

(assert (= (and b!1521462 res!1040686) b!1521465))

(assert (= (and b!1521465 res!1040688) b!1521467))

(assert (= (and b!1521467 res!1040692) b!1521468))

(assert (= (and b!1521468 res!1040691) b!1521470))

(assert (= (and b!1521470 res!1040685) b!1521463))

(assert (= (and b!1521463 res!1040684) b!1521464))

(assert (= (and b!1521464 res!1040689) b!1521469))

(declare-fun m!1404551 () Bool)

(assert (=> b!1521462 m!1404551))

(assert (=> b!1521462 m!1404551))

(declare-fun m!1404553 () Bool)

(assert (=> b!1521462 m!1404553))

(declare-fun m!1404555 () Bool)

(assert (=> start!129604 m!1404555))

(declare-fun m!1404557 () Bool)

(assert (=> start!129604 m!1404557))

(declare-fun m!1404559 () Bool)

(assert (=> b!1521468 m!1404559))

(declare-fun m!1404561 () Bool)

(assert (=> b!1521463 m!1404561))

(assert (=> b!1521463 m!1404561))

(declare-fun m!1404563 () Bool)

(assert (=> b!1521463 m!1404563))

(assert (=> b!1521463 m!1404563))

(assert (=> b!1521463 m!1404561))

(declare-fun m!1404565 () Bool)

(assert (=> b!1521463 m!1404565))

(declare-fun m!1404567 () Bool)

(assert (=> b!1521467 m!1404567))

(assert (=> b!1521465 m!1404561))

(assert (=> b!1521465 m!1404561))

(declare-fun m!1404569 () Bool)

(assert (=> b!1521465 m!1404569))

(declare-fun m!1404571 () Bool)

(assert (=> b!1521469 m!1404571))

(declare-fun m!1404573 () Bool)

(assert (=> b!1521469 m!1404573))

(assert (=> b!1521469 m!1404573))

(declare-fun m!1404575 () Bool)

(assert (=> b!1521469 m!1404575))

(assert (=> b!1521464 m!1404561))

(assert (=> b!1521464 m!1404561))

(declare-fun m!1404577 () Bool)

(assert (=> b!1521464 m!1404577))

(push 1)

