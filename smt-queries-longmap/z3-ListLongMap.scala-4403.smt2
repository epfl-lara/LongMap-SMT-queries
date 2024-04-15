; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60566 () Bool)

(assert start!60566)

(declare-fun b!680393 () Bool)

(declare-fun res!446789 () Bool)

(declare-fun e!387553 () Bool)

(assert (=> b!680393 (=> (not res!446789) (not e!387553))))

(declare-fun e!387556 () Bool)

(assert (=> b!680393 (= res!446789 e!387556)))

(declare-fun res!446790 () Bool)

(assert (=> b!680393 (=> res!446790 e!387556)))

(declare-fun e!387550 () Bool)

(assert (=> b!680393 (= res!446790 e!387550)))

(declare-fun res!446783 () Bool)

(assert (=> b!680393 (=> (not res!446783) (not e!387550))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680393 (= res!446783 (bvsgt from!3004 i!1382))))

(declare-fun b!680394 () Bool)

(declare-fun res!446779 () Bool)

(assert (=> b!680394 (=> (not res!446779) (not e!387553))))

(declare-datatypes ((array!39501 0))(
  ( (array!39502 (arr!18938 (Array (_ BitVec 32) (_ BitVec 64))) (size!19303 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39501)

(assert (=> b!680394 (= res!446779 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19303 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680395 () Bool)

(declare-datatypes ((Unit!23852 0))(
  ( (Unit!23853) )
))
(declare-fun e!387555 () Unit!23852)

(declare-fun Unit!23854 () Unit!23852)

(assert (=> b!680395 (= e!387555 Unit!23854)))

(declare-fun lt!312874 () Unit!23852)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39501 (_ BitVec 64) (_ BitVec 32)) Unit!23852)

(assert (=> b!680395 (= lt!312874 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680395 false))

(declare-fun b!680397 () Bool)

(declare-fun res!446784 () Bool)

(assert (=> b!680397 (=> (not res!446784) (not e!387553))))

(declare-datatypes ((List!13018 0))(
  ( (Nil!13015) (Cons!13014 (h!14059 (_ BitVec 64)) (t!19240 List!13018)) )
))
(declare-fun acc!681 () List!13018)

(declare-fun noDuplicate!809 (List!13018) Bool)

(assert (=> b!680397 (= res!446784 (noDuplicate!809 acc!681))))

(declare-fun b!680398 () Bool)

(declare-fun e!387557 () Bool)

(assert (=> b!680398 (= e!387553 (not e!387557))))

(declare-fun res!446791 () Bool)

(assert (=> b!680398 (=> res!446791 e!387557)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680398 (= res!446791 (not (validKeyInArray!0 (select (arr!18938 a!3626) from!3004))))))

(declare-fun lt!312873 () Unit!23852)

(assert (=> b!680398 (= lt!312873 e!387555)))

(declare-fun c!77175 () Bool)

(declare-fun arrayContainsKey!0 (array!39501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680398 (= c!77175 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680398 (arrayContainsKey!0 (array!39502 (store (arr!18938 a!3626) i!1382 k0!2843) (size!19303 a!3626)) k0!2843 from!3004)))

(declare-fun b!680399 () Bool)

(declare-fun res!446792 () Bool)

(assert (=> b!680399 (=> (not res!446792) (not e!387553))))

(assert (=> b!680399 (= res!446792 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19303 a!3626))))))

(declare-fun b!680400 () Bool)

(declare-fun e!387554 () Bool)

(declare-fun lt!312875 () List!13018)

(declare-fun contains!3540 (List!13018 (_ BitVec 64)) Bool)

(assert (=> b!680400 (= e!387554 (not (contains!3540 lt!312875 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680401 () Bool)

(declare-fun e!387552 () Bool)

(assert (=> b!680401 (= e!387556 e!387552)))

(declare-fun res!446778 () Bool)

(assert (=> b!680401 (=> (not res!446778) (not e!387552))))

(assert (=> b!680401 (= res!446778 (bvsle from!3004 i!1382))))

(declare-fun b!680402 () Bool)

(declare-fun res!446793 () Bool)

(assert (=> b!680402 (=> (not res!446793) (not e!387553))))

(assert (=> b!680402 (= res!446793 (validKeyInArray!0 k0!2843))))

(declare-fun b!680403 () Bool)

(assert (=> b!680403 (= e!387550 (contains!3540 acc!681 k0!2843))))

(declare-fun b!680404 () Bool)

(declare-fun res!446777 () Bool)

(declare-fun e!387551 () Bool)

(assert (=> b!680404 (=> res!446777 e!387551)))

(assert (=> b!680404 (= res!446777 (not (noDuplicate!809 lt!312875)))))

(declare-fun b!680405 () Bool)

(declare-fun Unit!23855 () Unit!23852)

(assert (=> b!680405 (= e!387555 Unit!23855)))

(declare-fun b!680396 () Bool)

(assert (=> b!680396 (= e!387557 e!387551)))

(declare-fun res!446782 () Bool)

(assert (=> b!680396 (=> res!446782 e!387551)))

(assert (=> b!680396 (= res!446782 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!307 (List!13018 (_ BitVec 64)) List!13018)

(assert (=> b!680396 (= lt!312875 ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004)))))

(declare-fun subseq!143 (List!13018 List!13018) Bool)

(assert (=> b!680396 (subseq!143 acc!681 acc!681)))

(declare-fun lt!312876 () Unit!23852)

(declare-fun lemmaListSubSeqRefl!0 (List!13018) Unit!23852)

(assert (=> b!680396 (= lt!312876 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun res!446786 () Bool)

(assert (=> start!60566 (=> (not res!446786) (not e!387553))))

(assert (=> start!60566 (= res!446786 (and (bvslt (size!19303 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19303 a!3626))))))

(assert (=> start!60566 e!387553))

(assert (=> start!60566 true))

(declare-fun array_inv!14821 (array!39501) Bool)

(assert (=> start!60566 (array_inv!14821 a!3626)))

(declare-fun b!680406 () Bool)

(declare-fun res!446787 () Bool)

(assert (=> b!680406 (=> (not res!446787) (not e!387553))))

(declare-fun arrayNoDuplicates!0 (array!39501 (_ BitVec 32) List!13018) Bool)

(assert (=> b!680406 (= res!446787 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680407 () Bool)

(assert (=> b!680407 (= e!387551 e!387554)))

(declare-fun res!446788 () Bool)

(assert (=> b!680407 (=> (not res!446788) (not e!387554))))

(assert (=> b!680407 (= res!446788 (not (contains!3540 lt!312875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680408 () Bool)

(declare-fun res!446794 () Bool)

(assert (=> b!680408 (=> (not res!446794) (not e!387553))))

(assert (=> b!680408 (= res!446794 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680409 () Bool)

(declare-fun res!446780 () Bool)

(assert (=> b!680409 (=> (not res!446780) (not e!387553))))

(assert (=> b!680409 (= res!446780 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13015))))

(declare-fun b!680410 () Bool)

(declare-fun res!446781 () Bool)

(assert (=> b!680410 (=> (not res!446781) (not e!387553))))

(assert (=> b!680410 (= res!446781 (not (contains!3540 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680411 () Bool)

(assert (=> b!680411 (= e!387552 (not (contains!3540 acc!681 k0!2843)))))

(declare-fun b!680412 () Bool)

(declare-fun res!446785 () Bool)

(assert (=> b!680412 (=> (not res!446785) (not e!387553))))

(assert (=> b!680412 (= res!446785 (not (contains!3540 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60566 res!446786) b!680397))

(assert (= (and b!680397 res!446784) b!680412))

(assert (= (and b!680412 res!446785) b!680410))

(assert (= (and b!680410 res!446781) b!680393))

(assert (= (and b!680393 res!446783) b!680403))

(assert (= (and b!680393 (not res!446790)) b!680401))

(assert (= (and b!680401 res!446778) b!680411))

(assert (= (and b!680393 res!446789) b!680409))

(assert (= (and b!680409 res!446780) b!680406))

(assert (= (and b!680406 res!446787) b!680399))

(assert (= (and b!680399 res!446792) b!680402))

(assert (= (and b!680402 res!446793) b!680408))

(assert (= (and b!680408 res!446794) b!680394))

(assert (= (and b!680394 res!446779) b!680398))

(assert (= (and b!680398 c!77175) b!680395))

(assert (= (and b!680398 (not c!77175)) b!680405))

(assert (= (and b!680398 (not res!446791)) b!680396))

(assert (= (and b!680396 (not res!446782)) b!680404))

(assert (= (and b!680404 (not res!446777)) b!680407))

(assert (= (and b!680407 res!446788) b!680400))

(declare-fun m!644913 () Bool)

(assert (=> b!680404 m!644913))

(declare-fun m!644915 () Bool)

(assert (=> b!680408 m!644915))

(declare-fun m!644917 () Bool)

(assert (=> b!680412 m!644917))

(declare-fun m!644919 () Bool)

(assert (=> b!680398 m!644919))

(declare-fun m!644921 () Bool)

(assert (=> b!680398 m!644921))

(declare-fun m!644923 () Bool)

(assert (=> b!680398 m!644923))

(assert (=> b!680398 m!644919))

(declare-fun m!644925 () Bool)

(assert (=> b!680398 m!644925))

(declare-fun m!644927 () Bool)

(assert (=> b!680398 m!644927))

(declare-fun m!644929 () Bool)

(assert (=> b!680409 m!644929))

(declare-fun m!644931 () Bool)

(assert (=> b!680411 m!644931))

(declare-fun m!644933 () Bool)

(assert (=> b!680402 m!644933))

(declare-fun m!644935 () Bool)

(assert (=> b!680397 m!644935))

(declare-fun m!644937 () Bool)

(assert (=> b!680395 m!644937))

(assert (=> b!680396 m!644919))

(assert (=> b!680396 m!644919))

(declare-fun m!644939 () Bool)

(assert (=> b!680396 m!644939))

(declare-fun m!644941 () Bool)

(assert (=> b!680396 m!644941))

(declare-fun m!644943 () Bool)

(assert (=> b!680396 m!644943))

(declare-fun m!644945 () Bool)

(assert (=> b!680407 m!644945))

(declare-fun m!644947 () Bool)

(assert (=> b!680406 m!644947))

(declare-fun m!644949 () Bool)

(assert (=> start!60566 m!644949))

(declare-fun m!644951 () Bool)

(assert (=> b!680410 m!644951))

(assert (=> b!680403 m!644931))

(declare-fun m!644953 () Bool)

(assert (=> b!680400 m!644953))

(check-sat (not b!680400) (not b!680407) (not b!680398) (not b!680406) (not b!680402) (not b!680397) (not b!680403) (not b!680408) (not b!680412) (not b!680395) (not b!680404) (not b!680396) (not b!680411) (not b!680410) (not b!680409) (not start!60566))
(check-sat)
(get-model)

(declare-fun d!93461 () Bool)

(assert (=> d!93461 (= (array_inv!14821 a!3626) (bvsge (size!19303 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60566 d!93461))

(declare-fun d!93463 () Bool)

(declare-fun res!446907 () Bool)

(declare-fun e!387616 () Bool)

(assert (=> d!93463 (=> res!446907 e!387616)))

(get-info :version)

(assert (=> d!93463 (= res!446907 ((_ is Nil!13015) lt!312875))))

(assert (=> d!93463 (= (noDuplicate!809 lt!312875) e!387616)))

(declare-fun b!680537 () Bool)

(declare-fun e!387617 () Bool)

(assert (=> b!680537 (= e!387616 e!387617)))

(declare-fun res!446908 () Bool)

(assert (=> b!680537 (=> (not res!446908) (not e!387617))))

(assert (=> b!680537 (= res!446908 (not (contains!3540 (t!19240 lt!312875) (h!14059 lt!312875))))))

(declare-fun b!680538 () Bool)

(assert (=> b!680538 (= e!387617 (noDuplicate!809 (t!19240 lt!312875)))))

(assert (= (and d!93463 (not res!446907)) b!680537))

(assert (= (and b!680537 res!446908) b!680538))

(declare-fun m!645039 () Bool)

(assert (=> b!680537 m!645039))

(declare-fun m!645041 () Bool)

(assert (=> b!680538 m!645041))

(assert (=> b!680404 d!93463))

(declare-fun d!93465 () Bool)

(declare-fun lt!312903 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!270 (List!13018) (InoxSet (_ BitVec 64)))

(assert (=> d!93465 (= lt!312903 (select (content!270 acc!681) k0!2843))))

(declare-fun e!387622 () Bool)

(assert (=> d!93465 (= lt!312903 e!387622)))

(declare-fun res!446913 () Bool)

(assert (=> d!93465 (=> (not res!446913) (not e!387622))))

(assert (=> d!93465 (= res!446913 ((_ is Cons!13014) acc!681))))

(assert (=> d!93465 (= (contains!3540 acc!681 k0!2843) lt!312903)))

(declare-fun b!680543 () Bool)

(declare-fun e!387623 () Bool)

(assert (=> b!680543 (= e!387622 e!387623)))

(declare-fun res!446914 () Bool)

(assert (=> b!680543 (=> res!446914 e!387623)))

(assert (=> b!680543 (= res!446914 (= (h!14059 acc!681) k0!2843))))

(declare-fun b!680544 () Bool)

(assert (=> b!680544 (= e!387623 (contains!3540 (t!19240 acc!681) k0!2843))))

(assert (= (and d!93465 res!446913) b!680543))

(assert (= (and b!680543 (not res!446914)) b!680544))

(declare-fun m!645043 () Bool)

(assert (=> d!93465 m!645043))

(declare-fun m!645045 () Bool)

(assert (=> d!93465 m!645045))

(declare-fun m!645047 () Bool)

(assert (=> b!680544 m!645047))

(assert (=> b!680403 d!93465))

(declare-fun d!93469 () Bool)

(declare-fun res!446915 () Bool)

(declare-fun e!387624 () Bool)

(assert (=> d!93469 (=> res!446915 e!387624)))

(assert (=> d!93469 (= res!446915 ((_ is Nil!13015) acc!681))))

(assert (=> d!93469 (= (noDuplicate!809 acc!681) e!387624)))

(declare-fun b!680545 () Bool)

(declare-fun e!387625 () Bool)

(assert (=> b!680545 (= e!387624 e!387625)))

(declare-fun res!446916 () Bool)

(assert (=> b!680545 (=> (not res!446916) (not e!387625))))

(assert (=> b!680545 (= res!446916 (not (contains!3540 (t!19240 acc!681) (h!14059 acc!681))))))

(declare-fun b!680546 () Bool)

(assert (=> b!680546 (= e!387625 (noDuplicate!809 (t!19240 acc!681)))))

(assert (= (and d!93469 (not res!446915)) b!680545))

(assert (= (and b!680545 res!446916) b!680546))

(declare-fun m!645049 () Bool)

(assert (=> b!680545 m!645049))

(declare-fun m!645051 () Bool)

(assert (=> b!680546 m!645051))

(assert (=> b!680397 d!93469))

(declare-fun d!93471 () Bool)

(declare-fun res!446927 () Bool)

(declare-fun e!387636 () Bool)

(assert (=> d!93471 (=> res!446927 e!387636)))

(assert (=> d!93471 (= res!446927 (= (select (arr!18938 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93471 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!387636)))

(declare-fun b!680555 () Bool)

(declare-fun e!387637 () Bool)

(assert (=> b!680555 (= e!387636 e!387637)))

(declare-fun res!446928 () Bool)

(assert (=> b!680555 (=> (not res!446928) (not e!387637))))

(assert (=> b!680555 (= res!446928 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19303 a!3626)))))

(declare-fun b!680556 () Bool)

(assert (=> b!680556 (= e!387637 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93471 (not res!446927)) b!680555))

(assert (= (and b!680555 res!446928) b!680556))

(declare-fun m!645053 () Bool)

(assert (=> d!93471 m!645053))

(declare-fun m!645055 () Bool)

(assert (=> b!680556 m!645055))

(assert (=> b!680408 d!93471))

(declare-fun d!93473 () Bool)

(declare-fun lt!312904 () Bool)

(assert (=> d!93473 (= lt!312904 (select (content!270 lt!312875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387640 () Bool)

(assert (=> d!93473 (= lt!312904 e!387640)))

(declare-fun res!446929 () Bool)

(assert (=> d!93473 (=> (not res!446929) (not e!387640))))

(assert (=> d!93473 (= res!446929 ((_ is Cons!13014) lt!312875))))

(assert (=> d!93473 (= (contains!3540 lt!312875 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312904)))

(declare-fun b!680563 () Bool)

(declare-fun e!387641 () Bool)

(assert (=> b!680563 (= e!387640 e!387641)))

(declare-fun res!446930 () Bool)

(assert (=> b!680563 (=> res!446930 e!387641)))

(assert (=> b!680563 (= res!446930 (= (h!14059 lt!312875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680564 () Bool)

(assert (=> b!680564 (= e!387641 (contains!3540 (t!19240 lt!312875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93473 res!446929) b!680563))

(assert (= (and b!680563 (not res!446930)) b!680564))

(declare-fun m!645057 () Bool)

(assert (=> d!93473 m!645057))

(declare-fun m!645059 () Bool)

(assert (=> d!93473 m!645059))

(declare-fun m!645061 () Bool)

(assert (=> b!680564 m!645061))

(assert (=> b!680407 d!93473))

(declare-fun d!93475 () Bool)

(assert (=> d!93475 (= ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004)) (Cons!13014 (select (arr!18938 a!3626) from!3004) acc!681))))

(assert (=> b!680396 d!93475))

(declare-fun b!680578 () Bool)

(declare-fun e!387655 () Bool)

(declare-fun e!387656 () Bool)

(assert (=> b!680578 (= e!387655 e!387656)))

(declare-fun res!446944 () Bool)

(assert (=> b!680578 (=> (not res!446944) (not e!387656))))

(assert (=> b!680578 (= res!446944 ((_ is Cons!13014) acc!681))))

(declare-fun b!680580 () Bool)

(declare-fun e!387654 () Bool)

(assert (=> b!680580 (= e!387654 (subseq!143 (t!19240 acc!681) (t!19240 acc!681)))))

(declare-fun b!680579 () Bool)

(declare-fun e!387657 () Bool)

(assert (=> b!680579 (= e!387656 e!387657)))

(declare-fun res!446942 () Bool)

(assert (=> b!680579 (=> res!446942 e!387657)))

(assert (=> b!680579 (= res!446942 e!387654)))

(declare-fun res!446943 () Bool)

(assert (=> b!680579 (=> (not res!446943) (not e!387654))))

(assert (=> b!680579 (= res!446943 (= (h!14059 acc!681) (h!14059 acc!681)))))

(declare-fun b!680581 () Bool)

(assert (=> b!680581 (= e!387657 (subseq!143 acc!681 (t!19240 acc!681)))))

(declare-fun d!93477 () Bool)

(declare-fun res!446945 () Bool)

(assert (=> d!93477 (=> res!446945 e!387655)))

(assert (=> d!93477 (= res!446945 ((_ is Nil!13015) acc!681))))

(assert (=> d!93477 (= (subseq!143 acc!681 acc!681) e!387655)))

(assert (= (and d!93477 (not res!446945)) b!680578))

(assert (= (and b!680578 res!446944) b!680579))

(assert (= (and b!680579 res!446943) b!680580))

(assert (= (and b!680579 (not res!446942)) b!680581))

(declare-fun m!645071 () Bool)

(assert (=> b!680580 m!645071))

(declare-fun m!645073 () Bool)

(assert (=> b!680581 m!645073))

(assert (=> b!680396 d!93477))

(declare-fun d!93481 () Bool)

(assert (=> d!93481 (subseq!143 acc!681 acc!681)))

(declare-fun lt!312910 () Unit!23852)

(declare-fun choose!36 (List!13018) Unit!23852)

(assert (=> d!93481 (= lt!312910 (choose!36 acc!681))))

(assert (=> d!93481 (= (lemmaListSubSeqRefl!0 acc!681) lt!312910)))

(declare-fun bs!19957 () Bool)

(assert (= bs!19957 d!93481))

(assert (=> bs!19957 m!644941))

(declare-fun m!645081 () Bool)

(assert (=> bs!19957 m!645081))

(assert (=> b!680396 d!93481))

(declare-fun d!93487 () Bool)

(assert (=> d!93487 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!312913 () Unit!23852)

(declare-fun choose!13 (array!39501 (_ BitVec 64) (_ BitVec 32)) Unit!23852)

(assert (=> d!93487 (= lt!312913 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93487 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93487 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!312913)))

(declare-fun bs!19958 () Bool)

(assert (= bs!19958 d!93487))

(assert (=> bs!19958 m!644915))

(declare-fun m!645083 () Bool)

(assert (=> bs!19958 m!645083))

(assert (=> b!680395 d!93487))

(declare-fun d!93491 () Bool)

(declare-fun res!446975 () Bool)

(declare-fun e!387690 () Bool)

(assert (=> d!93491 (=> res!446975 e!387690)))

(assert (=> d!93491 (= res!446975 (bvsge from!3004 (size!19303 a!3626)))))

(assert (=> d!93491 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387690)))

(declare-fun c!77188 () Bool)

(declare-fun bm!33926 () Bool)

(declare-fun call!33929 () Bool)

(assert (=> bm!33926 (= call!33929 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77188 (Cons!13014 (select (arr!18938 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!680617 () Bool)

(declare-fun e!387692 () Bool)

(assert (=> b!680617 (= e!387692 call!33929)))

(declare-fun b!680618 () Bool)

(declare-fun e!387691 () Bool)

(assert (=> b!680618 (= e!387690 e!387691)))

(declare-fun res!446977 () Bool)

(assert (=> b!680618 (=> (not res!446977) (not e!387691))))

(declare-fun e!387693 () Bool)

(assert (=> b!680618 (= res!446977 (not e!387693))))

(declare-fun res!446976 () Bool)

(assert (=> b!680618 (=> (not res!446976) (not e!387693))))

(assert (=> b!680618 (= res!446976 (validKeyInArray!0 (select (arr!18938 a!3626) from!3004)))))

(declare-fun b!680619 () Bool)

(assert (=> b!680619 (= e!387693 (contains!3540 acc!681 (select (arr!18938 a!3626) from!3004)))))

(declare-fun b!680620 () Bool)

(assert (=> b!680620 (= e!387692 call!33929)))

(declare-fun b!680621 () Bool)

(assert (=> b!680621 (= e!387691 e!387692)))

(assert (=> b!680621 (= c!77188 (validKeyInArray!0 (select (arr!18938 a!3626) from!3004)))))

(assert (= (and d!93491 (not res!446975)) b!680618))

(assert (= (and b!680618 res!446976) b!680619))

(assert (= (and b!680618 res!446977) b!680621))

(assert (= (and b!680621 c!77188) b!680620))

(assert (= (and b!680621 (not c!77188)) b!680617))

(assert (= (or b!680620 b!680617) bm!33926))

(assert (=> bm!33926 m!644919))

(declare-fun m!645111 () Bool)

(assert (=> bm!33926 m!645111))

(assert (=> b!680618 m!644919))

(assert (=> b!680618 m!644919))

(assert (=> b!680618 m!644925))

(assert (=> b!680619 m!644919))

(assert (=> b!680619 m!644919))

(declare-fun m!645113 () Bool)

(assert (=> b!680619 m!645113))

(assert (=> b!680621 m!644919))

(assert (=> b!680621 m!644919))

(assert (=> b!680621 m!644925))

(assert (=> b!680406 d!93491))

(declare-fun d!93509 () Bool)

(declare-fun lt!312921 () Bool)

(assert (=> d!93509 (= lt!312921 (select (content!270 lt!312875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387697 () Bool)

(assert (=> d!93509 (= lt!312921 e!387697)))

(declare-fun res!446980 () Bool)

(assert (=> d!93509 (=> (not res!446980) (not e!387697))))

(assert (=> d!93509 (= res!446980 ((_ is Cons!13014) lt!312875))))

(assert (=> d!93509 (= (contains!3540 lt!312875 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312921)))

(declare-fun b!680624 () Bool)

(declare-fun e!387699 () Bool)

(assert (=> b!680624 (= e!387697 e!387699)))

(declare-fun res!446983 () Bool)

(assert (=> b!680624 (=> res!446983 e!387699)))

(assert (=> b!680624 (= res!446983 (= (h!14059 lt!312875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680625 () Bool)

(assert (=> b!680625 (= e!387699 (contains!3540 (t!19240 lt!312875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93509 res!446980) b!680624))

(assert (= (and b!680624 (not res!446983)) b!680625))

(assert (=> d!93509 m!645057))

(declare-fun m!645115 () Bool)

(assert (=> d!93509 m!645115))

(declare-fun m!645117 () Bool)

(assert (=> b!680625 m!645117))

(assert (=> b!680400 d!93509))

(declare-fun d!93511 () Bool)

(declare-fun lt!312922 () Bool)

(assert (=> d!93511 (= lt!312922 (select (content!270 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387704 () Bool)

(assert (=> d!93511 (= lt!312922 e!387704)))

(declare-fun res!446988 () Bool)

(assert (=> d!93511 (=> (not res!446988) (not e!387704))))

(assert (=> d!93511 (= res!446988 ((_ is Cons!13014) acc!681))))

(assert (=> d!93511 (= (contains!3540 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312922)))

(declare-fun b!680630 () Bool)

(declare-fun e!387705 () Bool)

(assert (=> b!680630 (= e!387704 e!387705)))

(declare-fun res!446989 () Bool)

(assert (=> b!680630 (=> res!446989 e!387705)))

(assert (=> b!680630 (= res!446989 (= (h!14059 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680631 () Bool)

(assert (=> b!680631 (= e!387705 (contains!3540 (t!19240 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93511 res!446988) b!680630))

(assert (= (and b!680630 (not res!446989)) b!680631))

(assert (=> d!93511 m!645043))

(declare-fun m!645119 () Bool)

(assert (=> d!93511 m!645119))

(declare-fun m!645121 () Bool)

(assert (=> b!680631 m!645121))

(assert (=> b!680410 d!93511))

(declare-fun d!93513 () Bool)

(declare-fun res!446996 () Bool)

(declare-fun e!387712 () Bool)

(assert (=> d!93513 (=> res!446996 e!387712)))

(assert (=> d!93513 (= res!446996 (bvsge #b00000000000000000000000000000000 (size!19303 a!3626)))))

(assert (=> d!93513 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13015) e!387712)))

(declare-fun bm!33927 () Bool)

(declare-fun call!33930 () Bool)

(declare-fun c!77189 () Bool)

(assert (=> bm!33927 (= call!33930 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77189 (Cons!13014 (select (arr!18938 a!3626) #b00000000000000000000000000000000) Nil!13015) Nil!13015)))))

(declare-fun b!680640 () Bool)

(declare-fun e!387714 () Bool)

(assert (=> b!680640 (= e!387714 call!33930)))

(declare-fun b!680641 () Bool)

(declare-fun e!387713 () Bool)

(assert (=> b!680641 (= e!387712 e!387713)))

(declare-fun res!446998 () Bool)

(assert (=> b!680641 (=> (not res!446998) (not e!387713))))

(declare-fun e!387715 () Bool)

(assert (=> b!680641 (= res!446998 (not e!387715))))

(declare-fun res!446997 () Bool)

(assert (=> b!680641 (=> (not res!446997) (not e!387715))))

(assert (=> b!680641 (= res!446997 (validKeyInArray!0 (select (arr!18938 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680642 () Bool)

(assert (=> b!680642 (= e!387715 (contains!3540 Nil!13015 (select (arr!18938 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680643 () Bool)

(assert (=> b!680643 (= e!387714 call!33930)))

(declare-fun b!680644 () Bool)

(assert (=> b!680644 (= e!387713 e!387714)))

(assert (=> b!680644 (= c!77189 (validKeyInArray!0 (select (arr!18938 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93513 (not res!446996)) b!680641))

(assert (= (and b!680641 res!446997) b!680642))

(assert (= (and b!680641 res!446998) b!680644))

(assert (= (and b!680644 c!77189) b!680643))

(assert (= (and b!680644 (not c!77189)) b!680640))

(assert (= (or b!680643 b!680640) bm!33927))

(assert (=> bm!33927 m!645053))

(declare-fun m!645123 () Bool)

(assert (=> bm!33927 m!645123))

(assert (=> b!680641 m!645053))

(assert (=> b!680641 m!645053))

(declare-fun m!645125 () Bool)

(assert (=> b!680641 m!645125))

(assert (=> b!680642 m!645053))

(assert (=> b!680642 m!645053))

(declare-fun m!645127 () Bool)

(assert (=> b!680642 m!645127))

(assert (=> b!680644 m!645053))

(assert (=> b!680644 m!645053))

(assert (=> b!680644 m!645125))

(assert (=> b!680409 d!93513))

(declare-fun d!93515 () Bool)

(assert (=> d!93515 (= (validKeyInArray!0 (select (arr!18938 a!3626) from!3004)) (and (not (= (select (arr!18938 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18938 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680398 d!93515))

(declare-fun d!93521 () Bool)

(declare-fun res!447001 () Bool)

(declare-fun e!387718 () Bool)

(assert (=> d!93521 (=> res!447001 e!387718)))

(assert (=> d!93521 (= res!447001 (= (select (arr!18938 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93521 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387718)))

(declare-fun b!680647 () Bool)

(declare-fun e!387719 () Bool)

(assert (=> b!680647 (= e!387718 e!387719)))

(declare-fun res!447002 () Bool)

(assert (=> b!680647 (=> (not res!447002) (not e!387719))))

(assert (=> b!680647 (= res!447002 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19303 a!3626)))))

(declare-fun b!680648 () Bool)

(assert (=> b!680648 (= e!387719 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93521 (not res!447001)) b!680647))

(assert (= (and b!680647 res!447002) b!680648))

(declare-fun m!645133 () Bool)

(assert (=> d!93521 m!645133))

(declare-fun m!645135 () Bool)

(assert (=> b!680648 m!645135))

(assert (=> b!680398 d!93521))

(declare-fun d!93525 () Bool)

(declare-fun res!447003 () Bool)

(declare-fun e!387720 () Bool)

(assert (=> d!93525 (=> res!447003 e!387720)))

(assert (=> d!93525 (= res!447003 (= (select (arr!18938 (array!39502 (store (arr!18938 a!3626) i!1382 k0!2843) (size!19303 a!3626))) from!3004) k0!2843))))

(assert (=> d!93525 (= (arrayContainsKey!0 (array!39502 (store (arr!18938 a!3626) i!1382 k0!2843) (size!19303 a!3626)) k0!2843 from!3004) e!387720)))

(declare-fun b!680649 () Bool)

(declare-fun e!387721 () Bool)

(assert (=> b!680649 (= e!387720 e!387721)))

(declare-fun res!447004 () Bool)

(assert (=> b!680649 (=> (not res!447004) (not e!387721))))

(assert (=> b!680649 (= res!447004 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19303 (array!39502 (store (arr!18938 a!3626) i!1382 k0!2843) (size!19303 a!3626)))))))

(declare-fun b!680650 () Bool)

(assert (=> b!680650 (= e!387721 (arrayContainsKey!0 (array!39502 (store (arr!18938 a!3626) i!1382 k0!2843) (size!19303 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93525 (not res!447003)) b!680649))

(assert (= (and b!680649 res!447004) b!680650))

(declare-fun m!645137 () Bool)

(assert (=> d!93525 m!645137))

(declare-fun m!645139 () Bool)

(assert (=> b!680650 m!645139))

(assert (=> b!680398 d!93525))

(declare-fun d!93527 () Bool)

(assert (=> d!93527 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680402 d!93527))

(declare-fun d!93529 () Bool)

(declare-fun lt!312923 () Bool)

(assert (=> d!93529 (= lt!312923 (select (content!270 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387726 () Bool)

(assert (=> d!93529 (= lt!312923 e!387726)))

(declare-fun res!447009 () Bool)

(assert (=> d!93529 (=> (not res!447009) (not e!387726))))

(assert (=> d!93529 (= res!447009 ((_ is Cons!13014) acc!681))))

(assert (=> d!93529 (= (contains!3540 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312923)))

(declare-fun b!680655 () Bool)

(declare-fun e!387727 () Bool)

(assert (=> b!680655 (= e!387726 e!387727)))

(declare-fun res!447010 () Bool)

(assert (=> b!680655 (=> res!447010 e!387727)))

(assert (=> b!680655 (= res!447010 (= (h!14059 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680656 () Bool)

(assert (=> b!680656 (= e!387727 (contains!3540 (t!19240 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93529 res!447009) b!680655))

(assert (= (and b!680655 (not res!447010)) b!680656))

(assert (=> d!93529 m!645043))

(declare-fun m!645141 () Bool)

(assert (=> d!93529 m!645141))

(declare-fun m!645145 () Bool)

(assert (=> b!680656 m!645145))

(assert (=> b!680412 d!93529))

(assert (=> b!680411 d!93465))

(check-sat (not bm!33926) (not d!93481) (not b!680644) (not d!93529) (not b!680538) (not b!680580) (not b!680564) (not d!93465) (not b!680642) (not b!680556) (not d!93509) (not b!680618) (not b!680656) (not b!680544) (not d!93511) (not b!680631) (not b!680545) (not b!680650) (not b!680625) (not d!93473) (not b!680619) (not b!680648) (not b!680581) (not b!680537) (not bm!33927) (not b!680621) (not d!93487) (not b!680546) (not b!680641))
(check-sat)
