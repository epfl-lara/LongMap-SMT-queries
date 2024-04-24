; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116308 () Bool)

(assert start!116308)

(declare-fun b!1372571 () Bool)

(declare-fun e!777649 () Bool)

(declare-fun e!777651 () Bool)

(assert (=> b!1372571 (= e!777649 e!777651)))

(declare-fun res!915179 () Bool)

(assert (=> b!1372571 (=> (not res!915179) (not e!777651))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1372571 (= res!915179 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!93157 0))(
  ( (array!93158 (arr!44989 (Array (_ BitVec 32) (_ BitVec 64))) (size!45540 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93157)

(declare-datatypes ((List!32044 0))(
  ( (Nil!32041) (Cons!32040 (h!33258 (_ BitVec 64)) (t!46730 List!32044)) )
))
(declare-fun newAcc!98 () List!32044)

(declare-fun lt!603093 () List!32044)

(assert (=> b!1372571 (= lt!603093 (Cons!32040 (select (arr!44989 a!3861) from!3239) newAcc!98))))

(declare-fun lt!603091 () List!32044)

(declare-fun acc!866 () List!32044)

(assert (=> b!1372571 (= lt!603091 (Cons!32040 (select (arr!44989 a!3861) from!3239) acc!866))))

(declare-fun b!1372572 () Bool)

(declare-fun res!915195 () Bool)

(declare-fun e!777652 () Bool)

(assert (=> b!1372572 (=> (not res!915195) (not e!777652))))

(declare-fun subseq!1088 (List!32044 List!32044) Bool)

(assert (=> b!1372572 (= res!915195 (subseq!1088 newAcc!98 acc!866))))

(declare-fun b!1372574 () Bool)

(declare-fun res!915182 () Bool)

(assert (=> b!1372574 (=> (not res!915182) (not e!777651))))

(declare-fun contains!9729 (List!32044 (_ BitVec 64)) Bool)

(assert (=> b!1372574 (= res!915182 (not (contains!9729 lt!603091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372575 () Bool)

(declare-fun res!915192 () Bool)

(assert (=> b!1372575 (=> (not res!915192) (not e!777652))))

(assert (=> b!1372575 (= res!915192 (not (contains!9729 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372576 () Bool)

(declare-fun res!915185 () Bool)

(assert (=> b!1372576 (=> (not res!915185) (not e!777651))))

(assert (=> b!1372576 (= res!915185 (subseq!1088 lt!603093 lt!603091))))

(declare-fun b!1372577 () Bool)

(declare-fun res!915188 () Bool)

(assert (=> b!1372577 (=> (not res!915188) (not e!777649))))

(assert (=> b!1372577 (= res!915188 (bvslt from!3239 (size!45540 a!3861)))))

(declare-fun b!1372578 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93157 (_ BitVec 32) List!32044) Bool)

(assert (=> b!1372578 (= e!777651 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!603091)))))

(declare-datatypes ((Unit!45248 0))(
  ( (Unit!45249) )
))
(declare-fun lt!603092 () Unit!45248)

(declare-fun noDuplicateSubseq!275 (List!32044 List!32044) Unit!45248)

(assert (=> b!1372578 (= lt!603092 (noDuplicateSubseq!275 lt!603093 lt!603091))))

(declare-fun b!1372579 () Bool)

(declare-fun res!915187 () Bool)

(assert (=> b!1372579 (=> (not res!915187) (not e!777652))))

(assert (=> b!1372579 (= res!915187 (not (contains!9729 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372580 () Bool)

(declare-fun res!915194 () Bool)

(assert (=> b!1372580 (=> (not res!915194) (not e!777651))))

(assert (=> b!1372580 (= res!915194 (not (contains!9729 lt!603093 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372581 () Bool)

(declare-fun res!915178 () Bool)

(assert (=> b!1372581 (=> (not res!915178) (not e!777651))))

(declare-fun noDuplicate!2560 (List!32044) Bool)

(assert (=> b!1372581 (= res!915178 (noDuplicate!2560 lt!603091))))

(declare-fun b!1372582 () Bool)

(declare-fun res!915184 () Bool)

(assert (=> b!1372582 (=> (not res!915184) (not e!777651))))

(assert (=> b!1372582 (= res!915184 (not (contains!9729 lt!603091 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372583 () Bool)

(declare-fun res!915191 () Bool)

(assert (=> b!1372583 (=> (not res!915191) (not e!777649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372583 (= res!915191 (validKeyInArray!0 (select (arr!44989 a!3861) from!3239)))))

(declare-fun b!1372584 () Bool)

(declare-fun res!915183 () Bool)

(assert (=> b!1372584 (=> (not res!915183) (not e!777652))))

(assert (=> b!1372584 (= res!915183 (not (contains!9729 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372585 () Bool)

(assert (=> b!1372585 (= e!777652 e!777649)))

(declare-fun res!915189 () Bool)

(assert (=> b!1372585 (=> (not res!915189) (not e!777649))))

(assert (=> b!1372585 (= res!915189 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!603090 () Unit!45248)

(assert (=> b!1372585 (= lt!603090 (noDuplicateSubseq!275 newAcc!98 acc!866))))

(declare-fun b!1372573 () Bool)

(declare-fun res!915193 () Bool)

(assert (=> b!1372573 (=> (not res!915193) (not e!777651))))

(assert (=> b!1372573 (= res!915193 (not (contains!9729 lt!603093 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915190 () Bool)

(assert (=> start!116308 (=> (not res!915190) (not e!777652))))

(assert (=> start!116308 (= res!915190 (and (bvslt (size!45540 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45540 a!3861))))))

(assert (=> start!116308 e!777652))

(declare-fun array_inv!34270 (array!93157) Bool)

(assert (=> start!116308 (array_inv!34270 a!3861)))

(assert (=> start!116308 true))

(declare-fun b!1372586 () Bool)

(declare-fun res!915186 () Bool)

(assert (=> b!1372586 (=> (not res!915186) (not e!777649))))

(assert (=> b!1372586 (= res!915186 (not (contains!9729 acc!866 (select (arr!44989 a!3861) from!3239))))))

(declare-fun b!1372587 () Bool)

(declare-fun res!915181 () Bool)

(assert (=> b!1372587 (=> (not res!915181) (not e!777652))))

(assert (=> b!1372587 (= res!915181 (not (contains!9729 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372588 () Bool)

(declare-fun res!915180 () Bool)

(assert (=> b!1372588 (=> (not res!915180) (not e!777652))))

(assert (=> b!1372588 (= res!915180 (noDuplicate!2560 acc!866))))

(assert (= (and start!116308 res!915190) b!1372588))

(assert (= (and b!1372588 res!915180) b!1372579))

(assert (= (and b!1372579 res!915187) b!1372587))

(assert (= (and b!1372587 res!915181) b!1372584))

(assert (= (and b!1372584 res!915183) b!1372575))

(assert (= (and b!1372575 res!915192) b!1372572))

(assert (= (and b!1372572 res!915195) b!1372585))

(assert (= (and b!1372585 res!915189) b!1372577))

(assert (= (and b!1372577 res!915188) b!1372583))

(assert (= (and b!1372583 res!915191) b!1372586))

(assert (= (and b!1372586 res!915186) b!1372571))

(assert (= (and b!1372571 res!915179) b!1372581))

(assert (= (and b!1372581 res!915178) b!1372574))

(assert (= (and b!1372574 res!915182) b!1372582))

(assert (= (and b!1372582 res!915184) b!1372580))

(assert (= (and b!1372580 res!915194) b!1372573))

(assert (= (and b!1372573 res!915193) b!1372576))

(assert (= (and b!1372576 res!915185) b!1372578))

(declare-fun m!1256329 () Bool)

(assert (=> start!116308 m!1256329))

(declare-fun m!1256331 () Bool)

(assert (=> b!1372579 m!1256331))

(declare-fun m!1256333 () Bool)

(assert (=> b!1372582 m!1256333))

(declare-fun m!1256335 () Bool)

(assert (=> b!1372583 m!1256335))

(assert (=> b!1372583 m!1256335))

(declare-fun m!1256337 () Bool)

(assert (=> b!1372583 m!1256337))

(declare-fun m!1256339 () Bool)

(assert (=> b!1372587 m!1256339))

(declare-fun m!1256341 () Bool)

(assert (=> b!1372572 m!1256341))

(declare-fun m!1256343 () Bool)

(assert (=> b!1372585 m!1256343))

(declare-fun m!1256345 () Bool)

(assert (=> b!1372585 m!1256345))

(declare-fun m!1256347 () Bool)

(assert (=> b!1372584 m!1256347))

(declare-fun m!1256349 () Bool)

(assert (=> b!1372588 m!1256349))

(declare-fun m!1256351 () Bool)

(assert (=> b!1372574 m!1256351))

(declare-fun m!1256353 () Bool)

(assert (=> b!1372578 m!1256353))

(declare-fun m!1256355 () Bool)

(assert (=> b!1372578 m!1256355))

(declare-fun m!1256357 () Bool)

(assert (=> b!1372573 m!1256357))

(declare-fun m!1256359 () Bool)

(assert (=> b!1372576 m!1256359))

(declare-fun m!1256361 () Bool)

(assert (=> b!1372575 m!1256361))

(assert (=> b!1372586 m!1256335))

(assert (=> b!1372586 m!1256335))

(declare-fun m!1256363 () Bool)

(assert (=> b!1372586 m!1256363))

(assert (=> b!1372571 m!1256335))

(declare-fun m!1256365 () Bool)

(assert (=> b!1372581 m!1256365))

(declare-fun m!1256367 () Bool)

(assert (=> b!1372580 m!1256367))

(check-sat (not b!1372572) (not b!1372578) (not b!1372576) (not b!1372583) (not start!116308) (not b!1372587) (not b!1372582) (not b!1372588) (not b!1372581) (not b!1372575) (not b!1372580) (not b!1372584) (not b!1372586) (not b!1372579) (not b!1372585) (not b!1372573) (not b!1372574))
(check-sat)
(get-model)

(declare-fun d!147887 () Bool)

(declare-fun lt!603120 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!734 (List!32044) (InoxSet (_ BitVec 64)))

(assert (=> d!147887 (= lt!603120 (select (content!734 lt!603091) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777681 () Bool)

(assert (=> d!147887 (= lt!603120 e!777681)))

(declare-fun res!915308 () Bool)

(assert (=> d!147887 (=> (not res!915308) (not e!777681))))

(get-info :version)

(assert (=> d!147887 (= res!915308 ((_ is Cons!32040) lt!603091))))

(assert (=> d!147887 (= (contains!9729 lt!603091 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603120)))

(declare-fun b!1372701 () Bool)

(declare-fun e!777682 () Bool)

(assert (=> b!1372701 (= e!777681 e!777682)))

(declare-fun res!915309 () Bool)

(assert (=> b!1372701 (=> res!915309 e!777682)))

(assert (=> b!1372701 (= res!915309 (= (h!33258 lt!603091) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372702 () Bool)

(assert (=> b!1372702 (= e!777682 (contains!9729 (t!46730 lt!603091) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147887 res!915308) b!1372701))

(assert (= (and b!1372701 (not res!915309)) b!1372702))

(declare-fun m!1256449 () Bool)

(assert (=> d!147887 m!1256449))

(declare-fun m!1256451 () Bool)

(assert (=> d!147887 m!1256451))

(declare-fun m!1256453 () Bool)

(assert (=> b!1372702 m!1256453))

(assert (=> b!1372574 d!147887))

(declare-fun d!147889 () Bool)

(assert (=> d!147889 (= (array_inv!34270 a!3861) (bvsge (size!45540 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116308 d!147889))

(declare-fun d!147891 () Bool)

(declare-fun lt!603121 () Bool)

(assert (=> d!147891 (= lt!603121 (select (content!734 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777683 () Bool)

(assert (=> d!147891 (= lt!603121 e!777683)))

(declare-fun res!915310 () Bool)

(assert (=> d!147891 (=> (not res!915310) (not e!777683))))

(assert (=> d!147891 (= res!915310 ((_ is Cons!32040) newAcc!98))))

(assert (=> d!147891 (= (contains!9729 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603121)))

(declare-fun b!1372703 () Bool)

(declare-fun e!777684 () Bool)

(assert (=> b!1372703 (= e!777683 e!777684)))

(declare-fun res!915311 () Bool)

(assert (=> b!1372703 (=> res!915311 e!777684)))

(assert (=> b!1372703 (= res!915311 (= (h!33258 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372704 () Bool)

(assert (=> b!1372704 (= e!777684 (contains!9729 (t!46730 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147891 res!915310) b!1372703))

(assert (= (and b!1372703 (not res!915311)) b!1372704))

(declare-fun m!1256455 () Bool)

(assert (=> d!147891 m!1256455))

(declare-fun m!1256457 () Bool)

(assert (=> d!147891 m!1256457))

(declare-fun m!1256459 () Bool)

(assert (=> b!1372704 m!1256459))

(assert (=> b!1372584 d!147891))

(declare-fun d!147893 () Bool)

(declare-fun lt!603122 () Bool)

(assert (=> d!147893 (= lt!603122 (select (content!734 lt!603093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777685 () Bool)

(assert (=> d!147893 (= lt!603122 e!777685)))

(declare-fun res!915312 () Bool)

(assert (=> d!147893 (=> (not res!915312) (not e!777685))))

(assert (=> d!147893 (= res!915312 ((_ is Cons!32040) lt!603093))))

(assert (=> d!147893 (= (contains!9729 lt!603093 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603122)))

(declare-fun b!1372705 () Bool)

(declare-fun e!777686 () Bool)

(assert (=> b!1372705 (= e!777685 e!777686)))

(declare-fun res!915313 () Bool)

(assert (=> b!1372705 (=> res!915313 e!777686)))

(assert (=> b!1372705 (= res!915313 (= (h!33258 lt!603093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372706 () Bool)

(assert (=> b!1372706 (= e!777686 (contains!9729 (t!46730 lt!603093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147893 res!915312) b!1372705))

(assert (= (and b!1372705 (not res!915313)) b!1372706))

(declare-fun m!1256461 () Bool)

(assert (=> d!147893 m!1256461))

(declare-fun m!1256463 () Bool)

(assert (=> d!147893 m!1256463))

(declare-fun m!1256465 () Bool)

(assert (=> b!1372706 m!1256465))

(assert (=> b!1372573 d!147893))

(declare-fun lt!603123 () Bool)

(declare-fun d!147895 () Bool)

(assert (=> d!147895 (= lt!603123 (select (content!734 acc!866) (select (arr!44989 a!3861) from!3239)))))

(declare-fun e!777687 () Bool)

(assert (=> d!147895 (= lt!603123 e!777687)))

(declare-fun res!915314 () Bool)

(assert (=> d!147895 (=> (not res!915314) (not e!777687))))

(assert (=> d!147895 (= res!915314 ((_ is Cons!32040) acc!866))))

(assert (=> d!147895 (= (contains!9729 acc!866 (select (arr!44989 a!3861) from!3239)) lt!603123)))

(declare-fun b!1372707 () Bool)

(declare-fun e!777688 () Bool)

(assert (=> b!1372707 (= e!777687 e!777688)))

(declare-fun res!915315 () Bool)

(assert (=> b!1372707 (=> res!915315 e!777688)))

(assert (=> b!1372707 (= res!915315 (= (h!33258 acc!866) (select (arr!44989 a!3861) from!3239)))))

(declare-fun b!1372708 () Bool)

(assert (=> b!1372708 (= e!777688 (contains!9729 (t!46730 acc!866) (select (arr!44989 a!3861) from!3239)))))

(assert (= (and d!147895 res!915314) b!1372707))

(assert (= (and b!1372707 (not res!915315)) b!1372708))

(declare-fun m!1256467 () Bool)

(assert (=> d!147895 m!1256467))

(assert (=> d!147895 m!1256335))

(declare-fun m!1256469 () Bool)

(assert (=> d!147895 m!1256469))

(assert (=> b!1372708 m!1256335))

(declare-fun m!1256471 () Bool)

(assert (=> b!1372708 m!1256471))

(assert (=> b!1372586 d!147895))

(declare-fun d!147897 () Bool)

(declare-fun lt!603124 () Bool)

(assert (=> d!147897 (= lt!603124 (select (content!734 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777689 () Bool)

(assert (=> d!147897 (= lt!603124 e!777689)))

(declare-fun res!915316 () Bool)

(assert (=> d!147897 (=> (not res!915316) (not e!777689))))

(assert (=> d!147897 (= res!915316 ((_ is Cons!32040) newAcc!98))))

(assert (=> d!147897 (= (contains!9729 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603124)))

(declare-fun b!1372709 () Bool)

(declare-fun e!777690 () Bool)

(assert (=> b!1372709 (= e!777689 e!777690)))

(declare-fun res!915317 () Bool)

(assert (=> b!1372709 (=> res!915317 e!777690)))

(assert (=> b!1372709 (= res!915317 (= (h!33258 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372710 () Bool)

(assert (=> b!1372710 (= e!777690 (contains!9729 (t!46730 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147897 res!915316) b!1372709))

(assert (= (and b!1372709 (not res!915317)) b!1372710))

(assert (=> d!147897 m!1256455))

(declare-fun m!1256473 () Bool)

(assert (=> d!147897 m!1256473))

(declare-fun m!1256475 () Bool)

(assert (=> b!1372710 m!1256475))

(assert (=> b!1372575 d!147897))

(declare-fun b!1372737 () Bool)

(declare-fun e!777716 () Bool)

(declare-fun e!777713 () Bool)

(assert (=> b!1372737 (= e!777716 e!777713)))

(declare-fun c!128148 () Bool)

(assert (=> b!1372737 (= c!128148 (validKeyInArray!0 (select (arr!44989 a!3861) from!3239)))))

(declare-fun b!1372738 () Bool)

(declare-fun call!65620 () Bool)

(assert (=> b!1372738 (= e!777713 call!65620)))

(declare-fun b!1372739 () Bool)

(declare-fun e!777714 () Bool)

(assert (=> b!1372739 (= e!777714 e!777716)))

(declare-fun res!915336 () Bool)

(assert (=> b!1372739 (=> (not res!915336) (not e!777716))))

(declare-fun e!777715 () Bool)

(assert (=> b!1372739 (= res!915336 (not e!777715))))

(declare-fun res!915337 () Bool)

(assert (=> b!1372739 (=> (not res!915337) (not e!777715))))

(assert (=> b!1372739 (= res!915337 (validKeyInArray!0 (select (arr!44989 a!3861) from!3239)))))

(declare-fun d!147899 () Bool)

(declare-fun res!915338 () Bool)

(assert (=> d!147899 (=> res!915338 e!777714)))

(assert (=> d!147899 (= res!915338 (bvsge from!3239 (size!45540 a!3861)))))

(assert (=> d!147899 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777714)))

(declare-fun b!1372740 () Bool)

(assert (=> b!1372740 (= e!777713 call!65620)))

(declare-fun bm!65617 () Bool)

(assert (=> bm!65617 (= call!65620 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128148 (Cons!32040 (select (arr!44989 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1372741 () Bool)

(assert (=> b!1372741 (= e!777715 (contains!9729 acc!866 (select (arr!44989 a!3861) from!3239)))))

(assert (= (and d!147899 (not res!915338)) b!1372739))

(assert (= (and b!1372739 res!915337) b!1372741))

(assert (= (and b!1372739 res!915336) b!1372737))

(assert (= (and b!1372737 c!128148) b!1372740))

(assert (= (and b!1372737 (not c!128148)) b!1372738))

(assert (= (or b!1372740 b!1372738) bm!65617))

(assert (=> b!1372737 m!1256335))

(assert (=> b!1372737 m!1256335))

(assert (=> b!1372737 m!1256337))

(assert (=> b!1372739 m!1256335))

(assert (=> b!1372739 m!1256335))

(assert (=> b!1372739 m!1256337))

(assert (=> bm!65617 m!1256335))

(declare-fun m!1256487 () Bool)

(assert (=> bm!65617 m!1256487))

(assert (=> b!1372741 m!1256335))

(assert (=> b!1372741 m!1256335))

(assert (=> b!1372741 m!1256363))

(assert (=> b!1372585 d!147899))

(declare-fun d!147909 () Bool)

(assert (=> d!147909 (noDuplicate!2560 newAcc!98)))

(declare-fun lt!603131 () Unit!45248)

(declare-fun choose!2013 (List!32044 List!32044) Unit!45248)

(assert (=> d!147909 (= lt!603131 (choose!2013 newAcc!98 acc!866))))

(declare-fun e!777721 () Bool)

(assert (=> d!147909 e!777721))

(declare-fun res!915343 () Bool)

(assert (=> d!147909 (=> (not res!915343) (not e!777721))))

(assert (=> d!147909 (= res!915343 (subseq!1088 newAcc!98 acc!866))))

(assert (=> d!147909 (= (noDuplicateSubseq!275 newAcc!98 acc!866) lt!603131)))

(declare-fun b!1372746 () Bool)

(assert (=> b!1372746 (= e!777721 (noDuplicate!2560 acc!866))))

(assert (= (and d!147909 res!915343) b!1372746))

(declare-fun m!1256491 () Bool)

(assert (=> d!147909 m!1256491))

(declare-fun m!1256493 () Bool)

(assert (=> d!147909 m!1256493))

(assert (=> d!147909 m!1256341))

(assert (=> b!1372746 m!1256349))

(assert (=> b!1372585 d!147909))

(declare-fun d!147913 () Bool)

(declare-fun lt!603132 () Bool)

(assert (=> d!147913 (= lt!603132 (select (content!734 lt!603091) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777722 () Bool)

(assert (=> d!147913 (= lt!603132 e!777722)))

(declare-fun res!915344 () Bool)

(assert (=> d!147913 (=> (not res!915344) (not e!777722))))

(assert (=> d!147913 (= res!915344 ((_ is Cons!32040) lt!603091))))

(assert (=> d!147913 (= (contains!9729 lt!603091 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603132)))

(declare-fun b!1372747 () Bool)

(declare-fun e!777723 () Bool)

(assert (=> b!1372747 (= e!777722 e!777723)))

(declare-fun res!915345 () Bool)

(assert (=> b!1372747 (=> res!915345 e!777723)))

(assert (=> b!1372747 (= res!915345 (= (h!33258 lt!603091) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372748 () Bool)

(assert (=> b!1372748 (= e!777723 (contains!9729 (t!46730 lt!603091) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147913 res!915344) b!1372747))

(assert (= (and b!1372747 (not res!915345)) b!1372748))

(assert (=> d!147913 m!1256449))

(declare-fun m!1256495 () Bool)

(assert (=> d!147913 m!1256495))

(declare-fun m!1256497 () Bool)

(assert (=> b!1372748 m!1256497))

(assert (=> b!1372582 d!147913))

(declare-fun d!147915 () Bool)

(declare-fun res!915361 () Bool)

(declare-fun e!777740 () Bool)

(assert (=> d!147915 (=> res!915361 e!777740)))

(assert (=> d!147915 (= res!915361 ((_ is Nil!32041) lt!603091))))

(assert (=> d!147915 (= (noDuplicate!2560 lt!603091) e!777740)))

(declare-fun b!1372766 () Bool)

(declare-fun e!777741 () Bool)

(assert (=> b!1372766 (= e!777740 e!777741)))

(declare-fun res!915362 () Bool)

(assert (=> b!1372766 (=> (not res!915362) (not e!777741))))

(assert (=> b!1372766 (= res!915362 (not (contains!9729 (t!46730 lt!603091) (h!33258 lt!603091))))))

(declare-fun b!1372767 () Bool)

(assert (=> b!1372767 (= e!777741 (noDuplicate!2560 (t!46730 lt!603091)))))

(assert (= (and d!147915 (not res!915361)) b!1372766))

(assert (= (and b!1372766 res!915362) b!1372767))

(declare-fun m!1256507 () Bool)

(assert (=> b!1372766 m!1256507))

(declare-fun m!1256509 () Bool)

(assert (=> b!1372767 m!1256509))

(assert (=> b!1372581 d!147915))

(declare-fun d!147919 () Bool)

(assert (=> d!147919 (= (validKeyInArray!0 (select (arr!44989 a!3861) from!3239)) (and (not (= (select (arr!44989 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44989 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1372583 d!147919))

(declare-fun b!1372796 () Bool)

(declare-fun e!777770 () Bool)

(declare-fun e!777772 () Bool)

(assert (=> b!1372796 (= e!777770 e!777772)))

(declare-fun res!915392 () Bool)

(assert (=> b!1372796 (=> (not res!915392) (not e!777772))))

(assert (=> b!1372796 (= res!915392 ((_ is Cons!32040) acc!866))))

(declare-fun d!147921 () Bool)

(declare-fun res!915391 () Bool)

(assert (=> d!147921 (=> res!915391 e!777770)))

(assert (=> d!147921 (= res!915391 ((_ is Nil!32041) newAcc!98))))

(assert (=> d!147921 (= (subseq!1088 newAcc!98 acc!866) e!777770)))

(declare-fun b!1372798 () Bool)

(declare-fun e!777771 () Bool)

(assert (=> b!1372798 (= e!777771 (subseq!1088 (t!46730 newAcc!98) (t!46730 acc!866)))))

(declare-fun b!1372799 () Bool)

(declare-fun e!777769 () Bool)

(assert (=> b!1372799 (= e!777769 (subseq!1088 newAcc!98 (t!46730 acc!866)))))

(declare-fun b!1372797 () Bool)

(assert (=> b!1372797 (= e!777772 e!777769)))

(declare-fun res!915389 () Bool)

(assert (=> b!1372797 (=> res!915389 e!777769)))

(assert (=> b!1372797 (= res!915389 e!777771)))

(declare-fun res!915390 () Bool)

(assert (=> b!1372797 (=> (not res!915390) (not e!777771))))

(assert (=> b!1372797 (= res!915390 (= (h!33258 newAcc!98) (h!33258 acc!866)))))

(assert (= (and d!147921 (not res!915391)) b!1372796))

(assert (= (and b!1372796 res!915392) b!1372797))

(assert (= (and b!1372797 res!915390) b!1372798))

(assert (= (and b!1372797 (not res!915389)) b!1372799))

(declare-fun m!1256533 () Bool)

(assert (=> b!1372798 m!1256533))

(declare-fun m!1256535 () Bool)

(assert (=> b!1372799 m!1256535))

(assert (=> b!1372572 d!147921))

(declare-fun d!147935 () Bool)

(declare-fun lt!603139 () Bool)

(assert (=> d!147935 (= lt!603139 (select (content!734 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777775 () Bool)

(assert (=> d!147935 (= lt!603139 e!777775)))

(declare-fun res!915395 () Bool)

(assert (=> d!147935 (=> (not res!915395) (not e!777775))))

(assert (=> d!147935 (= res!915395 ((_ is Cons!32040) acc!866))))

(assert (=> d!147935 (= (contains!9729 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603139)))

(declare-fun b!1372802 () Bool)

(declare-fun e!777776 () Bool)

(assert (=> b!1372802 (= e!777775 e!777776)))

(declare-fun res!915396 () Bool)

(assert (=> b!1372802 (=> res!915396 e!777776)))

(assert (=> b!1372802 (= res!915396 (= (h!33258 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372803 () Bool)

(assert (=> b!1372803 (= e!777776 (contains!9729 (t!46730 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147935 res!915395) b!1372802))

(assert (= (and b!1372802 (not res!915396)) b!1372803))

(assert (=> d!147935 m!1256467))

(declare-fun m!1256545 () Bool)

(assert (=> d!147935 m!1256545))

(declare-fun m!1256547 () Bool)

(assert (=> b!1372803 m!1256547))

(assert (=> b!1372579 d!147935))

(declare-fun d!147941 () Bool)

(declare-fun lt!603141 () Bool)

(assert (=> d!147941 (= lt!603141 (select (content!734 lt!603093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777778 () Bool)

(assert (=> d!147941 (= lt!603141 e!777778)))

(declare-fun res!915398 () Bool)

(assert (=> d!147941 (=> (not res!915398) (not e!777778))))

(assert (=> d!147941 (= res!915398 ((_ is Cons!32040) lt!603093))))

(assert (=> d!147941 (= (contains!9729 lt!603093 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603141)))

(declare-fun b!1372805 () Bool)

(declare-fun e!777779 () Bool)

(assert (=> b!1372805 (= e!777778 e!777779)))

(declare-fun res!915399 () Bool)

(assert (=> b!1372805 (=> res!915399 e!777779)))

(assert (=> b!1372805 (= res!915399 (= (h!33258 lt!603093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372806 () Bool)

(assert (=> b!1372806 (= e!777779 (contains!9729 (t!46730 lt!603093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147941 res!915398) b!1372805))

(assert (= (and b!1372805 (not res!915399)) b!1372806))

(assert (=> d!147941 m!1256461))

(declare-fun m!1256553 () Bool)

(assert (=> d!147941 m!1256553))

(declare-fun m!1256555 () Bool)

(assert (=> b!1372806 m!1256555))

(assert (=> b!1372580 d!147941))

(declare-fun d!147945 () Bool)

(declare-fun lt!603142 () Bool)

(assert (=> d!147945 (= lt!603142 (select (content!734 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777780 () Bool)

(assert (=> d!147945 (= lt!603142 e!777780)))

(declare-fun res!915400 () Bool)

(assert (=> d!147945 (=> (not res!915400) (not e!777780))))

(assert (=> d!147945 (= res!915400 ((_ is Cons!32040) acc!866))))

(assert (=> d!147945 (= (contains!9729 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603142)))

(declare-fun b!1372807 () Bool)

(declare-fun e!777781 () Bool)

(assert (=> b!1372807 (= e!777780 e!777781)))

(declare-fun res!915401 () Bool)

(assert (=> b!1372807 (=> res!915401 e!777781)))

(assert (=> b!1372807 (= res!915401 (= (h!33258 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372808 () Bool)

(assert (=> b!1372808 (= e!777781 (contains!9729 (t!46730 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147945 res!915400) b!1372807))

(assert (= (and b!1372807 (not res!915401)) b!1372808))

(assert (=> d!147945 m!1256467))

(declare-fun m!1256557 () Bool)

(assert (=> d!147945 m!1256557))

(declare-fun m!1256559 () Bool)

(assert (=> b!1372808 m!1256559))

(assert (=> b!1372587 d!147945))

(declare-fun b!1372809 () Bool)

(declare-fun e!777783 () Bool)

(declare-fun e!777785 () Bool)

(assert (=> b!1372809 (= e!777783 e!777785)))

(declare-fun res!915405 () Bool)

(assert (=> b!1372809 (=> (not res!915405) (not e!777785))))

(assert (=> b!1372809 (= res!915405 ((_ is Cons!32040) lt!603091))))

(declare-fun d!147947 () Bool)

(declare-fun res!915404 () Bool)

(assert (=> d!147947 (=> res!915404 e!777783)))

(assert (=> d!147947 (= res!915404 ((_ is Nil!32041) lt!603093))))

(assert (=> d!147947 (= (subseq!1088 lt!603093 lt!603091) e!777783)))

(declare-fun b!1372811 () Bool)

(declare-fun e!777784 () Bool)

(assert (=> b!1372811 (= e!777784 (subseq!1088 (t!46730 lt!603093) (t!46730 lt!603091)))))

(declare-fun b!1372812 () Bool)

(declare-fun e!777782 () Bool)

(assert (=> b!1372812 (= e!777782 (subseq!1088 lt!603093 (t!46730 lt!603091)))))

(declare-fun b!1372810 () Bool)

(assert (=> b!1372810 (= e!777785 e!777782)))

(declare-fun res!915402 () Bool)

(assert (=> b!1372810 (=> res!915402 e!777782)))

(assert (=> b!1372810 (= res!915402 e!777784)))

(declare-fun res!915403 () Bool)

(assert (=> b!1372810 (=> (not res!915403) (not e!777784))))

(assert (=> b!1372810 (= res!915403 (= (h!33258 lt!603093) (h!33258 lt!603091)))))

(assert (= (and d!147947 (not res!915404)) b!1372809))

(assert (= (and b!1372809 res!915405) b!1372810))

(assert (= (and b!1372810 res!915403) b!1372811))

(assert (= (and b!1372810 (not res!915402)) b!1372812))

(declare-fun m!1256561 () Bool)

(assert (=> b!1372811 m!1256561))

(declare-fun m!1256563 () Bool)

(assert (=> b!1372812 m!1256563))

(assert (=> b!1372576 d!147947))

(declare-fun b!1372813 () Bool)

(declare-fun e!777789 () Bool)

(declare-fun e!777786 () Bool)

(assert (=> b!1372813 (= e!777789 e!777786)))

(declare-fun c!128151 () Bool)

(assert (=> b!1372813 (= c!128151 (validKeyInArray!0 (select (arr!44989 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1372814 () Bool)

(declare-fun call!65625 () Bool)

(assert (=> b!1372814 (= e!777786 call!65625)))

(declare-fun b!1372815 () Bool)

(declare-fun e!777787 () Bool)

(assert (=> b!1372815 (= e!777787 e!777789)))

(declare-fun res!915406 () Bool)

(assert (=> b!1372815 (=> (not res!915406) (not e!777789))))

(declare-fun e!777788 () Bool)

(assert (=> b!1372815 (= res!915406 (not e!777788))))

(declare-fun res!915407 () Bool)

(assert (=> b!1372815 (=> (not res!915407) (not e!777788))))

(assert (=> b!1372815 (= res!915407 (validKeyInArray!0 (select (arr!44989 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147949 () Bool)

(declare-fun res!915408 () Bool)

(assert (=> d!147949 (=> res!915408 e!777787)))

(assert (=> d!147949 (= res!915408 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45540 a!3861)))))

(assert (=> d!147949 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!603091) e!777787)))

(declare-fun b!1372816 () Bool)

(assert (=> b!1372816 (= e!777786 call!65625)))

(declare-fun bm!65622 () Bool)

(assert (=> bm!65622 (= call!65625 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128151 (Cons!32040 (select (arr!44989 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!603091) lt!603091)))))

(declare-fun b!1372817 () Bool)

(assert (=> b!1372817 (= e!777788 (contains!9729 lt!603091 (select (arr!44989 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!147949 (not res!915408)) b!1372815))

(assert (= (and b!1372815 res!915407) b!1372817))

(assert (= (and b!1372815 res!915406) b!1372813))

(assert (= (and b!1372813 c!128151) b!1372816))

(assert (= (and b!1372813 (not c!128151)) b!1372814))

(assert (= (or b!1372816 b!1372814) bm!65622))

(declare-fun m!1256565 () Bool)

(assert (=> b!1372813 m!1256565))

(assert (=> b!1372813 m!1256565))

(declare-fun m!1256567 () Bool)

(assert (=> b!1372813 m!1256567))

(assert (=> b!1372815 m!1256565))

(assert (=> b!1372815 m!1256565))

(assert (=> b!1372815 m!1256567))

(assert (=> bm!65622 m!1256565))

(declare-fun m!1256569 () Bool)

(assert (=> bm!65622 m!1256569))

(assert (=> b!1372817 m!1256565))

(assert (=> b!1372817 m!1256565))

(declare-fun m!1256571 () Bool)

(assert (=> b!1372817 m!1256571))

(assert (=> b!1372578 d!147949))

(declare-fun d!147953 () Bool)

(assert (=> d!147953 (noDuplicate!2560 lt!603093)))

(declare-fun lt!603143 () Unit!45248)

(assert (=> d!147953 (= lt!603143 (choose!2013 lt!603093 lt!603091))))

(declare-fun e!777794 () Bool)

(assert (=> d!147953 e!777794))

(declare-fun res!915413 () Bool)

(assert (=> d!147953 (=> (not res!915413) (not e!777794))))

(assert (=> d!147953 (= res!915413 (subseq!1088 lt!603093 lt!603091))))

(assert (=> d!147953 (= (noDuplicateSubseq!275 lt!603093 lt!603091) lt!603143)))

(declare-fun b!1372822 () Bool)

(assert (=> b!1372822 (= e!777794 (noDuplicate!2560 lt!603091))))

(assert (= (and d!147953 res!915413) b!1372822))

(declare-fun m!1256573 () Bool)

(assert (=> d!147953 m!1256573))

(declare-fun m!1256575 () Bool)

(assert (=> d!147953 m!1256575))

(assert (=> d!147953 m!1256359))

(assert (=> b!1372822 m!1256365))

(assert (=> b!1372578 d!147953))

(declare-fun d!147955 () Bool)

(declare-fun res!915414 () Bool)

(declare-fun e!777795 () Bool)

(assert (=> d!147955 (=> res!915414 e!777795)))

(assert (=> d!147955 (= res!915414 ((_ is Nil!32041) acc!866))))

(assert (=> d!147955 (= (noDuplicate!2560 acc!866) e!777795)))

(declare-fun b!1372823 () Bool)

(declare-fun e!777796 () Bool)

(assert (=> b!1372823 (= e!777795 e!777796)))

(declare-fun res!915415 () Bool)

(assert (=> b!1372823 (=> (not res!915415) (not e!777796))))

(assert (=> b!1372823 (= res!915415 (not (contains!9729 (t!46730 acc!866) (h!33258 acc!866))))))

(declare-fun b!1372824 () Bool)

(assert (=> b!1372824 (= e!777796 (noDuplicate!2560 (t!46730 acc!866)))))

(assert (= (and d!147955 (not res!915414)) b!1372823))

(assert (= (and b!1372823 res!915415) b!1372824))

(declare-fun m!1256577 () Bool)

(assert (=> b!1372823 m!1256577))

(declare-fun m!1256579 () Bool)

(assert (=> b!1372824 m!1256579))

(assert (=> b!1372588 d!147955))

(check-sat (not d!147887) (not d!147893) (not d!147913) (not b!1372806) (not b!1372739) (not b!1372813) (not b!1372767) (not b!1372811) (not b!1372799) (not d!147895) (not b!1372823) (not b!1372803) (not b!1372808) (not b!1372737) (not b!1372706) (not b!1372702) (not d!147941) (not bm!65622) (not d!147935) (not b!1372798) (not d!147891) (not b!1372748) (not b!1372704) (not b!1372812) (not b!1372822) (not bm!65617) (not b!1372746) (not d!147945) (not b!1372824) (not b!1372741) (not b!1372710) (not d!147897) (not b!1372817) (not d!147953) (not b!1372708) (not b!1372815) (not d!147909) (not b!1372766))
(check-sat)
