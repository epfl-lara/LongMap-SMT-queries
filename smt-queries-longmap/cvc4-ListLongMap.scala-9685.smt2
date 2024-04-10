; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114300 () Bool)

(assert start!114300)

(declare-fun b!1357525 () Bool)

(declare-fun res!902262 () Bool)

(declare-fun e!770455 () Bool)

(assert (=> b!1357525 (=> (not res!902262) (not e!770455))))

(declare-datatypes ((array!92437 0))(
  ( (array!92438 (arr!44665 (Array (_ BitVec 32) (_ BitVec 64))) (size!45215 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92437)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((List!31706 0))(
  ( (Nil!31703) (Cons!31702 (h!32911 (_ BitVec 64)) (t!46367 List!31706)) )
))
(declare-fun acc!759 () List!31706)

(declare-fun arrayNoDuplicates!0 (array!92437 (_ BitVec 32) List!31706) Bool)

(assert (=> b!1357525 (= res!902262 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357526 () Bool)

(declare-fun res!902263 () Bool)

(assert (=> b!1357526 (=> (not res!902263) (not e!770455))))

(declare-fun contains!9415 (List!31706 (_ BitVec 64)) Bool)

(assert (=> b!1357526 (= res!902263 (not (contains!9415 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357527 () Bool)

(declare-fun res!902261 () Bool)

(assert (=> b!1357527 (=> (not res!902261) (not e!770455))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357527 (= res!902261 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45215 a!3742))))))

(declare-fun b!1357528 () Bool)

(declare-fun e!770458 () Bool)

(declare-fun e!770456 () Bool)

(assert (=> b!1357528 (= e!770458 e!770456)))

(declare-fun res!902264 () Bool)

(assert (=> b!1357528 (=> (not res!902264) (not e!770456))))

(declare-fun lt!599173 () List!31706)

(assert (=> b!1357528 (= res!902264 (not (contains!9415 lt!599173 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357530 () Bool)

(assert (=> b!1357530 (= e!770455 (not e!770458))))

(declare-fun res!902260 () Bool)

(assert (=> b!1357530 (=> res!902260 e!770458)))

(assert (=> b!1357530 (= res!902260 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!820 (List!31706 (_ BitVec 64)) List!31706)

(assert (=> b!1357530 (= lt!599173 ($colon$colon!820 acc!759 (select (arr!44665 a!3742) from!3120)))))

(declare-fun subseq!817 (List!31706 List!31706) Bool)

(assert (=> b!1357530 (subseq!817 acc!759 acc!759)))

(declare-datatypes ((Unit!44665 0))(
  ( (Unit!44666) )
))
(declare-fun lt!599172 () Unit!44665)

(declare-fun lemmaListSubSeqRefl!0 (List!31706) Unit!44665)

(assert (=> b!1357530 (= lt!599172 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357531 () Bool)

(declare-fun res!902269 () Bool)

(assert (=> b!1357531 (=> (not res!902269) (not e!770455))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357531 (= res!902269 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357532 () Bool)

(declare-fun res!902265 () Bool)

(assert (=> b!1357532 (=> (not res!902265) (not e!770455))))

(assert (=> b!1357532 (= res!902265 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45215 a!3742)))))

(declare-fun b!1357533 () Bool)

(assert (=> b!1357533 (= e!770456 (not (contains!9415 lt!599173 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357534 () Bool)

(declare-fun res!902258 () Bool)

(assert (=> b!1357534 (=> (not res!902258) (not e!770455))))

(assert (=> b!1357534 (= res!902258 (not (contains!9415 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357535 () Bool)

(declare-fun res!902267 () Bool)

(assert (=> b!1357535 (=> (not res!902267) (not e!770455))))

(declare-fun noDuplicate!2272 (List!31706) Bool)

(assert (=> b!1357535 (= res!902267 (noDuplicate!2272 acc!759))))

(declare-fun b!1357536 () Bool)

(declare-fun res!902268 () Bool)

(assert (=> b!1357536 (=> res!902268 e!770458)))

(assert (=> b!1357536 (= res!902268 (not (noDuplicate!2272 lt!599173)))))

(declare-fun b!1357537 () Bool)

(declare-fun res!902257 () Bool)

(assert (=> b!1357537 (=> (not res!902257) (not e!770455))))

(assert (=> b!1357537 (= res!902257 (validKeyInArray!0 (select (arr!44665 a!3742) from!3120)))))

(declare-fun b!1357529 () Bool)

(declare-fun res!902259 () Bool)

(assert (=> b!1357529 (=> (not res!902259) (not e!770455))))

(assert (=> b!1357529 (= res!902259 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31703))))

(declare-fun res!902266 () Bool)

(assert (=> start!114300 (=> (not res!902266) (not e!770455))))

(assert (=> start!114300 (= res!902266 (and (bvslt (size!45215 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45215 a!3742))))))

(assert (=> start!114300 e!770455))

(assert (=> start!114300 true))

(declare-fun array_inv!33693 (array!92437) Bool)

(assert (=> start!114300 (array_inv!33693 a!3742)))

(assert (= (and start!114300 res!902266) b!1357535))

(assert (= (and b!1357535 res!902267) b!1357526))

(assert (= (and b!1357526 res!902263) b!1357534))

(assert (= (and b!1357534 res!902258) b!1357529))

(assert (= (and b!1357529 res!902259) b!1357525))

(assert (= (and b!1357525 res!902262) b!1357527))

(assert (= (and b!1357527 res!902261) b!1357531))

(assert (= (and b!1357531 res!902269) b!1357532))

(assert (= (and b!1357532 res!902265) b!1357537))

(assert (= (and b!1357537 res!902257) b!1357530))

(assert (= (and b!1357530 (not res!902260)) b!1357536))

(assert (= (and b!1357536 (not res!902268)) b!1357528))

(assert (= (and b!1357528 res!902264) b!1357533))

(declare-fun m!1243243 () Bool)

(assert (=> b!1357530 m!1243243))

(assert (=> b!1357530 m!1243243))

(declare-fun m!1243245 () Bool)

(assert (=> b!1357530 m!1243245))

(declare-fun m!1243247 () Bool)

(assert (=> b!1357530 m!1243247))

(declare-fun m!1243249 () Bool)

(assert (=> b!1357530 m!1243249))

(declare-fun m!1243251 () Bool)

(assert (=> b!1357535 m!1243251))

(declare-fun m!1243253 () Bool)

(assert (=> b!1357533 m!1243253))

(declare-fun m!1243255 () Bool)

(assert (=> b!1357536 m!1243255))

(declare-fun m!1243257 () Bool)

(assert (=> b!1357529 m!1243257))

(declare-fun m!1243259 () Bool)

(assert (=> b!1357531 m!1243259))

(declare-fun m!1243261 () Bool)

(assert (=> b!1357528 m!1243261))

(declare-fun m!1243263 () Bool)

(assert (=> b!1357526 m!1243263))

(assert (=> b!1357537 m!1243243))

(assert (=> b!1357537 m!1243243))

(declare-fun m!1243265 () Bool)

(assert (=> b!1357537 m!1243265))

(declare-fun m!1243267 () Bool)

(assert (=> b!1357525 m!1243267))

(declare-fun m!1243269 () Bool)

(assert (=> start!114300 m!1243269))

(declare-fun m!1243271 () Bool)

(assert (=> b!1357534 m!1243271))

(push 1)

(assert (not b!1357534))

(assert (not b!1357529))

(assert (not b!1357533))

(assert (not b!1357526))

(assert (not b!1357530))

(assert (not b!1357537))

(assert (not start!114300))

(assert (not b!1357535))

(assert (not b!1357531))

(assert (not b!1357528))

(assert (not b!1357536))

(assert (not b!1357525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145181 () Bool)

(declare-fun res!902310 () Bool)

(declare-fun e!770503 () Bool)

(assert (=> d!145181 (=> res!902310 e!770503)))

(assert (=> d!145181 (= res!902310 (is-Nil!31703 acc!759))))

(assert (=> d!145181 (= (noDuplicate!2272 acc!759) e!770503)))

(declare-fun b!1357586 () Bool)

(declare-fun e!770506 () Bool)

(assert (=> b!1357586 (= e!770503 e!770506)))

(declare-fun res!902311 () Bool)

(assert (=> b!1357586 (=> (not res!902311) (not e!770506))))

(assert (=> b!1357586 (= res!902311 (not (contains!9415 (t!46367 acc!759) (h!32911 acc!759))))))

(declare-fun b!1357587 () Bool)

(assert (=> b!1357587 (= e!770506 (noDuplicate!2272 (t!46367 acc!759)))))

(assert (= (and d!145181 (not res!902310)) b!1357586))

(assert (= (and b!1357586 res!902311) b!1357587))

(declare-fun m!1243307 () Bool)

(assert (=> b!1357586 m!1243307))

(declare-fun m!1243309 () Bool)

(assert (=> b!1357587 m!1243309))

(assert (=> b!1357535 d!145181))

(declare-fun d!145187 () Bool)

(declare-fun res!902316 () Bool)

(declare-fun e!770509 () Bool)

(assert (=> d!145187 (=> res!902316 e!770509)))

(assert (=> d!145187 (= res!902316 (is-Nil!31703 lt!599173))))

(assert (=> d!145187 (= (noDuplicate!2272 lt!599173) e!770509)))

(declare-fun b!1357592 () Bool)

(declare-fun e!770510 () Bool)

(assert (=> b!1357592 (= e!770509 e!770510)))

(declare-fun res!902317 () Bool)

(assert (=> b!1357592 (=> (not res!902317) (not e!770510))))

(assert (=> b!1357592 (= res!902317 (not (contains!9415 (t!46367 lt!599173) (h!32911 lt!599173))))))

(declare-fun b!1357593 () Bool)

(assert (=> b!1357593 (= e!770510 (noDuplicate!2272 (t!46367 lt!599173)))))

(assert (= (and d!145187 (not res!902316)) b!1357592))

(assert (= (and b!1357592 res!902317) b!1357593))

(declare-fun m!1243315 () Bool)

(assert (=> b!1357592 m!1243315))

(declare-fun m!1243317 () Bool)

(assert (=> b!1357593 m!1243317))

(assert (=> b!1357536 d!145187))

(declare-fun b!1357628 () Bool)

(declare-fun e!770545 () Bool)

(declare-fun call!65259 () Bool)

(assert (=> b!1357628 (= e!770545 call!65259)))

(declare-fun b!1357629 () Bool)

(declare-fun e!770546 () Bool)

(assert (=> b!1357629 (= e!770546 (contains!9415 acc!759 (select (arr!44665 a!3742) from!3120)))))

(declare-fun b!1357630 () Bool)

(declare-fun e!770544 () Bool)

(declare-fun e!770543 () Bool)

(assert (=> b!1357630 (= e!770544 e!770543)))

(declare-fun res!902349 () Bool)

(assert (=> b!1357630 (=> (not res!902349) (not e!770543))))

(assert (=> b!1357630 (= res!902349 (not e!770546))))

(declare-fun res!902350 () Bool)

(assert (=> b!1357630 (=> (not res!902350) (not e!770546))))

(assert (=> b!1357630 (= res!902350 (validKeyInArray!0 (select (arr!44665 a!3742) from!3120)))))

(declare-fun d!145191 () Bool)

(declare-fun res!902348 () Bool)

(assert (=> d!145191 (=> res!902348 e!770544)))

(assert (=> d!145191 (= res!902348 (bvsge from!3120 (size!45215 a!3742)))))

(assert (=> d!145191 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770544)))

(declare-fun b!1357631 () Bool)

(assert (=> b!1357631 (= e!770545 call!65259)))

(declare-fun b!1357632 () Bool)

(assert (=> b!1357632 (= e!770543 e!770545)))

(declare-fun c!127080 () Bool)

(assert (=> b!1357632 (= c!127080 (validKeyInArray!0 (select (arr!44665 a!3742) from!3120)))))

(declare-fun bm!65256 () Bool)

(assert (=> bm!65256 (= call!65259 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127080 (Cons!31702 (select (arr!44665 a!3742) from!3120) acc!759) acc!759)))))

(assert (= (and d!145191 (not res!902348)) b!1357630))

(assert (= (and b!1357630 res!902350) b!1357629))

(assert (= (and b!1357630 res!902349) b!1357632))

(assert (= (and b!1357632 c!127080) b!1357631))

(assert (= (and b!1357632 (not c!127080)) b!1357628))

(assert (= (or b!1357631 b!1357628) bm!65256))

(assert (=> b!1357629 m!1243243))

(assert (=> b!1357629 m!1243243))

(declare-fun m!1243345 () Bool)

(assert (=> b!1357629 m!1243345))

(assert (=> b!1357630 m!1243243))

(assert (=> b!1357630 m!1243243))

(assert (=> b!1357630 m!1243265))

(assert (=> b!1357632 m!1243243))

(assert (=> b!1357632 m!1243243))

(assert (=> b!1357632 m!1243265))

(assert (=> bm!65256 m!1243243))

(declare-fun m!1243347 () Bool)

(assert (=> bm!65256 m!1243347))

(assert (=> b!1357525 d!145191))

(declare-fun d!145207 () Bool)

(declare-fun lt!599192 () Bool)

(declare-fun content!678 (List!31706) (Set (_ BitVec 64)))

(assert (=> d!145207 (= lt!599192 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!678 acc!759)))))

(declare-fun e!770559 () Bool)

(assert (=> d!145207 (= lt!599192 e!770559)))

(declare-fun res!902362 () Bool)

(assert (=> d!145207 (=> (not res!902362) (not e!770559))))

(assert (=> d!145207 (= res!902362 (is-Cons!31702 acc!759))))

(assert (=> d!145207 (= (contains!9415 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599192)))

(declare-fun b!1357647 () Bool)

(declare-fun e!770560 () Bool)

(assert (=> b!1357647 (= e!770559 e!770560)))

(declare-fun res!902361 () Bool)

(assert (=> b!1357647 (=> res!902361 e!770560)))

(assert (=> b!1357647 (= res!902361 (= (h!32911 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357648 () Bool)

(assert (=> b!1357648 (= e!770560 (contains!9415 (t!46367 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145207 res!902362) b!1357647))

(assert (= (and b!1357647 (not res!902361)) b!1357648))

(declare-fun m!1243349 () Bool)

(assert (=> d!145207 m!1243349))

(declare-fun m!1243351 () Bool)

(assert (=> d!145207 m!1243351))

(declare-fun m!1243353 () Bool)

(assert (=> b!1357648 m!1243353))

(assert (=> b!1357534 d!145207))

(declare-fun d!145209 () Bool)

(declare-fun lt!599193 () Bool)

(assert (=> d!145209 (= lt!599193 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!678 lt!599173)))))

