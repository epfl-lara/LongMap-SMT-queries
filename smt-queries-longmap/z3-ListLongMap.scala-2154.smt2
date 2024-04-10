; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36218 () Bool)

(assert start!36218)

(declare-fun b!362986 () Bool)

(declare-fun res!202276 () Bool)

(declare-fun e!222294 () Bool)

(assert (=> b!362986 (=> (not res!202276) (not e!222294))))

(declare-datatypes ((array!20534 0))(
  ( (array!20535 (arr!9749 (Array (_ BitVec 32) (_ BitVec 64))) (size!10101 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20534)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362986 (= res!202276 (and (bvslt (size!10101 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10101 a!4337))))))

(declare-fun b!362985 () Bool)

(declare-fun res!202274 () Bool)

(assert (=> b!362985 (=> (not res!202274) (not e!222294))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362985 (= res!202274 (validKeyInArray!0 k0!2980))))

(declare-fun b!362984 () Bool)

(declare-fun res!202273 () Bool)

(assert (=> b!362984 (=> (not res!202273) (not e!222294))))

(assert (=> b!362984 (= res!202273 (not (validKeyInArray!0 (select (arr!9749 a!4337) i!1478))))))

(declare-fun b!362987 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20534 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362987 (= e!222294 (not (= (arrayCountValidKeys!0 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478))))))))

(declare-fun res!202275 () Bool)

(assert (=> start!36218 (=> (not res!202275) (not e!222294))))

(assert (=> start!36218 (= res!202275 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10101 a!4337))))))

(assert (=> start!36218 e!222294))

(assert (=> start!36218 true))

(declare-fun array_inv!7191 (array!20534) Bool)

(assert (=> start!36218 (array_inv!7191 a!4337)))

(assert (= (and start!36218 res!202275) b!362984))

(assert (= (and b!362984 res!202273) b!362985))

(assert (= (and b!362985 res!202274) b!362986))

(assert (= (and b!362986 res!202276) b!362987))

(declare-fun m!359851 () Bool)

(assert (=> b!362985 m!359851))

(declare-fun m!359853 () Bool)

(assert (=> b!362984 m!359853))

(assert (=> b!362984 m!359853))

(declare-fun m!359855 () Bool)

(assert (=> b!362984 m!359855))

(declare-fun m!359857 () Bool)

(assert (=> b!362987 m!359857))

(declare-fun m!359859 () Bool)

(assert (=> b!362987 m!359859))

(declare-fun m!359861 () Bool)

(assert (=> b!362987 m!359861))

(declare-fun m!359863 () Bool)

(assert (=> start!36218 m!359863))

(check-sat (not b!362984) (not b!362985) (not b!362987) (not start!36218))
(check-sat)
(get-model)

(declare-fun d!72063 () Bool)

(assert (=> d!72063 (= (validKeyInArray!0 (select (arr!9749 a!4337) i!1478)) (and (not (= (select (arr!9749 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9749 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362984 d!72063))

(declare-fun d!72065 () Bool)

(assert (=> d!72065 (= (validKeyInArray!0 k0!2980) (and (not (= k0!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362985 d!72065))

(declare-fun d!72067 () Bool)

(declare-fun lt!167336 () (_ BitVec 32))

(assert (=> d!72067 (and (bvsge lt!167336 #b00000000000000000000000000000000) (bvsle lt!167336 (bvsub (size!10101 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337))) i!1478)))))

(declare-fun e!222305 () (_ BitVec 32))

(assert (=> d!72067 (= lt!167336 e!222305)))

(declare-fun c!53778 () Bool)

(assert (=> d!72067 (= c!53778 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72067 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10101 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337)))))))

(assert (=> d!72067 (= (arrayCountValidKeys!0 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167336)))

(declare-fun b!363008 () Bool)

(declare-fun e!222306 () (_ BitVec 32))

(assert (=> b!363008 (= e!222305 e!222306)))

(declare-fun c!53779 () Bool)

(assert (=> b!363008 (= c!53779 (validKeyInArray!0 (select (arr!9749 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337))) i!1478)))))

(declare-fun b!363009 () Bool)

(declare-fun call!27216 () (_ BitVec 32))

(assert (=> b!363009 (= e!222306 call!27216)))

(declare-fun bm!27213 () Bool)

(assert (=> bm!27213 (= call!27216 (arrayCountValidKeys!0 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363010 () Bool)

(assert (=> b!363010 (= e!222306 (bvadd #b00000000000000000000000000000001 call!27216))))

(declare-fun b!363011 () Bool)

(assert (=> b!363011 (= e!222305 #b00000000000000000000000000000000)))

(assert (= (and d!72067 c!53778) b!363011))

(assert (= (and d!72067 (not c!53778)) b!363008))

(assert (= (and b!363008 c!53779) b!363010))

(assert (= (and b!363008 (not c!53779)) b!363009))

(assert (= (or b!363010 b!363009) bm!27213))

(declare-fun m!359879 () Bool)

(assert (=> b!363008 m!359879))

(assert (=> b!363008 m!359879))

(declare-fun m!359881 () Bool)

(assert (=> b!363008 m!359881))

(declare-fun m!359883 () Bool)

(assert (=> bm!27213 m!359883))

(assert (=> b!362987 d!72067))

(declare-fun d!72069 () Bool)

(declare-fun lt!167337 () (_ BitVec 32))

(assert (=> d!72069 (and (bvsge lt!167337 #b00000000000000000000000000000000) (bvsle lt!167337 (bvsub (size!10101 a!4337) i!1478)))))

(declare-fun e!222307 () (_ BitVec 32))

(assert (=> d!72069 (= lt!167337 e!222307)))

(declare-fun c!53780 () Bool)

(assert (=> d!72069 (= c!53780 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72069 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10101 a!4337)))))

(assert (=> d!72069 (= (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167337)))

(declare-fun b!363012 () Bool)

(declare-fun e!222308 () (_ BitVec 32))

(assert (=> b!363012 (= e!222307 e!222308)))

(declare-fun c!53781 () Bool)

(assert (=> b!363012 (= c!53781 (validKeyInArray!0 (select (arr!9749 a!4337) i!1478)))))

(declare-fun b!363013 () Bool)

(declare-fun call!27217 () (_ BitVec 32))

(assert (=> b!363013 (= e!222308 call!27217)))

(declare-fun bm!27214 () Bool)

(assert (=> bm!27214 (= call!27217 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363014 () Bool)

(assert (=> b!363014 (= e!222308 (bvadd #b00000000000000000000000000000001 call!27217))))

(declare-fun b!363015 () Bool)

(assert (=> b!363015 (= e!222307 #b00000000000000000000000000000000)))

(assert (= (and d!72069 c!53780) b!363015))

(assert (= (and d!72069 (not c!53780)) b!363012))

(assert (= (and b!363012 c!53781) b!363014))

(assert (= (and b!363012 (not c!53781)) b!363013))

(assert (= (or b!363014 b!363013) bm!27214))

(assert (=> b!363012 m!359853))

(assert (=> b!363012 m!359853))

(assert (=> b!363012 m!359855))

(declare-fun m!359885 () Bool)

(assert (=> bm!27214 m!359885))

(assert (=> b!362987 d!72069))

(declare-fun d!72071 () Bool)

(assert (=> d!72071 (= (array_inv!7191 a!4337) (bvsge (size!10101 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36218 d!72071))

(check-sat (not bm!27213) (not b!363012) (not bm!27214) (not b!363008))
(check-sat)
(get-model)

(declare-fun d!72093 () Bool)

(declare-fun lt!167346 () (_ BitVec 32))

(assert (=> d!72093 (and (bvsge lt!167346 #b00000000000000000000000000000000) (bvsle lt!167346 (bvsub (size!10101 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337))) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun e!222325 () (_ BitVec 32))

(assert (=> d!72093 (= lt!167346 e!222325)))

(declare-fun c!53798 () Bool)

(assert (=> d!72093 (= c!53798 (bvsge (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72093 (and (bvsle (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd i!1478 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10101 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337)))))))

(assert (=> d!72093 (= (arrayCountValidKeys!0 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167346)))

(declare-fun b!363048 () Bool)

(declare-fun e!222326 () (_ BitVec 32))

(assert (=> b!363048 (= e!222325 e!222326)))

(declare-fun c!53799 () Bool)

(assert (=> b!363048 (= c!53799 (validKeyInArray!0 (select (arr!9749 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337))) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun b!363049 () Bool)

(declare-fun call!27226 () (_ BitVec 32))

(assert (=> b!363049 (= e!222326 call!27226)))

(declare-fun bm!27223 () Bool)

(assert (=> bm!27223 (= call!27226 (arrayCountValidKeys!0 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363050 () Bool)

(assert (=> b!363050 (= e!222326 (bvadd #b00000000000000000000000000000001 call!27226))))

(declare-fun b!363051 () Bool)

(assert (=> b!363051 (= e!222325 #b00000000000000000000000000000000)))

(assert (= (and d!72093 c!53798) b!363051))

(assert (= (and d!72093 (not c!53798)) b!363048))

(assert (= (and b!363048 c!53799) b!363050))

(assert (= (and b!363048 (not c!53799)) b!363049))

(assert (= (or b!363050 b!363049) bm!27223))

(declare-fun m!359903 () Bool)

(assert (=> b!363048 m!359903))

(assert (=> b!363048 m!359903))

(declare-fun m!359905 () Bool)

(assert (=> b!363048 m!359905))

(declare-fun m!359907 () Bool)

(assert (=> bm!27223 m!359907))

(assert (=> bm!27213 d!72093))

(assert (=> b!363012 d!72063))

(declare-fun d!72095 () Bool)

(declare-fun lt!167347 () (_ BitVec 32))

(assert (=> d!72095 (and (bvsge lt!167347 #b00000000000000000000000000000000) (bvsle lt!167347 (bvsub (size!10101 a!4337) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun e!222327 () (_ BitVec 32))

(assert (=> d!72095 (= lt!167347 e!222327)))

(declare-fun c!53800 () Bool)

(assert (=> d!72095 (= c!53800 (bvsge (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72095 (and (bvsle (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd i!1478 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10101 a!4337)))))

(assert (=> d!72095 (= (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167347)))

(declare-fun b!363052 () Bool)

(declare-fun e!222328 () (_ BitVec 32))

(assert (=> b!363052 (= e!222327 e!222328)))

(declare-fun c!53801 () Bool)

(assert (=> b!363052 (= c!53801 (validKeyInArray!0 (select (arr!9749 a!4337) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun b!363053 () Bool)

(declare-fun call!27227 () (_ BitVec 32))

(assert (=> b!363053 (= e!222328 call!27227)))

(declare-fun bm!27224 () Bool)

(assert (=> bm!27224 (= call!27227 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363054 () Bool)

(assert (=> b!363054 (= e!222328 (bvadd #b00000000000000000000000000000001 call!27227))))

(declare-fun b!363055 () Bool)

(assert (=> b!363055 (= e!222327 #b00000000000000000000000000000000)))

(assert (= (and d!72095 c!53800) b!363055))

(assert (= (and d!72095 (not c!53800)) b!363052))

(assert (= (and b!363052 c!53801) b!363054))

(assert (= (and b!363052 (not c!53801)) b!363053))

(assert (= (or b!363054 b!363053) bm!27224))

(declare-fun m!359909 () Bool)

(assert (=> b!363052 m!359909))

(assert (=> b!363052 m!359909))

(declare-fun m!359911 () Bool)

(assert (=> b!363052 m!359911))

(declare-fun m!359913 () Bool)

(assert (=> bm!27224 m!359913))

(assert (=> bm!27214 d!72095))

(declare-fun d!72097 () Bool)

(assert (=> d!72097 (= (validKeyInArray!0 (select (arr!9749 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337))) i!1478)) (and (not (= (select (arr!9749 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337))) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9749 (array!20535 (store (arr!9749 a!4337) i!1478 k0!2980) (size!10101 a!4337))) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363008 d!72097))

(check-sat (not b!363052) (not b!363048) (not bm!27224) (not bm!27223))
(check-sat)
