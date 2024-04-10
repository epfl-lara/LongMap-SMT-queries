; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131072 () Bool)

(assert start!131072)

(declare-fun b!1537862 () Bool)

(declare-fun res!1054951 () Bool)

(declare-fun e!855781 () Bool)

(assert (=> b!1537862 (=> (not res!1054951) (not e!855781))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102170 0))(
  ( (array!102171 (arr!49301 (Array (_ BitVec 32) (_ BitVec 64))) (size!49851 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102170)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537862 (= res!1054951 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49851 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49851 a!2792)) (= (select (arr!49301 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537863 () Bool)

(declare-fun res!1054949 () Bool)

(assert (=> b!1537863 (=> (not res!1054949) (not e!855781))))

(declare-datatypes ((List!35775 0))(
  ( (Nil!35772) (Cons!35771 (h!37216 (_ BitVec 64)) (t!50469 List!35775)) )
))
(declare-fun arrayNoDuplicates!0 (array!102170 (_ BitVec 32) List!35775) Bool)

(assert (=> b!1537863 (= res!1054949 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35772))))

(declare-fun b!1537864 () Bool)

(declare-fun res!1054948 () Bool)

(assert (=> b!1537864 (=> (not res!1054948) (not e!855781))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537864 (= res!1054948 (validKeyInArray!0 (select (arr!49301 a!2792) j!64)))))

(declare-fun b!1537865 () Bool)

(declare-fun res!1054954 () Bool)

(assert (=> b!1537865 (=> (not res!1054954) (not e!855781))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102170 (_ BitVec 32)) Bool)

(assert (=> b!1537865 (= res!1054954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537866 () Bool)

(declare-fun res!1054952 () Bool)

(assert (=> b!1537866 (=> (not res!1054952) (not e!855781))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537866 (= res!1054952 (and (= (size!49851 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49851 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49851 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054950 () Bool)

(assert (=> start!131072 (=> (not res!1054950) (not e!855781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131072 (= res!1054950 (validMask!0 mask!2480))))

(assert (=> start!131072 e!855781))

(assert (=> start!131072 true))

(declare-fun array_inv!38329 (array!102170) Bool)

(assert (=> start!131072 (array_inv!38329 a!2792)))

(declare-fun b!1537867 () Bool)

(declare-fun res!1054953 () Bool)

(assert (=> b!1537867 (=> (not res!1054953) (not e!855781))))

(assert (=> b!1537867 (= res!1054953 (validKeyInArray!0 (select (arr!49301 a!2792) i!951)))))

(declare-fun b!1537868 () Bool)

(assert (=> b!1537868 (= e!855781 false)))

(declare-datatypes ((SeekEntryResult!13427 0))(
  ( (MissingZero!13427 (index!56103 (_ BitVec 32))) (Found!13427 (index!56104 (_ BitVec 32))) (Intermediate!13427 (undefined!14239 Bool) (index!56105 (_ BitVec 32)) (x!137845 (_ BitVec 32))) (Undefined!13427) (MissingVacant!13427 (index!56106 (_ BitVec 32))) )
))
(declare-fun lt!664795 () SeekEntryResult!13427)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102170 (_ BitVec 32)) SeekEntryResult!13427)

(assert (=> b!1537868 (= lt!664795 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49301 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131072 res!1054950) b!1537866))

(assert (= (and b!1537866 res!1054952) b!1537867))

(assert (= (and b!1537867 res!1054953) b!1537864))

(assert (= (and b!1537864 res!1054948) b!1537865))

(assert (= (and b!1537865 res!1054954) b!1537863))

(assert (= (and b!1537863 res!1054949) b!1537862))

(assert (= (and b!1537862 res!1054951) b!1537868))

(declare-fun m!1420371 () Bool)

(assert (=> b!1537867 m!1420371))

(assert (=> b!1537867 m!1420371))

(declare-fun m!1420373 () Bool)

(assert (=> b!1537867 m!1420373))

(declare-fun m!1420375 () Bool)

(assert (=> b!1537862 m!1420375))

(declare-fun m!1420377 () Bool)

(assert (=> b!1537868 m!1420377))

(assert (=> b!1537868 m!1420377))

(declare-fun m!1420379 () Bool)

(assert (=> b!1537868 m!1420379))

(declare-fun m!1420381 () Bool)

(assert (=> b!1537865 m!1420381))

(assert (=> b!1537864 m!1420377))

(assert (=> b!1537864 m!1420377))

(declare-fun m!1420383 () Bool)

(assert (=> b!1537864 m!1420383))

(declare-fun m!1420385 () Bool)

(assert (=> start!131072 m!1420385))

(declare-fun m!1420387 () Bool)

(assert (=> start!131072 m!1420387))

(declare-fun m!1420389 () Bool)

(assert (=> b!1537863 m!1420389))

(push 1)

(assert (not b!1537865))

(assert (not start!131072))

(assert (not b!1537868))

(assert (not b!1537863))

(assert (not b!1537864))

(assert (not b!1537867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

