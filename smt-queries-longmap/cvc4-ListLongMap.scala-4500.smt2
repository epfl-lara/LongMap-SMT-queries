; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62472 () Bool)

(assert start!62472)

(declare-fun b!702836 () Bool)

(declare-fun res!466656 () Bool)

(declare-fun e!397546 () Bool)

(assert (=> b!702836 (=> (not res!466656) (not e!397546))))

(declare-datatypes ((List!13273 0))(
  ( (Nil!13270) (Cons!13269 (h!14314 (_ BitVec 64)) (t!19555 List!13273)) )
))
(declare-fun acc!652 () List!13273)

(declare-fun newAcc!49 () List!13273)

(declare-fun subseq!295 (List!13273 List!13273) Bool)

(assert (=> b!702836 (= res!466656 (subseq!295 acc!652 newAcc!49))))

(declare-fun b!702837 () Bool)

(declare-fun res!466654 () Bool)

(assert (=> b!702837 (=> (not res!466654) (not e!397546))))

(declare-datatypes ((array!40151 0))(
  ( (array!40152 (arr!19232 (Array (_ BitVec 32) (_ BitVec 64))) (size!19617 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40151)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40151 (_ BitVec 32) List!13273) Bool)

(assert (=> b!702837 (= res!466654 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702838 () Bool)

(declare-fun res!466668 () Bool)

(declare-fun e!397545 () Bool)

(assert (=> b!702838 (=> (not res!466668) (not e!397545))))

(declare-fun lt!317740 () List!13273)

(declare-fun noDuplicate!1097 (List!13273) Bool)

(assert (=> b!702838 (= res!466668 (noDuplicate!1097 lt!317740))))

(declare-fun b!702839 () Bool)

(declare-fun res!466670 () Bool)

(assert (=> b!702839 (=> (not res!466670) (not e!397545))))

(declare-fun lt!317742 () List!13273)

(declare-fun contains!3850 (List!13273 (_ BitVec 64)) Bool)

(assert (=> b!702839 (= res!466670 (not (contains!3850 lt!317742 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702840 () Bool)

(declare-fun res!466669 () Bool)

(assert (=> b!702840 (=> (not res!466669) (not e!397546))))

(assert (=> b!702840 (= res!466669 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19617 a!3591)))))

(declare-fun b!702841 () Bool)

(declare-fun res!466659 () Bool)

(assert (=> b!702841 (=> (not res!466659) (not e!397546))))

(assert (=> b!702841 (= res!466659 (noDuplicate!1097 acc!652))))

(declare-fun b!702842 () Bool)

(declare-fun res!466651 () Bool)

(assert (=> b!702842 (=> (not res!466651) (not e!397546))))

(assert (=> b!702842 (= res!466651 (not (contains!3850 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702843 () Bool)

(declare-fun res!466658 () Bool)

(assert (=> b!702843 (=> (not res!466658) (not e!397546))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!702843 (= res!466658 (not (contains!3850 acc!652 k!2824)))))

(declare-fun b!702844 () Bool)

(declare-fun res!466649 () Bool)

(assert (=> b!702844 (=> (not res!466649) (not e!397545))))

(declare-fun -!260 (List!13273 (_ BitVec 64)) List!13273)

(assert (=> b!702844 (= res!466649 (= (-!260 lt!317740 k!2824) lt!317742))))

(declare-fun b!702845 () Bool)

(declare-fun res!466660 () Bool)

(assert (=> b!702845 (=> (not res!466660) (not e!397545))))

(assert (=> b!702845 (= res!466660 (noDuplicate!1097 lt!317742))))

(declare-fun b!702846 () Bool)

(declare-fun res!466650 () Bool)

(assert (=> b!702846 (=> (not res!466650) (not e!397546))))

(declare-fun arrayContainsKey!0 (array!40151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702846 (= res!466650 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!702848 () Bool)

(declare-fun res!466661 () Bool)

(assert (=> b!702848 (=> (not res!466661) (not e!397545))))

(assert (=> b!702848 (= res!466661 (not (contains!3850 lt!317742 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702849 () Bool)

(declare-fun res!466646 () Bool)

(assert (=> b!702849 (=> (not res!466646) (not e!397546))))

(assert (=> b!702849 (= res!466646 (not (contains!3850 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702850 () Bool)

(declare-fun res!466666 () Bool)

(assert (=> b!702850 (=> (not res!466666) (not e!397546))))

(assert (=> b!702850 (= res!466666 (not (contains!3850 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702851 () Bool)

(declare-fun res!466664 () Bool)

(assert (=> b!702851 (=> (not res!466664) (not e!397545))))

(assert (=> b!702851 (= res!466664 (not (contains!3850 lt!317740 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702852 () Bool)

(assert (=> b!702852 (= e!397545 (not true))))

(assert (=> b!702852 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317740)))

(declare-datatypes ((Unit!24598 0))(
  ( (Unit!24599) )
))
(declare-fun lt!317741 () Unit!24598)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40151 (_ BitVec 64) (_ BitVec 32) List!13273 List!13273) Unit!24598)

(assert (=> b!702852 (= lt!317741 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317742 lt!317740))))

(declare-fun b!702853 () Bool)

(declare-fun res!466648 () Bool)

(assert (=> b!702853 (=> (not res!466648) (not e!397545))))

(assert (=> b!702853 (= res!466648 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317742))))

(declare-fun b!702854 () Bool)

(declare-fun res!466673 () Bool)

(assert (=> b!702854 (=> (not res!466673) (not e!397546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702854 (= res!466673 (validKeyInArray!0 (select (arr!19232 a!3591) from!2969)))))

(declare-fun b!702855 () Bool)

(declare-fun res!466665 () Bool)

(assert (=> b!702855 (=> (not res!466665) (not e!397545))))

(assert (=> b!702855 (= res!466665 (not (contains!3850 lt!317740 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702856 () Bool)

(declare-fun res!466653 () Bool)

(assert (=> b!702856 (=> (not res!466653) (not e!397546))))

(assert (=> b!702856 (= res!466653 (validKeyInArray!0 k!2824))))

(declare-fun b!702857 () Bool)

(declare-fun res!466652 () Bool)

(assert (=> b!702857 (=> (not res!466652) (not e!397546))))

(assert (=> b!702857 (= res!466652 (noDuplicate!1097 newAcc!49))))

(declare-fun b!702858 () Bool)

(declare-fun res!466672 () Bool)

(assert (=> b!702858 (=> (not res!466672) (not e!397546))))

(assert (=> b!702858 (= res!466672 (contains!3850 newAcc!49 k!2824))))

(declare-fun b!702859 () Bool)

(declare-fun res!466674 () Bool)

(assert (=> b!702859 (=> (not res!466674) (not e!397546))))

(assert (=> b!702859 (= res!466674 (not (contains!3850 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702860 () Bool)

(assert (=> b!702860 (= e!397546 e!397545)))

(declare-fun res!466647 () Bool)

(assert (=> b!702860 (=> (not res!466647) (not e!397545))))

(assert (=> b!702860 (= res!466647 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!493 (List!13273 (_ BitVec 64)) List!13273)

(assert (=> b!702860 (= lt!317740 ($colon$colon!493 newAcc!49 (select (arr!19232 a!3591) from!2969)))))

(assert (=> b!702860 (= lt!317742 ($colon$colon!493 acc!652 (select (arr!19232 a!3591) from!2969)))))

(declare-fun b!702861 () Bool)

(declare-fun res!466667 () Bool)

(assert (=> b!702861 (=> (not res!466667) (not e!397545))))

(assert (=> b!702861 (= res!466667 (not (contains!3850 lt!317742 k!2824)))))

(declare-fun b!702862 () Bool)

(declare-fun res!466655 () Bool)

(assert (=> b!702862 (=> (not res!466655) (not e!397546))))

(assert (=> b!702862 (= res!466655 (= (-!260 newAcc!49 k!2824) acc!652))))

(declare-fun b!702863 () Bool)

(declare-fun res!466671 () Bool)

(assert (=> b!702863 (=> (not res!466671) (not e!397545))))

(assert (=> b!702863 (= res!466671 (subseq!295 lt!317742 lt!317740))))

(declare-fun b!702864 () Bool)

(declare-fun res!466657 () Bool)

(assert (=> b!702864 (=> (not res!466657) (not e!397545))))

(assert (=> b!702864 (= res!466657 (contains!3850 lt!317740 k!2824))))

(declare-fun res!466662 () Bool)

(assert (=> start!62472 (=> (not res!466662) (not e!397546))))

(assert (=> start!62472 (= res!466662 (and (bvslt (size!19617 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19617 a!3591))))))

(assert (=> start!62472 e!397546))

(assert (=> start!62472 true))

(declare-fun array_inv!15028 (array!40151) Bool)

(assert (=> start!62472 (array_inv!15028 a!3591)))

(declare-fun b!702847 () Bool)

(declare-fun res!466663 () Bool)

(assert (=> b!702847 (=> (not res!466663) (not e!397545))))

(assert (=> b!702847 (= res!466663 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and start!62472 res!466662) b!702841))

(assert (= (and b!702841 res!466659) b!702857))

(assert (= (and b!702857 res!466652) b!702859))

(assert (= (and b!702859 res!466674) b!702849))

(assert (= (and b!702849 res!466646) b!702846))

(assert (= (and b!702846 res!466650) b!702843))

(assert (= (and b!702843 res!466658) b!702856))

(assert (= (and b!702856 res!466653) b!702837))

(assert (= (and b!702837 res!466654) b!702836))

(assert (= (and b!702836 res!466656) b!702858))

(assert (= (and b!702858 res!466672) b!702862))

(assert (= (and b!702862 res!466655) b!702850))

(assert (= (and b!702850 res!466666) b!702842))

(assert (= (and b!702842 res!466651) b!702840))

(assert (= (and b!702840 res!466669) b!702854))

(assert (= (and b!702854 res!466673) b!702860))

(assert (= (and b!702860 res!466647) b!702845))

(assert (= (and b!702845 res!466660) b!702838))

(assert (= (and b!702838 res!466668) b!702848))

(assert (= (and b!702848 res!466661) b!702839))

(assert (= (and b!702839 res!466670) b!702847))

(assert (= (and b!702847 res!466663) b!702861))

(assert (= (and b!702861 res!466667) b!702853))

(assert (= (and b!702853 res!466648) b!702863))

(assert (= (and b!702863 res!466671) b!702864))

(assert (= (and b!702864 res!466657) b!702844))

(assert (= (and b!702844 res!466649) b!702851))

(assert (= (and b!702851 res!466664) b!702855))

(assert (= (and b!702855 res!466665) b!702852))

(declare-fun m!661827 () Bool)

(assert (=> b!702852 m!661827))

(declare-fun m!661829 () Bool)

(assert (=> b!702852 m!661829))

(declare-fun m!661831 () Bool)

(assert (=> b!702843 m!661831))

(declare-fun m!661833 () Bool)

(assert (=> b!702845 m!661833))

(declare-fun m!661835 () Bool)

(assert (=> b!702846 m!661835))

(declare-fun m!661837 () Bool)

(assert (=> b!702863 m!661837))

(declare-fun m!661839 () Bool)

(assert (=> b!702864 m!661839))

(declare-fun m!661841 () Bool)

(assert (=> b!702842 m!661841))

(declare-fun m!661843 () Bool)

(assert (=> b!702859 m!661843))

(declare-fun m!661845 () Bool)

(assert (=> b!702838 m!661845))

(declare-fun m!661847 () Bool)

(assert (=> b!702854 m!661847))

(assert (=> b!702854 m!661847))

(declare-fun m!661849 () Bool)

(assert (=> b!702854 m!661849))

(declare-fun m!661851 () Bool)

(assert (=> b!702841 m!661851))

(declare-fun m!661853 () Bool)

(assert (=> b!702847 m!661853))

(declare-fun m!661855 () Bool)

(assert (=> b!702853 m!661855))

(declare-fun m!661857 () Bool)

(assert (=> b!702836 m!661857))

(declare-fun m!661859 () Bool)

(assert (=> start!62472 m!661859))

(declare-fun m!661861 () Bool)

(assert (=> b!702851 m!661861))

(declare-fun m!661863 () Bool)

(assert (=> b!702839 m!661863))

(assert (=> b!702860 m!661847))

(assert (=> b!702860 m!661847))

(declare-fun m!661865 () Bool)

(assert (=> b!702860 m!661865))

(assert (=> b!702860 m!661847))

(declare-fun m!661867 () Bool)

(assert (=> b!702860 m!661867))

(declare-fun m!661869 () Bool)

(assert (=> b!702862 m!661869))

(declare-fun m!661871 () Bool)

(assert (=> b!702857 m!661871))

(declare-fun m!661873 () Bool)

(assert (=> b!702858 m!661873))

(declare-fun m!661875 () Bool)

(assert (=> b!702855 m!661875))

(declare-fun m!661877 () Bool)

(assert (=> b!702849 m!661877))

(declare-fun m!661879 () Bool)

(assert (=> b!702837 m!661879))

(declare-fun m!661881 () Bool)

(assert (=> b!702861 m!661881))

(declare-fun m!661883 () Bool)

(assert (=> b!702856 m!661883))

(declare-fun m!661885 () Bool)

(assert (=> b!702850 m!661885))

(declare-fun m!661887 () Bool)

(assert (=> b!702848 m!661887))

(declare-fun m!661889 () Bool)

(assert (=> b!702844 m!661889))

(push 1)

