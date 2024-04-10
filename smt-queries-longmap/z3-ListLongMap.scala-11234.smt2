; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131038 () Bool)

(assert start!131038)

(declare-fun b!1537531 () Bool)

(declare-fun e!855678 () Bool)

(assert (=> b!1537531 (= e!855678 false)))

(declare-fun lt!664744 () Bool)

(declare-datatypes ((array!102136 0))(
  ( (array!102137 (arr!49284 (Array (_ BitVec 32) (_ BitVec 64))) (size!49834 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102136)

(declare-datatypes ((List!35758 0))(
  ( (Nil!35755) (Cons!35754 (h!37199 (_ BitVec 64)) (t!50452 List!35758)) )
))
(declare-fun arrayNoDuplicates!0 (array!102136 (_ BitVec 32) List!35758) Bool)

(assert (=> b!1537531 (= lt!664744 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35755))))

(declare-fun b!1537532 () Bool)

(declare-fun res!1054621 () Bool)

(assert (=> b!1537532 (=> (not res!1054621) (not e!855678))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537532 (= res!1054621 (validKeyInArray!0 (select (arr!49284 a!2792) i!951)))))

(declare-fun b!1537533 () Bool)

(declare-fun res!1054620 () Bool)

(assert (=> b!1537533 (=> (not res!1054620) (not e!855678))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102136 (_ BitVec 32)) Bool)

(assert (=> b!1537533 (= res!1054620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537534 () Bool)

(declare-fun res!1054617 () Bool)

(assert (=> b!1537534 (=> (not res!1054617) (not e!855678))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537534 (= res!1054617 (and (= (size!49834 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49834 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49834 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054618 () Bool)

(assert (=> start!131038 (=> (not res!1054618) (not e!855678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131038 (= res!1054618 (validMask!0 mask!2480))))

(assert (=> start!131038 e!855678))

(assert (=> start!131038 true))

(declare-fun array_inv!38312 (array!102136) Bool)

(assert (=> start!131038 (array_inv!38312 a!2792)))

(declare-fun b!1537535 () Bool)

(declare-fun res!1054619 () Bool)

(assert (=> b!1537535 (=> (not res!1054619) (not e!855678))))

(assert (=> b!1537535 (= res!1054619 (validKeyInArray!0 (select (arr!49284 a!2792) j!64)))))

(assert (= (and start!131038 res!1054618) b!1537534))

(assert (= (and b!1537534 res!1054617) b!1537532))

(assert (= (and b!1537532 res!1054621) b!1537535))

(assert (= (and b!1537535 res!1054619) b!1537533))

(assert (= (and b!1537533 res!1054620) b!1537531))

(declare-fun m!1420051 () Bool)

(assert (=> b!1537535 m!1420051))

(assert (=> b!1537535 m!1420051))

(declare-fun m!1420053 () Bool)

(assert (=> b!1537535 m!1420053))

(declare-fun m!1420055 () Bool)

(assert (=> b!1537533 m!1420055))

(declare-fun m!1420057 () Bool)

(assert (=> b!1537532 m!1420057))

(assert (=> b!1537532 m!1420057))

(declare-fun m!1420059 () Bool)

(assert (=> b!1537532 m!1420059))

(declare-fun m!1420061 () Bool)

(assert (=> start!131038 m!1420061))

(declare-fun m!1420063 () Bool)

(assert (=> start!131038 m!1420063))

(declare-fun m!1420065 () Bool)

(assert (=> b!1537531 m!1420065))

(check-sat (not b!1537535) (not b!1537531) (not b!1537533) (not b!1537532) (not start!131038))
