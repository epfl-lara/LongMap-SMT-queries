; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36216 () Bool)

(assert start!36216)

(declare-fun b!362974 () Bool)

(declare-fun res!202264 () Bool)

(declare-fun e!222287 () Bool)

(assert (=> b!362974 (=> (not res!202264) (not e!222287))))

(declare-datatypes ((array!20532 0))(
  ( (array!20533 (arr!9748 (Array (_ BitVec 32) (_ BitVec 64))) (size!10100 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20532)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362974 (= res!202264 (and (bvslt (size!10100 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10100 a!4337))))))

(declare-fun b!362975 () Bool)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20532 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362975 (= e!222287 (not (= (arrayCountValidKeys!0 (array!20533 (store (arr!9748 a!4337) i!1478 k!2980) (size!10100 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478))))))))

(declare-fun res!202262 () Bool)

(assert (=> start!36216 (=> (not res!202262) (not e!222287))))

(assert (=> start!36216 (= res!202262 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10100 a!4337))))))

(assert (=> start!36216 e!222287))

(assert (=> start!36216 true))

(declare-fun array_inv!7190 (array!20532) Bool)

(assert (=> start!36216 (array_inv!7190 a!4337)))

(declare-fun b!362972 () Bool)

(declare-fun res!202263 () Bool)

(assert (=> b!362972 (=> (not res!202263) (not e!222287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362972 (= res!202263 (not (validKeyInArray!0 (select (arr!9748 a!4337) i!1478))))))

(declare-fun b!362973 () Bool)

(declare-fun res!202261 () Bool)

(assert (=> b!362973 (=> (not res!202261) (not e!222287))))

(assert (=> b!362973 (= res!202261 (validKeyInArray!0 k!2980))))

(assert (= (and start!36216 res!202262) b!362972))

(assert (= (and b!362972 res!202263) b!362973))

(assert (= (and b!362973 res!202261) b!362974))

(assert (= (and b!362974 res!202264) b!362975))

(declare-fun m!359837 () Bool)

(assert (=> b!362975 m!359837))

(declare-fun m!359839 () Bool)

(assert (=> b!362975 m!359839))

(declare-fun m!359841 () Bool)

(assert (=> b!362975 m!359841))

(declare-fun m!359843 () Bool)

(assert (=> start!36216 m!359843))

(declare-fun m!359845 () Bool)

(assert (=> b!362972 m!359845))

(assert (=> b!362972 m!359845))

(declare-fun m!359847 () Bool)

(assert (=> b!362972 m!359847))

(declare-fun m!359849 () Bool)

(assert (=> b!362973 m!359849))

(push 1)

(assert (not b!362975))

(assert (not b!362972))

(assert (not start!36216))

(assert (not b!362973))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!27217 () Bool)

(declare-fun call!27220 () (_ BitVec 32))

(assert (=> bm!27217 (= call!27220 (arrayCountValidKeys!0 (array!20533 (store (arr!9748 a!4337) i!1478 k!2980) (size!10100 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363028 () Bool)

(declare-fun e!222316 () (_ BitVec 32))

(assert (=> b!363028 (= e!222316 (bvadd #b00000000000000000000000000000001 call!27220))))

(declare-fun b!363029 () Bool)

(declare-fun e!222315 () (_ BitVec 32))

(assert (=> b!363029 (= e!222315 e!222316)))

(declare-fun c!53789 () Bool)

(assert (=> b!363029 (= c!53789 (validKeyInArray!0 (select (arr!9748 (array!20533 (store (arr!9748 a!4337) i!1478 k!2980) (size!10100 a!4337))) i!1478)))))

(declare-fun b!363030 () Bool)

(assert (=> b!363030 (= e!222316 call!27220)))

(declare-fun b!363031 () Bool)

(assert (=> b!363031 (= e!222315 #b00000000000000000000000000000000)))

(declare-fun d!72073 () Bool)

(declare-fun lt!167342 () (_ BitVec 32))

(assert (=> d!72073 (and (bvsge lt!167342 #b00000000000000000000000000000000) (bvsle lt!167342 (bvsub (size!10100 (array!20533 (store (arr!9748 a!4337) i!1478 k!2980) (size!10100 a!4337))) i!1478)))))

(assert (=> d!72073 (= lt!167342 e!222315)))

(declare-fun c!53788 () Bool)

(assert (=> d!72073 (= c!53788 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72073 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10100 (array!20533 (store (arr!9748 a!4337) i!1478 k!2980) (size!10100 a!4337)))))))

(assert (=> d!72073 (= (arrayCountValidKeys!0 (array!20533 (store (arr!9748 a!4337) i!1478 k!2980) (size!10100 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167342)))

(assert (= (and d!72073 c!53788) b!363031))

(assert (= (and d!72073 (not c!53788)) b!363029))

(assert (= (and b!363029 c!53789) b!363028))

(assert (= (and b!363029 (not c!53789)) b!363030))

(assert (= (or b!363028 b!363030) bm!27217))

(declare-fun m!359887 () Bool)

(assert (=> bm!27217 m!359887))

(declare-fun m!359889 () Bool)

(assert (=> b!363029 m!359889))

(assert (=> b!363029 m!359889))

(declare-fun m!359891 () Bool)

(assert (=> b!363029 m!359891))

(assert (=> b!362975 d!72073))

(declare-fun bm!27220 () Bool)

(declare-fun call!27223 () (_ BitVec 32))

(assert (=> bm!27220 (= call!27223 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363036 () Bool)

(declare-fun e!222320 () (_ BitVec 32))

(assert (=> b!363036 (= e!222320 (bvadd #b00000000000000000000000000000001 call!27223))))

(declare-fun b!363037 () Bool)

(declare-fun e!222319 () (_ BitVec 32))

(assert (=> b!363037 (= e!222319 e!222320)))

(declare-fun c!53793 () Bool)

(assert (=> b!363037 (= c!53793 (validKeyInArray!0 (select (arr!9748 a!4337) i!1478)))))

(declare-fun b!363038 () Bool)

(assert (=> b!363038 (= e!222320 call!27223)))

(declare-fun b!363039 () Bool)

(assert (=> b!363039 (= e!222319 #b00000000000000000000000000000000)))

(declare-fun d!72077 () Bool)

(declare-fun lt!167343 () (_ BitVec 32))

(assert (=> d!72077 (and (bvsge lt!167343 #b00000000000000000000000000000000) (bvsle lt!167343 (bvsub (size!10100 a!4337) i!1478)))))

(assert (=> d!72077 (= lt!167343 e!222319)))

(declare-fun c!53792 () Bool)

(assert (=> d!72077 (= c!53792 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72077 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10100 a!4337)))))

(assert (=> d!72077 (= (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167343)))

(assert (= (and d!72077 c!53792) b!363039))

(assert (= (and d!72077 (not c!53792)) b!363037))

(assert (= (and b!363037 c!53793) b!363036))

(assert (= (and b!363037 (not c!53793)) b!363038))

(assert (= (or b!363036 b!363038) bm!27220))

(declare-fun m!359893 () Bool)

(assert (=> bm!27220 m!359893))

(assert (=> b!363037 m!359845))

(assert (=> b!363037 m!359845))

(assert (=> b!363037 m!359847))

(assert (=> b!362975 d!72077))

(declare-fun d!72079 () Bool)

(assert (=> d!72079 (= (validKeyInArray!0 (select (arr!9748 a!4337) i!1478)) (and (not (= (select (arr!9748 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9748 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362972 d!72079))

(declare-fun d!72081 () Bool)

(assert (=> d!72081 (= (array_inv!7190 a!4337) (bvsge (size!10100 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36216 d!72081))

(declare-fun d!72083 () Bool)

(assert (=> d!72083 (= (validKeyInArray!0 k!2980) (and (not (= k!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362973 d!72083))

(push 1)

(assert (not bm!27220))

(assert (not bm!27217))

(assert (not b!363037))

(assert (not b!363029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

