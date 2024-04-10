; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36088 () Bool)

(assert start!36088)

(declare-fun res!201532 () Bool)

(declare-fun e!221855 () Bool)

(assert (=> start!36088 (=> (not res!201532) (not e!221855))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20419 0))(
  ( (array!20420 (arr!9693 (Array (_ BitVec 32) (_ BitVec 64))) (size!10045 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20419)

(assert (=> start!36088 (= res!201532 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10045 a!4392))))))

(assert (=> start!36088 e!221855))

(assert (=> start!36088 true))

(declare-fun array_inv!7135 (array!20419) Bool)

(assert (=> start!36088 (array_inv!7135 a!4392)))

(declare-fun b!362197 () Bool)

(declare-fun res!201530 () Bool)

(assert (=> b!362197 (=> (not res!201530) (not e!221855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362197 (= res!201530 (validKeyInArray!0 (select (arr!9693 a!4392) i!1487)))))

(declare-fun b!362198 () Bool)

(declare-fun res!201531 () Bool)

(assert (=> b!362198 (=> (not res!201531) (not e!221855))))

(assert (=> b!362198 (= res!201531 (bvslt (size!10045 a!4392) #b01111111111111111111111111111111))))

(declare-fun b!362199 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362199 (= e!221855 (not (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) #b00000000000000000000000000000001)))))

(assert (= (and start!36088 res!201532) b!362197))

(assert (= (and b!362197 res!201530) b!362198))

(assert (= (and b!362198 res!201531) b!362199))

(declare-fun m!358731 () Bool)

(assert (=> start!36088 m!358731))

(declare-fun m!358733 () Bool)

(assert (=> b!362197 m!358733))

(assert (=> b!362197 m!358733))

(declare-fun m!358735 () Bool)

(assert (=> b!362197 m!358735))

(declare-fun m!358737 () Bool)

(assert (=> b!362199 m!358737))

(push 1)

(assert (not b!362199))

(assert (not start!36088))

(assert (not b!362197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72011 () Bool)

(declare-fun lt!166628 () (_ BitVec 32))

(assert (=> d!72011 (and (bvsge lt!166628 #b00000000000000000000000000000000) (bvsle lt!166628 (bvsub (size!10045 a!4392) i!1487)))))

(declare-fun e!221870 () (_ BitVec 32))

(assert (=> d!72011 (= lt!166628 e!221870)))

(declare-fun c!53767 () Bool)

(assert (=> d!72011 (= c!53767 (bvsge i!1487 (bvadd #b00000000000000000000000000000001 i!1487)))))

(assert (=> d!72011 (and (bvsle i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) (bvsge i!1487 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1487) (size!10045 a!4392)))))

(assert (=> d!72011 (= (arrayCountValidKeys!0 a!4392 i!1487 (bvadd #b00000000000000000000000000000001 i!1487)) lt!166628)))

(declare-fun bm!27207 () Bool)

(declare-fun call!27210 () (_ BitVec 32))

(assert (=> bm!27207 (= call!27210 (arrayCountValidKeys!0 a!4392 (bvadd i!1487 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1487)))))

(declare-fun b!362228 () Bool)

(declare-fun e!221871 () (_ BitVec 32))

(assert (=> b!362228 (= e!221870 e!221871)))

(declare-fun c!53766 () Bool)

(assert (=> b!362228 (= c!53766 (validKeyInArray!0 (select (arr!9693 a!4392) i!1487)))))

(declare-fun b!362229 () Bool)

(assert (=> b!362229 (= e!221871 (bvadd #b00000000000000000000000000000001 call!27210))))

(declare-fun b!362230 () Bool)

(assert (=> b!362230 (= e!221870 #b00000000000000000000000000000000)))

(declare-fun b!362231 () Bool)

(assert (=> b!362231 (= e!221871 call!27210)))

(assert (= (and d!72011 c!53767) b!362230))

(assert (= (and d!72011 (not c!53767)) b!362228))

(assert (= (and b!362228 c!53766) b!362229))

(assert (= (and b!362228 (not c!53766)) b!362231))

(assert (= (or b!362229 b!362231) bm!27207))

(declare-fun m!358741 () Bool)

(assert (=> bm!27207 m!358741))

(assert (=> b!362228 m!358733))

(assert (=> b!362228 m!358733))

(assert (=> b!362228 m!358735))

(assert (=> b!362199 d!72011))

(declare-fun d!72017 () Bool)

(assert (=> d!72017 (= (array_inv!7135 a!4392) (bvsge (size!10045 a!4392) #b00000000000000000000000000000000))))

(assert (=> start!36088 d!72017))

(declare-fun d!72019 () Bool)

(assert (=> d!72019 (= (validKeyInArray!0 (select (arr!9693 a!4392) i!1487)) (and (not (= (select (arr!9693 a!4392) i!1487) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9693 a!4392) i!1487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362197 d!72019))

(push 1)

(assert (not b!362228))

(assert (not bm!27207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

