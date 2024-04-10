; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62048 () Bool)

(assert start!62048)

(declare-fun b!694704 () Bool)

(declare-datatypes ((Unit!24546 0))(
  ( (Unit!24547) )
))
(declare-fun e!395141 () Unit!24546)

(declare-fun Unit!24548 () Unit!24546)

(assert (=> b!694704 (= e!395141 Unit!24548)))

(declare-fun b!694705 () Bool)

(declare-fun res!458740 () Bool)

(declare-fun e!395146 () Bool)

(assert (=> b!694705 (=> (not res!458740) (not e!395146))))

(declare-datatypes ((array!39889 0))(
  ( (array!39890 (arr!19107 (Array (_ BitVec 32) (_ BitVec 64))) (size!19492 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39889)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694705 (= res!458740 (validKeyInArray!0 (select (arr!19107 a!3626) from!3004)))))

(declare-fun b!694706 () Bool)

(declare-fun res!458726 () Bool)

(assert (=> b!694706 (=> (not res!458726) (not e!395146))))

(declare-datatypes ((List!13148 0))(
  ( (Nil!13145) (Cons!13144 (h!14189 (_ BitVec 64)) (t!19427 List!13148)) )
))
(declare-fun arrayNoDuplicates!0 (array!39889 (_ BitVec 32) List!13148) Bool)

(assert (=> b!694706 (= res!458726 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13145))))

(declare-fun b!694707 () Bool)

(declare-fun e!395144 () Bool)

(declare-fun e!395145 () Bool)

(assert (=> b!694707 (= e!395144 e!395145)))

(declare-fun res!458747 () Bool)

(assert (=> b!694707 (=> (not res!458747) (not e!395145))))

(assert (=> b!694707 (= res!458747 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!13148)

(declare-fun lt!316938 () List!13148)

(declare-fun $colon$colon!437 (List!13148 (_ BitVec 64)) List!13148)

(assert (=> b!694707 (= lt!316938 ($colon$colon!437 acc!681 (select (arr!19107 a!3626) from!3004)))))

(declare-fun b!694708 () Bool)

(declare-fun e!395142 () Bool)

(declare-fun e!395151 () Bool)

(assert (=> b!694708 (= e!395142 e!395151)))

(declare-fun res!458744 () Bool)

(assert (=> b!694708 (=> (not res!458744) (not e!395151))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694708 (= res!458744 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694710 () Bool)

(declare-fun res!458729 () Bool)

(assert (=> b!694710 (=> (not res!458729) (not e!395146))))

(declare-fun contains!3725 (List!13148 (_ BitVec 64)) Bool)

(assert (=> b!694710 (= res!458729 (not (contains!3725 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694711 () Bool)

(assert (=> b!694711 (= e!395146 e!395144)))

(declare-fun res!458730 () Bool)

(assert (=> b!694711 (=> (not res!458730) (not e!395144))))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!694711 (= res!458730 (not (= (select (arr!19107 a!3626) from!3004) k!2843)))))

(declare-fun lt!316936 () Unit!24546)

(assert (=> b!694711 (= lt!316936 e!395141)))

(declare-fun c!78356 () Bool)

(assert (=> b!694711 (= c!78356 (= (select (arr!19107 a!3626) from!3004) k!2843))))

(declare-fun b!694712 () Bool)

(declare-fun e!395149 () Bool)

(declare-fun e!395147 () Bool)

(assert (=> b!694712 (= e!395149 e!395147)))

(declare-fun res!458742 () Bool)

(assert (=> b!694712 (=> (not res!458742) (not e!395147))))

(assert (=> b!694712 (= res!458742 (bvsle from!3004 i!1382))))

(declare-fun b!694713 () Bool)

(declare-fun res!458741 () Bool)

(assert (=> b!694713 (=> (not res!458741) (not e!395146))))

(assert (=> b!694713 (= res!458741 (validKeyInArray!0 k!2843))))

(declare-fun b!694714 () Bool)

(declare-fun res!458727 () Bool)

(assert (=> b!694714 (=> (not res!458727) (not e!395145))))

(assert (=> b!694714 (= res!458727 e!395142)))

(declare-fun res!458746 () Bool)

(assert (=> b!694714 (=> res!458746 e!395142)))

(declare-fun e!395143 () Bool)

(assert (=> b!694714 (= res!458746 e!395143)))

(declare-fun res!458737 () Bool)

(assert (=> b!694714 (=> (not res!458737) (not e!395143))))

(assert (=> b!694714 (= res!458737 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694715 () Bool)

(declare-fun res!458735 () Bool)

(assert (=> b!694715 (=> (not res!458735) (not e!395145))))

(assert (=> b!694715 (= res!458735 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316938))))

(declare-fun b!694716 () Bool)

(declare-fun Unit!24549 () Unit!24546)

(assert (=> b!694716 (= e!395141 Unit!24549)))

(declare-fun arrayContainsKey!0 (array!39889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694716 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316939 () Unit!24546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39889 (_ BitVec 64) (_ BitVec 32)) Unit!24546)

(assert (=> b!694716 (= lt!316939 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694716 false))

(declare-fun b!694717 () Bool)

(declare-fun res!458731 () Bool)

(assert (=> b!694717 (=> (not res!458731) (not e!395145))))

(assert (=> b!694717 (= res!458731 (not (contains!3725 lt!316938 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694718 () Bool)

(assert (=> b!694718 (= e!395147 (not (contains!3725 acc!681 k!2843)))))

(declare-fun b!694719 () Bool)

(declare-fun res!458738 () Bool)

(assert (=> b!694719 (=> (not res!458738) (not e!395146))))

(assert (=> b!694719 (= res!458738 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694720 () Bool)

(declare-fun res!458733 () Bool)

(assert (=> b!694720 (=> (not res!458733) (not e!395146))))

(declare-fun noDuplicate!972 (List!13148) Bool)

(assert (=> b!694720 (= res!458733 (noDuplicate!972 acc!681))))

(declare-fun b!694721 () Bool)

(declare-fun res!458749 () Bool)

(assert (=> b!694721 (=> (not res!458749) (not e!395145))))

(assert (=> b!694721 (= res!458749 (noDuplicate!972 lt!316938))))

(declare-fun b!694722 () Bool)

(declare-fun res!458739 () Bool)

(assert (=> b!694722 (=> (not res!458739) (not e!395146))))

(assert (=> b!694722 (= res!458739 (not (contains!3725 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694723 () Bool)

(declare-fun res!458750 () Bool)

(assert (=> b!694723 (=> (not res!458750) (not e!395146))))

(assert (=> b!694723 (= res!458750 e!395149)))

(declare-fun res!458732 () Bool)

(assert (=> b!694723 (=> res!458732 e!395149)))

(declare-fun e!395148 () Bool)

(assert (=> b!694723 (= res!458732 e!395148)))

(declare-fun res!458734 () Bool)

(assert (=> b!694723 (=> (not res!458734) (not e!395148))))

(assert (=> b!694723 (= res!458734 (bvsgt from!3004 i!1382))))

(declare-fun b!694724 () Bool)

(assert (=> b!694724 (= e!395151 (not (contains!3725 lt!316938 k!2843)))))

(declare-fun b!694725 () Bool)

(assert (=> b!694725 (= e!395148 (contains!3725 acc!681 k!2843))))

(declare-fun b!694726 () Bool)

(assert (=> b!694726 (= e!395145 (not true))))

(assert (=> b!694726 (arrayNoDuplicates!0 (array!39890 (store (arr!19107 a!3626) i!1382 k!2843) (size!19492 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316938)))

(declare-fun lt!316937 () Unit!24546)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39889 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13148) Unit!24546)

(assert (=> b!694726 (= lt!316937 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316938))))

(declare-fun res!458743 () Bool)

(assert (=> start!62048 (=> (not res!458743) (not e!395146))))

(assert (=> start!62048 (= res!458743 (and (bvslt (size!19492 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19492 a!3626))))))

(assert (=> start!62048 e!395146))

(assert (=> start!62048 true))

(declare-fun array_inv!14903 (array!39889) Bool)

(assert (=> start!62048 (array_inv!14903 a!3626)))

(declare-fun b!694709 () Bool)

(declare-fun res!458748 () Bool)

(assert (=> b!694709 (=> (not res!458748) (not e!395146))))

(assert (=> b!694709 (= res!458748 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694727 () Bool)

(declare-fun res!458736 () Bool)

(assert (=> b!694727 (=> (not res!458736) (not e!395145))))

(assert (=> b!694727 (= res!458736 (not (contains!3725 lt!316938 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694728 () Bool)

(declare-fun res!458728 () Bool)

(assert (=> b!694728 (=> (not res!458728) (not e!395146))))

(assert (=> b!694728 (= res!458728 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19492 a!3626))))))

(declare-fun b!694729 () Bool)

(declare-fun res!458745 () Bool)

(assert (=> b!694729 (=> (not res!458745) (not e!395146))))

(assert (=> b!694729 (= res!458745 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19492 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694730 () Bool)

(assert (=> b!694730 (= e!395143 (contains!3725 lt!316938 k!2843))))

(assert (= (and start!62048 res!458743) b!694720))

(assert (= (and b!694720 res!458733) b!694722))

(assert (= (and b!694722 res!458739) b!694710))

(assert (= (and b!694710 res!458729) b!694723))

(assert (= (and b!694723 res!458734) b!694725))

(assert (= (and b!694723 (not res!458732)) b!694712))

(assert (= (and b!694712 res!458742) b!694718))

(assert (= (and b!694723 res!458750) b!694706))

(assert (= (and b!694706 res!458726) b!694709))

(assert (= (and b!694709 res!458748) b!694728))

(assert (= (and b!694728 res!458728) b!694713))

(assert (= (and b!694713 res!458741) b!694719))

(assert (= (and b!694719 res!458738) b!694729))

(assert (= (and b!694729 res!458745) b!694705))

(assert (= (and b!694705 res!458740) b!694711))

(assert (= (and b!694711 c!78356) b!694716))

(assert (= (and b!694711 (not c!78356)) b!694704))

(assert (= (and b!694711 res!458730) b!694707))

(assert (= (and b!694707 res!458747) b!694721))

(assert (= (and b!694721 res!458749) b!694717))

(assert (= (and b!694717 res!458731) b!694727))

(assert (= (and b!694727 res!458736) b!694714))

(assert (= (and b!694714 res!458737) b!694730))

(assert (= (and b!694714 (not res!458746)) b!694708))

(assert (= (and b!694708 res!458744) b!694724))

(assert (= (and b!694714 res!458727) b!694715))

(assert (= (and b!694715 res!458735) b!694726))

(declare-fun m!656393 () Bool)

(assert (=> b!694722 m!656393))

(declare-fun m!656395 () Bool)

(assert (=> b!694721 m!656395))

(declare-fun m!656397 () Bool)

(assert (=> b!694726 m!656397))

(declare-fun m!656399 () Bool)

(assert (=> b!694726 m!656399))

(declare-fun m!656401 () Bool)

(assert (=> b!694726 m!656401))

(declare-fun m!656403 () Bool)

(assert (=> b!694720 m!656403))

(declare-fun m!656405 () Bool)

(assert (=> b!694707 m!656405))

(assert (=> b!694707 m!656405))

(declare-fun m!656407 () Bool)

(assert (=> b!694707 m!656407))

(assert (=> b!694711 m!656405))

(declare-fun m!656409 () Bool)

(assert (=> b!694706 m!656409))

(declare-fun m!656411 () Bool)

(assert (=> b!694730 m!656411))

(assert (=> b!694724 m!656411))

(declare-fun m!656413 () Bool)

(assert (=> b!694719 m!656413))

(declare-fun m!656415 () Bool)

(assert (=> b!694725 m!656415))

(declare-fun m!656417 () Bool)

(assert (=> start!62048 m!656417))

(declare-fun m!656419 () Bool)

(assert (=> b!694717 m!656419))

(declare-fun m!656421 () Bool)

(assert (=> b!694716 m!656421))

(declare-fun m!656423 () Bool)

(assert (=> b!694716 m!656423))

(declare-fun m!656425 () Bool)

(assert (=> b!694713 m!656425))

(declare-fun m!656427 () Bool)

(assert (=> b!694709 m!656427))

(assert (=> b!694705 m!656405))

(assert (=> b!694705 m!656405))

(declare-fun m!656429 () Bool)

(assert (=> b!694705 m!656429))

(declare-fun m!656431 () Bool)

(assert (=> b!694727 m!656431))

(declare-fun m!656433 () Bool)

(assert (=> b!694710 m!656433))

(assert (=> b!694718 m!656415))

(declare-fun m!656435 () Bool)

(assert (=> b!694715 m!656435))

(push 1)

