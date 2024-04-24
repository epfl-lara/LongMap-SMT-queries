; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117614 () Bool)

(assert start!117614)

(declare-fun res!922749 () Bool)

(declare-fun e!782648 () Bool)

(assert (=> start!117614 (=> (not res!922749) (not e!782648))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94058 0))(
  ( (array!94059 (arr!45420 (Array (_ BitVec 32) (_ BitVec 64))) (size!45971 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94058)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117614 (= res!922749 (and (bvslt (size!45971 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45971 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184)))))

(assert (=> start!117614 e!782648))

(declare-fun array_inv!34701 (array!94058) Bool)

(assert (=> start!117614 (array_inv!34701 a!4010)))

(assert (=> start!117614 true))

(declare-fun b!1381208 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94058 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381208 (= e!782648 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (= (and start!117614 res!922749) b!1381208))

(declare-fun m!1266761 () Bool)

(assert (=> start!117614 m!1266761))

(declare-fun m!1266763 () Bool)

(assert (=> b!1381208 m!1266763))

(declare-fun m!1266765 () Bool)

(assert (=> b!1381208 m!1266765))

(declare-fun m!1266767 () Bool)

(assert (=> b!1381208 m!1266767))

(push 1)

(assert (not b!1381208))

(assert (not start!117614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1381225 () Bool)

(declare-fun e!782658 () (_ BitVec 32))

(declare-fun e!782659 () (_ BitVec 32))

(assert (=> b!1381225 (= e!782658 e!782659)))

(declare-fun c!128686 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381225 (= c!128686 (validKeyInArray!0 (select (arr!45420 a!4010) from!3388)))))

(declare-fun b!1381226 () Bool)

(declare-fun call!66184 () (_ BitVec 32))

(assert (=> b!1381226 (= e!782659 call!66184)))

(declare-fun b!1381228 () Bool)

(assert (=> b!1381228 (= e!782659 (bvadd #b00000000000000000000000000000001 call!66184))))

(declare-fun bm!66181 () Bool)

(assert (=> bm!66181 (= call!66184 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun b!1381227 () Bool)

(assert (=> b!1381227 (= e!782658 #b00000000000000000000000000000000)))

(declare-fun d!149151 () Bool)

(declare-fun lt!608274 () (_ BitVec 32))

(assert (=> d!149151 (and (bvsge lt!608274 #b00000000000000000000000000000000) (bvsle lt!608274 (bvsub (size!45971 a!4010) from!3388)))))

(assert (=> d!149151 (= lt!608274 e!782658)))

(declare-fun c!128685 () Bool)

(assert (=> d!149151 (= c!128685 (bvsge from!3388 pivot!64))))

(assert (=> d!149151 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45971 a!4010)))))

(assert (=> d!149151 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!608274)))

(assert (= (and d!149151 c!128685) b!1381227))

(assert (= (and d!149151 (not c!128685)) b!1381225))

(assert (= (and b!1381225 c!128686) b!1381228))

(assert (= (and b!1381225 (not c!128686)) b!1381226))

(assert (= (or b!1381228 b!1381226) bm!66181))

(declare-fun m!1266769 () Bool)

(assert (=> b!1381225 m!1266769))

(assert (=> b!1381225 m!1266769))

(declare-fun m!1266771 () Bool)

(assert (=> b!1381225 m!1266771))

(declare-fun m!1266773 () Bool)

(assert (=> bm!66181 m!1266773))

(assert (=> b!1381208 d!149151))

(declare-fun b!1381229 () Bool)

(declare-fun e!782660 () (_ BitVec 32))

(declare-fun e!782661 () (_ BitVec 32))

(assert (=> b!1381229 (= e!782660 e!782661)))

(declare-fun c!128688 () Bool)

(assert (=> b!1381229 (= c!128688 (validKeyInArray!0 (select (arr!45420 a!4010) pivot!64)))))

(declare-fun b!1381230 () Bool)

(declare-fun call!66185 () (_ BitVec 32))

(assert (=> b!1381230 (= e!782661 call!66185)))

(declare-fun b!1381232 () Bool)

(assert (=> b!1381232 (= e!782661 (bvadd #b00000000000000000000000000000001 call!66185))))

(declare-fun bm!66182 () Bool)

(assert (=> bm!66182 (= call!66185 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1381231 () Bool)

(assert (=> b!1381231 (= e!782660 #b00000000000000000000000000000000)))

(declare-fun d!149155 () Bool)

(declare-fun lt!608275 () (_ BitVec 32))

(assert (=> d!149155 (and (bvsge lt!608275 #b00000000000000000000000000000000) (bvsle lt!608275 (bvsub (size!45971 a!4010) pivot!64)))))

(assert (=> d!149155 (= lt!608275 e!782660)))

(declare-fun c!128687 () Bool)

(assert (=> d!149155 (= c!128687 (bvsge pivot!64 to!184))))

(assert (=> d!149155 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45971 a!4010)))))

(assert (=> d!149155 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!608275)))

(assert (= (and d!149155 c!128687) b!1381231))

(assert (= (and d!149155 (not c!128687)) b!1381229))

(assert (= (and b!1381229 c!128688) b!1381232))

(assert (= (and b!1381229 (not c!128688)) b!1381230))

(assert (= (or b!1381232 b!1381230) bm!66182))

(declare-fun m!1266775 () Bool)

(assert (=> b!1381229 m!1266775))

(assert (=> b!1381229 m!1266775))

(declare-fun m!1266777 () Bool)

(assert (=> b!1381229 m!1266777))

(declare-fun m!1266779 () Bool)

(assert (=> bm!66182 m!1266779))

(assert (=> b!1381208 d!149155))

(declare-fun b!1381233 () Bool)

(declare-fun e!782662 () (_ BitVec 32))

(declare-fun e!782663 () (_ BitVec 32))

(assert (=> b!1381233 (= e!782662 e!782663)))

(declare-fun c!128690 () Bool)

(assert (=> b!1381233 (= c!128690 (validKeyInArray!0 (select (arr!45420 a!4010) from!3388)))))

(declare-fun b!1381234 () Bool)

(declare-fun call!66186 () (_ BitVec 32))

(assert (=> b!1381234 (= e!782663 call!66186)))

(declare-fun b!1381236 () Bool)

(assert (=> b!1381236 (= e!782663 (bvadd #b00000000000000000000000000000001 call!66186))))

(declare-fun bm!66183 () Bool)

(assert (=> bm!66183 (= call!66186 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1381235 () Bool)

(assert (=> b!1381235 (= e!782662 #b00000000000000000000000000000000)))

(declare-fun d!149157 () Bool)

(declare-fun lt!608276 () (_ BitVec 32))

(assert (=> d!149157 (and (bvsge lt!608276 #b00000000000000000000000000000000) (bvsle lt!608276 (bvsub (size!45971 a!4010) from!3388)))))

(assert (=> d!149157 (= lt!608276 e!782662)))

(declare-fun c!128689 () Bool)

(assert (=> d!149157 (= c!128689 (bvsge from!3388 to!184))))

(assert (=> d!149157 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45971 a!4010)))))

(assert (=> d!149157 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!608276)))

(assert (= (and d!149157 c!128689) b!1381235))

(assert (= (and d!149157 (not c!128689)) b!1381233))

(assert (= (and b!1381233 c!128690) b!1381236))

(assert (= (and b!1381233 (not c!128690)) b!1381234))

(assert (= (or b!1381236 b!1381234) bm!66183))

(assert (=> b!1381233 m!1266769))

(assert (=> b!1381233 m!1266769))

(assert (=> b!1381233 m!1266771))

(declare-fun m!1266781 () Bool)

(assert (=> bm!66183 m!1266781))

(assert (=> b!1381208 d!149157))

(declare-fun d!149159 () Bool)

(assert (=> d!149159 (= (array_inv!34701 a!4010) (bvsge (size!45971 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117614 d!149159))

(push 1)

(assert (not b!1381225))

(assert (not b!1381229))

(assert (not b!1381233))

(assert (not bm!66183))

(assert (not bm!66181))

(assert (not bm!66182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

