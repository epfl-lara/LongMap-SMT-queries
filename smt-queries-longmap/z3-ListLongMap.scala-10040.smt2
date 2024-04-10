; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118346 () Bool)

(assert start!118346)

(declare-fun b!1384196 () Bool)

(declare-datatypes ((Unit!46143 0))(
  ( (Unit!46144) )
))
(declare-fun e!784390 () Unit!46143)

(declare-fun lt!608811 () Unit!46143)

(assert (=> b!1384196 (= e!784390 lt!608811)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!608810 () Unit!46143)

(declare-datatypes ((array!94649 0))(
  ( (array!94650 (arr!45702 (Array (_ BitVec 32) (_ BitVec 64))) (size!46252 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94649)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46143)

(assert (=> b!1384196 (= lt!608810 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10095 0))(
  ( (MissingZero!10095 (index!42751 (_ BitVec 32))) (Found!10095 (index!42752 (_ BitVec 32))) (Intermediate!10095 (undefined!10907 Bool) (index!42753 (_ BitVec 32)) (x!124256 (_ BitVec 32))) (Undefined!10095) (MissingVacant!10095 (index!42754 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94649 (_ BitVec 32)) SeekEntryResult!10095)

(assert (=> b!1384196 (= (seekEntryOrOpen!0 (select (arr!45702 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45702 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94650 (store (arr!45702 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46252 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46143)

(assert (=> b!1384196 (= lt!608811 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94649 (_ BitVec 32)) Bool)

(assert (=> b!1384196 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384197 () Bool)

(declare-fun e!784389 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384197 (= e!784389 (validKeyInArray!0 (select (arr!45702 a!2938) startIndex!16)))))

(declare-fun b!1384198 () Bool)

(declare-fun res!925688 () Bool)

(declare-fun e!784388 () Bool)

(assert (=> b!1384198 (=> (not res!925688) (not e!784388))))

(assert (=> b!1384198 (= res!925688 (validKeyInArray!0 (select (arr!45702 a!2938) i!1065)))))

(declare-fun b!1384199 () Bool)

(declare-fun res!925692 () Bool)

(assert (=> b!1384199 (=> (not res!925692) (not e!784388))))

(declare-datatypes ((List!32230 0))(
  ( (Nil!32227) (Cons!32226 (h!33435 (_ BitVec 64)) (t!46924 List!32230)) )
))
(declare-fun arrayNoDuplicates!0 (array!94649 (_ BitVec 32) List!32230) Bool)

(assert (=> b!1384199 (= res!925692 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32227))))

(declare-fun b!1384200 () Bool)

(declare-fun res!925691 () Bool)

(assert (=> b!1384200 (=> (not res!925691) (not e!784388))))

(assert (=> b!1384200 (= res!925691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384201 () Bool)

(declare-fun res!925690 () Bool)

(assert (=> b!1384201 (=> (not res!925690) (not e!784388))))

(assert (=> b!1384201 (= res!925690 (and (= (size!46252 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46252 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46252 a!2938))))))

(declare-fun b!1384202 () Bool)

(declare-fun Unit!46145 () Unit!46143)

(assert (=> b!1384202 (= e!784390 Unit!46145)))

(declare-fun b!1384203 () Bool)

(declare-fun res!925689 () Bool)

(assert (=> b!1384203 (=> (not res!925689) (not e!784388))))

(assert (=> b!1384203 (= res!925689 (and (not (= (select (arr!45702 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45702 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384195 () Bool)

(assert (=> b!1384195 (= e!784388 false)))

(declare-fun lt!608809 () Unit!46143)

(assert (=> b!1384195 (= lt!608809 e!784390)))

(declare-fun c!128694 () Bool)

(assert (=> b!1384195 (= c!128694 e!784389)))

(declare-fun res!925693 () Bool)

(assert (=> b!1384195 (=> (not res!925693) (not e!784389))))

(assert (=> b!1384195 (= res!925693 (not (= startIndex!16 i!1065)))))

(declare-fun res!925687 () Bool)

(assert (=> start!118346 (=> (not res!925687) (not e!784388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118346 (= res!925687 (validMask!0 mask!2987))))

(assert (=> start!118346 e!784388))

(assert (=> start!118346 true))

(declare-fun array_inv!34730 (array!94649) Bool)

(assert (=> start!118346 (array_inv!34730 a!2938)))

(assert (= (and start!118346 res!925687) b!1384201))

(assert (= (and b!1384201 res!925690) b!1384198))

(assert (= (and b!1384198 res!925688) b!1384199))

(assert (= (and b!1384199 res!925692) b!1384200))

(assert (= (and b!1384200 res!925691) b!1384203))

(assert (= (and b!1384203 res!925689) b!1384195))

(assert (= (and b!1384195 res!925693) b!1384197))

(assert (= (and b!1384195 c!128694) b!1384196))

(assert (= (and b!1384195 (not c!128694)) b!1384202))

(declare-fun m!1269411 () Bool)

(assert (=> start!118346 m!1269411))

(declare-fun m!1269413 () Bool)

(assert (=> start!118346 m!1269413))

(declare-fun m!1269415 () Bool)

(assert (=> b!1384196 m!1269415))

(declare-fun m!1269417 () Bool)

(assert (=> b!1384196 m!1269417))

(assert (=> b!1384196 m!1269417))

(declare-fun m!1269419 () Bool)

(assert (=> b!1384196 m!1269419))

(declare-fun m!1269421 () Bool)

(assert (=> b!1384196 m!1269421))

(declare-fun m!1269423 () Bool)

(assert (=> b!1384196 m!1269423))

(declare-fun m!1269425 () Bool)

(assert (=> b!1384196 m!1269425))

(declare-fun m!1269427 () Bool)

(assert (=> b!1384196 m!1269427))

(assert (=> b!1384196 m!1269425))

(declare-fun m!1269429 () Bool)

(assert (=> b!1384196 m!1269429))

(declare-fun m!1269431 () Bool)

(assert (=> b!1384199 m!1269431))

(declare-fun m!1269433 () Bool)

(assert (=> b!1384198 m!1269433))

(assert (=> b!1384198 m!1269433))

(declare-fun m!1269435 () Bool)

(assert (=> b!1384198 m!1269435))

(assert (=> b!1384203 m!1269433))

(assert (=> b!1384197 m!1269425))

(assert (=> b!1384197 m!1269425))

(declare-fun m!1269437 () Bool)

(assert (=> b!1384197 m!1269437))

(declare-fun m!1269439 () Bool)

(assert (=> b!1384200 m!1269439))

(check-sat (not start!118346) (not b!1384200) (not b!1384198) (not b!1384197) (not b!1384196) (not b!1384199))
