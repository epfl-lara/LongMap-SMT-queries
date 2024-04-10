; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36084 () Bool)

(assert start!36084)

(declare-fun res!201512 () Bool)

(declare-fun e!221843 () Bool)

(assert (=> start!36084 (=> (not res!201512) (not e!221843))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20415 0))(
  ( (array!20416 (arr!9691 (Array (_ BitVec 32) (_ BitVec 64))) (size!10043 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20415)

(assert (=> start!36084 (= res!201512 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10043 a!4392))))))

(assert (=> start!36084 e!221843))

(assert (=> start!36084 true))

(declare-fun array_inv!7133 (array!20415) Bool)

(assert (=> start!36084 (array_inv!7133 a!4392)))

(declare-fun b!362179 () Bool)

(declare-fun res!201513 () Bool)

(assert (=> b!362179 (=> (not res!201513) (not e!221843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362179 (= res!201513 (validKeyInArray!0 (select (arr!9691 a!4392) i!1487)))))

(declare-fun b!362180 () Bool)

(declare-fun res!201514 () Bool)

(assert (=> b!362180 (=> (not res!201514) (not e!221843))))

(assert (=> b!362180 (= res!201514 (bvslt (size!10043 a!4392) #b01111111111111111111111111111111))))

(declare-fun b!362181 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20415 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362181 (= e!221843 (not (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) #b00000000000000000000000000000001)))))

(assert (= (and start!36084 res!201512) b!362179))

(assert (= (and b!362179 res!201513) b!362180))

(assert (= (and b!362180 res!201514) b!362181))

(declare-fun m!358715 () Bool)

(assert (=> start!36084 m!358715))

(declare-fun m!358717 () Bool)

(assert (=> b!362179 m!358717))

(assert (=> b!362179 m!358717))

(declare-fun m!358719 () Bool)

(assert (=> b!362179 m!358719))

(declare-fun m!358721 () Bool)

(assert (=> b!362181 m!358721))

(push 1)

(assert (not start!36084))

(assert (not b!362179))

(assert (not b!362181))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72009 () Bool)

(assert (=> d!72009 (= (array_inv!7133 a!4392) (bvsge (size!10043 a!4392) #b00000000000000000000000000000000))))

(assert (=> start!36084 d!72009))

(declare-fun d!72013 () Bool)

(assert (=> d!72013 (= (validKeyInArray!0 (select (arr!9691 a!4392) i!1487)) (and (not (= (select (arr!9691 a!4392) i!1487) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9691 a!4392) i!1487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362179 d!72013))

(declare-fun bm!27208 () Bool)

(declare-fun call!27211 () (_ BitVec 32))

(assert (=> bm!27208 (= call!27211 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(declare-fun d!72015 () Bool)

(declare-fun lt!166629 () (_ BitVec 32))

(assert (=> d!72015 (and (bvsge lt!166629 #b00000000000000000000000000000000) (bvsle lt!166629 (bvsub (size!10043 a!4392) i!1487)))))

(declare-fun e!221872 () (_ BitVec 32))

(assert (=> d!72015 (= lt!166629 e!221872)))

(declare-fun c!53769 () Bool)

(assert (=> d!72015 (= c!53769 (bvsge i!1487 (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!72015 (and (bvsle i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge i!1487 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10043 a!4392)))))

(assert (=> d!72015 (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) lt!166629)))

(declare-fun b!362232 () Bool)

(declare-fun e!221873 () (_ BitVec 32))

(assert (=> b!362232 (= e!221873 call!27211)))

(declare-fun b!362233 () Bool)

(assert (=> b!362233 (= e!221873 (bvadd #b00000000000000000000000000000001 call!27211))))

(declare-fun b!362234 () Bool)

(assert (=> b!362234 (= e!221872 e!221873)))

(declare-fun c!53768 () Bool)

(assert (=> b!362234 (= c!53768 (validKeyInArray!0 (select (arr!9691 a!4392) i!1487)))))

(declare-fun b!362235 () Bool)

(assert (=> b!362235 (= e!221872 #b00000000000000000000000000000000)))

(assert (= (and d!72015 c!53769) b!362235))

(assert (= (and d!72015 (not c!53769)) b!362234))

(assert (= (and b!362234 c!53768) b!362233))

(assert (= (and b!362234 (not c!53768)) b!362232))

(assert (= (or b!362233 b!362232) bm!27208))

(declare-fun m!358743 () Bool)

(assert (=> bm!27208 m!358743))

(assert (=> b!362234 m!358717))

(assert (=> b!362234 m!358717))

(assert (=> b!362234 m!358719))

(assert (=> b!362181 d!72015))

(push 1)

(assert (not b!362234))

(assert (not bm!27208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!362234 d!72013))

(declare-fun bm!27210 () Bool)

(declare-fun call!27213 () (_ BitVec 32))

(assert (=> bm!27210 (= call!27213 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(declare-fun d!72023 () Bool)

(declare-fun lt!166631 () (_ BitVec 32))

(assert (=> d!72023 (and (bvsge lt!166631 #b00000000000000000000000000000000) (bvsle lt!166631 (bvsub (size!10043 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(declare-fun e!221876 () (_ BitVec 32))

(assert (=> d!72023 (= lt!166631 e!221876)))

(declare-fun c!53773 () Bool)

(assert (=> d!72023 (= c!53773 (bvsge (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!72023 (and (bvsle (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge (bvadd i!1487 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10043 a!4392)))))

(assert (=> d!72023 (= (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)) lt!166631)))

(declare-fun b!362240 () Bool)

(declare-fun e!221877 () (_ BitVec 32))

(assert (=> b!362240 (= e!221877 call!27213)))

(declare-fun b!362241 () Bool)

(assert (=> b!362241 (= e!221877 (bvadd #b00000000000000000000000000000001 call!27213))))

(declare-fun b!362242 () Bool)

(assert (=> b!362242 (= e!221876 e!221877)))

(declare-fun c!53772 () Bool)

(assert (=> b!362242 (= c!53772 (validKeyInArray!0 (select (arr!9691 a!4392) (bvadd i!1487 #b00000000000000000000000000000001))))))

(declare-fun b!362243 () Bool)

(assert (=> b!362243 (= e!221876 #b00000000000000000000000000000000)))

(assert (= (and d!72023 c!53773) b!362243))

(assert (= (and d!72023 (not c!53773)) b!362242))

(assert (= (and b!362242 c!53772) b!362241))

(assert (= (and b!362242 (not c!53772)) b!362240))

(assert (= (or b!362241 b!362240) bm!27210))

(declare-fun m!358751 () Bool)

(assert (=> bm!27210 m!358751))

(declare-fun m!358753 () Bool)

(assert (=> b!362242 m!358753))

