; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115306 () Bool)

(assert start!115306)

(declare-fun b!1365181 () Bool)

(declare-fun e!774246 () Bool)

(declare-fun e!774247 () Bool)

(assert (=> b!1365181 (= e!774246 e!774247)))

(declare-fun res!908138 () Bool)

(assert (=> b!1365181 (=> (not res!908138) (not e!774247))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!601411 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1365181 (= res!908138 (and (not (= from!3120 i!1404)) (not lt!601411) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44957 0))(
  ( (Unit!44958) )
))
(declare-fun lt!601413 () Unit!44957)

(declare-fun e!774244 () Unit!44957)

(assert (=> b!1365181 (= lt!601413 e!774244)))

(declare-fun c!127969 () Bool)

(assert (=> b!1365181 (= c!127969 lt!601411)))

(declare-datatypes ((array!92824 0))(
  ( (array!92825 (arr!44839 (Array (_ BitVec 32) (_ BitVec 64))) (size!45390 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92824)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365181 (= lt!601411 (validKeyInArray!0 (select (arr!44839 a!3742) from!3120)))))

(declare-fun b!1365182 () Bool)

(declare-fun res!908148 () Bool)

(assert (=> b!1365182 (=> (not res!908148) (not e!774246))))

(declare-datatypes ((List!31867 0))(
  ( (Nil!31864) (Cons!31863 (h!33081 (_ BitVec 64)) (t!46550 List!31867)) )
))
(declare-fun acc!759 () List!31867)

(declare-fun noDuplicate!2410 (List!31867) Bool)

(assert (=> b!1365182 (= res!908148 (noDuplicate!2410 acc!759))))

(declare-fun b!1365183 () Bool)

(declare-fun res!908142 () Bool)

(assert (=> b!1365183 (=> (not res!908142) (not e!774246))))

(declare-fun arrayNoDuplicates!0 (array!92824 (_ BitVec 32) List!31867) Bool)

(assert (=> b!1365183 (= res!908142 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1365184 () Bool)

(declare-fun res!908147 () Bool)

(assert (=> b!1365184 (=> (not res!908147) (not e!774246))))

(assert (=> b!1365184 (= res!908147 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45390 a!3742)))))

(declare-fun b!1365185 () Bool)

(declare-fun res!908143 () Bool)

(assert (=> b!1365185 (=> (not res!908143) (not e!774246))))

(declare-fun contains!9579 (List!31867 (_ BitVec 64)) Bool)

(assert (=> b!1365185 (= res!908143 (not (contains!9579 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365186 () Bool)

(declare-fun lt!601412 () Unit!44957)

(assert (=> b!1365186 (= e!774244 lt!601412)))

(declare-fun lt!601416 () Unit!44957)

(declare-fun lemmaListSubSeqRefl!0 (List!31867) Unit!44957)

(assert (=> b!1365186 (= lt!601416 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!938 (List!31867 List!31867) Bool)

(assert (=> b!1365186 (subseq!938 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92824 List!31867 List!31867 (_ BitVec 32)) Unit!44957)

(declare-fun $colon$colon!940 (List!31867 (_ BitVec 64)) List!31867)

(assert (=> b!1365186 (= lt!601412 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!940 acc!759 (select (arr!44839 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1365186 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1365187 () Bool)

(declare-fun res!908139 () Bool)

(assert (=> b!1365187 (=> (not res!908139) (not e!774246))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1365187 (= res!908139 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!908145 () Bool)

(assert (=> start!115306 (=> (not res!908145) (not e!774246))))

(assert (=> start!115306 (= res!908145 (and (bvslt (size!45390 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45390 a!3742))))))

(assert (=> start!115306 e!774246))

(assert (=> start!115306 true))

(declare-fun array_inv!34120 (array!92824) Bool)

(assert (=> start!115306 (array_inv!34120 a!3742)))

(declare-fun b!1365188 () Bool)

(declare-fun res!908144 () Bool)

(assert (=> b!1365188 (=> (not res!908144) (not e!774247))))

(assert (=> b!1365188 (= res!908144 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1365189 () Bool)

(declare-fun res!908146 () Bool)

(assert (=> b!1365189 (=> (not res!908146) (not e!774246))))

(assert (=> b!1365189 (= res!908146 (not (contains!9579 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365190 () Bool)

(declare-fun Unit!44959 () Unit!44957)

(assert (=> b!1365190 (= e!774244 Unit!44959)))

(declare-fun b!1365191 () Bool)

(declare-fun res!908140 () Bool)

(assert (=> b!1365191 (=> (not res!908140) (not e!774246))))

(assert (=> b!1365191 (= res!908140 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31864))))

(declare-fun b!1365192 () Bool)

(declare-fun lt!601414 () array!92824)

(assert (=> b!1365192 (= e!774247 (not (arrayNoDuplicates!0 lt!601414 from!3120 acc!759)))))

(assert (=> b!1365192 (arrayNoDuplicates!0 lt!601414 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (=> b!1365192 (= lt!601414 (array!92825 (store (arr!44839 a!3742) i!1404 l!3587) (size!45390 a!3742)))))

(declare-fun lt!601415 () Unit!44957)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92824 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31867) Unit!44957)

(assert (=> b!1365192 (= lt!601415 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1365193 () Bool)

(declare-fun res!908141 () Bool)

(assert (=> b!1365193 (=> (not res!908141) (not e!774246))))

(assert (=> b!1365193 (= res!908141 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45390 a!3742))))))

(assert (= (and start!115306 res!908145) b!1365182))

(assert (= (and b!1365182 res!908148) b!1365189))

(assert (= (and b!1365189 res!908146) b!1365185))

(assert (= (and b!1365185 res!908143) b!1365191))

(assert (= (and b!1365191 res!908140) b!1365183))

(assert (= (and b!1365183 res!908142) b!1365193))

(assert (= (and b!1365193 res!908141) b!1365187))

(assert (= (and b!1365187 res!908139) b!1365184))

(assert (= (and b!1365184 res!908147) b!1365181))

(assert (= (and b!1365181 c!127969) b!1365186))

(assert (= (and b!1365181 (not c!127969)) b!1365190))

(assert (= (and b!1365181 res!908138) b!1365188))

(assert (= (and b!1365188 res!908144) b!1365192))

(declare-fun m!1250191 () Bool)

(assert (=> b!1365187 m!1250191))

(declare-fun m!1250193 () Bool)

(assert (=> b!1365191 m!1250193))

(declare-fun m!1250195 () Bool)

(assert (=> start!115306 m!1250195))

(declare-fun m!1250197 () Bool)

(assert (=> b!1365188 m!1250197))

(declare-fun m!1250199 () Bool)

(assert (=> b!1365189 m!1250199))

(declare-fun m!1250201 () Bool)

(assert (=> b!1365185 m!1250201))

(declare-fun m!1250203 () Bool)

(assert (=> b!1365192 m!1250203))

(declare-fun m!1250205 () Bool)

(assert (=> b!1365192 m!1250205))

(declare-fun m!1250207 () Bool)

(assert (=> b!1365192 m!1250207))

(declare-fun m!1250209 () Bool)

(assert (=> b!1365192 m!1250209))

(declare-fun m!1250211 () Bool)

(assert (=> b!1365181 m!1250211))

(assert (=> b!1365181 m!1250211))

(declare-fun m!1250213 () Bool)

(assert (=> b!1365181 m!1250213))

(declare-fun m!1250215 () Bool)

(assert (=> b!1365182 m!1250215))

(declare-fun m!1250217 () Bool)

(assert (=> b!1365183 m!1250217))

(declare-fun m!1250219 () Bool)

(assert (=> b!1365186 m!1250219))

(assert (=> b!1365186 m!1250211))

(declare-fun m!1250221 () Bool)

(assert (=> b!1365186 m!1250221))

(declare-fun m!1250223 () Bool)

(assert (=> b!1365186 m!1250223))

(assert (=> b!1365186 m!1250197))

(assert (=> b!1365186 m!1250211))

(assert (=> b!1365186 m!1250221))

(declare-fun m!1250225 () Bool)

(assert (=> b!1365186 m!1250225))

(check-sat (not start!115306) (not b!1365192) (not b!1365188) (not b!1365183) (not b!1365182) (not b!1365185) (not b!1365186) (not b!1365181) (not b!1365187) (not b!1365189) (not b!1365191))
(check-sat)
(get-model)

(declare-fun d!146617 () Bool)

(declare-fun lt!601455 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!703 (List!31867) (InoxSet (_ BitVec 64)))

(assert (=> d!146617 (= lt!601455 (select (content!703 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774277 () Bool)

(assert (=> d!146617 (= lt!601455 e!774277)))

(declare-fun res!908220 () Bool)

(assert (=> d!146617 (=> (not res!908220) (not e!774277))))

(get-info :version)

(assert (=> d!146617 (= res!908220 ((_ is Cons!31863) acc!759))))

(assert (=> d!146617 (= (contains!9579 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601455)))

(declare-fun b!1365276 () Bool)

(declare-fun e!774276 () Bool)

(assert (=> b!1365276 (= e!774277 e!774276)))

(declare-fun res!908219 () Bool)

(assert (=> b!1365276 (=> res!908219 e!774276)))

(assert (=> b!1365276 (= res!908219 (= (h!33081 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1365277 () Bool)

(assert (=> b!1365277 (= e!774276 (contains!9579 (t!46550 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146617 res!908220) b!1365276))

(assert (= (and b!1365276 (not res!908219)) b!1365277))

(declare-fun m!1250299 () Bool)

(assert (=> d!146617 m!1250299))

(declare-fun m!1250301 () Bool)

(assert (=> d!146617 m!1250301))

(declare-fun m!1250303 () Bool)

(assert (=> b!1365277 m!1250303))

(assert (=> b!1365185 d!146617))

(declare-fun b!1365288 () Bool)

(declare-fun e!774287 () Bool)

(declare-fun e!774289 () Bool)

(assert (=> b!1365288 (= e!774287 e!774289)))

(declare-fun c!127978 () Bool)

(assert (=> b!1365288 (= c!127978 (validKeyInArray!0 (select (arr!44839 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1365289 () Bool)

(declare-fun call!65482 () Bool)

(assert (=> b!1365289 (= e!774289 call!65482)))

(declare-fun b!1365290 () Bool)

(assert (=> b!1365290 (= e!774289 call!65482)))

(declare-fun bm!65479 () Bool)

(assert (=> bm!65479 (= call!65482 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127978 (Cons!31863 (select (arr!44839 a!3742) #b00000000000000000000000000000000) Nil!31864) Nil!31864)))))

(declare-fun b!1365291 () Bool)

(declare-fun e!774288 () Bool)

(assert (=> b!1365291 (= e!774288 e!774287)))

(declare-fun res!908229 () Bool)

(assert (=> b!1365291 (=> (not res!908229) (not e!774287))))

(declare-fun e!774286 () Bool)

(assert (=> b!1365291 (= res!908229 (not e!774286))))

(declare-fun res!908228 () Bool)

(assert (=> b!1365291 (=> (not res!908228) (not e!774286))))

(assert (=> b!1365291 (= res!908228 (validKeyInArray!0 (select (arr!44839 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1365292 () Bool)

(assert (=> b!1365292 (= e!774286 (contains!9579 Nil!31864 (select (arr!44839 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146619 () Bool)

(declare-fun res!908227 () Bool)

(assert (=> d!146619 (=> res!908227 e!774288)))

(assert (=> d!146619 (= res!908227 (bvsge #b00000000000000000000000000000000 (size!45390 a!3742)))))

(assert (=> d!146619 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31864) e!774288)))

(assert (= (and d!146619 (not res!908227)) b!1365291))

(assert (= (and b!1365291 res!908228) b!1365292))

(assert (= (and b!1365291 res!908229) b!1365288))

(assert (= (and b!1365288 c!127978) b!1365290))

(assert (= (and b!1365288 (not c!127978)) b!1365289))

(assert (= (or b!1365290 b!1365289) bm!65479))

(declare-fun m!1250305 () Bool)

(assert (=> b!1365288 m!1250305))

(assert (=> b!1365288 m!1250305))

(declare-fun m!1250307 () Bool)

(assert (=> b!1365288 m!1250307))

(assert (=> bm!65479 m!1250305))

(declare-fun m!1250309 () Bool)

(assert (=> bm!65479 m!1250309))

(assert (=> b!1365291 m!1250305))

(assert (=> b!1365291 m!1250305))

(assert (=> b!1365291 m!1250307))

(assert (=> b!1365292 m!1250305))

(assert (=> b!1365292 m!1250305))

(declare-fun m!1250311 () Bool)

(assert (=> b!1365292 m!1250311))

(assert (=> b!1365191 d!146619))

(declare-fun d!146621 () Bool)

(assert (=> d!146621 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!601458 () Unit!44957)

(declare-fun choose!80 (array!92824 List!31867 List!31867 (_ BitVec 32)) Unit!44957)

(assert (=> d!146621 (= lt!601458 (choose!80 a!3742 ($colon$colon!940 acc!759 (select (arr!44839 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146621 (bvslt (size!45390 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146621 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!940 acc!759 (select (arr!44839 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!601458)))

(declare-fun bs!39124 () Bool)

(assert (= bs!39124 d!146621))

(assert (=> bs!39124 m!1250197))

(assert (=> bs!39124 m!1250221))

(declare-fun m!1250313 () Bool)

(assert (=> bs!39124 m!1250313))

(assert (=> b!1365186 d!146621))

(declare-fun b!1365302 () Bool)

(declare-fun e!774299 () Bool)

(declare-fun e!774301 () Bool)

(assert (=> b!1365302 (= e!774299 e!774301)))

(declare-fun res!908241 () Bool)

(assert (=> b!1365302 (=> res!908241 e!774301)))

(declare-fun e!774300 () Bool)

(assert (=> b!1365302 (= res!908241 e!774300)))

(declare-fun res!908240 () Bool)

(assert (=> b!1365302 (=> (not res!908240) (not e!774300))))

(assert (=> b!1365302 (= res!908240 (= (h!33081 acc!759) (h!33081 acc!759)))))

(declare-fun d!146623 () Bool)

(declare-fun res!908239 () Bool)

(declare-fun e!774298 () Bool)

(assert (=> d!146623 (=> res!908239 e!774298)))

(assert (=> d!146623 (= res!908239 ((_ is Nil!31864) acc!759))))

(assert (=> d!146623 (= (subseq!938 acc!759 acc!759) e!774298)))

(declare-fun b!1365303 () Bool)

(assert (=> b!1365303 (= e!774300 (subseq!938 (t!46550 acc!759) (t!46550 acc!759)))))

(declare-fun b!1365301 () Bool)

(assert (=> b!1365301 (= e!774298 e!774299)))

(declare-fun res!908238 () Bool)

(assert (=> b!1365301 (=> (not res!908238) (not e!774299))))

(assert (=> b!1365301 (= res!908238 ((_ is Cons!31863) acc!759))))

(declare-fun b!1365304 () Bool)

(assert (=> b!1365304 (= e!774301 (subseq!938 acc!759 (t!46550 acc!759)))))

(assert (= (and d!146623 (not res!908239)) b!1365301))

(assert (= (and b!1365301 res!908238) b!1365302))

(assert (= (and b!1365302 res!908240) b!1365303))

(assert (= (and b!1365302 (not res!908241)) b!1365304))

(declare-fun m!1250317 () Bool)

(assert (=> b!1365303 m!1250317))

(declare-fun m!1250319 () Bool)

(assert (=> b!1365304 m!1250319))

(assert (=> b!1365186 d!146623))

(declare-fun b!1365305 () Bool)

(declare-fun e!774303 () Bool)

(declare-fun e!774305 () Bool)

(assert (=> b!1365305 (= e!774303 e!774305)))

(declare-fun c!127979 () Bool)

(assert (=> b!1365305 (= c!127979 (validKeyInArray!0 (select (arr!44839 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1365306 () Bool)

(declare-fun call!65483 () Bool)

(assert (=> b!1365306 (= e!774305 call!65483)))

(declare-fun b!1365307 () Bool)

(assert (=> b!1365307 (= e!774305 call!65483)))

(declare-fun bm!65480 () Bool)

(assert (=> bm!65480 (= call!65483 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127979 (Cons!31863 (select (arr!44839 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1365308 () Bool)

(declare-fun e!774304 () Bool)

(assert (=> b!1365308 (= e!774304 e!774303)))

(declare-fun res!908244 () Bool)

(assert (=> b!1365308 (=> (not res!908244) (not e!774303))))

(declare-fun e!774302 () Bool)

(assert (=> b!1365308 (= res!908244 (not e!774302))))

(declare-fun res!908243 () Bool)

(assert (=> b!1365308 (=> (not res!908243) (not e!774302))))

(assert (=> b!1365308 (= res!908243 (validKeyInArray!0 (select (arr!44839 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1365309 () Bool)

(assert (=> b!1365309 (= e!774302 (contains!9579 acc!759 (select (arr!44839 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146629 () Bool)

(declare-fun res!908242 () Bool)

(assert (=> d!146629 (=> res!908242 e!774304)))

(assert (=> d!146629 (= res!908242 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45390 a!3742)))))

(assert (=> d!146629 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!774304)))

(assert (= (and d!146629 (not res!908242)) b!1365308))

(assert (= (and b!1365308 res!908243) b!1365309))

(assert (= (and b!1365308 res!908244) b!1365305))

(assert (= (and b!1365305 c!127979) b!1365307))

(assert (= (and b!1365305 (not c!127979)) b!1365306))

(assert (= (or b!1365307 b!1365306) bm!65480))

(declare-fun m!1250321 () Bool)

(assert (=> b!1365305 m!1250321))

(assert (=> b!1365305 m!1250321))

(declare-fun m!1250323 () Bool)

(assert (=> b!1365305 m!1250323))

(assert (=> bm!65480 m!1250321))

(declare-fun m!1250325 () Bool)

(assert (=> bm!65480 m!1250325))

(assert (=> b!1365308 m!1250321))

(assert (=> b!1365308 m!1250321))

(assert (=> b!1365308 m!1250323))

(assert (=> b!1365309 m!1250321))

(assert (=> b!1365309 m!1250321))

(declare-fun m!1250327 () Bool)

(assert (=> b!1365309 m!1250327))

(assert (=> b!1365186 d!146629))

(declare-fun d!146631 () Bool)

(assert (=> d!146631 (= ($colon$colon!940 acc!759 (select (arr!44839 a!3742) from!3120)) (Cons!31863 (select (arr!44839 a!3742) from!3120) acc!759))))

(assert (=> b!1365186 d!146631))

(declare-fun d!146633 () Bool)

(assert (=> d!146633 (subseq!938 acc!759 acc!759)))

(declare-fun lt!601464 () Unit!44957)

(declare-fun choose!36 (List!31867) Unit!44957)

(assert (=> d!146633 (= lt!601464 (choose!36 acc!759))))

(assert (=> d!146633 (= (lemmaListSubSeqRefl!0 acc!759) lt!601464)))

(declare-fun bs!39126 () Bool)

(assert (= bs!39126 d!146633))

(assert (=> bs!39126 m!1250225))

(declare-fun m!1250329 () Bool)

(assert (=> bs!39126 m!1250329))

(assert (=> b!1365186 d!146633))

(declare-fun d!146637 () Bool)

(assert (=> d!146637 (= (validKeyInArray!0 (select (arr!44839 a!3742) from!3120)) (and (not (= (select (arr!44839 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44839 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1365181 d!146637))

(declare-fun b!1365322 () Bool)

(declare-fun e!774319 () Bool)

(declare-fun e!774321 () Bool)

(assert (=> b!1365322 (= e!774319 e!774321)))

(declare-fun c!127980 () Bool)

(assert (=> b!1365322 (= c!127980 (validKeyInArray!0 (select (arr!44839 lt!601414) from!3120)))))

(declare-fun b!1365323 () Bool)

(declare-fun call!65484 () Bool)

(assert (=> b!1365323 (= e!774321 call!65484)))

(declare-fun b!1365324 () Bool)

(assert (=> b!1365324 (= e!774321 call!65484)))

(declare-fun bm!65481 () Bool)

(assert (=> bm!65481 (= call!65484 (arrayNoDuplicates!0 lt!601414 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127980 (Cons!31863 (select (arr!44839 lt!601414) from!3120) acc!759) acc!759)))))

(declare-fun b!1365325 () Bool)

(declare-fun e!774320 () Bool)

(assert (=> b!1365325 (= e!774320 e!774319)))

(declare-fun res!908259 () Bool)

(assert (=> b!1365325 (=> (not res!908259) (not e!774319))))

(declare-fun e!774318 () Bool)

(assert (=> b!1365325 (= res!908259 (not e!774318))))

(declare-fun res!908258 () Bool)

(assert (=> b!1365325 (=> (not res!908258) (not e!774318))))

(assert (=> b!1365325 (= res!908258 (validKeyInArray!0 (select (arr!44839 lt!601414) from!3120)))))

(declare-fun b!1365326 () Bool)

(assert (=> b!1365326 (= e!774318 (contains!9579 acc!759 (select (arr!44839 lt!601414) from!3120)))))

(declare-fun d!146639 () Bool)

(declare-fun res!908257 () Bool)

(assert (=> d!146639 (=> res!908257 e!774320)))

(assert (=> d!146639 (= res!908257 (bvsge from!3120 (size!45390 lt!601414)))))

(assert (=> d!146639 (= (arrayNoDuplicates!0 lt!601414 from!3120 acc!759) e!774320)))

(assert (= (and d!146639 (not res!908257)) b!1365325))

(assert (= (and b!1365325 res!908258) b!1365326))

(assert (= (and b!1365325 res!908259) b!1365322))

(assert (= (and b!1365322 c!127980) b!1365324))

(assert (= (and b!1365322 (not c!127980)) b!1365323))

(assert (= (or b!1365324 b!1365323) bm!65481))

(declare-fun m!1250335 () Bool)

(assert (=> b!1365322 m!1250335))

(assert (=> b!1365322 m!1250335))

(declare-fun m!1250337 () Bool)

(assert (=> b!1365322 m!1250337))

(assert (=> bm!65481 m!1250335))

(declare-fun m!1250339 () Bool)

(assert (=> bm!65481 m!1250339))

(assert (=> b!1365325 m!1250335))

(assert (=> b!1365325 m!1250335))

(assert (=> b!1365325 m!1250337))

(assert (=> b!1365326 m!1250335))

(assert (=> b!1365326 m!1250335))

(declare-fun m!1250341 () Bool)

(assert (=> b!1365326 m!1250341))

(assert (=> b!1365192 d!146639))

(declare-fun b!1365327 () Bool)

(declare-fun e!774323 () Bool)

(declare-fun e!774325 () Bool)

(assert (=> b!1365327 (= e!774323 e!774325)))

(declare-fun c!127981 () Bool)

(assert (=> b!1365327 (= c!127981 (validKeyInArray!0 (select (arr!44839 lt!601414) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1365328 () Bool)

(declare-fun call!65485 () Bool)

(assert (=> b!1365328 (= e!774325 call!65485)))

(declare-fun b!1365329 () Bool)

(assert (=> b!1365329 (= e!774325 call!65485)))

(declare-fun bm!65482 () Bool)

(assert (=> bm!65482 (= call!65485 (arrayNoDuplicates!0 lt!601414 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127981 (Cons!31863 (select (arr!44839 lt!601414) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1365330 () Bool)

(declare-fun e!774324 () Bool)

(assert (=> b!1365330 (= e!774324 e!774323)))

(declare-fun res!908262 () Bool)

(assert (=> b!1365330 (=> (not res!908262) (not e!774323))))

(declare-fun e!774322 () Bool)

(assert (=> b!1365330 (= res!908262 (not e!774322))))

(declare-fun res!908261 () Bool)

(assert (=> b!1365330 (=> (not res!908261) (not e!774322))))

(assert (=> b!1365330 (= res!908261 (validKeyInArray!0 (select (arr!44839 lt!601414) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1365331 () Bool)

(assert (=> b!1365331 (= e!774322 (contains!9579 acc!759 (select (arr!44839 lt!601414) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146643 () Bool)

(declare-fun res!908260 () Bool)

(assert (=> d!146643 (=> res!908260 e!774324)))

(assert (=> d!146643 (= res!908260 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45390 lt!601414)))))

(assert (=> d!146643 (= (arrayNoDuplicates!0 lt!601414 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!774324)))

(assert (= (and d!146643 (not res!908260)) b!1365330))

(assert (= (and b!1365330 res!908261) b!1365331))

(assert (= (and b!1365330 res!908262) b!1365327))

(assert (= (and b!1365327 c!127981) b!1365329))

(assert (= (and b!1365327 (not c!127981)) b!1365328))

(assert (= (or b!1365329 b!1365328) bm!65482))

(declare-fun m!1250343 () Bool)

(assert (=> b!1365327 m!1250343))

(assert (=> b!1365327 m!1250343))

(declare-fun m!1250347 () Bool)

(assert (=> b!1365327 m!1250347))

(assert (=> bm!65482 m!1250343))

(declare-fun m!1250349 () Bool)

(assert (=> bm!65482 m!1250349))

(assert (=> b!1365330 m!1250343))

(assert (=> b!1365330 m!1250343))

(assert (=> b!1365330 m!1250347))

(assert (=> b!1365331 m!1250343))

(assert (=> b!1365331 m!1250343))

(declare-fun m!1250351 () Bool)

(assert (=> b!1365331 m!1250351))

(assert (=> b!1365192 d!146643))

(declare-fun d!146647 () Bool)

(declare-fun e!774352 () Bool)

(assert (=> d!146647 e!774352))

(declare-fun res!908286 () Bool)

(assert (=> d!146647 (=> (not res!908286) (not e!774352))))

(assert (=> d!146647 (= res!908286 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45390 a!3742))))))

(declare-fun lt!601470 () Unit!44957)

(declare-fun choose!53 (array!92824 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31867) Unit!44957)

(assert (=> d!146647 (= lt!601470 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!146647 (bvslt (size!45390 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146647 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!601470)))

(declare-fun b!1365361 () Bool)

(assert (=> b!1365361 (= e!774352 (arrayNoDuplicates!0 (array!92825 (store (arr!44839 a!3742) i!1404 l!3587) (size!45390 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!146647 res!908286) b!1365361))

(declare-fun m!1250357 () Bool)

(assert (=> d!146647 m!1250357))

(assert (=> b!1365361 m!1250207))

(declare-fun m!1250361 () Bool)

(assert (=> b!1365361 m!1250361))

(assert (=> b!1365192 d!146647))

(declare-fun d!146651 () Bool)

(assert (=> d!146651 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1365187 d!146651))

(declare-fun d!146653 () Bool)

(declare-fun res!908297 () Bool)

(declare-fun e!774363 () Bool)

(assert (=> d!146653 (=> res!908297 e!774363)))

(assert (=> d!146653 (= res!908297 ((_ is Nil!31864) acc!759))))

(assert (=> d!146653 (= (noDuplicate!2410 acc!759) e!774363)))

(declare-fun b!1365374 () Bool)

(declare-fun e!774364 () Bool)

(assert (=> b!1365374 (= e!774363 e!774364)))

(declare-fun res!908299 () Bool)

(assert (=> b!1365374 (=> (not res!908299) (not e!774364))))

(assert (=> b!1365374 (= res!908299 (not (contains!9579 (t!46550 acc!759) (h!33081 acc!759))))))

(declare-fun b!1365375 () Bool)

(assert (=> b!1365375 (= e!774364 (noDuplicate!2410 (t!46550 acc!759)))))

(assert (= (and d!146653 (not res!908297)) b!1365374))

(assert (= (and b!1365374 res!908299) b!1365375))

(declare-fun m!1250371 () Bool)

(assert (=> b!1365374 m!1250371))

(declare-fun m!1250373 () Bool)

(assert (=> b!1365375 m!1250373))

(assert (=> b!1365182 d!146653))

(assert (=> b!1365188 d!146629))

(declare-fun b!1365383 () Bool)

(declare-fun e!774372 () Bool)

(declare-fun e!774374 () Bool)

(assert (=> b!1365383 (= e!774372 e!774374)))

(declare-fun c!127988 () Bool)

(assert (=> b!1365383 (= c!127988 (validKeyInArray!0 (select (arr!44839 a!3742) from!3120)))))

(declare-fun b!1365384 () Bool)

(declare-fun call!65492 () Bool)

(assert (=> b!1365384 (= e!774374 call!65492)))

(declare-fun b!1365385 () Bool)

(assert (=> b!1365385 (= e!774374 call!65492)))

(declare-fun bm!65489 () Bool)

(assert (=> bm!65489 (= call!65492 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127988 (Cons!31863 (select (arr!44839 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1365386 () Bool)

(declare-fun e!774373 () Bool)

(assert (=> b!1365386 (= e!774373 e!774372)))

(declare-fun res!908304 () Bool)

(assert (=> b!1365386 (=> (not res!908304) (not e!774372))))

(declare-fun e!774371 () Bool)

(assert (=> b!1365386 (= res!908304 (not e!774371))))

(declare-fun res!908303 () Bool)

(assert (=> b!1365386 (=> (not res!908303) (not e!774371))))

(assert (=> b!1365386 (= res!908303 (validKeyInArray!0 (select (arr!44839 a!3742) from!3120)))))

(declare-fun b!1365387 () Bool)

(assert (=> b!1365387 (= e!774371 (contains!9579 acc!759 (select (arr!44839 a!3742) from!3120)))))

(declare-fun d!146661 () Bool)

(declare-fun res!908302 () Bool)

(assert (=> d!146661 (=> res!908302 e!774373)))

(assert (=> d!146661 (= res!908302 (bvsge from!3120 (size!45390 a!3742)))))

(assert (=> d!146661 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!774373)))

(assert (= (and d!146661 (not res!908302)) b!1365386))

(assert (= (and b!1365386 res!908303) b!1365387))

(assert (= (and b!1365386 res!908304) b!1365383))

(assert (= (and b!1365383 c!127988) b!1365385))

(assert (= (and b!1365383 (not c!127988)) b!1365384))

(assert (= (or b!1365385 b!1365384) bm!65489))

(assert (=> b!1365383 m!1250211))

(assert (=> b!1365383 m!1250211))

(assert (=> b!1365383 m!1250213))

(assert (=> bm!65489 m!1250211))

(declare-fun m!1250383 () Bool)

(assert (=> bm!65489 m!1250383))

(assert (=> b!1365386 m!1250211))

(assert (=> b!1365386 m!1250211))

(assert (=> b!1365386 m!1250213))

(assert (=> b!1365387 m!1250211))

(assert (=> b!1365387 m!1250211))

(declare-fun m!1250385 () Bool)

(assert (=> b!1365387 m!1250385))

(assert (=> b!1365183 d!146661))

(declare-fun d!146665 () Bool)

(assert (=> d!146665 (= (array_inv!34120 a!3742) (bvsge (size!45390 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115306 d!146665))

(declare-fun d!146667 () Bool)

(declare-fun lt!601474 () Bool)

(assert (=> d!146667 (= lt!601474 (select (content!703 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774380 () Bool)

(assert (=> d!146667 (= lt!601474 e!774380)))

(declare-fun res!908309 () Bool)

(assert (=> d!146667 (=> (not res!908309) (not e!774380))))

(assert (=> d!146667 (= res!908309 ((_ is Cons!31863) acc!759))))

(assert (=> d!146667 (= (contains!9579 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601474)))

(declare-fun b!1365393 () Bool)

(declare-fun e!774379 () Bool)

(assert (=> b!1365393 (= e!774380 e!774379)))

(declare-fun res!908308 () Bool)

(assert (=> b!1365393 (=> res!908308 e!774379)))

(assert (=> b!1365393 (= res!908308 (= (h!33081 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1365394 () Bool)

(assert (=> b!1365394 (= e!774379 (contains!9579 (t!46550 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146667 res!908309) b!1365393))

(assert (= (and b!1365393 (not res!908308)) b!1365394))

(assert (=> d!146667 m!1250299))

(declare-fun m!1250395 () Bool)

(assert (=> d!146667 m!1250395))

(declare-fun m!1250397 () Bool)

(assert (=> b!1365394 m!1250397))

(assert (=> b!1365189 d!146667))

(check-sat (not b!1365308) (not bm!65479) (not b!1365331) (not b!1365291) (not d!146617) (not b!1365304) (not b!1365383) (not b!1365288) (not b!1365361) (not d!146633) (not b!1365322) (not b!1365305) (not b!1365375) (not b!1365330) (not b!1365309) (not bm!65482) (not b!1365394) (not bm!65481) (not b!1365292) (not b!1365387) (not b!1365303) (not b!1365325) (not bm!65480) (not bm!65489) (not b!1365374) (not b!1365327) (not d!146647) (not d!146667) (not b!1365277) (not b!1365326) (not b!1365386) (not d!146621))
(check-sat)
