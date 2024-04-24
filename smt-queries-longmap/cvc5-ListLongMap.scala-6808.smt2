; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85812 () Bool)

(assert start!85812)

(declare-fun b!995205 () Bool)

(declare-fun res!665165 () Bool)

(declare-fun e!561711 () Bool)

(assert (=> b!995205 (=> (not res!665165) (not e!561711))))

(declare-datatypes ((List!20983 0))(
  ( (Nil!20980) (Cons!20979 (h!22147 (_ BitVec 64)) (t!29976 List!20983)) )
))
(declare-fun acc!919 () List!20983)

(declare-fun contains!5877 (List!20983 (_ BitVec 64)) Bool)

(assert (=> b!995205 (= res!665165 (not (contains!5877 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!995206 () Bool)

(declare-fun res!665168 () Bool)

(assert (=> b!995206 (=> (not res!665168) (not e!561711))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!995206 (= res!665168 (bvsge from!3778 size!36))))

(declare-fun b!995207 () Bool)

(declare-fun res!665164 () Bool)

(assert (=> b!995207 (=> (not res!665164) (not e!561711))))

(assert (=> b!995207 (= res!665164 (not (contains!5877 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!665166 () Bool)

(assert (=> start!85812 (=> (not res!665166) (not e!561711))))

(declare-datatypes ((array!62922 0))(
  ( (array!62923 (arr!30297 (Array (_ BitVec 32) (_ BitVec 64))) (size!30800 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62922)

(assert (=> start!85812 (= res!665166 (and (= (size!30800 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62923 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30800 a!4424))))))

(assert (=> start!85812 e!561711))

(declare-fun array_inv!23433 (array!62922) Bool)

(assert (=> start!85812 (array_inv!23433 a!4424)))

(assert (=> start!85812 true))

(declare-fun b!995208 () Bool)

(declare-fun res!665167 () Bool)

(assert (=> b!995208 (=> (not res!665167) (not e!561711))))

(declare-fun noDuplicate!1462 (List!20983) Bool)

(assert (=> b!995208 (= res!665167 (noDuplicate!1462 acc!919))))

(declare-fun b!995209 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62922 (_ BitVec 32) List!20983) Bool)

(assert (=> b!995209 (= e!561711 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(assert (= (and start!85812 res!665166) b!995207))

(assert (= (and b!995207 res!665164) b!995205))

(assert (= (and b!995205 res!665165) b!995208))

(assert (= (and b!995208 res!665167) b!995206))

(assert (= (and b!995206 res!665168) b!995209))

(declare-fun m!923233 () Bool)

(assert (=> b!995207 m!923233))

(declare-fun m!923235 () Bool)

(assert (=> b!995205 m!923235))

(declare-fun m!923237 () Bool)

(assert (=> start!85812 m!923237))

(declare-fun m!923239 () Bool)

(assert (=> b!995209 m!923239))

(declare-fun m!923241 () Bool)

(assert (=> b!995208 m!923241))

(push 1)

(assert (not b!995208))

(assert (not b!995209))

(assert (not b!995205))

(assert (not b!995207))

(assert (not start!85812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119019 () Bool)

(declare-fun res!665181 () Bool)

(declare-fun e!561726 () Bool)

(assert (=> d!119019 (=> res!665181 e!561726)))

(assert (=> d!119019 (= res!665181 (is-Nil!20980 acc!919))))

(assert (=> d!119019 (= (noDuplicate!1462 acc!919) e!561726)))

(declare-fun b!995226 () Bool)

(declare-fun e!561729 () Bool)

(assert (=> b!995226 (= e!561726 e!561729)))

(declare-fun res!665183 () Bool)

(assert (=> b!995226 (=> (not res!665183) (not e!561729))))

(assert (=> b!995226 (= res!665183 (not (contains!5877 (t!29976 acc!919) (h!22147 acc!919))))))

(declare-fun b!995227 () Bool)

(assert (=> b!995227 (= e!561729 (noDuplicate!1462 (t!29976 acc!919)))))

(assert (= (and d!119019 (not res!665181)) b!995226))

(assert (= (and b!995226 res!665183) b!995227))

(declare-fun m!923243 () Bool)

(assert (=> b!995226 m!923243))

(declare-fun m!923245 () Bool)

(assert (=> b!995227 m!923245))

(assert (=> b!995208 d!119019))

(declare-fun bm!42219 () Bool)

(declare-fun c!101172 () Bool)

(declare-fun call!42222 () Bool)

(assert (=> bm!42219 (= call!42222 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!101172 (Cons!20979 (select (arr!30297 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!995261 () Bool)

(declare-fun e!561757 () Bool)

(assert (=> b!995261 (= e!561757 call!42222)))

(declare-fun d!119023 () Bool)

(declare-fun res!665207 () Bool)

(declare-fun e!561756 () Bool)

(assert (=> d!119023 (=> res!665207 e!561756)))

(assert (=> d!119023 (= res!665207 (bvsge from!3778 (size!30800 a!4424)))))

(assert (=> d!119023 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561756)))

(declare-fun b!995262 () Bool)

(declare-fun e!561759 () Bool)

(assert (=> b!995262 (= e!561759 e!561757)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995262 (= c!101172 (validKeyInArray!0 (select (arr!30297 a!4424) from!3778)))))

(declare-fun b!995263 () Bool)

(assert (=> b!995263 (= e!561757 call!42222)))

(declare-fun b!995264 () Bool)

(assert (=> b!995264 (= e!561756 e!561759)))

(declare-fun res!665208 () Bool)

(assert (=> b!995264 (=> (not res!665208) (not e!561759))))

(declare-fun e!561758 () Bool)

(assert (=> b!995264 (= res!665208 (not e!561758))))

(declare-fun res!665206 () Bool)

(assert (=> b!995264 (=> (not res!665206) (not e!561758))))

(assert (=> b!995264 (= res!665206 (validKeyInArray!0 (select (arr!30297 a!4424) from!3778)))))

(declare-fun b!995265 () Bool)

(assert (=> b!995265 (= e!561758 (contains!5877 acc!919 (select (arr!30297 a!4424) from!3778)))))

(assert (= (and d!119023 (not res!665207)) b!995264))

(assert (= (and b!995264 res!665206) b!995265))

(assert (= (and b!995264 res!665208) b!995262))

(assert (= (and b!995262 c!101172) b!995261))

(assert (= (and b!995262 (not c!101172)) b!995263))

(assert (= (or b!995261 b!995263) bm!42219))

(declare-fun m!923259 () Bool)

(assert (=> bm!42219 m!923259))

(declare-fun m!923261 () Bool)

(assert (=> bm!42219 m!923261))

(assert (=> b!995262 m!923259))

(assert (=> b!995262 m!923259))

(declare-fun m!923263 () Bool)

(assert (=> b!995262 m!923263))

(assert (=> b!995264 m!923259))

(assert (=> b!995264 m!923259))

(assert (=> b!995264 m!923263))

(assert (=> b!995265 m!923259))

(assert (=> b!995265 m!923259))

(declare-fun m!923265 () Bool)

(assert (=> b!995265 m!923265))

(assert (=> b!995209 d!119023))

(declare-fun d!119031 () Bool)

(declare-fun lt!441075 () Bool)

(declare-fun content!479 (List!20983) (Set (_ BitVec 64)))

(assert (=> d!119031 (= lt!441075 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!479 acc!919)))))

(declare-fun e!561778 () Bool)

(assert (=> d!119031 (= lt!441075 e!561778)))

(declare-fun res!665227 () Bool)

(assert (=> d!119031 (=> (not res!665227) (not e!561778))))

(assert (=> d!119031 (= res!665227 (is-Cons!20979 acc!919))))

(assert (=> d!119031 (= (contains!5877 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!441075)))

(declare-fun b!995285 () Bool)

(declare-fun e!561779 () Bool)

(assert (=> b!995285 (= e!561778 e!561779)))

(declare-fun res!665226 () Bool)

(assert (=> b!995285 (=> res!665226 e!561779)))

(assert (=> b!995285 (= res!665226 (= (h!22147 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995286 () Bool)

(assert (=> b!995286 (= e!561779 (contains!5877 (t!29976 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119031 res!665227) b!995285))

(assert (= (and b!995285 (not res!665226)) b!995286))

(declare-fun m!923289 () Bool)

(assert (=> d!119031 m!923289))

(declare-fun m!923291 () Bool)

(assert (=> d!119031 m!923291))

(declare-fun m!923293 () Bool)

(assert (=> b!995286 m!923293))

(assert (=> b!995205 d!119031))

(declare-fun d!119041 () Bool)

(assert (=> d!119041 (= (array_inv!23433 a!4424) (bvsge (size!30800 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85812 d!119041))

(declare-fun d!119043 () Bool)

(declare-fun lt!441078 () Bool)

(assert (=> d!119043 (= lt!441078 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!479 acc!919)))))

(declare-fun e!561784 () Bool)

(assert (=> d!119043 (= lt!441078 e!561784)))

(declare-fun res!665233 () Bool)

(assert (=> d!119043 (=> (not res!665233) (not e!561784))))

(assert (=> d!119043 (= res!665233 (is-Cons!20979 acc!919))))

(assert (=> d!119043 (= (contains!5877 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!441078)))

(declare-fun b!995291 () Bool)

(declare-fun e!561785 () Bool)

(assert (=> b!995291 (= e!561784 e!561785)))

(declare-fun res!665232 () Bool)

(assert (=> b!995291 (=> res!665232 e!561785)))

(assert (=> b!995291 (= res!665232 (= (h!22147 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995292 () Bool)

(assert (=> b!995292 (= e!561785 (contains!5877 (t!29976 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119043 res!665233) b!995291))

(assert (= (and b!995291 (not res!665232)) b!995292))

(assert (=> d!119043 m!923289))

(declare-fun m!923295 () Bool)

(assert (=> d!119043 m!923295))

(declare-fun m!923297 () Bool)

(assert (=> b!995292 m!923297))

(assert (=> b!995207 d!119043))

(push 1)

(assert (not d!119043))

(assert (not b!995264))

(assert (not b!995292))

(assert (not b!995262))

(assert (not d!119031))

(assert (not b!995227))

(assert (not b!995286))

(assert (not b!995226))

(assert (not b!995265))

(assert (not bm!42219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

