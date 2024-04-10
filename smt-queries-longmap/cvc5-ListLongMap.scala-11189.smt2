; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130766 () Bool)

(assert start!130766)

(declare-fun b!1533609 () Bool)

(declare-fun res!1050703 () Bool)

(declare-fun e!854278 () Bool)

(assert (=> b!1533609 (=> (not res!1050703) (not e!854278))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101864 0))(
  ( (array!101865 (arr!49148 (Array (_ BitVec 32) (_ BitVec 64))) (size!49698 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101864)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533609 (= res!1050703 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49698 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49698 a!2792)) (= (select (arr!49148 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533610 () Bool)

(declare-fun res!1050698 () Bool)

(assert (=> b!1533610 (=> (not res!1050698) (not e!854278))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101864 (_ BitVec 32)) Bool)

(assert (=> b!1533610 (= res!1050698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050695 () Bool)

(assert (=> start!130766 (=> (not res!1050695) (not e!854278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130766 (= res!1050695 (validMask!0 mask!2480))))

(assert (=> start!130766 e!854278))

(assert (=> start!130766 true))

(declare-fun array_inv!38176 (array!101864) Bool)

(assert (=> start!130766 (array_inv!38176 a!2792)))

(declare-fun b!1533611 () Bool)

(declare-fun res!1050702 () Bool)

(assert (=> b!1533611 (=> (not res!1050702) (not e!854278))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533611 (= res!1050702 (validKeyInArray!0 (select (arr!49148 a!2792) j!64)))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun b!1533612 () Bool)

(assert (=> b!1533612 (= e!854278 (not (validKeyInArray!0 (select (store (arr!49148 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))))

(declare-fun b!1533613 () Bool)

(declare-fun res!1050696 () Bool)

(assert (=> b!1533613 (=> (not res!1050696) (not e!854278))))

(assert (=> b!1533613 (= res!1050696 (and (= (select (arr!49148 a!2792) index!463) (select (arr!49148 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49148 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533614 () Bool)

(declare-fun res!1050699 () Bool)

(assert (=> b!1533614 (=> (not res!1050699) (not e!854278))))

(assert (=> b!1533614 (= res!1050699 (and (= (size!49698 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49698 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49698 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533615 () Bool)

(declare-fun res!1050700 () Bool)

(assert (=> b!1533615 (=> (not res!1050700) (not e!854278))))

(declare-datatypes ((SeekEntryResult!13280 0))(
  ( (MissingZero!13280 (index!55515 (_ BitVec 32))) (Found!13280 (index!55516 (_ BitVec 32))) (Intermediate!13280 (undefined!14092 Bool) (index!55517 (_ BitVec 32)) (x!137290 (_ BitVec 32))) (Undefined!13280) (MissingVacant!13280 (index!55518 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101864 (_ BitVec 32)) SeekEntryResult!13280)

(assert (=> b!1533615 (= res!1050700 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49148 a!2792) j!64) a!2792 mask!2480) (Found!13280 j!64)))))

(declare-fun b!1533616 () Bool)

(declare-fun res!1050701 () Bool)

(assert (=> b!1533616 (=> (not res!1050701) (not e!854278))))

(declare-datatypes ((List!35622 0))(
  ( (Nil!35619) (Cons!35618 (h!37063 (_ BitVec 64)) (t!50316 List!35622)) )
))
(declare-fun arrayNoDuplicates!0 (array!101864 (_ BitVec 32) List!35622) Bool)

(assert (=> b!1533616 (= res!1050701 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35619))))

(declare-fun b!1533617 () Bool)

(declare-fun res!1050697 () Bool)

(assert (=> b!1533617 (=> (not res!1050697) (not e!854278))))

(assert (=> b!1533617 (= res!1050697 (validKeyInArray!0 (select (arr!49148 a!2792) i!951)))))

(assert (= (and start!130766 res!1050695) b!1533614))

(assert (= (and b!1533614 res!1050699) b!1533617))

(assert (= (and b!1533617 res!1050697) b!1533611))

(assert (= (and b!1533611 res!1050702) b!1533610))

(assert (= (and b!1533610 res!1050698) b!1533616))

(assert (= (and b!1533616 res!1050701) b!1533609))

(assert (= (and b!1533609 res!1050703) b!1533615))

(assert (= (and b!1533615 res!1050700) b!1533613))

(assert (= (and b!1533613 res!1050696) b!1533612))

(declare-fun m!1416297 () Bool)

(assert (=> b!1533612 m!1416297))

(declare-fun m!1416299 () Bool)

(assert (=> b!1533612 m!1416299))

(assert (=> b!1533612 m!1416299))

(declare-fun m!1416301 () Bool)

(assert (=> b!1533612 m!1416301))

(declare-fun m!1416303 () Bool)

(assert (=> b!1533609 m!1416303))

(declare-fun m!1416305 () Bool)

(assert (=> b!1533615 m!1416305))

(assert (=> b!1533615 m!1416305))

(declare-fun m!1416307 () Bool)

(assert (=> b!1533615 m!1416307))

(declare-fun m!1416309 () Bool)

(assert (=> b!1533616 m!1416309))

(declare-fun m!1416311 () Bool)

(assert (=> b!1533613 m!1416311))

(assert (=> b!1533613 m!1416305))

(assert (=> b!1533613 m!1416297))

(declare-fun m!1416313 () Bool)

(assert (=> b!1533613 m!1416313))

(declare-fun m!1416315 () Bool)

(assert (=> b!1533617 m!1416315))

(assert (=> b!1533617 m!1416315))

(declare-fun m!1416317 () Bool)

(assert (=> b!1533617 m!1416317))

(declare-fun m!1416319 () Bool)

(assert (=> start!130766 m!1416319))

(declare-fun m!1416321 () Bool)

(assert (=> start!130766 m!1416321))

(assert (=> b!1533611 m!1416305))

(assert (=> b!1533611 m!1416305))

(declare-fun m!1416323 () Bool)

(assert (=> b!1533611 m!1416323))

(declare-fun m!1416325 () Bool)

(assert (=> b!1533610 m!1416325))

(push 1)

(assert (not b!1533616))

