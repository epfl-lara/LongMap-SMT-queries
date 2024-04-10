; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117772 () Bool)

(assert start!117772)

(declare-fun res!922839 () Bool)

(declare-fun e!782905 () Bool)

(assert (=> start!117772 (=> (not res!922839) (not e!782905))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94239 0))(
  ( (array!94240 (arr!45508 (Array (_ BitVec 32) (_ BitVec 64))) (size!46058 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94239)

(assert (=> start!117772 (= res!922839 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46058 a!3464)) (bvslt (size!46058 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117772 e!782905))

(assert (=> start!117772 true))

(declare-fun array_inv!34536 (array!94239) Bool)

(assert (=> start!117772 (array_inv!34536 a!3464)))

(declare-fun b!1381175 () Bool)

(declare-fun res!922840 () Bool)

(assert (=> b!1381175 (=> (not res!922840) (not e!782905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381175 (= res!922840 (not (validKeyInArray!0 (select (arr!45508 a!3464) from!2839))))))

(declare-fun lt!608175 () (_ BitVec 32))

(declare-fun b!1381176 () Bool)

(assert (=> b!1381176 (= e!782905 (or (bvslt lt!608175 #b00000000000000000000000000000000) (bvsgt lt!608175 (bvsub (size!46058 a!3464) from!2839))))))

(declare-fun arrayCountValidKeys!0 (array!94239 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381176 (= lt!608175 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (= (and start!117772 res!922839) b!1381175))

(assert (= (and b!1381175 res!922840) b!1381176))

(declare-fun m!1266403 () Bool)

(assert (=> start!117772 m!1266403))

(declare-fun m!1266405 () Bool)

(assert (=> b!1381175 m!1266405))

(assert (=> b!1381175 m!1266405))

(declare-fun m!1266407 () Bool)

(assert (=> b!1381175 m!1266407))

(declare-fun m!1266409 () Bool)

(assert (=> b!1381176 m!1266409))

(push 1)

(assert (not b!1381175))

(assert (not b!1381176))

(assert (not start!117772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149013 () Bool)

(assert (=> d!149013 (= (validKeyInArray!0 (select (arr!45508 a!3464) from!2839)) (and (not (= (select (arr!45508 a!3464) from!2839) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45508 a!3464) from!2839) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381175 d!149013))

(declare-fun d!149017 () Bool)

(declare-fun lt!608183 () (_ BitVec 32))

(assert (=> d!149017 (and (bvsge lt!608183 #b00000000000000000000000000000000) (bvsle lt!608183 (bvsub (size!46058 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun e!782922 () (_ BitVec 32))

(assert (=> d!149017 (= lt!608183 e!782922)))

(declare-fun c!128623 () Bool)

(assert (=> d!149017 (= c!128623 (bvsge (bvadd #b00000000000000000000000000000001 from!2839) to!94))))

(assert (=> d!149017 (and (bvsle (bvadd #b00000000000000000000000000000001 from!2839) to!94) (bvsge (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000) (bvsle to!94 (size!46058 a!3464)))))

(assert (=> d!149017 (= (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839) to!94) lt!608183)))

(declare-fun b!1381205 () Bool)

(declare-fun e!782921 () (_ BitVec 32))

(declare-fun call!66516 () (_ BitVec 32))

(assert (=> b!1381205 (= e!782921 (bvadd #b00000000000000000000000000000001 call!66516))))

(declare-fun b!1381206 () Bool)

(assert (=> b!1381206 (= e!782921 call!66516)))

(declare-fun bm!66513 () Bool)

(assert (=> bm!66513 (= call!66516 (arrayCountValidKeys!0 a!3464 (bvadd #b00000000000000000000000000000001 from!2839 #b00000000000000000000000000000001) to!94))))

(declare-fun b!1381207 () Bool)

(assert (=> b!1381207 (= e!782922 e!782921)))

(declare-fun c!128622 () Bool)

(assert (=> b!1381207 (= c!128622 (validKeyInArray!0 (select (arr!45508 a!3464) (bvadd #b00000000000000000000000000000001 from!2839))))))

(declare-fun b!1381208 () Bool)

(assert (=> b!1381208 (= e!782922 #b00000000000000000000000000000000)))

(assert (= (and d!149017 c!128623) b!1381208))

(assert (= (and d!149017 (not c!128623)) b!1381207))

(assert (= (and b!1381207 c!128622) b!1381205))

(assert (= (and b!1381207 (not c!128622)) b!1381206))

(assert (= (or b!1381205 b!1381206) bm!66513))

(declare-fun m!1266417 () Bool)

(assert (=> bm!66513 m!1266417))

(declare-fun m!1266419 () Bool)

(assert (=> b!1381207 m!1266419))

(assert (=> b!1381207 m!1266419))

(declare-fun m!1266421 () Bool)

(assert (=> b!1381207 m!1266421))

(assert (=> b!1381176 d!149017))

(declare-fun d!149021 () Bool)

(assert (=> d!149021 (= (array_inv!34536 a!3464) (bvsge (size!46058 a!3464) #b00000000000000000000000000000000))))

(assert (=> start!117772 d!149021))

(push 1)

(assert (not bm!66513))

(assert (not b!1381207))

(check-sat)

