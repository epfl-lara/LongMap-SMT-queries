; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117326 () Bool)

(assert start!117326)

(declare-fun res!922189 () Bool)

(declare-fun e!781693 () Bool)

(assert (=> start!117326 (=> (not res!922189) (not e!781693))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93922 0))(
  ( (array!93923 (arr!45360 (Array (_ BitVec 32) (_ BitVec 64))) (size!45910 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93922)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117326 (= res!922189 (and (bvslt (size!45910 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45910 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117326 e!781693))

(declare-fun array_inv!34388 (array!93922) Bool)

(assert (=> start!117326 (array_inv!34388 a!4010)))

(assert (=> start!117326 true))

(declare-fun b!1379751 () Bool)

(declare-fun isPivot!0 (array!93922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379751 (= e!781693 (not (isPivot!0 a!4010 from!3388 to!184 from!3388)))))

(assert (= (and start!117326 res!922189) b!1379751))

(declare-fun m!1264969 () Bool)

(assert (=> start!117326 m!1264969))

(declare-fun m!1264971 () Bool)

(assert (=> b!1379751 m!1264971))

(check-sat (not b!1379751) (not start!117326))
(check-sat)
(get-model)

(declare-fun d!148619 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93922 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!148619 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39782 () Bool)

(assert (= bs!39782 d!148619))

(declare-fun m!1264977 () Bool)

(assert (=> bs!39782 m!1264977))

(declare-fun m!1264979 () Bool)

(assert (=> bs!39782 m!1264979))

(assert (=> bs!39782 m!1264979))

(assert (=> b!1379751 d!148619))

(declare-fun d!148621 () Bool)

(assert (=> d!148621 (= (array_inv!34388 a!4010) (bvsge (size!45910 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117326 d!148621))

(check-sat (not d!148619))
(check-sat)
(get-model)

(declare-fun b!1379763 () Bool)

(declare-fun e!781706 () (_ BitVec 32))

(declare-fun e!781705 () (_ BitVec 32))

(assert (=> b!1379763 (= e!781706 e!781705)))

(declare-fun c!128226 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379763 (= c!128226 (validKeyInArray!0 (select (arr!45360 a!4010) from!3388)))))

(declare-fun b!1379764 () Bool)

(assert (=> b!1379764 (= e!781706 #b00000000000000000000000000000000)))

(declare-fun bm!66085 () Bool)

(declare-fun call!66088 () (_ BitVec 32))

(assert (=> bm!66085 (= call!66088 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) from!3388))))

(declare-fun b!1379766 () Bool)

(assert (=> b!1379766 (= e!781705 (bvadd #b00000000000000000000000000000001 call!66088))))

(declare-fun b!1379765 () Bool)

(assert (=> b!1379765 (= e!781705 call!66088)))

(declare-fun d!148631 () Bool)

(declare-fun lt!607746 () (_ BitVec 32))

(assert (=> d!148631 (and (bvsge lt!607746 #b00000000000000000000000000000000) (bvsle lt!607746 (bvsub (size!45910 a!4010) from!3388)))))

(assert (=> d!148631 (= lt!607746 e!781706)))

(declare-fun c!128225 () Bool)

(assert (=> d!148631 (= c!128225 (bvsge from!3388 from!3388))))

(assert (=> d!148631 (and (bvsle from!3388 from!3388) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle from!3388 (size!45910 a!4010)))))

(assert (=> d!148631 (= (arrayCountValidKeys!0 a!4010 from!3388 from!3388) lt!607746)))

(assert (= (and d!148631 c!128225) b!1379764))

(assert (= (and d!148631 (not c!128225)) b!1379763))

(assert (= (and b!1379763 c!128226) b!1379766))

(assert (= (and b!1379763 (not c!128226)) b!1379765))

(assert (= (or b!1379766 b!1379765) bm!66085))

(declare-fun m!1264989 () Bool)

(assert (=> b!1379763 m!1264989))

(assert (=> b!1379763 m!1264989))

(declare-fun m!1264991 () Bool)

(assert (=> b!1379763 m!1264991))

(declare-fun m!1264993 () Bool)

(assert (=> bm!66085 m!1264993))

(assert (=> d!148619 d!148631))

(declare-fun b!1379767 () Bool)

(declare-fun e!781708 () (_ BitVec 32))

(declare-fun e!781707 () (_ BitVec 32))

(assert (=> b!1379767 (= e!781708 e!781707)))

(declare-fun c!128228 () Bool)

(assert (=> b!1379767 (= c!128228 (validKeyInArray!0 (select (arr!45360 a!4010) from!3388)))))

(declare-fun b!1379768 () Bool)

(assert (=> b!1379768 (= e!781708 #b00000000000000000000000000000000)))

(declare-fun call!66089 () (_ BitVec 32))

(declare-fun bm!66086 () Bool)

(assert (=> bm!66086 (= call!66089 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379770 () Bool)

(assert (=> b!1379770 (= e!781707 (bvadd #b00000000000000000000000000000001 call!66089))))

(declare-fun b!1379769 () Bool)

(assert (=> b!1379769 (= e!781707 call!66089)))

(declare-fun d!148635 () Bool)

(declare-fun lt!607747 () (_ BitVec 32))

(assert (=> d!148635 (and (bvsge lt!607747 #b00000000000000000000000000000000) (bvsle lt!607747 (bvsub (size!45910 a!4010) from!3388)))))

(assert (=> d!148635 (= lt!607747 e!781708)))

(declare-fun c!128227 () Bool)

(assert (=> d!148635 (= c!128227 (bvsge from!3388 to!184))))

(assert (=> d!148635 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45910 a!4010)))))

(assert (=> d!148635 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607747)))

(assert (= (and d!148635 c!128227) b!1379768))

(assert (= (and d!148635 (not c!128227)) b!1379767))

(assert (= (and b!1379767 c!128228) b!1379770))

(assert (= (and b!1379767 (not c!128228)) b!1379769))

(assert (= (or b!1379770 b!1379769) bm!66086))

(assert (=> b!1379767 m!1264989))

(assert (=> b!1379767 m!1264989))

(assert (=> b!1379767 m!1264991))

(declare-fun m!1264995 () Bool)

(assert (=> bm!66086 m!1264995))

(assert (=> d!148619 d!148635))

(check-sat (not bm!66086) (not b!1379767) (not bm!66085) (not b!1379763))
(check-sat)
