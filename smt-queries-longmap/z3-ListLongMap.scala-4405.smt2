; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60638 () Bool)

(assert start!60638)

(declare-fun b!680947 () Bool)

(declare-fun e!387885 () Bool)

(declare-datatypes ((List!13024 0))(
  ( (Nil!13021) (Cons!13020 (h!14065 (_ BitVec 64)) (t!19249 List!13024)) )
))
(declare-fun acc!681 () List!13024)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3546 (List!13024 (_ BitVec 64)) Bool)

(assert (=> b!680947 (= e!387885 (contains!3546 acc!681 k0!2843))))

(declare-fun b!680948 () Bool)

(declare-fun res!447284 () Bool)

(declare-fun e!387886 () Bool)

(assert (=> b!680948 (=> (not res!447284) (not e!387886))))

(declare-datatypes ((array!39516 0))(
  ( (array!39517 (arr!18944 (Array (_ BitVec 32) (_ BitVec 64))) (size!19309 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39516)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39516 (_ BitVec 32) List!13024) Bool)

(assert (=> b!680948 (= res!447284 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680949 () Bool)

(declare-fun res!447287 () Bool)

(declare-fun e!387881 () Bool)

(assert (=> b!680949 (=> res!447287 e!387881)))

(declare-fun lt!312996 () List!13024)

(declare-fun noDuplicate!815 (List!13024) Bool)

(assert (=> b!680949 (= res!447287 (not (noDuplicate!815 lt!312996)))))

(declare-fun res!447288 () Bool)

(assert (=> start!60638 (=> (not res!447288) (not e!387886))))

(assert (=> start!60638 (= res!447288 (and (bvslt (size!19309 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19309 a!3626))))))

(assert (=> start!60638 e!387886))

(assert (=> start!60638 true))

(declare-fun array_inv!14827 (array!39516) Bool)

(assert (=> start!60638 (array_inv!14827 a!3626)))

(declare-fun b!680950 () Bool)

(declare-fun res!447271 () Bool)

(assert (=> b!680950 (=> (not res!447271) (not e!387886))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680950 (= res!447271 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19309 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680951 () Bool)

(declare-fun res!447273 () Bool)

(assert (=> b!680951 (=> (not res!447273) (not e!387886))))

(declare-fun arrayContainsKey!0 (array!39516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680951 (= res!447273 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680952 () Bool)

(declare-fun e!387880 () Bool)

(assert (=> b!680952 (= e!387880 (not (contains!3546 acc!681 k0!2843)))))

(declare-fun b!680953 () Bool)

(declare-datatypes ((Unit!23876 0))(
  ( (Unit!23877) )
))
(declare-fun e!387882 () Unit!23876)

(declare-fun Unit!23878 () Unit!23876)

(assert (=> b!680953 (= e!387882 Unit!23878)))

(declare-fun lt!312993 () Unit!23876)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39516 (_ BitVec 64) (_ BitVec 32)) Unit!23876)

(assert (=> b!680953 (= lt!312993 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680953 false))

(declare-fun b!680954 () Bool)

(declare-fun res!447289 () Bool)

(assert (=> b!680954 (=> (not res!447289) (not e!387886))))

(assert (=> b!680954 (= res!447289 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13021))))

(declare-fun b!680955 () Bool)

(declare-fun subseq!149 (List!13024 List!13024) Bool)

(assert (=> b!680955 (= e!387881 (subseq!149 acc!681 lt!312996))))

(declare-fun b!680956 () Bool)

(declare-fun res!447274 () Bool)

(assert (=> b!680956 (=> (not res!447274) (not e!387886))))

(assert (=> b!680956 (= res!447274 (not (contains!3546 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680957 () Bool)

(declare-fun res!447277 () Bool)

(assert (=> b!680957 (=> (not res!447277) (not e!387886))))

(assert (=> b!680957 (= res!447277 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19309 a!3626))))))

(declare-fun b!680958 () Bool)

(declare-fun Unit!23879 () Unit!23876)

(assert (=> b!680958 (= e!387882 Unit!23879)))

(declare-fun b!680959 () Bool)

(declare-fun res!447278 () Bool)

(assert (=> b!680959 (=> (not res!447278) (not e!387886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680959 (= res!447278 (validKeyInArray!0 k0!2843))))

(declare-fun b!680960 () Bool)

(declare-fun e!387887 () Bool)

(assert (=> b!680960 (= e!387887 e!387881)))

(declare-fun res!447276 () Bool)

(assert (=> b!680960 (=> res!447276 e!387881)))

(assert (=> b!680960 (= res!447276 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!313 (List!13024 (_ BitVec 64)) List!13024)

(assert (=> b!680960 (= lt!312996 ($colon$colon!313 acc!681 (select (arr!18944 a!3626) from!3004)))))

(assert (=> b!680960 (subseq!149 acc!681 acc!681)))

(declare-fun lt!312995 () Unit!23876)

(declare-fun lemmaListSubSeqRefl!0 (List!13024) Unit!23876)

(assert (=> b!680960 (= lt!312995 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680961 () Bool)

(declare-fun res!447275 () Bool)

(assert (=> b!680961 (=> (not res!447275) (not e!387886))))

(declare-fun e!387884 () Bool)

(assert (=> b!680961 (= res!447275 e!387884)))

(declare-fun res!447286 () Bool)

(assert (=> b!680961 (=> res!447286 e!387884)))

(assert (=> b!680961 (= res!447286 e!387885)))

(declare-fun res!447279 () Bool)

(assert (=> b!680961 (=> (not res!447279) (not e!387885))))

(assert (=> b!680961 (= res!447279 (bvsgt from!3004 i!1382))))

(declare-fun b!680962 () Bool)

(declare-fun res!447280 () Bool)

(assert (=> b!680962 (=> res!447280 e!387881)))

(assert (=> b!680962 (= res!447280 (contains!3546 lt!312996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680963 () Bool)

(declare-fun res!447281 () Bool)

(assert (=> b!680963 (=> (not res!447281) (not e!387886))))

(assert (=> b!680963 (= res!447281 (not (contains!3546 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680964 () Bool)

(declare-fun res!447285 () Bool)

(assert (=> b!680964 (=> res!447285 e!387881)))

(assert (=> b!680964 (= res!447285 (contains!3546 lt!312996 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680965 () Bool)

(assert (=> b!680965 (= e!387884 e!387880)))

(declare-fun res!447283 () Bool)

(assert (=> b!680965 (=> (not res!447283) (not e!387880))))

(assert (=> b!680965 (= res!447283 (bvsle from!3004 i!1382))))

(declare-fun b!680966 () Bool)

(assert (=> b!680966 (= e!387886 (not e!387887))))

(declare-fun res!447272 () Bool)

(assert (=> b!680966 (=> res!447272 e!387887)))

(assert (=> b!680966 (= res!447272 (not (validKeyInArray!0 (select (arr!18944 a!3626) from!3004))))))

(declare-fun lt!312994 () Unit!23876)

(assert (=> b!680966 (= lt!312994 e!387882)))

(declare-fun c!77205 () Bool)

(assert (=> b!680966 (= c!77205 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680966 (arrayContainsKey!0 (array!39517 (store (arr!18944 a!3626) i!1382 k0!2843) (size!19309 a!3626)) k0!2843 from!3004)))

(declare-fun b!680967 () Bool)

(declare-fun res!447282 () Bool)

(assert (=> b!680967 (=> (not res!447282) (not e!387886))))

(assert (=> b!680967 (= res!447282 (noDuplicate!815 acc!681))))

(assert (= (and start!60638 res!447288) b!680967))

(assert (= (and b!680967 res!447282) b!680956))

(assert (= (and b!680956 res!447274) b!680963))

(assert (= (and b!680963 res!447281) b!680961))

(assert (= (and b!680961 res!447279) b!680947))

(assert (= (and b!680961 (not res!447286)) b!680965))

(assert (= (and b!680965 res!447283) b!680952))

(assert (= (and b!680961 res!447275) b!680954))

(assert (= (and b!680954 res!447289) b!680948))

(assert (= (and b!680948 res!447284) b!680957))

(assert (= (and b!680957 res!447277) b!680959))

(assert (= (and b!680959 res!447278) b!680951))

(assert (= (and b!680951 res!447273) b!680950))

(assert (= (and b!680950 res!447271) b!680966))

(assert (= (and b!680966 c!77205) b!680953))

(assert (= (and b!680966 (not c!77205)) b!680958))

(assert (= (and b!680966 (not res!447272)) b!680960))

(assert (= (and b!680960 (not res!447276)) b!680949))

(assert (= (and b!680949 (not res!447287)) b!680962))

(assert (= (and b!680962 (not res!447280)) b!680964))

(assert (= (and b!680964 (not res!447285)) b!680955))

(declare-fun m!645351 () Bool)

(assert (=> b!680952 m!645351))

(declare-fun m!645353 () Bool)

(assert (=> b!680948 m!645353))

(declare-fun m!645355 () Bool)

(assert (=> b!680951 m!645355))

(declare-fun m!645357 () Bool)

(assert (=> b!680962 m!645357))

(declare-fun m!645359 () Bool)

(assert (=> b!680966 m!645359))

(declare-fun m!645361 () Bool)

(assert (=> b!680966 m!645361))

(declare-fun m!645363 () Bool)

(assert (=> b!680966 m!645363))

(assert (=> b!680966 m!645359))

(declare-fun m!645365 () Bool)

(assert (=> b!680966 m!645365))

(declare-fun m!645367 () Bool)

(assert (=> b!680966 m!645367))

(declare-fun m!645369 () Bool)

(assert (=> b!680963 m!645369))

(declare-fun m!645371 () Bool)

(assert (=> b!680953 m!645371))

(declare-fun m!645373 () Bool)

(assert (=> b!680956 m!645373))

(declare-fun m!645375 () Bool)

(assert (=> b!680967 m!645375))

(declare-fun m!645377 () Bool)

(assert (=> b!680954 m!645377))

(declare-fun m!645379 () Bool)

(assert (=> b!680959 m!645379))

(declare-fun m!645381 () Bool)

(assert (=> b!680964 m!645381))

(declare-fun m!645383 () Bool)

(assert (=> b!680949 m!645383))

(declare-fun m!645385 () Bool)

(assert (=> b!680955 m!645385))

(declare-fun m!645387 () Bool)

(assert (=> start!60638 m!645387))

(assert (=> b!680947 m!645351))

(assert (=> b!680960 m!645359))

(assert (=> b!680960 m!645359))

(declare-fun m!645389 () Bool)

(assert (=> b!680960 m!645389))

(declare-fun m!645391 () Bool)

(assert (=> b!680960 m!645391))

(declare-fun m!645393 () Bool)

(assert (=> b!680960 m!645393))

(check-sat (not b!680953) (not b!680963) (not b!680947) (not start!60638) (not b!680952) (not b!680951) (not b!680964) (not b!680959) (not b!680948) (not b!680967) (not b!680962) (not b!680949) (not b!680966) (not b!680954) (not b!680955) (not b!680960) (not b!680956))
(check-sat)
(get-model)

(declare-fun d!93579 () Bool)

(assert (=> d!93579 (= (array_inv!14827 a!3626) (bvsge (size!19309 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60638 d!93579))

(declare-fun d!93581 () Bool)

(declare-fun lt!313023 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!273 (List!13024) (InoxSet (_ BitVec 64)))

(assert (=> d!93581 (= lt!313023 (select (content!273 acc!681) k0!2843))))

(declare-fun e!387940 () Bool)

(assert (=> d!93581 (= lt!313023 e!387940)))

(declare-fun res!447409 () Bool)

(assert (=> d!93581 (=> (not res!447409) (not e!387940))))

(get-info :version)

(assert (=> d!93581 (= res!447409 ((_ is Cons!13020) acc!681))))

(assert (=> d!93581 (= (contains!3546 acc!681 k0!2843) lt!313023)))

(declare-fun b!681098 () Bool)

(declare-fun e!387941 () Bool)

(assert (=> b!681098 (= e!387940 e!387941)))

(declare-fun res!447408 () Bool)

(assert (=> b!681098 (=> res!447408 e!387941)))

(assert (=> b!681098 (= res!447408 (= (h!14065 acc!681) k0!2843))))

(declare-fun b!681099 () Bool)

(assert (=> b!681099 (= e!387941 (contains!3546 (t!19249 acc!681) k0!2843))))

(assert (= (and d!93581 res!447409) b!681098))

(assert (= (and b!681098 (not res!447408)) b!681099))

(declare-fun m!645483 () Bool)

(assert (=> d!93581 m!645483))

(declare-fun m!645485 () Bool)

(assert (=> d!93581 m!645485))

(declare-fun m!645487 () Bool)

(assert (=> b!681099 m!645487))

(assert (=> b!680947 d!93581))

(declare-fun d!93585 () Bool)

(declare-fun lt!313024 () Bool)

(assert (=> d!93585 (= lt!313024 (select (content!273 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387942 () Bool)

(assert (=> d!93585 (= lt!313024 e!387942)))

(declare-fun res!447411 () Bool)

(assert (=> d!93585 (=> (not res!447411) (not e!387942))))

(assert (=> d!93585 (= res!447411 ((_ is Cons!13020) acc!681))))

(assert (=> d!93585 (= (contains!3546 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313024)))

(declare-fun b!681100 () Bool)

(declare-fun e!387943 () Bool)

(assert (=> b!681100 (= e!387942 e!387943)))

(declare-fun res!447410 () Bool)

(assert (=> b!681100 (=> res!447410 e!387943)))

(assert (=> b!681100 (= res!447410 (= (h!14065 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681101 () Bool)

(assert (=> b!681101 (= e!387943 (contains!3546 (t!19249 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93585 res!447411) b!681100))

(assert (= (and b!681100 (not res!447410)) b!681101))

(assert (=> d!93585 m!645483))

(declare-fun m!645489 () Bool)

(assert (=> d!93585 m!645489))

(declare-fun m!645491 () Bool)

(assert (=> b!681101 m!645491))

(assert (=> b!680956 d!93585))

(declare-fun d!93587 () Bool)

(declare-fun res!447428 () Bool)

(declare-fun e!387960 () Bool)

(assert (=> d!93587 (=> res!447428 e!387960)))

(assert (=> d!93587 (= res!447428 ((_ is Nil!13021) acc!681))))

(assert (=> d!93587 (= (noDuplicate!815 acc!681) e!387960)))

(declare-fun b!681118 () Bool)

(declare-fun e!387961 () Bool)

(assert (=> b!681118 (= e!387960 e!387961)))

(declare-fun res!447429 () Bool)

(assert (=> b!681118 (=> (not res!447429) (not e!387961))))

(assert (=> b!681118 (= res!447429 (not (contains!3546 (t!19249 acc!681) (h!14065 acc!681))))))

(declare-fun b!681119 () Bool)

(assert (=> b!681119 (= e!387961 (noDuplicate!815 (t!19249 acc!681)))))

(assert (= (and d!93587 (not res!447428)) b!681118))

(assert (= (and b!681118 res!447429) b!681119))

(declare-fun m!645493 () Bool)

(assert (=> b!681118 m!645493))

(declare-fun m!645495 () Bool)

(assert (=> b!681119 m!645495))

(assert (=> b!680967 d!93587))

(declare-fun d!93589 () Bool)

(declare-fun res!447430 () Bool)

(declare-fun e!387962 () Bool)

(assert (=> d!93589 (=> res!447430 e!387962)))

(assert (=> d!93589 (= res!447430 ((_ is Nil!13021) lt!312996))))

(assert (=> d!93589 (= (noDuplicate!815 lt!312996) e!387962)))

(declare-fun b!681120 () Bool)

(declare-fun e!387963 () Bool)

(assert (=> b!681120 (= e!387962 e!387963)))

(declare-fun res!447431 () Bool)

(assert (=> b!681120 (=> (not res!447431) (not e!387963))))

(assert (=> b!681120 (= res!447431 (not (contains!3546 (t!19249 lt!312996) (h!14065 lt!312996))))))

(declare-fun b!681121 () Bool)

(assert (=> b!681121 (= e!387963 (noDuplicate!815 (t!19249 lt!312996)))))

(assert (= (and d!93589 (not res!447430)) b!681120))

(assert (= (and b!681120 res!447431) b!681121))

(declare-fun m!645501 () Bool)

(assert (=> b!681120 m!645501))

(declare-fun m!645503 () Bool)

(assert (=> b!681121 m!645503))

(assert (=> b!680949 d!93589))

(declare-fun d!93593 () Bool)

(assert (=> d!93593 (= ($colon$colon!313 acc!681 (select (arr!18944 a!3626) from!3004)) (Cons!13020 (select (arr!18944 a!3626) from!3004) acc!681))))

(assert (=> b!680960 d!93593))

(declare-fun d!93595 () Bool)

(declare-fun res!447448 () Bool)

(declare-fun e!387983 () Bool)

(assert (=> d!93595 (=> res!447448 e!387983)))

(assert (=> d!93595 (= res!447448 ((_ is Nil!13021) acc!681))))

(assert (=> d!93595 (= (subseq!149 acc!681 acc!681) e!387983)))

(declare-fun b!681141 () Bool)

(declare-fun e!387980 () Bool)

(assert (=> b!681141 (= e!387980 (subseq!149 acc!681 (t!19249 acc!681)))))

(declare-fun b!681140 () Bool)

(declare-fun e!387981 () Bool)

(assert (=> b!681140 (= e!387981 (subseq!149 (t!19249 acc!681) (t!19249 acc!681)))))

(declare-fun b!681138 () Bool)

(declare-fun e!387982 () Bool)

(assert (=> b!681138 (= e!387983 e!387982)))

(declare-fun res!447451 () Bool)

(assert (=> b!681138 (=> (not res!447451) (not e!387982))))

(assert (=> b!681138 (= res!447451 ((_ is Cons!13020) acc!681))))

(declare-fun b!681139 () Bool)

(assert (=> b!681139 (= e!387982 e!387980)))

(declare-fun res!447450 () Bool)

(assert (=> b!681139 (=> res!447450 e!387980)))

(assert (=> b!681139 (= res!447450 e!387981)))

(declare-fun res!447449 () Bool)

(assert (=> b!681139 (=> (not res!447449) (not e!387981))))

(assert (=> b!681139 (= res!447449 (= (h!14065 acc!681) (h!14065 acc!681)))))

(assert (= (and d!93595 (not res!447448)) b!681138))

(assert (= (and b!681138 res!447451) b!681139))

(assert (= (and b!681139 res!447449) b!681140))

(assert (= (and b!681139 (not res!447450)) b!681141))

(declare-fun m!645513 () Bool)

(assert (=> b!681141 m!645513))

(declare-fun m!645515 () Bool)

(assert (=> b!681140 m!645515))

(assert (=> b!680960 d!93595))

(declare-fun d!93605 () Bool)

(assert (=> d!93605 (subseq!149 acc!681 acc!681)))

(declare-fun lt!313030 () Unit!23876)

(declare-fun choose!36 (List!13024) Unit!23876)

(assert (=> d!93605 (= lt!313030 (choose!36 acc!681))))

(assert (=> d!93605 (= (lemmaListSubSeqRefl!0 acc!681) lt!313030)))

(declare-fun bs!19968 () Bool)

(assert (= bs!19968 d!93605))

(assert (=> bs!19968 m!645391))

(declare-fun m!645517 () Bool)

(assert (=> bs!19968 m!645517))

(assert (=> b!680960 d!93605))

(declare-fun d!93607 () Bool)

(declare-fun res!447478 () Bool)

(declare-fun e!388011 () Bool)

(assert (=> d!93607 (=> res!447478 e!388011)))

(assert (=> d!93607 (= res!447478 (bvsge from!3004 (size!19309 a!3626)))))

(assert (=> d!93607 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388011)))

(declare-fun b!681170 () Bool)

(declare-fun e!388010 () Bool)

(assert (=> b!681170 (= e!388010 (contains!3546 acc!681 (select (arr!18944 a!3626) from!3004)))))

(declare-fun b!681171 () Bool)

(declare-fun e!388013 () Bool)

(declare-fun e!388012 () Bool)

(assert (=> b!681171 (= e!388013 e!388012)))

(declare-fun c!77214 () Bool)

(assert (=> b!681171 (= c!77214 (validKeyInArray!0 (select (arr!18944 a!3626) from!3004)))))

(declare-fun b!681172 () Bool)

(declare-fun call!33937 () Bool)

(assert (=> b!681172 (= e!388012 call!33937)))

(declare-fun b!681173 () Bool)

(assert (=> b!681173 (= e!388011 e!388013)))

(declare-fun res!447476 () Bool)

(assert (=> b!681173 (=> (not res!447476) (not e!388013))))

(assert (=> b!681173 (= res!447476 (not e!388010))))

(declare-fun res!447477 () Bool)

(assert (=> b!681173 (=> (not res!447477) (not e!388010))))

(assert (=> b!681173 (= res!447477 (validKeyInArray!0 (select (arr!18944 a!3626) from!3004)))))

(declare-fun b!681174 () Bool)

(assert (=> b!681174 (= e!388012 call!33937)))

(declare-fun bm!33934 () Bool)

(assert (=> bm!33934 (= call!33937 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77214 (Cons!13020 (select (arr!18944 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!93607 (not res!447478)) b!681173))

(assert (= (and b!681173 res!447477) b!681170))

(assert (= (and b!681173 res!447476) b!681171))

(assert (= (and b!681171 c!77214) b!681174))

(assert (= (and b!681171 (not c!77214)) b!681172))

(assert (= (or b!681174 b!681172) bm!33934))

(assert (=> b!681170 m!645359))

(assert (=> b!681170 m!645359))

(declare-fun m!645537 () Bool)

(assert (=> b!681170 m!645537))

(assert (=> b!681171 m!645359))

(assert (=> b!681171 m!645359))

(assert (=> b!681171 m!645365))

(assert (=> b!681173 m!645359))

(assert (=> b!681173 m!645359))

(assert (=> b!681173 m!645365))

(assert (=> bm!33934 m!645359))

(declare-fun m!645539 () Bool)

(assert (=> bm!33934 m!645539))

(assert (=> b!680948 d!93607))

(declare-fun d!93619 () Bool)

(assert (=> d!93619 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680959 d!93619))

(assert (=> b!680952 d!93581))

(declare-fun d!93621 () Bool)

(declare-fun lt!313037 () Bool)

(assert (=> d!93621 (= lt!313037 (select (content!273 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388026 () Bool)

(assert (=> d!93621 (= lt!313037 e!388026)))

(declare-fun res!447490 () Bool)

(assert (=> d!93621 (=> (not res!447490) (not e!388026))))

(assert (=> d!93621 (= res!447490 ((_ is Cons!13020) acc!681))))

(assert (=> d!93621 (= (contains!3546 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313037)))

(declare-fun b!681189 () Bool)

(declare-fun e!388027 () Bool)

(assert (=> b!681189 (= e!388026 e!388027)))

(declare-fun res!447489 () Bool)

(assert (=> b!681189 (=> res!447489 e!388027)))

(assert (=> b!681189 (= res!447489 (= (h!14065 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681190 () Bool)

(assert (=> b!681190 (= e!388027 (contains!3546 (t!19249 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93621 res!447490) b!681189))

(assert (= (and b!681189 (not res!447489)) b!681190))

(assert (=> d!93621 m!645483))

(declare-fun m!645541 () Bool)

(assert (=> d!93621 m!645541))

(declare-fun m!645543 () Bool)

(assert (=> b!681190 m!645543))

(assert (=> b!680963 d!93621))

(declare-fun d!93623 () Bool)

(declare-fun res!447500 () Bool)

(declare-fun e!388038 () Bool)

(assert (=> d!93623 (=> res!447500 e!388038)))

(assert (=> d!93623 (= res!447500 (= (select (arr!18944 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93623 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388038)))

(declare-fun b!681202 () Bool)

(declare-fun e!388039 () Bool)

(assert (=> b!681202 (= e!388038 e!388039)))

(declare-fun res!447501 () Bool)

(assert (=> b!681202 (=> (not res!447501) (not e!388039))))

(assert (=> b!681202 (= res!447501 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19309 a!3626)))))

(declare-fun b!681203 () Bool)

(assert (=> b!681203 (= e!388039 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93623 (not res!447500)) b!681202))

(assert (= (and b!681202 res!447501) b!681203))

(declare-fun m!645553 () Bool)

(assert (=> d!93623 m!645553))

(declare-fun m!645555 () Bool)

(assert (=> b!681203 m!645555))

(assert (=> b!680951 d!93623))

(declare-fun d!93631 () Bool)

(declare-fun lt!313038 () Bool)

(assert (=> d!93631 (= lt!313038 (select (content!273 lt!312996) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388040 () Bool)

(assert (=> d!93631 (= lt!313038 e!388040)))

(declare-fun res!447503 () Bool)

(assert (=> d!93631 (=> (not res!447503) (not e!388040))))

(assert (=> d!93631 (= res!447503 ((_ is Cons!13020) lt!312996))))

(assert (=> d!93631 (= (contains!3546 lt!312996 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313038)))

(declare-fun b!681204 () Bool)

(declare-fun e!388041 () Bool)

(assert (=> b!681204 (= e!388040 e!388041)))

(declare-fun res!447502 () Bool)

(assert (=> b!681204 (=> res!447502 e!388041)))

(assert (=> b!681204 (= res!447502 (= (h!14065 lt!312996) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681205 () Bool)

(assert (=> b!681205 (= e!388041 (contains!3546 (t!19249 lt!312996) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93631 res!447503) b!681204))

(assert (= (and b!681204 (not res!447502)) b!681205))

(declare-fun m!645557 () Bool)

(assert (=> d!93631 m!645557))

(declare-fun m!645559 () Bool)

(assert (=> d!93631 m!645559))

(declare-fun m!645561 () Bool)

(assert (=> b!681205 m!645561))

(assert (=> b!680962 d!93631))

(declare-fun d!93635 () Bool)

(declare-fun res!447508 () Bool)

(declare-fun e!388049 () Bool)

(assert (=> d!93635 (=> res!447508 e!388049)))

(assert (=> d!93635 (= res!447508 ((_ is Nil!13021) acc!681))))

(assert (=> d!93635 (= (subseq!149 acc!681 lt!312996) e!388049)))

(declare-fun b!681213 () Bool)

(declare-fun e!388046 () Bool)

(assert (=> b!681213 (= e!388046 (subseq!149 acc!681 (t!19249 lt!312996)))))

(declare-fun b!681212 () Bool)

(declare-fun e!388047 () Bool)

(assert (=> b!681212 (= e!388047 (subseq!149 (t!19249 acc!681) (t!19249 lt!312996)))))

(declare-fun b!681210 () Bool)

(declare-fun e!388048 () Bool)

(assert (=> b!681210 (= e!388049 e!388048)))

(declare-fun res!447511 () Bool)

(assert (=> b!681210 (=> (not res!447511) (not e!388048))))

(assert (=> b!681210 (= res!447511 ((_ is Cons!13020) lt!312996))))

(declare-fun b!681211 () Bool)

(assert (=> b!681211 (= e!388048 e!388046)))

(declare-fun res!447510 () Bool)

(assert (=> b!681211 (=> res!447510 e!388046)))

(assert (=> b!681211 (= res!447510 e!388047)))

(declare-fun res!447509 () Bool)

(assert (=> b!681211 (=> (not res!447509) (not e!388047))))

(assert (=> b!681211 (= res!447509 (= (h!14065 acc!681) (h!14065 lt!312996)))))

(assert (= (and d!93635 (not res!447508)) b!681210))

(assert (= (and b!681210 res!447511) b!681211))

(assert (= (and b!681211 res!447509) b!681212))

(assert (= (and b!681211 (not res!447510)) b!681213))

(declare-fun m!645567 () Bool)

(assert (=> b!681213 m!645567))

(declare-fun m!645569 () Bool)

(assert (=> b!681212 m!645569))

(assert (=> b!680955 d!93635))

(declare-fun d!93639 () Bool)

(assert (=> d!93639 (= (validKeyInArray!0 (select (arr!18944 a!3626) from!3004)) (and (not (= (select (arr!18944 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18944 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680966 d!93639))

(declare-fun d!93641 () Bool)

(declare-fun res!447514 () Bool)

(declare-fun e!388052 () Bool)

(assert (=> d!93641 (=> res!447514 e!388052)))

(assert (=> d!93641 (= res!447514 (= (select (arr!18944 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93641 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388052)))

(declare-fun b!681214 () Bool)

(declare-fun e!388053 () Bool)

(assert (=> b!681214 (= e!388052 e!388053)))

(declare-fun res!447515 () Bool)

(assert (=> b!681214 (=> (not res!447515) (not e!388053))))

(assert (=> b!681214 (= res!447515 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19309 a!3626)))))

(declare-fun b!681215 () Bool)

(assert (=> b!681215 (= e!388053 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93641 (not res!447514)) b!681214))

(assert (= (and b!681214 res!447515) b!681215))

(declare-fun m!645571 () Bool)

(assert (=> d!93641 m!645571))

(declare-fun m!645573 () Bool)

(assert (=> b!681215 m!645573))

(assert (=> b!680966 d!93641))

(declare-fun d!93643 () Bool)

(declare-fun res!447522 () Bool)

(declare-fun e!388060 () Bool)

(assert (=> d!93643 (=> res!447522 e!388060)))

(assert (=> d!93643 (= res!447522 (= (select (arr!18944 (array!39517 (store (arr!18944 a!3626) i!1382 k0!2843) (size!19309 a!3626))) from!3004) k0!2843))))

(assert (=> d!93643 (= (arrayContainsKey!0 (array!39517 (store (arr!18944 a!3626) i!1382 k0!2843) (size!19309 a!3626)) k0!2843 from!3004) e!388060)))

(declare-fun b!681224 () Bool)

(declare-fun e!388061 () Bool)

(assert (=> b!681224 (= e!388060 e!388061)))

(declare-fun res!447523 () Bool)

(assert (=> b!681224 (=> (not res!447523) (not e!388061))))

(assert (=> b!681224 (= res!447523 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19309 (array!39517 (store (arr!18944 a!3626) i!1382 k0!2843) (size!19309 a!3626)))))))

(declare-fun b!681225 () Bool)

(assert (=> b!681225 (= e!388061 (arrayContainsKey!0 (array!39517 (store (arr!18944 a!3626) i!1382 k0!2843) (size!19309 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93643 (not res!447522)) b!681224))

(assert (= (and b!681224 res!447523) b!681225))

(declare-fun m!645575 () Bool)

(assert (=> d!93643 m!645575))

(declare-fun m!645577 () Bool)

(assert (=> b!681225 m!645577))

(assert (=> b!680966 d!93643))

(declare-fun d!93645 () Bool)

(assert (=> d!93645 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313047 () Unit!23876)

(declare-fun choose!13 (array!39516 (_ BitVec 64) (_ BitVec 32)) Unit!23876)

(assert (=> d!93645 (= lt!313047 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93645 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93645 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313047)))

(declare-fun bs!19971 () Bool)

(assert (= bs!19971 d!93645))

(assert (=> bs!19971 m!645355))

(declare-fun m!645603 () Bool)

(assert (=> bs!19971 m!645603))

(assert (=> b!680953 d!93645))

(declare-fun d!93659 () Bool)

(declare-fun lt!313048 () Bool)

(assert (=> d!93659 (= lt!313048 (select (content!273 lt!312996) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388080 () Bool)

(assert (=> d!93659 (= lt!313048 e!388080)))

(declare-fun res!447542 () Bool)

(assert (=> d!93659 (=> (not res!447542) (not e!388080))))

(assert (=> d!93659 (= res!447542 ((_ is Cons!13020) lt!312996))))

(assert (=> d!93659 (= (contains!3546 lt!312996 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313048)))

(declare-fun b!681245 () Bool)

(declare-fun e!388081 () Bool)

(assert (=> b!681245 (= e!388080 e!388081)))

(declare-fun res!447541 () Bool)

(assert (=> b!681245 (=> res!447541 e!388081)))

(assert (=> b!681245 (= res!447541 (= (h!14065 lt!312996) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681246 () Bool)

(assert (=> b!681246 (= e!388081 (contains!3546 (t!19249 lt!312996) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93659 res!447542) b!681245))

(assert (= (and b!681245 (not res!447541)) b!681246))

(assert (=> d!93659 m!645557))

(declare-fun m!645609 () Bool)

(assert (=> d!93659 m!645609))

(declare-fun m!645611 () Bool)

(assert (=> b!681246 m!645611))

(assert (=> b!680964 d!93659))

(declare-fun d!93663 () Bool)

(declare-fun res!447545 () Bool)

(declare-fun e!388083 () Bool)

(assert (=> d!93663 (=> res!447545 e!388083)))

(assert (=> d!93663 (= res!447545 (bvsge #b00000000000000000000000000000000 (size!19309 a!3626)))))

(assert (=> d!93663 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13021) e!388083)))

(declare-fun b!681247 () Bool)

(declare-fun e!388082 () Bool)

(assert (=> b!681247 (= e!388082 (contains!3546 Nil!13021 (select (arr!18944 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681248 () Bool)

(declare-fun e!388085 () Bool)

(declare-fun e!388084 () Bool)

(assert (=> b!681248 (= e!388085 e!388084)))

(declare-fun c!77219 () Bool)

(assert (=> b!681248 (= c!77219 (validKeyInArray!0 (select (arr!18944 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681249 () Bool)

(declare-fun call!33942 () Bool)

(assert (=> b!681249 (= e!388084 call!33942)))

(declare-fun b!681250 () Bool)

(assert (=> b!681250 (= e!388083 e!388085)))

(declare-fun res!447543 () Bool)

(assert (=> b!681250 (=> (not res!447543) (not e!388085))))

(assert (=> b!681250 (= res!447543 (not e!388082))))

(declare-fun res!447544 () Bool)

(assert (=> b!681250 (=> (not res!447544) (not e!388082))))

(assert (=> b!681250 (= res!447544 (validKeyInArray!0 (select (arr!18944 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681251 () Bool)

(assert (=> b!681251 (= e!388084 call!33942)))

(declare-fun bm!33939 () Bool)

(assert (=> bm!33939 (= call!33942 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77219 (Cons!13020 (select (arr!18944 a!3626) #b00000000000000000000000000000000) Nil!13021) Nil!13021)))))

(assert (= (and d!93663 (not res!447545)) b!681250))

(assert (= (and b!681250 res!447544) b!681247))

(assert (= (and b!681250 res!447543) b!681248))

(assert (= (and b!681248 c!77219) b!681251))

(assert (= (and b!681248 (not c!77219)) b!681249))

(assert (= (or b!681251 b!681249) bm!33939))

(assert (=> b!681247 m!645553))

(assert (=> b!681247 m!645553))

(declare-fun m!645619 () Bool)

(assert (=> b!681247 m!645619))

(assert (=> b!681248 m!645553))

(assert (=> b!681248 m!645553))

(declare-fun m!645621 () Bool)

(assert (=> b!681248 m!645621))

(assert (=> b!681250 m!645553))

(assert (=> b!681250 m!645553))

(assert (=> b!681250 m!645621))

(assert (=> bm!33939 m!645553))

(declare-fun m!645623 () Bool)

(assert (=> bm!33939 m!645623))

(assert (=> b!680954 d!93663))

(check-sat (not d!93659) (not b!681250) (not b!681190) (not b!681213) (not b!681140) (not b!681099) (not b!681118) (not d!93585) (not d!93631) (not d!93645) (not d!93605) (not d!93621) (not b!681173) (not bm!33934) (not b!681119) (not b!681246) (not b!681170) (not b!681120) (not b!681101) (not b!681203) (not b!681215) (not b!681225) (not d!93581) (not b!681212) (not b!681171) (not b!681248) (not bm!33939) (not b!681121) (not b!681247) (not b!681141) (not b!681205))
(check-sat)
