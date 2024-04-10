; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130782 () Bool)

(assert start!130782)

(declare-fun b!1533799 () Bool)

(declare-fun res!1050892 () Bool)

(declare-fun e!854325 () Bool)

(assert (=> b!1533799 (=> (not res!1050892) (not e!854325))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101880 0))(
  ( (array!101881 (arr!49156 (Array (_ BitVec 32) (_ BitVec 64))) (size!49706 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101880)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13288 0))(
  ( (MissingZero!13288 (index!55547 (_ BitVec 32))) (Found!13288 (index!55548 (_ BitVec 32))) (Intermediate!13288 (undefined!14100 Bool) (index!55549 (_ BitVec 32)) (x!137314 (_ BitVec 32))) (Undefined!13288) (MissingVacant!13288 (index!55550 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101880 (_ BitVec 32)) SeekEntryResult!13288)

(assert (=> b!1533799 (= res!1050892 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49156 a!2792) j!64) a!2792 mask!2480) (Found!13288 j!64)))))

(declare-fun b!1533800 () Bool)

(assert (=> b!1533800 (= e!854325 (and (= (select (arr!49156 a!2792) index!463) (select (arr!49156 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1533801 () Bool)

(declare-fun res!1050886 () Bool)

(assert (=> b!1533801 (=> (not res!1050886) (not e!854325))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533801 (= res!1050886 (and (= (size!49706 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49706 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49706 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533802 () Bool)

(declare-fun res!1050891 () Bool)

(assert (=> b!1533802 (=> (not res!1050891) (not e!854325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533802 (= res!1050891 (validKeyInArray!0 (select (arr!49156 a!2792) j!64)))))

(declare-fun b!1533803 () Bool)

(declare-fun res!1050889 () Bool)

(assert (=> b!1533803 (=> (not res!1050889) (not e!854325))))

(assert (=> b!1533803 (= res!1050889 (validKeyInArray!0 (select (arr!49156 a!2792) i!951)))))

(declare-fun b!1533804 () Bool)

(declare-fun res!1050890 () Bool)

(assert (=> b!1533804 (=> (not res!1050890) (not e!854325))))

(assert (=> b!1533804 (= res!1050890 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49706 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49706 a!2792)) (= (select (arr!49156 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050887 () Bool)

(assert (=> start!130782 (=> (not res!1050887) (not e!854325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130782 (= res!1050887 (validMask!0 mask!2480))))

(assert (=> start!130782 e!854325))

(assert (=> start!130782 true))

(declare-fun array_inv!38184 (array!101880) Bool)

(assert (=> start!130782 (array_inv!38184 a!2792)))

(declare-fun b!1533805 () Bool)

(declare-fun res!1050888 () Bool)

(assert (=> b!1533805 (=> (not res!1050888) (not e!854325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101880 (_ BitVec 32)) Bool)

(assert (=> b!1533805 (= res!1050888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533806 () Bool)

(declare-fun res!1050885 () Bool)

(assert (=> b!1533806 (=> (not res!1050885) (not e!854325))))

(declare-datatypes ((List!35630 0))(
  ( (Nil!35627) (Cons!35626 (h!37071 (_ BitVec 64)) (t!50324 List!35630)) )
))
(declare-fun arrayNoDuplicates!0 (array!101880 (_ BitVec 32) List!35630) Bool)

(assert (=> b!1533806 (= res!1050885 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35627))))

(assert (= (and start!130782 res!1050887) b!1533801))

(assert (= (and b!1533801 res!1050886) b!1533803))

(assert (= (and b!1533803 res!1050889) b!1533802))

(assert (= (and b!1533802 res!1050891) b!1533805))

(assert (= (and b!1533805 res!1050888) b!1533806))

(assert (= (and b!1533806 res!1050885) b!1533804))

(assert (= (and b!1533804 res!1050890) b!1533799))

(assert (= (and b!1533799 res!1050892) b!1533800))

(declare-fun m!1416491 () Bool)

(assert (=> b!1533799 m!1416491))

(assert (=> b!1533799 m!1416491))

(declare-fun m!1416493 () Bool)

(assert (=> b!1533799 m!1416493))

(declare-fun m!1416495 () Bool)

(assert (=> b!1533804 m!1416495))

(declare-fun m!1416497 () Bool)

(assert (=> b!1533805 m!1416497))

(declare-fun m!1416499 () Bool)

(assert (=> b!1533800 m!1416499))

(assert (=> b!1533800 m!1416491))

(declare-fun m!1416501 () Bool)

(assert (=> b!1533806 m!1416501))

(declare-fun m!1416503 () Bool)

(assert (=> b!1533803 m!1416503))

(assert (=> b!1533803 m!1416503))

(declare-fun m!1416505 () Bool)

(assert (=> b!1533803 m!1416505))

(assert (=> b!1533802 m!1416491))

(assert (=> b!1533802 m!1416491))

(declare-fun m!1416507 () Bool)

(assert (=> b!1533802 m!1416507))

(declare-fun m!1416509 () Bool)

(assert (=> start!130782 m!1416509))

(declare-fun m!1416511 () Bool)

(assert (=> start!130782 m!1416511))

(push 1)

(assert (not b!1533799))

(assert (not b!1533805))

(assert (not b!1533802))

(assert (not b!1533806))

(assert (not b!1533803))

(assert (not start!130782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

