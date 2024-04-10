; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118354 () Bool)

(assert start!118354)

(declare-fun res!925776 () Bool)

(declare-fun e!784437 () Bool)

(assert (=> start!118354 (=> (not res!925776) (not e!784437))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118354 (= res!925776 (validMask!0 mask!2987))))

(assert (=> start!118354 e!784437))

(assert (=> start!118354 true))

(declare-datatypes ((array!94657 0))(
  ( (array!94658 (arr!45706 (Array (_ BitVec 32) (_ BitVec 64))) (size!46256 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94657)

(declare-fun array_inv!34734 (array!94657) Bool)

(assert (=> start!118354 (array_inv!34734 a!2938)))

(declare-fun b!1384303 () Bool)

(declare-datatypes ((Unit!46155 0))(
  ( (Unit!46156) )
))
(declare-fun e!784436 () Unit!46155)

(declare-fun Unit!46157 () Unit!46155)

(assert (=> b!1384303 (= e!784436 Unit!46157)))

(declare-fun b!1384304 () Bool)

(declare-fun res!925773 () Bool)

(assert (=> b!1384304 (=> (not res!925773) (not e!784437))))

(declare-datatypes ((List!32234 0))(
  ( (Nil!32231) (Cons!32230 (h!33439 (_ BitVec 64)) (t!46928 List!32234)) )
))
(declare-fun arrayNoDuplicates!0 (array!94657 (_ BitVec 32) List!32234) Bool)

(assert (=> b!1384304 (= res!925773 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32231))))

(declare-fun b!1384305 () Bool)

(declare-fun res!925775 () Bool)

(assert (=> b!1384305 (=> (not res!925775) (not e!784437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94657 (_ BitVec 32)) Bool)

(assert (=> b!1384305 (= res!925775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384306 () Bool)

(assert (=> b!1384306 (= e!784437 false)))

(declare-fun lt!608846 () Unit!46155)

(assert (=> b!1384306 (= lt!608846 e!784436)))

(declare-fun c!128706 () Bool)

(declare-fun e!784439 () Bool)

(assert (=> b!1384306 (= c!128706 e!784439)))

(declare-fun res!925771 () Bool)

(assert (=> b!1384306 (=> (not res!925771) (not e!784439))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384306 (= res!925771 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384307 () Bool)

(declare-fun lt!608845 () Unit!46155)

(assert (=> b!1384307 (= e!784436 lt!608845)))

(declare-fun lt!608847 () Unit!46155)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46155)

(assert (=> b!1384307 (= lt!608847 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10099 0))(
  ( (MissingZero!10099 (index!42767 (_ BitVec 32))) (Found!10099 (index!42768 (_ BitVec 32))) (Intermediate!10099 (undefined!10911 Bool) (index!42769 (_ BitVec 32)) (x!124268 (_ BitVec 32))) (Undefined!10099) (MissingVacant!10099 (index!42770 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94657 (_ BitVec 32)) SeekEntryResult!10099)

(assert (=> b!1384307 (= (seekEntryOrOpen!0 (select (arr!45706 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45706 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94658 (store (arr!45706 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46256 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46155)

(assert (=> b!1384307 (= lt!608845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384307 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384308 () Bool)

(declare-fun res!925777 () Bool)

(assert (=> b!1384308 (=> (not res!925777) (not e!784437))))

(assert (=> b!1384308 (= res!925777 (and (= (size!46256 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46256 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46256 a!2938))))))

(declare-fun b!1384309 () Bool)

(declare-fun res!925774 () Bool)

(assert (=> b!1384309 (=> (not res!925774) (not e!784437))))

(assert (=> b!1384309 (= res!925774 (and (not (= (select (arr!45706 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45706 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384310 () Bool)

(declare-fun res!925772 () Bool)

(assert (=> b!1384310 (=> (not res!925772) (not e!784437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384310 (= res!925772 (validKeyInArray!0 (select (arr!45706 a!2938) i!1065)))))

(declare-fun b!1384311 () Bool)

(assert (=> b!1384311 (= e!784439 (validKeyInArray!0 (select (arr!45706 a!2938) startIndex!16)))))

(assert (= (and start!118354 res!925776) b!1384308))

(assert (= (and b!1384308 res!925777) b!1384310))

(assert (= (and b!1384310 res!925772) b!1384304))

(assert (= (and b!1384304 res!925773) b!1384305))

(assert (= (and b!1384305 res!925775) b!1384309))

(assert (= (and b!1384309 res!925774) b!1384306))

(assert (= (and b!1384306 res!925771) b!1384311))

(assert (= (and b!1384306 c!128706) b!1384307))

(assert (= (and b!1384306 (not c!128706)) b!1384303))

(declare-fun m!1269531 () Bool)

(assert (=> b!1384311 m!1269531))

(assert (=> b!1384311 m!1269531))

(declare-fun m!1269533 () Bool)

(assert (=> b!1384311 m!1269533))

(declare-fun m!1269535 () Bool)

(assert (=> b!1384309 m!1269535))

(declare-fun m!1269537 () Bool)

(assert (=> b!1384307 m!1269537))

(declare-fun m!1269539 () Bool)

(assert (=> b!1384307 m!1269539))

(assert (=> b!1384307 m!1269539))

(declare-fun m!1269541 () Bool)

(assert (=> b!1384307 m!1269541))

(declare-fun m!1269543 () Bool)

(assert (=> b!1384307 m!1269543))

(declare-fun m!1269545 () Bool)

(assert (=> b!1384307 m!1269545))

(assert (=> b!1384307 m!1269531))

(declare-fun m!1269547 () Bool)

(assert (=> b!1384307 m!1269547))

(assert (=> b!1384307 m!1269531))

(declare-fun m!1269549 () Bool)

(assert (=> b!1384307 m!1269549))

(declare-fun m!1269551 () Bool)

(assert (=> b!1384304 m!1269551))

(declare-fun m!1269553 () Bool)

(assert (=> b!1384305 m!1269553))

(assert (=> b!1384310 m!1269535))

(assert (=> b!1384310 m!1269535))

(declare-fun m!1269555 () Bool)

(assert (=> b!1384310 m!1269555))

(declare-fun m!1269557 () Bool)

(assert (=> start!118354 m!1269557))

(declare-fun m!1269559 () Bool)

(assert (=> start!118354 m!1269559))

(push 1)

(assert (not b!1384305))

(assert (not b!1384307))

(assert (not b!1384311))

(assert (not b!1384310))

(assert (not b!1384304))

(assert (not start!118354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

