; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115992 () Bool)

(assert start!115992)

(declare-fun b!1370695 () Bool)

(declare-fun e!776406 () Bool)

(declare-datatypes ((List!32000 0))(
  ( (Nil!31997) (Cons!31996 (h!33205 (_ BitVec 64)) (t!46694 List!32000)) )
))
(declare-fun lt!602494 () List!32000)

(declare-fun contains!9682 (List!32000 (_ BitVec 64)) Bool)

(assert (=> b!1370695 (= e!776406 (contains!9682 lt!602494 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370696 () Bool)

(declare-fun res!914120 () Bool)

(declare-fun e!776405 () Bool)

(assert (=> b!1370696 (=> (not res!914120) (not e!776405))))

(declare-fun newAcc!98 () List!32000)

(declare-fun acc!866 () List!32000)

(declare-fun subseq!1084 (List!32000 List!32000) Bool)

(assert (=> b!1370696 (= res!914120 (subseq!1084 newAcc!98 acc!866))))

(declare-fun b!1370697 () Bool)

(declare-fun e!776407 () Bool)

(declare-fun e!776403 () Bool)

(assert (=> b!1370697 (= e!776407 e!776403)))

(declare-fun res!914133 () Bool)

(assert (=> b!1370697 (=> (not res!914133) (not e!776403))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1370697 (= res!914133 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!93028 0))(
  ( (array!93029 (arr!44932 (Array (_ BitVec 32) (_ BitVec 64))) (size!45482 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93028)

(assert (=> b!1370697 (= lt!602494 (Cons!31996 (select (arr!44932 a!3861) from!3239) newAcc!98))))

(declare-fun lt!602492 () List!32000)

(assert (=> b!1370697 (= lt!602492 (Cons!31996 (select (arr!44932 a!3861) from!3239) acc!866))))

(declare-fun b!1370698 () Bool)

(declare-fun res!914130 () Bool)

(assert (=> b!1370698 (=> (not res!914130) (not e!776405))))

(assert (=> b!1370698 (= res!914130 (not (contains!9682 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370699 () Bool)

(declare-fun res!914122 () Bool)

(assert (=> b!1370699 (=> (not res!914122) (not e!776407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370699 (= res!914122 (validKeyInArray!0 (select (arr!44932 a!3861) from!3239)))))

(declare-fun res!914124 () Bool)

(assert (=> start!115992 (=> (not res!914124) (not e!776405))))

(assert (=> start!115992 (= res!914124 (and (bvslt (size!45482 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45482 a!3861))))))

(assert (=> start!115992 e!776405))

(declare-fun array_inv!33960 (array!93028) Bool)

(assert (=> start!115992 (array_inv!33960 a!3861)))

(assert (=> start!115992 true))

(declare-fun b!1370700 () Bool)

(declare-fun res!914125 () Bool)

(assert (=> b!1370700 (=> (not res!914125) (not e!776407))))

(assert (=> b!1370700 (= res!914125 (bvslt from!3239 (size!45482 a!3861)))))

(declare-fun b!1370701 () Bool)

(assert (=> b!1370701 (= e!776403 e!776406)))

(declare-fun res!914134 () Bool)

(assert (=> b!1370701 (=> res!914134 e!776406)))

(assert (=> b!1370701 (= res!914134 (contains!9682 lt!602494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370702 () Bool)

(assert (=> b!1370702 (= e!776405 e!776407)))

(declare-fun res!914132 () Bool)

(assert (=> b!1370702 (=> (not res!914132) (not e!776407))))

(declare-fun arrayNoDuplicates!0 (array!93028 (_ BitVec 32) List!32000) Bool)

(assert (=> b!1370702 (= res!914132 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45301 0))(
  ( (Unit!45302) )
))
(declare-fun lt!602493 () Unit!45301)

(declare-fun noDuplicateSubseq!271 (List!32000 List!32000) Unit!45301)

(assert (=> b!1370702 (= lt!602493 (noDuplicateSubseq!271 newAcc!98 acc!866))))

(declare-fun b!1370703 () Bool)

(declare-fun res!914119 () Bool)

(assert (=> b!1370703 (=> (not res!914119) (not e!776403))))

(declare-fun noDuplicate!2539 (List!32000) Bool)

(assert (=> b!1370703 (= res!914119 (noDuplicate!2539 lt!602492))))

(declare-fun b!1370704 () Bool)

(declare-fun res!914131 () Bool)

(assert (=> b!1370704 (=> (not res!914131) (not e!776405))))

(assert (=> b!1370704 (= res!914131 (not (contains!9682 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370705 () Bool)

(declare-fun res!914127 () Bool)

(assert (=> b!1370705 (=> (not res!914127) (not e!776403))))

(assert (=> b!1370705 (= res!914127 (not (contains!9682 lt!602492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370706 () Bool)

(declare-fun res!914129 () Bool)

(assert (=> b!1370706 (=> (not res!914129) (not e!776405))))

(assert (=> b!1370706 (= res!914129 (not (contains!9682 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370707 () Bool)

(declare-fun res!914121 () Bool)

(assert (=> b!1370707 (=> (not res!914121) (not e!776407))))

(assert (=> b!1370707 (= res!914121 (not (contains!9682 acc!866 (select (arr!44932 a!3861) from!3239))))))

(declare-fun b!1370708 () Bool)

(declare-fun res!914128 () Bool)

(assert (=> b!1370708 (=> (not res!914128) (not e!776405))))

(assert (=> b!1370708 (= res!914128 (not (contains!9682 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370709 () Bool)

(declare-fun res!914126 () Bool)

(assert (=> b!1370709 (=> (not res!914126) (not e!776405))))

(assert (=> b!1370709 (= res!914126 (noDuplicate!2539 acc!866))))

(declare-fun b!1370710 () Bool)

(declare-fun res!914123 () Bool)

(assert (=> b!1370710 (=> (not res!914123) (not e!776403))))

(assert (=> b!1370710 (= res!914123 (not (contains!9682 lt!602492 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115992 res!914124) b!1370709))

(assert (= (and b!1370709 res!914126) b!1370698))

(assert (= (and b!1370698 res!914130) b!1370706))

(assert (= (and b!1370706 res!914129) b!1370704))

(assert (= (and b!1370704 res!914131) b!1370708))

(assert (= (and b!1370708 res!914128) b!1370696))

(assert (= (and b!1370696 res!914120) b!1370702))

(assert (= (and b!1370702 res!914132) b!1370700))

(assert (= (and b!1370700 res!914125) b!1370699))

(assert (= (and b!1370699 res!914122) b!1370707))

(assert (= (and b!1370707 res!914121) b!1370697))

(assert (= (and b!1370697 res!914133) b!1370703))

(assert (= (and b!1370703 res!914119) b!1370705))

(assert (= (and b!1370705 res!914127) b!1370710))

(assert (= (and b!1370710 res!914123) b!1370701))

(assert (= (and b!1370701 (not res!914134)) b!1370695))

(declare-fun m!1254207 () Bool)

(assert (=> b!1370702 m!1254207))

(declare-fun m!1254209 () Bool)

(assert (=> b!1370702 m!1254209))

(declare-fun m!1254211 () Bool)

(assert (=> b!1370709 m!1254211))

(declare-fun m!1254213 () Bool)

(assert (=> b!1370708 m!1254213))

(declare-fun m!1254215 () Bool)

(assert (=> b!1370701 m!1254215))

(declare-fun m!1254217 () Bool)

(assert (=> b!1370698 m!1254217))

(declare-fun m!1254219 () Bool)

(assert (=> b!1370696 m!1254219))

(declare-fun m!1254221 () Bool)

(assert (=> b!1370710 m!1254221))

(declare-fun m!1254223 () Bool)

(assert (=> b!1370706 m!1254223))

(declare-fun m!1254225 () Bool)

(assert (=> b!1370703 m!1254225))

(declare-fun m!1254227 () Bool)

(assert (=> b!1370705 m!1254227))

(declare-fun m!1254229 () Bool)

(assert (=> b!1370704 m!1254229))

(declare-fun m!1254231 () Bool)

(assert (=> b!1370707 m!1254231))

(assert (=> b!1370707 m!1254231))

(declare-fun m!1254233 () Bool)

(assert (=> b!1370707 m!1254233))

(assert (=> b!1370697 m!1254231))

(declare-fun m!1254235 () Bool)

(assert (=> b!1370695 m!1254235))

(declare-fun m!1254237 () Bool)

(assert (=> start!115992 m!1254237))

(assert (=> b!1370699 m!1254231))

(assert (=> b!1370699 m!1254231))

(declare-fun m!1254239 () Bool)

(assert (=> b!1370699 m!1254239))

(push 1)

(assert (not b!1370705))

(assert (not b!1370698))

(assert (not b!1370707))

(assert (not b!1370706))

(assert (not b!1370704))

(assert (not b!1370709))

(assert (not b!1370708))

(assert (not b!1370695))

(assert (not b!1370696))

(assert (not b!1370710))

(assert (not b!1370701))

(assert (not b!1370702))

(assert (not start!115992))

(assert (not b!1370699))

(assert (not b!1370703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147253 () Bool)

(declare-fun lt!602506 () Bool)

(declare-fun content!734 (List!32000) (Set (_ BitVec 64)))

(assert (=> d!147253 (= lt!602506 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!734 lt!602494)))))

(declare-fun e!776450 () Bool)

(assert (=> d!147253 (= lt!602506 e!776450)))

(declare-fun res!914178 () Bool)

(assert (=> d!147253 (=> (not res!914178) (not e!776450))))

(assert (=> d!147253 (= res!914178 (is-Cons!31996 lt!602494))))

(assert (=> d!147253 (= (contains!9682 lt!602494 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602506)))

(declare-fun b!1370753 () Bool)

(declare-fun e!776451 () Bool)

(assert (=> b!1370753 (= e!776450 e!776451)))

(declare-fun res!914177 () Bool)

(assert (=> b!1370753 (=> res!914177 e!776451)))

(assert (=> b!1370753 (= res!914177 (= (h!33205 lt!602494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370754 () Bool)

(assert (=> b!1370754 (= e!776451 (contains!9682 (t!46694 lt!602494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147253 res!914178) b!1370753))

(assert (= (and b!1370753 (not res!914177)) b!1370754))

(declare-fun m!1254281 () Bool)

(assert (=> d!147253 m!1254281))

(declare-fun m!1254283 () Bool)

(assert (=> d!147253 m!1254283))

(declare-fun m!1254285 () Bool)

(assert (=> b!1370754 m!1254285))

(assert (=> b!1370695 d!147253))

(declare-fun d!147267 () Bool)

(declare-fun lt!602507 () Bool)

(assert (=> d!147267 (= lt!602507 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!734 acc!866)))))

(declare-fun e!776452 () Bool)

(assert (=> d!147267 (= lt!602507 e!776452)))

(declare-fun res!914180 () Bool)

(assert (=> d!147267 (=> (not res!914180) (not e!776452))))

(assert (=> d!147267 (= res!914180 (is-Cons!31996 acc!866))))

(assert (=> d!147267 (= (contains!9682 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602507)))

(declare-fun b!1370755 () Bool)

(declare-fun e!776453 () Bool)

(assert (=> b!1370755 (= e!776452 e!776453)))

(declare-fun res!914179 () Bool)

(assert (=> b!1370755 (=> res!914179 e!776453)))

(assert (=> b!1370755 (= res!914179 (= (h!33205 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370756 () Bool)

(assert (=> b!1370756 (= e!776453 (contains!9682 (t!46694 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147267 res!914180) b!1370755))

(assert (= (and b!1370755 (not res!914179)) b!1370756))

(declare-fun m!1254287 () Bool)

(assert (=> d!147267 m!1254287))

(declare-fun m!1254289 () Bool)

(assert (=> d!147267 m!1254289))

(declare-fun m!1254291 () Bool)

(assert (=> b!1370756 m!1254291))

(assert (=> b!1370706 d!147267))

(declare-fun d!147269 () Bool)

(declare-fun lt!602508 () Bool)

(assert (=> d!147269 (= lt!602508 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!734 newAcc!98)))))

(declare-fun e!776460 () Bool)

(assert (=> d!147269 (= lt!602508 e!776460)))

(declare-fun res!914188 () Bool)

(assert (=> d!147269 (=> (not res!914188) (not e!776460))))

(assert (=> d!147269 (= res!914188 (is-Cons!31996 newAcc!98))))

(assert (=> d!147269 (= (contains!9682 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602508)))

(declare-fun b!1370761 () Bool)

(declare-fun e!776461 () Bool)

(assert (=> b!1370761 (= e!776460 e!776461)))

(declare-fun res!914187 () Bool)

(assert (=> b!1370761 (=> res!914187 e!776461)))

(assert (=> b!1370761 (= res!914187 (= (h!33205 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370762 () Bool)

(assert (=> b!1370762 (= e!776461 (contains!9682 (t!46694 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147269 res!914188) b!1370761))

(assert (= (and b!1370761 (not res!914187)) b!1370762))

(declare-fun m!1254293 () Bool)

(assert (=> d!147269 m!1254293))

(declare-fun m!1254295 () Bool)

(assert (=> d!147269 m!1254295))

(declare-fun m!1254297 () Bool)

(assert (=> b!1370762 m!1254297))

(assert (=> b!1370704 d!147269))

(declare-fun d!147271 () Bool)

(declare-fun lt!602509 () Bool)

(assert (=> d!147271 (= lt!602509 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!734 lt!602492)))))

(declare-fun e!776470 () Bool)

(assert (=> d!147271 (= lt!602509 e!776470)))

(declare-fun res!914196 () Bool)

(assert (=> d!147271 (=> (not res!914196) (not e!776470))))

(assert (=> d!147271 (= res!914196 (is-Cons!31996 lt!602492))))

(assert (=> d!147271 (= (contains!9682 lt!602492 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602509)))

(declare-fun b!1370773 () Bool)

(declare-fun e!776471 () Bool)

(assert (=> b!1370773 (= e!776470 e!776471)))

(declare-fun res!914195 () Bool)

(assert (=> b!1370773 (=> res!914195 e!776471)))

(assert (=> b!1370773 (= res!914195 (= (h!33205 lt!602492) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370774 () Bool)

(assert (=> b!1370774 (= e!776471 (contains!9682 (t!46694 lt!602492) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147271 res!914196) b!1370773))

(assert (= (and b!1370773 (not res!914195)) b!1370774))

(declare-fun m!1254299 () Bool)

(assert (=> d!147271 m!1254299))

(declare-fun m!1254301 () Bool)

(assert (=> d!147271 m!1254301))

(declare-fun m!1254303 () Bool)

(assert (=> b!1370774 m!1254303))

(assert (=> b!1370705 d!147271))

(declare-fun d!147273 () Bool)

(declare-fun lt!602510 () Bool)

(assert (=> d!147273 (= lt!602510 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!734 newAcc!98)))))

(declare-fun e!776474 () Bool)

(assert (=> d!147273 (= lt!602510 e!776474)))

(declare-fun res!914198 () Bool)

(assert (=> d!147273 (=> (not res!914198) (not e!776474))))

(assert (=> d!147273 (= res!914198 (is-Cons!31996 newAcc!98))))

(assert (=> d!147273 (= (contains!9682 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602510)))

(declare-fun b!1370781 () Bool)

(declare-fun e!776475 () Bool)

(assert (=> b!1370781 (= e!776474 e!776475)))

(declare-fun res!914197 () Bool)

(assert (=> b!1370781 (=> res!914197 e!776475)))

(assert (=> b!1370781 (= res!914197 (= (h!33205 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370782 () Bool)

(assert (=> b!1370782 (= e!776475 (contains!9682 (t!46694 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147273 res!914198) b!1370781))

(assert (= (and b!1370781 (not res!914197)) b!1370782))

(assert (=> d!147273 m!1254293))

(declare-fun m!1254305 () Bool)

(assert (=> d!147273 m!1254305))

(declare-fun m!1254307 () Bool)

(assert (=> b!1370782 m!1254307))

(assert (=> b!1370708 d!147273))

(declare-fun d!147275 () Bool)

(declare-fun lt!602511 () Bool)

(assert (=> d!147275 (= lt!602511 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!734 acc!866)))))

(declare-fun e!776476 () Bool)

(assert (=> d!147275 (= lt!602511 e!776476)))

(declare-fun res!914200 () Bool)

(assert (=> d!147275 (=> (not res!914200) (not e!776476))))

(assert (=> d!147275 (= res!914200 (is-Cons!31996 acc!866))))

(assert (=> d!147275 (= (contains!9682 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602511)))

(declare-fun b!1370783 () Bool)

(declare-fun e!776477 () Bool)

(assert (=> b!1370783 (= e!776476 e!776477)))

(declare-fun res!914199 () Bool)

(assert (=> b!1370783 (=> res!914199 e!776477)))

(assert (=> b!1370783 (= res!914199 (= (h!33205 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370784 () Bool)

(assert (=> b!1370784 (= e!776477 (contains!9682 (t!46694 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147275 res!914200) b!1370783))

(assert (= (and b!1370783 (not res!914199)) b!1370784))

(assert (=> d!147275 m!1254287))

(declare-fun m!1254309 () Bool)

(assert (=> d!147275 m!1254309))

(declare-fun m!1254311 () Bool)

(assert (=> b!1370784 m!1254311))

(assert (=> b!1370698 d!147275))

(declare-fun d!147277 () Bool)

(declare-fun res!914211 () Bool)

(declare-fun e!776490 () Bool)

(assert (=> d!147277 (=> res!914211 e!776490)))

(assert (=> d!147277 (= res!914211 (is-Nil!31997 acc!866))))

(assert (=> d!147277 (= (noDuplicate!2539 acc!866) e!776490)))

(declare-fun b!1370799 () Bool)

(declare-fun e!776491 () Bool)

(assert (=> b!1370799 (= e!776490 e!776491)))

(declare-fun res!914212 () Bool)

(assert (=> b!1370799 (=> (not res!914212) (not e!776491))))

(assert (=> b!1370799 (= res!914212 (not (contains!9682 (t!46694 acc!866) (h!33205 acc!866))))))

(declare-fun b!1370800 () Bool)

(assert (=> b!1370800 (= e!776491 (noDuplicate!2539 (t!46694 acc!866)))))

(assert (= (and d!147277 (not res!914211)) b!1370799))

(assert (= (and b!1370799 res!914212) b!1370800))

(declare-fun m!1254315 () Bool)

(assert (=> b!1370799 m!1254315))

(declare-fun m!1254317 () Bool)

(assert (=> b!1370800 m!1254317))

(assert (=> b!1370709 d!147277))

(declare-fun b!1370823 () Bool)

(declare-fun e!776513 () Bool)

(assert (=> b!1370823 (= e!776513 (subseq!1084 (t!46694 newAcc!98) (t!46694 acc!866)))))

(declare-fun b!1370822 () Bool)

(declare-fun e!776514 () Bool)

(declare-fun e!776512 () Bool)

(assert (=> b!1370822 (= e!776514 e!776512)))

(declare-fun res!914234 () Bool)

(assert (=> b!1370822 (=> res!914234 e!776512)))

(assert (=> b!1370822 (= res!914234 e!776513)))

(declare-fun res!914233 () Bool)

(assert (=> b!1370822 (=> (not res!914233) (not e!776513))))

(assert (=> b!1370822 (= res!914233 (= (h!33205 newAcc!98) (h!33205 acc!866)))))

(declare-fun b!1370824 () Bool)

(assert (=> b!1370824 (= e!776512 (subseq!1084 newAcc!98 (t!46694 acc!866)))))

(declare-fun b!1370821 () Bool)

(declare-fun e!776515 () Bool)

(assert (=> b!1370821 (= e!776515 e!776514)))

(declare-fun res!914235 () Bool)

(assert (=> b!1370821 (=> (not res!914235) (not e!776514))))

(assert (=> b!1370821 (= res!914235 (is-Cons!31996 acc!866))))

(declare-fun d!147281 () Bool)

(declare-fun res!914236 () Bool)

(assert (=> d!147281 (=> res!914236 e!776515)))

(assert (=> d!147281 (= res!914236 (is-Nil!31997 newAcc!98))))

(assert (=> d!147281 (= (subseq!1084 newAcc!98 acc!866) e!776515)))

(assert (= (and d!147281 (not res!914236)) b!1370821))

(assert (= (and b!1370821 res!914235) b!1370822))

(assert (= (and b!1370822 res!914233) b!1370823))

(assert (= (and b!1370822 (not res!914234)) b!1370824))

(declare-fun m!1254343 () Bool)

(assert (=> b!1370823 m!1254343))

(declare-fun m!1254347 () Bool)

(assert (=> b!1370824 m!1254347))

(assert (=> b!1370696 d!147281))

