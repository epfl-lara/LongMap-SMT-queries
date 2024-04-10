; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36490 () Bool)

(assert start!36490)

(declare-fun b!364770 () Bool)

(declare-fun res!203933 () Bool)

(declare-fun e!223289 () Bool)

(assert (=> b!364770 (=> (not res!203933) (not e!223289))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20770 0))(
  ( (array!20771 (arr!9864 (Array (_ BitVec 32) (_ BitVec 64))) (size!10216 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20770)

(assert (=> b!364770 (= res!203933 (and (bvslt (size!10216 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10216 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364771 () Bool)

(declare-fun lt!168817 () (_ BitVec 32))

(declare-fun lt!168820 () (_ BitVec 32))

(declare-fun e!223290 () Bool)

(assert (=> b!364771 (= e!223290 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10216 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (= lt!168820 (bvadd #b00000000000000000000000000000001 lt!168817)))))))

(declare-fun lt!168822 () (_ BitVec 32))

(declare-fun lt!168816 () (_ BitVec 32))

(assert (=> b!364771 (= (bvadd lt!168822 lt!168816) lt!168820)))

(declare-fun lt!168819 () array!20770)

(declare-fun arrayCountValidKeys!0 (array!20770 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364771 (= lt!168820 (arrayCountValidKeys!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364771 (= lt!168822 (arrayCountValidKeys!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11362 0))(
  ( (Unit!11363) )
))
(declare-fun lt!168823 () Unit!11362)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11362)

(assert (=> b!364771 (= lt!168823 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168821 () (_ BitVec 32))

(declare-fun lt!168818 () (_ BitVec 32))

(assert (=> b!364771 (= (bvadd lt!168821 lt!168818) lt!168817)))

(assert (=> b!364771 (= lt!168817 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364771 (= lt!168821 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168815 () Unit!11362)

(assert (=> b!364771 (= lt!168815 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364772 () Bool)

(declare-fun res!203932 () Bool)

(assert (=> b!364772 (=> (not res!203932) (not e!223289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364772 (= res!203932 (not (validKeyInArray!0 (select (arr!9864 a!4289) i!1472))))))

(declare-fun b!364773 () Bool)

(assert (=> b!364773 (= e!223289 e!223290)))

(declare-fun res!203934 () Bool)

(assert (=> b!364773 (=> (not res!203934) (not e!223290))))

(assert (=> b!364773 (= res!203934 (and (= lt!168816 (bvadd #b00000000000000000000000000000001 lt!168818)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364773 (= lt!168816 (arrayCountValidKeys!0 lt!168819 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364773 (= lt!168818 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364773 (= lt!168819 (array!20771 (store (arr!9864 a!4289) i!1472 k!2974) (size!10216 a!4289)))))

(declare-fun res!203931 () Bool)

(assert (=> start!36490 (=> (not res!203931) (not e!223289))))

(assert (=> start!36490 (= res!203931 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10216 a!4289))))))

(assert (=> start!36490 e!223289))

(assert (=> start!36490 true))

(declare-fun array_inv!7306 (array!20770) Bool)

(assert (=> start!36490 (array_inv!7306 a!4289)))

(declare-fun b!364774 () Bool)

(declare-fun res!203935 () Bool)

(assert (=> b!364774 (=> (not res!203935) (not e!223289))))

(assert (=> b!364774 (= res!203935 (validKeyInArray!0 k!2974))))

(assert (= (and start!36490 res!203931) b!364772))

(assert (= (and b!364772 res!203932) b!364774))

(assert (= (and b!364774 res!203935) b!364770))

(assert (= (and b!364770 res!203933) b!364773))

(assert (= (and b!364773 res!203934) b!364771))

(declare-fun m!362475 () Bool)

(assert (=> start!36490 m!362475))

(declare-fun m!362477 () Bool)

(assert (=> b!364771 m!362477))

(declare-fun m!362479 () Bool)

(assert (=> b!364771 m!362479))

(declare-fun m!362481 () Bool)

(assert (=> b!364771 m!362481))

(declare-fun m!362483 () Bool)

(assert (=> b!364771 m!362483))

(declare-fun m!362485 () Bool)

(assert (=> b!364771 m!362485))

(declare-fun m!362487 () Bool)

(assert (=> b!364771 m!362487))

(declare-fun m!362489 () Bool)

(assert (=> b!364774 m!362489))

(declare-fun m!362491 () Bool)

(assert (=> b!364773 m!362491))

(declare-fun m!362493 () Bool)

(assert (=> b!364773 m!362493))

(declare-fun m!362495 () Bool)

(assert (=> b!364773 m!362495))

(declare-fun m!362497 () Bool)

(assert (=> b!364772 m!362497))

(assert (=> b!364772 m!362497))

(declare-fun m!362499 () Bool)

(assert (=> b!364772 m!362499))

(push 1)

(assert (not b!364771))

(assert (not b!364772))

(assert (not start!36490))

(assert (not b!364774))

(assert (not b!364773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72267 () Bool)

(assert (=> d!72267 (= (validKeyInArray!0 k!2974) (and (not (= k!2974 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2974 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364774 d!72267))

(declare-fun b!364847 () Bool)

(declare-fun e!223329 () (_ BitVec 32))

(declare-fun call!27264 () (_ BitVec 32))

(assert (=> b!364847 (= e!223329 call!27264)))

(declare-fun bm!27261 () Bool)

(assert (=> bm!27261 (= call!27264 (arrayCountValidKeys!0 lt!168819 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(declare-fun d!72269 () Bool)

(declare-fun lt!168850 () (_ BitVec 32))

(assert (=> d!72269 (and (bvsge lt!168850 #b00000000000000000000000000000000) (bvsle lt!168850 (bvsub (size!10216 lt!168819) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223328 () (_ BitVec 32))

(assert (=> d!72269 (= lt!168850 e!223328)))

(declare-fun c!53874 () Bool)

(assert (=> d!72269 (= c!53874 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72269 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10216 lt!168819)))))

(assert (=> d!72269 (= (arrayCountValidKeys!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168850)))

(declare-fun b!364848 () Bool)

(assert (=> b!364848 (= e!223328 e!223329)))

(declare-fun c!53875 () Bool)

(assert (=> b!364848 (= c!53875 (validKeyInArray!0 (select (arr!9864 lt!168819) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364849 () Bool)

(assert (=> b!364849 (= e!223329 (bvadd #b00000000000000000000000000000001 call!27264))))

(declare-fun b!364850 () Bool)

(assert (=> b!364850 (= e!223328 #b00000000000000000000000000000000)))

(assert (= (and d!72269 c!53874) b!364850))

(assert (= (and d!72269 (not c!53874)) b!364848))

(assert (= (and b!364848 c!53875) b!364849))

(assert (= (and b!364848 (not c!53875)) b!364847))

(assert (= (or b!364849 b!364847) bm!27261))

(declare-fun m!362565 () Bool)

(assert (=> bm!27261 m!362565))

(declare-fun m!362567 () Bool)

(assert (=> b!364848 m!362567))

(assert (=> b!364848 m!362567))

(declare-fun m!362569 () Bool)

(assert (=> b!364848 m!362569))

(assert (=> b!364771 d!72269))

(declare-fun b!364851 () Bool)

(declare-fun e!223331 () (_ BitVec 32))

(declare-fun call!27265 () (_ BitVec 32))

(assert (=> b!364851 (= e!223331 call!27265)))

(declare-fun bm!27262 () Bool)

(assert (=> bm!27262 (= call!27265 (arrayCountValidKeys!0 lt!168819 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun d!72271 () Bool)

(declare-fun lt!168851 () (_ BitVec 32))

(assert (=> d!72271 (and (bvsge lt!168851 #b00000000000000000000000000000000) (bvsle lt!168851 (bvsub (size!10216 lt!168819) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223330 () (_ BitVec 32))

(assert (=> d!72271 (= lt!168851 e!223330)))

(declare-fun c!53876 () Bool)

(assert (=> d!72271 (= c!53876 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72271 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10216 lt!168819)))))

(assert (=> d!72271 (= (arrayCountValidKeys!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168851)))

(declare-fun b!364852 () Bool)

(assert (=> b!364852 (= e!223330 e!223331)))

(declare-fun c!53877 () Bool)

(assert (=> b!364852 (= c!53877 (validKeyInArray!0 (select (arr!9864 lt!168819) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364853 () Bool)

(assert (=> b!364853 (= e!223331 (bvadd #b00000000000000000000000000000001 call!27265))))

(declare-fun b!364854 () Bool)

(assert (=> b!364854 (= e!223330 #b00000000000000000000000000000000)))

(assert (= (and d!72271 c!53876) b!364854))

(assert (= (and d!72271 (not c!53876)) b!364852))

(assert (= (and b!364852 c!53877) b!364853))

(assert (= (and b!364852 (not c!53877)) b!364851))

(assert (= (or b!364853 b!364851) bm!27262))

(declare-fun m!362571 () Bool)

(assert (=> bm!27262 m!362571))

(assert (=> b!364852 m!362567))

(assert (=> b!364852 m!362567))

(assert (=> b!364852 m!362569))

(assert (=> b!364771 d!72271))

(declare-fun b!364855 () Bool)

(declare-fun e!223333 () (_ BitVec 32))

(declare-fun call!27266 () (_ BitVec 32))

(assert (=> b!364855 (= e!223333 call!27266)))

(declare-fun bm!27263 () Bool)

(assert (=> bm!27263 (= call!27266 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun d!72273 () Bool)

(declare-fun lt!168852 () (_ BitVec 32))

(assert (=> d!72273 (and (bvsge lt!168852 #b00000000000000000000000000000000) (bvsle lt!168852 (bvsub (size!10216 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223332 () (_ BitVec 32))

(assert (=> d!72273 (= lt!168852 e!223332)))

(declare-fun c!53878 () Bool)

(assert (=> d!72273 (= c!53878 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72273 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10216 a!4289)))))

(assert (=> d!72273 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168852)))

(declare-fun b!364856 () Bool)

(assert (=> b!364856 (= e!223332 e!223333)))

(declare-fun c!53879 () Bool)

(assert (=> b!364856 (= c!53879 (validKeyInArray!0 (select (arr!9864 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364857 () Bool)

(assert (=> b!364857 (= e!223333 (bvadd #b00000000000000000000000000000001 call!27266))))

(declare-fun b!364858 () Bool)

(assert (=> b!364858 (= e!223332 #b00000000000000000000000000000000)))

(assert (= (and d!72273 c!53878) b!364858))

(assert (= (and d!72273 (not c!53878)) b!364856))

(assert (= (and b!364856 c!53879) b!364857))

(assert (= (and b!364856 (not c!53879)) b!364855))

(assert (= (or b!364857 b!364855) bm!27263))

(declare-fun m!362573 () Bool)

(assert (=> bm!27263 m!362573))

(declare-fun m!362575 () Bool)

(assert (=> b!364856 m!362575))

(assert (=> b!364856 m!362575))

(declare-fun m!362577 () Bool)

(assert (=> b!364856 m!362577))

(assert (=> b!364771 d!72273))

(declare-fun d!72275 () Bool)

(assert (=> d!72275 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168855 () Unit!11362)

(declare-fun choose!61 (array!20770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11362)

(assert (=> d!72275 (= lt!168855 (choose!61 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72275 (and (bvslt (size!10216 a!4289) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10216 a!4289)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72275 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168855)))

(declare-fun bs!12524 () Bool)

(assert (= bs!12524 d!72275))

(assert (=> bs!12524 m!362487))

(assert (=> bs!12524 m!362493))

(assert (=> bs!12524 m!362485))

(declare-fun m!362579 () Bool)

(assert (=> bs!12524 m!362579))

(assert (=> b!364771 d!72275))

(declare-fun b!364859 () Bool)

(declare-fun e!223335 () (_ BitVec 32))

(declare-fun call!27267 () (_ BitVec 32))

(assert (=> b!364859 (= e!223335 call!27267)))

(declare-fun bm!27264 () Bool)

(assert (=> bm!27264 (= call!27267 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(declare-fun d!72277 () Bool)

(declare-fun lt!168856 () (_ BitVec 32))

(assert (=> d!72277 (and (bvsge lt!168856 #b00000000000000000000000000000000) (bvsle lt!168856 (bvsub (size!10216 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun e!223334 () (_ BitVec 32))

(assert (=> d!72277 (= lt!168856 e!223334)))

(declare-fun c!53880 () Bool)

(assert (=> d!72277 (= c!53880 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72277 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10216 a!4289)))))

(assert (=> d!72277 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168856)))

(declare-fun b!364860 () Bool)

(assert (=> b!364860 (= e!223334 e!223335)))

(declare-fun c!53881 () Bool)

(assert (=> b!364860 (= c!53881 (validKeyInArray!0 (select (arr!9864 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun b!364861 () Bool)

(assert (=> b!364861 (= e!223335 (bvadd #b00000000000000000000000000000001 call!27267))))

(declare-fun b!364862 () Bool)

(assert (=> b!364862 (= e!223334 #b00000000000000000000000000000000)))

(assert (= (and d!72277 c!53880) b!364862))

(assert (= (and d!72277 (not c!53880)) b!364860))

(assert (= (and b!364860 c!53881) b!364861))

(assert (= (and b!364860 (not c!53881)) b!364859))

(assert (= (or b!364861 b!364859) bm!27264))

(declare-fun m!362581 () Bool)

(assert (=> bm!27264 m!362581))

(assert (=> b!364860 m!362575))

(assert (=> b!364860 m!362575))

(assert (=> b!364860 m!362577))

(assert (=> b!364771 d!72277))

(declare-fun d!72279 () Bool)

(assert (=> d!72279 (= (bvadd (arrayCountValidKeys!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 lt!168819 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168857 () Unit!11362)

(assert (=> d!72279 (= lt!168857 (choose!61 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72279 (and (bvslt (size!10216 lt!168819) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10216 lt!168819)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72279 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168819 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168857)))

(declare-fun bs!12525 () Bool)

(assert (= bs!12525 d!72279))

(assert (=> bs!12525 m!362483))

(assert (=> bs!12525 m!362491))

(assert (=> bs!12525 m!362479))

(declare-fun m!362583 () Bool)

(assert (=> bs!12525 m!362583))

(assert (=> b!364771 d!72279))

(declare-fun b!364863 () Bool)

(declare-fun e!223337 () (_ BitVec 32))

(declare-fun call!27268 () (_ BitVec 32))

(assert (=> b!364863 (= e!223337 call!27268)))

(declare-fun bm!27265 () Bool)

(assert (=> bm!27265 (= call!27268 (arrayCountValidKeys!0 lt!168819 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun d!72281 () Bool)

(declare-fun lt!168858 () (_ BitVec 32))

(assert (=> d!72281 (and (bvsge lt!168858 #b00000000000000000000000000000000) (bvsle lt!168858 (bvsub (size!10216 lt!168819) from!3650)))))

(declare-fun e!223336 () (_ BitVec 32))

(assert (=> d!72281 (= lt!168858 e!223336)))

(declare-fun c!53882 () Bool)

(assert (=> d!72281 (= c!53882 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72281 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10216 lt!168819)))))

(assert (=> d!72281 (= (arrayCountValidKeys!0 lt!168819 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168858)))

(declare-fun b!364864 () Bool)

(assert (=> b!364864 (= e!223336 e!223337)))

(declare-fun c!53883 () Bool)

(assert (=> b!364864 (= c!53883 (validKeyInArray!0 (select (arr!9864 lt!168819) from!3650)))))

(declare-fun b!364865 () Bool)

(assert (=> b!364865 (= e!223337 (bvadd #b00000000000000000000000000000001 call!27268))))

(declare-fun b!364866 () Bool)

(assert (=> b!364866 (= e!223336 #b00000000000000000000000000000000)))

(assert (= (and d!72281 c!53882) b!364866))

(assert (= (and d!72281 (not c!53882)) b!364864))

(assert (= (and b!364864 c!53883) b!364865))

(assert (= (and b!364864 (not c!53883)) b!364863))

(assert (= (or b!364865 b!364863) bm!27265))

(declare-fun m!362585 () Bool)

(assert (=> bm!27265 m!362585))

(declare-fun m!362587 () Bool)

(assert (=> b!364864 m!362587))

(assert (=> b!364864 m!362587))

(declare-fun m!362589 () Bool)

(assert (=> b!364864 m!362589))

(assert (=> b!364773 d!72281))

(declare-fun b!364867 () Bool)

(declare-fun e!223339 () (_ BitVec 32))

(declare-fun call!27269 () (_ BitVec 32))

(assert (=> b!364867 (= e!223339 call!27269)))

(declare-fun bm!27266 () Bool)

(assert (=> bm!27266 (= call!27269 (arrayCountValidKeys!0 a!4289 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun d!72283 () Bool)

(declare-fun lt!168859 () (_ BitVec 32))

(assert (=> d!72283 (and (bvsge lt!168859 #b00000000000000000000000000000000) (bvsle lt!168859 (bvsub (size!10216 a!4289) from!3650)))))

(declare-fun e!223338 () (_ BitVec 32))

(assert (=> d!72283 (= lt!168859 e!223338)))

(declare-fun c!53884 () Bool)

(assert (=> d!72283 (= c!53884 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72283 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10216 a!4289)))))

(assert (=> d!72283 (= (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168859)))

(declare-fun b!364868 () Bool)

(assert (=> b!364868 (= e!223338 e!223339)))

(declare-fun c!53885 () Bool)

(assert (=> b!364868 (= c!53885 (validKeyInArray!0 (select (arr!9864 a!4289) from!3650)))))

(declare-fun b!364869 () Bool)

(assert (=> b!364869 (= e!223339 (bvadd #b00000000000000000000000000000001 call!27269))))

(declare-fun b!364870 () Bool)

(assert (=> b!364870 (= e!223338 #b00000000000000000000000000000000)))

(assert (= (and d!72283 c!53884) b!364870))

(assert (= (and d!72283 (not c!53884)) b!364868))

(assert (= (and b!364868 c!53885) b!364869))

(assert (= (and b!364868 (not c!53885)) b!364867))

(assert (= (or b!364869 b!364867) bm!27266))

(declare-fun m!362591 () Bool)

(assert (=> bm!27266 m!362591))

(declare-fun m!362593 () Bool)

(assert (=> b!364868 m!362593))

(assert (=> b!364868 m!362593))

(declare-fun m!362595 () Bool)

(assert (=> b!364868 m!362595))

(assert (=> b!364773 d!72283))

(declare-fun d!72285 () Bool)

(assert (=> d!72285 (= (validKeyInArray!0 (select (arr!9864 a!4289) i!1472)) (and (not (= (select (arr!9864 a!4289) i!1472) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9864 a!4289) i!1472) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364772 d!72285))

(declare-fun d!72287 () Bool)

(assert (=> d!72287 (= (array_inv!7306 a!4289) (bvsge (size!10216 a!4289) #b00000000000000000000000000000000))))

(assert (=> start!36490 d!72287))

(push 1)

(assert (not d!72275))

(assert (not b!364868))

(assert (not d!72279))

(assert (not b!364852))

(assert (not b!364848))

(assert (not bm!27261))

(assert (not b!364864))

(assert (not bm!27265))

(assert (not bm!27262))

(assert (not bm!27263))

(assert (not b!364856))

(assert (not b!364860))

(assert (not bm!27266))

(assert (not bm!27264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

