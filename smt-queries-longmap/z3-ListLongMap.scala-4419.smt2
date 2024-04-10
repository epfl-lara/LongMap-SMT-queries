; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61006 () Bool)

(assert start!61006)

(declare-fun res!450166 () Bool)

(declare-fun e!389844 () Bool)

(assert (=> start!61006 (=> (not res!450166) (not e!389844))))

(declare-datatypes ((array!39615 0))(
  ( (array!39616 (arr!18988 (Array (_ BitVec 32) (_ BitVec 64))) (size!19355 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39615)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61006 (= res!450166 (and (bvslt (size!19355 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19355 a!3626))))))

(assert (=> start!61006 e!389844))

(assert (=> start!61006 true))

(declare-fun array_inv!14784 (array!39615) Bool)

(assert (=> start!61006 (array_inv!14784 a!3626)))

(declare-fun b!684620 () Bool)

(declare-fun res!450158 () Bool)

(declare-fun e!389841 () Bool)

(assert (=> b!684620 (=> res!450158 e!389841)))

(declare-datatypes ((List!13029 0))(
  ( (Nil!13026) (Cons!13025 (h!14070 (_ BitVec 64)) (t!19275 List!13029)) )
))
(declare-fun acc!681 () List!13029)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3606 (List!13029 (_ BitVec 64)) Bool)

(assert (=> b!684620 (= res!450158 (contains!3606 acc!681 k0!2843))))

(declare-fun b!684621 () Bool)

(declare-fun res!450153 () Bool)

(assert (=> b!684621 (=> (not res!450153) (not e!389844))))

(assert (=> b!684621 (= res!450153 (not (contains!3606 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684622 () Bool)

(declare-fun res!450161 () Bool)

(assert (=> b!684622 (=> (not res!450161) (not e!389844))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684622 (= res!450161 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19355 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684623 () Bool)

(declare-fun res!450165 () Bool)

(assert (=> b!684623 (=> (not res!450165) (not e!389844))))

(declare-fun arrayNoDuplicates!0 (array!39615 (_ BitVec 32) List!13029) Bool)

(assert (=> b!684623 (= res!450165 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13026))))

(declare-fun b!684624 () Bool)

(declare-fun res!450159 () Bool)

(assert (=> b!684624 (=> (not res!450159) (not e!389844))))

(assert (=> b!684624 (= res!450159 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19355 a!3626))))))

(declare-fun b!684625 () Bool)

(declare-fun e!389843 () Bool)

(assert (=> b!684625 (= e!389843 (not (contains!3606 acc!681 k0!2843)))))

(declare-fun b!684626 () Bool)

(declare-fun res!450157 () Bool)

(assert (=> b!684626 (=> (not res!450157) (not e!389844))))

(assert (=> b!684626 (= res!450157 (not (contains!3606 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684627 () Bool)

(declare-fun res!450156 () Bool)

(assert (=> b!684627 (=> (not res!450156) (not e!389844))))

(declare-fun e!389842 () Bool)

(assert (=> b!684627 (= res!450156 e!389842)))

(declare-fun res!450155 () Bool)

(assert (=> b!684627 (=> res!450155 e!389842)))

(declare-fun e!389840 () Bool)

(assert (=> b!684627 (= res!450155 e!389840)))

(declare-fun res!450160 () Bool)

(assert (=> b!684627 (=> (not res!450160) (not e!389840))))

(assert (=> b!684627 (= res!450160 (bvsgt from!3004 i!1382))))

(declare-fun b!684628 () Bool)

(declare-fun res!450152 () Bool)

(assert (=> b!684628 (=> (not res!450152) (not e!389844))))

(declare-fun arrayContainsKey!0 (array!39615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684628 (= res!450152 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684629 () Bool)

(declare-datatypes ((Unit!24107 0))(
  ( (Unit!24108) )
))
(declare-fun e!389839 () Unit!24107)

(declare-fun Unit!24109 () Unit!24107)

(assert (=> b!684629 (= e!389839 Unit!24109)))

(declare-fun lt!314409 () Unit!24107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39615 (_ BitVec 64) (_ BitVec 32)) Unit!24107)

(assert (=> b!684629 (= lt!314409 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684629 false))

(declare-fun b!684630 () Bool)

(declare-fun res!450163 () Bool)

(assert (=> b!684630 (=> (not res!450163) (not e!389844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684630 (= res!450163 (validKeyInArray!0 k0!2843))))

(declare-fun b!684631 () Bool)

(declare-fun e!389837 () Unit!24107)

(declare-fun Unit!24110 () Unit!24107)

(assert (=> b!684631 (= e!389837 Unit!24110)))

(declare-fun b!684632 () Bool)

(declare-fun res!450167 () Bool)

(assert (=> b!684632 (=> (not res!450167) (not e!389844))))

(declare-fun noDuplicate!853 (List!13029) Bool)

(assert (=> b!684632 (= res!450167 (noDuplicate!853 acc!681))))

(declare-fun b!684633 () Bool)

(assert (=> b!684633 (= e!389842 e!389843)))

(declare-fun res!450162 () Bool)

(assert (=> b!684633 (=> (not res!450162) (not e!389843))))

(assert (=> b!684633 (= res!450162 (bvsle from!3004 i!1382))))

(declare-fun b!684634 () Bool)

(assert (=> b!684634 (= e!389844 (not e!389841))))

(declare-fun res!450164 () Bool)

(assert (=> b!684634 (=> res!450164 e!389841)))

(assert (=> b!684634 (= res!450164 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!314406 () List!13029)

(declare-fun -!157 (List!13029 (_ BitVec 64)) List!13029)

(assert (=> b!684634 (= (-!157 lt!314406 k0!2843) acc!681)))

(declare-fun $colon$colon!357 (List!13029 (_ BitVec 64)) List!13029)

(assert (=> b!684634 (= lt!314406 ($colon$colon!357 acc!681 k0!2843))))

(declare-fun lt!314407 () Unit!24107)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13029) Unit!24107)

(assert (=> b!684634 (= lt!314407 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!192 (List!13029 List!13029) Bool)

(assert (=> b!684634 (subseq!192 acc!681 acc!681)))

(declare-fun lt!314402 () Unit!24107)

(declare-fun lemmaListSubSeqRefl!0 (List!13029) Unit!24107)

(assert (=> b!684634 (= lt!314402 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684634 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314410 () Unit!24107)

(assert (=> b!684634 (= lt!314410 e!389837)))

(declare-fun c!77603 () Bool)

(assert (=> b!684634 (= c!77603 (validKeyInArray!0 (select (arr!18988 a!3626) from!3004)))))

(declare-fun lt!314403 () Unit!24107)

(assert (=> b!684634 (= lt!314403 e!389839)))

(declare-fun c!77602 () Bool)

(declare-fun lt!314408 () Bool)

(assert (=> b!684634 (= c!77602 lt!314408)))

(assert (=> b!684634 (= lt!314408 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684634 (arrayContainsKey!0 (array!39616 (store (arr!18988 a!3626) i!1382 k0!2843) (size!19355 a!3626)) k0!2843 from!3004)))

(declare-fun b!684635 () Bool)

(declare-fun res!450151 () Bool)

(assert (=> b!684635 (=> res!450151 e!389841)))

(assert (=> b!684635 (= res!450151 lt!314408)))

(declare-fun b!684636 () Bool)

(assert (=> b!684636 (= e!389840 (contains!3606 acc!681 k0!2843))))

(declare-fun b!684637 () Bool)

(declare-fun res!450150 () Bool)

(assert (=> b!684637 (=> res!450150 e!389841)))

(assert (=> b!684637 (= res!450150 (not (noDuplicate!853 lt!314406)))))

(declare-fun b!684638 () Bool)

(assert (=> b!684638 (= e!389841 (subseq!192 acc!681 lt!314406))))

(declare-fun b!684639 () Bool)

(declare-fun res!450154 () Bool)

(assert (=> b!684639 (=> (not res!450154) (not e!389844))))

(assert (=> b!684639 (= res!450154 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684640 () Bool)

(declare-fun lt!314404 () Unit!24107)

(assert (=> b!684640 (= e!389837 lt!314404)))

(declare-fun lt!314405 () Unit!24107)

(assert (=> b!684640 (= lt!314405 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684640 (subseq!192 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39615 List!13029 List!13029 (_ BitVec 32)) Unit!24107)

(assert (=> b!684640 (= lt!314404 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!357 acc!681 (select (arr!18988 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684640 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684641 () Bool)

(declare-fun Unit!24111 () Unit!24107)

(assert (=> b!684641 (= e!389839 Unit!24111)))

(assert (= (and start!61006 res!450166) b!684632))

(assert (= (and b!684632 res!450167) b!684621))

(assert (= (and b!684621 res!450153) b!684626))

(assert (= (and b!684626 res!450157) b!684627))

(assert (= (and b!684627 res!450160) b!684636))

(assert (= (and b!684627 (not res!450155)) b!684633))

(assert (= (and b!684633 res!450162) b!684625))

(assert (= (and b!684627 res!450156) b!684623))

(assert (= (and b!684623 res!450165) b!684639))

(assert (= (and b!684639 res!450154) b!684624))

(assert (= (and b!684624 res!450159) b!684630))

(assert (= (and b!684630 res!450163) b!684628))

(assert (= (and b!684628 res!450152) b!684622))

(assert (= (and b!684622 res!450161) b!684634))

(assert (= (and b!684634 c!77602) b!684629))

(assert (= (and b!684634 (not c!77602)) b!684641))

(assert (= (and b!684634 c!77603) b!684640))

(assert (= (and b!684634 (not c!77603)) b!684631))

(assert (= (and b!684634 (not res!450164)) b!684637))

(assert (= (and b!684637 (not res!450150)) b!684635))

(assert (= (and b!684635 (not res!450151)) b!684620))

(assert (= (and b!684620 (not res!450158)) b!684638))

(declare-fun m!648931 () Bool)

(assert (=> b!684623 m!648931))

(declare-fun m!648933 () Bool)

(assert (=> b!684637 m!648933))

(declare-fun m!648935 () Bool)

(assert (=> b!684628 m!648935))

(declare-fun m!648937 () Bool)

(assert (=> b!684639 m!648937))

(declare-fun m!648939 () Bool)

(assert (=> b!684632 m!648939))

(declare-fun m!648941 () Bool)

(assert (=> b!684621 m!648941))

(declare-fun m!648943 () Bool)

(assert (=> start!61006 m!648943))

(declare-fun m!648945 () Bool)

(assert (=> b!684636 m!648945))

(assert (=> b!684620 m!648945))

(declare-fun m!648947 () Bool)

(assert (=> b!684638 m!648947))

(declare-fun m!648949 () Bool)

(assert (=> b!684640 m!648949))

(declare-fun m!648951 () Bool)

(assert (=> b!684640 m!648951))

(declare-fun m!648953 () Bool)

(assert (=> b!684640 m!648953))

(declare-fun m!648955 () Bool)

(assert (=> b!684640 m!648955))

(assert (=> b!684640 m!648951))

(assert (=> b!684640 m!648953))

(declare-fun m!648957 () Bool)

(assert (=> b!684640 m!648957))

(declare-fun m!648959 () Bool)

(assert (=> b!684640 m!648959))

(declare-fun m!648961 () Bool)

(assert (=> b!684630 m!648961))

(declare-fun m!648963 () Bool)

(assert (=> b!684626 m!648963))

(declare-fun m!648965 () Bool)

(assert (=> b!684629 m!648965))

(assert (=> b!684625 m!648945))

(assert (=> b!684634 m!648949))

(assert (=> b!684634 m!648951))

(declare-fun m!648967 () Bool)

(assert (=> b!684634 m!648967))

(declare-fun m!648969 () Bool)

(assert (=> b!684634 m!648969))

(declare-fun m!648971 () Bool)

(assert (=> b!684634 m!648971))

(declare-fun m!648973 () Bool)

(assert (=> b!684634 m!648973))

(assert (=> b!684634 m!648951))

(declare-fun m!648975 () Bool)

(assert (=> b!684634 m!648975))

(declare-fun m!648977 () Bool)

(assert (=> b!684634 m!648977))

(assert (=> b!684634 m!648957))

(declare-fun m!648979 () Bool)

(assert (=> b!684634 m!648979))

(assert (=> b!684634 m!648959))

(check-sat (not b!684632) (not b!684620) (not b!684639) (not b!684634) (not b!684636) (not b!684621) (not b!684638) (not b!684640) (not b!684628) (not b!684629) (not start!61006) (not b!684637) (not b!684626) (not b!684630) (not b!684625) (not b!684623))
(check-sat)
(get-model)

(declare-fun d!94319 () Bool)

(declare-fun lt!314443 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!285 (List!13029) (InoxSet (_ BitVec 64)))

(assert (=> d!94319 (= lt!314443 (select (content!285 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389899 () Bool)

(assert (=> d!94319 (= lt!314443 e!389899)))

(declare-fun res!450246 () Bool)

(assert (=> d!94319 (=> (not res!450246) (not e!389899))))

(get-info :version)

(assert (=> d!94319 (= res!450246 ((_ is Cons!13025) acc!681))))

(assert (=> d!94319 (= (contains!3606 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314443)))

(declare-fun b!684743 () Bool)

(declare-fun e!389900 () Bool)

(assert (=> b!684743 (= e!389899 e!389900)))

(declare-fun res!450245 () Bool)

(assert (=> b!684743 (=> res!450245 e!389900)))

(assert (=> b!684743 (= res!450245 (= (h!14070 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!684744 () Bool)

(assert (=> b!684744 (= e!389900 (contains!3606 (t!19275 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94319 res!450246) b!684743))

(assert (= (and b!684743 (not res!450245)) b!684744))

(declare-fun m!649047 () Bool)

(assert (=> d!94319 m!649047))

(declare-fun m!649049 () Bool)

(assert (=> d!94319 m!649049))

(declare-fun m!649051 () Bool)

(assert (=> b!684744 m!649051))

(assert (=> b!684621 d!94319))

(declare-fun d!94323 () Bool)

(declare-fun lt!314444 () Bool)

(assert (=> d!94323 (= lt!314444 (select (content!285 acc!681) k0!2843))))

(declare-fun e!389901 () Bool)

(assert (=> d!94323 (= lt!314444 e!389901)))

(declare-fun res!450248 () Bool)

(assert (=> d!94323 (=> (not res!450248) (not e!389901))))

(assert (=> d!94323 (= res!450248 ((_ is Cons!13025) acc!681))))

(assert (=> d!94323 (= (contains!3606 acc!681 k0!2843) lt!314444)))

(declare-fun b!684745 () Bool)

(declare-fun e!389902 () Bool)

(assert (=> b!684745 (= e!389901 e!389902)))

(declare-fun res!450247 () Bool)

(assert (=> b!684745 (=> res!450247 e!389902)))

(assert (=> b!684745 (= res!450247 (= (h!14070 acc!681) k0!2843))))

(declare-fun b!684746 () Bool)

(assert (=> b!684746 (= e!389902 (contains!3606 (t!19275 acc!681) k0!2843))))

(assert (= (and d!94323 res!450248) b!684745))

(assert (= (and b!684745 (not res!450247)) b!684746))

(assert (=> d!94323 m!649047))

(declare-fun m!649053 () Bool)

(assert (=> d!94323 m!649053))

(declare-fun m!649055 () Bool)

(assert (=> b!684746 m!649055))

(assert (=> b!684620 d!94323))

(declare-fun d!94325 () Bool)

(declare-fun res!450255 () Bool)

(declare-fun e!389909 () Bool)

(assert (=> d!94325 (=> res!450255 e!389909)))

(assert (=> d!94325 (= res!450255 ((_ is Nil!13026) acc!681))))

(assert (=> d!94325 (= (noDuplicate!853 acc!681) e!389909)))

(declare-fun b!684753 () Bool)

(declare-fun e!389910 () Bool)

(assert (=> b!684753 (= e!389909 e!389910)))

(declare-fun res!450256 () Bool)

(assert (=> b!684753 (=> (not res!450256) (not e!389910))))

(assert (=> b!684753 (= res!450256 (not (contains!3606 (t!19275 acc!681) (h!14070 acc!681))))))

(declare-fun b!684754 () Bool)

(assert (=> b!684754 (= e!389910 (noDuplicate!853 (t!19275 acc!681)))))

(assert (= (and d!94325 (not res!450255)) b!684753))

(assert (= (and b!684753 res!450256) b!684754))

(declare-fun m!649061 () Bool)

(assert (=> b!684753 m!649061))

(declare-fun m!649063 () Bool)

(assert (=> b!684754 m!649063))

(assert (=> b!684632 d!94325))

(declare-fun d!94329 () Bool)

(declare-fun res!450267 () Bool)

(declare-fun e!389923 () Bool)

(assert (=> d!94329 (=> res!450267 e!389923)))

(assert (=> d!94329 (= res!450267 ((_ is Nil!13026) acc!681))))

(assert (=> d!94329 (= (subseq!192 acc!681 acc!681) e!389923)))

(declare-fun b!684768 () Bool)

(declare-fun e!389922 () Bool)

(assert (=> b!684768 (= e!389922 (subseq!192 acc!681 (t!19275 acc!681)))))

(declare-fun b!684767 () Bool)

(declare-fun e!389924 () Bool)

(assert (=> b!684767 (= e!389924 (subseq!192 (t!19275 acc!681) (t!19275 acc!681)))))

(declare-fun b!684766 () Bool)

(declare-fun e!389921 () Bool)

(assert (=> b!684766 (= e!389921 e!389922)))

(declare-fun res!450269 () Bool)

(assert (=> b!684766 (=> res!450269 e!389922)))

(assert (=> b!684766 (= res!450269 e!389924)))

(declare-fun res!450270 () Bool)

(assert (=> b!684766 (=> (not res!450270) (not e!389924))))

(assert (=> b!684766 (= res!450270 (= (h!14070 acc!681) (h!14070 acc!681)))))

(declare-fun b!684765 () Bool)

(assert (=> b!684765 (= e!389923 e!389921)))

(declare-fun res!450268 () Bool)

(assert (=> b!684765 (=> (not res!450268) (not e!389921))))

(assert (=> b!684765 (= res!450268 ((_ is Cons!13025) acc!681))))

(assert (= (and d!94329 (not res!450267)) b!684765))

(assert (= (and b!684765 res!450268) b!684766))

(assert (= (and b!684766 res!450270) b!684767))

(assert (= (and b!684766 (not res!450269)) b!684768))

(declare-fun m!649075 () Bool)

(assert (=> b!684768 m!649075))

(declare-fun m!649077 () Bool)

(assert (=> b!684767 m!649077))

(assert (=> b!684634 d!94329))

(declare-fun d!94341 () Bool)

(declare-fun res!450281 () Bool)

(declare-fun e!389937 () Bool)

(assert (=> d!94341 (=> res!450281 e!389937)))

(assert (=> d!94341 (= res!450281 (= (select (arr!18988 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94341 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389937)))

(declare-fun b!684783 () Bool)

(declare-fun e!389938 () Bool)

(assert (=> b!684783 (= e!389937 e!389938)))

(declare-fun res!450282 () Bool)

(assert (=> b!684783 (=> (not res!450282) (not e!389938))))

(assert (=> b!684783 (= res!450282 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19355 a!3626)))))

(declare-fun b!684784 () Bool)

(assert (=> b!684784 (= e!389938 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94341 (not res!450281)) b!684783))

(assert (= (and b!684783 res!450282) b!684784))

(declare-fun m!649079 () Bool)

(assert (=> d!94341 m!649079))

(declare-fun m!649081 () Bool)

(assert (=> b!684784 m!649081))

(assert (=> b!684634 d!94341))

(declare-fun d!94343 () Bool)

(declare-fun e!389956 () Bool)

(assert (=> d!94343 e!389956))

(declare-fun res!450291 () Bool)

(assert (=> d!94343 (=> (not res!450291) (not e!389956))))

(declare-fun lt!314453 () List!13029)

(declare-fun size!19358 (List!13029) Int)

(assert (=> d!94343 (= res!450291 (<= (size!19358 lt!314453) (size!19358 lt!314406)))))

(declare-fun e!389955 () List!13029)

(assert (=> d!94343 (= lt!314453 e!389955)))

(declare-fun c!77624 () Bool)

(assert (=> d!94343 (= c!77624 ((_ is Cons!13025) lt!314406))))

(assert (=> d!94343 (= (-!157 lt!314406 k0!2843) lt!314453)))

(declare-fun bm!34035 () Bool)

(declare-fun call!34038 () List!13029)

(assert (=> bm!34035 (= call!34038 (-!157 (t!19275 lt!314406) k0!2843))))

(declare-fun b!684805 () Bool)

(declare-fun e!389954 () List!13029)

(assert (=> b!684805 (= e!389954 (Cons!13025 (h!14070 lt!314406) call!34038))))

(declare-fun b!684806 () Bool)

(assert (=> b!684806 (= e!389955 Nil!13026)))

(declare-fun b!684807 () Bool)

(assert (=> b!684807 (= e!389956 (= (content!285 lt!314453) ((_ map and) (content!285 lt!314406) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!684808 () Bool)

(assert (=> b!684808 (= e!389955 e!389954)))

(declare-fun c!77625 () Bool)

(assert (=> b!684808 (= c!77625 (= k0!2843 (h!14070 lt!314406)))))

(declare-fun b!684809 () Bool)

(assert (=> b!684809 (= e!389954 call!34038)))

(assert (= (and d!94343 c!77624) b!684808))

(assert (= (and d!94343 (not c!77624)) b!684806))

(assert (= (and b!684808 c!77625) b!684809))

(assert (= (and b!684808 (not c!77625)) b!684805))

(assert (= (or b!684809 b!684805) bm!34035))

(assert (= (and d!94343 res!450291) b!684807))

(declare-fun m!649093 () Bool)

(assert (=> d!94343 m!649093))

(declare-fun m!649095 () Bool)

(assert (=> d!94343 m!649095))

(declare-fun m!649097 () Bool)

(assert (=> bm!34035 m!649097))

(declare-fun m!649099 () Bool)

(assert (=> b!684807 m!649099))

(declare-fun m!649101 () Bool)

(assert (=> b!684807 m!649101))

(declare-fun m!649103 () Bool)

(assert (=> b!684807 m!649103))

(assert (=> b!684634 d!94343))

(declare-fun d!94351 () Bool)

(assert (=> d!94351 (= (-!157 ($colon$colon!357 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314458 () Unit!24107)

(declare-fun choose!16 ((_ BitVec 64) List!13029) Unit!24107)

(assert (=> d!94351 (= lt!314458 (choose!16 k0!2843 acc!681))))

(assert (=> d!94351 (not (contains!3606 acc!681 k0!2843))))

(assert (=> d!94351 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314458)))

(declare-fun bs!20076 () Bool)

(assert (= bs!20076 d!94351))

(assert (=> bs!20076 m!648973))

(assert (=> bs!20076 m!648973))

(declare-fun m!649105 () Bool)

(assert (=> bs!20076 m!649105))

(declare-fun m!649107 () Bool)

(assert (=> bs!20076 m!649107))

(assert (=> bs!20076 m!648945))

(assert (=> b!684634 d!94351))

(declare-fun d!94353 () Bool)

(declare-fun res!450304 () Bool)

(declare-fun e!389969 () Bool)

(assert (=> d!94353 (=> res!450304 e!389969)))

(assert (=> d!94353 (= res!450304 (= (select (arr!18988 (array!39616 (store (arr!18988 a!3626) i!1382 k0!2843) (size!19355 a!3626))) from!3004) k0!2843))))

(assert (=> d!94353 (= (arrayContainsKey!0 (array!39616 (store (arr!18988 a!3626) i!1382 k0!2843) (size!19355 a!3626)) k0!2843 from!3004) e!389969)))

(declare-fun b!684822 () Bool)

(declare-fun e!389970 () Bool)

(assert (=> b!684822 (= e!389969 e!389970)))

(declare-fun res!450305 () Bool)

(assert (=> b!684822 (=> (not res!450305) (not e!389970))))

(assert (=> b!684822 (= res!450305 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19355 (array!39616 (store (arr!18988 a!3626) i!1382 k0!2843) (size!19355 a!3626)))))))

(declare-fun b!684823 () Bool)

(assert (=> b!684823 (= e!389970 (arrayContainsKey!0 (array!39616 (store (arr!18988 a!3626) i!1382 k0!2843) (size!19355 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94353 (not res!450304)) b!684822))

(assert (= (and b!684822 res!450305) b!684823))

(declare-fun m!649109 () Bool)

(assert (=> d!94353 m!649109))

(declare-fun m!649111 () Bool)

(assert (=> b!684823 m!649111))

(assert (=> b!684634 d!94353))

(declare-fun d!94355 () Bool)

(assert (=> d!94355 (subseq!192 acc!681 acc!681)))

(declare-fun lt!314462 () Unit!24107)

(declare-fun choose!36 (List!13029) Unit!24107)

(assert (=> d!94355 (= lt!314462 (choose!36 acc!681))))

(assert (=> d!94355 (= (lemmaListSubSeqRefl!0 acc!681) lt!314462)))

(declare-fun bs!20077 () Bool)

(assert (= bs!20077 d!94355))

(assert (=> bs!20077 m!648959))

(declare-fun m!649119 () Bool)

(assert (=> bs!20077 m!649119))

(assert (=> b!684634 d!94355))

(declare-fun d!94359 () Bool)

(assert (=> d!94359 (= (validKeyInArray!0 (select (arr!18988 a!3626) from!3004)) (and (not (= (select (arr!18988 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18988 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684634 d!94359))

(declare-fun d!94363 () Bool)

(assert (=> d!94363 (= ($colon$colon!357 acc!681 k0!2843) (Cons!13025 k0!2843 acc!681))))

(assert (=> b!684634 d!94363))

(declare-fun b!684858 () Bool)

(declare-fun e!390004 () Bool)

(declare-fun call!34041 () Bool)

(assert (=> b!684858 (= e!390004 call!34041)))

(declare-fun c!77628 () Bool)

(declare-fun bm!34038 () Bool)

(assert (=> bm!34038 (= call!34041 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77628 (Cons!13025 (select (arr!18988 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!684859 () Bool)

(declare-fun e!390005 () Bool)

(declare-fun e!390003 () Bool)

(assert (=> b!684859 (= e!390005 e!390003)))

(declare-fun res!450338 () Bool)

(assert (=> b!684859 (=> (not res!450338) (not e!390003))))

(declare-fun e!390006 () Bool)

(assert (=> b!684859 (= res!450338 (not e!390006))))

(declare-fun res!450336 () Bool)

(assert (=> b!684859 (=> (not res!450336) (not e!390006))))

(assert (=> b!684859 (= res!450336 (validKeyInArray!0 (select (arr!18988 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!684860 () Bool)

(assert (=> b!684860 (= e!390004 call!34041)))

(declare-fun b!684861 () Bool)

(assert (=> b!684861 (= e!390006 (contains!3606 acc!681 (select (arr!18988 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94367 () Bool)

(declare-fun res!450337 () Bool)

(assert (=> d!94367 (=> res!450337 e!390005)))

(assert (=> d!94367 (= res!450337 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19355 a!3626)))))

(assert (=> d!94367 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390005)))

(declare-fun b!684862 () Bool)

(assert (=> b!684862 (= e!390003 e!390004)))

(assert (=> b!684862 (= c!77628 (validKeyInArray!0 (select (arr!18988 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94367 (not res!450337)) b!684859))

(assert (= (and b!684859 res!450336) b!684861))

(assert (= (and b!684859 res!450338) b!684862))

(assert (= (and b!684862 c!77628) b!684858))

(assert (= (and b!684862 (not c!77628)) b!684860))

(assert (= (or b!684858 b!684860) bm!34038))

(assert (=> bm!34038 m!649079))

(declare-fun m!649145 () Bool)

(assert (=> bm!34038 m!649145))

(assert (=> b!684859 m!649079))

(assert (=> b!684859 m!649079))

(declare-fun m!649147 () Bool)

(assert (=> b!684859 m!649147))

(assert (=> b!684861 m!649079))

(assert (=> b!684861 m!649079))

(declare-fun m!649149 () Bool)

(assert (=> b!684861 m!649149))

(assert (=> b!684862 m!649079))

(assert (=> b!684862 m!649079))

(assert (=> b!684862 m!649147))

(assert (=> b!684634 d!94367))

(declare-fun b!684863 () Bool)

(declare-fun e!390008 () Bool)

(declare-fun call!34042 () Bool)

(assert (=> b!684863 (= e!390008 call!34042)))

(declare-fun bm!34039 () Bool)

(declare-fun c!77629 () Bool)

(assert (=> bm!34039 (= call!34042 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77629 (Cons!13025 (select (arr!18988 a!3626) #b00000000000000000000000000000000) Nil!13026) Nil!13026)))))

(declare-fun b!684864 () Bool)

(declare-fun e!390009 () Bool)

(declare-fun e!390007 () Bool)

(assert (=> b!684864 (= e!390009 e!390007)))

(declare-fun res!450341 () Bool)

(assert (=> b!684864 (=> (not res!450341) (not e!390007))))

(declare-fun e!390010 () Bool)

(assert (=> b!684864 (= res!450341 (not e!390010))))

(declare-fun res!450339 () Bool)

(assert (=> b!684864 (=> (not res!450339) (not e!390010))))

(assert (=> b!684864 (= res!450339 (validKeyInArray!0 (select (arr!18988 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684865 () Bool)

(assert (=> b!684865 (= e!390008 call!34042)))

(declare-fun b!684866 () Bool)

(assert (=> b!684866 (= e!390010 (contains!3606 Nil!13026 (select (arr!18988 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94381 () Bool)

(declare-fun res!450340 () Bool)

(assert (=> d!94381 (=> res!450340 e!390009)))

(assert (=> d!94381 (= res!450340 (bvsge #b00000000000000000000000000000000 (size!19355 a!3626)))))

(assert (=> d!94381 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13026) e!390009)))

(declare-fun b!684867 () Bool)

(assert (=> b!684867 (= e!390007 e!390008)))

(assert (=> b!684867 (= c!77629 (validKeyInArray!0 (select (arr!18988 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94381 (not res!450340)) b!684864))

(assert (= (and b!684864 res!450339) b!684866))

(assert (= (and b!684864 res!450341) b!684867))

(assert (= (and b!684867 c!77629) b!684863))

(assert (= (and b!684867 (not c!77629)) b!684865))

(assert (= (or b!684863 b!684865) bm!34039))

(declare-fun m!649151 () Bool)

(assert (=> bm!34039 m!649151))

(declare-fun m!649153 () Bool)

(assert (=> bm!34039 m!649153))

(assert (=> b!684864 m!649151))

(assert (=> b!684864 m!649151))

(declare-fun m!649157 () Bool)

(assert (=> b!684864 m!649157))

(assert (=> b!684866 m!649151))

(assert (=> b!684866 m!649151))

(declare-fun m!649161 () Bool)

(assert (=> b!684866 m!649161))

(assert (=> b!684867 m!649151))

(assert (=> b!684867 m!649151))

(assert (=> b!684867 m!649157))

(assert (=> b!684623 d!94381))

(assert (=> b!684625 d!94323))

(declare-fun d!94389 () Bool)

(assert (=> d!94389 (= (array_inv!14784 a!3626) (bvsge (size!19355 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61006 d!94389))

(declare-fun d!94393 () Bool)

(declare-fun res!450346 () Bool)

(declare-fun e!390015 () Bool)

(assert (=> d!94393 (=> res!450346 e!390015)))

(assert (=> d!94393 (= res!450346 ((_ is Nil!13026) lt!314406))))

(assert (=> d!94393 (= (noDuplicate!853 lt!314406) e!390015)))

(declare-fun b!684872 () Bool)

(declare-fun e!390016 () Bool)

(assert (=> b!684872 (= e!390015 e!390016)))

(declare-fun res!450347 () Bool)

(assert (=> b!684872 (=> (not res!450347) (not e!390016))))

(assert (=> b!684872 (= res!450347 (not (contains!3606 (t!19275 lt!314406) (h!14070 lt!314406))))))

(declare-fun b!684873 () Bool)

(assert (=> b!684873 (= e!390016 (noDuplicate!853 (t!19275 lt!314406)))))

(assert (= (and d!94393 (not res!450346)) b!684872))

(assert (= (and b!684872 res!450347) b!684873))

(declare-fun m!649167 () Bool)

(assert (=> b!684872 m!649167))

(declare-fun m!649169 () Bool)

(assert (=> b!684873 m!649169))

(assert (=> b!684637 d!94393))

(declare-fun d!94395 () Bool)

(declare-fun lt!314471 () Bool)

(assert (=> d!94395 (= lt!314471 (select (content!285 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390021 () Bool)

(assert (=> d!94395 (= lt!314471 e!390021)))

(declare-fun res!450352 () Bool)

(assert (=> d!94395 (=> (not res!450352) (not e!390021))))

(assert (=> d!94395 (= res!450352 ((_ is Cons!13025) acc!681))))

(assert (=> d!94395 (= (contains!3606 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314471)))

(declare-fun b!684879 () Bool)

(declare-fun e!390022 () Bool)

(assert (=> b!684879 (= e!390021 e!390022)))

(declare-fun res!450351 () Bool)

(assert (=> b!684879 (=> res!450351 e!390022)))

(assert (=> b!684879 (= res!450351 (= (h!14070 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!684880 () Bool)

(assert (=> b!684880 (= e!390022 (contains!3606 (t!19275 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94395 res!450352) b!684879))

(assert (= (and b!684879 (not res!450351)) b!684880))

(assert (=> d!94395 m!649047))

(declare-fun m!649171 () Bool)

(assert (=> d!94395 m!649171))

(declare-fun m!649173 () Bool)

(assert (=> b!684880 m!649173))

(assert (=> b!684626 d!94395))

(assert (=> b!684636 d!94323))

(declare-fun d!94397 () Bool)

(declare-fun res!450353 () Bool)

(declare-fun e!390025 () Bool)

(assert (=> d!94397 (=> res!450353 e!390025)))

(assert (=> d!94397 (= res!450353 ((_ is Nil!13026) acc!681))))

(assert (=> d!94397 (= (subseq!192 acc!681 lt!314406) e!390025)))

(declare-fun b!684884 () Bool)

(declare-fun e!390024 () Bool)

(assert (=> b!684884 (= e!390024 (subseq!192 acc!681 (t!19275 lt!314406)))))

(declare-fun b!684883 () Bool)

(declare-fun e!390026 () Bool)

(assert (=> b!684883 (= e!390026 (subseq!192 (t!19275 acc!681) (t!19275 lt!314406)))))

(declare-fun b!684882 () Bool)

(declare-fun e!390023 () Bool)

(assert (=> b!684882 (= e!390023 e!390024)))

(declare-fun res!450355 () Bool)

(assert (=> b!684882 (=> res!450355 e!390024)))

(assert (=> b!684882 (= res!450355 e!390026)))

(declare-fun res!450356 () Bool)

(assert (=> b!684882 (=> (not res!450356) (not e!390026))))

(assert (=> b!684882 (= res!450356 (= (h!14070 acc!681) (h!14070 lt!314406)))))

(declare-fun b!684881 () Bool)

(assert (=> b!684881 (= e!390025 e!390023)))

(declare-fun res!450354 () Bool)

(assert (=> b!684881 (=> (not res!450354) (not e!390023))))

(assert (=> b!684881 (= res!450354 ((_ is Cons!13025) lt!314406))))

(assert (= (and d!94397 (not res!450353)) b!684881))

(assert (= (and b!684881 res!450354) b!684882))

(assert (= (and b!684882 res!450356) b!684883))

(assert (= (and b!684882 (not res!450355)) b!684884))

(declare-fun m!649179 () Bool)

(assert (=> b!684884 m!649179))

(declare-fun m!649181 () Bool)

(assert (=> b!684883 m!649181))

(assert (=> b!684638 d!94397))

(declare-fun d!94399 () Bool)

(assert (=> d!94399 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314474 () Unit!24107)

(declare-fun choose!13 (array!39615 (_ BitVec 64) (_ BitVec 32)) Unit!24107)

(assert (=> d!94399 (= lt!314474 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94399 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94399 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314474)))

(declare-fun bs!20079 () Bool)

(assert (= bs!20079 d!94399))

(assert (=> bs!20079 m!648935))

(declare-fun m!649187 () Bool)

(assert (=> bs!20079 m!649187))

(assert (=> b!684629 d!94399))

(declare-fun b!684895 () Bool)

(declare-fun e!390036 () Bool)

(declare-fun call!34046 () Bool)

(assert (=> b!684895 (= e!390036 call!34046)))

(declare-fun c!77633 () Bool)

(declare-fun bm!34043 () Bool)

(assert (=> bm!34043 (= call!34046 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77633 (Cons!13025 (select (arr!18988 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!684896 () Bool)

(declare-fun e!390037 () Bool)

(declare-fun e!390035 () Bool)

(assert (=> b!684896 (= e!390037 e!390035)))

(declare-fun res!450365 () Bool)

(assert (=> b!684896 (=> (not res!450365) (not e!390035))))

(declare-fun e!390038 () Bool)

(assert (=> b!684896 (= res!450365 (not e!390038))))

(declare-fun res!450363 () Bool)

(assert (=> b!684896 (=> (not res!450363) (not e!390038))))

(assert (=> b!684896 (= res!450363 (validKeyInArray!0 (select (arr!18988 a!3626) from!3004)))))

(declare-fun b!684897 () Bool)

(assert (=> b!684897 (= e!390036 call!34046)))

(declare-fun b!684898 () Bool)

(assert (=> b!684898 (= e!390038 (contains!3606 acc!681 (select (arr!18988 a!3626) from!3004)))))

(declare-fun d!94405 () Bool)

(declare-fun res!450364 () Bool)

(assert (=> d!94405 (=> res!450364 e!390037)))

(assert (=> d!94405 (= res!450364 (bvsge from!3004 (size!19355 a!3626)))))

(assert (=> d!94405 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390037)))

(declare-fun b!684899 () Bool)

(assert (=> b!684899 (= e!390035 e!390036)))

(assert (=> b!684899 (= c!77633 (validKeyInArray!0 (select (arr!18988 a!3626) from!3004)))))

(assert (= (and d!94405 (not res!450364)) b!684896))

(assert (= (and b!684896 res!450363) b!684898))

(assert (= (and b!684896 res!450365) b!684899))

(assert (= (and b!684899 c!77633) b!684895))

(assert (= (and b!684899 (not c!77633)) b!684897))

(assert (= (or b!684895 b!684897) bm!34043))

(assert (=> bm!34043 m!648951))

(declare-fun m!649189 () Bool)

(assert (=> bm!34043 m!649189))

(assert (=> b!684896 m!648951))

(assert (=> b!684896 m!648951))

(assert (=> b!684896 m!648975))

(assert (=> b!684898 m!648951))

(assert (=> b!684898 m!648951))

(declare-fun m!649191 () Bool)

(assert (=> b!684898 m!649191))

(assert (=> b!684899 m!648951))

(assert (=> b!684899 m!648951))

(assert (=> b!684899 m!648975))

(assert (=> b!684639 d!94405))

(declare-fun d!94407 () Bool)

(declare-fun res!450366 () Bool)

(declare-fun e!390039 () Bool)

(assert (=> d!94407 (=> res!450366 e!390039)))

(assert (=> d!94407 (= res!450366 (= (select (arr!18988 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94407 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390039)))

(declare-fun b!684900 () Bool)

(declare-fun e!390040 () Bool)

(assert (=> b!684900 (= e!390039 e!390040)))

(declare-fun res!450367 () Bool)

(assert (=> b!684900 (=> (not res!450367) (not e!390040))))

(assert (=> b!684900 (= res!450367 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19355 a!3626)))))

(declare-fun b!684901 () Bool)

(assert (=> b!684901 (= e!390040 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94407 (not res!450366)) b!684900))

(assert (= (and b!684900 res!450367) b!684901))

(assert (=> d!94407 m!649151))

(declare-fun m!649193 () Bool)

(assert (=> b!684901 m!649193))

(assert (=> b!684628 d!94407))

(declare-fun d!94409 () Bool)

(assert (=> d!94409 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684630 d!94409))

(declare-fun d!94411 () Bool)

(assert (=> d!94411 (= ($colon$colon!357 acc!681 (select (arr!18988 a!3626) from!3004)) (Cons!13025 (select (arr!18988 a!3626) from!3004) acc!681))))

(assert (=> b!684640 d!94411))

(assert (=> b!684640 d!94329))

(declare-fun d!94413 () Bool)

(assert (=> d!94413 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314480 () Unit!24107)

(declare-fun choose!80 (array!39615 List!13029 List!13029 (_ BitVec 32)) Unit!24107)

(assert (=> d!94413 (= lt!314480 (choose!80 a!3626 ($colon$colon!357 acc!681 (select (arr!18988 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94413 (bvslt (size!19355 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94413 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!357 acc!681 (select (arr!18988 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314480)))

(declare-fun bs!20081 () Bool)

(assert (= bs!20081 d!94413))

(assert (=> bs!20081 m!648949))

(assert (=> bs!20081 m!648953))

(declare-fun m!649199 () Bool)

(assert (=> bs!20081 m!649199))

(assert (=> b!684640 d!94413))

(assert (=> b!684640 d!94355))

(assert (=> b!684640 d!94367))

(check-sat (not d!94319) (not b!684867) (not b!684807) (not b!684768) (not d!94323) (not b!684896) (not b!684883) (not b!684873) (not b!684884) (not b!684899) (not b!684866) (not b!684861) (not b!684864) (not d!94399) (not d!94395) (not b!684746) (not b!684898) (not b!684754) (not bm!34043) (not b!684744) (not b!684784) (not b!684880) (not b!684901) (not d!94343) (not d!94351) (not b!684859) (not b!684823) (not b!684753) (not d!94413) (not b!684872) (not bm!34039) (not d!94355) (not b!684862) (not b!684767) (not bm!34035) (not bm!34038))
(check-sat)
