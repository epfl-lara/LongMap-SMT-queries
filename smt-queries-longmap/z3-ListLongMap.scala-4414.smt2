; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60976 () Bool)

(assert start!60976)

(declare-fun b!683687 () Bool)

(declare-datatypes ((Unit!24032 0))(
  ( (Unit!24033) )
))
(declare-fun e!389483 () Unit!24032)

(declare-fun Unit!24034 () Unit!24032)

(assert (=> b!683687 (= e!389483 Unit!24034)))

(declare-fun b!683688 () Bool)

(declare-fun res!449409 () Bool)

(declare-fun e!389484 () Bool)

(assert (=> b!683688 (=> (not res!449409) (not e!389484))))

(declare-datatypes ((array!39585 0))(
  ( (array!39586 (arr!18973 (Array (_ BitVec 32) (_ BitVec 64))) (size!19340 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39585)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13014 0))(
  ( (Nil!13011) (Cons!13010 (h!14055 (_ BitVec 64)) (t!19260 List!13014)) )
))
(declare-fun acc!681 () List!13014)

(declare-fun arrayNoDuplicates!0 (array!39585 (_ BitVec 32) List!13014) Bool)

(assert (=> b!683688 (= res!449409 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683689 () Bool)

(declare-fun res!449400 () Bool)

(assert (=> b!683689 (=> (not res!449400) (not e!389484))))

(assert (=> b!683689 (= res!449400 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13011))))

(declare-fun b!683690 () Bool)

(declare-fun e!389479 () Bool)

(assert (=> b!683690 (= e!389479 true)))

(declare-fun lt!313987 () Bool)

(declare-fun lt!313982 () List!13014)

(declare-fun noDuplicate!838 (List!13014) Bool)

(assert (=> b!683690 (= lt!313987 (noDuplicate!838 lt!313982))))

(declare-fun b!683691 () Bool)

(declare-fun res!449408 () Bool)

(assert (=> b!683691 (=> (not res!449408) (not e!389484))))

(assert (=> b!683691 (= res!449408 (noDuplicate!838 acc!681))))

(declare-fun b!683692 () Bool)

(declare-fun e!389478 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3591 (List!13014 (_ BitVec 64)) Bool)

(assert (=> b!683692 (= e!389478 (not (contains!3591 acc!681 k0!2843)))))

(declare-fun b!683693 () Bool)

(declare-fun e!389480 () Unit!24032)

(declare-fun lt!313980 () Unit!24032)

(assert (=> b!683693 (= e!389480 lt!313980)))

(declare-fun lt!313983 () Unit!24032)

(declare-fun lemmaListSubSeqRefl!0 (List!13014) Unit!24032)

(assert (=> b!683693 (= lt!313983 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!177 (List!13014 List!13014) Bool)

(assert (=> b!683693 (subseq!177 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39585 List!13014 List!13014 (_ BitVec 32)) Unit!24032)

(declare-fun $colon$colon!342 (List!13014 (_ BitVec 64)) List!13014)

(assert (=> b!683693 (= lt!313980 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!342 acc!681 (select (arr!18973 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683693 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683694 () Bool)

(declare-fun Unit!24035 () Unit!24032)

(assert (=> b!683694 (= e!389480 Unit!24035)))

(declare-fun b!683695 () Bool)

(declare-fun res!449406 () Bool)

(assert (=> b!683695 (=> (not res!449406) (not e!389484))))

(assert (=> b!683695 (= res!449406 (not (contains!3591 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683696 () Bool)

(assert (=> b!683696 (= e!389484 (not e!389479))))

(declare-fun res!449402 () Bool)

(assert (=> b!683696 (=> res!449402 e!389479)))

(assert (=> b!683696 (= res!449402 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!142 (List!13014 (_ BitVec 64)) List!13014)

(assert (=> b!683696 (= (-!142 lt!313982 k0!2843) acc!681)))

(assert (=> b!683696 (= lt!313982 ($colon$colon!342 acc!681 k0!2843))))

(declare-fun lt!313981 () Unit!24032)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13014) Unit!24032)

(assert (=> b!683696 (= lt!313981 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!683696 (subseq!177 acc!681 acc!681)))

(declare-fun lt!313986 () Unit!24032)

(assert (=> b!683696 (= lt!313986 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683696 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313979 () Unit!24032)

(assert (=> b!683696 (= lt!313979 e!389480)))

(declare-fun c!77513 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683696 (= c!77513 (validKeyInArray!0 (select (arr!18973 a!3626) from!3004)))))

(declare-fun lt!313985 () Unit!24032)

(assert (=> b!683696 (= lt!313985 e!389483)))

(declare-fun c!77512 () Bool)

(declare-fun arrayContainsKey!0 (array!39585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683696 (= c!77512 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683696 (arrayContainsKey!0 (array!39586 (store (arr!18973 a!3626) i!1382 k0!2843) (size!19340 a!3626)) k0!2843 from!3004)))

(declare-fun b!683697 () Bool)

(declare-fun res!449404 () Bool)

(assert (=> b!683697 (=> (not res!449404) (not e!389484))))

(assert (=> b!683697 (= res!449404 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683698 () Bool)

(declare-fun res!449401 () Bool)

(assert (=> b!683698 (=> (not res!449401) (not e!389484))))

(assert (=> b!683698 (= res!449401 (validKeyInArray!0 k0!2843))))

(declare-fun b!683699 () Bool)

(declare-fun res!449411 () Bool)

(assert (=> b!683699 (=> (not res!449411) (not e!389484))))

(assert (=> b!683699 (= res!449411 (not (contains!3591 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!449397 () Bool)

(assert (=> start!60976 (=> (not res!449397) (not e!389484))))

(assert (=> start!60976 (= res!449397 (and (bvslt (size!19340 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19340 a!3626))))))

(assert (=> start!60976 e!389484))

(assert (=> start!60976 true))

(declare-fun array_inv!14769 (array!39585) Bool)

(assert (=> start!60976 (array_inv!14769 a!3626)))

(declare-fun b!683700 () Bool)

(declare-fun e!389482 () Bool)

(assert (=> b!683700 (= e!389482 e!389478)))

(declare-fun res!449410 () Bool)

(assert (=> b!683700 (=> (not res!449410) (not e!389478))))

(assert (=> b!683700 (= res!449410 (bvsle from!3004 i!1382))))

(declare-fun b!683701 () Bool)

(declare-fun res!449403 () Bool)

(assert (=> b!683701 (=> (not res!449403) (not e!389484))))

(assert (=> b!683701 (= res!449403 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19340 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683702 () Bool)

(declare-fun e!389481 () Bool)

(assert (=> b!683702 (= e!389481 (contains!3591 acc!681 k0!2843))))

(declare-fun b!683703 () Bool)

(declare-fun Unit!24036 () Unit!24032)

(assert (=> b!683703 (= e!389483 Unit!24036)))

(declare-fun lt!313984 () Unit!24032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39585 (_ BitVec 64) (_ BitVec 32)) Unit!24032)

(assert (=> b!683703 (= lt!313984 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683703 false))

(declare-fun b!683704 () Bool)

(declare-fun res!449405 () Bool)

(assert (=> b!683704 (=> (not res!449405) (not e!389484))))

(assert (=> b!683704 (= res!449405 e!389482)))

(declare-fun res!449407 () Bool)

(assert (=> b!683704 (=> res!449407 e!389482)))

(assert (=> b!683704 (= res!449407 e!389481)))

(declare-fun res!449398 () Bool)

(assert (=> b!683704 (=> (not res!449398) (not e!389481))))

(assert (=> b!683704 (= res!449398 (bvsgt from!3004 i!1382))))

(declare-fun b!683705 () Bool)

(declare-fun res!449399 () Bool)

(assert (=> b!683705 (=> (not res!449399) (not e!389484))))

(assert (=> b!683705 (= res!449399 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19340 a!3626))))))

(assert (= (and start!60976 res!449397) b!683691))

(assert (= (and b!683691 res!449408) b!683695))

(assert (= (and b!683695 res!449406) b!683699))

(assert (= (and b!683699 res!449411) b!683704))

(assert (= (and b!683704 res!449398) b!683702))

(assert (= (and b!683704 (not res!449407)) b!683700))

(assert (= (and b!683700 res!449410) b!683692))

(assert (= (and b!683704 res!449405) b!683689))

(assert (= (and b!683689 res!449400) b!683688))

(assert (= (and b!683688 res!449409) b!683705))

(assert (= (and b!683705 res!449399) b!683698))

(assert (= (and b!683698 res!449401) b!683697))

(assert (= (and b!683697 res!449404) b!683701))

(assert (= (and b!683701 res!449403) b!683696))

(assert (= (and b!683696 c!77512) b!683703))

(assert (= (and b!683696 (not c!77512)) b!683687))

(assert (= (and b!683696 c!77513) b!683693))

(assert (= (and b!683696 (not c!77513)) b!683694))

(assert (= (and b!683696 (not res!449402)) b!683690))

(declare-fun m!648209 () Bool)

(assert (=> b!683698 m!648209))

(declare-fun m!648211 () Bool)

(assert (=> start!60976 m!648211))

(declare-fun m!648213 () Bool)

(assert (=> b!683703 m!648213))

(declare-fun m!648215 () Bool)

(assert (=> b!683695 m!648215))

(declare-fun m!648217 () Bool)

(assert (=> b!683702 m!648217))

(declare-fun m!648219 () Bool)

(assert (=> b!683699 m!648219))

(declare-fun m!648221 () Bool)

(assert (=> b!683690 m!648221))

(assert (=> b!683692 m!648217))

(declare-fun m!648223 () Bool)

(assert (=> b!683691 m!648223))

(declare-fun m!648225 () Bool)

(assert (=> b!683688 m!648225))

(declare-fun m!648227 () Bool)

(assert (=> b!683697 m!648227))

(declare-fun m!648229 () Bool)

(assert (=> b!683689 m!648229))

(declare-fun m!648231 () Bool)

(assert (=> b!683693 m!648231))

(declare-fun m!648233 () Bool)

(assert (=> b!683693 m!648233))

(declare-fun m!648235 () Bool)

(assert (=> b!683693 m!648235))

(declare-fun m!648237 () Bool)

(assert (=> b!683693 m!648237))

(assert (=> b!683693 m!648233))

(assert (=> b!683693 m!648235))

(declare-fun m!648239 () Bool)

(assert (=> b!683693 m!648239))

(declare-fun m!648241 () Bool)

(assert (=> b!683693 m!648241))

(declare-fun m!648243 () Bool)

(assert (=> b!683696 m!648243))

(assert (=> b!683696 m!648231))

(assert (=> b!683696 m!648233))

(declare-fun m!648245 () Bool)

(assert (=> b!683696 m!648245))

(declare-fun m!648247 () Bool)

(assert (=> b!683696 m!648247))

(assert (=> b!683696 m!648239))

(declare-fun m!648249 () Bool)

(assert (=> b!683696 m!648249))

(declare-fun m!648251 () Bool)

(assert (=> b!683696 m!648251))

(assert (=> b!683696 m!648233))

(declare-fun m!648253 () Bool)

(assert (=> b!683696 m!648253))

(declare-fun m!648255 () Bool)

(assert (=> b!683696 m!648255))

(assert (=> b!683696 m!648241))

(check-sat (not b!683702) (not b!683697) (not b!683699) (not b!683691) (not b!683693) (not start!60976) (not b!683692) (not b!683703) (not b!683696) (not b!683690) (not b!683695) (not b!683698) (not b!683688) (not b!683689))
(check-sat)
