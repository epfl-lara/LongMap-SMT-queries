; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92616 () Bool)

(assert start!92616)

(declare-fun b!1051684 () Bool)

(declare-fun res!700013 () Bool)

(declare-fun e!596889 () Bool)

(assert (=> b!1051684 (=> (not res!700013) (not e!596889))))

(declare-datatypes ((array!66232 0))(
  ( (array!66233 (arr!31849 (Array (_ BitVec 32) (_ BitVec 64))) (size!32386 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66232)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051684 (= res!700013 (= (select (arr!31849 a!3488) i!1381) k0!2747))))

(declare-fun e!596888 () Bool)

(declare-fun b!1051685 () Bool)

(declare-fun lt!464431 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051685 (= e!596888 (arrayContainsKey!0 a!3488 k0!2747 lt!464431))))

(declare-fun b!1051686 () Bool)

(declare-fun e!596892 () Bool)

(assert (=> b!1051686 (= e!596889 e!596892)))

(declare-fun res!700009 () Bool)

(assert (=> b!1051686 (=> (not res!700009) (not e!596892))))

(declare-fun lt!464430 () array!66232)

(assert (=> b!1051686 (= res!700009 (arrayContainsKey!0 lt!464430 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051686 (= lt!464430 (array!66233 (store (arr!31849 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32386 a!3488)))))

(declare-fun b!1051687 () Bool)

(declare-fun e!596893 () Bool)

(assert (=> b!1051687 (= e!596893 true)))

(assert (=> b!1051687 false))

(declare-datatypes ((Unit!34387 0))(
  ( (Unit!34388) )
))
(declare-fun lt!464428 () Unit!34387)

(declare-datatypes ((List!22131 0))(
  ( (Nil!22128) (Cons!22127 (h!23345 (_ BitVec 64)) (t!31430 List!22131)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66232 (_ BitVec 64) (_ BitVec 32) List!22131) Unit!34387)

(assert (=> b!1051687 (= lt!464428 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22128))))

(assert (=> b!1051687 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!464432 () Unit!34387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66232 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34387)

(assert (=> b!1051687 (= lt!464432 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464431 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66232 (_ BitVec 32) List!22131) Bool)

(assert (=> b!1051687 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22128)))

(declare-fun lt!464429 () Unit!34387)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66232 (_ BitVec 32) (_ BitVec 32)) Unit!34387)

(assert (=> b!1051687 (= lt!464429 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1051688 () Bool)

(declare-fun e!596891 () Bool)

(assert (=> b!1051688 (= e!596892 e!596891)))

(declare-fun res!700007 () Bool)

(assert (=> b!1051688 (=> (not res!700007) (not e!596891))))

(assert (=> b!1051688 (= res!700007 (not (= lt!464431 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66232 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051688 (= lt!464431 (arrayScanForKey!0 lt!464430 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700012 () Bool)

(assert (=> start!92616 (=> (not res!700012) (not e!596889))))

(assert (=> start!92616 (= res!700012 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32386 a!3488)) (bvslt (size!32386 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92616 e!596889))

(assert (=> start!92616 true))

(declare-fun array_inv!24631 (array!66232) Bool)

(assert (=> start!92616 (array_inv!24631 a!3488)))

(declare-fun b!1051689 () Bool)

(declare-fun res!700010 () Bool)

(assert (=> b!1051689 (=> (not res!700010) (not e!596889))))

(assert (=> b!1051689 (= res!700010 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22128))))

(declare-fun b!1051690 () Bool)

(assert (=> b!1051690 (= e!596891 (not e!596893))))

(declare-fun res!700006 () Bool)

(assert (=> b!1051690 (=> res!700006 e!596893)))

(assert (=> b!1051690 (= res!700006 (bvsle lt!464431 i!1381))))

(declare-fun e!596890 () Bool)

(assert (=> b!1051690 e!596890))

(declare-fun res!700005 () Bool)

(assert (=> b!1051690 (=> (not res!700005) (not e!596890))))

(assert (=> b!1051690 (= res!700005 (= (select (store (arr!31849 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464431) k0!2747))))

(declare-fun b!1051691 () Bool)

(assert (=> b!1051691 (= e!596890 e!596888)))

(declare-fun res!700011 () Bool)

(assert (=> b!1051691 (=> res!700011 e!596888)))

(assert (=> b!1051691 (= res!700011 (bvsle lt!464431 i!1381))))

(declare-fun b!1051692 () Bool)

(declare-fun res!700008 () Bool)

(assert (=> b!1051692 (=> (not res!700008) (not e!596889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051692 (= res!700008 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92616 res!700012) b!1051689))

(assert (= (and b!1051689 res!700010) b!1051692))

(assert (= (and b!1051692 res!700008) b!1051684))

(assert (= (and b!1051684 res!700013) b!1051686))

(assert (= (and b!1051686 res!700009) b!1051688))

(assert (= (and b!1051688 res!700007) b!1051690))

(assert (= (and b!1051690 res!700005) b!1051691))

(assert (= (and b!1051691 (not res!700011)) b!1051685))

(assert (= (and b!1051690 (not res!700006)) b!1051687))

(declare-fun m!972713 () Bool)

(assert (=> b!1051687 m!972713))

(declare-fun m!972715 () Bool)

(assert (=> b!1051687 m!972715))

(declare-fun m!972717 () Bool)

(assert (=> b!1051687 m!972717))

(declare-fun m!972719 () Bool)

(assert (=> b!1051687 m!972719))

(declare-fun m!972721 () Bool)

(assert (=> b!1051687 m!972721))

(declare-fun m!972723 () Bool)

(assert (=> b!1051692 m!972723))

(declare-fun m!972725 () Bool)

(assert (=> b!1051690 m!972725))

(declare-fun m!972727 () Bool)

(assert (=> b!1051690 m!972727))

(declare-fun m!972729 () Bool)

(assert (=> start!92616 m!972729))

(declare-fun m!972731 () Bool)

(assert (=> b!1051689 m!972731))

(declare-fun m!972733 () Bool)

(assert (=> b!1051685 m!972733))

(declare-fun m!972735 () Bool)

(assert (=> b!1051686 m!972735))

(assert (=> b!1051686 m!972725))

(declare-fun m!972737 () Bool)

(assert (=> b!1051688 m!972737))

(declare-fun m!972739 () Bool)

(assert (=> b!1051684 m!972739))

(check-sat (not b!1051692) (not start!92616) (not b!1051686) (not b!1051687) (not b!1051689) (not b!1051685) (not b!1051688))
(check-sat)
