; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92864 () Bool)

(assert start!92864)

(declare-fun b!1054635 () Bool)

(declare-fun e!599207 () Bool)

(declare-fun e!599206 () Bool)

(assert (=> b!1054635 (= e!599207 e!599206)))

(declare-fun res!703577 () Bool)

(assert (=> b!1054635 (=> (not res!703577) (not e!599206))))

(declare-datatypes ((array!66524 0))(
  ( (array!66525 (arr!31994 (Array (_ BitVec 32) (_ BitVec 64))) (size!32530 (_ BitVec 32))) )
))
(declare-fun lt!465489 () array!66524)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054635 (= res!703577 (arrayContainsKey!0 lt!465489 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66524)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054635 (= lt!465489 (array!66525 (store (arr!31994 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32530 a!3488)))))

(declare-fun lt!465492 () (_ BitVec 32))

(declare-fun b!1054636 () Bool)

(declare-fun e!599208 () Bool)

(assert (=> b!1054636 (= e!599208 (arrayContainsKey!0 a!3488 k0!2747 lt!465492))))

(declare-fun b!1054638 () Bool)

(declare-fun res!703581 () Bool)

(assert (=> b!1054638 (=> (not res!703581) (not e!599207))))

(declare-datatypes ((List!22306 0))(
  ( (Nil!22303) (Cons!22302 (h!23511 (_ BitVec 64)) (t!31613 List!22306)) )
))
(declare-fun arrayNoDuplicates!0 (array!66524 (_ BitVec 32) List!22306) Bool)

(assert (=> b!1054638 (= res!703581 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22303))))

(declare-fun b!1054639 () Bool)

(declare-fun e!599204 () Bool)

(assert (=> b!1054639 (= e!599204 true)))

(assert (=> b!1054639 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34546 0))(
  ( (Unit!34547) )
))
(declare-fun lt!465490 () Unit!34546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34546)

(assert (=> b!1054639 (= lt!465490 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465492 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054639 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22303)))

(declare-fun lt!465491 () Unit!34546)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66524 (_ BitVec 32) (_ BitVec 32)) Unit!34546)

(assert (=> b!1054639 (= lt!465491 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054640 () Bool)

(declare-fun e!599203 () Bool)

(assert (=> b!1054640 (= e!599206 e!599203)))

(declare-fun res!703583 () Bool)

(assert (=> b!1054640 (=> (not res!703583) (not e!599203))))

(assert (=> b!1054640 (= res!703583 (not (= lt!465492 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66524 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054640 (= lt!465492 (arrayScanForKey!0 lt!465489 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054641 () Bool)

(declare-fun res!703579 () Bool)

(assert (=> b!1054641 (=> (not res!703579) (not e!599207))))

(assert (=> b!1054641 (= res!703579 (= (select (arr!31994 a!3488) i!1381) k0!2747))))

(declare-fun b!1054642 () Bool)

(declare-fun e!599205 () Bool)

(assert (=> b!1054642 (= e!599205 e!599208)))

(declare-fun res!703580 () Bool)

(assert (=> b!1054642 (=> res!703580 e!599208)))

(assert (=> b!1054642 (= res!703580 (bvsle lt!465492 i!1381))))

(declare-fun b!1054643 () Bool)

(assert (=> b!1054643 (= e!599203 (not e!599204))))

(declare-fun res!703575 () Bool)

(assert (=> b!1054643 (=> res!703575 e!599204)))

(assert (=> b!1054643 (= res!703575 (bvsle lt!465492 i!1381))))

(assert (=> b!1054643 e!599205))

(declare-fun res!703582 () Bool)

(assert (=> b!1054643 (=> (not res!703582) (not e!599205))))

(assert (=> b!1054643 (= res!703582 (= (select (store (arr!31994 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465492) k0!2747))))

(declare-fun res!703576 () Bool)

(assert (=> start!92864 (=> (not res!703576) (not e!599207))))

(assert (=> start!92864 (= res!703576 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32530 a!3488)) (bvslt (size!32530 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92864 e!599207))

(assert (=> start!92864 true))

(declare-fun array_inv!24774 (array!66524) Bool)

(assert (=> start!92864 (array_inv!24774 a!3488)))

(declare-fun b!1054637 () Bool)

(declare-fun res!703578 () Bool)

(assert (=> b!1054637 (=> (not res!703578) (not e!599207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054637 (= res!703578 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92864 res!703576) b!1054638))

(assert (= (and b!1054638 res!703581) b!1054637))

(assert (= (and b!1054637 res!703578) b!1054641))

(assert (= (and b!1054641 res!703579) b!1054635))

(assert (= (and b!1054635 res!703577) b!1054640))

(assert (= (and b!1054640 res!703583) b!1054643))

(assert (= (and b!1054643 res!703582) b!1054642))

(assert (= (and b!1054642 (not res!703580)) b!1054636))

(assert (= (and b!1054643 (not res!703575)) b!1054639))

(declare-fun m!974683 () Bool)

(assert (=> b!1054636 m!974683))

(declare-fun m!974685 () Bool)

(assert (=> b!1054641 m!974685))

(declare-fun m!974687 () Bool)

(assert (=> b!1054639 m!974687))

(declare-fun m!974689 () Bool)

(assert (=> b!1054639 m!974689))

(declare-fun m!974691 () Bool)

(assert (=> b!1054639 m!974691))

(declare-fun m!974693 () Bool)

(assert (=> b!1054639 m!974693))

(declare-fun m!974695 () Bool)

(assert (=> b!1054637 m!974695))

(declare-fun m!974697 () Bool)

(assert (=> b!1054640 m!974697))

(declare-fun m!974699 () Bool)

(assert (=> start!92864 m!974699))

(declare-fun m!974701 () Bool)

(assert (=> b!1054643 m!974701))

(declare-fun m!974703 () Bool)

(assert (=> b!1054643 m!974703))

(declare-fun m!974705 () Bool)

(assert (=> b!1054635 m!974705))

(assert (=> b!1054635 m!974701))

(declare-fun m!974707 () Bool)

(assert (=> b!1054638 m!974707))

(check-sat (not b!1054640) (not b!1054638) (not start!92864) (not b!1054636) (not b!1054639) (not b!1054635) (not b!1054637))
(check-sat)
