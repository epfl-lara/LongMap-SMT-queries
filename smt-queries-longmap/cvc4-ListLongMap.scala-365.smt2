; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7004 () Bool)

(assert start!7004)

(declare-fun res!26571 () Bool)

(declare-fun e!28776 () Bool)

(assert (=> start!7004 (=> (not res!26571) (not e!28776))))

(declare-datatypes ((array!3015 0))(
  ( (array!3016 (arr!1451 (Array (_ BitVec 32) (_ BitVec 64))) (size!1669 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3015)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7004 (= res!26571 (and (bvslt (size!1669 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1669 a!4412)) (= (size!1669 a!4412) size!30) (= a!4412 (array!3016 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1451 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1669 a!4412))))))

(assert (=> start!7004 e!28776))

(declare-fun array_inv!863 (array!3015) Bool)

(assert (=> start!7004 (array_inv!863 a!4412)))

(assert (=> start!7004 true))

(declare-fun b!45280 () Bool)

(declare-fun arrayCountValidKeys!0 (array!3015 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45280 (= e!28776 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (=> b!45280 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1271 0))(
  ( (Unit!1272) )
))
(declare-fun lt!20093 () Unit!1271)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!3015 (_ BitVec 32) (_ BitVec 32)) Unit!1271)

(assert (=> b!45280 (= lt!20093 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!7004 res!26571) b!45280))

(declare-fun m!39811 () Bool)

(assert (=> start!7004 m!39811))

(declare-fun m!39813 () Bool)

(assert (=> start!7004 m!39813))

(declare-fun m!39815 () Bool)

(assert (=> b!45280 m!39815))

(declare-fun m!39817 () Bool)

(assert (=> b!45280 m!39817))

(declare-fun m!39819 () Bool)

(assert (=> b!45280 m!39819))

(push 1)

(assert (not b!45280))

(assert (not start!7004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!45321 () Bool)

(declare-fun e!28798 () (_ BitVec 32))

(declare-fun e!28799 () (_ BitVec 32))

(assert (=> b!45321 (= e!28798 e!28799)))

(declare-fun c!6095 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45321 (= c!6095 (validKeyInArray!0 (select (arr!1451 a!4412) i!1489)))))

(declare-fun d!8805 () Bool)

(declare-fun lt!20110 () (_ BitVec 32))

(assert (=> d!8805 (and (bvsge lt!20110 #b00000000000000000000000000000000) (bvsle lt!20110 (bvsub (size!1669 a!4412) i!1489)))))

(assert (=> d!8805 (= lt!20110 e!28798)))

(declare-fun c!6096 () Bool)

(assert (=> d!8805 (= c!6096 (bvsge i!1489 size!30))))

(assert (=> d!8805 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1669 a!4412)))))

(assert (=> d!8805 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20110)))

(declare-fun b!45322 () Bool)

(declare-fun call!3697 () (_ BitVec 32))

(assert (=> b!45322 (= e!28799 call!3697)))

(declare-fun bm!3694 () Bool)

(assert (=> bm!3694 (= call!3697 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45323 () Bool)

(assert (=> b!45323 (= e!28799 (bvadd #b00000000000000000000000000000001 call!3697))))

(declare-fun b!45324 () Bool)

(assert (=> b!45324 (= e!28798 #b00000000000000000000000000000000)))

(assert (= (and d!8805 c!6096) b!45324))

(assert (= (and d!8805 (not c!6096)) b!45321))

(assert (= (and b!45321 c!6095) b!45323))

(assert (= (and b!45321 (not c!6095)) b!45322))

(assert (= (or b!45323 b!45322) bm!3694))

(assert (=> b!45321 m!39811))

(assert (=> b!45321 m!39811))

(declare-fun m!39845 () Bool)

(assert (=> b!45321 m!39845))

(declare-fun m!39847 () Bool)

(assert (=> bm!3694 m!39847))

(assert (=> b!45280 d!8805))

(declare-fun b!45325 () Bool)

(declare-fun e!28800 () (_ BitVec 32))

(declare-fun e!28801 () (_ BitVec 32))

(assert (=> b!45325 (= e!28800 e!28801)))

(declare-fun c!6097 () Bool)

(assert (=> b!45325 (= c!6097 (validKeyInArray!0 (select (arr!1451 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(declare-fun d!8815 () Bool)

(declare-fun lt!20111 () (_ BitVec 32))

(assert (=> d!8815 (and (bvsge lt!20111 #b00000000000000000000000000000000) (bvsle lt!20111 (bvsub (size!1669 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(assert (=> d!8815 (= lt!20111 e!28800)))

(declare-fun c!6098 () Bool)

(assert (=> d!8815 (= c!6098 (bvsge (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8815 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle size!30 (size!1669 a!4412)))))

(assert (=> d!8815 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20111)))

(declare-fun b!45326 () Bool)

(declare-fun call!3698 () (_ BitVec 32))

(assert (=> b!45326 (= e!28801 call!3698)))

(declare-fun bm!3695 () Bool)

(assert (=> bm!3695 (= call!3698 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45327 () Bool)

(assert (=> b!45327 (= e!28801 (bvadd #b00000000000000000000000000000001 call!3698))))

(declare-fun b!45328 () Bool)

(assert (=> b!45328 (= e!28800 #b00000000000000000000000000000000)))

(assert (= (and d!8815 c!6098) b!45328))

(assert (= (and d!8815 (not c!6098)) b!45325))

(assert (= (and b!45325 c!6097) b!45327))

(assert (= (and b!45325 (not c!6097)) b!45326))

(assert (= (or b!45327 b!45326) bm!3695))

(declare-fun m!39849 () Bool)

(assert (=> b!45325 m!39849))

(assert (=> b!45325 m!39849))

(declare-fun m!39851 () Bool)

(assert (=> b!45325 m!39851))

(declare-fun m!39853 () Bool)

(assert (=> bm!3695 m!39853))

(assert (=> b!45280 d!8815))

(declare-fun d!8817 () Bool)

(assert (=> d!8817 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-fun lt!20114 () Unit!1271)

(declare-fun choose!59 (array!3015 (_ BitVec 32) (_ BitVec 32)) Unit!1271)

(assert (=> d!8817 (= lt!20114 (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8817 (bvslt (size!1669 a!4412) #b01111111111111111111111111111111)))

(assert (=> d!8817 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20114)))

(declare-fun bs!2114 () Bool)

(assert (= bs!2114 d!8817))

(assert (=> bs!2114 m!39817))

(declare-fun m!39855 () Bool)

(assert (=> bs!2114 m!39855))

(assert (=> b!45280 d!8817))

(declare-fun d!8819 () Bool)

(assert (=> d!8819 (= (array_inv!863 a!4412) (bvsge (size!1669 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7004 d!8819))

(push 1)

(assert (not b!45321))

(assert (not d!8817))

(assert (not b!45325))

(assert (not bm!3694))

(assert (not bm!3695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

