; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92348 () Bool)

(assert start!92348)

(declare-fun b!1049790 () Bool)

(declare-fun res!698921 () Bool)

(declare-fun e!595647 () Bool)

(assert (=> b!1049790 (=> res!698921 e!595647)))

(declare-datatypes ((List!22126 0))(
  ( (Nil!22123) (Cons!22122 (h!23331 (_ BitVec 64)) (t!31433 List!22126)) )
))
(declare-fun contains!6119 (List!22126 (_ BitVec 64)) Bool)

(assert (=> b!1049790 (= res!698921 (contains!6119 Nil!22123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!463660 () (_ BitVec 32))

(declare-fun e!595651 () Bool)

(declare-datatypes ((array!66149 0))(
  ( (array!66150 (arr!31814 (Array (_ BitVec 32) (_ BitVec 64))) (size!32350 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66149)

(declare-fun b!1049791 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049791 (= e!595651 (arrayContainsKey!0 a!3488 k0!2747 lt!463660))))

(declare-fun b!1049792 () Bool)

(declare-fun res!698925 () Bool)

(declare-fun e!595653 () Bool)

(assert (=> b!1049792 (=> (not res!698925) (not e!595653))))

(declare-fun arrayNoDuplicates!0 (array!66149 (_ BitVec 32) List!22126) Bool)

(assert (=> b!1049792 (= res!698925 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22123))))

(declare-fun b!1049793 () Bool)

(declare-fun res!698918 () Bool)

(assert (=> b!1049793 (=> (not res!698918) (not e!595653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049793 (= res!698918 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049794 () Bool)

(assert (=> b!1049794 (= e!595647 true)))

(declare-fun lt!463662 () Bool)

(assert (=> b!1049794 (= lt!463662 (contains!6119 Nil!22123 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!698922 () Bool)

(assert (=> start!92348 (=> (not res!698922) (not e!595653))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92348 (= res!698922 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32350 a!3488)) (bvslt (size!32350 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92348 e!595653))

(assert (=> start!92348 true))

(declare-fun array_inv!24594 (array!66149) Bool)

(assert (=> start!92348 (array_inv!24594 a!3488)))

(declare-fun b!1049795 () Bool)

(declare-fun e!595648 () Bool)

(assert (=> b!1049795 (= e!595653 e!595648)))

(declare-fun res!698919 () Bool)

(assert (=> b!1049795 (=> (not res!698919) (not e!595648))))

(declare-fun lt!463659 () array!66149)

(assert (=> b!1049795 (= res!698919 (arrayContainsKey!0 lt!463659 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049795 (= lt!463659 (array!66150 (store (arr!31814 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32350 a!3488)))))

(declare-fun b!1049796 () Bool)

(declare-fun res!698917 () Bool)

(assert (=> b!1049796 (=> (not res!698917) (not e!595653))))

(assert (=> b!1049796 (= res!698917 (= (select (arr!31814 a!3488) i!1381) k0!2747))))

(declare-fun b!1049797 () Bool)

(declare-fun res!698920 () Bool)

(assert (=> b!1049797 (=> res!698920 e!595647)))

(declare-fun noDuplicate!1504 (List!22126) Bool)

(assert (=> b!1049797 (= res!698920 (not (noDuplicate!1504 Nil!22123)))))

(declare-fun b!1049798 () Bool)

(declare-fun e!595650 () Bool)

(declare-fun e!595649 () Bool)

(assert (=> b!1049798 (= e!595650 (not e!595649))))

(declare-fun res!698916 () Bool)

(assert (=> b!1049798 (=> res!698916 e!595649)))

(assert (=> b!1049798 (= res!698916 (bvsle lt!463660 i!1381))))

(declare-fun e!595652 () Bool)

(assert (=> b!1049798 e!595652))

(declare-fun res!698923 () Bool)

(assert (=> b!1049798 (=> (not res!698923) (not e!595652))))

(assert (=> b!1049798 (= res!698923 (= (select (store (arr!31814 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463660) k0!2747))))

(declare-fun b!1049799 () Bool)

(assert (=> b!1049799 (= e!595649 e!595647)))

(declare-fun res!698927 () Bool)

(assert (=> b!1049799 (=> res!698927 e!595647)))

(assert (=> b!1049799 (= res!698927 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32350 a!3488)))))

(assert (=> b!1049799 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34348 0))(
  ( (Unit!34349) )
))
(declare-fun lt!463661 () Unit!34348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34348)

(assert (=> b!1049799 (= lt!463661 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463660 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049799 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22123)))

(declare-fun lt!463658 () Unit!34348)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66149 (_ BitVec 32) (_ BitVec 32)) Unit!34348)

(assert (=> b!1049799 (= lt!463658 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049800 () Bool)

(assert (=> b!1049800 (= e!595652 e!595651)))

(declare-fun res!698926 () Bool)

(assert (=> b!1049800 (=> res!698926 e!595651)))

(assert (=> b!1049800 (= res!698926 (bvsle lt!463660 i!1381))))

(declare-fun b!1049801 () Bool)

(assert (=> b!1049801 (= e!595648 e!595650)))

(declare-fun res!698924 () Bool)

(assert (=> b!1049801 (=> (not res!698924) (not e!595650))))

(assert (=> b!1049801 (= res!698924 (not (= lt!463660 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66149 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049801 (= lt!463660 (arrayScanForKey!0 lt!463659 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92348 res!698922) b!1049792))

(assert (= (and b!1049792 res!698925) b!1049793))

(assert (= (and b!1049793 res!698918) b!1049796))

(assert (= (and b!1049796 res!698917) b!1049795))

(assert (= (and b!1049795 res!698919) b!1049801))

(assert (= (and b!1049801 res!698924) b!1049798))

(assert (= (and b!1049798 res!698923) b!1049800))

(assert (= (and b!1049800 (not res!698926)) b!1049791))

(assert (= (and b!1049798 (not res!698916)) b!1049799))

(assert (= (and b!1049799 (not res!698927)) b!1049797))

(assert (= (and b!1049797 (not res!698920)) b!1049790))

(assert (= (and b!1049790 (not res!698921)) b!1049794))

(declare-fun m!970513 () Bool)

(assert (=> b!1049801 m!970513))

(declare-fun m!970515 () Bool)

(assert (=> b!1049799 m!970515))

(declare-fun m!970517 () Bool)

(assert (=> b!1049799 m!970517))

(declare-fun m!970519 () Bool)

(assert (=> b!1049799 m!970519))

(declare-fun m!970521 () Bool)

(assert (=> b!1049799 m!970521))

(declare-fun m!970523 () Bool)

(assert (=> b!1049790 m!970523))

(declare-fun m!970525 () Bool)

(assert (=> b!1049797 m!970525))

(declare-fun m!970527 () Bool)

(assert (=> b!1049793 m!970527))

(declare-fun m!970529 () Bool)

(assert (=> b!1049795 m!970529))

(declare-fun m!970531 () Bool)

(assert (=> b!1049795 m!970531))

(declare-fun m!970533 () Bool)

(assert (=> b!1049791 m!970533))

(declare-fun m!970535 () Bool)

(assert (=> b!1049796 m!970535))

(declare-fun m!970537 () Bool)

(assert (=> start!92348 m!970537))

(assert (=> b!1049798 m!970531))

(declare-fun m!970539 () Bool)

(assert (=> b!1049798 m!970539))

(declare-fun m!970541 () Bool)

(assert (=> b!1049792 m!970541))

(declare-fun m!970543 () Bool)

(assert (=> b!1049794 m!970543))

(check-sat (not b!1049794) (not b!1049790) (not b!1049795) (not start!92348) (not b!1049793) (not b!1049792) (not b!1049799) (not b!1049797) (not b!1049801) (not b!1049791))
