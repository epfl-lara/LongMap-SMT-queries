; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129972 () Bool)

(assert start!129972)

(declare-fun b!1523646 () Bool)

(declare-fun e!849897 () Bool)

(assert (=> b!1523646 (= e!849897 false)))

(declare-datatypes ((SeekEntryResult!12982 0))(
  ( (MissingZero!12982 (index!54323 (_ BitVec 32))) (Found!12982 (index!54324 (_ BitVec 32))) (Intermediate!12982 (undefined!13794 Bool) (index!54325 (_ BitVec 32)) (x!136223 (_ BitVec 32))) (Undefined!12982) (MissingVacant!12982 (index!54326 (_ BitVec 32))) )
))
(declare-fun lt!660190 () SeekEntryResult!12982)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101396 0))(
  ( (array!101397 (arr!48924 (Array (_ BitVec 32) (_ BitVec 64))) (size!49475 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101396)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101396 (_ BitVec 32)) SeekEntryResult!12982)

(assert (=> b!1523646 (= lt!660190 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48924 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523647 () Bool)

(declare-fun res!1041447 () Bool)

(assert (=> b!1523647 (=> (not res!1041447) (not e!849897))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523647 (= res!1041447 (validKeyInArray!0 (select (arr!48924 a!2804) i!961)))))

(declare-fun b!1523648 () Bool)

(declare-fun res!1041443 () Bool)

(assert (=> b!1523648 (=> (not res!1041443) (not e!849897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101396 (_ BitVec 32)) Bool)

(assert (=> b!1523648 (= res!1041443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523649 () Bool)

(declare-fun res!1041446 () Bool)

(assert (=> b!1523649 (=> (not res!1041446) (not e!849897))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523649 (= res!1041446 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48924 a!2804) j!70) mask!2512) (select (arr!48924 a!2804) j!70) a!2804 mask!2512) (Intermediate!12982 false resIndex!21 resX!21)))))

(declare-fun b!1523650 () Bool)

(declare-fun res!1041442 () Bool)

(assert (=> b!1523650 (=> (not res!1041442) (not e!849897))))

(assert (=> b!1523650 (= res!1041442 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49475 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49475 a!2804))))))

(declare-fun b!1523652 () Bool)

(declare-fun res!1041449 () Bool)

(assert (=> b!1523652 (=> (not res!1041449) (not e!849897))))

(assert (=> b!1523652 (= res!1041449 (validKeyInArray!0 (select (arr!48924 a!2804) j!70)))))

(declare-fun b!1523653 () Bool)

(declare-fun res!1041444 () Bool)

(assert (=> b!1523653 (=> (not res!1041444) (not e!849897))))

(assert (=> b!1523653 (= res!1041444 (and (= (size!49475 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49475 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49475 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1041448 () Bool)

(assert (=> start!129972 (=> (not res!1041448) (not e!849897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129972 (= res!1041448 (validMask!0 mask!2512))))

(assert (=> start!129972 e!849897))

(assert (=> start!129972 true))

(declare-fun array_inv!38205 (array!101396) Bool)

(assert (=> start!129972 (array_inv!38205 a!2804)))

(declare-fun b!1523651 () Bool)

(declare-fun res!1041445 () Bool)

(assert (=> b!1523651 (=> (not res!1041445) (not e!849897))))

(declare-datatypes ((List!35394 0))(
  ( (Nil!35391) (Cons!35390 (h!36829 (_ BitVec 64)) (t!50080 List!35394)) )
))
(declare-fun arrayNoDuplicates!0 (array!101396 (_ BitVec 32) List!35394) Bool)

(assert (=> b!1523651 (= res!1041445 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35391))))

(assert (= (and start!129972 res!1041448) b!1523653))

(assert (= (and b!1523653 res!1041444) b!1523647))

(assert (= (and b!1523647 res!1041447) b!1523652))

(assert (= (and b!1523652 res!1041449) b!1523648))

(assert (= (and b!1523648 res!1041443) b!1523651))

(assert (= (and b!1523651 res!1041445) b!1523650))

(assert (= (and b!1523650 res!1041442) b!1523649))

(assert (= (and b!1523649 res!1041446) b!1523646))

(declare-fun m!1406597 () Bool)

(assert (=> b!1523647 m!1406597))

(assert (=> b!1523647 m!1406597))

(declare-fun m!1406599 () Bool)

(assert (=> b!1523647 m!1406599))

(declare-fun m!1406601 () Bool)

(assert (=> start!129972 m!1406601))

(declare-fun m!1406603 () Bool)

(assert (=> start!129972 m!1406603))

(declare-fun m!1406605 () Bool)

(assert (=> b!1523652 m!1406605))

(assert (=> b!1523652 m!1406605))

(declare-fun m!1406607 () Bool)

(assert (=> b!1523652 m!1406607))

(declare-fun m!1406609 () Bool)

(assert (=> b!1523648 m!1406609))

(assert (=> b!1523649 m!1406605))

(assert (=> b!1523649 m!1406605))

(declare-fun m!1406611 () Bool)

(assert (=> b!1523649 m!1406611))

(assert (=> b!1523649 m!1406611))

(assert (=> b!1523649 m!1406605))

(declare-fun m!1406613 () Bool)

(assert (=> b!1523649 m!1406613))

(declare-fun m!1406615 () Bool)

(assert (=> b!1523651 m!1406615))

(assert (=> b!1523646 m!1406605))

(assert (=> b!1523646 m!1406605))

(declare-fun m!1406617 () Bool)

(assert (=> b!1523646 m!1406617))

(push 1)

(assert (not b!1523648))

(assert (not b!1523649))

(assert (not b!1523652))

(assert (not b!1523646))

(assert (not b!1523651))

(assert (not b!1523647))

(assert (not start!129972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

