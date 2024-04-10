; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131066 () Bool)

(assert start!131066)

(declare-fun b!1537799 () Bool)

(declare-fun res!1054890 () Bool)

(declare-fun e!855763 () Bool)

(assert (=> b!1537799 (=> (not res!1054890) (not e!855763))))

(declare-datatypes ((array!102164 0))(
  ( (array!102165 (arr!49298 (Array (_ BitVec 32) (_ BitVec 64))) (size!49848 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102164)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102164 (_ BitVec 32)) Bool)

(assert (=> b!1537799 (= res!1054890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537800 () Bool)

(declare-fun res!1054891 () Bool)

(assert (=> b!1537800 (=> (not res!1054891) (not e!855763))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537800 (= res!1054891 (validKeyInArray!0 (select (arr!49298 a!2792) j!64)))))

(declare-fun b!1537801 () Bool)

(declare-fun res!1054885 () Bool)

(assert (=> b!1537801 (=> (not res!1054885) (not e!855763))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537801 (= res!1054885 (and (= (size!49848 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49848 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49848 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054887 () Bool)

(assert (=> start!131066 (=> (not res!1054887) (not e!855763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131066 (= res!1054887 (validMask!0 mask!2480))))

(assert (=> start!131066 e!855763))

(assert (=> start!131066 true))

(declare-fun array_inv!38326 (array!102164) Bool)

(assert (=> start!131066 (array_inv!38326 a!2792)))

(declare-fun b!1537802 () Bool)

(assert (=> b!1537802 (= e!855763 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13424 0))(
  ( (MissingZero!13424 (index!56091 (_ BitVec 32))) (Found!13424 (index!56092 (_ BitVec 32))) (Intermediate!13424 (undefined!14236 Bool) (index!56093 (_ BitVec 32)) (x!137834 (_ BitVec 32))) (Undefined!13424) (MissingVacant!13424 (index!56094 (_ BitVec 32))) )
))
(declare-fun lt!664786 () SeekEntryResult!13424)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102164 (_ BitVec 32)) SeekEntryResult!13424)

(assert (=> b!1537802 (= lt!664786 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49298 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537803 () Bool)

(declare-fun res!1054889 () Bool)

(assert (=> b!1537803 (=> (not res!1054889) (not e!855763))))

(assert (=> b!1537803 (= res!1054889 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49848 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49848 a!2792)) (= (select (arr!49298 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537804 () Bool)

(declare-fun res!1054886 () Bool)

(assert (=> b!1537804 (=> (not res!1054886) (not e!855763))))

(assert (=> b!1537804 (= res!1054886 (validKeyInArray!0 (select (arr!49298 a!2792) i!951)))))

(declare-fun b!1537805 () Bool)

(declare-fun res!1054888 () Bool)

(assert (=> b!1537805 (=> (not res!1054888) (not e!855763))))

(declare-datatypes ((List!35772 0))(
  ( (Nil!35769) (Cons!35768 (h!37213 (_ BitVec 64)) (t!50466 List!35772)) )
))
(declare-fun arrayNoDuplicates!0 (array!102164 (_ BitVec 32) List!35772) Bool)

(assert (=> b!1537805 (= res!1054888 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35769))))

(assert (= (and start!131066 res!1054887) b!1537801))

(assert (= (and b!1537801 res!1054885) b!1537804))

(assert (= (and b!1537804 res!1054886) b!1537800))

(assert (= (and b!1537800 res!1054891) b!1537799))

(assert (= (and b!1537799 res!1054890) b!1537805))

(assert (= (and b!1537805 res!1054888) b!1537803))

(assert (= (and b!1537803 res!1054889) b!1537802))

(declare-fun m!1420311 () Bool)

(assert (=> start!131066 m!1420311))

(declare-fun m!1420313 () Bool)

(assert (=> start!131066 m!1420313))

(declare-fun m!1420315 () Bool)

(assert (=> b!1537800 m!1420315))

(assert (=> b!1537800 m!1420315))

(declare-fun m!1420317 () Bool)

(assert (=> b!1537800 m!1420317))

(declare-fun m!1420319 () Bool)

(assert (=> b!1537805 m!1420319))

(assert (=> b!1537802 m!1420315))

(assert (=> b!1537802 m!1420315))

(declare-fun m!1420321 () Bool)

(assert (=> b!1537802 m!1420321))

(declare-fun m!1420323 () Bool)

(assert (=> b!1537803 m!1420323))

(declare-fun m!1420325 () Bool)

(assert (=> b!1537804 m!1420325))

(assert (=> b!1537804 m!1420325))

(declare-fun m!1420327 () Bool)

(assert (=> b!1537804 m!1420327))

(declare-fun m!1420329 () Bool)

(assert (=> b!1537799 m!1420329))

(push 1)

(assert (not b!1537799))

(assert (not b!1537805))

(assert (not b!1537802))

(assert (not b!1537800))

(assert (not start!131066))

(assert (not b!1537804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

