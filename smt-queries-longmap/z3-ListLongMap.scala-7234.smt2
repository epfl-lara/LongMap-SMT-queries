; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92700 () Bool)

(assert start!92700)

(declare-fun b!1052692 () Bool)

(declare-fun e!597647 () Bool)

(declare-fun e!597644 () Bool)

(assert (=> b!1052692 (= e!597647 e!597644)))

(declare-fun res!701020 () Bool)

(assert (=> b!1052692 (=> (not res!701020) (not e!597644))))

(declare-datatypes ((array!66316 0))(
  ( (array!66317 (arr!31891 (Array (_ BitVec 32) (_ BitVec 64))) (size!32428 (_ BitVec 32))) )
))
(declare-fun lt!464766 () array!66316)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052692 (= res!701020 (arrayContainsKey!0 lt!464766 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66316)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052692 (= lt!464766 (array!66317 (store (arr!31891 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32428 a!3488)))))

(declare-fun res!701017 () Bool)

(assert (=> start!92700 (=> (not res!701017) (not e!597647))))

(assert (=> start!92700 (= res!701017 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32428 a!3488)) (bvslt (size!32428 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92700 e!597647))

(assert (=> start!92700 true))

(declare-fun array_inv!24673 (array!66316) Bool)

(assert (=> start!92700 (array_inv!24673 a!3488)))

(declare-fun b!1052693 () Bool)

(declare-fun e!597649 () Bool)

(assert (=> b!1052693 (= e!597644 e!597649)))

(declare-fun res!701013 () Bool)

(assert (=> b!1052693 (=> (not res!701013) (not e!597649))))

(declare-fun lt!464768 () (_ BitVec 32))

(assert (=> b!1052693 (= res!701013 (not (= lt!464768 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66316 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052693 (= lt!464768 (arrayScanForKey!0 lt!464766 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052694 () Bool)

(declare-fun res!701014 () Bool)

(assert (=> b!1052694 (=> (not res!701014) (not e!597647))))

(declare-datatypes ((List!22173 0))(
  ( (Nil!22170) (Cons!22169 (h!23387 (_ BitVec 64)) (t!31472 List!22173)) )
))
(declare-fun arrayNoDuplicates!0 (array!66316 (_ BitVec 32) List!22173) Bool)

(assert (=> b!1052694 (= res!701014 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22170))))

(declare-fun b!1052695 () Bool)

(declare-fun e!597643 () Bool)

(assert (=> b!1052695 (= e!597643 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052696 () Bool)

(declare-fun e!597646 () Bool)

(assert (=> b!1052696 (= e!597646 e!597643)))

(declare-fun res!701015 () Bool)

(assert (=> b!1052696 (=> res!701015 e!597643)))

(assert (=> b!1052696 (= res!701015 (or (bvsgt lt!464768 i!1381) (bvsle i!1381 lt!464768)))))

(declare-fun b!1052697 () Bool)

(declare-fun res!701021 () Bool)

(assert (=> b!1052697 (=> (not res!701021) (not e!597647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052697 (= res!701021 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052698 () Bool)

(declare-fun e!597645 () Bool)

(assert (=> b!1052698 (= e!597649 (not e!597645))))

(declare-fun res!701016 () Bool)

(assert (=> b!1052698 (=> res!701016 e!597645)))

(assert (=> b!1052698 (= res!701016 (or (bvsgt lt!464768 i!1381) (bvsle i!1381 lt!464768)))))

(assert (=> b!1052698 e!597646))

(declare-fun res!701018 () Bool)

(assert (=> b!1052698 (=> (not res!701018) (not e!597646))))

(assert (=> b!1052698 (= res!701018 (= (select (store (arr!31891 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464768) k0!2747))))

(declare-fun b!1052699 () Bool)

(declare-fun res!701019 () Bool)

(assert (=> b!1052699 (=> (not res!701019) (not e!597647))))

(assert (=> b!1052699 (= res!701019 (= (select (arr!31891 a!3488) i!1381) k0!2747))))

(declare-fun b!1052700 () Bool)

(assert (=> b!1052700 (= e!597645 true)))

(assert (=> b!1052700 (arrayNoDuplicates!0 a!3488 lt!464768 Nil!22170)))

(declare-datatypes ((Unit!34423 0))(
  ( (Unit!34424) )
))
(declare-fun lt!464767 () Unit!34423)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66316 (_ BitVec 32) (_ BitVec 32)) Unit!34423)

(assert (=> b!1052700 (= lt!464767 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464768))))

(assert (= (and start!92700 res!701017) b!1052694))

(assert (= (and b!1052694 res!701014) b!1052697))

(assert (= (and b!1052697 res!701021) b!1052699))

(assert (= (and b!1052699 res!701019) b!1052692))

(assert (= (and b!1052692 res!701020) b!1052693))

(assert (= (and b!1052693 res!701013) b!1052698))

(assert (= (and b!1052698 res!701018) b!1052696))

(assert (= (and b!1052696 (not res!701015)) b!1052695))

(assert (= (and b!1052698 (not res!701016)) b!1052700))

(declare-fun m!973559 () Bool)

(assert (=> b!1052694 m!973559))

(declare-fun m!973561 () Bool)

(assert (=> b!1052698 m!973561))

(declare-fun m!973563 () Bool)

(assert (=> b!1052698 m!973563))

(declare-fun m!973565 () Bool)

(assert (=> b!1052695 m!973565))

(declare-fun m!973567 () Bool)

(assert (=> start!92700 m!973567))

(declare-fun m!973569 () Bool)

(assert (=> b!1052693 m!973569))

(declare-fun m!973571 () Bool)

(assert (=> b!1052700 m!973571))

(declare-fun m!973573 () Bool)

(assert (=> b!1052700 m!973573))

(declare-fun m!973575 () Bool)

(assert (=> b!1052699 m!973575))

(declare-fun m!973577 () Bool)

(assert (=> b!1052692 m!973577))

(assert (=> b!1052692 m!973561))

(declare-fun m!973579 () Bool)

(assert (=> b!1052697 m!973579))

(check-sat (not b!1052693) (not b!1052695) (not b!1052700) (not start!92700) (not b!1052697) (not b!1052694) (not b!1052692))
(check-sat)
