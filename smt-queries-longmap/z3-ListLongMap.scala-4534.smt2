; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62844 () Bool)

(assert start!62844)

(declare-fun b!708836 () Bool)

(declare-fun res!472444 () Bool)

(declare-fun e!398913 () Bool)

(assert (=> b!708836 (=> (not res!472444) (not e!398913))))

(declare-datatypes ((array!40362 0))(
  ( (array!40363 (arr!19333 (Array (_ BitVec 32) (_ BitVec 64))) (size!19724 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40362)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708836 (= res!472444 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!708837 () Bool)

(declare-fun res!472449 () Bool)

(assert (=> b!708837 (=> (not res!472449) (not e!398913))))

(declare-datatypes ((List!13374 0))(
  ( (Nil!13371) (Cons!13370 (h!14415 (_ BitVec 64)) (t!19665 List!13374)) )
))
(declare-fun acc!652 () List!13374)

(declare-fun arrayNoDuplicates!0 (array!40362 (_ BitVec 32) List!13374) Bool)

(assert (=> b!708837 (= res!472449 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708838 () Bool)

(declare-fun res!472445 () Bool)

(assert (=> b!708838 (=> (not res!472445) (not e!398913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708838 (= res!472445 (validKeyInArray!0 k0!2824))))

(declare-fun b!708839 () Bool)

(declare-fun res!472442 () Bool)

(assert (=> b!708839 (=> (not res!472442) (not e!398913))))

(declare-fun contains!3951 (List!13374 (_ BitVec 64)) Bool)

(assert (=> b!708839 (= res!472442 (not (contains!3951 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708840 () Bool)

(declare-fun res!472455 () Bool)

(declare-fun e!398915 () Bool)

(assert (=> b!708840 (=> (not res!472455) (not e!398915))))

(declare-fun newAcc!49 () List!13374)

(declare-fun noDuplicate!1198 (List!13374) Bool)

(declare-fun $colon$colon!507 (List!13374 (_ BitVec 64)) List!13374)

(assert (=> b!708840 (= res!472455 (noDuplicate!1198 ($colon$colon!507 newAcc!49 (select (arr!19333 a!3591) from!2969))))))

(declare-fun b!708841 () Bool)

(declare-fun res!472437 () Bool)

(assert (=> b!708841 (=> (not res!472437) (not e!398913))))

(assert (=> b!708841 (= res!472437 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19724 a!3591)))))

(declare-fun b!708842 () Bool)

(declare-fun res!472450 () Bool)

(assert (=> b!708842 (=> (not res!472450) (not e!398913))))

(assert (=> b!708842 (= res!472450 (validKeyInArray!0 (select (arr!19333 a!3591) from!2969)))))

(declare-fun b!708843 () Bool)

(declare-fun res!472446 () Bool)

(assert (=> b!708843 (=> (not res!472446) (not e!398913))))

(assert (=> b!708843 (= res!472446 (not (contains!3951 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708844 () Bool)

(declare-fun res!472453 () Bool)

(assert (=> b!708844 (=> (not res!472453) (not e!398915))))

(declare-fun lt!318155 () List!13374)

(assert (=> b!708844 (= res!472453 (noDuplicate!1198 lt!318155))))

(declare-fun b!708845 () Bool)

(assert (=> b!708845 (= e!398913 e!398915)))

(declare-fun res!472436 () Bool)

(assert (=> b!708845 (=> (not res!472436) (not e!398915))))

(assert (=> b!708845 (= res!472436 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708845 (= lt!318155 ($colon$colon!507 acc!652 (select (arr!19333 a!3591) from!2969)))))

(declare-fun res!472448 () Bool)

(assert (=> start!62844 (=> (not res!472448) (not e!398913))))

(assert (=> start!62844 (= res!472448 (and (bvslt (size!19724 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19724 a!3591))))))

(assert (=> start!62844 e!398913))

(assert (=> start!62844 true))

(declare-fun array_inv!15129 (array!40362) Bool)

(assert (=> start!62844 (array_inv!15129 a!3591)))

(declare-fun b!708846 () Bool)

(declare-fun res!472441 () Bool)

(assert (=> b!708846 (=> (not res!472441) (not e!398913))))

(assert (=> b!708846 (= res!472441 (not (contains!3951 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708847 () Bool)

(declare-fun res!472443 () Bool)

(assert (=> b!708847 (=> (not res!472443) (not e!398913))))

(declare-fun -!361 (List!13374 (_ BitVec 64)) List!13374)

(assert (=> b!708847 (= res!472443 (= (-!361 newAcc!49 k0!2824) acc!652))))

(declare-fun b!708848 () Bool)

(assert (=> b!708848 (= e!398915 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!708849 () Bool)

(declare-fun res!472451 () Bool)

(assert (=> b!708849 (=> (not res!472451) (not e!398913))))

(assert (=> b!708849 (= res!472451 (not (contains!3951 acc!652 k0!2824)))))

(declare-fun b!708850 () Bool)

(declare-fun res!472447 () Bool)

(assert (=> b!708850 (=> (not res!472447) (not e!398915))))

(assert (=> b!708850 (= res!472447 (not (contains!3951 lt!318155 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708851 () Bool)

(declare-fun res!472438 () Bool)

(assert (=> b!708851 (=> (not res!472438) (not e!398913))))

(assert (=> b!708851 (= res!472438 (noDuplicate!1198 newAcc!49))))

(declare-fun b!708852 () Bool)

(declare-fun res!472439 () Bool)

(assert (=> b!708852 (=> (not res!472439) (not e!398913))))

(assert (=> b!708852 (= res!472439 (contains!3951 newAcc!49 k0!2824))))

(declare-fun b!708853 () Bool)

(declare-fun res!472456 () Bool)

(assert (=> b!708853 (=> (not res!472456) (not e!398913))))

(declare-fun subseq!396 (List!13374 List!13374) Bool)

(assert (=> b!708853 (= res!472456 (subseq!396 acc!652 newAcc!49))))

(declare-fun b!708854 () Bool)

(declare-fun res!472440 () Bool)

(assert (=> b!708854 (=> (not res!472440) (not e!398915))))

(assert (=> b!708854 (= res!472440 (not (contains!3951 lt!318155 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708855 () Bool)

(declare-fun res!472454 () Bool)

(assert (=> b!708855 (=> (not res!472454) (not e!398913))))

(assert (=> b!708855 (= res!472454 (noDuplicate!1198 acc!652))))

(declare-fun b!708856 () Bool)

(declare-fun res!472452 () Bool)

(assert (=> b!708856 (=> (not res!472452) (not e!398913))))

(assert (=> b!708856 (= res!472452 (not (contains!3951 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62844 res!472448) b!708855))

(assert (= (and b!708855 res!472454) b!708851))

(assert (= (and b!708851 res!472438) b!708839))

(assert (= (and b!708839 res!472442) b!708846))

(assert (= (and b!708846 res!472441) b!708836))

(assert (= (and b!708836 res!472444) b!708849))

(assert (= (and b!708849 res!472451) b!708838))

(assert (= (and b!708838 res!472445) b!708837))

(assert (= (and b!708837 res!472449) b!708853))

(assert (= (and b!708853 res!472456) b!708852))

(assert (= (and b!708852 res!472439) b!708847))

(assert (= (and b!708847 res!472443) b!708856))

(assert (= (and b!708856 res!472452) b!708843))

(assert (= (and b!708843 res!472446) b!708841))

(assert (= (and b!708841 res!472437) b!708842))

(assert (= (and b!708842 res!472450) b!708845))

(assert (= (and b!708845 res!472436) b!708844))

(assert (= (and b!708844 res!472453) b!708840))

(assert (= (and b!708840 res!472455) b!708854))

(assert (= (and b!708854 res!472440) b!708850))

(assert (= (and b!708850 res!472447) b!708848))

(declare-fun m!666215 () Bool)

(assert (=> b!708848 m!666215))

(declare-fun m!666217 () Bool)

(assert (=> b!708843 m!666217))

(declare-fun m!666219 () Bool)

(assert (=> b!708840 m!666219))

(assert (=> b!708840 m!666219))

(declare-fun m!666221 () Bool)

(assert (=> b!708840 m!666221))

(assert (=> b!708840 m!666221))

(declare-fun m!666223 () Bool)

(assert (=> b!708840 m!666223))

(declare-fun m!666225 () Bool)

(assert (=> b!708852 m!666225))

(assert (=> b!708845 m!666219))

(assert (=> b!708845 m!666219))

(declare-fun m!666227 () Bool)

(assert (=> b!708845 m!666227))

(declare-fun m!666229 () Bool)

(assert (=> b!708838 m!666229))

(declare-fun m!666231 () Bool)

(assert (=> b!708836 m!666231))

(declare-fun m!666233 () Bool)

(assert (=> b!708850 m!666233))

(declare-fun m!666235 () Bool)

(assert (=> b!708855 m!666235))

(declare-fun m!666237 () Bool)

(assert (=> start!62844 m!666237))

(declare-fun m!666239 () Bool)

(assert (=> b!708854 m!666239))

(declare-fun m!666241 () Bool)

(assert (=> b!708846 m!666241))

(declare-fun m!666243 () Bool)

(assert (=> b!708847 m!666243))

(declare-fun m!666245 () Bool)

(assert (=> b!708837 m!666245))

(declare-fun m!666247 () Bool)

(assert (=> b!708849 m!666247))

(declare-fun m!666249 () Bool)

(assert (=> b!708851 m!666249))

(declare-fun m!666251 () Bool)

(assert (=> b!708844 m!666251))

(assert (=> b!708842 m!666219))

(assert (=> b!708842 m!666219))

(declare-fun m!666253 () Bool)

(assert (=> b!708842 m!666253))

(declare-fun m!666255 () Bool)

(assert (=> b!708853 m!666255))

(declare-fun m!666257 () Bool)

(assert (=> b!708839 m!666257))

(declare-fun m!666259 () Bool)

(assert (=> b!708856 m!666259))

(check-sat (not b!708837) (not b!708849) (not b!708853) (not b!708838) (not b!708836) (not start!62844) (not b!708848) (not b!708842) (not b!708856) (not b!708851) (not b!708845) (not b!708847) (not b!708852) (not b!708843) (not b!708844) (not b!708855) (not b!708846) (not b!708850) (not b!708839) (not b!708854) (not b!708840))
(check-sat)
(get-model)

(declare-fun b!708934 () Bool)

(declare-fun e!398940 () Bool)

(declare-fun call!34419 () Bool)

(assert (=> b!708934 (= e!398940 call!34419)))

(declare-fun d!96947 () Bool)

(declare-fun res!472530 () Bool)

(declare-fun e!398939 () Bool)

(assert (=> d!96947 (=> res!472530 e!398939)))

(assert (=> d!96947 (= res!472530 (bvsge from!2969 (size!19724 a!3591)))))

(assert (=> d!96947 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398939)))

(declare-fun c!78569 () Bool)

(declare-fun bm!34416 () Bool)

(assert (=> bm!34416 (= call!34419 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78569 (Cons!13370 (select (arr!19333 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708935 () Bool)

(declare-fun e!398937 () Bool)

(assert (=> b!708935 (= e!398939 e!398937)))

(declare-fun res!472532 () Bool)

(assert (=> b!708935 (=> (not res!472532) (not e!398937))))

(declare-fun e!398938 () Bool)

(assert (=> b!708935 (= res!472532 (not e!398938))))

(declare-fun res!472531 () Bool)

(assert (=> b!708935 (=> (not res!472531) (not e!398938))))

(assert (=> b!708935 (= res!472531 (validKeyInArray!0 (select (arr!19333 a!3591) from!2969)))))

(declare-fun b!708936 () Bool)

(assert (=> b!708936 (= e!398938 (contains!3951 acc!652 (select (arr!19333 a!3591) from!2969)))))

(declare-fun b!708937 () Bool)

(assert (=> b!708937 (= e!398940 call!34419)))

(declare-fun b!708938 () Bool)

(assert (=> b!708938 (= e!398937 e!398940)))

(assert (=> b!708938 (= c!78569 (validKeyInArray!0 (select (arr!19333 a!3591) from!2969)))))

(assert (= (and d!96947 (not res!472530)) b!708935))

(assert (= (and b!708935 res!472531) b!708936))

(assert (= (and b!708935 res!472532) b!708938))

(assert (= (and b!708938 c!78569) b!708934))

(assert (= (and b!708938 (not c!78569)) b!708937))

(assert (= (or b!708934 b!708937) bm!34416))

(assert (=> bm!34416 m!666219))

(declare-fun m!666307 () Bool)

(assert (=> bm!34416 m!666307))

(assert (=> b!708935 m!666219))

(assert (=> b!708935 m!666219))

(assert (=> b!708935 m!666253))

(assert (=> b!708936 m!666219))

(assert (=> b!708936 m!666219))

(declare-fun m!666309 () Bool)

(assert (=> b!708936 m!666309))

(assert (=> b!708938 m!666219))

(assert (=> b!708938 m!666219))

(assert (=> b!708938 m!666253))

(assert (=> b!708837 d!96947))

(declare-fun d!96951 () Bool)

(declare-fun res!472553 () Bool)

(declare-fun e!398961 () Bool)

(assert (=> d!96951 (=> res!472553 e!398961)))

(assert (=> d!96951 (= res!472553 (= (select (arr!19333 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!96951 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!398961)))

(declare-fun b!708959 () Bool)

(declare-fun e!398962 () Bool)

(assert (=> b!708959 (= e!398961 e!398962)))

(declare-fun res!472554 () Bool)

(assert (=> b!708959 (=> (not res!472554) (not e!398962))))

(assert (=> b!708959 (= res!472554 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19724 a!3591)))))

(declare-fun b!708960 () Bool)

(assert (=> b!708960 (= e!398962 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96951 (not res!472553)) b!708959))

(assert (= (and b!708959 res!472554) b!708960))

(declare-fun m!666341 () Bool)

(assert (=> d!96951 m!666341))

(declare-fun m!666343 () Bool)

(assert (=> b!708960 m!666343))

(assert (=> b!708848 d!96951))

(declare-fun d!96969 () Bool)

(declare-fun lt!318174 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!342 (List!13374) (InoxSet (_ BitVec 64)))

(assert (=> d!96969 (= lt!318174 (select (content!342 acc!652) k0!2824))))

(declare-fun e!398982 () Bool)

(assert (=> d!96969 (= lt!318174 e!398982)))

(declare-fun res!472574 () Bool)

(assert (=> d!96969 (=> (not res!472574) (not e!398982))))

(get-info :version)

(assert (=> d!96969 (= res!472574 ((_ is Cons!13370) acc!652))))

(assert (=> d!96969 (= (contains!3951 acc!652 k0!2824) lt!318174)))

(declare-fun b!708979 () Bool)

(declare-fun e!398981 () Bool)

(assert (=> b!708979 (= e!398982 e!398981)))

(declare-fun res!472573 () Bool)

(assert (=> b!708979 (=> res!472573 e!398981)))

(assert (=> b!708979 (= res!472573 (= (h!14415 acc!652) k0!2824))))

(declare-fun b!708980 () Bool)

(assert (=> b!708980 (= e!398981 (contains!3951 (t!19665 acc!652) k0!2824))))

(assert (= (and d!96969 res!472574) b!708979))

(assert (= (and b!708979 (not res!472573)) b!708980))

(declare-fun m!666361 () Bool)

(assert (=> d!96969 m!666361))

(declare-fun m!666363 () Bool)

(assert (=> d!96969 m!666363))

(declare-fun m!666365 () Bool)

(assert (=> b!708980 m!666365))

(assert (=> b!708849 d!96969))

(declare-fun d!96983 () Bool)

(assert (=> d!96983 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708838 d!96983))

(declare-fun d!96987 () Bool)

(declare-fun lt!318178 () Bool)

(assert (=> d!96987 (= lt!318178 (select (content!342 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398995 () Bool)

(assert (=> d!96987 (= lt!318178 e!398995)))

(declare-fun res!472582 () Bool)

(assert (=> d!96987 (=> (not res!472582) (not e!398995))))

(assert (=> d!96987 (= res!472582 ((_ is Cons!13370) acc!652))))

(assert (=> d!96987 (= (contains!3951 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318178)))

(declare-fun b!708995 () Bool)

(declare-fun e!398994 () Bool)

(assert (=> b!708995 (= e!398995 e!398994)))

(declare-fun res!472581 () Bool)

(assert (=> b!708995 (=> res!472581 e!398994)))

(assert (=> b!708995 (= res!472581 (= (h!14415 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708996 () Bool)

(assert (=> b!708996 (= e!398994 (contains!3951 (t!19665 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96987 res!472582) b!708995))

(assert (= (and b!708995 (not res!472581)) b!708996))

(assert (=> d!96987 m!666361))

(declare-fun m!666375 () Bool)

(assert (=> d!96987 m!666375))

(declare-fun m!666379 () Bool)

(assert (=> b!708996 m!666379))

(assert (=> b!708839 d!96987))

(declare-fun d!96991 () Bool)

(declare-fun lt!318179 () Bool)

(assert (=> d!96991 (= lt!318179 (select (content!342 lt!318155) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398999 () Bool)

(assert (=> d!96991 (= lt!318179 e!398999)))

(declare-fun res!472586 () Bool)

(assert (=> d!96991 (=> (not res!472586) (not e!398999))))

(assert (=> d!96991 (= res!472586 ((_ is Cons!13370) lt!318155))))

(assert (=> d!96991 (= (contains!3951 lt!318155 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318179)))

(declare-fun b!708999 () Bool)

(declare-fun e!398998 () Bool)

(assert (=> b!708999 (= e!398999 e!398998)))

(declare-fun res!472585 () Bool)

(assert (=> b!708999 (=> res!472585 e!398998)))

(assert (=> b!708999 (= res!472585 (= (h!14415 lt!318155) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709000 () Bool)

(assert (=> b!709000 (= e!398998 (contains!3951 (t!19665 lt!318155) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96991 res!472586) b!708999))

(assert (= (and b!708999 (not res!472585)) b!709000))

(declare-fun m!666381 () Bool)

(assert (=> d!96991 m!666381))

(declare-fun m!666383 () Bool)

(assert (=> d!96991 m!666383))

(declare-fun m!666385 () Bool)

(assert (=> b!709000 m!666385))

(assert (=> b!708850 d!96991))

(declare-fun d!96995 () Bool)

(declare-fun res!472598 () Bool)

(declare-fun e!399013 () Bool)

(assert (=> d!96995 (=> res!472598 e!399013)))

(assert (=> d!96995 (= res!472598 ((_ is Nil!13371) newAcc!49))))

(assert (=> d!96995 (= (noDuplicate!1198 newAcc!49) e!399013)))

(declare-fun b!709016 () Bool)

(declare-fun e!399014 () Bool)

(assert (=> b!709016 (= e!399013 e!399014)))

(declare-fun res!472599 () Bool)

(assert (=> b!709016 (=> (not res!472599) (not e!399014))))

(assert (=> b!709016 (= res!472599 (not (contains!3951 (t!19665 newAcc!49) (h!14415 newAcc!49))))))

(declare-fun b!709017 () Bool)

(assert (=> b!709017 (= e!399014 (noDuplicate!1198 (t!19665 newAcc!49)))))

(assert (= (and d!96995 (not res!472598)) b!709016))

(assert (= (and b!709016 res!472599) b!709017))

(declare-fun m!666401 () Bool)

(assert (=> b!709016 m!666401))

(declare-fun m!666403 () Bool)

(assert (=> b!709017 m!666403))

(assert (=> b!708851 d!96995))

(declare-fun d!97001 () Bool)

(declare-fun res!472600 () Bool)

(declare-fun e!399015 () Bool)

(assert (=> d!97001 (=> res!472600 e!399015)))

(assert (=> d!97001 (= res!472600 ((_ is Nil!13371) ($colon$colon!507 newAcc!49 (select (arr!19333 a!3591) from!2969))))))

(assert (=> d!97001 (= (noDuplicate!1198 ($colon$colon!507 newAcc!49 (select (arr!19333 a!3591) from!2969))) e!399015)))

(declare-fun b!709018 () Bool)

(declare-fun e!399016 () Bool)

(assert (=> b!709018 (= e!399015 e!399016)))

(declare-fun res!472601 () Bool)

(assert (=> b!709018 (=> (not res!472601) (not e!399016))))

(assert (=> b!709018 (= res!472601 (not (contains!3951 (t!19665 ($colon$colon!507 newAcc!49 (select (arr!19333 a!3591) from!2969))) (h!14415 ($colon$colon!507 newAcc!49 (select (arr!19333 a!3591) from!2969))))))))

(declare-fun b!709019 () Bool)

(assert (=> b!709019 (= e!399016 (noDuplicate!1198 (t!19665 ($colon$colon!507 newAcc!49 (select (arr!19333 a!3591) from!2969)))))))

(assert (= (and d!97001 (not res!472600)) b!709018))

(assert (= (and b!709018 res!472601) b!709019))

(declare-fun m!666405 () Bool)

(assert (=> b!709018 m!666405))

(declare-fun m!666407 () Bool)

(assert (=> b!709019 m!666407))

(assert (=> b!708840 d!97001))

(declare-fun d!97005 () Bool)

(assert (=> d!97005 (= ($colon$colon!507 newAcc!49 (select (arr!19333 a!3591) from!2969)) (Cons!13370 (select (arr!19333 a!3591) from!2969) newAcc!49))))

(assert (=> b!708840 d!97005))

(declare-fun d!97009 () Bool)

(declare-fun lt!318182 () Bool)

(assert (=> d!97009 (= lt!318182 (select (content!342 newAcc!49) k0!2824))))

(declare-fun e!399030 () Bool)

(assert (=> d!97009 (= lt!318182 e!399030)))

(declare-fun res!472615 () Bool)

(assert (=> d!97009 (=> (not res!472615) (not e!399030))))

(assert (=> d!97009 (= res!472615 ((_ is Cons!13370) newAcc!49))))

(assert (=> d!97009 (= (contains!3951 newAcc!49 k0!2824) lt!318182)))

(declare-fun b!709032 () Bool)

(declare-fun e!399029 () Bool)

(assert (=> b!709032 (= e!399030 e!399029)))

(declare-fun res!472614 () Bool)

(assert (=> b!709032 (=> res!472614 e!399029)))

(assert (=> b!709032 (= res!472614 (= (h!14415 newAcc!49) k0!2824))))

(declare-fun b!709033 () Bool)

(assert (=> b!709033 (= e!399029 (contains!3951 (t!19665 newAcc!49) k0!2824))))

(assert (= (and d!97009 res!472615) b!709032))

(assert (= (and b!709032 (not res!472614)) b!709033))

(declare-fun m!666417 () Bool)

(assert (=> d!97009 m!666417))

(declare-fun m!666419 () Bool)

(assert (=> d!97009 m!666419))

(declare-fun m!666421 () Bool)

(assert (=> b!709033 m!666421))

(assert (=> b!708852 d!97009))

(declare-fun b!709071 () Bool)

(declare-fun e!399068 () Bool)

(declare-fun e!399070 () Bool)

(assert (=> b!709071 (= e!399068 e!399070)))

(declare-fun res!472653 () Bool)

(assert (=> b!709071 (=> res!472653 e!399070)))

(declare-fun e!399067 () Bool)

(assert (=> b!709071 (= res!472653 e!399067)))

(declare-fun res!472652 () Bool)

(assert (=> b!709071 (=> (not res!472652) (not e!399067))))

(assert (=> b!709071 (= res!472652 (= (h!14415 acc!652) (h!14415 newAcc!49)))))

(declare-fun b!709070 () Bool)

(declare-fun e!399069 () Bool)

(assert (=> b!709070 (= e!399069 e!399068)))

(declare-fun res!472655 () Bool)

(assert (=> b!709070 (=> (not res!472655) (not e!399068))))

(assert (=> b!709070 (= res!472655 ((_ is Cons!13370) newAcc!49))))

(declare-fun b!709072 () Bool)

(assert (=> b!709072 (= e!399067 (subseq!396 (t!19665 acc!652) (t!19665 newAcc!49)))))

(declare-fun b!709073 () Bool)

(assert (=> b!709073 (= e!399070 (subseq!396 acc!652 (t!19665 newAcc!49)))))

(declare-fun d!97013 () Bool)

(declare-fun res!472654 () Bool)

(assert (=> d!97013 (=> res!472654 e!399069)))

(assert (=> d!97013 (= res!472654 ((_ is Nil!13371) acc!652))))

(assert (=> d!97013 (= (subseq!396 acc!652 newAcc!49) e!399069)))

(assert (= (and d!97013 (not res!472654)) b!709070))

(assert (= (and b!709070 res!472655) b!709071))

(assert (= (and b!709071 res!472652) b!709072))

(assert (= (and b!709071 (not res!472653)) b!709073))

(declare-fun m!666457 () Bool)

(assert (=> b!709072 m!666457))

(declare-fun m!666459 () Bool)

(assert (=> b!709073 m!666459))

(assert (=> b!708853 d!97013))

(declare-fun d!97037 () Bool)

(assert (=> d!97037 (= (validKeyInArray!0 (select (arr!19333 a!3591) from!2969)) (and (not (= (select (arr!19333 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19333 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708842 d!97037))

(declare-fun d!97039 () Bool)

(declare-fun lt!318187 () Bool)

(assert (=> d!97039 (= lt!318187 (select (content!342 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399072 () Bool)

(assert (=> d!97039 (= lt!318187 e!399072)))

(declare-fun res!472657 () Bool)

(assert (=> d!97039 (=> (not res!472657) (not e!399072))))

(assert (=> d!97039 (= res!472657 ((_ is Cons!13370) newAcc!49))))

(assert (=> d!97039 (= (contains!3951 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318187)))

(declare-fun b!709074 () Bool)

(declare-fun e!399071 () Bool)

(assert (=> b!709074 (= e!399072 e!399071)))

(declare-fun res!472656 () Bool)

(assert (=> b!709074 (=> res!472656 e!399071)))

(assert (=> b!709074 (= res!472656 (= (h!14415 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709075 () Bool)

(assert (=> b!709075 (= e!399071 (contains!3951 (t!19665 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97039 res!472657) b!709074))

(assert (= (and b!709074 (not res!472656)) b!709075))

(assert (=> d!97039 m!666417))

(declare-fun m!666461 () Bool)

(assert (=> d!97039 m!666461))

(declare-fun m!666463 () Bool)

(assert (=> b!709075 m!666463))

(assert (=> b!708843 d!97039))

(declare-fun d!97041 () Bool)

(declare-fun lt!318188 () Bool)

(assert (=> d!97041 (= lt!318188 (select (content!342 lt!318155) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399074 () Bool)

(assert (=> d!97041 (= lt!318188 e!399074)))

(declare-fun res!472659 () Bool)

(assert (=> d!97041 (=> (not res!472659) (not e!399074))))

(assert (=> d!97041 (= res!472659 ((_ is Cons!13370) lt!318155))))

(assert (=> d!97041 (= (contains!3951 lt!318155 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318188)))

(declare-fun b!709076 () Bool)

(declare-fun e!399073 () Bool)

(assert (=> b!709076 (= e!399074 e!399073)))

(declare-fun res!472658 () Bool)

(assert (=> b!709076 (=> res!472658 e!399073)))

(assert (=> b!709076 (= res!472658 (= (h!14415 lt!318155) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709077 () Bool)

(assert (=> b!709077 (= e!399073 (contains!3951 (t!19665 lt!318155) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97041 res!472659) b!709076))

(assert (= (and b!709076 (not res!472658)) b!709077))

(assert (=> d!97041 m!666381))

(declare-fun m!666465 () Bool)

(assert (=> d!97041 m!666465))

(declare-fun m!666467 () Bool)

(assert (=> b!709077 m!666467))

(assert (=> b!708854 d!97041))

(declare-fun d!97043 () Bool)

(declare-fun res!472666 () Bool)

(declare-fun e!399083 () Bool)

(assert (=> d!97043 (=> res!472666 e!399083)))

(assert (=> d!97043 (= res!472666 ((_ is Nil!13371) acc!652))))

(assert (=> d!97043 (= (noDuplicate!1198 acc!652) e!399083)))

(declare-fun b!709088 () Bool)

(declare-fun e!399084 () Bool)

(assert (=> b!709088 (= e!399083 e!399084)))

(declare-fun res!472667 () Bool)

(assert (=> b!709088 (=> (not res!472667) (not e!399084))))

(assert (=> b!709088 (= res!472667 (not (contains!3951 (t!19665 acc!652) (h!14415 acc!652))))))

(declare-fun b!709089 () Bool)

(assert (=> b!709089 (= e!399084 (noDuplicate!1198 (t!19665 acc!652)))))

(assert (= (and d!97043 (not res!472666)) b!709088))

(assert (= (and b!709088 res!472667) b!709089))

(declare-fun m!666469 () Bool)

(assert (=> b!709088 m!666469))

(declare-fun m!666471 () Bool)

(assert (=> b!709089 m!666471))

(assert (=> b!708855 d!97043))

(declare-fun d!97045 () Bool)

(declare-fun res!472668 () Bool)

(declare-fun e!399085 () Bool)

(assert (=> d!97045 (=> res!472668 e!399085)))

(assert (=> d!97045 (= res!472668 ((_ is Nil!13371) lt!318155))))

(assert (=> d!97045 (= (noDuplicate!1198 lt!318155) e!399085)))

(declare-fun b!709090 () Bool)

(declare-fun e!399086 () Bool)

(assert (=> b!709090 (= e!399085 e!399086)))

(declare-fun res!472669 () Bool)

(assert (=> b!709090 (=> (not res!472669) (not e!399086))))

(assert (=> b!709090 (= res!472669 (not (contains!3951 (t!19665 lt!318155) (h!14415 lt!318155))))))

(declare-fun b!709091 () Bool)

(assert (=> b!709091 (= e!399086 (noDuplicate!1198 (t!19665 lt!318155)))))

(assert (= (and d!97045 (not res!472668)) b!709090))

(assert (= (and b!709090 res!472669) b!709091))

(declare-fun m!666473 () Bool)

(assert (=> b!709090 m!666473))

(declare-fun m!666475 () Bool)

(assert (=> b!709091 m!666475))

(assert (=> b!708844 d!97045))

(declare-fun d!97047 () Bool)

(assert (=> d!97047 (= ($colon$colon!507 acc!652 (select (arr!19333 a!3591) from!2969)) (Cons!13370 (select (arr!19333 a!3591) from!2969) acc!652))))

(assert (=> b!708845 d!97047))

(declare-fun d!97049 () Bool)

(declare-fun lt!318189 () Bool)

(assert (=> d!97049 (= lt!318189 (select (content!342 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399088 () Bool)

(assert (=> d!97049 (= lt!318189 e!399088)))

(declare-fun res!472671 () Bool)

(assert (=> d!97049 (=> (not res!472671) (not e!399088))))

(assert (=> d!97049 (= res!472671 ((_ is Cons!13370) newAcc!49))))

(assert (=> d!97049 (= (contains!3951 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318189)))

(declare-fun b!709092 () Bool)

(declare-fun e!399087 () Bool)

(assert (=> b!709092 (= e!399088 e!399087)))

(declare-fun res!472670 () Bool)

(assert (=> b!709092 (=> res!472670 e!399087)))

(assert (=> b!709092 (= res!472670 (= (h!14415 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709093 () Bool)

(assert (=> b!709093 (= e!399087 (contains!3951 (t!19665 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97049 res!472671) b!709092))

(assert (= (and b!709092 (not res!472670)) b!709093))

(assert (=> d!97049 m!666417))

(declare-fun m!666477 () Bool)

(assert (=> d!97049 m!666477))

(declare-fun m!666479 () Bool)

(assert (=> b!709093 m!666479))

(assert (=> b!708856 d!97049))

(declare-fun d!97051 () Bool)

(declare-fun lt!318190 () Bool)

(assert (=> d!97051 (= lt!318190 (select (content!342 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399090 () Bool)

(assert (=> d!97051 (= lt!318190 e!399090)))

(declare-fun res!472673 () Bool)

(assert (=> d!97051 (=> (not res!472673) (not e!399090))))

(assert (=> d!97051 (= res!472673 ((_ is Cons!13370) acc!652))))

(assert (=> d!97051 (= (contains!3951 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318190)))

(declare-fun b!709094 () Bool)

(declare-fun e!399089 () Bool)

(assert (=> b!709094 (= e!399090 e!399089)))

(declare-fun res!472672 () Bool)

(assert (=> b!709094 (=> res!472672 e!399089)))

(assert (=> b!709094 (= res!472672 (= (h!14415 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709095 () Bool)

(assert (=> b!709095 (= e!399089 (contains!3951 (t!19665 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97051 res!472673) b!709094))

(assert (= (and b!709094 (not res!472672)) b!709095))

(assert (=> d!97051 m!666361))

(declare-fun m!666481 () Bool)

(assert (=> d!97051 m!666481))

(declare-fun m!666483 () Bool)

(assert (=> b!709095 m!666483))

(assert (=> b!708846 d!97051))

(declare-fun d!97053 () Bool)

(assert (=> d!97053 (= (array_inv!15129 a!3591) (bvsge (size!19724 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62844 d!97053))

(declare-fun b!709144 () Bool)

(declare-fun e!399134 () List!13374)

(declare-fun e!399132 () List!13374)

(assert (=> b!709144 (= e!399134 e!399132)))

(declare-fun c!78586 () Bool)

(assert (=> b!709144 (= c!78586 (= k0!2824 (h!14415 newAcc!49)))))

(declare-fun b!709145 () Bool)

(declare-fun lt!318194 () List!13374)

(declare-fun e!399133 () Bool)

(assert (=> b!709145 (= e!399133 (= (content!342 lt!318194) ((_ map and) (content!342 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34428 () Bool)

(declare-fun call!34431 () List!13374)

(assert (=> bm!34428 (= call!34431 (-!361 (t!19665 newAcc!49) k0!2824))))

(declare-fun d!97055 () Bool)

(assert (=> d!97055 e!399133))

(declare-fun res!472706 () Bool)

(assert (=> d!97055 (=> (not res!472706) (not e!399133))))

(declare-fun size!19727 (List!13374) Int)

(assert (=> d!97055 (= res!472706 (<= (size!19727 lt!318194) (size!19727 newAcc!49)))))

(assert (=> d!97055 (= lt!318194 e!399134)))

(declare-fun c!78587 () Bool)

(assert (=> d!97055 (= c!78587 ((_ is Cons!13370) newAcc!49))))

(assert (=> d!97055 (= (-!361 newAcc!49 k0!2824) lt!318194)))

(declare-fun b!709146 () Bool)

(assert (=> b!709146 (= e!399134 Nil!13371)))

(declare-fun b!709147 () Bool)

(assert (=> b!709147 (= e!399132 call!34431)))

(declare-fun b!709148 () Bool)

(assert (=> b!709148 (= e!399132 (Cons!13370 (h!14415 newAcc!49) call!34431))))

(assert (= (and d!97055 c!78587) b!709144))

(assert (= (and d!97055 (not c!78587)) b!709146))

(assert (= (and b!709144 c!78586) b!709147))

(assert (= (and b!709144 (not c!78586)) b!709148))

(assert (= (or b!709147 b!709148) bm!34428))

(assert (= (and d!97055 res!472706) b!709145))

(declare-fun m!666519 () Bool)

(assert (=> b!709145 m!666519))

(assert (=> b!709145 m!666417))

(declare-fun m!666521 () Bool)

(assert (=> b!709145 m!666521))

(declare-fun m!666523 () Bool)

(assert (=> bm!34428 m!666523))

(declare-fun m!666525 () Bool)

(assert (=> d!97055 m!666525))

(declare-fun m!666527 () Bool)

(assert (=> d!97055 m!666527))

(assert (=> b!708847 d!97055))

(declare-fun d!97077 () Bool)

(declare-fun res!472707 () Bool)

(declare-fun e!399135 () Bool)

(assert (=> d!97077 (=> res!472707 e!399135)))

(assert (=> d!97077 (= res!472707 (= (select (arr!19333 a!3591) from!2969) k0!2824))))

(assert (=> d!97077 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399135)))

(declare-fun b!709149 () Bool)

(declare-fun e!399136 () Bool)

(assert (=> b!709149 (= e!399135 e!399136)))

(declare-fun res!472708 () Bool)

(assert (=> b!709149 (=> (not res!472708) (not e!399136))))

(assert (=> b!709149 (= res!472708 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19724 a!3591)))))

(declare-fun b!709150 () Bool)

(assert (=> b!709150 (= e!399136 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97077 (not res!472707)) b!709149))

(assert (= (and b!709149 res!472708) b!709150))

(assert (=> d!97077 m!666219))

(declare-fun m!666529 () Bool)

(assert (=> b!709150 m!666529))

(assert (=> b!708836 d!97077))

(check-sat (not b!709077) (not b!708980) (not b!709091) (not b!708938) (not b!708996) (not d!97009) (not d!97041) (not b!709093) (not b!709019) (not d!96991) (not b!709145) (not b!709016) (not b!709018) (not d!96969) (not b!709000) (not d!97039) (not b!708936) (not b!709075) (not b!709033) (not b!709090) (not b!709095) (not bm!34416) (not d!97049) (not b!709150) (not b!709017) (not b!708935) (not b!709088) (not b!708960) (not b!709089) (not bm!34428) (not b!709072) (not b!709073) (not d!97055) (not d!96987) (not d!97051))
(check-sat)
