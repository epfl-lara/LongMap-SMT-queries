; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130682 () Bool)

(assert start!130682)

(declare-fun b!1532784 () Bool)

(declare-fun res!1049874 () Bool)

(declare-fun e!854025 () Bool)

(assert (=> b!1532784 (=> (not res!1049874) (not e!854025))))

(declare-datatypes ((array!101780 0))(
  ( (array!101781 (arr!49106 (Array (_ BitVec 32) (_ BitVec 64))) (size!49656 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101780)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532784 (= res!1049874 (validKeyInArray!0 (select (arr!49106 a!2792) j!64)))))

(declare-fun b!1532785 () Bool)

(declare-fun res!1049870 () Bool)

(assert (=> b!1532785 (=> (not res!1049870) (not e!854025))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532785 (= res!1049870 (and (= (size!49656 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49656 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49656 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532786 () Bool)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1532786 (= e!854025 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49656 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49656 a!2792)) (= (select (arr!49106 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1532787 () Bool)

(declare-fun res!1049875 () Bool)

(assert (=> b!1532787 (=> (not res!1049875) (not e!854025))))

(assert (=> b!1532787 (= res!1049875 (validKeyInArray!0 (select (arr!49106 a!2792) i!951)))))

(declare-fun b!1532788 () Bool)

(declare-fun res!1049871 () Bool)

(assert (=> b!1532788 (=> (not res!1049871) (not e!854025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101780 (_ BitVec 32)) Bool)

(assert (=> b!1532788 (= res!1049871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532789 () Bool)

(declare-fun res!1049873 () Bool)

(assert (=> b!1532789 (=> (not res!1049873) (not e!854025))))

(declare-datatypes ((List!35580 0))(
  ( (Nil!35577) (Cons!35576 (h!37021 (_ BitVec 64)) (t!50274 List!35580)) )
))
(declare-fun arrayNoDuplicates!0 (array!101780 (_ BitVec 32) List!35580) Bool)

(assert (=> b!1532789 (= res!1049873 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35577))))

(declare-fun res!1049872 () Bool)

(assert (=> start!130682 (=> (not res!1049872) (not e!854025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130682 (= res!1049872 (validMask!0 mask!2480))))

(assert (=> start!130682 e!854025))

(assert (=> start!130682 true))

(declare-fun array_inv!38134 (array!101780) Bool)

(assert (=> start!130682 (array_inv!38134 a!2792)))

(assert (= (and start!130682 res!1049872) b!1532785))

(assert (= (and b!1532785 res!1049870) b!1532787))

(assert (= (and b!1532787 res!1049875) b!1532784))

(assert (= (and b!1532784 res!1049874) b!1532788))

(assert (= (and b!1532788 res!1049871) b!1532789))

(assert (= (and b!1532789 res!1049873) b!1532786))

(declare-fun m!1415487 () Bool)

(assert (=> b!1532787 m!1415487))

(assert (=> b!1532787 m!1415487))

(declare-fun m!1415489 () Bool)

(assert (=> b!1532787 m!1415489))

(declare-fun m!1415491 () Bool)

(assert (=> b!1532788 m!1415491))

(declare-fun m!1415493 () Bool)

(assert (=> b!1532786 m!1415493))

(declare-fun m!1415495 () Bool)

(assert (=> b!1532789 m!1415495))

(declare-fun m!1415497 () Bool)

(assert (=> b!1532784 m!1415497))

(assert (=> b!1532784 m!1415497))

(declare-fun m!1415499 () Bool)

(assert (=> b!1532784 m!1415499))

(declare-fun m!1415501 () Bool)

(assert (=> start!130682 m!1415501))

(declare-fun m!1415503 () Bool)

(assert (=> start!130682 m!1415503))

(push 1)

(assert (not b!1532788))

(assert (not b!1532784))

(assert (not b!1532787))

(assert (not start!130682))

(assert (not b!1532789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

