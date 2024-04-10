; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61914 () Bool)

(assert start!61914)

(declare-fun b!692894 () Bool)

(declare-fun res!457092 () Bool)

(declare-fun e!394222 () Bool)

(assert (=> b!692894 (=> (not res!457092) (not e!394222))))

(declare-datatypes ((List!13129 0))(
  ( (Nil!13126) (Cons!13125 (h!14170 (_ BitVec 64)) (t!19402 List!13129)) )
))
(declare-fun acc!681 () List!13129)

(declare-fun contains!3706 (List!13129 (_ BitVec 64)) Bool)

(assert (=> b!692894 (= res!457092 (not (contains!3706 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692895 () Bool)

(declare-fun res!457095 () Bool)

(assert (=> b!692895 (=> (not res!457095) (not e!394222))))

(declare-datatypes ((array!39845 0))(
  ( (array!39846 (arr!19088 (Array (_ BitVec 32) (_ BitVec 64))) (size!19473 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39845)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39845 (_ BitVec 32) List!13129) Bool)

(assert (=> b!692895 (= res!457095 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692896 () Bool)

(declare-fun e!394216 () Bool)

(declare-fun e!394215 () Bool)

(assert (=> b!692896 (= e!394216 e!394215)))

(declare-fun res!457093 () Bool)

(assert (=> b!692896 (=> res!457093 e!394215)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692896 (= res!457093 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692897 () Bool)

(declare-datatypes ((Unit!24470 0))(
  ( (Unit!24471) )
))
(declare-fun e!394219 () Unit!24470)

(declare-fun Unit!24472 () Unit!24470)

(assert (=> b!692897 (= e!394219 Unit!24472)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692897 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316662 () Unit!24470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39845 (_ BitVec 64) (_ BitVec 32)) Unit!24470)

(assert (=> b!692897 (= lt!316662 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!692897 false))

(declare-fun b!692898 () Bool)

(declare-fun res!457100 () Bool)

(assert (=> b!692898 (=> (not res!457100) (not e!394222))))

(assert (=> b!692898 (= res!457100 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13126))))

(declare-fun b!692899 () Bool)

(declare-fun res!457091 () Bool)

(assert (=> b!692899 (=> (not res!457091) (not e!394222))))

(assert (=> b!692899 (= res!457091 (not (contains!3706 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692900 () Bool)

(declare-fun res!457104 () Bool)

(assert (=> b!692900 (=> (not res!457104) (not e!394222))))

(assert (=> b!692900 (= res!457104 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19473 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692901 () Bool)

(declare-fun res!457097 () Bool)

(assert (=> b!692901 (=> (not res!457097) (not e!394216))))

(declare-fun lt!316663 () List!13129)

(assert (=> b!692901 (= res!457097 (not (contains!3706 lt!316663 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692902 () Bool)

(declare-fun res!457096 () Bool)

(assert (=> b!692902 (=> (not res!457096) (not e!394222))))

(declare-fun e!394223 () Bool)

(assert (=> b!692902 (= res!457096 e!394223)))

(declare-fun res!457099 () Bool)

(assert (=> b!692902 (=> res!457099 e!394223)))

(declare-fun e!394221 () Bool)

(assert (=> b!692902 (= res!457099 e!394221)))

(declare-fun res!457103 () Bool)

(assert (=> b!692902 (=> (not res!457103) (not e!394221))))

(assert (=> b!692902 (= res!457103 (bvsgt from!3004 i!1382))))

(declare-fun b!692903 () Bool)

(declare-fun Unit!24473 () Unit!24470)

(assert (=> b!692903 (= e!394219 Unit!24473)))

(declare-fun b!692904 () Bool)

(declare-fun res!457089 () Bool)

(assert (=> b!692904 (=> (not res!457089) (not e!394222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692904 (= res!457089 (validKeyInArray!0 (select (arr!19088 a!3626) from!3004)))))

(declare-fun b!692905 () Bool)

(declare-fun res!457098 () Bool)

(assert (=> b!692905 (=> (not res!457098) (not e!394216))))

(declare-fun e!394224 () Bool)

(assert (=> b!692905 (= res!457098 e!394224)))

(declare-fun res!457090 () Bool)

(assert (=> b!692905 (=> res!457090 e!394224)))

(assert (=> b!692905 (= res!457090 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692906 () Bool)

(declare-fun res!457084 () Bool)

(assert (=> b!692906 (=> (not res!457084) (not e!394216))))

(assert (=> b!692906 (= res!457084 (not (contains!3706 lt!316663 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692907 () Bool)

(declare-fun res!457101 () Bool)

(assert (=> b!692907 (=> (not res!457101) (not e!394216))))

(declare-fun noDuplicate!953 (List!13129) Bool)

(assert (=> b!692907 (= res!457101 (noDuplicate!953 lt!316663))))

(declare-fun b!692908 () Bool)

(declare-fun e!394218 () Bool)

(assert (=> b!692908 (= e!394218 (not (contains!3706 acc!681 k!2843)))))

(declare-fun b!692909 () Bool)

(declare-fun res!457105 () Bool)

(assert (=> b!692909 (=> (not res!457105) (not e!394222))))

(assert (=> b!692909 (= res!457105 (noDuplicate!953 acc!681))))

(declare-fun b!692910 () Bool)

(declare-fun e!394217 () Bool)

(assert (=> b!692910 (= e!394217 e!394216)))

(declare-fun res!457087 () Bool)

(assert (=> b!692910 (=> (not res!457087) (not e!394216))))

(assert (=> b!692910 (= res!457087 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!418 (List!13129 (_ BitVec 64)) List!13129)

(assert (=> b!692910 (= lt!316663 ($colon$colon!418 acc!681 (select (arr!19088 a!3626) from!3004)))))

(declare-fun b!692911 () Bool)

(declare-fun res!457086 () Bool)

(assert (=> b!692911 (=> (not res!457086) (not e!394222))))

(assert (=> b!692911 (= res!457086 (validKeyInArray!0 k!2843))))

(declare-fun b!692912 () Bool)

(declare-fun res!457085 () Bool)

(assert (=> b!692912 (=> (not res!457085) (not e!394222))))

(assert (=> b!692912 (= res!457085 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!457088 () Bool)

(assert (=> start!61914 (=> (not res!457088) (not e!394222))))

(assert (=> start!61914 (= res!457088 (and (bvslt (size!19473 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19473 a!3626))))))

(assert (=> start!61914 e!394222))

(assert (=> start!61914 true))

(declare-fun array_inv!14884 (array!39845) Bool)

(assert (=> start!61914 (array_inv!14884 a!3626)))

(declare-fun b!692913 () Bool)

(assert (=> b!692913 (= e!394223 e!394218)))

(declare-fun res!457094 () Bool)

(assert (=> b!692913 (=> (not res!457094) (not e!394218))))

(assert (=> b!692913 (= res!457094 (bvsle from!3004 i!1382))))

(declare-fun b!692914 () Bool)

(assert (=> b!692914 (= e!394224 (not (contains!3706 lt!316663 k!2843)))))

(declare-fun b!692915 () Bool)

(declare-fun res!457102 () Bool)

(assert (=> b!692915 (=> (not res!457102) (not e!394222))))

(assert (=> b!692915 (= res!457102 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19473 a!3626))))))

(declare-fun b!692916 () Bool)

(assert (=> b!692916 (= e!394221 (contains!3706 acc!681 k!2843))))

(declare-fun b!692917 () Bool)

(assert (=> b!692917 (= e!394222 e!394217)))

(declare-fun res!457106 () Bool)

(assert (=> b!692917 (=> (not res!457106) (not e!394217))))

(assert (=> b!692917 (= res!457106 (not (= (select (arr!19088 a!3626) from!3004) k!2843)))))

(declare-fun lt!316661 () Unit!24470)

(assert (=> b!692917 (= lt!316661 e!394219)))

(declare-fun c!78272 () Bool)

(assert (=> b!692917 (= c!78272 (= (select (arr!19088 a!3626) from!3004) k!2843))))

(declare-fun b!692918 () Bool)

(assert (=> b!692918 (= e!394215 (contains!3706 lt!316663 k!2843))))

(assert (= (and start!61914 res!457088) b!692909))

(assert (= (and b!692909 res!457105) b!692894))

(assert (= (and b!692894 res!457092) b!692899))

(assert (= (and b!692899 res!457091) b!692902))

(assert (= (and b!692902 res!457103) b!692916))

(assert (= (and b!692902 (not res!457099)) b!692913))

(assert (= (and b!692913 res!457094) b!692908))

(assert (= (and b!692902 res!457096) b!692898))

(assert (= (and b!692898 res!457100) b!692895))

(assert (= (and b!692895 res!457095) b!692915))

(assert (= (and b!692915 res!457102) b!692911))

(assert (= (and b!692911 res!457086) b!692912))

(assert (= (and b!692912 res!457085) b!692900))

(assert (= (and b!692900 res!457104) b!692904))

(assert (= (and b!692904 res!457089) b!692917))

(assert (= (and b!692917 c!78272) b!692897))

(assert (= (and b!692917 (not c!78272)) b!692903))

(assert (= (and b!692917 res!457106) b!692910))

(assert (= (and b!692910 res!457087) b!692907))

(assert (= (and b!692907 res!457101) b!692906))

(assert (= (and b!692906 res!457084) b!692901))

(assert (= (and b!692901 res!457097) b!692905))

(assert (= (and b!692905 (not res!457090)) b!692914))

(assert (= (and b!692905 res!457098) b!692896))

(assert (= (and b!692896 (not res!457093)) b!692918))

(declare-fun m!655331 () Bool)

(assert (=> b!692897 m!655331))

(declare-fun m!655333 () Bool)

(assert (=> b!692897 m!655333))

(declare-fun m!655335 () Bool)

(assert (=> b!692916 m!655335))

(declare-fun m!655337 () Bool)

(assert (=> b!692918 m!655337))

(declare-fun m!655339 () Bool)

(assert (=> b!692906 m!655339))

(declare-fun m!655341 () Bool)

(assert (=> b!692901 m!655341))

(declare-fun m!655343 () Bool)

(assert (=> b!692909 m!655343))

(declare-fun m!655345 () Bool)

(assert (=> b!692904 m!655345))

(assert (=> b!692904 m!655345))

(declare-fun m!655347 () Bool)

(assert (=> b!692904 m!655347))

(declare-fun m!655349 () Bool)

(assert (=> b!692895 m!655349))

(assert (=> b!692914 m!655337))

(declare-fun m!655351 () Bool)

(assert (=> b!692899 m!655351))

(declare-fun m!655353 () Bool)

(assert (=> b!692907 m!655353))

(declare-fun m!655355 () Bool)

(assert (=> start!61914 m!655355))

(declare-fun m!655357 () Bool)

(assert (=> b!692911 m!655357))

(declare-fun m!655359 () Bool)

(assert (=> b!692912 m!655359))

(assert (=> b!692910 m!655345))

(assert (=> b!692910 m!655345))

(declare-fun m!655361 () Bool)

(assert (=> b!692910 m!655361))

(assert (=> b!692908 m!655335))

(declare-fun m!655363 () Bool)

(assert (=> b!692898 m!655363))

(assert (=> b!692917 m!655345))

(declare-fun m!655365 () Bool)

(assert (=> b!692894 m!655365))

(push 1)

(assert (not b!692912))

(assert (not b!692909))

(assert (not b!692906))

(assert (not b!692901))

(assert (not b!692898))

(assert (not start!61914))

(assert (not b!692908))

(assert (not b!692904))

(assert (not b!692897))

(assert (not b!692907))

(assert (not b!692899))

(assert (not b!692918))

(assert (not b!692914))

(assert (not b!692911))

(assert (not b!692916))

(assert (not b!692895))

(assert (not b!692894))

(assert (not b!692910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!692987 () Bool)

(declare-fun e!394287 () Bool)

(assert (=> b!692987 (= e!394287 (contains!3706 Nil!13126 (select (arr!19088 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692988 () Bool)

(declare-fun e!394288 () Bool)

(declare-fun e!394289 () Bool)

(assert (=> b!692988 (= e!394288 e!394289)))

(declare-fun c!78279 () Bool)

(assert (=> b!692988 (= c!78279 (validKeyInArray!0 (select (arr!19088 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692989 () Bool)

(declare-fun e!394290 () Bool)

(assert (=> b!692989 (= e!394290 e!394288)))

(declare-fun res!457164 () Bool)

(assert (=> b!692989 (=> (not res!457164) (not e!394288))))

(assert (=> b!692989 (= res!457164 (not e!394287))))

(declare-fun res!457163 () Bool)

(assert (=> b!692989 (=> (not res!457163) (not e!394287))))

(assert (=> b!692989 (= res!457163 (validKeyInArray!0 (select (arr!19088 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95729 () Bool)

(declare-fun res!457165 () Bool)

(assert (=> d!95729 (=> res!457165 e!394290)))

(assert (=> d!95729 (= res!457165 (bvsge #b00000000000000000000000000000000 (size!19473 a!3626)))))

(assert (=> d!95729 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13126) e!394290)))

(declare-fun b!692990 () Bool)

(declare-fun call!34257 () Bool)

(assert (=> b!692990 (= e!394289 call!34257)))

(declare-fun b!692991 () Bool)

(assert (=> b!692991 (= e!394289 call!34257)))

(declare-fun bm!34254 () Bool)

(assert (=> bm!34254 (= call!34257 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78279 (Cons!13125 (select (arr!19088 a!3626) #b00000000000000000000000000000000) Nil!13126) Nil!13126)))))

(assert (= (and d!95729 (not res!457165)) b!692989))

(assert (= (and b!692989 res!457163) b!692987))

(assert (= (and b!692989 res!457164) b!692988))

(assert (= (and b!692988 c!78279) b!692991))

(assert (= (and b!692988 (not c!78279)) b!692990))

(assert (= (or b!692991 b!692990) bm!34254))

(declare-fun m!655427 () Bool)

(assert (=> b!692987 m!655427))

(assert (=> b!692987 m!655427))

(declare-fun m!655429 () Bool)

(assert (=> b!692987 m!655429))

(assert (=> b!692988 m!655427))

(assert (=> b!692988 m!655427))

(declare-fun m!655431 () Bool)

(assert (=> b!692988 m!655431))

(assert (=> b!692989 m!655427))

(assert (=> b!692989 m!655427))

(assert (=> b!692989 m!655431))

(assert (=> bm!34254 m!655427))

(declare-fun m!655433 () Bool)

(assert (=> bm!34254 m!655433))

(assert (=> b!692898 d!95729))

(declare-fun d!95747 () Bool)

(declare-fun lt!316683 () Bool)

(declare-fun content!317 (List!13129) (Set (_ BitVec 64)))

(assert (=> d!95747 (= lt!316683 (member k!2843 (content!317 acc!681)))))

(declare-fun e!394301 () Bool)

(assert (=> d!95747 (= lt!316683 e!394301)))

(declare-fun res!457176 () Bool)

(assert (=> d!95747 (=> (not res!457176) (not e!394301))))

(assert (=> d!95747 (= res!457176 (is-Cons!13125 acc!681))))

(assert (=> d!95747 (= (contains!3706 acc!681 k!2843) lt!316683)))

(declare-fun b!693002 () Bool)

(declare-fun e!394302 () Bool)

(assert (=> b!693002 (= e!394301 e!394302)))

(declare-fun res!457177 () Bool)

(assert (=> b!693002 (=> res!457177 e!394302)))

(assert (=> b!693002 (= res!457177 (= (h!14170 acc!681) k!2843))))

(declare-fun b!693003 () Bool)

(assert (=> b!693003 (= e!394302 (contains!3706 (t!19402 acc!681) k!2843))))

(assert (= (and d!95747 res!457176) b!693002))

(assert (= (and b!693002 (not res!457177)) b!693003))

(declare-fun m!655439 () Bool)

(assert (=> d!95747 m!655439))

(declare-fun m!655441 () Bool)

(assert (=> d!95747 m!655441))

(declare-fun m!655443 () Bool)

(assert (=> b!693003 m!655443))

(assert (=> b!692908 d!95747))

(declare-fun d!95753 () Bool)

(declare-fun res!457188 () Bool)

(declare-fun e!394313 () Bool)

(assert (=> d!95753 (=> res!457188 e!394313)))

(assert (=> d!95753 (= res!457188 (= (select (arr!19088 a!3626) from!3004) k!2843))))

(assert (=> d!95753 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!394313)))

(declare-fun b!693014 () Bool)

(declare-fun e!394314 () Bool)

(assert (=> b!693014 (= e!394313 e!394314)))

(declare-fun res!457189 () Bool)

(assert (=> b!693014 (=> (not res!457189) (not e!394314))))

(assert (=> b!693014 (= res!457189 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19473 a!3626)))))

(declare-fun b!693015 () Bool)

(assert (=> b!693015 (= e!394314 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95753 (not res!457188)) b!693014))

(assert (= (and b!693014 res!457189) b!693015))

(assert (=> d!95753 m!655345))

(declare-fun m!655451 () Bool)

(assert (=> b!693015 m!655451))

(assert (=> b!692897 d!95753))

(declare-fun d!95757 () Bool)

(assert (=> d!95757 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316689 () Unit!24470)

(declare-fun choose!13 (array!39845 (_ BitVec 64) (_ BitVec 32)) Unit!24470)

(assert (=> d!95757 (= lt!316689 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95757 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95757 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!316689)))

(declare-fun bs!20277 () Bool)

(assert (= bs!20277 d!95757))

(assert (=> bs!20277 m!655359))

(declare-fun m!655469 () Bool)

(assert (=> bs!20277 m!655469))

(assert (=> b!692897 d!95757))

(declare-fun d!95769 () Bool)

(declare-fun lt!316691 () Bool)

(assert (=> d!95769 (= lt!316691 (member k!2843 (content!317 lt!316663)))))

(declare-fun e!394325 () Bool)

(assert (=> d!95769 (= lt!316691 e!394325)))

(declare-fun res!457200 () Bool)

(assert (=> d!95769 (=> (not res!457200) (not e!394325))))

(assert (=> d!95769 (= res!457200 (is-Cons!13125 lt!316663))))

(assert (=> d!95769 (= (contains!3706 lt!316663 k!2843) lt!316691)))

(declare-fun b!693026 () Bool)

(declare-fun e!394326 () Bool)

(assert (=> b!693026 (= e!394325 e!394326)))

(declare-fun res!457201 () Bool)

(assert (=> b!693026 (=> res!457201 e!394326)))

(assert (=> b!693026 (= res!457201 (= (h!14170 lt!316663) k!2843))))

(declare-fun b!693027 () Bool)

(assert (=> b!693027 (= e!394326 (contains!3706 (t!19402 lt!316663) k!2843))))

(assert (= (and d!95769 res!457200) b!693026))

(assert (= (and b!693026 (not res!457201)) b!693027))

(declare-fun m!655475 () Bool)

(assert (=> d!95769 m!655475))

(declare-fun m!655477 () Bool)

(assert (=> d!95769 m!655477))

(declare-fun m!655479 () Bool)

(assert (=> b!693027 m!655479))

(assert (=> b!692918 d!95769))

(declare-fun d!95773 () Bool)

(declare-fun res!457206 () Bool)

(declare-fun e!394331 () Bool)

(assert (=> d!95773 (=> res!457206 e!394331)))

(assert (=> d!95773 (= res!457206 (is-Nil!13126 lt!316663))))

(assert (=> d!95773 (= (noDuplicate!953 lt!316663) e!394331)))

(declare-fun b!693032 () Bool)

(declare-fun e!394332 () Bool)

(assert (=> b!693032 (= e!394331 e!394332)))

(declare-fun res!457207 () Bool)

(assert (=> b!693032 (=> (not res!457207) (not e!394332))))

(assert (=> b!693032 (= res!457207 (not (contains!3706 (t!19402 lt!316663) (h!14170 lt!316663))))))

(declare-fun b!693033 () Bool)

(assert (=> b!693033 (= e!394332 (noDuplicate!953 (t!19402 lt!316663)))))

(assert (= (and d!95773 (not res!457206)) b!693032))

(assert (= (and b!693032 res!457207) b!693033))

(declare-fun m!655481 () Bool)

(assert (=> b!693032 m!655481))

(declare-fun m!655483 () Bool)

(assert (=> b!693033 m!655483))

(assert (=> b!692907 d!95773))

(declare-fun d!95777 () Bool)

(declare-fun lt!316692 () Bool)

(assert (=> d!95777 (= lt!316692 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!317 lt!316663)))))

(declare-fun e!394333 () Bool)

(assert (=> d!95777 (= lt!316692 e!394333)))

(declare-fun res!457208 () Bool)

(assert (=> d!95777 (=> (not res!457208) (not e!394333))))

(assert (=> d!95777 (= res!457208 (is-Cons!13125 lt!316663))))

(assert (=> d!95777 (= (contains!3706 lt!316663 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316692)))

(declare-fun b!693034 () Bool)

(declare-fun e!394334 () Bool)

(assert (=> b!693034 (= e!394333 e!394334)))

(declare-fun res!457209 () Bool)

(assert (=> b!693034 (=> res!457209 e!394334)))

(assert (=> b!693034 (= res!457209 (= (h!14170 lt!316663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693035 () Bool)

(assert (=> b!693035 (= e!394334 (contains!3706 (t!19402 lt!316663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95777 res!457208) b!693034))

(assert (= (and b!693034 (not res!457209)) b!693035))

(assert (=> d!95777 m!655475))

(declare-fun m!655485 () Bool)

(assert (=> d!95777 m!655485))

(declare-fun m!655487 () Bool)

(assert (=> b!693035 m!655487))

(assert (=> b!692906 d!95777))

(declare-fun e!394335 () Bool)

(declare-fun b!693036 () Bool)

(assert (=> b!693036 (= e!394335 (contains!3706 acc!681 (select (arr!19088 a!3626) from!3004)))))

(declare-fun b!693037 () Bool)

(declare-fun e!394336 () Bool)

(declare-fun e!394337 () Bool)

(assert (=> b!693037 (= e!394336 e!394337)))

(declare-fun c!78280 () Bool)

(assert (=> b!693037 (= c!78280 (validKeyInArray!0 (select (arr!19088 a!3626) from!3004)))))

(declare-fun b!693038 () Bool)

(declare-fun e!394338 () Bool)

(assert (=> b!693038 (= e!394338 e!394336)))

(declare-fun res!457211 () Bool)

(assert (=> b!693038 (=> (not res!457211) (not e!394336))))

(assert (=> b!693038 (= res!457211 (not e!394335))))

(declare-fun res!457210 () Bool)

(assert (=> b!693038 (=> (not res!457210) (not e!394335))))

(assert (=> b!693038 (= res!457210 (validKeyInArray!0 (select (arr!19088 a!3626) from!3004)))))

(declare-fun d!95779 () Bool)

(declare-fun res!457212 () Bool)

(assert (=> d!95779 (=> res!457212 e!394338)))

(assert (=> d!95779 (= res!457212 (bvsge from!3004 (size!19473 a!3626)))))

(assert (=> d!95779 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394338)))

(declare-fun b!693039 () Bool)

(declare-fun call!34258 () Bool)

(assert (=> b!693039 (= e!394337 call!34258)))

(declare-fun b!693040 () Bool)

(assert (=> b!693040 (= e!394337 call!34258)))

(declare-fun bm!34255 () Bool)

(assert (=> bm!34255 (= call!34258 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78280 (Cons!13125 (select (arr!19088 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!95779 (not res!457212)) b!693038))

(assert (= (and b!693038 res!457210) b!693036))

(assert (= (and b!693038 res!457211) b!693037))

(assert (= (and b!693037 c!78280) b!693040))

(assert (= (and b!693037 (not c!78280)) b!693039))

(assert (= (or b!693040 b!693039) bm!34255))

(assert (=> b!693036 m!655345))

(assert (=> b!693036 m!655345))

(declare-fun m!655489 () Bool)

(assert (=> b!693036 m!655489))

(assert (=> b!693037 m!655345))

(assert (=> b!693037 m!655345))

(assert (=> b!693037 m!655347))

(assert (=> b!693038 m!655345))

(assert (=> b!693038 m!655345))

(assert (=> b!693038 m!655347))

(assert (=> bm!34255 m!655345))

(declare-fun m!655491 () Bool)

(assert (=> bm!34255 m!655491))

(assert (=> b!692895 d!95779))

(assert (=> b!692916 d!95747))

(declare-fun d!95781 () Bool)

(declare-fun lt!316693 () Bool)

(assert (=> d!95781 (= lt!316693 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!317 acc!681)))))

(declare-fun e!394341 () Bool)

(assert (=> d!95781 (= lt!316693 e!394341)))

(declare-fun res!457215 () Bool)

(assert (=> d!95781 (=> (not res!457215) (not e!394341))))

(assert (=> d!95781 (= res!457215 (is-Cons!13125 acc!681))))

(assert (=> d!95781 (= (contains!3706 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316693)))

(declare-fun b!693043 () Bool)

(declare-fun e!394342 () Bool)

(assert (=> b!693043 (= e!394341 e!394342)))

(declare-fun res!457216 () Bool)

(assert (=> b!693043 (=> res!457216 e!394342)))

(assert (=> b!693043 (= res!457216 (= (h!14170 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693044 () Bool)

(assert (=> b!693044 (= e!394342 (contains!3706 (t!19402 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95781 res!457215) b!693043))

(assert (= (and b!693043 (not res!457216)) b!693044))

(assert (=> d!95781 m!655439))

(declare-fun m!655493 () Bool)

(assert (=> d!95781 m!655493))

(declare-fun m!655495 () Bool)

(assert (=> b!693044 m!655495))

(assert (=> b!692894 d!95781))

(declare-fun d!95783 () Bool)

(assert (=> d!95783 (= (validKeyInArray!0 (select (arr!19088 a!3626) from!3004)) (and (not (= (select (arr!19088 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19088 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692904 d!95783))

(assert (=> b!692914 d!95769))

(declare-fun d!95785 () Bool)

(assert (=> d!95785 (= (array_inv!14884 a!3626) (bvsge (size!19473 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61914 d!95785))

(declare-fun d!95787 () Bool)

(declare-fun res!457221 () Bool)

(declare-fun e!394349 () Bool)

(assert (=> d!95787 (=> res!457221 e!394349)))

(assert (=> d!95787 (= res!457221 (= (select (arr!19088 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95787 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!394349)))

(declare-fun b!693053 () Bool)

(declare-fun e!394350 () Bool)

(assert (=> b!693053 (= e!394349 e!394350)))

(declare-fun res!457222 () Bool)

(assert (=> b!693053 (=> (not res!457222) (not e!394350))))

(assert (=> b!693053 (= res!457222 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19473 a!3626)))))

(declare-fun b!693054 () Bool)

(assert (=> b!693054 (= e!394350 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95787 (not res!457221)) b!693053))

(assert (= (and b!693053 res!457222) b!693054))

(assert (=> d!95787 m!655427))

(declare-fun m!655497 () Bool)

(assert (=> b!693054 m!655497))

(assert (=> b!692912 d!95787))

(declare-fun d!95789 () Bool)

(declare-fun lt!316694 () Bool)

(assert (=> d!95789 (= lt!316694 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!317 lt!316663)))))

(declare-fun e!394351 () Bool)

(assert (=> d!95789 (= lt!316694 e!394351)))

(declare-fun res!457223 () Bool)

(assert (=> d!95789 (=> (not res!457223) (not e!394351))))

(assert (=> d!95789 (= res!457223 (is-Cons!13125 lt!316663))))

(assert (=> d!95789 (= (contains!3706 lt!316663 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316694)))

(declare-fun b!693055 () Bool)

(declare-fun e!394352 () Bool)

(assert (=> b!693055 (= e!394351 e!394352)))

(declare-fun res!457224 () Bool)

(assert (=> b!693055 (=> res!457224 e!394352)))

(assert (=> b!693055 (= res!457224 (= (h!14170 lt!316663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693056 () Bool)

(assert (=> b!693056 (= e!394352 (contains!3706 (t!19402 lt!316663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95789 res!457223) b!693055))

(assert (= (and b!693055 (not res!457224)) b!693056))

(assert (=> d!95789 m!655475))

(declare-fun m!655499 () Bool)

(assert (=> d!95789 m!655499))

(declare-fun m!655501 () Bool)

(assert (=> b!693056 m!655501))

(assert (=> b!692901 d!95789))

(declare-fun d!95791 () Bool)

(assert (=> d!95791 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692911 d!95791))

(declare-fun d!95793 () Bool)

(assert (=> d!95793 (= ($colon$colon!418 acc!681 (select (arr!19088 a!3626) from!3004)) (Cons!13125 (select (arr!19088 a!3626) from!3004) acc!681))))

(assert (=> b!692910 d!95793))

(declare-fun d!95795 () Bool)

(declare-fun lt!316695 () Bool)

(assert (=> d!95795 (= lt!316695 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!317 acc!681)))))

(declare-fun e!394357 () Bool)

(assert (=> d!95795 (= lt!316695 e!394357)))

(declare-fun res!457228 () Bool)

(assert (=> d!95795 (=> (not res!457228) (not e!394357))))

(assert (=> d!95795 (= res!457228 (is-Cons!13125 acc!681))))

(assert (=> d!95795 (= (contains!3706 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316695)))

(declare-fun b!693062 () Bool)

(declare-fun e!394358 () Bool)

(assert (=> b!693062 (= e!394357 e!394358)))

(declare-fun res!457229 () Bool)

(assert (=> b!693062 (=> res!457229 e!394358)))

(assert (=> b!693062 (= res!457229 (= (h!14170 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693063 () Bool)

(assert (=> b!693063 (= e!394358 (contains!3706 (t!19402 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95795 res!457228) b!693062))

(assert (= (and b!693062 (not res!457229)) b!693063))

(assert (=> d!95795 m!655439))

(declare-fun m!655503 () Bool)

(assert (=> d!95795 m!655503))

(declare-fun m!655505 () Bool)

(assert (=> b!693063 m!655505))

(assert (=> b!692899 d!95795))

(declare-fun d!95797 () Bool)

(declare-fun res!457230 () Bool)

(declare-fun e!394359 () Bool)

(assert (=> d!95797 (=> res!457230 e!394359)))

(assert (=> d!95797 (= res!457230 (is-Nil!13126 acc!681))))

(assert (=> d!95797 (= (noDuplicate!953 acc!681) e!394359)))

(declare-fun b!693064 () Bool)

(declare-fun e!394360 () Bool)

(assert (=> b!693064 (= e!394359 e!394360)))

(declare-fun res!457231 () Bool)

(assert (=> b!693064 (=> (not res!457231) (not e!394360))))

(assert (=> b!693064 (= res!457231 (not (contains!3706 (t!19402 acc!681) (h!14170 acc!681))))))

(declare-fun b!693065 () Bool)

(assert (=> b!693065 (= e!394360 (noDuplicate!953 (t!19402 acc!681)))))

(assert (= (and d!95797 (not res!457230)) b!693064))

(assert (= (and b!693064 res!457231) b!693065))

(declare-fun m!655511 () Bool)

(assert (=> b!693064 m!655511))

(declare-fun m!655513 () Bool)

(assert (=> b!693065 m!655513))

(assert (=> b!692909 d!95797))

(push 1)

