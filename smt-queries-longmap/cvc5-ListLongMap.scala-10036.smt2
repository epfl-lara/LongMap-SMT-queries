; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118320 () Bool)

(assert start!118320)

(declare-fun b!1383829 () Bool)

(declare-fun e!784228 () Bool)

(declare-datatypes ((array!94576 0))(
  ( (array!94577 (arr!45666 (Array (_ BitVec 32) (_ BitVec 64))) (size!46218 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94576)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383829 (= e!784228 (validKeyInArray!0 (select (arr!45666 a!2938) startIndex!16)))))

(declare-fun res!925432 () Bool)

(declare-fun e!784225 () Bool)

(assert (=> start!118320 (=> (not res!925432) (not e!784225))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118320 (= res!925432 (validMask!0 mask!2987))))

(assert (=> start!118320 e!784225))

(assert (=> start!118320 true))

(declare-fun array_inv!34899 (array!94576) Bool)

(assert (=> start!118320 (array_inv!34899 a!2938)))

(declare-fun b!1383830 () Bool)

(declare-fun res!925430 () Bool)

(assert (=> b!1383830 (=> (not res!925430) (not e!784225))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383830 (= res!925430 (and (not (= (select (arr!45666 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45666 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383831 () Bool)

(declare-datatypes ((Unit!45951 0))(
  ( (Unit!45952) )
))
(declare-fun e!784226 () Unit!45951)

(declare-fun Unit!45953 () Unit!45951)

(assert (=> b!1383831 (= e!784226 Unit!45953)))

(declare-fun b!1383832 () Bool)

(declare-fun res!925431 () Bool)

(assert (=> b!1383832 (=> (not res!925431) (not e!784225))))

(declare-datatypes ((List!32272 0))(
  ( (Nil!32269) (Cons!32268 (h!33477 (_ BitVec 64)) (t!46958 List!32272)) )
))
(declare-fun arrayNoDuplicates!0 (array!94576 (_ BitVec 32) List!32272) Bool)

(assert (=> b!1383832 (= res!925431 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32269))))

(declare-fun b!1383833 () Bool)

(assert (=> b!1383833 (= e!784225 false)))

(declare-fun lt!608527 () Unit!45951)

(assert (=> b!1383833 (= lt!608527 e!784226)))

(declare-fun c!128642 () Bool)

(assert (=> b!1383833 (= c!128642 e!784228)))

(declare-fun res!925435 () Bool)

(assert (=> b!1383833 (=> (not res!925435) (not e!784228))))

(assert (=> b!1383833 (= res!925435 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383834 () Bool)

(declare-fun res!925433 () Bool)

(assert (=> b!1383834 (=> (not res!925433) (not e!784225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94576 (_ BitVec 32)) Bool)

(assert (=> b!1383834 (= res!925433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383835 () Bool)

(declare-fun res!925434 () Bool)

(assert (=> b!1383835 (=> (not res!925434) (not e!784225))))

(assert (=> b!1383835 (= res!925434 (and (= (size!46218 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46218 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46218 a!2938))))))

(declare-fun b!1383836 () Bool)

(declare-fun res!925436 () Bool)

(assert (=> b!1383836 (=> (not res!925436) (not e!784225))))

(assert (=> b!1383836 (= res!925436 (validKeyInArray!0 (select (arr!45666 a!2938) i!1065)))))

(declare-fun b!1383837 () Bool)

(declare-fun lt!608526 () Unit!45951)

(assert (=> b!1383837 (= e!784226 lt!608526)))

(declare-fun lt!608528 () Unit!45951)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45951)

(assert (=> b!1383837 (= lt!608528 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10083 0))(
  ( (MissingZero!10083 (index!42703 (_ BitVec 32))) (Found!10083 (index!42704 (_ BitVec 32))) (Intermediate!10083 (undefined!10895 Bool) (index!42705 (_ BitVec 32)) (x!124209 (_ BitVec 32))) (Undefined!10083) (MissingVacant!10083 (index!42706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94576 (_ BitVec 32)) SeekEntryResult!10083)

(assert (=> b!1383837 (= (seekEntryOrOpen!0 (select (arr!45666 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45666 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94577 (store (arr!45666 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46218 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45951)

(assert (=> b!1383837 (= lt!608526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1383837 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118320 res!925432) b!1383835))

(assert (= (and b!1383835 res!925434) b!1383836))

(assert (= (and b!1383836 res!925436) b!1383832))

(assert (= (and b!1383832 res!925431) b!1383834))

(assert (= (and b!1383834 res!925433) b!1383830))

(assert (= (and b!1383830 res!925430) b!1383833))

(assert (= (and b!1383833 res!925435) b!1383829))

(assert (= (and b!1383833 c!128642) b!1383837))

(assert (= (and b!1383833 (not c!128642)) b!1383831))

(declare-fun m!1268577 () Bool)

(assert (=> start!118320 m!1268577))

(declare-fun m!1268579 () Bool)

(assert (=> start!118320 m!1268579))

(declare-fun m!1268581 () Bool)

(assert (=> b!1383834 m!1268581))

(declare-fun m!1268583 () Bool)

(assert (=> b!1383830 m!1268583))

(declare-fun m!1268585 () Bool)

(assert (=> b!1383832 m!1268585))

(assert (=> b!1383836 m!1268583))

(assert (=> b!1383836 m!1268583))

(declare-fun m!1268587 () Bool)

(assert (=> b!1383836 m!1268587))

(declare-fun m!1268589 () Bool)

(assert (=> b!1383829 m!1268589))

(assert (=> b!1383829 m!1268589))

(declare-fun m!1268591 () Bool)

(assert (=> b!1383829 m!1268591))

(declare-fun m!1268593 () Bool)

(assert (=> b!1383837 m!1268593))

(declare-fun m!1268595 () Bool)

(assert (=> b!1383837 m!1268595))

(assert (=> b!1383837 m!1268595))

(declare-fun m!1268597 () Bool)

(assert (=> b!1383837 m!1268597))

(declare-fun m!1268599 () Bool)

(assert (=> b!1383837 m!1268599))

(declare-fun m!1268601 () Bool)

(assert (=> b!1383837 m!1268601))

(assert (=> b!1383837 m!1268589))

(declare-fun m!1268603 () Bool)

(assert (=> b!1383837 m!1268603))

(assert (=> b!1383837 m!1268589))

(declare-fun m!1268605 () Bool)

(assert (=> b!1383837 m!1268605))

(push 1)

(assert (not b!1383837))

(assert (not start!118320))

(assert (not b!1383836))

(assert (not b!1383832))

(assert (not b!1383829))

(assert (not b!1383834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

