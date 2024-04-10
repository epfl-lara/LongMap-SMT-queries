; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7000 () Bool)

(assert start!7000)

(declare-fun res!26565 () Bool)

(declare-fun e!28764 () Bool)

(assert (=> start!7000 (=> (not res!26565) (not e!28764))))

(declare-datatypes ((array!3011 0))(
  ( (array!3012 (arr!1449 (Array (_ BitVec 32) (_ BitVec 64))) (size!1667 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3011)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7000 (= res!26565 (and (bvslt (size!1667 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1667 a!4412)) (= (size!1667 a!4412) size!30) (= a!4412 (array!3012 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1449 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1667 a!4412))))))

(assert (=> start!7000 e!28764))

(declare-fun array_inv!861 (array!3011) Bool)

(assert (=> start!7000 (array_inv!861 a!4412)))

(assert (=> start!7000 true))

(declare-fun b!45274 () Bool)

(declare-fun arrayCountValidKeys!0 (array!3011 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45274 (= e!28764 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (=> b!45274 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1267 0))(
  ( (Unit!1268) )
))
(declare-fun lt!20087 () Unit!1267)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!3011 (_ BitVec 32) (_ BitVec 32)) Unit!1267)

(assert (=> b!45274 (= lt!20087 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!7000 res!26565) b!45274))

(declare-fun m!39791 () Bool)

(assert (=> start!7000 m!39791))

(declare-fun m!39793 () Bool)

(assert (=> start!7000 m!39793))

(declare-fun m!39795 () Bool)

(assert (=> b!45274 m!39795))

(declare-fun m!39797 () Bool)

(assert (=> b!45274 m!39797))

(declare-fun m!39799 () Bool)

(assert (=> b!45274 m!39799))

(push 1)

(assert (not b!45274))

(assert (not start!7000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!45305 () Bool)

(declare-fun e!28791 () (_ BitVec 32))

(declare-fun call!3693 () (_ BitVec 32))

(assert (=> b!45305 (= e!28791 (bvadd #b00000000000000000000000000000001 call!3693))))

(declare-fun b!45306 () Bool)

(assert (=> b!45306 (= e!28791 call!3693)))

(declare-fun b!45307 () Bool)

(declare-fun e!28790 () (_ BitVec 32))

(assert (=> b!45307 (= e!28790 #b00000000000000000000000000000000)))

(declare-fun bm!3690 () Bool)

(assert (=> bm!3690 (= call!3693 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45308 () Bool)

(assert (=> b!45308 (= e!28790 e!28791)))

(declare-fun c!6088 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45308 (= c!6088 (validKeyInArray!0 (select (arr!1449 a!4412) i!1489)))))

(declare-fun d!8799 () Bool)

(declare-fun lt!20103 () (_ BitVec 32))

(assert (=> d!8799 (and (bvsge lt!20103 #b00000000000000000000000000000000) (bvsle lt!20103 (bvsub (size!1667 a!4412) i!1489)))))

(assert (=> d!8799 (= lt!20103 e!28790)))

(declare-fun c!6087 () Bool)

(assert (=> d!8799 (= c!6087 (bvsge i!1489 size!30))))

(assert (=> d!8799 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1667 a!4412)))))

(assert (=> d!8799 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20103)))

(assert (= (and d!8799 c!6087) b!45307))

(assert (= (and d!8799 (not c!6087)) b!45308))

(assert (= (and b!45308 c!6088) b!45305))

(assert (= (and b!45308 (not c!6088)) b!45306))

(assert (= (or b!45305 b!45306) bm!3690))

(declare-fun m!39833 () Bool)

(assert (=> bm!3690 m!39833))

(assert (=> b!45308 m!39791))

(assert (=> b!45308 m!39791))

(declare-fun m!39835 () Bool)

(assert (=> b!45308 m!39835))

(assert (=> b!45274 d!8799))

(declare-fun b!45317 () Bool)

(declare-fun e!28797 () (_ BitVec 32))

(declare-fun call!3694 () (_ BitVec 32))

(assert (=> b!45317 (= e!28797 (bvadd #b00000000000000000000000000000001 call!3694))))

(declare-fun b!45318 () Bool)

(assert (=> b!45318 (= e!28797 call!3694)))

(declare-fun b!45319 () Bool)

(declare-fun e!28796 () (_ BitVec 32))

(assert (=> b!45319 (= e!28796 #b00000000000000000000000000000000)))

(declare-fun bm!3691 () Bool)

(assert (=> bm!3691 (= call!3694 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45320 () Bool)

(assert (=> b!45320 (= e!28796 e!28797)))

(declare-fun c!6094 () Bool)

(assert (=> b!45320 (= c!6094 (validKeyInArray!0 (select (arr!1449 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(declare-fun d!8809 () Bool)

(declare-fun lt!20106 () (_ BitVec 32))

(assert (=> d!8809 (and (bvsge lt!20106 #b00000000000000000000000000000000) (bvsle lt!20106 (bvsub (size!1667 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(assert (=> d!8809 (= lt!20106 e!28796)))

(declare-fun c!6093 () Bool)

(assert (=> d!8809 (= c!6093 (bvsge (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8809 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle size!30 (size!1667 a!4412)))))

(assert (=> d!8809 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20106)))

(assert (= (and d!8809 c!6093) b!45319))

(assert (= (and d!8809 (not c!6093)) b!45320))

(assert (= (and b!45320 c!6094) b!45317))

(assert (= (and b!45320 (not c!6094)) b!45318))

(assert (= (or b!45317 b!45318) bm!3691))

(declare-fun m!39837 () Bool)

(assert (=> bm!3691 m!39837))

(declare-fun m!39839 () Bool)

(assert (=> b!45320 m!39839))

(assert (=> b!45320 m!39839))

(declare-fun m!39841 () Bool)

(assert (=> b!45320 m!39841))

(assert (=> b!45274 d!8809))

(declare-fun d!8811 () Bool)

(assert (=> d!8811 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-fun lt!20109 () Unit!1267)

(declare-fun choose!59 (array!3011 (_ BitVec 32) (_ BitVec 32)) Unit!1267)

(assert (=> d!8811 (= lt!20109 (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8811 (bvslt (size!1667 a!4412) #b01111111111111111111111111111111)))

(assert (=> d!8811 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20109)))

(declare-fun bs!2113 () Bool)

(assert (= bs!2113 d!8811))

(assert (=> bs!2113 m!39797))

(declare-fun m!39843 () Bool)

(assert (=> bs!2113 m!39843))

(assert (=> b!45274 d!8811))

(declare-fun d!8813 () Bool)

(assert (=> d!8813 (= (array_inv!861 a!4412) (bvsge (size!1667 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7000 d!8813))

(push 1)

(assert (not b!45320))

(assert (not bm!3691))

(assert (not b!45308))

(assert (not bm!3690))

(assert (not d!8811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

