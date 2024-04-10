; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60718 () Bool)

(assert start!60718)

(declare-fun b!681705 () Bool)

(declare-fun e!388359 () Bool)

(declare-fun e!388362 () Bool)

(assert (=> b!681705 (= e!388359 e!388362)))

(declare-fun res!447839 () Bool)

(assert (=> b!681705 (=> (not res!447839) (not e!388362))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681705 (= res!447839 (bvsle from!3004 i!1382))))

(declare-fun b!681706 () Bool)

(declare-fun e!388361 () Bool)

(declare-fun e!388358 () Bool)

(assert (=> b!681706 (= e!388361 e!388358)))

(declare-fun res!447832 () Bool)

(assert (=> b!681706 (=> res!447832 e!388358)))

(assert (=> b!681706 (= res!447832 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39528 0))(
  ( (array!39529 (arr!18949 (Array (_ BitVec 32) (_ BitVec 64))) (size!19313 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39528)

(declare-datatypes ((List!12990 0))(
  ( (Nil!12987) (Cons!12986 (h!14031 (_ BitVec 64)) (t!19227 List!12990)) )
))
(declare-fun acc!681 () List!12990)

(declare-fun lt!313342 () List!12990)

(declare-fun $colon$colon!318 (List!12990 (_ BitVec 64)) List!12990)

(assert (=> b!681706 (= lt!313342 ($colon$colon!318 acc!681 (select (arr!18949 a!3626) from!3004)))))

(declare-fun subseq!153 (List!12990 List!12990) Bool)

(assert (=> b!681706 (subseq!153 acc!681 acc!681)))

(declare-datatypes ((Unit!23914 0))(
  ( (Unit!23915) )
))
(declare-fun lt!313341 () Unit!23914)

(declare-fun lemmaListSubSeqRefl!0 (List!12990) Unit!23914)

(assert (=> b!681706 (= lt!313341 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681707 () Bool)

(declare-fun e!388360 () Unit!23914)

(declare-fun Unit!23916 () Unit!23914)

(assert (=> b!681707 (= e!388360 Unit!23916)))

(declare-fun b!681708 () Bool)

(declare-fun res!447838 () Bool)

(declare-fun e!388363 () Bool)

(assert (=> b!681708 (=> (not res!447838) (not e!388363))))

(declare-fun contains!3567 (List!12990 (_ BitVec 64)) Bool)

(assert (=> b!681708 (= res!447838 (not (contains!3567 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681709 () Bool)

(declare-fun res!447821 () Bool)

(assert (=> b!681709 (=> (not res!447821) (not e!388363))))

(assert (=> b!681709 (= res!447821 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19313 a!3626))))))

(declare-fun b!681710 () Bool)

(declare-fun res!447835 () Bool)

(assert (=> b!681710 (=> (not res!447835) (not e!388363))))

(assert (=> b!681710 (= res!447835 e!388359)))

(declare-fun res!447831 () Bool)

(assert (=> b!681710 (=> res!447831 e!388359)))

(declare-fun e!388364 () Bool)

(assert (=> b!681710 (= res!447831 e!388364)))

(declare-fun res!447828 () Bool)

(assert (=> b!681710 (=> (not res!447828) (not e!388364))))

(assert (=> b!681710 (= res!447828 (bvsgt from!3004 i!1382))))

(declare-fun b!681711 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39528 (_ BitVec 32) List!12990) Bool)

(assert (=> b!681711 (= e!388358 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313342))))

(declare-fun lt!313343 () Unit!23914)

(declare-fun noDuplicateSubseq!27 (List!12990 List!12990) Unit!23914)

(assert (=> b!681711 (= lt!313343 (noDuplicateSubseq!27 acc!681 lt!313342))))

(declare-fun b!681712 () Bool)

(declare-fun res!447833 () Bool)

(assert (=> b!681712 (=> res!447833 e!388358)))

(assert (=> b!681712 (= res!447833 (contains!3567 lt!313342 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681713 () Bool)

(declare-fun Unit!23917 () Unit!23914)

(assert (=> b!681713 (= e!388360 Unit!23917)))

(declare-fun lt!313344 () Unit!23914)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39528 (_ BitVec 64) (_ BitVec 32)) Unit!23914)

(assert (=> b!681713 (= lt!313344 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681713 false))

(declare-fun b!681714 () Bool)

(assert (=> b!681714 (= e!388362 (not (contains!3567 acc!681 k0!2843)))))

(declare-fun b!681715 () Bool)

(declare-fun res!447829 () Bool)

(assert (=> b!681715 (=> res!447829 e!388358)))

(assert (=> b!681715 (= res!447829 (not (subseq!153 acc!681 lt!313342)))))

(declare-fun res!447830 () Bool)

(assert (=> start!60718 (=> (not res!447830) (not e!388363))))

(assert (=> start!60718 (= res!447830 (and (bvslt (size!19313 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19313 a!3626))))))

(assert (=> start!60718 e!388363))

(assert (=> start!60718 true))

(declare-fun array_inv!14745 (array!39528) Bool)

(assert (=> start!60718 (array_inv!14745 a!3626)))

(declare-fun b!681704 () Bool)

(declare-fun res!447837 () Bool)

(assert (=> b!681704 (=> (not res!447837) (not e!388363))))

(assert (=> b!681704 (= res!447837 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681716 () Bool)

(declare-fun res!447824 () Bool)

(assert (=> b!681716 (=> (not res!447824) (not e!388363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681716 (= res!447824 (validKeyInArray!0 k0!2843))))

(declare-fun b!681717 () Bool)

(assert (=> b!681717 (= e!388364 (contains!3567 acc!681 k0!2843))))

(declare-fun b!681718 () Bool)

(declare-fun res!447825 () Bool)

(assert (=> b!681718 (=> res!447825 e!388358)))

(declare-fun noDuplicate!814 (List!12990) Bool)

(assert (=> b!681718 (= res!447825 (not (noDuplicate!814 lt!313342)))))

(declare-fun b!681719 () Bool)

(declare-fun res!447836 () Bool)

(assert (=> b!681719 (=> res!447836 e!388358)))

(assert (=> b!681719 (= res!447836 (contains!3567 lt!313342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681720 () Bool)

(declare-fun res!447834 () Bool)

(assert (=> b!681720 (=> (not res!447834) (not e!388363))))

(declare-fun arrayContainsKey!0 (array!39528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681720 (= res!447834 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681721 () Bool)

(declare-fun res!447826 () Bool)

(assert (=> b!681721 (=> (not res!447826) (not e!388363))))

(assert (=> b!681721 (= res!447826 (not (contains!3567 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681722 () Bool)

(declare-fun res!447820 () Bool)

(assert (=> b!681722 (=> (not res!447820) (not e!388363))))

(assert (=> b!681722 (= res!447820 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19313 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681723 () Bool)

(assert (=> b!681723 (= e!388363 (not e!388361))))

(declare-fun res!447827 () Bool)

(assert (=> b!681723 (=> res!447827 e!388361)))

(assert (=> b!681723 (= res!447827 (not (validKeyInArray!0 (select (arr!18949 a!3626) from!3004))))))

(declare-fun lt!313345 () Unit!23914)

(assert (=> b!681723 (= lt!313345 e!388360)))

(declare-fun c!77309 () Bool)

(assert (=> b!681723 (= c!77309 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681723 (arrayContainsKey!0 (array!39529 (store (arr!18949 a!3626) i!1382 k0!2843) (size!19313 a!3626)) k0!2843 from!3004)))

(declare-fun b!681724 () Bool)

(declare-fun res!447822 () Bool)

(assert (=> b!681724 (=> (not res!447822) (not e!388363))))

(assert (=> b!681724 (= res!447822 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12987))))

(declare-fun b!681725 () Bool)

(declare-fun res!447823 () Bool)

(assert (=> b!681725 (=> (not res!447823) (not e!388363))))

(assert (=> b!681725 (= res!447823 (noDuplicate!814 acc!681))))

(assert (= (and start!60718 res!447830) b!681725))

(assert (= (and b!681725 res!447823) b!681708))

(assert (= (and b!681708 res!447838) b!681721))

(assert (= (and b!681721 res!447826) b!681710))

(assert (= (and b!681710 res!447828) b!681717))

(assert (= (and b!681710 (not res!447831)) b!681705))

(assert (= (and b!681705 res!447839) b!681714))

(assert (= (and b!681710 res!447835) b!681724))

(assert (= (and b!681724 res!447822) b!681704))

(assert (= (and b!681704 res!447837) b!681709))

(assert (= (and b!681709 res!447821) b!681716))

(assert (= (and b!681716 res!447824) b!681720))

(assert (= (and b!681720 res!447834) b!681722))

(assert (= (and b!681722 res!447820) b!681723))

(assert (= (and b!681723 c!77309) b!681713))

(assert (= (and b!681723 (not c!77309)) b!681707))

(assert (= (and b!681723 (not res!447827)) b!681706))

(assert (= (and b!681706 (not res!447832)) b!681718))

(assert (= (and b!681718 (not res!447825)) b!681719))

(assert (= (and b!681719 (not res!447836)) b!681712))

(assert (= (and b!681712 (not res!447833)) b!681715))

(assert (= (and b!681715 (not res!447829)) b!681711))

(declare-fun m!646511 () Bool)

(assert (=> b!681724 m!646511))

(declare-fun m!646513 () Bool)

(assert (=> b!681723 m!646513))

(declare-fun m!646515 () Bool)

(assert (=> b!681723 m!646515))

(declare-fun m!646517 () Bool)

(assert (=> b!681723 m!646517))

(assert (=> b!681723 m!646513))

(declare-fun m!646519 () Bool)

(assert (=> b!681723 m!646519))

(declare-fun m!646521 () Bool)

(assert (=> b!681723 m!646521))

(declare-fun m!646523 () Bool)

(assert (=> b!681708 m!646523))

(declare-fun m!646525 () Bool)

(assert (=> b!681716 m!646525))

(declare-fun m!646527 () Bool)

(assert (=> b!681719 m!646527))

(declare-fun m!646529 () Bool)

(assert (=> b!681720 m!646529))

(declare-fun m!646531 () Bool)

(assert (=> b!681715 m!646531))

(declare-fun m!646533 () Bool)

(assert (=> b!681711 m!646533))

(declare-fun m!646535 () Bool)

(assert (=> b!681711 m!646535))

(declare-fun m!646537 () Bool)

(assert (=> start!60718 m!646537))

(declare-fun m!646539 () Bool)

(assert (=> b!681717 m!646539))

(declare-fun m!646541 () Bool)

(assert (=> b!681718 m!646541))

(assert (=> b!681714 m!646539))

(assert (=> b!681706 m!646513))

(assert (=> b!681706 m!646513))

(declare-fun m!646543 () Bool)

(assert (=> b!681706 m!646543))

(declare-fun m!646545 () Bool)

(assert (=> b!681706 m!646545))

(declare-fun m!646547 () Bool)

(assert (=> b!681706 m!646547))

(declare-fun m!646549 () Bool)

(assert (=> b!681721 m!646549))

(declare-fun m!646551 () Bool)

(assert (=> b!681712 m!646551))

(declare-fun m!646553 () Bool)

(assert (=> b!681713 m!646553))

(declare-fun m!646555 () Bool)

(assert (=> b!681704 m!646555))

(declare-fun m!646557 () Bool)

(assert (=> b!681725 m!646557))

(check-sat (not b!681725) (not b!681720) (not b!681704) (not b!681711) (not start!60718) (not b!681719) (not b!681708) (not b!681712) (not b!681723) (not b!681724) (not b!681713) (not b!681706) (not b!681714) (not b!681717) (not b!681715) (not b!681716) (not b!681721) (not b!681718))
(check-sat)
(get-model)

(declare-fun d!93917 () Bool)

(assert (=> d!93917 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313363 () Unit!23914)

(declare-fun choose!13 (array!39528 (_ BitVec 64) (_ BitVec 32)) Unit!23914)

(assert (=> d!93917 (= lt!313363 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93917 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93917 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313363)))

(declare-fun bs!20008 () Bool)

(assert (= bs!20008 d!93917))

(assert (=> bs!20008 m!646529))

(declare-fun m!646607 () Bool)

(assert (=> bs!20008 m!646607))

(assert (=> b!681713 d!93917))

(declare-fun d!93919 () Bool)

(declare-fun res!447906 () Bool)

(declare-fun e!388398 () Bool)

(assert (=> d!93919 (=> res!447906 e!388398)))

(assert (=> d!93919 (= res!447906 (bvsge #b00000000000000000000000000000000 (size!19313 a!3626)))))

(assert (=> d!93919 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12987) e!388398)))

(declare-fun b!681802 () Bool)

(declare-fun e!388401 () Bool)

(assert (=> b!681802 (= e!388398 e!388401)))

(declare-fun res!447908 () Bool)

(assert (=> b!681802 (=> (not res!447908) (not e!388401))))

(declare-fun e!388399 () Bool)

(assert (=> b!681802 (= res!447908 (not e!388399))))

(declare-fun res!447907 () Bool)

(assert (=> b!681802 (=> (not res!447907) (not e!388399))))

(assert (=> b!681802 (= res!447907 (validKeyInArray!0 (select (arr!18949 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681803 () Bool)

(declare-fun e!388400 () Bool)

(declare-fun call!33977 () Bool)

(assert (=> b!681803 (= e!388400 call!33977)))

(declare-fun bm!33974 () Bool)

(declare-fun c!77315 () Bool)

(assert (=> bm!33974 (= call!33977 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77315 (Cons!12986 (select (arr!18949 a!3626) #b00000000000000000000000000000000) Nil!12987) Nil!12987)))))

(declare-fun b!681804 () Bool)

(assert (=> b!681804 (= e!388401 e!388400)))

(assert (=> b!681804 (= c!77315 (validKeyInArray!0 (select (arr!18949 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681805 () Bool)

(assert (=> b!681805 (= e!388399 (contains!3567 Nil!12987 (select (arr!18949 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681806 () Bool)

(assert (=> b!681806 (= e!388400 call!33977)))

(assert (= (and d!93919 (not res!447906)) b!681802))

(assert (= (and b!681802 res!447907) b!681805))

(assert (= (and b!681802 res!447908) b!681804))

(assert (= (and b!681804 c!77315) b!681803))

(assert (= (and b!681804 (not c!77315)) b!681806))

(assert (= (or b!681803 b!681806) bm!33974))

(declare-fun m!646609 () Bool)

(assert (=> b!681802 m!646609))

(assert (=> b!681802 m!646609))

(declare-fun m!646611 () Bool)

(assert (=> b!681802 m!646611))

(assert (=> bm!33974 m!646609))

(declare-fun m!646613 () Bool)

(assert (=> bm!33974 m!646613))

(assert (=> b!681804 m!646609))

(assert (=> b!681804 m!646609))

(assert (=> b!681804 m!646611))

(assert (=> b!681805 m!646609))

(assert (=> b!681805 m!646609))

(declare-fun m!646615 () Bool)

(assert (=> b!681805 m!646615))

(assert (=> b!681724 d!93919))

(declare-fun d!93927 () Bool)

(declare-fun lt!313369 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!277 (List!12990) (InoxSet (_ BitVec 64)))

(assert (=> d!93927 (= lt!313369 (select (content!277 acc!681) k0!2843))))

(declare-fun e!388421 () Bool)

(assert (=> d!93927 (= lt!313369 e!388421)))

(declare-fun res!447928 () Bool)

(assert (=> d!93927 (=> (not res!447928) (not e!388421))))

(get-info :version)

(assert (=> d!93927 (= res!447928 ((_ is Cons!12986) acc!681))))

(assert (=> d!93927 (= (contains!3567 acc!681 k0!2843) lt!313369)))

(declare-fun b!681825 () Bool)

(declare-fun e!388420 () Bool)

(assert (=> b!681825 (= e!388421 e!388420)))

(declare-fun res!447927 () Bool)

(assert (=> b!681825 (=> res!447927 e!388420)))

(assert (=> b!681825 (= res!447927 (= (h!14031 acc!681) k0!2843))))

(declare-fun b!681826 () Bool)

(assert (=> b!681826 (= e!388420 (contains!3567 (t!19227 acc!681) k0!2843))))

(assert (= (and d!93927 res!447928) b!681825))

(assert (= (and b!681825 (not res!447927)) b!681826))

(declare-fun m!646631 () Bool)

(assert (=> d!93927 m!646631))

(declare-fun m!646633 () Bool)

(assert (=> d!93927 m!646633))

(declare-fun m!646635 () Bool)

(assert (=> b!681826 m!646635))

(assert (=> b!681714 d!93927))

(declare-fun d!93935 () Bool)

(declare-fun res!447943 () Bool)

(declare-fun e!388436 () Bool)

(assert (=> d!93935 (=> res!447943 e!388436)))

(assert (=> d!93935 (= res!447943 ((_ is Nil!12987) acc!681))))

(assert (=> d!93935 (= (noDuplicate!814 acc!681) e!388436)))

(declare-fun b!681841 () Bool)

(declare-fun e!388437 () Bool)

(assert (=> b!681841 (= e!388436 e!388437)))

(declare-fun res!447944 () Bool)

(assert (=> b!681841 (=> (not res!447944) (not e!388437))))

(assert (=> b!681841 (= res!447944 (not (contains!3567 (t!19227 acc!681) (h!14031 acc!681))))))

(declare-fun b!681842 () Bool)

(assert (=> b!681842 (= e!388437 (noDuplicate!814 (t!19227 acc!681)))))

(assert (= (and d!93935 (not res!447943)) b!681841))

(assert (= (and b!681841 res!447944) b!681842))

(declare-fun m!646645 () Bool)

(assert (=> b!681841 m!646645))

(declare-fun m!646647 () Bool)

(assert (=> b!681842 m!646647))

(assert (=> b!681725 d!93935))

(declare-fun d!93943 () Bool)

(declare-fun res!447949 () Bool)

(declare-fun e!388442 () Bool)

(assert (=> d!93943 (=> res!447949 e!388442)))

(assert (=> d!93943 (= res!447949 (bvsge from!3004 (size!19313 a!3626)))))

(assert (=> d!93943 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388442)))

(declare-fun b!681847 () Bool)

(declare-fun e!388445 () Bool)

(assert (=> b!681847 (= e!388442 e!388445)))

(declare-fun res!447951 () Bool)

(assert (=> b!681847 (=> (not res!447951) (not e!388445))))

(declare-fun e!388443 () Bool)

(assert (=> b!681847 (= res!447951 (not e!388443))))

(declare-fun res!447950 () Bool)

(assert (=> b!681847 (=> (not res!447950) (not e!388443))))

(assert (=> b!681847 (= res!447950 (validKeyInArray!0 (select (arr!18949 a!3626) from!3004)))))

(declare-fun b!681848 () Bool)

(declare-fun e!388444 () Bool)

(declare-fun call!33978 () Bool)

(assert (=> b!681848 (= e!388444 call!33978)))

(declare-fun c!77316 () Bool)

(declare-fun bm!33975 () Bool)

(assert (=> bm!33975 (= call!33978 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77316 (Cons!12986 (select (arr!18949 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681849 () Bool)

(assert (=> b!681849 (= e!388445 e!388444)))

(assert (=> b!681849 (= c!77316 (validKeyInArray!0 (select (arr!18949 a!3626) from!3004)))))

(declare-fun b!681850 () Bool)

(assert (=> b!681850 (= e!388443 (contains!3567 acc!681 (select (arr!18949 a!3626) from!3004)))))

(declare-fun b!681851 () Bool)

(assert (=> b!681851 (= e!388444 call!33978)))

(assert (= (and d!93943 (not res!447949)) b!681847))

(assert (= (and b!681847 res!447950) b!681850))

(assert (= (and b!681847 res!447951) b!681849))

(assert (= (and b!681849 c!77316) b!681848))

(assert (= (and b!681849 (not c!77316)) b!681851))

(assert (= (or b!681848 b!681851) bm!33975))

(assert (=> b!681847 m!646513))

(assert (=> b!681847 m!646513))

(assert (=> b!681847 m!646519))

(assert (=> bm!33975 m!646513))

(declare-fun m!646653 () Bool)

(assert (=> bm!33975 m!646653))

(assert (=> b!681849 m!646513))

(assert (=> b!681849 m!646513))

(assert (=> b!681849 m!646519))

(assert (=> b!681850 m!646513))

(assert (=> b!681850 m!646513))

(declare-fun m!646655 () Bool)

(assert (=> b!681850 m!646655))

(assert (=> b!681704 d!93943))

(declare-fun b!681882 () Bool)

(declare-fun e!388475 () Bool)

(declare-fun e!388477 () Bool)

(assert (=> b!681882 (= e!388475 e!388477)))

(declare-fun res!447979 () Bool)

(assert (=> b!681882 (=> (not res!447979) (not e!388477))))

(assert (=> b!681882 (= res!447979 ((_ is Cons!12986) lt!313342))))

(declare-fun b!681884 () Bool)

(declare-fun e!388474 () Bool)

(assert (=> b!681884 (= e!388474 (subseq!153 (t!19227 acc!681) (t!19227 lt!313342)))))

(declare-fun d!93949 () Bool)

(declare-fun res!447981 () Bool)

(assert (=> d!93949 (=> res!447981 e!388475)))

(assert (=> d!93949 (= res!447981 ((_ is Nil!12987) acc!681))))

(assert (=> d!93949 (= (subseq!153 acc!681 lt!313342) e!388475)))

(declare-fun b!681883 () Bool)

(declare-fun e!388476 () Bool)

(assert (=> b!681883 (= e!388477 e!388476)))

(declare-fun res!447978 () Bool)

(assert (=> b!681883 (=> res!447978 e!388476)))

(assert (=> b!681883 (= res!447978 e!388474)))

(declare-fun res!447980 () Bool)

(assert (=> b!681883 (=> (not res!447980) (not e!388474))))

(assert (=> b!681883 (= res!447980 (= (h!14031 acc!681) (h!14031 lt!313342)))))

(declare-fun b!681885 () Bool)

(assert (=> b!681885 (= e!388476 (subseq!153 acc!681 (t!19227 lt!313342)))))

(assert (= (and d!93949 (not res!447981)) b!681882))

(assert (= (and b!681882 res!447979) b!681883))

(assert (= (and b!681883 res!447980) b!681884))

(assert (= (and b!681883 (not res!447978)) b!681885))

(declare-fun m!646661 () Bool)

(assert (=> b!681884 m!646661))

(declare-fun m!646663 () Bool)

(assert (=> b!681885 m!646663))

(assert (=> b!681715 d!93949))

(declare-fun d!93953 () Bool)

(assert (=> d!93953 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681716 d!93953))

(declare-fun d!93955 () Bool)

(assert (=> d!93955 (= ($colon$colon!318 acc!681 (select (arr!18949 a!3626) from!3004)) (Cons!12986 (select (arr!18949 a!3626) from!3004) acc!681))))

(assert (=> b!681706 d!93955))

(declare-fun b!681891 () Bool)

(declare-fun e!388483 () Bool)

(declare-fun e!388485 () Bool)

(assert (=> b!681891 (= e!388483 e!388485)))

(declare-fun res!447986 () Bool)

(assert (=> b!681891 (=> (not res!447986) (not e!388485))))

(assert (=> b!681891 (= res!447986 ((_ is Cons!12986) acc!681))))

(declare-fun b!681893 () Bool)

(declare-fun e!388482 () Bool)

(assert (=> b!681893 (= e!388482 (subseq!153 (t!19227 acc!681) (t!19227 acc!681)))))

(declare-fun d!93957 () Bool)

(declare-fun res!447988 () Bool)

(assert (=> d!93957 (=> res!447988 e!388483)))

(assert (=> d!93957 (= res!447988 ((_ is Nil!12987) acc!681))))

(assert (=> d!93957 (= (subseq!153 acc!681 acc!681) e!388483)))

(declare-fun b!681892 () Bool)

(declare-fun e!388484 () Bool)

(assert (=> b!681892 (= e!388485 e!388484)))

(declare-fun res!447985 () Bool)

(assert (=> b!681892 (=> res!447985 e!388484)))

(assert (=> b!681892 (= res!447985 e!388482)))

(declare-fun res!447987 () Bool)

(assert (=> b!681892 (=> (not res!447987) (not e!388482))))

(assert (=> b!681892 (= res!447987 (= (h!14031 acc!681) (h!14031 acc!681)))))

(declare-fun b!681894 () Bool)

(assert (=> b!681894 (= e!388484 (subseq!153 acc!681 (t!19227 acc!681)))))

(assert (= (and d!93957 (not res!447988)) b!681891))

(assert (= (and b!681891 res!447986) b!681892))

(assert (= (and b!681892 res!447987) b!681893))

(assert (= (and b!681892 (not res!447985)) b!681894))

(declare-fun m!646667 () Bool)

(assert (=> b!681893 m!646667))

(declare-fun m!646671 () Bool)

(assert (=> b!681894 m!646671))

(assert (=> b!681706 d!93957))

(declare-fun d!93959 () Bool)

(assert (=> d!93959 (subseq!153 acc!681 acc!681)))

(declare-fun lt!313376 () Unit!23914)

(declare-fun choose!36 (List!12990) Unit!23914)

(assert (=> d!93959 (= lt!313376 (choose!36 acc!681))))

(assert (=> d!93959 (= (lemmaListSubSeqRefl!0 acc!681) lt!313376)))

(declare-fun bs!20010 () Bool)

(assert (= bs!20010 d!93959))

(assert (=> bs!20010 m!646545))

(declare-fun m!646675 () Bool)

(assert (=> bs!20010 m!646675))

(assert (=> b!681706 d!93959))

(assert (=> b!681717 d!93927))

(declare-fun d!93963 () Bool)

(assert (=> d!93963 (= (array_inv!14745 a!3626) (bvsge (size!19313 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60718 d!93963))

(declare-fun d!93965 () Bool)

(declare-fun res!447995 () Bool)

(declare-fun e!388494 () Bool)

(assert (=> d!93965 (=> res!447995 e!388494)))

(assert (=> d!93965 (= res!447995 ((_ is Nil!12987) lt!313342))))

(assert (=> d!93965 (= (noDuplicate!814 lt!313342) e!388494)))

(declare-fun b!681905 () Bool)

(declare-fun e!388495 () Bool)

(assert (=> b!681905 (= e!388494 e!388495)))

(declare-fun res!447996 () Bool)

(assert (=> b!681905 (=> (not res!447996) (not e!388495))))

(assert (=> b!681905 (= res!447996 (not (contains!3567 (t!19227 lt!313342) (h!14031 lt!313342))))))

(declare-fun b!681906 () Bool)

(assert (=> b!681906 (= e!388495 (noDuplicate!814 (t!19227 lt!313342)))))

(assert (= (and d!93965 (not res!447995)) b!681905))

(assert (= (and b!681905 res!447996) b!681906))

(declare-fun m!646677 () Bool)

(assert (=> b!681905 m!646677))

(declare-fun m!646679 () Bool)

(assert (=> b!681906 m!646679))

(assert (=> b!681718 d!93965))

(declare-fun d!93967 () Bool)

(declare-fun lt!313377 () Bool)

(assert (=> d!93967 (= lt!313377 (select (content!277 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388499 () Bool)

(assert (=> d!93967 (= lt!313377 e!388499)))

(declare-fun res!448000 () Bool)

(assert (=> d!93967 (=> (not res!448000) (not e!388499))))

(assert (=> d!93967 (= res!448000 ((_ is Cons!12986) acc!681))))

(assert (=> d!93967 (= (contains!3567 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313377)))

(declare-fun b!681909 () Bool)

(declare-fun e!388498 () Bool)

(assert (=> b!681909 (= e!388499 e!388498)))

(declare-fun res!447999 () Bool)

(assert (=> b!681909 (=> res!447999 e!388498)))

(assert (=> b!681909 (= res!447999 (= (h!14031 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681910 () Bool)

(assert (=> b!681910 (= e!388498 (contains!3567 (t!19227 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93967 res!448000) b!681909))

(assert (= (and b!681909 (not res!447999)) b!681910))

(assert (=> d!93967 m!646631))

(declare-fun m!646681 () Bool)

(assert (=> d!93967 m!646681))

(declare-fun m!646683 () Bool)

(assert (=> b!681910 m!646683))

(assert (=> b!681708 d!93967))

(declare-fun d!93969 () Bool)

(declare-fun lt!313380 () Bool)

(assert (=> d!93969 (= lt!313380 (select (content!277 lt!313342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388501 () Bool)

(assert (=> d!93969 (= lt!313380 e!388501)))

(declare-fun res!448002 () Bool)

(assert (=> d!93969 (=> (not res!448002) (not e!388501))))

(assert (=> d!93969 (= res!448002 ((_ is Cons!12986) lt!313342))))

(assert (=> d!93969 (= (contains!3567 lt!313342 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313380)))

(declare-fun b!681911 () Bool)

(declare-fun e!388500 () Bool)

(assert (=> b!681911 (= e!388501 e!388500)))

(declare-fun res!448001 () Bool)

(assert (=> b!681911 (=> res!448001 e!388500)))

(assert (=> b!681911 (= res!448001 (= (h!14031 lt!313342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681912 () Bool)

(assert (=> b!681912 (= e!388500 (contains!3567 (t!19227 lt!313342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93969 res!448002) b!681911))

(assert (= (and b!681911 (not res!448001)) b!681912))

(declare-fun m!646685 () Bool)

(assert (=> d!93969 m!646685))

(declare-fun m!646687 () Bool)

(assert (=> d!93969 m!646687))

(declare-fun m!646689 () Bool)

(assert (=> b!681912 m!646689))

(assert (=> b!681719 d!93969))

(declare-fun d!93971 () Bool)

(declare-fun res!448017 () Bool)

(declare-fun e!388517 () Bool)

(assert (=> d!93971 (=> res!448017 e!388517)))

(assert (=> d!93971 (= res!448017 (= (select (arr!18949 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93971 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388517)))

(declare-fun b!681929 () Bool)

(declare-fun e!388518 () Bool)

(assert (=> b!681929 (= e!388517 e!388518)))

(declare-fun res!448018 () Bool)

(assert (=> b!681929 (=> (not res!448018) (not e!388518))))

(assert (=> b!681929 (= res!448018 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19313 a!3626)))))

(declare-fun b!681930 () Bool)

(assert (=> b!681930 (= e!388518 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93971 (not res!448017)) b!681929))

(assert (= (and b!681929 res!448018) b!681930))

(assert (=> d!93971 m!646609))

(declare-fun m!646705 () Bool)

(assert (=> b!681930 m!646705))

(assert (=> b!681720 d!93971))

(declare-fun d!93979 () Bool)

(declare-fun lt!313383 () Bool)

(assert (=> d!93979 (= lt!313383 (select (content!277 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388522 () Bool)

(assert (=> d!93979 (= lt!313383 e!388522)))

(declare-fun res!448022 () Bool)

(assert (=> d!93979 (=> (not res!448022) (not e!388522))))

(assert (=> d!93979 (= res!448022 ((_ is Cons!12986) acc!681))))

(assert (=> d!93979 (= (contains!3567 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313383)))

(declare-fun b!681933 () Bool)

(declare-fun e!388521 () Bool)

(assert (=> b!681933 (= e!388522 e!388521)))

(declare-fun res!448021 () Bool)

(assert (=> b!681933 (=> res!448021 e!388521)))

(assert (=> b!681933 (= res!448021 (= (h!14031 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681934 () Bool)

(assert (=> b!681934 (= e!388521 (contains!3567 (t!19227 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93979 res!448022) b!681933))

(assert (= (and b!681933 (not res!448021)) b!681934))

(assert (=> d!93979 m!646631))

(declare-fun m!646711 () Bool)

(assert (=> d!93979 m!646711))

(declare-fun m!646713 () Bool)

(assert (=> b!681934 m!646713))

(assert (=> b!681721 d!93979))

(declare-fun d!93983 () Bool)

(declare-fun res!448027 () Bool)

(declare-fun e!388527 () Bool)

(assert (=> d!93983 (=> res!448027 e!388527)))

(assert (=> d!93983 (= res!448027 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19313 a!3626)))))

(assert (=> d!93983 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313342) e!388527)))

(declare-fun b!681939 () Bool)

(declare-fun e!388530 () Bool)

(assert (=> b!681939 (= e!388527 e!388530)))

(declare-fun res!448029 () Bool)

(assert (=> b!681939 (=> (not res!448029) (not e!388530))))

(declare-fun e!388528 () Bool)

(assert (=> b!681939 (= res!448029 (not e!388528))))

(declare-fun res!448028 () Bool)

(assert (=> b!681939 (=> (not res!448028) (not e!388528))))

(assert (=> b!681939 (= res!448028 (validKeyInArray!0 (select (arr!18949 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!681940 () Bool)

(declare-fun e!388529 () Bool)

(declare-fun call!33985 () Bool)

(assert (=> b!681940 (= e!388529 call!33985)))

(declare-fun bm!33982 () Bool)

(declare-fun c!77323 () Bool)

(assert (=> bm!33982 (= call!33985 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77323 (Cons!12986 (select (arr!18949 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!313342) lt!313342)))))

(declare-fun b!681941 () Bool)

(assert (=> b!681941 (= e!388530 e!388529)))

(assert (=> b!681941 (= c!77323 (validKeyInArray!0 (select (arr!18949 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!681942 () Bool)

(assert (=> b!681942 (= e!388528 (contains!3567 lt!313342 (select (arr!18949 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!681943 () Bool)

(assert (=> b!681943 (= e!388529 call!33985)))

(assert (= (and d!93983 (not res!448027)) b!681939))

(assert (= (and b!681939 res!448028) b!681942))

(assert (= (and b!681939 res!448029) b!681941))

(assert (= (and b!681941 c!77323) b!681940))

(assert (= (and b!681941 (not c!77323)) b!681943))

(assert (= (or b!681940 b!681943) bm!33982))

(declare-fun m!646715 () Bool)

(assert (=> b!681939 m!646715))

(assert (=> b!681939 m!646715))

(declare-fun m!646717 () Bool)

(assert (=> b!681939 m!646717))

(assert (=> bm!33982 m!646715))

(declare-fun m!646719 () Bool)

(assert (=> bm!33982 m!646719))

(assert (=> b!681941 m!646715))

(assert (=> b!681941 m!646715))

(assert (=> b!681941 m!646717))

(assert (=> b!681942 m!646715))

(assert (=> b!681942 m!646715))

(declare-fun m!646721 () Bool)

(assert (=> b!681942 m!646721))

(assert (=> b!681711 d!93983))

(declare-fun d!93985 () Bool)

(assert (=> d!93985 (noDuplicate!814 acc!681)))

(declare-fun lt!313391 () Unit!23914)

(declare-fun choose!1386 (List!12990 List!12990) Unit!23914)

(assert (=> d!93985 (= lt!313391 (choose!1386 acc!681 lt!313342))))

(declare-fun e!388553 () Bool)

(assert (=> d!93985 e!388553))

(declare-fun res!448051 () Bool)

(assert (=> d!93985 (=> (not res!448051) (not e!388553))))

(assert (=> d!93985 (= res!448051 (subseq!153 acc!681 lt!313342))))

(assert (=> d!93985 (= (noDuplicateSubseq!27 acc!681 lt!313342) lt!313391)))

(declare-fun b!681967 () Bool)

(assert (=> b!681967 (= e!388553 (noDuplicate!814 lt!313342))))

(assert (= (and d!93985 res!448051) b!681967))

(assert (=> d!93985 m!646557))

(declare-fun m!646753 () Bool)

(assert (=> d!93985 m!646753))

(assert (=> d!93985 m!646531))

(assert (=> b!681967 m!646541))

(assert (=> b!681711 d!93985))

(declare-fun d!94005 () Bool)

(declare-fun lt!313392 () Bool)

(assert (=> d!94005 (= lt!313392 (select (content!277 lt!313342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388563 () Bool)

(assert (=> d!94005 (= lt!313392 e!388563)))

(declare-fun res!448060 () Bool)

(assert (=> d!94005 (=> (not res!448060) (not e!388563))))

(assert (=> d!94005 (= res!448060 ((_ is Cons!12986) lt!313342))))

(assert (=> d!94005 (= (contains!3567 lt!313342 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313392)))

(declare-fun b!681977 () Bool)

(declare-fun e!388562 () Bool)

(assert (=> b!681977 (= e!388563 e!388562)))

(declare-fun res!448059 () Bool)

(assert (=> b!681977 (=> res!448059 e!388562)))

(assert (=> b!681977 (= res!448059 (= (h!14031 lt!313342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681978 () Bool)

(assert (=> b!681978 (= e!388562 (contains!3567 (t!19227 lt!313342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94005 res!448060) b!681977))

(assert (= (and b!681977 (not res!448059)) b!681978))

(assert (=> d!94005 m!646685))

(declare-fun m!646759 () Bool)

(assert (=> d!94005 m!646759))

(declare-fun m!646761 () Bool)

(assert (=> b!681978 m!646761))

(assert (=> b!681712 d!94005))

(declare-fun d!94009 () Bool)

(assert (=> d!94009 (= (validKeyInArray!0 (select (arr!18949 a!3626) from!3004)) (and (not (= (select (arr!18949 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18949 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681723 d!94009))

(declare-fun d!94011 () Bool)

(declare-fun res!448061 () Bool)

(declare-fun e!388564 () Bool)

(assert (=> d!94011 (=> res!448061 e!388564)))

(assert (=> d!94011 (= res!448061 (= (select (arr!18949 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94011 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388564)))

(declare-fun b!681979 () Bool)

(declare-fun e!388565 () Bool)

(assert (=> b!681979 (= e!388564 e!388565)))

(declare-fun res!448062 () Bool)

(assert (=> b!681979 (=> (not res!448062) (not e!388565))))

(assert (=> b!681979 (= res!448062 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19313 a!3626)))))

(declare-fun b!681980 () Bool)

(assert (=> b!681980 (= e!388565 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94011 (not res!448061)) b!681979))

(assert (= (and b!681979 res!448062) b!681980))

(assert (=> d!94011 m!646715))

(declare-fun m!646767 () Bool)

(assert (=> b!681980 m!646767))

(assert (=> b!681723 d!94011))

(declare-fun d!94017 () Bool)

(declare-fun res!448063 () Bool)

(declare-fun e!388566 () Bool)

(assert (=> d!94017 (=> res!448063 e!388566)))

(assert (=> d!94017 (= res!448063 (= (select (arr!18949 (array!39529 (store (arr!18949 a!3626) i!1382 k0!2843) (size!19313 a!3626))) from!3004) k0!2843))))

(assert (=> d!94017 (= (arrayContainsKey!0 (array!39529 (store (arr!18949 a!3626) i!1382 k0!2843) (size!19313 a!3626)) k0!2843 from!3004) e!388566)))

(declare-fun b!681981 () Bool)

(declare-fun e!388567 () Bool)

(assert (=> b!681981 (= e!388566 e!388567)))

(declare-fun res!448064 () Bool)

(assert (=> b!681981 (=> (not res!448064) (not e!388567))))

(assert (=> b!681981 (= res!448064 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19313 (array!39529 (store (arr!18949 a!3626) i!1382 k0!2843) (size!19313 a!3626)))))))

(declare-fun b!681982 () Bool)

(assert (=> b!681982 (= e!388567 (arrayContainsKey!0 (array!39529 (store (arr!18949 a!3626) i!1382 k0!2843) (size!19313 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94017 (not res!448063)) b!681981))

(assert (= (and b!681981 res!448064) b!681982))

(declare-fun m!646769 () Bool)

(assert (=> d!94017 m!646769))

(declare-fun m!646771 () Bool)

(assert (=> b!681982 m!646771))

(assert (=> b!681723 d!94017))

(check-sat (not b!681930) (not b!681841) (not b!681849) (not bm!33982) (not d!93959) (not b!681941) (not b!681885) (not b!681804) (not b!681982) (not d!93967) (not b!681805) (not bm!33974) (not d!93985) (not b!681978) (not b!681826) (not b!681967) (not b!681905) (not b!681884) (not b!681912) (not b!681842) (not d!93917) (not b!681906) (not b!681847) (not bm!33975) (not d!93979) (not d!93927) (not b!681802) (not b!681939) (not b!681894) (not d!93969) (not b!681934) (not b!681910) (not b!681893) (not b!681942) (not b!681980) (not b!681850) (not d!94005))
(check-sat)
