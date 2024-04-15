; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61688 () Bool)

(assert start!61688)

(declare-fun res!454604 () Bool)

(declare-fun e!392888 () Bool)

(assert (=> start!61688 (=> (not res!454604) (not e!392888))))

(declare-datatypes ((array!39753 0))(
  ( (array!39754 (arr!19046 (Array (_ BitVec 32) (_ BitVec 64))) (size!19428 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39753)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61688 (= res!454604 (and (bvslt (size!19428 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19428 a!3626))))))

(assert (=> start!61688 e!392888))

(assert (=> start!61688 true))

(declare-fun array_inv!14929 (array!39753) Bool)

(assert (=> start!61688 (array_inv!14929 a!3626)))

(declare-fun b!690030 () Bool)

(declare-fun e!392887 () Bool)

(declare-fun e!392891 () Bool)

(assert (=> b!690030 (= e!392887 e!392891)))

(declare-fun res!454596 () Bool)

(assert (=> b!690030 (=> (not res!454596) (not e!392891))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690030 (= res!454596 (bvsle from!3004 i!1382))))

(declare-fun b!690031 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690031 (= e!392888 (not (arrayContainsKey!0 a!3626 k0!2843 from!3004)))))

(declare-fun b!690032 () Bool)

(declare-fun res!454606 () Bool)

(assert (=> b!690032 (=> (not res!454606) (not e!392888))))

(declare-datatypes ((List!13126 0))(
  ( (Nil!13123) (Cons!13122 (h!14167 (_ BitVec 64)) (t!19384 List!13126)) )
))
(declare-fun acc!681 () List!13126)

(declare-fun contains!3648 (List!13126 (_ BitVec 64)) Bool)

(assert (=> b!690032 (= res!454606 (not (contains!3648 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690033 () Bool)

(declare-fun res!454598 () Bool)

(assert (=> b!690033 (=> (not res!454598) (not e!392888))))

(declare-fun arrayNoDuplicates!0 (array!39753 (_ BitVec 32) List!13126) Bool)

(assert (=> b!690033 (= res!454598 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13123))))

(declare-fun b!690034 () Bool)

(declare-fun res!454601 () Bool)

(assert (=> b!690034 (=> (not res!454601) (not e!392888))))

(assert (=> b!690034 (= res!454601 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19428 a!3626))))))

(declare-fun b!690035 () Bool)

(declare-fun res!454608 () Bool)

(assert (=> b!690035 (=> (not res!454608) (not e!392888))))

(assert (=> b!690035 (= res!454608 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19428 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690036 () Bool)

(declare-fun e!392889 () Bool)

(assert (=> b!690036 (= e!392889 (contains!3648 acc!681 k0!2843))))

(declare-fun b!690037 () Bool)

(declare-fun res!454595 () Bool)

(assert (=> b!690037 (=> (not res!454595) (not e!392888))))

(assert (=> b!690037 (= res!454595 (not (contains!3648 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690038 () Bool)

(declare-fun res!454603 () Bool)

(assert (=> b!690038 (=> (not res!454603) (not e!392888))))

(assert (=> b!690038 (= res!454603 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690039 () Bool)

(assert (=> b!690039 (= e!392891 (not (contains!3648 acc!681 k0!2843)))))

(declare-fun b!690040 () Bool)

(declare-fun res!454597 () Bool)

(assert (=> b!690040 (=> (not res!454597) (not e!392888))))

(assert (=> b!690040 (= res!454597 (= (select (arr!19046 a!3626) from!3004) k0!2843))))

(declare-fun b!690041 () Bool)

(declare-fun res!454599 () Bool)

(assert (=> b!690041 (=> (not res!454599) (not e!392888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690041 (= res!454599 (validKeyInArray!0 (select (arr!19046 a!3626) from!3004)))))

(declare-fun b!690042 () Bool)

(declare-fun res!454602 () Bool)

(assert (=> b!690042 (=> (not res!454602) (not e!392888))))

(declare-fun noDuplicate!917 (List!13126) Bool)

(assert (=> b!690042 (= res!454602 (noDuplicate!917 acc!681))))

(declare-fun b!690043 () Bool)

(declare-fun res!454605 () Bool)

(assert (=> b!690043 (=> (not res!454605) (not e!392888))))

(assert (=> b!690043 (= res!454605 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690044 () Bool)

(declare-fun res!454607 () Bool)

(assert (=> b!690044 (=> (not res!454607) (not e!392888))))

(assert (=> b!690044 (= res!454607 (validKeyInArray!0 k0!2843))))

(declare-fun b!690045 () Bool)

(declare-fun res!454594 () Bool)

(assert (=> b!690045 (=> (not res!454594) (not e!392888))))

(assert (=> b!690045 (= res!454594 e!392887)))

(declare-fun res!454600 () Bool)

(assert (=> b!690045 (=> res!454600 e!392887)))

(assert (=> b!690045 (= res!454600 e!392889)))

(declare-fun res!454609 () Bool)

(assert (=> b!690045 (=> (not res!454609) (not e!392889))))

(assert (=> b!690045 (= res!454609 (bvsgt from!3004 i!1382))))

(assert (= (and start!61688 res!454604) b!690042))

(assert (= (and b!690042 res!454602) b!690037))

(assert (= (and b!690037 res!454595) b!690032))

(assert (= (and b!690032 res!454606) b!690045))

(assert (= (and b!690045 res!454609) b!690036))

(assert (= (and b!690045 (not res!454600)) b!690030))

(assert (= (and b!690030 res!454596) b!690039))

(assert (= (and b!690045 res!454594) b!690033))

(assert (= (and b!690033 res!454598) b!690038))

(assert (= (and b!690038 res!454603) b!690034))

(assert (= (and b!690034 res!454601) b!690044))

(assert (= (and b!690044 res!454607) b!690043))

(assert (= (and b!690043 res!454605) b!690035))

(assert (= (and b!690035 res!454608) b!690041))

(assert (= (and b!690041 res!454599) b!690040))

(assert (= (and b!690040 res!454597) b!690031))

(declare-fun m!653085 () Bool)

(assert (=> b!690040 m!653085))

(declare-fun m!653087 () Bool)

(assert (=> b!690039 m!653087))

(declare-fun m!653089 () Bool)

(assert (=> b!690044 m!653089))

(declare-fun m!653091 () Bool)

(assert (=> b!690032 m!653091))

(declare-fun m!653093 () Bool)

(assert (=> b!690037 m!653093))

(assert (=> b!690036 m!653087))

(declare-fun m!653095 () Bool)

(assert (=> b!690033 m!653095))

(declare-fun m!653097 () Bool)

(assert (=> b!690031 m!653097))

(declare-fun m!653099 () Bool)

(assert (=> b!690042 m!653099))

(declare-fun m!653101 () Bool)

(assert (=> start!61688 m!653101))

(assert (=> b!690041 m!653085))

(assert (=> b!690041 m!653085))

(declare-fun m!653103 () Bool)

(assert (=> b!690041 m!653103))

(declare-fun m!653105 () Bool)

(assert (=> b!690038 m!653105))

(declare-fun m!653107 () Bool)

(assert (=> b!690043 m!653107))

(check-sat (not b!690033) (not b!690043) (not b!690031) (not b!690042) (not b!690039) (not b!690038) (not b!690036) (not b!690041) (not start!61688) (not b!690032) (not b!690037) (not b!690044))
(check-sat)
(get-model)

(declare-fun d!95219 () Bool)

(declare-fun lt!316170 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!305 (List!13126) (InoxSet (_ BitVec 64)))

(assert (=> d!95219 (= lt!316170 (select (content!305 acc!681) k0!2843))))

(declare-fun e!392926 () Bool)

(assert (=> d!95219 (= lt!316170 e!392926)))

(declare-fun res!454710 () Bool)

(assert (=> d!95219 (=> (not res!454710) (not e!392926))))

(get-info :version)

(assert (=> d!95219 (= res!454710 ((_ is Cons!13122) acc!681))))

(assert (=> d!95219 (= (contains!3648 acc!681 k0!2843) lt!316170)))

(declare-fun b!690146 () Bool)

(declare-fun e!392927 () Bool)

(assert (=> b!690146 (= e!392926 e!392927)))

(declare-fun res!454711 () Bool)

(assert (=> b!690146 (=> res!454711 e!392927)))

(assert (=> b!690146 (= res!454711 (= (h!14167 acc!681) k0!2843))))

(declare-fun b!690147 () Bool)

(assert (=> b!690147 (= e!392927 (contains!3648 (t!19384 acc!681) k0!2843))))

(assert (= (and d!95219 res!454710) b!690146))

(assert (= (and b!690146 (not res!454711)) b!690147))

(declare-fun m!653157 () Bool)

(assert (=> d!95219 m!653157))

(declare-fun m!653159 () Bool)

(assert (=> d!95219 m!653159))

(declare-fun m!653161 () Bool)

(assert (=> b!690147 m!653161))

(assert (=> b!690039 d!95219))

(declare-fun d!95221 () Bool)

(assert (=> d!95221 (= (validKeyInArray!0 (select (arr!19046 a!3626) from!3004)) (and (not (= (select (arr!19046 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19046 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690041 d!95221))

(declare-fun d!95223 () Bool)

(assert (=> d!95223 (= (array_inv!14929 a!3626) (bvsge (size!19428 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61688 d!95223))

(declare-fun d!95225 () Bool)

(declare-fun lt!316171 () Bool)

(assert (=> d!95225 (= lt!316171 (select (content!305 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392928 () Bool)

(assert (=> d!95225 (= lt!316171 e!392928)))

(declare-fun res!454712 () Bool)

(assert (=> d!95225 (=> (not res!454712) (not e!392928))))

(assert (=> d!95225 (= res!454712 ((_ is Cons!13122) acc!681))))

(assert (=> d!95225 (= (contains!3648 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316171)))

(declare-fun b!690148 () Bool)

(declare-fun e!392929 () Bool)

(assert (=> b!690148 (= e!392928 e!392929)))

(declare-fun res!454713 () Bool)

(assert (=> b!690148 (=> res!454713 e!392929)))

(assert (=> b!690148 (= res!454713 (= (h!14167 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690149 () Bool)

(assert (=> b!690149 (= e!392929 (contains!3648 (t!19384 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95225 res!454712) b!690148))

(assert (= (and b!690148 (not res!454713)) b!690149))

(assert (=> d!95225 m!653157))

(declare-fun m!653163 () Bool)

(assert (=> d!95225 m!653163))

(declare-fun m!653165 () Bool)

(assert (=> b!690149 m!653165))

(assert (=> b!690037 d!95225))

(assert (=> b!690036 d!95219))

(declare-fun b!690160 () Bool)

(declare-fun e!392940 () Bool)

(declare-fun e!392941 () Bool)

(assert (=> b!690160 (= e!392940 e!392941)))

(declare-fun c!78087 () Bool)

(assert (=> b!690160 (= c!78087 (validKeyInArray!0 (select (arr!19046 a!3626) from!3004)))))

(declare-fun b!690161 () Bool)

(declare-fun call!34189 () Bool)

(assert (=> b!690161 (= e!392941 call!34189)))

(declare-fun bm!34186 () Bool)

(assert (=> bm!34186 (= call!34189 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78087 (Cons!13122 (select (arr!19046 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!95227 () Bool)

(declare-fun res!454722 () Bool)

(declare-fun e!392938 () Bool)

(assert (=> d!95227 (=> res!454722 e!392938)))

(assert (=> d!95227 (= res!454722 (bvsge from!3004 (size!19428 a!3626)))))

(assert (=> d!95227 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!392938)))

(declare-fun b!690162 () Bool)

(assert (=> b!690162 (= e!392941 call!34189)))

(declare-fun b!690163 () Bool)

(assert (=> b!690163 (= e!392938 e!392940)))

(declare-fun res!454720 () Bool)

(assert (=> b!690163 (=> (not res!454720) (not e!392940))))

(declare-fun e!392939 () Bool)

(assert (=> b!690163 (= res!454720 (not e!392939))))

(declare-fun res!454721 () Bool)

(assert (=> b!690163 (=> (not res!454721) (not e!392939))))

(assert (=> b!690163 (= res!454721 (validKeyInArray!0 (select (arr!19046 a!3626) from!3004)))))

(declare-fun b!690164 () Bool)

(assert (=> b!690164 (= e!392939 (contains!3648 acc!681 (select (arr!19046 a!3626) from!3004)))))

(assert (= (and d!95227 (not res!454722)) b!690163))

(assert (= (and b!690163 res!454721) b!690164))

(assert (= (and b!690163 res!454720) b!690160))

(assert (= (and b!690160 c!78087) b!690162))

(assert (= (and b!690160 (not c!78087)) b!690161))

(assert (= (or b!690162 b!690161) bm!34186))

(assert (=> b!690160 m!653085))

(assert (=> b!690160 m!653085))

(assert (=> b!690160 m!653103))

(assert (=> bm!34186 m!653085))

(declare-fun m!653167 () Bool)

(assert (=> bm!34186 m!653167))

(assert (=> b!690163 m!653085))

(assert (=> b!690163 m!653085))

(assert (=> b!690163 m!653103))

(assert (=> b!690164 m!653085))

(assert (=> b!690164 m!653085))

(declare-fun m!653169 () Bool)

(assert (=> b!690164 m!653169))

(assert (=> b!690038 d!95227))

(declare-fun d!95233 () Bool)

(assert (=> d!95233 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!690044 d!95233))

(declare-fun d!95235 () Bool)

(declare-fun res!454739 () Bool)

(declare-fun e!392960 () Bool)

(assert (=> d!95235 (=> res!454739 e!392960)))

(assert (=> d!95235 (= res!454739 ((_ is Nil!13123) acc!681))))

(assert (=> d!95235 (= (noDuplicate!917 acc!681) e!392960)))

(declare-fun b!690185 () Bool)

(declare-fun e!392961 () Bool)

(assert (=> b!690185 (= e!392960 e!392961)))

(declare-fun res!454740 () Bool)

(assert (=> b!690185 (=> (not res!454740) (not e!392961))))

(assert (=> b!690185 (= res!454740 (not (contains!3648 (t!19384 acc!681) (h!14167 acc!681))))))

(declare-fun b!690186 () Bool)

(assert (=> b!690186 (= e!392961 (noDuplicate!917 (t!19384 acc!681)))))

(assert (= (and d!95235 (not res!454739)) b!690185))

(assert (= (and b!690185 res!454740) b!690186))

(declare-fun m!653173 () Bool)

(assert (=> b!690185 m!653173))

(declare-fun m!653175 () Bool)

(assert (=> b!690186 m!653175))

(assert (=> b!690042 d!95235))

(declare-fun d!95239 () Bool)

(declare-fun res!454748 () Bool)

(declare-fun e!392970 () Bool)

(assert (=> d!95239 (=> res!454748 e!392970)))

(assert (=> d!95239 (= res!454748 (= (select (arr!19046 a!3626) from!3004) k0!2843))))

(assert (=> d!95239 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!392970)))

(declare-fun b!690196 () Bool)

(declare-fun e!392971 () Bool)

(assert (=> b!690196 (= e!392970 e!392971)))

(declare-fun res!454749 () Bool)

(assert (=> b!690196 (=> (not res!454749) (not e!392971))))

(assert (=> b!690196 (= res!454749 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19428 a!3626)))))

(declare-fun b!690197 () Bool)

(assert (=> b!690197 (= e!392971 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95239 (not res!454748)) b!690196))

(assert (= (and b!690196 res!454749) b!690197))

(assert (=> d!95239 m!653085))

(declare-fun m!653185 () Bool)

(assert (=> b!690197 m!653185))

(assert (=> b!690031 d!95239))

(declare-fun b!690198 () Bool)

(declare-fun e!392974 () Bool)

(declare-fun e!392975 () Bool)

(assert (=> b!690198 (= e!392974 e!392975)))

(declare-fun c!78091 () Bool)

(assert (=> b!690198 (= c!78091 (validKeyInArray!0 (select (arr!19046 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690199 () Bool)

(declare-fun call!34193 () Bool)

(assert (=> b!690199 (= e!392975 call!34193)))

(declare-fun bm!34190 () Bool)

(assert (=> bm!34190 (= call!34193 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78091 (Cons!13122 (select (arr!19046 a!3626) #b00000000000000000000000000000000) Nil!13123) Nil!13123)))))

(declare-fun d!95247 () Bool)

(declare-fun res!454752 () Bool)

(declare-fun e!392972 () Bool)

(assert (=> d!95247 (=> res!454752 e!392972)))

(assert (=> d!95247 (= res!454752 (bvsge #b00000000000000000000000000000000 (size!19428 a!3626)))))

(assert (=> d!95247 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13123) e!392972)))

(declare-fun b!690200 () Bool)

(assert (=> b!690200 (= e!392975 call!34193)))

(declare-fun b!690201 () Bool)

(assert (=> b!690201 (= e!392972 e!392974)))

(declare-fun res!454750 () Bool)

(assert (=> b!690201 (=> (not res!454750) (not e!392974))))

(declare-fun e!392973 () Bool)

(assert (=> b!690201 (= res!454750 (not e!392973))))

(declare-fun res!454751 () Bool)

(assert (=> b!690201 (=> (not res!454751) (not e!392973))))

(assert (=> b!690201 (= res!454751 (validKeyInArray!0 (select (arr!19046 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690202 () Bool)

(assert (=> b!690202 (= e!392973 (contains!3648 Nil!13123 (select (arr!19046 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95247 (not res!454752)) b!690201))

(assert (= (and b!690201 res!454751) b!690202))

(assert (= (and b!690201 res!454750) b!690198))

(assert (= (and b!690198 c!78091) b!690200))

(assert (= (and b!690198 (not c!78091)) b!690199))

(assert (= (or b!690200 b!690199) bm!34190))

(declare-fun m!653187 () Bool)

(assert (=> b!690198 m!653187))

(assert (=> b!690198 m!653187))

(declare-fun m!653189 () Bool)

(assert (=> b!690198 m!653189))

(assert (=> bm!34190 m!653187))

(declare-fun m!653191 () Bool)

(assert (=> bm!34190 m!653191))

(assert (=> b!690201 m!653187))

(assert (=> b!690201 m!653187))

(assert (=> b!690201 m!653189))

(assert (=> b!690202 m!653187))

(assert (=> b!690202 m!653187))

(declare-fun m!653193 () Bool)

(assert (=> b!690202 m!653193))

(assert (=> b!690033 d!95247))

(declare-fun d!95249 () Bool)

(declare-fun res!454757 () Bool)

(declare-fun e!392980 () Bool)

(assert (=> d!95249 (=> res!454757 e!392980)))

(assert (=> d!95249 (= res!454757 (= (select (arr!19046 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95249 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!392980)))

(declare-fun b!690207 () Bool)

(declare-fun e!392981 () Bool)

(assert (=> b!690207 (= e!392980 e!392981)))

(declare-fun res!454758 () Bool)

(assert (=> b!690207 (=> (not res!454758) (not e!392981))))

(assert (=> b!690207 (= res!454758 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19428 a!3626)))))

(declare-fun b!690208 () Bool)

(assert (=> b!690208 (= e!392981 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95249 (not res!454757)) b!690207))

(assert (= (and b!690207 res!454758) b!690208))

(assert (=> d!95249 m!653187))

(declare-fun m!653195 () Bool)

(assert (=> b!690208 m!653195))

(assert (=> b!690043 d!95249))

(declare-fun d!95251 () Bool)

(declare-fun lt!316174 () Bool)

(assert (=> d!95251 (= lt!316174 (select (content!305 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392982 () Bool)

(assert (=> d!95251 (= lt!316174 e!392982)))

(declare-fun res!454759 () Bool)

(assert (=> d!95251 (=> (not res!454759) (not e!392982))))

(assert (=> d!95251 (= res!454759 ((_ is Cons!13122) acc!681))))

(assert (=> d!95251 (= (contains!3648 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316174)))

(declare-fun b!690209 () Bool)

(declare-fun e!392983 () Bool)

(assert (=> b!690209 (= e!392982 e!392983)))

(declare-fun res!454760 () Bool)

(assert (=> b!690209 (=> res!454760 e!392983)))

(assert (=> b!690209 (= res!454760 (= (h!14167 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690210 () Bool)

(assert (=> b!690210 (= e!392983 (contains!3648 (t!19384 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95251 res!454759) b!690209))

(assert (= (and b!690209 (not res!454760)) b!690210))

(assert (=> d!95251 m!653157))

(declare-fun m!653197 () Bool)

(assert (=> d!95251 m!653197))

(declare-fun m!653199 () Bool)

(assert (=> b!690210 m!653199))

(assert (=> b!690032 d!95251))

(check-sat (not d!95251) (not b!690149) (not d!95225) (not b!690147) (not b!690164) (not b!690186) (not b!690198) (not b!690163) (not d!95219) (not bm!34186) (not b!690160) (not b!690210) (not b!690185) (not bm!34190) (not b!690202) (not b!690197) (not b!690201) (not b!690208))
(check-sat)
