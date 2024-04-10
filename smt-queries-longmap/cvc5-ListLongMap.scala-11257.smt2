; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131294 () Bool)

(assert start!131294)

(declare-fun b!1539603 () Bool)

(declare-fun res!1056408 () Bool)

(declare-fun e!856375 () Bool)

(assert (=> b!1539603 (=> (not res!1056408) (not e!856375))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102281 0))(
  ( (array!102282 (arr!49352 (Array (_ BitVec 32) (_ BitVec 64))) (size!49902 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102281)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13478 0))(
  ( (MissingZero!13478 (index!56307 (_ BitVec 32))) (Found!13478 (index!56308 (_ BitVec 32))) (Intermediate!13478 (undefined!14290 Bool) (index!56309 (_ BitVec 32)) (x!138047 (_ BitVec 32))) (Undefined!13478) (MissingVacant!13478 (index!56310 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102281 (_ BitVec 32)) SeekEntryResult!13478)

(assert (=> b!1539603 (= res!1056408 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49352 a!2792) j!64) a!2792 mask!2480) (Found!13478 j!64)))))

(declare-fun b!1539604 () Bool)

(declare-fun res!1056402 () Bool)

(assert (=> b!1539604 (=> (not res!1056402) (not e!856375))))

(declare-datatypes ((List!35826 0))(
  ( (Nil!35823) (Cons!35822 (h!37267 (_ BitVec 64)) (t!50520 List!35826)) )
))
(declare-fun arrayNoDuplicates!0 (array!102281 (_ BitVec 32) List!35826) Bool)

(assert (=> b!1539604 (= res!1056402 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35823))))

(declare-fun b!1539606 () Bool)

(declare-fun res!1056405 () Bool)

(assert (=> b!1539606 (=> (not res!1056405) (not e!856375))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539606 (= res!1056405 (validKeyInArray!0 (select (arr!49352 a!2792) i!951)))))

(declare-fun b!1539607 () Bool)

(declare-fun res!1056401 () Bool)

(assert (=> b!1539607 (=> (not res!1056401) (not e!856375))))

(assert (=> b!1539607 (= res!1056401 (not (= (select (arr!49352 a!2792) index!463) (select (arr!49352 a!2792) j!64))))))

(declare-fun b!1539608 () Bool)

(declare-fun res!1056409 () Bool)

(assert (=> b!1539608 (=> (not res!1056409) (not e!856375))))

(assert (=> b!1539608 (= res!1056409 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49902 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49902 a!2792)) (= (select (arr!49352 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539609 () Bool)

(declare-fun res!1056403 () Bool)

(assert (=> b!1539609 (=> (not res!1056403) (not e!856375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102281 (_ BitVec 32)) Bool)

(assert (=> b!1539609 (= res!1056403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539610 () Bool)

(declare-fun res!1056406 () Bool)

(assert (=> b!1539610 (=> (not res!1056406) (not e!856375))))

(assert (=> b!1539610 (= res!1056406 (validKeyInArray!0 (select (arr!49352 a!2792) j!64)))))

(declare-fun b!1539611 () Bool)

(declare-fun res!1056404 () Bool)

(assert (=> b!1539611 (=> (not res!1056404) (not e!856375))))

(assert (=> b!1539611 (= res!1056404 (and (= (size!49902 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49902 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49902 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539605 () Bool)

(assert (=> b!1539605 (= e!856375 false)))

(declare-fun lt!665107 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539605 (= lt!665107 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1056407 () Bool)

(assert (=> start!131294 (=> (not res!1056407) (not e!856375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131294 (= res!1056407 (validMask!0 mask!2480))))

(assert (=> start!131294 e!856375))

(assert (=> start!131294 true))

(declare-fun array_inv!38380 (array!102281) Bool)

(assert (=> start!131294 (array_inv!38380 a!2792)))

(assert (= (and start!131294 res!1056407) b!1539611))

(assert (= (and b!1539611 res!1056404) b!1539606))

(assert (= (and b!1539606 res!1056405) b!1539610))

(assert (= (and b!1539610 res!1056406) b!1539609))

(assert (= (and b!1539609 res!1056403) b!1539604))

(assert (= (and b!1539604 res!1056402) b!1539608))

(assert (= (and b!1539608 res!1056409) b!1539603))

(assert (= (and b!1539603 res!1056408) b!1539607))

(assert (= (and b!1539607 res!1056401) b!1539605))

(declare-fun m!1421811 () Bool)

(assert (=> b!1539606 m!1421811))

(assert (=> b!1539606 m!1421811))

(declare-fun m!1421813 () Bool)

(assert (=> b!1539606 m!1421813))

(declare-fun m!1421815 () Bool)

(assert (=> b!1539609 m!1421815))

(declare-fun m!1421817 () Bool)

(assert (=> b!1539610 m!1421817))

(assert (=> b!1539610 m!1421817))

(declare-fun m!1421819 () Bool)

(assert (=> b!1539610 m!1421819))

(assert (=> b!1539603 m!1421817))

(assert (=> b!1539603 m!1421817))

(declare-fun m!1421821 () Bool)

(assert (=> b!1539603 m!1421821))

(declare-fun m!1421823 () Bool)

(assert (=> b!1539607 m!1421823))

(assert (=> b!1539607 m!1421817))

(declare-fun m!1421825 () Bool)

(assert (=> start!131294 m!1421825))

(declare-fun m!1421827 () Bool)

(assert (=> start!131294 m!1421827))

(declare-fun m!1421829 () Bool)

(assert (=> b!1539608 m!1421829))

(declare-fun m!1421831 () Bool)

(assert (=> b!1539605 m!1421831))

(declare-fun m!1421833 () Bool)

(assert (=> b!1539604 m!1421833))

(push 1)

(assert (not b!1539603))

(assert (not b!1539610))

(assert (not b!1539609))

(assert (not b!1539605))

(assert (not start!131294))

(assert (not b!1539604))

(assert (not b!1539606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

