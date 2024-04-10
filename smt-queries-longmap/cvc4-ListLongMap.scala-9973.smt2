; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117742 () Bool)

(assert start!117742)

(declare-fun res!922803 () Bool)

(declare-fun e!782852 () Bool)

(assert (=> start!117742 (=> (not res!922803) (not e!782852))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94224 0))(
  ( (array!94225 (arr!45502 (Array (_ BitVec 32) (_ BitVec 64))) (size!46052 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94224)

(assert (=> start!117742 (= res!922803 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46052 a!3464)) (bvslt (size!46052 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117742 e!782852))

(assert (=> start!117742 true))

(declare-fun array_inv!34530 (array!94224) Bool)

(assert (=> start!117742 (array_inv!34530 a!3464)))

(declare-fun b!1381103 () Bool)

(declare-fun res!922804 () Bool)

(assert (=> b!1381103 (=> (not res!922804) (not e!782852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381103 (= res!922804 (validKeyInArray!0 (select (arr!45502 a!3464) from!2839)))))

(declare-fun b!1381104 () Bool)

(declare-fun lt!608157 () (_ BitVec 32))

(assert (=> b!1381104 (= e!782852 (or (bvslt lt!608157 #b00000000000000000000000000000000) (bvsgt lt!608157 (bvsub (size!46052 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94224 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381104 (= lt!608157 (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94)))))

(assert (= (and start!117742 res!922803) b!1381103))

(assert (= (and b!1381103 res!922804) b!1381104))

(declare-fun m!1266343 () Bool)

(assert (=> start!117742 m!1266343))

(declare-fun m!1266345 () Bool)

(assert (=> b!1381103 m!1266345))

(assert (=> b!1381103 m!1266345))

(declare-fun m!1266347 () Bool)

(assert (=> b!1381103 m!1266347))

(declare-fun m!1266349 () Bool)

(assert (=> b!1381104 m!1266349))

(push 1)

(assert (not b!1381103))

(assert (not b!1381104))

(assert (not start!117742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148993 () Bool)

(assert (=> d!148993 (= (validKeyInArray!0 (select (arr!45502 a!3464) from!2839)) (and (not (= (select (arr!45502 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45502 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381103 d!148993))

(declare-fun bm!66505 () Bool)

(declare-fun call!66508 () (_ BitVec 32))

(assert (=> bm!66505 (= call!66508 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(declare-fun b!1381137 () Bool)

(declare-fun e!782870 () (_ BitVec 32))

(assert (=> b!1381137 (= e!782870 call!66508)))

(declare-fun b!1381138 () Bool)

(declare-fun e!782869 () (_ BitVec 32))

(assert (=> b!1381138 (= e!782869 e!782870)))

(declare-fun c!128607 () Bool)

(assert (=> b!1381138 (= c!128607 (validKeyInArray!0 (select (arr!45502 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun d!148995 () Bool)

(declare-fun lt!608166 () (_ BitVec 32))

(assert (=> d!148995 (and (bvsge lt!608166 #b00000000000000000000000000000000) (bvsle lt!608166 (bvsub (size!46052 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (=> d!148995 (= lt!608166 e!782869)))

(declare-fun c!128606 () Bool)

(assert (=> d!148995 (= c!128606 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!148995 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46052 a!3464)))))

(assert (=> d!148995 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608166)))

(declare-fun b!1381139 () Bool)

(assert (=> b!1381139 (= e!782869 #b00000000000000000000000000000000)))

(declare-fun b!1381140 () Bool)

(assert (=> b!1381140 (= e!782870 (bvadd #b00000000000000000000000000000001 call!66508))))

(assert (= (and d!148995 c!128606) b!1381139))

(assert (= (and d!148995 (not c!128606)) b!1381138))

(assert (= (and b!1381138 c!128607) b!1381140))

(assert (= (and b!1381138 (not c!128607)) b!1381137))

(assert (= (or b!1381140 b!1381137) bm!66505))

(declare-fun m!1266363 () Bool)

(assert (=> bm!66505 m!1266363))

(declare-fun m!1266365 () Bool)

(assert (=> b!1381138 m!1266365))

(assert (=> b!1381138 m!1266365))

(declare-fun m!1266367 () Bool)

(assert (=> b!1381138 m!1266367))

(assert (=> b!1381104 d!148995))

(declare-fun d!148999 () Bool)

(assert (=> d!148999 (= (array_inv!34530 a!3464) (bvsge (size!46052 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117742 d!148999))

(push 1)

(assert (not bm!66505))

(assert (not b!1381138))

(check-sat)

