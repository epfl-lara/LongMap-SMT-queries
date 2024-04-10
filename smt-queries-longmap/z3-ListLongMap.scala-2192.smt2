; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36488 () Bool)

(assert start!36488)

(declare-fun b!364755 () Bool)

(declare-fun res!203917 () Bool)

(declare-fun e!223282 () Bool)

(assert (=> b!364755 (=> (not res!203917) (not e!223282))))

(declare-datatypes ((array!20768 0))(
  ( (array!20769 (arr!9863 (Array (_ BitVec 32) (_ BitVec 64))) (size!10215 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20768)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364755 (= res!203917 (not (validKeyInArray!0 (select (arr!9863 a!4289) i!1472))))))

(declare-fun b!364756 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168788 () (_ BitVec 32))

(declare-fun e!223281 () Bool)

(declare-fun lt!168790 () (_ BitVec 32))

(assert (=> b!364756 (= e!223281 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10215 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (= lt!168788 (bvadd #b00000000000000000000000000000001 lt!168790)))))))

(declare-fun lt!168791 () (_ BitVec 32))

(declare-fun lt!168794 () (_ BitVec 32))

(assert (=> b!364756 (= (bvadd lt!168791 lt!168794) lt!168788)))

(declare-fun lt!168796 () array!20768)

(declare-fun arrayCountValidKeys!0 (array!20768 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364756 (= lt!168788 (arrayCountValidKeys!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364756 (= lt!168791 (arrayCountValidKeys!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11360 0))(
  ( (Unit!11361) )
))
(declare-fun lt!168789 () Unit!11360)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11360)

(assert (=> b!364756 (= lt!168789 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168792 () (_ BitVec 32))

(declare-fun lt!168793 () (_ BitVec 32))

(assert (=> b!364756 (= (bvadd lt!168792 lt!168793) lt!168790)))

(assert (=> b!364756 (= lt!168790 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364756 (= lt!168792 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168795 () Unit!11360)

(assert (=> b!364756 (= lt!168795 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203919 () Bool)

(assert (=> start!36488 (=> (not res!203919) (not e!223282))))

(assert (=> start!36488 (= res!203919 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10215 a!4289))))))

(assert (=> start!36488 e!223282))

(assert (=> start!36488 true))

(declare-fun array_inv!7305 (array!20768) Bool)

(assert (=> start!36488 (array_inv!7305 a!4289)))

(declare-fun b!364757 () Bool)

(declare-fun res!203920 () Bool)

(assert (=> b!364757 (=> (not res!203920) (not e!223282))))

(assert (=> b!364757 (= res!203920 (and (bvslt (size!10215 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10215 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364758 () Bool)

(declare-fun res!203918 () Bool)

(assert (=> b!364758 (=> (not res!203918) (not e!223282))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364758 (= res!203918 (validKeyInArray!0 k0!2974))))

(declare-fun b!364759 () Bool)

(assert (=> b!364759 (= e!223282 e!223281)))

(declare-fun res!203916 () Bool)

(assert (=> b!364759 (=> (not res!203916) (not e!223281))))

(assert (=> b!364759 (= res!203916 (and (= lt!168794 (bvadd #b00000000000000000000000000000001 lt!168793)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364759 (= lt!168794 (arrayCountValidKeys!0 lt!168796 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364759 (= lt!168793 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364759 (= lt!168796 (array!20769 (store (arr!9863 a!4289) i!1472 k0!2974) (size!10215 a!4289)))))

(assert (= (and start!36488 res!203919) b!364755))

(assert (= (and b!364755 res!203917) b!364758))

(assert (= (and b!364758 res!203918) b!364757))

(assert (= (and b!364757 res!203920) b!364759))

(assert (= (and b!364759 res!203916) b!364756))

(declare-fun m!362449 () Bool)

(assert (=> b!364755 m!362449))

(assert (=> b!364755 m!362449))

(declare-fun m!362451 () Bool)

(assert (=> b!364755 m!362451))

(declare-fun m!362453 () Bool)

(assert (=> b!364759 m!362453))

(declare-fun m!362455 () Bool)

(assert (=> b!364759 m!362455))

(declare-fun m!362457 () Bool)

(assert (=> b!364759 m!362457))

(declare-fun m!362459 () Bool)

(assert (=> start!36488 m!362459))

(declare-fun m!362461 () Bool)

(assert (=> b!364758 m!362461))

(declare-fun m!362463 () Bool)

(assert (=> b!364756 m!362463))

(declare-fun m!362465 () Bool)

(assert (=> b!364756 m!362465))

(declare-fun m!362467 () Bool)

(assert (=> b!364756 m!362467))

(declare-fun m!362469 () Bool)

(assert (=> b!364756 m!362469))

(declare-fun m!362471 () Bool)

(assert (=> b!364756 m!362471))

(declare-fun m!362473 () Bool)

(assert (=> b!364756 m!362473))

(check-sat (not b!364755) (not b!364756) (not start!36488) (not b!364759) (not b!364758))
(check-sat)
(get-model)

(declare-fun b!364783 () Bool)

(declare-fun e!223297 () (_ BitVec 32))

(declare-fun call!27248 () (_ BitVec 32))

(assert (=> b!364783 (= e!223297 call!27248)))

(declare-fun b!364784 () Bool)

(declare-fun e!223296 () (_ BitVec 32))

(assert (=> b!364784 (= e!223296 #b00000000000000000000000000000000)))

(declare-fun b!364785 () Bool)

(assert (=> b!364785 (= e!223296 e!223297)))

(declare-fun c!53842 () Bool)

(assert (=> b!364785 (= c!53842 (validKeyInArray!0 (select (arr!9863 lt!168796) from!3650)))))

(declare-fun d!72223 () Bool)

(declare-fun lt!168826 () (_ BitVec 32))

(assert (=> d!72223 (and (bvsge lt!168826 #b00000000000000000000000000000000) (bvsle lt!168826 (bvsub (size!10215 lt!168796) from!3650)))))

(assert (=> d!72223 (= lt!168826 e!223296)))

(declare-fun c!53843 () Bool)

(assert (=> d!72223 (= c!53843 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72223 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10215 lt!168796)))))

(assert (=> d!72223 (= (arrayCountValidKeys!0 lt!168796 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168826)))

(declare-fun bm!27245 () Bool)

(assert (=> bm!27245 (= call!27248 (arrayCountValidKeys!0 lt!168796 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364786 () Bool)

(assert (=> b!364786 (= e!223297 (bvadd #b00000000000000000000000000000001 call!27248))))

(assert (= (and d!72223 c!53843) b!364784))

(assert (= (and d!72223 (not c!53843)) b!364785))

(assert (= (and b!364785 c!53842) b!364786))

(assert (= (and b!364785 (not c!53842)) b!364783))

(assert (= (or b!364786 b!364783) bm!27245))

(declare-fun m!362501 () Bool)

(assert (=> b!364785 m!362501))

(assert (=> b!364785 m!362501))

(declare-fun m!362503 () Bool)

(assert (=> b!364785 m!362503))

(declare-fun m!362505 () Bool)

(assert (=> bm!27245 m!362505))

(assert (=> b!364759 d!72223))

(declare-fun b!364787 () Bool)

(declare-fun e!223299 () (_ BitVec 32))

(declare-fun call!27249 () (_ BitVec 32))

(assert (=> b!364787 (= e!223299 call!27249)))

(declare-fun b!364788 () Bool)

(declare-fun e!223298 () (_ BitVec 32))

(assert (=> b!364788 (= e!223298 #b00000000000000000000000000000000)))

(declare-fun b!364789 () Bool)

(assert (=> b!364789 (= e!223298 e!223299)))

(declare-fun c!53844 () Bool)

(assert (=> b!364789 (= c!53844 (validKeyInArray!0 (select (arr!9863 a!4289) from!3650)))))

(declare-fun d!72225 () Bool)

(declare-fun lt!168827 () (_ BitVec 32))

(assert (=> d!72225 (and (bvsge lt!168827 #b00000000000000000000000000000000) (bvsle lt!168827 (bvsub (size!10215 a!4289) from!3650)))))

(assert (=> d!72225 (= lt!168827 e!223298)))

(declare-fun c!53845 () Bool)

(assert (=> d!72225 (= c!53845 (bvsge from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72225 (and (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10215 a!4289)))))

(assert (=> d!72225 (= (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) lt!168827)))

(declare-fun bm!27246 () Bool)

(assert (=> bm!27246 (= call!27249 (arrayCountValidKeys!0 a!4289 (bvadd from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364790 () Bool)

(assert (=> b!364790 (= e!223299 (bvadd #b00000000000000000000000000000001 call!27249))))

(assert (= (and d!72225 c!53845) b!364788))

(assert (= (and d!72225 (not c!53845)) b!364789))

(assert (= (and b!364789 c!53844) b!364790))

(assert (= (and b!364789 (not c!53844)) b!364787))

(assert (= (or b!364790 b!364787) bm!27246))

(declare-fun m!362507 () Bool)

(assert (=> b!364789 m!362507))

(assert (=> b!364789 m!362507))

(declare-fun m!362509 () Bool)

(assert (=> b!364789 m!362509))

(declare-fun m!362511 () Bool)

(assert (=> bm!27246 m!362511))

(assert (=> b!364759 d!72225))

(declare-fun d!72227 () Bool)

(assert (=> d!72227 (= (validKeyInArray!0 k0!2974) (and (not (= k0!2974 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2974 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364758 d!72227))

(declare-fun d!72229 () Bool)

(assert (=> d!72229 (= (validKeyInArray!0 (select (arr!9863 a!4289) i!1472)) (and (not (= (select (arr!9863 a!4289) i!1472) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9863 a!4289) i!1472) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!364755 d!72229))

(declare-fun b!364791 () Bool)

(declare-fun e!223301 () (_ BitVec 32))

(declare-fun call!27250 () (_ BitVec 32))

(assert (=> b!364791 (= e!223301 call!27250)))

(declare-fun b!364792 () Bool)

(declare-fun e!223300 () (_ BitVec 32))

(assert (=> b!364792 (= e!223300 #b00000000000000000000000000000000)))

(declare-fun b!364793 () Bool)

(assert (=> b!364793 (= e!223300 e!223301)))

(declare-fun c!53846 () Bool)

(assert (=> b!364793 (= c!53846 (validKeyInArray!0 (select (arr!9863 lt!168796) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun d!72231 () Bool)

(declare-fun lt!168828 () (_ BitVec 32))

(assert (=> d!72231 (and (bvsge lt!168828 #b00000000000000000000000000000000) (bvsle lt!168828 (bvsub (size!10215 lt!168796) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72231 (= lt!168828 e!223300)))

(declare-fun c!53847 () Bool)

(assert (=> d!72231 (= c!53847 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72231 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10215 lt!168796)))))

(assert (=> d!72231 (= (arrayCountValidKeys!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168828)))

(declare-fun bm!27247 () Bool)

(assert (=> bm!27247 (= call!27250 (arrayCountValidKeys!0 lt!168796 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(declare-fun b!364794 () Bool)

(assert (=> b!364794 (= e!223301 (bvadd #b00000000000000000000000000000001 call!27250))))

(assert (= (and d!72231 c!53847) b!364792))

(assert (= (and d!72231 (not c!53847)) b!364793))

(assert (= (and b!364793 c!53846) b!364794))

(assert (= (and b!364793 (not c!53846)) b!364791))

(assert (= (or b!364794 b!364791) bm!27247))

(declare-fun m!362513 () Bool)

(assert (=> b!364793 m!362513))

(assert (=> b!364793 m!362513))

(declare-fun m!362515 () Bool)

(assert (=> b!364793 m!362515))

(declare-fun m!362517 () Bool)

(assert (=> bm!27247 m!362517))

(assert (=> b!364756 d!72231))

(declare-fun b!364795 () Bool)

(declare-fun e!223303 () (_ BitVec 32))

(declare-fun call!27251 () (_ BitVec 32))

(assert (=> b!364795 (= e!223303 call!27251)))

(declare-fun b!364796 () Bool)

(declare-fun e!223302 () (_ BitVec 32))

(assert (=> b!364796 (= e!223302 #b00000000000000000000000000000000)))

(declare-fun b!364797 () Bool)

(assert (=> b!364797 (= e!223302 e!223303)))

(declare-fun c!53848 () Bool)

(assert (=> b!364797 (= c!53848 (validKeyInArray!0 (select (arr!9863 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun d!72233 () Bool)

(declare-fun lt!168829 () (_ BitVec 32))

(assert (=> d!72233 (and (bvsge lt!168829 #b00000000000000000000000000000000) (bvsle lt!168829 (bvsub (size!10215 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72233 (= lt!168829 e!223302)))

(declare-fun c!53849 () Bool)

(assert (=> d!72233 (= c!53849 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(assert (=> d!72233 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3650 (size!10215 a!4289)))))

(assert (=> d!72233 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168829)))

(declare-fun bm!27248 () Bool)

(assert (=> bm!27248 (= call!27251 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3650))))

(declare-fun b!364798 () Bool)

(assert (=> b!364798 (= e!223303 (bvadd #b00000000000000000000000000000001 call!27251))))

(assert (= (and d!72233 c!53849) b!364796))

(assert (= (and d!72233 (not c!53849)) b!364797))

(assert (= (and b!364797 c!53848) b!364798))

(assert (= (and b!364797 (not c!53848)) b!364795))

(assert (= (or b!364798 b!364795) bm!27248))

(declare-fun m!362519 () Bool)

(assert (=> b!364797 m!362519))

(assert (=> b!364797 m!362519))

(declare-fun m!362521 () Bool)

(assert (=> b!364797 m!362521))

(declare-fun m!362523 () Bool)

(assert (=> bm!27248 m!362523))

(assert (=> b!364756 d!72233))

(declare-fun b!364799 () Bool)

(declare-fun e!223305 () (_ BitVec 32))

(declare-fun call!27252 () (_ BitVec 32))

(assert (=> b!364799 (= e!223305 call!27252)))

(declare-fun b!364800 () Bool)

(declare-fun e!223304 () (_ BitVec 32))

(assert (=> b!364800 (= e!223304 #b00000000000000000000000000000000)))

(declare-fun b!364801 () Bool)

(assert (=> b!364801 (= e!223304 e!223305)))

(declare-fun c!53850 () Bool)

(assert (=> b!364801 (= c!53850 (validKeyInArray!0 (select (arr!9863 lt!168796) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun d!72235 () Bool)

(declare-fun lt!168830 () (_ BitVec 32))

(assert (=> d!72235 (and (bvsge lt!168830 #b00000000000000000000000000000000) (bvsle lt!168830 (bvsub (size!10215 lt!168796) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72235 (= lt!168830 e!223304)))

(declare-fun c!53851 () Bool)

(assert (=> d!72235 (= c!53851 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72235 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10215 lt!168796)))))

(assert (=> d!72235 (= (arrayCountValidKeys!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168830)))

(declare-fun bm!27249 () Bool)

(assert (=> bm!27249 (= call!27252 (arrayCountValidKeys!0 lt!168796 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364802 () Bool)

(assert (=> b!364802 (= e!223305 (bvadd #b00000000000000000000000000000001 call!27252))))

(assert (= (and d!72235 c!53851) b!364800))

(assert (= (and d!72235 (not c!53851)) b!364801))

(assert (= (and b!364801 c!53850) b!364802))

(assert (= (and b!364801 (not c!53850)) b!364799))

(assert (= (or b!364802 b!364799) bm!27249))

(assert (=> b!364801 m!362513))

(assert (=> b!364801 m!362513))

(assert (=> b!364801 m!362515))

(declare-fun m!362525 () Bool)

(assert (=> bm!27249 m!362525))

(assert (=> b!364756 d!72235))

(declare-fun b!364803 () Bool)

(declare-fun e!223307 () (_ BitVec 32))

(declare-fun call!27253 () (_ BitVec 32))

(assert (=> b!364803 (= e!223307 call!27253)))

(declare-fun b!364804 () Bool)

(declare-fun e!223306 () (_ BitVec 32))

(assert (=> b!364804 (= e!223306 #b00000000000000000000000000000000)))

(declare-fun b!364805 () Bool)

(assert (=> b!364805 (= e!223306 e!223307)))

(declare-fun c!53852 () Bool)

(assert (=> b!364805 (= c!53852 (validKeyInArray!0 (select (arr!9863 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(declare-fun d!72237 () Bool)

(declare-fun lt!168831 () (_ BitVec 32))

(assert (=> d!72237 (and (bvsge lt!168831 #b00000000000000000000000000000000) (bvsle lt!168831 (bvsub (size!10215 a!4289) (bvsub from!3650 #b00000000000000000000000000000001))))))

(assert (=> d!72237 (= lt!168831 e!223306)))

(declare-fun c!53853 () Bool)

(assert (=> d!72237 (= c!53853 (bvsge (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72237 (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10215 a!4289)))))

(assert (=> d!72237 (= (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)) lt!168831)))

(declare-fun bm!27250 () Bool)

(assert (=> bm!27250 (= call!27253 (arrayCountValidKeys!0 a!4289 (bvadd (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364806 () Bool)

(assert (=> b!364806 (= e!223307 (bvadd #b00000000000000000000000000000001 call!27253))))

(assert (= (and d!72237 c!53853) b!364804))

(assert (= (and d!72237 (not c!53853)) b!364805))

(assert (= (and b!364805 c!53852) b!364806))

(assert (= (and b!364805 (not c!53852)) b!364803))

(assert (= (or b!364806 b!364803) bm!27250))

(assert (=> b!364805 m!362519))

(assert (=> b!364805 m!362519))

(assert (=> b!364805 m!362521))

(declare-fun m!362527 () Bool)

(assert (=> bm!27250 m!362527))

(assert (=> b!364756 d!72237))

(declare-fun d!72239 () Bool)

(assert (=> d!72239 (= (bvadd (arrayCountValidKeys!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 lt!168796 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168836 () Unit!11360)

(declare-fun choose!61 (array!20768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11360)

(assert (=> d!72239 (= lt!168836 (choose!61 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72239 (and (bvslt (size!10215 lt!168796) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10215 lt!168796)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72239 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168796 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168836)))

(declare-fun bs!12520 () Bool)

(assert (= bs!12520 d!72239))

(assert (=> bs!12520 m!362465))

(assert (=> bs!12520 m!362453))

(assert (=> bs!12520 m!362467))

(declare-fun m!362529 () Bool)

(assert (=> bs!12520 m!362529))

(assert (=> b!364756 d!72239))

(declare-fun d!72245 () Bool)

(assert (=> d!72245 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472))) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168837 () Unit!11360)

(assert (=> d!72245 (= lt!168837 (choose!61 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> d!72245 (and (bvslt (size!10215 a!4289) #b01111111111111111111111111111111) (bvsge (bvsub from!3650 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1472) (size!10215 a!4289)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> d!72245 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650) lt!168837)))

(declare-fun bs!12521 () Bool)

(assert (= bs!12521 d!72245))

(assert (=> bs!12521 m!362473))

(assert (=> bs!12521 m!362455))

(assert (=> bs!12521 m!362471))

(declare-fun m!362531 () Bool)

(assert (=> bs!12521 m!362531))

(assert (=> b!364756 d!72245))

(declare-fun d!72247 () Bool)

(assert (=> d!72247 (= (array_inv!7305 a!4289) (bvsge (size!10215 a!4289) #b00000000000000000000000000000000))))

(assert (=> start!36488 d!72247))

(check-sat (not b!364789) (not bm!27248) (not b!364797) (not bm!27249) (not b!364801) (not b!364785) (not bm!27245) (not d!72239) (not bm!27247) (not b!364793) (not d!72245) (not bm!27250) (not bm!27246) (not b!364805))
(check-sat)
