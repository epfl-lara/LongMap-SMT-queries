; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118298 () Bool)

(assert start!118298)

(declare-fun b!1383591 () Bool)

(declare-fun res!925189 () Bool)

(declare-fun e!784145 () Bool)

(assert (=> b!1383591 (=> (not res!925189) (not e!784145))))

(declare-datatypes ((array!94601 0))(
  ( (array!94602 (arr!45678 (Array (_ BitVec 32) (_ BitVec 64))) (size!46228 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94601)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383591 (= res!925189 (validKeyInArray!0 (select (arr!45678 a!2938) startIndex!16)))))

(declare-fun b!1383592 () Bool)

(declare-fun res!925186 () Bool)

(assert (=> b!1383592 (=> (not res!925186) (not e!784145))))

(declare-datatypes ((List!32206 0))(
  ( (Nil!32203) (Cons!32202 (h!33411 (_ BitVec 64)) (t!46900 List!32206)) )
))
(declare-fun arrayNoDuplicates!0 (array!94601 (_ BitVec 32) List!32206) Bool)

(assert (=> b!1383592 (= res!925186 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32203))))

(declare-fun b!1383593 () Bool)

(declare-fun res!925184 () Bool)

(assert (=> b!1383593 (=> (not res!925184) (not e!784145))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383593 (= res!925184 (and (not (= (select (arr!45678 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45678 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383594 () Bool)

(assert (=> b!1383594 (= e!784145 (not true))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10071 0))(
  ( (MissingZero!10071 (index!42655 (_ BitVec 32))) (Found!10071 (index!42656 (_ BitVec 32))) (Intermediate!10071 (undefined!10883 Bool) (index!42657 (_ BitVec 32)) (x!124168 (_ BitVec 32))) (Undefined!10071) (MissingVacant!10071 (index!42658 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94601 (_ BitVec 32)) SeekEntryResult!10071)

(assert (=> b!1383594 (= (seekEntryOrOpen!0 (select (arr!45678 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45678 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94602 (store (arr!45678 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46228 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46079 0))(
  ( (Unit!46080) )
))
(declare-fun lt!608637 () Unit!46079)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46079)

(assert (=> b!1383594 (= lt!608637 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383595 () Bool)

(declare-fun res!925188 () Bool)

(assert (=> b!1383595 (=> (not res!925188) (not e!784145))))

(assert (=> b!1383595 (= res!925188 (validKeyInArray!0 (select (arr!45678 a!2938) i!1065)))))

(declare-fun b!1383597 () Bool)

(declare-fun res!925183 () Bool)

(assert (=> b!1383597 (=> (not res!925183) (not e!784145))))

(assert (=> b!1383597 (= res!925183 (and (= (size!46228 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46228 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46228 a!2938))))))

(declare-fun res!925187 () Bool)

(assert (=> start!118298 (=> (not res!925187) (not e!784145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118298 (= res!925187 (validMask!0 mask!2987))))

(assert (=> start!118298 e!784145))

(assert (=> start!118298 true))

(declare-fun array_inv!34706 (array!94601) Bool)

(assert (=> start!118298 (array_inv!34706 a!2938)))

(declare-fun b!1383596 () Bool)

(declare-fun res!925185 () Bool)

(assert (=> b!1383596 (=> (not res!925185) (not e!784145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94601 (_ BitVec 32)) Bool)

(assert (=> b!1383596 (= res!925185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118298 res!925187) b!1383597))

(assert (= (and b!1383597 res!925183) b!1383595))

(assert (= (and b!1383595 res!925188) b!1383592))

(assert (= (and b!1383592 res!925186) b!1383596))

(assert (= (and b!1383596 res!925185) b!1383593))

(assert (= (and b!1383593 res!925184) b!1383591))

(assert (= (and b!1383591 res!925189) b!1383594))

(declare-fun m!1268723 () Bool)

(assert (=> b!1383593 m!1268723))

(assert (=> b!1383595 m!1268723))

(assert (=> b!1383595 m!1268723))

(declare-fun m!1268725 () Bool)

(assert (=> b!1383595 m!1268725))

(declare-fun m!1268727 () Bool)

(assert (=> start!118298 m!1268727))

(declare-fun m!1268729 () Bool)

(assert (=> start!118298 m!1268729))

(declare-fun m!1268731 () Bool)

(assert (=> b!1383592 m!1268731))

(declare-fun m!1268733 () Bool)

(assert (=> b!1383594 m!1268733))

(assert (=> b!1383594 m!1268733))

(declare-fun m!1268735 () Bool)

(assert (=> b!1383594 m!1268735))

(declare-fun m!1268737 () Bool)

(assert (=> b!1383594 m!1268737))

(declare-fun m!1268739 () Bool)

(assert (=> b!1383594 m!1268739))

(declare-fun m!1268741 () Bool)

(assert (=> b!1383594 m!1268741))

(assert (=> b!1383594 m!1268741))

(declare-fun m!1268743 () Bool)

(assert (=> b!1383594 m!1268743))

(assert (=> b!1383591 m!1268741))

(assert (=> b!1383591 m!1268741))

(declare-fun m!1268745 () Bool)

(assert (=> b!1383591 m!1268745))

(declare-fun m!1268747 () Bool)

(assert (=> b!1383596 m!1268747))

(check-sat (not b!1383592) (not b!1383594) (not b!1383596) (not b!1383595) (not start!118298) (not b!1383591))
