; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102274 () Bool)

(assert start!102274)

(declare-fun b!1230950 () Bool)

(declare-fun e!698279 () Bool)

(declare-fun e!698282 () Bool)

(assert (=> b!1230950 (= e!698279 e!698282)))

(declare-fun res!819458 () Bool)

(assert (=> b!1230950 (=> (not res!819458) (not e!698282))))

(declare-datatypes ((List!27162 0))(
  ( (Nil!27159) (Cons!27158 (h!28367 (_ BitVec 64)) (t!40616 List!27162)) )
))
(declare-fun contains!7134 (List!27162 (_ BitVec 64)) Bool)

(assert (=> b!1230950 (= res!819458 (not (contains!7134 Nil!27159 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230951 () Bool)

(declare-fun res!819452 () Bool)

(declare-fun e!698280 () Bool)

(assert (=> b!1230951 (=> (not res!819452) (not e!698280))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230951 (= res!819452 (validKeyInArray!0 k0!2913))))

(declare-fun res!819453 () Bool)

(assert (=> start!102274 (=> (not res!819453) (not e!698280))))

(declare-datatypes ((array!79339 0))(
  ( (array!79340 (arr!38288 (Array (_ BitVec 32) (_ BitVec 64))) (size!38826 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79339)

(assert (=> start!102274 (= res!819453 (bvslt (size!38826 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102274 e!698280))

(declare-fun array_inv!29271 (array!79339) Bool)

(assert (=> start!102274 (array_inv!29271 a!3806)))

(assert (=> start!102274 true))

(declare-fun b!1230952 () Bool)

(declare-fun res!819450 () Bool)

(assert (=> b!1230952 (=> (not res!819450) (not e!698280))))

(declare-fun acc!823 () List!27162)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79339 (_ BitVec 32) List!27162) Bool)

(assert (=> b!1230952 (= res!819450 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230953 () Bool)

(declare-fun res!819456 () Bool)

(assert (=> b!1230953 (=> (not res!819456) (not e!698280))))

(declare-fun arrayContainsKey!0 (array!79339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230953 (= res!819456 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230954 () Bool)

(declare-fun res!819449 () Bool)

(assert (=> b!1230954 (=> (not res!819449) (not e!698280))))

(assert (=> b!1230954 (= res!819449 (not (contains!7134 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230955 () Bool)

(assert (=> b!1230955 (= e!698282 (not (contains!7134 Nil!27159 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230956 () Bool)

(declare-fun res!819454 () Bool)

(assert (=> b!1230956 (=> (not res!819454) (not e!698280))))

(assert (=> b!1230956 (= res!819454 (not (contains!7134 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230957 () Bool)

(declare-fun res!819455 () Bool)

(assert (=> b!1230957 (=> (not res!819455) (not e!698280))))

(assert (=> b!1230957 (= res!819455 (validKeyInArray!0 (select (arr!38288 a!3806) from!3184)))))

(declare-fun b!1230958 () Bool)

(declare-fun res!819451 () Bool)

(assert (=> b!1230958 (=> (not res!819451) (not e!698280))))

(assert (=> b!1230958 (= res!819451 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38826 a!3806)) (bvslt from!3184 (size!38826 a!3806))))))

(declare-fun b!1230959 () Bool)

(assert (=> b!1230959 (= e!698280 (not e!698279))))

(declare-fun res!819457 () Bool)

(assert (=> b!1230959 (=> res!819457 e!698279)))

(assert (=> b!1230959 (= res!819457 (bvsgt from!3184 (size!38826 a!3806)))))

(assert (=> b!1230959 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27158 (select (arr!38288 a!3806) from!3184) acc!823))))

(declare-fun b!1230960 () Bool)

(declare-fun res!819448 () Bool)

(assert (=> b!1230960 (=> (not res!819448) (not e!698280))))

(declare-fun noDuplicate!1777 (List!27162) Bool)

(assert (=> b!1230960 (= res!819448 (noDuplicate!1777 acc!823))))

(assert (= (and start!102274 res!819453) b!1230951))

(assert (= (and b!1230951 res!819452) b!1230958))

(assert (= (and b!1230958 res!819451) b!1230960))

(assert (= (and b!1230960 res!819448) b!1230956))

(assert (= (and b!1230956 res!819454) b!1230954))

(assert (= (and b!1230954 res!819449) b!1230953))

(assert (= (and b!1230953 res!819456) b!1230952))

(assert (= (and b!1230952 res!819450) b!1230957))

(assert (= (and b!1230957 res!819455) b!1230959))

(assert (= (and b!1230959 (not res!819457)) b!1230950))

(assert (= (and b!1230950 res!819458) b!1230955))

(declare-fun m!1134771 () Bool)

(assert (=> b!1230956 m!1134771))

(declare-fun m!1134773 () Bool)

(assert (=> start!102274 m!1134773))

(declare-fun m!1134775 () Bool)

(assert (=> b!1230957 m!1134775))

(assert (=> b!1230957 m!1134775))

(declare-fun m!1134777 () Bool)

(assert (=> b!1230957 m!1134777))

(assert (=> b!1230959 m!1134775))

(declare-fun m!1134779 () Bool)

(assert (=> b!1230959 m!1134779))

(declare-fun m!1134781 () Bool)

(assert (=> b!1230955 m!1134781))

(declare-fun m!1134783 () Bool)

(assert (=> b!1230951 m!1134783))

(declare-fun m!1134785 () Bool)

(assert (=> b!1230960 m!1134785))

(declare-fun m!1134787 () Bool)

(assert (=> b!1230954 m!1134787))

(declare-fun m!1134789 () Bool)

(assert (=> b!1230952 m!1134789))

(declare-fun m!1134791 () Bool)

(assert (=> b!1230953 m!1134791))

(declare-fun m!1134793 () Bool)

(assert (=> b!1230950 m!1134793))

(check-sat (not b!1230954) (not b!1230959) (not start!102274) (not b!1230950) (not b!1230960) (not b!1230957) (not b!1230952) (not b!1230955) (not b!1230953) (not b!1230951) (not b!1230956))
(check-sat)
(get-model)

(declare-fun d!134515 () Bool)

(declare-fun lt!559211 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!561 (List!27162) (InoxSet (_ BitVec 64)))

(assert (=> d!134515 (= lt!559211 (select (content!561 Nil!27159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698311 () Bool)

(assert (=> d!134515 (= lt!559211 e!698311)))

(declare-fun res!819529 () Bool)

(assert (=> d!134515 (=> (not res!819529) (not e!698311))))

(get-info :version)

(assert (=> d!134515 (= res!819529 ((_ is Cons!27158) Nil!27159))))

(assert (=> d!134515 (= (contains!7134 Nil!27159 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559211)))

(declare-fun b!1231031 () Bool)

(declare-fun e!698312 () Bool)

(assert (=> b!1231031 (= e!698311 e!698312)))

(declare-fun res!819530 () Bool)

(assert (=> b!1231031 (=> res!819530 e!698312)))

(assert (=> b!1231031 (= res!819530 (= (h!28367 Nil!27159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231032 () Bool)

(assert (=> b!1231032 (= e!698312 (contains!7134 (t!40616 Nil!27159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134515 res!819529) b!1231031))

(assert (= (and b!1231031 (not res!819530)) b!1231032))

(declare-fun m!1134843 () Bool)

(assert (=> d!134515 m!1134843))

(declare-fun m!1134845 () Bool)

(assert (=> d!134515 m!1134845))

(declare-fun m!1134847 () Bool)

(assert (=> b!1231032 m!1134847))

(assert (=> b!1230955 d!134515))

(declare-fun d!134517 () Bool)

(declare-fun res!819535 () Bool)

(declare-fun e!698317 () Bool)

(assert (=> d!134517 (=> res!819535 e!698317)))

(assert (=> d!134517 (= res!819535 ((_ is Nil!27159) acc!823))))

(assert (=> d!134517 (= (noDuplicate!1777 acc!823) e!698317)))

(declare-fun b!1231037 () Bool)

(declare-fun e!698318 () Bool)

(assert (=> b!1231037 (= e!698317 e!698318)))

(declare-fun res!819536 () Bool)

(assert (=> b!1231037 (=> (not res!819536) (not e!698318))))

(assert (=> b!1231037 (= res!819536 (not (contains!7134 (t!40616 acc!823) (h!28367 acc!823))))))

(declare-fun b!1231038 () Bool)

(assert (=> b!1231038 (= e!698318 (noDuplicate!1777 (t!40616 acc!823)))))

(assert (= (and d!134517 (not res!819535)) b!1231037))

(assert (= (and b!1231037 res!819536) b!1231038))

(declare-fun m!1134849 () Bool)

(assert (=> b!1231037 m!1134849))

(declare-fun m!1134851 () Bool)

(assert (=> b!1231038 m!1134851))

(assert (=> b!1230960 d!134517))

(declare-fun d!134521 () Bool)

(declare-fun lt!559212 () Bool)

(assert (=> d!134521 (= lt!559212 (select (content!561 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698319 () Bool)

(assert (=> d!134521 (= lt!559212 e!698319)))

(declare-fun res!819537 () Bool)

(assert (=> d!134521 (=> (not res!819537) (not e!698319))))

(assert (=> d!134521 (= res!819537 ((_ is Cons!27158) acc!823))))

(assert (=> d!134521 (= (contains!7134 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559212)))

(declare-fun b!1231039 () Bool)

(declare-fun e!698320 () Bool)

(assert (=> b!1231039 (= e!698319 e!698320)))

(declare-fun res!819538 () Bool)

(assert (=> b!1231039 (=> res!819538 e!698320)))

(assert (=> b!1231039 (= res!819538 (= (h!28367 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231040 () Bool)

(assert (=> b!1231040 (= e!698320 (contains!7134 (t!40616 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134521 res!819537) b!1231039))

(assert (= (and b!1231039 (not res!819538)) b!1231040))

(declare-fun m!1134853 () Bool)

(assert (=> d!134521 m!1134853))

(declare-fun m!1134855 () Bool)

(assert (=> d!134521 m!1134855))

(declare-fun m!1134857 () Bool)

(assert (=> b!1231040 m!1134857))

(assert (=> b!1230954 d!134521))

(declare-fun d!134523 () Bool)

(assert (=> d!134523 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1230951 d!134523))

(declare-fun d!134527 () Bool)

(declare-fun lt!559213 () Bool)

(assert (=> d!134527 (= lt!559213 (select (content!561 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698321 () Bool)

(assert (=> d!134527 (= lt!559213 e!698321)))

(declare-fun res!819539 () Bool)

(assert (=> d!134527 (=> (not res!819539) (not e!698321))))

(assert (=> d!134527 (= res!819539 ((_ is Cons!27158) acc!823))))

(assert (=> d!134527 (= (contains!7134 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559213)))

(declare-fun b!1231041 () Bool)

(declare-fun e!698322 () Bool)

(assert (=> b!1231041 (= e!698321 e!698322)))

(declare-fun res!819540 () Bool)

(assert (=> b!1231041 (=> res!819540 e!698322)))

(assert (=> b!1231041 (= res!819540 (= (h!28367 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231042 () Bool)

(assert (=> b!1231042 (= e!698322 (contains!7134 (t!40616 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134527 res!819539) b!1231041))

(assert (= (and b!1231041 (not res!819540)) b!1231042))

(assert (=> d!134527 m!1134853))

(declare-fun m!1134859 () Bool)

(assert (=> d!134527 m!1134859))

(declare-fun m!1134861 () Bool)

(assert (=> b!1231042 m!1134861))

(assert (=> b!1230956 d!134527))

(declare-fun d!134529 () Bool)

(declare-fun lt!559216 () Bool)

(assert (=> d!134529 (= lt!559216 (select (content!561 Nil!27159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698327 () Bool)

(assert (=> d!134529 (= lt!559216 e!698327)))

(declare-fun res!819545 () Bool)

(assert (=> d!134529 (=> (not res!819545) (not e!698327))))

(assert (=> d!134529 (= res!819545 ((_ is Cons!27158) Nil!27159))))

(assert (=> d!134529 (= (contains!7134 Nil!27159 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559216)))

(declare-fun b!1231047 () Bool)

(declare-fun e!698328 () Bool)

(assert (=> b!1231047 (= e!698327 e!698328)))

(declare-fun res!819546 () Bool)

(assert (=> b!1231047 (=> res!819546 e!698328)))

(assert (=> b!1231047 (= res!819546 (= (h!28367 Nil!27159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231048 () Bool)

(assert (=> b!1231048 (= e!698328 (contains!7134 (t!40616 Nil!27159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134529 res!819545) b!1231047))

(assert (= (and b!1231047 (not res!819546)) b!1231048))

(assert (=> d!134529 m!1134843))

(declare-fun m!1134863 () Bool)

(assert (=> d!134529 m!1134863))

(declare-fun m!1134865 () Bool)

(assert (=> b!1231048 m!1134865))

(assert (=> b!1230950 d!134529))

(declare-fun b!1231087 () Bool)

(declare-fun e!698364 () Bool)

(declare-fun e!698362 () Bool)

(assert (=> b!1231087 (= e!698364 e!698362)))

(declare-fun res!819575 () Bool)

(assert (=> b!1231087 (=> (not res!819575) (not e!698362))))

(declare-fun e!698363 () Bool)

(assert (=> b!1231087 (= res!819575 (not e!698363))))

(declare-fun res!819574 () Bool)

(assert (=> b!1231087 (=> (not res!819574) (not e!698363))))

(assert (=> b!1231087 (= res!819574 (validKeyInArray!0 (select (arr!38288 a!3806) from!3184)))))

(declare-fun call!60853 () Bool)

(declare-fun bm!60850 () Bool)

(declare-fun c!120620 () Bool)

(assert (=> bm!60850 (= call!60853 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120620 (Cons!27158 (select (arr!38288 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!134531 () Bool)

(declare-fun res!819573 () Bool)

(assert (=> d!134531 (=> res!819573 e!698364)))

(assert (=> d!134531 (= res!819573 (bvsge from!3184 (size!38826 a!3806)))))

(assert (=> d!134531 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698364)))

(declare-fun b!1231088 () Bool)

(declare-fun e!698361 () Bool)

(assert (=> b!1231088 (= e!698362 e!698361)))

(assert (=> b!1231088 (= c!120620 (validKeyInArray!0 (select (arr!38288 a!3806) from!3184)))))

(declare-fun b!1231089 () Bool)

(assert (=> b!1231089 (= e!698361 call!60853)))

(declare-fun b!1231090 () Bool)

(assert (=> b!1231090 (= e!698361 call!60853)))

(declare-fun b!1231091 () Bool)

(assert (=> b!1231091 (= e!698363 (contains!7134 acc!823 (select (arr!38288 a!3806) from!3184)))))

(assert (= (and d!134531 (not res!819573)) b!1231087))

(assert (= (and b!1231087 res!819574) b!1231091))

(assert (= (and b!1231087 res!819575) b!1231088))

(assert (= (and b!1231088 c!120620) b!1231089))

(assert (= (and b!1231088 (not c!120620)) b!1231090))

(assert (= (or b!1231089 b!1231090) bm!60850))

(assert (=> b!1231087 m!1134775))

(assert (=> b!1231087 m!1134775))

(assert (=> b!1231087 m!1134777))

(assert (=> bm!60850 m!1134775))

(declare-fun m!1134879 () Bool)

(assert (=> bm!60850 m!1134879))

(assert (=> b!1231088 m!1134775))

(assert (=> b!1231088 m!1134775))

(assert (=> b!1231088 m!1134777))

(assert (=> b!1231091 m!1134775))

(assert (=> b!1231091 m!1134775))

(declare-fun m!1134881 () Bool)

(assert (=> b!1231091 m!1134881))

(assert (=> b!1230952 d!134531))

(declare-fun d!134537 () Bool)

(assert (=> d!134537 (= (validKeyInArray!0 (select (arr!38288 a!3806) from!3184)) (and (not (= (select (arr!38288 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38288 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1230957 d!134537))

(declare-fun d!134539 () Bool)

(assert (=> d!134539 (= (array_inv!29271 a!3806) (bvsge (size!38826 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102274 d!134539))

(declare-fun b!1231097 () Bool)

(declare-fun e!698372 () Bool)

(declare-fun e!698370 () Bool)

(assert (=> b!1231097 (= e!698372 e!698370)))

(declare-fun res!819581 () Bool)

(assert (=> b!1231097 (=> (not res!819581) (not e!698370))))

(declare-fun e!698371 () Bool)

(assert (=> b!1231097 (= res!819581 (not e!698371))))

(declare-fun res!819580 () Bool)

(assert (=> b!1231097 (=> (not res!819580) (not e!698371))))

(assert (=> b!1231097 (= res!819580 (validKeyInArray!0 (select (arr!38288 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun c!120622 () Bool)

(declare-fun call!60855 () Bool)

(declare-fun bm!60852 () Bool)

(assert (=> bm!60852 (= call!60855 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120622 (Cons!27158 (select (arr!38288 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27158 (select (arr!38288 a!3806) from!3184) acc!823)) (Cons!27158 (select (arr!38288 a!3806) from!3184) acc!823))))))

(declare-fun d!134541 () Bool)

(declare-fun res!819579 () Bool)

(assert (=> d!134541 (=> res!819579 e!698372)))

(assert (=> d!134541 (= res!819579 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38826 a!3806)))))

(assert (=> d!134541 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27158 (select (arr!38288 a!3806) from!3184) acc!823)) e!698372)))

(declare-fun b!1231098 () Bool)

(declare-fun e!698369 () Bool)

(assert (=> b!1231098 (= e!698370 e!698369)))

(assert (=> b!1231098 (= c!120622 (validKeyInArray!0 (select (arr!38288 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231099 () Bool)

(assert (=> b!1231099 (= e!698369 call!60855)))

(declare-fun b!1231100 () Bool)

(assert (=> b!1231100 (= e!698369 call!60855)))

(declare-fun b!1231101 () Bool)

(assert (=> b!1231101 (= e!698371 (contains!7134 (Cons!27158 (select (arr!38288 a!3806) from!3184) acc!823) (select (arr!38288 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134541 (not res!819579)) b!1231097))

(assert (= (and b!1231097 res!819580) b!1231101))

(assert (= (and b!1231097 res!819581) b!1231098))

(assert (= (and b!1231098 c!120622) b!1231099))

(assert (= (and b!1231098 (not c!120622)) b!1231100))

(assert (= (or b!1231099 b!1231100) bm!60852))

(declare-fun m!1134887 () Bool)

(assert (=> b!1231097 m!1134887))

(assert (=> b!1231097 m!1134887))

(declare-fun m!1134889 () Bool)

(assert (=> b!1231097 m!1134889))

(assert (=> bm!60852 m!1134887))

(declare-fun m!1134891 () Bool)

(assert (=> bm!60852 m!1134891))

(assert (=> b!1231098 m!1134887))

(assert (=> b!1231098 m!1134887))

(assert (=> b!1231098 m!1134889))

(assert (=> b!1231101 m!1134887))

(assert (=> b!1231101 m!1134887))

(declare-fun m!1134893 () Bool)

(assert (=> b!1231101 m!1134893))

(assert (=> b!1230959 d!134541))

(declare-fun d!134547 () Bool)

(declare-fun res!819597 () Bool)

(declare-fun e!698389 () Bool)

(assert (=> d!134547 (=> res!819597 e!698389)))

(assert (=> d!134547 (= res!819597 (= (select (arr!38288 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134547 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698389)))

(declare-fun b!1231119 () Bool)

(declare-fun e!698390 () Bool)

(assert (=> b!1231119 (= e!698389 e!698390)))

(declare-fun res!819598 () Bool)

(assert (=> b!1231119 (=> (not res!819598) (not e!698390))))

(assert (=> b!1231119 (= res!819598 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38826 a!3806)))))

(declare-fun b!1231120 () Bool)

(assert (=> b!1231120 (= e!698390 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134547 (not res!819597)) b!1231119))

(assert (= (and b!1231119 res!819598) b!1231120))

(assert (=> d!134547 m!1134887))

(declare-fun m!1134907 () Bool)

(assert (=> b!1231120 m!1134907))

(assert (=> b!1230953 d!134547))

(check-sat (not b!1231101) (not d!134529) (not b!1231087) (not d!134515) (not bm!60850) (not b!1231040) (not b!1231048) (not b!1231042) (not b!1231120) (not b!1231037) (not bm!60852) (not b!1231097) (not d!134521) (not d!134527) (not b!1231088) (not b!1231098) (not b!1231032) (not b!1231038) (not b!1231091))
(check-sat)
