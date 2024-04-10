; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131076 () Bool)

(assert start!131076)

(declare-fun b!1537904 () Bool)

(declare-fun res!1054992 () Bool)

(declare-fun e!855792 () Bool)

(assert (=> b!1537904 (=> (not res!1054992) (not e!855792))))

(declare-datatypes ((array!102174 0))(
  ( (array!102175 (arr!49303 (Array (_ BitVec 32) (_ BitVec 64))) (size!49853 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102174)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537904 (= res!1054992 (and (= (size!49853 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49853 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49853 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537905 () Bool)

(declare-fun res!1054990 () Bool)

(assert (=> b!1537905 (=> (not res!1054990) (not e!855792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102174 (_ BitVec 32)) Bool)

(assert (=> b!1537905 (= res!1054990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537906 () Bool)

(declare-fun res!1054994 () Bool)

(assert (=> b!1537906 (=> (not res!1054994) (not e!855792))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537906 (= res!1054994 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49853 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49853 a!2792)) (= (select (arr!49303 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1054993 () Bool)

(assert (=> start!131076 (=> (not res!1054993) (not e!855792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131076 (= res!1054993 (validMask!0 mask!2480))))

(assert (=> start!131076 e!855792))

(assert (=> start!131076 true))

(declare-fun array_inv!38331 (array!102174) Bool)

(assert (=> start!131076 (array_inv!38331 a!2792)))

(declare-fun b!1537907 () Bool)

(declare-fun res!1054995 () Bool)

(assert (=> b!1537907 (=> (not res!1054995) (not e!855792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537907 (= res!1054995 (validKeyInArray!0 (select (arr!49303 a!2792) j!64)))))

(declare-fun b!1537908 () Bool)

(assert (=> b!1537908 (= e!855792 false)))

(declare-datatypes ((SeekEntryResult!13429 0))(
  ( (MissingZero!13429 (index!56111 (_ BitVec 32))) (Found!13429 (index!56112 (_ BitVec 32))) (Intermediate!13429 (undefined!14241 Bool) (index!56113 (_ BitVec 32)) (x!137847 (_ BitVec 32))) (Undefined!13429) (MissingVacant!13429 (index!56114 (_ BitVec 32))) )
))
(declare-fun lt!664801 () SeekEntryResult!13429)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102174 (_ BitVec 32)) SeekEntryResult!13429)

(assert (=> b!1537908 (= lt!664801 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49303 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537909 () Bool)

(declare-fun res!1054991 () Bool)

(assert (=> b!1537909 (=> (not res!1054991) (not e!855792))))

(assert (=> b!1537909 (= res!1054991 (validKeyInArray!0 (select (arr!49303 a!2792) i!951)))))

(declare-fun b!1537910 () Bool)

(declare-fun res!1054996 () Bool)

(assert (=> b!1537910 (=> (not res!1054996) (not e!855792))))

(declare-datatypes ((List!35777 0))(
  ( (Nil!35774) (Cons!35773 (h!37218 (_ BitVec 64)) (t!50471 List!35777)) )
))
(declare-fun arrayNoDuplicates!0 (array!102174 (_ BitVec 32) List!35777) Bool)

(assert (=> b!1537910 (= res!1054996 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35774))))

(assert (= (and start!131076 res!1054993) b!1537904))

(assert (= (and b!1537904 res!1054992) b!1537909))

(assert (= (and b!1537909 res!1054991) b!1537907))

(assert (= (and b!1537907 res!1054995) b!1537905))

(assert (= (and b!1537905 res!1054990) b!1537910))

(assert (= (and b!1537910 res!1054996) b!1537906))

(assert (= (and b!1537906 res!1054994) b!1537908))

(declare-fun m!1420411 () Bool)

(assert (=> b!1537909 m!1420411))

(assert (=> b!1537909 m!1420411))

(declare-fun m!1420413 () Bool)

(assert (=> b!1537909 m!1420413))

(declare-fun m!1420415 () Bool)

(assert (=> b!1537906 m!1420415))

(declare-fun m!1420417 () Bool)

(assert (=> b!1537905 m!1420417))

(declare-fun m!1420419 () Bool)

(assert (=> start!131076 m!1420419))

(declare-fun m!1420421 () Bool)

(assert (=> start!131076 m!1420421))

(declare-fun m!1420423 () Bool)

(assert (=> b!1537910 m!1420423))

(declare-fun m!1420425 () Bool)

(assert (=> b!1537908 m!1420425))

(assert (=> b!1537908 m!1420425))

(declare-fun m!1420427 () Bool)

(assert (=> b!1537908 m!1420427))

(assert (=> b!1537907 m!1420425))

(assert (=> b!1537907 m!1420425))

(declare-fun m!1420429 () Bool)

(assert (=> b!1537907 m!1420429))

(push 1)

(assert (not b!1537910))

(assert (not b!1537905))

(assert (not b!1537908))

(assert (not start!131076))

(assert (not b!1537907))

(assert (not b!1537909))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

