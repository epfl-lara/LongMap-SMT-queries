; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131058 () Bool)

(assert start!131058)

(declare-fun b!1537715 () Bool)

(declare-fun res!1054804 () Bool)

(declare-fun e!855738 () Bool)

(assert (=> b!1537715 (=> (not res!1054804) (not e!855738))))

(declare-datatypes ((array!102156 0))(
  ( (array!102157 (arr!49294 (Array (_ BitVec 32) (_ BitVec 64))) (size!49844 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102156)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537715 (= res!1054804 (validKeyInArray!0 (select (arr!49294 a!2792) j!64)))))

(declare-fun b!1537716 () Bool)

(declare-fun res!1054803 () Bool)

(assert (=> b!1537716 (=> (not res!1054803) (not e!855738))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537716 (= res!1054803 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49844 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49844 a!2792)) (= (select (arr!49294 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1054807 () Bool)

(assert (=> start!131058 (=> (not res!1054807) (not e!855738))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131058 (= res!1054807 (validMask!0 mask!2480))))

(assert (=> start!131058 e!855738))

(assert (=> start!131058 true))

(declare-fun array_inv!38322 (array!102156) Bool)

(assert (=> start!131058 (array_inv!38322 a!2792)))

(declare-fun b!1537717 () Bool)

(declare-fun res!1054801 () Bool)

(assert (=> b!1537717 (=> (not res!1054801) (not e!855738))))

(declare-datatypes ((List!35768 0))(
  ( (Nil!35765) (Cons!35764 (h!37209 (_ BitVec 64)) (t!50462 List!35768)) )
))
(declare-fun arrayNoDuplicates!0 (array!102156 (_ BitVec 32) List!35768) Bool)

(assert (=> b!1537717 (= res!1054801 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35765))))

(declare-fun b!1537718 () Bool)

(assert (=> b!1537718 (= e!855738 false)))

(declare-datatypes ((SeekEntryResult!13420 0))(
  ( (MissingZero!13420 (index!56075 (_ BitVec 32))) (Found!13420 (index!56076 (_ BitVec 32))) (Intermediate!13420 (undefined!14232 Bool) (index!56077 (_ BitVec 32)) (x!137814 (_ BitVec 32))) (Undefined!13420) (MissingVacant!13420 (index!56078 (_ BitVec 32))) )
))
(declare-fun lt!664774 () SeekEntryResult!13420)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102156 (_ BitVec 32)) SeekEntryResult!13420)

(assert (=> b!1537718 (= lt!664774 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49294 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537719 () Bool)

(declare-fun res!1054806 () Bool)

(assert (=> b!1537719 (=> (not res!1054806) (not e!855738))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537719 (= res!1054806 (and (= (size!49844 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49844 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49844 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537720 () Bool)

(declare-fun res!1054802 () Bool)

(assert (=> b!1537720 (=> (not res!1054802) (not e!855738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102156 (_ BitVec 32)) Bool)

(assert (=> b!1537720 (= res!1054802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537721 () Bool)

(declare-fun res!1054805 () Bool)

(assert (=> b!1537721 (=> (not res!1054805) (not e!855738))))

(assert (=> b!1537721 (= res!1054805 (validKeyInArray!0 (select (arr!49294 a!2792) i!951)))))

(assert (= (and start!131058 res!1054807) b!1537719))

(assert (= (and b!1537719 res!1054806) b!1537721))

(assert (= (and b!1537721 res!1054805) b!1537715))

(assert (= (and b!1537715 res!1054804) b!1537720))

(assert (= (and b!1537720 res!1054802) b!1537717))

(assert (= (and b!1537717 res!1054801) b!1537716))

(assert (= (and b!1537716 res!1054803) b!1537718))

(declare-fun m!1420231 () Bool)

(assert (=> b!1537717 m!1420231))

(declare-fun m!1420233 () Bool)

(assert (=> b!1537718 m!1420233))

(assert (=> b!1537718 m!1420233))

(declare-fun m!1420235 () Bool)

(assert (=> b!1537718 m!1420235))

(declare-fun m!1420237 () Bool)

(assert (=> b!1537721 m!1420237))

(assert (=> b!1537721 m!1420237))

(declare-fun m!1420239 () Bool)

(assert (=> b!1537721 m!1420239))

(assert (=> b!1537715 m!1420233))

(assert (=> b!1537715 m!1420233))

(declare-fun m!1420241 () Bool)

(assert (=> b!1537715 m!1420241))

(declare-fun m!1420243 () Bool)

(assert (=> start!131058 m!1420243))

(declare-fun m!1420245 () Bool)

(assert (=> start!131058 m!1420245))

(declare-fun m!1420247 () Bool)

(assert (=> b!1537720 m!1420247))

(declare-fun m!1420249 () Bool)

(assert (=> b!1537716 m!1420249))

(push 1)

(assert (not b!1537717))

(assert (not start!131058))

(assert (not b!1537720))

(assert (not b!1537715))

(assert (not b!1537718))

(assert (not b!1537721))

(check-sat)

