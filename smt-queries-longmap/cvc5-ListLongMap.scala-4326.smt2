; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59984 () Bool)

(assert start!59984)

(declare-fun b!665978 () Bool)

(declare-fun res!433442 () Bool)

(declare-fun e!381536 () Bool)

(assert (=> b!665978 (=> res!433442 e!381536)))

(declare-datatypes ((List!12749 0))(
  ( (Nil!12746) (Cons!12745 (h!13790 (_ BitVec 64)) (t!18977 List!12749)) )
))
(declare-fun acc!681 () List!12749)

(declare-fun lt!310243 () List!12749)

(declare-fun subseq!65 (List!12749 List!12749) Bool)

(assert (=> b!665978 (= res!433442 (not (subseq!65 acc!681 lt!310243)))))

(declare-fun b!665979 () Bool)

(declare-fun e!381532 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3326 (List!12749 (_ BitVec 64)) Bool)

(assert (=> b!665979 (= e!381532 (not (contains!3326 acc!681 k!2843)))))

(declare-fun b!665980 () Bool)

(declare-fun res!433430 () Bool)

(declare-fun e!381535 () Bool)

(assert (=> b!665980 (=> (not res!433430) (not e!381535))))

(declare-fun e!381534 () Bool)

(assert (=> b!665980 (= res!433430 e!381534)))

(declare-fun res!433428 () Bool)

(assert (=> b!665980 (=> res!433428 e!381534)))

(declare-fun e!381531 () Bool)

(assert (=> b!665980 (= res!433428 e!381531)))

(declare-fun res!433437 () Bool)

(assert (=> b!665980 (=> (not res!433437) (not e!381531))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665980 (= res!433437 (bvsgt from!3004 i!1382))))

(declare-fun b!665981 () Bool)

(declare-fun res!433432 () Bool)

(assert (=> b!665981 (=> (not res!433432) (not e!381535))))

(declare-datatypes ((array!39031 0))(
  ( (array!39032 (arr!18708 (Array (_ BitVec 32) (_ BitVec 64))) (size!19072 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39031)

(declare-fun arrayContainsKey!0 (array!39031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665981 (= res!433432 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665982 () Bool)

(declare-fun res!433440 () Bool)

(assert (=> b!665982 (=> (not res!433440) (not e!381535))))

(assert (=> b!665982 (= res!433440 (not (contains!3326 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665983 () Bool)

(declare-fun res!433429 () Bool)

(assert (=> b!665983 (=> res!433429 e!381536)))

(assert (=> b!665983 (= res!433429 (contains!3326 lt!310243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665984 () Bool)

(assert (=> b!665984 (= e!381536 true)))

(declare-fun lt!310237 () Bool)

(assert (=> b!665984 (= lt!310237 (contains!3326 lt!310243 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665985 () Bool)

(declare-datatypes ((Unit!23265 0))(
  ( (Unit!23266) )
))
(declare-fun e!381537 () Unit!23265)

(declare-fun Unit!23267 () Unit!23265)

(assert (=> b!665985 (= e!381537 Unit!23267)))

(declare-fun b!665986 () Bool)

(declare-fun res!433424 () Bool)

(assert (=> b!665986 (=> res!433424 e!381536)))

(declare-fun lt!310238 () Bool)

(assert (=> b!665986 (= res!433424 lt!310238)))

(declare-fun b!665988 () Bool)

(declare-fun res!433441 () Bool)

(assert (=> b!665988 (=> (not res!433441) (not e!381535))))

(declare-fun noDuplicate!573 (List!12749) Bool)

(assert (=> b!665988 (= res!433441 (noDuplicate!573 acc!681))))

(declare-fun b!665989 () Bool)

(declare-fun res!433423 () Bool)

(assert (=> b!665989 (=> (not res!433423) (not e!381535))))

(declare-fun arrayNoDuplicates!0 (array!39031 (_ BitVec 32) List!12749) Bool)

(assert (=> b!665989 (= res!433423 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665990 () Bool)

(declare-fun res!433426 () Bool)

(assert (=> b!665990 (=> res!433426 e!381536)))

(assert (=> b!665990 (= res!433426 (not (contains!3326 lt!310243 k!2843)))))

(declare-fun b!665991 () Bool)

(declare-fun res!433425 () Bool)

(assert (=> b!665991 (=> res!433425 e!381536)))

(assert (=> b!665991 (= res!433425 (not (noDuplicate!573 lt!310243)))))

(declare-fun b!665992 () Bool)

(declare-fun res!433436 () Bool)

(assert (=> b!665992 (=> (not res!433436) (not e!381535))))

(assert (=> b!665992 (= res!433436 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19072 a!3626))))))

(declare-fun b!665993 () Bool)

(declare-fun res!433422 () Bool)

(assert (=> b!665993 (=> (not res!433422) (not e!381535))))

(assert (=> b!665993 (= res!433422 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12746))))

(declare-fun b!665994 () Bool)

(declare-fun res!433439 () Bool)

(assert (=> b!665994 (=> (not res!433439) (not e!381535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665994 (= res!433439 (validKeyInArray!0 k!2843))))

(declare-fun b!665995 () Bool)

(assert (=> b!665995 (= e!381535 (not e!381536))))

(declare-fun res!433438 () Bool)

(assert (=> b!665995 (=> res!433438 e!381536)))

(assert (=> b!665995 (= res!433438 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!63 (List!12749 (_ BitVec 64)) List!12749)

(assert (=> b!665995 (= (-!63 lt!310243 k!2843) acc!681)))

(declare-fun $colon$colon!197 (List!12749 (_ BitVec 64)) List!12749)

(assert (=> b!665995 (= lt!310243 ($colon$colon!197 acc!681 k!2843))))

(declare-fun lt!310242 () Unit!23265)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12749) Unit!23265)

(assert (=> b!665995 (= lt!310242 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665995 (subseq!65 acc!681 acc!681)))

(declare-fun lt!310234 () Unit!23265)

(declare-fun lemmaListSubSeqRefl!0 (List!12749) Unit!23265)

(assert (=> b!665995 (= lt!310234 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665995 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310236 () Unit!23265)

(assert (=> b!665995 (= lt!310236 e!381537)))

(declare-fun c!76645 () Bool)

(assert (=> b!665995 (= c!76645 (validKeyInArray!0 (select (arr!18708 a!3626) from!3004)))))

(declare-fun lt!310241 () Unit!23265)

(declare-fun e!381533 () Unit!23265)

(assert (=> b!665995 (= lt!310241 e!381533)))

(declare-fun c!76646 () Bool)

(assert (=> b!665995 (= c!76646 lt!310238)))

(assert (=> b!665995 (= lt!310238 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665995 (arrayContainsKey!0 (array!39032 (store (arr!18708 a!3626) i!1382 k!2843) (size!19072 a!3626)) k!2843 from!3004)))

(declare-fun b!665996 () Bool)

(declare-fun res!433434 () Bool)

(assert (=> b!665996 (=> (not res!433434) (not e!381535))))

(assert (=> b!665996 (= res!433434 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19072 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665997 () Bool)

(assert (=> b!665997 (= e!381534 e!381532)))

(declare-fun res!433435 () Bool)

(assert (=> b!665997 (=> (not res!433435) (not e!381532))))

(assert (=> b!665997 (= res!433435 (bvsle from!3004 i!1382))))

(declare-fun b!665998 () Bool)

(declare-fun Unit!23268 () Unit!23265)

(assert (=> b!665998 (= e!381533 Unit!23268)))

(declare-fun b!665999 () Bool)

(assert (=> b!665999 (= e!381531 (contains!3326 acc!681 k!2843))))

(declare-fun b!666000 () Bool)

(declare-fun res!433433 () Bool)

(assert (=> b!666000 (=> res!433433 e!381536)))

(assert (=> b!666000 (= res!433433 (contains!3326 acc!681 k!2843))))

(declare-fun b!665987 () Bool)

(declare-fun Unit!23269 () Unit!23265)

(assert (=> b!665987 (= e!381533 Unit!23269)))

(declare-fun lt!310235 () Unit!23265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39031 (_ BitVec 64) (_ BitVec 32)) Unit!23265)

(assert (=> b!665987 (= lt!310235 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665987 false))

(declare-fun res!433431 () Bool)

(assert (=> start!59984 (=> (not res!433431) (not e!381535))))

(assert (=> start!59984 (= res!433431 (and (bvslt (size!19072 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19072 a!3626))))))

(assert (=> start!59984 e!381535))

(assert (=> start!59984 true))

(declare-fun array_inv!14504 (array!39031) Bool)

(assert (=> start!59984 (array_inv!14504 a!3626)))

(declare-fun b!666001 () Bool)

(declare-fun lt!310240 () Unit!23265)

(assert (=> b!666001 (= e!381537 lt!310240)))

(declare-fun lt!310239 () Unit!23265)

(assert (=> b!666001 (= lt!310239 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666001 (subseq!65 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39031 List!12749 List!12749 (_ BitVec 32)) Unit!23265)

(assert (=> b!666001 (= lt!310240 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!197 acc!681 (select (arr!18708 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666001 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666002 () Bool)

(declare-fun res!433427 () Bool)

(assert (=> b!666002 (=> (not res!433427) (not e!381535))))

(assert (=> b!666002 (= res!433427 (not (contains!3326 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59984 res!433431) b!665988))

(assert (= (and b!665988 res!433441) b!665982))

(assert (= (and b!665982 res!433440) b!666002))

(assert (= (and b!666002 res!433427) b!665980))

(assert (= (and b!665980 res!433437) b!665999))

(assert (= (and b!665980 (not res!433428)) b!665997))

(assert (= (and b!665997 res!433435) b!665979))

(assert (= (and b!665980 res!433430) b!665993))

(assert (= (and b!665993 res!433422) b!665989))

(assert (= (and b!665989 res!433423) b!665992))

(assert (= (and b!665992 res!433436) b!665994))

(assert (= (and b!665994 res!433439) b!665981))

(assert (= (and b!665981 res!433432) b!665996))

(assert (= (and b!665996 res!433434) b!665995))

(assert (= (and b!665995 c!76646) b!665987))

(assert (= (and b!665995 (not c!76646)) b!665998))

(assert (= (and b!665995 c!76645) b!666001))

(assert (= (and b!665995 (not c!76645)) b!665985))

(assert (= (and b!665995 (not res!433438)) b!665991))

(assert (= (and b!665991 (not res!433425)) b!665986))

(assert (= (and b!665986 (not res!433424)) b!666000))

(assert (= (and b!666000 (not res!433433)) b!665978))

(assert (= (and b!665978 (not res!433442)) b!665990))

(assert (= (and b!665990 (not res!433426)) b!665983))

(assert (= (and b!665983 (not res!433429)) b!665984))

(declare-fun m!636893 () Bool)

(assert (=> b!665995 m!636893))

(declare-fun m!636895 () Bool)

(assert (=> b!665995 m!636895))

(declare-fun m!636897 () Bool)

(assert (=> b!665995 m!636897))

(declare-fun m!636899 () Bool)

(assert (=> b!665995 m!636899))

(declare-fun m!636901 () Bool)

(assert (=> b!665995 m!636901))

(declare-fun m!636903 () Bool)

(assert (=> b!665995 m!636903))

(declare-fun m!636905 () Bool)

(assert (=> b!665995 m!636905))

(declare-fun m!636907 () Bool)

(assert (=> b!665995 m!636907))

(assert (=> b!665995 m!636897))

(declare-fun m!636909 () Bool)

(assert (=> b!665995 m!636909))

(declare-fun m!636911 () Bool)

(assert (=> b!665995 m!636911))

(declare-fun m!636913 () Bool)

(assert (=> b!665995 m!636913))

(declare-fun m!636915 () Bool)

(assert (=> b!665982 m!636915))

(declare-fun m!636917 () Bool)

(assert (=> b!665993 m!636917))

(declare-fun m!636919 () Bool)

(assert (=> b!665981 m!636919))

(declare-fun m!636921 () Bool)

(assert (=> b!665990 m!636921))

(declare-fun m!636923 () Bool)

(assert (=> b!666002 m!636923))

(declare-fun m!636925 () Bool)

(assert (=> start!59984 m!636925))

(declare-fun m!636927 () Bool)

(assert (=> b!665999 m!636927))

(assert (=> b!666000 m!636927))

(declare-fun m!636929 () Bool)

(assert (=> b!665984 m!636929))

(declare-fun m!636931 () Bool)

(assert (=> b!665991 m!636931))

(assert (=> b!665979 m!636927))

(declare-fun m!636933 () Bool)

(assert (=> b!665988 m!636933))

(declare-fun m!636935 () Bool)

(assert (=> b!665987 m!636935))

(assert (=> b!666001 m!636895))

(assert (=> b!666001 m!636897))

(declare-fun m!636937 () Bool)

(assert (=> b!666001 m!636937))

(declare-fun m!636939 () Bool)

(assert (=> b!666001 m!636939))

(assert (=> b!666001 m!636897))

(assert (=> b!666001 m!636937))

(assert (=> b!666001 m!636903))

(assert (=> b!666001 m!636913))

(declare-fun m!636941 () Bool)

(assert (=> b!665994 m!636941))

(declare-fun m!636943 () Bool)

(assert (=> b!665978 m!636943))

(declare-fun m!636945 () Bool)

(assert (=> b!665989 m!636945))

(declare-fun m!636947 () Bool)

(assert (=> b!665983 m!636947))

(push 1)

(assert (not b!665987))

(assert (not b!665995))

(assert (not b!665993))

(assert (not b!665989))

(assert (not b!666000))

(assert (not b!665982))

(assert (not b!665983))

(assert (not b!665991))

(assert (not b!665978))

(assert (not b!665990))

(assert (not start!59984))

(assert (not b!665984))

(assert (not b!665979))

(assert (not b!665994))

(assert (not b!665988))

(assert (not b!665999))

(assert (not b!666002))

(assert (not b!666001))

(assert (not b!665981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

