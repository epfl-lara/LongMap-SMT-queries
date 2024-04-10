; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117660 () Bool)

(assert start!117660)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66465 () Bool)

(declare-datatypes ((array!94157 0))(
  ( (array!94158 (arr!45470 (Array (_ BitVec 32) (_ BitVec 64))) (size!46020 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94157)

(declare-fun call!66469 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94157 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66465 (= call!66469 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun bm!66466 () Bool)

(declare-fun call!66468 () (_ BitVec 32))

(assert (=> bm!66466 (= call!66468 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380940 () Bool)

(declare-fun e!782672 () Bool)

(declare-fun e!782671 () Bool)

(assert (=> b!1380940 (= e!782672 e!782671)))

(declare-fun c!128547 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380940 (= c!128547 (validKeyInArray!0 (select (arr!45470 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380941 () Bool)

(assert (=> b!1380941 (= e!782671 (not (= call!66468 call!66469)))))

(declare-fun b!1380942 () Bool)

(assert (=> b!1380942 (= e!782671 (not (= (bvadd #b00000000000000000000000000000001 call!66468) call!66469)))))

(declare-fun res!922726 () Bool)

(assert (=> start!117660 (=> (not res!922726) (not e!782672))))

(assert (=> start!117660 (= res!922726 (and (bvslt (size!46020 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46020 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117660 e!782672))

(declare-fun array_inv!34498 (array!94157) Bool)

(assert (=> start!117660 (array_inv!34498 a!3931)))

(assert (=> start!117660 true))

(assert (= (and start!117660 res!922726) b!1380940))

(assert (= (and b!1380940 c!128547) b!1380942))

(assert (= (and b!1380940 (not c!128547)) b!1380941))

(assert (= (or b!1380942 b!1380941) bm!66465))

(assert (= (or b!1380942 b!1380941) bm!66466))

(declare-fun m!1266159 () Bool)

(assert (=> bm!66465 m!1266159))

(declare-fun m!1266161 () Bool)

(assert (=> bm!66466 m!1266161))

(declare-fun m!1266163 () Bool)

(assert (=> b!1380940 m!1266163))

(assert (=> b!1380940 m!1266163))

(declare-fun m!1266165 () Bool)

(assert (=> b!1380940 m!1266165))

(declare-fun m!1266167 () Bool)

(assert (=> start!117660 m!1266167))

(push 1)

(assert (not b!1380940))

(assert (not bm!66466))

(assert (not start!117660))

(assert (not bm!66465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148923 () Bool)

(assert (=> d!148923 (= (validKeyInArray!0 (select (arr!45470 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45470 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45470 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380940 d!148923))

(declare-fun b!1380985 () Bool)

(declare-fun e!782703 () (_ BitVec 32))

(declare-fun e!782704 () (_ BitVec 32))

(assert (=> b!1380985 (= e!782703 e!782704)))

(declare-fun c!128567 () Bool)

(assert (=> b!1380985 (= c!128567 (validKeyInArray!0 (select (arr!45470 a!3931) from!3309)))))

(declare-fun d!148925 () Bool)

(declare-fun lt!608137 () (_ BitVec 32))

(assert (=> d!148925 (and (bvsge lt!608137 #b00000000000000000000000000000000) (bvsle lt!608137 (bvsub (size!46020 a!3931) from!3309)))))

(assert (=> d!148925 (= lt!608137 e!782703)))

(declare-fun c!128566 () Bool)

(assert (=> d!148925 (= c!128566 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148925 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46020 a!3931)))))

(assert (=> d!148925 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608137)))

(declare-fun b!1380986 () Bool)

(declare-fun call!66488 () (_ BitVec 32))

(assert (=> b!1380986 (= e!782704 (bvadd #b00000000000000000000000000000001 call!66488))))

(declare-fun b!1380987 () Bool)

(assert (=> b!1380987 (= e!782703 #b00000000000000000000000000000000)))

(declare-fun b!1380988 () Bool)

(assert (=> b!1380988 (= e!782704 call!66488)))

(declare-fun bm!66485 () Bool)

(assert (=> bm!66485 (= call!66488 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and d!148925 c!128566) b!1380987))

(assert (= (and d!148925 (not c!128566)) b!1380985))

(assert (= (and b!1380985 c!128567) b!1380986))

(assert (= (and b!1380985 (not c!128567)) b!1380988))

(assert (= (or b!1380986 b!1380988) bm!66485))

(declare-fun m!1266197 () Bool)

(assert (=> b!1380985 m!1266197))

(assert (=> b!1380985 m!1266197))

(declare-fun m!1266199 () Bool)

(assert (=> b!1380985 m!1266199))

(declare-fun m!1266201 () Bool)

(assert (=> bm!66485 m!1266201))

(assert (=> bm!66466 d!148925))

(declare-fun d!148935 () Bool)

(assert (=> d!148935 (= (array_inv!34498 a!3931) (bvsge (size!46020 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117660 d!148935))

(declare-fun b!1380989 () Bool)

(declare-fun e!782705 () (_ BitVec 32))

(declare-fun e!782706 () (_ BitVec 32))

(assert (=> b!1380989 (= e!782705 e!782706)))

(declare-fun c!128569 () Bool)

(assert (=> b!1380989 (= c!128569 (validKeyInArray!0 (select (arr!45470 a!3931) from!3309)))))

(declare-fun d!148937 () Bool)

(declare-fun lt!608138 () (_ BitVec 32))

(assert (=> d!148937 (and (bvsge lt!608138 #b00000000000000000000000000000000) (bvsle lt!608138 (bvsub (size!46020 a!3931) from!3309)))))

(assert (=> d!148937 (= lt!608138 e!782705)))

(declare-fun c!128568 () Bool)

(assert (=> d!148937 (= c!128568 (bvsge from!3309 to!105))))

(assert (=> d!148937 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46020 a!3931)))))

(assert (=> d!148937 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608138)))

(declare-fun b!1380990 () Bool)

(declare-fun call!66489 () (_ BitVec 32))

(assert (=> b!1380990 (= e!782706 (bvadd #b00000000000000000000000000000001 call!66489))))

(declare-fun b!1380991 () Bool)

(assert (=> b!1380991 (= e!782705 #b00000000000000000000000000000000)))

(declare-fun b!1380992 () Bool)

(assert (=> b!1380992 (= e!782706 call!66489)))

(declare-fun bm!66486 () Bool)

(assert (=> bm!66486 (= call!66489 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(assert (= (and d!148937 c!128568) b!1380991))

(assert (= (and d!148937 (not c!128568)) b!1380989))

(assert (= (and b!1380989 c!128569) b!1380990))

(assert (= (and b!1380989 (not c!128569)) b!1380992))

(assert (= (or b!1380990 b!1380992) bm!66486))

(assert (=> b!1380989 m!1266197))

(assert (=> b!1380989 m!1266197))

(assert (=> b!1380989 m!1266199))

(declare-fun m!1266203 () Bool)

(assert (=> bm!66486 m!1266203))

(assert (=> bm!66465 d!148937))

(push 1)

(assert (not b!1380989))

(assert (not bm!66485))

(assert (not b!1380985))

(assert (not bm!66486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148951 () Bool)

(assert (=> d!148951 (= (validKeyInArray!0 (select (arr!45470 a!3931) from!3309)) (and (not (= (select (arr!45470 a!3931) from!3309) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45470 a!3931) from!3309) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380989 d!148951))

(declare-fun b!1381017 () Bool)

(declare-fun e!782719 () (_ BitVec 32))

(declare-fun e!782720 () (_ BitVec 32))

(assert (=> b!1381017 (= e!782719 e!782720)))

(declare-fun c!128583 () Bool)

(assert (=> b!1381017 (= c!128583 (validKeyInArray!0 (select (arr!45470 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun d!148953 () Bool)

(declare-fun lt!608145 () (_ BitVec 32))

(assert (=> d!148953 (and (bvsge lt!608145 #b00000000000000000000000000000000) (bvsle lt!608145 (bvsub (size!46020 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(assert (=> d!148953 (= lt!608145 e!782719)))

(declare-fun c!128582 () Bool)

(assert (=> d!148953 (= c!128582 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148953 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46020 a!3931)))))

(assert (=> d!148953 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) lt!608145)))

(declare-fun b!1381018 () Bool)

(declare-fun call!66496 () (_ BitVec 32))

(assert (=> b!1381018 (= e!782720 (bvadd #b00000000000000000000000000000001 call!66496))))

(declare-fun b!1381019 () Bool)

(assert (=> b!1381019 (= e!782719 #b00000000000000000000000000000000)))

(declare-fun b!1381020 () Bool)

(assert (=> b!1381020 (= e!782720 call!66496)))

(declare-fun bm!66493 () Bool)

(assert (=> bm!66493 (= call!66496 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and d!148953 c!128582) b!1381019))

(assert (= (and d!148953 (not c!128582)) b!1381017))

(assert (= (and b!1381017 c!128583) b!1381018))

(assert (= (and b!1381017 (not c!128583)) b!1381020))

(assert (= (or b!1381018 b!1381020) bm!66493))

(declare-fun m!1266221 () Bool)

(assert (=> b!1381017 m!1266221))

(assert (=> b!1381017 m!1266221))

(declare-fun m!1266223 () Bool)

(assert (=> b!1381017 m!1266223))

(declare-fun m!1266225 () Bool)

(assert (=> bm!66493 m!1266225))

(assert (=> bm!66485 d!148953))

(assert (=> b!1380985 d!148951))

(declare-fun b!1381021 () Bool)

(declare-fun e!782721 () (_ BitVec 32))

(declare-fun e!782722 () (_ BitVec 32))

(assert (=> b!1381021 (= e!782721 e!782722)))

(declare-fun c!128585 () Bool)

(assert (=> b!1381021 (= c!128585 (validKeyInArray!0 (select (arr!45470 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun d!148955 () Bool)

(declare-fun lt!608146 () (_ BitVec 32))

(assert (=> d!148955 (and (bvsge lt!608146 #b00000000000000000000000000000000) (bvsle lt!608146 (bvsub (size!46020 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(assert (=> d!148955 (= lt!608146 e!782721)))

(declare-fun c!128584 () Bool)

(assert (=> d!148955 (= c!128584 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(assert (=> d!148955 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) to!105) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!105 (size!46020 a!3931)))))

(assert (=> d!148955 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105) lt!608146)))

(declare-fun b!1381022 () Bool)

(declare-fun call!66497 () (_ BitVec 32))

(assert (=> b!1381022 (= e!782722 (bvadd #b00000000000000000000000000000001 call!66497))))

(declare-fun b!1381023 () Bool)

(assert (=> b!1381023 (= e!782721 #b00000000000000000000000000000000)))

(declare-fun b!1381024 () Bool)

(assert (=> b!1381024 (= e!782722 call!66497)))

(declare-fun bm!66494 () Bool)

(assert (=> bm!66494 (= call!66497 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!105))))

(assert (= (and d!148955 c!128584) b!1381023))

(assert (= (and d!148955 (not c!128584)) b!1381021))

(assert (= (and b!1381021 c!128585) b!1381022))

(assert (= (and b!1381021 (not c!128585)) b!1381024))

(assert (= (or b!1381022 b!1381024) bm!66494))

(assert (=> b!1381021 m!1266221))

(assert (=> b!1381021 m!1266221))

(assert (=> b!1381021 m!1266223))

(declare-fun m!1266227 () Bool)

(assert (=> bm!66494 m!1266227))

(assert (=> bm!66486 d!148955))

(push 1)

(assert (not bm!66494))

(assert (not bm!66493))

(assert (not b!1381021))

(assert (not b!1381017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

