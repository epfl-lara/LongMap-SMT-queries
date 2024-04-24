; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131076 () Bool)

(assert start!131076)

(declare-fun b!1535175 () Bool)

(declare-fun res!1050778 () Bool)

(declare-fun e!855481 () Bool)

(assert (=> b!1535175 (=> (not res!1050778) (not e!855481))))

(declare-datatypes ((array!101911 0))(
  ( (array!101912 (arr!49165 (Array (_ BitVec 32) (_ BitVec 64))) (size!49716 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101911)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101911 (_ BitVec 32)) Bool)

(assert (=> b!1535175 (= res!1050778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1535176 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1535176 (= e!855481 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49716 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49716 a!2792)) (= (select (arr!49165 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1535177 () Bool)

(declare-fun res!1050780 () Bool)

(assert (=> b!1535177 (=> (not res!1050780) (not e!855481))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535177 (= res!1050780 (validKeyInArray!0 (select (arr!49165 a!2792) i!951)))))

(declare-fun b!1535178 () Bool)

(declare-fun res!1050779 () Bool)

(assert (=> b!1535178 (=> (not res!1050779) (not e!855481))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535178 (= res!1050779 (validKeyInArray!0 (select (arr!49165 a!2792) j!64)))))

(declare-fun res!1050775 () Bool)

(assert (=> start!131076 (=> (not res!1050775) (not e!855481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131076 (= res!1050775 (validMask!0 mask!2480))))

(assert (=> start!131076 e!855481))

(assert (=> start!131076 true))

(declare-fun array_inv!38446 (array!101911) Bool)

(assert (=> start!131076 (array_inv!38446 a!2792)))

(declare-fun b!1535179 () Bool)

(declare-fun res!1050776 () Bool)

(assert (=> b!1535179 (=> (not res!1050776) (not e!855481))))

(assert (=> b!1535179 (= res!1050776 (and (= (size!49716 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49716 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49716 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535180 () Bool)

(declare-fun res!1050777 () Bool)

(assert (=> b!1535180 (=> (not res!1050777) (not e!855481))))

(declare-datatypes ((List!35626 0))(
  ( (Nil!35623) (Cons!35622 (h!37085 (_ BitVec 64)) (t!50312 List!35626)) )
))
(declare-fun arrayNoDuplicates!0 (array!101911 (_ BitVec 32) List!35626) Bool)

(assert (=> b!1535180 (= res!1050777 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35623))))

(assert (= (and start!131076 res!1050775) b!1535179))

(assert (= (and b!1535179 res!1050776) b!1535177))

(assert (= (and b!1535177 res!1050780) b!1535178))

(assert (= (and b!1535178 res!1050779) b!1535175))

(assert (= (and b!1535175 res!1050778) b!1535180))

(assert (= (and b!1535180 res!1050777) b!1535176))

(declare-fun m!1417747 () Bool)

(assert (=> start!131076 m!1417747))

(declare-fun m!1417749 () Bool)

(assert (=> start!131076 m!1417749))

(declare-fun m!1417751 () Bool)

(assert (=> b!1535178 m!1417751))

(assert (=> b!1535178 m!1417751))

(declare-fun m!1417753 () Bool)

(assert (=> b!1535178 m!1417753))

(declare-fun m!1417755 () Bool)

(assert (=> b!1535175 m!1417755))

(declare-fun m!1417757 () Bool)

(assert (=> b!1535176 m!1417757))

(declare-fun m!1417759 () Bool)

(assert (=> b!1535180 m!1417759))

(declare-fun m!1417761 () Bool)

(assert (=> b!1535177 m!1417761))

(assert (=> b!1535177 m!1417761))

(declare-fun m!1417763 () Bool)

(assert (=> b!1535177 m!1417763))

(check-sat (not b!1535175) (not b!1535178) (not b!1535177) (not start!131076) (not b!1535180))
(check-sat)
