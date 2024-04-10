; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60008 () Bool)

(assert start!60008)

(declare-fun b!666878 () Bool)

(declare-fun e!381821 () Bool)

(declare-datatypes ((List!12761 0))(
  ( (Nil!12758) (Cons!12757 (h!13802 (_ BitVec 64)) (t!18989 List!12761)) )
))
(declare-fun acc!681 () List!12761)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3338 (List!12761 (_ BitVec 64)) Bool)

(assert (=> b!666878 (= e!381821 (contains!3338 acc!681 k!2843))))

(declare-fun b!666879 () Bool)

(declare-fun res!434186 () Bool)

(declare-fun e!381820 () Bool)

(assert (=> b!666879 (=> (not res!434186) (not e!381820))))

(declare-fun noDuplicate!585 (List!12761) Bool)

(assert (=> b!666879 (= res!434186 (noDuplicate!585 acc!681))))

(declare-fun b!666880 () Bool)

(declare-datatypes ((Unit!23325 0))(
  ( (Unit!23326) )
))
(declare-fun e!381825 () Unit!23325)

(declare-fun Unit!23327 () Unit!23325)

(assert (=> b!666880 (= e!381825 Unit!23327)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!310598 () Unit!23325)

(declare-datatypes ((array!39055 0))(
  ( (array!39056 (arr!18720 (Array (_ BitVec 32) (_ BitVec 64))) (size!19084 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39055 (_ BitVec 64) (_ BitVec 32)) Unit!23325)

(assert (=> b!666880 (= lt!310598 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666880 false))

(declare-fun b!666881 () Bool)

(declare-fun res!434179 () Bool)

(assert (=> b!666881 (=> (not res!434179) (not e!381820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666881 (= res!434179 (validKeyInArray!0 k!2843))))

(declare-fun b!666882 () Bool)

(declare-fun res!434198 () Bool)

(assert (=> b!666882 (=> (not res!434198) (not e!381820))))

(declare-fun e!381823 () Bool)

(assert (=> b!666882 (= res!434198 e!381823)))

(declare-fun res!434195 () Bool)

(assert (=> b!666882 (=> res!434195 e!381823)))

(assert (=> b!666882 (= res!434195 e!381821)))

(declare-fun res!434190 () Bool)

(assert (=> b!666882 (=> (not res!434190) (not e!381821))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666882 (= res!434190 (bvsgt from!3004 i!1382))))

(declare-fun b!666883 () Bool)

(declare-fun res!434191 () Bool)

(declare-fun e!381819 () Bool)

(assert (=> b!666883 (=> res!434191 e!381819)))

(declare-fun lt!310594 () List!12761)

(assert (=> b!666883 (= res!434191 (not (noDuplicate!585 lt!310594)))))

(declare-fun b!666884 () Bool)

(assert (=> b!666884 (= e!381819 true)))

(declare-fun lt!310599 () Bool)

(assert (=> b!666884 (= lt!310599 (contains!3338 lt!310594 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!434188 () Bool)

(assert (=> start!60008 (=> (not res!434188) (not e!381820))))

(assert (=> start!60008 (= res!434188 (and (bvslt (size!19084 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19084 a!3626))))))

(assert (=> start!60008 e!381820))

(assert (=> start!60008 true))

(declare-fun array_inv!14516 (array!39055) Bool)

(assert (=> start!60008 (array_inv!14516 a!3626)))

(declare-fun b!666885 () Bool)

(declare-fun e!381824 () Unit!23325)

(declare-fun Unit!23328 () Unit!23325)

(assert (=> b!666885 (= e!381824 Unit!23328)))

(declare-fun b!666886 () Bool)

(declare-fun res!434178 () Bool)

(assert (=> b!666886 (=> (not res!434178) (not e!381820))))

(declare-fun arrayNoDuplicates!0 (array!39055 (_ BitVec 32) List!12761) Bool)

(assert (=> b!666886 (= res!434178 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666887 () Bool)

(declare-fun res!434185 () Bool)

(assert (=> b!666887 (=> res!434185 e!381819)))

(assert (=> b!666887 (= res!434185 (contains!3338 lt!310594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666888 () Bool)

(declare-fun res!434187 () Bool)

(assert (=> b!666888 (=> (not res!434187) (not e!381820))))

(assert (=> b!666888 (= res!434187 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12758))))

(declare-fun b!666889 () Bool)

(declare-fun e!381822 () Bool)

(assert (=> b!666889 (= e!381823 e!381822)))

(declare-fun res!434192 () Bool)

(assert (=> b!666889 (=> (not res!434192) (not e!381822))))

(assert (=> b!666889 (= res!434192 (bvsle from!3004 i!1382))))

(declare-fun b!666890 () Bool)

(declare-fun res!434182 () Bool)

(assert (=> b!666890 (=> res!434182 e!381819)))

(assert (=> b!666890 (= res!434182 (not (contains!3338 lt!310594 k!2843)))))

(declare-fun b!666891 () Bool)

(assert (=> b!666891 (= e!381822 (not (contains!3338 acc!681 k!2843)))))

(declare-fun b!666892 () Bool)

(declare-fun res!434194 () Bool)

(assert (=> b!666892 (=> res!434194 e!381819)))

(assert (=> b!666892 (= res!434194 (contains!3338 acc!681 k!2843))))

(declare-fun b!666893 () Bool)

(declare-fun res!434196 () Bool)

(assert (=> b!666893 (=> (not res!434196) (not e!381820))))

(declare-fun arrayContainsKey!0 (array!39055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666893 (= res!434196 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666894 () Bool)

(declare-fun res!434181 () Bool)

(assert (=> b!666894 (=> res!434181 e!381819)))

(declare-fun subseq!77 (List!12761 List!12761) Bool)

(assert (=> b!666894 (= res!434181 (not (subseq!77 acc!681 lt!310594)))))

(declare-fun b!666895 () Bool)

(declare-fun res!434184 () Bool)

(assert (=> b!666895 (=> (not res!434184) (not e!381820))))

(assert (=> b!666895 (= res!434184 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19084 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666896 () Bool)

(declare-fun res!434183 () Bool)

(assert (=> b!666896 (=> (not res!434183) (not e!381820))))

(assert (=> b!666896 (= res!434183 (not (contains!3338 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666897 () Bool)

(declare-fun res!434189 () Bool)

(assert (=> b!666897 (=> res!434189 e!381819)))

(declare-fun lt!310600 () Bool)

(assert (=> b!666897 (= res!434189 lt!310600)))

(declare-fun b!666898 () Bool)

(declare-fun Unit!23329 () Unit!23325)

(assert (=> b!666898 (= e!381825 Unit!23329)))

(declare-fun b!666899 () Bool)

(assert (=> b!666899 (= e!381820 (not e!381819))))

(declare-fun res!434193 () Bool)

(assert (=> b!666899 (=> res!434193 e!381819)))

(assert (=> b!666899 (= res!434193 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!75 (List!12761 (_ BitVec 64)) List!12761)

(assert (=> b!666899 (= (-!75 lt!310594 k!2843) acc!681)))

(declare-fun $colon$colon!209 (List!12761 (_ BitVec 64)) List!12761)

(assert (=> b!666899 (= lt!310594 ($colon$colon!209 acc!681 k!2843))))

(declare-fun lt!310602 () Unit!23325)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12761) Unit!23325)

(assert (=> b!666899 (= lt!310602 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666899 (subseq!77 acc!681 acc!681)))

(declare-fun lt!310595 () Unit!23325)

(declare-fun lemmaListSubSeqRefl!0 (List!12761) Unit!23325)

(assert (=> b!666899 (= lt!310595 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666899 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310596 () Unit!23325)

(assert (=> b!666899 (= lt!310596 e!381824)))

(declare-fun c!76718 () Bool)

(assert (=> b!666899 (= c!76718 (validKeyInArray!0 (select (arr!18720 a!3626) from!3004)))))

(declare-fun lt!310601 () Unit!23325)

(assert (=> b!666899 (= lt!310601 e!381825)))

(declare-fun c!76717 () Bool)

(assert (=> b!666899 (= c!76717 lt!310600)))

(assert (=> b!666899 (= lt!310600 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666899 (arrayContainsKey!0 (array!39056 (store (arr!18720 a!3626) i!1382 k!2843) (size!19084 a!3626)) k!2843 from!3004)))

(declare-fun b!666900 () Bool)

(declare-fun lt!310597 () Unit!23325)

(assert (=> b!666900 (= e!381824 lt!310597)))

(declare-fun lt!310603 () Unit!23325)

(assert (=> b!666900 (= lt!310603 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666900 (subseq!77 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39055 List!12761 List!12761 (_ BitVec 32)) Unit!23325)

(assert (=> b!666900 (= lt!310597 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!209 acc!681 (select (arr!18720 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666900 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666901 () Bool)

(declare-fun res!434180 () Bool)

(assert (=> b!666901 (=> (not res!434180) (not e!381820))))

(assert (=> b!666901 (= res!434180 (not (contains!3338 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666902 () Bool)

(declare-fun res!434197 () Bool)

(assert (=> b!666902 (=> (not res!434197) (not e!381820))))

(assert (=> b!666902 (= res!434197 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19084 a!3626))))))

(assert (= (and start!60008 res!434188) b!666879))

(assert (= (and b!666879 res!434186) b!666896))

(assert (= (and b!666896 res!434183) b!666901))

(assert (= (and b!666901 res!434180) b!666882))

(assert (= (and b!666882 res!434190) b!666878))

(assert (= (and b!666882 (not res!434195)) b!666889))

(assert (= (and b!666889 res!434192) b!666891))

(assert (= (and b!666882 res!434198) b!666888))

(assert (= (and b!666888 res!434187) b!666886))

(assert (= (and b!666886 res!434178) b!666902))

(assert (= (and b!666902 res!434197) b!666881))

(assert (= (and b!666881 res!434179) b!666893))

(assert (= (and b!666893 res!434196) b!666895))

(assert (= (and b!666895 res!434184) b!666899))

(assert (= (and b!666899 c!76717) b!666880))

(assert (= (and b!666899 (not c!76717)) b!666898))

(assert (= (and b!666899 c!76718) b!666900))

(assert (= (and b!666899 (not c!76718)) b!666885))

(assert (= (and b!666899 (not res!434193)) b!666883))

(assert (= (and b!666883 (not res!434191)) b!666897))

(assert (= (and b!666897 (not res!434189)) b!666892))

(assert (= (and b!666892 (not res!434194)) b!666894))

(assert (= (and b!666894 (not res!434181)) b!666890))

(assert (= (and b!666890 (not res!434182)) b!666887))

(assert (= (and b!666887 (not res!434185)) b!666884))

(declare-fun m!637565 () Bool)

(assert (=> b!666881 m!637565))

(declare-fun m!637567 () Bool)

(assert (=> b!666879 m!637567))

(declare-fun m!637569 () Bool)

(assert (=> b!666896 m!637569))

(declare-fun m!637571 () Bool)

(assert (=> b!666891 m!637571))

(declare-fun m!637573 () Bool)

(assert (=> start!60008 m!637573))

(declare-fun m!637575 () Bool)

(assert (=> b!666890 m!637575))

(declare-fun m!637577 () Bool)

(assert (=> b!666894 m!637577))

(declare-fun m!637579 () Bool)

(assert (=> b!666899 m!637579))

(declare-fun m!637581 () Bool)

(assert (=> b!666899 m!637581))

(declare-fun m!637583 () Bool)

(assert (=> b!666899 m!637583))

(declare-fun m!637585 () Bool)

(assert (=> b!666899 m!637585))

(declare-fun m!637587 () Bool)

(assert (=> b!666899 m!637587))

(declare-fun m!637589 () Bool)

(assert (=> b!666899 m!637589))

(declare-fun m!637591 () Bool)

(assert (=> b!666899 m!637591))

(declare-fun m!637593 () Bool)

(assert (=> b!666899 m!637593))

(assert (=> b!666899 m!637581))

(declare-fun m!637595 () Bool)

(assert (=> b!666899 m!637595))

(declare-fun m!637597 () Bool)

(assert (=> b!666899 m!637597))

(declare-fun m!637599 () Bool)

(assert (=> b!666899 m!637599))

(declare-fun m!637601 () Bool)

(assert (=> b!666893 m!637601))

(assert (=> b!666892 m!637571))

(declare-fun m!637603 () Bool)

(assert (=> b!666886 m!637603))

(declare-fun m!637605 () Bool)

(assert (=> b!666888 m!637605))

(declare-fun m!637607 () Bool)

(assert (=> b!666887 m!637607))

(declare-fun m!637609 () Bool)

(assert (=> b!666880 m!637609))

(declare-fun m!637611 () Bool)

(assert (=> b!666884 m!637611))

(declare-fun m!637613 () Bool)

(assert (=> b!666901 m!637613))

(assert (=> b!666900 m!637579))

(assert (=> b!666900 m!637581))

(declare-fun m!637615 () Bool)

(assert (=> b!666900 m!637615))

(declare-fun m!637617 () Bool)

(assert (=> b!666900 m!637617))

(assert (=> b!666900 m!637581))

(assert (=> b!666900 m!637615))

(assert (=> b!666900 m!637589))

(assert (=> b!666900 m!637599))

(assert (=> b!666878 m!637571))

(declare-fun m!637619 () Bool)

(assert (=> b!666883 m!637619))

(push 1)

(assert (not b!666888))

(assert (not b!666891))

(assert (not b!666886))

(assert (not b!666880))

(assert (not b!666901))

(assert (not b!666894))

(assert (not b!666890))

(assert (not b!666883))

(assert (not b!666893))

(assert (not b!666900))

(assert (not b!666878))

(assert (not b!666899))

(assert (not b!666879))

(assert (not b!666892))

(assert (not b!666896))

(assert (not start!60008))

(assert (not b!666884))

(assert (not b!666887))

(assert (not b!666881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

