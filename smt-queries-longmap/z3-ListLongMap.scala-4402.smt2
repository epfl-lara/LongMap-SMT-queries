; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60500 () Bool)

(assert start!60500)

(declare-fun b!680047 () Bool)

(declare-datatypes ((Unit!23840 0))(
  ( (Unit!23841) )
))
(declare-fun e!387313 () Unit!23840)

(declare-fun Unit!23842 () Unit!23840)

(assert (=> b!680047 (= e!387313 Unit!23842)))

(declare-fun b!680048 () Bool)

(declare-datatypes ((array!39492 0))(
  ( (array!39493 (arr!18935 (Array (_ BitVec 32) (_ BitVec 64))) (size!19300 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39492)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13015 0))(
  ( (Nil!13012) (Cons!13011 (h!14056 (_ BitVec 64)) (t!19234 List!13015)) )
))
(declare-fun acc!681 () List!13015)

(declare-fun e!387312 () Bool)

(declare-fun noDuplicate!806 (List!13015) Bool)

(declare-fun $colon$colon!304 (List!13015 (_ BitVec 64)) List!13015)

(assert (=> b!680048 (= e!387312 (noDuplicate!806 ($colon$colon!304 acc!681 (select (arr!18935 a!3626) from!3004))))))

(declare-fun b!680049 () Bool)

(declare-fun res!446480 () Bool)

(declare-fun e!387309 () Bool)

(assert (=> b!680049 (=> (not res!446480) (not e!387309))))

(declare-fun e!387308 () Bool)

(assert (=> b!680049 (= res!446480 e!387308)))

(declare-fun res!446474 () Bool)

(assert (=> b!680049 (=> res!446474 e!387308)))

(declare-fun e!387310 () Bool)

(assert (=> b!680049 (= res!446474 e!387310)))

(declare-fun res!446483 () Bool)

(assert (=> b!680049 (=> (not res!446483) (not e!387310))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680049 (= res!446483 (bvsgt from!3004 i!1382))))

(declare-fun b!680050 () Bool)

(declare-fun res!446478 () Bool)

(assert (=> b!680050 (=> (not res!446478) (not e!387309))))

(assert (=> b!680050 (= res!446478 (noDuplicate!806 acc!681))))

(declare-fun b!680051 () Bool)

(declare-fun Unit!23843 () Unit!23840)

(assert (=> b!680051 (= e!387313 Unit!23843)))

(declare-fun lt!312812 () Unit!23840)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39492 (_ BitVec 64) (_ BitVec 32)) Unit!23840)

(assert (=> b!680051 (= lt!312812 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680051 false))

(declare-fun b!680052 () Bool)

(declare-fun e!387307 () Bool)

(assert (=> b!680052 (= e!387307 e!387312)))

(declare-fun res!446488 () Bool)

(assert (=> b!680052 (=> res!446488 e!387312)))

(assert (=> b!680052 (= res!446488 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!140 (List!13015 List!13015) Bool)

(assert (=> b!680052 (subseq!140 acc!681 acc!681)))

(declare-fun lt!312813 () Unit!23840)

(declare-fun lemmaListSubSeqRefl!0 (List!13015) Unit!23840)

(assert (=> b!680052 (= lt!312813 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680053 () Bool)

(declare-fun res!446481 () Bool)

(assert (=> b!680053 (=> (not res!446481) (not e!387309))))

(declare-fun arrayContainsKey!0 (array!39492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680053 (= res!446481 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680054 () Bool)

(declare-fun res!446475 () Bool)

(assert (=> b!680054 (=> (not res!446475) (not e!387309))))

(declare-fun contains!3537 (List!13015 (_ BitVec 64)) Bool)

(assert (=> b!680054 (= res!446475 (not (contains!3537 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680055 () Bool)

(assert (=> b!680055 (= e!387310 (contains!3537 acc!681 k0!2843))))

(declare-fun b!680056 () Bool)

(declare-fun res!446477 () Bool)

(assert (=> b!680056 (=> (not res!446477) (not e!387309))))

(assert (=> b!680056 (= res!446477 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19300 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680058 () Bool)

(declare-fun e!387314 () Bool)

(assert (=> b!680058 (= e!387308 e!387314)))

(declare-fun res!446484 () Bool)

(assert (=> b!680058 (=> (not res!446484) (not e!387314))))

(assert (=> b!680058 (= res!446484 (bvsle from!3004 i!1382))))

(declare-fun b!680059 () Bool)

(assert (=> b!680059 (= e!387314 (not (contains!3537 acc!681 k0!2843)))))

(declare-fun b!680060 () Bool)

(declare-fun res!446476 () Bool)

(assert (=> b!680060 (=> (not res!446476) (not e!387309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680060 (= res!446476 (validKeyInArray!0 k0!2843))))

(declare-fun b!680061 () Bool)

(declare-fun res!446473 () Bool)

(assert (=> b!680061 (=> (not res!446473) (not e!387309))))

(declare-fun arrayNoDuplicates!0 (array!39492 (_ BitVec 32) List!13015) Bool)

(assert (=> b!680061 (= res!446473 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680062 () Bool)

(declare-fun res!446485 () Bool)

(assert (=> b!680062 (=> (not res!446485) (not e!387309))))

(assert (=> b!680062 (= res!446485 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13012))))

(declare-fun b!680063 () Bool)

(declare-fun res!446487 () Bool)

(assert (=> b!680063 (=> (not res!446487) (not e!387309))))

(assert (=> b!680063 (= res!446487 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19300 a!3626))))))

(declare-fun b!680064 () Bool)

(assert (=> b!680064 (= e!387309 (not e!387307))))

(declare-fun res!446486 () Bool)

(assert (=> b!680064 (=> res!446486 e!387307)))

(assert (=> b!680064 (= res!446486 (not (validKeyInArray!0 (select (arr!18935 a!3626) from!3004))))))

(declare-fun lt!312811 () Unit!23840)

(assert (=> b!680064 (= lt!312811 e!387313)))

(declare-fun c!77154 () Bool)

(assert (=> b!680064 (= c!77154 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680064 (arrayContainsKey!0 (array!39493 (store (arr!18935 a!3626) i!1382 k0!2843) (size!19300 a!3626)) k0!2843 from!3004)))

(declare-fun res!446479 () Bool)

(assert (=> start!60500 (=> (not res!446479) (not e!387309))))

(assert (=> start!60500 (= res!446479 (and (bvslt (size!19300 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19300 a!3626))))))

(assert (=> start!60500 e!387309))

(assert (=> start!60500 true))

(declare-fun array_inv!14818 (array!39492) Bool)

(assert (=> start!60500 (array_inv!14818 a!3626)))

(declare-fun b!680057 () Bool)

(declare-fun res!446482 () Bool)

(assert (=> b!680057 (=> (not res!446482) (not e!387309))))

(assert (=> b!680057 (= res!446482 (not (contains!3537 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60500 res!446479) b!680050))

(assert (= (and b!680050 res!446478) b!680054))

(assert (= (and b!680054 res!446475) b!680057))

(assert (= (and b!680057 res!446482) b!680049))

(assert (= (and b!680049 res!446483) b!680055))

(assert (= (and b!680049 (not res!446474)) b!680058))

(assert (= (and b!680058 res!446484) b!680059))

(assert (= (and b!680049 res!446480) b!680062))

(assert (= (and b!680062 res!446485) b!680061))

(assert (= (and b!680061 res!446473) b!680063))

(assert (= (and b!680063 res!446487) b!680060))

(assert (= (and b!680060 res!446476) b!680053))

(assert (= (and b!680053 res!446481) b!680056))

(assert (= (and b!680056 res!446477) b!680064))

(assert (= (and b!680064 c!77154) b!680051))

(assert (= (and b!680064 (not c!77154)) b!680047))

(assert (= (and b!680064 (not res!446486)) b!680052))

(assert (= (and b!680052 (not res!446488)) b!680048))

(declare-fun m!644643 () Bool)

(assert (=> b!680054 m!644643))

(declare-fun m!644645 () Bool)

(assert (=> b!680053 m!644645))

(declare-fun m!644647 () Bool)

(assert (=> b!680055 m!644647))

(declare-fun m!644649 () Bool)

(assert (=> b!680048 m!644649))

(assert (=> b!680048 m!644649))

(declare-fun m!644651 () Bool)

(assert (=> b!680048 m!644651))

(assert (=> b!680048 m!644651))

(declare-fun m!644653 () Bool)

(assert (=> b!680048 m!644653))

(declare-fun m!644655 () Bool)

(assert (=> b!680062 m!644655))

(declare-fun m!644657 () Bool)

(assert (=> b!680057 m!644657))

(declare-fun m!644659 () Bool)

(assert (=> start!60500 m!644659))

(declare-fun m!644661 () Bool)

(assert (=> b!680061 m!644661))

(assert (=> b!680059 m!644647))

(declare-fun m!644663 () Bool)

(assert (=> b!680051 m!644663))

(declare-fun m!644665 () Bool)

(assert (=> b!680060 m!644665))

(declare-fun m!644667 () Bool)

(assert (=> b!680050 m!644667))

(assert (=> b!680064 m!644649))

(declare-fun m!644669 () Bool)

(assert (=> b!680064 m!644669))

(declare-fun m!644671 () Bool)

(assert (=> b!680064 m!644671))

(assert (=> b!680064 m!644649))

(declare-fun m!644673 () Bool)

(assert (=> b!680064 m!644673))

(declare-fun m!644675 () Bool)

(assert (=> b!680064 m!644675))

(declare-fun m!644677 () Bool)

(assert (=> b!680052 m!644677))

(declare-fun m!644679 () Bool)

(assert (=> b!680052 m!644679))

(check-sat (not b!680052) (not b!680060) (not b!680053) (not b!680059) (not b!680061) (not b!680057) (not start!60500) (not b!680055) (not b!680048) (not b!680051) (not b!680064) (not b!680050) (not b!680054) (not b!680062))
(check-sat)
(get-model)

(declare-fun d!93357 () Bool)

(declare-fun lt!312834 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!267 (List!13015) (InoxSet (_ BitVec 64)))

(assert (=> d!93357 (= lt!312834 (select (content!267 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387368 () Bool)

(assert (=> d!93357 (= lt!312834 e!387368)))

(declare-fun res!446589 () Bool)

(assert (=> d!93357 (=> (not res!446589) (not e!387368))))

(get-info :version)

(assert (=> d!93357 (= res!446589 ((_ is Cons!13011) acc!681))))

(assert (=> d!93357 (= (contains!3537 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312834)))

(declare-fun b!680177 () Bool)

(declare-fun e!387367 () Bool)

(assert (=> b!680177 (= e!387368 e!387367)))

(declare-fun res!446590 () Bool)

(assert (=> b!680177 (=> res!446590 e!387367)))

(assert (=> b!680177 (= res!446590 (= (h!14056 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680178 () Bool)

(assert (=> b!680178 (= e!387367 (contains!3537 (t!19234 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93357 res!446589) b!680177))

(assert (= (and b!680177 (not res!446590)) b!680178))

(declare-fun m!644757 () Bool)

(assert (=> d!93357 m!644757))

(declare-fun m!644759 () Bool)

(assert (=> d!93357 m!644759))

(declare-fun m!644761 () Bool)

(assert (=> b!680178 m!644761))

(assert (=> b!680057 d!93357))

(declare-fun d!93359 () Bool)

(assert (=> d!93359 (= (validKeyInArray!0 (select (arr!18935 a!3626) from!3004)) (and (not (= (select (arr!18935 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18935 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680064 d!93359))

(declare-fun d!93361 () Bool)

(declare-fun res!446600 () Bool)

(declare-fun e!387378 () Bool)

(assert (=> d!93361 (=> res!446600 e!387378)))

(assert (=> d!93361 (= res!446600 (= (select (arr!18935 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93361 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387378)))

(declare-fun b!680188 () Bool)

(declare-fun e!387380 () Bool)

(assert (=> b!680188 (= e!387378 e!387380)))

(declare-fun res!446602 () Bool)

(assert (=> b!680188 (=> (not res!446602) (not e!387380))))

(assert (=> b!680188 (= res!446602 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19300 a!3626)))))

(declare-fun b!680190 () Bool)

(assert (=> b!680190 (= e!387380 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93361 (not res!446600)) b!680188))

(assert (= (and b!680188 res!446602) b!680190))

(declare-fun m!644763 () Bool)

(assert (=> d!93361 m!644763))

(declare-fun m!644767 () Bool)

(assert (=> b!680190 m!644767))

(assert (=> b!680064 d!93361))

(declare-fun d!93365 () Bool)

(declare-fun res!446603 () Bool)

(declare-fun e!387381 () Bool)

(assert (=> d!93365 (=> res!446603 e!387381)))

(assert (=> d!93365 (= res!446603 (= (select (arr!18935 (array!39493 (store (arr!18935 a!3626) i!1382 k0!2843) (size!19300 a!3626))) from!3004) k0!2843))))

(assert (=> d!93365 (= (arrayContainsKey!0 (array!39493 (store (arr!18935 a!3626) i!1382 k0!2843) (size!19300 a!3626)) k0!2843 from!3004) e!387381)))

(declare-fun b!680191 () Bool)

(declare-fun e!387382 () Bool)

(assert (=> b!680191 (= e!387381 e!387382)))

(declare-fun res!446604 () Bool)

(assert (=> b!680191 (=> (not res!446604) (not e!387382))))

(assert (=> b!680191 (= res!446604 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19300 (array!39493 (store (arr!18935 a!3626) i!1382 k0!2843) (size!19300 a!3626)))))))

(declare-fun b!680192 () Bool)

(assert (=> b!680192 (= e!387382 (arrayContainsKey!0 (array!39493 (store (arr!18935 a!3626) i!1382 k0!2843) (size!19300 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93365 (not res!446603)) b!680191))

(assert (= (and b!680191 res!446604) b!680192))

(declare-fun m!644771 () Bool)

(assert (=> d!93365 m!644771))

(declare-fun m!644773 () Bool)

(assert (=> b!680192 m!644773))

(assert (=> b!680064 d!93365))

(declare-fun d!93369 () Bool)

(declare-fun lt!312835 () Bool)

(assert (=> d!93369 (= lt!312835 (select (content!267 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387384 () Bool)

(assert (=> d!93369 (= lt!312835 e!387384)))

(declare-fun res!446605 () Bool)

(assert (=> d!93369 (=> (not res!446605) (not e!387384))))

(assert (=> d!93369 (= res!446605 ((_ is Cons!13011) acc!681))))

(assert (=> d!93369 (= (contains!3537 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312835)))

(declare-fun b!680193 () Bool)

(declare-fun e!387383 () Bool)

(assert (=> b!680193 (= e!387384 e!387383)))

(declare-fun res!446606 () Bool)

(assert (=> b!680193 (=> res!446606 e!387383)))

(assert (=> b!680193 (= res!446606 (= (h!14056 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680194 () Bool)

(assert (=> b!680194 (= e!387383 (contains!3537 (t!19234 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93369 res!446605) b!680193))

(assert (= (and b!680193 (not res!446606)) b!680194))

(assert (=> d!93369 m!644757))

(declare-fun m!644775 () Bool)

(assert (=> d!93369 m!644775))

(declare-fun m!644777 () Bool)

(assert (=> b!680194 m!644777))

(assert (=> b!680054 d!93369))

(declare-fun d!93373 () Bool)

(assert (=> d!93373 (= (array_inv!14818 a!3626) (bvsge (size!19300 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60500 d!93373))

(declare-fun d!93377 () Bool)

(declare-fun lt!312836 () Bool)

(assert (=> d!93377 (= lt!312836 (select (content!267 acc!681) k0!2843))))

(declare-fun e!387388 () Bool)

(assert (=> d!93377 (= lt!312836 e!387388)))

(declare-fun res!446609 () Bool)

(assert (=> d!93377 (=> (not res!446609) (not e!387388))))

(assert (=> d!93377 (= res!446609 ((_ is Cons!13011) acc!681))))

(assert (=> d!93377 (= (contains!3537 acc!681 k0!2843) lt!312836)))

(declare-fun b!680197 () Bool)

(declare-fun e!387387 () Bool)

(assert (=> b!680197 (= e!387388 e!387387)))

(declare-fun res!446610 () Bool)

(assert (=> b!680197 (=> res!446610 e!387387)))

(assert (=> b!680197 (= res!446610 (= (h!14056 acc!681) k0!2843))))

(declare-fun b!680198 () Bool)

(assert (=> b!680198 (= e!387387 (contains!3537 (t!19234 acc!681) k0!2843))))

(assert (= (and d!93377 res!446609) b!680197))

(assert (= (and b!680197 (not res!446610)) b!680198))

(assert (=> d!93377 m!644757))

(declare-fun m!644783 () Bool)

(assert (=> d!93377 m!644783))

(declare-fun m!644785 () Bool)

(assert (=> b!680198 m!644785))

(assert (=> b!680055 d!93377))

(declare-fun d!93379 () Bool)

(assert (=> d!93379 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!312841 () Unit!23840)

(declare-fun choose!13 (array!39492 (_ BitVec 64) (_ BitVec 32)) Unit!23840)

(assert (=> d!93379 (= lt!312841 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93379 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93379 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!312841)))

(declare-fun bs!19947 () Bool)

(assert (= bs!19947 d!93379))

(assert (=> bs!19947 m!644645))

(declare-fun m!644787 () Bool)

(assert (=> bs!19947 m!644787))

(assert (=> b!680051 d!93379))

(declare-fun b!680225 () Bool)

(declare-fun e!387416 () Bool)

(assert (=> b!680225 (= e!387416 (contains!3537 Nil!13012 (select (arr!18935 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93381 () Bool)

(declare-fun res!446633 () Bool)

(declare-fun e!387414 () Bool)

(assert (=> d!93381 (=> res!446633 e!387414)))

(assert (=> d!93381 (= res!446633 (bvsge #b00000000000000000000000000000000 (size!19300 a!3626)))))

(assert (=> d!93381 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13012) e!387414)))

(declare-fun b!680226 () Bool)

(declare-fun e!387413 () Bool)

(declare-fun e!387415 () Bool)

(assert (=> b!680226 (= e!387413 e!387415)))

(declare-fun c!77163 () Bool)

(assert (=> b!680226 (= c!77163 (validKeyInArray!0 (select (arr!18935 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680227 () Bool)

(declare-fun call!33913 () Bool)

(assert (=> b!680227 (= e!387415 call!33913)))

(declare-fun bm!33910 () Bool)

(assert (=> bm!33910 (= call!33913 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77163 (Cons!13011 (select (arr!18935 a!3626) #b00000000000000000000000000000000) Nil!13012) Nil!13012)))))

(declare-fun b!680228 () Bool)

(assert (=> b!680228 (= e!387414 e!387413)))

(declare-fun res!446634 () Bool)

(assert (=> b!680228 (=> (not res!446634) (not e!387413))))

(assert (=> b!680228 (= res!446634 (not e!387416))))

(declare-fun res!446635 () Bool)

(assert (=> b!680228 (=> (not res!446635) (not e!387416))))

(assert (=> b!680228 (= res!446635 (validKeyInArray!0 (select (arr!18935 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680229 () Bool)

(assert (=> b!680229 (= e!387415 call!33913)))

(assert (= (and d!93381 (not res!446633)) b!680228))

(assert (= (and b!680228 res!446635) b!680225))

(assert (= (and b!680228 res!446634) b!680226))

(assert (= (and b!680226 c!77163) b!680227))

(assert (= (and b!680226 (not c!77163)) b!680229))

(assert (= (or b!680227 b!680229) bm!33910))

(declare-fun m!644807 () Bool)

(assert (=> b!680225 m!644807))

(assert (=> b!680225 m!644807))

(declare-fun m!644809 () Bool)

(assert (=> b!680225 m!644809))

(assert (=> b!680226 m!644807))

(assert (=> b!680226 m!644807))

(declare-fun m!644811 () Bool)

(assert (=> b!680226 m!644811))

(assert (=> bm!33910 m!644807))

(declare-fun m!644813 () Bool)

(assert (=> bm!33910 m!644813))

(assert (=> b!680228 m!644807))

(assert (=> b!680228 m!644807))

(assert (=> b!680228 m!644811))

(assert (=> b!680062 d!93381))

(declare-fun b!680247 () Bool)

(declare-fun e!387433 () Bool)

(declare-fun e!387434 () Bool)

(assert (=> b!680247 (= e!387433 e!387434)))

(declare-fun res!446653 () Bool)

(assert (=> b!680247 (=> res!446653 e!387434)))

(declare-fun e!387436 () Bool)

(assert (=> b!680247 (= res!446653 e!387436)))

(declare-fun res!446655 () Bool)

(assert (=> b!680247 (=> (not res!446655) (not e!387436))))

(assert (=> b!680247 (= res!446655 (= (h!14056 acc!681) (h!14056 acc!681)))))

(declare-fun b!680249 () Bool)

(assert (=> b!680249 (= e!387434 (subseq!140 acc!681 (t!19234 acc!681)))))

(declare-fun b!680248 () Bool)

(assert (=> b!680248 (= e!387436 (subseq!140 (t!19234 acc!681) (t!19234 acc!681)))))

(declare-fun b!680246 () Bool)

(declare-fun e!387435 () Bool)

(assert (=> b!680246 (= e!387435 e!387433)))

(declare-fun res!446652 () Bool)

(assert (=> b!680246 (=> (not res!446652) (not e!387433))))

(assert (=> b!680246 (= res!446652 ((_ is Cons!13011) acc!681))))

(declare-fun d!93399 () Bool)

(declare-fun res!446654 () Bool)

(assert (=> d!93399 (=> res!446654 e!387435)))

(assert (=> d!93399 (= res!446654 ((_ is Nil!13012) acc!681))))

(assert (=> d!93399 (= (subseq!140 acc!681 acc!681) e!387435)))

(assert (= (and d!93399 (not res!446654)) b!680246))

(assert (= (and b!680246 res!446652) b!680247))

(assert (= (and b!680247 res!446655) b!680248))

(assert (= (and b!680247 (not res!446653)) b!680249))

(declare-fun m!644819 () Bool)

(assert (=> b!680249 m!644819))

(declare-fun m!644821 () Bool)

(assert (=> b!680248 m!644821))

(assert (=> b!680052 d!93399))

(declare-fun d!93405 () Bool)

(assert (=> d!93405 (subseq!140 acc!681 acc!681)))

(declare-fun lt!312852 () Unit!23840)

(declare-fun choose!36 (List!13015) Unit!23840)

(assert (=> d!93405 (= lt!312852 (choose!36 acc!681))))

(assert (=> d!93405 (= (lemmaListSubSeqRefl!0 acc!681) lt!312852)))

(declare-fun bs!19950 () Bool)

(assert (= bs!19950 d!93405))

(assert (=> bs!19950 m!644677))

(declare-fun m!644827 () Bool)

(assert (=> bs!19950 m!644827))

(assert (=> b!680052 d!93405))

(declare-fun d!93409 () Bool)

(declare-fun res!446660 () Bool)

(declare-fun e!387441 () Bool)

(assert (=> d!93409 (=> res!446660 e!387441)))

(assert (=> d!93409 (= res!446660 (= (select (arr!18935 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93409 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!387441)))

(declare-fun b!680254 () Bool)

(declare-fun e!387442 () Bool)

(assert (=> b!680254 (= e!387441 e!387442)))

(declare-fun res!446661 () Bool)

(assert (=> b!680254 (=> (not res!446661) (not e!387442))))

(assert (=> b!680254 (= res!446661 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19300 a!3626)))))

(declare-fun b!680255 () Bool)

(assert (=> b!680255 (= e!387442 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93409 (not res!446660)) b!680254))

(assert (= (and b!680254 res!446661) b!680255))

(assert (=> d!93409 m!644807))

(declare-fun m!644829 () Bool)

(assert (=> b!680255 m!644829))

(assert (=> b!680053 d!93409))

(declare-fun d!93411 () Bool)

(declare-fun res!446672 () Bool)

(declare-fun e!387454 () Bool)

(assert (=> d!93411 (=> res!446672 e!387454)))

(assert (=> d!93411 (= res!446672 ((_ is Nil!13012) ($colon$colon!304 acc!681 (select (arr!18935 a!3626) from!3004))))))

(assert (=> d!93411 (= (noDuplicate!806 ($colon$colon!304 acc!681 (select (arr!18935 a!3626) from!3004))) e!387454)))

(declare-fun b!680270 () Bool)

(declare-fun e!387455 () Bool)

(assert (=> b!680270 (= e!387454 e!387455)))

(declare-fun res!446673 () Bool)

(assert (=> b!680270 (=> (not res!446673) (not e!387455))))

(assert (=> b!680270 (= res!446673 (not (contains!3537 (t!19234 ($colon$colon!304 acc!681 (select (arr!18935 a!3626) from!3004))) (h!14056 ($colon$colon!304 acc!681 (select (arr!18935 a!3626) from!3004))))))))

(declare-fun b!680271 () Bool)

(assert (=> b!680271 (= e!387455 (noDuplicate!806 (t!19234 ($colon$colon!304 acc!681 (select (arr!18935 a!3626) from!3004)))))))

(assert (= (and d!93411 (not res!446672)) b!680270))

(assert (= (and b!680270 res!446673) b!680271))

(declare-fun m!644833 () Bool)

(assert (=> b!680270 m!644833))

(declare-fun m!644835 () Bool)

(assert (=> b!680271 m!644835))

(assert (=> b!680048 d!93411))

(declare-fun d!93415 () Bool)

(assert (=> d!93415 (= ($colon$colon!304 acc!681 (select (arr!18935 a!3626) from!3004)) (Cons!13011 (select (arr!18935 a!3626) from!3004) acc!681))))

(assert (=> b!680048 d!93415))

(assert (=> b!680059 d!93377))

(declare-fun d!93417 () Bool)

(assert (=> d!93417 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680060 d!93417))

(declare-fun d!93419 () Bool)

(declare-fun res!446674 () Bool)

(declare-fun e!387457 () Bool)

(assert (=> d!93419 (=> res!446674 e!387457)))

(assert (=> d!93419 (= res!446674 ((_ is Nil!13012) acc!681))))

(assert (=> d!93419 (= (noDuplicate!806 acc!681) e!387457)))

(declare-fun b!680272 () Bool)

(declare-fun e!387458 () Bool)

(assert (=> b!680272 (= e!387457 e!387458)))

(declare-fun res!446675 () Bool)

(assert (=> b!680272 (=> (not res!446675) (not e!387458))))

(assert (=> b!680272 (= res!446675 (not (contains!3537 (t!19234 acc!681) (h!14056 acc!681))))))

(declare-fun b!680273 () Bool)

(assert (=> b!680273 (= e!387458 (noDuplicate!806 (t!19234 acc!681)))))

(assert (= (and d!93419 (not res!446674)) b!680272))

(assert (= (and b!680272 res!446675) b!680273))

(declare-fun m!644837 () Bool)

(assert (=> b!680272 m!644837))

(declare-fun m!644839 () Bool)

(assert (=> b!680273 m!644839))

(assert (=> b!680050 d!93419))

(declare-fun e!387462 () Bool)

(declare-fun b!680274 () Bool)

(assert (=> b!680274 (= e!387462 (contains!3537 acc!681 (select (arr!18935 a!3626) from!3004)))))

(declare-fun d!93421 () Bool)

(declare-fun res!446676 () Bool)

(declare-fun e!387460 () Bool)

(assert (=> d!93421 (=> res!446676 e!387460)))

(assert (=> d!93421 (= res!446676 (bvsge from!3004 (size!19300 a!3626)))))

(assert (=> d!93421 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387460)))

(declare-fun b!680275 () Bool)

(declare-fun e!387459 () Bool)

(declare-fun e!387461 () Bool)

(assert (=> b!680275 (= e!387459 e!387461)))

(declare-fun c!77166 () Bool)

(assert (=> b!680275 (= c!77166 (validKeyInArray!0 (select (arr!18935 a!3626) from!3004)))))

(declare-fun b!680276 () Bool)

(declare-fun call!33916 () Bool)

(assert (=> b!680276 (= e!387461 call!33916)))

(declare-fun bm!33913 () Bool)

(assert (=> bm!33913 (= call!33916 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77166 (Cons!13011 (select (arr!18935 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!680277 () Bool)

(assert (=> b!680277 (= e!387460 e!387459)))

(declare-fun res!446677 () Bool)

(assert (=> b!680277 (=> (not res!446677) (not e!387459))))

(assert (=> b!680277 (= res!446677 (not e!387462))))

(declare-fun res!446678 () Bool)

(assert (=> b!680277 (=> (not res!446678) (not e!387462))))

(assert (=> b!680277 (= res!446678 (validKeyInArray!0 (select (arr!18935 a!3626) from!3004)))))

(declare-fun b!680278 () Bool)

(assert (=> b!680278 (= e!387461 call!33916)))

(assert (= (and d!93421 (not res!446676)) b!680277))

(assert (= (and b!680277 res!446678) b!680274))

(assert (= (and b!680277 res!446677) b!680275))

(assert (= (and b!680275 c!77166) b!680276))

(assert (= (and b!680275 (not c!77166)) b!680278))

(assert (= (or b!680276 b!680278) bm!33913))

(assert (=> b!680274 m!644649))

(assert (=> b!680274 m!644649))

(declare-fun m!644841 () Bool)

(assert (=> b!680274 m!644841))

(assert (=> b!680275 m!644649))

(assert (=> b!680275 m!644649))

(assert (=> b!680275 m!644673))

(assert (=> bm!33913 m!644649))

(declare-fun m!644843 () Bool)

(assert (=> bm!33913 m!644843))

(assert (=> b!680277 m!644649))

(assert (=> b!680277 m!644649))

(assert (=> b!680277 m!644673))

(assert (=> b!680061 d!93421))

(check-sat (not b!680272) (not d!93379) (not b!680275) (not b!680273) (not b!680274) (not b!680277) (not b!680194) (not b!680270) (not b!680271) (not b!680192) (not b!680226) (not b!680190) (not b!680225) (not b!680248) (not d!93405) (not b!680228) (not d!93369) (not b!680249) (not b!680198) (not bm!33913) (not bm!33910) (not b!680255) (not d!93377) (not b!680178) (not d!93357))
(check-sat)
