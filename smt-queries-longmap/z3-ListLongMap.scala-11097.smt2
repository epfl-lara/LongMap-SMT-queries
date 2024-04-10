; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129606 () Bool)

(assert start!129606)

(declare-fun res!1040713 () Bool)

(declare-fun e!848544 () Bool)

(assert (=> start!129606 (=> (not res!1040713) (not e!848544))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129606 (= res!1040713 (validMask!0 mask!2512))))

(assert (=> start!129606 e!848544))

(assert (=> start!129606 true))

(declare-datatypes ((array!101281 0))(
  ( (array!101282 (arr!48873 (Array (_ BitVec 32) (_ BitVec 64))) (size!49423 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101281)

(declare-fun array_inv!37901 (array!101281) Bool)

(assert (=> start!129606 (array_inv!37901 a!2804)))

(declare-fun b!1521489 () Bool)

(declare-fun res!1040715 () Bool)

(assert (=> b!1521489 (=> (not res!1040715) (not e!848544))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521489 (= res!1040715 (validKeyInArray!0 (select (arr!48873 a!2804) i!961)))))

(declare-fun b!1521490 () Bool)

(declare-fun res!1040719 () Bool)

(assert (=> b!1521490 (=> (not res!1040719) (not e!848544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101281 (_ BitVec 32)) Bool)

(assert (=> b!1521490 (= res!1040719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521491 () Bool)

(declare-fun e!848543 () Bool)

(assert (=> b!1521491 (= e!848543 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!659362 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521491 (= lt!659362 (toIndex!0 (select (store (arr!48873 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1521492 () Bool)

(declare-fun res!1040717 () Bool)

(assert (=> b!1521492 (=> (not res!1040717) (not e!848544))))

(declare-datatypes ((List!35356 0))(
  ( (Nil!35353) (Cons!35352 (h!36773 (_ BitVec 64)) (t!50050 List!35356)) )
))
(declare-fun arrayNoDuplicates!0 (array!101281 (_ BitVec 32) List!35356) Bool)

(assert (=> b!1521492 (= res!1040717 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35353))))

(declare-fun b!1521493 () Bool)

(assert (=> b!1521493 (= e!848544 e!848543)))

(declare-fun res!1040718 () Bool)

(assert (=> b!1521493 (=> (not res!1040718) (not e!848543))))

(declare-datatypes ((SeekEntryResult!13038 0))(
  ( (MissingZero!13038 (index!54547 (_ BitVec 32))) (Found!13038 (index!54548 (_ BitVec 32))) (Intermediate!13038 (undefined!13850 Bool) (index!54549 (_ BitVec 32)) (x!136242 (_ BitVec 32))) (Undefined!13038) (MissingVacant!13038 (index!54550 (_ BitVec 32))) )
))
(declare-fun lt!659361 () SeekEntryResult!13038)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101281 (_ BitVec 32)) SeekEntryResult!13038)

(assert (=> b!1521493 (= res!1040718 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48873 a!2804) j!70) mask!2512) (select (arr!48873 a!2804) j!70) a!2804 mask!2512) lt!659361))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521493 (= lt!659361 (Intermediate!13038 false resIndex!21 resX!21))))

(declare-fun b!1521494 () Bool)

(declare-fun res!1040711 () Bool)

(assert (=> b!1521494 (=> (not res!1040711) (not e!848543))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521494 (= res!1040711 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48873 a!2804) j!70) a!2804 mask!2512) lt!659361))))

(declare-fun b!1521495 () Bool)

(declare-fun res!1040716 () Bool)

(assert (=> b!1521495 (=> (not res!1040716) (not e!848544))))

(assert (=> b!1521495 (= res!1040716 (validKeyInArray!0 (select (arr!48873 a!2804) j!70)))))

(declare-fun b!1521496 () Bool)

(declare-fun res!1040712 () Bool)

(assert (=> b!1521496 (=> (not res!1040712) (not e!848544))))

(assert (=> b!1521496 (= res!1040712 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49423 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49423 a!2804))))))

(declare-fun b!1521497 () Bool)

(declare-fun res!1040714 () Bool)

(assert (=> b!1521497 (=> (not res!1040714) (not e!848544))))

(assert (=> b!1521497 (= res!1040714 (and (= (size!49423 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49423 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49423 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129606 res!1040713) b!1521497))

(assert (= (and b!1521497 res!1040714) b!1521489))

(assert (= (and b!1521489 res!1040715) b!1521495))

(assert (= (and b!1521495 res!1040716) b!1521490))

(assert (= (and b!1521490 res!1040719) b!1521492))

(assert (= (and b!1521492 res!1040717) b!1521496))

(assert (= (and b!1521496 res!1040712) b!1521493))

(assert (= (and b!1521493 res!1040718) b!1521494))

(assert (= (and b!1521494 res!1040711) b!1521491))

(declare-fun m!1404579 () Bool)

(assert (=> b!1521490 m!1404579))

(declare-fun m!1404581 () Bool)

(assert (=> b!1521492 m!1404581))

(declare-fun m!1404583 () Bool)

(assert (=> b!1521489 m!1404583))

(assert (=> b!1521489 m!1404583))

(declare-fun m!1404585 () Bool)

(assert (=> b!1521489 m!1404585))

(declare-fun m!1404587 () Bool)

(assert (=> b!1521495 m!1404587))

(assert (=> b!1521495 m!1404587))

(declare-fun m!1404589 () Bool)

(assert (=> b!1521495 m!1404589))

(assert (=> b!1521493 m!1404587))

(assert (=> b!1521493 m!1404587))

(declare-fun m!1404591 () Bool)

(assert (=> b!1521493 m!1404591))

(assert (=> b!1521493 m!1404591))

(assert (=> b!1521493 m!1404587))

(declare-fun m!1404593 () Bool)

(assert (=> b!1521493 m!1404593))

(declare-fun m!1404595 () Bool)

(assert (=> b!1521491 m!1404595))

(declare-fun m!1404597 () Bool)

(assert (=> b!1521491 m!1404597))

(assert (=> b!1521491 m!1404597))

(declare-fun m!1404599 () Bool)

(assert (=> b!1521491 m!1404599))

(declare-fun m!1404601 () Bool)

(assert (=> start!129606 m!1404601))

(declare-fun m!1404603 () Bool)

(assert (=> start!129606 m!1404603))

(assert (=> b!1521494 m!1404587))

(assert (=> b!1521494 m!1404587))

(declare-fun m!1404605 () Bool)

(assert (=> b!1521494 m!1404605))

(check-sat (not b!1521489) (not b!1521492) (not b!1521490) (not start!129606) (not b!1521493) (not b!1521494) (not b!1521495) (not b!1521491))
(check-sat)
