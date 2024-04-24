; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117556 () Bool)

(assert start!117556)

(declare-fun res!922707 () Bool)

(declare-fun e!782537 () Bool)

(assert (=> start!117556 (=> (not res!922707) (not e!782537))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94036 0))(
  ( (array!94037 (arr!45412 (Array (_ BitVec 32) (_ BitVec 64))) (size!45963 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94036)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117556 (= res!922707 (and (bvslt (size!45963 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45963 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117556 e!782537))

(declare-fun array_inv!34693 (array!94036) Bool)

(assert (=> start!117556 (array_inv!34693 a!4010)))

(assert (=> start!117556 true))

(declare-fun b!1381058 () Bool)

(declare-fun isPivot!0 (array!94036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381058 (= e!782537 (not (isPivot!0 a!4010 from!3388 to!184 from!3388)))))

(assert (= (and start!117556 res!922707) b!1381058))

(declare-fun m!1266601 () Bool)

(assert (=> start!117556 m!1266601))

(declare-fun m!1266603 () Bool)

(assert (=> b!1381058 m!1266603))

(check-sat (not b!1381058) (not start!117556))
(check-sat)
(get-model)

(declare-fun d!149079 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94036 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149079 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39799 () Bool)

(assert (= bs!39799 d!149079))

(declare-fun m!1266613 () Bool)

(assert (=> bs!39799 m!1266613))

(declare-fun m!1266615 () Bool)

(assert (=> bs!39799 m!1266615))

(assert (=> bs!39799 m!1266615))

(assert (=> b!1381058 d!149079))

(declare-fun d!149081 () Bool)

(assert (=> d!149081 (= (array_inv!34693 a!4010) (bvsge (size!45963 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117556 d!149081))

(check-sat (not d!149079))
(check-sat)
(get-model)

(declare-fun b!1381073 () Bool)

(declare-fun e!782555 () (_ BitVec 32))

(assert (=> b!1381073 (= e!782555 #b00000000000000000000000000000000)))

(declare-fun d!149091 () Bool)

(declare-fun lt!608227 () (_ BitVec 32))

(assert (=> d!149091 (and (bvsge lt!608227 #b00000000000000000000000000000000) (bvsle lt!608227 (bvsub (size!45963 a!4010) from!3388)))))

(assert (=> d!149091 (= lt!608227 e!782555)))

(declare-fun c!128628 () Bool)

(assert (=> d!149091 (= c!128628 (bvsge from!3388 from!3388))))

(assert (=> d!149091 (and (bvsle from!3388 from!3388) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle from!3388 (size!45963 a!4010)))))

(assert (=> d!149091 (= (arrayCountValidKeys!0 a!4010 from!3388 from!3388) lt!608227)))

(declare-fun b!1381074 () Bool)

(declare-fun e!782556 () (_ BitVec 32))

(declare-fun call!66155 () (_ BitVec 32))

(assert (=> b!1381074 (= e!782556 (bvadd #b00000000000000000000000000000001 call!66155))))

(declare-fun b!1381075 () Bool)

(assert (=> b!1381075 (= e!782555 e!782556)))

(declare-fun c!128627 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381075 (= c!128627 (validKeyInArray!0 (select (arr!45412 a!4010) from!3388)))))

(declare-fun bm!66152 () Bool)

(assert (=> bm!66152 (= call!66155 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) from!3388))))

(declare-fun b!1381076 () Bool)

(assert (=> b!1381076 (= e!782556 call!66155)))

(assert (= (and d!149091 c!128628) b!1381073))

(assert (= (and d!149091 (not c!128628)) b!1381075))

(assert (= (and b!1381075 c!128627) b!1381074))

(assert (= (and b!1381075 (not c!128627)) b!1381076))

(assert (= (or b!1381074 b!1381076) bm!66152))

(declare-fun m!1266625 () Bool)

(assert (=> b!1381075 m!1266625))

(assert (=> b!1381075 m!1266625))

(declare-fun m!1266627 () Bool)

(assert (=> b!1381075 m!1266627))

(declare-fun m!1266629 () Bool)

(assert (=> bm!66152 m!1266629))

(assert (=> d!149079 d!149091))

(declare-fun b!1381077 () Bool)

(declare-fun e!782557 () (_ BitVec 32))

(assert (=> b!1381077 (= e!782557 #b00000000000000000000000000000000)))

(declare-fun d!149095 () Bool)

(declare-fun lt!608228 () (_ BitVec 32))

(assert (=> d!149095 (and (bvsge lt!608228 #b00000000000000000000000000000000) (bvsle lt!608228 (bvsub (size!45963 a!4010) from!3388)))))

(assert (=> d!149095 (= lt!608228 e!782557)))

(declare-fun c!128630 () Bool)

(assert (=> d!149095 (= c!128630 (bvsge from!3388 to!184))))

(assert (=> d!149095 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45963 a!4010)))))

(assert (=> d!149095 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!608228)))

(declare-fun b!1381078 () Bool)

(declare-fun e!782558 () (_ BitVec 32))

(declare-fun call!66156 () (_ BitVec 32))

(assert (=> b!1381078 (= e!782558 (bvadd #b00000000000000000000000000000001 call!66156))))

(declare-fun b!1381079 () Bool)

(assert (=> b!1381079 (= e!782557 e!782558)))

(declare-fun c!128629 () Bool)

(assert (=> b!1381079 (= c!128629 (validKeyInArray!0 (select (arr!45412 a!4010) from!3388)))))

(declare-fun bm!66153 () Bool)

(assert (=> bm!66153 (= call!66156 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1381080 () Bool)

(assert (=> b!1381080 (= e!782558 call!66156)))

(assert (= (and d!149095 c!128630) b!1381077))

(assert (= (and d!149095 (not c!128630)) b!1381079))

(assert (= (and b!1381079 c!128629) b!1381078))

(assert (= (and b!1381079 (not c!128629)) b!1381080))

(assert (= (or b!1381078 b!1381080) bm!66153))

(assert (=> b!1381079 m!1266625))

(assert (=> b!1381079 m!1266625))

(assert (=> b!1381079 m!1266627))

(declare-fun m!1266631 () Bool)

(assert (=> bm!66153 m!1266631))

(assert (=> d!149079 d!149095))

(check-sat (not bm!66152) (not b!1381079) (not bm!66153) (not b!1381075))
(check-sat)
