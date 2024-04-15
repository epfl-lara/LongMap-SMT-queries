; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116074 () Bool)

(assert start!116074)

(declare-fun b!1371200 () Bool)

(declare-fun res!914634 () Bool)

(declare-fun e!776773 () Bool)

(assert (=> b!1371200 (=> (not res!914634) (not e!776773))))

(declare-datatypes ((List!32057 0))(
  ( (Nil!32054) (Cons!32053 (h!33262 (_ BitVec 64)) (t!46743 List!32057)) )
))
(declare-fun newAcc!98 () List!32057)

(declare-fun contains!9650 (List!32057 (_ BitVec 64)) Bool)

(assert (=> b!1371200 (= res!914634 (not (contains!9650 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371201 () Bool)

(declare-fun res!914643 () Bool)

(assert (=> b!1371201 (=> (not res!914643) (not e!776773))))

(declare-fun acc!866 () List!32057)

(assert (=> b!1371201 (= res!914643 (not (contains!9650 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371202 () Bool)

(declare-fun e!776775 () Bool)

(declare-fun e!776772 () Bool)

(assert (=> b!1371202 (= e!776775 e!776772)))

(declare-fun res!914636 () Bool)

(assert (=> b!1371202 (=> (not res!914636) (not e!776772))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1371202 (= res!914636 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92991 0))(
  ( (array!92992 (arr!44911 (Array (_ BitVec 32) (_ BitVec 64))) (size!45463 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92991)

(declare-fun lt!602430 () List!32057)

(assert (=> b!1371202 (= lt!602430 (Cons!32053 (select (arr!44911 a!3861) from!3239) newAcc!98))))

(declare-fun lt!602427 () List!32057)

(assert (=> b!1371202 (= lt!602427 (Cons!32053 (select (arr!44911 a!3861) from!3239) acc!866))))

(declare-fun b!1371203 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92991 (_ BitVec 32) List!32057) Bool)

(assert (=> b!1371203 (= e!776772 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602427)))))

(declare-datatypes ((Unit!45150 0))(
  ( (Unit!45151) )
))
(declare-fun lt!602429 () Unit!45150)

(declare-fun noDuplicateSubseq!275 (List!32057 List!32057) Unit!45150)

(assert (=> b!1371203 (= lt!602429 (noDuplicateSubseq!275 lt!602430 lt!602427))))

(declare-fun b!1371204 () Bool)

(declare-fun res!914637 () Bool)

(assert (=> b!1371204 (=> (not res!914637) (not e!776772))))

(assert (=> b!1371204 (= res!914637 (not (contains!9650 lt!602430 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!914639 () Bool)

(assert (=> start!116074 (=> (not res!914639) (not e!776773))))

(assert (=> start!116074 (= res!914639 (and (bvslt (size!45463 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45463 a!3861))))))

(assert (=> start!116074 e!776773))

(declare-fun array_inv!34144 (array!92991) Bool)

(assert (=> start!116074 (array_inv!34144 a!3861)))

(assert (=> start!116074 true))

(declare-fun b!1371205 () Bool)

(declare-fun res!914646 () Bool)

(assert (=> b!1371205 (=> (not res!914646) (not e!776772))))

(assert (=> b!1371205 (= res!914646 (not (contains!9650 lt!602427 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371206 () Bool)

(declare-fun res!914640 () Bool)

(assert (=> b!1371206 (=> (not res!914640) (not e!776772))))

(assert (=> b!1371206 (= res!914640 (not (contains!9650 lt!602430 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371207 () Bool)

(declare-fun res!914632 () Bool)

(assert (=> b!1371207 (=> (not res!914632) (not e!776773))))

(assert (=> b!1371207 (= res!914632 (not (contains!9650 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371208 () Bool)

(declare-fun res!914644 () Bool)

(assert (=> b!1371208 (=> (not res!914644) (not e!776773))))

(assert (=> b!1371208 (= res!914644 (not (contains!9650 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371209 () Bool)

(assert (=> b!1371209 (= e!776773 e!776775)))

(declare-fun res!914633 () Bool)

(assert (=> b!1371209 (=> (not res!914633) (not e!776775))))

(assert (=> b!1371209 (= res!914633 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602428 () Unit!45150)

(assert (=> b!1371209 (= lt!602428 (noDuplicateSubseq!275 newAcc!98 acc!866))))

(declare-fun b!1371210 () Bool)

(declare-fun res!914641 () Bool)

(assert (=> b!1371210 (=> (not res!914641) (not e!776775))))

(assert (=> b!1371210 (= res!914641 (not (contains!9650 acc!866 (select (arr!44911 a!3861) from!3239))))))

(declare-fun b!1371211 () Bool)

(declare-fun res!914647 () Bool)

(assert (=> b!1371211 (=> (not res!914647) (not e!776775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371211 (= res!914647 (validKeyInArray!0 (select (arr!44911 a!3861) from!3239)))))

(declare-fun b!1371212 () Bool)

(declare-fun res!914642 () Bool)

(assert (=> b!1371212 (=> (not res!914642) (not e!776772))))

(declare-fun noDuplicate!2565 (List!32057) Bool)

(assert (=> b!1371212 (= res!914642 (noDuplicate!2565 lt!602427))))

(declare-fun b!1371213 () Bool)

(declare-fun res!914648 () Bool)

(assert (=> b!1371213 (=> (not res!914648) (not e!776772))))

(declare-fun subseq!1088 (List!32057 List!32057) Bool)

(assert (=> b!1371213 (= res!914648 (subseq!1088 lt!602430 lt!602427))))

(declare-fun b!1371214 () Bool)

(declare-fun res!914645 () Bool)

(assert (=> b!1371214 (=> (not res!914645) (not e!776773))))

(assert (=> b!1371214 (= res!914645 (noDuplicate!2565 acc!866))))

(declare-fun b!1371215 () Bool)

(declare-fun res!914631 () Bool)

(assert (=> b!1371215 (=> (not res!914631) (not e!776772))))

(assert (=> b!1371215 (= res!914631 (not (contains!9650 lt!602427 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371216 () Bool)

(declare-fun res!914635 () Bool)

(assert (=> b!1371216 (=> (not res!914635) (not e!776775))))

(assert (=> b!1371216 (= res!914635 (bvslt from!3239 (size!45463 a!3861)))))

(declare-fun b!1371217 () Bool)

(declare-fun res!914638 () Bool)

(assert (=> b!1371217 (=> (not res!914638) (not e!776773))))

(assert (=> b!1371217 (= res!914638 (subseq!1088 newAcc!98 acc!866))))

(assert (= (and start!116074 res!914639) b!1371214))

(assert (= (and b!1371214 res!914645) b!1371207))

(assert (= (and b!1371207 res!914632) b!1371201))

(assert (= (and b!1371201 res!914643) b!1371200))

(assert (= (and b!1371200 res!914634) b!1371208))

(assert (= (and b!1371208 res!914644) b!1371217))

(assert (= (and b!1371217 res!914638) b!1371209))

(assert (= (and b!1371209 res!914633) b!1371216))

(assert (= (and b!1371216 res!914635) b!1371211))

(assert (= (and b!1371211 res!914647) b!1371210))

(assert (= (and b!1371210 res!914641) b!1371202))

(assert (= (and b!1371202 res!914636) b!1371212))

(assert (= (and b!1371212 res!914642) b!1371205))

(assert (= (and b!1371205 res!914646) b!1371215))

(assert (= (and b!1371215 res!914631) b!1371204))

(assert (= (and b!1371204 res!914637) b!1371206))

(assert (= (and b!1371206 res!914640) b!1371213))

(assert (= (and b!1371213 res!914648) b!1371203))

(declare-fun m!1254207 () Bool)

(assert (=> b!1371209 m!1254207))

(declare-fun m!1254209 () Bool)

(assert (=> b!1371209 m!1254209))

(declare-fun m!1254211 () Bool)

(assert (=> b!1371207 m!1254211))

(declare-fun m!1254213 () Bool)

(assert (=> b!1371201 m!1254213))

(declare-fun m!1254215 () Bool)

(assert (=> b!1371208 m!1254215))

(declare-fun m!1254217 () Bool)

(assert (=> b!1371214 m!1254217))

(declare-fun m!1254219 () Bool)

(assert (=> b!1371217 m!1254219))

(declare-fun m!1254221 () Bool)

(assert (=> b!1371202 m!1254221))

(assert (=> b!1371211 m!1254221))

(assert (=> b!1371211 m!1254221))

(declare-fun m!1254223 () Bool)

(assert (=> b!1371211 m!1254223))

(declare-fun m!1254225 () Bool)

(assert (=> b!1371206 m!1254225))

(declare-fun m!1254227 () Bool)

(assert (=> b!1371205 m!1254227))

(declare-fun m!1254229 () Bool)

(assert (=> b!1371215 m!1254229))

(declare-fun m!1254231 () Bool)

(assert (=> start!116074 m!1254231))

(assert (=> b!1371210 m!1254221))

(assert (=> b!1371210 m!1254221))

(declare-fun m!1254233 () Bool)

(assert (=> b!1371210 m!1254233))

(declare-fun m!1254235 () Bool)

(assert (=> b!1371213 m!1254235))

(declare-fun m!1254237 () Bool)

(assert (=> b!1371203 m!1254237))

(declare-fun m!1254239 () Bool)

(assert (=> b!1371203 m!1254239))

(declare-fun m!1254241 () Bool)

(assert (=> b!1371200 m!1254241))

(declare-fun m!1254243 () Bool)

(assert (=> b!1371204 m!1254243))

(declare-fun m!1254245 () Bool)

(assert (=> b!1371212 m!1254245))

(check-sat (not b!1371212) (not start!116074) (not b!1371211) (not b!1371207) (not b!1371200) (not b!1371208) (not b!1371209) (not b!1371203) (not b!1371214) (not b!1371206) (not b!1371213) (not b!1371215) (not b!1371205) (not b!1371201) (not b!1371204) (not b!1371210) (not b!1371217))
(check-sat)
(get-model)

(declare-fun d!147315 () Bool)

(declare-fun lt!602457 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!734 (List!32057) (InoxSet (_ BitVec 64)))

(assert (=> d!147315 (= lt!602457 (select (content!734 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776805 () Bool)

(assert (=> d!147315 (= lt!602457 e!776805)))

(declare-fun res!914761 () Bool)

(assert (=> d!147315 (=> (not res!914761) (not e!776805))))

(get-info :version)

(assert (=> d!147315 (= res!914761 ((_ is Cons!32053) newAcc!98))))

(assert (=> d!147315 (= (contains!9650 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602457)))

(declare-fun b!1371330 () Bool)

(declare-fun e!776804 () Bool)

(assert (=> b!1371330 (= e!776805 e!776804)))

(declare-fun res!914762 () Bool)

(assert (=> b!1371330 (=> res!914762 e!776804)))

(assert (=> b!1371330 (= res!914762 (= (h!33262 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371331 () Bool)

(assert (=> b!1371331 (= e!776804 (contains!9650 (t!46743 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147315 res!914761) b!1371330))

(assert (= (and b!1371330 (not res!914762)) b!1371331))

(declare-fun m!1254327 () Bool)

(assert (=> d!147315 m!1254327))

(declare-fun m!1254329 () Bool)

(assert (=> d!147315 m!1254329))

(declare-fun m!1254331 () Bool)

(assert (=> b!1371331 m!1254331))

(assert (=> b!1371208 d!147315))

(declare-fun b!1371352 () Bool)

(declare-fun e!776825 () Bool)

(declare-fun call!65536 () Bool)

(assert (=> b!1371352 (= e!776825 call!65536)))

(declare-fun c!127729 () Bool)

(declare-fun bm!65533 () Bool)

(assert (=> bm!65533 (= call!65536 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127729 (Cons!32053 (select (arr!44911 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1371353 () Bool)

(declare-fun e!776826 () Bool)

(declare-fun e!776824 () Bool)

(assert (=> b!1371353 (= e!776826 e!776824)))

(declare-fun res!914780 () Bool)

(assert (=> b!1371353 (=> (not res!914780) (not e!776824))))

(declare-fun e!776827 () Bool)

(assert (=> b!1371353 (= res!914780 (not e!776827))))

(declare-fun res!914781 () Bool)

(assert (=> b!1371353 (=> (not res!914781) (not e!776827))))

(assert (=> b!1371353 (= res!914781 (validKeyInArray!0 (select (arr!44911 a!3861) from!3239)))))

(declare-fun b!1371354 () Bool)

(assert (=> b!1371354 (= e!776827 (contains!9650 acc!866 (select (arr!44911 a!3861) from!3239)))))

(declare-fun b!1371355 () Bool)

(assert (=> b!1371355 (= e!776825 call!65536)))

(declare-fun d!147317 () Bool)

(declare-fun res!914779 () Bool)

(assert (=> d!147317 (=> res!914779 e!776826)))

(assert (=> d!147317 (= res!914779 (bvsge from!3239 (size!45463 a!3861)))))

(assert (=> d!147317 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776826)))

(declare-fun b!1371356 () Bool)

(assert (=> b!1371356 (= e!776824 e!776825)))

(assert (=> b!1371356 (= c!127729 (validKeyInArray!0 (select (arr!44911 a!3861) from!3239)))))

(assert (= (and d!147317 (not res!914779)) b!1371353))

(assert (= (and b!1371353 res!914781) b!1371354))

(assert (= (and b!1371353 res!914780) b!1371356))

(assert (= (and b!1371356 c!127729) b!1371352))

(assert (= (and b!1371356 (not c!127729)) b!1371355))

(assert (= (or b!1371352 b!1371355) bm!65533))

(assert (=> bm!65533 m!1254221))

(declare-fun m!1254341 () Bool)

(assert (=> bm!65533 m!1254341))

(assert (=> b!1371353 m!1254221))

(assert (=> b!1371353 m!1254221))

(assert (=> b!1371353 m!1254223))

(assert (=> b!1371354 m!1254221))

(assert (=> b!1371354 m!1254221))

(assert (=> b!1371354 m!1254233))

(assert (=> b!1371356 m!1254221))

(assert (=> b!1371356 m!1254221))

(assert (=> b!1371356 m!1254223))

(assert (=> b!1371209 d!147317))

(declare-fun d!147329 () Bool)

(assert (=> d!147329 (noDuplicate!2565 newAcc!98)))

(declare-fun lt!602464 () Unit!45150)

(declare-fun choose!2023 (List!32057 List!32057) Unit!45150)

(assert (=> d!147329 (= lt!602464 (choose!2023 newAcc!98 acc!866))))

(declare-fun e!776850 () Bool)

(assert (=> d!147329 e!776850))

(declare-fun res!914802 () Bool)

(assert (=> d!147329 (=> (not res!914802) (not e!776850))))

(assert (=> d!147329 (= res!914802 (subseq!1088 newAcc!98 acc!866))))

(assert (=> d!147329 (= (noDuplicateSubseq!275 newAcc!98 acc!866) lt!602464)))

(declare-fun b!1371381 () Bool)

(assert (=> b!1371381 (= e!776850 (noDuplicate!2565 acc!866))))

(assert (= (and d!147329 res!914802) b!1371381))

(declare-fun m!1254349 () Bool)

(assert (=> d!147329 m!1254349))

(declare-fun m!1254351 () Bool)

(assert (=> d!147329 m!1254351))

(assert (=> d!147329 m!1254219))

(assert (=> b!1371381 m!1254217))

(assert (=> b!1371209 d!147329))

(declare-fun d!147333 () Bool)

(declare-fun lt!602465 () Bool)

(assert (=> d!147333 (= lt!602465 (select (content!734 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776852 () Bool)

(assert (=> d!147333 (= lt!602465 e!776852)))

(declare-fun res!914803 () Bool)

(assert (=> d!147333 (=> (not res!914803) (not e!776852))))

(assert (=> d!147333 (= res!914803 ((_ is Cons!32053) newAcc!98))))

(assert (=> d!147333 (= (contains!9650 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602465)))

(declare-fun b!1371382 () Bool)

(declare-fun e!776851 () Bool)

(assert (=> b!1371382 (= e!776852 e!776851)))

(declare-fun res!914804 () Bool)

(assert (=> b!1371382 (=> res!914804 e!776851)))

(assert (=> b!1371382 (= res!914804 (= (h!33262 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371383 () Bool)

(assert (=> b!1371383 (= e!776851 (contains!9650 (t!46743 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147333 res!914803) b!1371382))

(assert (= (and b!1371382 (not res!914804)) b!1371383))

(assert (=> d!147333 m!1254327))

(declare-fun m!1254353 () Bool)

(assert (=> d!147333 m!1254353))

(declare-fun m!1254355 () Bool)

(assert (=> b!1371383 m!1254355))

(assert (=> b!1371200 d!147333))

(declare-fun d!147335 () Bool)

(assert (=> d!147335 (= (validKeyInArray!0 (select (arr!44911 a!3861) from!3239)) (and (not (= (select (arr!44911 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44911 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371211 d!147335))

(declare-fun lt!602466 () Bool)

(declare-fun d!147339 () Bool)

(assert (=> d!147339 (= lt!602466 (select (content!734 acc!866) (select (arr!44911 a!3861) from!3239)))))

(declare-fun e!776862 () Bool)

(assert (=> d!147339 (= lt!602466 e!776862)))

(declare-fun res!914812 () Bool)

(assert (=> d!147339 (=> (not res!914812) (not e!776862))))

(assert (=> d!147339 (= res!914812 ((_ is Cons!32053) acc!866))))

(assert (=> d!147339 (= (contains!9650 acc!866 (select (arr!44911 a!3861) from!3239)) lt!602466)))

(declare-fun b!1371393 () Bool)

(declare-fun e!776861 () Bool)

(assert (=> b!1371393 (= e!776862 e!776861)))

(declare-fun res!914813 () Bool)

(assert (=> b!1371393 (=> res!914813 e!776861)))

(assert (=> b!1371393 (= res!914813 (= (h!33262 acc!866) (select (arr!44911 a!3861) from!3239)))))

(declare-fun b!1371394 () Bool)

(assert (=> b!1371394 (= e!776861 (contains!9650 (t!46743 acc!866) (select (arr!44911 a!3861) from!3239)))))

(assert (= (and d!147339 res!914812) b!1371393))

(assert (= (and b!1371393 (not res!914813)) b!1371394))

(declare-fun m!1254363 () Bool)

(assert (=> d!147339 m!1254363))

(assert (=> d!147339 m!1254221))

(declare-fun m!1254365 () Bool)

(assert (=> d!147339 m!1254365))

(assert (=> b!1371394 m!1254221))

(declare-fun m!1254367 () Bool)

(assert (=> b!1371394 m!1254367))

(assert (=> b!1371210 d!147339))

(declare-fun d!147343 () Bool)

(declare-fun res!914830 () Bool)

(declare-fun e!776879 () Bool)

(assert (=> d!147343 (=> res!914830 e!776879)))

(assert (=> d!147343 (= res!914830 ((_ is Nil!32054) lt!602427))))

(assert (=> d!147343 (= (noDuplicate!2565 lt!602427) e!776879)))

(declare-fun b!1371411 () Bool)

(declare-fun e!776880 () Bool)

(assert (=> b!1371411 (= e!776879 e!776880)))

(declare-fun res!914831 () Bool)

(assert (=> b!1371411 (=> (not res!914831) (not e!776880))))

(assert (=> b!1371411 (= res!914831 (not (contains!9650 (t!46743 lt!602427) (h!33262 lt!602427))))))

(declare-fun b!1371412 () Bool)

(assert (=> b!1371412 (= e!776880 (noDuplicate!2565 (t!46743 lt!602427)))))

(assert (= (and d!147343 (not res!914830)) b!1371411))

(assert (= (and b!1371411 res!914831) b!1371412))

(declare-fun m!1254379 () Bool)

(assert (=> b!1371411 m!1254379))

(declare-fun m!1254381 () Bool)

(assert (=> b!1371412 m!1254381))

(assert (=> b!1371212 d!147343))

(declare-fun d!147351 () Bool)

(declare-fun lt!602470 () Bool)

(assert (=> d!147351 (= lt!602470 (select (content!734 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776882 () Bool)

(assert (=> d!147351 (= lt!602470 e!776882)))

(declare-fun res!914832 () Bool)

(assert (=> d!147351 (=> (not res!914832) (not e!776882))))

(assert (=> d!147351 (= res!914832 ((_ is Cons!32053) acc!866))))

(assert (=> d!147351 (= (contains!9650 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602470)))

(declare-fun b!1371413 () Bool)

(declare-fun e!776881 () Bool)

(assert (=> b!1371413 (= e!776882 e!776881)))

(declare-fun res!914833 () Bool)

(assert (=> b!1371413 (=> res!914833 e!776881)))

(assert (=> b!1371413 (= res!914833 (= (h!33262 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371414 () Bool)

(assert (=> b!1371414 (= e!776881 (contains!9650 (t!46743 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147351 res!914832) b!1371413))

(assert (= (and b!1371413 (not res!914833)) b!1371414))

(assert (=> d!147351 m!1254363))

(declare-fun m!1254385 () Bool)

(assert (=> d!147351 m!1254385))

(declare-fun m!1254389 () Bool)

(assert (=> b!1371414 m!1254389))

(assert (=> b!1371201 d!147351))

(declare-fun b!1371416 () Bool)

(declare-fun e!776885 () Bool)

(declare-fun call!65540 () Bool)

(assert (=> b!1371416 (= e!776885 call!65540)))

(declare-fun bm!65537 () Bool)

(declare-fun c!127733 () Bool)

(assert (=> bm!65537 (= call!65540 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127733 (Cons!32053 (select (arr!44911 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602427) lt!602427)))))

(declare-fun b!1371417 () Bool)

(declare-fun e!776886 () Bool)

(declare-fun e!776884 () Bool)

(assert (=> b!1371417 (= e!776886 e!776884)))

(declare-fun res!914836 () Bool)

(assert (=> b!1371417 (=> (not res!914836) (not e!776884))))

(declare-fun e!776887 () Bool)

(assert (=> b!1371417 (= res!914836 (not e!776887))))

(declare-fun res!914837 () Bool)

(assert (=> b!1371417 (=> (not res!914837) (not e!776887))))

(assert (=> b!1371417 (= res!914837 (validKeyInArray!0 (select (arr!44911 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371418 () Bool)

(assert (=> b!1371418 (= e!776887 (contains!9650 lt!602427 (select (arr!44911 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371419 () Bool)

(assert (=> b!1371419 (= e!776885 call!65540)))

(declare-fun d!147353 () Bool)

(declare-fun res!914835 () Bool)

(assert (=> d!147353 (=> res!914835 e!776886)))

(assert (=> d!147353 (= res!914835 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45463 a!3861)))))

(assert (=> d!147353 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602427) e!776886)))

(declare-fun b!1371420 () Bool)

(assert (=> b!1371420 (= e!776884 e!776885)))

(assert (=> b!1371420 (= c!127733 (validKeyInArray!0 (select (arr!44911 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!147353 (not res!914835)) b!1371417))

(assert (= (and b!1371417 res!914837) b!1371418))

(assert (= (and b!1371417 res!914836) b!1371420))

(assert (= (and b!1371420 c!127733) b!1371416))

(assert (= (and b!1371420 (not c!127733)) b!1371419))

(assert (= (or b!1371416 b!1371419) bm!65537))

(declare-fun m!1254395 () Bool)

(assert (=> bm!65537 m!1254395))

(declare-fun m!1254397 () Bool)

(assert (=> bm!65537 m!1254397))

(assert (=> b!1371417 m!1254395))

(assert (=> b!1371417 m!1254395))

(declare-fun m!1254401 () Bool)

(assert (=> b!1371417 m!1254401))

(assert (=> b!1371418 m!1254395))

(assert (=> b!1371418 m!1254395))

(declare-fun m!1254405 () Bool)

(assert (=> b!1371418 m!1254405))

(assert (=> b!1371420 m!1254395))

(assert (=> b!1371420 m!1254395))

(assert (=> b!1371420 m!1254401))

(assert (=> b!1371203 d!147353))

(declare-fun d!147361 () Bool)

(assert (=> d!147361 (noDuplicate!2565 lt!602430)))

(declare-fun lt!602473 () Unit!45150)

(assert (=> d!147361 (= lt!602473 (choose!2023 lt!602430 lt!602427))))

(declare-fun e!776892 () Bool)

(assert (=> d!147361 e!776892))

(declare-fun res!914842 () Bool)

(assert (=> d!147361 (=> (not res!914842) (not e!776892))))

(assert (=> d!147361 (= res!914842 (subseq!1088 lt!602430 lt!602427))))

(assert (=> d!147361 (= (noDuplicateSubseq!275 lt!602430 lt!602427) lt!602473)))

(declare-fun b!1371425 () Bool)

(assert (=> b!1371425 (= e!776892 (noDuplicate!2565 lt!602427))))

(assert (= (and d!147361 res!914842) b!1371425))

(declare-fun m!1254409 () Bool)

(assert (=> d!147361 m!1254409))

(declare-fun m!1254411 () Bool)

(assert (=> d!147361 m!1254411))

(assert (=> d!147361 m!1254235))

(assert (=> b!1371425 m!1254245))

(assert (=> b!1371203 d!147361))

(declare-fun d!147363 () Bool)

(assert (=> d!147363 (= (array_inv!34144 a!3861) (bvsge (size!45463 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116074 d!147363))

(declare-fun d!147365 () Bool)

(declare-fun res!914867 () Bool)

(declare-fun e!776919 () Bool)

(assert (=> d!147365 (=> res!914867 e!776919)))

(assert (=> d!147365 (= res!914867 ((_ is Nil!32054) lt!602430))))

(assert (=> d!147365 (= (subseq!1088 lt!602430 lt!602427) e!776919)))

(declare-fun b!1371452 () Bool)

(declare-fun e!776921 () Bool)

(assert (=> b!1371452 (= e!776919 e!776921)))

(declare-fun res!914870 () Bool)

(assert (=> b!1371452 (=> (not res!914870) (not e!776921))))

(assert (=> b!1371452 (= res!914870 ((_ is Cons!32053) lt!602427))))

(declare-fun b!1371453 () Bool)

(declare-fun e!776920 () Bool)

(assert (=> b!1371453 (= e!776921 e!776920)))

(declare-fun res!914869 () Bool)

(assert (=> b!1371453 (=> res!914869 e!776920)))

(declare-fun e!776922 () Bool)

(assert (=> b!1371453 (= res!914869 e!776922)))

(declare-fun res!914868 () Bool)

(assert (=> b!1371453 (=> (not res!914868) (not e!776922))))

(assert (=> b!1371453 (= res!914868 (= (h!33262 lt!602430) (h!33262 lt!602427)))))

(declare-fun b!1371457 () Bool)

(assert (=> b!1371457 (= e!776920 (subseq!1088 lt!602430 (t!46743 lt!602427)))))

(declare-fun b!1371455 () Bool)

(assert (=> b!1371455 (= e!776922 (subseq!1088 (t!46743 lt!602430) (t!46743 lt!602427)))))

(assert (= (and d!147365 (not res!914867)) b!1371452))

(assert (= (and b!1371452 res!914870) b!1371453))

(assert (= (and b!1371453 res!914868) b!1371455))

(assert (= (and b!1371453 (not res!914869)) b!1371457))

(declare-fun m!1254419 () Bool)

(assert (=> b!1371457 m!1254419))

(declare-fun m!1254421 () Bool)

(assert (=> b!1371455 m!1254421))

(assert (=> b!1371213 d!147365))

(declare-fun d!147369 () Bool)

(declare-fun lt!602477 () Bool)

(assert (=> d!147369 (= lt!602477 (select (content!734 lt!602430) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776928 () Bool)

(assert (=> d!147369 (= lt!602477 e!776928)))

(declare-fun res!914875 () Bool)

(assert (=> d!147369 (=> (not res!914875) (not e!776928))))

(assert (=> d!147369 (= res!914875 ((_ is Cons!32053) lt!602430))))

(assert (=> d!147369 (= (contains!9650 lt!602430 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602477)))

(declare-fun b!1371462 () Bool)

(declare-fun e!776927 () Bool)

(assert (=> b!1371462 (= e!776928 e!776927)))

(declare-fun res!914876 () Bool)

(assert (=> b!1371462 (=> res!914876 e!776927)))

(assert (=> b!1371462 (= res!914876 (= (h!33262 lt!602430) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371463 () Bool)

(assert (=> b!1371463 (= e!776927 (contains!9650 (t!46743 lt!602430) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147369 res!914875) b!1371462))

(assert (= (and b!1371462 (not res!914876)) b!1371463))

(declare-fun m!1254423 () Bool)

(assert (=> d!147369 m!1254423))

(declare-fun m!1254425 () Bool)

(assert (=> d!147369 m!1254425))

(declare-fun m!1254427 () Bool)

(assert (=> b!1371463 m!1254427))

(assert (=> b!1371204 d!147369))

(declare-fun d!147371 () Bool)

(declare-fun lt!602478 () Bool)

(assert (=> d!147371 (= lt!602478 (select (content!734 lt!602427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776930 () Bool)

(assert (=> d!147371 (= lt!602478 e!776930)))

(declare-fun res!914877 () Bool)

(assert (=> d!147371 (=> (not res!914877) (not e!776930))))

(assert (=> d!147371 (= res!914877 ((_ is Cons!32053) lt!602427))))

(assert (=> d!147371 (= (contains!9650 lt!602427 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602478)))

(declare-fun b!1371464 () Bool)

(declare-fun e!776929 () Bool)

(assert (=> b!1371464 (= e!776930 e!776929)))

(declare-fun res!914878 () Bool)

(assert (=> b!1371464 (=> res!914878 e!776929)))

(assert (=> b!1371464 (= res!914878 (= (h!33262 lt!602427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371465 () Bool)

(assert (=> b!1371465 (= e!776929 (contains!9650 (t!46743 lt!602427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147371 res!914877) b!1371464))

(assert (= (and b!1371464 (not res!914878)) b!1371465))

(declare-fun m!1254429 () Bool)

(assert (=> d!147371 m!1254429))

(declare-fun m!1254431 () Bool)

(assert (=> d!147371 m!1254431))

(declare-fun m!1254433 () Bool)

(assert (=> b!1371465 m!1254433))

(assert (=> b!1371215 d!147371))

(declare-fun d!147373 () Bool)

(declare-fun res!914882 () Bool)

(declare-fun e!776935 () Bool)

(assert (=> d!147373 (=> res!914882 e!776935)))

(assert (=> d!147373 (= res!914882 ((_ is Nil!32054) acc!866))))

(assert (=> d!147373 (= (noDuplicate!2565 acc!866) e!776935)))

(declare-fun b!1371471 () Bool)

(declare-fun e!776936 () Bool)

(assert (=> b!1371471 (= e!776935 e!776936)))

(declare-fun res!914883 () Bool)

(assert (=> b!1371471 (=> (not res!914883) (not e!776936))))

(assert (=> b!1371471 (= res!914883 (not (contains!9650 (t!46743 acc!866) (h!33262 acc!866))))))

(declare-fun b!1371472 () Bool)

(assert (=> b!1371472 (= e!776936 (noDuplicate!2565 (t!46743 acc!866)))))

(assert (= (and d!147373 (not res!914882)) b!1371471))

(assert (= (and b!1371471 res!914883) b!1371472))

(declare-fun m!1254435 () Bool)

(assert (=> b!1371471 m!1254435))

(declare-fun m!1254437 () Bool)

(assert (=> b!1371472 m!1254437))

(assert (=> b!1371214 d!147373))

(declare-fun d!147375 () Bool)

(declare-fun lt!602479 () Bool)

(assert (=> d!147375 (= lt!602479 (select (content!734 lt!602427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776938 () Bool)

(assert (=> d!147375 (= lt!602479 e!776938)))

(declare-fun res!914884 () Bool)

(assert (=> d!147375 (=> (not res!914884) (not e!776938))))

(assert (=> d!147375 (= res!914884 ((_ is Cons!32053) lt!602427))))

(assert (=> d!147375 (= (contains!9650 lt!602427 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602479)))

(declare-fun b!1371473 () Bool)

(declare-fun e!776937 () Bool)

(assert (=> b!1371473 (= e!776938 e!776937)))

(declare-fun res!914885 () Bool)

(assert (=> b!1371473 (=> res!914885 e!776937)))

(assert (=> b!1371473 (= res!914885 (= (h!33262 lt!602427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371474 () Bool)

(assert (=> b!1371474 (= e!776937 (contains!9650 (t!46743 lt!602427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147375 res!914884) b!1371473))

(assert (= (and b!1371473 (not res!914885)) b!1371474))

(assert (=> d!147375 m!1254429))

(declare-fun m!1254441 () Bool)

(assert (=> d!147375 m!1254441))

(declare-fun m!1254443 () Bool)

(assert (=> b!1371474 m!1254443))

(assert (=> b!1371205 d!147375))

(declare-fun d!147377 () Bool)

(declare-fun lt!602480 () Bool)

(assert (=> d!147377 (= lt!602480 (select (content!734 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776944 () Bool)

(assert (=> d!147377 (= lt!602480 e!776944)))

(declare-fun res!914890 () Bool)

(assert (=> d!147377 (=> (not res!914890) (not e!776944))))

(assert (=> d!147377 (= res!914890 ((_ is Cons!32053) acc!866))))

(assert (=> d!147377 (= (contains!9650 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602480)))

(declare-fun b!1371479 () Bool)

(declare-fun e!776943 () Bool)

(assert (=> b!1371479 (= e!776944 e!776943)))

(declare-fun res!914891 () Bool)

(assert (=> b!1371479 (=> res!914891 e!776943)))

(assert (=> b!1371479 (= res!914891 (= (h!33262 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371480 () Bool)

(assert (=> b!1371480 (= e!776943 (contains!9650 (t!46743 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147377 res!914890) b!1371479))

(assert (= (and b!1371479 (not res!914891)) b!1371480))

(assert (=> d!147377 m!1254363))

(declare-fun m!1254449 () Bool)

(assert (=> d!147377 m!1254449))

(declare-fun m!1254451 () Bool)

(assert (=> b!1371480 m!1254451))

(assert (=> b!1371207 d!147377))

(declare-fun d!147383 () Bool)

(declare-fun lt!602482 () Bool)

(assert (=> d!147383 (= lt!602482 (select (content!734 lt!602430) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776948 () Bool)

(assert (=> d!147383 (= lt!602482 e!776948)))

(declare-fun res!914894 () Bool)

(assert (=> d!147383 (=> (not res!914894) (not e!776948))))

(assert (=> d!147383 (= res!914894 ((_ is Cons!32053) lt!602430))))

(assert (=> d!147383 (= (contains!9650 lt!602430 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602482)))

(declare-fun b!1371483 () Bool)

(declare-fun e!776947 () Bool)

(assert (=> b!1371483 (= e!776948 e!776947)))

(declare-fun res!914895 () Bool)

(assert (=> b!1371483 (=> res!914895 e!776947)))

(assert (=> b!1371483 (= res!914895 (= (h!33262 lt!602430) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371484 () Bool)

(assert (=> b!1371484 (= e!776947 (contains!9650 (t!46743 lt!602430) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147383 res!914894) b!1371483))

(assert (= (and b!1371483 (not res!914895)) b!1371484))

(assert (=> d!147383 m!1254423))

(declare-fun m!1254459 () Bool)

(assert (=> d!147383 m!1254459))

(declare-fun m!1254461 () Bool)

(assert (=> b!1371484 m!1254461))

(assert (=> b!1371206 d!147383))

(declare-fun d!147387 () Bool)

(declare-fun res!914896 () Bool)

(declare-fun e!776949 () Bool)

(assert (=> d!147387 (=> res!914896 e!776949)))

(assert (=> d!147387 (= res!914896 ((_ is Nil!32054) newAcc!98))))

(assert (=> d!147387 (= (subseq!1088 newAcc!98 acc!866) e!776949)))

(declare-fun b!1371485 () Bool)

(declare-fun e!776951 () Bool)

(assert (=> b!1371485 (= e!776949 e!776951)))

(declare-fun res!914899 () Bool)

(assert (=> b!1371485 (=> (not res!914899) (not e!776951))))

(assert (=> b!1371485 (= res!914899 ((_ is Cons!32053) acc!866))))

(declare-fun b!1371486 () Bool)

(declare-fun e!776950 () Bool)

(assert (=> b!1371486 (= e!776951 e!776950)))

(declare-fun res!914898 () Bool)

(assert (=> b!1371486 (=> res!914898 e!776950)))

(declare-fun e!776952 () Bool)

(assert (=> b!1371486 (= res!914898 e!776952)))

(declare-fun res!914897 () Bool)

(assert (=> b!1371486 (=> (not res!914897) (not e!776952))))

(assert (=> b!1371486 (= res!914897 (= (h!33262 newAcc!98) (h!33262 acc!866)))))

(declare-fun b!1371488 () Bool)

(assert (=> b!1371488 (= e!776950 (subseq!1088 newAcc!98 (t!46743 acc!866)))))

(declare-fun b!1371487 () Bool)

(assert (=> b!1371487 (= e!776952 (subseq!1088 (t!46743 newAcc!98) (t!46743 acc!866)))))

(assert (= (and d!147387 (not res!914896)) b!1371485))

(assert (= (and b!1371485 res!914899) b!1371486))

(assert (= (and b!1371486 res!914897) b!1371487))

(assert (= (and b!1371486 (not res!914898)) b!1371488))

(declare-fun m!1254463 () Bool)

(assert (=> b!1371488 m!1254463))

(declare-fun m!1254465 () Bool)

(assert (=> b!1371487 m!1254465))

(assert (=> b!1371217 d!147387))

(check-sat (not bm!65537) (not b!1371455) (not d!147339) (not bm!65533) (not d!147329) (not b!1371474) (not b!1371356) (not d!147351) (not b!1371381) (not d!147371) (not b!1371487) (not b!1371484) (not d!147361) (not b!1371414) (not d!147315) (not d!147369) (not b!1371465) (not b!1371420) (not b!1371471) (not b!1371488) (not b!1371417) (not b!1371353) (not b!1371480) (not b!1371463) (not d!147375) (not b!1371412) (not b!1371457) (not b!1371331) (not b!1371411) (not b!1371425) (not b!1371354) (not b!1371394) (not b!1371472) (not b!1371418) (not b!1371383) (not d!147333) (not d!147383) (not d!147377))
(check-sat)
