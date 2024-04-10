; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128498 () Bool)

(assert start!128498)

(declare-fun b!1506730 () Bool)

(declare-fun res!1027055 () Bool)

(declare-fun e!841986 () Bool)

(assert (=> b!1506730 (=> (not res!1027055) (not e!841986))))

(declare-datatypes ((array!100510 0))(
  ( (array!100511 (arr!48498 (Array (_ BitVec 32) (_ BitVec 64))) (size!49048 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100510)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506730 (= res!1027055 (validKeyInArray!0 (select (arr!48498 a!2804) i!961)))))

(declare-fun b!1506731 () Bool)

(declare-fun res!1027060 () Bool)

(assert (=> b!1506731 (=> (not res!1027060) (not e!841986))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12669 0))(
  ( (MissingZero!12669 (index!53071 (_ BitVec 32))) (Found!12669 (index!53072 (_ BitVec 32))) (Intermediate!12669 (undefined!13481 Bool) (index!53073 (_ BitVec 32)) (x!134827 (_ BitVec 32))) (Undefined!12669) (MissingVacant!12669 (index!53074 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100510 (_ BitVec 32)) SeekEntryResult!12669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506731 (= res!1027060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48498 a!2804) j!70) mask!2512) (select (arr!48498 a!2804) j!70) a!2804 mask!2512) (Intermediate!12669 false resIndex!21 resX!21)))))

(declare-fun b!1506732 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1506732 (= e!841986 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun b!1506733 () Bool)

(declare-fun res!1027059 () Bool)

(assert (=> b!1506733 (=> (not res!1027059) (not e!841986))))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506733 (= res!1027059 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49048 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49048 a!2804))))))

(declare-fun b!1506734 () Bool)

(declare-fun res!1027056 () Bool)

(assert (=> b!1506734 (=> (not res!1027056) (not e!841986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100510 (_ BitVec 32)) Bool)

(assert (=> b!1506734 (= res!1027056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1027054 () Bool)

(assert (=> start!128498 (=> (not res!1027054) (not e!841986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128498 (= res!1027054 (validMask!0 mask!2512))))

(assert (=> start!128498 e!841986))

(assert (=> start!128498 true))

(declare-fun array_inv!37526 (array!100510) Bool)

(assert (=> start!128498 (array_inv!37526 a!2804)))

(declare-fun b!1506735 () Bool)

(declare-fun res!1027053 () Bool)

(assert (=> b!1506735 (=> (not res!1027053) (not e!841986))))

(assert (=> b!1506735 (= res!1027053 (and (= (size!49048 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49048 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49048 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506736 () Bool)

(declare-fun res!1027058 () Bool)

(assert (=> b!1506736 (=> (not res!1027058) (not e!841986))))

(declare-datatypes ((List!34981 0))(
  ( (Nil!34978) (Cons!34977 (h!36377 (_ BitVec 64)) (t!49675 List!34981)) )
))
(declare-fun arrayNoDuplicates!0 (array!100510 (_ BitVec 32) List!34981) Bool)

(assert (=> b!1506736 (= res!1027058 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34978))))

(declare-fun b!1506737 () Bool)

(declare-fun res!1027057 () Bool)

(assert (=> b!1506737 (=> (not res!1027057) (not e!841986))))

(assert (=> b!1506737 (= res!1027057 (validKeyInArray!0 (select (arr!48498 a!2804) j!70)))))

(assert (= (and start!128498 res!1027054) b!1506735))

(assert (= (and b!1506735 res!1027053) b!1506730))

(assert (= (and b!1506730 res!1027055) b!1506737))

(assert (= (and b!1506737 res!1027057) b!1506734))

(assert (= (and b!1506734 res!1027056) b!1506736))

(assert (= (and b!1506736 res!1027058) b!1506733))

(assert (= (and b!1506733 res!1027059) b!1506731))

(assert (= (and b!1506731 res!1027060) b!1506732))

(declare-fun m!1389639 () Bool)

(assert (=> b!1506736 m!1389639))

(declare-fun m!1389641 () Bool)

(assert (=> b!1506731 m!1389641))

(assert (=> b!1506731 m!1389641))

(declare-fun m!1389643 () Bool)

(assert (=> b!1506731 m!1389643))

(assert (=> b!1506731 m!1389643))

(assert (=> b!1506731 m!1389641))

(declare-fun m!1389645 () Bool)

(assert (=> b!1506731 m!1389645))

(declare-fun m!1389647 () Bool)

(assert (=> b!1506734 m!1389647))

(declare-fun m!1389649 () Bool)

(assert (=> start!128498 m!1389649))

(declare-fun m!1389651 () Bool)

(assert (=> start!128498 m!1389651))

(assert (=> b!1506737 m!1389641))

(assert (=> b!1506737 m!1389641))

(declare-fun m!1389653 () Bool)

(assert (=> b!1506737 m!1389653))

(declare-fun m!1389655 () Bool)

(assert (=> b!1506730 m!1389655))

(assert (=> b!1506730 m!1389655))

(declare-fun m!1389657 () Bool)

(assert (=> b!1506730 m!1389657))

(check-sat (not start!128498) (not b!1506730) (not b!1506734) (not b!1506737) (not b!1506736) (not b!1506731))
(check-sat)
