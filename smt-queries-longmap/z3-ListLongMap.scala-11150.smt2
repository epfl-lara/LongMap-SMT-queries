; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130644 () Bool)

(assert start!130644)

(declare-fun b!1531572 () Bool)

(declare-fun res!1047795 () Bool)

(declare-fun e!853686 () Bool)

(assert (=> b!1531572 (=> (not res!1047795) (not e!853686))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101731 0))(
  ( (array!101732 (arr!49084 (Array (_ BitVec 32) (_ BitVec 64))) (size!49635 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101731)

(declare-datatypes ((SeekEntryResult!13142 0))(
  ( (MissingZero!13142 (index!54963 (_ BitVec 32))) (Found!13142 (index!54964 (_ BitVec 32))) (Intermediate!13142 (undefined!13954 Bool) (index!54965 (_ BitVec 32)) (x!136860 (_ BitVec 32))) (Undefined!13142) (MissingVacant!13142 (index!54966 (_ BitVec 32))) )
))
(declare-fun lt!663257 () SeekEntryResult!13142)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101731 (_ BitVec 32)) SeekEntryResult!13142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531572 (= res!1047795 (= lt!663257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49084 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49084 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101732 (store (arr!49084 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49635 a!2804)) mask!2512)))))

(declare-fun b!1531573 () Bool)

(declare-fun e!853683 () Bool)

(assert (=> b!1531573 (= e!853686 (not e!853683))))

(declare-fun res!1047804 () Bool)

(assert (=> b!1531573 (=> res!1047804 e!853683)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531573 (= res!1047804 (or (not (= (select (arr!49084 a!2804) j!70) (select (store (arr!49084 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853684 () Bool)

(assert (=> b!1531573 e!853684))

(declare-fun res!1047794 () Bool)

(assert (=> b!1531573 (=> (not res!1047794) (not e!853684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101731 (_ BitVec 32)) Bool)

(assert (=> b!1531573 (= res!1047794 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51103 0))(
  ( (Unit!51104) )
))
(declare-fun lt!663256 () Unit!51103)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51103)

(assert (=> b!1531573 (= lt!663256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531574 () Bool)

(declare-fun res!1047798 () Bool)

(declare-fun e!853687 () Bool)

(assert (=> b!1531574 (=> (not res!1047798) (not e!853687))))

(assert (=> b!1531574 (= res!1047798 (and (= (size!49635 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49635 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49635 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531575 () Bool)

(declare-fun res!1047800 () Bool)

(assert (=> b!1531575 (=> (not res!1047800) (not e!853687))))

(declare-datatypes ((List!35554 0))(
  ( (Nil!35551) (Cons!35550 (h!37004 (_ BitVec 64)) (t!50240 List!35554)) )
))
(declare-fun arrayNoDuplicates!0 (array!101731 (_ BitVec 32) List!35554) Bool)

(assert (=> b!1531575 (= res!1047800 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35551))))

(declare-fun b!1531576 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101731 (_ BitVec 32)) SeekEntryResult!13142)

(assert (=> b!1531576 (= e!853684 (= (seekEntry!0 (select (arr!49084 a!2804) j!70) a!2804 mask!2512) (Found!13142 j!70)))))

(declare-fun b!1531577 () Bool)

(assert (=> b!1531577 (= e!853683 true)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!663255 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531577 (= lt!663255 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1531578 () Bool)

(declare-fun res!1047803 () Bool)

(assert (=> b!1531578 (=> (not res!1047803) (not e!853687))))

(assert (=> b!1531578 (= res!1047803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531579 () Bool)

(declare-fun res!1047797 () Bool)

(assert (=> b!1531579 (=> (not res!1047797) (not e!853687))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531579 (= res!1047797 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49635 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49635 a!2804))))))

(declare-fun b!1531580 () Bool)

(declare-fun res!1047793 () Bool)

(assert (=> b!1531580 (=> (not res!1047793) (not e!853687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531580 (= res!1047793 (validKeyInArray!0 (select (arr!49084 a!2804) i!961)))))

(declare-fun res!1047801 () Bool)

(assert (=> start!130644 (=> (not res!1047801) (not e!853687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130644 (= res!1047801 (validMask!0 mask!2512))))

(assert (=> start!130644 e!853687))

(assert (=> start!130644 true))

(declare-fun array_inv!38365 (array!101731) Bool)

(assert (=> start!130644 (array_inv!38365 a!2804)))

(declare-fun b!1531581 () Bool)

(declare-fun res!1047802 () Bool)

(assert (=> b!1531581 (=> (not res!1047802) (not e!853687))))

(assert (=> b!1531581 (= res!1047802 (validKeyInArray!0 (select (arr!49084 a!2804) j!70)))))

(declare-fun b!1531582 () Bool)

(declare-fun res!1047796 () Bool)

(assert (=> b!1531582 (=> (not res!1047796) (not e!853686))))

(declare-fun lt!663258 () SeekEntryResult!13142)

(assert (=> b!1531582 (= res!1047796 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49084 a!2804) j!70) a!2804 mask!2512) lt!663258))))

(declare-fun b!1531583 () Bool)

(assert (=> b!1531583 (= e!853687 e!853686)))

(declare-fun res!1047799 () Bool)

(assert (=> b!1531583 (=> (not res!1047799) (not e!853686))))

(assert (=> b!1531583 (= res!1047799 (= lt!663257 lt!663258))))

(assert (=> b!1531583 (= lt!663258 (Intermediate!13142 false resIndex!21 resX!21))))

(assert (=> b!1531583 (= lt!663257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49084 a!2804) j!70) mask!2512) (select (arr!49084 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130644 res!1047801) b!1531574))

(assert (= (and b!1531574 res!1047798) b!1531580))

(assert (= (and b!1531580 res!1047793) b!1531581))

(assert (= (and b!1531581 res!1047802) b!1531578))

(assert (= (and b!1531578 res!1047803) b!1531575))

(assert (= (and b!1531575 res!1047800) b!1531579))

(assert (= (and b!1531579 res!1047797) b!1531583))

(assert (= (and b!1531583 res!1047799) b!1531582))

(assert (= (and b!1531582 res!1047796) b!1531572))

(assert (= (and b!1531572 res!1047795) b!1531573))

(assert (= (and b!1531573 res!1047794) b!1531576))

(assert (= (and b!1531573 (not res!1047804)) b!1531577))

(declare-fun m!1414357 () Bool)

(assert (=> b!1531575 m!1414357))

(declare-fun m!1414359 () Bool)

(assert (=> b!1531572 m!1414359))

(declare-fun m!1414361 () Bool)

(assert (=> b!1531572 m!1414361))

(assert (=> b!1531572 m!1414361))

(declare-fun m!1414363 () Bool)

(assert (=> b!1531572 m!1414363))

(assert (=> b!1531572 m!1414363))

(assert (=> b!1531572 m!1414361))

(declare-fun m!1414365 () Bool)

(assert (=> b!1531572 m!1414365))

(declare-fun m!1414367 () Bool)

(assert (=> b!1531580 m!1414367))

(assert (=> b!1531580 m!1414367))

(declare-fun m!1414369 () Bool)

(assert (=> b!1531580 m!1414369))

(declare-fun m!1414371 () Bool)

(assert (=> b!1531578 m!1414371))

(declare-fun m!1414373 () Bool)

(assert (=> b!1531576 m!1414373))

(assert (=> b!1531576 m!1414373))

(declare-fun m!1414375 () Bool)

(assert (=> b!1531576 m!1414375))

(declare-fun m!1414377 () Bool)

(assert (=> start!130644 m!1414377))

(declare-fun m!1414379 () Bool)

(assert (=> start!130644 m!1414379))

(assert (=> b!1531581 m!1414373))

(assert (=> b!1531581 m!1414373))

(declare-fun m!1414381 () Bool)

(assert (=> b!1531581 m!1414381))

(assert (=> b!1531573 m!1414373))

(declare-fun m!1414383 () Bool)

(assert (=> b!1531573 m!1414383))

(assert (=> b!1531573 m!1414359))

(assert (=> b!1531573 m!1414361))

(declare-fun m!1414385 () Bool)

(assert (=> b!1531573 m!1414385))

(assert (=> b!1531582 m!1414373))

(assert (=> b!1531582 m!1414373))

(declare-fun m!1414387 () Bool)

(assert (=> b!1531582 m!1414387))

(assert (=> b!1531583 m!1414373))

(assert (=> b!1531583 m!1414373))

(declare-fun m!1414389 () Bool)

(assert (=> b!1531583 m!1414389))

(assert (=> b!1531583 m!1414389))

(assert (=> b!1531583 m!1414373))

(declare-fun m!1414391 () Bool)

(assert (=> b!1531583 m!1414391))

(declare-fun m!1414393 () Bool)

(assert (=> b!1531577 m!1414393))

(check-sat (not b!1531581) (not b!1531573) (not b!1531582) (not b!1531576) (not start!130644) (not b!1531583) (not b!1531577) (not b!1531572) (not b!1531575) (not b!1531578) (not b!1531580))
(check-sat)
