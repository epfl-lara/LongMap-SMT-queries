; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61596 () Bool)

(assert start!61596)

(declare-fun b!689794 () Bool)

(declare-fun e!392703 () Bool)

(declare-datatypes ((List!13081 0))(
  ( (Nil!13078) (Cons!13077 (h!14122 (_ BitVec 64)) (t!19345 List!13081)) )
))
(declare-fun acc!681 () List!13081)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3658 (List!13081 (_ BitVec 64)) Bool)

(assert (=> b!689794 (= e!392703 (not (contains!3658 acc!681 k!2843)))))

(declare-fun b!689795 () Bool)

(declare-fun res!454296 () Bool)

(declare-fun e!392696 () Bool)

(assert (=> b!689795 (=> (not res!454296) (not e!392696))))

(declare-datatypes ((array!39737 0))(
  ( (array!39738 (arr!19040 (Array (_ BitVec 32) (_ BitVec 64))) (size!19422 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39737)

(declare-fun arrayContainsKey!0 (array!39737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689795 (= res!454296 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689796 () Bool)

(declare-fun e!392698 () Bool)

(assert (=> b!689796 (= e!392698 e!392703)))

(declare-fun res!454297 () Bool)

(assert (=> b!689796 (=> (not res!454297) (not e!392703))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689796 (= res!454297 (bvsle from!3004 i!1382))))

(declare-fun res!454295 () Bool)

(assert (=> start!61596 (=> (not res!454295) (not e!392696))))

(assert (=> start!61596 (= res!454295 (and (bvslt (size!19422 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19422 a!3626))))))

(assert (=> start!61596 e!392696))

(assert (=> start!61596 true))

(declare-fun array_inv!14836 (array!39737) Bool)

(assert (=> start!61596 (array_inv!14836 a!3626)))

(declare-fun b!689797 () Bool)

(declare-fun e!392699 () Bool)

(declare-fun lt!316316 () List!13081)

(assert (=> b!689797 (= e!392699 (contains!3658 lt!316316 k!2843))))

(declare-fun b!689798 () Bool)

(declare-fun e!392693 () Bool)

(assert (=> b!689798 (= e!392693 (contains!3658 acc!681 k!2843))))

(declare-fun b!689799 () Bool)

(declare-datatypes ((Unit!24367 0))(
  ( (Unit!24368) )
))
(declare-fun e!392697 () Unit!24367)

(declare-fun Unit!24369 () Unit!24367)

(assert (=> b!689799 (= e!392697 Unit!24369)))

(declare-fun b!689800 () Bool)

(declare-fun res!454291 () Bool)

(declare-fun e!392701 () Bool)

(assert (=> b!689800 (=> res!454291 e!392701)))

(assert (=> b!689800 (= res!454291 (contains!3658 lt!316316 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689801 () Bool)

(assert (=> b!689801 (= e!392696 (not e!392701))))

(declare-fun res!454304 () Bool)

(assert (=> b!689801 (=> res!454304 e!392701)))

(assert (=> b!689801 (= res!454304 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39737 (_ BitVec 32) List!13081) Bool)

(assert (=> b!689801 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316316)))

(declare-fun lt!316318 () Unit!24367)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39737 (_ BitVec 64) (_ BitVec 32) List!13081 List!13081) Unit!24367)

(assert (=> b!689801 (= lt!316318 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316316))))

(declare-fun -!209 (List!13081 (_ BitVec 64)) List!13081)

(assert (=> b!689801 (= (-!209 lt!316316 k!2843) acc!681)))

(declare-fun $colon$colon!409 (List!13081 (_ BitVec 64)) List!13081)

(assert (=> b!689801 (= lt!316316 ($colon$colon!409 acc!681 k!2843))))

(declare-fun lt!316313 () Unit!24367)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13081) Unit!24367)

(assert (=> b!689801 (= lt!316313 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!244 (List!13081 List!13081) Bool)

(assert (=> b!689801 (subseq!244 acc!681 acc!681)))

(declare-fun lt!316314 () Unit!24367)

(declare-fun lemmaListSubSeqRefl!0 (List!13081) Unit!24367)

(assert (=> b!689801 (= lt!316314 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689801 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316309 () Unit!24367)

(assert (=> b!689801 (= lt!316309 e!392697)))

(declare-fun c!78121 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689801 (= c!78121 (validKeyInArray!0 (select (arr!19040 a!3626) from!3004)))))

(declare-fun lt!316308 () Unit!24367)

(declare-fun e!392700 () Unit!24367)

(assert (=> b!689801 (= lt!316308 e!392700)))

(declare-fun c!78122 () Bool)

(assert (=> b!689801 (= c!78122 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!316310 () array!39737)

(assert (=> b!689801 (arrayContainsKey!0 lt!316310 k!2843 from!3004)))

(assert (=> b!689801 (= lt!316310 (array!39738 (store (arr!19040 a!3626) i!1382 k!2843) (size!19422 a!3626)))))

(declare-fun b!689802 () Bool)

(declare-fun Unit!24370 () Unit!24367)

(assert (=> b!689802 (= e!392700 Unit!24370)))

(declare-fun b!689803 () Bool)

(declare-fun res!454298 () Bool)

(assert (=> b!689803 (=> (not res!454298) (not e!392696))))

(assert (=> b!689803 (= res!454298 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19422 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689804 () Bool)

(declare-fun res!454286 () Bool)

(assert (=> b!689804 (=> (not res!454286) (not e!392696))))

(assert (=> b!689804 (= res!454286 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13078))))

(declare-fun b!689805 () Bool)

(declare-fun e!392702 () Bool)

(assert (=> b!689805 (= e!392702 (not (contains!3658 lt!316316 k!2843)))))

(declare-fun b!689806 () Bool)

(declare-fun res!454289 () Bool)

(assert (=> b!689806 (=> (not res!454289) (not e!392696))))

(assert (=> b!689806 (= res!454289 (validKeyInArray!0 k!2843))))

(declare-fun b!689807 () Bool)

(assert (=> b!689807 (= e!392701 (arrayNoDuplicates!0 lt!316310 from!3004 acc!681))))

(assert (=> b!689807 (arrayNoDuplicates!0 lt!316310 (bvadd #b00000000000000000000000000000001 from!3004) lt!316316)))

(declare-fun lt!316315 () Unit!24367)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39737 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13081) Unit!24367)

(assert (=> b!689807 (= lt!316315 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316316))))

(declare-fun b!689808 () Bool)

(declare-fun res!454287 () Bool)

(assert (=> b!689808 (=> (not res!454287) (not e!392696))))

(assert (=> b!689808 (= res!454287 (not (contains!3658 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689809 () Bool)

(declare-fun res!454299 () Bool)

(assert (=> b!689809 (=> (not res!454299) (not e!392696))))

(assert (=> b!689809 (= res!454299 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19422 a!3626))))))

(declare-fun b!689810 () Bool)

(declare-fun res!454300 () Bool)

(assert (=> b!689810 (=> (not res!454300) (not e!392696))))

(assert (=> b!689810 (= res!454300 (not (contains!3658 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689811 () Bool)

(declare-fun res!454288 () Bool)

(assert (=> b!689811 (=> res!454288 e!392701)))

(declare-fun e!392694 () Bool)

(assert (=> b!689811 (= res!454288 e!392694)))

(declare-fun res!454305 () Bool)

(assert (=> b!689811 (=> (not res!454305) (not e!392694))))

(assert (=> b!689811 (= res!454305 e!392702)))

(declare-fun res!454306 () Bool)

(assert (=> b!689811 (=> res!454306 e!392702)))

(assert (=> b!689811 (= res!454306 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689812 () Bool)

(declare-fun res!454293 () Bool)

(assert (=> b!689812 (=> res!454293 e!392701)))

(assert (=> b!689812 (= res!454293 (contains!3658 lt!316316 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689813 () Bool)

(declare-fun res!454292 () Bool)

(assert (=> b!689813 (=> (not res!454292) (not e!392696))))

(assert (=> b!689813 (= res!454292 e!392698)))

(declare-fun res!454307 () Bool)

(assert (=> b!689813 (=> res!454307 e!392698)))

(assert (=> b!689813 (= res!454307 e!392693)))

(declare-fun res!454294 () Bool)

(assert (=> b!689813 (=> (not res!454294) (not e!392693))))

(assert (=> b!689813 (= res!454294 (bvsgt from!3004 i!1382))))

(declare-fun b!689814 () Bool)

(declare-fun res!454290 () Bool)

(assert (=> b!689814 (=> res!454290 e!392701)))

(declare-fun noDuplicate!905 (List!13081) Bool)

(assert (=> b!689814 (= res!454290 (not (noDuplicate!905 lt!316316)))))

(declare-fun b!689815 () Bool)

(assert (=> b!689815 (= e!392694 e!392699)))

(declare-fun res!454303 () Bool)

(assert (=> b!689815 (=> res!454303 e!392699)))

(assert (=> b!689815 (= res!454303 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689816 () Bool)

(declare-fun res!454301 () Bool)

(assert (=> b!689816 (=> (not res!454301) (not e!392696))))

(assert (=> b!689816 (= res!454301 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689817 () Bool)

(declare-fun lt!316317 () Unit!24367)

(assert (=> b!689817 (= e!392697 lt!316317)))

(declare-fun lt!316312 () Unit!24367)

(assert (=> b!689817 (= lt!316312 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689817 (subseq!244 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39737 List!13081 List!13081 (_ BitVec 32)) Unit!24367)

(assert (=> b!689817 (= lt!316317 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!409 acc!681 (select (arr!19040 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689817 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689818 () Bool)

(declare-fun Unit!24371 () Unit!24367)

(assert (=> b!689818 (= e!392700 Unit!24371)))

(declare-fun lt!316311 () Unit!24367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39737 (_ BitVec 64) (_ BitVec 32)) Unit!24367)

(assert (=> b!689818 (= lt!316311 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689818 false))

(declare-fun b!689819 () Bool)

(declare-fun res!454302 () Bool)

(assert (=> b!689819 (=> (not res!454302) (not e!392696))))

(assert (=> b!689819 (= res!454302 (noDuplicate!905 acc!681))))

(assert (= (and start!61596 res!454295) b!689819))

(assert (= (and b!689819 res!454302) b!689808))

(assert (= (and b!689808 res!454287) b!689810))

(assert (= (and b!689810 res!454300) b!689813))

(assert (= (and b!689813 res!454294) b!689798))

(assert (= (and b!689813 (not res!454307)) b!689796))

(assert (= (and b!689796 res!454297) b!689794))

(assert (= (and b!689813 res!454292) b!689804))

(assert (= (and b!689804 res!454286) b!689816))

(assert (= (and b!689816 res!454301) b!689809))

(assert (= (and b!689809 res!454299) b!689806))

(assert (= (and b!689806 res!454289) b!689795))

(assert (= (and b!689795 res!454296) b!689803))

(assert (= (and b!689803 res!454298) b!689801))

(assert (= (and b!689801 c!78122) b!689818))

(assert (= (and b!689801 (not c!78122)) b!689802))

(assert (= (and b!689801 c!78121) b!689817))

(assert (= (and b!689801 (not c!78121)) b!689799))

(assert (= (and b!689801 (not res!454304)) b!689814))

(assert (= (and b!689814 (not res!454290)) b!689800))

(assert (= (and b!689800 (not res!454291)) b!689812))

(assert (= (and b!689812 (not res!454293)) b!689811))

(assert (= (and b!689811 (not res!454306)) b!689805))

(assert (= (and b!689811 res!454305) b!689815))

(assert (= (and b!689815 (not res!454303)) b!689797))

(assert (= (and b!689811 (not res!454288)) b!689807))

(declare-fun m!653383 () Bool)

(assert (=> b!689818 m!653383))

(declare-fun m!653385 () Bool)

(assert (=> b!689816 m!653385))

(declare-fun m!653387 () Bool)

(assert (=> b!689808 m!653387))

(declare-fun m!653389 () Bool)

(assert (=> b!689797 m!653389))

(declare-fun m!653391 () Bool)

(assert (=> b!689812 m!653391))

(assert (=> b!689805 m!653389))

(declare-fun m!653393 () Bool)

(assert (=> b!689795 m!653393))

(declare-fun m!653395 () Bool)

(assert (=> b!689800 m!653395))

(declare-fun m!653397 () Bool)

(assert (=> b!689798 m!653397))

(declare-fun m!653399 () Bool)

(assert (=> b!689807 m!653399))

(declare-fun m!653401 () Bool)

(assert (=> b!689807 m!653401))

(declare-fun m!653403 () Bool)

(assert (=> b!689807 m!653403))

(declare-fun m!653405 () Bool)

(assert (=> b!689819 m!653405))

(declare-fun m!653407 () Bool)

(assert (=> b!689804 m!653407))

(declare-fun m!653409 () Bool)

(assert (=> start!61596 m!653409))

(declare-fun m!653411 () Bool)

(assert (=> b!689817 m!653411))

(declare-fun m!653413 () Bool)

(assert (=> b!689817 m!653413))

(declare-fun m!653415 () Bool)

(assert (=> b!689817 m!653415))

(declare-fun m!653417 () Bool)

(assert (=> b!689817 m!653417))

(assert (=> b!689817 m!653413))

(assert (=> b!689817 m!653415))

(declare-fun m!653419 () Bool)

(assert (=> b!689817 m!653419))

(declare-fun m!653421 () Bool)

(assert (=> b!689817 m!653421))

(declare-fun m!653423 () Bool)

(assert (=> b!689810 m!653423))

(assert (=> b!689794 m!653397))

(declare-fun m!653425 () Bool)

(assert (=> b!689814 m!653425))

(assert (=> b!689801 m!653411))

(assert (=> b!689801 m!653413))

(declare-fun m!653427 () Bool)

(assert (=> b!689801 m!653427))

(declare-fun m!653429 () Bool)

(assert (=> b!689801 m!653429))

(assert (=> b!689801 m!653419))

(declare-fun m!653431 () Bool)

(assert (=> b!689801 m!653431))

(declare-fun m!653433 () Bool)

(assert (=> b!689801 m!653433))

(assert (=> b!689801 m!653413))

(declare-fun m!653435 () Bool)

(assert (=> b!689801 m!653435))

(assert (=> b!689801 m!653421))

(declare-fun m!653437 () Bool)

(assert (=> b!689801 m!653437))

(declare-fun m!653439 () Bool)

(assert (=> b!689801 m!653439))

(declare-fun m!653441 () Bool)

(assert (=> b!689801 m!653441))

(declare-fun m!653443 () Bool)

(assert (=> b!689801 m!653443))

(declare-fun m!653445 () Bool)

(assert (=> b!689806 m!653445))

(push 1)

(assert (not b!689816))

(assert (not b!689798))

(assert (not b!689818))

(assert (not b!689806))

(assert (not b!689797))

(assert (not b!689800))

(assert (not b!689794))

(assert (not b!689795))

(assert (not b!689817))

(assert (not b!689814))

(assert (not b!689807))

(assert (not b!689805))

(assert (not b!689808))

(assert (not start!61596))

(assert (not b!689810))

(assert (not b!689804))

(assert (not b!689819))

(assert (not b!689801))

(assert (not b!689812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95255 () Bool)

(declare-fun lt!316324 () Bool)

(declare-fun content!303 (List!13081) (Set (_ BitVec 64)))

(assert (=> d!95255 (= lt!316324 (member k!2843 (content!303 acc!681)))))

(declare-fun e!392727 () Bool)

(assert (=> d!95255 (= lt!316324 e!392727)))

(declare-fun res!454327 () Bool)

(assert (=> d!95255 (=> (not res!454327) (not e!392727))))

(assert (=> d!95255 (= res!454327 (is-Cons!13077 acc!681))))

(assert (=> d!95255 (= (contains!3658 acc!681 k!2843) lt!316324)))

(declare-fun b!689847 () Bool)

(declare-fun e!392728 () Bool)

(assert (=> b!689847 (= e!392727 e!392728)))

(declare-fun res!454328 () Bool)

(assert (=> b!689847 (=> res!454328 e!392728)))

(assert (=> b!689847 (= res!454328 (= (h!14122 acc!681) k!2843))))

(declare-fun b!689848 () Bool)

(assert (=> b!689848 (= e!392728 (contains!3658 (t!19345 acc!681) k!2843))))

(assert (= (and d!95255 res!454327) b!689847))

(assert (= (and b!689847 (not res!454328)) b!689848))

(declare-fun m!653467 () Bool)

(assert (=> d!95255 m!653467))

(declare-fun m!653469 () Bool)

(assert (=> d!95255 m!653469))

(declare-fun m!653471 () Bool)

(assert (=> b!689848 m!653471))

(assert (=> b!689798 d!95255))

(declare-fun d!95259 () Bool)

(assert (=> d!95259 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316327 () Unit!24367)

(declare-fun choose!13 (array!39737 (_ BitVec 64) (_ BitVec 32)) Unit!24367)

(assert (=> d!95259 (= lt!316327 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95259 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95259 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!316327)))

(declare-fun bs!20206 () Bool)

(assert (= bs!20206 d!95259))

(assert (=> bs!20206 m!653393))

(declare-fun m!653477 () Bool)

(assert (=> bs!20206 m!653477))

(assert (=> b!689818 d!95259))

(declare-fun d!95263 () Bool)

(declare-fun lt!316328 () Bool)

(assert (=> d!95263 (= lt!316328 (member k!2843 (content!303 lt!316316)))))

(declare-fun e!392735 () Bool)

(assert (=> d!95263 (= lt!316328 e!392735)))

(declare-fun res!454335 () Bool)

(assert (=> d!95263 (=> (not res!454335) (not e!392735))))

(assert (=> d!95263 (= res!454335 (is-Cons!13077 lt!316316))))

(assert (=> d!95263 (= (contains!3658 lt!316316 k!2843) lt!316328)))

(declare-fun b!689855 () Bool)

(declare-fun e!392736 () Bool)

(assert (=> b!689855 (= e!392735 e!392736)))

(declare-fun res!454336 () Bool)

(assert (=> b!689855 (=> res!454336 e!392736)))

(assert (=> b!689855 (= res!454336 (= (h!14122 lt!316316) k!2843))))

(declare-fun b!689856 () Bool)

(assert (=> b!689856 (= e!392736 (contains!3658 (t!19345 lt!316316) k!2843))))

(assert (= (and d!95263 res!454335) b!689855))

(assert (= (and b!689855 (not res!454336)) b!689856))

(declare-fun m!653479 () Bool)

(assert (=> d!95263 m!653479))

(declare-fun m!653481 () Bool)

(assert (=> d!95263 m!653481))

(declare-fun m!653483 () Bool)

(assert (=> b!689856 m!653483))

(assert (=> b!689797 d!95263))

(declare-fun d!95267 () Bool)

(declare-fun lt!316329 () Bool)

(assert (=> d!95267 (= lt!316329 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!303 acc!681)))))

(declare-fun e!392737 () Bool)

(assert (=> d!95267 (= lt!316329 e!392737)))

(declare-fun res!454337 () Bool)

(assert (=> d!95267 (=> (not res!454337) (not e!392737))))

(assert (=> d!95267 (= res!454337 (is-Cons!13077 acc!681))))

(assert (=> d!95267 (= (contains!3658 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316329)))

(declare-fun b!689857 () Bool)

(declare-fun e!392738 () Bool)

(assert (=> b!689857 (= e!392737 e!392738)))

(declare-fun res!454338 () Bool)

(assert (=> b!689857 (=> res!454338 e!392738)))

(assert (=> b!689857 (= res!454338 (= (h!14122 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689858 () Bool)

(assert (=> b!689858 (= e!392738 (contains!3658 (t!19345 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95267 res!454337) b!689857))

(assert (= (and b!689857 (not res!454338)) b!689858))

(assert (=> d!95267 m!653467))

(declare-fun m!653485 () Bool)

(assert (=> d!95267 m!653485))

(declare-fun m!653487 () Bool)

(assert (=> b!689858 m!653487))

(assert (=> b!689808 d!95267))

(declare-fun d!95269 () Bool)

(declare-fun res!454351 () Bool)

(declare-fun e!392751 () Bool)

(assert (=> d!95269 (=> res!454351 e!392751)))

(assert (=> d!95269 (= res!454351 (is-Nil!13078 acc!681))))

(assert (=> d!95269 (= (noDuplicate!905 acc!681) e!392751)))

(declare-fun b!689871 () Bool)

(declare-fun e!392752 () Bool)

(assert (=> b!689871 (= e!392751 e!392752)))

(declare-fun res!454352 () Bool)

(assert (=> b!689871 (=> (not res!454352) (not e!392752))))

(assert (=> b!689871 (= res!454352 (not (contains!3658 (t!19345 acc!681) (h!14122 acc!681))))))

(declare-fun b!689872 () Bool)

(assert (=> b!689872 (= e!392752 (noDuplicate!905 (t!19345 acc!681)))))

(assert (= (and d!95269 (not res!454351)) b!689871))

(assert (= (and b!689871 res!454352) b!689872))

(declare-fun m!653489 () Bool)

(assert (=> b!689871 m!653489))

(declare-fun m!653491 () Bool)

(assert (=> b!689872 m!653491))

(assert (=> b!689819 d!95269))

(declare-fun d!95273 () Bool)

(assert (=> d!95273 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689806 d!95273))

(declare-fun d!95277 () Bool)

(assert (=> d!95277 (= ($colon$colon!409 acc!681 (select (arr!19040 a!3626) from!3004)) (Cons!13077 (select (arr!19040 a!3626) from!3004) acc!681))))

(assert (=> b!689817 d!95277))

(declare-fun d!95281 () Bool)

(declare-fun res!454379 () Bool)

(declare-fun e!392783 () Bool)

(assert (=> d!95281 (=> res!454379 e!392783)))

(assert (=> d!95281 (= res!454379 (is-Nil!13078 acc!681))))

(assert (=> d!95281 (= (subseq!244 acc!681 acc!681) e!392783)))

(declare-fun b!689906 () Bool)

(declare-fun e!392785 () Bool)

(declare-fun e!392782 () Bool)

(assert (=> b!689906 (= e!392785 e!392782)))

(declare-fun res!454380 () Bool)

(assert (=> b!689906 (=> res!454380 e!392782)))

(declare-fun e!392784 () Bool)

(assert (=> b!689906 (= res!454380 e!392784)))

(declare-fun res!454378 () Bool)

(assert (=> b!689906 (=> (not res!454378) (not e!392784))))

(assert (=> b!689906 (= res!454378 (= (h!14122 acc!681) (h!14122 acc!681)))))

(declare-fun b!689908 () Bool)

(assert (=> b!689908 (= e!392782 (subseq!244 acc!681 (t!19345 acc!681)))))

(declare-fun b!689907 () Bool)

(assert (=> b!689907 (= e!392784 (subseq!244 (t!19345 acc!681) (t!19345 acc!681)))))

(declare-fun b!689905 () Bool)

(assert (=> b!689905 (= e!392783 e!392785)))

(declare-fun res!454377 () Bool)

(assert (=> b!689905 (=> (not res!454377) (not e!392785))))

(assert (=> b!689905 (= res!454377 (is-Cons!13077 acc!681))))

(assert (= (and d!95281 (not res!454379)) b!689905))

(assert (= (and b!689905 res!454377) b!689906))

(assert (= (and b!689906 res!454378) b!689907))

(assert (= (and b!689906 (not res!454380)) b!689908))

(declare-fun m!653527 () Bool)

(assert (=> b!689908 m!653527))

(declare-fun m!653529 () Bool)

(assert (=> b!689907 m!653529))

(assert (=> b!689817 d!95281))

(declare-fun d!95293 () Bool)

(assert (=> d!95293 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316347 () Unit!24367)

(declare-fun choose!80 (array!39737 List!13081 List!13081 (_ BitVec 32)) Unit!24367)

(assert (=> d!95293 (= lt!316347 (choose!80 a!3626 ($colon$colon!409 acc!681 (select (arr!19040 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95293 (bvslt (size!19422 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95293 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!409 acc!681 (select (arr!19040 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!316347)))

(declare-fun bs!20207 () Bool)

(assert (= bs!20207 d!95293))

(assert (=> bs!20207 m!653411))

(assert (=> bs!20207 m!653415))

(declare-fun m!653543 () Bool)

(assert (=> bs!20207 m!653543))

(assert (=> b!689817 d!95293))

(declare-fun d!95297 () Bool)

(assert (=> d!95297 (subseq!244 acc!681 acc!681)))

(declare-fun lt!316351 () Unit!24367)

(declare-fun choose!36 (List!13081) Unit!24367)

(assert (=> d!95297 (= lt!316351 (choose!36 acc!681))))

(assert (=> d!95297 (= (lemmaListSubSeqRefl!0 acc!681) lt!316351)))

(declare-fun bs!20208 () Bool)

(assert (= bs!20208 d!95297))

(assert (=> bs!20208 m!653421))

(declare-fun m!653545 () Bool)

(assert (=> bs!20208 m!653545))

(assert (=> b!689817 d!95297))

(declare-fun b!689962 () Bool)

(declare-fun e!392828 () Bool)

(declare-fun call!34197 () Bool)

(assert (=> b!689962 (= e!392828 call!34197)))

(declare-fun b!689963 () Bool)

(declare-fun e!392829 () Bool)

(declare-fun e!392827 () Bool)

(assert (=> b!689963 (= e!392829 e!392827)))

(declare-fun res!454409 () Bool)

(assert (=> b!689963 (=> (not res!454409) (not e!392827))))

(declare-fun e!392830 () Bool)

(assert (=> b!689963 (= res!454409 (not e!392830))))

(declare-fun res!454410 () Bool)

(assert (=> b!689963 (=> (not res!454410) (not e!392830))))

(assert (=> b!689963 (= res!454410 (validKeyInArray!0 (select (arr!19040 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95299 () Bool)

(declare-fun res!454408 () Bool)

(assert (=> d!95299 (=> res!454408 e!392829)))

(assert (=> d!95299 (= res!454408 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19422 a!3626)))))

(assert (=> d!95299 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!392829)))

(declare-fun b!689964 () Bool)

(assert (=> b!689964 (= e!392827 e!392828)))

(declare-fun c!78144 () Bool)

(assert (=> b!689964 (= c!78144 (validKeyInArray!0 (select (arr!19040 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689965 () Bool)

(assert (=> b!689965 (= e!392828 call!34197)))

(declare-fun b!689966 () Bool)

(assert (=> b!689966 (= e!392830 (contains!3658 acc!681 (select (arr!19040 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34194 () Bool)

(assert (=> bm!34194 (= call!34197 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78144 (Cons!13077 (select (arr!19040 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!95299 (not res!454408)) b!689963))

(assert (= (and b!689963 res!454410) b!689966))

(assert (= (and b!689963 res!454409) b!689964))

(assert (= (and b!689964 c!78144) b!689962))

(assert (= (and b!689964 (not c!78144)) b!689965))

(assert (= (or b!689962 b!689965) bm!34194))

(declare-fun m!653567 () Bool)

(assert (=> b!689963 m!653567))

(assert (=> b!689963 m!653567))

(declare-fun m!653569 () Bool)

(assert (=> b!689963 m!653569))

(assert (=> b!689964 m!653567))

(assert (=> b!689964 m!653567))

(assert (=> b!689964 m!653569))

(assert (=> b!689966 m!653567))

(assert (=> b!689966 m!653567))

(declare-fun m!653571 () Bool)

(assert (=> b!689966 m!653571))

(assert (=> bm!34194 m!653567))

(declare-fun m!653573 () Bool)

(assert (=> bm!34194 m!653573))

(assert (=> b!689817 d!95299))

(declare-fun b!689975 () Bool)

(declare-fun e!392840 () Bool)

(declare-fun call!34198 () Bool)

(assert (=> b!689975 (= e!392840 call!34198)))

(declare-fun b!689976 () Bool)

(declare-fun e!392841 () Bool)

(declare-fun e!392839 () Bool)

(assert (=> b!689976 (= e!392841 e!392839)))

(declare-fun res!454420 () Bool)

(assert (=> b!689976 (=> (not res!454420) (not e!392839))))

(declare-fun e!392842 () Bool)

(assert (=> b!689976 (= res!454420 (not e!392842))))

(declare-fun res!454421 () Bool)

(assert (=> b!689976 (=> (not res!454421) (not e!392842))))

(assert (=> b!689976 (= res!454421 (validKeyInArray!0 (select (arr!19040 lt!316310) from!3004)))))

(declare-fun d!95307 () Bool)

(declare-fun res!454419 () Bool)

(assert (=> d!95307 (=> res!454419 e!392841)))

(assert (=> d!95307 (= res!454419 (bvsge from!3004 (size!19422 lt!316310)))))

(assert (=> d!95307 (= (arrayNoDuplicates!0 lt!316310 from!3004 acc!681) e!392841)))

(declare-fun b!689977 () Bool)

(assert (=> b!689977 (= e!392839 e!392840)))

(declare-fun c!78145 () Bool)

(assert (=> b!689977 (= c!78145 (validKeyInArray!0 (select (arr!19040 lt!316310) from!3004)))))

(declare-fun b!689978 () Bool)

(assert (=> b!689978 (= e!392840 call!34198)))

(declare-fun b!689979 () Bool)

(assert (=> b!689979 (= e!392842 (contains!3658 acc!681 (select (arr!19040 lt!316310) from!3004)))))

(declare-fun bm!34195 () Bool)

(assert (=> bm!34195 (= call!34198 (arrayNoDuplicates!0 lt!316310 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78145 (Cons!13077 (select (arr!19040 lt!316310) from!3004) acc!681) acc!681)))))

(assert (= (and d!95307 (not res!454419)) b!689976))

(assert (= (and b!689976 res!454421) b!689979))

(assert (= (and b!689976 res!454420) b!689977))

(assert (= (and b!689977 c!78145) b!689975))

(assert (= (and b!689977 (not c!78145)) b!689978))

(assert (= (or b!689975 b!689978) bm!34195))

(declare-fun m!653575 () Bool)

(assert (=> b!689976 m!653575))

(assert (=> b!689976 m!653575))

(declare-fun m!653577 () Bool)

(assert (=> b!689976 m!653577))

(assert (=> b!689977 m!653575))

(assert (=> b!689977 m!653575))

(assert (=> b!689977 m!653577))

(assert (=> b!689979 m!653575))

(assert (=> b!689979 m!653575))

(declare-fun m!653583 () Bool)

(assert (=> b!689979 m!653583))

(assert (=> bm!34195 m!653575))

(declare-fun m!653585 () Bool)

(assert (=> bm!34195 m!653585))

(assert (=> b!689807 d!95307))

(declare-fun b!689989 () Bool)

(declare-fun e!392852 () Bool)

(declare-fun call!34200 () Bool)

(assert (=> b!689989 (= e!392852 call!34200)))

(declare-fun b!689990 () Bool)

(declare-fun e!392853 () Bool)

(declare-fun e!392851 () Bool)

(assert (=> b!689990 (= e!392853 e!392851)))

(declare-fun res!454430 () Bool)

(assert (=> b!689990 (=> (not res!454430) (not e!392851))))

(declare-fun e!392854 () Bool)

(assert (=> b!689990 (= res!454430 (not e!392854))))

(declare-fun res!454431 () Bool)

(assert (=> b!689990 (=> (not res!454431) (not e!392854))))

(assert (=> b!689990 (= res!454431 (validKeyInArray!0 (select (arr!19040 lt!316310) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95311 () Bool)

(declare-fun res!454429 () Bool)

(assert (=> d!95311 (=> res!454429 e!392853)))

(assert (=> d!95311 (= res!454429 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19422 lt!316310)))))

(assert (=> d!95311 (= (arrayNoDuplicates!0 lt!316310 (bvadd #b00000000000000000000000000000001 from!3004) lt!316316) e!392853)))

(declare-fun b!689991 () Bool)

(assert (=> b!689991 (= e!392851 e!392852)))

(declare-fun c!78147 () Bool)

(assert (=> b!689991 (= c!78147 (validKeyInArray!0 (select (arr!19040 lt!316310) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689992 () Bool)

(assert (=> b!689992 (= e!392852 call!34200)))

(declare-fun b!689993 () Bool)

(assert (=> b!689993 (= e!392854 (contains!3658 lt!316316 (select (arr!19040 lt!316310) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34197 () Bool)

(assert (=> bm!34197 (= call!34200 (arrayNoDuplicates!0 lt!316310 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78147 (Cons!13077 (select (arr!19040 lt!316310) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316316) lt!316316)))))

(assert (= (and d!95311 (not res!454429)) b!689990))

(assert (= (and b!689990 res!454431) b!689993))

(assert (= (and b!689990 res!454430) b!689991))

(assert (= (and b!689991 c!78147) b!689989))

(assert (= (and b!689991 (not c!78147)) b!689992))

(assert (= (or b!689989 b!689992) bm!34197))

(declare-fun m!653591 () Bool)

(assert (=> b!689990 m!653591))

(assert (=> b!689990 m!653591))

(declare-fun m!653593 () Bool)

(assert (=> b!689990 m!653593))

(assert (=> b!689991 m!653591))

(assert (=> b!689991 m!653591))

(assert (=> b!689991 m!653593))

(assert (=> b!689993 m!653591))

(assert (=> b!689993 m!653591))

(declare-fun m!653599 () Bool)

(assert (=> b!689993 m!653599))

(assert (=> bm!34197 m!653591))

(declare-fun m!653605 () Bool)

(assert (=> bm!34197 m!653605))

(assert (=> b!689807 d!95311))

(declare-fun d!95317 () Bool)

(declare-fun e!392873 () Bool)

(assert (=> d!95317 e!392873))

(declare-fun res!454450 () Bool)

(assert (=> d!95317 (=> (not res!454450) (not e!392873))))

(assert (=> d!95317 (= res!454450 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19422 a!3626))))))

(declare-fun lt!316360 () Unit!24367)

(declare-fun choose!41 (array!39737 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13081) Unit!24367)

(assert (=> d!95317 (= lt!316360 (choose!41 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316316))))

(assert (=> d!95317 (bvslt (size!19422 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95317 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316316) lt!316360)))

(declare-fun b!690012 () Bool)

(assert (=> b!690012 (= e!392873 (arrayNoDuplicates!0 (array!39738 (store (arr!19040 a!3626) i!1382 k!2843) (size!19422 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316316))))

(assert (= (and d!95317 res!454450) b!690012))

(declare-fun m!653613 () Bool)

(assert (=> d!95317 m!653613))

(assert (=> b!690012 m!653427))

(declare-fun m!653615 () Bool)

(assert (=> b!690012 m!653615))

(assert (=> b!689807 d!95317))

(assert (=> b!689794 d!95255))

(assert (=> b!689805 d!95263))

(declare-fun b!690015 () Bool)

(declare-fun e!392877 () Bool)

(declare-fun call!34201 () Bool)

(assert (=> b!690015 (= e!392877 call!34201)))

(declare-fun b!690016 () Bool)

(declare-fun e!392878 () Bool)

(declare-fun e!392876 () Bool)

(assert (=> b!690016 (= e!392878 e!392876)))

(declare-fun res!454454 () Bool)

(assert (=> b!690016 (=> (not res!454454) (not e!392876))))

(declare-fun e!392879 () Bool)

(assert (=> b!690016 (= res!454454 (not e!392879))))

(declare-fun res!454455 () Bool)

(assert (=> b!690016 (=> (not res!454455) (not e!392879))))

(assert (=> b!690016 (= res!454455 (validKeyInArray!0 (select (arr!19040 a!3626) from!3004)))))

(declare-fun d!95325 () Bool)

(declare-fun res!454453 () Bool)

(assert (=> d!95325 (=> res!454453 e!392878)))

(assert (=> d!95325 (= res!454453 (bvsge from!3004 (size!19422 a!3626)))))

(assert (=> d!95325 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!392878)))

(declare-fun b!690017 () Bool)

(assert (=> b!690017 (= e!392876 e!392877)))

(declare-fun c!78148 () Bool)

(assert (=> b!690017 (= c!78148 (validKeyInArray!0 (select (arr!19040 a!3626) from!3004)))))

(declare-fun b!690018 () Bool)

(assert (=> b!690018 (= e!392877 call!34201)))

(declare-fun b!690019 () Bool)

(assert (=> b!690019 (= e!392879 (contains!3658 acc!681 (select (arr!19040 a!3626) from!3004)))))

(declare-fun bm!34198 () Bool)

(assert (=> bm!34198 (= call!34201 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78148 (Cons!13077 (select (arr!19040 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!95325 (not res!454453)) b!690016))

(assert (= (and b!690016 res!454455) b!690019))

(assert (= (and b!690016 res!454454) b!690017))

(assert (= (and b!690017 c!78148) b!690015))

(assert (= (and b!690017 (not c!78148)) b!690018))

(assert (= (or b!690015 b!690018) bm!34198))

(assert (=> b!690016 m!653413))

(assert (=> b!690016 m!653413))

(assert (=> b!690016 m!653435))

(assert (=> b!690017 m!653413))

(assert (=> b!690017 m!653413))

(assert (=> b!690017 m!653435))

(assert (=> b!690019 m!653413))

(assert (=> b!690019 m!653413))

(declare-fun m!653623 () Bool)

(assert (=> b!690019 m!653623))

(assert (=> bm!34198 m!653413))

(declare-fun m!653627 () Bool)

(assert (=> bm!34198 m!653627))

(assert (=> b!689816 d!95325))

(declare-fun d!95331 () Bool)

(declare-fun res!454465 () Bool)

(declare-fun e!392890 () Bool)

(assert (=> d!95331 (=> res!454465 e!392890)))

(assert (=> d!95331 (= res!454465 (= (select (arr!19040 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95331 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!392890)))

(declare-fun b!690031 () Bool)

(declare-fun e!392891 () Bool)

(assert (=> b!690031 (= e!392890 e!392891)))

(declare-fun res!454466 () Bool)

(assert (=> b!690031 (=> (not res!454466) (not e!392891))))

(assert (=> b!690031 (= res!454466 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19422 a!3626)))))

(declare-fun b!690032 () Bool)

(assert (=> b!690032 (= e!392891 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95331 (not res!454465)) b!690031))

(assert (= (and b!690031 res!454466) b!690032))

(declare-fun m!653637 () Bool)

(assert (=> d!95331 m!653637))

(declare-fun m!653639 () Bool)

(assert (=> b!690032 m!653639))

(assert (=> b!689795 d!95331))

(declare-fun d!95343 () Bool)

(assert (=> d!95343 (= (array_inv!14836 a!3626) (bvsge (size!19422 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61596 d!95343))

(declare-fun d!95347 () Bool)

(declare-fun res!454467 () Bool)

(declare-fun e!392892 () Bool)

(assert (=> d!95347 (=> res!454467 e!392892)))

(assert (=> d!95347 (= res!454467 (is-Nil!13078 lt!316316))))

(assert (=> d!95347 (= (noDuplicate!905 lt!316316) e!392892)))

(declare-fun b!690033 () Bool)

(declare-fun e!392893 () Bool)

(assert (=> b!690033 (= e!392892 e!392893)))

(declare-fun res!454468 () Bool)

(assert (=> b!690033 (=> (not res!454468) (not e!392893))))

(assert (=> b!690033 (= res!454468 (not (contains!3658 (t!19345 lt!316316) (h!14122 lt!316316))))))

(declare-fun b!690034 () Bool)

(assert (=> b!690034 (= e!392893 (noDuplicate!905 (t!19345 lt!316316)))))

(assert (= (and d!95347 (not res!454467)) b!690033))

(assert (= (and b!690033 res!454468) b!690034))

(declare-fun m!653647 () Bool)

(assert (=> b!690033 m!653647))

(declare-fun m!653649 () Bool)

(assert (=> b!690034 m!653649))

(assert (=> b!689814 d!95347))

(declare-fun b!690037 () Bool)

(declare-fun e!392897 () Bool)

(declare-fun call!34203 () Bool)

(assert (=> b!690037 (= e!392897 call!34203)))

(declare-fun b!690038 () Bool)

(declare-fun e!392898 () Bool)

(declare-fun e!392896 () Bool)

(assert (=> b!690038 (= e!392898 e!392896)))

(declare-fun res!454472 () Bool)

(assert (=> b!690038 (=> (not res!454472) (not e!392896))))

(declare-fun e!392899 () Bool)

(assert (=> b!690038 (= res!454472 (not e!392899))))

(declare-fun res!454473 () Bool)

(assert (=> b!690038 (=> (not res!454473) (not e!392899))))

(assert (=> b!690038 (= res!454473 (validKeyInArray!0 (select (arr!19040 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95353 () Bool)

(declare-fun res!454471 () Bool)

(assert (=> d!95353 (=> res!454471 e!392898)))

(assert (=> d!95353 (= res!454471 (bvsge #b00000000000000000000000000000000 (size!19422 a!3626)))))

(assert (=> d!95353 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13078) e!392898)))

(declare-fun b!690039 () Bool)

(assert (=> b!690039 (= e!392896 e!392897)))

(declare-fun c!78150 () Bool)

(assert (=> b!690039 (= c!78150 (validKeyInArray!0 (select (arr!19040 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690040 () Bool)

(assert (=> b!690040 (= e!392897 call!34203)))

(declare-fun b!690041 () Bool)

(assert (=> b!690041 (= e!392899 (contains!3658 Nil!13078 (select (arr!19040 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34200 () Bool)

(assert (=> bm!34200 (= call!34203 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78150 (Cons!13077 (select (arr!19040 a!3626) #b00000000000000000000000000000000) Nil!13078) Nil!13078)))))

(assert (= (and d!95353 (not res!454471)) b!690038))

(assert (= (and b!690038 res!454473) b!690041))

(assert (= (and b!690038 res!454472) b!690039))

(assert (= (and b!690039 c!78150) b!690037))

(assert (= (and b!690039 (not c!78150)) b!690040))

(assert (= (or b!690037 b!690040) bm!34200))

(assert (=> b!690038 m!653637))

(assert (=> b!690038 m!653637))

(declare-fun m!653655 () Bool)

(assert (=> b!690038 m!653655))

(assert (=> b!690039 m!653637))

(assert (=> b!690039 m!653637))

(assert (=> b!690039 m!653655))

(assert (=> b!690041 m!653637))

(assert (=> b!690041 m!653637))

(declare-fun m!653661 () Bool)

(assert (=> b!690041 m!653661))

(assert (=> bm!34200 m!653637))

(declare-fun m!653663 () Bool)

(assert (=> bm!34200 m!653663))

(assert (=> b!689804 d!95353))

(assert (=> b!689801 d!95281))

(declare-fun d!95361 () Bool)

(declare-fun res!454476 () Bool)

(declare-fun e!392902 () Bool)

(assert (=> d!95361 (=> res!454476 e!392902)))

(assert (=> d!95361 (= res!454476 (= (select (arr!19040 lt!316310) from!3004) k!2843))))

(assert (=> d!95361 (= (arrayContainsKey!0 lt!316310 k!2843 from!3004) e!392902)))

(declare-fun b!690044 () Bool)

(declare-fun e!392903 () Bool)

(assert (=> b!690044 (= e!392902 e!392903)))

(declare-fun res!454477 () Bool)

(assert (=> b!690044 (=> (not res!454477) (not e!392903))))

(assert (=> b!690044 (= res!454477 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19422 lt!316310)))))

(declare-fun b!690045 () Bool)

(assert (=> b!690045 (= e!392903 (arrayContainsKey!0 lt!316310 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95361 (not res!454476)) b!690044))

(assert (= (and b!690044 res!454477) b!690045))

(assert (=> d!95361 m!653575))

(declare-fun m!653665 () Bool)

(assert (=> b!690045 m!653665))

(assert (=> b!689801 d!95361))

(declare-fun d!95365 () Bool)

(declare-fun res!454481 () Bool)

(declare-fun e!392908 () Bool)

(assert (=> d!95365 (=> res!454481 e!392908)))

(assert (=> d!95365 (= res!454481 (= (select (arr!19040 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!95365 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!392908)))

(declare-fun b!690051 () Bool)

(declare-fun e!392909 () Bool)

(assert (=> b!690051 (= e!392908 e!392909)))

(declare-fun res!454482 () Bool)

(assert (=> b!690051 (=> (not res!454482) (not e!392909))))

(assert (=> b!690051 (= res!454482 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19422 a!3626)))))

(declare-fun b!690052 () Bool)

(assert (=> b!690052 (= e!392909 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95365 (not res!454481)) b!690051))

(assert (= (and b!690051 res!454482) b!690052))

(assert (=> d!95365 m!653567))

(declare-fun m!653667 () Bool)

(assert (=> b!690052 m!653667))

(assert (=> b!689801 d!95365))

(declare-fun b!690090 () Bool)

(declare-fun e!392942 () List!13081)

(declare-fun call!34210 () List!13081)

(assert (=> b!690090 (= e!392942 (Cons!13077 (h!14122 lt!316316) call!34210))))

(declare-fun b!690091 () Bool)

(declare-fun e!392941 () List!13081)

(assert (=> b!690091 (= e!392941 e!392942)))

(declare-fun c!78160 () Bool)

(assert (=> b!690091 (= c!78160 (= k!2843 (h!14122 lt!316316)))))

(declare-fun b!690092 () Bool)

(assert (=> b!690092 (= e!392942 call!34210)))

(declare-fun b!690093 () Bool)

(assert (=> b!690093 (= e!392941 Nil!13078)))

(declare-fun e!392943 () Bool)

(declare-fun lt!316385 () List!13081)

(declare-fun b!690094 () Bool)

(assert (=> b!690094 (= e!392943 (= (content!303 lt!316385) (setminus (content!303 lt!316316) (insert k!2843 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun bm!34207 () Bool)

(assert (=> bm!34207 (= call!34210 (-!209 (t!19345 lt!316316) k!2843))))

(declare-fun d!95367 () Bool)

(assert (=> d!95367 e!392943))

(declare-fun res!454506 () Bool)

(assert (=> d!95367 (=> (not res!454506) (not e!392943))))

(declare-fun size!19425 (List!13081) Int)

(assert (=> d!95367 (= res!454506 (<= (size!19425 lt!316385) (size!19425 lt!316316)))))

(assert (=> d!95367 (= lt!316385 e!392941)))

(declare-fun c!78159 () Bool)

(assert (=> d!95367 (= c!78159 (is-Cons!13077 lt!316316))))

(assert (=> d!95367 (= (-!209 lt!316316 k!2843) lt!316385)))

(assert (= (and d!95367 c!78159) b!690091))

(assert (= (and d!95367 (not c!78159)) b!690093))

(assert (= (and b!690091 c!78160) b!690092))

(assert (= (and b!690091 (not c!78160)) b!690090))

(assert (= (or b!690092 b!690090) bm!34207))

(assert (= (and d!95367 res!454506) b!690094))

(declare-fun m!653711 () Bool)

(assert (=> b!690094 m!653711))

