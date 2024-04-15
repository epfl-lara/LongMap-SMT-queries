; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131026 () Bool)

(assert start!131026)

(declare-fun b!1537591 () Bool)

(declare-fun res!1054867 () Bool)

(declare-fun e!855595 () Bool)

(assert (=> b!1537591 (=> (not res!1054867) (not e!855595))))

(declare-datatypes ((array!102122 0))(
  ( (array!102123 (arr!49278 (Array (_ BitVec 32) (_ BitVec 64))) (size!49830 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102122)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537591 (= res!1054867 (and (= (size!49830 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49830 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49830 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054861 () Bool)

(assert (=> start!131026 (=> (not res!1054861) (not e!855595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131026 (= res!1054861 (validMask!0 mask!2480))))

(assert (=> start!131026 e!855595))

(assert (=> start!131026 true))

(declare-fun array_inv!38511 (array!102122) Bool)

(assert (=> start!131026 (array_inv!38511 a!2792)))

(declare-fun b!1537592 () Bool)

(declare-fun res!1054865 () Bool)

(assert (=> b!1537592 (=> (not res!1054865) (not e!855595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537592 (= res!1054865 (validKeyInArray!0 (select (arr!49278 a!2792) i!951)))))

(declare-fun b!1537593 () Bool)

(declare-fun res!1054862 () Bool)

(assert (=> b!1537593 (=> (not res!1054862) (not e!855595))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537593 (= res!1054862 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49830 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49830 a!2792)) (= (select (arr!49278 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537594 () Bool)

(assert (=> b!1537594 (= e!855595 false)))

(declare-datatypes ((SeekEntryResult!13429 0))(
  ( (MissingZero!13429 (index!56111 (_ BitVec 32))) (Found!13429 (index!56112 (_ BitVec 32))) (Intermediate!13429 (undefined!14241 Bool) (index!56113 (_ BitVec 32)) (x!137842 (_ BitVec 32))) (Undefined!13429) (MissingVacant!13429 (index!56114 (_ BitVec 32))) )
))
(declare-fun lt!664515 () SeekEntryResult!13429)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102122 (_ BitVec 32)) SeekEntryResult!13429)

(assert (=> b!1537594 (= lt!664515 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49278 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537595 () Bool)

(declare-fun res!1054866 () Bool)

(assert (=> b!1537595 (=> (not res!1054866) (not e!855595))))

(declare-datatypes ((List!35830 0))(
  ( (Nil!35827) (Cons!35826 (h!37272 (_ BitVec 64)) (t!50516 List!35830)) )
))
(declare-fun arrayNoDuplicates!0 (array!102122 (_ BitVec 32) List!35830) Bool)

(assert (=> b!1537595 (= res!1054866 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35827))))

(declare-fun b!1537596 () Bool)

(declare-fun res!1054863 () Bool)

(assert (=> b!1537596 (=> (not res!1054863) (not e!855595))))

(assert (=> b!1537596 (= res!1054863 (validKeyInArray!0 (select (arr!49278 a!2792) j!64)))))

(declare-fun b!1537597 () Bool)

(declare-fun res!1054864 () Bool)

(assert (=> b!1537597 (=> (not res!1054864) (not e!855595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102122 (_ BitVec 32)) Bool)

(assert (=> b!1537597 (= res!1054864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131026 res!1054861) b!1537591))

(assert (= (and b!1537591 res!1054867) b!1537592))

(assert (= (and b!1537592 res!1054865) b!1537596))

(assert (= (and b!1537596 res!1054863) b!1537597))

(assert (= (and b!1537597 res!1054864) b!1537595))

(assert (= (and b!1537595 res!1054866) b!1537593))

(assert (= (and b!1537593 res!1054862) b!1537594))

(declare-fun m!1419519 () Bool)

(assert (=> b!1537596 m!1419519))

(assert (=> b!1537596 m!1419519))

(declare-fun m!1419521 () Bool)

(assert (=> b!1537596 m!1419521))

(declare-fun m!1419523 () Bool)

(assert (=> b!1537597 m!1419523))

(declare-fun m!1419525 () Bool)

(assert (=> b!1537595 m!1419525))

(declare-fun m!1419527 () Bool)

(assert (=> start!131026 m!1419527))

(declare-fun m!1419529 () Bool)

(assert (=> start!131026 m!1419529))

(declare-fun m!1419531 () Bool)

(assert (=> b!1537592 m!1419531))

(assert (=> b!1537592 m!1419531))

(declare-fun m!1419533 () Bool)

(assert (=> b!1537592 m!1419533))

(assert (=> b!1537594 m!1419519))

(assert (=> b!1537594 m!1419519))

(declare-fun m!1419535 () Bool)

(assert (=> b!1537594 m!1419535))

(declare-fun m!1419537 () Bool)

(assert (=> b!1537593 m!1419537))

(push 1)

(assert (not b!1537594))

(assert (not b!1537595))

(assert (not b!1537597))

(assert (not b!1537592))

(assert (not start!131026))

(assert (not b!1537596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

