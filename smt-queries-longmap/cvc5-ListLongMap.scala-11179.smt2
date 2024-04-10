; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130706 () Bool)

(assert start!130706)

(declare-fun b!1532982 () Bool)

(declare-fun res!1050068 () Bool)

(declare-fun e!854098 () Bool)

(assert (=> b!1532982 (=> (not res!1050068) (not e!854098))))

(declare-datatypes ((array!101804 0))(
  ( (array!101805 (arr!49118 (Array (_ BitVec 32) (_ BitVec 64))) (size!49668 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101804)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532982 (= res!1050068 (validKeyInArray!0 (select (arr!49118 a!2792) i!951)))))

(declare-fun b!1532983 () Bool)

(declare-fun res!1050071 () Bool)

(assert (=> b!1532983 (=> (not res!1050071) (not e!854098))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532983 (= res!1050071 (validKeyInArray!0 (select (arr!49118 a!2792) j!64)))))

(declare-fun b!1532984 () Bool)

(declare-fun res!1050070 () Bool)

(assert (=> b!1532984 (=> (not res!1050070) (not e!854098))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532984 (= res!1050070 (and (= (size!49668 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49668 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49668 a!2792)) (not (= i!951 j!64))))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1532985 () Bool)

(assert (=> b!1532985 (= e!854098 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49668 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49668 a!2792)) (= (select (arr!49118 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1532986 () Bool)

(declare-fun res!1050073 () Bool)

(assert (=> b!1532986 (=> (not res!1050073) (not e!854098))))

(declare-datatypes ((List!35592 0))(
  ( (Nil!35589) (Cons!35588 (h!37033 (_ BitVec 64)) (t!50286 List!35592)) )
))
(declare-fun arrayNoDuplicates!0 (array!101804 (_ BitVec 32) List!35592) Bool)

(assert (=> b!1532986 (= res!1050073 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35589))))

(declare-fun res!1050069 () Bool)

(assert (=> start!130706 (=> (not res!1050069) (not e!854098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130706 (= res!1050069 (validMask!0 mask!2480))))

(assert (=> start!130706 e!854098))

(assert (=> start!130706 true))

(declare-fun array_inv!38146 (array!101804) Bool)

(assert (=> start!130706 (array_inv!38146 a!2792)))

(declare-fun b!1532987 () Bool)

(declare-fun res!1050072 () Bool)

(assert (=> b!1532987 (=> (not res!1050072) (not e!854098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101804 (_ BitVec 32)) Bool)

(assert (=> b!1532987 (= res!1050072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130706 res!1050069) b!1532984))

(assert (= (and b!1532984 res!1050070) b!1532982))

(assert (= (and b!1532982 res!1050068) b!1532983))

(assert (= (and b!1532983 res!1050071) b!1532987))

(assert (= (and b!1532987 res!1050072) b!1532986))

(assert (= (and b!1532986 res!1050073) b!1532985))

(declare-fun m!1415691 () Bool)

(assert (=> b!1532987 m!1415691))

(declare-fun m!1415693 () Bool)

(assert (=> b!1532982 m!1415693))

(assert (=> b!1532982 m!1415693))

(declare-fun m!1415695 () Bool)

(assert (=> b!1532982 m!1415695))

(declare-fun m!1415697 () Bool)

(assert (=> b!1532986 m!1415697))

(declare-fun m!1415699 () Bool)

(assert (=> b!1532983 m!1415699))

(assert (=> b!1532983 m!1415699))

(declare-fun m!1415701 () Bool)

(assert (=> b!1532983 m!1415701))

(declare-fun m!1415703 () Bool)

(assert (=> start!130706 m!1415703))

(declare-fun m!1415705 () Bool)

(assert (=> start!130706 m!1415705))

(declare-fun m!1415707 () Bool)

(assert (=> b!1532985 m!1415707))

(push 1)

(assert (not start!130706))

(assert (not b!1532987))

(assert (not b!1532983))

(assert (not b!1532986))

(assert (not b!1532982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

