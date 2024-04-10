; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130284 () Bool)

(assert start!130284)

(declare-fun b!1529676 () Bool)

(declare-fun res!1047384 () Bool)

(declare-fun e!852433 () Bool)

(assert (=> b!1529676 (=> (not res!1047384) (not e!852433))))

(declare-datatypes ((array!101634 0))(
  ( (array!101635 (arr!49042 (Array (_ BitVec 32) (_ BitVec 64))) (size!49592 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101634)

(declare-datatypes ((List!35525 0))(
  ( (Nil!35522) (Cons!35521 (h!36957 (_ BitVec 64)) (t!50219 List!35525)) )
))
(declare-fun arrayNoDuplicates!0 (array!101634 (_ BitVec 32) List!35525) Bool)

(assert (=> b!1529676 (= res!1047384 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35522))))

(declare-fun b!1529677 () Bool)

(declare-fun res!1047394 () Bool)

(assert (=> b!1529677 (=> (not res!1047394) (not e!852433))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529677 (= res!1047394 (validKeyInArray!0 (select (arr!49042 a!2804) j!70)))))

(declare-fun b!1529678 () Bool)

(declare-fun e!852430 () Bool)

(declare-fun e!852432 () Bool)

(assert (=> b!1529678 (= e!852430 (not e!852432))))

(declare-fun res!1047393 () Bool)

(assert (=> b!1529678 (=> res!1047393 e!852432)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529678 (= res!1047393 (or (not (= (select (arr!49042 a!2804) j!70) (select (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852429 () Bool)

(assert (=> b!1529678 e!852429))

(declare-fun res!1047391 () Bool)

(assert (=> b!1529678 (=> (not res!1047391) (not e!852429))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101634 (_ BitVec 32)) Bool)

(assert (=> b!1529678 (= res!1047391 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51198 0))(
  ( (Unit!51199) )
))
(declare-fun lt!662513 () Unit!51198)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51198)

(assert (=> b!1529678 (= lt!662513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529679 () Bool)

(declare-fun res!1047385 () Bool)

(assert (=> b!1529679 (=> (not res!1047385) (not e!852433))))

(assert (=> b!1529679 (= res!1047385 (validKeyInArray!0 (select (arr!49042 a!2804) i!961)))))

(declare-fun res!1047389 () Bool)

(assert (=> start!130284 (=> (not res!1047389) (not e!852433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130284 (= res!1047389 (validMask!0 mask!2512))))

(assert (=> start!130284 e!852433))

(assert (=> start!130284 true))

(declare-fun array_inv!38070 (array!101634) Bool)

(assert (=> start!130284 (array_inv!38070 a!2804)))

(declare-fun b!1529680 () Bool)

(declare-datatypes ((SeekEntryResult!13207 0))(
  ( (MissingZero!13207 (index!55223 (_ BitVec 32))) (Found!13207 (index!55224 (_ BitVec 32))) (Intermediate!13207 (undefined!14019 Bool) (index!55225 (_ BitVec 32)) (x!136902 (_ BitVec 32))) (Undefined!13207) (MissingVacant!13207 (index!55226 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101634 (_ BitVec 32)) SeekEntryResult!13207)

(assert (=> b!1529680 (= e!852429 (= (seekEntry!0 (select (arr!49042 a!2804) j!70) a!2804 mask!2512) (Found!13207 j!70)))))

(declare-fun b!1529681 () Bool)

(assert (=> b!1529681 (= e!852433 e!852430)))

(declare-fun res!1047383 () Bool)

(assert (=> b!1529681 (=> (not res!1047383) (not e!852430))))

(declare-fun lt!662512 () SeekEntryResult!13207)

(declare-fun lt!662514 () SeekEntryResult!13207)

(assert (=> b!1529681 (= res!1047383 (= lt!662512 lt!662514))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529681 (= lt!662514 (Intermediate!13207 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101634 (_ BitVec 32)) SeekEntryResult!13207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529681 (= lt!662512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49042 a!2804) j!70) mask!2512) (select (arr!49042 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529682 () Bool)

(declare-fun res!1047392 () Bool)

(assert (=> b!1529682 (=> (not res!1047392) (not e!852433))))

(assert (=> b!1529682 (= res!1047392 (and (= (size!49592 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49592 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49592 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529683 () Bool)

(declare-fun res!1047386 () Bool)

(assert (=> b!1529683 (=> (not res!1047386) (not e!852430))))

(assert (=> b!1529683 (= res!1047386 (= lt!662512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101635 (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49592 a!2804)) mask!2512)))))

(declare-fun b!1529684 () Bool)

(declare-fun res!1047390 () Bool)

(assert (=> b!1529684 (=> (not res!1047390) (not e!852433))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1529684 (= res!1047390 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49592 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49592 a!2804))))))

(declare-fun b!1529685 () Bool)

(declare-fun res!1047388 () Bool)

(assert (=> b!1529685 (=> (not res!1047388) (not e!852430))))

(assert (=> b!1529685 (= res!1047388 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49042 a!2804) j!70) a!2804 mask!2512) lt!662514))))

(declare-fun b!1529686 () Bool)

(declare-fun res!1047387 () Bool)

(assert (=> b!1529686 (=> (not res!1047387) (not e!852433))))

(assert (=> b!1529686 (= res!1047387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529687 () Bool)

(assert (=> b!1529687 (= e!852432 true)))

(declare-fun lt!662515 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529687 (= lt!662515 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130284 res!1047389) b!1529682))

(assert (= (and b!1529682 res!1047392) b!1529679))

(assert (= (and b!1529679 res!1047385) b!1529677))

(assert (= (and b!1529677 res!1047394) b!1529686))

(assert (= (and b!1529686 res!1047387) b!1529676))

(assert (= (and b!1529676 res!1047384) b!1529684))

(assert (= (and b!1529684 res!1047390) b!1529681))

(assert (= (and b!1529681 res!1047383) b!1529685))

(assert (= (and b!1529685 res!1047388) b!1529683))

(assert (= (and b!1529683 res!1047386) b!1529678))

(assert (= (and b!1529678 res!1047391) b!1529680))

(assert (= (and b!1529678 (not res!1047393)) b!1529687))

(declare-fun m!1412635 () Bool)

(assert (=> start!130284 m!1412635))

(declare-fun m!1412637 () Bool)

(assert (=> start!130284 m!1412637))

(declare-fun m!1412639 () Bool)

(assert (=> b!1529687 m!1412639))

(declare-fun m!1412641 () Bool)

(assert (=> b!1529677 m!1412641))

(assert (=> b!1529677 m!1412641))

(declare-fun m!1412643 () Bool)

(assert (=> b!1529677 m!1412643))

(declare-fun m!1412645 () Bool)

(assert (=> b!1529683 m!1412645))

(declare-fun m!1412647 () Bool)

(assert (=> b!1529683 m!1412647))

(assert (=> b!1529683 m!1412647))

(declare-fun m!1412649 () Bool)

(assert (=> b!1529683 m!1412649))

(assert (=> b!1529683 m!1412649))

(assert (=> b!1529683 m!1412647))

(declare-fun m!1412651 () Bool)

(assert (=> b!1529683 m!1412651))

(declare-fun m!1412653 () Bool)

(assert (=> b!1529676 m!1412653))

(assert (=> b!1529678 m!1412641))

(declare-fun m!1412655 () Bool)

(assert (=> b!1529678 m!1412655))

(assert (=> b!1529678 m!1412645))

(assert (=> b!1529678 m!1412647))

(declare-fun m!1412657 () Bool)

(assert (=> b!1529678 m!1412657))

(declare-fun m!1412659 () Bool)

(assert (=> b!1529686 m!1412659))

(declare-fun m!1412661 () Bool)

(assert (=> b!1529679 m!1412661))

(assert (=> b!1529679 m!1412661))

(declare-fun m!1412663 () Bool)

(assert (=> b!1529679 m!1412663))

(assert (=> b!1529680 m!1412641))

(assert (=> b!1529680 m!1412641))

(declare-fun m!1412665 () Bool)

(assert (=> b!1529680 m!1412665))

(assert (=> b!1529681 m!1412641))

(assert (=> b!1529681 m!1412641))

(declare-fun m!1412667 () Bool)

(assert (=> b!1529681 m!1412667))

(assert (=> b!1529681 m!1412667))

(assert (=> b!1529681 m!1412641))

(declare-fun m!1412669 () Bool)

(assert (=> b!1529681 m!1412669))

(assert (=> b!1529685 m!1412641))

(assert (=> b!1529685 m!1412641))

(declare-fun m!1412671 () Bool)

(assert (=> b!1529685 m!1412671))

(push 1)

