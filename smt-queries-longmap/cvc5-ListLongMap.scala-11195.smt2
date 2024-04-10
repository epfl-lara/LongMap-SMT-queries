; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130802 () Bool)

(assert start!130802)

(declare-fun b!1534021 () Bool)

(declare-fun res!1051109 () Bool)

(declare-fun e!854385 () Bool)

(assert (=> b!1534021 (=> (not res!1051109) (not e!854385))))

(declare-datatypes ((array!101900 0))(
  ( (array!101901 (arr!49166 (Array (_ BitVec 32) (_ BitVec 64))) (size!49716 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101900)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534021 (= res!1051109 (validKeyInArray!0 (select (arr!49166 a!2792) i!951)))))

(declare-fun b!1534022 () Bool)

(declare-fun res!1051108 () Bool)

(assert (=> b!1534022 (=> (not res!1051108) (not e!854385))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13298 0))(
  ( (MissingZero!13298 (index!55587 (_ BitVec 32))) (Found!13298 (index!55588 (_ BitVec 32))) (Intermediate!13298 (undefined!14110 Bool) (index!55589 (_ BitVec 32)) (x!137356 (_ BitVec 32))) (Undefined!13298) (MissingVacant!13298 (index!55590 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101900 (_ BitVec 32)) SeekEntryResult!13298)

(assert (=> b!1534022 (= res!1051108 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49166 a!2792) j!64) a!2792 mask!2480) (Found!13298 j!64)))))

(declare-fun b!1534023 () Bool)

(declare-fun res!1051113 () Bool)

(assert (=> b!1534023 (=> (not res!1051113) (not e!854385))))

(assert (=> b!1534023 (= res!1051113 (and (= (size!49716 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49716 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49716 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534024 () Bool)

(declare-fun res!1051114 () Bool)

(assert (=> b!1534024 (=> (not res!1051114) (not e!854385))))

(declare-datatypes ((List!35640 0))(
  ( (Nil!35637) (Cons!35636 (h!37081 (_ BitVec 64)) (t!50334 List!35640)) )
))
(declare-fun arrayNoDuplicates!0 (array!101900 (_ BitVec 32) List!35640) Bool)

(assert (=> b!1534024 (= res!1051114 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35637))))

(declare-fun b!1534026 () Bool)

(assert (=> b!1534026 (= e!854385 (and (= (select (arr!49166 a!2792) index!463) (select (arr!49166 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1534027 () Bool)

(declare-fun res!1051107 () Bool)

(assert (=> b!1534027 (=> (not res!1051107) (not e!854385))))

(assert (=> b!1534027 (= res!1051107 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49716 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49716 a!2792)) (= (select (arr!49166 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534028 () Bool)

(declare-fun res!1051111 () Bool)

(assert (=> b!1534028 (=> (not res!1051111) (not e!854385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101900 (_ BitVec 32)) Bool)

(assert (=> b!1534028 (= res!1051111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534025 () Bool)

(declare-fun res!1051110 () Bool)

(assert (=> b!1534025 (=> (not res!1051110) (not e!854385))))

(assert (=> b!1534025 (= res!1051110 (validKeyInArray!0 (select (arr!49166 a!2792) j!64)))))

(declare-fun res!1051112 () Bool)

(assert (=> start!130802 (=> (not res!1051112) (not e!854385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130802 (= res!1051112 (validMask!0 mask!2480))))

(assert (=> start!130802 e!854385))

(assert (=> start!130802 true))

(declare-fun array_inv!38194 (array!101900) Bool)

(assert (=> start!130802 (array_inv!38194 a!2792)))

(assert (= (and start!130802 res!1051112) b!1534023))

(assert (= (and b!1534023 res!1051113) b!1534021))

(assert (= (and b!1534021 res!1051109) b!1534025))

(assert (= (and b!1534025 res!1051110) b!1534028))

(assert (= (and b!1534028 res!1051111) b!1534024))

(assert (= (and b!1534024 res!1051114) b!1534027))

(assert (= (and b!1534027 res!1051107) b!1534022))

(assert (= (and b!1534022 res!1051108) b!1534026))

(declare-fun m!1416699 () Bool)

(assert (=> start!130802 m!1416699))

(declare-fun m!1416701 () Bool)

(assert (=> start!130802 m!1416701))

(declare-fun m!1416703 () Bool)

(assert (=> b!1534022 m!1416703))

(assert (=> b!1534022 m!1416703))

(declare-fun m!1416705 () Bool)

(assert (=> b!1534022 m!1416705))

(assert (=> b!1534025 m!1416703))

(assert (=> b!1534025 m!1416703))

(declare-fun m!1416707 () Bool)

(assert (=> b!1534025 m!1416707))

(declare-fun m!1416709 () Bool)

(assert (=> b!1534026 m!1416709))

(assert (=> b!1534026 m!1416703))

(declare-fun m!1416711 () Bool)

(assert (=> b!1534021 m!1416711))

(assert (=> b!1534021 m!1416711))

(declare-fun m!1416713 () Bool)

(assert (=> b!1534021 m!1416713))

(declare-fun m!1416715 () Bool)

(assert (=> b!1534028 m!1416715))

(declare-fun m!1416717 () Bool)

(assert (=> b!1534027 m!1416717))

(declare-fun m!1416719 () Bool)

(assert (=> b!1534024 m!1416719))

(push 1)

(assert (not b!1534021))

(assert (not b!1534028))

(assert (not b!1534024))

(assert (not b!1534022))

(assert (not start!130802))

(assert (not b!1534025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

