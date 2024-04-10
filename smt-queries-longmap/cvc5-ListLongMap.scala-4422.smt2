; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61178 () Bool)

(assert start!61178)

(declare-fun b!685682 () Bool)

(declare-fun res!450987 () Bool)

(declare-fun e!390483 () Bool)

(assert (=> b!685682 (=> (not res!450987) (not e!390483))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685682 (= res!450987 (validKeyInArray!0 k!2843))))

(declare-fun b!685683 () Bool)

(declare-fun res!450991 () Bool)

(declare-fun e!390487 () Bool)

(assert (=> b!685683 (=> res!450991 e!390487)))

(declare-datatypes ((List!13037 0))(
  ( (Nil!13034) (Cons!13033 (h!14078 (_ BitVec 64)) (t!19289 List!13037)) )
))
(declare-fun acc!681 () List!13037)

(declare-fun lt!314756 () List!13037)

(declare-fun subseq!200 (List!13037 List!13037) Bool)

(assert (=> b!685683 (= res!450991 (not (subseq!200 acc!681 lt!314756)))))

(declare-fun res!450997 () Bool)

(assert (=> start!61178 (=> (not res!450997) (not e!390483))))

(declare-datatypes ((array!39637 0))(
  ( (array!39638 (arr!18996 (Array (_ BitVec 32) (_ BitVec 64))) (size!19368 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39637)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61178 (= res!450997 (and (bvslt (size!19368 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19368 a!3626))))))

(assert (=> start!61178 e!390483))

(assert (=> start!61178 true))

(declare-fun array_inv!14792 (array!39637) Bool)

(assert (=> start!61178 (array_inv!14792 a!3626)))

(declare-fun b!685684 () Bool)

(declare-datatypes ((Unit!24147 0))(
  ( (Unit!24148) )
))
(declare-fun e!390481 () Unit!24147)

(declare-fun lt!314750 () Unit!24147)

(assert (=> b!685684 (= e!390481 lt!314750)))

(declare-fun lt!314751 () Unit!24147)

(declare-fun lemmaListSubSeqRefl!0 (List!13037) Unit!24147)

(assert (=> b!685684 (= lt!314751 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685684 (subseq!200 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39637 List!13037 List!13037 (_ BitVec 32)) Unit!24147)

(declare-fun $colon$colon!365 (List!13037 (_ BitVec 64)) List!13037)

(assert (=> b!685684 (= lt!314750 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!365 acc!681 (select (arr!18996 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39637 (_ BitVec 32) List!13037) Bool)

(assert (=> b!685684 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685685 () Bool)

(declare-fun res!450996 () Bool)

(assert (=> b!685685 (=> res!450996 e!390487)))

(declare-fun contains!3614 (List!13037 (_ BitVec 64)) Bool)

(assert (=> b!685685 (= res!450996 (contains!3614 acc!681 k!2843))))

(declare-fun b!685686 () Bool)

(declare-fun res!451001 () Bool)

(assert (=> b!685686 (=> (not res!451001) (not e!390483))))

(declare-fun e!390486 () Bool)

(assert (=> b!685686 (= res!451001 e!390486)))

(declare-fun res!450995 () Bool)

(assert (=> b!685686 (=> res!450995 e!390486)))

(declare-fun e!390482 () Bool)

(assert (=> b!685686 (= res!450995 e!390482)))

(declare-fun res!450993 () Bool)

(assert (=> b!685686 (=> (not res!450993) (not e!390482))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685686 (= res!450993 (bvsgt from!3004 i!1382))))

(declare-fun b!685687 () Bool)

(declare-fun e!390488 () Bool)

(assert (=> b!685687 (= e!390488 (not (contains!3614 acc!681 k!2843)))))

(declare-fun b!685688 () Bool)

(declare-fun res!451002 () Bool)

(assert (=> b!685688 (=> (not res!451002) (not e!390483))))

(assert (=> b!685688 (= res!451002 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19368 a!3626))))))

(declare-fun b!685689 () Bool)

(declare-fun res!450994 () Bool)

(assert (=> b!685689 (=> (not res!450994) (not e!390483))))

(assert (=> b!685689 (= res!450994 (not (contains!3614 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685690 () Bool)

(assert (=> b!685690 (= e!390486 e!390488)))

(declare-fun res!450988 () Bool)

(assert (=> b!685690 (=> (not res!450988) (not e!390488))))

(assert (=> b!685690 (= res!450988 (bvsle from!3004 i!1382))))

(declare-fun b!685691 () Bool)

(declare-fun res!451004 () Bool)

(assert (=> b!685691 (=> (not res!451004) (not e!390483))))

(declare-fun noDuplicate!861 (List!13037) Bool)

(assert (=> b!685691 (= res!451004 (noDuplicate!861 acc!681))))

(declare-fun b!685692 () Bool)

(declare-fun res!450998 () Bool)

(assert (=> b!685692 (=> res!450998 e!390487)))

(declare-fun lt!314758 () Bool)

(assert (=> b!685692 (= res!450998 lt!314758)))

(declare-fun b!685693 () Bool)

(assert (=> b!685693 (= e!390482 (contains!3614 acc!681 k!2843))))

(declare-fun b!685694 () Bool)

(declare-fun res!450989 () Bool)

(assert (=> b!685694 (=> res!450989 e!390487)))

(assert (=> b!685694 (= res!450989 (not (contains!3614 lt!314756 k!2843)))))

(declare-fun b!685695 () Bool)

(declare-fun e!390489 () Bool)

(assert (=> b!685695 (= e!390489 (not (contains!3614 lt!314756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685696 () Bool)

(declare-fun res!451000 () Bool)

(assert (=> b!685696 (=> (not res!451000) (not e!390483))))

(assert (=> b!685696 (= res!451000 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685697 () Bool)

(assert (=> b!685697 (= e!390483 (not e!390487))))

(declare-fun res!450985 () Bool)

(assert (=> b!685697 (=> res!450985 e!390487)))

(assert (=> b!685697 (= res!450985 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!165 (List!13037 (_ BitVec 64)) List!13037)

(assert (=> b!685697 (= (-!165 lt!314756 k!2843) acc!681)))

(assert (=> b!685697 (= lt!314756 ($colon$colon!365 acc!681 k!2843))))

(declare-fun lt!314754 () Unit!24147)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13037) Unit!24147)

(assert (=> b!685697 (= lt!314754 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!685697 (subseq!200 acc!681 acc!681)))

(declare-fun lt!314755 () Unit!24147)

(assert (=> b!685697 (= lt!314755 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685697 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314757 () Unit!24147)

(assert (=> b!685697 (= lt!314757 e!390481)))

(declare-fun c!77716 () Bool)

(assert (=> b!685697 (= c!77716 (validKeyInArray!0 (select (arr!18996 a!3626) from!3004)))))

(declare-fun lt!314753 () Unit!24147)

(declare-fun e!390484 () Unit!24147)

(assert (=> b!685697 (= lt!314753 e!390484)))

(declare-fun c!77717 () Bool)

(assert (=> b!685697 (= c!77717 lt!314758)))

(declare-fun arrayContainsKey!0 (array!39637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685697 (= lt!314758 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685697 (arrayContainsKey!0 (array!39638 (store (arr!18996 a!3626) i!1382 k!2843) (size!19368 a!3626)) k!2843 from!3004)))

(declare-fun b!685698 () Bool)

(declare-fun res!450990 () Bool)

(assert (=> b!685698 (=> (not res!450990) (not e!390483))))

(assert (=> b!685698 (= res!450990 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19368 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685699 () Bool)

(declare-fun res!450984 () Bool)

(assert (=> b!685699 (=> res!450984 e!390487)))

(assert (=> b!685699 (= res!450984 (not (noDuplicate!861 lt!314756)))))

(declare-fun b!685700 () Bool)

(assert (=> b!685700 (= e!390487 e!390489)))

(declare-fun res!451003 () Bool)

(assert (=> b!685700 (=> (not res!451003) (not e!390489))))

(assert (=> b!685700 (= res!451003 (not (contains!3614 lt!314756 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685701 () Bool)

(declare-fun res!450999 () Bool)

(assert (=> b!685701 (=> (not res!450999) (not e!390483))))

(assert (=> b!685701 (= res!450999 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685702 () Bool)

(declare-fun Unit!24149 () Unit!24147)

(assert (=> b!685702 (= e!390484 Unit!24149)))

(declare-fun lt!314752 () Unit!24147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39637 (_ BitVec 64) (_ BitVec 32)) Unit!24147)

(assert (=> b!685702 (= lt!314752 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685702 false))

(declare-fun b!685703 () Bool)

(declare-fun res!450992 () Bool)

(assert (=> b!685703 (=> (not res!450992) (not e!390483))))

(assert (=> b!685703 (= res!450992 (not (contains!3614 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685704 () Bool)

(declare-fun res!450986 () Bool)

(assert (=> b!685704 (=> (not res!450986) (not e!390483))))

(assert (=> b!685704 (= res!450986 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13034))))

(declare-fun b!685705 () Bool)

(declare-fun Unit!24150 () Unit!24147)

(assert (=> b!685705 (= e!390481 Unit!24150)))

(declare-fun b!685706 () Bool)

(declare-fun Unit!24151 () Unit!24147)

(assert (=> b!685706 (= e!390484 Unit!24151)))

(assert (= (and start!61178 res!450997) b!685691))

(assert (= (and b!685691 res!451004) b!685703))

(assert (= (and b!685703 res!450992) b!685689))

(assert (= (and b!685689 res!450994) b!685686))

(assert (= (and b!685686 res!450993) b!685693))

(assert (= (and b!685686 (not res!450995)) b!685690))

(assert (= (and b!685690 res!450988) b!685687))

(assert (= (and b!685686 res!451001) b!685704))

(assert (= (and b!685704 res!450986) b!685696))

(assert (= (and b!685696 res!451000) b!685688))

(assert (= (and b!685688 res!451002) b!685682))

(assert (= (and b!685682 res!450987) b!685701))

(assert (= (and b!685701 res!450999) b!685698))

(assert (= (and b!685698 res!450990) b!685697))

(assert (= (and b!685697 c!77717) b!685702))

(assert (= (and b!685697 (not c!77717)) b!685706))

(assert (= (and b!685697 c!77716) b!685684))

(assert (= (and b!685697 (not c!77716)) b!685705))

(assert (= (and b!685697 (not res!450985)) b!685699))

(assert (= (and b!685699 (not res!450984)) b!685692))

(assert (= (and b!685692 (not res!450998)) b!685685))

(assert (= (and b!685685 (not res!450996)) b!685683))

(assert (= (and b!685683 (not res!450991)) b!685694))

(assert (= (and b!685694 (not res!450989)) b!685700))

(assert (= (and b!685700 res!451003) b!685695))

(declare-fun m!649835 () Bool)

(assert (=> b!685697 m!649835))

(declare-fun m!649837 () Bool)

(assert (=> b!685697 m!649837))

(declare-fun m!649839 () Bool)

(assert (=> b!685697 m!649839))

(declare-fun m!649841 () Bool)

(assert (=> b!685697 m!649841))

(declare-fun m!649843 () Bool)

(assert (=> b!685697 m!649843))

(declare-fun m!649845 () Bool)

(assert (=> b!685697 m!649845))

(declare-fun m!649847 () Bool)

(assert (=> b!685697 m!649847))

(assert (=> b!685697 m!649837))

(declare-fun m!649849 () Bool)

(assert (=> b!685697 m!649849))

(declare-fun m!649851 () Bool)

(assert (=> b!685697 m!649851))

(declare-fun m!649853 () Bool)

(assert (=> b!685697 m!649853))

(declare-fun m!649855 () Bool)

(assert (=> b!685697 m!649855))

(declare-fun m!649857 () Bool)

(assert (=> b!685699 m!649857))

(declare-fun m!649859 () Bool)

(assert (=> b!685700 m!649859))

(declare-fun m!649861 () Bool)

(assert (=> b!685704 m!649861))

(declare-fun m!649863 () Bool)

(assert (=> start!61178 m!649863))

(declare-fun m!649865 () Bool)

(assert (=> b!685695 m!649865))

(declare-fun m!649867 () Bool)

(assert (=> b!685703 m!649867))

(declare-fun m!649869 () Bool)

(assert (=> b!685702 m!649869))

(declare-fun m!649871 () Bool)

(assert (=> b!685682 m!649871))

(assert (=> b!685684 m!649835))

(assert (=> b!685684 m!649837))

(declare-fun m!649873 () Bool)

(assert (=> b!685684 m!649873))

(declare-fun m!649875 () Bool)

(assert (=> b!685684 m!649875))

(assert (=> b!685684 m!649837))

(assert (=> b!685684 m!649873))

(assert (=> b!685684 m!649843))

(assert (=> b!685684 m!649855))

(declare-fun m!649877 () Bool)

(assert (=> b!685691 m!649877))

(declare-fun m!649879 () Bool)

(assert (=> b!685683 m!649879))

(declare-fun m!649881 () Bool)

(assert (=> b!685689 m!649881))

(declare-fun m!649883 () Bool)

(assert (=> b!685694 m!649883))

(declare-fun m!649885 () Bool)

(assert (=> b!685696 m!649885))

(declare-fun m!649887 () Bool)

(assert (=> b!685693 m!649887))

(assert (=> b!685687 m!649887))

(declare-fun m!649889 () Bool)

(assert (=> b!685701 m!649889))

(assert (=> b!685685 m!649887))

(push 1)

(assert (not start!61178))

(assert (not b!685685))

(assert (not b!685693))

(assert (not b!685695))

(assert (not b!685684))

(assert (not b!685704))

(assert (not b!685700))

(assert (not b!685687))

(assert (not b!685697))

(assert (not b!685682))

(assert (not b!685683))

(assert (not b!685699))

(assert (not b!685689))

(assert (not b!685701))

(assert (not b!685703))

(assert (not b!685691))

(assert (not b!685696))

(assert (not b!685694))

(assert (not b!685702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94621 () Bool)

(declare-fun lt!314828 () Bool)

(declare-fun content!293 (List!13037) (Set (_ BitVec 64)))

(assert (=> d!94621 (= lt!314828 (set.member k!2843 (content!293 acc!681)))))

(declare-fun e!390592 () Bool)

(assert (=> d!94621 (= lt!314828 e!390592)))

(declare-fun res!451176 () Bool)

(assert (=> d!94621 (=> (not res!451176) (not e!390592))))

(assert (=> d!94621 (= res!451176 (is-Cons!13033 acc!681))))

(assert (=> d!94621 (= (contains!3614 acc!681 k!2843) lt!314828)))

(declare-fun b!685908 () Bool)

(declare-fun e!390593 () Bool)

(assert (=> b!685908 (= e!390592 e!390593)))

(declare-fun res!451177 () Bool)

(assert (=> b!685908 (=> res!451177 e!390593)))

(assert (=> b!685908 (= res!451177 (= (h!14078 acc!681) k!2843))))

(declare-fun b!685909 () Bool)

(assert (=> b!685909 (= e!390593 (contains!3614 (t!19289 acc!681) k!2843))))

(assert (= (and d!94621 res!451176) b!685908))

(assert (= (and b!685908 (not res!451177)) b!685909))

(declare-fun m!650039 () Bool)

(assert (=> d!94621 m!650039))

(declare-fun m!650041 () Bool)

(assert (=> d!94621 m!650041))

(declare-fun m!650043 () Bool)

(assert (=> b!685909 m!650043))

(assert (=> b!685687 d!94621))

(declare-fun d!94627 () Bool)

(declare-fun res!451194 () Bool)

(declare-fun e!390618 () Bool)

(assert (=> d!94627 (=> res!451194 e!390618)))

(assert (=> d!94627 (= res!451194 (is-Nil!13034 acc!681))))

(assert (=> d!94627 (= (subseq!200 acc!681 acc!681) e!390618)))

(declare-fun b!685939 () Bool)

(declare-fun e!390615 () Bool)

(assert (=> b!685939 (= e!390615 (subseq!200 acc!681 (t!19289 acc!681)))))

(declare-fun b!685936 () Bool)

(declare-fun e!390617 () Bool)

(assert (=> b!685936 (= e!390618 e!390617)))

(declare-fun res!451192 () Bool)

(assert (=> b!685936 (=> (not res!451192) (not e!390617))))

(assert (=> b!685936 (= res!451192 (is-Cons!13033 acc!681))))

(declare-fun b!685938 () Bool)

(declare-fun e!390616 () Bool)

(assert (=> b!685938 (= e!390616 (subseq!200 (t!19289 acc!681) (t!19289 acc!681)))))

(declare-fun b!685937 () Bool)

(assert (=> b!685937 (= e!390617 e!390615)))

(declare-fun res!451193 () Bool)

(assert (=> b!685937 (=> res!451193 e!390615)))

(assert (=> b!685937 (= res!451193 e!390616)))

(declare-fun res!451195 () Bool)

(assert (=> b!685937 (=> (not res!451195) (not e!390616))))

(assert (=> b!685937 (= res!451195 (= (h!14078 acc!681) (h!14078 acc!681)))))

(assert (= (and d!94627 (not res!451194)) b!685936))

(assert (= (and b!685936 res!451192) b!685937))

(assert (= (and b!685937 res!451195) b!685938))

(assert (= (and b!685937 (not res!451193)) b!685939))

(declare-fun m!650049 () Bool)

(assert (=> b!685939 m!650049))

(declare-fun m!650051 () Bool)

(assert (=> b!685938 m!650051))

(assert (=> b!685697 d!94627))

(declare-fun d!94631 () Bool)

(declare-fun res!451210 () Bool)

(declare-fun e!390636 () Bool)

(assert (=> d!94631 (=> res!451210 e!390636)))

(assert (=> d!94631 (= res!451210 (= (select (arr!18996 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94631 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390636)))

(declare-fun b!685960 () Bool)

(declare-fun e!390637 () Bool)

(assert (=> b!685960 (= e!390636 e!390637)))

(declare-fun res!451211 () Bool)

(assert (=> b!685960 (=> (not res!451211) (not e!390637))))

(assert (=> b!685960 (= res!451211 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19368 a!3626)))))

(declare-fun b!685961 () Bool)

(assert (=> b!685961 (= e!390637 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94631 (not res!451210)) b!685960))

(assert (= (and b!685960 res!451211) b!685961))

(declare-fun m!650075 () Bool)

(assert (=> d!94631 m!650075))

(declare-fun m!650079 () Bool)

(assert (=> b!685961 m!650079))

(assert (=> b!685697 d!94631))

(declare-fun d!94639 () Bool)

(assert (=> d!94639 (= (-!165 ($colon$colon!365 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!314837 () Unit!24147)

(declare-fun choose!16 ((_ BitVec 64) List!13037) Unit!24147)

(assert (=> d!94639 (= lt!314837 (choose!16 k!2843 acc!681))))

(assert (=> d!94639 (not (contains!3614 acc!681 k!2843))))

(assert (=> d!94639 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!314837)))

(declare-fun bs!20108 () Bool)

(assert (= bs!20108 d!94639))

(assert (=> bs!20108 m!649847))

(assert (=> bs!20108 m!649847))

(declare-fun m!650087 () Bool)

(assert (=> bs!20108 m!650087))

(declare-fun m!650091 () Bool)

(assert (=> bs!20108 m!650091))

(assert (=> bs!20108 m!649887))

(assert (=> b!685697 d!94639))

(declare-fun e!390683 () Bool)

(declare-fun lt!314847 () List!13037)

(declare-fun b!686011 () Bool)

(assert (=> b!686011 (= e!390683 (= (content!293 lt!314847) (set.minus (content!293 lt!314756) (set.insert k!2843 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!686012 () Bool)

(declare-fun e!390685 () List!13037)

(declare-fun e!390684 () List!13037)

(assert (=> b!686012 (= e!390685 e!390684)))

(declare-fun c!77747 () Bool)

(assert (=> b!686012 (= c!77747 (= k!2843 (h!14078 lt!314756)))))

(declare-fun bm!34086 () Bool)

(declare-fun call!34089 () List!13037)

(assert (=> bm!34086 (= call!34089 (-!165 (t!19289 lt!314756) k!2843))))

(declare-fun b!686013 () Bool)

(assert (=> b!686013 (= e!390684 call!34089)))

(declare-fun d!94647 () Bool)

(assert (=> d!94647 e!390683))

(declare-fun res!451251 () Bool)

(assert (=> d!94647 (=> (not res!451251) (not e!390683))))

(declare-fun size!19372 (List!13037) Int)

(assert (=> d!94647 (= res!451251 (<= (size!19372 lt!314847) (size!19372 lt!314756)))))

(assert (=> d!94647 (= lt!314847 e!390685)))

(declare-fun c!77748 () Bool)

(assert (=> d!94647 (= c!77748 (is-Cons!13033 lt!314756))))

(assert (=> d!94647 (= (-!165 lt!314756 k!2843) lt!314847)))

(declare-fun b!686014 () Bool)

(assert (=> b!686014 (= e!390684 (Cons!13033 (h!14078 lt!314756) call!34089))))

(declare-fun b!686015 () Bool)

(assert (=> b!686015 (= e!390685 Nil!13034)))

(assert (= (and d!94647 c!77748) b!686012))

(assert (= (and d!94647 (not c!77748)) b!686015))

(assert (= (and b!686012 c!77747) b!686013))

(assert (= (and b!686012 (not c!77747)) b!686014))

(assert (= (or b!686013 b!686014) bm!34086))

(assert (= (and d!94647 res!451251) b!686011))

(declare-fun m!650123 () Bool)

(assert (=> b!686011 m!650123))

(declare-fun m!650125 () Bool)

(assert (=> b!686011 m!650125))

(declare-fun m!650129 () Bool)

(assert (=> b!686011 m!650129))

(declare-fun m!650131 () Bool)

(assert (=> bm!34086 m!650131))

(declare-fun m!650133 () Bool)

(assert (=> d!94647 m!650133))

(declare-fun m!650135 () Bool)

(assert (=> d!94647 m!650135))

(assert (=> b!685697 d!94647))

(declare-fun d!94667 () Bool)

(declare-fun res!451255 () Bool)

(declare-fun e!390690 () Bool)

(assert (=> d!94667 (=> res!451255 e!390690)))

(assert (=> d!94667 (= res!451255 (= (select (arr!18996 (array!39638 (store (arr!18996 a!3626) i!1382 k!2843) (size!19368 a!3626))) from!3004) k!2843))))

(assert (=> d!94667 (= (arrayContainsKey!0 (array!39638 (store (arr!18996 a!3626) i!1382 k!2843) (size!19368 a!3626)) k!2843 from!3004) e!390690)))

(declare-fun b!686021 () Bool)

(declare-fun e!390691 () Bool)

(assert (=> b!686021 (= e!390690 e!390691)))

(declare-fun res!451256 () Bool)

(assert (=> b!686021 (=> (not res!451256) (not e!390691))))

(assert (=> b!686021 (= res!451256 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19368 (array!39638 (store (arr!18996 a!3626) i!1382 k!2843) (size!19368 a!3626)))))))

(declare-fun b!686022 () Bool)

(assert (=> b!686022 (= e!390691 (arrayContainsKey!0 (array!39638 (store (arr!18996 a!3626) i!1382 k!2843) (size!19368 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94667 (not res!451255)) b!686021))

(assert (= (and b!686021 res!451256) b!686022))

(declare-fun m!650141 () Bool)

(assert (=> d!94667 m!650141))

(declare-fun m!650143 () Bool)

(assert (=> b!686022 m!650143))

(assert (=> b!685697 d!94667))

(declare-fun d!94671 () Bool)

(assert (=> d!94671 (subseq!200 acc!681 acc!681)))

(declare-fun lt!314855 () Unit!24147)

(declare-fun choose!36 (List!13037) Unit!24147)

(assert (=> d!94671 (= lt!314855 (choose!36 acc!681))))

(assert (=> d!94671 (= (lemmaListSubSeqRefl!0 acc!681) lt!314855)))

(declare-fun bs!20112 () Bool)

(assert (= bs!20112 d!94671))

(assert (=> bs!20112 m!649855))

(declare-fun m!650157 () Bool)

(assert (=> bs!20112 m!650157))

(assert (=> b!685697 d!94671))

(declare-fun d!94677 () Bool)

(assert (=> d!94677 (= (validKeyInArray!0 (select (arr!18996 a!3626) from!3004)) (and (not (= (select (arr!18996 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18996 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685697 d!94677))

(declare-fun d!94681 () Bool)

(assert (=> d!94681 (= ($colon$colon!365 acc!681 k!2843) (Cons!13033 k!2843 acc!681))))

(assert (=> b!685697 d!94681))

(declare-fun b!686065 () Bool)

(declare-fun e!390732 () Bool)

(declare-fun call!34095 () Bool)

(assert (=> b!686065 (= e!390732 call!34095)))

(declare-fun b!686066 () Bool)

(assert (=> b!686066 (= e!390732 call!34095)))

(declare-fun c!77754 () Bool)

(declare-fun bm!34092 () Bool)

(assert (=> bm!34092 (= call!34095 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77754 (Cons!13033 (select (arr!18996 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun d!94685 () Bool)

(declare-fun res!451293 () Bool)

(declare-fun e!390730 () Bool)

(assert (=> d!94685 (=> res!451293 e!390730)))

(assert (=> d!94685 (= res!451293 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19368 a!3626)))))

(assert (=> d!94685 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390730)))

(declare-fun b!686067 () Bool)

(declare-fun e!390731 () Bool)

(assert (=> b!686067 (= e!390731 e!390732)))

(assert (=> b!686067 (= c!77754 (validKeyInArray!0 (select (arr!18996 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686068 () Bool)

(assert (=> b!686068 (= e!390730 e!390731)))

(declare-fun res!451291 () Bool)

(assert (=> b!686068 (=> (not res!451291) (not e!390731))))

(declare-fun e!390733 () Bool)

(assert (=> b!686068 (= res!451291 (not e!390733))))

(declare-fun res!451292 () Bool)

(assert (=> b!686068 (=> (not res!451292) (not e!390733))))

(assert (=> b!686068 (= res!451292 (validKeyInArray!0 (select (arr!18996 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686069 () Bool)

(assert (=> b!686069 (= e!390733 (contains!3614 acc!681 (select (arr!18996 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94685 (not res!451293)) b!686068))

(assert (= (and b!686068 res!451292) b!686069))

(assert (= (and b!686068 res!451291) b!686067))

(assert (= (and b!686067 c!77754) b!686066))

(assert (= (and b!686067 (not c!77754)) b!686065))

(assert (= (or b!686066 b!686065) bm!34092))

(assert (=> bm!34092 m!650075))

(declare-fun m!650203 () Bool)

(assert (=> bm!34092 m!650203))

(assert (=> b!686067 m!650075))

(assert (=> b!686067 m!650075))

(declare-fun m!650205 () Bool)

(assert (=> b!686067 m!650205))

(assert (=> b!686068 m!650075))

(assert (=> b!686068 m!650075))

(assert (=> b!686068 m!650205))

(assert (=> b!686069 m!650075))

(assert (=> b!686069 m!650075))

(declare-fun m!650207 () Bool)

(assert (=> b!686069 m!650207))

(assert (=> b!685697 d!94685))

(assert (=> b!685685 d!94621))

(declare-fun b!686074 () Bool)

(declare-fun e!390740 () Bool)

(declare-fun call!34096 () Bool)

(assert (=> b!686074 (= e!390740 call!34096)))

(declare-fun b!686075 () Bool)

(assert (=> b!686075 (= e!390740 call!34096)))

(declare-fun bm!34093 () Bool)

(declare-fun c!77755 () Bool)

(assert (=> bm!34093 (= call!34096 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77755 (Cons!13033 (select (arr!18996 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!94717 () Bool)

(declare-fun res!451300 () Bool)

(declare-fun e!390738 () Bool)

(assert (=> d!94717 (=> res!451300 e!390738)))

(assert (=> d!94717 (= res!451300 (bvsge from!3004 (size!19368 a!3626)))))

(assert (=> d!94717 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390738)))

(declare-fun b!686076 () Bool)

(declare-fun e!390739 () Bool)

(assert (=> b!686076 (= e!390739 e!390740)))

(assert (=> b!686076 (= c!77755 (validKeyInArray!0 (select (arr!18996 a!3626) from!3004)))))

(declare-fun b!686077 () Bool)

(assert (=> b!686077 (= e!390738 e!390739)))

(declare-fun res!451298 () Bool)

(assert (=> b!686077 (=> (not res!451298) (not e!390739))))

(declare-fun e!390741 () Bool)

(assert (=> b!686077 (= res!451298 (not e!390741))))

(declare-fun res!451299 () Bool)

(assert (=> b!686077 (=> (not res!451299) (not e!390741))))

(assert (=> b!686077 (= res!451299 (validKeyInArray!0 (select (arr!18996 a!3626) from!3004)))))

(declare-fun b!686078 () Bool)

(assert (=> b!686078 (= e!390741 (contains!3614 acc!681 (select (arr!18996 a!3626) from!3004)))))

(assert (= (and d!94717 (not res!451300)) b!686077))

(assert (= (and b!686077 res!451299) b!686078))

(assert (= (and b!686077 res!451298) b!686076))

(assert (= (and b!686076 c!77755) b!686075))

(assert (= (and b!686076 (not c!77755)) b!686074))

(assert (= (or b!686075 b!686074) bm!34093))

(assert (=> bm!34093 m!649837))

(declare-fun m!650209 () Bool)

(assert (=> bm!34093 m!650209))

(assert (=> b!686076 m!649837))

(assert (=> b!686076 m!649837))

(assert (=> b!686076 m!649849))

(assert (=> b!686077 m!649837))

(assert (=> b!686077 m!649837))

(assert (=> b!686077 m!649849))

(assert (=> b!686078 m!649837))

(assert (=> b!686078 m!649837))

(declare-fun m!650211 () Bool)

(assert (=> b!686078 m!650211))

(assert (=> b!685696 d!94717))

(declare-fun d!94719 () Bool)

(declare-fun lt!314864 () Bool)

(assert (=> d!94719 (= lt!314864 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!293 lt!314756)))))

(declare-fun e!390742 () Bool)

(assert (=> d!94719 (= lt!314864 e!390742)))

(declare-fun res!451301 () Bool)

(assert (=> d!94719 (=> (not res!451301) (not e!390742))))

(assert (=> d!94719 (= res!451301 (is-Cons!13033 lt!314756))))

(assert (=> d!94719 (= (contains!3614 lt!314756 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314864)))

(declare-fun b!686079 () Bool)

(declare-fun e!390743 () Bool)

(assert (=> b!686079 (= e!390742 e!390743)))

(declare-fun res!451302 () Bool)

(assert (=> b!686079 (=> res!451302 e!390743)))

(assert (=> b!686079 (= res!451302 (= (h!14078 lt!314756) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686080 () Bool)

(assert (=> b!686080 (= e!390743 (contains!3614 (t!19289 lt!314756) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94719 res!451301) b!686079))

(assert (= (and b!686079 (not res!451302)) b!686080))

(assert (=> d!94719 m!650125))

(declare-fun m!650213 () Bool)

(assert (=> d!94719 m!650213))

(declare-fun m!650215 () Bool)

(assert (=> b!686080 m!650215))

(assert (=> b!685695 d!94719))

(declare-fun d!94721 () Bool)

(assert (=> d!94721 (= ($colon$colon!365 acc!681 (select (arr!18996 a!3626) from!3004)) (Cons!13033 (select (arr!18996 a!3626) from!3004) acc!681))))

(assert (=> b!685684 d!94721))

(assert (=> b!685684 d!94627))

(declare-fun d!94723 () Bool)

(assert (=> d!94723 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314872 () Unit!24147)

(declare-fun choose!80 (array!39637 List!13037 List!13037 (_ BitVec 32)) Unit!24147)

(assert (=> d!94723 (= lt!314872 (choose!80 a!3626 ($colon$colon!365 acc!681 (select (arr!18996 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94723 (bvslt (size!19368 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94723 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!365 acc!681 (select (arr!18996 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314872)))

(declare-fun bs!20117 () Bool)

(assert (= bs!20117 d!94723))

(assert (=> bs!20117 m!649835))

(assert (=> bs!20117 m!649873))

(declare-fun m!650219 () Bool)

(assert (=> bs!20117 m!650219))

(assert (=> b!685684 d!94723))

(assert (=> b!685684 d!94671))

(assert (=> b!685684 d!94685))

(declare-fun d!94727 () Bool)

(declare-fun res!451307 () Bool)

(declare-fun e!390754 () Bool)

(assert (=> d!94727 (=> res!451307 e!390754)))

(assert (=> d!94727 (= res!451307 (is-Nil!13034 acc!681))))

(assert (=> d!94727 (= (subseq!200 acc!681 lt!314756) e!390754)))

(declare-fun b!686094 () Bool)

(declare-fun e!390751 () Bool)

(assert (=> b!686094 (= e!390751 (subseq!200 acc!681 (t!19289 lt!314756)))))

(declare-fun b!686091 () Bool)

(declare-fun e!390753 () Bool)

(assert (=> b!686091 (= e!390754 e!390753)))

(declare-fun res!451305 () Bool)

(assert (=> b!686091 (=> (not res!451305) (not e!390753))))

(assert (=> b!686091 (= res!451305 (is-Cons!13033 lt!314756))))

(declare-fun b!686093 () Bool)

(declare-fun e!390752 () Bool)

(assert (=> b!686093 (= e!390752 (subseq!200 (t!19289 acc!681) (t!19289 lt!314756)))))

(declare-fun b!686092 () Bool)

(assert (=> b!686092 (= e!390753 e!390751)))

(declare-fun res!451306 () Bool)

(assert (=> b!686092 (=> res!451306 e!390751)))

(assert (=> b!686092 (= res!451306 e!390752)))

(declare-fun res!451308 () Bool)

(assert (=> b!686092 (=> (not res!451308) (not e!390752))))

(assert (=> b!686092 (= res!451308 (= (h!14078 acc!681) (h!14078 lt!314756)))))

(assert (= (and d!94727 (not res!451307)) b!686091))

(assert (= (and b!686091 res!451305) b!686092))

(assert (= (and b!686092 res!451308) b!686093))

(assert (= (and b!686092 (not res!451306)) b!686094))

(declare-fun m!650221 () Bool)

(assert (=> b!686094 m!650221))

(declare-fun m!650223 () Bool)

(assert (=> b!686093 m!650223))

(assert (=> b!685683 d!94727))

(declare-fun d!94729 () Bool)

(declare-fun lt!314873 () Bool)

(assert (=> d!94729 (= lt!314873 (set.member k!2843 (content!293 lt!314756)))))

(declare-fun e!390755 () Bool)

(assert (=> d!94729 (= lt!314873 e!390755)))

(declare-fun res!451309 () Bool)

(assert (=> d!94729 (=> (not res!451309) (not e!390755))))

(assert (=> d!94729 (= res!451309 (is-Cons!13033 lt!314756))))

(assert (=> d!94729 (= (contains!3614 lt!314756 k!2843) lt!314873)))

(declare-fun b!686095 () Bool)

(declare-fun e!390756 () Bool)

(assert (=> b!686095 (= e!390755 e!390756)))

(declare-fun res!451310 () Bool)

(assert (=> b!686095 (=> res!451310 e!390756)))

(assert (=> b!686095 (= res!451310 (= (h!14078 lt!314756) k!2843))))

(declare-fun b!686096 () Bool)

(assert (=> b!686096 (= e!390756 (contains!3614 (t!19289 lt!314756) k!2843))))

(assert (= (and d!94729 res!451309) b!686095))

(assert (= (and b!686095 (not res!451310)) b!686096))

(assert (=> d!94729 m!650125))

(declare-fun m!650225 () Bool)

(assert (=> d!94729 m!650225))

(declare-fun m!650227 () Bool)

(assert (=> b!686096 m!650227))

(assert (=> b!685694 d!94729))

(assert (=> b!685693 d!94621))

(declare-fun b!686097 () Bool)

(declare-fun e!390759 () Bool)

(declare-fun call!34099 () Bool)

(assert (=> b!686097 (= e!390759 call!34099)))

(declare-fun b!686098 () Bool)

(assert (=> b!686098 (= e!390759 call!34099)))

(declare-fun bm!34096 () Bool)

(declare-fun c!77760 () Bool)

(assert (=> bm!34096 (= call!34099 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77760 (Cons!13033 (select (arr!18996 a!3626) #b00000000000000000000000000000000) Nil!13034) Nil!13034)))))

(declare-fun d!94731 () Bool)

(declare-fun res!451313 () Bool)

(declare-fun e!390757 () Bool)

(assert (=> d!94731 (=> res!451313 e!390757)))

(assert (=> d!94731 (= res!451313 (bvsge #b00000000000000000000000000000000 (size!19368 a!3626)))))

(assert (=> d!94731 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13034) e!390757)))

(declare-fun b!686099 () Bool)

(declare-fun e!390758 () Bool)

(assert (=> b!686099 (= e!390758 e!390759)))

(assert (=> b!686099 (= c!77760 (validKeyInArray!0 (select (arr!18996 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686100 () Bool)

(assert (=> b!686100 (= e!390757 e!390758)))

(declare-fun res!451311 () Bool)

(assert (=> b!686100 (=> (not res!451311) (not e!390758))))

(declare-fun e!390760 () Bool)

(assert (=> b!686100 (= res!451311 (not e!390760))))

(declare-fun res!451312 () Bool)

(assert (=> b!686100 (=> (not res!451312) (not e!390760))))

(assert (=> b!686100 (= res!451312 (validKeyInArray!0 (select (arr!18996 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686101 () Bool)

(assert (=> b!686101 (= e!390760 (contains!3614 Nil!13034 (select (arr!18996 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94731 (not res!451313)) b!686100))

(assert (= (and b!686100 res!451312) b!686101))

(assert (= (and b!686100 res!451311) b!686099))

(assert (= (and b!686099 c!77760) b!686098))

(assert (= (and b!686099 (not c!77760)) b!686097))

(assert (= (or b!686098 b!686097) bm!34096))

(declare-fun m!650229 () Bool)

(assert (=> bm!34096 m!650229))

(declare-fun m!650231 () Bool)

(assert (=> bm!34096 m!650231))

(assert (=> b!686099 m!650229))

(assert (=> b!686099 m!650229))

(declare-fun m!650233 () Bool)

(assert (=> b!686099 m!650233))

(assert (=> b!686100 m!650229))

(assert (=> b!686100 m!650229))

(assert (=> b!686100 m!650233))

(assert (=> b!686101 m!650229))

(assert (=> b!686101 m!650229))

(declare-fun m!650235 () Bool)

(assert (=> b!686101 m!650235))

(assert (=> b!685704 d!94731))

(declare-fun d!94733 () Bool)

(declare-fun lt!314875 () Bool)

(assert (=> d!94733 (= lt!314875 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!293 acc!681)))))

(declare-fun e!390763 () Bool)

(assert (=> d!94733 (= lt!314875 e!390763)))

(declare-fun res!451315 () Bool)

(assert (=> d!94733 (=> (not res!451315) (not e!390763))))

(assert (=> d!94733 (= res!451315 (is-Cons!13033 acc!681))))

(assert (=> d!94733 (= (contains!3614 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314875)))

(declare-fun b!686106 () Bool)

(declare-fun e!390765 () Bool)

(assert (=> b!686106 (= e!390763 e!390765)))

(declare-fun res!451316 () Bool)

(assert (=> b!686106 (=> res!451316 e!390765)))

(assert (=> b!686106 (= res!451316 (= (h!14078 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686108 () Bool)

(assert (=> b!686108 (= e!390765 (contains!3614 (t!19289 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94733 res!451315) b!686106))

(assert (= (and b!686106 (not res!451316)) b!686108))

(assert (=> d!94733 m!650039))

(declare-fun m!650237 () Bool)

(assert (=> d!94733 m!650237))

(declare-fun m!650239 () Bool)

(assert (=> b!686108 m!650239))

(assert (=> b!685703 d!94733))

(declare-fun d!94735 () Bool)

(assert (=> d!94735 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685682 d!94735))

(declare-fun d!94737 () Bool)

(declare-fun res!451325 () Bool)

(declare-fun e!390774 () Bool)

(assert (=> d!94737 (=> res!451325 e!390774)))

(assert (=> d!94737 (= res!451325 (is-Nil!13034 acc!681))))

(assert (=> d!94737 (= (noDuplicate!861 acc!681) e!390774)))

(declare-fun b!686117 () Bool)

(declare-fun e!390775 () Bool)

(assert (=> b!686117 (= e!390774 e!390775)))

(declare-fun res!451326 () Bool)

(assert (=> b!686117 (=> (not res!451326) (not e!390775))))

(assert (=> b!686117 (= res!451326 (not (contains!3614 (t!19289 acc!681) (h!14078 acc!681))))))

(declare-fun b!686118 () Bool)

(assert (=> b!686118 (= e!390775 (noDuplicate!861 (t!19289 acc!681)))))

(assert (= (and d!94737 (not res!451325)) b!686117))

(assert (= (and b!686117 res!451326) b!686118))

(declare-fun m!650259 () Bool)

(assert (=> b!686117 m!650259))

(declare-fun m!650261 () Bool)

(assert (=> b!686118 m!650261))

(assert (=> b!685691 d!94737))

(declare-fun d!94747 () Bool)

(assert (=> d!94747 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314879 () Unit!24147)

(declare-fun choose!13 (array!39637 (_ BitVec 64) (_ BitVec 32)) Unit!24147)

(assert (=> d!94747 (= lt!314879 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94747 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94747 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!314879)))

(declare-fun bs!20118 () Bool)

(assert (= bs!20118 d!94747))

(assert (=> bs!20118 m!649889))

(declare-fun m!650263 () Bool)

(assert (=> bs!20118 m!650263))

(assert (=> b!685702 d!94747))

(declare-fun d!94749 () Bool)

(declare-fun res!451327 () Bool)

(declare-fun e!390776 () Bool)

(assert (=> d!94749 (=> res!451327 e!390776)))

(assert (=> d!94749 (= res!451327 (= (select (arr!18996 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94749 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!390776)))

(declare-fun b!686119 () Bool)

(declare-fun e!390777 () Bool)

(assert (=> b!686119 (= e!390776 e!390777)))

(declare-fun res!451328 () Bool)

(assert (=> b!686119 (=> (not res!451328) (not e!390777))))

(assert (=> b!686119 (= res!451328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19368 a!3626)))))

(declare-fun b!686120 () Bool)

(assert (=> b!686120 (= e!390777 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94749 (not res!451327)) b!686119))

(assert (= (and b!686119 res!451328) b!686120))

(assert (=> d!94749 m!650229))

(declare-fun m!650265 () Bool)

(assert (=> b!686120 m!650265))

(assert (=> b!685701 d!94749))

(declare-fun d!94751 () Bool)

(declare-fun lt!314880 () Bool)

(assert (=> d!94751 (= lt!314880 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!293 acc!681)))))

(declare-fun e!390778 () Bool)

(assert (=> d!94751 (= lt!314880 e!390778)))

(declare-fun res!451329 () Bool)

(assert (=> d!94751 (=> (not res!451329) (not e!390778))))

(assert (=> d!94751 (= res!451329 (is-Cons!13033 acc!681))))

(assert (=> d!94751 (= (contains!3614 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314880)))

(declare-fun b!686121 () Bool)

(declare-fun e!390779 () Bool)

(assert (=> b!686121 (= e!390778 e!390779)))

(declare-fun res!451330 () Bool)

