; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104128 () Bool)

(assert start!104128)

(declare-fun b!1244780 () Bool)

(declare-fun res!829767 () Bool)

(declare-fun e!705801 () Bool)

(assert (=> b!1244780 (=> (not res!829767) (not e!705801))))

(declare-datatypes ((List!27413 0))(
  ( (Nil!27410) (Cons!27409 (h!28627 (_ BitVec 64)) (t!40874 List!27413)) )
))
(declare-fun contains!7443 (List!27413 (_ BitVec 64)) Bool)

(assert (=> b!1244780 (= res!829767 (not (contains!7443 Nil!27410 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244781 () Bool)

(declare-fun res!829768 () Bool)

(declare-fun e!705802 () Bool)

(assert (=> b!1244781 (=> (not res!829768) (not e!705802))))

(declare-datatypes ((array!80019 0))(
  ( (array!80020 (arr!38597 (Array (_ BitVec 32) (_ BitVec 64))) (size!39134 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80019)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!80019 (_ BitVec 32) List!27413) Bool)

(assert (=> b!1244781 (= res!829768 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27410))))

(declare-fun res!829773 () Bool)

(assert (=> start!104128 (=> (not res!829773) (not e!705802))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104128 (= res!829773 (and (bvslt (size!39134 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39134 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39134 a!3892))))))

(assert (=> start!104128 e!705802))

(declare-fun array_inv!29535 (array!80019) Bool)

(assert (=> start!104128 (array_inv!29535 a!3892)))

(assert (=> start!104128 true))

(declare-fun b!1244782 () Bool)

(assert (=> b!1244782 (= e!705801 false)))

(declare-fun lt!562880 () Bool)

(declare-fun lt!562879 () List!27413)

(assert (=> b!1244782 (= lt!562880 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562879))))

(declare-datatypes ((Unit!41252 0))(
  ( (Unit!41253) )
))
(declare-fun lt!562878 () Unit!41252)

(declare-fun noDuplicateSubseq!89 (List!27413 List!27413) Unit!41252)

(assert (=> b!1244782 (= lt!562878 (noDuplicateSubseq!89 Nil!27410 lt!562879))))

(declare-fun b!1244783 () Bool)

(assert (=> b!1244783 (= e!705802 e!705801)))

(declare-fun res!829769 () Bool)

(assert (=> b!1244783 (=> (not res!829769) (not e!705801))))

(assert (=> b!1244783 (= res!829769 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1244783 (= lt!562879 (Cons!27409 (select (arr!38597 a!3892) from!3270) Nil!27410))))

(declare-fun b!1244784 () Bool)

(declare-fun res!829774 () Bool)

(assert (=> b!1244784 (=> (not res!829774) (not e!705801))))

(assert (=> b!1244784 (= res!829774 (not (contains!7443 Nil!27410 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244785 () Bool)

(declare-fun res!829772 () Bool)

(assert (=> b!1244785 (=> (not res!829772) (not e!705801))))

(assert (=> b!1244785 (= res!829772 (not (contains!7443 lt!562879 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244786 () Bool)

(declare-fun res!829776 () Bool)

(assert (=> b!1244786 (=> (not res!829776) (not e!705802))))

(assert (=> b!1244786 (= res!829776 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39134 a!3892)) (not (= newFrom!287 (size!39134 a!3892)))))))

(declare-fun b!1244787 () Bool)

(declare-fun res!829771 () Bool)

(assert (=> b!1244787 (=> (not res!829771) (not e!705801))))

(declare-fun subseq!635 (List!27413 List!27413) Bool)

(assert (=> b!1244787 (= res!829771 (subseq!635 Nil!27410 lt!562879))))

(declare-fun b!1244788 () Bool)

(declare-fun res!829775 () Bool)

(assert (=> b!1244788 (=> (not res!829775) (not e!705802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244788 (= res!829775 (validKeyInArray!0 (select (arr!38597 a!3892) from!3270)))))

(declare-fun b!1244789 () Bool)

(declare-fun res!829766 () Bool)

(assert (=> b!1244789 (=> (not res!829766) (not e!705801))))

(assert (=> b!1244789 (= res!829766 (not (contains!7443 lt!562879 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244790 () Bool)

(declare-fun res!829770 () Bool)

(assert (=> b!1244790 (=> (not res!829770) (not e!705801))))

(declare-fun noDuplicate!2005 (List!27413) Bool)

(assert (=> b!1244790 (= res!829770 (noDuplicate!2005 lt!562879))))

(assert (= (and start!104128 res!829773) b!1244781))

(assert (= (and b!1244781 res!829768) b!1244786))

(assert (= (and b!1244786 res!829776) b!1244788))

(assert (= (and b!1244788 res!829775) b!1244783))

(assert (= (and b!1244783 res!829769) b!1244790))

(assert (= (and b!1244790 res!829770) b!1244789))

(assert (= (and b!1244789 res!829766) b!1244785))

(assert (= (and b!1244785 res!829772) b!1244780))

(assert (= (and b!1244780 res!829767) b!1244784))

(assert (= (and b!1244784 res!829774) b!1244787))

(assert (= (and b!1244787 res!829771) b!1244782))

(declare-fun m!1147651 () Bool)

(assert (=> b!1244789 m!1147651))

(declare-fun m!1147653 () Bool)

(assert (=> b!1244790 m!1147653))

(declare-fun m!1147655 () Bool)

(assert (=> b!1244782 m!1147655))

(declare-fun m!1147657 () Bool)

(assert (=> b!1244782 m!1147657))

(declare-fun m!1147659 () Bool)

(assert (=> b!1244784 m!1147659))

(declare-fun m!1147661 () Bool)

(assert (=> start!104128 m!1147661))

(declare-fun m!1147663 () Bool)

(assert (=> b!1244785 m!1147663))

(declare-fun m!1147665 () Bool)

(assert (=> b!1244780 m!1147665))

(declare-fun m!1147667 () Bool)

(assert (=> b!1244787 m!1147667))

(declare-fun m!1147669 () Bool)

(assert (=> b!1244783 m!1147669))

(declare-fun m!1147671 () Bool)

(assert (=> b!1244781 m!1147671))

(assert (=> b!1244788 m!1147669))

(assert (=> b!1244788 m!1147669))

(declare-fun m!1147673 () Bool)

(assert (=> b!1244788 m!1147673))

(check-sat (not b!1244782) (not b!1244785) (not start!104128) (not b!1244787) (not b!1244789) (not b!1244781) (not b!1244788) (not b!1244790) (not b!1244780) (not b!1244784))
(check-sat)
