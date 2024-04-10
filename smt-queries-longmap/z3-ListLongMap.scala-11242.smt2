; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131086 () Bool)

(assert start!131086)

(declare-fun res!1055098 () Bool)

(declare-fun e!855822 () Bool)

(assert (=> start!131086 (=> (not res!1055098) (not e!855822))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131086 (= res!1055098 (validMask!0 mask!2480))))

(assert (=> start!131086 e!855822))

(assert (=> start!131086 true))

(declare-datatypes ((array!102184 0))(
  ( (array!102185 (arr!49308 (Array (_ BitVec 32) (_ BitVec 64))) (size!49858 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102184)

(declare-fun array_inv!38336 (array!102184) Bool)

(assert (=> start!131086 (array_inv!38336 a!2792)))

(declare-fun b!1538009 () Bool)

(assert (=> b!1538009 (= e!855822 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13434 0))(
  ( (MissingZero!13434 (index!56131 (_ BitVec 32))) (Found!13434 (index!56132 (_ BitVec 32))) (Intermediate!13434 (undefined!14246 Bool) (index!56133 (_ BitVec 32)) (x!137868 (_ BitVec 32))) (Undefined!13434) (MissingVacant!13434 (index!56134 (_ BitVec 32))) )
))
(declare-fun lt!664816 () SeekEntryResult!13434)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102184 (_ BitVec 32)) SeekEntryResult!13434)

(assert (=> b!1538009 (= lt!664816 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49308 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538010 () Bool)

(declare-fun res!1055100 () Bool)

(assert (=> b!1538010 (=> (not res!1055100) (not e!855822))))

(assert (=> b!1538010 (= res!1055100 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49858 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49858 a!2792)) (= (select (arr!49308 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538011 () Bool)

(declare-fun res!1055096 () Bool)

(assert (=> b!1538011 (=> (not res!1055096) (not e!855822))))

(declare-datatypes ((List!35782 0))(
  ( (Nil!35779) (Cons!35778 (h!37223 (_ BitVec 64)) (t!50476 List!35782)) )
))
(declare-fun arrayNoDuplicates!0 (array!102184 (_ BitVec 32) List!35782) Bool)

(assert (=> b!1538011 (= res!1055096 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35779))))

(declare-fun b!1538012 () Bool)

(declare-fun res!1055097 () Bool)

(assert (=> b!1538012 (=> (not res!1055097) (not e!855822))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538012 (= res!1055097 (validKeyInArray!0 (select (arr!49308 a!2792) i!951)))))

(declare-fun b!1538013 () Bool)

(declare-fun res!1055099 () Bool)

(assert (=> b!1538013 (=> (not res!1055099) (not e!855822))))

(assert (=> b!1538013 (= res!1055099 (validKeyInArray!0 (select (arr!49308 a!2792) j!64)))))

(declare-fun b!1538014 () Bool)

(declare-fun res!1055101 () Bool)

(assert (=> b!1538014 (=> (not res!1055101) (not e!855822))))

(assert (=> b!1538014 (= res!1055101 (and (= (size!49858 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49858 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49858 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538015 () Bool)

(declare-fun res!1055095 () Bool)

(assert (=> b!1538015 (=> (not res!1055095) (not e!855822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102184 (_ BitVec 32)) Bool)

(assert (=> b!1538015 (= res!1055095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131086 res!1055098) b!1538014))

(assert (= (and b!1538014 res!1055101) b!1538012))

(assert (= (and b!1538012 res!1055097) b!1538013))

(assert (= (and b!1538013 res!1055099) b!1538015))

(assert (= (and b!1538015 res!1055095) b!1538011))

(assert (= (and b!1538011 res!1055096) b!1538010))

(assert (= (and b!1538010 res!1055100) b!1538009))

(declare-fun m!1420511 () Bool)

(assert (=> b!1538010 m!1420511))

(declare-fun m!1420513 () Bool)

(assert (=> b!1538011 m!1420513))

(declare-fun m!1420515 () Bool)

(assert (=> start!131086 m!1420515))

(declare-fun m!1420517 () Bool)

(assert (=> start!131086 m!1420517))

(declare-fun m!1420519 () Bool)

(assert (=> b!1538012 m!1420519))

(assert (=> b!1538012 m!1420519))

(declare-fun m!1420521 () Bool)

(assert (=> b!1538012 m!1420521))

(declare-fun m!1420523 () Bool)

(assert (=> b!1538013 m!1420523))

(assert (=> b!1538013 m!1420523))

(declare-fun m!1420525 () Bool)

(assert (=> b!1538013 m!1420525))

(declare-fun m!1420527 () Bool)

(assert (=> b!1538015 m!1420527))

(assert (=> b!1538009 m!1420523))

(assert (=> b!1538009 m!1420523))

(declare-fun m!1420529 () Bool)

(assert (=> b!1538009 m!1420529))

(check-sat (not b!1538013) (not start!131086) (not b!1538009) (not b!1538011) (not b!1538015) (not b!1538012))
