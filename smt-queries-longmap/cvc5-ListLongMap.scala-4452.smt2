; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61910 () Bool)

(assert start!61910)

(declare-fun b!692744 () Bool)

(declare-fun res!456952 () Bool)

(declare-fun e!394159 () Bool)

(assert (=> b!692744 (=> (not res!456952) (not e!394159))))

(declare-fun e!394162 () Bool)

(assert (=> b!692744 (= res!456952 e!394162)))

(declare-fun res!456961 () Bool)

(assert (=> b!692744 (=> res!456961 e!394162)))

(declare-fun e!394160 () Bool)

(assert (=> b!692744 (= res!456961 e!394160)))

(declare-fun res!456962 () Bool)

(assert (=> b!692744 (=> (not res!456962) (not e!394160))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692744 (= res!456962 (bvsgt from!3004 i!1382))))

(declare-fun b!692745 () Bool)

(declare-fun res!456964 () Bool)

(declare-fun e!394164 () Bool)

(assert (=> b!692745 (=> (not res!456964) (not e!394164))))

(declare-fun e!394155 () Bool)

(assert (=> b!692745 (= res!456964 e!394155)))

(declare-fun res!456965 () Bool)

(assert (=> b!692745 (=> res!456965 e!394155)))

(assert (=> b!692745 (= res!456965 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692746 () Bool)

(declare-fun e!394163 () Bool)

(declare-datatypes ((List!13127 0))(
  ( (Nil!13124) (Cons!13123 (h!14168 (_ BitVec 64)) (t!19400 List!13127)) )
))
(declare-fun acc!681 () List!13127)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3704 (List!13127 (_ BitVec 64)) Bool)

(assert (=> b!692746 (= e!394163 (not (contains!3704 acc!681 k!2843)))))

(declare-fun b!692747 () Bool)

(declare-fun res!456949 () Bool)

(assert (=> b!692747 (=> (not res!456949) (not e!394159))))

(assert (=> b!692747 (= res!456949 (not (contains!3704 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692748 () Bool)

(declare-fun e!394161 () Bool)

(assert (=> b!692748 (= e!394161 e!394164)))

(declare-fun res!456960 () Bool)

(assert (=> b!692748 (=> (not res!456960) (not e!394164))))

(assert (=> b!692748 (= res!456960 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39841 0))(
  ( (array!39842 (arr!19086 (Array (_ BitVec 32) (_ BitVec 64))) (size!19471 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39841)

(declare-fun lt!316643 () List!13127)

(declare-fun $colon$colon!416 (List!13127 (_ BitVec 64)) List!13127)

(assert (=> b!692748 (= lt!316643 ($colon$colon!416 acc!681 (select (arr!19086 a!3626) from!3004)))))

(declare-fun b!692749 () Bool)

(declare-fun res!456968 () Bool)

(assert (=> b!692749 (=> (not res!456968) (not e!394164))))

(declare-fun noDuplicate!951 (List!13127) Bool)

(assert (=> b!692749 (= res!456968 (noDuplicate!951 lt!316643))))

(declare-fun b!692750 () Bool)

(declare-fun res!456956 () Bool)

(assert (=> b!692750 (=> (not res!456956) (not e!394164))))

(assert (=> b!692750 (= res!456956 (not (contains!3704 lt!316643 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692751 () Bool)

(declare-fun res!456959 () Bool)

(assert (=> b!692751 (=> (not res!456959) (not e!394159))))

(assert (=> b!692751 (= res!456959 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19471 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692752 () Bool)

(declare-fun res!456963 () Bool)

(assert (=> b!692752 (=> (not res!456963) (not e!394159))))

(declare-fun arrayNoDuplicates!0 (array!39841 (_ BitVec 32) List!13127) Bool)

(assert (=> b!692752 (= res!456963 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692753 () Bool)

(declare-fun res!456967 () Bool)

(assert (=> b!692753 (=> (not res!456967) (not e!394159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692753 (= res!456967 (validKeyInArray!0 k!2843))))

(declare-fun res!456955 () Bool)

(assert (=> start!61910 (=> (not res!456955) (not e!394159))))

(assert (=> start!61910 (= res!456955 (and (bvslt (size!19471 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19471 a!3626))))))

(assert (=> start!61910 e!394159))

(assert (=> start!61910 true))

(declare-fun array_inv!14882 (array!39841) Bool)

(assert (=> start!61910 (array_inv!14882 a!3626)))

(declare-fun b!692754 () Bool)

(declare-fun res!456953 () Bool)

(assert (=> b!692754 (=> (not res!456953) (not e!394164))))

(assert (=> b!692754 (= res!456953 (not (contains!3704 lt!316643 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692755 () Bool)

(assert (=> b!692755 (= e!394159 e!394161)))

(declare-fun res!456966 () Bool)

(assert (=> b!692755 (=> (not res!456966) (not e!394161))))

(assert (=> b!692755 (= res!456966 (not (= (select (arr!19086 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!24462 0))(
  ( (Unit!24463) )
))
(declare-fun lt!316644 () Unit!24462)

(declare-fun e!394158 () Unit!24462)

(assert (=> b!692755 (= lt!316644 e!394158)))

(declare-fun c!78266 () Bool)

(assert (=> b!692755 (= c!78266 (= (select (arr!19086 a!3626) from!3004) k!2843))))

(declare-fun b!692756 () Bool)

(declare-fun res!456947 () Bool)

(assert (=> b!692756 (=> (not res!456947) (not e!394159))))

(assert (=> b!692756 (= res!456947 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13124))))

(declare-fun b!692757 () Bool)

(assert (=> b!692757 (= e!394162 e!394163)))

(declare-fun res!456946 () Bool)

(assert (=> b!692757 (=> (not res!456946) (not e!394163))))

(assert (=> b!692757 (= res!456946 (bvsle from!3004 i!1382))))

(declare-fun b!692758 () Bool)

(declare-fun res!456957 () Bool)

(assert (=> b!692758 (=> (not res!456957) (not e!394159))))

(declare-fun arrayContainsKey!0 (array!39841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692758 (= res!456957 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692759 () Bool)

(declare-fun res!456950 () Bool)

(assert (=> b!692759 (=> (not res!456950) (not e!394159))))

(assert (=> b!692759 (= res!456950 (not (contains!3704 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692760 () Bool)

(declare-fun Unit!24464 () Unit!24462)

(assert (=> b!692760 (= e!394158 Unit!24464)))

(assert (=> b!692760 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316645 () Unit!24462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39841 (_ BitVec 64) (_ BitVec 32)) Unit!24462)

(assert (=> b!692760 (= lt!316645 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!692760 false))

(declare-fun b!692761 () Bool)

(declare-fun res!456951 () Bool)

(assert (=> b!692761 (=> (not res!456951) (not e!394159))))

(assert (=> b!692761 (= res!456951 (noDuplicate!951 acc!681))))

(declare-fun b!692762 () Bool)

(declare-fun res!456954 () Bool)

(assert (=> b!692762 (=> (not res!456954) (not e!394159))))

(assert (=> b!692762 (= res!456954 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19471 a!3626))))))

(declare-fun b!692763 () Bool)

(declare-fun e!394156 () Bool)

(assert (=> b!692763 (= e!394164 e!394156)))

(declare-fun res!456958 () Bool)

(assert (=> b!692763 (=> res!456958 e!394156)))

(assert (=> b!692763 (= res!456958 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692764 () Bool)

(declare-fun Unit!24465 () Unit!24462)

(assert (=> b!692764 (= e!394158 Unit!24465)))

(declare-fun b!692765 () Bool)

(assert (=> b!692765 (= e!394160 (contains!3704 acc!681 k!2843))))

(declare-fun b!692766 () Bool)

(assert (=> b!692766 (= e!394156 (contains!3704 lt!316643 k!2843))))

(declare-fun b!692767 () Bool)

(declare-fun res!456948 () Bool)

(assert (=> b!692767 (=> (not res!456948) (not e!394159))))

(assert (=> b!692767 (= res!456948 (validKeyInArray!0 (select (arr!19086 a!3626) from!3004)))))

(declare-fun b!692768 () Bool)

(assert (=> b!692768 (= e!394155 (not (contains!3704 lt!316643 k!2843)))))

(assert (= (and start!61910 res!456955) b!692761))

(assert (= (and b!692761 res!456951) b!692759))

(assert (= (and b!692759 res!456950) b!692747))

(assert (= (and b!692747 res!456949) b!692744))

(assert (= (and b!692744 res!456962) b!692765))

(assert (= (and b!692744 (not res!456961)) b!692757))

(assert (= (and b!692757 res!456946) b!692746))

(assert (= (and b!692744 res!456952) b!692756))

(assert (= (and b!692756 res!456947) b!692752))

(assert (= (and b!692752 res!456963) b!692762))

(assert (= (and b!692762 res!456954) b!692753))

(assert (= (and b!692753 res!456967) b!692758))

(assert (= (and b!692758 res!456957) b!692751))

(assert (= (and b!692751 res!456959) b!692767))

(assert (= (and b!692767 res!456948) b!692755))

(assert (= (and b!692755 c!78266) b!692760))

(assert (= (and b!692755 (not c!78266)) b!692764))

(assert (= (and b!692755 res!456966) b!692748))

(assert (= (and b!692748 res!456960) b!692749))

(assert (= (and b!692749 res!456968) b!692754))

(assert (= (and b!692754 res!456953) b!692750))

(assert (= (and b!692750 res!456956) b!692745))

(assert (= (and b!692745 (not res!456965)) b!692768))

(assert (= (and b!692745 res!456964) b!692763))

(assert (= (and b!692763 (not res!456958)) b!692766))

(declare-fun m!655259 () Bool)

(assert (=> b!692759 m!655259))

(declare-fun m!655261 () Bool)

(assert (=> b!692748 m!655261))

(assert (=> b!692748 m!655261))

(declare-fun m!655263 () Bool)

(assert (=> b!692748 m!655263))

(declare-fun m!655265 () Bool)

(assert (=> b!692758 m!655265))

(declare-fun m!655267 () Bool)

(assert (=> b!692749 m!655267))

(declare-fun m!655269 () Bool)

(assert (=> b!692747 m!655269))

(declare-fun m!655271 () Bool)

(assert (=> b!692746 m!655271))

(declare-fun m!655273 () Bool)

(assert (=> b!692766 m!655273))

(declare-fun m!655275 () Bool)

(assert (=> b!692756 m!655275))

(declare-fun m!655277 () Bool)

(assert (=> start!61910 m!655277))

(declare-fun m!655279 () Bool)

(assert (=> b!692754 m!655279))

(declare-fun m!655281 () Bool)

(assert (=> b!692760 m!655281))

(declare-fun m!655283 () Bool)

(assert (=> b!692760 m!655283))

(declare-fun m!655285 () Bool)

(assert (=> b!692761 m!655285))

(declare-fun m!655287 () Bool)

(assert (=> b!692752 m!655287))

(declare-fun m!655289 () Bool)

(assert (=> b!692750 m!655289))

(assert (=> b!692768 m!655273))

(assert (=> b!692755 m!655261))

(declare-fun m!655291 () Bool)

(assert (=> b!692753 m!655291))

(assert (=> b!692765 m!655271))

(assert (=> b!692767 m!655261))

(assert (=> b!692767 m!655261))

(declare-fun m!655293 () Bool)

(assert (=> b!692767 m!655293))

(push 1)

(assert (not b!692746))

(assert (not b!692766))

(assert (not b!692748))

(assert (not b!692749))

(assert (not start!61910))

(assert (not b!692758))

(assert (not b!692752))

(assert (not b!692768))

(assert (not b!692753))

(assert (not b!692760))

(assert (not b!692765))

(assert (not b!692761))

(assert (not b!692750))

(assert (not b!692767))

(assert (not b!692747))

(assert (not b!692759))

(assert (not b!692756))

(assert (not b!692754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95739 () Bool)

(declare-fun lt!316677 () Bool)

(declare-fun content!316 (List!13127) (Set (_ BitVec 64)))

(assert (=> d!95739 (= lt!316677 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!316 lt!316643)))))

(declare-fun e!394285 () Bool)

(assert (=> d!95739 (= lt!316677 e!394285)))

(declare-fun res!457161 () Bool)

(assert (=> d!95739 (=> (not res!457161) (not e!394285))))

(assert (=> d!95739 (= res!457161 (is-Cons!13123 lt!316643))))

(assert (=> d!95739 (= (contains!3704 lt!316643 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316677)))

(declare-fun b!692985 () Bool)

(declare-fun e!394286 () Bool)

(assert (=> b!692985 (= e!394285 e!394286)))

(declare-fun res!457162 () Bool)

(assert (=> b!692985 (=> res!457162 e!394286)))

(assert (=> b!692985 (= res!457162 (= (h!14168 lt!316643) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692986 () Bool)

(assert (=> b!692986 (= e!394286 (contains!3704 (t!19400 lt!316643) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95739 res!457161) b!692985))

(assert (= (and b!692985 (not res!457162)) b!692986))

(declare-fun m!655421 () Bool)

(assert (=> d!95739 m!655421))

(declare-fun m!655423 () Bool)

(assert (=> d!95739 m!655423))

(declare-fun m!655425 () Bool)

(assert (=> b!692986 m!655425))

(assert (=> b!692750 d!95739))

(declare-fun d!95745 () Bool)

(declare-fun res!457170 () Bool)

(declare-fun e!394295 () Bool)

(assert (=> d!95745 (=> res!457170 e!394295)))

(assert (=> d!95745 (= res!457170 (= (select (arr!19086 a!3626) from!3004) k!2843))))

(assert (=> d!95745 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!394295)))

(declare-fun b!692996 () Bool)

(declare-fun e!394296 () Bool)

(assert (=> b!692996 (= e!394295 e!394296)))

(declare-fun res!457171 () Bool)

(assert (=> b!692996 (=> (not res!457171) (not e!394296))))

(assert (=> b!692996 (= res!457171 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19471 a!3626)))))

(declare-fun b!692997 () Bool)

(assert (=> b!692997 (= e!394296 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95745 (not res!457170)) b!692996))

(assert (= (and b!692996 res!457171) b!692997))

(assert (=> d!95745 m!655261))

(declare-fun m!655435 () Bool)

(assert (=> b!692997 m!655435))

(assert (=> b!692760 d!95745))

(declare-fun d!95749 () Bool)

(assert (=> d!95749 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316682 () Unit!24462)

(declare-fun choose!13 (array!39841 (_ BitVec 64) (_ BitVec 32)) Unit!24462)

(assert (=> d!95749 (= lt!316682 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95749 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95749 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!316682)))

(declare-fun bs!20276 () Bool)

(assert (= bs!20276 d!95749))

(assert (=> bs!20276 m!655265))

(declare-fun m!655437 () Bool)

(assert (=> bs!20276 m!655437))

(assert (=> b!692760 d!95749))

(declare-fun d!95751 () Bool)

(declare-fun res!457186 () Bool)

(declare-fun e!394311 () Bool)

(assert (=> d!95751 (=> res!457186 e!394311)))

(assert (=> d!95751 (= res!457186 (is-Nil!13124 lt!316643))))

(assert (=> d!95751 (= (noDuplicate!951 lt!316643) e!394311)))

(declare-fun b!693012 () Bool)

(declare-fun e!394312 () Bool)

(assert (=> b!693012 (= e!394311 e!394312)))

(declare-fun res!457187 () Bool)

(assert (=> b!693012 (=> (not res!457187) (not e!394312))))

(assert (=> b!693012 (= res!457187 (not (contains!3704 (t!19400 lt!316643) (h!14168 lt!316643))))))

(declare-fun b!693013 () Bool)

(assert (=> b!693013 (= e!394312 (noDuplicate!951 (t!19400 lt!316643)))))

(assert (= (and d!95751 (not res!457186)) b!693012))

(assert (= (and b!693012 res!457187) b!693013))

(declare-fun m!655445 () Bool)

(assert (=> b!693012 m!655445))

(declare-fun m!655447 () Bool)

(assert (=> b!693013 m!655447))

(assert (=> b!692749 d!95751))

(declare-fun d!95755 () Bool)

(declare-fun lt!316684 () Bool)

(assert (=> d!95755 (= lt!316684 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!316 acc!681)))))

(declare-fun e!394315 () Bool)

(assert (=> d!95755 (= lt!316684 e!394315)))

(declare-fun res!457190 () Bool)

(assert (=> d!95755 (=> (not res!457190) (not e!394315))))

(assert (=> d!95755 (= res!457190 (is-Cons!13123 acc!681))))

(assert (=> d!95755 (= (contains!3704 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316684)))

(declare-fun b!693016 () Bool)

(declare-fun e!394316 () Bool)

(assert (=> b!693016 (= e!394315 e!394316)))

(declare-fun res!457191 () Bool)

(assert (=> b!693016 (=> res!457191 e!394316)))

(assert (=> b!693016 (= res!457191 (= (h!14168 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693017 () Bool)

(assert (=> b!693017 (= e!394316 (contains!3704 (t!19400 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95755 res!457190) b!693016))

(assert (= (and b!693016 (not res!457191)) b!693017))

(declare-fun m!655449 () Bool)

(assert (=> d!95755 m!655449))

(declare-fun m!655453 () Bool)

(assert (=> d!95755 m!655453))

(declare-fun m!655455 () Bool)

(assert (=> b!693017 m!655455))

(assert (=> b!692759 d!95755))

(declare-fun d!95759 () Bool)

(assert (=> d!95759 (= ($colon$colon!416 acc!681 (select (arr!19086 a!3626) from!3004)) (Cons!13123 (select (arr!19086 a!3626) from!3004) acc!681))))

(assert (=> b!692748 d!95759))

(declare-fun d!95761 () Bool)

(declare-fun res!457192 () Bool)

(declare-fun e!394317 () Bool)

(assert (=> d!95761 (=> res!457192 e!394317)))

(assert (=> d!95761 (= res!457192 (= (select (arr!19086 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95761 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!394317)))

(declare-fun b!693018 () Bool)

(declare-fun e!394318 () Bool)

(assert (=> b!693018 (= e!394317 e!394318)))

(declare-fun res!457193 () Bool)

(assert (=> b!693018 (=> (not res!457193) (not e!394318))))

(assert (=> b!693018 (= res!457193 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19471 a!3626)))))

(declare-fun b!693019 () Bool)

(assert (=> b!693019 (= e!394318 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95761 (not res!457192)) b!693018))

(assert (= (and b!693018 res!457193) b!693019))

(declare-fun m!655457 () Bool)

(assert (=> d!95761 m!655457))

(declare-fun m!655459 () Bool)

(assert (=> b!693019 m!655459))

(assert (=> b!692758 d!95761))

(declare-fun d!95763 () Bool)

(declare-fun lt!316685 () Bool)

(assert (=> d!95763 (= lt!316685 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!316 acc!681)))))

(declare-fun e!394319 () Bool)

(assert (=> d!95763 (= lt!316685 e!394319)))

(declare-fun res!457194 () Bool)

(assert (=> d!95763 (=> (not res!457194) (not e!394319))))

(assert (=> d!95763 (= res!457194 (is-Cons!13123 acc!681))))

(assert (=> d!95763 (= (contains!3704 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316685)))

(declare-fun b!693020 () Bool)

(declare-fun e!394320 () Bool)

(assert (=> b!693020 (= e!394319 e!394320)))

(declare-fun res!457195 () Bool)

(assert (=> b!693020 (=> res!457195 e!394320)))

(assert (=> b!693020 (= res!457195 (= (h!14168 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693021 () Bool)

(assert (=> b!693021 (= e!394320 (contains!3704 (t!19400 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95763 res!457194) b!693020))

(assert (= (and b!693020 (not res!457195)) b!693021))

(assert (=> d!95763 m!655449))

(declare-fun m!655461 () Bool)

(assert (=> d!95763 m!655461))

(declare-fun m!655463 () Bool)

(assert (=> b!693021 m!655463))

(assert (=> b!692747 d!95763))

(declare-fun d!95765 () Bool)

(declare-fun lt!316688 () Bool)

(assert (=> d!95765 (= lt!316688 (set.member k!2843 (content!316 lt!316643)))))

(declare-fun e!394321 () Bool)

(assert (=> d!95765 (= lt!316688 e!394321)))

(declare-fun res!457196 () Bool)

(assert (=> d!95765 (=> (not res!457196) (not e!394321))))

(assert (=> d!95765 (= res!457196 (is-Cons!13123 lt!316643))))

(assert (=> d!95765 (= (contains!3704 lt!316643 k!2843) lt!316688)))

(declare-fun b!693022 () Bool)

(declare-fun e!394322 () Bool)

(assert (=> b!693022 (= e!394321 e!394322)))

(declare-fun res!457197 () Bool)

(assert (=> b!693022 (=> res!457197 e!394322)))

(assert (=> b!693022 (= res!457197 (= (h!14168 lt!316643) k!2843))))

(declare-fun b!693023 () Bool)

(assert (=> b!693023 (= e!394322 (contains!3704 (t!19400 lt!316643) k!2843))))

(assert (= (and d!95765 res!457196) b!693022))

(assert (= (and b!693022 (not res!457197)) b!693023))

(assert (=> d!95765 m!655421))

(declare-fun m!655465 () Bool)

(assert (=> d!95765 m!655465))

(declare-fun m!655467 () Bool)

(assert (=> b!693023 m!655467))

(assert (=> b!692768 d!95765))

(declare-fun d!95767 () Bool)

(declare-fun lt!316690 () Bool)

(assert (=> d!95767 (= lt!316690 (set.member k!2843 (content!316 acc!681)))))

(declare-fun e!394323 () Bool)

(assert (=> d!95767 (= lt!316690 e!394323)))

(declare-fun res!457198 () Bool)

(assert (=> d!95767 (=> (not res!457198) (not e!394323))))

(assert (=> d!95767 (= res!457198 (is-Cons!13123 acc!681))))

(assert (=> d!95767 (= (contains!3704 acc!681 k!2843) lt!316690)))

(declare-fun b!693024 () Bool)

(declare-fun e!394324 () Bool)

(assert (=> b!693024 (= e!394323 e!394324)))

(declare-fun res!457199 () Bool)

(assert (=> b!693024 (=> res!457199 e!394324)))

(assert (=> b!693024 (= res!457199 (= (h!14168 acc!681) k!2843))))

(declare-fun b!693025 () Bool)

(assert (=> b!693025 (= e!394324 (contains!3704 (t!19400 acc!681) k!2843))))

(assert (= (and d!95767 res!457198) b!693024))

(assert (= (and b!693024 (not res!457199)) b!693025))

(assert (=> d!95767 m!655449))

(declare-fun m!655471 () Bool)

(assert (=> d!95767 m!655471))

(declare-fun m!655473 () Bool)

(assert (=> b!693025 m!655473))

(assert (=> b!692746 d!95767))

(declare-fun d!95771 () Bool)

(assert (=> d!95771 (= (validKeyInArray!0 (select (arr!19086 a!3626) from!3004)) (and (not (= (select (arr!19086 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19086 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692767 d!95771))

(declare-fun b!693057 () Bool)

(declare-fun e!394353 () Bool)

(declare-fun e!394356 () Bool)

(assert (=> b!693057 (= e!394353 e!394356)))

(declare-fun res!457225 () Bool)

(assert (=> b!693057 (=> (not res!457225) (not e!394356))))

(declare-fun e!394355 () Bool)

(assert (=> b!693057 (= res!457225 (not e!394355))))

(declare-fun res!457227 () Bool)

(assert (=> b!693057 (=> (not res!457227) (not e!394355))))

(assert (=> b!693057 (= res!457227 (validKeyInArray!0 (select (arr!19086 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!693058 () Bool)

(declare-fun e!394354 () Bool)

(assert (=> b!693058 (= e!394356 e!394354)))

(declare-fun c!78283 () Bool)

(assert (=> b!693058 (= c!78283 (validKeyInArray!0 (select (arr!19086 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!693059 () Bool)

(declare-fun call!34261 () Bool)

(assert (=> b!693059 (= e!394354 call!34261)))

(declare-fun b!693060 () Bool)

(assert (=> b!693060 (= e!394354 call!34261)))

(declare-fun d!95775 () Bool)

(declare-fun res!457226 () Bool)

(assert (=> d!95775 (=> res!457226 e!394353)))

(assert (=> d!95775 (= res!457226 (bvsge #b00000000000000000000000000000000 (size!19471 a!3626)))))

(assert (=> d!95775 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13124) e!394353)))

(declare-fun b!693061 () Bool)

(assert (=> b!693061 (= e!394355 (contains!3704 Nil!13124 (select (arr!19086 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34258 () Bool)

(assert (=> bm!34258 (= call!34261 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78283 (Cons!13123 (select (arr!19086 a!3626) #b00000000000000000000000000000000) Nil!13124) Nil!13124)))))

(assert (= (and d!95775 (not res!457226)) b!693057))

(assert (= (and b!693057 res!457227) b!693061))

(assert (= (and b!693057 res!457225) b!693058))

(assert (= (and b!693058 c!78283) b!693060))

(assert (= (and b!693058 (not c!78283)) b!693059))

(assert (= (or b!693060 b!693059) bm!34258))

(assert (=> b!693057 m!655457))

(assert (=> b!693057 m!655457))

(declare-fun m!655507 () Bool)

(assert (=> b!693057 m!655507))

(assert (=> b!693058 m!655457))

(assert (=> b!693058 m!655457))

(assert (=> b!693058 m!655507))

(assert (=> b!693061 m!655457))

(assert (=> b!693061 m!655457))

(declare-fun m!655509 () Bool)

(assert (=> b!693061 m!655509))

(assert (=> bm!34258 m!655457))

(declare-fun m!655515 () Bool)

(assert (=> bm!34258 m!655515))

(assert (=> b!692756 d!95775))

(assert (=> b!692766 d!95765))

(assert (=> b!692765 d!95767))

(declare-fun d!95799 () Bool)

(declare-fun lt!316696 () Bool)

(assert (=> d!95799 (= lt!316696 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!316 lt!316643)))))

(declare-fun e!394361 () Bool)

(assert (=> d!95799 (= lt!316696 e!394361)))

(declare-fun res!457232 () Bool)

(assert (=> d!95799 (=> (not res!457232) (not e!394361))))

(assert (=> d!95799 (= res!457232 (is-Cons!13123 lt!316643))))

(assert (=> d!95799 (= (contains!3704 lt!316643 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316696)))

(declare-fun b!693066 () Bool)

(declare-fun e!394362 () Bool)

(assert (=> b!693066 (= e!394361 e!394362)))

(declare-fun res!457233 () Bool)

(assert (=> b!693066 (=> res!457233 e!394362)))

(assert (=> b!693066 (= res!457233 (= (h!14168 lt!316643) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693067 () Bool)

(assert (=> b!693067 (= e!394362 (contains!3704 (t!19400 lt!316643) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95799 res!457232) b!693066))

(assert (= (and b!693066 (not res!457233)) b!693067))

(assert (=> d!95799 m!655421))

(declare-fun m!655517 () Bool)

(assert (=> d!95799 m!655517))

(declare-fun m!655519 () Bool)

(assert (=> b!693067 m!655519))

(assert (=> b!692754 d!95799))

(declare-fun d!95801 () Bool)

(assert (=> d!95801 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692753 d!95801))

(declare-fun d!95803 () Bool)

(assert (=> d!95803 (= (array_inv!14882 a!3626) (bvsge (size!19471 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61910 d!95803))

(declare-fun b!693068 () Bool)

(declare-fun e!394363 () Bool)

(declare-fun e!394366 () Bool)

(assert (=> b!693068 (= e!394363 e!394366)))

(declare-fun res!457234 () Bool)

(assert (=> b!693068 (=> (not res!457234) (not e!394366))))

(declare-fun e!394365 () Bool)

(assert (=> b!693068 (= res!457234 (not e!394365))))

(declare-fun res!457236 () Bool)

(assert (=> b!693068 (=> (not res!457236) (not e!394365))))

(assert (=> b!693068 (= res!457236 (validKeyInArray!0 (select (arr!19086 a!3626) from!3004)))))

(declare-fun b!693069 () Bool)

(declare-fun e!394364 () Bool)

(assert (=> b!693069 (= e!394366 e!394364)))

(declare-fun c!78284 () Bool)

(assert (=> b!693069 (= c!78284 (validKeyInArray!0 (select (arr!19086 a!3626) from!3004)))))

(declare-fun b!693070 () Bool)

(declare-fun call!34262 () Bool)

(assert (=> b!693070 (= e!394364 call!34262)))

(declare-fun b!693071 () Bool)

(assert (=> b!693071 (= e!394364 call!34262)))

(declare-fun d!95805 () Bool)

(declare-fun res!457235 () Bool)

(assert (=> d!95805 (=> res!457235 e!394363)))

(assert (=> d!95805 (= res!457235 (bvsge from!3004 (size!19471 a!3626)))))

(assert (=> d!95805 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394363)))

(declare-fun b!693072 () Bool)

(assert (=> b!693072 (= e!394365 (contains!3704 acc!681 (select (arr!19086 a!3626) from!3004)))))

(declare-fun bm!34259 () Bool)

(assert (=> bm!34259 (= call!34262 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78284 (Cons!13123 (select (arr!19086 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!95805 (not res!457235)) b!693068))

(assert (= (and b!693068 res!457236) b!693072))

(assert (= (and b!693068 res!457234) b!693069))

(assert (= (and b!693069 c!78284) b!693071))

(assert (= (and b!693069 (not c!78284)) b!693070))

(assert (= (or b!693071 b!693070) bm!34259))

(assert (=> b!693068 m!655261))

(assert (=> b!693068 m!655261))

(assert (=> b!693068 m!655293))

(assert (=> b!693069 m!655261))

(assert (=> b!693069 m!655261))

(assert (=> b!693069 m!655293))

(assert (=> b!693072 m!655261))

(assert (=> b!693072 m!655261))

(declare-fun m!655521 () Bool)

(assert (=> b!693072 m!655521))

(assert (=> bm!34259 m!655261))

(declare-fun m!655523 () Bool)

(assert (=> bm!34259 m!655523))

(assert (=> b!692752 d!95805))

(declare-fun d!95807 () Bool)

(declare-fun res!457237 () Bool)

(declare-fun e!394367 () Bool)

(assert (=> d!95807 (=> res!457237 e!394367)))

(assert (=> d!95807 (= res!457237 (is-Nil!13124 acc!681))))

(assert (=> d!95807 (= (noDuplicate!951 acc!681) e!394367)))

(declare-fun b!693073 () Bool)

(declare-fun e!394368 () Bool)

(assert (=> b!693073 (= e!394367 e!394368)))

(declare-fun res!457238 () Bool)

(assert (=> b!693073 (=> (not res!457238) (not e!394368))))

(assert (=> b!693073 (= res!457238 (not (contains!3704 (t!19400 acc!681) (h!14168 acc!681))))))

(declare-fun b!693074 () Bool)

(assert (=> b!693074 (= e!394368 (noDuplicate!951 (t!19400 acc!681)))))

(assert (= (and d!95807 (not res!457237)) b!693073))

(assert (= (and b!693073 res!457238) b!693074))

(declare-fun m!655525 () Bool)

(assert (=> b!693073 m!655525))

(declare-fun m!655527 () Bool)

(assert (=> b!693074 m!655527))

(assert (=> b!692761 d!95807))

(push 1)

(assert (not b!693025))

(assert (not b!693073))

(assert (not bm!34258))

(assert (not b!692986))

(assert (not d!95799))

(assert (not b!693067))

(assert (not b!693019))

(assert (not b!693069))

(assert (not b!693012))

(assert (not d!95749))

(assert (not b!693074))

(assert (not b!693057))

(assert (not b!693023))

(assert (not b!693013))

(assert (not b!693017))

(assert (not b!693058))

(assert (not d!95755))

(assert (not b!693021))

(assert (not b!693072))

(assert (not d!95739))

(assert (not bm!34259))

(assert (not b!692997))

(assert (not d!95765))

(assert (not b!693068))

(assert (not b!693061))

(assert (not d!95767))

(assert (not d!95763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

