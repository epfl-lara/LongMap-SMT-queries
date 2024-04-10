; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60374 () Bool)

(assert start!60374)

(declare-fun b!678529 () Bool)

(declare-fun e!386648 () Bool)

(declare-datatypes ((List!12944 0))(
  ( (Nil!12941) (Cons!12940 (h!13985 (_ BitVec 64)) (t!19172 List!12944)) )
))
(declare-fun acc!681 () List!12944)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3521 (List!12944 (_ BitVec 64)) Bool)

(assert (=> b!678529 (= e!386648 (contains!3521 acc!681 k!2843))))

(declare-fun b!678530 () Bool)

(declare-fun e!386645 () Bool)

(declare-fun e!386646 () Bool)

(assert (=> b!678530 (= e!386645 e!386646)))

(declare-fun res!444940 () Bool)

(assert (=> b!678530 (=> (not res!444940) (not e!386646))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678530 (= res!444940 (bvsle from!3004 i!1382))))

(declare-fun b!678531 () Bool)

(declare-fun res!444937 () Bool)

(declare-fun e!386647 () Bool)

(assert (=> b!678531 (=> (not res!444937) (not e!386647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678531 (= res!444937 (validKeyInArray!0 k!2843))))

(declare-fun b!678532 () Bool)

(assert (=> b!678532 (= e!386646 (not (contains!3521 acc!681 k!2843)))))

(declare-fun b!678533 () Bool)

(declare-fun res!444945 () Bool)

(assert (=> b!678533 (=> (not res!444945) (not e!386647))))

(declare-fun noDuplicate!768 (List!12944) Bool)

(assert (=> b!678533 (= res!444945 (noDuplicate!768 acc!681))))

(declare-fun b!678534 () Bool)

(declare-datatypes ((array!39421 0))(
  ( (array!39422 (arr!18903 (Array (_ BitVec 32) (_ BitVec 64))) (size!19267 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39421)

(declare-fun arrayContainsKey!0 (array!39421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678534 (= e!386647 (not (arrayContainsKey!0 (array!39422 (store (arr!18903 a!3626) i!1382 k!2843) (size!19267 a!3626)) k!2843 from!3004)))))

(declare-fun b!678535 () Bool)

(declare-fun res!444942 () Bool)

(assert (=> b!678535 (=> (not res!444942) (not e!386647))))

(declare-fun arrayNoDuplicates!0 (array!39421 (_ BitVec 32) List!12944) Bool)

(assert (=> b!678535 (= res!444942 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678536 () Bool)

(declare-fun res!444947 () Bool)

(assert (=> b!678536 (=> (not res!444947) (not e!386647))))

(assert (=> b!678536 (= res!444947 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12941))))

(declare-fun b!678537 () Bool)

(declare-fun res!444939 () Bool)

(assert (=> b!678537 (=> (not res!444939) (not e!386647))))

(assert (=> b!678537 (= res!444939 (not (contains!3521 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444946 () Bool)

(assert (=> start!60374 (=> (not res!444946) (not e!386647))))

(assert (=> start!60374 (= res!444946 (and (bvslt (size!19267 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19267 a!3626))))))

(assert (=> start!60374 e!386647))

(assert (=> start!60374 true))

(declare-fun array_inv!14699 (array!39421) Bool)

(assert (=> start!60374 (array_inv!14699 a!3626)))

(declare-fun b!678538 () Bool)

(declare-fun res!444941 () Bool)

(assert (=> b!678538 (=> (not res!444941) (not e!386647))))

(assert (=> b!678538 (= res!444941 e!386645)))

(declare-fun res!444949 () Bool)

(assert (=> b!678538 (=> res!444949 e!386645)))

(assert (=> b!678538 (= res!444949 e!386648)))

(declare-fun res!444948 () Bool)

(assert (=> b!678538 (=> (not res!444948) (not e!386648))))

(assert (=> b!678538 (= res!444948 (bvsgt from!3004 i!1382))))

(declare-fun b!678539 () Bool)

(declare-fun res!444943 () Bool)

(assert (=> b!678539 (=> (not res!444943) (not e!386647))))

(assert (=> b!678539 (= res!444943 (not (contains!3521 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678540 () Bool)

(declare-fun res!444950 () Bool)

(assert (=> b!678540 (=> (not res!444950) (not e!386647))))

(assert (=> b!678540 (= res!444950 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678541 () Bool)

(declare-fun res!444938 () Bool)

(assert (=> b!678541 (=> (not res!444938) (not e!386647))))

(assert (=> b!678541 (= res!444938 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19267 a!3626))))))

(declare-fun b!678542 () Bool)

(declare-fun res!444944 () Bool)

(assert (=> b!678542 (=> (not res!444944) (not e!386647))))

(assert (=> b!678542 (= res!444944 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19267 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60374 res!444946) b!678533))

(assert (= (and b!678533 res!444945) b!678537))

(assert (= (and b!678537 res!444939) b!678539))

(assert (= (and b!678539 res!444943) b!678538))

(assert (= (and b!678538 res!444948) b!678529))

(assert (= (and b!678538 (not res!444949)) b!678530))

(assert (= (and b!678530 res!444940) b!678532))

(assert (= (and b!678538 res!444941) b!678536))

(assert (= (and b!678536 res!444947) b!678535))

(assert (= (and b!678535 res!444942) b!678541))

(assert (= (and b!678541 res!444938) b!678531))

(assert (= (and b!678531 res!444937) b!678540))

(assert (= (and b!678540 res!444950) b!678542))

(assert (= (and b!678542 res!444944) b!678534))

(declare-fun m!644261 () Bool)

(assert (=> b!678539 m!644261))

(declare-fun m!644263 () Bool)

(assert (=> b!678532 m!644263))

(declare-fun m!644265 () Bool)

(assert (=> b!678537 m!644265))

(declare-fun m!644267 () Bool)

(assert (=> b!678531 m!644267))

(declare-fun m!644269 () Bool)

(assert (=> start!60374 m!644269))

(declare-fun m!644271 () Bool)

(assert (=> b!678540 m!644271))

(declare-fun m!644273 () Bool)

(assert (=> b!678533 m!644273))

(declare-fun m!644275 () Bool)

(assert (=> b!678535 m!644275))

(declare-fun m!644277 () Bool)

(assert (=> b!678534 m!644277))

(declare-fun m!644279 () Bool)

(assert (=> b!678534 m!644279))

(declare-fun m!644281 () Bool)

(assert (=> b!678536 m!644281))

(assert (=> b!678529 m!644263))

(push 1)

(assert (not b!678534))

(assert (not start!60374))

(assert (not b!678532))

(assert (not b!678533))

(assert (not b!678529))

(assert (not b!678535))

(assert (not b!678540))

(assert (not b!678536))

(assert (not b!678537))

(assert (not b!678539))

(assert (not b!678531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!678662 () Bool)

(declare-fun e!386712 () Bool)

(declare-fun call!33920 () Bool)

(assert (=> b!678662 (= e!386712 call!33920)))

(declare-fun b!678663 () Bool)

(declare-fun e!386713 () Bool)

(assert (=> b!678663 (= e!386713 (contains!3521 Nil!12941 (select (arr!18903 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33917 () Bool)

(declare-fun c!77168 () Bool)

(assert (=> bm!33917 (= call!33920 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77168 (Cons!12940 (select (arr!18903 a!3626) #b00000000000000000000000000000000) Nil!12941) Nil!12941)))))

(declare-fun b!678664 () Bool)

(assert (=> b!678664 (= e!386712 call!33920)))

(declare-fun b!678665 () Bool)

(declare-fun e!386710 () Bool)

(declare-fun e!386711 () Bool)

(assert (=> b!678665 (= e!386710 e!386711)))

(declare-fun res!445062 () Bool)

(assert (=> b!678665 (=> (not res!445062) (not e!386711))))

(assert (=> b!678665 (= res!445062 (not e!386713))))

(declare-fun res!445060 () Bool)

(assert (=> b!678665 (=> (not res!445060) (not e!386713))))

(assert (=> b!678665 (= res!445060 (validKeyInArray!0 (select (arr!18903 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93419 () Bool)

(declare-fun res!445061 () Bool)

(assert (=> d!93419 (=> res!445061 e!386710)))

(assert (=> d!93419 (= res!445061 (bvsge #b00000000000000000000000000000000 (size!19267 a!3626)))))

(assert (=> d!93419 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12941) e!386710)))

(declare-fun b!678666 () Bool)

(assert (=> b!678666 (= e!386711 e!386712)))

(assert (=> b!678666 (= c!77168 (validKeyInArray!0 (select (arr!18903 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93419 (not res!445061)) b!678665))

(assert (= (and b!678665 res!445060) b!678663))

(assert (= (and b!678665 res!445062) b!678666))

(assert (= (and b!678666 c!77168) b!678662))

(assert (= (and b!678666 (not c!77168)) b!678664))

(assert (= (or b!678662 b!678664) bm!33917))

(declare-fun m!644343 () Bool)

(assert (=> b!678663 m!644343))

(assert (=> b!678663 m!644343))

(declare-fun m!644347 () Bool)

(assert (=> b!678663 m!644347))

(assert (=> bm!33917 m!644343))

(declare-fun m!644351 () Bool)

(assert (=> bm!33917 m!644351))

(assert (=> b!678665 m!644343))

(assert (=> b!678665 m!644343))

(declare-fun m!644353 () Bool)

(assert (=> b!678665 m!644353))

(assert (=> b!678666 m!644343))

(assert (=> b!678666 m!644343))

(assert (=> b!678666 m!644353))

(assert (=> b!678536 d!93419))

(declare-fun b!678672 () Bool)

(declare-fun e!386720 () Bool)

(declare-fun call!33922 () Bool)

(assert (=> b!678672 (= e!386720 call!33922)))

(declare-fun b!678673 () Bool)

(declare-fun e!386721 () Bool)

(assert (=> b!678673 (= e!386721 (contains!3521 acc!681 (select (arr!18903 a!3626) from!3004)))))

(declare-fun bm!33919 () Bool)

(declare-fun c!77170 () Bool)

(assert (=> bm!33919 (= call!33922 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77170 (Cons!12940 (select (arr!18903 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!678674 () Bool)

(assert (=> b!678674 (= e!386720 call!33922)))

(declare-fun b!678675 () Bool)

(declare-fun e!386718 () Bool)

(declare-fun e!386719 () Bool)

(assert (=> b!678675 (= e!386718 e!386719)))

(declare-fun res!445068 () Bool)

(assert (=> b!678675 (=> (not res!445068) (not e!386719))))

(assert (=> b!678675 (= res!445068 (not e!386721))))

(declare-fun res!445066 () Bool)

(assert (=> b!678675 (=> (not res!445066) (not e!386721))))

(assert (=> b!678675 (= res!445066 (validKeyInArray!0 (select (arr!18903 a!3626) from!3004)))))

(declare-fun d!93433 () Bool)

(declare-fun res!445067 () Bool)

(assert (=> d!93433 (=> res!445067 e!386718)))

(assert (=> d!93433 (= res!445067 (bvsge from!3004 (size!19267 a!3626)))))

(assert (=> d!93433 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!386718)))

(declare-fun b!678676 () Bool)

(assert (=> b!678676 (= e!386719 e!386720)))

(assert (=> b!678676 (= c!77170 (validKeyInArray!0 (select (arr!18903 a!3626) from!3004)))))

(assert (= (and d!93433 (not res!445067)) b!678675))

(assert (= (and b!678675 res!445066) b!678673))

(assert (= (and b!678675 res!445068) b!678676))

(assert (= (and b!678676 c!77170) b!678672))

(assert (= (and b!678676 (not c!77170)) b!678674))

(assert (= (or b!678672 b!678674) bm!33919))

(declare-fun m!644359 () Bool)

(assert (=> b!678673 m!644359))

(assert (=> b!678673 m!644359))

(declare-fun m!644363 () Bool)

(assert (=> b!678673 m!644363))

(assert (=> bm!33919 m!644359))

(declare-fun m!644367 () Bool)

(assert (=> bm!33919 m!644367))

(assert (=> b!678675 m!644359))

(assert (=> b!678675 m!644359))

(declare-fun m!644369 () Bool)

(assert (=> b!678675 m!644369))

(assert (=> b!678676 m!644359))

(assert (=> b!678676 m!644359))

(assert (=> b!678676 m!644369))

(assert (=> b!678535 d!93433))

(declare-fun d!93437 () Bool)

(declare-fun lt!312905 () Bool)

(declare-fun content!262 (List!12944) (Set (_ BitVec 64)))

(assert (=> d!93437 (= lt!312905 (set.member k!2843 (content!262 acc!681)))))

(declare-fun e!386738 () Bool)

(assert (=> d!93437 (= lt!312905 e!386738)))

(declare-fun res!445083 () Bool)

(assert (=> d!93437 (=> (not res!445083) (not e!386738))))

(assert (=> d!93437 (= res!445083 (is-Cons!12940 acc!681))))

(assert (=> d!93437 (= (contains!3521 acc!681 k!2843) lt!312905)))

(declare-fun b!678695 () Bool)

(declare-fun e!386739 () Bool)

(assert (=> b!678695 (= e!386738 e!386739)))

(declare-fun res!445084 () Bool)

(assert (=> b!678695 (=> res!445084 e!386739)))

(assert (=> b!678695 (= res!445084 (= (h!13985 acc!681) k!2843))))

(declare-fun b!678696 () Bool)

(assert (=> b!678696 (= e!386739 (contains!3521 (t!19172 acc!681) k!2843))))

(assert (= (and d!93437 res!445083) b!678695))

(assert (= (and b!678695 (not res!445084)) b!678696))

(declare-fun m!644373 () Bool)

(assert (=> d!93437 m!644373))

(declare-fun m!644375 () Bool)

(assert (=> d!93437 m!644375))

(declare-fun m!644377 () Bool)

(assert (=> b!678696 m!644377))

(assert (=> b!678529 d!93437))

(declare-fun d!93441 () Bool)

(declare-fun res!445098 () Bool)

(declare-fun e!386754 () Bool)

(assert (=> d!93441 (=> res!445098 e!386754)))

(assert (=> d!93441 (= res!445098 (= (select (arr!18903 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93441 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!386754)))

(declare-fun b!678712 () Bool)

(declare-fun e!386755 () Bool)

(assert (=> b!678712 (= e!386754 e!386755)))

(declare-fun res!445099 () Bool)

(assert (=> b!678712 (=> (not res!445099) (not e!386755))))

(assert (=> b!678712 (= res!445099 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19267 a!3626)))))

(declare-fun b!678713 () Bool)

(assert (=> b!678713 (= e!386755 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93441 (not res!445098)) b!678712))

(assert (= (and b!678712 res!445099) b!678713))

(assert (=> d!93441 m!644343))

(declare-fun m!644393 () Bool)

(assert (=> b!678713 m!644393))

(assert (=> b!678540 d!93441))

(declare-fun d!93449 () Bool)

(declare-fun lt!312907 () Bool)

(assert (=> d!93449 (= lt!312907 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!262 acc!681)))))

(declare-fun e!386756 () Bool)

(assert (=> d!93449 (= lt!312907 e!386756)))

(declare-fun res!445100 () Bool)

(assert (=> d!93449 (=> (not res!445100) (not e!386756))))

(assert (=> d!93449 (= res!445100 (is-Cons!12940 acc!681))))

(assert (=> d!93449 (= (contains!3521 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312907)))

(declare-fun b!678714 () Bool)

(declare-fun e!386757 () Bool)

(assert (=> b!678714 (= e!386756 e!386757)))

(declare-fun res!445101 () Bool)

(assert (=> b!678714 (=> res!445101 e!386757)))

(assert (=> b!678714 (= res!445101 (= (h!13985 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678715 () Bool)

(assert (=> b!678715 (= e!386757 (contains!3521 (t!19172 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93449 res!445100) b!678714))

(assert (= (and b!678714 (not res!445101)) b!678715))

(assert (=> d!93449 m!644373))

(declare-fun m!644395 () Bool)

(assert (=> d!93449 m!644395))

(declare-fun m!644397 () Bool)

(assert (=> b!678715 m!644397))

(assert (=> b!678539 d!93449))

(declare-fun d!93451 () Bool)

(assert (=> d!93451 (= (array_inv!14699 a!3626) (bvsge (size!19267 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60374 d!93451))

(declare-fun d!93457 () Bool)

(declare-fun res!445110 () Bool)

(declare-fun e!386766 () Bool)

(assert (=> d!93457 (=> res!445110 e!386766)))

(assert (=> d!93457 (= res!445110 (= (select (arr!18903 (array!39422 (store (arr!18903 a!3626) i!1382 k!2843) (size!19267 a!3626))) from!3004) k!2843))))

(assert (=> d!93457 (= (arrayContainsKey!0 (array!39422 (store (arr!18903 a!3626) i!1382 k!2843) (size!19267 a!3626)) k!2843 from!3004) e!386766)))

(declare-fun b!678724 () Bool)

(declare-fun e!386767 () Bool)

(assert (=> b!678724 (= e!386766 e!386767)))

(declare-fun res!445111 () Bool)

(assert (=> b!678724 (=> (not res!445111) (not e!386767))))

(assert (=> b!678724 (= res!445111 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19267 (array!39422 (store (arr!18903 a!3626) i!1382 k!2843) (size!19267 a!3626)))))))

(declare-fun b!678725 () Bool)

(assert (=> b!678725 (= e!386767 (arrayContainsKey!0 (array!39422 (store (arr!18903 a!3626) i!1382 k!2843) (size!19267 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93457 (not res!445110)) b!678724))

(assert (= (and b!678724 res!445111) b!678725))

(declare-fun m!644405 () Bool)

(assert (=> d!93457 m!644405))

(declare-fun m!644407 () Bool)

(assert (=> b!678725 m!644407))

(assert (=> b!678534 d!93457))

(declare-fun d!93459 () Bool)

(declare-fun res!445126 () Bool)

(declare-fun e!386782 () Bool)

(assert (=> d!93459 (=> res!445126 e!386782)))

(assert (=> d!93459 (= res!445126 (is-Nil!12941 acc!681))))

(assert (=> d!93459 (= (noDuplicate!768 acc!681) e!386782)))

(declare-fun b!678740 () Bool)

(declare-fun e!386783 () Bool)

(assert (=> b!678740 (= e!386782 e!386783)))

(declare-fun res!445127 () Bool)

(assert (=> b!678740 (=> (not res!445127) (not e!386783))))

(assert (=> b!678740 (= res!445127 (not (contains!3521 (t!19172 acc!681) (h!13985 acc!681))))))

(declare-fun b!678741 () Bool)

(assert (=> b!678741 (= e!386783 (noDuplicate!768 (t!19172 acc!681)))))

(assert (= (and d!93459 (not res!445126)) b!678740))

(assert (= (and b!678740 res!445127) b!678741))

(declare-fun m!644421 () Bool)

(assert (=> b!678740 m!644421))

(declare-fun m!644423 () Bool)

(assert (=> b!678741 m!644423))

(assert (=> b!678533 d!93459))

(declare-fun d!93469 () Bool)

(declare-fun lt!312910 () Bool)

(assert (=> d!93469 (= lt!312910 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!262 acc!681)))))

(declare-fun e!386788 () Bool)

(assert (=> d!93469 (= lt!312910 e!386788)))

(declare-fun res!445132 () Bool)

(assert (=> d!93469 (=> (not res!445132) (not e!386788))))

(assert (=> d!93469 (= res!445132 (is-Cons!12940 acc!681))))

(assert (=> d!93469 (= (contains!3521 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312910)))

(declare-fun b!678746 () Bool)

(declare-fun e!386789 () Bool)

(assert (=> b!678746 (= e!386788 e!386789)))

(declare-fun res!445133 () Bool)

(assert (=> b!678746 (=> res!445133 e!386789)))

(assert (=> b!678746 (= res!445133 (= (h!13985 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678747 () Bool)

(assert (=> b!678747 (= e!386789 (contains!3521 (t!19172 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93469 res!445132) b!678746))

(assert (= (and b!678746 (not res!445133)) b!678747))

(assert (=> d!93469 m!644373))

(declare-fun m!644425 () Bool)

(assert (=> d!93469 m!644425))

(declare-fun m!644427 () Bool)

(assert (=> b!678747 m!644427))

(assert (=> b!678537 d!93469))

(assert (=> b!678532 d!93437))

(declare-fun d!93471 () Bool)

(assert (=> d!93471 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!678531 d!93471))

(push 1)

