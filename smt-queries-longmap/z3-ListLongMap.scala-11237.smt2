; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131056 () Bool)

(assert start!131056)

(declare-fun b!1537694 () Bool)

(declare-fun res!1054781 () Bool)

(declare-fun e!855733 () Bool)

(assert (=> b!1537694 (=> (not res!1054781) (not e!855733))))

(declare-datatypes ((array!102154 0))(
  ( (array!102155 (arr!49293 (Array (_ BitVec 32) (_ BitVec 64))) (size!49843 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102154)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537694 (= res!1054781 (validKeyInArray!0 (select (arr!49293 a!2792) j!64)))))

(declare-fun b!1537695 () Bool)

(declare-fun res!1054786 () Bool)

(assert (=> b!1537695 (=> (not res!1054786) (not e!855733))))

(declare-datatypes ((List!35767 0))(
  ( (Nil!35764) (Cons!35763 (h!37208 (_ BitVec 64)) (t!50461 List!35767)) )
))
(declare-fun arrayNoDuplicates!0 (array!102154 (_ BitVec 32) List!35767) Bool)

(assert (=> b!1537695 (= res!1054786 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35764))))

(declare-fun b!1537696 () Bool)

(declare-fun res!1054783 () Bool)

(assert (=> b!1537696 (=> (not res!1054783) (not e!855733))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537696 (= res!1054783 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49843 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49843 a!2792)) (= (select (arr!49293 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537697 () Bool)

(declare-fun res!1054785 () Bool)

(assert (=> b!1537697 (=> (not res!1054785) (not e!855733))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102154 (_ BitVec 32)) Bool)

(assert (=> b!1537697 (= res!1054785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1054784 () Bool)

(assert (=> start!131056 (=> (not res!1054784) (not e!855733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131056 (= res!1054784 (validMask!0 mask!2480))))

(assert (=> start!131056 e!855733))

(assert (=> start!131056 true))

(declare-fun array_inv!38321 (array!102154) Bool)

(assert (=> start!131056 (array_inv!38321 a!2792)))

(declare-fun b!1537698 () Bool)

(assert (=> b!1537698 (= e!855733 false)))

(declare-datatypes ((SeekEntryResult!13419 0))(
  ( (MissingZero!13419 (index!56071 (_ BitVec 32))) (Found!13419 (index!56072 (_ BitVec 32))) (Intermediate!13419 (undefined!14231 Bool) (index!56073 (_ BitVec 32)) (x!137813 (_ BitVec 32))) (Undefined!13419) (MissingVacant!13419 (index!56074 (_ BitVec 32))) )
))
(declare-fun lt!664771 () SeekEntryResult!13419)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102154 (_ BitVec 32)) SeekEntryResult!13419)

(assert (=> b!1537698 (= lt!664771 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49293 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537699 () Bool)

(declare-fun res!1054782 () Bool)

(assert (=> b!1537699 (=> (not res!1054782) (not e!855733))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537699 (= res!1054782 (and (= (size!49843 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49843 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49843 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537700 () Bool)

(declare-fun res!1054780 () Bool)

(assert (=> b!1537700 (=> (not res!1054780) (not e!855733))))

(assert (=> b!1537700 (= res!1054780 (validKeyInArray!0 (select (arr!49293 a!2792) i!951)))))

(assert (= (and start!131056 res!1054784) b!1537699))

(assert (= (and b!1537699 res!1054782) b!1537700))

(assert (= (and b!1537700 res!1054780) b!1537694))

(assert (= (and b!1537694 res!1054781) b!1537697))

(assert (= (and b!1537697 res!1054785) b!1537695))

(assert (= (and b!1537695 res!1054786) b!1537696))

(assert (= (and b!1537696 res!1054783) b!1537698))

(declare-fun m!1420211 () Bool)

(assert (=> b!1537698 m!1420211))

(assert (=> b!1537698 m!1420211))

(declare-fun m!1420213 () Bool)

(assert (=> b!1537698 m!1420213))

(declare-fun m!1420215 () Bool)

(assert (=> b!1537695 m!1420215))

(assert (=> b!1537694 m!1420211))

(assert (=> b!1537694 m!1420211))

(declare-fun m!1420217 () Bool)

(assert (=> b!1537694 m!1420217))

(declare-fun m!1420219 () Bool)

(assert (=> b!1537697 m!1420219))

(declare-fun m!1420221 () Bool)

(assert (=> b!1537700 m!1420221))

(assert (=> b!1537700 m!1420221))

(declare-fun m!1420223 () Bool)

(assert (=> b!1537700 m!1420223))

(declare-fun m!1420225 () Bool)

(assert (=> start!131056 m!1420225))

(declare-fun m!1420227 () Bool)

(assert (=> start!131056 m!1420227))

(declare-fun m!1420229 () Bool)

(assert (=> b!1537696 m!1420229))

(check-sat (not b!1537700) (not b!1537697) (not b!1537694) (not b!1537698) (not start!131056) (not b!1537695))
