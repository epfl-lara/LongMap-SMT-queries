; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118360 () Bool)

(assert start!118360)

(declare-fun b!1384384 () Bool)

(declare-fun res!925838 () Bool)

(declare-fun e!784473 () Bool)

(assert (=> b!1384384 (=> (not res!925838) (not e!784473))))

(declare-datatypes ((array!94663 0))(
  ( (array!94664 (arr!45709 (Array (_ BitVec 32) (_ BitVec 64))) (size!46259 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94663)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94663 (_ BitVec 32)) Bool)

(assert (=> b!1384384 (= res!925838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384385 () Bool)

(declare-datatypes ((Unit!46164 0))(
  ( (Unit!46165) )
))
(declare-fun e!784472 () Unit!46164)

(declare-fun lt!608874 () Unit!46164)

(assert (=> b!1384385 (= e!784472 lt!608874)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!608872 () Unit!46164)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46164)

(assert (=> b!1384385 (= lt!608872 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10102 0))(
  ( (MissingZero!10102 (index!42779 (_ BitVec 32))) (Found!10102 (index!42780 (_ BitVec 32))) (Intermediate!10102 (undefined!10914 Bool) (index!42781 (_ BitVec 32)) (x!124279 (_ BitVec 32))) (Undefined!10102) (MissingVacant!10102 (index!42782 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94663 (_ BitVec 32)) SeekEntryResult!10102)

(assert (=> b!1384385 (= (seekEntryOrOpen!0 (select (arr!45709 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45709 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94664 (store (arr!45709 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46259 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46164)

(assert (=> b!1384385 (= lt!608874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384385 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925840 () Bool)

(assert (=> start!118360 (=> (not res!925840) (not e!784473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118360 (= res!925840 (validMask!0 mask!2987))))

(assert (=> start!118360 e!784473))

(assert (=> start!118360 true))

(declare-fun array_inv!34737 (array!94663) Bool)

(assert (=> start!118360 (array_inv!34737 a!2938)))

(declare-fun b!1384386 () Bool)

(declare-fun Unit!46166 () Unit!46164)

(assert (=> b!1384386 (= e!784472 Unit!46166)))

(declare-fun b!1384387 () Bool)

(declare-fun e!784474 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384387 (= e!784474 (validKeyInArray!0 (select (arr!45709 a!2938) startIndex!16)))))

(declare-fun b!1384388 () Bool)

(declare-fun res!925839 () Bool)

(assert (=> b!1384388 (=> (not res!925839) (not e!784473))))

(assert (=> b!1384388 (= res!925839 (and (= (size!46259 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46259 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46259 a!2938))))))

(declare-fun b!1384389 () Bool)

(assert (=> b!1384389 (= e!784473 false)))

(declare-fun lt!608873 () Unit!46164)

(assert (=> b!1384389 (= lt!608873 e!784472)))

(declare-fun c!128715 () Bool)

(assert (=> b!1384389 (= c!128715 e!784474)))

(declare-fun res!925836 () Bool)

(assert (=> b!1384389 (=> (not res!925836) (not e!784474))))

(assert (=> b!1384389 (= res!925836 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384390 () Bool)

(declare-fun res!925834 () Bool)

(assert (=> b!1384390 (=> (not res!925834) (not e!784473))))

(assert (=> b!1384390 (= res!925834 (and (not (= (select (arr!45709 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45709 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384391 () Bool)

(declare-fun res!925837 () Bool)

(assert (=> b!1384391 (=> (not res!925837) (not e!784473))))

(declare-datatypes ((List!32237 0))(
  ( (Nil!32234) (Cons!32233 (h!33442 (_ BitVec 64)) (t!46931 List!32237)) )
))
(declare-fun arrayNoDuplicates!0 (array!94663 (_ BitVec 32) List!32237) Bool)

(assert (=> b!1384391 (= res!925837 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32234))))

(declare-fun b!1384392 () Bool)

(declare-fun res!925835 () Bool)

(assert (=> b!1384392 (=> (not res!925835) (not e!784473))))

(assert (=> b!1384392 (= res!925835 (validKeyInArray!0 (select (arr!45709 a!2938) i!1065)))))

(assert (= (and start!118360 res!925840) b!1384388))

(assert (= (and b!1384388 res!925839) b!1384392))

(assert (= (and b!1384392 res!925835) b!1384391))

(assert (= (and b!1384391 res!925837) b!1384384))

(assert (= (and b!1384384 res!925838) b!1384390))

(assert (= (and b!1384390 res!925834) b!1384389))

(assert (= (and b!1384389 res!925836) b!1384387))

(assert (= (and b!1384389 c!128715) b!1384385))

(assert (= (and b!1384389 (not c!128715)) b!1384386))

(declare-fun m!1269621 () Bool)

(assert (=> b!1384392 m!1269621))

(assert (=> b!1384392 m!1269621))

(declare-fun m!1269623 () Bool)

(assert (=> b!1384392 m!1269623))

(declare-fun m!1269625 () Bool)

(assert (=> b!1384384 m!1269625))

(declare-fun m!1269627 () Bool)

(assert (=> b!1384385 m!1269627))

(declare-fun m!1269629 () Bool)

(assert (=> b!1384385 m!1269629))

(assert (=> b!1384385 m!1269629))

(declare-fun m!1269631 () Bool)

(assert (=> b!1384385 m!1269631))

(declare-fun m!1269633 () Bool)

(assert (=> b!1384385 m!1269633))

(declare-fun m!1269635 () Bool)

(assert (=> b!1384385 m!1269635))

(declare-fun m!1269637 () Bool)

(assert (=> b!1384385 m!1269637))

(declare-fun m!1269639 () Bool)

(assert (=> b!1384385 m!1269639))

(assert (=> b!1384385 m!1269637))

(declare-fun m!1269641 () Bool)

(assert (=> b!1384385 m!1269641))

(assert (=> b!1384390 m!1269621))

(declare-fun m!1269643 () Bool)

(assert (=> b!1384391 m!1269643))

(assert (=> b!1384387 m!1269637))

(assert (=> b!1384387 m!1269637))

(declare-fun m!1269645 () Bool)

(assert (=> b!1384387 m!1269645))

(declare-fun m!1269647 () Bool)

(assert (=> start!118360 m!1269647))

(declare-fun m!1269649 () Bool)

(assert (=> start!118360 m!1269649))

(push 1)

(assert (not b!1384392))

(assert (not b!1384385))

(assert (not b!1384384))

(assert (not b!1384391))

(assert (not start!118360))

(assert (not b!1384387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

