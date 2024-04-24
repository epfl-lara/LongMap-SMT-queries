; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60030 () Bool)

(assert start!60030)

(declare-fun b!665752 () Bool)

(declare-fun res!433176 () Bool)

(declare-fun e!381532 () Bool)

(assert (=> b!665752 (=> res!433176 e!381532)))

(declare-datatypes ((List!12645 0))(
  ( (Nil!12642) (Cons!12641 (h!13689 (_ BitVec 64)) (t!18865 List!12645)) )
))
(declare-fun lt!310156 () List!12645)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3297 (List!12645 (_ BitVec 64)) Bool)

(assert (=> b!665752 (= res!433176 (not (contains!3297 lt!310156 k0!2843)))))

(declare-fun b!665753 () Bool)

(declare-fun res!433170 () Bool)

(assert (=> b!665753 (=> res!433170 e!381532)))

(declare-fun acc!681 () List!12645)

(declare-fun subseq!59 (List!12645 List!12645) Bool)

(assert (=> b!665753 (= res!433170 (not (subseq!59 acc!681 lt!310156)))))

(declare-fun b!665754 () Bool)

(declare-fun res!433157 () Bool)

(declare-fun e!381529 () Bool)

(assert (=> b!665754 (=> (not res!433157) (not e!381529))))

(declare-datatypes ((array!39015 0))(
  ( (array!39016 (arr!18697 (Array (_ BitVec 32) (_ BitVec 64))) (size!19061 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39015)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39015 (_ BitVec 32) List!12645) Bool)

(assert (=> b!665754 (= res!433157 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!433171 () Bool)

(assert (=> start!60030 (=> (not res!433171) (not e!381529))))

(assert (=> start!60030 (= res!433171 (and (bvslt (size!19061 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19061 a!3626))))))

(assert (=> start!60030 e!381529))

(assert (=> start!60030 true))

(declare-fun array_inv!14556 (array!39015) Bool)

(assert (=> start!60030 (array_inv!14556 a!3626)))

(declare-fun b!665755 () Bool)

(declare-fun res!433162 () Bool)

(assert (=> b!665755 (=> (not res!433162) (not e!381529))))

(assert (=> b!665755 (= res!433162 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12642))))

(declare-fun b!665756 () Bool)

(declare-fun e!381533 () Bool)

(declare-fun e!381528 () Bool)

(assert (=> b!665756 (= e!381533 e!381528)))

(declare-fun res!433164 () Bool)

(assert (=> b!665756 (=> (not res!433164) (not e!381528))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665756 (= res!433164 (bvsle from!3004 i!1382))))

(declare-fun b!665757 () Bool)

(declare-fun res!433158 () Bool)

(assert (=> b!665757 (=> res!433158 e!381532)))

(assert (=> b!665757 (= res!433158 (contains!3297 lt!310156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665758 () Bool)

(declare-fun res!433175 () Bool)

(assert (=> b!665758 (=> (not res!433175) (not e!381529))))

(declare-fun noDuplicate!571 (List!12645) Bool)

(assert (=> b!665758 (= res!433175 (noDuplicate!571 acc!681))))

(declare-fun b!665759 () Bool)

(assert (=> b!665759 (= e!381532 true)))

(declare-fun lt!310165 () Bool)

(assert (=> b!665759 (= lt!310165 (contains!3297 lt!310156 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665760 () Bool)

(declare-fun res!433169 () Bool)

(assert (=> b!665760 (=> res!433169 e!381532)))

(declare-fun lt!310163 () Bool)

(assert (=> b!665760 (= res!433169 lt!310163)))

(declare-fun b!665761 () Bool)

(declare-fun res!433168 () Bool)

(assert (=> b!665761 (=> (not res!433168) (not e!381529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665761 (= res!433168 (validKeyInArray!0 k0!2843))))

(declare-fun b!665762 () Bool)

(declare-datatypes ((Unit!23214 0))(
  ( (Unit!23215) )
))
(declare-fun e!381531 () Unit!23214)

(declare-fun lt!310157 () Unit!23214)

(assert (=> b!665762 (= e!381531 lt!310157)))

(declare-fun lt!310162 () Unit!23214)

(declare-fun lemmaListSubSeqRefl!0 (List!12645) Unit!23214)

(assert (=> b!665762 (= lt!310162 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665762 (subseq!59 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39015 List!12645 List!12645 (_ BitVec 32)) Unit!23214)

(declare-fun $colon$colon!188 (List!12645 (_ BitVec 64)) List!12645)

(assert (=> b!665762 (= lt!310157 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!188 acc!681 (select (arr!18697 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665762 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665763 () Bool)

(declare-fun res!433173 () Bool)

(assert (=> b!665763 (=> (not res!433173) (not e!381529))))

(assert (=> b!665763 (= res!433173 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19061 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665764 () Bool)

(declare-fun res!433167 () Bool)

(assert (=> b!665764 (=> (not res!433167) (not e!381529))))

(assert (=> b!665764 (= res!433167 (not (contains!3297 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665765 () Bool)

(declare-fun res!433160 () Bool)

(assert (=> b!665765 (=> (not res!433160) (not e!381529))))

(assert (=> b!665765 (= res!433160 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19061 a!3626))))))

(declare-fun b!665766 () Bool)

(declare-fun e!381530 () Unit!23214)

(declare-fun Unit!23216 () Unit!23214)

(assert (=> b!665766 (= e!381530 Unit!23216)))

(declare-fun b!665767 () Bool)

(declare-fun res!433166 () Bool)

(assert (=> b!665767 (=> res!433166 e!381532)))

(assert (=> b!665767 (= res!433166 (contains!3297 acc!681 k0!2843))))

(declare-fun b!665768 () Bool)

(declare-fun Unit!23217 () Unit!23214)

(assert (=> b!665768 (= e!381531 Unit!23217)))

(declare-fun b!665769 () Bool)

(declare-fun res!433165 () Bool)

(assert (=> b!665769 (=> (not res!433165) (not e!381529))))

(assert (=> b!665769 (= res!433165 e!381533)))

(declare-fun res!433159 () Bool)

(assert (=> b!665769 (=> res!433159 e!381533)))

(declare-fun e!381534 () Bool)

(assert (=> b!665769 (= res!433159 e!381534)))

(declare-fun res!433161 () Bool)

(assert (=> b!665769 (=> (not res!433161) (not e!381534))))

(assert (=> b!665769 (= res!433161 (bvsgt from!3004 i!1382))))

(declare-fun b!665770 () Bool)

(assert (=> b!665770 (= e!381528 (not (contains!3297 acc!681 k0!2843)))))

(declare-fun b!665771 () Bool)

(declare-fun res!433177 () Bool)

(assert (=> b!665771 (=> (not res!433177) (not e!381529))))

(declare-fun arrayContainsKey!0 (array!39015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665771 (= res!433177 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665772 () Bool)

(declare-fun res!433172 () Bool)

(assert (=> b!665772 (=> res!433172 e!381532)))

(assert (=> b!665772 (= res!433172 (not (noDuplicate!571 lt!310156)))))

(declare-fun b!665773 () Bool)

(declare-fun Unit!23218 () Unit!23214)

(assert (=> b!665773 (= e!381530 Unit!23218)))

(declare-fun lt!310160 () Unit!23214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39015 (_ BitVec 64) (_ BitVec 32)) Unit!23214)

(assert (=> b!665773 (= lt!310160 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665773 false))

(declare-fun b!665774 () Bool)

(assert (=> b!665774 (= e!381529 (not e!381532))))

(declare-fun res!433174 () Bool)

(assert (=> b!665774 (=> res!433174 e!381532)))

(assert (=> b!665774 (= res!433174 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!56 (List!12645 (_ BitVec 64)) List!12645)

(assert (=> b!665774 (= (-!56 lt!310156 k0!2843) acc!681)))

(assert (=> b!665774 (= lt!310156 ($colon$colon!188 acc!681 k0!2843))))

(declare-fun lt!310158 () Unit!23214)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12645) Unit!23214)

(assert (=> b!665774 (= lt!310158 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665774 (subseq!59 acc!681 acc!681)))

(declare-fun lt!310159 () Unit!23214)

(assert (=> b!665774 (= lt!310159 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665774 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310164 () Unit!23214)

(assert (=> b!665774 (= lt!310164 e!381531)))

(declare-fun c!76666 () Bool)

(assert (=> b!665774 (= c!76666 (validKeyInArray!0 (select (arr!18697 a!3626) from!3004)))))

(declare-fun lt!310161 () Unit!23214)

(assert (=> b!665774 (= lt!310161 e!381530)))

(declare-fun c!76667 () Bool)

(assert (=> b!665774 (= c!76667 lt!310163)))

(assert (=> b!665774 (= lt!310163 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665774 (arrayContainsKey!0 (array!39016 (store (arr!18697 a!3626) i!1382 k0!2843) (size!19061 a!3626)) k0!2843 from!3004)))

(declare-fun b!665775 () Bool)

(declare-fun res!433163 () Bool)

(assert (=> b!665775 (=> (not res!433163) (not e!381529))))

(assert (=> b!665775 (= res!433163 (not (contains!3297 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665776 () Bool)

(assert (=> b!665776 (= e!381534 (contains!3297 acc!681 k0!2843))))

(assert (= (and start!60030 res!433171) b!665758))

(assert (= (and b!665758 res!433175) b!665775))

(assert (= (and b!665775 res!433163) b!665764))

(assert (= (and b!665764 res!433167) b!665769))

(assert (= (and b!665769 res!433161) b!665776))

(assert (= (and b!665769 (not res!433159)) b!665756))

(assert (= (and b!665756 res!433164) b!665770))

(assert (= (and b!665769 res!433165) b!665755))

(assert (= (and b!665755 res!433162) b!665754))

(assert (= (and b!665754 res!433157) b!665765))

(assert (= (and b!665765 res!433160) b!665761))

(assert (= (and b!665761 res!433168) b!665771))

(assert (= (and b!665771 res!433177) b!665763))

(assert (= (and b!665763 res!433173) b!665774))

(assert (= (and b!665774 c!76667) b!665773))

(assert (= (and b!665774 (not c!76667)) b!665766))

(assert (= (and b!665774 c!76666) b!665762))

(assert (= (and b!665774 (not c!76666)) b!665768))

(assert (= (and b!665774 (not res!433174)) b!665772))

(assert (= (and b!665772 (not res!433172)) b!665760))

(assert (= (and b!665760 (not res!433169)) b!665767))

(assert (= (and b!665767 (not res!433166)) b!665753))

(assert (= (and b!665753 (not res!433170)) b!665752))

(assert (= (and b!665752 (not res!433176)) b!665757))

(assert (= (and b!665757 (not res!433158)) b!665759))

(declare-fun m!637255 () Bool)

(assert (=> b!665757 m!637255))

(declare-fun m!637257 () Bool)

(assert (=> b!665764 m!637257))

(declare-fun m!637259 () Bool)

(assert (=> b!665776 m!637259))

(declare-fun m!637261 () Bool)

(assert (=> b!665774 m!637261))

(declare-fun m!637263 () Bool)

(assert (=> b!665774 m!637263))

(declare-fun m!637265 () Bool)

(assert (=> b!665774 m!637265))

(declare-fun m!637267 () Bool)

(assert (=> b!665774 m!637267))

(declare-fun m!637269 () Bool)

(assert (=> b!665774 m!637269))

(declare-fun m!637271 () Bool)

(assert (=> b!665774 m!637271))

(declare-fun m!637273 () Bool)

(assert (=> b!665774 m!637273))

(declare-fun m!637275 () Bool)

(assert (=> b!665774 m!637275))

(assert (=> b!665774 m!637263))

(declare-fun m!637277 () Bool)

(assert (=> b!665774 m!637277))

(declare-fun m!637279 () Bool)

(assert (=> b!665774 m!637279))

(declare-fun m!637281 () Bool)

(assert (=> b!665774 m!637281))

(assert (=> b!665762 m!637261))

(assert (=> b!665762 m!637263))

(declare-fun m!637283 () Bool)

(assert (=> b!665762 m!637283))

(declare-fun m!637285 () Bool)

(assert (=> b!665762 m!637285))

(assert (=> b!665762 m!637263))

(assert (=> b!665762 m!637283))

(assert (=> b!665762 m!637271))

(assert (=> b!665762 m!637281))

(declare-fun m!637287 () Bool)

(assert (=> b!665773 m!637287))

(declare-fun m!637289 () Bool)

(assert (=> b!665753 m!637289))

(assert (=> b!665767 m!637259))

(declare-fun m!637291 () Bool)

(assert (=> b!665754 m!637291))

(declare-fun m!637293 () Bool)

(assert (=> b!665775 m!637293))

(declare-fun m!637295 () Bool)

(assert (=> b!665759 m!637295))

(declare-fun m!637297 () Bool)

(assert (=> b!665752 m!637297))

(assert (=> b!665770 m!637259))

(declare-fun m!637299 () Bool)

(assert (=> b!665772 m!637299))

(declare-fun m!637301 () Bool)

(assert (=> b!665761 m!637301))

(declare-fun m!637303 () Bool)

(assert (=> start!60030 m!637303))

(declare-fun m!637305 () Bool)

(assert (=> b!665758 m!637305))

(declare-fun m!637307 () Bool)

(assert (=> b!665755 m!637307))

(declare-fun m!637309 () Bool)

(assert (=> b!665771 m!637309))

(check-sat (not b!665762) (not b!665759) (not b!665753) (not b!665757) (not b!665761) (not b!665771) (not b!665772) (not b!665752) (not start!60030) (not b!665767) (not b!665773) (not b!665776) (not b!665774) (not b!665754) (not b!665775) (not b!665770) (not b!665755) (not b!665758) (not b!665764))
(check-sat)
