; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118290 () Bool)

(assert start!118290)

(declare-fun b!1383507 () Bool)

(declare-fun res!925101 () Bool)

(declare-fun e!784121 () Bool)

(assert (=> b!1383507 (=> (not res!925101) (not e!784121))))

(declare-datatypes ((array!94593 0))(
  ( (array!94594 (arr!45674 (Array (_ BitVec 32) (_ BitVec 64))) (size!46224 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94593)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94593 (_ BitVec 32)) Bool)

(assert (=> b!1383507 (= res!925101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383508 () Bool)

(assert (=> b!1383508 (= e!784121 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10067 0))(
  ( (MissingZero!10067 (index!42639 (_ BitVec 32))) (Found!10067 (index!42640 (_ BitVec 32))) (Intermediate!10067 (undefined!10879 Bool) (index!42641 (_ BitVec 32)) (x!124156 (_ BitVec 32))) (Undefined!10067) (MissingVacant!10067 (index!42642 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94593 (_ BitVec 32)) SeekEntryResult!10067)

(assert (=> b!1383508 (= (seekEntryOrOpen!0 (select (arr!45674 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45674 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94594 (store (arr!45674 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46224 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46071 0))(
  ( (Unit!46072) )
))
(declare-fun lt!608625 () Unit!46071)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46071)

(assert (=> b!1383508 (= lt!608625 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun res!925104 () Bool)

(assert (=> start!118290 (=> (not res!925104) (not e!784121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118290 (= res!925104 (validMask!0 mask!2987))))

(assert (=> start!118290 e!784121))

(assert (=> start!118290 true))

(declare-fun array_inv!34702 (array!94593) Bool)

(assert (=> start!118290 (array_inv!34702 a!2938)))

(declare-fun b!1383509 () Bool)

(declare-fun res!925100 () Bool)

(assert (=> b!1383509 (=> (not res!925100) (not e!784121))))

(assert (=> b!1383509 (= res!925100 (and (= (size!46224 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46224 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46224 a!2938))))))

(declare-fun b!1383510 () Bool)

(declare-fun res!925102 () Bool)

(assert (=> b!1383510 (=> (not res!925102) (not e!784121))))

(assert (=> b!1383510 (= res!925102 (and (not (= (select (arr!45674 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45674 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383511 () Bool)

(declare-fun res!925103 () Bool)

(assert (=> b!1383511 (=> (not res!925103) (not e!784121))))

(declare-datatypes ((List!32202 0))(
  ( (Nil!32199) (Cons!32198 (h!33407 (_ BitVec 64)) (t!46896 List!32202)) )
))
(declare-fun arrayNoDuplicates!0 (array!94593 (_ BitVec 32) List!32202) Bool)

(assert (=> b!1383511 (= res!925103 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32199))))

(declare-fun b!1383512 () Bool)

(declare-fun res!925099 () Bool)

(assert (=> b!1383512 (=> (not res!925099) (not e!784121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383512 (= res!925099 (validKeyInArray!0 (select (arr!45674 a!2938) startIndex!16)))))

(declare-fun b!1383513 () Bool)

(declare-fun res!925105 () Bool)

(assert (=> b!1383513 (=> (not res!925105) (not e!784121))))

(assert (=> b!1383513 (= res!925105 (validKeyInArray!0 (select (arr!45674 a!2938) i!1065)))))

(assert (= (and start!118290 res!925104) b!1383509))

(assert (= (and b!1383509 res!925100) b!1383513))

(assert (= (and b!1383513 res!925105) b!1383511))

(assert (= (and b!1383511 res!925103) b!1383507))

(assert (= (and b!1383507 res!925101) b!1383510))

(assert (= (and b!1383510 res!925102) b!1383512))

(assert (= (and b!1383512 res!925099) b!1383508))

(declare-fun m!1268619 () Bool)

(assert (=> b!1383513 m!1268619))

(assert (=> b!1383513 m!1268619))

(declare-fun m!1268621 () Bool)

(assert (=> b!1383513 m!1268621))

(declare-fun m!1268623 () Bool)

(assert (=> start!118290 m!1268623))

(declare-fun m!1268625 () Bool)

(assert (=> start!118290 m!1268625))

(declare-fun m!1268627 () Bool)

(assert (=> b!1383511 m!1268627))

(declare-fun m!1268629 () Bool)

(assert (=> b!1383508 m!1268629))

(assert (=> b!1383508 m!1268629))

(declare-fun m!1268631 () Bool)

(assert (=> b!1383508 m!1268631))

(declare-fun m!1268633 () Bool)

(assert (=> b!1383508 m!1268633))

(declare-fun m!1268635 () Bool)

(assert (=> b!1383508 m!1268635))

(declare-fun m!1268637 () Bool)

(assert (=> b!1383508 m!1268637))

(assert (=> b!1383508 m!1268637))

(declare-fun m!1268639 () Bool)

(assert (=> b!1383508 m!1268639))

(declare-fun m!1268641 () Bool)

(assert (=> b!1383507 m!1268641))

(assert (=> b!1383510 m!1268619))

(assert (=> b!1383512 m!1268637))

(assert (=> b!1383512 m!1268637))

(declare-fun m!1268643 () Bool)

(assert (=> b!1383512 m!1268643))

(push 1)

(assert (not b!1383512))

(assert (not b!1383507))

(assert (not b!1383508))

(assert (not b!1383513))

(assert (not start!118290))

(assert (not b!1383511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

