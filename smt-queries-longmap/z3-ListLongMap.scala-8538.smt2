; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104162 () Bool)

(assert start!104162)

(declare-fun b!1245187 () Bool)

(declare-fun res!830689 () Bool)

(declare-fun e!705962 () Bool)

(assert (=> b!1245187 (=> (not res!830689) (not e!705962))))

(declare-datatypes ((array!80132 0))(
  ( (array!80133 (arr!38652 (Array (_ BitVec 32) (_ BitVec 64))) (size!39188 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80132)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27455 0))(
  ( (Nil!27452) (Cons!27451 (h!28660 (_ BitVec 64)) (t!40924 List!27455)) )
))
(declare-fun arrayNoDuplicates!0 (array!80132 (_ BitVec 32) List!27455) Bool)

(assert (=> b!1245187 (= res!830689 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27452))))

(declare-fun b!1245188 () Bool)

(declare-fun res!830692 () Bool)

(assert (=> b!1245188 (=> (not res!830692) (not e!705962))))

(declare-fun noDuplicate!2021 (List!27455) Bool)

(assert (=> b!1245188 (= res!830692 (noDuplicate!2021 Nil!27452))))

(declare-fun res!830690 () Bool)

(assert (=> start!104162 (=> (not res!830690) (not e!705962))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104162 (= res!830690 (and (bvslt (size!39188 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39188 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39188 a!3892))))))

(assert (=> start!104162 e!705962))

(declare-fun array_inv!29500 (array!80132) Bool)

(assert (=> start!104162 (array_inv!29500 a!3892)))

(assert (=> start!104162 true))

(declare-fun b!1245189 () Bool)

(declare-fun e!705963 () Bool)

(assert (=> b!1245189 (= e!705962 e!705963)))

(declare-fun res!830691 () Bool)

(assert (=> b!1245189 (=> res!830691 e!705963)))

(declare-fun contains!7442 (List!27455 (_ BitVec 64)) Bool)

(assert (=> b!1245189 (= res!830691 (contains!7442 Nil!27452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245190 () Bool)

(declare-fun res!830688 () Bool)

(assert (=> b!1245190 (=> (not res!830688) (not e!705962))))

(assert (=> b!1245190 (= res!830688 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1245191 () Bool)

(assert (=> b!1245191 (= e!705963 (contains!7442 Nil!27452 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!104162 res!830690) b!1245187))

(assert (= (and b!1245187 res!830689) b!1245190))

(assert (= (and b!1245190 res!830688) b!1245188))

(assert (= (and b!1245188 res!830692) b!1245189))

(assert (= (and b!1245189 (not res!830691)) b!1245191))

(declare-fun m!1147291 () Bool)

(assert (=> start!104162 m!1147291))

(declare-fun m!1147293 () Bool)

(assert (=> b!1245191 m!1147293))

(declare-fun m!1147295 () Bool)

(assert (=> b!1245187 m!1147295))

(declare-fun m!1147297 () Bool)

(assert (=> b!1245189 m!1147297))

(declare-fun m!1147299 () Bool)

(assert (=> b!1245188 m!1147299))

(check-sat (not start!104162) (not b!1245191) (not b!1245189) (not b!1245187) (not b!1245188))
(check-sat)
(get-model)

(declare-fun b!1245229 () Bool)

(declare-fun e!705994 () Bool)

(declare-fun call!61468 () Bool)

(assert (=> b!1245229 (= e!705994 call!61468)))

(declare-fun b!1245230 () Bool)

(assert (=> b!1245230 (= e!705994 call!61468)))

(declare-fun b!1245231 () Bool)

(declare-fun e!705996 () Bool)

(assert (=> b!1245231 (= e!705996 e!705994)))

(declare-fun c!121936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245231 (= c!121936 (validKeyInArray!0 (select (arr!38652 a!3892) from!3270)))))

(declare-fun d!137311 () Bool)

(declare-fun res!830727 () Bool)

(declare-fun e!705995 () Bool)

(assert (=> d!137311 (=> res!830727 e!705995)))

(assert (=> d!137311 (= res!830727 (bvsge from!3270 (size!39188 a!3892)))))

(assert (=> d!137311 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27452) e!705995)))

(declare-fun b!1245232 () Bool)

(assert (=> b!1245232 (= e!705995 e!705996)))

(declare-fun res!830726 () Bool)

(assert (=> b!1245232 (=> (not res!830726) (not e!705996))))

(declare-fun e!705993 () Bool)

(assert (=> b!1245232 (= res!830726 (not e!705993))))

(declare-fun res!830728 () Bool)

(assert (=> b!1245232 (=> (not res!830728) (not e!705993))))

(assert (=> b!1245232 (= res!830728 (validKeyInArray!0 (select (arr!38652 a!3892) from!3270)))))

(declare-fun b!1245233 () Bool)

(assert (=> b!1245233 (= e!705993 (contains!7442 Nil!27452 (select (arr!38652 a!3892) from!3270)))))

(declare-fun bm!61465 () Bool)

(assert (=> bm!61465 (= call!61468 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121936 (Cons!27451 (select (arr!38652 a!3892) from!3270) Nil!27452) Nil!27452)))))

(assert (= (and d!137311 (not res!830727)) b!1245232))

(assert (= (and b!1245232 res!830728) b!1245233))

(assert (= (and b!1245232 res!830726) b!1245231))

(assert (= (and b!1245231 c!121936) b!1245230))

(assert (= (and b!1245231 (not c!121936)) b!1245229))

(assert (= (or b!1245230 b!1245229) bm!61465))

(declare-fun m!1147321 () Bool)

(assert (=> b!1245231 m!1147321))

(assert (=> b!1245231 m!1147321))

(declare-fun m!1147323 () Bool)

(assert (=> b!1245231 m!1147323))

(assert (=> b!1245232 m!1147321))

(assert (=> b!1245232 m!1147321))

(assert (=> b!1245232 m!1147323))

(assert (=> b!1245233 m!1147321))

(assert (=> b!1245233 m!1147321))

(declare-fun m!1147329 () Bool)

(assert (=> b!1245233 m!1147329))

(assert (=> bm!61465 m!1147321))

(declare-fun m!1147331 () Bool)

(assert (=> bm!61465 m!1147331))

(assert (=> b!1245187 d!137311))

(declare-fun d!137323 () Bool)

(declare-fun res!830735 () Bool)

(declare-fun e!706003 () Bool)

(assert (=> d!137323 (=> res!830735 e!706003)))

(get-info :version)

(assert (=> d!137323 (= res!830735 ((_ is Nil!27452) Nil!27452))))

(assert (=> d!137323 (= (noDuplicate!2021 Nil!27452) e!706003)))

(declare-fun b!1245240 () Bool)

(declare-fun e!706004 () Bool)

(assert (=> b!1245240 (= e!706003 e!706004)))

(declare-fun res!830736 () Bool)

(assert (=> b!1245240 (=> (not res!830736) (not e!706004))))

(assert (=> b!1245240 (= res!830736 (not (contains!7442 (t!40924 Nil!27452) (h!28660 Nil!27452))))))

(declare-fun b!1245241 () Bool)

(assert (=> b!1245241 (= e!706004 (noDuplicate!2021 (t!40924 Nil!27452)))))

(assert (= (and d!137323 (not res!830735)) b!1245240))

(assert (= (and b!1245240 res!830736) b!1245241))

(declare-fun m!1147333 () Bool)

(assert (=> b!1245240 m!1147333))

(declare-fun m!1147335 () Bool)

(assert (=> b!1245241 m!1147335))

(assert (=> b!1245188 d!137323))

(declare-fun d!137325 () Bool)

(declare-fun lt!562875 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!618 (List!27455) (InoxSet (_ BitVec 64)))

(assert (=> d!137325 (= lt!562875 (select (content!618 Nil!27452) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706025 () Bool)

(assert (=> d!137325 (= lt!562875 e!706025)))

(declare-fun res!830753 () Bool)

(assert (=> d!137325 (=> (not res!830753) (not e!706025))))

(assert (=> d!137325 (= res!830753 ((_ is Cons!27451) Nil!27452))))

(assert (=> d!137325 (= (contains!7442 Nil!27452 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562875)))

(declare-fun b!1245266 () Bool)

(declare-fun e!706026 () Bool)

(assert (=> b!1245266 (= e!706025 e!706026)))

(declare-fun res!830754 () Bool)

(assert (=> b!1245266 (=> res!830754 e!706026)))

(assert (=> b!1245266 (= res!830754 (= (h!28660 Nil!27452) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245267 () Bool)

(assert (=> b!1245267 (= e!706026 (contains!7442 (t!40924 Nil!27452) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137325 res!830753) b!1245266))

(assert (= (and b!1245266 (not res!830754)) b!1245267))

(declare-fun m!1147337 () Bool)

(assert (=> d!137325 m!1147337))

(declare-fun m!1147339 () Bool)

(assert (=> d!137325 m!1147339))

(declare-fun m!1147341 () Bool)

(assert (=> b!1245267 m!1147341))

(assert (=> b!1245189 d!137325))

(declare-fun d!137327 () Bool)

(assert (=> d!137327 (= (array_inv!29500 a!3892) (bvsge (size!39188 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104162 d!137327))

(declare-fun d!137329 () Bool)

(declare-fun lt!562876 () Bool)

(assert (=> d!137329 (= lt!562876 (select (content!618 Nil!27452) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706031 () Bool)

(assert (=> d!137329 (= lt!562876 e!706031)))

(declare-fun res!830758 () Bool)

(assert (=> d!137329 (=> (not res!830758) (not e!706031))))

(assert (=> d!137329 (= res!830758 ((_ is Cons!27451) Nil!27452))))

(assert (=> d!137329 (= (contains!7442 Nil!27452 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562876)))

(declare-fun b!1245273 () Bool)

(declare-fun e!706032 () Bool)

(assert (=> b!1245273 (= e!706031 e!706032)))

(declare-fun res!830759 () Bool)

(assert (=> b!1245273 (=> res!830759 e!706032)))

(assert (=> b!1245273 (= res!830759 (= (h!28660 Nil!27452) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245274 () Bool)

(assert (=> b!1245274 (= e!706032 (contains!7442 (t!40924 Nil!27452) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137329 res!830758) b!1245273))

(assert (= (and b!1245273 (not res!830759)) b!1245274))

(assert (=> d!137329 m!1147337))

(declare-fun m!1147351 () Bool)

(assert (=> d!137329 m!1147351))

(declare-fun m!1147353 () Bool)

(assert (=> b!1245274 m!1147353))

(assert (=> b!1245191 d!137329))

(check-sat (not b!1245267) (not b!1245232) (not bm!61465) (not b!1245274) (not d!137329) (not b!1245240) (not b!1245241) (not d!137325) (not b!1245233) (not b!1245231))
(check-sat)
