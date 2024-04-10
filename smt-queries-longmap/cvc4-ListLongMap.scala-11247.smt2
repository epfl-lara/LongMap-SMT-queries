; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131154 () Bool)

(assert start!131154)

(declare-fun b!1538577 () Bool)

(declare-fun e!856026 () Bool)

(assert (=> b!1538577 (= e!856026 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664915 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538577 (= lt!664915 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538578 () Bool)

(declare-fun res!1055555 () Bool)

(assert (=> b!1538578 (=> (not res!1055555) (not e!856026))))

(declare-datatypes ((array!102219 0))(
  ( (array!102220 (arr!49324 (Array (_ BitVec 32) (_ BitVec 64))) (size!49874 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102219)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538578 (= res!1055555 (validKeyInArray!0 (select (arr!49324 a!2792) i!951)))))

(declare-fun b!1538579 () Bool)

(declare-fun res!1055559 () Bool)

(assert (=> b!1538579 (=> (not res!1055559) (not e!856026))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538579 (= res!1055559 (validKeyInArray!0 (select (arr!49324 a!2792) j!64)))))

(declare-fun b!1538581 () Bool)

(declare-fun res!1055562 () Bool)

(assert (=> b!1538581 (=> (not res!1055562) (not e!856026))))

(assert (=> b!1538581 (= res!1055562 (not (= (select (arr!49324 a!2792) index!463) (select (arr!49324 a!2792) j!64))))))

(declare-fun b!1538582 () Bool)

(declare-fun res!1055558 () Bool)

(assert (=> b!1538582 (=> (not res!1055558) (not e!856026))))

(assert (=> b!1538582 (= res!1055558 (and (= (size!49874 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49874 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49874 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538583 () Bool)

(declare-fun res!1055557 () Bool)

(assert (=> b!1538583 (=> (not res!1055557) (not e!856026))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13450 0))(
  ( (MissingZero!13450 (index!56195 (_ BitVec 32))) (Found!13450 (index!56196 (_ BitVec 32))) (Intermediate!13450 (undefined!14262 Bool) (index!56197 (_ BitVec 32)) (x!137927 (_ BitVec 32))) (Undefined!13450) (MissingVacant!13450 (index!56198 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102219 (_ BitVec 32)) SeekEntryResult!13450)

(assert (=> b!1538583 (= res!1055557 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49324 a!2792) j!64) a!2792 mask!2480) (Found!13450 j!64)))))

(declare-fun b!1538584 () Bool)

(declare-fun res!1055561 () Bool)

(assert (=> b!1538584 (=> (not res!1055561) (not e!856026))))

(declare-datatypes ((List!35798 0))(
  ( (Nil!35795) (Cons!35794 (h!37239 (_ BitVec 64)) (t!50492 List!35798)) )
))
(declare-fun arrayNoDuplicates!0 (array!102219 (_ BitVec 32) List!35798) Bool)

(assert (=> b!1538584 (= res!1055561 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35795))))

(declare-fun b!1538585 () Bool)

(declare-fun res!1055556 () Bool)

(assert (=> b!1538585 (=> (not res!1055556) (not e!856026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102219 (_ BitVec 32)) Bool)

(assert (=> b!1538585 (= res!1055556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1055563 () Bool)

(assert (=> start!131154 (=> (not res!1055563) (not e!856026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131154 (= res!1055563 (validMask!0 mask!2480))))

(assert (=> start!131154 e!856026))

(assert (=> start!131154 true))

(declare-fun array_inv!38352 (array!102219) Bool)

(assert (=> start!131154 (array_inv!38352 a!2792)))

(declare-fun b!1538580 () Bool)

(declare-fun res!1055560 () Bool)

(assert (=> b!1538580 (=> (not res!1055560) (not e!856026))))

(assert (=> b!1538580 (= res!1055560 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49874 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49874 a!2792)) (= (select (arr!49324 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131154 res!1055563) b!1538582))

(assert (= (and b!1538582 res!1055558) b!1538578))

(assert (= (and b!1538578 res!1055555) b!1538579))

(assert (= (and b!1538579 res!1055559) b!1538585))

(assert (= (and b!1538585 res!1055556) b!1538584))

(assert (= (and b!1538584 res!1055561) b!1538580))

(assert (= (and b!1538580 res!1055560) b!1538583))

(assert (= (and b!1538583 res!1055557) b!1538581))

(assert (= (and b!1538581 res!1055562) b!1538577))

(declare-fun m!1420995 () Bool)

(assert (=> b!1538579 m!1420995))

(assert (=> b!1538579 m!1420995))

(declare-fun m!1420997 () Bool)

(assert (=> b!1538579 m!1420997))

(assert (=> b!1538583 m!1420995))

(assert (=> b!1538583 m!1420995))

(declare-fun m!1420999 () Bool)

(assert (=> b!1538583 m!1420999))

(declare-fun m!1421001 () Bool)

(assert (=> b!1538578 m!1421001))

(assert (=> b!1538578 m!1421001))

(declare-fun m!1421003 () Bool)

(assert (=> b!1538578 m!1421003))

(declare-fun m!1421005 () Bool)

(assert (=> b!1538585 m!1421005))

(declare-fun m!1421007 () Bool)

(assert (=> b!1538581 m!1421007))

(assert (=> b!1538581 m!1420995))

(declare-fun m!1421009 () Bool)

(assert (=> b!1538584 m!1421009))

(declare-fun m!1421011 () Bool)

(assert (=> b!1538577 m!1421011))

(declare-fun m!1421013 () Bool)

(assert (=> b!1538580 m!1421013))

(declare-fun m!1421015 () Bool)

(assert (=> start!131154 m!1421015))

(declare-fun m!1421017 () Bool)

(assert (=> start!131154 m!1421017))

(push 1)

(assert (not b!1538577))

(assert (not start!131154))

(assert (not b!1538583))

(assert (not b!1538584))

(assert (not b!1538579))

(assert (not b!1538578))

(assert (not b!1538585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

