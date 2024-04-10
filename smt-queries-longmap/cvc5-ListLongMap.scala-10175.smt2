; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119976 () Bool)

(assert start!119976)

(declare-fun b!1396637 () Bool)

(declare-fun res!935554 () Bool)

(declare-fun e!790684 () Bool)

(assert (=> b!1396637 (=> (not res!935554) (not e!790684))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95505 0))(
  ( (array!95506 (arr!46106 (Array (_ BitVec 32) (_ BitVec 64))) (size!46656 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95505)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396637 (= res!935554 (and (= (size!46656 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46656 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46656 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396638 () Bool)

(declare-fun e!790685 () Bool)

(declare-fun e!790686 () Bool)

(assert (=> b!1396638 (= e!790685 e!790686)))

(declare-fun res!935551 () Bool)

(assert (=> b!1396638 (=> res!935551 e!790686)))

(declare-datatypes ((SeekEntryResult!10423 0))(
  ( (MissingZero!10423 (index!44063 (_ BitVec 32))) (Found!10423 (index!44064 (_ BitVec 32))) (Intermediate!10423 (undefined!11235 Bool) (index!44065 (_ BitVec 32)) (x!125733 (_ BitVec 32))) (Undefined!10423) (MissingVacant!10423 (index!44066 (_ BitVec 32))) )
))
(declare-fun lt!613583 () SeekEntryResult!10423)

(declare-fun lt!613580 () SeekEntryResult!10423)

(declare-fun lt!613582 () (_ BitVec 32))

(assert (=> b!1396638 (= res!935551 (or (= lt!613583 lt!613580) (not (is-Intermediate!10423 lt!613580)) (bvslt (x!125733 lt!613583) #b00000000000000000000000000000000) (bvsgt (x!125733 lt!613583) #b01111111111111111111111111111110) (bvslt lt!613582 #b00000000000000000000000000000000) (bvsge lt!613582 (size!46656 a!2901)) (bvslt (index!44065 lt!613583) #b00000000000000000000000000000000) (bvsge (index!44065 lt!613583) (size!46656 a!2901)) (not (= lt!613583 (Intermediate!10423 false (index!44065 lt!613583) (x!125733 lt!613583)))) (not (= lt!613580 (Intermediate!10423 (undefined!11235 lt!613580) (index!44065 lt!613580) (x!125733 lt!613580))))))))

(declare-fun lt!613578 () array!95505)

(declare-fun lt!613584 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95505 (_ BitVec 32)) SeekEntryResult!10423)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396638 (= lt!613580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613584 mask!2840) lt!613584 lt!613578 mask!2840))))

(assert (=> b!1396638 (= lt!613584 (select (store (arr!46106 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396638 (= lt!613578 (array!95506 (store (arr!46106 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46656 a!2901)))))

(declare-fun b!1396639 () Bool)

(assert (=> b!1396639 (= e!790684 (not e!790685))))

(declare-fun res!935550 () Bool)

(assert (=> b!1396639 (=> res!935550 e!790685)))

(assert (=> b!1396639 (= res!935550 (or (not (is-Intermediate!10423 lt!613583)) (undefined!11235 lt!613583)))))

(declare-fun e!790688 () Bool)

(assert (=> b!1396639 e!790688))

(declare-fun res!935556 () Bool)

(assert (=> b!1396639 (=> (not res!935556) (not e!790688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95505 (_ BitVec 32)) Bool)

(assert (=> b!1396639 (= res!935556 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46850 0))(
  ( (Unit!46851) )
))
(declare-fun lt!613581 () Unit!46850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46850)

(assert (=> b!1396639 (= lt!613581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396639 (= lt!613583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613582 (select (arr!46106 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396639 (= lt!613582 (toIndex!0 (select (arr!46106 a!2901) j!112) mask!2840))))

(declare-fun b!1396640 () Bool)

(assert (=> b!1396640 (= e!790686 true)))

(declare-fun lt!613579 () SeekEntryResult!10423)

(assert (=> b!1396640 (= lt!613579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613582 lt!613584 lt!613578 mask!2840))))

(declare-fun b!1396641 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95505 (_ BitVec 32)) SeekEntryResult!10423)

(assert (=> b!1396641 (= e!790688 (= (seekEntryOrOpen!0 (select (arr!46106 a!2901) j!112) a!2901 mask!2840) (Found!10423 j!112)))))

(declare-fun b!1396642 () Bool)

(declare-fun res!935549 () Bool)

(assert (=> b!1396642 (=> (not res!935549) (not e!790684))))

(assert (=> b!1396642 (= res!935549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396643 () Bool)

(declare-fun res!935557 () Bool)

(assert (=> b!1396643 (=> (not res!935557) (not e!790684))))

(declare-datatypes ((List!32625 0))(
  ( (Nil!32622) (Cons!32621 (h!33863 (_ BitVec 64)) (t!47319 List!32625)) )
))
(declare-fun arrayNoDuplicates!0 (array!95505 (_ BitVec 32) List!32625) Bool)

(assert (=> b!1396643 (= res!935557 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32622))))

(declare-fun b!1396644 () Bool)

(declare-fun res!935553 () Bool)

(assert (=> b!1396644 (=> (not res!935553) (not e!790684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396644 (= res!935553 (validKeyInArray!0 (select (arr!46106 a!2901) j!112)))))

(declare-fun res!935552 () Bool)

(assert (=> start!119976 (=> (not res!935552) (not e!790684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119976 (= res!935552 (validMask!0 mask!2840))))

(assert (=> start!119976 e!790684))

(assert (=> start!119976 true))

(declare-fun array_inv!35134 (array!95505) Bool)

(assert (=> start!119976 (array_inv!35134 a!2901)))

(declare-fun b!1396636 () Bool)

(declare-fun res!935555 () Bool)

(assert (=> b!1396636 (=> (not res!935555) (not e!790684))))

(assert (=> b!1396636 (= res!935555 (validKeyInArray!0 (select (arr!46106 a!2901) i!1037)))))

(assert (= (and start!119976 res!935552) b!1396637))

(assert (= (and b!1396637 res!935554) b!1396636))

(assert (= (and b!1396636 res!935555) b!1396644))

(assert (= (and b!1396644 res!935553) b!1396642))

(assert (= (and b!1396642 res!935549) b!1396643))

(assert (= (and b!1396643 res!935557) b!1396639))

(assert (= (and b!1396639 res!935556) b!1396641))

(assert (= (and b!1396639 (not res!935550)) b!1396638))

(assert (= (and b!1396638 (not res!935551)) b!1396640))

(declare-fun m!1283139 () Bool)

(assert (=> start!119976 m!1283139))

(declare-fun m!1283141 () Bool)

(assert (=> start!119976 m!1283141))

(declare-fun m!1283143 () Bool)

(assert (=> b!1396641 m!1283143))

(assert (=> b!1396641 m!1283143))

(declare-fun m!1283145 () Bool)

(assert (=> b!1396641 m!1283145))

(declare-fun m!1283147 () Bool)

(assert (=> b!1396640 m!1283147))

(assert (=> b!1396639 m!1283143))

(declare-fun m!1283149 () Bool)

(assert (=> b!1396639 m!1283149))

(assert (=> b!1396639 m!1283143))

(declare-fun m!1283151 () Bool)

(assert (=> b!1396639 m!1283151))

(declare-fun m!1283153 () Bool)

(assert (=> b!1396639 m!1283153))

(assert (=> b!1396639 m!1283143))

(declare-fun m!1283155 () Bool)

(assert (=> b!1396639 m!1283155))

(declare-fun m!1283157 () Bool)

(assert (=> b!1396643 m!1283157))

(declare-fun m!1283159 () Bool)

(assert (=> b!1396636 m!1283159))

(assert (=> b!1396636 m!1283159))

(declare-fun m!1283161 () Bool)

(assert (=> b!1396636 m!1283161))

(declare-fun m!1283163 () Bool)

(assert (=> b!1396642 m!1283163))

(assert (=> b!1396644 m!1283143))

(assert (=> b!1396644 m!1283143))

(declare-fun m!1283165 () Bool)

(assert (=> b!1396644 m!1283165))

(declare-fun m!1283167 () Bool)

(assert (=> b!1396638 m!1283167))

(assert (=> b!1396638 m!1283167))

(declare-fun m!1283169 () Bool)

(assert (=> b!1396638 m!1283169))

(declare-fun m!1283171 () Bool)

(assert (=> b!1396638 m!1283171))

(declare-fun m!1283173 () Bool)

(assert (=> b!1396638 m!1283173))

(push 1)

