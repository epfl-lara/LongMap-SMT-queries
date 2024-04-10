; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128882 () Bool)

(assert start!128882)

(declare-fun res!1030454 () Bool)

(declare-fun e!843496 () Bool)

(assert (=> start!128882 (=> (not res!1030454) (not e!843496))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128882 (= res!1030454 (validMask!0 mask!2512))))

(assert (=> start!128882 e!843496))

(assert (=> start!128882 true))

(declare-datatypes ((array!100738 0))(
  ( (array!100739 (arr!48606 (Array (_ BitVec 32) (_ BitVec 64))) (size!49156 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100738)

(declare-fun array_inv!37634 (array!100738) Bool)

(assert (=> start!128882 (array_inv!37634 a!2804)))

(declare-fun b!1510543 () Bool)

(declare-fun res!1030451 () Bool)

(assert (=> b!1510543 (=> (not res!1030451) (not e!843496))))

(declare-datatypes ((List!35089 0))(
  ( (Nil!35086) (Cons!35085 (h!36497 (_ BitVec 64)) (t!49783 List!35089)) )
))
(declare-fun arrayNoDuplicates!0 (array!100738 (_ BitVec 32) List!35089) Bool)

(assert (=> b!1510543 (= res!1030451 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35086))))

(declare-fun e!843498 () Bool)

(declare-fun b!1510544 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12777 0))(
  ( (MissingZero!12777 (index!53503 (_ BitVec 32))) (Found!12777 (index!53504 (_ BitVec 32))) (Intermediate!12777 (undefined!13589 Bool) (index!53505 (_ BitVec 32)) (x!135247 (_ BitVec 32))) (Undefined!12777) (MissingVacant!12777 (index!53506 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100738 (_ BitVec 32)) SeekEntryResult!12777)

(assert (=> b!1510544 (= e!843498 (= (seekEntry!0 (select (arr!48606 a!2804) j!70) a!2804 mask!2512) (Found!12777 j!70)))))

(declare-fun b!1510545 () Bool)

(declare-fun res!1030452 () Bool)

(assert (=> b!1510545 (=> (not res!1030452) (not e!843496))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510545 (= res!1030452 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49156 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49156 a!2804))))))

(declare-fun b!1510546 () Bool)

(declare-fun e!843499 () Bool)

(assert (=> b!1510546 (= e!843496 e!843499)))

(declare-fun res!1030447 () Bool)

(assert (=> b!1510546 (=> (not res!1030447) (not e!843499))))

(declare-fun lt!655197 () SeekEntryResult!12777)

(declare-fun lt!655198 () SeekEntryResult!12777)

(assert (=> b!1510546 (= res!1030447 (= lt!655197 lt!655198))))

(assert (=> b!1510546 (= lt!655198 (Intermediate!12777 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100738 (_ BitVec 32)) SeekEntryResult!12777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510546 (= lt!655197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48606 a!2804) j!70) mask!2512) (select (arr!48606 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510547 () Bool)

(declare-fun res!1030448 () Bool)

(assert (=> b!1510547 (=> (not res!1030448) (not e!843496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100738 (_ BitVec 32)) Bool)

(assert (=> b!1510547 (= res!1030448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510548 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510548 (= e!843499 (not (or (not (= (select (arr!48606 a!2804) j!70) (select (store (arr!48606 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48606 a!2804) index!487) (select (arr!48606 a!2804) j!70)) (not (= (select (arr!48606 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1510548 e!843498))

(declare-fun res!1030446 () Bool)

(assert (=> b!1510548 (=> (not res!1030446) (not e!843498))))

(assert (=> b!1510548 (= res!1030446 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50422 0))(
  ( (Unit!50423) )
))
(declare-fun lt!655196 () Unit!50422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50422)

(assert (=> b!1510548 (= lt!655196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510549 () Bool)

(declare-fun res!1030456 () Bool)

(assert (=> b!1510549 (=> (not res!1030456) (not e!843496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510549 (= res!1030456 (validKeyInArray!0 (select (arr!48606 a!2804) j!70)))))

(declare-fun b!1510550 () Bool)

(declare-fun res!1030449 () Bool)

(assert (=> b!1510550 (=> (not res!1030449) (not e!843499))))

(assert (=> b!1510550 (= res!1030449 (= lt!655197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48606 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48606 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100739 (store (arr!48606 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49156 a!2804)) mask!2512)))))

(declare-fun b!1510551 () Bool)

(declare-fun res!1030453 () Bool)

(assert (=> b!1510551 (=> (not res!1030453) (not e!843499))))

(assert (=> b!1510551 (= res!1030453 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48606 a!2804) j!70) a!2804 mask!2512) lt!655198))))

(declare-fun b!1510552 () Bool)

(declare-fun res!1030455 () Bool)

(assert (=> b!1510552 (=> (not res!1030455) (not e!843496))))

(assert (=> b!1510552 (= res!1030455 (validKeyInArray!0 (select (arr!48606 a!2804) i!961)))))

(declare-fun b!1510553 () Bool)

(declare-fun res!1030450 () Bool)

(assert (=> b!1510553 (=> (not res!1030450) (not e!843496))))

(assert (=> b!1510553 (= res!1030450 (and (= (size!49156 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49156 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49156 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128882 res!1030454) b!1510553))

(assert (= (and b!1510553 res!1030450) b!1510552))

(assert (= (and b!1510552 res!1030455) b!1510549))

(assert (= (and b!1510549 res!1030456) b!1510547))

(assert (= (and b!1510547 res!1030448) b!1510543))

(assert (= (and b!1510543 res!1030451) b!1510545))

(assert (= (and b!1510545 res!1030452) b!1510546))

(assert (= (and b!1510546 res!1030447) b!1510551))

(assert (= (and b!1510551 res!1030453) b!1510550))

(assert (= (and b!1510550 res!1030449) b!1510548))

(assert (= (and b!1510548 res!1030446) b!1510544))

(declare-fun m!1393143 () Bool)

(assert (=> b!1510544 m!1393143))

(assert (=> b!1510544 m!1393143))

(declare-fun m!1393145 () Bool)

(assert (=> b!1510544 m!1393145))

(assert (=> b!1510546 m!1393143))

(assert (=> b!1510546 m!1393143))

(declare-fun m!1393147 () Bool)

(assert (=> b!1510546 m!1393147))

(assert (=> b!1510546 m!1393147))

(assert (=> b!1510546 m!1393143))

(declare-fun m!1393149 () Bool)

(assert (=> b!1510546 m!1393149))

(assert (=> b!1510549 m!1393143))

(assert (=> b!1510549 m!1393143))

(declare-fun m!1393151 () Bool)

(assert (=> b!1510549 m!1393151))

(declare-fun m!1393153 () Bool)

(assert (=> b!1510543 m!1393153))

(assert (=> b!1510548 m!1393143))

(declare-fun m!1393155 () Bool)

(assert (=> b!1510548 m!1393155))

(declare-fun m!1393157 () Bool)

(assert (=> b!1510548 m!1393157))

(declare-fun m!1393159 () Bool)

(assert (=> b!1510548 m!1393159))

(declare-fun m!1393161 () Bool)

(assert (=> b!1510548 m!1393161))

(declare-fun m!1393163 () Bool)

(assert (=> b!1510548 m!1393163))

(declare-fun m!1393165 () Bool)

(assert (=> b!1510547 m!1393165))

(assert (=> b!1510550 m!1393157))

(assert (=> b!1510550 m!1393161))

(assert (=> b!1510550 m!1393161))

(declare-fun m!1393167 () Bool)

(assert (=> b!1510550 m!1393167))

(assert (=> b!1510550 m!1393167))

(assert (=> b!1510550 m!1393161))

(declare-fun m!1393169 () Bool)

(assert (=> b!1510550 m!1393169))

(assert (=> b!1510551 m!1393143))

(assert (=> b!1510551 m!1393143))

(declare-fun m!1393171 () Bool)

(assert (=> b!1510551 m!1393171))

(declare-fun m!1393173 () Bool)

(assert (=> b!1510552 m!1393173))

(assert (=> b!1510552 m!1393173))

(declare-fun m!1393175 () Bool)

(assert (=> b!1510552 m!1393175))

(declare-fun m!1393177 () Bool)

(assert (=> start!128882 m!1393177))

(declare-fun m!1393179 () Bool)

(assert (=> start!128882 m!1393179))

(check-sat (not b!1510547) (not b!1510548) (not b!1510552) (not b!1510546) (not b!1510550) (not b!1510544) (not start!128882) (not b!1510551) (not b!1510549) (not b!1510543))
(check-sat)
