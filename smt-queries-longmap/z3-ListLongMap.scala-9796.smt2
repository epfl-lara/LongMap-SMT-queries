; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116524 () Bool)

(assert start!116524)

(declare-fun b!1374291 () Bool)

(declare-fun res!916785 () Bool)

(declare-fun e!778592 () Bool)

(assert (=> b!1374291 (=> (not res!916785) (not e!778592))))

(declare-datatypes ((List!32077 0))(
  ( (Nil!32074) (Cons!32073 (h!33291 (_ BitVec 64)) (t!46763 List!32077)) )
))
(declare-fun acc!866 () List!32077)

(declare-fun contains!9762 (List!32077 (_ BitVec 64)) Bool)

(assert (=> b!1374291 (= res!916785 (not (contains!9762 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!93232 0))(
  ( (array!93233 (arr!45022 (Array (_ BitVec 32) (_ BitVec 64))) (size!45573 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93232)

(declare-fun b!1374292 () Bool)

(declare-fun e!778593 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93232 (_ BitVec 32) List!32077) Bool)

(assert (=> b!1374292 (= e!778593 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866)))))

(declare-fun b!1374293 () Bool)

(declare-fun res!916782 () Bool)

(assert (=> b!1374293 (=> (not res!916782) (not e!778592))))

(assert (=> b!1374293 (= res!916782 (not (contains!9762 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374294 () Bool)

(declare-fun res!916787 () Bool)

(assert (=> b!1374294 (=> (not res!916787) (not e!778592))))

(declare-fun newAcc!98 () List!32077)

(declare-fun subseq!1121 (List!32077 List!32077) Bool)

(assert (=> b!1374294 (= res!916787 (subseq!1121 newAcc!98 acc!866))))

(declare-fun b!1374295 () Bool)

(declare-fun res!916788 () Bool)

(assert (=> b!1374295 (=> (not res!916788) (not e!778593))))

(assert (=> b!1374295 (= res!916788 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1374296 () Bool)

(assert (=> b!1374296 (= e!778592 e!778593)))

(declare-fun res!916780 () Bool)

(assert (=> b!1374296 (=> (not res!916780) (not e!778593))))

(assert (=> b!1374296 (= res!916780 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45314 0))(
  ( (Unit!45315) )
))
(declare-fun lt!603468 () Unit!45314)

(declare-fun noDuplicateSubseq!308 (List!32077 List!32077) Unit!45314)

(assert (=> b!1374296 (= lt!603468 (noDuplicateSubseq!308 newAcc!98 acc!866))))

(declare-fun b!1374297 () Bool)

(declare-fun res!916781 () Bool)

(assert (=> b!1374297 (=> (not res!916781) (not e!778592))))

(assert (=> b!1374297 (= res!916781 (not (contains!9762 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374298 () Bool)

(declare-fun res!916778 () Bool)

(assert (=> b!1374298 (=> (not res!916778) (not e!778592))))

(declare-fun noDuplicate!2593 (List!32077) Bool)

(assert (=> b!1374298 (= res!916778 (noDuplicate!2593 acc!866))))

(declare-fun b!1374299 () Bool)

(declare-fun res!916783 () Bool)

(assert (=> b!1374299 (=> (not res!916783) (not e!778593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374299 (= res!916783 (not (validKeyInArray!0 (select (arr!45022 a!3861) from!3239))))))

(declare-fun b!1374300 () Bool)

(declare-fun res!916784 () Bool)

(assert (=> b!1374300 (=> (not res!916784) (not e!778592))))

(assert (=> b!1374300 (= res!916784 (not (contains!9762 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374301 () Bool)

(declare-fun res!916779 () Bool)

(assert (=> b!1374301 (=> (not res!916779) (not e!778593))))

(assert (=> b!1374301 (= res!916779 (bvslt from!3239 (size!45573 a!3861)))))

(declare-fun res!916786 () Bool)

(assert (=> start!116524 (=> (not res!916786) (not e!778592))))

(assert (=> start!116524 (= res!916786 (and (bvslt (size!45573 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45573 a!3861))))))

(assert (=> start!116524 e!778592))

(declare-fun array_inv!34303 (array!93232) Bool)

(assert (=> start!116524 (array_inv!34303 a!3861)))

(assert (=> start!116524 true))

(assert (= (and start!116524 res!916786) b!1374298))

(assert (= (and b!1374298 res!916778) b!1374291))

(assert (= (and b!1374291 res!916785) b!1374293))

(assert (= (and b!1374293 res!916782) b!1374300))

(assert (= (and b!1374300 res!916784) b!1374297))

(assert (= (and b!1374297 res!916781) b!1374294))

(assert (= (and b!1374294 res!916787) b!1374296))

(assert (= (and b!1374296 res!916780) b!1374301))

(assert (= (and b!1374301 res!916779) b!1374299))

(assert (= (and b!1374299 res!916783) b!1374295))

(assert (= (and b!1374295 res!916788) b!1374292))

(declare-fun m!1257937 () Bool)

(assert (=> start!116524 m!1257937))

(declare-fun m!1257939 () Bool)

(assert (=> b!1374297 m!1257939))

(declare-fun m!1257941 () Bool)

(assert (=> b!1374300 m!1257941))

(declare-fun m!1257943 () Bool)

(assert (=> b!1374293 m!1257943))

(declare-fun m!1257945 () Bool)

(assert (=> b!1374294 m!1257945))

(declare-fun m!1257947 () Bool)

(assert (=> b!1374298 m!1257947))

(declare-fun m!1257949 () Bool)

(assert (=> b!1374299 m!1257949))

(assert (=> b!1374299 m!1257949))

(declare-fun m!1257951 () Bool)

(assert (=> b!1374299 m!1257951))

(declare-fun m!1257953 () Bool)

(assert (=> b!1374292 m!1257953))

(declare-fun m!1257955 () Bool)

(assert (=> b!1374296 m!1257955))

(declare-fun m!1257957 () Bool)

(assert (=> b!1374296 m!1257957))

(declare-fun m!1257959 () Bool)

(assert (=> b!1374291 m!1257959))

(check-sat (not b!1374298) (not start!116524) (not b!1374299) (not b!1374297) (not b!1374296) (not b!1374292) (not b!1374294) (not b!1374291) (not b!1374300) (not b!1374293))
(check-sat)
(get-model)

(declare-fun bm!65665 () Bool)

(declare-fun c!128206 () Bool)

(declare-fun call!65668 () Bool)

(assert (=> bm!65665 (= call!65668 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128206 (Cons!32073 (select (arr!45022 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1374379 () Bool)

(declare-fun e!778623 () Bool)

(assert (=> b!1374379 (= e!778623 call!65668)))

(declare-fun b!1374380 () Bool)

(declare-fun e!778622 () Bool)

(assert (=> b!1374380 (= e!778622 e!778623)))

(assert (=> b!1374380 (= c!128206 (validKeyInArray!0 (select (arr!45022 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun e!778621 () Bool)

(declare-fun b!1374381 () Bool)

(assert (=> b!1374381 (= e!778621 (contains!9762 acc!866 (select (arr!45022 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1374382 () Bool)

(declare-fun e!778624 () Bool)

(assert (=> b!1374382 (= e!778624 e!778622)))

(declare-fun res!916863 () Bool)

(assert (=> b!1374382 (=> (not res!916863) (not e!778622))))

(assert (=> b!1374382 (= res!916863 (not e!778621))))

(declare-fun res!916861 () Bool)

(assert (=> b!1374382 (=> (not res!916861) (not e!778621))))

(assert (=> b!1374382 (= res!916861 (validKeyInArray!0 (select (arr!45022 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1374378 () Bool)

(assert (=> b!1374378 (= e!778623 call!65668)))

(declare-fun d!148329 () Bool)

(declare-fun res!916862 () Bool)

(assert (=> d!148329 (=> res!916862 e!778624)))

(assert (=> d!148329 (= res!916862 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45573 a!3861)))))

(assert (=> d!148329 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!778624)))

(assert (= (and d!148329 (not res!916862)) b!1374382))

(assert (= (and b!1374382 res!916861) b!1374381))

(assert (= (and b!1374382 res!916863) b!1374380))

(assert (= (and b!1374380 c!128206) b!1374379))

(assert (= (and b!1374380 (not c!128206)) b!1374378))

(assert (= (or b!1374379 b!1374378) bm!65665))

(declare-fun m!1258009 () Bool)

(assert (=> bm!65665 m!1258009))

(declare-fun m!1258011 () Bool)

(assert (=> bm!65665 m!1258011))

(assert (=> b!1374380 m!1258009))

(assert (=> b!1374380 m!1258009))

(declare-fun m!1258013 () Bool)

(assert (=> b!1374380 m!1258013))

(assert (=> b!1374381 m!1258009))

(assert (=> b!1374381 m!1258009))

(declare-fun m!1258015 () Bool)

(assert (=> b!1374381 m!1258015))

(assert (=> b!1374382 m!1258009))

(assert (=> b!1374382 m!1258009))

(assert (=> b!1374382 m!1258013))

(assert (=> b!1374292 d!148329))

(declare-fun d!148333 () Bool)

(declare-fun lt!603482 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!744 (List!32077) (InoxSet (_ BitVec 64)))

(assert (=> d!148333 (= lt!603482 (select (content!744 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778646 () Bool)

(assert (=> d!148333 (= lt!603482 e!778646)))

(declare-fun res!916885 () Bool)

(assert (=> d!148333 (=> (not res!916885) (not e!778646))))

(get-info :version)

(assert (=> d!148333 (= res!916885 ((_ is Cons!32073) newAcc!98))))

(assert (=> d!148333 (= (contains!9762 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603482)))

(declare-fun b!1374403 () Bool)

(declare-fun e!778644 () Bool)

(assert (=> b!1374403 (= e!778646 e!778644)))

(declare-fun res!916883 () Bool)

(assert (=> b!1374403 (=> res!916883 e!778644)))

(assert (=> b!1374403 (= res!916883 (= (h!33291 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374404 () Bool)

(assert (=> b!1374404 (= e!778644 (contains!9762 (t!46763 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148333 res!916885) b!1374403))

(assert (= (and b!1374403 (not res!916883)) b!1374404))

(declare-fun m!1258034 () Bool)

(assert (=> d!148333 m!1258034))

(declare-fun m!1258038 () Bool)

(assert (=> d!148333 m!1258038))

(declare-fun m!1258041 () Bool)

(assert (=> b!1374404 m!1258041))

(assert (=> b!1374297 d!148333))

(declare-fun d!148347 () Bool)

(declare-fun lt!603483 () Bool)

(assert (=> d!148347 (= lt!603483 (select (content!744 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778648 () Bool)

(assert (=> d!148347 (= lt!603483 e!778648)))

(declare-fun res!916887 () Bool)

(assert (=> d!148347 (=> (not res!916887) (not e!778648))))

(assert (=> d!148347 (= res!916887 ((_ is Cons!32073) acc!866))))

(assert (=> d!148347 (= (contains!9762 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603483)))

(declare-fun b!1374405 () Bool)

(declare-fun e!778647 () Bool)

(assert (=> b!1374405 (= e!778648 e!778647)))

(declare-fun res!916886 () Bool)

(assert (=> b!1374405 (=> res!916886 e!778647)))

(assert (=> b!1374405 (= res!916886 (= (h!33291 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374406 () Bool)

(assert (=> b!1374406 (= e!778647 (contains!9762 (t!46763 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148347 res!916887) b!1374405))

(assert (= (and b!1374405 (not res!916886)) b!1374406))

(declare-fun m!1258043 () Bool)

(assert (=> d!148347 m!1258043))

(declare-fun m!1258045 () Bool)

(assert (=> d!148347 m!1258045))

(declare-fun m!1258047 () Bool)

(assert (=> b!1374406 m!1258047))

(assert (=> b!1374291 d!148347))

(declare-fun d!148349 () Bool)

(declare-fun lt!603484 () Bool)

(assert (=> d!148349 (= lt!603484 (select (content!744 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778654 () Bool)

(assert (=> d!148349 (= lt!603484 e!778654)))

(declare-fun res!916893 () Bool)

(assert (=> d!148349 (=> (not res!916893) (not e!778654))))

(assert (=> d!148349 (= res!916893 ((_ is Cons!32073) acc!866))))

(assert (=> d!148349 (= (contains!9762 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603484)))

(declare-fun b!1374411 () Bool)

(declare-fun e!778653 () Bool)

(assert (=> b!1374411 (= e!778654 e!778653)))

(declare-fun res!916892 () Bool)

(assert (=> b!1374411 (=> res!916892 e!778653)))

(assert (=> b!1374411 (= res!916892 (= (h!33291 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374412 () Bool)

(assert (=> b!1374412 (= e!778653 (contains!9762 (t!46763 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148349 res!916893) b!1374411))

(assert (= (and b!1374411 (not res!916892)) b!1374412))

(assert (=> d!148349 m!1258043))

(declare-fun m!1258049 () Bool)

(assert (=> d!148349 m!1258049))

(declare-fun m!1258051 () Bool)

(assert (=> b!1374412 m!1258051))

(assert (=> b!1374293 d!148349))

(declare-fun d!148351 () Bool)

(declare-fun res!916906 () Bool)

(declare-fun e!778667 () Bool)

(assert (=> d!148351 (=> res!916906 e!778667)))

(assert (=> d!148351 (= res!916906 ((_ is Nil!32074) acc!866))))

(assert (=> d!148351 (= (noDuplicate!2593 acc!866) e!778667)))

(declare-fun b!1374425 () Bool)

(declare-fun e!778668 () Bool)

(assert (=> b!1374425 (= e!778667 e!778668)))

(declare-fun res!916907 () Bool)

(assert (=> b!1374425 (=> (not res!916907) (not e!778668))))

(assert (=> b!1374425 (= res!916907 (not (contains!9762 (t!46763 acc!866) (h!33291 acc!866))))))

(declare-fun b!1374426 () Bool)

(assert (=> b!1374426 (= e!778668 (noDuplicate!2593 (t!46763 acc!866)))))

(assert (= (and d!148351 (not res!916906)) b!1374425))

(assert (= (and b!1374425 res!916907) b!1374426))

(declare-fun m!1258061 () Bool)

(assert (=> b!1374425 m!1258061))

(declare-fun m!1258063 () Bool)

(assert (=> b!1374426 m!1258063))

(assert (=> b!1374298 d!148351))

(declare-fun d!148359 () Bool)

(assert (=> d!148359 (= (array_inv!34303 a!3861) (bvsge (size!45573 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116524 d!148359))

(declare-fun d!148363 () Bool)

(declare-fun lt!603490 () Bool)

(assert (=> d!148363 (= lt!603490 (select (content!744 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778674 () Bool)

(assert (=> d!148363 (= lt!603490 e!778674)))

(declare-fun res!916913 () Bool)

(assert (=> d!148363 (=> (not res!916913) (not e!778674))))

(assert (=> d!148363 (= res!916913 ((_ is Cons!32073) newAcc!98))))

(assert (=> d!148363 (= (contains!9762 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603490)))

(declare-fun b!1374431 () Bool)

(declare-fun e!778673 () Bool)

(assert (=> b!1374431 (= e!778674 e!778673)))

(declare-fun res!916912 () Bool)

(assert (=> b!1374431 (=> res!916912 e!778673)))

(assert (=> b!1374431 (= res!916912 (= (h!33291 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1374432 () Bool)

(assert (=> b!1374432 (= e!778673 (contains!9762 (t!46763 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148363 res!916913) b!1374431))

(assert (= (and b!1374431 (not res!916912)) b!1374432))

(assert (=> d!148363 m!1258034))

(declare-fun m!1258077 () Bool)

(assert (=> d!148363 m!1258077))

(declare-fun m!1258079 () Bool)

(assert (=> b!1374432 m!1258079))

(assert (=> b!1374300 d!148363))

(declare-fun b!1374467 () Bool)

(declare-fun e!778703 () Bool)

(assert (=> b!1374467 (= e!778703 (subseq!1121 (t!46763 newAcc!98) (t!46763 acc!866)))))

(declare-fun b!1374466 () Bool)

(declare-fun e!778705 () Bool)

(declare-fun e!778701 () Bool)

(assert (=> b!1374466 (= e!778705 e!778701)))

(declare-fun res!916941 () Bool)

(assert (=> b!1374466 (=> res!916941 e!778701)))

(assert (=> b!1374466 (= res!916941 e!778703)))

(declare-fun res!916939 () Bool)

(assert (=> b!1374466 (=> (not res!916939) (not e!778703))))

(assert (=> b!1374466 (= res!916939 (= (h!33291 newAcc!98) (h!33291 acc!866)))))

(declare-fun d!148367 () Bool)

(declare-fun res!916938 () Bool)

(declare-fun e!778702 () Bool)

(assert (=> d!148367 (=> res!916938 e!778702)))

(assert (=> d!148367 (= res!916938 ((_ is Nil!32074) newAcc!98))))

(assert (=> d!148367 (= (subseq!1121 newAcc!98 acc!866) e!778702)))

(declare-fun b!1374464 () Bool)

(assert (=> b!1374464 (= e!778702 e!778705)))

(declare-fun res!916940 () Bool)

(assert (=> b!1374464 (=> (not res!916940) (not e!778705))))

(assert (=> b!1374464 (= res!916940 ((_ is Cons!32073) acc!866))))

(declare-fun b!1374468 () Bool)

(assert (=> b!1374468 (= e!778701 (subseq!1121 newAcc!98 (t!46763 acc!866)))))

(assert (= (and d!148367 (not res!916938)) b!1374464))

(assert (= (and b!1374464 res!916940) b!1374466))

(assert (= (and b!1374466 res!916939) b!1374467))

(assert (= (and b!1374466 (not res!916941)) b!1374468))

(declare-fun m!1258089 () Bool)

(assert (=> b!1374467 m!1258089))

(declare-fun m!1258091 () Bool)

(assert (=> b!1374468 m!1258091))

(assert (=> b!1374294 d!148367))

(declare-fun d!148373 () Bool)

(assert (=> d!148373 (= (validKeyInArray!0 (select (arr!45022 a!3861) from!3239)) (and (not (= (select (arr!45022 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45022 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374299 d!148373))

(declare-fun call!65674 () Bool)

(declare-fun c!128212 () Bool)

(declare-fun bm!65671 () Bool)

(assert (=> bm!65671 (= call!65674 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128212 (Cons!32073 (select (arr!45022 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1374475 () Bool)

(declare-fun e!778713 () Bool)

(assert (=> b!1374475 (= e!778713 call!65674)))

(declare-fun b!1374476 () Bool)

(declare-fun e!778712 () Bool)

(assert (=> b!1374476 (= e!778712 e!778713)))

(assert (=> b!1374476 (= c!128212 (validKeyInArray!0 (select (arr!45022 a!3861) from!3239)))))

(declare-fun b!1374477 () Bool)

(declare-fun e!778711 () Bool)

(assert (=> b!1374477 (= e!778711 (contains!9762 acc!866 (select (arr!45022 a!3861) from!3239)))))

(declare-fun b!1374478 () Bool)

(declare-fun e!778714 () Bool)

(assert (=> b!1374478 (= e!778714 e!778712)))

(declare-fun res!916947 () Bool)

(assert (=> b!1374478 (=> (not res!916947) (not e!778712))))

(assert (=> b!1374478 (= res!916947 (not e!778711))))

(declare-fun res!916945 () Bool)

(assert (=> b!1374478 (=> (not res!916945) (not e!778711))))

(assert (=> b!1374478 (= res!916945 (validKeyInArray!0 (select (arr!45022 a!3861) from!3239)))))

(declare-fun b!1374474 () Bool)

(assert (=> b!1374474 (= e!778713 call!65674)))

(declare-fun d!148375 () Bool)

(declare-fun res!916946 () Bool)

(assert (=> d!148375 (=> res!916946 e!778714)))

(assert (=> d!148375 (= res!916946 (bvsge from!3239 (size!45573 a!3861)))))

(assert (=> d!148375 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778714)))

(assert (= (and d!148375 (not res!916946)) b!1374478))

(assert (= (and b!1374478 res!916945) b!1374477))

(assert (= (and b!1374478 res!916947) b!1374476))

(assert (= (and b!1374476 c!128212) b!1374475))

(assert (= (and b!1374476 (not c!128212)) b!1374474))

(assert (= (or b!1374475 b!1374474) bm!65671))

(assert (=> bm!65671 m!1257949))

(declare-fun m!1258101 () Bool)

(assert (=> bm!65671 m!1258101))

(assert (=> b!1374476 m!1257949))

(assert (=> b!1374476 m!1257949))

(assert (=> b!1374476 m!1257951))

(assert (=> b!1374477 m!1257949))

(assert (=> b!1374477 m!1257949))

(declare-fun m!1258103 () Bool)

(assert (=> b!1374477 m!1258103))

(assert (=> b!1374478 m!1257949))

(assert (=> b!1374478 m!1257949))

(assert (=> b!1374478 m!1257951))

(assert (=> b!1374296 d!148375))

(declare-fun d!148379 () Bool)

(assert (=> d!148379 (noDuplicate!2593 newAcc!98)))

(declare-fun lt!603495 () Unit!45314)

(declare-fun choose!2020 (List!32077 List!32077) Unit!45314)

(assert (=> d!148379 (= lt!603495 (choose!2020 newAcc!98 acc!866))))

(declare-fun e!778729 () Bool)

(assert (=> d!148379 e!778729))

(declare-fun res!916961 () Bool)

(assert (=> d!148379 (=> (not res!916961) (not e!778729))))

(assert (=> d!148379 (= res!916961 (subseq!1121 newAcc!98 acc!866))))

(assert (=> d!148379 (= (noDuplicateSubseq!308 newAcc!98 acc!866) lt!603495)))

(declare-fun b!1374494 () Bool)

(assert (=> b!1374494 (= e!778729 (noDuplicate!2593 acc!866))))

(assert (= (and d!148379 res!916961) b!1374494))

(declare-fun m!1258109 () Bool)

(assert (=> d!148379 m!1258109))

(declare-fun m!1258111 () Bool)

(assert (=> d!148379 m!1258111))

(assert (=> d!148379 m!1257945))

(assert (=> b!1374494 m!1257947))

(assert (=> b!1374296 d!148379))

(check-sat (not d!148347) (not b!1374476) (not b!1374406) (not bm!65665) (not b!1374467) (not b!1374404) (not b!1374425) (not b!1374412) (not b!1374468) (not b!1374381) (not d!148379) (not b!1374494) (not b!1374380) (not b!1374426) (not d!148363) (not d!148349) (not b!1374478) (not b!1374477) (not b!1374382) (not bm!65671) (not d!148333) (not b!1374432))
(check-sat)
