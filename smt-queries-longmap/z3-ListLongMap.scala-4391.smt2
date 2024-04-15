; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60362 () Bool)

(assert start!60362)

(declare-fun b!678233 () Bool)

(declare-fun res!444802 () Bool)

(declare-fun e!386458 () Bool)

(assert (=> b!678233 (=> (not res!444802) (not e!386458))))

(declare-datatypes ((List!12982 0))(
  ( (Nil!12979) (Cons!12978 (h!14023 (_ BitVec 64)) (t!19201 List!12982)) )
))
(declare-fun acc!681 () List!12982)

(declare-fun noDuplicate!773 (List!12982) Bool)

(assert (=> b!678233 (= res!444802 (noDuplicate!773 acc!681))))

(declare-fun b!678234 () Bool)

(declare-fun res!444810 () Bool)

(assert (=> b!678234 (=> (not res!444810) (not e!386458))))

(declare-datatypes ((array!39420 0))(
  ( (array!39421 (arr!18902 (Array (_ BitVec 32) (_ BitVec 64))) (size!19267 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39420)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678234 (= res!444810 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun b!678235 () Bool)

(assert (=> b!678235 (= e!386458 (not (arrayContainsKey!0 (array!39421 (store (arr!18902 a!3626) i!1382 k0!2843) (size!19267 a!3626)) k0!2843 from!3004)))))

(declare-fun b!678236 () Bool)

(declare-fun e!386457 () Bool)

(declare-fun e!386459 () Bool)

(assert (=> b!678236 (= e!386457 e!386459)))

(declare-fun res!444814 () Bool)

(assert (=> b!678236 (=> (not res!444814) (not e!386459))))

(assert (=> b!678236 (= res!444814 (bvsle from!3004 i!1382))))

(declare-fun b!678237 () Bool)

(declare-fun res!444806 () Bool)

(assert (=> b!678237 (=> (not res!444806) (not e!386458))))

(assert (=> b!678237 (= res!444806 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19267 a!3626))))))

(declare-fun b!678238 () Bool)

(declare-fun contains!3504 (List!12982 (_ BitVec 64)) Bool)

(assert (=> b!678238 (= e!386459 (not (contains!3504 acc!681 k0!2843)))))

(declare-fun b!678239 () Bool)

(declare-fun res!444807 () Bool)

(assert (=> b!678239 (=> (not res!444807) (not e!386458))))

(assert (=> b!678239 (= res!444807 (not (contains!3504 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678240 () Bool)

(declare-fun res!444804 () Bool)

(assert (=> b!678240 (=> (not res!444804) (not e!386458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678240 (= res!444804 (validKeyInArray!0 k0!2843))))

(declare-fun b!678241 () Bool)

(declare-fun res!444805 () Bool)

(assert (=> b!678241 (=> (not res!444805) (not e!386458))))

(assert (=> b!678241 (= res!444805 e!386457)))

(declare-fun res!444808 () Bool)

(assert (=> b!678241 (=> res!444808 e!386457)))

(declare-fun e!386455 () Bool)

(assert (=> b!678241 (= res!444808 e!386455)))

(declare-fun res!444801 () Bool)

(assert (=> b!678241 (=> (not res!444801) (not e!386455))))

(assert (=> b!678241 (= res!444801 (bvsgt from!3004 i!1382))))

(declare-fun b!678243 () Bool)

(declare-fun res!444813 () Bool)

(assert (=> b!678243 (=> (not res!444813) (not e!386458))))

(declare-fun arrayNoDuplicates!0 (array!39420 (_ BitVec 32) List!12982) Bool)

(assert (=> b!678243 (= res!444813 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12979))))

(declare-fun b!678244 () Bool)

(assert (=> b!678244 (= e!386455 (contains!3504 acc!681 k0!2843))))

(declare-fun b!678245 () Bool)

(declare-fun res!444809 () Bool)

(assert (=> b!678245 (=> (not res!444809) (not e!386458))))

(assert (=> b!678245 (= res!444809 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19267 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678246 () Bool)

(declare-fun res!444811 () Bool)

(assert (=> b!678246 (=> (not res!444811) (not e!386458))))

(assert (=> b!678246 (= res!444811 (not (contains!3504 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678242 () Bool)

(declare-fun res!444803 () Bool)

(assert (=> b!678242 (=> (not res!444803) (not e!386458))))

(assert (=> b!678242 (= res!444803 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!444812 () Bool)

(assert (=> start!60362 (=> (not res!444812) (not e!386458))))

(assert (=> start!60362 (= res!444812 (and (bvslt (size!19267 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19267 a!3626))))))

(assert (=> start!60362 e!386458))

(assert (=> start!60362 true))

(declare-fun array_inv!14785 (array!39420) Bool)

(assert (=> start!60362 (array_inv!14785 a!3626)))

(assert (= (and start!60362 res!444812) b!678233))

(assert (= (and b!678233 res!444802) b!678239))

(assert (= (and b!678239 res!444807) b!678246))

(assert (= (and b!678246 res!444811) b!678241))

(assert (= (and b!678241 res!444801) b!678244))

(assert (= (and b!678241 (not res!444808)) b!678236))

(assert (= (and b!678236 res!444814) b!678238))

(assert (= (and b!678241 res!444805) b!678243))

(assert (= (and b!678243 res!444813) b!678242))

(assert (= (and b!678242 res!444803) b!678237))

(assert (= (and b!678237 res!444806) b!678240))

(assert (= (and b!678240 res!444804) b!678234))

(assert (= (and b!678234 res!444810) b!678245))

(assert (= (and b!678245 res!444809) b!678235))

(declare-fun m!643479 () Bool)

(assert (=> b!678242 m!643479))

(declare-fun m!643481 () Bool)

(assert (=> b!678246 m!643481))

(declare-fun m!643483 () Bool)

(assert (=> b!678234 m!643483))

(declare-fun m!643485 () Bool)

(assert (=> b!678244 m!643485))

(declare-fun m!643487 () Bool)

(assert (=> b!678240 m!643487))

(declare-fun m!643489 () Bool)

(assert (=> b!678233 m!643489))

(declare-fun m!643491 () Bool)

(assert (=> b!678235 m!643491))

(declare-fun m!643493 () Bool)

(assert (=> b!678235 m!643493))

(declare-fun m!643495 () Bool)

(assert (=> start!60362 m!643495))

(declare-fun m!643497 () Bool)

(assert (=> b!678243 m!643497))

(declare-fun m!643499 () Bool)

(assert (=> b!678239 m!643499))

(assert (=> b!678238 m!643485))

(check-sat (not b!678234) (not b!678244) (not b!678235) (not b!678243) (not b!678239) (not b!678233) (not b!678242) (not b!678246) (not start!60362) (not b!678240) (not b!678238))
(check-sat)
(get-model)

(declare-fun d!93203 () Bool)

(assert (=> d!93203 (= (array_inv!14785 a!3626) (bvsge (size!19267 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60362 d!93203))

(declare-fun b!678353 () Bool)

(declare-fun e!386510 () Bool)

(declare-fun e!386511 () Bool)

(assert (=> b!678353 (= e!386510 e!386511)))

(declare-fun c!77085 () Bool)

(assert (=> b!678353 (= c!77085 (validKeyInArray!0 (select (arr!18902 a!3626) from!3004)))))

(declare-fun e!386512 () Bool)

(declare-fun b!678354 () Bool)

(assert (=> b!678354 (= e!386512 (contains!3504 acc!681 (select (arr!18902 a!3626) from!3004)))))

(declare-fun b!678355 () Bool)

(declare-fun call!33889 () Bool)

(assert (=> b!678355 (= e!386511 call!33889)))

(declare-fun bm!33886 () Bool)

(assert (=> bm!33886 (= call!33889 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77085 (Cons!12978 (select (arr!18902 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!678356 () Bool)

(assert (=> b!678356 (= e!386511 call!33889)))

(declare-fun b!678357 () Bool)

(declare-fun e!386513 () Bool)

(assert (=> b!678357 (= e!386513 e!386510)))

(declare-fun res!444918 () Bool)

(assert (=> b!678357 (=> (not res!444918) (not e!386510))))

(assert (=> b!678357 (= res!444918 (not e!386512))))

(declare-fun res!444919 () Bool)

(assert (=> b!678357 (=> (not res!444919) (not e!386512))))

(assert (=> b!678357 (= res!444919 (validKeyInArray!0 (select (arr!18902 a!3626) from!3004)))))

(declare-fun d!93207 () Bool)

(declare-fun res!444917 () Bool)

(assert (=> d!93207 (=> res!444917 e!386513)))

(assert (=> d!93207 (= res!444917 (bvsge from!3004 (size!19267 a!3626)))))

(assert (=> d!93207 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!386513)))

(assert (= (and d!93207 (not res!444917)) b!678357))

(assert (= (and b!678357 res!444919) b!678354))

(assert (= (and b!678357 res!444918) b!678353))

(assert (= (and b!678353 c!77085) b!678355))

(assert (= (and b!678353 (not c!77085)) b!678356))

(assert (= (or b!678355 b!678356) bm!33886))

(declare-fun m!643555 () Bool)

(assert (=> b!678353 m!643555))

(assert (=> b!678353 m!643555))

(declare-fun m!643557 () Bool)

(assert (=> b!678353 m!643557))

(assert (=> b!678354 m!643555))

(assert (=> b!678354 m!643555))

(declare-fun m!643559 () Bool)

(assert (=> b!678354 m!643559))

(assert (=> bm!33886 m!643555))

(declare-fun m!643561 () Bool)

(assert (=> bm!33886 m!643561))

(assert (=> b!678357 m!643555))

(assert (=> b!678357 m!643555))

(assert (=> b!678357 m!643557))

(assert (=> b!678242 d!93207))

(declare-fun d!93213 () Bool)

(declare-fun lt!312645 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!262 (List!12982) (InoxSet (_ BitVec 64)))

(assert (=> d!93213 (= lt!312645 (select (content!262 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386526 () Bool)

(assert (=> d!93213 (= lt!312645 e!386526)))

(declare-fun res!444931 () Bool)

(assert (=> d!93213 (=> (not res!444931) (not e!386526))))

(get-info :version)

(assert (=> d!93213 (= res!444931 ((_ is Cons!12978) acc!681))))

(assert (=> d!93213 (= (contains!3504 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312645)))

(declare-fun b!678372 () Bool)

(declare-fun e!386527 () Bool)

(assert (=> b!678372 (= e!386526 e!386527)))

(declare-fun res!444930 () Bool)

(assert (=> b!678372 (=> res!444930 e!386527)))

(assert (=> b!678372 (= res!444930 (= (h!14023 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678373 () Bool)

(assert (=> b!678373 (= e!386527 (contains!3504 (t!19201 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93213 res!444931) b!678372))

(assert (= (and b!678372 (not res!444930)) b!678373))

(declare-fun m!643563 () Bool)

(assert (=> d!93213 m!643563))

(declare-fun m!643565 () Bool)

(assert (=> d!93213 m!643565))

(declare-fun m!643567 () Bool)

(assert (=> b!678373 m!643567))

(assert (=> b!678246 d!93213))

(declare-fun d!93217 () Bool)

(declare-fun res!444945 () Bool)

(declare-fun e!386542 () Bool)

(assert (=> d!93217 (=> res!444945 e!386542)))

(assert (=> d!93217 (= res!444945 (= (select (arr!18902 (array!39421 (store (arr!18902 a!3626) i!1382 k0!2843) (size!19267 a!3626))) from!3004) k0!2843))))

(assert (=> d!93217 (= (arrayContainsKey!0 (array!39421 (store (arr!18902 a!3626) i!1382 k0!2843) (size!19267 a!3626)) k0!2843 from!3004) e!386542)))

(declare-fun b!678389 () Bool)

(declare-fun e!386543 () Bool)

(assert (=> b!678389 (= e!386542 e!386543)))

(declare-fun res!444946 () Bool)

(assert (=> b!678389 (=> (not res!444946) (not e!386543))))

(assert (=> b!678389 (= res!444946 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19267 (array!39421 (store (arr!18902 a!3626) i!1382 k0!2843) (size!19267 a!3626)))))))

(declare-fun b!678390 () Bool)

(assert (=> b!678390 (= e!386543 (arrayContainsKey!0 (array!39421 (store (arr!18902 a!3626) i!1382 k0!2843) (size!19267 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93217 (not res!444945)) b!678389))

(assert (= (and b!678389 res!444946) b!678390))

(declare-fun m!643581 () Bool)

(assert (=> d!93217 m!643581))

(declare-fun m!643583 () Bool)

(assert (=> b!678390 m!643583))

(assert (=> b!678235 d!93217))

(declare-fun d!93225 () Bool)

(assert (=> d!93225 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!678240 d!93225))

(declare-fun d!93227 () Bool)

(declare-fun res!444947 () Bool)

(declare-fun e!386544 () Bool)

(assert (=> d!93227 (=> res!444947 e!386544)))

(assert (=> d!93227 (= res!444947 (= (select (arr!18902 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93227 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!386544)))

(declare-fun b!678391 () Bool)

(declare-fun e!386545 () Bool)

(assert (=> b!678391 (= e!386544 e!386545)))

(declare-fun res!444948 () Bool)

(assert (=> b!678391 (=> (not res!444948) (not e!386545))))

(assert (=> b!678391 (= res!444948 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19267 a!3626)))))

(declare-fun b!678392 () Bool)

(assert (=> b!678392 (= e!386545 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93227 (not res!444947)) b!678391))

(assert (= (and b!678391 res!444948) b!678392))

(declare-fun m!643585 () Bool)

(assert (=> d!93227 m!643585))

(declare-fun m!643587 () Bool)

(assert (=> b!678392 m!643587))

(assert (=> b!678234 d!93227))

(declare-fun d!93229 () Bool)

(declare-fun lt!312646 () Bool)

(assert (=> d!93229 (= lt!312646 (select (content!262 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386550 () Bool)

(assert (=> d!93229 (= lt!312646 e!386550)))

(declare-fun res!444954 () Bool)

(assert (=> d!93229 (=> (not res!444954) (not e!386550))))

(assert (=> d!93229 (= res!444954 ((_ is Cons!12978) acc!681))))

(assert (=> d!93229 (= (contains!3504 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312646)))

(declare-fun b!678397 () Bool)

(declare-fun e!386551 () Bool)

(assert (=> b!678397 (= e!386550 e!386551)))

(declare-fun res!444953 () Bool)

(assert (=> b!678397 (=> res!444953 e!386551)))

(assert (=> b!678397 (= res!444953 (= (h!14023 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678398 () Bool)

(assert (=> b!678398 (= e!386551 (contains!3504 (t!19201 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93229 res!444954) b!678397))

(assert (= (and b!678397 (not res!444953)) b!678398))

(assert (=> d!93229 m!643563))

(declare-fun m!643589 () Bool)

(assert (=> d!93229 m!643589))

(declare-fun m!643591 () Bool)

(assert (=> b!678398 m!643591))

(assert (=> b!678239 d!93229))

(declare-fun d!93231 () Bool)

(declare-fun lt!312647 () Bool)

(assert (=> d!93231 (= lt!312647 (select (content!262 acc!681) k0!2843))))

(declare-fun e!386552 () Bool)

(assert (=> d!93231 (= lt!312647 e!386552)))

(declare-fun res!444956 () Bool)

(assert (=> d!93231 (=> (not res!444956) (not e!386552))))

(assert (=> d!93231 (= res!444956 ((_ is Cons!12978) acc!681))))

(assert (=> d!93231 (= (contains!3504 acc!681 k0!2843) lt!312647)))

(declare-fun b!678399 () Bool)

(declare-fun e!386553 () Bool)

(assert (=> b!678399 (= e!386552 e!386553)))

(declare-fun res!444955 () Bool)

(assert (=> b!678399 (=> res!444955 e!386553)))

(assert (=> b!678399 (= res!444955 (= (h!14023 acc!681) k0!2843))))

(declare-fun b!678400 () Bool)

(assert (=> b!678400 (= e!386553 (contains!3504 (t!19201 acc!681) k0!2843))))

(assert (= (and d!93231 res!444956) b!678399))

(assert (= (and b!678399 (not res!444955)) b!678400))

(assert (=> d!93231 m!643563))

(declare-fun m!643593 () Bool)

(assert (=> d!93231 m!643593))

(declare-fun m!643595 () Bool)

(assert (=> b!678400 m!643595))

(assert (=> b!678244 d!93231))

(declare-fun d!93233 () Bool)

(declare-fun res!444974 () Bool)

(declare-fun e!386572 () Bool)

(assert (=> d!93233 (=> res!444974 e!386572)))

(assert (=> d!93233 (= res!444974 ((_ is Nil!12979) acc!681))))

(assert (=> d!93233 (= (noDuplicate!773 acc!681) e!386572)))

(declare-fun b!678420 () Bool)

(declare-fun e!386573 () Bool)

(assert (=> b!678420 (= e!386572 e!386573)))

(declare-fun res!444975 () Bool)

(assert (=> b!678420 (=> (not res!444975) (not e!386573))))

(assert (=> b!678420 (= res!444975 (not (contains!3504 (t!19201 acc!681) (h!14023 acc!681))))))

(declare-fun b!678421 () Bool)

(assert (=> b!678421 (= e!386573 (noDuplicate!773 (t!19201 acc!681)))))

(assert (= (and d!93233 (not res!444974)) b!678420))

(assert (= (and b!678420 res!444975) b!678421))

(declare-fun m!643619 () Bool)

(assert (=> b!678420 m!643619))

(declare-fun m!643621 () Bool)

(assert (=> b!678421 m!643621))

(assert (=> b!678233 d!93233))

(assert (=> b!678238 d!93231))

(declare-fun b!678422 () Bool)

(declare-fun e!386574 () Bool)

(declare-fun e!386575 () Bool)

(assert (=> b!678422 (= e!386574 e!386575)))

(declare-fun c!77090 () Bool)

(assert (=> b!678422 (= c!77090 (validKeyInArray!0 (select (arr!18902 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!678423 () Bool)

(declare-fun e!386576 () Bool)

(assert (=> b!678423 (= e!386576 (contains!3504 Nil!12979 (select (arr!18902 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!678424 () Bool)

(declare-fun call!33894 () Bool)

(assert (=> b!678424 (= e!386575 call!33894)))

(declare-fun bm!33891 () Bool)

(assert (=> bm!33891 (= call!33894 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77090 (Cons!12978 (select (arr!18902 a!3626) #b00000000000000000000000000000000) Nil!12979) Nil!12979)))))

(declare-fun b!678425 () Bool)

(assert (=> b!678425 (= e!386575 call!33894)))

(declare-fun b!678426 () Bool)

(declare-fun e!386577 () Bool)

(assert (=> b!678426 (= e!386577 e!386574)))

(declare-fun res!444977 () Bool)

(assert (=> b!678426 (=> (not res!444977) (not e!386574))))

(assert (=> b!678426 (= res!444977 (not e!386576))))

(declare-fun res!444978 () Bool)

(assert (=> b!678426 (=> (not res!444978) (not e!386576))))

(assert (=> b!678426 (= res!444978 (validKeyInArray!0 (select (arr!18902 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93243 () Bool)

(declare-fun res!444976 () Bool)

(assert (=> d!93243 (=> res!444976 e!386577)))

(assert (=> d!93243 (= res!444976 (bvsge #b00000000000000000000000000000000 (size!19267 a!3626)))))

(assert (=> d!93243 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12979) e!386577)))

(assert (= (and d!93243 (not res!444976)) b!678426))

(assert (= (and b!678426 res!444978) b!678423))

(assert (= (and b!678426 res!444977) b!678422))

(assert (= (and b!678422 c!77090) b!678424))

(assert (= (and b!678422 (not c!77090)) b!678425))

(assert (= (or b!678424 b!678425) bm!33891))

(assert (=> b!678422 m!643585))

(assert (=> b!678422 m!643585))

(declare-fun m!643623 () Bool)

(assert (=> b!678422 m!643623))

(assert (=> b!678423 m!643585))

(assert (=> b!678423 m!643585))

(declare-fun m!643625 () Bool)

(assert (=> b!678423 m!643625))

(assert (=> bm!33891 m!643585))

(declare-fun m!643629 () Bool)

(assert (=> bm!33891 m!643629))

(assert (=> b!678426 m!643585))

(assert (=> b!678426 m!643585))

(assert (=> b!678426 m!643623))

(assert (=> b!678243 d!93243))

(check-sat (not d!93213) (not b!678426) (not b!678353) (not b!678421) (not d!93231) (not b!678354) (not b!678400) (not bm!33886) (not b!678423) (not b!678392) (not b!678357) (not b!678420) (not d!93229) (not b!678390) (not b!678373) (not b!678422) (not bm!33891) (not b!678398))
(check-sat)
