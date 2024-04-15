; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117764 () Bool)

(assert start!117764)

(declare-fun res!922802 () Bool)

(declare-fun e!782862 () Bool)

(assert (=> start!117764 (=> (not res!922802) (not e!782862))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94185 0))(
  ( (array!94186 (arr!45481 (Array (_ BitVec 32) (_ BitVec 64))) (size!46033 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94185)

(assert (=> start!117764 (= res!922802 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46033 a!3464)) (bvslt (size!46033 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117764 e!782862))

(assert (=> start!117764 true))

(declare-fun array_inv!34714 (array!94185) Bool)

(assert (=> start!117764 (array_inv!34714 a!3464)))

(declare-fun b!1381094 () Bool)

(declare-fun res!922801 () Bool)

(assert (=> b!1381094 (=> (not res!922801) (not e!782862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381094 (= res!922801 (not (validKeyInArray!0 (select (arr!45481 a!3464) from!2839))))))

(declare-fun lt!607985 () (_ BitVec 32))

(declare-fun b!1381095 () Bool)

(assert (=> b!1381095 (= e!782862 (or (bvslt lt!607985 #b00000000000000000000000000000000) (bvsgt lt!607985 (bvsub (size!46033 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94185 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381095 (= lt!607985 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (= (and start!117764 res!922802) b!1381094))

(assert (= (and b!1381094 res!922801) b!1381095))

(declare-fun m!1265883 () Bool)

(assert (=> start!117764 m!1265883))

(declare-fun m!1265885 () Bool)

(assert (=> b!1381094 m!1265885))

(assert (=> b!1381094 m!1265885))

(declare-fun m!1265887 () Bool)

(assert (=> b!1381094 m!1265887))

(declare-fun m!1265889 () Bool)

(assert (=> b!1381095 m!1265889))

(check-sat (not b!1381094) (not start!117764) (not b!1381095))
(check-sat)
(get-model)

(declare-fun d!148885 () Bool)

(assert (=> d!148885 (= (validKeyInArray!0 (select (arr!45481 a!3464) from!2839)) (and (not (= (select (arr!45481 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45481 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381094 d!148885))

(declare-fun d!148887 () Bool)

(assert (=> d!148887 (= (array_inv!34714 a!3464) (bvsge (size!46033 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117764 d!148887))

(declare-fun b!1381116 () Bool)

(declare-fun e!782880 () (_ BitVec 32))

(declare-fun call!66492 () (_ BitVec 32))

(assert (=> b!1381116 (= e!782880 (bvadd #b00000000000000000000000000000001 call!66492))))

(declare-fun b!1381117 () Bool)

(declare-fun e!782881 () (_ BitVec 32))

(assert (=> b!1381117 (= e!782881 e!782880)))

(declare-fun c!128593 () Bool)

(assert (=> b!1381117 (= c!128593 (validKeyInArray!0 (select (arr!45481 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun b!1381118 () Bool)

(assert (=> b!1381118 (= e!782880 call!66492)))

(declare-fun b!1381119 () Bool)

(assert (=> b!1381119 (= e!782881 #b00000000000000000000000000000000)))

(declare-fun d!148889 () Bool)

(declare-fun lt!607994 () (_ BitVec 32))

(assert (=> d!148889 (and (bvsge lt!607994 #b00000000000000000000000000000000) (bvsle lt!607994 (bvsub (size!46033 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(assert (=> d!148889 (= lt!607994 e!782881)))

(declare-fun c!128594 () Bool)

(assert (=> d!148889 (= c!128594 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!148889 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46033 a!3464)))))

(assert (=> d!148889 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!607994)))

(declare-fun bm!66489 () Bool)

(assert (=> bm!66489 (= call!66492 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(assert (= (and d!148889 c!128594) b!1381119))

(assert (= (and d!148889 (not c!128594)) b!1381117))

(assert (= (and b!1381117 c!128593) b!1381116))

(assert (= (and b!1381117 (not c!128593)) b!1381118))

(assert (= (or b!1381116 b!1381118) bm!66489))

(declare-fun m!1265907 () Bool)

(assert (=> b!1381117 m!1265907))

(assert (=> b!1381117 m!1265907))

(declare-fun m!1265909 () Bool)

(assert (=> b!1381117 m!1265909))

(declare-fun m!1265911 () Bool)

(assert (=> bm!66489 m!1265911))

(assert (=> b!1381095 d!148889))

(check-sat (not b!1381117) (not bm!66489))
(check-sat)
