; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92870 () Bool)

(assert start!92870)

(declare-datatypes ((array!66530 0))(
  ( (array!66531 (arr!31997 (Array (_ BitVec 32) (_ BitVec 64))) (size!32533 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66530)

(declare-fun b!1054716 () Bool)

(declare-fun e!599272 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!465526 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054716 (= e!599272 (arrayContainsKey!0 a!3488 k0!2747 lt!465526))))

(declare-fun b!1054717 () Bool)

(declare-fun res!703661 () Bool)

(declare-fun e!599269 () Bool)

(assert (=> b!1054717 (=> (not res!703661) (not e!599269))))

(declare-datatypes ((List!22309 0))(
  ( (Nil!22306) (Cons!22305 (h!23514 (_ BitVec 64)) (t!31616 List!22309)) )
))
(declare-fun arrayNoDuplicates!0 (array!66530 (_ BitVec 32) List!22309) Bool)

(assert (=> b!1054717 (= res!703661 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22306))))

(declare-fun b!1054718 () Bool)

(declare-fun res!703663 () Bool)

(assert (=> b!1054718 (=> (not res!703663) (not e!599269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054718 (= res!703663 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054719 () Bool)

(declare-fun e!599271 () Bool)

(assert (=> b!1054719 (= e!599269 e!599271)))

(declare-fun res!703658 () Bool)

(assert (=> b!1054719 (=> (not res!703658) (not e!599271))))

(declare-fun lt!465528 () array!66530)

(assert (=> b!1054719 (= res!703658 (arrayContainsKey!0 lt!465528 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054719 (= lt!465528 (array!66531 (store (arr!31997 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32533 a!3488)))))

(declare-fun b!1054720 () Bool)

(declare-fun e!599267 () Bool)

(declare-fun e!599266 () Bool)

(assert (=> b!1054720 (= e!599267 (not e!599266))))

(declare-fun res!703662 () Bool)

(assert (=> b!1054720 (=> res!703662 e!599266)))

(assert (=> b!1054720 (= res!703662 (bvsle lt!465526 i!1381))))

(declare-fun e!599268 () Bool)

(assert (=> b!1054720 e!599268))

(declare-fun res!703656 () Bool)

(assert (=> b!1054720 (=> (not res!703656) (not e!599268))))

(assert (=> b!1054720 (= res!703656 (= (select (store (arr!31997 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465526) k0!2747))))

(declare-fun b!1054721 () Bool)

(assert (=> b!1054721 (= e!599271 e!599267)))

(declare-fun res!703657 () Bool)

(assert (=> b!1054721 (=> (not res!703657) (not e!599267))))

(assert (=> b!1054721 (= res!703657 (not (= lt!465526 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66530 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054721 (= lt!465526 (arrayScanForKey!0 lt!465528 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!703664 () Bool)

(assert (=> start!92870 (=> (not res!703664) (not e!599269))))

(assert (=> start!92870 (= res!703664 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32533 a!3488)) (bvslt (size!32533 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92870 e!599269))

(assert (=> start!92870 true))

(declare-fun array_inv!24777 (array!66530) Bool)

(assert (=> start!92870 (array_inv!24777 a!3488)))

(declare-fun b!1054722 () Bool)

(declare-fun res!703659 () Bool)

(assert (=> b!1054722 (=> (not res!703659) (not e!599269))))

(assert (=> b!1054722 (= res!703659 (= (select (arr!31997 a!3488) i!1381) k0!2747))))

(declare-fun b!1054723 () Bool)

(assert (=> b!1054723 (= e!599268 e!599272)))

(declare-fun res!703660 () Bool)

(assert (=> b!1054723 (=> res!703660 e!599272)))

(assert (=> b!1054723 (= res!703660 (bvsle lt!465526 i!1381))))

(declare-fun b!1054724 () Bool)

(assert (=> b!1054724 (= e!599266 true)))

(assert (=> b!1054724 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34552 0))(
  ( (Unit!34553) )
))
(declare-fun lt!465527 () Unit!34552)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34552)

(assert (=> b!1054724 (= lt!465527 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465526 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054724 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22306)))

(declare-fun lt!465525 () Unit!34552)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66530 (_ BitVec 32) (_ BitVec 32)) Unit!34552)

(assert (=> b!1054724 (= lt!465525 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92870 res!703664) b!1054717))

(assert (= (and b!1054717 res!703661) b!1054718))

(assert (= (and b!1054718 res!703663) b!1054722))

(assert (= (and b!1054722 res!703659) b!1054719))

(assert (= (and b!1054719 res!703658) b!1054721))

(assert (= (and b!1054721 res!703657) b!1054720))

(assert (= (and b!1054720 res!703656) b!1054723))

(assert (= (and b!1054723 (not res!703660)) b!1054716))

(assert (= (and b!1054720 (not res!703662)) b!1054724))

(declare-fun m!974761 () Bool)

(assert (=> b!1054720 m!974761))

(declare-fun m!974763 () Bool)

(assert (=> b!1054720 m!974763))

(declare-fun m!974765 () Bool)

(assert (=> b!1054718 m!974765))

(declare-fun m!974767 () Bool)

(assert (=> b!1054722 m!974767))

(declare-fun m!974769 () Bool)

(assert (=> b!1054717 m!974769))

(declare-fun m!974771 () Bool)

(assert (=> start!92870 m!974771))

(declare-fun m!974773 () Bool)

(assert (=> b!1054719 m!974773))

(assert (=> b!1054719 m!974761))

(declare-fun m!974775 () Bool)

(assert (=> b!1054724 m!974775))

(declare-fun m!974777 () Bool)

(assert (=> b!1054724 m!974777))

(declare-fun m!974779 () Bool)

(assert (=> b!1054724 m!974779))

(declare-fun m!974781 () Bool)

(assert (=> b!1054724 m!974781))

(declare-fun m!974783 () Bool)

(assert (=> b!1054721 m!974783))

(declare-fun m!974785 () Bool)

(assert (=> b!1054716 m!974785))

(check-sat (not b!1054716) (not b!1054719) (not b!1054721) (not b!1054724) (not b!1054717) (not start!92870) (not b!1054718))
(check-sat)
