; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104122 () Bool)

(assert start!104122)

(declare-fun b!1244681 () Bool)

(declare-fun res!829674 () Bool)

(declare-fun e!705775 () Bool)

(assert (=> b!1244681 (=> (not res!829674) (not e!705775))))

(declare-datatypes ((List!27410 0))(
  ( (Nil!27407) (Cons!27406 (h!28624 (_ BitVec 64)) (t!40871 List!27410)) )
))
(declare-fun lt!562852 () List!27410)

(declare-fun subseq!632 (List!27410 List!27410) Bool)

(assert (=> b!1244681 (= res!829674 (subseq!632 Nil!27407 lt!562852))))

(declare-fun b!1244682 () Bool)

(declare-fun res!829676 () Bool)

(declare-fun e!705774 () Bool)

(assert (=> b!1244682 (=> (not res!829676) (not e!705774))))

(declare-datatypes ((array!80013 0))(
  ( (array!80014 (arr!38594 (Array (_ BitVec 32) (_ BitVec 64))) (size!39131 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80013)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244682 (= res!829676 (validKeyInArray!0 (select (arr!38594 a!3892) from!3270)))))

(declare-fun res!829672 () Bool)

(assert (=> start!104122 (=> (not res!829672) (not e!705774))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104122 (= res!829672 (and (bvslt (size!39131 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39131 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39131 a!3892))))))

(assert (=> start!104122 e!705774))

(declare-fun array_inv!29532 (array!80013) Bool)

(assert (=> start!104122 (array_inv!29532 a!3892)))

(assert (=> start!104122 true))

(declare-fun b!1244683 () Bool)

(declare-fun res!829670 () Bool)

(assert (=> b!1244683 (=> (not res!829670) (not e!705775))))

(declare-fun contains!7440 (List!27410 (_ BitVec 64)) Bool)

(assert (=> b!1244683 (= res!829670 (not (contains!7440 lt!562852 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244684 () Bool)

(declare-fun res!829669 () Bool)

(assert (=> b!1244684 (=> (not res!829669) (not e!705775))))

(assert (=> b!1244684 (= res!829669 (not (contains!7440 lt!562852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244685 () Bool)

(declare-fun res!829675 () Bool)

(assert (=> b!1244685 (=> (not res!829675) (not e!705774))))

(assert (=> b!1244685 (= res!829675 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39131 a!3892)) (not (= newFrom!287 (size!39131 a!3892)))))))

(declare-fun b!1244686 () Bool)

(declare-fun res!829671 () Bool)

(assert (=> b!1244686 (=> (not res!829671) (not e!705775))))

(assert (=> b!1244686 (= res!829671 (not (contains!7440 Nil!27407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244687 () Bool)

(declare-fun res!829668 () Bool)

(assert (=> b!1244687 (=> (not res!829668) (not e!705775))))

(declare-fun noDuplicate!2002 (List!27410) Bool)

(assert (=> b!1244687 (= res!829668 (noDuplicate!2002 lt!562852))))

(declare-fun b!1244688 () Bool)

(declare-fun res!829677 () Bool)

(assert (=> b!1244688 (=> (not res!829677) (not e!705774))))

(declare-fun arrayNoDuplicates!0 (array!80013 (_ BitVec 32) List!27410) Bool)

(assert (=> b!1244688 (= res!829677 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27407))))

(declare-fun b!1244689 () Bool)

(declare-fun res!829667 () Bool)

(assert (=> b!1244689 (=> (not res!829667) (not e!705775))))

(assert (=> b!1244689 (= res!829667 (not (contains!7440 Nil!27407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244690 () Bool)

(assert (=> b!1244690 (= e!705774 e!705775)))

(declare-fun res!829673 () Bool)

(assert (=> b!1244690 (=> (not res!829673) (not e!705775))))

(assert (=> b!1244690 (= res!829673 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1244690 (= lt!562852 (Cons!27406 (select (arr!38594 a!3892) from!3270) Nil!27407))))

(declare-fun b!1244691 () Bool)

(assert (=> b!1244691 (= e!705775 false)))

(declare-fun lt!562853 () Bool)

(assert (=> b!1244691 (= lt!562853 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562852))))

(declare-datatypes ((Unit!41246 0))(
  ( (Unit!41247) )
))
(declare-fun lt!562851 () Unit!41246)

(declare-fun noDuplicateSubseq!86 (List!27410 List!27410) Unit!41246)

(assert (=> b!1244691 (= lt!562851 (noDuplicateSubseq!86 Nil!27407 lt!562852))))

(assert (= (and start!104122 res!829672) b!1244688))

(assert (= (and b!1244688 res!829677) b!1244685))

(assert (= (and b!1244685 res!829675) b!1244682))

(assert (= (and b!1244682 res!829676) b!1244690))

(assert (= (and b!1244690 res!829673) b!1244687))

(assert (= (and b!1244687 res!829668) b!1244684))

(assert (= (and b!1244684 res!829669) b!1244683))

(assert (= (and b!1244683 res!829670) b!1244689))

(assert (= (and b!1244689 res!829667) b!1244686))

(assert (= (and b!1244686 res!829671) b!1244681))

(assert (= (and b!1244681 res!829674) b!1244691))

(declare-fun m!1147579 () Bool)

(assert (=> b!1244691 m!1147579))

(declare-fun m!1147581 () Bool)

(assert (=> b!1244691 m!1147581))

(declare-fun m!1147583 () Bool)

(assert (=> b!1244687 m!1147583))

(declare-fun m!1147585 () Bool)

(assert (=> b!1244681 m!1147585))

(declare-fun m!1147587 () Bool)

(assert (=> start!104122 m!1147587))

(declare-fun m!1147589 () Bool)

(assert (=> b!1244688 m!1147589))

(declare-fun m!1147591 () Bool)

(assert (=> b!1244686 m!1147591))

(declare-fun m!1147593 () Bool)

(assert (=> b!1244684 m!1147593))

(declare-fun m!1147595 () Bool)

(assert (=> b!1244682 m!1147595))

(assert (=> b!1244682 m!1147595))

(declare-fun m!1147597 () Bool)

(assert (=> b!1244682 m!1147597))

(assert (=> b!1244690 m!1147595))

(declare-fun m!1147599 () Bool)

(assert (=> b!1244689 m!1147599))

(declare-fun m!1147601 () Bool)

(assert (=> b!1244683 m!1147601))

(check-sat (not b!1244688) (not b!1244686) (not b!1244687) (not b!1244683) (not b!1244691) (not start!104122) (not b!1244682) (not b!1244689) (not b!1244681) (not b!1244684))
(check-sat)
