; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131138 () Bool)

(assert start!131138)

(declare-fun b!1538723 () Bool)

(declare-fun res!1055885 () Bool)

(declare-fun e!855931 () Bool)

(assert (=> b!1538723 (=> (not res!1055885) (not e!855931))))

(declare-datatypes ((array!102201 0))(
  ( (array!102202 (arr!49316 (Array (_ BitVec 32) (_ BitVec 64))) (size!49868 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102201)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538723 (= res!1055885 (validKeyInArray!0 (select (arr!49316 a!2792) j!64)))))

(declare-fun b!1538724 () Bool)

(declare-fun res!1055893 () Bool)

(assert (=> b!1538724 (=> (not res!1055893) (not e!855931))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538724 (= res!1055893 (and (= (size!49868 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49868 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49868 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055890 () Bool)

(assert (=> start!131138 (=> (not res!1055890) (not e!855931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131138 (= res!1055890 (validMask!0 mask!2480))))

(assert (=> start!131138 e!855931))

(assert (=> start!131138 true))

(declare-fun array_inv!38549 (array!102201) Bool)

(assert (=> start!131138 (array_inv!38549 a!2792)))

(declare-fun b!1538725 () Bool)

(assert (=> b!1538725 (= e!855931 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun lt!664680 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538725 (= lt!664680 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538726 () Bool)

(declare-fun res!1055887 () Bool)

(assert (=> b!1538726 (=> (not res!1055887) (not e!855931))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13467 0))(
  ( (MissingZero!13467 (index!56263 (_ BitVec 32))) (Found!13467 (index!56264 (_ BitVec 32))) (Intermediate!13467 (undefined!14279 Bool) (index!56265 (_ BitVec 32)) (x!137987 (_ BitVec 32))) (Undefined!13467) (MissingVacant!13467 (index!56266 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102201 (_ BitVec 32)) SeekEntryResult!13467)

(assert (=> b!1538726 (= res!1055887 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49316 a!2792) j!64) a!2792 mask!2480) (Found!13467 j!64)))))

(declare-fun b!1538727 () Bool)

(declare-fun res!1055892 () Bool)

(assert (=> b!1538727 (=> (not res!1055892) (not e!855931))))

(assert (=> b!1538727 (= res!1055892 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49868 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49868 a!2792)) (= (select (arr!49316 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538728 () Bool)

(declare-fun res!1055886 () Bool)

(assert (=> b!1538728 (=> (not res!1055886) (not e!855931))))

(declare-datatypes ((List!35868 0))(
  ( (Nil!35865) (Cons!35864 (h!37310 (_ BitVec 64)) (t!50554 List!35868)) )
))
(declare-fun arrayNoDuplicates!0 (array!102201 (_ BitVec 32) List!35868) Bool)

(assert (=> b!1538728 (= res!1055886 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35865))))

(declare-fun b!1538729 () Bool)

(declare-fun res!1055889 () Bool)

(assert (=> b!1538729 (=> (not res!1055889) (not e!855931))))

(assert (=> b!1538729 (= res!1055889 (not (= (select (arr!49316 a!2792) index!463) (select (arr!49316 a!2792) j!64))))))

(declare-fun b!1538730 () Bool)

(declare-fun res!1055891 () Bool)

(assert (=> b!1538730 (=> (not res!1055891) (not e!855931))))

(assert (=> b!1538730 (= res!1055891 (validKeyInArray!0 (select (arr!49316 a!2792) i!951)))))

(declare-fun b!1538731 () Bool)

(declare-fun res!1055888 () Bool)

(assert (=> b!1538731 (=> (not res!1055888) (not e!855931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102201 (_ BitVec 32)) Bool)

(assert (=> b!1538731 (= res!1055888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131138 res!1055890) b!1538724))

(assert (= (and b!1538724 res!1055893) b!1538730))

(assert (= (and b!1538730 res!1055891) b!1538723))

(assert (= (and b!1538723 res!1055885) b!1538731))

(assert (= (and b!1538731 res!1055888) b!1538728))

(assert (= (and b!1538728 res!1055886) b!1538727))

(assert (= (and b!1538727 res!1055892) b!1538726))

(assert (= (and b!1538726 res!1055887) b!1538729))

(assert (= (and b!1538729 res!1055889) b!1538725))

(declare-fun m!1420511 () Bool)

(assert (=> b!1538723 m!1420511))

(assert (=> b!1538723 m!1420511))

(declare-fun m!1420513 () Bool)

(assert (=> b!1538723 m!1420513))

(declare-fun m!1420515 () Bool)

(assert (=> b!1538728 m!1420515))

(declare-fun m!1420517 () Bool)

(assert (=> b!1538725 m!1420517))

(declare-fun m!1420519 () Bool)

(assert (=> start!131138 m!1420519))

(declare-fun m!1420521 () Bool)

(assert (=> start!131138 m!1420521))

(declare-fun m!1420523 () Bool)

(assert (=> b!1538727 m!1420523))

(declare-fun m!1420525 () Bool)

(assert (=> b!1538730 m!1420525))

(assert (=> b!1538730 m!1420525))

(declare-fun m!1420527 () Bool)

(assert (=> b!1538730 m!1420527))

(assert (=> b!1538726 m!1420511))

(assert (=> b!1538726 m!1420511))

(declare-fun m!1420529 () Bool)

(assert (=> b!1538726 m!1420529))

(declare-fun m!1420531 () Bool)

(assert (=> b!1538729 m!1420531))

(assert (=> b!1538729 m!1420511))

(declare-fun m!1420533 () Bool)

(assert (=> b!1538731 m!1420533))

(push 1)

(assert (not b!1538731))

(assert (not b!1538723))

(assert (not b!1538726))

(assert (not b!1538728))

(assert (not start!131138))

(assert (not b!1538730))

(assert (not b!1538725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

