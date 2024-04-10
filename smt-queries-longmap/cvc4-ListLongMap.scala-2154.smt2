; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36220 () Bool)

(assert start!36220)

(declare-fun b!362998 () Bool)

(declare-fun res!202287 () Bool)

(declare-fun e!222300 () Bool)

(assert (=> b!362998 (=> (not res!202287) (not e!222300))))

(declare-datatypes ((array!20536 0))(
  ( (array!20537 (arr!9750 (Array (_ BitVec 32) (_ BitVec 64))) (size!10102 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20536)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362998 (= res!202287 (and (bvslt (size!10102 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10102 a!4337))))))

(declare-fun b!362999 () Bool)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20536 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362999 (= e!222300 (not (= (arrayCountValidKeys!0 (array!20537 (store (arr!9750 a!4337) i!1478 k!2980) (size!10102 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478))))))))

(declare-fun res!202285 () Bool)

(assert (=> start!36220 (=> (not res!202285) (not e!222300))))

(assert (=> start!36220 (= res!202285 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10102 a!4337))))))

(assert (=> start!36220 e!222300))

(assert (=> start!36220 true))

(declare-fun array_inv!7192 (array!20536) Bool)

(assert (=> start!36220 (array_inv!7192 a!4337)))

(declare-fun b!362997 () Bool)

(declare-fun res!202288 () Bool)

(assert (=> b!362997 (=> (not res!202288) (not e!222300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362997 (= res!202288 (validKeyInArray!0 k!2980))))

(declare-fun b!362996 () Bool)

(declare-fun res!202286 () Bool)

(assert (=> b!362996 (=> (not res!202286) (not e!222300))))

(assert (=> b!362996 (= res!202286 (not (validKeyInArray!0 (select (arr!9750 a!4337) i!1478))))))

(assert (= (and start!36220 res!202285) b!362996))

(assert (= (and b!362996 res!202286) b!362997))

(assert (= (and b!362997 res!202288) b!362998))

(assert (= (and b!362998 res!202287) b!362999))

(declare-fun m!359865 () Bool)

(assert (=> b!362999 m!359865))

(declare-fun m!359867 () Bool)

(assert (=> b!362999 m!359867))

(declare-fun m!359869 () Bool)

(assert (=> b!362999 m!359869))

(declare-fun m!359871 () Bool)

(assert (=> start!36220 m!359871))

(declare-fun m!359873 () Bool)

(assert (=> b!362997 m!359873))

(declare-fun m!359875 () Bool)

(assert (=> b!362996 m!359875))

(assert (=> b!362996 m!359875))

(declare-fun m!359877 () Bool)

(assert (=> b!362996 m!359877))

(push 1)

(assert (not b!362999))

(assert (not b!362996))

(assert (not start!36220))

(assert (not b!362997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!363040 () Bool)

(declare-fun e!222322 () (_ BitVec 32))

(declare-fun call!27224 () (_ BitVec 32))

(assert (=> b!363040 (= e!222322 (bvadd #b00000000000000000000000000000001 call!27224))))

(declare-fun bm!27221 () Bool)

(assert (=> bm!27221 (= call!27224 (arrayCountValidKeys!0 (array!20537 (store (arr!9750 a!4337) i!1478 k!2980) (size!10102 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363041 () Bool)

(assert (=> b!363041 (= e!222322 call!27224)))

(declare-fun b!363042 () Bool)

(declare-fun e!222321 () (_ BitVec 32))

(assert (=> b!363042 (= e!222321 e!222322)))

(declare-fun c!53795 () Bool)

(assert (=> b!363042 (= c!53795 (validKeyInArray!0 (select (arr!9750 (array!20537 (store (arr!9750 a!4337) i!1478 k!2980) (size!10102 a!4337))) i!1478)))))

(declare-fun b!363043 () Bool)

(assert (=> b!363043 (= e!222321 #b00000000000000000000000000000000)))

(declare-fun lt!167344 () (_ BitVec 32))

(declare-fun d!72075 () Bool)

(assert (=> d!72075 (and (bvsge lt!167344 #b00000000000000000000000000000000) (bvsle lt!167344 (bvsub (size!10102 (array!20537 (store (arr!9750 a!4337) i!1478 k!2980) (size!10102 a!4337))) i!1478)))))

(assert (=> d!72075 (= lt!167344 e!222321)))

(declare-fun c!53794 () Bool)

(assert (=> d!72075 (= c!53794 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72075 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10102 (array!20537 (store (arr!9750 a!4337) i!1478 k!2980) (size!10102 a!4337)))))))

(assert (=> d!72075 (= (arrayCountValidKeys!0 (array!20537 (store (arr!9750 a!4337) i!1478 k!2980) (size!10102 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167344)))

(assert (= (and d!72075 c!53794) b!363043))

(assert (= (and d!72075 (not c!53794)) b!363042))

(assert (= (and b!363042 c!53795) b!363040))

(assert (= (and b!363042 (not c!53795)) b!363041))

(assert (= (or b!363040 b!363041) bm!27221))

(declare-fun m!359895 () Bool)

(assert (=> bm!27221 m!359895))

(declare-fun m!359897 () Bool)

(assert (=> b!363042 m!359897))

(assert (=> b!363042 m!359897))

(declare-fun m!359899 () Bool)

(assert (=> b!363042 m!359899))

(assert (=> b!362999 d!72075))

(declare-fun b!363044 () Bool)

(declare-fun e!222324 () (_ BitVec 32))

(declare-fun call!27225 () (_ BitVec 32))

(assert (=> b!363044 (= e!222324 (bvadd #b00000000000000000000000000000001 call!27225))))

(declare-fun bm!27222 () Bool)

(assert (=> bm!27222 (= call!27225 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363045 () Bool)

(assert (=> b!363045 (= e!222324 call!27225)))

(declare-fun b!363046 () Bool)

(declare-fun e!222323 () (_ BitVec 32))

(assert (=> b!363046 (= e!222323 e!222324)))

(declare-fun c!53797 () Bool)

(assert (=> b!363046 (= c!53797 (validKeyInArray!0 (select (arr!9750 a!4337) i!1478)))))

(declare-fun b!363047 () Bool)

(assert (=> b!363047 (= e!222323 #b00000000000000000000000000000000)))

(declare-fun d!72085 () Bool)

(declare-fun lt!167345 () (_ BitVec 32))

(assert (=> d!72085 (and (bvsge lt!167345 #b00000000000000000000000000000000) (bvsle lt!167345 (bvsub (size!10102 a!4337) i!1478)))))

(assert (=> d!72085 (= lt!167345 e!222323)))

(declare-fun c!53796 () Bool)

(assert (=> d!72085 (= c!53796 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72085 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10102 a!4337)))))

(assert (=> d!72085 (= (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167345)))

(assert (= (and d!72085 c!53796) b!363047))

(assert (= (and d!72085 (not c!53796)) b!363046))

(assert (= (and b!363046 c!53797) b!363044))

(assert (= (and b!363046 (not c!53797)) b!363045))

(assert (= (or b!363044 b!363045) bm!27222))

(declare-fun m!359901 () Bool)

(assert (=> bm!27222 m!359901))

(assert (=> b!363046 m!359875))

(assert (=> b!363046 m!359875))

(assert (=> b!363046 m!359877))

(assert (=> b!362999 d!72085))

(declare-fun d!72087 () Bool)

(assert (=> d!72087 (= (validKeyInArray!0 (select (arr!9750 a!4337) i!1478)) (and (not (= (select (arr!9750 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9750 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362996 d!72087))

(declare-fun d!72089 () Bool)

(assert (=> d!72089 (= (array_inv!7192 a!4337) (bvsge (size!10102 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36220 d!72089))

(declare-fun d!72091 () Bool)

(assert (=> d!72091 (= (validKeyInArray!0 k!2980) (and (not (= k!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362997 d!72091))

(push 1)

(assert (not b!363042))

(assert (not bm!27222))

(assert (not bm!27221))

(assert (not b!363046))

(check-sat)

