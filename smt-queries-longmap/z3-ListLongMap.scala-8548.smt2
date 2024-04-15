; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104304 () Bool)

(assert start!104304)

(declare-fun b!1245672 () Bool)

(declare-fun e!706403 () Bool)

(declare-fun e!706402 () Bool)

(assert (=> b!1245672 (= e!706403 e!706402)))

(declare-fun res!831147 () Bool)

(assert (=> b!1245672 (=> res!831147 e!706402)))

(declare-datatypes ((List!27546 0))(
  ( (Nil!27543) (Cons!27542 (h!28751 (_ BitVec 64)) (t!41006 List!27546)) )
))
(declare-fun contains!7422 (List!27546 (_ BitVec 64)) Bool)

(assert (=> b!1245672 (= res!831147 (contains!7422 Nil!27543 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245673 () Bool)

(declare-fun res!831144 () Bool)

(assert (=> b!1245673 (=> (not res!831144) (not e!706403))))

(declare-fun lt!562789 () List!27546)

(assert (=> b!1245673 (= res!831144 (not (contains!7422 lt!562789 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!831142 () Bool)

(declare-fun e!706401 () Bool)

(assert (=> start!104304 (=> (not res!831142) (not e!706401))))

(declare-datatypes ((array!80120 0))(
  ( (array!80121 (arr!38642 (Array (_ BitVec 32) (_ BitVec 64))) (size!39180 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80120)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104304 (= res!831142 (and (bvslt (size!39180 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39180 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39180 a!3892))))))

(assert (=> start!104304 e!706401))

(declare-fun array_inv!29625 (array!80120) Bool)

(assert (=> start!104304 (array_inv!29625 a!3892)))

(assert (=> start!104304 true))

(declare-fun b!1245674 () Bool)

(declare-fun res!831139 () Bool)

(assert (=> b!1245674 (=> (not res!831139) (not e!706403))))

(assert (=> b!1245674 (= res!831139 (not (contains!7422 lt!562789 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245675 () Bool)

(declare-fun res!831140 () Bool)

(assert (=> b!1245675 (=> (not res!831140) (not e!706403))))

(declare-fun noDuplicate!2047 (List!27546) Bool)

(assert (=> b!1245675 (= res!831140 (noDuplicate!2047 lt!562789))))

(declare-fun b!1245676 () Bool)

(declare-fun res!831143 () Bool)

(assert (=> b!1245676 (=> (not res!831143) (not e!706401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245676 (= res!831143 (validKeyInArray!0 (select (arr!38642 a!3892) from!3270)))))

(declare-fun b!1245677 () Bool)

(assert (=> b!1245677 (= e!706402 (contains!7422 Nil!27543 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245678 () Bool)

(declare-fun res!831145 () Bool)

(assert (=> b!1245678 (=> (not res!831145) (not e!706401))))

(assert (=> b!1245678 (= res!831145 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39180 a!3892)) (not (= newFrom!287 (size!39180 a!3892)))))))

(declare-fun b!1245679 () Bool)

(assert (=> b!1245679 (= e!706401 e!706403)))

(declare-fun res!831141 () Bool)

(assert (=> b!1245679 (=> (not res!831141) (not e!706403))))

(assert (=> b!1245679 (= res!831141 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245679 (= lt!562789 (Cons!27542 (select (arr!38642 a!3892) from!3270) Nil!27543))))

(declare-fun b!1245680 () Bool)

(declare-fun res!831146 () Bool)

(assert (=> b!1245680 (=> (not res!831146) (not e!706401))))

(declare-fun arrayNoDuplicates!0 (array!80120 (_ BitVec 32) List!27546) Bool)

(assert (=> b!1245680 (= res!831146 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27543))))

(assert (= (and start!104304 res!831142) b!1245680))

(assert (= (and b!1245680 res!831146) b!1245678))

(assert (= (and b!1245678 res!831145) b!1245676))

(assert (= (and b!1245676 res!831143) b!1245679))

(assert (= (and b!1245679 res!831141) b!1245675))

(assert (= (and b!1245675 res!831140) b!1245673))

(assert (= (and b!1245673 res!831144) b!1245674))

(assert (= (and b!1245674 res!831139) b!1245672))

(assert (= (and b!1245672 (not res!831147)) b!1245677))

(declare-fun m!1147231 () Bool)

(assert (=> b!1245675 m!1147231))

(declare-fun m!1147233 () Bool)

(assert (=> b!1245673 m!1147233))

(declare-fun m!1147235 () Bool)

(assert (=> b!1245676 m!1147235))

(assert (=> b!1245676 m!1147235))

(declare-fun m!1147237 () Bool)

(assert (=> b!1245676 m!1147237))

(declare-fun m!1147239 () Bool)

(assert (=> b!1245672 m!1147239))

(declare-fun m!1147241 () Bool)

(assert (=> start!104304 m!1147241))

(declare-fun m!1147243 () Bool)

(assert (=> b!1245674 m!1147243))

(declare-fun m!1147245 () Bool)

(assert (=> b!1245680 m!1147245))

(assert (=> b!1245679 m!1147235))

(declare-fun m!1147247 () Bool)

(assert (=> b!1245677 m!1147247))

(check-sat (not b!1245673) (not b!1245677) (not b!1245674) (not b!1245672) (not b!1245680) (not b!1245675) (not b!1245676) (not start!104304))
(check-sat)
(get-model)

(declare-fun d!137339 () Bool)

(declare-fun lt!562798 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!622 (List!27546) (InoxSet (_ BitVec 64)))

(assert (=> d!137339 (= lt!562798 (select (content!622 Nil!27543) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706432 () Bool)

(assert (=> d!137339 (= lt!562798 e!706432)))

(declare-fun res!831207 () Bool)

(assert (=> d!137339 (=> (not res!831207) (not e!706432))))

(get-info :version)

(assert (=> d!137339 (= res!831207 ((_ is Cons!27542) Nil!27543))))

(assert (=> d!137339 (= (contains!7422 Nil!27543 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562798)))

(declare-fun b!1245739 () Bool)

(declare-fun e!706433 () Bool)

(assert (=> b!1245739 (= e!706432 e!706433)))

(declare-fun res!831206 () Bool)

(assert (=> b!1245739 (=> res!831206 e!706433)))

(assert (=> b!1245739 (= res!831206 (= (h!28751 Nil!27543) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245740 () Bool)

(assert (=> b!1245740 (= e!706433 (contains!7422 (t!41006 Nil!27543) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137339 res!831207) b!1245739))

(assert (= (and b!1245739 (not res!831206)) b!1245740))

(declare-fun m!1147285 () Bool)

(assert (=> d!137339 m!1147285))

(declare-fun m!1147287 () Bool)

(assert (=> d!137339 m!1147287))

(declare-fun m!1147289 () Bool)

(assert (=> b!1245740 m!1147289))

(assert (=> b!1245672 d!137339))

(declare-fun d!137341 () Bool)

(declare-fun lt!562799 () Bool)

(assert (=> d!137341 (= lt!562799 (select (content!622 Nil!27543) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706434 () Bool)

(assert (=> d!137341 (= lt!562799 e!706434)))

(declare-fun res!831209 () Bool)

(assert (=> d!137341 (=> (not res!831209) (not e!706434))))

(assert (=> d!137341 (= res!831209 ((_ is Cons!27542) Nil!27543))))

(assert (=> d!137341 (= (contains!7422 Nil!27543 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562799)))

(declare-fun b!1245741 () Bool)

(declare-fun e!706435 () Bool)

(assert (=> b!1245741 (= e!706434 e!706435)))

(declare-fun res!831208 () Bool)

(assert (=> b!1245741 (=> res!831208 e!706435)))

(assert (=> b!1245741 (= res!831208 (= (h!28751 Nil!27543) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245742 () Bool)

(assert (=> b!1245742 (= e!706435 (contains!7422 (t!41006 Nil!27543) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137341 res!831209) b!1245741))

(assert (= (and b!1245741 (not res!831208)) b!1245742))

(assert (=> d!137341 m!1147285))

(declare-fun m!1147291 () Bool)

(assert (=> d!137341 m!1147291))

(declare-fun m!1147293 () Bool)

(assert (=> b!1245742 m!1147293))

(assert (=> b!1245677 d!137341))

(declare-fun d!137343 () Bool)

(assert (=> d!137343 (= (array_inv!29625 a!3892) (bvsge (size!39180 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104304 d!137343))

(declare-fun d!137345 () Bool)

(declare-fun res!831214 () Bool)

(declare-fun e!706440 () Bool)

(assert (=> d!137345 (=> res!831214 e!706440)))

(assert (=> d!137345 (= res!831214 ((_ is Nil!27543) lt!562789))))

(assert (=> d!137345 (= (noDuplicate!2047 lt!562789) e!706440)))

(declare-fun b!1245747 () Bool)

(declare-fun e!706441 () Bool)

(assert (=> b!1245747 (= e!706440 e!706441)))

(declare-fun res!831215 () Bool)

(assert (=> b!1245747 (=> (not res!831215) (not e!706441))))

(assert (=> b!1245747 (= res!831215 (not (contains!7422 (t!41006 lt!562789) (h!28751 lt!562789))))))

(declare-fun b!1245748 () Bool)

(assert (=> b!1245748 (= e!706441 (noDuplicate!2047 (t!41006 lt!562789)))))

(assert (= (and d!137345 (not res!831214)) b!1245747))

(assert (= (and b!1245747 res!831215) b!1245748))

(declare-fun m!1147295 () Bool)

(assert (=> b!1245747 m!1147295))

(declare-fun m!1147297 () Bool)

(assert (=> b!1245748 m!1147297))

(assert (=> b!1245675 d!137345))

(declare-fun d!137347 () Bool)

(assert (=> d!137347 (= (validKeyInArray!0 (select (arr!38642 a!3892) from!3270)) (and (not (= (select (arr!38642 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38642 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245676 d!137347))

(declare-fun d!137349 () Bool)

(declare-fun lt!562800 () Bool)

(assert (=> d!137349 (= lt!562800 (select (content!622 lt!562789) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706442 () Bool)

(assert (=> d!137349 (= lt!562800 e!706442)))

(declare-fun res!831217 () Bool)

(assert (=> d!137349 (=> (not res!831217) (not e!706442))))

(assert (=> d!137349 (= res!831217 ((_ is Cons!27542) lt!562789))))

(assert (=> d!137349 (= (contains!7422 lt!562789 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562800)))

(declare-fun b!1245749 () Bool)

(declare-fun e!706443 () Bool)

(assert (=> b!1245749 (= e!706442 e!706443)))

(declare-fun res!831216 () Bool)

(assert (=> b!1245749 (=> res!831216 e!706443)))

(assert (=> b!1245749 (= res!831216 (= (h!28751 lt!562789) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245750 () Bool)

(assert (=> b!1245750 (= e!706443 (contains!7422 (t!41006 lt!562789) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137349 res!831217) b!1245749))

(assert (= (and b!1245749 (not res!831216)) b!1245750))

(declare-fun m!1147299 () Bool)

(assert (=> d!137349 m!1147299))

(declare-fun m!1147301 () Bool)

(assert (=> d!137349 m!1147301))

(declare-fun m!1147303 () Bool)

(assert (=> b!1245750 m!1147303))

(assert (=> b!1245674 d!137349))

(declare-fun b!1245775 () Bool)

(declare-fun e!706468 () Bool)

(declare-fun e!706466 () Bool)

(assert (=> b!1245775 (= e!706468 e!706466)))

(declare-fun c!121956 () Bool)

(assert (=> b!1245775 (= c!121956 (validKeyInArray!0 (select (arr!38642 a!3892) from!3270)))))

(declare-fun bm!61478 () Bool)

(declare-fun call!61481 () Bool)

(assert (=> bm!61478 (= call!61481 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121956 (Cons!27542 (select (arr!38642 a!3892) from!3270) Nil!27543) Nil!27543)))))

(declare-fun b!1245776 () Bool)

(assert (=> b!1245776 (= e!706466 call!61481)))

(declare-fun b!1245777 () Bool)

(declare-fun e!706467 () Bool)

(assert (=> b!1245777 (= e!706467 (contains!7422 Nil!27543 (select (arr!38642 a!3892) from!3270)))))

(declare-fun b!1245779 () Bool)

(declare-fun e!706469 () Bool)

(assert (=> b!1245779 (= e!706469 e!706468)))

(declare-fun res!831239 () Bool)

(assert (=> b!1245779 (=> (not res!831239) (not e!706468))))

(assert (=> b!1245779 (= res!831239 (not e!706467))))

(declare-fun res!831238 () Bool)

(assert (=> b!1245779 (=> (not res!831238) (not e!706467))))

(assert (=> b!1245779 (= res!831238 (validKeyInArray!0 (select (arr!38642 a!3892) from!3270)))))

(declare-fun b!1245778 () Bool)

(assert (=> b!1245778 (= e!706466 call!61481)))

(declare-fun d!137353 () Bool)

(declare-fun res!831240 () Bool)

(assert (=> d!137353 (=> res!831240 e!706469)))

(assert (=> d!137353 (= res!831240 (bvsge from!3270 (size!39180 a!3892)))))

(assert (=> d!137353 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27543) e!706469)))

(assert (= (and d!137353 (not res!831240)) b!1245779))

(assert (= (and b!1245779 res!831238) b!1245777))

(assert (= (and b!1245779 res!831239) b!1245775))

(assert (= (and b!1245775 c!121956) b!1245776))

(assert (= (and b!1245775 (not c!121956)) b!1245778))

(assert (= (or b!1245776 b!1245778) bm!61478))

(assert (=> b!1245775 m!1147235))

(assert (=> b!1245775 m!1147235))

(assert (=> b!1245775 m!1147237))

(assert (=> bm!61478 m!1147235))

(declare-fun m!1147317 () Bool)

(assert (=> bm!61478 m!1147317))

(assert (=> b!1245777 m!1147235))

(assert (=> b!1245777 m!1147235))

(declare-fun m!1147323 () Bool)

(assert (=> b!1245777 m!1147323))

(assert (=> b!1245779 m!1147235))

(assert (=> b!1245779 m!1147235))

(assert (=> b!1245779 m!1147237))

(assert (=> b!1245680 d!137353))

(declare-fun d!137365 () Bool)

(declare-fun lt!562807 () Bool)

(assert (=> d!137365 (= lt!562807 (select (content!622 lt!562789) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706474 () Bool)

(assert (=> d!137365 (= lt!562807 e!706474)))

(declare-fun res!831246 () Bool)

(assert (=> d!137365 (=> (not res!831246) (not e!706474))))

(assert (=> d!137365 (= res!831246 ((_ is Cons!27542) lt!562789))))

(assert (=> d!137365 (= (contains!7422 lt!562789 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562807)))

(declare-fun b!1245784 () Bool)

(declare-fun e!706475 () Bool)

(assert (=> b!1245784 (= e!706474 e!706475)))

(declare-fun res!831245 () Bool)

(assert (=> b!1245784 (=> res!831245 e!706475)))

(assert (=> b!1245784 (= res!831245 (= (h!28751 lt!562789) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245785 () Bool)

(assert (=> b!1245785 (= e!706475 (contains!7422 (t!41006 lt!562789) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137365 res!831246) b!1245784))

(assert (= (and b!1245784 (not res!831245)) b!1245785))

(assert (=> d!137365 m!1147299))

(declare-fun m!1147325 () Bool)

(assert (=> d!137365 m!1147325))

(declare-fun m!1147327 () Bool)

(assert (=> b!1245785 m!1147327))

(assert (=> b!1245673 d!137365))

(check-sat (not b!1245785) (not d!137365) (not bm!61478) (not b!1245748) (not b!1245747) (not d!137341) (not d!137349) (not b!1245750) (not b!1245742) (not d!137339) (not b!1245777) (not b!1245775) (not b!1245779) (not b!1245740))
(check-sat)
