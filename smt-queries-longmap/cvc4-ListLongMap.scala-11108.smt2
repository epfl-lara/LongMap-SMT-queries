; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130136 () Bool)

(assert start!130136)

(declare-fun b!1525210 () Bool)

(declare-fun res!1042639 () Bool)

(declare-fun e!850569 () Bool)

(assert (=> b!1525210 (=> (not res!1042639) (not e!850569))))

(declare-datatypes ((array!101469 0))(
  ( (array!101470 (arr!48959 (Array (_ BitVec 32) (_ BitVec 64))) (size!49510 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101469)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101469 (_ BitVec 32)) Bool)

(assert (=> b!1525210 (= res!1042639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525211 () Bool)

(declare-fun e!850567 () Bool)

(assert (=> b!1525211 (= e!850567 (not true))))

(declare-fun e!850570 () Bool)

(assert (=> b!1525211 e!850570))

(declare-fun res!1042635 () Bool)

(assert (=> b!1525211 (=> (not res!1042635) (not e!850570))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1525211 (= res!1042635 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50853 0))(
  ( (Unit!50854) )
))
(declare-fun lt!660686 () Unit!50853)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50853)

(assert (=> b!1525211 (= lt!660686 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525212 () Bool)

(declare-fun res!1042631 () Bool)

(assert (=> b!1525212 (=> (not res!1042631) (not e!850569))))

(declare-datatypes ((List!35429 0))(
  ( (Nil!35426) (Cons!35425 (h!36867 (_ BitVec 64)) (t!50115 List!35429)) )
))
(declare-fun arrayNoDuplicates!0 (array!101469 (_ BitVec 32) List!35429) Bool)

(assert (=> b!1525212 (= res!1042631 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35426))))

(declare-fun b!1525213 () Bool)

(assert (=> b!1525213 (= e!850569 e!850567)))

(declare-fun res!1042636 () Bool)

(assert (=> b!1525213 (=> (not res!1042636) (not e!850567))))

(declare-datatypes ((SeekEntryResult!13017 0))(
  ( (MissingZero!13017 (index!54463 (_ BitVec 32))) (Found!13017 (index!54464 (_ BitVec 32))) (Intermediate!13017 (undefined!13829 Bool) (index!54465 (_ BitVec 32)) (x!136366 (_ BitVec 32))) (Undefined!13017) (MissingVacant!13017 (index!54466 (_ BitVec 32))) )
))
(declare-fun lt!660685 () SeekEntryResult!13017)

(declare-fun lt!660687 () SeekEntryResult!13017)

(assert (=> b!1525213 (= res!1042636 (= lt!660685 lt!660687))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525213 (= lt!660687 (Intermediate!13017 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101469 (_ BitVec 32)) SeekEntryResult!13017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525213 (= lt!660685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48959 a!2804) j!70) mask!2512) (select (arr!48959 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525215 () Bool)

(declare-fun res!1042638 () Bool)

(assert (=> b!1525215 (=> (not res!1042638) (not e!850569))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525215 (= res!1042638 (and (= (size!49510 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49510 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49510 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525216 () Bool)

(declare-fun res!1042632 () Bool)

(assert (=> b!1525216 (=> (not res!1042632) (not e!850569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525216 (= res!1042632 (validKeyInArray!0 (select (arr!48959 a!2804) j!70)))))

(declare-fun b!1525217 () Bool)

(declare-fun res!1042641 () Bool)

(assert (=> b!1525217 (=> (not res!1042641) (not e!850567))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525217 (= res!1042641 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48959 a!2804) j!70) a!2804 mask!2512) lt!660687))))

(declare-fun b!1525218 () Bool)

(declare-fun res!1042634 () Bool)

(assert (=> b!1525218 (=> (not res!1042634) (not e!850567))))

(assert (=> b!1525218 (= res!1042634 (= lt!660685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48959 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48959 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101470 (store (arr!48959 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49510 a!2804)) mask!2512)))))

(declare-fun res!1042633 () Bool)

(assert (=> start!130136 (=> (not res!1042633) (not e!850569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130136 (= res!1042633 (validMask!0 mask!2512))))

(assert (=> start!130136 e!850569))

(assert (=> start!130136 true))

(declare-fun array_inv!38240 (array!101469) Bool)

(assert (=> start!130136 (array_inv!38240 a!2804)))

(declare-fun b!1525214 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101469 (_ BitVec 32)) SeekEntryResult!13017)

(assert (=> b!1525214 (= e!850570 (= (seekEntry!0 (select (arr!48959 a!2804) j!70) a!2804 mask!2512) (Found!13017 j!70)))))

(declare-fun b!1525219 () Bool)

(declare-fun res!1042640 () Bool)

(assert (=> b!1525219 (=> (not res!1042640) (not e!850569))))

(assert (=> b!1525219 (= res!1042640 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49510 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49510 a!2804))))))

(declare-fun b!1525220 () Bool)

(declare-fun res!1042637 () Bool)

(assert (=> b!1525220 (=> (not res!1042637) (not e!850569))))

(assert (=> b!1525220 (= res!1042637 (validKeyInArray!0 (select (arr!48959 a!2804) i!961)))))

(assert (= (and start!130136 res!1042633) b!1525215))

(assert (= (and b!1525215 res!1042638) b!1525220))

(assert (= (and b!1525220 res!1042637) b!1525216))

(assert (= (and b!1525216 res!1042632) b!1525210))

(assert (= (and b!1525210 res!1042639) b!1525212))

(assert (= (and b!1525212 res!1042631) b!1525219))

(assert (= (and b!1525219 res!1042640) b!1525213))

(assert (= (and b!1525213 res!1042636) b!1525217))

(assert (= (and b!1525217 res!1042641) b!1525218))

(assert (= (and b!1525218 res!1042634) b!1525211))

(assert (= (and b!1525211 res!1042635) b!1525214))

(declare-fun m!1408129 () Bool)

(assert (=> b!1525214 m!1408129))

(assert (=> b!1525214 m!1408129))

(declare-fun m!1408131 () Bool)

(assert (=> b!1525214 m!1408131))

(assert (=> b!1525217 m!1408129))

(assert (=> b!1525217 m!1408129))

(declare-fun m!1408133 () Bool)

(assert (=> b!1525217 m!1408133))

(declare-fun m!1408135 () Bool)

(assert (=> b!1525211 m!1408135))

(declare-fun m!1408137 () Bool)

(assert (=> b!1525211 m!1408137))

(declare-fun m!1408139 () Bool)

(assert (=> b!1525210 m!1408139))

(assert (=> b!1525216 m!1408129))

(assert (=> b!1525216 m!1408129))

(declare-fun m!1408141 () Bool)

(assert (=> b!1525216 m!1408141))

(declare-fun m!1408143 () Bool)

(assert (=> start!130136 m!1408143))

(declare-fun m!1408145 () Bool)

(assert (=> start!130136 m!1408145))

(assert (=> b!1525213 m!1408129))

(assert (=> b!1525213 m!1408129))

(declare-fun m!1408147 () Bool)

(assert (=> b!1525213 m!1408147))

(assert (=> b!1525213 m!1408147))

(assert (=> b!1525213 m!1408129))

(declare-fun m!1408149 () Bool)

(assert (=> b!1525213 m!1408149))

(declare-fun m!1408151 () Bool)

(assert (=> b!1525212 m!1408151))

(declare-fun m!1408153 () Bool)

(assert (=> b!1525220 m!1408153))

(assert (=> b!1525220 m!1408153))

(declare-fun m!1408155 () Bool)

(assert (=> b!1525220 m!1408155))

(declare-fun m!1408157 () Bool)

(assert (=> b!1525218 m!1408157))

(declare-fun m!1408159 () Bool)

(assert (=> b!1525218 m!1408159))

(assert (=> b!1525218 m!1408159))

(declare-fun m!1408161 () Bool)

(assert (=> b!1525218 m!1408161))

(assert (=> b!1525218 m!1408161))

(assert (=> b!1525218 m!1408159))

(declare-fun m!1408163 () Bool)

(assert (=> b!1525218 m!1408163))

(push 1)

(assert (not b!1525214))

(assert (not b!1525218))

(assert (not start!130136))

(assert (not b!1525216))

(assert (not b!1525212))

(assert (not b!1525217))

(assert (not b!1525220))

(assert (not b!1525210))

(assert (not b!1525213))

(assert (not b!1525211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

