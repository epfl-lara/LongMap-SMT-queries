; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36202 () Bool)

(assert start!36202)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun e!222256 () Bool)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-datatypes ((array!20513 0))(
  ( (array!20514 (arr!9738 (Array (_ BitVec 32) (_ BitVec 64))) (size!10090 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20513)

(declare-fun b!362926 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20513 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362926 (= e!222256 (not (= (arrayCountValidKeys!0 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478))))))))

(declare-fun b!362925 () Bool)

(declare-fun res!202261 () Bool)

(assert (=> b!362925 (=> (not res!202261) (not e!222256))))

(assert (=> b!362925 (= res!202261 (and (bvslt (size!10090 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10090 a!4337))))))

(declare-fun b!362924 () Bool)

(declare-fun res!202258 () Bool)

(assert (=> b!362924 (=> (not res!202258) (not e!222256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362924 (= res!202258 (validKeyInArray!0 k0!2980))))

(declare-fun res!202260 () Bool)

(assert (=> start!36202 (=> (not res!202260) (not e!222256))))

(assert (=> start!36202 (= res!202260 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10090 a!4337))))))

(assert (=> start!36202 e!222256))

(assert (=> start!36202 true))

(declare-fun array_inv!7210 (array!20513) Bool)

(assert (=> start!36202 (array_inv!7210 a!4337)))

(declare-fun b!362923 () Bool)

(declare-fun res!202259 () Bool)

(assert (=> b!362923 (=> (not res!202259) (not e!222256))))

(assert (=> b!362923 (= res!202259 (not (validKeyInArray!0 (select (arr!9738 a!4337) i!1478))))))

(assert (= (and start!36202 res!202260) b!362923))

(assert (= (and b!362923 res!202259) b!362924))

(assert (= (and b!362924 res!202258) b!362925))

(assert (= (and b!362925 res!202261) b!362926))

(declare-fun m!360067 () Bool)

(assert (=> b!362926 m!360067))

(declare-fun m!360069 () Bool)

(assert (=> b!362926 m!360069))

(declare-fun m!360071 () Bool)

(assert (=> b!362926 m!360071))

(declare-fun m!360073 () Bool)

(assert (=> b!362924 m!360073))

(declare-fun m!360075 () Bool)

(assert (=> start!36202 m!360075))

(declare-fun m!360077 () Bool)

(assert (=> b!362923 m!360077))

(assert (=> b!362923 m!360077))

(declare-fun m!360079 () Bool)

(assert (=> b!362923 m!360079))

(check-sat (not b!362926) (not start!36202) (not b!362923) (not b!362924))
(check-sat)
(get-model)

(declare-fun bm!27200 () Bool)

(declare-fun call!27203 () (_ BitVec 32))

(assert (=> bm!27200 (= call!27203 (arrayCountValidKeys!0 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362959 () Bool)

(declare-fun e!222273 () (_ BitVec 32))

(declare-fun e!222274 () (_ BitVec 32))

(assert (=> b!362959 (= e!222273 e!222274)))

(declare-fun c!53755 () Bool)

(assert (=> b!362959 (= c!53755 (validKeyInArray!0 (select (arr!9738 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337))) i!1478)))))

(declare-fun b!362960 () Bool)

(assert (=> b!362960 (= e!222274 call!27203)))

(declare-fun lt!167355 () (_ BitVec 32))

(declare-fun d!72093 () Bool)

(assert (=> d!72093 (and (bvsge lt!167355 #b00000000000000000000000000000000) (bvsle lt!167355 (bvsub (size!10090 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337))) i!1478)))))

(assert (=> d!72093 (= lt!167355 e!222273)))

(declare-fun c!53756 () Bool)

(assert (=> d!72093 (= c!53756 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72093 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10090 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337)))))))

(assert (=> d!72093 (= (arrayCountValidKeys!0 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167355)))

(declare-fun b!362961 () Bool)

(assert (=> b!362961 (= e!222273 #b00000000000000000000000000000000)))

(declare-fun b!362962 () Bool)

(assert (=> b!362962 (= e!222274 (bvadd #b00000000000000000000000000000001 call!27203))))

(assert (= (and d!72093 c!53756) b!362961))

(assert (= (and d!72093 (not c!53756)) b!362959))

(assert (= (and b!362959 c!53755) b!362962))

(assert (= (and b!362959 (not c!53755)) b!362960))

(assert (= (or b!362962 b!362960) bm!27200))

(declare-fun m!360109 () Bool)

(assert (=> bm!27200 m!360109))

(declare-fun m!360111 () Bool)

(assert (=> b!362959 m!360111))

(assert (=> b!362959 m!360111))

(declare-fun m!360113 () Bool)

(assert (=> b!362959 m!360113))

(assert (=> b!362926 d!72093))

(declare-fun bm!27201 () Bool)

(declare-fun call!27204 () (_ BitVec 32))

(assert (=> bm!27201 (= call!27204 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362963 () Bool)

(declare-fun e!222275 () (_ BitVec 32))

(declare-fun e!222276 () (_ BitVec 32))

(assert (=> b!362963 (= e!222275 e!222276)))

(declare-fun c!53757 () Bool)

(assert (=> b!362963 (= c!53757 (validKeyInArray!0 (select (arr!9738 a!4337) i!1478)))))

(declare-fun b!362964 () Bool)

(assert (=> b!362964 (= e!222276 call!27204)))

(declare-fun d!72099 () Bool)

(declare-fun lt!167356 () (_ BitVec 32))

(assert (=> d!72099 (and (bvsge lt!167356 #b00000000000000000000000000000000) (bvsle lt!167356 (bvsub (size!10090 a!4337) i!1478)))))

(assert (=> d!72099 (= lt!167356 e!222275)))

(declare-fun c!53758 () Bool)

(assert (=> d!72099 (= c!53758 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72099 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10090 a!4337)))))

(assert (=> d!72099 (= (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167356)))

(declare-fun b!362965 () Bool)

(assert (=> b!362965 (= e!222275 #b00000000000000000000000000000000)))

(declare-fun b!362966 () Bool)

(assert (=> b!362966 (= e!222276 (bvadd #b00000000000000000000000000000001 call!27204))))

(assert (= (and d!72099 c!53758) b!362965))

(assert (= (and d!72099 (not c!53758)) b!362963))

(assert (= (and b!362963 c!53757) b!362966))

(assert (= (and b!362963 (not c!53757)) b!362964))

(assert (= (or b!362966 b!362964) bm!27201))

(declare-fun m!360115 () Bool)

(assert (=> bm!27201 m!360115))

(assert (=> b!362963 m!360077))

(assert (=> b!362963 m!360077))

(assert (=> b!362963 m!360079))

(assert (=> b!362926 d!72099))

(declare-fun d!72105 () Bool)

(assert (=> d!72105 (= (array_inv!7210 a!4337) (bvsge (size!10090 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36202 d!72105))

(declare-fun d!72107 () Bool)

(assert (=> d!72107 (= (validKeyInArray!0 (select (arr!9738 a!4337) i!1478)) (and (not (= (select (arr!9738 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9738 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362923 d!72107))

(declare-fun d!72111 () Bool)

(assert (=> d!72111 (= (validKeyInArray!0 k0!2980) (and (not (= k0!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362924 d!72111))

(check-sat (not b!362959) (not b!362963) (not bm!27201) (not bm!27200))
(check-sat)
(get-model)

(declare-fun d!72123 () Bool)

(assert (=> d!72123 (= (validKeyInArray!0 (select (arr!9738 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337))) i!1478)) (and (not (= (select (arr!9738 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337))) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9738 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337))) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362959 d!72123))

(assert (=> b!362963 d!72107))

(declare-fun bm!27210 () Bool)

(declare-fun call!27213 () (_ BitVec 32))

(assert (=> bm!27210 (= call!27213 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362999 () Bool)

(declare-fun e!222293 () (_ BitVec 32))

(declare-fun e!222294 () (_ BitVec 32))

(assert (=> b!362999 (= e!222293 e!222294)))

(declare-fun c!53775 () Bool)

(assert (=> b!362999 (= c!53775 (validKeyInArray!0 (select (arr!9738 a!4337) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun b!363000 () Bool)

(assert (=> b!363000 (= e!222294 call!27213)))

(declare-fun d!72125 () Bool)

(declare-fun lt!167365 () (_ BitVec 32))

(assert (=> d!72125 (and (bvsge lt!167365 #b00000000000000000000000000000000) (bvsle lt!167365 (bvsub (size!10090 a!4337) (bvadd i!1478 #b00000000000000000000000000000001))))))

(assert (=> d!72125 (= lt!167365 e!222293)))

(declare-fun c!53776 () Bool)

(assert (=> d!72125 (= c!53776 (bvsge (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72125 (and (bvsle (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd i!1478 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10090 a!4337)))))

(assert (=> d!72125 (= (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167365)))

(declare-fun b!363001 () Bool)

(assert (=> b!363001 (= e!222293 #b00000000000000000000000000000000)))

(declare-fun b!363002 () Bool)

(assert (=> b!363002 (= e!222294 (bvadd #b00000000000000000000000000000001 call!27213))))

(assert (= (and d!72125 c!53776) b!363001))

(assert (= (and d!72125 (not c!53776)) b!362999))

(assert (= (and b!362999 c!53775) b!363002))

(assert (= (and b!362999 (not c!53775)) b!363000))

(assert (= (or b!363002 b!363000) bm!27210))

(declare-fun m!360133 () Bool)

(assert (=> bm!27210 m!360133))

(declare-fun m!360135 () Bool)

(assert (=> b!362999 m!360135))

(assert (=> b!362999 m!360135))

(declare-fun m!360137 () Bool)

(assert (=> b!362999 m!360137))

(assert (=> bm!27201 d!72125))

(declare-fun call!27214 () (_ BitVec 32))

(declare-fun bm!27211 () Bool)

(assert (=> bm!27211 (= call!27214 (arrayCountValidKeys!0 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363003 () Bool)

(declare-fun e!222295 () (_ BitVec 32))

(declare-fun e!222296 () (_ BitVec 32))

(assert (=> b!363003 (= e!222295 e!222296)))

(declare-fun c!53777 () Bool)

(assert (=> b!363003 (= c!53777 (validKeyInArray!0 (select (arr!9738 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337))) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun b!363004 () Bool)

(assert (=> b!363004 (= e!222296 call!27214)))

(declare-fun d!72127 () Bool)

(declare-fun lt!167366 () (_ BitVec 32))

(assert (=> d!72127 (and (bvsge lt!167366 #b00000000000000000000000000000000) (bvsle lt!167366 (bvsub (size!10090 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337))) (bvadd i!1478 #b00000000000000000000000000000001))))))

(assert (=> d!72127 (= lt!167366 e!222295)))

(declare-fun c!53778 () Bool)

(assert (=> d!72127 (= c!53778 (bvsge (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72127 (and (bvsle (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd i!1478 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10090 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337)))))))

(assert (=> d!72127 (= (arrayCountValidKeys!0 (array!20514 (store (arr!9738 a!4337) i!1478 k0!2980) (size!10090 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167366)))

(declare-fun b!363005 () Bool)

(assert (=> b!363005 (= e!222295 #b00000000000000000000000000000000)))

(declare-fun b!363006 () Bool)

(assert (=> b!363006 (= e!222296 (bvadd #b00000000000000000000000000000001 call!27214))))

(assert (= (and d!72127 c!53778) b!363005))

(assert (= (and d!72127 (not c!53778)) b!363003))

(assert (= (and b!363003 c!53777) b!363006))

(assert (= (and b!363003 (not c!53777)) b!363004))

(assert (= (or b!363006 b!363004) bm!27211))

(declare-fun m!360139 () Bool)

(assert (=> bm!27211 m!360139))

(declare-fun m!360141 () Bool)

(assert (=> b!363003 m!360141))

(assert (=> b!363003 m!360141))

(declare-fun m!360143 () Bool)

(assert (=> b!363003 m!360143))

(assert (=> bm!27200 d!72127))

(check-sat (not b!362999) (not b!363003) (not bm!27211) (not bm!27210))
(check-sat)
