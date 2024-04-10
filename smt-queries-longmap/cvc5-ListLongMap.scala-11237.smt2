; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131054 () Bool)

(assert start!131054)

(declare-fun b!1537673 () Bool)

(declare-fun res!1054765 () Bool)

(declare-fun e!855726 () Bool)

(assert (=> b!1537673 (=> (not res!1054765) (not e!855726))))

(declare-datatypes ((array!102152 0))(
  ( (array!102153 (arr!49292 (Array (_ BitVec 32) (_ BitVec 64))) (size!49842 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102152)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537673 (= res!1054765 (and (= (size!49842 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49842 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49842 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537674 () Bool)

(declare-fun res!1054762 () Bool)

(assert (=> b!1537674 (=> (not res!1054762) (not e!855726))))

(declare-datatypes ((List!35766 0))(
  ( (Nil!35763) (Cons!35762 (h!37207 (_ BitVec 64)) (t!50460 List!35766)) )
))
(declare-fun arrayNoDuplicates!0 (array!102152 (_ BitVec 32) List!35766) Bool)

(assert (=> b!1537674 (= res!1054762 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35763))))

(declare-fun res!1054764 () Bool)

(assert (=> start!131054 (=> (not res!1054764) (not e!855726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131054 (= res!1054764 (validMask!0 mask!2480))))

(assert (=> start!131054 e!855726))

(assert (=> start!131054 true))

(declare-fun array_inv!38320 (array!102152) Bool)

(assert (=> start!131054 (array_inv!38320 a!2792)))

(declare-fun b!1537675 () Bool)

(declare-fun res!1054763 () Bool)

(assert (=> b!1537675 (=> (not res!1054763) (not e!855726))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537675 (= res!1054763 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49842 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49842 a!2792)) (= (select (arr!49292 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537676 () Bool)

(declare-fun res!1054759 () Bool)

(assert (=> b!1537676 (=> (not res!1054759) (not e!855726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102152 (_ BitVec 32)) Bool)

(assert (=> b!1537676 (= res!1054759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537677 () Bool)

(assert (=> b!1537677 (= e!855726 false)))

(declare-datatypes ((SeekEntryResult!13418 0))(
  ( (MissingZero!13418 (index!56067 (_ BitVec 32))) (Found!13418 (index!56068 (_ BitVec 32))) (Intermediate!13418 (undefined!14230 Bool) (index!56069 (_ BitVec 32)) (x!137812 (_ BitVec 32))) (Undefined!13418) (MissingVacant!13418 (index!56070 (_ BitVec 32))) )
))
(declare-fun lt!664768 () SeekEntryResult!13418)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102152 (_ BitVec 32)) SeekEntryResult!13418)

(assert (=> b!1537677 (= lt!664768 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49292 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537678 () Bool)

(declare-fun res!1054760 () Bool)

(assert (=> b!1537678 (=> (not res!1054760) (not e!855726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537678 (= res!1054760 (validKeyInArray!0 (select (arr!49292 a!2792) i!951)))))

(declare-fun b!1537679 () Bool)

(declare-fun res!1054761 () Bool)

(assert (=> b!1537679 (=> (not res!1054761) (not e!855726))))

(assert (=> b!1537679 (= res!1054761 (validKeyInArray!0 (select (arr!49292 a!2792) j!64)))))

(assert (= (and start!131054 res!1054764) b!1537673))

(assert (= (and b!1537673 res!1054765) b!1537678))

(assert (= (and b!1537678 res!1054760) b!1537679))

(assert (= (and b!1537679 res!1054761) b!1537676))

(assert (= (and b!1537676 res!1054759) b!1537674))

(assert (= (and b!1537674 res!1054762) b!1537675))

(assert (= (and b!1537675 res!1054763) b!1537677))

(declare-fun m!1420191 () Bool)

(assert (=> b!1537678 m!1420191))

(assert (=> b!1537678 m!1420191))

(declare-fun m!1420193 () Bool)

(assert (=> b!1537678 m!1420193))

(declare-fun m!1420195 () Bool)

(assert (=> b!1537677 m!1420195))

(assert (=> b!1537677 m!1420195))

(declare-fun m!1420197 () Bool)

(assert (=> b!1537677 m!1420197))

(declare-fun m!1420199 () Bool)

(assert (=> b!1537676 m!1420199))

(declare-fun m!1420201 () Bool)

(assert (=> b!1537675 m!1420201))

(declare-fun m!1420203 () Bool)

(assert (=> b!1537674 m!1420203))

(assert (=> b!1537679 m!1420195))

(assert (=> b!1537679 m!1420195))

(declare-fun m!1420205 () Bool)

(assert (=> b!1537679 m!1420205))

(declare-fun m!1420207 () Bool)

(assert (=> start!131054 m!1420207))

(declare-fun m!1420209 () Bool)

(assert (=> start!131054 m!1420209))

(push 1)

(assert (not b!1537679))

(assert (not start!131054))

(assert (not b!1537674))

(assert (not b!1537678))

(assert (not b!1537677))

(assert (not b!1537676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

