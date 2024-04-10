; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131078 () Bool)

(assert start!131078)

(declare-fun b!1537925 () Bool)

(declare-fun res!1055013 () Bool)

(declare-fun e!855798 () Bool)

(assert (=> b!1537925 (=> (not res!1055013) (not e!855798))))

(declare-datatypes ((array!102176 0))(
  ( (array!102177 (arr!49304 (Array (_ BitVec 32) (_ BitVec 64))) (size!49854 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102176)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537925 (= res!1055013 (validKeyInArray!0 (select (arr!49304 a!2792) j!64)))))

(declare-fun b!1537926 () Bool)

(declare-fun res!1055012 () Bool)

(assert (=> b!1537926 (=> (not res!1055012) (not e!855798))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102176 (_ BitVec 32)) Bool)

(assert (=> b!1537926 (= res!1055012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537927 () Bool)

(declare-fun res!1055011 () Bool)

(assert (=> b!1537927 (=> (not res!1055011) (not e!855798))))

(declare-datatypes ((List!35778 0))(
  ( (Nil!35775) (Cons!35774 (h!37219 (_ BitVec 64)) (t!50472 List!35778)) )
))
(declare-fun arrayNoDuplicates!0 (array!102176 (_ BitVec 32) List!35778) Bool)

(assert (=> b!1537927 (= res!1055011 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35775))))

(declare-fun b!1537928 () Bool)

(declare-fun res!1055016 () Bool)

(assert (=> b!1537928 (=> (not res!1055016) (not e!855798))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537928 (= res!1055016 (validKeyInArray!0 (select (arr!49304 a!2792) i!951)))))

(declare-fun res!1055017 () Bool)

(assert (=> start!131078 (=> (not res!1055017) (not e!855798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131078 (= res!1055017 (validMask!0 mask!2480))))

(assert (=> start!131078 e!855798))

(assert (=> start!131078 true))

(declare-fun array_inv!38332 (array!102176) Bool)

(assert (=> start!131078 (array_inv!38332 a!2792)))

(declare-fun b!1537929 () Bool)

(declare-fun res!1055014 () Bool)

(assert (=> b!1537929 (=> (not res!1055014) (not e!855798))))

(assert (=> b!1537929 (= res!1055014 (and (= (size!49854 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49854 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49854 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537930 () Bool)

(assert (=> b!1537930 (= e!855798 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13430 0))(
  ( (MissingZero!13430 (index!56115 (_ BitVec 32))) (Found!13430 (index!56116 (_ BitVec 32))) (Intermediate!13430 (undefined!14242 Bool) (index!56117 (_ BitVec 32)) (x!137856 (_ BitVec 32))) (Undefined!13430) (MissingVacant!13430 (index!56118 (_ BitVec 32))) )
))
(declare-fun lt!664804 () SeekEntryResult!13430)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102176 (_ BitVec 32)) SeekEntryResult!13430)

(assert (=> b!1537930 (= lt!664804 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49304 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537931 () Bool)

(declare-fun res!1055015 () Bool)

(assert (=> b!1537931 (=> (not res!1055015) (not e!855798))))

(assert (=> b!1537931 (= res!1055015 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49854 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49854 a!2792)) (= (select (arr!49304 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131078 res!1055017) b!1537929))

(assert (= (and b!1537929 res!1055014) b!1537928))

(assert (= (and b!1537928 res!1055016) b!1537925))

(assert (= (and b!1537925 res!1055013) b!1537926))

(assert (= (and b!1537926 res!1055012) b!1537927))

(assert (= (and b!1537927 res!1055011) b!1537931))

(assert (= (and b!1537931 res!1055015) b!1537930))

(declare-fun m!1420431 () Bool)

(assert (=> b!1537925 m!1420431))

(assert (=> b!1537925 m!1420431))

(declare-fun m!1420433 () Bool)

(assert (=> b!1537925 m!1420433))

(declare-fun m!1420435 () Bool)

(assert (=> b!1537928 m!1420435))

(assert (=> b!1537928 m!1420435))

(declare-fun m!1420437 () Bool)

(assert (=> b!1537928 m!1420437))

(declare-fun m!1420439 () Bool)

(assert (=> b!1537926 m!1420439))

(declare-fun m!1420441 () Bool)

(assert (=> b!1537931 m!1420441))

(declare-fun m!1420443 () Bool)

(assert (=> start!131078 m!1420443))

(declare-fun m!1420445 () Bool)

(assert (=> start!131078 m!1420445))

(assert (=> b!1537930 m!1420431))

(assert (=> b!1537930 m!1420431))

(declare-fun m!1420447 () Bool)

(assert (=> b!1537930 m!1420447))

(declare-fun m!1420449 () Bool)

(assert (=> b!1537927 m!1420449))

(push 1)

(assert (not b!1537926))

(assert (not start!131078))

(assert (not b!1537930))

(assert (not b!1537925))

(assert (not b!1537927))

(assert (not b!1537928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

