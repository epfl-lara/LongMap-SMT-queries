; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61092 () Bool)

(assert start!61092)

(declare-fun b!685144 () Bool)

(declare-datatypes ((Unit!24127 0))(
  ( (Unit!24128) )
))
(declare-fun e!390161 () Unit!24127)

(declare-fun Unit!24129 () Unit!24127)

(assert (=> b!685144 (= e!390161 Unit!24129)))

(declare-fun b!685145 () Bool)

(declare-fun res!450564 () Bool)

(declare-fun e!390158 () Bool)

(assert (=> b!685145 (=> (not res!450564) (not e!390158))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39626 0))(
  ( (array!39627 (arr!18992 (Array (_ BitVec 32) (_ BitVec 64))) (size!19361 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39626)

(assert (=> b!685145 (= res!450564 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19361 a!3626))))))

(declare-fun b!685146 () Bool)

(declare-fun e!390157 () Unit!24127)

(declare-fun Unit!24130 () Unit!24127)

(assert (=> b!685146 (= e!390157 Unit!24130)))

(declare-fun lt!314571 () Unit!24127)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39626 (_ BitVec 64) (_ BitVec 32)) Unit!24127)

(assert (=> b!685146 (= lt!314571 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685146 false))

(declare-fun b!685148 () Bool)

(declare-fun e!390156 () Bool)

(assert (=> b!685148 (= e!390158 (not e!390156))))

(declare-fun res!450561 () Bool)

(assert (=> b!685148 (=> res!450561 e!390156)))

(assert (=> b!685148 (= res!450561 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13033 0))(
  ( (Nil!13030) (Cons!13029 (h!14074 (_ BitVec 64)) (t!19282 List!13033)) )
))
(declare-fun lt!314573 () List!13033)

(declare-fun acc!681 () List!13033)

(declare-fun -!161 (List!13033 (_ BitVec 64)) List!13033)

(assert (=> b!685148 (= (-!161 lt!314573 k!2843) acc!681)))

(declare-fun $colon$colon!361 (List!13033 (_ BitVec 64)) List!13033)

(assert (=> b!685148 (= lt!314573 ($colon$colon!361 acc!681 k!2843))))

(declare-fun lt!314577 () Unit!24127)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13033) Unit!24127)

(assert (=> b!685148 (= lt!314577 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!196 (List!13033 List!13033) Bool)

(assert (=> b!685148 (subseq!196 acc!681 acc!681)))

(declare-fun lt!314572 () Unit!24127)

(declare-fun lemmaListSubSeqRefl!0 (List!13033) Unit!24127)

(assert (=> b!685148 (= lt!314572 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39626 (_ BitVec 32) List!13033) Bool)

(assert (=> b!685148 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314574 () Unit!24127)

(assert (=> b!685148 (= lt!314574 e!390161)))

(declare-fun c!77659 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685148 (= c!77659 (validKeyInArray!0 (select (arr!18992 a!3626) from!3004)))))

(declare-fun lt!314575 () Unit!24127)

(assert (=> b!685148 (= lt!314575 e!390157)))

(declare-fun c!77660 () Bool)

(declare-fun lt!314578 () Bool)

(assert (=> b!685148 (= c!77660 lt!314578)))

(declare-fun arrayContainsKey!0 (array!39626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685148 (= lt!314578 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685148 (arrayContainsKey!0 (array!39627 (store (arr!18992 a!3626) i!1382 k!2843) (size!19361 a!3626)) k!2843 from!3004)))

(declare-fun b!685149 () Bool)

(declare-fun res!450571 () Bool)

(assert (=> b!685149 (=> (not res!450571) (not e!390158))))

(assert (=> b!685149 (= res!450571 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19361 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685150 () Bool)

(declare-fun res!450563 () Bool)

(assert (=> b!685150 (=> (not res!450563) (not e!390158))))

(assert (=> b!685150 (= res!450563 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685151 () Bool)

(declare-fun res!450562 () Bool)

(assert (=> b!685151 (=> (not res!450562) (not e!390158))))

(declare-fun e!390155 () Bool)

(assert (=> b!685151 (= res!450562 e!390155)))

(declare-fun res!450566 () Bool)

(assert (=> b!685151 (=> res!450566 e!390155)))

(declare-fun e!390160 () Bool)

(assert (=> b!685151 (= res!450566 e!390160)))

(declare-fun res!450569 () Bool)

(assert (=> b!685151 (=> (not res!450569) (not e!390160))))

(assert (=> b!685151 (= res!450569 (bvsgt from!3004 i!1382))))

(declare-fun b!685152 () Bool)

(declare-fun lt!314570 () Unit!24127)

(assert (=> b!685152 (= e!390161 lt!314570)))

(declare-fun lt!314576 () Unit!24127)

(assert (=> b!685152 (= lt!314576 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685152 (subseq!196 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39626 List!13033 List!13033 (_ BitVec 32)) Unit!24127)

(assert (=> b!685152 (= lt!314570 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!361 acc!681 (select (arr!18992 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685152 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685153 () Bool)

(declare-fun res!450565 () Bool)

(assert (=> b!685153 (=> (not res!450565) (not e!390158))))

(assert (=> b!685153 (= res!450565 (validKeyInArray!0 k!2843))))

(declare-fun b!685154 () Bool)

(declare-fun res!450575 () Bool)

(assert (=> b!685154 (=> res!450575 e!390156)))

(declare-fun contains!3610 (List!13033 (_ BitVec 64)) Bool)

(assert (=> b!685154 (= res!450575 (contains!3610 acc!681 k!2843))))

(declare-fun b!685147 () Bool)

(declare-fun res!450560 () Bool)

(assert (=> b!685147 (=> res!450560 e!390156)))

(assert (=> b!685147 (= res!450560 lt!314578)))

(declare-fun res!450572 () Bool)

(assert (=> start!61092 (=> (not res!450572) (not e!390158))))

(assert (=> start!61092 (= res!450572 (and (bvslt (size!19361 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19361 a!3626))))))

(assert (=> start!61092 e!390158))

(assert (=> start!61092 true))

(declare-fun array_inv!14788 (array!39626) Bool)

(assert (=> start!61092 (array_inv!14788 a!3626)))

(declare-fun b!685155 () Bool)

(declare-fun e!390162 () Bool)

(assert (=> b!685155 (= e!390155 e!390162)))

(declare-fun res!450576 () Bool)

(assert (=> b!685155 (=> (not res!450576) (not e!390162))))

(assert (=> b!685155 (= res!450576 (bvsle from!3004 i!1382))))

(declare-fun b!685156 () Bool)

(assert (=> b!685156 (= e!390156 (contains!3610 lt!314573 k!2843))))

(declare-fun b!685157 () Bool)

(declare-fun res!450577 () Bool)

(assert (=> b!685157 (=> (not res!450577) (not e!390158))))

(assert (=> b!685157 (= res!450577 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685158 () Bool)

(declare-fun res!450573 () Bool)

(assert (=> b!685158 (=> (not res!450573) (not e!390158))))

(declare-fun noDuplicate!857 (List!13033) Bool)

(assert (=> b!685158 (= res!450573 (noDuplicate!857 acc!681))))

(declare-fun b!685159 () Bool)

(assert (=> b!685159 (= e!390162 (not (contains!3610 acc!681 k!2843)))))

(declare-fun b!685160 () Bool)

(declare-fun Unit!24131 () Unit!24127)

(assert (=> b!685160 (= e!390157 Unit!24131)))

(declare-fun b!685161 () Bool)

(declare-fun res!450567 () Bool)

(assert (=> b!685161 (=> res!450567 e!390156)))

(assert (=> b!685161 (= res!450567 (not (noDuplicate!857 lt!314573)))))

(declare-fun b!685162 () Bool)

(declare-fun res!450570 () Bool)

(assert (=> b!685162 (=> (not res!450570) (not e!390158))))

(assert (=> b!685162 (= res!450570 (not (contains!3610 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685163 () Bool)

(assert (=> b!685163 (= e!390160 (contains!3610 acc!681 k!2843))))

(declare-fun b!685164 () Bool)

(declare-fun res!450578 () Bool)

(assert (=> b!685164 (=> (not res!450578) (not e!390158))))

(assert (=> b!685164 (= res!450578 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13030))))

(declare-fun b!685165 () Bool)

(declare-fun res!450574 () Bool)

(assert (=> b!685165 (=> (not res!450574) (not e!390158))))

(assert (=> b!685165 (= res!450574 (not (contains!3610 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685166 () Bool)

(declare-fun res!450568 () Bool)

(assert (=> b!685166 (=> res!450568 e!390156)))

(assert (=> b!685166 (= res!450568 (not (subseq!196 acc!681 lt!314573)))))

(assert (= (and start!61092 res!450572) b!685158))

(assert (= (and b!685158 res!450573) b!685165))

(assert (= (and b!685165 res!450574) b!685162))

(assert (= (and b!685162 res!450570) b!685151))

(assert (= (and b!685151 res!450569) b!685163))

(assert (= (and b!685151 (not res!450566)) b!685155))

(assert (= (and b!685155 res!450576) b!685159))

(assert (= (and b!685151 res!450562) b!685164))

(assert (= (and b!685164 res!450578) b!685150))

(assert (= (and b!685150 res!450563) b!685145))

(assert (= (and b!685145 res!450564) b!685153))

(assert (= (and b!685153 res!450565) b!685157))

(assert (= (and b!685157 res!450577) b!685149))

(assert (= (and b!685149 res!450571) b!685148))

(assert (= (and b!685148 c!77660) b!685146))

(assert (= (and b!685148 (not c!77660)) b!685160))

(assert (= (and b!685148 c!77659) b!685152))

(assert (= (and b!685148 (not c!77659)) b!685144))

(assert (= (and b!685148 (not res!450561)) b!685161))

(assert (= (and b!685161 (not res!450567)) b!685147))

(assert (= (and b!685147 (not res!450560)) b!685154))

(assert (= (and b!685154 (not res!450575)) b!685166))

(assert (= (and b!685166 (not res!450568)) b!685156))

(declare-fun m!649375 () Bool)

(assert (=> b!685157 m!649375))

(declare-fun m!649377 () Bool)

(assert (=> b!685156 m!649377))

(declare-fun m!649379 () Bool)

(assert (=> b!685153 m!649379))

(declare-fun m!649381 () Bool)

(assert (=> b!685163 m!649381))

(assert (=> b!685154 m!649381))

(declare-fun m!649383 () Bool)

(assert (=> b!685161 m!649383))

(declare-fun m!649385 () Bool)

(assert (=> b!685148 m!649385))

(declare-fun m!649387 () Bool)

(assert (=> b!685148 m!649387))

(declare-fun m!649389 () Bool)

(assert (=> b!685148 m!649389))

(declare-fun m!649391 () Bool)

(assert (=> b!685148 m!649391))

(declare-fun m!649393 () Bool)

(assert (=> b!685148 m!649393))

(declare-fun m!649395 () Bool)

(assert (=> b!685148 m!649395))

(assert (=> b!685148 m!649387))

(declare-fun m!649397 () Bool)

(assert (=> b!685148 m!649397))

(declare-fun m!649399 () Bool)

(assert (=> b!685148 m!649399))

(declare-fun m!649401 () Bool)

(assert (=> b!685148 m!649401))

(declare-fun m!649403 () Bool)

(assert (=> b!685148 m!649403))

(declare-fun m!649405 () Bool)

(assert (=> b!685148 m!649405))

(declare-fun m!649407 () Bool)

(assert (=> b!685158 m!649407))

(assert (=> b!685152 m!649385))

(assert (=> b!685152 m!649387))

(declare-fun m!649409 () Bool)

(assert (=> b!685152 m!649409))

(declare-fun m!649411 () Bool)

(assert (=> b!685152 m!649411))

(assert (=> b!685152 m!649387))

(assert (=> b!685152 m!649409))

(assert (=> b!685152 m!649391))

(assert (=> b!685152 m!649405))

(declare-fun m!649413 () Bool)

(assert (=> start!61092 m!649413))

(declare-fun m!649415 () Bool)

(assert (=> b!685162 m!649415))

(declare-fun m!649417 () Bool)

(assert (=> b!685146 m!649417))

(assert (=> b!685159 m!649381))

(declare-fun m!649419 () Bool)

(assert (=> b!685150 m!649419))

(declare-fun m!649421 () Bool)

(assert (=> b!685164 m!649421))

(declare-fun m!649423 () Bool)

(assert (=> b!685166 m!649423))

(declare-fun m!649425 () Bool)

(assert (=> b!685165 m!649425))

(push 1)

(assert (not b!685148))

(assert (not b!685166))

(assert (not b!685161))

(assert (not b!685162))

(assert (not b!685153))

(assert (not b!685146))

(assert (not b!685157))

(assert (not b!685156))

(assert (not b!685154))

(assert (not start!61092))

(assert (not b!685158))

(assert (not b!685150))

(assert (not b!685159))

(assert (not b!685165))

(assert (not b!685164))

(assert (not b!685152))

(assert (not b!685163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94457 () Bool)

(declare-fun lt!314581 () Bool)

(declare-fun content!289 (List!13033) (Set (_ BitVec 64)))

(assert (=> d!94457 (= lt!314581 (member k!2843 (content!289 lt!314573)))))

(declare-fun e!390185 () Bool)

(assert (=> d!94457 (= lt!314581 e!390185)))

(declare-fun res!450601 () Bool)

(assert (=> d!94457 (=> (not res!450601) (not e!390185))))

(assert (=> d!94457 (= res!450601 (is-Cons!13029 lt!314573))))

(assert (=> d!94457 (= (contains!3610 lt!314573 k!2843) lt!314581)))

(declare-fun b!685189 () Bool)

(declare-fun e!390186 () Bool)

(assert (=> b!685189 (= e!390185 e!390186)))

(declare-fun res!450602 () Bool)

(assert (=> b!685189 (=> res!450602 e!390186)))

(assert (=> b!685189 (= res!450602 (= (h!14074 lt!314573) k!2843))))

(declare-fun b!685190 () Bool)

(assert (=> b!685190 (= e!390186 (contains!3610 (t!19282 lt!314573) k!2843))))

(assert (= (and d!94457 res!450601) b!685189))

(assert (= (and b!685189 (not res!450602)) b!685190))

(declare-fun m!649435 () Bool)

(assert (=> d!94457 m!649435))

(declare-fun m!649437 () Bool)

(assert (=> d!94457 m!649437))

(declare-fun m!649439 () Bool)

(assert (=> b!685190 m!649439))

(assert (=> b!685156 d!94457))

(declare-fun d!94465 () Bool)

(declare-fun res!450625 () Bool)

(declare-fun e!390209 () Bool)

(assert (=> d!94465 (=> res!450625 e!390209)))

(assert (=> d!94465 (= res!450625 (= (select (arr!18992 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94465 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!390209)))

(declare-fun b!685213 () Bool)

(declare-fun e!390210 () Bool)

(assert (=> b!685213 (= e!390209 e!390210)))

(declare-fun res!450626 () Bool)

(assert (=> b!685213 (=> (not res!450626) (not e!390210))))

(assert (=> b!685213 (= res!450626 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19361 a!3626)))))

(declare-fun b!685214 () Bool)

(assert (=> b!685214 (= e!390210 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94465 (not res!450625)) b!685213))

(assert (= (and b!685213 res!450626) b!685214))

(declare-fun m!649451 () Bool)

(assert (=> d!94465 m!649451))

(declare-fun m!649453 () Bool)

(assert (=> b!685214 m!649453))

(assert (=> b!685157 d!94465))

(declare-fun d!94473 () Bool)

(assert (=> d!94473 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314587 () Unit!24127)

(declare-fun choose!13 (array!39626 (_ BitVec 64) (_ BitVec 32)) Unit!24127)

(assert (=> d!94473 (= lt!314587 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94473 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94473 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!314587)))

(declare-fun bs!20089 () Bool)

(assert (= bs!20089 d!94473))

(assert (=> bs!20089 m!649375))

(declare-fun m!649459 () Bool)

(assert (=> bs!20089 m!649459))

(assert (=> b!685146 d!94473))

(declare-fun d!94477 () Bool)

(declare-fun res!450643 () Bool)

(declare-fun e!390232 () Bool)

(assert (=> d!94477 (=> res!450643 e!390232)))

(assert (=> d!94477 (= res!450643 (is-Nil!13030 acc!681))))

(assert (=> d!94477 (= (noDuplicate!857 acc!681) e!390232)))

(declare-fun b!685239 () Bool)

(declare-fun e!390233 () Bool)

(assert (=> b!685239 (= e!390232 e!390233)))

(declare-fun res!450644 () Bool)

(assert (=> b!685239 (=> (not res!450644) (not e!390233))))

(assert (=> b!685239 (= res!450644 (not (contains!3610 (t!19282 acc!681) (h!14074 acc!681))))))

(declare-fun b!685240 () Bool)

(assert (=> b!685240 (= e!390233 (noDuplicate!857 (t!19282 acc!681)))))

(assert (= (and d!94477 (not res!450643)) b!685239))

(assert (= (and b!685239 res!450644) b!685240))

(declare-fun m!649467 () Bool)

(assert (=> b!685239 m!649467))

(declare-fun m!649469 () Bool)

(assert (=> b!685240 m!649469))

(assert (=> b!685158 d!94477))

(declare-fun d!94483 () Bool)

(declare-fun lt!314594 () Bool)

(assert (=> d!94483 (= lt!314594 (member k!2843 (content!289 acc!681)))))

(declare-fun e!390238 () Bool)

(assert (=> d!94483 (= lt!314594 e!390238)))

(declare-fun res!450649 () Bool)

(assert (=> d!94483 (=> (not res!450649) (not e!390238))))

(assert (=> d!94483 (= res!450649 (is-Cons!13029 acc!681))))

(assert (=> d!94483 (= (contains!3610 acc!681 k!2843) lt!314594)))

(declare-fun b!685245 () Bool)

(declare-fun e!390239 () Bool)

(assert (=> b!685245 (= e!390238 e!390239)))

(declare-fun res!450650 () Bool)

(assert (=> b!685245 (=> res!450650 e!390239)))

(assert (=> b!685245 (= res!450650 (= (h!14074 acc!681) k!2843))))

(declare-fun b!685246 () Bool)

(assert (=> b!685246 (= e!390239 (contains!3610 (t!19282 acc!681) k!2843))))

(assert (= (and d!94483 res!450649) b!685245))

(assert (= (and b!685245 (not res!450650)) b!685246))

(declare-fun m!649475 () Bool)

(assert (=> d!94483 m!649475))

(declare-fun m!649477 () Bool)

(assert (=> d!94483 m!649477))

(declare-fun m!649479 () Bool)

(assert (=> b!685246 m!649479))

(assert (=> b!685159 d!94483))

(declare-fun b!685279 () Bool)

(declare-fun e!390268 () Bool)

(assert (=> b!685279 (= e!390268 (subseq!196 acc!681 (t!19282 acc!681)))))

(declare-fun b!685277 () Bool)

(declare-fun e!390270 () Bool)

(assert (=> b!685277 (= e!390270 e!390268)))

(declare-fun res!450679 () Bool)

(assert (=> b!685277 (=> res!450679 e!390268)))

(declare-fun e!390267 () Bool)

(assert (=> b!685277 (= res!450679 e!390267)))

(declare-fun res!450677 () Bool)

(assert (=> b!685277 (=> (not res!450677) (not e!390267))))

(assert (=> b!685277 (= res!450677 (= (h!14074 acc!681) (h!14074 acc!681)))))

(declare-fun b!685278 () Bool)

(assert (=> b!685278 (= e!390267 (subseq!196 (t!19282 acc!681) (t!19282 acc!681)))))

(declare-fun d!94487 () Bool)

(declare-fun res!450678 () Bool)

(declare-fun e!390269 () Bool)

(assert (=> d!94487 (=> res!450678 e!390269)))

(assert (=> d!94487 (= res!450678 (is-Nil!13030 acc!681))))

(assert (=> d!94487 (= (subseq!196 acc!681 acc!681) e!390269)))

(declare-fun b!685276 () Bool)

(assert (=> b!685276 (= e!390269 e!390270)))

(declare-fun res!450676 () Bool)

(assert (=> b!685276 (=> (not res!450676) (not e!390270))))

(assert (=> b!685276 (= res!450676 (is-Cons!13029 acc!681))))

(assert (= (and d!94487 (not res!450678)) b!685276))

(assert (= (and b!685276 res!450676) b!685277))

(assert (= (and b!685277 res!450677) b!685278))

(assert (= (and b!685277 (not res!450679)) b!685279))

(declare-fun m!649523 () Bool)

(assert (=> b!685279 m!649523))

(declare-fun m!649525 () Bool)

(assert (=> b!685278 m!649525))

(assert (=> b!685148 d!94487))

(declare-fun d!94509 () Bool)

(declare-fun res!450680 () Bool)

(declare-fun e!390271 () Bool)

(assert (=> d!94509 (=> res!450680 e!390271)))

(assert (=> d!94509 (= res!450680 (= (select (arr!18992 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94509 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390271)))

(declare-fun b!685280 () Bool)

(declare-fun e!390272 () Bool)

(assert (=> b!685280 (= e!390271 e!390272)))

(declare-fun res!450681 () Bool)

(assert (=> b!685280 (=> (not res!450681) (not e!390272))))

(assert (=> b!685280 (= res!450681 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19361 a!3626)))))

(declare-fun b!685281 () Bool)

(assert (=> b!685281 (= e!390272 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94509 (not res!450680)) b!685280))

(assert (= (and b!685280 res!450681) b!685281))

(declare-fun m!649529 () Bool)

(assert (=> d!94509 m!649529))

(declare-fun m!649531 () Bool)

(assert (=> b!685281 m!649531))

(assert (=> b!685148 d!94509))

(declare-fun d!94515 () Bool)

(assert (=> d!94515 (= (-!161 ($colon$colon!361 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!314609 () Unit!24127)

(declare-fun choose!16 ((_ BitVec 64) List!13033) Unit!24127)

(assert (=> d!94515 (= lt!314609 (choose!16 k!2843 acc!681))))

(assert (=> d!94515 (not (contains!3610 acc!681 k!2843))))

(assert (=> d!94515 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!314609)))

(declare-fun bs!20094 () Bool)

(assert (= bs!20094 d!94515))

(assert (=> bs!20094 m!649395))

(assert (=> bs!20094 m!649395))

(declare-fun m!649533 () Bool)

(assert (=> bs!20094 m!649533))

(declare-fun m!649535 () Bool)

(assert (=> bs!20094 m!649535))

(assert (=> bs!20094 m!649381))

(assert (=> b!685148 d!94515))

(declare-fun b!685326 () Bool)

(declare-fun e!390307 () Bool)

(declare-fun lt!314624 () List!13033)

(assert (=> b!685326 (= e!390307 (= (content!289 lt!314624) (setminus (content!289 lt!314573) (insert k!2843 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun d!94519 () Bool)

(assert (=> d!94519 e!390307))

(declare-fun res!450700 () Bool)

(assert (=> d!94519 (=> (not res!450700) (not e!390307))))

(declare-fun size!19364 (List!13033) Int)

(assert (=> d!94519 (= res!450700 (<= (size!19364 lt!314624) (size!19364 lt!314573)))))

(declare-fun e!390308 () List!13033)

(assert (=> d!94519 (= lt!314624 e!390308)))

(declare-fun c!77681 () Bool)

(assert (=> d!94519 (= c!77681 (is-Cons!13029 lt!314573))))

(assert (=> d!94519 (= (-!161 lt!314573 k!2843) lt!314624)))

(declare-fun bm!34061 () Bool)

(declare-fun call!34064 () List!13033)

(assert (=> bm!34061 (= call!34064 (-!161 (t!19282 lt!314573) k!2843))))

(declare-fun b!685327 () Bool)

(declare-fun e!390306 () List!13033)

(assert (=> b!685327 (= e!390308 e!390306)))

(declare-fun c!77680 () Bool)

(assert (=> b!685327 (= c!77680 (= k!2843 (h!14074 lt!314573)))))

(declare-fun b!685328 () Bool)

(assert (=> b!685328 (= e!390306 (Cons!13029 (h!14074 lt!314573) call!34064))))

(declare-fun b!685329 () Bool)

(assert (=> b!685329 (= e!390308 Nil!13030)))

(declare-fun b!685330 () Bool)

(assert (=> b!685330 (= e!390306 call!34064)))

(assert (= (and d!94519 c!77681) b!685327))

(assert (= (and d!94519 (not c!77681)) b!685329))

(assert (= (and b!685327 c!77680) b!685330))

(assert (= (and b!685327 (not c!77680)) b!685328))

(assert (= (or b!685330 b!685328) bm!34061))

(assert (= (and d!94519 res!450700) b!685326))

(declare-fun m!649563 () Bool)

(assert (=> b!685326 m!649563))

(assert (=> b!685326 m!649435))

(declare-fun m!649565 () Bool)

(assert (=> b!685326 m!649565))

(declare-fun m!649567 () Bool)

(assert (=> d!94519 m!649567))

(declare-fun m!649569 () Bool)

(assert (=> d!94519 m!649569))

(declare-fun m!649571 () Bool)

(assert (=> bm!34061 m!649571))

(assert (=> b!685148 d!94519))

(declare-fun d!94535 () Bool)

(declare-fun res!450703 () Bool)

(declare-fun e!390311 () Bool)

(assert (=> d!94535 (=> res!450703 e!390311)))

(assert (=> d!94535 (= res!450703 (= (select (arr!18992 (array!39627 (store (arr!18992 a!3626) i!1382 k!2843) (size!19361 a!3626))) from!3004) k!2843))))

(assert (=> d!94535 (= (arrayContainsKey!0 (array!39627 (store (arr!18992 a!3626) i!1382 k!2843) (size!19361 a!3626)) k!2843 from!3004) e!390311)))

(declare-fun b!685333 () Bool)

(declare-fun e!390312 () Bool)

(assert (=> b!685333 (= e!390311 e!390312)))

(declare-fun res!450704 () Bool)

(assert (=> b!685333 (=> (not res!450704) (not e!390312))))

(assert (=> b!685333 (= res!450704 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19361 (array!39627 (store (arr!18992 a!3626) i!1382 k!2843) (size!19361 a!3626)))))))

(declare-fun b!685334 () Bool)

(assert (=> b!685334 (= e!390312 (arrayContainsKey!0 (array!39627 (store (arr!18992 a!3626) i!1382 k!2843) (size!19361 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94535 (not res!450703)) b!685333))

(assert (= (and b!685333 res!450704) b!685334))

(declare-fun m!649579 () Bool)

(assert (=> d!94535 m!649579))

(declare-fun m!649581 () Bool)

(assert (=> b!685334 m!649581))

(assert (=> b!685148 d!94535))

(declare-fun d!94539 () Bool)

(assert (=> d!94539 (subseq!196 acc!681 acc!681)))

(declare-fun lt!314629 () Unit!24127)

(declare-fun choose!36 (List!13033) Unit!24127)

(assert (=> d!94539 (= lt!314629 (choose!36 acc!681))))

(assert (=> d!94539 (= (lemmaListSubSeqRefl!0 acc!681) lt!314629)))

(declare-fun bs!20098 () Bool)

(assert (= bs!20098 d!94539))

(assert (=> bs!20098 m!649405))

(declare-fun m!649597 () Bool)

(assert (=> bs!20098 m!649597))

(assert (=> b!685148 d!94539))

(declare-fun d!94549 () Bool)

(assert (=> d!94549 (= (validKeyInArray!0 (select (arr!18992 a!3626) from!3004)) (and (not (= (select (arr!18992 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18992 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685148 d!94549))

(declare-fun d!94555 () Bool)

(assert (=> d!94555 (= ($colon$colon!361 acc!681 k!2843) (Cons!13029 k!2843 acc!681))))

(assert (=> b!685148 d!94555))

(declare-fun b!685388 () Bool)

(declare-fun e!390361 () Bool)

(declare-fun e!390359 () Bool)

(assert (=> b!685388 (= e!390361 e!390359)))

(declare-fun c!77689 () Bool)

(assert (=> b!685388 (= c!77689 (validKeyInArray!0 (select (arr!18992 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34069 () Bool)

(declare-fun call!34072 () Bool)

(assert (=> bm!34069 (= call!34072 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77689 (Cons!13029 (select (arr!18992 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!685389 () Bool)

(assert (=> b!685389 (= e!390359 call!34072)))

(declare-fun d!94557 () Bool)

(declare-fun res!450745 () Bool)

(declare-fun e!390360 () Bool)

(assert (=> d!94557 (=> res!450745 e!390360)))

(assert (=> d!94557 (= res!450745 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19361 a!3626)))))

(assert (=> d!94557 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390360)))

(declare-fun b!685390 () Bool)

(assert (=> b!685390 (= e!390359 call!34072)))

(declare-fun b!685391 () Bool)

(declare-fun e!390362 () Bool)

(assert (=> b!685391 (= e!390362 (contains!3610 acc!681 (select (arr!18992 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685392 () Bool)

(assert (=> b!685392 (= e!390360 e!390361)))

(declare-fun res!450746 () Bool)

(assert (=> b!685392 (=> (not res!450746) (not e!390361))))

(assert (=> b!685392 (= res!450746 (not e!390362))))

(declare-fun res!450744 () Bool)

(assert (=> b!685392 (=> (not res!450744) (not e!390362))))

(assert (=> b!685392 (= res!450744 (validKeyInArray!0 (select (arr!18992 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94557 (not res!450745)) b!685392))

(assert (= (and b!685392 res!450744) b!685391))

(assert (= (and b!685392 res!450746) b!685388))

(assert (= (and b!685388 c!77689) b!685390))

(assert (= (and b!685388 (not c!77689)) b!685389))

(assert (= (or b!685390 b!685389) bm!34069))

(assert (=> b!685388 m!649529))

(assert (=> b!685388 m!649529))

(declare-fun m!649629 () Bool)

(assert (=> b!685388 m!649629))

(assert (=> bm!34069 m!649529))

(declare-fun m!649631 () Bool)

(assert (=> bm!34069 m!649631))

(assert (=> b!685391 m!649529))

(assert (=> b!685391 m!649529))

(declare-fun m!649633 () Bool)

(assert (=> b!685391 m!649633))

(assert (=> b!685392 m!649529))

(assert (=> b!685392 m!649529))

(assert (=> b!685392 m!649629))

(assert (=> b!685148 d!94557))

(declare-fun d!94569 () Bool)

(declare-fun res!450747 () Bool)

(declare-fun e!390363 () Bool)

(assert (=> d!94569 (=> res!450747 e!390363)))

(assert (=> d!94569 (= res!450747 (is-Nil!13030 lt!314573))))

(assert (=> d!94569 (= (noDuplicate!857 lt!314573) e!390363)))

(declare-fun b!685393 () Bool)

(declare-fun e!390364 () Bool)

(assert (=> b!685393 (= e!390363 e!390364)))

(declare-fun res!450748 () Bool)

(assert (=> b!685393 (=> (not res!450748) (not e!390364))))

(assert (=> b!685393 (= res!450748 (not (contains!3610 (t!19282 lt!314573) (h!14074 lt!314573))))))

(declare-fun b!685394 () Bool)

(assert (=> b!685394 (= e!390364 (noDuplicate!857 (t!19282 lt!314573)))))

(assert (= (and d!94569 (not res!450747)) b!685393))

(assert (= (and b!685393 res!450748) b!685394))

(declare-fun m!649635 () Bool)

(assert (=> b!685393 m!649635))

(declare-fun m!649637 () Bool)

(assert (=> b!685394 m!649637))

(assert (=> b!685161 d!94569))

(declare-fun b!685395 () Bool)

(declare-fun e!390367 () Bool)

(declare-fun e!390365 () Bool)

(assert (=> b!685395 (= e!390367 e!390365)))

(declare-fun c!77690 () Bool)

(assert (=> b!685395 (= c!77690 (validKeyInArray!0 (select (arr!18992 a!3626) from!3004)))))

(declare-fun call!34073 () Bool)

(declare-fun bm!34070 () Bool)

(assert (=> bm!34070 (= call!34073 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77690 (Cons!13029 (select (arr!18992 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!685396 () Bool)

(assert (=> b!685396 (= e!390365 call!34073)))

(declare-fun d!94571 () Bool)

(declare-fun res!450750 () Bool)

(declare-fun e!390366 () Bool)

(assert (=> d!94571 (=> res!450750 e!390366)))

(assert (=> d!94571 (= res!450750 (bvsge from!3004 (size!19361 a!3626)))))

(assert (=> d!94571 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390366)))

(declare-fun b!685397 () Bool)

(assert (=> b!685397 (= e!390365 call!34073)))

(declare-fun e!390368 () Bool)

(declare-fun b!685398 () Bool)

(assert (=> b!685398 (= e!390368 (contains!3610 acc!681 (select (arr!18992 a!3626) from!3004)))))

(declare-fun b!685399 () Bool)

(assert (=> b!685399 (= e!390366 e!390367)))

(declare-fun res!450751 () Bool)

(assert (=> b!685399 (=> (not res!450751) (not e!390367))))

(assert (=> b!685399 (= res!450751 (not e!390368))))

(declare-fun res!450749 () Bool)

(assert (=> b!685399 (=> (not res!450749) (not e!390368))))

(assert (=> b!685399 (= res!450749 (validKeyInArray!0 (select (arr!18992 a!3626) from!3004)))))

(assert (= (and d!94571 (not res!450750)) b!685399))

(assert (= (and b!685399 res!450749) b!685398))

(assert (= (and b!685399 res!450751) b!685395))

(assert (= (and b!685395 c!77690) b!685397))

(assert (= (and b!685395 (not c!77690)) b!685396))

(assert (= (or b!685397 b!685396) bm!34070))

(assert (=> b!685395 m!649387))

(assert (=> b!685395 m!649387))

(assert (=> b!685395 m!649397))

(assert (=> bm!34070 m!649387))

(declare-fun m!649639 () Bool)

(assert (=> bm!34070 m!649639))

(assert (=> b!685398 m!649387))

(assert (=> b!685398 m!649387))

(declare-fun m!649641 () Bool)

(assert (=> b!685398 m!649641))

(assert (=> b!685399 m!649387))

(assert (=> b!685399 m!649387))

(assert (=> b!685399 m!649397))

(assert (=> b!685150 d!94571))

(declare-fun d!94573 () Bool)

(declare-fun lt!314636 () Bool)

(assert (=> d!94573 (= lt!314636 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!289 acc!681)))))

(declare-fun e!390369 () Bool)

(assert (=> d!94573 (= lt!314636 e!390369)))

(declare-fun res!450752 () Bool)

(assert (=> d!94573 (=> (not res!450752) (not e!390369))))

(assert (=> d!94573 (= res!450752 (is-Cons!13029 acc!681))))

(assert (=> d!94573 (= (contains!3610 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314636)))

(declare-fun b!685400 () Bool)

(declare-fun e!390370 () Bool)

(assert (=> b!685400 (= e!390369 e!390370)))

(declare-fun res!450753 () Bool)

(assert (=> b!685400 (=> res!450753 e!390370)))

(assert (=> b!685400 (= res!450753 (= (h!14074 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685401 () Bool)

(assert (=> b!685401 (= e!390370 (contains!3610 (t!19282 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94573 res!450752) b!685400))

(assert (= (and b!685400 (not res!450753)) b!685401))

(assert (=> d!94573 m!649475))

(declare-fun m!649643 () Bool)

(assert (=> d!94573 m!649643))

(declare-fun m!649645 () Bool)

(assert (=> b!685401 m!649645))

(assert (=> b!685162 d!94573))

(assert (=> b!685163 d!94483))

(declare-fun d!94575 () Bool)

(assert (=> d!94575 (= ($colon$colon!361 acc!681 (select (arr!18992 a!3626) from!3004)) (Cons!13029 (select (arr!18992 a!3626) from!3004) acc!681))))

(assert (=> b!685152 d!94575))

(assert (=> b!685152 d!94487))

(declare-fun d!94577 () Bool)

(assert (=> d!94577 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314640 () Unit!24127)

(declare-fun choose!80 (array!39626 List!13033 List!13033 (_ BitVec 32)) Unit!24127)

(assert (=> d!94577 (= lt!314640 (choose!80 a!3626 ($colon$colon!361 acc!681 (select (arr!18992 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94577 (bvslt (size!19361 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94577 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!361 acc!681 (select (arr!18992 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314640)))

(declare-fun bs!20100 () Bool)

(assert (= bs!20100 d!94577))

(assert (=> bs!20100 m!649385))

(assert (=> bs!20100 m!649409))

(declare-fun m!649659 () Bool)

(assert (=> bs!20100 m!649659))

(assert (=> b!685152 d!94577))

(assert (=> b!685152 d!94539))

(assert (=> b!685152 d!94557))

(declare-fun d!94589 () Bool)

(assert (=> d!94589 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

