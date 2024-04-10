; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118356 () Bool)

(assert start!118356)

(declare-fun b!1384330 () Bool)

(declare-fun e!784450 () Bool)

(assert (=> b!1384330 (= e!784450 false)))

(declare-datatypes ((Unit!46158 0))(
  ( (Unit!46159) )
))
(declare-fun lt!608855 () Unit!46158)

(declare-fun e!784448 () Unit!46158)

(assert (=> b!1384330 (= lt!608855 e!784448)))

(declare-fun c!128709 () Bool)

(declare-fun e!784451 () Bool)

(assert (=> b!1384330 (= c!128709 e!784451)))

(declare-fun res!925796 () Bool)

(assert (=> b!1384330 (=> (not res!925796) (not e!784451))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384330 (= res!925796 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384331 () Bool)

(declare-fun res!925794 () Bool)

(assert (=> b!1384331 (=> (not res!925794) (not e!784450))))

(declare-datatypes ((array!94659 0))(
  ( (array!94660 (arr!45707 (Array (_ BitVec 32) (_ BitVec 64))) (size!46257 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94659)

(assert (=> b!1384331 (= res!925794 (and (not (= (select (arr!45707 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45707 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384332 () Bool)

(declare-fun Unit!46160 () Unit!46158)

(assert (=> b!1384332 (= e!784448 Unit!46160)))

(declare-fun b!1384333 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384333 (= e!784451 (validKeyInArray!0 (select (arr!45707 a!2938) startIndex!16)))))

(declare-fun b!1384335 () Bool)

(declare-fun res!925797 () Bool)

(assert (=> b!1384335 (=> (not res!925797) (not e!784450))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94659 (_ BitVec 32)) Bool)

(assert (=> b!1384335 (= res!925797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384336 () Bool)

(declare-fun res!925795 () Bool)

(assert (=> b!1384336 (=> (not res!925795) (not e!784450))))

(assert (=> b!1384336 (= res!925795 (validKeyInArray!0 (select (arr!45707 a!2938) i!1065)))))

(declare-fun b!1384337 () Bool)

(declare-fun res!925792 () Bool)

(assert (=> b!1384337 (=> (not res!925792) (not e!784450))))

(declare-datatypes ((List!32235 0))(
  ( (Nil!32232) (Cons!32231 (h!33440 (_ BitVec 64)) (t!46929 List!32235)) )
))
(declare-fun arrayNoDuplicates!0 (array!94659 (_ BitVec 32) List!32235) Bool)

(assert (=> b!1384337 (= res!925792 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32232))))

(declare-fun b!1384338 () Bool)

(declare-fun res!925793 () Bool)

(assert (=> b!1384338 (=> (not res!925793) (not e!784450))))

(assert (=> b!1384338 (= res!925793 (and (= (size!46257 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46257 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46257 a!2938))))))

(declare-fun b!1384334 () Bool)

(declare-fun lt!608856 () Unit!46158)

(assert (=> b!1384334 (= e!784448 lt!608856)))

(declare-fun lt!608854 () Unit!46158)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46158)

(assert (=> b!1384334 (= lt!608854 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10100 0))(
  ( (MissingZero!10100 (index!42771 (_ BitVec 32))) (Found!10100 (index!42772 (_ BitVec 32))) (Intermediate!10100 (undefined!10912 Bool) (index!42773 (_ BitVec 32)) (x!124277 (_ BitVec 32))) (Undefined!10100) (MissingVacant!10100 (index!42774 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94659 (_ BitVec 32)) SeekEntryResult!10100)

(assert (=> b!1384334 (= (seekEntryOrOpen!0 (select (arr!45707 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45707 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94660 (store (arr!45707 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46257 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46158)

(assert (=> b!1384334 (= lt!608856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384334 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925798 () Bool)

(assert (=> start!118356 (=> (not res!925798) (not e!784450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118356 (= res!925798 (validMask!0 mask!2987))))

(assert (=> start!118356 e!784450))

(assert (=> start!118356 true))

(declare-fun array_inv!34735 (array!94659) Bool)

(assert (=> start!118356 (array_inv!34735 a!2938)))

(assert (= (and start!118356 res!925798) b!1384338))

(assert (= (and b!1384338 res!925793) b!1384336))

(assert (= (and b!1384336 res!925795) b!1384337))

(assert (= (and b!1384337 res!925792) b!1384335))

(assert (= (and b!1384335 res!925797) b!1384331))

(assert (= (and b!1384331 res!925794) b!1384330))

(assert (= (and b!1384330 res!925796) b!1384333))

(assert (= (and b!1384330 c!128709) b!1384334))

(assert (= (and b!1384330 (not c!128709)) b!1384332))

(declare-fun m!1269561 () Bool)

(assert (=> b!1384331 m!1269561))

(declare-fun m!1269563 () Bool)

(assert (=> start!118356 m!1269563))

(declare-fun m!1269565 () Bool)

(assert (=> start!118356 m!1269565))

(declare-fun m!1269567 () Bool)

(assert (=> b!1384337 m!1269567))

(assert (=> b!1384336 m!1269561))

(assert (=> b!1384336 m!1269561))

(declare-fun m!1269569 () Bool)

(assert (=> b!1384336 m!1269569))

(declare-fun m!1269571 () Bool)

(assert (=> b!1384334 m!1269571))

(declare-fun m!1269573 () Bool)

(assert (=> b!1384334 m!1269573))

(assert (=> b!1384334 m!1269573))

(declare-fun m!1269575 () Bool)

(assert (=> b!1384334 m!1269575))

(declare-fun m!1269577 () Bool)

(assert (=> b!1384334 m!1269577))

(declare-fun m!1269579 () Bool)

(assert (=> b!1384334 m!1269579))

(declare-fun m!1269581 () Bool)

(assert (=> b!1384334 m!1269581))

(declare-fun m!1269583 () Bool)

(assert (=> b!1384334 m!1269583))

(assert (=> b!1384334 m!1269581))

(declare-fun m!1269585 () Bool)

(assert (=> b!1384334 m!1269585))

(assert (=> b!1384333 m!1269581))

(assert (=> b!1384333 m!1269581))

(declare-fun m!1269587 () Bool)

(assert (=> b!1384333 m!1269587))

(declare-fun m!1269589 () Bool)

(assert (=> b!1384335 m!1269589))

(push 1)

(assert (not b!1384333))

(assert (not b!1384334))

(assert (not b!1384335))

(assert (not start!118356))

(assert (not b!1384336))

(assert (not b!1384337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

