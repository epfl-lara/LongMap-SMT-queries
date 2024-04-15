; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131002 () Bool)

(assert start!131002)

(declare-fun b!1537339 () Bool)

(declare-fun res!1054611 () Bool)

(declare-fun e!855523 () Bool)

(assert (=> b!1537339 (=> (not res!1054611) (not e!855523))))

(declare-datatypes ((array!102098 0))(
  ( (array!102099 (arr!49266 (Array (_ BitVec 32) (_ BitVec 64))) (size!49818 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102098)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537339 (= res!1054611 (validKeyInArray!0 (select (arr!49266 a!2792) i!951)))))

(declare-fun res!1054614 () Bool)

(assert (=> start!131002 (=> (not res!1054614) (not e!855523))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131002 (= res!1054614 (validMask!0 mask!2480))))

(assert (=> start!131002 e!855523))

(assert (=> start!131002 true))

(declare-fun array_inv!38499 (array!102098) Bool)

(assert (=> start!131002 (array_inv!38499 a!2792)))

(declare-fun b!1537340 () Bool)

(declare-fun res!1054609 () Bool)

(assert (=> b!1537340 (=> (not res!1054609) (not e!855523))))

(declare-datatypes ((List!35818 0))(
  ( (Nil!35815) (Cons!35814 (h!37260 (_ BitVec 64)) (t!50504 List!35818)) )
))
(declare-fun arrayNoDuplicates!0 (array!102098 (_ BitVec 32) List!35818) Bool)

(assert (=> b!1537340 (= res!1054609 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35815))))

(declare-fun b!1537341 () Bool)

(declare-fun res!1054615 () Bool)

(assert (=> b!1537341 (=> (not res!1054615) (not e!855523))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537341 (= res!1054615 (and (= (size!49818 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49818 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49818 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537342 () Bool)

(declare-fun res!1054613 () Bool)

(assert (=> b!1537342 (=> (not res!1054613) (not e!855523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102098 (_ BitVec 32)) Bool)

(assert (=> b!1537342 (= res!1054613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537343 () Bool)

(declare-fun res!1054610 () Bool)

(assert (=> b!1537343 (=> (not res!1054610) (not e!855523))))

(assert (=> b!1537343 (= res!1054610 (validKeyInArray!0 (select (arr!49266 a!2792) j!64)))))

(declare-fun b!1537344 () Bool)

(assert (=> b!1537344 (= e!855523 false)))

(declare-datatypes ((SeekEntryResult!13417 0))(
  ( (MissingZero!13417 (index!56063 (_ BitVec 32))) (Found!13417 (index!56064 (_ BitVec 32))) (Intermediate!13417 (undefined!14229 Bool) (index!56065 (_ BitVec 32)) (x!137798 (_ BitVec 32))) (Undefined!13417) (MissingVacant!13417 (index!56066 (_ BitVec 32))) )
))
(declare-fun lt!664479 () SeekEntryResult!13417)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102098 (_ BitVec 32)) SeekEntryResult!13417)

(assert (=> b!1537344 (= lt!664479 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49266 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537345 () Bool)

(declare-fun res!1054612 () Bool)

(assert (=> b!1537345 (=> (not res!1054612) (not e!855523))))

(assert (=> b!1537345 (= res!1054612 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49818 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49818 a!2792)) (= (select (arr!49266 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131002 res!1054614) b!1537341))

(assert (= (and b!1537341 res!1054615) b!1537339))

(assert (= (and b!1537339 res!1054611) b!1537343))

(assert (= (and b!1537343 res!1054610) b!1537342))

(assert (= (and b!1537342 res!1054613) b!1537340))

(assert (= (and b!1537340 res!1054609) b!1537345))

(assert (= (and b!1537345 res!1054612) b!1537344))

(declare-fun m!1419279 () Bool)

(assert (=> start!131002 m!1419279))

(declare-fun m!1419281 () Bool)

(assert (=> start!131002 m!1419281))

(declare-fun m!1419283 () Bool)

(assert (=> b!1537340 m!1419283))

(declare-fun m!1419285 () Bool)

(assert (=> b!1537345 m!1419285))

(declare-fun m!1419287 () Bool)

(assert (=> b!1537344 m!1419287))

(assert (=> b!1537344 m!1419287))

(declare-fun m!1419289 () Bool)

(assert (=> b!1537344 m!1419289))

(declare-fun m!1419291 () Bool)

(assert (=> b!1537339 m!1419291))

(assert (=> b!1537339 m!1419291))

(declare-fun m!1419293 () Bool)

(assert (=> b!1537339 m!1419293))

(assert (=> b!1537343 m!1419287))

(assert (=> b!1537343 m!1419287))

(declare-fun m!1419295 () Bool)

(assert (=> b!1537343 m!1419295))

(declare-fun m!1419297 () Bool)

(assert (=> b!1537342 m!1419297))

(push 1)

(assert (not b!1537343))

(assert (not b!1537340))

(assert (not start!131002))

(assert (not b!1537344))

(assert (not b!1537339))

(assert (not b!1537342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

