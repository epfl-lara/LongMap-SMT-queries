; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130990 () Bool)

(assert start!130990)

(declare-fun b!1537233 () Bool)

(declare-fun e!855486 () Bool)

(assert (=> b!1537233 (= e!855486 false)))

(declare-fun lt!664461 () Bool)

(declare-datatypes ((array!102086 0))(
  ( (array!102087 (arr!49260 (Array (_ BitVec 32) (_ BitVec 64))) (size!49812 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102086)

(declare-datatypes ((List!35812 0))(
  ( (Nil!35809) (Cons!35808 (h!37254 (_ BitVec 64)) (t!50498 List!35812)) )
))
(declare-fun arrayNoDuplicates!0 (array!102086 (_ BitVec 32) List!35812) Bool)

(assert (=> b!1537233 (= lt!664461 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35809))))

(declare-fun b!1537234 () Bool)

(declare-fun res!1054504 () Bool)

(assert (=> b!1537234 (=> (not res!1054504) (not e!855486))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102086 (_ BitVec 32)) Bool)

(assert (=> b!1537234 (= res!1054504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537235 () Bool)

(declare-fun res!1054505 () Bool)

(assert (=> b!1537235 (=> (not res!1054505) (not e!855486))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537235 (= res!1054505 (validKeyInArray!0 (select (arr!49260 a!2792) j!64)))))

(declare-fun b!1537236 () Bool)

(declare-fun res!1054506 () Bool)

(assert (=> b!1537236 (=> (not res!1054506) (not e!855486))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537236 (= res!1054506 (and (= (size!49812 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49812 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49812 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054503 () Bool)

(assert (=> start!130990 (=> (not res!1054503) (not e!855486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130990 (= res!1054503 (validMask!0 mask!2480))))

(assert (=> start!130990 e!855486))

(assert (=> start!130990 true))

(declare-fun array_inv!38493 (array!102086) Bool)

(assert (=> start!130990 (array_inv!38493 a!2792)))

(declare-fun b!1537237 () Bool)

(declare-fun res!1054507 () Bool)

(assert (=> b!1537237 (=> (not res!1054507) (not e!855486))))

(assert (=> b!1537237 (= res!1054507 (validKeyInArray!0 (select (arr!49260 a!2792) i!951)))))

(assert (= (and start!130990 res!1054503) b!1537236))

(assert (= (and b!1537236 res!1054506) b!1537237))

(assert (= (and b!1537237 res!1054507) b!1537235))

(assert (= (and b!1537235 res!1054505) b!1537234))

(assert (= (and b!1537234 res!1054504) b!1537233))

(declare-fun m!1419175 () Bool)

(assert (=> b!1537233 m!1419175))

(declare-fun m!1419177 () Bool)

(assert (=> start!130990 m!1419177))

(declare-fun m!1419179 () Bool)

(assert (=> start!130990 m!1419179))

(declare-fun m!1419181 () Bool)

(assert (=> b!1537234 m!1419181))

(declare-fun m!1419183 () Bool)

(assert (=> b!1537235 m!1419183))

(assert (=> b!1537235 m!1419183))

(declare-fun m!1419185 () Bool)

(assert (=> b!1537235 m!1419185))

(declare-fun m!1419187 () Bool)

(assert (=> b!1537237 m!1419187))

(assert (=> b!1537237 m!1419187))

(declare-fun m!1419189 () Bool)

(assert (=> b!1537237 m!1419189))

(push 1)

(assert (not b!1537237))

(assert (not b!1537234))

(assert (not b!1537233))

(assert (not start!130990))

(assert (not b!1537235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

