; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131080 () Bool)

(assert start!131080)

(declare-fun b!1537947 () Bool)

(declare-fun e!855805 () Bool)

(assert (=> b!1537947 (= e!855805 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102178 0))(
  ( (array!102179 (arr!49305 (Array (_ BitVec 32) (_ BitVec 64))) (size!49855 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102178)

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13431 0))(
  ( (MissingZero!13431 (index!56119 (_ BitVec 32))) (Found!13431 (index!56120 (_ BitVec 32))) (Intermediate!13431 (undefined!14243 Bool) (index!56121 (_ BitVec 32)) (x!137857 (_ BitVec 32))) (Undefined!13431) (MissingVacant!13431 (index!56122 (_ BitVec 32))) )
))
(declare-fun lt!664807 () SeekEntryResult!13431)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102178 (_ BitVec 32)) SeekEntryResult!13431)

(assert (=> b!1537947 (= lt!664807 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49305 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537948 () Bool)

(declare-fun res!1055037 () Bool)

(assert (=> b!1537948 (=> (not res!1055037) (not e!855805))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537948 (= res!1055037 (and (= (size!49855 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49855 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49855 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537949 () Bool)

(declare-fun res!1055033 () Bool)

(assert (=> b!1537949 (=> (not res!1055033) (not e!855805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102178 (_ BitVec 32)) Bool)

(assert (=> b!1537949 (= res!1055033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537950 () Bool)

(declare-fun res!1055036 () Bool)

(assert (=> b!1537950 (=> (not res!1055036) (not e!855805))))

(declare-datatypes ((List!35779 0))(
  ( (Nil!35776) (Cons!35775 (h!37220 (_ BitVec 64)) (t!50473 List!35779)) )
))
(declare-fun arrayNoDuplicates!0 (array!102178 (_ BitVec 32) List!35779) Bool)

(assert (=> b!1537950 (= res!1055036 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35776))))

(declare-fun b!1537946 () Bool)

(declare-fun res!1055032 () Bool)

(assert (=> b!1537946 (=> (not res!1055032) (not e!855805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537946 (= res!1055032 (validKeyInArray!0 (select (arr!49305 a!2792) i!951)))))

(declare-fun res!1055038 () Bool)

(assert (=> start!131080 (=> (not res!1055038) (not e!855805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131080 (= res!1055038 (validMask!0 mask!2480))))

(assert (=> start!131080 e!855805))

(assert (=> start!131080 true))

(declare-fun array_inv!38333 (array!102178) Bool)

(assert (=> start!131080 (array_inv!38333 a!2792)))

(declare-fun b!1537951 () Bool)

(declare-fun res!1055034 () Bool)

(assert (=> b!1537951 (=> (not res!1055034) (not e!855805))))

(assert (=> b!1537951 (= res!1055034 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49855 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49855 a!2792)) (= (select (arr!49305 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537952 () Bool)

(declare-fun res!1055035 () Bool)

(assert (=> b!1537952 (=> (not res!1055035) (not e!855805))))

(assert (=> b!1537952 (= res!1055035 (validKeyInArray!0 (select (arr!49305 a!2792) j!64)))))

(assert (= (and start!131080 res!1055038) b!1537948))

(assert (= (and b!1537948 res!1055037) b!1537946))

(assert (= (and b!1537946 res!1055032) b!1537952))

(assert (= (and b!1537952 res!1055035) b!1537949))

(assert (= (and b!1537949 res!1055033) b!1537950))

(assert (= (and b!1537950 res!1055036) b!1537951))

(assert (= (and b!1537951 res!1055034) b!1537947))

(declare-fun m!1420451 () Bool)

(assert (=> b!1537946 m!1420451))

(assert (=> b!1537946 m!1420451))

(declare-fun m!1420453 () Bool)

(assert (=> b!1537946 m!1420453))

(declare-fun m!1420455 () Bool)

(assert (=> b!1537951 m!1420455))

(declare-fun m!1420457 () Bool)

(assert (=> b!1537947 m!1420457))

(assert (=> b!1537947 m!1420457))

(declare-fun m!1420459 () Bool)

(assert (=> b!1537947 m!1420459))

(declare-fun m!1420461 () Bool)

(assert (=> b!1537949 m!1420461))

(assert (=> b!1537952 m!1420457))

(assert (=> b!1537952 m!1420457))

(declare-fun m!1420463 () Bool)

(assert (=> b!1537952 m!1420463))

(declare-fun m!1420465 () Bool)

(assert (=> b!1537950 m!1420465))

(declare-fun m!1420467 () Bool)

(assert (=> start!131080 m!1420467))

(declare-fun m!1420469 () Bool)

(assert (=> start!131080 m!1420469))

(check-sat (not b!1537949) (not b!1537947) (not b!1537950) (not b!1537952) (not start!131080) (not b!1537946))
