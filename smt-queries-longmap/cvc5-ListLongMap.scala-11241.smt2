; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131032 () Bool)

(assert start!131032)

(declare-fun b!1537654 () Bool)

(declare-fun res!1054924 () Bool)

(declare-fun e!855612 () Bool)

(assert (=> b!1537654 (=> (not res!1054924) (not e!855612))))

(declare-datatypes ((array!102128 0))(
  ( (array!102129 (arr!49281 (Array (_ BitVec 32) (_ BitVec 64))) (size!49833 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102128)

(declare-datatypes ((List!35833 0))(
  ( (Nil!35830) (Cons!35829 (h!37275 (_ BitVec 64)) (t!50519 List!35833)) )
))
(declare-fun arrayNoDuplicates!0 (array!102128 (_ BitVec 32) List!35833) Bool)

(assert (=> b!1537654 (= res!1054924 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35830))))

(declare-fun b!1537655 () Bool)

(declare-fun res!1054929 () Bool)

(assert (=> b!1537655 (=> (not res!1054929) (not e!855612))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537655 (= res!1054929 (validKeyInArray!0 (select (arr!49281 a!2792) i!951)))))

(declare-fun b!1537656 () Bool)

(assert (=> b!1537656 (= e!855612 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13432 0))(
  ( (MissingZero!13432 (index!56123 (_ BitVec 32))) (Found!13432 (index!56124 (_ BitVec 32))) (Intermediate!13432 (undefined!14244 Bool) (index!56125 (_ BitVec 32)) (x!137853 (_ BitVec 32))) (Undefined!13432) (MissingVacant!13432 (index!56126 (_ BitVec 32))) )
))
(declare-fun lt!664524 () SeekEntryResult!13432)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102128 (_ BitVec 32)) SeekEntryResult!13432)

(assert (=> b!1537656 (= lt!664524 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49281 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537657 () Bool)

(declare-fun res!1054926 () Bool)

(assert (=> b!1537657 (=> (not res!1054926) (not e!855612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102128 (_ BitVec 32)) Bool)

(assert (=> b!1537657 (= res!1054926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1054930 () Bool)

(assert (=> start!131032 (=> (not res!1054930) (not e!855612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131032 (= res!1054930 (validMask!0 mask!2480))))

(assert (=> start!131032 e!855612))

(assert (=> start!131032 true))

(declare-fun array_inv!38514 (array!102128) Bool)

(assert (=> start!131032 (array_inv!38514 a!2792)))

(declare-fun b!1537658 () Bool)

(declare-fun res!1054927 () Bool)

(assert (=> b!1537658 (=> (not res!1054927) (not e!855612))))

(assert (=> b!1537658 (= res!1054927 (validKeyInArray!0 (select (arr!49281 a!2792) j!64)))))

(declare-fun b!1537659 () Bool)

(declare-fun res!1054928 () Bool)

(assert (=> b!1537659 (=> (not res!1054928) (not e!855612))))

(assert (=> b!1537659 (= res!1054928 (and (= (size!49833 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49833 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49833 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537660 () Bool)

(declare-fun res!1054925 () Bool)

(assert (=> b!1537660 (=> (not res!1054925) (not e!855612))))

(assert (=> b!1537660 (= res!1054925 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49833 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49833 a!2792)) (= (select (arr!49281 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131032 res!1054930) b!1537659))

(assert (= (and b!1537659 res!1054928) b!1537655))

(assert (= (and b!1537655 res!1054929) b!1537658))

(assert (= (and b!1537658 res!1054927) b!1537657))

(assert (= (and b!1537657 res!1054926) b!1537654))

(assert (= (and b!1537654 res!1054924) b!1537660))

(assert (= (and b!1537660 res!1054925) b!1537656))

(declare-fun m!1419579 () Bool)

(assert (=> start!131032 m!1419579))

(declare-fun m!1419581 () Bool)

(assert (=> start!131032 m!1419581))

(declare-fun m!1419583 () Bool)

(assert (=> b!1537657 m!1419583))

(declare-fun m!1419585 () Bool)

(assert (=> b!1537658 m!1419585))

(assert (=> b!1537658 m!1419585))

(declare-fun m!1419587 () Bool)

(assert (=> b!1537658 m!1419587))

(declare-fun m!1419589 () Bool)

(assert (=> b!1537655 m!1419589))

(assert (=> b!1537655 m!1419589))

(declare-fun m!1419591 () Bool)

(assert (=> b!1537655 m!1419591))

(assert (=> b!1537656 m!1419585))

(assert (=> b!1537656 m!1419585))

(declare-fun m!1419593 () Bool)

(assert (=> b!1537656 m!1419593))

(declare-fun m!1419595 () Bool)

(assert (=> b!1537660 m!1419595))

(declare-fun m!1419597 () Bool)

(assert (=> b!1537654 m!1419597))

(push 1)

(assert (not start!131032))

(assert (not b!1537654))

(assert (not b!1537657))

(assert (not b!1537655))

(assert (not b!1537656))

(assert (not b!1537658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

