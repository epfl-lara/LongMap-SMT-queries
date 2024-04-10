; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60790 () Bool)

(assert start!60790)

(declare-fun b!682110 () Bool)

(declare-fun res!448181 () Bool)

(declare-fun e!388642 () Bool)

(assert (=> b!682110 (=> (not res!448181) (not e!388642))))

(declare-datatypes ((array!39537 0))(
  ( (array!39538 (arr!18952 (Array (_ BitVec 32) (_ BitVec 64))) (size!19316 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39537)

(declare-datatypes ((List!12993 0))(
  ( (Nil!12990) (Cons!12989 (h!14034 (_ BitVec 64)) (t!19233 List!12993)) )
))
(declare-fun arrayNoDuplicates!0 (array!39537 (_ BitVec 32) List!12993) Bool)

(assert (=> b!682110 (= res!448181 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12990))))

(declare-fun b!682111 () Bool)

(declare-datatypes ((Unit!23927 0))(
  ( (Unit!23928) )
))
(declare-fun e!388640 () Unit!23927)

(declare-fun lt!313435 () Unit!23927)

(assert (=> b!682111 (= e!388640 lt!313435)))

(declare-fun lt!313436 () Unit!23927)

(declare-fun acc!681 () List!12993)

(declare-fun lemmaListSubSeqRefl!0 (List!12993) Unit!23927)

(assert (=> b!682111 (= lt!313436 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!156 (List!12993 List!12993) Bool)

(assert (=> b!682111 (subseq!156 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39537 List!12993 List!12993 (_ BitVec 32)) Unit!23927)

(declare-fun $colon$colon!321 (List!12993 (_ BitVec 64)) List!12993)

(assert (=> b!682111 (= lt!313435 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!321 acc!681 (select (arr!18952 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682111 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682112 () Bool)

(declare-fun res!448171 () Bool)

(assert (=> b!682112 (=> (not res!448171) (not e!388642))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682112 (= res!448171 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682113 () Bool)

(declare-fun e!388638 () Unit!23927)

(declare-fun Unit!23929 () Unit!23927)

(assert (=> b!682113 (= e!388638 Unit!23929)))

(declare-fun b!682115 () Bool)

(declare-fun res!448176 () Bool)

(assert (=> b!682115 (=> (not res!448176) (not e!388642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682115 (= res!448176 (validKeyInArray!0 k0!2843))))

(declare-fun b!682116 () Bool)

(declare-fun e!388639 () Bool)

(declare-fun e!388644 () Bool)

(assert (=> b!682116 (= e!388639 e!388644)))

(declare-fun res!448174 () Bool)

(assert (=> b!682116 (=> (not res!448174) (not e!388644))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682116 (= res!448174 (bvsle from!3004 i!1382))))

(declare-fun b!682117 () Bool)

(declare-fun res!448170 () Bool)

(assert (=> b!682117 (=> (not res!448170) (not e!388642))))

(declare-fun contains!3570 (List!12993 (_ BitVec 64)) Bool)

(assert (=> b!682117 (= res!448170 (not (contains!3570 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682118 () Bool)

(declare-fun Unit!23930 () Unit!23927)

(assert (=> b!682118 (= e!388638 Unit!23930)))

(declare-fun lt!313437 () Unit!23927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39537 (_ BitVec 64) (_ BitVec 32)) Unit!23927)

(assert (=> b!682118 (= lt!313437 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682118 false))

(declare-fun b!682119 () Bool)

(declare-fun e!388641 () Bool)

(assert (=> b!682119 (= e!388641 (contains!3570 acc!681 k0!2843))))

(declare-fun b!682120 () Bool)

(declare-fun res!448177 () Bool)

(assert (=> b!682120 (=> (not res!448177) (not e!388642))))

(assert (=> b!682120 (= res!448177 e!388639)))

(declare-fun res!448173 () Bool)

(assert (=> b!682120 (=> res!448173 e!388639)))

(assert (=> b!682120 (= res!448173 e!388641)))

(declare-fun res!448180 () Bool)

(assert (=> b!682120 (=> (not res!448180) (not e!388641))))

(assert (=> b!682120 (= res!448180 (bvsgt from!3004 i!1382))))

(declare-fun b!682121 () Bool)

(declare-fun res!448179 () Bool)

(assert (=> b!682121 (=> (not res!448179) (not e!388642))))

(assert (=> b!682121 (= res!448179 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19316 a!3626))))))

(declare-fun b!682122 () Bool)

(declare-fun Unit!23931 () Unit!23927)

(assert (=> b!682122 (= e!388640 Unit!23931)))

(declare-fun b!682123 () Bool)

(declare-fun res!448175 () Bool)

(assert (=> b!682123 (=> (not res!448175) (not e!388642))))

(assert (=> b!682123 (= res!448175 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19316 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682124 () Bool)

(declare-fun res!448168 () Bool)

(assert (=> b!682124 (=> (not res!448168) (not e!388642))))

(assert (=> b!682124 (= res!448168 (not (contains!3570 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682125 () Bool)

(declare-fun res!448169 () Bool)

(assert (=> b!682125 (=> (not res!448169) (not e!388642))))

(assert (=> b!682125 (= res!448169 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682126 () Bool)

(assert (=> b!682126 (= e!388642 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun lt!313434 () Unit!23927)

(assert (=> b!682126 (= lt!313434 e!388640)))

(declare-fun c!77338 () Bool)

(assert (=> b!682126 (= c!77338 (validKeyInArray!0 (select (arr!18952 a!3626) from!3004)))))

(declare-fun lt!313438 () Unit!23927)

(assert (=> b!682126 (= lt!313438 e!388638)))

(declare-fun c!77339 () Bool)

(assert (=> b!682126 (= c!77339 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682126 (arrayContainsKey!0 (array!39538 (store (arr!18952 a!3626) i!1382 k0!2843) (size!19316 a!3626)) k0!2843 from!3004)))

(declare-fun b!682127 () Bool)

(declare-fun res!448178 () Bool)

(assert (=> b!682127 (=> (not res!448178) (not e!388642))))

(declare-fun noDuplicate!817 (List!12993) Bool)

(assert (=> b!682127 (= res!448178 (noDuplicate!817 acc!681))))

(declare-fun res!448172 () Bool)

(assert (=> start!60790 (=> (not res!448172) (not e!388642))))

(assert (=> start!60790 (= res!448172 (and (bvslt (size!19316 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19316 a!3626))))))

(assert (=> start!60790 e!388642))

(assert (=> start!60790 true))

(declare-fun array_inv!14748 (array!39537) Bool)

(assert (=> start!60790 (array_inv!14748 a!3626)))

(declare-fun b!682114 () Bool)

(assert (=> b!682114 (= e!388644 (not (contains!3570 acc!681 k0!2843)))))

(assert (= (and start!60790 res!448172) b!682127))

(assert (= (and b!682127 res!448178) b!682117))

(assert (= (and b!682117 res!448170) b!682124))

(assert (= (and b!682124 res!448168) b!682120))

(assert (= (and b!682120 res!448180) b!682119))

(assert (= (and b!682120 (not res!448173)) b!682116))

(assert (= (and b!682116 res!448174) b!682114))

(assert (= (and b!682120 res!448177) b!682110))

(assert (= (and b!682110 res!448181) b!682125))

(assert (= (and b!682125 res!448169) b!682121))

(assert (= (and b!682121 res!448179) b!682115))

(assert (= (and b!682115 res!448176) b!682112))

(assert (= (and b!682112 res!448171) b!682123))

(assert (= (and b!682123 res!448175) b!682126))

(assert (= (and b!682126 c!77339) b!682118))

(assert (= (and b!682126 (not c!77339)) b!682113))

(assert (= (and b!682126 c!77338) b!682111))

(assert (= (and b!682126 (not c!77338)) b!682122))

(declare-fun m!646869 () Bool)

(assert (=> b!682118 m!646869))

(declare-fun m!646871 () Bool)

(assert (=> b!682117 m!646871))

(declare-fun m!646873 () Bool)

(assert (=> b!682111 m!646873))

(declare-fun m!646875 () Bool)

(assert (=> b!682111 m!646875))

(declare-fun m!646877 () Bool)

(assert (=> b!682111 m!646877))

(declare-fun m!646879 () Bool)

(assert (=> b!682111 m!646879))

(assert (=> b!682111 m!646875))

(assert (=> b!682111 m!646877))

(declare-fun m!646881 () Bool)

(assert (=> b!682111 m!646881))

(declare-fun m!646883 () Bool)

(assert (=> b!682111 m!646883))

(declare-fun m!646885 () Bool)

(assert (=> b!682115 m!646885))

(declare-fun m!646887 () Bool)

(assert (=> b!682127 m!646887))

(declare-fun m!646889 () Bool)

(assert (=> b!682119 m!646889))

(declare-fun m!646891 () Bool)

(assert (=> start!60790 m!646891))

(declare-fun m!646893 () Bool)

(assert (=> b!682112 m!646893))

(assert (=> b!682114 m!646889))

(declare-fun m!646895 () Bool)

(assert (=> b!682110 m!646895))

(declare-fun m!646897 () Bool)

(assert (=> b!682125 m!646897))

(declare-fun m!646899 () Bool)

(assert (=> b!682124 m!646899))

(assert (=> b!682126 m!646873))

(assert (=> b!682126 m!646875))

(declare-fun m!646901 () Bool)

(assert (=> b!682126 m!646901))

(declare-fun m!646903 () Bool)

(assert (=> b!682126 m!646903))

(assert (=> b!682126 m!646875))

(declare-fun m!646905 () Bool)

(assert (=> b!682126 m!646905))

(declare-fun m!646907 () Bool)

(assert (=> b!682126 m!646907))

(check-sat (not b!682115) (not b!682110) (not b!682114) (not start!60790) (not b!682111) (not b!682124) (not b!682117) (not b!682112) (not b!682127) (not b!682119) (not b!682126) (not b!682125) (not b!682118))
(check-sat)
(get-model)

(declare-fun d!94051 () Bool)

(assert (=> d!94051 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313456 () Unit!23927)

(declare-fun choose!13 (array!39537 (_ BitVec 64) (_ BitVec 32)) Unit!23927)

(assert (=> d!94051 (= lt!313456 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94051 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94051 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313456)))

(declare-fun bs!20017 () Bool)

(assert (= bs!20017 d!94051))

(assert (=> bs!20017 m!646893))

(declare-fun m!646949 () Bool)

(assert (=> bs!20017 m!646949))

(assert (=> b!682118 d!94051))

(declare-fun d!94053 () Bool)

(declare-fun lt!313459 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!279 (List!12993) (InoxSet (_ BitVec 64)))

(assert (=> d!94053 (= lt!313459 (select (content!279 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388670 () Bool)

(assert (=> d!94053 (= lt!313459 e!388670)))

(declare-fun res!448229 () Bool)

(assert (=> d!94053 (=> (not res!448229) (not e!388670))))

(get-info :version)

(assert (=> d!94053 (= res!448229 ((_ is Cons!12989) acc!681))))

(assert (=> d!94053 (= (contains!3570 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313459)))

(declare-fun b!682186 () Bool)

(declare-fun e!388671 () Bool)

(assert (=> b!682186 (= e!388670 e!388671)))

(declare-fun res!448228 () Bool)

(assert (=> b!682186 (=> res!448228 e!388671)))

(assert (=> b!682186 (= res!448228 (= (h!14034 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682187 () Bool)

(assert (=> b!682187 (= e!388671 (contains!3570 (t!19233 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94053 res!448229) b!682186))

(assert (= (and b!682186 (not res!448228)) b!682187))

(declare-fun m!646951 () Bool)

(assert (=> d!94053 m!646951))

(declare-fun m!646953 () Bool)

(assert (=> d!94053 m!646953))

(declare-fun m!646955 () Bool)

(assert (=> b!682187 m!646955))

(assert (=> b!682117 d!94053))

(declare-fun d!94055 () Bool)

(assert (=> d!94055 (= (array_inv!14748 a!3626) (bvsge (size!19316 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60790 d!94055))

(declare-fun d!94057 () Bool)

(declare-fun res!448234 () Bool)

(declare-fun e!388676 () Bool)

(assert (=> d!94057 (=> res!448234 e!388676)))

(assert (=> d!94057 (= res!448234 ((_ is Nil!12990) acc!681))))

(assert (=> d!94057 (= (noDuplicate!817 acc!681) e!388676)))

(declare-fun b!682192 () Bool)

(declare-fun e!388677 () Bool)

(assert (=> b!682192 (= e!388676 e!388677)))

(declare-fun res!448235 () Bool)

(assert (=> b!682192 (=> (not res!448235) (not e!388677))))

(assert (=> b!682192 (= res!448235 (not (contains!3570 (t!19233 acc!681) (h!14034 acc!681))))))

(declare-fun b!682193 () Bool)

(assert (=> b!682193 (= e!388677 (noDuplicate!817 (t!19233 acc!681)))))

(assert (= (and d!94057 (not res!448234)) b!682192))

(assert (= (and b!682192 res!448235) b!682193))

(declare-fun m!646957 () Bool)

(assert (=> b!682192 m!646957))

(declare-fun m!646959 () Bool)

(assert (=> b!682193 m!646959))

(assert (=> b!682127 d!94057))

(declare-fun b!682214 () Bool)

(declare-fun e!388696 () Bool)

(assert (=> b!682214 (= e!388696 (contains!3570 acc!681 (select (arr!18952 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682215 () Bool)

(declare-fun e!388695 () Bool)

(declare-fun e!388694 () Bool)

(assert (=> b!682215 (= e!388695 e!388694)))

(declare-fun c!77350 () Bool)

(assert (=> b!682215 (= c!77350 (validKeyInArray!0 (select (arr!18952 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94059 () Bool)

(declare-fun res!448248 () Bool)

(declare-fun e!388697 () Bool)

(assert (=> d!94059 (=> res!448248 e!388697)))

(assert (=> d!94059 (= res!448248 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19316 a!3626)))))

(assert (=> d!94059 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!388697)))

(declare-fun b!682216 () Bool)

(assert (=> b!682216 (= e!388697 e!388695)))

(declare-fun res!448249 () Bool)

(assert (=> b!682216 (=> (not res!448249) (not e!388695))))

(assert (=> b!682216 (= res!448249 (not e!388696))))

(declare-fun res!448250 () Bool)

(assert (=> b!682216 (=> (not res!448250) (not e!388696))))

(assert (=> b!682216 (= res!448250 (validKeyInArray!0 (select (arr!18952 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682217 () Bool)

(declare-fun call!33994 () Bool)

(assert (=> b!682217 (= e!388694 call!33994)))

(declare-fun bm!33991 () Bool)

(assert (=> bm!33991 (= call!33994 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77350 (Cons!12989 (select (arr!18952 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!682218 () Bool)

(assert (=> b!682218 (= e!388694 call!33994)))

(assert (= (and d!94059 (not res!448248)) b!682216))

(assert (= (and b!682216 res!448250) b!682214))

(assert (= (and b!682216 res!448249) b!682215))

(assert (= (and b!682215 c!77350) b!682218))

(assert (= (and b!682215 (not c!77350)) b!682217))

(assert (= (or b!682218 b!682217) bm!33991))

(declare-fun m!646961 () Bool)

(assert (=> b!682214 m!646961))

(assert (=> b!682214 m!646961))

(declare-fun m!646963 () Bool)

(assert (=> b!682214 m!646963))

(assert (=> b!682215 m!646961))

(assert (=> b!682215 m!646961))

(declare-fun m!646965 () Bool)

(assert (=> b!682215 m!646965))

(assert (=> b!682216 m!646961))

(assert (=> b!682216 m!646961))

(assert (=> b!682216 m!646965))

(assert (=> bm!33991 m!646961))

(declare-fun m!646967 () Bool)

(assert (=> bm!33991 m!646967))

(assert (=> b!682126 d!94059))

(declare-fun d!94065 () Bool)

(assert (=> d!94065 (= (validKeyInArray!0 (select (arr!18952 a!3626) from!3004)) (and (not (= (select (arr!18952 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18952 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682126 d!94065))

(declare-fun d!94067 () Bool)

(declare-fun res!448258 () Bool)

(declare-fun e!388706 () Bool)

(assert (=> d!94067 (=> res!448258 e!388706)))

(assert (=> d!94067 (= res!448258 (= (select (arr!18952 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94067 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388706)))

(declare-fun b!682228 () Bool)

(declare-fun e!388707 () Bool)

(assert (=> b!682228 (= e!388706 e!388707)))

(declare-fun res!448259 () Bool)

(assert (=> b!682228 (=> (not res!448259) (not e!388707))))

(assert (=> b!682228 (= res!448259 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19316 a!3626)))))

(declare-fun b!682229 () Bool)

(assert (=> b!682229 (= e!388707 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94067 (not res!448258)) b!682228))

(assert (= (and b!682228 res!448259) b!682229))

(assert (=> d!94067 m!646961))

(declare-fun m!646977 () Bool)

(assert (=> b!682229 m!646977))

(assert (=> b!682126 d!94067))

(declare-fun d!94073 () Bool)

(declare-fun res!448260 () Bool)

(declare-fun e!388708 () Bool)

(assert (=> d!94073 (=> res!448260 e!388708)))

(assert (=> d!94073 (= res!448260 (= (select (arr!18952 (array!39538 (store (arr!18952 a!3626) i!1382 k0!2843) (size!19316 a!3626))) from!3004) k0!2843))))

(assert (=> d!94073 (= (arrayContainsKey!0 (array!39538 (store (arr!18952 a!3626) i!1382 k0!2843) (size!19316 a!3626)) k0!2843 from!3004) e!388708)))

(declare-fun b!682230 () Bool)

(declare-fun e!388709 () Bool)

(assert (=> b!682230 (= e!388708 e!388709)))

(declare-fun res!448261 () Bool)

(assert (=> b!682230 (=> (not res!448261) (not e!388709))))

(assert (=> b!682230 (= res!448261 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19316 (array!39538 (store (arr!18952 a!3626) i!1382 k0!2843) (size!19316 a!3626)))))))

(declare-fun b!682231 () Bool)

(assert (=> b!682231 (= e!388709 (arrayContainsKey!0 (array!39538 (store (arr!18952 a!3626) i!1382 k0!2843) (size!19316 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94073 (not res!448260)) b!682230))

(assert (= (and b!682230 res!448261) b!682231))

(declare-fun m!646979 () Bool)

(assert (=> d!94073 m!646979))

(declare-fun m!646981 () Bool)

(assert (=> b!682231 m!646981))

(assert (=> b!682126 d!94073))

(declare-fun d!94075 () Bool)

(assert (=> d!94075 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682115 d!94075))

(declare-fun d!94077 () Bool)

(declare-fun lt!313460 () Bool)

(assert (=> d!94077 (= lt!313460 (select (content!279 acc!681) k0!2843))))

(declare-fun e!388714 () Bool)

(assert (=> d!94077 (= lt!313460 e!388714)))

(declare-fun res!448267 () Bool)

(assert (=> d!94077 (=> (not res!448267) (not e!388714))))

(assert (=> d!94077 (= res!448267 ((_ is Cons!12989) acc!681))))

(assert (=> d!94077 (= (contains!3570 acc!681 k0!2843) lt!313460)))

(declare-fun b!682236 () Bool)

(declare-fun e!388715 () Bool)

(assert (=> b!682236 (= e!388714 e!388715)))

(declare-fun res!448266 () Bool)

(assert (=> b!682236 (=> res!448266 e!388715)))

(assert (=> b!682236 (= res!448266 (= (h!14034 acc!681) k0!2843))))

(declare-fun b!682237 () Bool)

(assert (=> b!682237 (= e!388715 (contains!3570 (t!19233 acc!681) k0!2843))))

(assert (= (and d!94077 res!448267) b!682236))

(assert (= (and b!682236 (not res!448266)) b!682237))

(assert (=> d!94077 m!646951))

(declare-fun m!646983 () Bool)

(assert (=> d!94077 m!646983))

(declare-fun m!646985 () Bool)

(assert (=> b!682237 m!646985))

(assert (=> b!682114 d!94077))

(declare-fun b!682238 () Bool)

(declare-fun e!388718 () Bool)

(assert (=> b!682238 (= e!388718 (contains!3570 acc!681 (select (arr!18952 a!3626) from!3004)))))

(declare-fun b!682239 () Bool)

(declare-fun e!388717 () Bool)

(declare-fun e!388716 () Bool)

(assert (=> b!682239 (= e!388717 e!388716)))

(declare-fun c!77352 () Bool)

(assert (=> b!682239 (= c!77352 (validKeyInArray!0 (select (arr!18952 a!3626) from!3004)))))

(declare-fun d!94079 () Bool)

(declare-fun res!448268 () Bool)

(declare-fun e!388719 () Bool)

(assert (=> d!94079 (=> res!448268 e!388719)))

(assert (=> d!94079 (= res!448268 (bvsge from!3004 (size!19316 a!3626)))))

(assert (=> d!94079 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388719)))

(declare-fun b!682240 () Bool)

(assert (=> b!682240 (= e!388719 e!388717)))

(declare-fun res!448269 () Bool)

(assert (=> b!682240 (=> (not res!448269) (not e!388717))))

(assert (=> b!682240 (= res!448269 (not e!388718))))

(declare-fun res!448270 () Bool)

(assert (=> b!682240 (=> (not res!448270) (not e!388718))))

(assert (=> b!682240 (= res!448270 (validKeyInArray!0 (select (arr!18952 a!3626) from!3004)))))

(declare-fun b!682241 () Bool)

(declare-fun call!33996 () Bool)

(assert (=> b!682241 (= e!388716 call!33996)))

(declare-fun bm!33993 () Bool)

(assert (=> bm!33993 (= call!33996 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77352 (Cons!12989 (select (arr!18952 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!682242 () Bool)

(assert (=> b!682242 (= e!388716 call!33996)))

(assert (= (and d!94079 (not res!448268)) b!682240))

(assert (= (and b!682240 res!448270) b!682238))

(assert (= (and b!682240 res!448269) b!682239))

(assert (= (and b!682239 c!77352) b!682242))

(assert (= (and b!682239 (not c!77352)) b!682241))

(assert (= (or b!682242 b!682241) bm!33993))

(assert (=> b!682238 m!646875))

(assert (=> b!682238 m!646875))

(declare-fun m!646987 () Bool)

(assert (=> b!682238 m!646987))

(assert (=> b!682239 m!646875))

(assert (=> b!682239 m!646875))

(assert (=> b!682239 m!646905))

(assert (=> b!682240 m!646875))

(assert (=> b!682240 m!646875))

(assert (=> b!682240 m!646905))

(assert (=> bm!33993 m!646875))

(declare-fun m!646991 () Bool)

(assert (=> bm!33993 m!646991))

(assert (=> b!682125 d!94079))

(declare-fun d!94083 () Bool)

(declare-fun lt!313461 () Bool)

(assert (=> d!94083 (= lt!313461 (select (content!279 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388724 () Bool)

(assert (=> d!94083 (= lt!313461 e!388724)))

(declare-fun res!448276 () Bool)

(assert (=> d!94083 (=> (not res!448276) (not e!388724))))

(assert (=> d!94083 (= res!448276 ((_ is Cons!12989) acc!681))))

(assert (=> d!94083 (= (contains!3570 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313461)))

(declare-fun b!682247 () Bool)

(declare-fun e!388725 () Bool)

(assert (=> b!682247 (= e!388724 e!388725)))

(declare-fun res!448275 () Bool)

(assert (=> b!682247 (=> res!448275 e!388725)))

(assert (=> b!682247 (= res!448275 (= (h!14034 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682248 () Bool)

(assert (=> b!682248 (= e!388725 (contains!3570 (t!19233 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94083 res!448276) b!682247))

(assert (= (and b!682247 (not res!448275)) b!682248))

(assert (=> d!94083 m!646951))

(declare-fun m!646997 () Bool)

(assert (=> d!94083 m!646997))

(declare-fun m!646999 () Bool)

(assert (=> b!682248 m!646999))

(assert (=> b!682124 d!94083))

(declare-fun d!94087 () Bool)

(declare-fun res!448277 () Bool)

(declare-fun e!388726 () Bool)

(assert (=> d!94087 (=> res!448277 e!388726)))

(assert (=> d!94087 (= res!448277 (= (select (arr!18952 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94087 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388726)))

(declare-fun b!682249 () Bool)

(declare-fun e!388727 () Bool)

(assert (=> b!682249 (= e!388726 e!388727)))

(declare-fun res!448278 () Bool)

(assert (=> b!682249 (=> (not res!448278) (not e!388727))))

(assert (=> b!682249 (= res!448278 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19316 a!3626)))))

(declare-fun b!682250 () Bool)

(assert (=> b!682250 (= e!388727 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94087 (not res!448277)) b!682249))

(assert (= (and b!682249 res!448278) b!682250))

(declare-fun m!647001 () Bool)

(assert (=> d!94087 m!647001))

(declare-fun m!647003 () Bool)

(assert (=> b!682250 m!647003))

(assert (=> b!682112 d!94087))

(declare-fun d!94089 () Bool)

(assert (=> d!94089 (= ($colon$colon!321 acc!681 (select (arr!18952 a!3626) from!3004)) (Cons!12989 (select (arr!18952 a!3626) from!3004) acc!681))))

(assert (=> b!682111 d!94089))

(declare-fun b!682277 () Bool)

(declare-fun e!388753 () Bool)

(assert (=> b!682277 (= e!388753 (subseq!156 (t!19233 acc!681) (t!19233 acc!681)))))

(declare-fun b!682278 () Bool)

(declare-fun e!388754 () Bool)

(assert (=> b!682278 (= e!388754 (subseq!156 acc!681 (t!19233 acc!681)))))

(declare-fun d!94093 () Bool)

(declare-fun res!448303 () Bool)

(declare-fun e!388755 () Bool)

(assert (=> d!94093 (=> res!448303 e!388755)))

(assert (=> d!94093 (= res!448303 ((_ is Nil!12990) acc!681))))

(assert (=> d!94093 (= (subseq!156 acc!681 acc!681) e!388755)))

(declare-fun b!682276 () Bool)

(declare-fun e!388752 () Bool)

(assert (=> b!682276 (= e!388752 e!388754)))

(declare-fun res!448304 () Bool)

(assert (=> b!682276 (=> res!448304 e!388754)))

(assert (=> b!682276 (= res!448304 e!388753)))

(declare-fun res!448306 () Bool)

(assert (=> b!682276 (=> (not res!448306) (not e!388753))))

(assert (=> b!682276 (= res!448306 (= (h!14034 acc!681) (h!14034 acc!681)))))

(declare-fun b!682275 () Bool)

(assert (=> b!682275 (= e!388755 e!388752)))

(declare-fun res!448305 () Bool)

(assert (=> b!682275 (=> (not res!448305) (not e!388752))))

(assert (=> b!682275 (= res!448305 ((_ is Cons!12989) acc!681))))

(assert (= (and d!94093 (not res!448303)) b!682275))

(assert (= (and b!682275 res!448305) b!682276))

(assert (= (and b!682276 res!448306) b!682277))

(assert (= (and b!682276 (not res!448304)) b!682278))

(declare-fun m!647009 () Bool)

(assert (=> b!682277 m!647009))

(declare-fun m!647011 () Bool)

(assert (=> b!682278 m!647011))

(assert (=> b!682111 d!94093))

(declare-fun d!94099 () Bool)

(assert (=> d!94099 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313470 () Unit!23927)

(declare-fun choose!80 (array!39537 List!12993 List!12993 (_ BitVec 32)) Unit!23927)

(assert (=> d!94099 (= lt!313470 (choose!80 a!3626 ($colon$colon!321 acc!681 (select (arr!18952 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94099 (bvslt (size!19316 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94099 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!321 acc!681 (select (arr!18952 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313470)))

(declare-fun bs!20019 () Bool)

(assert (= bs!20019 d!94099))

(assert (=> bs!20019 m!646873))

(assert (=> bs!20019 m!646877))

(declare-fun m!647021 () Bool)

(assert (=> bs!20019 m!647021))

(assert (=> b!682111 d!94099))

(declare-fun d!94105 () Bool)

(assert (=> d!94105 (subseq!156 acc!681 acc!681)))

(declare-fun lt!313476 () Unit!23927)

(declare-fun choose!36 (List!12993) Unit!23927)

(assert (=> d!94105 (= lt!313476 (choose!36 acc!681))))

(assert (=> d!94105 (= (lemmaListSubSeqRefl!0 acc!681) lt!313476)))

(declare-fun bs!20021 () Bool)

(assert (= bs!20021 d!94105))

(assert (=> bs!20021 m!646883))

(declare-fun m!647029 () Bool)

(assert (=> bs!20021 m!647029))

(assert (=> b!682111 d!94105))

(assert (=> b!682111 d!94059))

(declare-fun b!682298 () Bool)

(declare-fun e!388774 () Bool)

(assert (=> b!682298 (= e!388774 (contains!3570 Nil!12990 (select (arr!18952 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!682299 () Bool)

(declare-fun e!388773 () Bool)

(declare-fun e!388772 () Bool)

(assert (=> b!682299 (= e!388773 e!388772)))

(declare-fun c!77356 () Bool)

(assert (=> b!682299 (= c!77356 (validKeyInArray!0 (select (arr!18952 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94111 () Bool)

(declare-fun res!448320 () Bool)

(declare-fun e!388775 () Bool)

(assert (=> d!94111 (=> res!448320 e!388775)))

(assert (=> d!94111 (= res!448320 (bvsge #b00000000000000000000000000000000 (size!19316 a!3626)))))

(assert (=> d!94111 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12990) e!388775)))

(declare-fun b!682300 () Bool)

(assert (=> b!682300 (= e!388775 e!388773)))

(declare-fun res!448321 () Bool)

(assert (=> b!682300 (=> (not res!448321) (not e!388773))))

(assert (=> b!682300 (= res!448321 (not e!388774))))

(declare-fun res!448322 () Bool)

(assert (=> b!682300 (=> (not res!448322) (not e!388774))))

(assert (=> b!682300 (= res!448322 (validKeyInArray!0 (select (arr!18952 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!682301 () Bool)

(declare-fun call!33998 () Bool)

(assert (=> b!682301 (= e!388772 call!33998)))

(declare-fun bm!33995 () Bool)

(assert (=> bm!33995 (= call!33998 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77356 (Cons!12989 (select (arr!18952 a!3626) #b00000000000000000000000000000000) Nil!12990) Nil!12990)))))

(declare-fun b!682302 () Bool)

(assert (=> b!682302 (= e!388772 call!33998)))

(assert (= (and d!94111 (not res!448320)) b!682300))

(assert (= (and b!682300 res!448322) b!682298))

(assert (= (and b!682300 res!448321) b!682299))

(assert (= (and b!682299 c!77356) b!682302))

(assert (= (and b!682299 (not c!77356)) b!682301))

(assert (= (or b!682302 b!682301) bm!33995))

(assert (=> b!682298 m!647001))

(assert (=> b!682298 m!647001))

(declare-fun m!647035 () Bool)

(assert (=> b!682298 m!647035))

(assert (=> b!682299 m!647001))

(assert (=> b!682299 m!647001))

(declare-fun m!647039 () Bool)

(assert (=> b!682299 m!647039))

(assert (=> b!682300 m!647001))

(assert (=> b!682300 m!647001))

(assert (=> b!682300 m!647039))

(assert (=> bm!33995 m!647001))

(declare-fun m!647041 () Bool)

(assert (=> bm!33995 m!647041))

(assert (=> b!682110 d!94111))

(assert (=> b!682119 d!94077))

(check-sat (not b!682240) (not b!682278) (not b!682216) (not b!682187) (not d!94051) (not b!682248) (not b!682238) (not d!94077) (not b!682215) (not d!94105) (not bm!33995) (not b!682237) (not d!94083) (not b!682231) (not bm!33993) (not b!682192) (not b!682214) (not b!682277) (not d!94053) (not bm!33991) (not b!682298) (not b!682229) (not d!94099) (not b!682239) (not b!682299) (not b!682193) (not b!682250) (not b!682300))
(check-sat)
