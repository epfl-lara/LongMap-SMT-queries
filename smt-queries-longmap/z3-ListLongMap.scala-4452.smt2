; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61968 () Bool)

(assert start!61968)

(declare-fun b!692968 () Bool)

(declare-fun res!457064 () Bool)

(declare-fun e!394296 () Bool)

(assert (=> b!692968 (=> (not res!457064) (not e!394296))))

(declare-datatypes ((array!39837 0))(
  ( (array!39838 (arr!19081 (Array (_ BitVec 32) (_ BitVec 64))) (size!19464 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39837)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13029 0))(
  ( (Nil!13026) (Cons!13025 (h!14073 (_ BitVec 64)) (t!19294 List!13029)) )
))
(declare-fun acc!681 () List!13029)

(declare-fun arrayNoDuplicates!0 (array!39837 (_ BitVec 32) List!13029) Bool)

(assert (=> b!692968 (= res!457064 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692969 () Bool)

(declare-fun e!394298 () Bool)

(declare-fun lt!316745 () List!13029)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3681 (List!13029 (_ BitVec 64)) Bool)

(assert (=> b!692969 (= e!394298 (not (contains!3681 lt!316745 k0!2843)))))

(declare-fun b!692970 () Bool)

(declare-fun e!394299 () Bool)

(assert (=> b!692970 (= e!394299 (contains!3681 lt!316745 k0!2843))))

(declare-fun b!692971 () Bool)

(declare-fun e!394300 () Bool)

(assert (=> b!692971 (= e!394300 (contains!3681 acc!681 k0!2843))))

(declare-fun b!692972 () Bool)

(declare-fun e!394303 () Bool)

(assert (=> b!692972 (= e!394303 e!394299)))

(declare-fun res!457067 () Bool)

(assert (=> b!692972 (=> res!457067 e!394299)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692972 (= res!457067 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692973 () Bool)

(declare-datatypes ((Unit!24441 0))(
  ( (Unit!24442) )
))
(declare-fun e!394305 () Unit!24441)

(declare-fun Unit!24443 () Unit!24441)

(assert (=> b!692973 (= e!394305 Unit!24443)))

(declare-fun arrayContainsKey!0 (array!39837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692973 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316747 () Unit!24441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39837 (_ BitVec 64) (_ BitVec 32)) Unit!24441)

(assert (=> b!692973 (= lt!316747 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692973 false))

(declare-fun b!692974 () Bool)

(declare-fun res!457060 () Bool)

(assert (=> b!692974 (=> (not res!457060) (not e!394303))))

(declare-fun noDuplicate!955 (List!13029) Bool)

(assert (=> b!692974 (= res!457060 (noDuplicate!955 lt!316745))))

(declare-fun b!692975 () Bool)

(declare-fun Unit!24444 () Unit!24441)

(assert (=> b!692975 (= e!394305 Unit!24444)))

(declare-fun b!692976 () Bool)

(declare-fun e!394297 () Bool)

(assert (=> b!692976 (= e!394296 e!394297)))

(declare-fun res!457072 () Bool)

(assert (=> b!692976 (=> (not res!457072) (not e!394297))))

(assert (=> b!692976 (= res!457072 (not (= (select (arr!19081 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316746 () Unit!24441)

(assert (=> b!692976 (= lt!316746 e!394305)))

(declare-fun c!78323 () Bool)

(assert (=> b!692976 (= c!78323 (= (select (arr!19081 a!3626) from!3004) k0!2843))))

(declare-fun b!692977 () Bool)

(declare-fun e!394302 () Bool)

(assert (=> b!692977 (= e!394302 (not (contains!3681 acc!681 k0!2843)))))

(declare-fun b!692978 () Bool)

(declare-fun res!457080 () Bool)

(assert (=> b!692978 (=> (not res!457080) (not e!394303))))

(assert (=> b!692978 (= res!457080 (not (contains!3681 lt!316745 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692979 () Bool)

(declare-fun res!457062 () Bool)

(assert (=> b!692979 (=> (not res!457062) (not e!394296))))

(assert (=> b!692979 (= res!457062 (noDuplicate!955 acc!681))))

(declare-fun b!692980 () Bool)

(declare-fun res!457076 () Bool)

(assert (=> b!692980 (=> (not res!457076) (not e!394296))))

(declare-fun e!394304 () Bool)

(assert (=> b!692980 (= res!457076 e!394304)))

(declare-fun res!457077 () Bool)

(assert (=> b!692980 (=> res!457077 e!394304)))

(assert (=> b!692980 (= res!457077 e!394300)))

(declare-fun res!457079 () Bool)

(assert (=> b!692980 (=> (not res!457079) (not e!394300))))

(assert (=> b!692980 (= res!457079 (bvsgt from!3004 i!1382))))

(declare-fun b!692981 () Bool)

(declare-fun res!457061 () Bool)

(assert (=> b!692981 (=> (not res!457061) (not e!394296))))

(assert (=> b!692981 (= res!457061 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19464 a!3626))))))

(declare-fun b!692982 () Bool)

(declare-fun res!457074 () Bool)

(assert (=> b!692982 (=> (not res!457074) (not e!394303))))

(assert (=> b!692982 (= res!457074 e!394298)))

(declare-fun res!457081 () Bool)

(assert (=> b!692982 (=> res!457081 e!394298)))

(assert (=> b!692982 (= res!457081 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692983 () Bool)

(declare-fun res!457078 () Bool)

(assert (=> b!692983 (=> (not res!457078) (not e!394303))))

(assert (=> b!692983 (= res!457078 (not (contains!3681 lt!316745 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692984 () Bool)

(declare-fun res!457068 () Bool)

(assert (=> b!692984 (=> (not res!457068) (not e!394296))))

(assert (=> b!692984 (= res!457068 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13026))))

(declare-fun b!692985 () Bool)

(declare-fun res!457059 () Bool)

(assert (=> b!692985 (=> (not res!457059) (not e!394296))))

(assert (=> b!692985 (= res!457059 (not (contains!3681 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!457066 () Bool)

(assert (=> start!61968 (=> (not res!457066) (not e!394296))))

(assert (=> start!61968 (= res!457066 (and (bvslt (size!19464 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19464 a!3626))))))

(assert (=> start!61968 e!394296))

(assert (=> start!61968 true))

(declare-fun array_inv!14940 (array!39837) Bool)

(assert (=> start!61968 (array_inv!14940 a!3626)))

(declare-fun b!692986 () Bool)

(assert (=> b!692986 (= e!394297 e!394303)))

(declare-fun res!457069 () Bool)

(assert (=> b!692986 (=> (not res!457069) (not e!394303))))

(assert (=> b!692986 (= res!457069 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!413 (List!13029 (_ BitVec 64)) List!13029)

(assert (=> b!692986 (= lt!316745 ($colon$colon!413 acc!681 (select (arr!19081 a!3626) from!3004)))))

(declare-fun b!692987 () Bool)

(declare-fun res!457070 () Bool)

(assert (=> b!692987 (=> (not res!457070) (not e!394296))))

(assert (=> b!692987 (= res!457070 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19464 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692988 () Bool)

(declare-fun res!457073 () Bool)

(assert (=> b!692988 (=> (not res!457073) (not e!394296))))

(assert (=> b!692988 (= res!457073 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692989 () Bool)

(declare-fun res!457063 () Bool)

(assert (=> b!692989 (=> (not res!457063) (not e!394296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692989 (= res!457063 (validKeyInArray!0 k0!2843))))

(declare-fun b!692990 () Bool)

(declare-fun res!457071 () Bool)

(assert (=> b!692990 (=> (not res!457071) (not e!394296))))

(assert (=> b!692990 (= res!457071 (not (contains!3681 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692991 () Bool)

(declare-fun res!457075 () Bool)

(assert (=> b!692991 (=> (not res!457075) (not e!394296))))

(assert (=> b!692991 (= res!457075 (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)))))

(declare-fun b!692992 () Bool)

(assert (=> b!692992 (= e!394304 e!394302)))

(declare-fun res!457065 () Bool)

(assert (=> b!692992 (=> (not res!457065) (not e!394302))))

(assert (=> b!692992 (= res!457065 (bvsle from!3004 i!1382))))

(assert (= (and start!61968 res!457066) b!692979))

(assert (= (and b!692979 res!457062) b!692990))

(assert (= (and b!692990 res!457071) b!692985))

(assert (= (and b!692985 res!457059) b!692980))

(assert (= (and b!692980 res!457079) b!692971))

(assert (= (and b!692980 (not res!457077)) b!692992))

(assert (= (and b!692992 res!457065) b!692977))

(assert (= (and b!692980 res!457076) b!692984))

(assert (= (and b!692984 res!457068) b!692968))

(assert (= (and b!692968 res!457064) b!692981))

(assert (= (and b!692981 res!457061) b!692989))

(assert (= (and b!692989 res!457063) b!692988))

(assert (= (and b!692988 res!457073) b!692987))

(assert (= (and b!692987 res!457070) b!692991))

(assert (= (and b!692991 res!457075) b!692976))

(assert (= (and b!692976 c!78323) b!692973))

(assert (= (and b!692976 (not c!78323)) b!692975))

(assert (= (and b!692976 res!457072) b!692986))

(assert (= (and b!692986 res!457069) b!692974))

(assert (= (and b!692974 res!457060) b!692983))

(assert (= (and b!692983 res!457078) b!692978))

(assert (= (and b!692978 res!457080) b!692982))

(assert (= (and b!692982 (not res!457081)) b!692969))

(assert (= (and b!692982 res!457074) b!692972))

(assert (= (and b!692972 (not res!457067)) b!692970))

(declare-fun m!655957 () Bool)

(assert (=> b!692976 m!655957))

(declare-fun m!655959 () Bool)

(assert (=> b!692978 m!655959))

(declare-fun m!655961 () Bool)

(assert (=> b!692979 m!655961))

(declare-fun m!655963 () Bool)

(assert (=> b!692983 m!655963))

(declare-fun m!655965 () Bool)

(assert (=> b!692973 m!655965))

(declare-fun m!655967 () Bool)

(assert (=> b!692973 m!655967))

(assert (=> b!692986 m!655957))

(assert (=> b!692986 m!655957))

(declare-fun m!655969 () Bool)

(assert (=> b!692986 m!655969))

(assert (=> b!692991 m!655957))

(assert (=> b!692991 m!655957))

(declare-fun m!655971 () Bool)

(assert (=> b!692991 m!655971))

(declare-fun m!655973 () Bool)

(assert (=> b!692985 m!655973))

(declare-fun m!655975 () Bool)

(assert (=> b!692970 m!655975))

(assert (=> b!692969 m!655975))

(declare-fun m!655977 () Bool)

(assert (=> start!61968 m!655977))

(declare-fun m!655979 () Bool)

(assert (=> b!692977 m!655979))

(declare-fun m!655981 () Bool)

(assert (=> b!692984 m!655981))

(declare-fun m!655983 () Bool)

(assert (=> b!692974 m!655983))

(declare-fun m!655985 () Bool)

(assert (=> b!692989 m!655985))

(declare-fun m!655987 () Bool)

(assert (=> b!692990 m!655987))

(declare-fun m!655989 () Bool)

(assert (=> b!692988 m!655989))

(declare-fun m!655991 () Bool)

(assert (=> b!692968 m!655991))

(assert (=> b!692971 m!655979))

(check-sat (not b!692989) (not b!692969) (not b!692985) (not b!692978) (not b!692979) (not b!692977) (not b!692971) (not b!692968) (not b!692970) (not b!692984) (not b!692988) (not b!692990) (not b!692974) (not b!692983) (not b!692973) (not b!692986) (not start!61968) (not b!692991))
(check-sat)
(get-model)

(declare-fun d!95829 () Bool)

(declare-fun lt!316768 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!315 (List!13029) (InoxSet (_ BitVec 64)))

(assert (=> d!95829 (= lt!316768 (select (content!315 lt!316745) k0!2843))))

(declare-fun e!394370 () Bool)

(assert (=> d!95829 (= lt!316768 e!394370)))

(declare-fun res!457224 () Bool)

(assert (=> d!95829 (=> (not res!457224) (not e!394370))))

(get-info :version)

(assert (=> d!95829 (= res!457224 ((_ is Cons!13025) lt!316745))))

(assert (=> d!95829 (= (contains!3681 lt!316745 k0!2843) lt!316768)))

(declare-fun b!693147 () Bool)

(declare-fun e!394371 () Bool)

(assert (=> b!693147 (= e!394370 e!394371)))

(declare-fun res!457225 () Bool)

(assert (=> b!693147 (=> res!457225 e!394371)))

(assert (=> b!693147 (= res!457225 (= (h!14073 lt!316745) k0!2843))))

(declare-fun b!693148 () Bool)

(assert (=> b!693148 (= e!394371 (contains!3681 (t!19294 lt!316745) k0!2843))))

(assert (= (and d!95829 res!457224) b!693147))

(assert (= (and b!693147 (not res!457225)) b!693148))

(declare-fun m!656065 () Bool)

(assert (=> d!95829 m!656065))

(declare-fun m!656067 () Bool)

(assert (=> d!95829 m!656067))

(declare-fun m!656069 () Bool)

(assert (=> b!693148 m!656069))

(assert (=> b!692970 d!95829))

(declare-fun d!95831 () Bool)

(assert (=> d!95831 (= (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)) (and (not (= (select (arr!19081 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19081 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692991 d!95831))

(assert (=> b!692969 d!95829))

(declare-fun d!95833 () Bool)

(declare-fun lt!316769 () Bool)

(assert (=> d!95833 (= lt!316769 (select (content!315 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394372 () Bool)

(assert (=> d!95833 (= lt!316769 e!394372)))

(declare-fun res!457226 () Bool)

(assert (=> d!95833 (=> (not res!457226) (not e!394372))))

(assert (=> d!95833 (= res!457226 ((_ is Cons!13025) acc!681))))

(assert (=> d!95833 (= (contains!3681 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316769)))

(declare-fun b!693149 () Bool)

(declare-fun e!394373 () Bool)

(assert (=> b!693149 (= e!394372 e!394373)))

(declare-fun res!457227 () Bool)

(assert (=> b!693149 (=> res!457227 e!394373)))

(assert (=> b!693149 (= res!457227 (= (h!14073 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693150 () Bool)

(assert (=> b!693150 (= e!394373 (contains!3681 (t!19294 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95833 res!457226) b!693149))

(assert (= (and b!693149 (not res!457227)) b!693150))

(declare-fun m!656071 () Bool)

(assert (=> d!95833 m!656071))

(declare-fun m!656073 () Bool)

(assert (=> d!95833 m!656073))

(declare-fun m!656075 () Bool)

(assert (=> b!693150 m!656075))

(assert (=> b!692990 d!95833))

(declare-fun d!95835 () Bool)

(declare-fun res!457232 () Bool)

(declare-fun e!394378 () Bool)

(assert (=> d!95835 (=> res!457232 e!394378)))

(assert (=> d!95835 (= res!457232 ((_ is Nil!13026) acc!681))))

(assert (=> d!95835 (= (noDuplicate!955 acc!681) e!394378)))

(declare-fun b!693155 () Bool)

(declare-fun e!394379 () Bool)

(assert (=> b!693155 (= e!394378 e!394379)))

(declare-fun res!457233 () Bool)

(assert (=> b!693155 (=> (not res!457233) (not e!394379))))

(assert (=> b!693155 (= res!457233 (not (contains!3681 (t!19294 acc!681) (h!14073 acc!681))))))

(declare-fun b!693156 () Bool)

(assert (=> b!693156 (= e!394379 (noDuplicate!955 (t!19294 acc!681)))))

(assert (= (and d!95835 (not res!457232)) b!693155))

(assert (= (and b!693155 res!457233) b!693156))

(declare-fun m!656077 () Bool)

(assert (=> b!693155 m!656077))

(declare-fun m!656079 () Bool)

(assert (=> b!693156 m!656079))

(assert (=> b!692979 d!95835))

(declare-fun b!693167 () Bool)

(declare-fun e!394391 () Bool)

(declare-fun call!34260 () Bool)

(assert (=> b!693167 (= e!394391 call!34260)))

(declare-fun b!693168 () Bool)

(declare-fun e!394389 () Bool)

(assert (=> b!693168 (= e!394389 (contains!3681 acc!681 (select (arr!19081 a!3626) from!3004)))))

(declare-fun bm!34257 () Bool)

(declare-fun c!78332 () Bool)

(assert (=> bm!34257 (= call!34260 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78332 (Cons!13025 (select (arr!19081 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!693169 () Bool)

(assert (=> b!693169 (= e!394391 call!34260)))

(declare-fun b!693170 () Bool)

(declare-fun e!394388 () Bool)

(assert (=> b!693170 (= e!394388 e!394391)))

(assert (=> b!693170 (= c!78332 (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)))))

(declare-fun d!95837 () Bool)

(declare-fun res!457241 () Bool)

(declare-fun e!394390 () Bool)

(assert (=> d!95837 (=> res!457241 e!394390)))

(assert (=> d!95837 (= res!457241 (bvsge from!3004 (size!19464 a!3626)))))

(assert (=> d!95837 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394390)))

(declare-fun b!693171 () Bool)

(assert (=> b!693171 (= e!394390 e!394388)))

(declare-fun res!457240 () Bool)

(assert (=> b!693171 (=> (not res!457240) (not e!394388))))

(assert (=> b!693171 (= res!457240 (not e!394389))))

(declare-fun res!457242 () Bool)

(assert (=> b!693171 (=> (not res!457242) (not e!394389))))

(assert (=> b!693171 (= res!457242 (validKeyInArray!0 (select (arr!19081 a!3626) from!3004)))))

(assert (= (and d!95837 (not res!457241)) b!693171))

(assert (= (and b!693171 res!457242) b!693168))

(assert (= (and b!693171 res!457240) b!693170))

(assert (= (and b!693170 c!78332) b!693169))

(assert (= (and b!693170 (not c!78332)) b!693167))

(assert (= (or b!693169 b!693167) bm!34257))

(assert (=> b!693168 m!655957))

(assert (=> b!693168 m!655957))

(declare-fun m!656081 () Bool)

(assert (=> b!693168 m!656081))

(assert (=> bm!34257 m!655957))

(declare-fun m!656083 () Bool)

(assert (=> bm!34257 m!656083))

(assert (=> b!693170 m!655957))

(assert (=> b!693170 m!655957))

(assert (=> b!693170 m!655971))

(assert (=> b!693171 m!655957))

(assert (=> b!693171 m!655957))

(assert (=> b!693171 m!655971))

(assert (=> b!692968 d!95837))

(declare-fun d!95839 () Bool)

(assert (=> d!95839 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692989 d!95839))

(declare-fun d!95841 () Bool)

(declare-fun lt!316770 () Bool)

(assert (=> d!95841 (= lt!316770 (select (content!315 lt!316745) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394392 () Bool)

(assert (=> d!95841 (= lt!316770 e!394392)))

(declare-fun res!457243 () Bool)

(assert (=> d!95841 (=> (not res!457243) (not e!394392))))

(assert (=> d!95841 (= res!457243 ((_ is Cons!13025) lt!316745))))

(assert (=> d!95841 (= (contains!3681 lt!316745 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316770)))

(declare-fun b!693172 () Bool)

(declare-fun e!394393 () Bool)

(assert (=> b!693172 (= e!394392 e!394393)))

(declare-fun res!457244 () Bool)

(assert (=> b!693172 (=> res!457244 e!394393)))

(assert (=> b!693172 (= res!457244 (= (h!14073 lt!316745) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693173 () Bool)

(assert (=> b!693173 (= e!394393 (contains!3681 (t!19294 lt!316745) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95841 res!457243) b!693172))

(assert (= (and b!693172 (not res!457244)) b!693173))

(assert (=> d!95841 m!656065))

(declare-fun m!656085 () Bool)

(assert (=> d!95841 m!656085))

(declare-fun m!656087 () Bool)

(assert (=> b!693173 m!656087))

(assert (=> b!692978 d!95841))

(declare-fun d!95843 () Bool)

(declare-fun res!457249 () Bool)

(declare-fun e!394398 () Bool)

(assert (=> d!95843 (=> res!457249 e!394398)))

(assert (=> d!95843 (= res!457249 (= (select (arr!19081 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95843 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!394398)))

(declare-fun b!693178 () Bool)

(declare-fun e!394399 () Bool)

(assert (=> b!693178 (= e!394398 e!394399)))

(declare-fun res!457250 () Bool)

(assert (=> b!693178 (=> (not res!457250) (not e!394399))))

(assert (=> b!693178 (= res!457250 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19464 a!3626)))))

(declare-fun b!693179 () Bool)

(assert (=> b!693179 (= e!394399 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95843 (not res!457249)) b!693178))

(assert (= (and b!693178 res!457250) b!693179))

(declare-fun m!656089 () Bool)

(assert (=> d!95843 m!656089))

(declare-fun m!656091 () Bool)

(assert (=> b!693179 m!656091))

(assert (=> b!692988 d!95843))

(declare-fun d!95847 () Bool)

(declare-fun lt!316771 () Bool)

(assert (=> d!95847 (= lt!316771 (select (content!315 acc!681) k0!2843))))

(declare-fun e!394400 () Bool)

(assert (=> d!95847 (= lt!316771 e!394400)))

(declare-fun res!457251 () Bool)

(assert (=> d!95847 (=> (not res!457251) (not e!394400))))

(assert (=> d!95847 (= res!457251 ((_ is Cons!13025) acc!681))))

(assert (=> d!95847 (= (contains!3681 acc!681 k0!2843) lt!316771)))

(declare-fun b!693180 () Bool)

(declare-fun e!394401 () Bool)

(assert (=> b!693180 (= e!394400 e!394401)))

(declare-fun res!457252 () Bool)

(assert (=> b!693180 (=> res!457252 e!394401)))

(assert (=> b!693180 (= res!457252 (= (h!14073 acc!681) k0!2843))))

(declare-fun b!693181 () Bool)

(assert (=> b!693181 (= e!394401 (contains!3681 (t!19294 acc!681) k0!2843))))

(assert (= (and d!95847 res!457251) b!693180))

(assert (= (and b!693180 (not res!457252)) b!693181))

(assert (=> d!95847 m!656071))

(declare-fun m!656093 () Bool)

(assert (=> d!95847 m!656093))

(declare-fun m!656095 () Bool)

(assert (=> b!693181 m!656095))

(assert (=> b!692977 d!95847))

(declare-fun d!95849 () Bool)

(assert (=> d!95849 (= (array_inv!14940 a!3626) (bvsge (size!19464 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61968 d!95849))

(declare-fun d!95851 () Bool)

(assert (=> d!95851 (= ($colon$colon!413 acc!681 (select (arr!19081 a!3626) from!3004)) (Cons!13025 (select (arr!19081 a!3626) from!3004) acc!681))))

(assert (=> b!692986 d!95851))

(declare-fun d!95853 () Bool)

(declare-fun lt!316774 () Bool)

(assert (=> d!95853 (= lt!316774 (select (content!315 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394406 () Bool)

(assert (=> d!95853 (= lt!316774 e!394406)))

(declare-fun res!457257 () Bool)

(assert (=> d!95853 (=> (not res!457257) (not e!394406))))

(assert (=> d!95853 (= res!457257 ((_ is Cons!13025) acc!681))))

(assert (=> d!95853 (= (contains!3681 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316774)))

(declare-fun b!693186 () Bool)

(declare-fun e!394407 () Bool)

(assert (=> b!693186 (= e!394406 e!394407)))

(declare-fun res!457258 () Bool)

(assert (=> b!693186 (=> res!457258 e!394407)))

(assert (=> b!693186 (= res!457258 (= (h!14073 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693187 () Bool)

(assert (=> b!693187 (= e!394407 (contains!3681 (t!19294 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95853 res!457257) b!693186))

(assert (= (and b!693186 (not res!457258)) b!693187))

(assert (=> d!95853 m!656071))

(declare-fun m!656097 () Bool)

(assert (=> d!95853 m!656097))

(declare-fun m!656099 () Bool)

(assert (=> b!693187 m!656099))

(assert (=> b!692985 d!95853))

(declare-fun d!95855 () Bool)

(declare-fun res!457259 () Bool)

(declare-fun e!394408 () Bool)

(assert (=> d!95855 (=> res!457259 e!394408)))

(assert (=> d!95855 (= res!457259 ((_ is Nil!13026) lt!316745))))

(assert (=> d!95855 (= (noDuplicate!955 lt!316745) e!394408)))

(declare-fun b!693188 () Bool)

(declare-fun e!394409 () Bool)

(assert (=> b!693188 (= e!394408 e!394409)))

(declare-fun res!457260 () Bool)

(assert (=> b!693188 (=> (not res!457260) (not e!394409))))

(assert (=> b!693188 (= res!457260 (not (contains!3681 (t!19294 lt!316745) (h!14073 lt!316745))))))

(declare-fun b!693189 () Bool)

(assert (=> b!693189 (= e!394409 (noDuplicate!955 (t!19294 lt!316745)))))

(assert (= (and d!95855 (not res!457259)) b!693188))

(assert (= (and b!693188 res!457260) b!693189))

(declare-fun m!656101 () Bool)

(assert (=> b!693188 m!656101))

(declare-fun m!656103 () Bool)

(assert (=> b!693189 m!656103))

(assert (=> b!692974 d!95855))

(declare-fun b!693190 () Bool)

(declare-fun e!394413 () Bool)

(declare-fun call!34261 () Bool)

(assert (=> b!693190 (= e!394413 call!34261)))

(declare-fun b!693191 () Bool)

(declare-fun e!394411 () Bool)

(assert (=> b!693191 (= e!394411 (contains!3681 Nil!13026 (select (arr!19081 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34258 () Bool)

(declare-fun c!78333 () Bool)

(assert (=> bm!34258 (= call!34261 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78333 (Cons!13025 (select (arr!19081 a!3626) #b00000000000000000000000000000000) Nil!13026) Nil!13026)))))

(declare-fun b!693192 () Bool)

(assert (=> b!693192 (= e!394413 call!34261)))

(declare-fun b!693193 () Bool)

(declare-fun e!394410 () Bool)

(assert (=> b!693193 (= e!394410 e!394413)))

(assert (=> b!693193 (= c!78333 (validKeyInArray!0 (select (arr!19081 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95857 () Bool)

(declare-fun res!457262 () Bool)

(declare-fun e!394412 () Bool)

(assert (=> d!95857 (=> res!457262 e!394412)))

(assert (=> d!95857 (= res!457262 (bvsge #b00000000000000000000000000000000 (size!19464 a!3626)))))

(assert (=> d!95857 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13026) e!394412)))

(declare-fun b!693194 () Bool)

(assert (=> b!693194 (= e!394412 e!394410)))

(declare-fun res!457261 () Bool)

(assert (=> b!693194 (=> (not res!457261) (not e!394410))))

(assert (=> b!693194 (= res!457261 (not e!394411))))

(declare-fun res!457263 () Bool)

(assert (=> b!693194 (=> (not res!457263) (not e!394411))))

(assert (=> b!693194 (= res!457263 (validKeyInArray!0 (select (arr!19081 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95857 (not res!457262)) b!693194))

(assert (= (and b!693194 res!457263) b!693191))

(assert (= (and b!693194 res!457261) b!693193))

(assert (= (and b!693193 c!78333) b!693192))

(assert (= (and b!693193 (not c!78333)) b!693190))

(assert (= (or b!693192 b!693190) bm!34258))

(assert (=> b!693191 m!656089))

(assert (=> b!693191 m!656089))

(declare-fun m!656111 () Bool)

(assert (=> b!693191 m!656111))

(assert (=> bm!34258 m!656089))

(declare-fun m!656113 () Bool)

(assert (=> bm!34258 m!656113))

(assert (=> b!693193 m!656089))

(assert (=> b!693193 m!656089))

(declare-fun m!656115 () Bool)

(assert (=> b!693193 m!656115))

(assert (=> b!693194 m!656089))

(assert (=> b!693194 m!656089))

(assert (=> b!693194 m!656115))

(assert (=> b!692984 d!95857))

(declare-fun d!95861 () Bool)

(declare-fun res!457268 () Bool)

(declare-fun e!394418 () Bool)

(assert (=> d!95861 (=> res!457268 e!394418)))

(assert (=> d!95861 (= res!457268 (= (select (arr!19081 a!3626) from!3004) k0!2843))))

(assert (=> d!95861 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!394418)))

(declare-fun b!693199 () Bool)

(declare-fun e!394419 () Bool)

(assert (=> b!693199 (= e!394418 e!394419)))

(declare-fun res!457269 () Bool)

(assert (=> b!693199 (=> (not res!457269) (not e!394419))))

(assert (=> b!693199 (= res!457269 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19464 a!3626)))))

(declare-fun b!693200 () Bool)

(assert (=> b!693200 (= e!394419 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95861 (not res!457268)) b!693199))

(assert (= (and b!693199 res!457269) b!693200))

(assert (=> d!95861 m!655957))

(declare-fun m!656123 () Bool)

(assert (=> b!693200 m!656123))

(assert (=> b!692973 d!95861))

(declare-fun d!95865 () Bool)

(assert (=> d!95865 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316780 () Unit!24441)

(declare-fun choose!13 (array!39837 (_ BitVec 64) (_ BitVec 32)) Unit!24441)

(assert (=> d!95865 (= lt!316780 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95865 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95865 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316780)))

(declare-fun bs!20294 () Bool)

(assert (= bs!20294 d!95865))

(assert (=> bs!20294 m!655989))

(declare-fun m!656129 () Bool)

(assert (=> bs!20294 m!656129))

(assert (=> b!692973 d!95865))

(declare-fun d!95869 () Bool)

(declare-fun lt!316781 () Bool)

(assert (=> d!95869 (= lt!316781 (select (content!315 lt!316745) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394426 () Bool)

(assert (=> d!95869 (= lt!316781 e!394426)))

(declare-fun res!457276 () Bool)

(assert (=> d!95869 (=> (not res!457276) (not e!394426))))

(assert (=> d!95869 (= res!457276 ((_ is Cons!13025) lt!316745))))

(assert (=> d!95869 (= (contains!3681 lt!316745 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316781)))

(declare-fun b!693207 () Bool)

(declare-fun e!394427 () Bool)

(assert (=> b!693207 (= e!394426 e!394427)))

(declare-fun res!457277 () Bool)

(assert (=> b!693207 (=> res!457277 e!394427)))

(assert (=> b!693207 (= res!457277 (= (h!14073 lt!316745) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693208 () Bool)

(assert (=> b!693208 (= e!394427 (contains!3681 (t!19294 lt!316745) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95869 res!457276) b!693207))

(assert (= (and b!693207 (not res!457277)) b!693208))

(assert (=> d!95869 m!656065))

(declare-fun m!656131 () Bool)

(assert (=> d!95869 m!656131))

(declare-fun m!656133 () Bool)

(assert (=> b!693208 m!656133))

(assert (=> b!692983 d!95869))

(assert (=> b!692971 d!95847))

(check-sat (not b!693150) (not d!95833) (not b!693188) (not b!693156) (not d!95841) (not bm!34257) (not b!693170) (not b!693148) (not d!95853) (not b!693191) (not b!693193) (not b!693179) (not b!693194) (not d!95847) (not b!693200) (not b!693189) (not b!693173) (not d!95865) (not d!95869) (not b!693208) (not b!693181) (not b!693168) (not b!693187) (not bm!34258) (not b!693171) (not b!693155) (not d!95829))
(check-sat)
