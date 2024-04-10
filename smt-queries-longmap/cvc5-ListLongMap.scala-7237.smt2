; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92484 () Bool)

(assert start!92484)

(declare-fun b!1051653 () Bool)

(declare-fun res!700784 () Bool)

(declare-fun e!597001 () Bool)

(assert (=> b!1051653 (=> (not res!700784) (not e!597001))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051653 (= res!700784 (validKeyInArray!0 k!2747))))

(declare-fun b!1051654 () Bool)

(declare-fun res!700788 () Bool)

(assert (=> b!1051654 (=> (not res!700788) (not e!597001))))

(declare-datatypes ((array!66285 0))(
  ( (array!66286 (arr!31882 (Array (_ BitVec 32) (_ BitVec 64))) (size!32418 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66285)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051654 (= res!700788 (= (select (arr!31882 a!3488) i!1381) k!2747))))

(declare-fun b!1051656 () Bool)

(declare-fun e!597005 () Bool)

(declare-fun e!597000 () Bool)

(assert (=> b!1051656 (= e!597005 e!597000)))

(declare-fun res!700790 () Bool)

(assert (=> b!1051656 (=> res!700790 e!597000)))

(declare-fun lt!464370 () (_ BitVec 32))

(declare-fun lt!464365 () (_ BitVec 32))

(assert (=> b!1051656 (= res!700790 (or (bvslt lt!464370 #b00000000000000000000000000000000) (bvsge lt!464365 (size!32418 a!3488)) (bvsge lt!464370 (size!32418 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051656 (arrayContainsKey!0 a!3488 k!2747 lt!464365)))

(declare-datatypes ((Unit!34436 0))(
  ( (Unit!34437) )
))
(declare-fun lt!464368 () Unit!34436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34436)

(assert (=> b!1051656 (= lt!464368 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464365))))

(assert (=> b!1051656 (= lt!464365 (bvadd #b00000000000000000000000000000001 lt!464370))))

(declare-datatypes ((List!22194 0))(
  ( (Nil!22191) (Cons!22190 (h!23399 (_ BitVec 64)) (t!31501 List!22194)) )
))
(declare-fun arrayNoDuplicates!0 (array!66285 (_ BitVec 32) List!22194) Bool)

(assert (=> b!1051656 (arrayNoDuplicates!0 a!3488 lt!464370 Nil!22191)))

(declare-fun lt!464369 () Unit!34436)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66285 (_ BitVec 32) (_ BitVec 32)) Unit!34436)

(assert (=> b!1051656 (= lt!464369 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464370))))

(declare-fun b!1051657 () Bool)

(declare-fun res!700785 () Bool)

(assert (=> b!1051657 (=> (not res!700785) (not e!597001))))

(assert (=> b!1051657 (= res!700785 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22191))))

(declare-fun b!1051658 () Bool)

(declare-fun e!597006 () Bool)

(declare-fun e!597002 () Bool)

(assert (=> b!1051658 (= e!597006 e!597002)))

(declare-fun res!700781 () Bool)

(assert (=> b!1051658 (=> res!700781 e!597002)))

(assert (=> b!1051658 (= res!700781 (or (bvsgt lt!464370 i!1381) (bvsle i!1381 lt!464370)))))

(declare-fun b!1051659 () Bool)

(declare-fun res!700786 () Bool)

(assert (=> b!1051659 (=> res!700786 e!597000)))

(declare-fun noDuplicate!1521 (List!22194) Bool)

(assert (=> b!1051659 (= res!700786 (not (noDuplicate!1521 Nil!22191)))))

(declare-fun b!1051660 () Bool)

(assert (=> b!1051660 (= e!597000 true)))

(declare-fun lt!464367 () Bool)

(declare-fun contains!6136 (List!22194 (_ BitVec 64)) Bool)

(assert (=> b!1051660 (= lt!464367 (contains!6136 Nil!22191 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051661 () Bool)

(declare-fun e!597007 () Bool)

(declare-fun e!597003 () Bool)

(assert (=> b!1051661 (= e!597007 e!597003)))

(declare-fun res!700782 () Bool)

(assert (=> b!1051661 (=> (not res!700782) (not e!597003))))

(assert (=> b!1051661 (= res!700782 (not (= lt!464370 i!1381)))))

(declare-fun lt!464366 () array!66285)

(declare-fun arrayScanForKey!0 (array!66285 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051661 (= lt!464370 (arrayScanForKey!0 lt!464366 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051662 () Bool)

(assert (=> b!1051662 (= e!597001 e!597007)))

(declare-fun res!700783 () Bool)

(assert (=> b!1051662 (=> (not res!700783) (not e!597007))))

(assert (=> b!1051662 (= res!700783 (arrayContainsKey!0 lt!464366 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051662 (= lt!464366 (array!66286 (store (arr!31882 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32418 a!3488)))))

(declare-fun res!700779 () Bool)

(assert (=> start!92484 (=> (not res!700779) (not e!597001))))

(assert (=> start!92484 (= res!700779 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32418 a!3488)) (bvslt (size!32418 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92484 e!597001))

(assert (=> start!92484 true))

(declare-fun array_inv!24662 (array!66285) Bool)

(assert (=> start!92484 (array_inv!24662 a!3488)))

(declare-fun b!1051655 () Bool)

(assert (=> b!1051655 (= e!597002 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051663 () Bool)

(assert (=> b!1051663 (= e!597003 (not e!597005))))

(declare-fun res!700789 () Bool)

(assert (=> b!1051663 (=> res!700789 e!597005)))

(assert (=> b!1051663 (= res!700789 (or (bvsgt lt!464370 i!1381) (bvsle i!1381 lt!464370)))))

(assert (=> b!1051663 e!597006))

(declare-fun res!700780 () Bool)

(assert (=> b!1051663 (=> (not res!700780) (not e!597006))))

(assert (=> b!1051663 (= res!700780 (= (select (store (arr!31882 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464370) k!2747))))

(declare-fun b!1051664 () Bool)

(declare-fun res!700787 () Bool)

(assert (=> b!1051664 (=> res!700787 e!597000)))

(assert (=> b!1051664 (= res!700787 (contains!6136 Nil!22191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92484 res!700779) b!1051657))

(assert (= (and b!1051657 res!700785) b!1051653))

(assert (= (and b!1051653 res!700784) b!1051654))

(assert (= (and b!1051654 res!700788) b!1051662))

(assert (= (and b!1051662 res!700783) b!1051661))

(assert (= (and b!1051661 res!700782) b!1051663))

(assert (= (and b!1051663 res!700780) b!1051658))

(assert (= (and b!1051658 (not res!700781)) b!1051655))

(assert (= (and b!1051663 (not res!700789)) b!1051656))

(assert (= (and b!1051656 (not res!700790)) b!1051659))

(assert (= (and b!1051659 (not res!700786)) b!1051664))

(assert (= (and b!1051664 (not res!700787)) b!1051660))

(declare-fun m!972119 () Bool)

(assert (=> b!1051653 m!972119))

(declare-fun m!972121 () Bool)

(assert (=> b!1051660 m!972121))

(declare-fun m!972123 () Bool)

(assert (=> start!92484 m!972123))

(declare-fun m!972125 () Bool)

(assert (=> b!1051654 m!972125))

(declare-fun m!972127 () Bool)

(assert (=> b!1051655 m!972127))

(declare-fun m!972129 () Bool)

(assert (=> b!1051659 m!972129))

(declare-fun m!972131 () Bool)

(assert (=> b!1051656 m!972131))

(declare-fun m!972133 () Bool)

(assert (=> b!1051656 m!972133))

(declare-fun m!972135 () Bool)

(assert (=> b!1051656 m!972135))

(declare-fun m!972137 () Bool)

(assert (=> b!1051656 m!972137))

(declare-fun m!972139 () Bool)

(assert (=> b!1051661 m!972139))

(declare-fun m!972141 () Bool)

(assert (=> b!1051657 m!972141))

(declare-fun m!972143 () Bool)

(assert (=> b!1051662 m!972143))

(declare-fun m!972145 () Bool)

(assert (=> b!1051662 m!972145))

(assert (=> b!1051663 m!972145))

(declare-fun m!972147 () Bool)

(assert (=> b!1051663 m!972147))

(declare-fun m!972149 () Bool)

(assert (=> b!1051664 m!972149))

(push 1)

