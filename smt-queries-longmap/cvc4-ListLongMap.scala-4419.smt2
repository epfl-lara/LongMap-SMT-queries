; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61008 () Bool)

(assert start!61008)

(declare-fun b!684686 () Bool)

(declare-fun e!389864 () Bool)

(declare-datatypes ((List!13030 0))(
  ( (Nil!13027) (Cons!13026 (h!14071 (_ BitVec 64)) (t!19276 List!13030)) )
))
(declare-fun acc!681 () List!13030)

(declare-fun lt!314433 () List!13030)

(declare-fun subseq!193 (List!13030 List!13030) Bool)

(assert (=> b!684686 (= e!389864 (subseq!193 acc!681 lt!314433))))

(declare-fun b!684687 () Bool)

(declare-fun res!450207 () Bool)

(assert (=> b!684687 (=> res!450207 e!389864)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3607 (List!13030 (_ BitVec 64)) Bool)

(assert (=> b!684687 (= res!450207 (contains!3607 acc!681 k!2843))))

(declare-fun b!684688 () Bool)

(declare-fun res!450218 () Bool)

(declare-fun e!389861 () Bool)

(assert (=> b!684688 (=> (not res!450218) (not e!389861))))

(declare-fun e!389868 () Bool)

(assert (=> b!684688 (= res!450218 e!389868)))

(declare-fun res!450208 () Bool)

(assert (=> b!684688 (=> res!450208 e!389868)))

(declare-fun e!389865 () Bool)

(assert (=> b!684688 (= res!450208 e!389865)))

(declare-fun res!450219 () Bool)

(assert (=> b!684688 (=> (not res!450219) (not e!389865))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684688 (= res!450219 (bvsgt from!3004 i!1382))))

(declare-fun b!684689 () Bool)

(declare-fun res!450204 () Bool)

(assert (=> b!684689 (=> (not res!450204) (not e!389861))))

(assert (=> b!684689 (= res!450204 (not (contains!3607 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684690 () Bool)

(declare-datatypes ((Unit!24112 0))(
  ( (Unit!24113) )
))
(declare-fun e!389867 () Unit!24112)

(declare-fun Unit!24114 () Unit!24112)

(assert (=> b!684690 (= e!389867 Unit!24114)))

(declare-fun lt!314435 () Unit!24112)

(declare-datatypes ((array!39617 0))(
  ( (array!39618 (arr!18989 (Array (_ BitVec 32) (_ BitVec 64))) (size!19356 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39617 (_ BitVec 64) (_ BitVec 32)) Unit!24112)

(assert (=> b!684690 (= lt!314435 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684690 false))

(declare-fun b!684691 () Bool)

(declare-fun res!450216 () Bool)

(assert (=> b!684691 (=> (not res!450216) (not e!389861))))

(declare-fun arrayNoDuplicates!0 (array!39617 (_ BitVec 32) List!13030) Bool)

(assert (=> b!684691 (= res!450216 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13027))))

(declare-fun b!684692 () Bool)

(declare-fun Unit!24115 () Unit!24112)

(assert (=> b!684692 (= e!389867 Unit!24115)))

(declare-fun b!684693 () Bool)

(declare-fun e!389863 () Bool)

(assert (=> b!684693 (= e!389863 (not (contains!3607 acc!681 k!2843)))))

(declare-fun b!684694 () Bool)

(assert (=> b!684694 (= e!389861 (not e!389864))))

(declare-fun res!450210 () Bool)

(assert (=> b!684694 (=> res!450210 e!389864)))

(assert (=> b!684694 (= res!450210 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!158 (List!13030 (_ BitVec 64)) List!13030)

(assert (=> b!684694 (= (-!158 lt!314433 k!2843) acc!681)))

(declare-fun $colon$colon!358 (List!13030 (_ BitVec 64)) List!13030)

(assert (=> b!684694 (= lt!314433 ($colon$colon!358 acc!681 k!2843))))

(declare-fun lt!314437 () Unit!24112)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13030) Unit!24112)

(assert (=> b!684694 (= lt!314437 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!684694 (subseq!193 acc!681 acc!681)))

(declare-fun lt!314434 () Unit!24112)

(declare-fun lemmaListSubSeqRefl!0 (List!13030) Unit!24112)

(assert (=> b!684694 (= lt!314434 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684694 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314436 () Unit!24112)

(declare-fun e!389866 () Unit!24112)

(assert (=> b!684694 (= lt!314436 e!389866)))

(declare-fun c!77608 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684694 (= c!77608 (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)))))

(declare-fun lt!314432 () Unit!24112)

(assert (=> b!684694 (= lt!314432 e!389867)))

(declare-fun c!77609 () Bool)

(declare-fun lt!314430 () Bool)

(assert (=> b!684694 (= c!77609 lt!314430)))

(declare-fun arrayContainsKey!0 (array!39617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684694 (= lt!314430 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684694 (arrayContainsKey!0 (array!39618 (store (arr!18989 a!3626) i!1382 k!2843) (size!19356 a!3626)) k!2843 from!3004)))

(declare-fun b!684695 () Bool)

(declare-fun res!450211 () Bool)

(assert (=> b!684695 (=> (not res!450211) (not e!389861))))

(assert (=> b!684695 (= res!450211 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19356 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684697 () Bool)

(declare-fun res!450214 () Bool)

(assert (=> b!684697 (=> (not res!450214) (not e!389861))))

(assert (=> b!684697 (= res!450214 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19356 a!3626))))))

(declare-fun b!684698 () Bool)

(declare-fun Unit!24116 () Unit!24112)

(assert (=> b!684698 (= e!389866 Unit!24116)))

(declare-fun b!684699 () Bool)

(declare-fun res!450205 () Bool)

(assert (=> b!684699 (=> (not res!450205) (not e!389861))))

(declare-fun noDuplicate!854 (List!13030) Bool)

(assert (=> b!684699 (= res!450205 (noDuplicate!854 acc!681))))

(declare-fun b!684700 () Bool)

(declare-fun res!450213 () Bool)

(assert (=> b!684700 (=> (not res!450213) (not e!389861))))

(assert (=> b!684700 (= res!450213 (validKeyInArray!0 k!2843))))

(declare-fun b!684701 () Bool)

(declare-fun lt!314429 () Unit!24112)

(assert (=> b!684701 (= e!389866 lt!314429)))

(declare-fun lt!314431 () Unit!24112)

(assert (=> b!684701 (= lt!314431 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684701 (subseq!193 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39617 List!13030 List!13030 (_ BitVec 32)) Unit!24112)

(assert (=> b!684701 (= lt!314429 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!358 acc!681 (select (arr!18989 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684701 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684702 () Bool)

(declare-fun res!450221 () Bool)

(assert (=> b!684702 (=> (not res!450221) (not e!389861))))

(assert (=> b!684702 (= res!450221 (not (contains!3607 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684703 () Bool)

(declare-fun res!450212 () Bool)

(assert (=> b!684703 (=> (not res!450212) (not e!389861))))

(assert (=> b!684703 (= res!450212 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684704 () Bool)

(declare-fun res!450209 () Bool)

(assert (=> b!684704 (=> (not res!450209) (not e!389861))))

(assert (=> b!684704 (= res!450209 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684705 () Bool)

(declare-fun res!450220 () Bool)

(assert (=> b!684705 (=> res!450220 e!389864)))

(assert (=> b!684705 (= res!450220 (not (noDuplicate!854 lt!314433)))))

(declare-fun b!684706 () Bool)

(assert (=> b!684706 (= e!389865 (contains!3607 acc!681 k!2843))))

(declare-fun b!684707 () Bool)

(declare-fun res!450215 () Bool)

(assert (=> b!684707 (=> res!450215 e!389864)))

(assert (=> b!684707 (= res!450215 lt!314430)))

(declare-fun b!684696 () Bool)

(assert (=> b!684696 (= e!389868 e!389863)))

(declare-fun res!450217 () Bool)

(assert (=> b!684696 (=> (not res!450217) (not e!389863))))

(assert (=> b!684696 (= res!450217 (bvsle from!3004 i!1382))))

(declare-fun res!450206 () Bool)

(assert (=> start!61008 (=> (not res!450206) (not e!389861))))

(assert (=> start!61008 (= res!450206 (and (bvslt (size!19356 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19356 a!3626))))))

(assert (=> start!61008 e!389861))

(assert (=> start!61008 true))

(declare-fun array_inv!14785 (array!39617) Bool)

(assert (=> start!61008 (array_inv!14785 a!3626)))

(assert (= (and start!61008 res!450206) b!684699))

(assert (= (and b!684699 res!450205) b!684689))

(assert (= (and b!684689 res!450204) b!684702))

(assert (= (and b!684702 res!450221) b!684688))

(assert (= (and b!684688 res!450219) b!684706))

(assert (= (and b!684688 (not res!450208)) b!684696))

(assert (= (and b!684696 res!450217) b!684693))

(assert (= (and b!684688 res!450218) b!684691))

(assert (= (and b!684691 res!450216) b!684704))

(assert (= (and b!684704 res!450209) b!684697))

(assert (= (and b!684697 res!450214) b!684700))

(assert (= (and b!684700 res!450213) b!684703))

(assert (= (and b!684703 res!450212) b!684695))

(assert (= (and b!684695 res!450211) b!684694))

(assert (= (and b!684694 c!77609) b!684690))

(assert (= (and b!684694 (not c!77609)) b!684692))

(assert (= (and b!684694 c!77608) b!684701))

(assert (= (and b!684694 (not c!77608)) b!684698))

(assert (= (and b!684694 (not res!450210)) b!684705))

(assert (= (and b!684705 (not res!450220)) b!684707))

(assert (= (and b!684707 (not res!450215)) b!684687))

(assert (= (and b!684687 (not res!450207)) b!684686))

(declare-fun m!648981 () Bool)

(assert (=> b!684689 m!648981))

(declare-fun m!648983 () Bool)

(assert (=> b!684704 m!648983))

(declare-fun m!648985 () Bool)

(assert (=> b!684703 m!648985))

(declare-fun m!648987 () Bool)

(assert (=> b!684686 m!648987))

(declare-fun m!648989 () Bool)

(assert (=> b!684687 m!648989))

(assert (=> b!684706 m!648989))

(declare-fun m!648991 () Bool)

(assert (=> b!684701 m!648991))

(declare-fun m!648993 () Bool)

(assert (=> b!684701 m!648993))

(declare-fun m!648995 () Bool)

(assert (=> b!684701 m!648995))

(declare-fun m!648997 () Bool)

(assert (=> b!684701 m!648997))

(assert (=> b!684701 m!648993))

(assert (=> b!684701 m!648995))

(declare-fun m!648999 () Bool)

(assert (=> b!684701 m!648999))

(declare-fun m!649001 () Bool)

(assert (=> b!684701 m!649001))

(declare-fun m!649003 () Bool)

(assert (=> b!684705 m!649003))

(declare-fun m!649005 () Bool)

(assert (=> b!684690 m!649005))

(declare-fun m!649007 () Bool)

(assert (=> start!61008 m!649007))

(declare-fun m!649009 () Bool)

(assert (=> b!684699 m!649009))

(declare-fun m!649011 () Bool)

(assert (=> b!684702 m!649011))

(declare-fun m!649013 () Bool)

(assert (=> b!684691 m!649013))

(declare-fun m!649015 () Bool)

(assert (=> b!684700 m!649015))

(assert (=> b!684694 m!648991))

(assert (=> b!684694 m!648993))

(declare-fun m!649017 () Bool)

(assert (=> b!684694 m!649017))

(declare-fun m!649019 () Bool)

(assert (=> b!684694 m!649019))

(assert (=> b!684694 m!648999))

(declare-fun m!649021 () Bool)

(assert (=> b!684694 m!649021))

(declare-fun m!649023 () Bool)

(assert (=> b!684694 m!649023))

(declare-fun m!649025 () Bool)

(assert (=> b!684694 m!649025))

(assert (=> b!684694 m!648993))

(declare-fun m!649027 () Bool)

(assert (=> b!684694 m!649027))

(declare-fun m!649029 () Bool)

(assert (=> b!684694 m!649029))

(assert (=> b!684694 m!649001))

(assert (=> b!684693 m!648989))

(push 1)

(assert (not b!684700))

(assert (not b!684706))

(assert (not b!684702))

(assert (not b!684690))

(assert (not b!684689))

(assert (not b!684701))

(assert (not b!684704))

(assert (not b!684693))

(assert (not b!684687))

(assert (not b!684686))

(assert (not start!61008))

(assert (not b!684705))

(assert (not b!684703))

(assert (not b!684691))

(assert (not b!684699))

(assert (not b!684694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!684718 () Bool)

(declare-fun e!389878 () List!13030)

(declare-fun call!34031 () List!13030)

(assert (=> b!684718 (= e!389878 (Cons!13026 (h!14071 lt!314433) call!34031))))

(declare-fun b!684719 () Bool)

(declare-fun e!389876 () List!13030)

(assert (=> b!684719 (= e!389876 e!389878)))

(declare-fun c!77614 () Bool)

(assert (=> b!684719 (= c!77614 (= k!2843 (h!14071 lt!314433)))))

(declare-fun lt!314440 () List!13030)

(declare-fun b!684720 () Bool)

(declare-fun e!389877 () Bool)

(declare-fun content!286 (List!13030) (Set (_ BitVec 64)))

(assert (=> b!684720 (= e!389877 (= (content!286 lt!314440) (setminus (content!286 lt!314433) (insert k!2843 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!684721 () Bool)

(assert (=> b!684721 (= e!389878 call!34031)))

(declare-fun b!684722 () Bool)

(assert (=> b!684722 (= e!389876 Nil!13027)))

(declare-fun bm!34028 () Bool)

(assert (=> bm!34028 (= call!34031 (-!158 (t!19276 lt!314433) k!2843))))

(declare-fun d!94315 () Bool)

(assert (=> d!94315 e!389877))

(declare-fun res!450224 () Bool)

(assert (=> d!94315 (=> (not res!450224) (not e!389877))))

(declare-fun size!19357 (List!13030) Int)

(assert (=> d!94315 (= res!450224 (<= (size!19357 lt!314440) (size!19357 lt!314433)))))

(assert (=> d!94315 (= lt!314440 e!389876)))

(declare-fun c!77615 () Bool)

(assert (=> d!94315 (= c!77615 (is-Cons!13026 lt!314433))))

(assert (=> d!94315 (= (-!158 lt!314433 k!2843) lt!314440)))

(assert (= (and d!94315 c!77615) b!684719))

(assert (= (and d!94315 (not c!77615)) b!684722))

(assert (= (and b!684719 c!77614) b!684721))

(assert (= (and b!684719 (not c!77614)) b!684718))

(assert (= (or b!684721 b!684718) bm!34028))

(assert (= (and d!94315 res!450224) b!684720))

(declare-fun m!649031 () Bool)

(assert (=> b!684720 m!649031))

(declare-fun m!649033 () Bool)

(assert (=> b!684720 m!649033))

(declare-fun m!649035 () Bool)

(assert (=> b!684720 m!649035))

(declare-fun m!649037 () Bool)

(assert (=> bm!34028 m!649037))

(declare-fun m!649039 () Bool)

(assert (=> d!94315 m!649039))

(declare-fun m!649041 () Bool)

(assert (=> d!94315 m!649041))

(assert (=> b!684694 d!94315))

(declare-fun b!684734 () Bool)

(declare-fun e!389887 () Bool)

(assert (=> b!684734 (= e!389887 (subseq!193 acc!681 (t!19276 acc!681)))))

(declare-fun d!94317 () Bool)

(declare-fun res!450234 () Bool)

(declare-fun e!389890 () Bool)

(assert (=> d!94317 (=> res!450234 e!389890)))

(assert (=> d!94317 (= res!450234 (is-Nil!13027 acc!681))))

(assert (=> d!94317 (= (subseq!193 acc!681 acc!681) e!389890)))

(declare-fun b!684731 () Bool)

(declare-fun e!389889 () Bool)

(assert (=> b!684731 (= e!389890 e!389889)))

(declare-fun res!450236 () Bool)

(assert (=> b!684731 (=> (not res!450236) (not e!389889))))

(assert (=> b!684731 (= res!450236 (is-Cons!13026 acc!681))))

(declare-fun b!684733 () Bool)

(declare-fun e!389888 () Bool)

(assert (=> b!684733 (= e!389888 (subseq!193 (t!19276 acc!681) (t!19276 acc!681)))))

(declare-fun b!684732 () Bool)

(assert (=> b!684732 (= e!389889 e!389887)))

(declare-fun res!450235 () Bool)

(assert (=> b!684732 (=> res!450235 e!389887)))

(assert (=> b!684732 (= res!450235 e!389888)))

(declare-fun res!450233 () Bool)

(assert (=> b!684732 (=> (not res!450233) (not e!389888))))

(assert (=> b!684732 (= res!450233 (= (h!14071 acc!681) (h!14071 acc!681)))))

(assert (= (and d!94317 (not res!450234)) b!684731))

(assert (= (and b!684731 res!450236) b!684732))

(assert (= (and b!684732 res!450233) b!684733))

(assert (= (and b!684732 (not res!450235)) b!684734))

(declare-fun m!649043 () Bool)

(assert (=> b!684734 m!649043))

(declare-fun m!649045 () Bool)

(assert (=> b!684733 m!649045))

(assert (=> b!684694 d!94317))

(declare-fun d!94321 () Bool)

(declare-fun res!450249 () Bool)

(declare-fun e!389903 () Bool)

(assert (=> d!94321 (=> res!450249 e!389903)))

(assert (=> d!94321 (= res!450249 (= (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94321 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389903)))

(declare-fun b!684747 () Bool)

(declare-fun e!389904 () Bool)

(assert (=> b!684747 (= e!389903 e!389904)))

(declare-fun res!450250 () Bool)

(assert (=> b!684747 (=> (not res!450250) (not e!389904))))

(assert (=> b!684747 (= res!450250 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19356 a!3626)))))

(declare-fun b!684748 () Bool)

(assert (=> b!684748 (= e!389904 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94321 (not res!450249)) b!684747))

(assert (= (and b!684747 res!450250) b!684748))

(declare-fun m!649057 () Bool)

(assert (=> d!94321 m!649057))

(declare-fun m!649059 () Bool)

(assert (=> b!684748 m!649059))

(assert (=> b!684694 d!94321))

(declare-fun d!94327 () Bool)

(assert (=> d!94327 (= (-!158 ($colon$colon!358 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!314447 () Unit!24112)

(declare-fun choose!16 ((_ BitVec 64) List!13030) Unit!24112)

(assert (=> d!94327 (= lt!314447 (choose!16 k!2843 acc!681))))

(assert (=> d!94327 (not (contains!3607 acc!681 k!2843))))

(assert (=> d!94327 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!314447)))

(declare-fun bs!20074 () Bool)

(assert (= bs!20074 d!94327))

(assert (=> bs!20074 m!649023))

(assert (=> bs!20074 m!649023))

(declare-fun m!649065 () Bool)

(assert (=> bs!20074 m!649065))

(declare-fun m!649067 () Bool)

(assert (=> bs!20074 m!649067))

(assert (=> bs!20074 m!648989))

(assert (=> b!684694 d!94327))

(declare-fun d!94331 () Bool)

(declare-fun res!450257 () Bool)

(declare-fun e!389911 () Bool)

(assert (=> d!94331 (=> res!450257 e!389911)))

(assert (=> d!94331 (= res!450257 (= (select (arr!18989 (array!39618 (store (arr!18989 a!3626) i!1382 k!2843) (size!19356 a!3626))) from!3004) k!2843))))

(assert (=> d!94331 (= (arrayContainsKey!0 (array!39618 (store (arr!18989 a!3626) i!1382 k!2843) (size!19356 a!3626)) k!2843 from!3004) e!389911)))

(declare-fun b!684755 () Bool)

(declare-fun e!389912 () Bool)

(assert (=> b!684755 (= e!389911 e!389912)))

(declare-fun res!450258 () Bool)

(assert (=> b!684755 (=> (not res!450258) (not e!389912))))

(assert (=> b!684755 (= res!450258 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19356 (array!39618 (store (arr!18989 a!3626) i!1382 k!2843) (size!19356 a!3626)))))))

(declare-fun b!684756 () Bool)

(assert (=> b!684756 (= e!389912 (arrayContainsKey!0 (array!39618 (store (arr!18989 a!3626) i!1382 k!2843) (size!19356 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94331 (not res!450257)) b!684755))

(assert (= (and b!684755 res!450258) b!684756))

(declare-fun m!649069 () Bool)

(assert (=> d!94331 m!649069))

(declare-fun m!649071 () Bool)

(assert (=> b!684756 m!649071))

(assert (=> b!684694 d!94331))

(declare-fun d!94333 () Bool)

(assert (=> d!94333 (subseq!193 acc!681 acc!681)))

(declare-fun lt!314450 () Unit!24112)

(declare-fun choose!36 (List!13030) Unit!24112)

(assert (=> d!94333 (= lt!314450 (choose!36 acc!681))))

(assert (=> d!94333 (= (lemmaListSubSeqRefl!0 acc!681) lt!314450)))

(declare-fun bs!20075 () Bool)

(assert (= bs!20075 d!94333))

(assert (=> bs!20075 m!649001))

(declare-fun m!649073 () Bool)

(assert (=> bs!20075 m!649073))

(assert (=> b!684694 d!94333))

(declare-fun d!94335 () Bool)

(assert (=> d!94335 (= (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)) (and (not (= (select (arr!18989 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18989 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684694 d!94335))

(declare-fun d!94337 () Bool)

(assert (=> d!94337 (= ($colon$colon!358 acc!681 k!2843) (Cons!13026 k!2843 acc!681))))

(assert (=> b!684694 d!94337))

(declare-fun d!94339 () Bool)

(declare-fun res!450283 () Bool)

(declare-fun e!389944 () Bool)

(assert (=> d!94339 (=> res!450283 e!389944)))

(assert (=> d!94339 (= res!450283 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19356 a!3626)))))

(assert (=> d!94339 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!389944)))

(declare-fun b!684793 () Bool)

(declare-fun e!389946 () Bool)

(declare-fun e!389947 () Bool)

(assert (=> b!684793 (= e!389946 e!389947)))

(declare-fun c!77622 () Bool)

(assert (=> b!684793 (= c!77622 (validKeyInArray!0 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun e!389945 () Bool)

(declare-fun b!684794 () Bool)

(assert (=> b!684794 (= e!389945 (contains!3607 acc!681 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34036 () Bool)

(declare-fun bm!34033 () Bool)

(assert (=> bm!34033 (= call!34036 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77622 (Cons!13026 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!684795 () Bool)

(assert (=> b!684795 (= e!389947 call!34036)))

(declare-fun b!684796 () Bool)

(assert (=> b!684796 (= e!389947 call!34036)))

(declare-fun b!684797 () Bool)

(assert (=> b!684797 (= e!389944 e!389946)))

(declare-fun res!450284 () Bool)

(assert (=> b!684797 (=> (not res!450284) (not e!389946))))

(assert (=> b!684797 (= res!450284 (not e!389945))))

(declare-fun res!450285 () Bool)

(assert (=> b!684797 (=> (not res!450285) (not e!389945))))

(assert (=> b!684797 (= res!450285 (validKeyInArray!0 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94339 (not res!450283)) b!684797))

(assert (= (and b!684797 res!450285) b!684794))

(assert (= (and b!684797 res!450284) b!684793))

(assert (= (and b!684793 c!77622) b!684795))

(assert (= (and b!684793 (not c!77622)) b!684796))

(assert (= (or b!684795 b!684796) bm!34033))

(assert (=> b!684793 m!649057))

(assert (=> b!684793 m!649057))

(declare-fun m!649083 () Bool)

(assert (=> b!684793 m!649083))

(assert (=> b!684794 m!649057))

(assert (=> b!684794 m!649057))

(declare-fun m!649085 () Bool)

(assert (=> b!684794 m!649085))

(assert (=> bm!34033 m!649057))

(declare-fun m!649087 () Bool)

(assert (=> bm!34033 m!649087))

(assert (=> b!684797 m!649057))

(assert (=> b!684797 m!649057))

(assert (=> b!684797 m!649083))

(assert (=> b!684694 d!94339))

(declare-fun d!94345 () Bool)

(declare-fun res!450288 () Bool)

(declare-fun e!389950 () Bool)

(assert (=> d!94345 (=> res!450288 e!389950)))

(assert (=> d!94345 (= res!450288 (bvsge from!3004 (size!19356 a!3626)))))

(assert (=> d!94345 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!389950)))

(declare-fun b!684800 () Bool)

(declare-fun e!389952 () Bool)

(declare-fun e!389953 () Bool)

(assert (=> b!684800 (= e!389952 e!389953)))

(declare-fun c!77623 () Bool)

(assert (=> b!684800 (= c!77623 (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)))))

(declare-fun b!684801 () Bool)

(declare-fun e!389951 () Bool)

(assert (=> b!684801 (= e!389951 (contains!3607 acc!681 (select (arr!18989 a!3626) from!3004)))))

(declare-fun call!34037 () Bool)

(declare-fun bm!34034 () Bool)

(assert (=> bm!34034 (= call!34037 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77623 (Cons!13026 (select (arr!18989 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!684802 () Bool)

(assert (=> b!684802 (= e!389953 call!34037)))

(declare-fun b!684803 () Bool)

(assert (=> b!684803 (= e!389953 call!34037)))

(declare-fun b!684804 () Bool)

(assert (=> b!684804 (= e!389950 e!389952)))

(declare-fun res!450289 () Bool)

(assert (=> b!684804 (=> (not res!450289) (not e!389952))))

(assert (=> b!684804 (= res!450289 (not e!389951))))

(declare-fun res!450290 () Bool)

(assert (=> b!684804 (=> (not res!450290) (not e!389951))))

(assert (=> b!684804 (= res!450290 (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)))))

(assert (= (and d!94345 (not res!450288)) b!684804))

(assert (= (and b!684804 res!450290) b!684801))

(assert (= (and b!684804 res!450289) b!684800))

(assert (= (and b!684800 c!77623) b!684802))

(assert (= (and b!684800 (not c!77623)) b!684803))

(assert (= (or b!684802 b!684803) bm!34034))

(assert (=> b!684800 m!648993))

(assert (=> b!684800 m!648993))

(assert (=> b!684800 m!649027))

(assert (=> b!684801 m!648993))

(assert (=> b!684801 m!648993))

(declare-fun m!649089 () Bool)

(assert (=> b!684801 m!649089))

(assert (=> bm!34034 m!648993))

(declare-fun m!649091 () Bool)

(assert (=> bm!34034 m!649091))

(assert (=> b!684804 m!648993))

(assert (=> b!684804 m!648993))

(assert (=> b!684804 m!649027))

(assert (=> b!684704 d!94345))

(declare-fun d!94349 () Bool)

(declare-fun lt!314459 () Bool)

(assert (=> d!94349 (= lt!314459 (member k!2843 (content!286 acc!681)))))

(declare-fun e!389972 () Bool)

(assert (=> d!94349 (= lt!314459 e!389972)))

(declare-fun res!450306 () Bool)

(assert (=> d!94349 (=> (not res!450306) (not e!389972))))

(assert (=> d!94349 (= res!450306 (is-Cons!13026 acc!681))))

(assert (=> d!94349 (= (contains!3607 acc!681 k!2843) lt!314459)))

(declare-fun b!684824 () Bool)

(declare-fun e!389971 () Bool)

(assert (=> b!684824 (= e!389972 e!389971)))

(declare-fun res!450307 () Bool)

(assert (=> b!684824 (=> res!450307 e!389971)))

(assert (=> b!684824 (= res!450307 (= (h!14071 acc!681) k!2843))))

(declare-fun b!684825 () Bool)

(assert (=> b!684825 (= e!389971 (contains!3607 (t!19276 acc!681) k!2843))))

(assert (= (and d!94349 res!450306) b!684824))

(assert (= (and b!684824 (not res!450307)) b!684825))

(declare-fun m!649113 () Bool)

(assert (=> d!94349 m!649113))

(declare-fun m!649115 () Bool)

(assert (=> d!94349 m!649115))

(declare-fun m!649117 () Bool)

(assert (=> b!684825 m!649117))

(assert (=> b!684693 d!94349))

(assert (=> b!684706 d!94349))

(declare-fun d!94357 () Bool)

(declare-fun res!450316 () Bool)

(declare-fun e!389981 () Bool)

(assert (=> d!94357 (=> res!450316 e!389981)))

(assert (=> d!94357 (= res!450316 (is-Nil!13027 lt!314433))))

(assert (=> d!94357 (= (noDuplicate!854 lt!314433) e!389981)))

(declare-fun b!684834 () Bool)

(declare-fun e!389982 () Bool)

(assert (=> b!684834 (= e!389981 e!389982)))

(declare-fun res!450317 () Bool)

(assert (=> b!684834 (=> (not res!450317) (not e!389982))))

(assert (=> b!684834 (= res!450317 (not (contains!3607 (t!19276 lt!314433) (h!14071 lt!314433))))))

(declare-fun b!684835 () Bool)

(assert (=> b!684835 (= e!389982 (noDuplicate!854 (t!19276 lt!314433)))))

(assert (= (and d!94357 (not res!450316)) b!684834))

(assert (= (and b!684834 res!450317) b!684835))

(declare-fun m!649125 () Bool)

(assert (=> b!684834 m!649125))

(declare-fun m!649127 () Bool)

(assert (=> b!684835 m!649127))

(assert (=> b!684705 d!94357))

(declare-fun b!684839 () Bool)

(declare-fun e!389983 () Bool)

(assert (=> b!684839 (= e!389983 (subseq!193 acc!681 (t!19276 lt!314433)))))

(declare-fun d!94371 () Bool)

(declare-fun res!450319 () Bool)

(declare-fun e!389986 () Bool)

(assert (=> d!94371 (=> res!450319 e!389986)))

(assert (=> d!94371 (= res!450319 (is-Nil!13027 acc!681))))

(assert (=> d!94371 (= (subseq!193 acc!681 lt!314433) e!389986)))

(declare-fun b!684836 () Bool)

(declare-fun e!389985 () Bool)

(assert (=> b!684836 (= e!389986 e!389985)))

(declare-fun res!450321 () Bool)

(assert (=> b!684836 (=> (not res!450321) (not e!389985))))

(assert (=> b!684836 (= res!450321 (is-Cons!13026 lt!314433))))

(declare-fun b!684838 () Bool)

(declare-fun e!389984 () Bool)

(assert (=> b!684838 (= e!389984 (subseq!193 (t!19276 acc!681) (t!19276 lt!314433)))))

(declare-fun b!684837 () Bool)

(assert (=> b!684837 (= e!389985 e!389983)))

(declare-fun res!450320 () Bool)

(assert (=> b!684837 (=> res!450320 e!389983)))

(assert (=> b!684837 (= res!450320 e!389984)))

(declare-fun res!450318 () Bool)

(assert (=> b!684837 (=> (not res!450318) (not e!389984))))

(assert (=> b!684837 (= res!450318 (= (h!14071 acc!681) (h!14071 lt!314433)))))

(assert (= (and d!94371 (not res!450319)) b!684836))

(assert (= (and b!684836 res!450321) b!684837))

(assert (= (and b!684837 res!450318) b!684838))

(assert (= (and b!684837 (not res!450320)) b!684839))

(declare-fun m!649129 () Bool)

(assert (=> b!684839 m!649129))

(declare-fun m!649131 () Bool)

(assert (=> b!684838 m!649131))

(assert (=> b!684686 d!94371))

(assert (=> b!684687 d!94349))

(declare-fun d!94373 () Bool)

(declare-fun res!450322 () Bool)

(declare-fun e!389987 () Bool)

(assert (=> d!94373 (=> res!450322 e!389987)))

(assert (=> d!94373 (= res!450322 (is-Nil!13027 acc!681))))

(assert (=> d!94373 (= (noDuplicate!854 acc!681) e!389987)))

(declare-fun b!684840 () Bool)

(declare-fun e!389988 () Bool)

(assert (=> b!684840 (= e!389987 e!389988)))

(declare-fun res!450323 () Bool)

(assert (=> b!684840 (=> (not res!450323) (not e!389988))))

(assert (=> b!684840 (= res!450323 (not (contains!3607 (t!19276 acc!681) (h!14071 acc!681))))))

(declare-fun b!684841 () Bool)

(assert (=> b!684841 (= e!389988 (noDuplicate!854 (t!19276 acc!681)))))

(assert (= (and d!94373 (not res!450322)) b!684840))

(assert (= (and b!684840 res!450323) b!684841))

(declare-fun m!649133 () Bool)

(assert (=> b!684840 m!649133))

(declare-fun m!649135 () Bool)

(assert (=> b!684841 m!649135))

(assert (=> b!684699 d!94373))

(declare-fun d!94375 () Bool)

(assert (=> d!94375 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314468 () Unit!24112)

(declare-fun choose!13 (array!39617 (_ BitVec 64) (_ BitVec 32)) Unit!24112)

(assert (=> d!94375 (= lt!314468 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94375 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94375 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!314468)))

(declare-fun bs!20078 () Bool)

(assert (= bs!20078 d!94375))

(assert (=> bs!20078 m!648985))

(declare-fun m!649143 () Bool)

(assert (=> bs!20078 m!649143))

(assert (=> b!684690 d!94375))

(declare-fun d!94379 () Bool)

