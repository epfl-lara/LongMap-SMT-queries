; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116434 () Bool)

(assert start!116434)

(declare-fun b!1373559 () Bool)

(declare-fun res!916071 () Bool)

(declare-fun e!778279 () Bool)

(assert (=> b!1373559 (=> (not res!916071) (not e!778279))))

(declare-datatypes ((List!32053 0))(
  ( (Nil!32050) (Cons!32049 (h!33267 (_ BitVec 64)) (t!46739 List!32053)) )
))
(declare-fun acc!866 () List!32053)

(declare-fun noDuplicate!2569 (List!32053) Bool)

(assert (=> b!1373559 (= res!916071 (noDuplicate!2569 acc!866))))

(declare-fun b!1373560 () Bool)

(declare-fun res!916072 () Bool)

(assert (=> b!1373560 (=> (not res!916072) (not e!778279))))

(declare-fun newAcc!98 () List!32053)

(declare-fun contains!9738 (List!32053 (_ BitVec 64)) Bool)

(assert (=> b!1373560 (= res!916072 (not (contains!9738 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373561 () Bool)

(declare-fun res!916079 () Bool)

(assert (=> b!1373561 (=> (not res!916079) (not e!778279))))

(assert (=> b!1373561 (= res!916079 (not (contains!9738 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373562 () Bool)

(declare-fun e!778277 () Bool)

(assert (=> b!1373562 (= e!778279 e!778277)))

(declare-fun res!916080 () Bool)

(assert (=> b!1373562 (=> (not res!916080) (not e!778277))))

(declare-datatypes ((array!93181 0))(
  ( (array!93182 (arr!44998 (Array (_ BitVec 32) (_ BitVec 64))) (size!45549 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93181)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93181 (_ BitVec 32) List!32053) Bool)

(assert (=> b!1373562 (= res!916080 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45266 0))(
  ( (Unit!45267) )
))
(declare-fun lt!603312 () Unit!45266)

(declare-fun noDuplicateSubseq!284 (List!32053 List!32053) Unit!45266)

(assert (=> b!1373562 (= lt!603312 (noDuplicateSubseq!284 newAcc!98 acc!866))))

(declare-fun b!1373563 () Bool)

(declare-fun res!916077 () Bool)

(assert (=> b!1373563 (=> (not res!916077) (not e!778277))))

(assert (=> b!1373563 (= res!916077 (contains!9738 acc!866 (select (arr!44998 a!3861) from!3239)))))

(declare-fun b!1373564 () Bool)

(declare-fun res!916076 () Bool)

(assert (=> b!1373564 (=> (not res!916076) (not e!778277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373564 (= res!916076 (validKeyInArray!0 (select (arr!44998 a!3861) from!3239)))))

(declare-fun res!916074 () Bool)

(assert (=> start!116434 (=> (not res!916074) (not e!778279))))

(assert (=> start!116434 (= res!916074 (and (bvslt (size!45549 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45549 a!3861))))))

(assert (=> start!116434 e!778279))

(declare-fun array_inv!34279 (array!93181) Bool)

(assert (=> start!116434 (array_inv!34279 a!3861)))

(assert (=> start!116434 true))

(declare-fun b!1373565 () Bool)

(declare-fun res!916075 () Bool)

(assert (=> b!1373565 (=> (not res!916075) (not e!778279))))

(declare-fun subseq!1097 (List!32053 List!32053) Bool)

(assert (=> b!1373565 (= res!916075 (subseq!1097 newAcc!98 acc!866))))

(declare-fun b!1373566 () Bool)

(declare-fun res!916070 () Bool)

(assert (=> b!1373566 (=> (not res!916070) (not e!778279))))

(assert (=> b!1373566 (= res!916070 (not (contains!9738 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373567 () Bool)

(declare-fun res!916073 () Bool)

(assert (=> b!1373567 (=> (not res!916073) (not e!778279))))

(assert (=> b!1373567 (= res!916073 (not (contains!9738 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373568 () Bool)

(declare-fun res!916078 () Bool)

(assert (=> b!1373568 (=> (not res!916078) (not e!778277))))

(assert (=> b!1373568 (= res!916078 (bvslt from!3239 (size!45549 a!3861)))))

(declare-fun b!1373569 () Bool)

(assert (=> b!1373569 (= e!778277 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(assert (= (and start!116434 res!916074) b!1373559))

(assert (= (and b!1373559 res!916071) b!1373567))

(assert (= (and b!1373567 res!916073) b!1373561))

(assert (= (and b!1373561 res!916079) b!1373560))

(assert (= (and b!1373560 res!916072) b!1373566))

(assert (= (and b!1373566 res!916070) b!1373565))

(assert (= (and b!1373565 res!916075) b!1373562))

(assert (= (and b!1373562 res!916080) b!1373568))

(assert (= (and b!1373568 res!916078) b!1373564))

(assert (= (and b!1373564 res!916076) b!1373563))

(assert (= (and b!1373563 res!916077) b!1373569))

(declare-fun m!1257343 () Bool)

(assert (=> b!1373559 m!1257343))

(declare-fun m!1257345 () Bool)

(assert (=> b!1373563 m!1257345))

(assert (=> b!1373563 m!1257345))

(declare-fun m!1257347 () Bool)

(assert (=> b!1373563 m!1257347))

(declare-fun m!1257349 () Bool)

(assert (=> b!1373567 m!1257349))

(assert (=> b!1373564 m!1257345))

(assert (=> b!1373564 m!1257345))

(declare-fun m!1257351 () Bool)

(assert (=> b!1373564 m!1257351))

(declare-fun m!1257353 () Bool)

(assert (=> b!1373569 m!1257353))

(declare-fun m!1257355 () Bool)

(assert (=> start!116434 m!1257355))

(declare-fun m!1257357 () Bool)

(assert (=> b!1373560 m!1257357))

(declare-fun m!1257359 () Bool)

(assert (=> b!1373565 m!1257359))

(declare-fun m!1257361 () Bool)

(assert (=> b!1373561 m!1257361))

(declare-fun m!1257363 () Bool)

(assert (=> b!1373566 m!1257363))

(declare-fun m!1257365 () Bool)

(assert (=> b!1373562 m!1257365))

(declare-fun m!1257367 () Bool)

(assert (=> b!1373562 m!1257367))

(check-sat (not b!1373561) (not b!1373569) (not b!1373564) (not start!116434) (not b!1373560) (not b!1373565) (not b!1373563) (not b!1373566) (not b!1373567) (not b!1373562) (not b!1373559))
(check-sat)
(get-model)

(declare-fun e!778320 () Bool)

(declare-fun b!1373662 () Bool)

(assert (=> b!1373662 (= e!778320 (contains!9738 acc!866 (select (arr!44998 a!3861) from!3239)))))

(declare-fun b!1373663 () Bool)

(declare-fun e!778321 () Bool)

(declare-fun call!65656 () Bool)

(assert (=> b!1373663 (= e!778321 call!65656)))

(declare-fun d!148243 () Bool)

(declare-fun res!916167 () Bool)

(declare-fun e!778322 () Bool)

(assert (=> d!148243 (=> res!916167 e!778322)))

(assert (=> d!148243 (= res!916167 (bvsge from!3239 (size!45549 a!3861)))))

(assert (=> d!148243 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778322)))

(declare-fun b!1373664 () Bool)

(declare-fun e!778319 () Bool)

(assert (=> b!1373664 (= e!778319 e!778321)))

(declare-fun c!128195 () Bool)

(assert (=> b!1373664 (= c!128195 (validKeyInArray!0 (select (arr!44998 a!3861) from!3239)))))

(declare-fun bm!65653 () Bool)

(assert (=> bm!65653 (= call!65656 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128195 (Cons!32049 (select (arr!44998 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373665 () Bool)

(assert (=> b!1373665 (= e!778321 call!65656)))

(declare-fun b!1373666 () Bool)

(assert (=> b!1373666 (= e!778322 e!778319)))

(declare-fun res!916165 () Bool)

(assert (=> b!1373666 (=> (not res!916165) (not e!778319))))

(assert (=> b!1373666 (= res!916165 (not e!778320))))

(declare-fun res!916166 () Bool)

(assert (=> b!1373666 (=> (not res!916166) (not e!778320))))

(assert (=> b!1373666 (= res!916166 (validKeyInArray!0 (select (arr!44998 a!3861) from!3239)))))

(assert (= (and d!148243 (not res!916167)) b!1373666))

(assert (= (and b!1373666 res!916166) b!1373662))

(assert (= (and b!1373666 res!916165) b!1373664))

(assert (= (and b!1373664 c!128195) b!1373663))

(assert (= (and b!1373664 (not c!128195)) b!1373665))

(assert (= (or b!1373663 b!1373665) bm!65653))

(assert (=> b!1373662 m!1257345))

(assert (=> b!1373662 m!1257345))

(assert (=> b!1373662 m!1257347))

(assert (=> b!1373664 m!1257345))

(assert (=> b!1373664 m!1257345))

(assert (=> b!1373664 m!1257351))

(assert (=> bm!65653 m!1257345))

(declare-fun m!1257427 () Bool)

(assert (=> bm!65653 m!1257427))

(assert (=> b!1373666 m!1257345))

(assert (=> b!1373666 m!1257345))

(assert (=> b!1373666 m!1257351))

(assert (=> b!1373562 d!148243))

(declare-fun d!148249 () Bool)

(assert (=> d!148249 (noDuplicate!2569 newAcc!98)))

(declare-fun lt!603327 () Unit!45266)

(declare-fun choose!2018 (List!32053 List!32053) Unit!45266)

(assert (=> d!148249 (= lt!603327 (choose!2018 newAcc!98 acc!866))))

(declare-fun e!778336 () Bool)

(assert (=> d!148249 e!778336))

(declare-fun res!916179 () Bool)

(assert (=> d!148249 (=> (not res!916179) (not e!778336))))

(assert (=> d!148249 (= res!916179 (subseq!1097 newAcc!98 acc!866))))

(assert (=> d!148249 (= (noDuplicateSubseq!284 newAcc!98 acc!866) lt!603327)))

(declare-fun b!1373680 () Bool)

(assert (=> b!1373680 (= e!778336 (noDuplicate!2569 acc!866))))

(assert (= (and d!148249 res!916179) b!1373680))

(declare-fun m!1257437 () Bool)

(assert (=> d!148249 m!1257437))

(declare-fun m!1257439 () Bool)

(assert (=> d!148249 m!1257439))

(assert (=> d!148249 m!1257359))

(assert (=> b!1373680 m!1257343))

(assert (=> b!1373562 d!148249))

(declare-fun d!148255 () Bool)

(declare-fun lt!603335 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!742 (List!32053) (InoxSet (_ BitVec 64)))

(assert (=> d!148255 (= lt!603335 (select (content!742 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778354 () Bool)

(assert (=> d!148255 (= lt!603335 e!778354)))

(declare-fun res!916198 () Bool)

(assert (=> d!148255 (=> (not res!916198) (not e!778354))))

(get-info :version)

(assert (=> d!148255 (= res!916198 ((_ is Cons!32049) acc!866))))

(assert (=> d!148255 (= (contains!9738 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603335)))

(declare-fun b!1373698 () Bool)

(declare-fun e!778355 () Bool)

(assert (=> b!1373698 (= e!778354 e!778355)))

(declare-fun res!916197 () Bool)

(assert (=> b!1373698 (=> res!916197 e!778355)))

(assert (=> b!1373698 (= res!916197 (= (h!33267 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373699 () Bool)

(assert (=> b!1373699 (= e!778355 (contains!9738 (t!46739 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148255 res!916198) b!1373698))

(assert (= (and b!1373698 (not res!916197)) b!1373699))

(declare-fun m!1257459 () Bool)

(assert (=> d!148255 m!1257459))

(declare-fun m!1257461 () Bool)

(assert (=> d!148255 m!1257461))

(declare-fun m!1257463 () Bool)

(assert (=> b!1373699 m!1257463))

(assert (=> b!1373567 d!148255))

(declare-fun d!148267 () Bool)

(declare-fun lt!603336 () Bool)

(assert (=> d!148267 (= lt!603336 (select (content!742 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778356 () Bool)

(assert (=> d!148267 (= lt!603336 e!778356)))

(declare-fun res!916200 () Bool)

(assert (=> d!148267 (=> (not res!916200) (not e!778356))))

(assert (=> d!148267 (= res!916200 ((_ is Cons!32049) acc!866))))

(assert (=> d!148267 (= (contains!9738 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603336)))

(declare-fun b!1373700 () Bool)

(declare-fun e!778357 () Bool)

(assert (=> b!1373700 (= e!778356 e!778357)))

(declare-fun res!916199 () Bool)

(assert (=> b!1373700 (=> res!916199 e!778357)))

(assert (=> b!1373700 (= res!916199 (= (h!33267 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373701 () Bool)

(assert (=> b!1373701 (= e!778357 (contains!9738 (t!46739 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148267 res!916200) b!1373700))

(assert (= (and b!1373700 (not res!916199)) b!1373701))

(assert (=> d!148267 m!1257459))

(declare-fun m!1257465 () Bool)

(assert (=> d!148267 m!1257465))

(declare-fun m!1257467 () Bool)

(assert (=> b!1373701 m!1257467))

(assert (=> b!1373561 d!148267))

(declare-fun d!148273 () Bool)

(declare-fun lt!603337 () Bool)

(assert (=> d!148273 (= lt!603337 (select (content!742 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778362 () Bool)

(assert (=> d!148273 (= lt!603337 e!778362)))

(declare-fun res!916205 () Bool)

(assert (=> d!148273 (=> (not res!916205) (not e!778362))))

(assert (=> d!148273 (= res!916205 ((_ is Cons!32049) newAcc!98))))

(assert (=> d!148273 (= (contains!9738 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603337)))

(declare-fun b!1373707 () Bool)

(declare-fun e!778363 () Bool)

(assert (=> b!1373707 (= e!778362 e!778363)))

(declare-fun res!916204 () Bool)

(assert (=> b!1373707 (=> res!916204 e!778363)))

(assert (=> b!1373707 (= res!916204 (= (h!33267 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373708 () Bool)

(assert (=> b!1373708 (= e!778363 (contains!9738 (t!46739 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148273 res!916205) b!1373707))

(assert (= (and b!1373707 (not res!916204)) b!1373708))

(declare-fun m!1257469 () Bool)

(assert (=> d!148273 m!1257469))

(declare-fun m!1257471 () Bool)

(assert (=> d!148273 m!1257471))

(declare-fun m!1257473 () Bool)

(assert (=> b!1373708 m!1257473))

(assert (=> b!1373566 d!148273))

(declare-fun d!148275 () Bool)

(assert (=> d!148275 (= (array_inv!34279 a!3861) (bvsge (size!45549 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116434 d!148275))

(declare-fun d!148279 () Bool)

(declare-fun lt!603339 () Bool)

(assert (=> d!148279 (= lt!603339 (select (content!742 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778366 () Bool)

(assert (=> d!148279 (= lt!603339 e!778366)))

(declare-fun res!916209 () Bool)

(assert (=> d!148279 (=> (not res!916209) (not e!778366))))

(assert (=> d!148279 (= res!916209 ((_ is Cons!32049) newAcc!98))))

(assert (=> d!148279 (= (contains!9738 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603339)))

(declare-fun b!1373711 () Bool)

(declare-fun e!778367 () Bool)

(assert (=> b!1373711 (= e!778366 e!778367)))

(declare-fun res!916208 () Bool)

(assert (=> b!1373711 (=> res!916208 e!778367)))

(assert (=> b!1373711 (= res!916208 (= (h!33267 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373712 () Bool)

(assert (=> b!1373712 (= e!778367 (contains!9738 (t!46739 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148279 res!916209) b!1373711))

(assert (= (and b!1373711 (not res!916208)) b!1373712))

(assert (=> d!148279 m!1257469))

(declare-fun m!1257485 () Bool)

(assert (=> d!148279 m!1257485))

(declare-fun m!1257487 () Bool)

(assert (=> b!1373712 m!1257487))

(assert (=> b!1373560 d!148279))

(declare-fun b!1373749 () Bool)

(declare-fun e!778403 () Bool)

(assert (=> b!1373749 (= e!778403 (subseq!1097 (t!46739 newAcc!98) (t!46739 acc!866)))))

(declare-fun b!1373748 () Bool)

(declare-fun e!778405 () Bool)

(declare-fun e!778402 () Bool)

(assert (=> b!1373748 (= e!778405 e!778402)))

(declare-fun res!916244 () Bool)

(assert (=> b!1373748 (=> res!916244 e!778402)))

(assert (=> b!1373748 (= res!916244 e!778403)))

(declare-fun res!916245 () Bool)

(assert (=> b!1373748 (=> (not res!916245) (not e!778403))))

(assert (=> b!1373748 (= res!916245 (= (h!33267 newAcc!98) (h!33267 acc!866)))))

(declare-fun b!1373747 () Bool)

(declare-fun e!778404 () Bool)

(assert (=> b!1373747 (= e!778404 e!778405)))

(declare-fun res!916246 () Bool)

(assert (=> b!1373747 (=> (not res!916246) (not e!778405))))

(assert (=> b!1373747 (= res!916246 ((_ is Cons!32049) acc!866))))

(declare-fun b!1373750 () Bool)

(assert (=> b!1373750 (= e!778402 (subseq!1097 newAcc!98 (t!46739 acc!866)))))

(declare-fun d!148283 () Bool)

(declare-fun res!916247 () Bool)

(assert (=> d!148283 (=> res!916247 e!778404)))

(assert (=> d!148283 (= res!916247 ((_ is Nil!32050) newAcc!98))))

(assert (=> d!148283 (= (subseq!1097 newAcc!98 acc!866) e!778404)))

(assert (= (and d!148283 (not res!916247)) b!1373747))

(assert (= (and b!1373747 res!916246) b!1373748))

(assert (= (and b!1373748 res!916245) b!1373749))

(assert (= (and b!1373748 (not res!916244)) b!1373750))

(declare-fun m!1257513 () Bool)

(assert (=> b!1373749 m!1257513))

(declare-fun m!1257515 () Bool)

(assert (=> b!1373750 m!1257515))

(assert (=> b!1373565 d!148283))

(declare-fun d!148299 () Bool)

(declare-fun res!916266 () Bool)

(declare-fun e!778424 () Bool)

(assert (=> d!148299 (=> res!916266 e!778424)))

(assert (=> d!148299 (= res!916266 ((_ is Nil!32050) acc!866))))

(assert (=> d!148299 (= (noDuplicate!2569 acc!866) e!778424)))

(declare-fun b!1373771 () Bool)

(declare-fun e!778425 () Bool)

(assert (=> b!1373771 (= e!778424 e!778425)))

(declare-fun res!916267 () Bool)

(assert (=> b!1373771 (=> (not res!916267) (not e!778425))))

(assert (=> b!1373771 (= res!916267 (not (contains!9738 (t!46739 acc!866) (h!33267 acc!866))))))

(declare-fun b!1373772 () Bool)

(assert (=> b!1373772 (= e!778425 (noDuplicate!2569 (t!46739 acc!866)))))

(assert (= (and d!148299 (not res!916266)) b!1373771))

(assert (= (and b!1373771 res!916267) b!1373772))

(declare-fun m!1257517 () Bool)

(assert (=> b!1373771 m!1257517))

(declare-fun m!1257519 () Bool)

(assert (=> b!1373772 m!1257519))

(assert (=> b!1373559 d!148299))

(declare-fun d!148301 () Bool)

(assert (=> d!148301 (= (validKeyInArray!0 (select (arr!44998 a!3861) from!3239)) (and (not (= (select (arr!44998 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44998 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1373564 d!148301))

(declare-fun b!1373775 () Bool)

(declare-fun e!778429 () Bool)

(assert (=> b!1373775 (= e!778429 (contains!9738 newAcc!98 (select (arr!44998 a!3861) from!3239)))))

(declare-fun b!1373776 () Bool)

(declare-fun e!778430 () Bool)

(declare-fun call!65663 () Bool)

(assert (=> b!1373776 (= e!778430 call!65663)))

(declare-fun d!148303 () Bool)

(declare-fun res!916270 () Bool)

(declare-fun e!778431 () Bool)

(assert (=> d!148303 (=> res!916270 e!778431)))

(assert (=> d!148303 (= res!916270 (bvsge from!3239 (size!45549 a!3861)))))

(assert (=> d!148303 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778431)))

(declare-fun b!1373777 () Bool)

(declare-fun e!778428 () Bool)

(assert (=> b!1373777 (= e!778428 e!778430)))

(declare-fun c!128201 () Bool)

(assert (=> b!1373777 (= c!128201 (validKeyInArray!0 (select (arr!44998 a!3861) from!3239)))))

(declare-fun bm!65660 () Bool)

(assert (=> bm!65660 (= call!65663 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128201 (Cons!32049 (select (arr!44998 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1373778 () Bool)

(assert (=> b!1373778 (= e!778430 call!65663)))

(declare-fun b!1373779 () Bool)

(assert (=> b!1373779 (= e!778431 e!778428)))

(declare-fun res!916268 () Bool)

(assert (=> b!1373779 (=> (not res!916268) (not e!778428))))

(assert (=> b!1373779 (= res!916268 (not e!778429))))

(declare-fun res!916269 () Bool)

(assert (=> b!1373779 (=> (not res!916269) (not e!778429))))

(assert (=> b!1373779 (= res!916269 (validKeyInArray!0 (select (arr!44998 a!3861) from!3239)))))

(assert (= (and d!148303 (not res!916270)) b!1373779))

(assert (= (and b!1373779 res!916269) b!1373775))

(assert (= (and b!1373779 res!916268) b!1373777))

(assert (= (and b!1373777 c!128201) b!1373776))

(assert (= (and b!1373777 (not c!128201)) b!1373778))

(assert (= (or b!1373776 b!1373778) bm!65660))

(assert (=> b!1373775 m!1257345))

(assert (=> b!1373775 m!1257345))

(declare-fun m!1257525 () Bool)

(assert (=> b!1373775 m!1257525))

(assert (=> b!1373777 m!1257345))

(assert (=> b!1373777 m!1257345))

(assert (=> b!1373777 m!1257351))

(assert (=> bm!65660 m!1257345))

(declare-fun m!1257527 () Bool)

(assert (=> bm!65660 m!1257527))

(assert (=> b!1373779 m!1257345))

(assert (=> b!1373779 m!1257345))

(assert (=> b!1373779 m!1257351))

(assert (=> b!1373569 d!148303))

(declare-fun d!148305 () Bool)

(declare-fun lt!603344 () Bool)

(assert (=> d!148305 (= lt!603344 (select (content!742 acc!866) (select (arr!44998 a!3861) from!3239)))))

(declare-fun e!778436 () Bool)

(assert (=> d!148305 (= lt!603344 e!778436)))

(declare-fun res!916276 () Bool)

(assert (=> d!148305 (=> (not res!916276) (not e!778436))))

(assert (=> d!148305 (= res!916276 ((_ is Cons!32049) acc!866))))

(assert (=> d!148305 (= (contains!9738 acc!866 (select (arr!44998 a!3861) from!3239)) lt!603344)))

(declare-fun b!1373784 () Bool)

(declare-fun e!778437 () Bool)

(assert (=> b!1373784 (= e!778436 e!778437)))

(declare-fun res!916275 () Bool)

(assert (=> b!1373784 (=> res!916275 e!778437)))

(assert (=> b!1373784 (= res!916275 (= (h!33267 acc!866) (select (arr!44998 a!3861) from!3239)))))

(declare-fun b!1373785 () Bool)

(assert (=> b!1373785 (= e!778437 (contains!9738 (t!46739 acc!866) (select (arr!44998 a!3861) from!3239)))))

(assert (= (and d!148305 res!916276) b!1373784))

(assert (= (and b!1373784 (not res!916275)) b!1373785))

(assert (=> d!148305 m!1257459))

(assert (=> d!148305 m!1257345))

(declare-fun m!1257529 () Bool)

(assert (=> d!148305 m!1257529))

(assert (=> b!1373785 m!1257345))

(declare-fun m!1257531 () Bool)

(assert (=> b!1373785 m!1257531))

(assert (=> b!1373563 d!148305))

(check-sat (not b!1373785) (not d!148279) (not b!1373699) (not b!1373712) (not bm!65653) (not d!148305) (not bm!65660) (not b!1373708) (not b!1373749) (not b!1373772) (not d!148267) (not b!1373771) (not d!148255) (not d!148249) (not b!1373779) (not b!1373775) (not b!1373750) (not b!1373666) (not b!1373664) (not b!1373680) (not b!1373701) (not d!148273) (not b!1373777) (not b!1373662))
(check-sat)
