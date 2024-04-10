; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117664 () Bool)

(assert start!117664)

(declare-fun res!922732 () Bool)

(declare-fun e!782690 () Bool)

(assert (=> start!117664 (=> (not res!922732) (not e!782690))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94161 0))(
  ( (array!94162 (arr!45472 (Array (_ BitVec 32) (_ BitVec 64))) (size!46022 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94161)

(assert (=> start!117664 (= res!922732 (and (bvslt (size!46022 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46022 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117664 e!782690))

(declare-fun array_inv!34500 (array!94161) Bool)

(assert (=> start!117664 (array_inv!34500 a!3931)))

(assert (=> start!117664 true))

(declare-fun bm!66477 () Bool)

(declare-fun call!66480 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94161 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66477 (= call!66480 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380958 () Bool)

(declare-fun e!782688 () Bool)

(assert (=> b!1380958 (= e!782690 e!782688)))

(declare-fun c!128553 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380958 (= c!128553 (validKeyInArray!0 (select (arr!45472 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun call!66481 () (_ BitVec 32))

(declare-fun bm!66478 () Bool)

(assert (=> bm!66478 (= call!66481 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun b!1380959 () Bool)

(assert (=> b!1380959 (= e!782688 (not (= (bvadd #b00000000000000000000000000000001 call!66480) call!66481)))))

(declare-fun b!1380960 () Bool)

(assert (=> b!1380960 (= e!782688 (not (= call!66480 call!66481)))))

(assert (= (and start!117664 res!922732) b!1380958))

(assert (= (and b!1380958 c!128553) b!1380959))

(assert (= (and b!1380958 (not c!128553)) b!1380960))

(assert (= (or b!1380959 b!1380960) bm!66478))

(assert (= (or b!1380959 b!1380960) bm!66477))

(declare-fun m!1266179 () Bool)

(assert (=> start!117664 m!1266179))

(declare-fun m!1266181 () Bool)

(assert (=> bm!66477 m!1266181))

(declare-fun m!1266183 () Bool)

(assert (=> b!1380958 m!1266183))

(assert (=> b!1380958 m!1266183))

(declare-fun m!1266185 () Bool)

(assert (=> b!1380958 m!1266185))

(declare-fun m!1266187 () Bool)

(assert (=> bm!66478 m!1266187))

(push 1)

(assert (not bm!66478))

(assert (not start!117664))

(assert (not bm!66477))

(assert (not b!1380958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148933 () Bool)

(declare-fun lt!608141 () (_ BitVec 32))

(assert (=> d!148933 (and (bvsge lt!608141 #b00000000000000000000000000000000) (bvsle lt!608141 (bvsub (size!46022 a!3931) from!3309)))))

(declare-fun e!782711 () (_ BitVec 32))

(assert (=> d!148933 (= lt!608141 e!782711)))

(declare-fun c!128575 () Bool)

(assert (=> d!148933 (= c!128575 (bvsge from!3309 to!105))))

(assert (=> d!148933 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46022 a!3931)))))

(assert (=> d!148933 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608141)))

(declare-fun call!66492 () (_ BitVec 32))

(declare-fun bm!66489 () Bool)

(assert (=> bm!66489 (= call!66492 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1381001 () Bool)

(declare-fun e!782712 () (_ BitVec 32))

(assert (=> b!1381001 (= e!782712 call!66492)))

(declare-fun b!1381002 () Bool)

(assert (=> b!1381002 (= e!782711 e!782712)))

(declare-fun c!128574 () Bool)

(assert (=> b!1381002 (= c!128574 (validKeyInArray!0 (select (arr!45472 a!3931) from!3309)))))

(declare-fun b!1381003 () Bool)

(assert (=> b!1381003 (= e!782711 #b00000000000000000000000000000000)))

(declare-fun b!1381004 () Bool)

(assert (=> b!1381004 (= e!782712 (bvadd #b00000000000000000000000000000001 call!66492))))

(assert (= (and d!148933 c!128575) b!1381003))

(assert (= (and d!148933 (not c!128575)) b!1381002))

(assert (= (and b!1381002 c!128574) b!1381004))

(assert (= (and b!1381002 (not c!128574)) b!1381001))

(assert (= (or b!1381004 b!1381001) bm!66489))

(declare-fun m!1266205 () Bool)

(assert (=> bm!66489 m!1266205))

(declare-fun m!1266207 () Bool)

(assert (=> b!1381002 m!1266207))

(assert (=> b!1381002 m!1266207))

(declare-fun m!1266209 () Bool)

(assert (=> b!1381002 m!1266209))

(assert (=> bm!66478 d!148933))

(declare-fun d!148939 () Bool)

(assert (=> d!148939 (= (array_inv!34500 a!3931) (bvsge (size!46022 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117664 d!148939))

(declare-fun d!148941 () Bool)

(declare-fun lt!608142 () (_ BitVec 32))

(assert (=> d!148941 (and (bvsge lt!608142 #b00000000000000000000000000000000) (bvsle lt!608142 (bvsub (size!46022 a!3931) from!3309)))))

(declare-fun e!782713 () (_ BitVec 32))

(assert (=> d!148941 (= lt!608142 e!782713)))

(declare-fun c!128577 () Bool)

(assert (=> d!148941 (= c!128577 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148941 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46022 a!3931)))))

(assert (=> d!148941 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608142)))

(declare-fun call!66493 () (_ BitVec 32))

(declare-fun bm!66490 () Bool)

(assert (=> bm!66490 (= call!66493 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381005 () Bool)

(declare-fun e!782714 () (_ BitVec 32))

(assert (=> b!1381005 (= e!782714 call!66493)))

(declare-fun b!1381006 () Bool)

(assert (=> b!1381006 (= e!782713 e!782714)))

(declare-fun c!128576 () Bool)

(assert (=> b!1381006 (= c!128576 (validKeyInArray!0 (select (arr!45472 a!3931) from!3309)))))

(declare-fun b!1381007 () Bool)

(assert (=> b!1381007 (= e!782713 #b00000000000000000000000000000000)))

(declare-fun b!1381008 () Bool)

(assert (=> b!1381008 (= e!782714 (bvadd #b00000000000000000000000000000001 call!66493))))

(assert (= (and d!148941 c!128577) b!1381007))

(assert (= (and d!148941 (not c!128577)) b!1381006))

(assert (= (and b!1381006 c!128576) b!1381008))

(assert (= (and b!1381006 (not c!128576)) b!1381005))

(assert (= (or b!1381008 b!1381005) bm!66490))

(declare-fun m!1266211 () Bool)

(assert (=> bm!66490 m!1266211))

(assert (=> b!1381006 m!1266207))

(assert (=> b!1381006 m!1266207))

(assert (=> b!1381006 m!1266209))

(assert (=> bm!66477 d!148941))

(declare-fun d!148943 () Bool)

(assert (=> d!148943 (= (validKeyInArray!0 (select (arr!45472 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45472 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45472 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380958 d!148943))

(push 1)

(assert (not bm!66490))

(assert (not b!1381006))

(assert (not bm!66489))

(assert (not b!1381002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148957 () Bool)

(declare-fun lt!608147 () (_ BitVec 32))

(assert (=> d!148957 (and (bvsge lt!608147 #b00000000000000000000000000000000) (bvsle lt!608147 (bvsub (size!46022 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun e!782723 () (_ BitVec 32))

(assert (=> d!148957 (= lt!608147 e!782723)))

(declare-fun c!128587 () Bool)

(assert (=> d!148957 (= c!128587 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148957 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46022 a!3931)))))

(assert (=> d!148957 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) lt!608147)))

(declare-fun bm!66495 () Bool)

(declare-fun call!66498 () (_ BitVec 32))

(assert (=> bm!66495 (= call!66498 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381025 () Bool)

(declare-fun e!782724 () (_ BitVec 32))

(assert (=> b!1381025 (= e!782724 call!66498)))

(declare-fun b!1381026 () Bool)

(assert (=> b!1381026 (= e!782723 e!782724)))

(declare-fun c!128586 () Bool)

(assert (=> b!1381026 (= c!128586 (validKeyInArray!0 (select (arr!45472 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun b!1381027 () Bool)

(assert (=> b!1381027 (= e!782723 #b00000000000000000000000000000000)))

(declare-fun b!1381028 () Bool)

(assert (=> b!1381028 (= e!782724 (bvadd #b00000000000000000000000000000001 call!66498))))

(assert (= (and d!148957 c!128587) b!1381027))

(assert (= (and d!148957 (not c!128587)) b!1381026))

(assert (= (and b!1381026 c!128586) b!1381028))

(assert (= (and b!1381026 (not c!128586)) b!1381025))

(assert (= (or b!1381028 b!1381025) bm!66495))

(declare-fun m!1266229 () Bool)

(assert (=> bm!66495 m!1266229))

(declare-fun m!1266231 () Bool)

(assert (=> b!1381026 m!1266231))

(assert (=> b!1381026 m!1266231))

(declare-fun m!1266233 () Bool)

(assert (=> b!1381026 m!1266233))

(assert (=> bm!66490 d!148957))

(declare-fun d!148959 () Bool)

(assert (=> d!148959 (= (validKeyInArray!0 (select (arr!45472 a!3931) from!3309)) (and (not (= (select (arr!45472 a!3931) from!3309) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45472 a!3931) from!3309) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381006 d!148959))

(declare-fun d!148961 () Bool)

(declare-fun lt!608148 () (_ BitVec 32))

(assert (=> d!148961 (and (bvsge lt!608148 #b00000000000000000000000000000000) (bvsle lt!608148 (bvsub (size!46022 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun e!782725 () (_ BitVec 32))

(assert (=> d!148961 (= lt!608148 e!782725)))

(declare-fun c!128589 () Bool)

(assert (=> d!148961 (= c!128589 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(assert (=> d!148961 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) to!105) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!105 (size!46022 a!3931)))))

(assert (=> d!148961 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105) lt!608148)))

(declare-fun bm!66496 () Bool)

(declare-fun call!66499 () (_ BitVec 32))

(assert (=> bm!66496 (= call!66499 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1381029 () Bool)

(declare-fun e!782726 () (_ BitVec 32))

(assert (=> b!1381029 (= e!782726 call!66499)))

(declare-fun b!1381030 () Bool)

(assert (=> b!1381030 (= e!782725 e!782726)))

(declare-fun c!128588 () Bool)

(assert (=> b!1381030 (= c!128588 (validKeyInArray!0 (select (arr!45472 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun b!1381031 () Bool)

(assert (=> b!1381031 (= e!782725 #b00000000000000000000000000000000)))

(declare-fun b!1381032 () Bool)

(assert (=> b!1381032 (= e!782726 (bvadd #b00000000000000000000000000000001 call!66499))))

(assert (= (and d!148961 c!128589) b!1381031))

(assert (= (and d!148961 (not c!128589)) b!1381030))

(assert (= (and b!1381030 c!128588) b!1381032))

(assert (= (and b!1381030 (not c!128588)) b!1381029))

(assert (= (or b!1381032 b!1381029) bm!66496))

(declare-fun m!1266235 () Bool)

(assert (=> bm!66496 m!1266235))

(assert (=> b!1381030 m!1266231))

(assert (=> b!1381030 m!1266231))

(assert (=> b!1381030 m!1266233))

(assert (=> bm!66489 d!148961))

(assert (=> b!1381002 d!148959))

(push 1)

(assert (not bm!66495))

(assert (not bm!66496))

(assert (not b!1381026))

(assert (not b!1381030))

(check-sat)

