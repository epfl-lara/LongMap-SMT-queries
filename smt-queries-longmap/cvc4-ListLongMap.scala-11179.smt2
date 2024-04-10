; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130710 () Bool)

(assert start!130710)

(declare-fun b!1533018 () Bool)

(declare-fun res!1050105 () Bool)

(declare-fun e!854109 () Bool)

(assert (=> b!1533018 (=> (not res!1050105) (not e!854109))))

(declare-datatypes ((array!101808 0))(
  ( (array!101809 (arr!49120 (Array (_ BitVec 32) (_ BitVec 64))) (size!49670 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101808)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533018 (= res!1050105 (validKeyInArray!0 (select (arr!49120 a!2792) j!64)))))

(declare-fun b!1533019 () Bool)

(declare-fun res!1050104 () Bool)

(assert (=> b!1533019 (=> (not res!1050104) (not e!854109))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533019 (= res!1050104 (and (= (size!49670 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49670 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49670 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533020 () Bool)

(declare-fun res!1050108 () Bool)

(assert (=> b!1533020 (=> (not res!1050108) (not e!854109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101808 (_ BitVec 32)) Bool)

(assert (=> b!1533020 (= res!1050108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun b!1533021 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533021 (= e!854109 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49670 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49670 a!2792)) (= (select (arr!49120 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun res!1050107 () Bool)

(assert (=> start!130710 (=> (not res!1050107) (not e!854109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130710 (= res!1050107 (validMask!0 mask!2480))))

(assert (=> start!130710 e!854109))

(assert (=> start!130710 true))

(declare-fun array_inv!38148 (array!101808) Bool)

(assert (=> start!130710 (array_inv!38148 a!2792)))

(declare-fun b!1533022 () Bool)

(declare-fun res!1050106 () Bool)

(assert (=> b!1533022 (=> (not res!1050106) (not e!854109))))

(declare-datatypes ((List!35594 0))(
  ( (Nil!35591) (Cons!35590 (h!37035 (_ BitVec 64)) (t!50288 List!35594)) )
))
(declare-fun arrayNoDuplicates!0 (array!101808 (_ BitVec 32) List!35594) Bool)

(assert (=> b!1533022 (= res!1050106 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35591))))

(declare-fun b!1533023 () Bool)

(declare-fun res!1050109 () Bool)

(assert (=> b!1533023 (=> (not res!1050109) (not e!854109))))

(assert (=> b!1533023 (= res!1050109 (validKeyInArray!0 (select (arr!49120 a!2792) i!951)))))

(assert (= (and start!130710 res!1050107) b!1533019))

(assert (= (and b!1533019 res!1050104) b!1533023))

(assert (= (and b!1533023 res!1050109) b!1533018))

(assert (= (and b!1533018 res!1050105) b!1533020))

(assert (= (and b!1533020 res!1050108) b!1533022))

(assert (= (and b!1533022 res!1050106) b!1533021))

(declare-fun m!1415727 () Bool)

(assert (=> b!1533022 m!1415727))

(declare-fun m!1415729 () Bool)

(assert (=> start!130710 m!1415729))

(declare-fun m!1415731 () Bool)

(assert (=> start!130710 m!1415731))

(declare-fun m!1415733 () Bool)

(assert (=> b!1533018 m!1415733))

(assert (=> b!1533018 m!1415733))

(declare-fun m!1415735 () Bool)

(assert (=> b!1533018 m!1415735))

(declare-fun m!1415737 () Bool)

(assert (=> b!1533023 m!1415737))

(assert (=> b!1533023 m!1415737))

(declare-fun m!1415739 () Bool)

(assert (=> b!1533023 m!1415739))

(declare-fun m!1415741 () Bool)

(assert (=> b!1533021 m!1415741))

(declare-fun m!1415743 () Bool)

(assert (=> b!1533020 m!1415743))

(push 1)

(assert (not start!130710))

(assert (not b!1533023))

(assert (not b!1533020))

(assert (not b!1533018))

(assert (not b!1533022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

