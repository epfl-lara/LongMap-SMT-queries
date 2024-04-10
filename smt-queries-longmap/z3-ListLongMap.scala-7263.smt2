; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92762 () Bool)

(assert start!92762)

(declare-fun b!1053673 () Bool)

(declare-datatypes ((array!66455 0))(
  ( (array!66456 (arr!31961 (Array (_ BitVec 32) (_ BitVec 64))) (size!32497 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66455)

(declare-fun e!598464 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!465191 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053673 (= e!598464 (arrayContainsKey!0 a!3488 k0!2747 lt!465191))))

(declare-fun b!1053674 () Bool)

(declare-fun e!598461 () Bool)

(assert (=> b!1053674 (= e!598461 (not true))))

(declare-fun e!598460 () Bool)

(assert (=> b!1053674 e!598460))

(declare-fun res!702656 () Bool)

(assert (=> b!1053674 (=> (not res!702656) (not e!598460))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053674 (= res!702656 (= (select (store (arr!31961 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465191) k0!2747))))

(declare-fun b!1053675 () Bool)

(declare-fun e!598465 () Bool)

(declare-fun e!598463 () Bool)

(assert (=> b!1053675 (= e!598465 e!598463)))

(declare-fun res!702662 () Bool)

(assert (=> b!1053675 (=> (not res!702662) (not e!598463))))

(declare-fun lt!465192 () array!66455)

(assert (=> b!1053675 (= res!702662 (arrayContainsKey!0 lt!465192 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053675 (= lt!465192 (array!66456 (store (arr!31961 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32497 a!3488)))))

(declare-fun b!1053676 () Bool)

(declare-fun res!702661 () Bool)

(assert (=> b!1053676 (=> (not res!702661) (not e!598465))))

(assert (=> b!1053676 (= res!702661 (= (select (arr!31961 a!3488) i!1381) k0!2747))))

(declare-fun b!1053677 () Bool)

(declare-fun res!702659 () Bool)

(assert (=> b!1053677 (=> (not res!702659) (not e!598465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053677 (= res!702659 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053678 () Bool)

(declare-fun res!702657 () Bool)

(assert (=> b!1053678 (=> (not res!702657) (not e!598465))))

(declare-datatypes ((List!22273 0))(
  ( (Nil!22270) (Cons!22269 (h!23478 (_ BitVec 64)) (t!31580 List!22273)) )
))
(declare-fun arrayNoDuplicates!0 (array!66455 (_ BitVec 32) List!22273) Bool)

(assert (=> b!1053678 (= res!702657 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22270))))

(declare-fun res!702660 () Bool)

(assert (=> start!92762 (=> (not res!702660) (not e!598465))))

(assert (=> start!92762 (= res!702660 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32497 a!3488)) (bvslt (size!32497 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92762 e!598465))

(assert (=> start!92762 true))

(declare-fun array_inv!24741 (array!66455) Bool)

(assert (=> start!92762 (array_inv!24741 a!3488)))

(declare-fun b!1053679 () Bool)

(assert (=> b!1053679 (= e!598463 e!598461)))

(declare-fun res!702655 () Bool)

(assert (=> b!1053679 (=> (not res!702655) (not e!598461))))

(assert (=> b!1053679 (= res!702655 (not (= lt!465191 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66455 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053679 (= lt!465191 (arrayScanForKey!0 lt!465192 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053680 () Bool)

(assert (=> b!1053680 (= e!598460 e!598464)))

(declare-fun res!702658 () Bool)

(assert (=> b!1053680 (=> res!702658 e!598464)))

(assert (=> b!1053680 (= res!702658 (bvsle lt!465191 i!1381))))

(assert (= (and start!92762 res!702660) b!1053678))

(assert (= (and b!1053678 res!702657) b!1053677))

(assert (= (and b!1053677 res!702659) b!1053676))

(assert (= (and b!1053676 res!702661) b!1053675))

(assert (= (and b!1053675 res!702662) b!1053679))

(assert (= (and b!1053679 res!702655) b!1053674))

(assert (= (and b!1053674 res!702656) b!1053680))

(assert (= (and b!1053680 (not res!702658)) b!1053673))

(declare-fun m!973901 () Bool)

(assert (=> b!1053678 m!973901))

(declare-fun m!973903 () Bool)

(assert (=> start!92762 m!973903))

(declare-fun m!973905 () Bool)

(assert (=> b!1053679 m!973905))

(declare-fun m!973907 () Bool)

(assert (=> b!1053673 m!973907))

(declare-fun m!973909 () Bool)

(assert (=> b!1053676 m!973909))

(declare-fun m!973911 () Bool)

(assert (=> b!1053675 m!973911))

(declare-fun m!973913 () Bool)

(assert (=> b!1053675 m!973913))

(assert (=> b!1053674 m!973913))

(declare-fun m!973915 () Bool)

(assert (=> b!1053674 m!973915))

(declare-fun m!973917 () Bool)

(assert (=> b!1053677 m!973917))

(check-sat (not b!1053679) (not b!1053678) (not start!92762) (not b!1053673) (not b!1053675) (not b!1053677))
(check-sat)
