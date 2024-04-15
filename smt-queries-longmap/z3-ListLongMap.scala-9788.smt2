; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116200 () Bool)

(assert start!116200)

(declare-fun b!1372188 () Bool)

(declare-fun res!915529 () Bool)

(declare-fun e!777401 () Bool)

(assert (=> b!1372188 (=> (not res!915529) (not e!777401))))

(declare-datatypes ((array!93015 0))(
  ( (array!93016 (arr!44920 (Array (_ BitVec 32) (_ BitVec 64))) (size!45472 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93015)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32066 0))(
  ( (Nil!32063) (Cons!32062 (h!33271 (_ BitVec 64)) (t!46752 List!32066)) )
))
(declare-fun acc!866 () List!32066)

(declare-fun contains!9659 (List!32066 (_ BitVec 64)) Bool)

(assert (=> b!1372188 (= res!915529 (contains!9659 acc!866 (select (arr!44920 a!3861) from!3239)))))

(declare-fun b!1372189 () Bool)

(declare-fun res!915526 () Bool)

(declare-fun e!777402 () Bool)

(assert (=> b!1372189 (=> (not res!915526) (not e!777402))))

(assert (=> b!1372189 (= res!915526 (not (contains!9659 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372190 () Bool)

(declare-fun res!915530 () Bool)

(assert (=> b!1372190 (=> (not res!915530) (not e!777401))))

(assert (=> b!1372190 (= res!915530 (bvslt from!3239 (size!45472 a!3861)))))

(declare-fun b!1372191 () Bool)

(declare-fun res!915531 () Bool)

(assert (=> b!1372191 (=> (not res!915531) (not e!777402))))

(declare-fun newAcc!98 () List!32066)

(assert (=> b!1372191 (= res!915531 (not (contains!9659 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915532 () Bool)

(assert (=> start!116200 (=> (not res!915532) (not e!777402))))

(assert (=> start!116200 (= res!915532 (and (bvslt (size!45472 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45472 a!3861))))))

(assert (=> start!116200 e!777402))

(declare-fun array_inv!34153 (array!93015) Bool)

(assert (=> start!116200 (array_inv!34153 a!3861)))

(assert (=> start!116200 true))

(declare-fun b!1372192 () Bool)

(declare-fun res!915527 () Bool)

(assert (=> b!1372192 (=> (not res!915527) (not e!777402))))

(declare-fun noDuplicate!2574 (List!32066) Bool)

(assert (=> b!1372192 (= res!915527 (noDuplicate!2574 acc!866))))

(declare-fun b!1372193 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93015 (_ BitVec 32) List!32066) Bool)

(assert (=> b!1372193 (= e!777401 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1372194 () Bool)

(declare-fun res!915528 () Bool)

(assert (=> b!1372194 (=> (not res!915528) (not e!777402))))

(assert (=> b!1372194 (= res!915528 (not (contains!9659 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372195 () Bool)

(declare-fun res!915523 () Bool)

(assert (=> b!1372195 (=> (not res!915523) (not e!777402))))

(declare-fun subseq!1097 (List!32066 List!32066) Bool)

(assert (=> b!1372195 (= res!915523 (subseq!1097 newAcc!98 acc!866))))

(declare-fun b!1372196 () Bool)

(declare-fun res!915533 () Bool)

(assert (=> b!1372196 (=> (not res!915533) (not e!777402))))

(assert (=> b!1372196 (= res!915533 (not (contains!9659 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372197 () Bool)

(assert (=> b!1372197 (= e!777402 e!777401)))

(declare-fun res!915524 () Bool)

(assert (=> b!1372197 (=> (not res!915524) (not e!777401))))

(assert (=> b!1372197 (= res!915524 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45168 0))(
  ( (Unit!45169) )
))
(declare-fun lt!602649 () Unit!45168)

(declare-fun noDuplicateSubseq!284 (List!32066 List!32066) Unit!45168)

(assert (=> b!1372197 (= lt!602649 (noDuplicateSubseq!284 newAcc!98 acc!866))))

(declare-fun b!1372198 () Bool)

(declare-fun res!915525 () Bool)

(assert (=> b!1372198 (=> (not res!915525) (not e!777401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372198 (= res!915525 (validKeyInArray!0 (select (arr!44920 a!3861) from!3239)))))

(assert (= (and start!116200 res!915532) b!1372192))

(assert (= (and b!1372192 res!915527) b!1372189))

(assert (= (and b!1372189 res!915526) b!1372196))

(assert (= (and b!1372196 res!915533) b!1372191))

(assert (= (and b!1372191 res!915531) b!1372194))

(assert (= (and b!1372194 res!915528) b!1372195))

(assert (= (and b!1372195 res!915523) b!1372197))

(assert (= (and b!1372197 res!915524) b!1372190))

(assert (= (and b!1372190 res!915530) b!1372198))

(assert (= (and b!1372198 res!915525) b!1372188))

(assert (= (and b!1372188 res!915529) b!1372193))

(declare-fun m!1255221 () Bool)

(assert (=> b!1372188 m!1255221))

(assert (=> b!1372188 m!1255221))

(declare-fun m!1255223 () Bool)

(assert (=> b!1372188 m!1255223))

(declare-fun m!1255225 () Bool)

(assert (=> b!1372192 m!1255225))

(declare-fun m!1255227 () Bool)

(assert (=> b!1372193 m!1255227))

(declare-fun m!1255229 () Bool)

(assert (=> b!1372189 m!1255229))

(declare-fun m!1255231 () Bool)

(assert (=> b!1372196 m!1255231))

(declare-fun m!1255233 () Bool)

(assert (=> b!1372194 m!1255233))

(declare-fun m!1255235 () Bool)

(assert (=> b!1372197 m!1255235))

(declare-fun m!1255237 () Bool)

(assert (=> b!1372197 m!1255237))

(declare-fun m!1255239 () Bool)

(assert (=> b!1372195 m!1255239))

(declare-fun m!1255241 () Bool)

(assert (=> start!116200 m!1255241))

(assert (=> b!1372198 m!1255221))

(assert (=> b!1372198 m!1255221))

(declare-fun m!1255243 () Bool)

(assert (=> b!1372198 m!1255243))

(declare-fun m!1255245 () Bool)

(assert (=> b!1372191 m!1255245))

(check-sat (not b!1372198) (not b!1372193) (not start!116200) (not b!1372189) (not b!1372195) (not b!1372194) (not b!1372192) (not b!1372188) (not b!1372196) (not b!1372191) (not b!1372197))
(check-sat)
(get-model)

(declare-fun b!1372276 () Bool)

(declare-fun e!777432 () Bool)

(assert (=> b!1372276 (= e!777432 (subseq!1097 newAcc!98 (t!46752 acc!866)))))

(declare-fun b!1372275 () Bool)

(declare-fun e!777429 () Bool)

(assert (=> b!1372275 (= e!777429 (subseq!1097 (t!46752 newAcc!98) (t!46752 acc!866)))))

(declare-fun b!1372274 () Bool)

(declare-fun e!777431 () Bool)

(assert (=> b!1372274 (= e!777431 e!777432)))

(declare-fun res!915608 () Bool)

(assert (=> b!1372274 (=> res!915608 e!777432)))

(assert (=> b!1372274 (= res!915608 e!777429)))

(declare-fun res!915611 () Bool)

(assert (=> b!1372274 (=> (not res!915611) (not e!777429))))

(assert (=> b!1372274 (= res!915611 (= (h!33271 newAcc!98) (h!33271 acc!866)))))

(declare-fun b!1372273 () Bool)

(declare-fun e!777430 () Bool)

(assert (=> b!1372273 (= e!777430 e!777431)))

(declare-fun res!915610 () Bool)

(assert (=> b!1372273 (=> (not res!915610) (not e!777431))))

(get-info :version)

(assert (=> b!1372273 (= res!915610 ((_ is Cons!32062) acc!866))))

(declare-fun d!147669 () Bool)

(declare-fun res!915609 () Bool)

(assert (=> d!147669 (=> res!915609 e!777430)))

(assert (=> d!147669 (= res!915609 ((_ is Nil!32063) newAcc!98))))

(assert (=> d!147669 (= (subseq!1097 newAcc!98 acc!866) e!777430)))

(assert (= (and d!147669 (not res!915609)) b!1372273))

(assert (= (and b!1372273 res!915610) b!1372274))

(assert (= (and b!1372274 res!915611) b!1372275))

(assert (= (and b!1372274 (not res!915608)) b!1372276))

(declare-fun m!1255299 () Bool)

(assert (=> b!1372276 m!1255299))

(declare-fun m!1255301 () Bool)

(assert (=> b!1372275 m!1255301))

(assert (=> b!1372195 d!147669))

(declare-fun d!147671 () Bool)

(declare-fun lt!602660 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!740 (List!32066) (InoxSet (_ BitVec 64)))

(assert (=> d!147671 (= lt!602660 (select (content!740 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777442 () Bool)

(assert (=> d!147671 (= lt!602660 e!777442)))

(declare-fun res!915620 () Bool)

(assert (=> d!147671 (=> (not res!915620) (not e!777442))))

(assert (=> d!147671 (= res!915620 ((_ is Cons!32062) acc!866))))

(assert (=> d!147671 (= (contains!9659 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602660)))

(declare-fun b!1372285 () Bool)

(declare-fun e!777441 () Bool)

(assert (=> b!1372285 (= e!777442 e!777441)))

(declare-fun res!915621 () Bool)

(assert (=> b!1372285 (=> res!915621 e!777441)))

(assert (=> b!1372285 (= res!915621 (= (h!33271 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372286 () Bool)

(assert (=> b!1372286 (= e!777441 (contains!9659 (t!46752 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147671 res!915620) b!1372285))

(assert (= (and b!1372285 (not res!915621)) b!1372286))

(declare-fun m!1255303 () Bool)

(assert (=> d!147671 m!1255303))

(declare-fun m!1255305 () Bool)

(assert (=> d!147671 m!1255305))

(declare-fun m!1255307 () Bool)

(assert (=> b!1372286 m!1255307))

(assert (=> b!1372189 d!147671))

(declare-fun d!147677 () Bool)

(assert (=> d!147677 (= (array_inv!34153 a!3861) (bvsge (size!45472 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116200 d!147677))

(declare-fun d!147681 () Bool)

(declare-fun lt!602662 () Bool)

(assert (=> d!147681 (= lt!602662 (select (content!740 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777448 () Bool)

(assert (=> d!147681 (= lt!602662 e!777448)))

(declare-fun res!915626 () Bool)

(assert (=> d!147681 (=> (not res!915626) (not e!777448))))

(assert (=> d!147681 (= res!915626 ((_ is Cons!32062) newAcc!98))))

(assert (=> d!147681 (= (contains!9659 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602662)))

(declare-fun b!1372291 () Bool)

(declare-fun e!777447 () Bool)

(assert (=> b!1372291 (= e!777448 e!777447)))

(declare-fun res!915627 () Bool)

(assert (=> b!1372291 (=> res!915627 e!777447)))

(assert (=> b!1372291 (= res!915627 (= (h!33271 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372292 () Bool)

(assert (=> b!1372292 (= e!777447 (contains!9659 (t!46752 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147681 res!915626) b!1372291))

(assert (= (and b!1372291 (not res!915627)) b!1372292))

(declare-fun m!1255315 () Bool)

(assert (=> d!147681 m!1255315))

(declare-fun m!1255317 () Bool)

(assert (=> d!147681 m!1255317))

(declare-fun m!1255319 () Bool)

(assert (=> b!1372292 m!1255319))

(assert (=> b!1372194 d!147681))

(declare-fun b!1372335 () Bool)

(declare-fun e!777488 () Bool)

(declare-fun call!65576 () Bool)

(assert (=> b!1372335 (= e!777488 call!65576)))

(declare-fun e!777490 () Bool)

(declare-fun b!1372336 () Bool)

(assert (=> b!1372336 (= e!777490 (contains!9659 newAcc!98 (select (arr!44920 a!3861) from!3239)))))

(declare-fun b!1372337 () Bool)

(declare-fun e!777487 () Bool)

(declare-fun e!777489 () Bool)

(assert (=> b!1372337 (= e!777487 e!777489)))

(declare-fun res!915662 () Bool)

(assert (=> b!1372337 (=> (not res!915662) (not e!777489))))

(assert (=> b!1372337 (= res!915662 (not e!777490))))

(declare-fun res!915661 () Bool)

(assert (=> b!1372337 (=> (not res!915661) (not e!777490))))

(assert (=> b!1372337 (= res!915661 (validKeyInArray!0 (select (arr!44920 a!3861) from!3239)))))

(declare-fun bm!65573 () Bool)

(declare-fun c!127781 () Bool)

(assert (=> bm!65573 (= call!65576 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127781 (Cons!32062 (select (arr!44920 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1372339 () Bool)

(assert (=> b!1372339 (= e!777489 e!777488)))

(assert (=> b!1372339 (= c!127781 (validKeyInArray!0 (select (arr!44920 a!3861) from!3239)))))

(declare-fun d!147683 () Bool)

(declare-fun res!915660 () Bool)

(assert (=> d!147683 (=> res!915660 e!777487)))

(assert (=> d!147683 (= res!915660 (bvsge from!3239 (size!45472 a!3861)))))

(assert (=> d!147683 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777487)))

(declare-fun b!1372338 () Bool)

(assert (=> b!1372338 (= e!777488 call!65576)))

(assert (= (and d!147683 (not res!915660)) b!1372337))

(assert (= (and b!1372337 res!915661) b!1372336))

(assert (= (and b!1372337 res!915662) b!1372339))

(assert (= (and b!1372339 c!127781) b!1372338))

(assert (= (and b!1372339 (not c!127781)) b!1372335))

(assert (= (or b!1372338 b!1372335) bm!65573))

(assert (=> b!1372336 m!1255221))

(assert (=> b!1372336 m!1255221))

(declare-fun m!1255341 () Bool)

(assert (=> b!1372336 m!1255341))

(assert (=> b!1372337 m!1255221))

(assert (=> b!1372337 m!1255221))

(assert (=> b!1372337 m!1255243))

(assert (=> bm!65573 m!1255221))

(declare-fun m!1255343 () Bool)

(assert (=> bm!65573 m!1255343))

(assert (=> b!1372339 m!1255221))

(assert (=> b!1372339 m!1255221))

(assert (=> b!1372339 m!1255243))

(assert (=> b!1372193 d!147683))

(declare-fun lt!602667 () Bool)

(declare-fun d!147697 () Bool)

(assert (=> d!147697 (= lt!602667 (select (content!740 acc!866) (select (arr!44920 a!3861) from!3239)))))

(declare-fun e!777496 () Bool)

(assert (=> d!147697 (= lt!602667 e!777496)))

(declare-fun res!915665 () Bool)

(assert (=> d!147697 (=> (not res!915665) (not e!777496))))

(assert (=> d!147697 (= res!915665 ((_ is Cons!32062) acc!866))))

(assert (=> d!147697 (= (contains!9659 acc!866 (select (arr!44920 a!3861) from!3239)) lt!602667)))

(declare-fun b!1372348 () Bool)

(declare-fun e!777495 () Bool)

(assert (=> b!1372348 (= e!777496 e!777495)))

(declare-fun res!915666 () Bool)

(assert (=> b!1372348 (=> res!915666 e!777495)))

(assert (=> b!1372348 (= res!915666 (= (h!33271 acc!866) (select (arr!44920 a!3861) from!3239)))))

(declare-fun b!1372349 () Bool)

(assert (=> b!1372349 (= e!777495 (contains!9659 (t!46752 acc!866) (select (arr!44920 a!3861) from!3239)))))

(assert (= (and d!147697 res!915665) b!1372348))

(assert (= (and b!1372348 (not res!915666)) b!1372349))

(assert (=> d!147697 m!1255303))

(assert (=> d!147697 m!1255221))

(declare-fun m!1255345 () Bool)

(assert (=> d!147697 m!1255345))

(assert (=> b!1372349 m!1255221))

(declare-fun m!1255347 () Bool)

(assert (=> b!1372349 m!1255347))

(assert (=> b!1372188 d!147697))

(declare-fun d!147699 () Bool)

(assert (=> d!147699 (= (validKeyInArray!0 (select (arr!44920 a!3861) from!3239)) (and (not (= (select (arr!44920 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44920 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1372198 d!147699))

(declare-fun b!1372351 () Bool)

(declare-fun e!777499 () Bool)

(declare-fun call!65579 () Bool)

(assert (=> b!1372351 (= e!777499 call!65579)))

(declare-fun b!1372352 () Bool)

(declare-fun e!777501 () Bool)

(assert (=> b!1372352 (= e!777501 (contains!9659 acc!866 (select (arr!44920 a!3861) from!3239)))))

(declare-fun b!1372353 () Bool)

(declare-fun e!777498 () Bool)

(declare-fun e!777500 () Bool)

(assert (=> b!1372353 (= e!777498 e!777500)))

(declare-fun res!915670 () Bool)

(assert (=> b!1372353 (=> (not res!915670) (not e!777500))))

(assert (=> b!1372353 (= res!915670 (not e!777501))))

(declare-fun res!915669 () Bool)

(assert (=> b!1372353 (=> (not res!915669) (not e!777501))))

(assert (=> b!1372353 (= res!915669 (validKeyInArray!0 (select (arr!44920 a!3861) from!3239)))))

(declare-fun c!127784 () Bool)

(declare-fun bm!65576 () Bool)

(assert (=> bm!65576 (= call!65579 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127784 (Cons!32062 (select (arr!44920 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1372355 () Bool)

(assert (=> b!1372355 (= e!777500 e!777499)))

(assert (=> b!1372355 (= c!127784 (validKeyInArray!0 (select (arr!44920 a!3861) from!3239)))))

(declare-fun d!147703 () Bool)

(declare-fun res!915668 () Bool)

(assert (=> d!147703 (=> res!915668 e!777498)))

(assert (=> d!147703 (= res!915668 (bvsge from!3239 (size!45472 a!3861)))))

(assert (=> d!147703 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777498)))

(declare-fun b!1372354 () Bool)

(assert (=> b!1372354 (= e!777499 call!65579)))

(assert (= (and d!147703 (not res!915668)) b!1372353))

(assert (= (and b!1372353 res!915669) b!1372352))

(assert (= (and b!1372353 res!915670) b!1372355))

(assert (= (and b!1372355 c!127784) b!1372354))

(assert (= (and b!1372355 (not c!127784)) b!1372351))

(assert (= (or b!1372354 b!1372351) bm!65576))

(assert (=> b!1372352 m!1255221))

(assert (=> b!1372352 m!1255221))

(assert (=> b!1372352 m!1255223))

(assert (=> b!1372353 m!1255221))

(assert (=> b!1372353 m!1255221))

(assert (=> b!1372353 m!1255243))

(assert (=> bm!65576 m!1255221))

(declare-fun m!1255353 () Bool)

(assert (=> bm!65576 m!1255353))

(assert (=> b!1372355 m!1255221))

(assert (=> b!1372355 m!1255221))

(assert (=> b!1372355 m!1255243))

(assert (=> b!1372197 d!147703))

(declare-fun d!147705 () Bool)

(assert (=> d!147705 (noDuplicate!2574 newAcc!98)))

(declare-fun lt!602677 () Unit!45168)

(declare-fun choose!2031 (List!32066 List!32066) Unit!45168)

(assert (=> d!147705 (= lt!602677 (choose!2031 newAcc!98 acc!866))))

(declare-fun e!777518 () Bool)

(assert (=> d!147705 e!777518))

(declare-fun res!915686 () Bool)

(assert (=> d!147705 (=> (not res!915686) (not e!777518))))

(assert (=> d!147705 (= res!915686 (subseq!1097 newAcc!98 acc!866))))

(assert (=> d!147705 (= (noDuplicateSubseq!284 newAcc!98 acc!866) lt!602677)))

(declare-fun b!1372373 () Bool)

(assert (=> b!1372373 (= e!777518 (noDuplicate!2574 acc!866))))

(assert (= (and d!147705 res!915686) b!1372373))

(declare-fun m!1255369 () Bool)

(assert (=> d!147705 m!1255369))

(declare-fun m!1255371 () Bool)

(assert (=> d!147705 m!1255371))

(assert (=> d!147705 m!1255239))

(assert (=> b!1372373 m!1255225))

(assert (=> b!1372197 d!147705))

(declare-fun d!147715 () Bool)

(declare-fun res!915700 () Bool)

(declare-fun e!777532 () Bool)

(assert (=> d!147715 (=> res!915700 e!777532)))

(assert (=> d!147715 (= res!915700 ((_ is Nil!32063) acc!866))))

(assert (=> d!147715 (= (noDuplicate!2574 acc!866) e!777532)))

(declare-fun b!1372387 () Bool)

(declare-fun e!777533 () Bool)

(assert (=> b!1372387 (= e!777532 e!777533)))

(declare-fun res!915701 () Bool)

(assert (=> b!1372387 (=> (not res!915701) (not e!777533))))

(assert (=> b!1372387 (= res!915701 (not (contains!9659 (t!46752 acc!866) (h!33271 acc!866))))))

(declare-fun b!1372388 () Bool)

(assert (=> b!1372388 (= e!777533 (noDuplicate!2574 (t!46752 acc!866)))))

(assert (= (and d!147715 (not res!915700)) b!1372387))

(assert (= (and b!1372387 res!915701) b!1372388))

(declare-fun m!1255385 () Bool)

(assert (=> b!1372387 m!1255385))

(declare-fun m!1255387 () Bool)

(assert (=> b!1372388 m!1255387))

(assert (=> b!1372192 d!147715))

(declare-fun d!147725 () Bool)

(declare-fun lt!602681 () Bool)

(assert (=> d!147725 (= lt!602681 (select (content!740 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777537 () Bool)

(assert (=> d!147725 (= lt!602681 e!777537)))

(declare-fun res!915704 () Bool)

(assert (=> d!147725 (=> (not res!915704) (not e!777537))))

(assert (=> d!147725 (= res!915704 ((_ is Cons!32062) newAcc!98))))

(assert (=> d!147725 (= (contains!9659 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602681)))

(declare-fun b!1372391 () Bool)

(declare-fun e!777536 () Bool)

(assert (=> b!1372391 (= e!777537 e!777536)))

(declare-fun res!915705 () Bool)

(assert (=> b!1372391 (=> res!915705 e!777536)))

(assert (=> b!1372391 (= res!915705 (= (h!33271 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372392 () Bool)

(assert (=> b!1372392 (= e!777536 (contains!9659 (t!46752 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147725 res!915704) b!1372391))

(assert (= (and b!1372391 (not res!915705)) b!1372392))

(assert (=> d!147725 m!1255315))

(declare-fun m!1255393 () Bool)

(assert (=> d!147725 m!1255393))

(declare-fun m!1255395 () Bool)

(assert (=> b!1372392 m!1255395))

(assert (=> b!1372191 d!147725))

(declare-fun d!147729 () Bool)

(declare-fun lt!602683 () Bool)

(assert (=> d!147729 (= lt!602683 (select (content!740 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777541 () Bool)

(assert (=> d!147729 (= lt!602683 e!777541)))

(declare-fun res!915708 () Bool)

(assert (=> d!147729 (=> (not res!915708) (not e!777541))))

(assert (=> d!147729 (= res!915708 ((_ is Cons!32062) acc!866))))

(assert (=> d!147729 (= (contains!9659 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602683)))

(declare-fun b!1372395 () Bool)

(declare-fun e!777540 () Bool)

(assert (=> b!1372395 (= e!777541 e!777540)))

(declare-fun res!915709 () Bool)

(assert (=> b!1372395 (=> res!915709 e!777540)))

(assert (=> b!1372395 (= res!915709 (= (h!33271 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372396 () Bool)

(assert (=> b!1372396 (= e!777540 (contains!9659 (t!46752 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147729 res!915708) b!1372395))

(assert (= (and b!1372395 (not res!915709)) b!1372396))

(assert (=> d!147729 m!1255303))

(declare-fun m!1255401 () Bool)

(assert (=> d!147729 m!1255401))

(declare-fun m!1255403 () Bool)

(assert (=> b!1372396 m!1255403))

(assert (=> b!1372196 d!147729))

(check-sat (not b!1372292) (not d!147681) (not b!1372337) (not bm!65576) (not b!1372352) (not b!1372388) (not b!1372349) (not b!1372396) (not b!1372392) (not d!147725) (not b!1372276) (not d!147671) (not d!147697) (not d!147729) (not b!1372275) (not b!1372353) (not b!1372339) (not b!1372336) (not bm!65573) (not d!147705) (not b!1372387) (not b!1372355) (not b!1372373) (not b!1372286))
(check-sat)
