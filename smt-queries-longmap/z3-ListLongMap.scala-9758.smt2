; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115852 () Bool)

(assert start!115852)

(declare-fun b!1368729 () Bool)

(declare-fun res!911476 () Bool)

(declare-fun e!775797 () Bool)

(assert (=> b!1368729 (=> (not res!911476) (not e!775797))))

(declare-datatypes ((array!92974 0))(
  ( (array!92975 (arr!44908 (Array (_ BitVec 32) (_ BitVec 64))) (size!45459 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92974)

(declare-datatypes ((List!31963 0))(
  ( (Nil!31960) (Cons!31959 (h!33177 (_ BitVec 64)) (t!46649 List!31963)) )
))
(declare-fun acc!866 () List!31963)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun contains!9648 (List!31963 (_ BitVec 64)) Bool)

(assert (=> b!1368729 (= res!911476 (contains!9648 acc!866 (select (arr!44908 a!3861) from!3239)))))

(declare-fun b!1368730 () Bool)

(declare-fun res!911481 () Bool)

(assert (=> b!1368730 (=> (not res!911481) (not e!775797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368730 (= res!911481 (validKeyInArray!0 (select (arr!44908 a!3861) from!3239)))))

(declare-fun b!1368731 () Bool)

(declare-fun res!911479 () Bool)

(declare-fun e!775796 () Bool)

(assert (=> b!1368731 (=> (not res!911479) (not e!775796))))

(assert (=> b!1368731 (= res!911479 (not (contains!9648 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368732 () Bool)

(declare-fun res!911483 () Bool)

(assert (=> b!1368732 (=> (not res!911483) (not e!775796))))

(declare-fun newAcc!98 () List!31963)

(assert (=> b!1368732 (= res!911483 (not (contains!9648 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368733 () Bool)

(declare-fun res!911477 () Bool)

(assert (=> b!1368733 (=> (not res!911477) (not e!775796))))

(assert (=> b!1368733 (= res!911477 (not (contains!9648 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911475 () Bool)

(assert (=> start!115852 (=> (not res!911475) (not e!775796))))

(assert (=> start!115852 (= res!911475 (and (bvslt (size!45459 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45459 a!3861))))))

(assert (=> start!115852 e!775796))

(declare-fun array_inv!34189 (array!92974) Bool)

(assert (=> start!115852 (array_inv!34189 a!3861)))

(assert (=> start!115852 true))

(declare-fun b!1368734 () Bool)

(declare-fun noDuplicate!2479 (List!31963) Bool)

(assert (=> b!1368734 (= e!775797 (not (noDuplicate!2479 newAcc!98)))))

(declare-fun b!1368735 () Bool)

(assert (=> b!1368735 (= e!775796 e!775797)))

(declare-fun res!911474 () Bool)

(assert (=> b!1368735 (=> (not res!911474) (not e!775797))))

(declare-fun arrayNoDuplicates!0 (array!92974 (_ BitVec 32) List!31963) Bool)

(assert (=> b!1368735 (= res!911474 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45086 0))(
  ( (Unit!45087) )
))
(declare-fun lt!602364 () Unit!45086)

(declare-fun noDuplicateSubseq!194 (List!31963 List!31963) Unit!45086)

(assert (=> b!1368735 (= lt!602364 (noDuplicateSubseq!194 newAcc!98 acc!866))))

(declare-fun b!1368736 () Bool)

(declare-fun res!911482 () Bool)

(assert (=> b!1368736 (=> (not res!911482) (not e!775797))))

(assert (=> b!1368736 (= res!911482 (bvslt from!3239 (size!45459 a!3861)))))

(declare-fun b!1368737 () Bool)

(declare-fun res!911480 () Bool)

(assert (=> b!1368737 (=> (not res!911480) (not e!775796))))

(assert (=> b!1368737 (= res!911480 (noDuplicate!2479 acc!866))))

(declare-fun b!1368738 () Bool)

(declare-fun res!911484 () Bool)

(assert (=> b!1368738 (=> (not res!911484) (not e!775796))))

(declare-fun subseq!1007 (List!31963 List!31963) Bool)

(assert (=> b!1368738 (= res!911484 (subseq!1007 newAcc!98 acc!866))))

(declare-fun b!1368739 () Bool)

(declare-fun res!911478 () Bool)

(assert (=> b!1368739 (=> (not res!911478) (not e!775796))))

(assert (=> b!1368739 (= res!911478 (not (contains!9648 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115852 res!911475) b!1368737))

(assert (= (and b!1368737 res!911480) b!1368739))

(assert (= (and b!1368739 res!911478) b!1368731))

(assert (= (and b!1368731 res!911479) b!1368732))

(assert (= (and b!1368732 res!911483) b!1368733))

(assert (= (and b!1368733 res!911477) b!1368738))

(assert (= (and b!1368738 res!911484) b!1368735))

(assert (= (and b!1368735 res!911474) b!1368736))

(assert (= (and b!1368736 res!911482) b!1368730))

(assert (= (and b!1368730 res!911481) b!1368729))

(assert (= (and b!1368729 res!911476) b!1368734))

(declare-fun m!1253251 () Bool)

(assert (=> b!1368737 m!1253251))

(declare-fun m!1253253 () Bool)

(assert (=> b!1368734 m!1253253))

(declare-fun m!1253255 () Bool)

(assert (=> b!1368731 m!1253255))

(declare-fun m!1253257 () Bool)

(assert (=> b!1368730 m!1253257))

(assert (=> b!1368730 m!1253257))

(declare-fun m!1253259 () Bool)

(assert (=> b!1368730 m!1253259))

(declare-fun m!1253261 () Bool)

(assert (=> b!1368732 m!1253261))

(declare-fun m!1253263 () Bool)

(assert (=> b!1368738 m!1253263))

(declare-fun m!1253265 () Bool)

(assert (=> b!1368733 m!1253265))

(declare-fun m!1253267 () Bool)

(assert (=> b!1368739 m!1253267))

(declare-fun m!1253269 () Bool)

(assert (=> start!115852 m!1253269))

(assert (=> b!1368729 m!1253257))

(assert (=> b!1368729 m!1253257))

(declare-fun m!1253271 () Bool)

(assert (=> b!1368729 m!1253271))

(declare-fun m!1253273 () Bool)

(assert (=> b!1368735 m!1253273))

(declare-fun m!1253275 () Bool)

(assert (=> b!1368735 m!1253275))

(check-sat (not b!1368732) (not b!1368735) (not b!1368734) (not b!1368733) (not b!1368739) (not b!1368738) (not b!1368737) (not b!1368729) (not start!115852) (not b!1368730) (not b!1368731))
(check-sat)
(get-model)

(declare-fun d!147263 () Bool)

(declare-fun lt!602373 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!713 (List!31963) (InoxSet (_ BitVec 64)))

(assert (=> d!147263 (= lt!602373 (select (content!713 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775829 () Bool)

(assert (=> d!147263 (= lt!602373 e!775829)))

(declare-fun res!911564 () Bool)

(assert (=> d!147263 (=> (not res!911564) (not e!775829))))

(get-info :version)

(assert (=> d!147263 (= res!911564 ((_ is Cons!31959) newAcc!98))))

(assert (=> d!147263 (= (contains!9648 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602373)))

(declare-fun b!1368818 () Bool)

(declare-fun e!775830 () Bool)

(assert (=> b!1368818 (= e!775829 e!775830)))

(declare-fun res!911563 () Bool)

(assert (=> b!1368818 (=> res!911563 e!775830)))

(assert (=> b!1368818 (= res!911563 (= (h!33177 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368819 () Bool)

(assert (=> b!1368819 (= e!775830 (contains!9648 (t!46649 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147263 res!911564) b!1368818))

(assert (= (and b!1368818 (not res!911563)) b!1368819))

(declare-fun m!1253329 () Bool)

(assert (=> d!147263 m!1253329))

(declare-fun m!1253331 () Bool)

(assert (=> d!147263 m!1253331))

(declare-fun m!1253333 () Bool)

(assert (=> b!1368819 m!1253333))

(assert (=> b!1368733 d!147263))

(declare-fun b!1368844 () Bool)

(declare-fun e!775858 () Bool)

(declare-fun e!775855 () Bool)

(assert (=> b!1368844 (= e!775858 e!775855)))

(declare-fun res!911592 () Bool)

(assert (=> b!1368844 (=> (not res!911592) (not e!775855))))

(assert (=> b!1368844 (= res!911592 ((_ is Cons!31959) acc!866))))

(declare-fun b!1368846 () Bool)

(declare-fun e!775857 () Bool)

(assert (=> b!1368846 (= e!775857 (subseq!1007 (t!46649 newAcc!98) (t!46649 acc!866)))))

(declare-fun b!1368847 () Bool)

(declare-fun e!775856 () Bool)

(assert (=> b!1368847 (= e!775856 (subseq!1007 newAcc!98 (t!46649 acc!866)))))

(declare-fun d!147267 () Bool)

(declare-fun res!911590 () Bool)

(assert (=> d!147267 (=> res!911590 e!775858)))

(assert (=> d!147267 (= res!911590 ((_ is Nil!31960) newAcc!98))))

(assert (=> d!147267 (= (subseq!1007 newAcc!98 acc!866) e!775858)))

(declare-fun b!1368845 () Bool)

(assert (=> b!1368845 (= e!775855 e!775856)))

(declare-fun res!911591 () Bool)

(assert (=> b!1368845 (=> res!911591 e!775856)))

(assert (=> b!1368845 (= res!911591 e!775857)))

(declare-fun res!911589 () Bool)

(assert (=> b!1368845 (=> (not res!911589) (not e!775857))))

(assert (=> b!1368845 (= res!911589 (= (h!33177 newAcc!98) (h!33177 acc!866)))))

(assert (= (and d!147267 (not res!911590)) b!1368844))

(assert (= (and b!1368844 res!911592) b!1368845))

(assert (= (and b!1368845 res!911589) b!1368846))

(assert (= (and b!1368845 (not res!911591)) b!1368847))

(declare-fun m!1253347 () Bool)

(assert (=> b!1368846 m!1253347))

(declare-fun m!1253349 () Bool)

(assert (=> b!1368847 m!1253349))

(assert (=> b!1368738 d!147267))

(declare-fun d!147279 () Bool)

(declare-fun res!911603 () Bool)

(declare-fun e!775869 () Bool)

(assert (=> d!147279 (=> res!911603 e!775869)))

(assert (=> d!147279 (= res!911603 ((_ is Nil!31960) acc!866))))

(assert (=> d!147279 (= (noDuplicate!2479 acc!866) e!775869)))

(declare-fun b!1368858 () Bool)

(declare-fun e!775870 () Bool)

(assert (=> b!1368858 (= e!775869 e!775870)))

(declare-fun res!911604 () Bool)

(assert (=> b!1368858 (=> (not res!911604) (not e!775870))))

(assert (=> b!1368858 (= res!911604 (not (contains!9648 (t!46649 acc!866) (h!33177 acc!866))))))

(declare-fun b!1368859 () Bool)

(assert (=> b!1368859 (= e!775870 (noDuplicate!2479 (t!46649 acc!866)))))

(assert (= (and d!147279 (not res!911603)) b!1368858))

(assert (= (and b!1368858 res!911604) b!1368859))

(declare-fun m!1253355 () Bool)

(assert (=> b!1368858 m!1253355))

(declare-fun m!1253357 () Bool)

(assert (=> b!1368859 m!1253357))

(assert (=> b!1368737 d!147279))

(declare-fun d!147285 () Bool)

(declare-fun lt!602376 () Bool)

(assert (=> d!147285 (= lt!602376 (select (content!713 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775871 () Bool)

(assert (=> d!147285 (= lt!602376 e!775871)))

(declare-fun res!911606 () Bool)

(assert (=> d!147285 (=> (not res!911606) (not e!775871))))

(assert (=> d!147285 (= res!911606 ((_ is Cons!31959) newAcc!98))))

(assert (=> d!147285 (= (contains!9648 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602376)))

(declare-fun b!1368860 () Bool)

(declare-fun e!775872 () Bool)

(assert (=> b!1368860 (= e!775871 e!775872)))

(declare-fun res!911605 () Bool)

(assert (=> b!1368860 (=> res!911605 e!775872)))

(assert (=> b!1368860 (= res!911605 (= (h!33177 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368861 () Bool)

(assert (=> b!1368861 (= e!775872 (contains!9648 (t!46649 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147285 res!911606) b!1368860))

(assert (= (and b!1368860 (not res!911605)) b!1368861))

(assert (=> d!147285 m!1253329))

(declare-fun m!1253359 () Bool)

(assert (=> d!147285 m!1253359))

(declare-fun m!1253361 () Bool)

(assert (=> b!1368861 m!1253361))

(assert (=> b!1368732 d!147285))

(declare-fun d!147287 () Bool)

(declare-fun lt!602380 () Bool)

(assert (=> d!147287 (= lt!602380 (select (content!713 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775877 () Bool)

(assert (=> d!147287 (= lt!602380 e!775877)))

(declare-fun res!911612 () Bool)

(assert (=> d!147287 (=> (not res!911612) (not e!775877))))

(assert (=> d!147287 (= res!911612 ((_ is Cons!31959) acc!866))))

(assert (=> d!147287 (= (contains!9648 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602380)))

(declare-fun b!1368866 () Bool)

(declare-fun e!775878 () Bool)

(assert (=> b!1368866 (= e!775877 e!775878)))

(declare-fun res!911611 () Bool)

(assert (=> b!1368866 (=> res!911611 e!775878)))

(assert (=> b!1368866 (= res!911611 (= (h!33177 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368867 () Bool)

(assert (=> b!1368867 (= e!775878 (contains!9648 (t!46649 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147287 res!911612) b!1368866))

(assert (= (and b!1368866 (not res!911611)) b!1368867))

(declare-fun m!1253369 () Bool)

(assert (=> d!147287 m!1253369))

(declare-fun m!1253371 () Bool)

(assert (=> d!147287 m!1253371))

(declare-fun m!1253373 () Bool)

(assert (=> b!1368867 m!1253373))

(assert (=> b!1368731 d!147287))

(declare-fun d!147291 () Bool)

(assert (=> d!147291 (= (array_inv!34189 a!3861) (bvsge (size!45459 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115852 d!147291))

(declare-fun b!1368906 () Bool)

(declare-fun e!775913 () Bool)

(declare-fun e!775911 () Bool)

(assert (=> b!1368906 (= e!775913 e!775911)))

(declare-fun c!128081 () Bool)

(assert (=> b!1368906 (= c!128081 (validKeyInArray!0 (select (arr!44908 a!3861) from!3239)))))

(declare-fun bm!65552 () Bool)

(declare-fun call!65555 () Bool)

(assert (=> bm!65552 (= call!65555 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128081 (Cons!31959 (select (arr!44908 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1368907 () Bool)

(declare-fun e!775912 () Bool)

(assert (=> b!1368907 (= e!775912 e!775913)))

(declare-fun res!911639 () Bool)

(assert (=> b!1368907 (=> (not res!911639) (not e!775913))))

(declare-fun e!775914 () Bool)

(assert (=> b!1368907 (= res!911639 (not e!775914))))

(declare-fun res!911640 () Bool)

(assert (=> b!1368907 (=> (not res!911640) (not e!775914))))

(assert (=> b!1368907 (= res!911640 (validKeyInArray!0 (select (arr!44908 a!3861) from!3239)))))

(declare-fun b!1368908 () Bool)

(assert (=> b!1368908 (= e!775914 (contains!9648 acc!866 (select (arr!44908 a!3861) from!3239)))))

(declare-fun b!1368909 () Bool)

(assert (=> b!1368909 (= e!775911 call!65555)))

(declare-fun d!147297 () Bool)

(declare-fun res!911641 () Bool)

(assert (=> d!147297 (=> res!911641 e!775912)))

(assert (=> d!147297 (= res!911641 (bvsge from!3239 (size!45459 a!3861)))))

(assert (=> d!147297 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775912)))

(declare-fun b!1368910 () Bool)

(assert (=> b!1368910 (= e!775911 call!65555)))

(assert (= (and d!147297 (not res!911641)) b!1368907))

(assert (= (and b!1368907 res!911640) b!1368908))

(assert (= (and b!1368907 res!911639) b!1368906))

(assert (= (and b!1368906 c!128081) b!1368910))

(assert (= (and b!1368906 (not c!128081)) b!1368909))

(assert (= (or b!1368910 b!1368909) bm!65552))

(assert (=> b!1368906 m!1253257))

(assert (=> b!1368906 m!1253257))

(assert (=> b!1368906 m!1253259))

(assert (=> bm!65552 m!1253257))

(declare-fun m!1253391 () Bool)

(assert (=> bm!65552 m!1253391))

(assert (=> b!1368907 m!1253257))

(assert (=> b!1368907 m!1253257))

(assert (=> b!1368907 m!1253259))

(assert (=> b!1368908 m!1253257))

(assert (=> b!1368908 m!1253257))

(assert (=> b!1368908 m!1253271))

(assert (=> b!1368735 d!147297))

(declare-fun d!147301 () Bool)

(assert (=> d!147301 (noDuplicate!2479 newAcc!98)))

(declare-fun lt!602390 () Unit!45086)

(declare-fun choose!2000 (List!31963 List!31963) Unit!45086)

(assert (=> d!147301 (= lt!602390 (choose!2000 newAcc!98 acc!866))))

(declare-fun e!775929 () Bool)

(assert (=> d!147301 e!775929))

(declare-fun res!911654 () Bool)

(assert (=> d!147301 (=> (not res!911654) (not e!775929))))

(assert (=> d!147301 (= res!911654 (subseq!1007 newAcc!98 acc!866))))

(assert (=> d!147301 (= (noDuplicateSubseq!194 newAcc!98 acc!866) lt!602390)))

(declare-fun b!1368927 () Bool)

(assert (=> b!1368927 (= e!775929 (noDuplicate!2479 acc!866))))

(assert (= (and d!147301 res!911654) b!1368927))

(assert (=> d!147301 m!1253253))

(declare-fun m!1253397 () Bool)

(assert (=> d!147301 m!1253397))

(assert (=> d!147301 m!1253263))

(assert (=> b!1368927 m!1253251))

(assert (=> b!1368735 d!147301))

(declare-fun d!147307 () Bool)

(assert (=> d!147307 (= (validKeyInArray!0 (select (arr!44908 a!3861) from!3239)) (and (not (= (select (arr!44908 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44908 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1368730 d!147307))

(declare-fun lt!602394 () Bool)

(declare-fun d!147315 () Bool)

(assert (=> d!147315 (= lt!602394 (select (content!713 acc!866) (select (arr!44908 a!3861) from!3239)))))

(declare-fun e!775936 () Bool)

(assert (=> d!147315 (= lt!602394 e!775936)))

(declare-fun res!911662 () Bool)

(assert (=> d!147315 (=> (not res!911662) (not e!775936))))

(assert (=> d!147315 (= res!911662 ((_ is Cons!31959) acc!866))))

(assert (=> d!147315 (= (contains!9648 acc!866 (select (arr!44908 a!3861) from!3239)) lt!602394)))

(declare-fun b!1368934 () Bool)

(declare-fun e!775937 () Bool)

(assert (=> b!1368934 (= e!775936 e!775937)))

(declare-fun res!911661 () Bool)

(assert (=> b!1368934 (=> res!911661 e!775937)))

(assert (=> b!1368934 (= res!911661 (= (h!33177 acc!866) (select (arr!44908 a!3861) from!3239)))))

(declare-fun b!1368935 () Bool)

(assert (=> b!1368935 (= e!775937 (contains!9648 (t!46649 acc!866) (select (arr!44908 a!3861) from!3239)))))

(assert (= (and d!147315 res!911662) b!1368934))

(assert (= (and b!1368934 (not res!911661)) b!1368935))

(assert (=> d!147315 m!1253369))

(assert (=> d!147315 m!1253257))

(declare-fun m!1253413 () Bool)

(assert (=> d!147315 m!1253413))

(assert (=> b!1368935 m!1253257))

(declare-fun m!1253417 () Bool)

(assert (=> b!1368935 m!1253417))

(assert (=> b!1368729 d!147315))

(declare-fun d!147323 () Bool)

(declare-fun lt!602397 () Bool)

(assert (=> d!147323 (= lt!602397 (select (content!713 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775942 () Bool)

(assert (=> d!147323 (= lt!602397 e!775942)))

(declare-fun res!911668 () Bool)

(assert (=> d!147323 (=> (not res!911668) (not e!775942))))

(assert (=> d!147323 (= res!911668 ((_ is Cons!31959) acc!866))))

(assert (=> d!147323 (= (contains!9648 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602397)))

(declare-fun b!1368940 () Bool)

(declare-fun e!775943 () Bool)

(assert (=> b!1368940 (= e!775942 e!775943)))

(declare-fun res!911667 () Bool)

(assert (=> b!1368940 (=> res!911667 e!775943)))

(assert (=> b!1368940 (= res!911667 (= (h!33177 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368941 () Bool)

(assert (=> b!1368941 (= e!775943 (contains!9648 (t!46649 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147323 res!911668) b!1368940))

(assert (= (and b!1368940 (not res!911667)) b!1368941))

(assert (=> d!147323 m!1253369))

(declare-fun m!1253421 () Bool)

(assert (=> d!147323 m!1253421))

(declare-fun m!1253425 () Bool)

(assert (=> b!1368941 m!1253425))

(assert (=> b!1368739 d!147323))

(declare-fun d!147327 () Bool)

(declare-fun res!911671 () Bool)

(declare-fun e!775946 () Bool)

(assert (=> d!147327 (=> res!911671 e!775946)))

(assert (=> d!147327 (= res!911671 ((_ is Nil!31960) newAcc!98))))

(assert (=> d!147327 (= (noDuplicate!2479 newAcc!98) e!775946)))

(declare-fun b!1368944 () Bool)

(declare-fun e!775947 () Bool)

(assert (=> b!1368944 (= e!775946 e!775947)))

(declare-fun res!911672 () Bool)

(assert (=> b!1368944 (=> (not res!911672) (not e!775947))))

(assert (=> b!1368944 (= res!911672 (not (contains!9648 (t!46649 newAcc!98) (h!33177 newAcc!98))))))

(declare-fun b!1368945 () Bool)

(assert (=> b!1368945 (= e!775947 (noDuplicate!2479 (t!46649 newAcc!98)))))

(assert (= (and d!147327 (not res!911671)) b!1368944))

(assert (= (and b!1368944 res!911672) b!1368945))

(declare-fun m!1253433 () Bool)

(assert (=> b!1368944 m!1253433))

(declare-fun m!1253435 () Bool)

(assert (=> b!1368945 m!1253435))

(assert (=> b!1368734 d!147327))

(check-sat (not b!1368927) (not b!1368819) (not b!1368859) (not b!1368941) (not b!1368861) (not d!147263) (not b!1368935) (not b!1368944) (not b!1368906) (not d!147287) (not b!1368867) (not b!1368858) (not b!1368907) (not d!147285) (not b!1368846) (not b!1368847) (not d!147323) (not d!147301) (not b!1368908) (not bm!65552) (not b!1368945) (not d!147315))
(check-sat)
