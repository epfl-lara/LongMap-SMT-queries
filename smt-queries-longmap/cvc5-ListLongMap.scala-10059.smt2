; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118488 () Bool)

(assert start!118488)

(declare-fun b!1385520 () Bool)

(declare-fun e!785030 () Bool)

(assert (=> b!1385520 (= e!785030 false)))

(declare-fun lt!609264 () Bool)

(declare-datatypes ((array!94764 0))(
  ( (array!94765 (arr!45758 (Array (_ BitVec 32) (_ BitVec 64))) (size!46308 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94764)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94764 (_ BitVec 32)) Bool)

(assert (=> b!1385520 (= lt!609264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926767 () Bool)

(assert (=> start!118488 (=> (not res!926767) (not e!785030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118488 (= res!926767 (validMask!0 mask!2987))))

(assert (=> start!118488 e!785030))

(assert (=> start!118488 true))

(declare-fun array_inv!34786 (array!94764) Bool)

(assert (=> start!118488 (array_inv!34786 a!2938)))

(declare-fun b!1385519 () Bool)

(declare-fun res!926769 () Bool)

(assert (=> b!1385519 (=> (not res!926769) (not e!785030))))

(declare-datatypes ((List!32286 0))(
  ( (Nil!32283) (Cons!32282 (h!33491 (_ BitVec 64)) (t!46980 List!32286)) )
))
(declare-fun arrayNoDuplicates!0 (array!94764 (_ BitVec 32) List!32286) Bool)

(assert (=> b!1385519 (= res!926769 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32283))))

(declare-fun b!1385517 () Bool)

(declare-fun res!926768 () Bool)

(assert (=> b!1385517 (=> (not res!926768) (not e!785030))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385517 (= res!926768 (and (= (size!46308 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46308 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46308 a!2938))))))

(declare-fun b!1385518 () Bool)

(declare-fun res!926770 () Bool)

(assert (=> b!1385518 (=> (not res!926770) (not e!785030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385518 (= res!926770 (validKeyInArray!0 (select (arr!45758 a!2938) i!1065)))))

(assert (= (and start!118488 res!926767) b!1385517))

(assert (= (and b!1385517 res!926768) b!1385518))

(assert (= (and b!1385518 res!926770) b!1385519))

(assert (= (and b!1385519 res!926769) b!1385520))

(declare-fun m!1270809 () Bool)

(assert (=> b!1385520 m!1270809))

(declare-fun m!1270811 () Bool)

(assert (=> start!118488 m!1270811))

(declare-fun m!1270813 () Bool)

(assert (=> start!118488 m!1270813))

(declare-fun m!1270815 () Bool)

(assert (=> b!1385519 m!1270815))

(declare-fun m!1270817 () Bool)

(assert (=> b!1385518 m!1270817))

(assert (=> b!1385518 m!1270817))

(declare-fun m!1270819 () Bool)

(assert (=> b!1385518 m!1270819))

(push 1)

(assert (not start!118488))

(assert (not b!1385519))

(assert (not b!1385518))

(assert (not b!1385520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

