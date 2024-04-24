; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116038 () Bool)

(assert start!116038)

(declare-fun b!1370609 () Bool)

(declare-fun res!913309 () Bool)

(declare-fun e!776523 () Bool)

(assert (=> b!1370609 (=> (not res!913309) (not e!776523))))

(declare-datatypes ((List!32011 0))(
  ( (Nil!32008) (Cons!32007 (h!33225 (_ BitVec 64)) (t!46697 List!32011)) )
))
(declare-fun acc!866 () List!32011)

(declare-fun noDuplicate!2527 (List!32011) Bool)

(assert (=> b!1370609 (= res!913309 (noDuplicate!2527 acc!866))))

(declare-fun res!913310 () Bool)

(assert (=> start!116038 (=> (not res!913310) (not e!776523))))

(declare-datatypes ((array!93076 0))(
  ( (array!93077 (arr!44956 (Array (_ BitVec 32) (_ BitVec 64))) (size!45507 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93076)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116038 (= res!913310 (and (bvslt (size!45507 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45507 a!3861))))))

(assert (=> start!116038 e!776523))

(declare-fun array_inv!34237 (array!93076) Bool)

(assert (=> start!116038 (array_inv!34237 a!3861)))

(assert (=> start!116038 true))

(declare-fun b!1370610 () Bool)

(declare-fun res!913312 () Bool)

(declare-fun e!776522 () Bool)

(assert (=> b!1370610 (=> (not res!913312) (not e!776522))))

(assert (=> b!1370610 (= res!913312 (bvsge from!3239 (size!45507 a!3861)))))

(declare-fun b!1370611 () Bool)

(declare-fun res!913314 () Bool)

(assert (=> b!1370611 (=> (not res!913314) (not e!776523))))

(declare-fun newAcc!98 () List!32011)

(declare-fun contains!9696 (List!32011 (_ BitVec 64)) Bool)

(assert (=> b!1370611 (= res!913314 (not (contains!9696 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370612 () Bool)

(declare-fun res!913313 () Bool)

(assert (=> b!1370612 (=> (not res!913313) (not e!776523))))

(assert (=> b!1370612 (= res!913313 (not (contains!9696 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370613 () Bool)

(declare-fun res!913308 () Bool)

(assert (=> b!1370613 (=> (not res!913308) (not e!776523))))

(assert (=> b!1370613 (= res!913308 (not (contains!9696 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370614 () Bool)

(declare-fun res!913307 () Bool)

(assert (=> b!1370614 (=> (not res!913307) (not e!776523))))

(assert (=> b!1370614 (= res!913307 (not (contains!9696 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370615 () Bool)

(assert (=> b!1370615 (= e!776523 e!776522)))

(declare-fun res!913306 () Bool)

(assert (=> b!1370615 (=> (not res!913306) (not e!776522))))

(declare-fun arrayNoDuplicates!0 (array!93076 (_ BitVec 32) List!32011) Bool)

(assert (=> b!1370615 (= res!913306 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45182 0))(
  ( (Unit!45183) )
))
(declare-fun lt!602718 () Unit!45182)

(declare-fun noDuplicateSubseq!242 (List!32011 List!32011) Unit!45182)

(assert (=> b!1370615 (= lt!602718 (noDuplicateSubseq!242 newAcc!98 acc!866))))

(declare-fun b!1370616 () Bool)

(declare-fun res!913311 () Bool)

(assert (=> b!1370616 (=> (not res!913311) (not e!776523))))

(declare-fun subseq!1055 (List!32011 List!32011) Bool)

(assert (=> b!1370616 (= res!913311 (subseq!1055 newAcc!98 acc!866))))

(declare-fun b!1370617 () Bool)

(assert (=> b!1370617 (= e!776522 (not (noDuplicate!2527 newAcc!98)))))

(assert (= (and start!116038 res!913310) b!1370609))

(assert (= (and b!1370609 res!913309) b!1370613))

(assert (= (and b!1370613 res!913308) b!1370612))

(assert (= (and b!1370612 res!913313) b!1370611))

(assert (= (and b!1370611 res!913314) b!1370614))

(assert (= (and b!1370614 res!913307) b!1370616))

(assert (= (and b!1370616 res!913311) b!1370615))

(assert (= (and b!1370615 res!913306) b!1370610))

(assert (= (and b!1370610 res!913312) b!1370617))

(declare-fun m!1254715 () Bool)

(assert (=> b!1370615 m!1254715))

(declare-fun m!1254717 () Bool)

(assert (=> b!1370615 m!1254717))

(declare-fun m!1254719 () Bool)

(assert (=> b!1370617 m!1254719))

(declare-fun m!1254721 () Bool)

(assert (=> b!1370612 m!1254721))

(declare-fun m!1254723 () Bool)

(assert (=> b!1370614 m!1254723))

(declare-fun m!1254725 () Bool)

(assert (=> start!116038 m!1254725))

(declare-fun m!1254727 () Bool)

(assert (=> b!1370609 m!1254727))

(declare-fun m!1254729 () Bool)

(assert (=> b!1370611 m!1254729))

(declare-fun m!1254731 () Bool)

(assert (=> b!1370613 m!1254731))

(declare-fun m!1254733 () Bool)

(assert (=> b!1370616 m!1254733))

(check-sat (not b!1370613) (not b!1370612) (not b!1370609) (not b!1370614) (not start!116038) (not b!1370617) (not b!1370615) (not b!1370616) (not b!1370611))
(check-sat)
(get-model)

(declare-fun d!147451 () Bool)

(declare-fun lt!602727 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!719 (List!32011) (InoxSet (_ BitVec 64)))

(assert (=> d!147451 (= lt!602727 (select (content!719 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776547 () Bool)

(assert (=> d!147451 (= lt!602727 e!776547)))

(declare-fun res!913374 () Bool)

(assert (=> d!147451 (=> (not res!913374) (not e!776547))))

(get-info :version)

(assert (=> d!147451 (= res!913374 ((_ is Cons!32007) newAcc!98))))

(assert (=> d!147451 (= (contains!9696 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602727)))

(declare-fun b!1370676 () Bool)

(declare-fun e!776548 () Bool)

(assert (=> b!1370676 (= e!776547 e!776548)))

(declare-fun res!913373 () Bool)

(assert (=> b!1370676 (=> res!913373 e!776548)))

(assert (=> b!1370676 (= res!913373 (= (h!33225 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370677 () Bool)

(assert (=> b!1370677 (= e!776548 (contains!9696 (t!46697 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147451 res!913374) b!1370676))

(assert (= (and b!1370676 (not res!913373)) b!1370677))

(declare-fun m!1254775 () Bool)

(assert (=> d!147451 m!1254775))

(declare-fun m!1254777 () Bool)

(assert (=> d!147451 m!1254777))

(declare-fun m!1254779 () Bool)

(assert (=> b!1370677 m!1254779))

(assert (=> b!1370611 d!147451))

(declare-fun b!1370706 () Bool)

(declare-fun e!776577 () Bool)

(declare-fun e!776578 () Bool)

(assert (=> b!1370706 (= e!776577 e!776578)))

(declare-fun res!913403 () Bool)

(assert (=> b!1370706 (=> (not res!913403) (not e!776578))))

(assert (=> b!1370706 (= res!913403 ((_ is Cons!32007) acc!866))))

(declare-fun b!1370708 () Bool)

(declare-fun e!776579 () Bool)

(assert (=> b!1370708 (= e!776579 (subseq!1055 (t!46697 newAcc!98) (t!46697 acc!866)))))

(declare-fun b!1370709 () Bool)

(declare-fun e!776580 () Bool)

(assert (=> b!1370709 (= e!776580 (subseq!1055 newAcc!98 (t!46697 acc!866)))))

(declare-fun d!147457 () Bool)

(declare-fun res!913405 () Bool)

(assert (=> d!147457 (=> res!913405 e!776577)))

(assert (=> d!147457 (= res!913405 ((_ is Nil!32008) newAcc!98))))

(assert (=> d!147457 (= (subseq!1055 newAcc!98 acc!866) e!776577)))

(declare-fun b!1370707 () Bool)

(assert (=> b!1370707 (= e!776578 e!776580)))

(declare-fun res!913404 () Bool)

(assert (=> b!1370707 (=> res!913404 e!776580)))

(assert (=> b!1370707 (= res!913404 e!776579)))

(declare-fun res!913406 () Bool)

(assert (=> b!1370707 (=> (not res!913406) (not e!776579))))

(assert (=> b!1370707 (= res!913406 (= (h!33225 newAcc!98) (h!33225 acc!866)))))

(assert (= (and d!147457 (not res!913405)) b!1370706))

(assert (= (and b!1370706 res!913403) b!1370707))

(assert (= (and b!1370707 res!913406) b!1370708))

(assert (= (and b!1370707 (not res!913404)) b!1370709))

(declare-fun m!1254789 () Bool)

(assert (=> b!1370708 m!1254789))

(declare-fun m!1254791 () Bool)

(assert (=> b!1370709 m!1254791))

(assert (=> b!1370616 d!147457))

(declare-fun d!147463 () Bool)

(declare-fun res!913429 () Bool)

(declare-fun e!776603 () Bool)

(assert (=> d!147463 (=> res!913429 e!776603)))

(assert (=> d!147463 (= res!913429 ((_ is Nil!32008) newAcc!98))))

(assert (=> d!147463 (= (noDuplicate!2527 newAcc!98) e!776603)))

(declare-fun b!1370732 () Bool)

(declare-fun e!776604 () Bool)

(assert (=> b!1370732 (= e!776603 e!776604)))

(declare-fun res!913430 () Bool)

(assert (=> b!1370732 (=> (not res!913430) (not e!776604))))

(assert (=> b!1370732 (= res!913430 (not (contains!9696 (t!46697 newAcc!98) (h!33225 newAcc!98))))))

(declare-fun b!1370733 () Bool)

(assert (=> b!1370733 (= e!776604 (noDuplicate!2527 (t!46697 newAcc!98)))))

(assert (= (and d!147463 (not res!913429)) b!1370732))

(assert (= (and b!1370732 res!913430) b!1370733))

(declare-fun m!1254805 () Bool)

(assert (=> b!1370732 m!1254805))

(declare-fun m!1254807 () Bool)

(assert (=> b!1370733 m!1254807))

(assert (=> b!1370617 d!147463))

(declare-fun d!147471 () Bool)

(assert (=> d!147471 (= (array_inv!34237 a!3861) (bvsge (size!45507 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116038 d!147471))

(declare-fun b!1370772 () Bool)

(declare-fun e!776639 () Bool)

(declare-fun e!776642 () Bool)

(assert (=> b!1370772 (= e!776639 e!776642)))

(declare-fun res!913463 () Bool)

(assert (=> b!1370772 (=> (not res!913463) (not e!776642))))

(declare-fun e!776641 () Bool)

(assert (=> b!1370772 (= res!913463 (not e!776641))))

(declare-fun res!913461 () Bool)

(assert (=> b!1370772 (=> (not res!913461) (not e!776641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370772 (= res!913461 (validKeyInArray!0 (select (arr!44956 a!3861) from!3239)))))

(declare-fun b!1370773 () Bool)

(declare-fun e!776640 () Bool)

(assert (=> b!1370773 (= e!776642 e!776640)))

(declare-fun c!128103 () Bool)

(assert (=> b!1370773 (= c!128103 (validKeyInArray!0 (select (arr!44956 a!3861) from!3239)))))

(declare-fun bm!65574 () Bool)

(declare-fun call!65577 () Bool)

(assert (=> bm!65574 (= call!65577 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128103 (Cons!32007 (select (arr!44956 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1370774 () Bool)

(assert (=> b!1370774 (= e!776641 (contains!9696 acc!866 (select (arr!44956 a!3861) from!3239)))))

(declare-fun b!1370775 () Bool)

(assert (=> b!1370775 (= e!776640 call!65577)))

(declare-fun d!147475 () Bool)

(declare-fun res!913462 () Bool)

(assert (=> d!147475 (=> res!913462 e!776639)))

(assert (=> d!147475 (= res!913462 (bvsge from!3239 (size!45507 a!3861)))))

(assert (=> d!147475 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776639)))

(declare-fun b!1370776 () Bool)

(assert (=> b!1370776 (= e!776640 call!65577)))

(assert (= (and d!147475 (not res!913462)) b!1370772))

(assert (= (and b!1370772 res!913461) b!1370774))

(assert (= (and b!1370772 res!913463) b!1370773))

(assert (= (and b!1370773 c!128103) b!1370776))

(assert (= (and b!1370773 (not c!128103)) b!1370775))

(assert (= (or b!1370776 b!1370775) bm!65574))

(declare-fun m!1254821 () Bool)

(assert (=> b!1370772 m!1254821))

(assert (=> b!1370772 m!1254821))

(declare-fun m!1254823 () Bool)

(assert (=> b!1370772 m!1254823))

(assert (=> b!1370773 m!1254821))

(assert (=> b!1370773 m!1254821))

(assert (=> b!1370773 m!1254823))

(assert (=> bm!65574 m!1254821))

(declare-fun m!1254825 () Bool)

(assert (=> bm!65574 m!1254825))

(assert (=> b!1370774 m!1254821))

(assert (=> b!1370774 m!1254821))

(declare-fun m!1254827 () Bool)

(assert (=> b!1370774 m!1254827))

(assert (=> b!1370615 d!147475))

(declare-fun d!147481 () Bool)

(assert (=> d!147481 (noDuplicate!2527 newAcc!98)))

(declare-fun lt!602736 () Unit!45182)

(declare-fun choose!2005 (List!32011 List!32011) Unit!45182)

(assert (=> d!147481 (= lt!602736 (choose!2005 newAcc!98 acc!866))))

(declare-fun e!776655 () Bool)

(assert (=> d!147481 e!776655))

(declare-fun res!913472 () Bool)

(assert (=> d!147481 (=> (not res!913472) (not e!776655))))

(assert (=> d!147481 (= res!913472 (subseq!1055 newAcc!98 acc!866))))

(assert (=> d!147481 (= (noDuplicateSubseq!242 newAcc!98 acc!866) lt!602736)))

(declare-fun b!1370793 () Bool)

(assert (=> b!1370793 (= e!776655 (noDuplicate!2527 acc!866))))

(assert (= (and d!147481 res!913472) b!1370793))

(assert (=> d!147481 m!1254719))

(declare-fun m!1254845 () Bool)

(assert (=> d!147481 m!1254845))

(assert (=> d!147481 m!1254733))

(assert (=> b!1370793 m!1254727))

(assert (=> b!1370615 d!147481))

(declare-fun d!147487 () Bool)

(declare-fun res!913473 () Bool)

(declare-fun e!776656 () Bool)

(assert (=> d!147487 (=> res!913473 e!776656)))

(assert (=> d!147487 (= res!913473 ((_ is Nil!32008) acc!866))))

(assert (=> d!147487 (= (noDuplicate!2527 acc!866) e!776656)))

(declare-fun b!1370794 () Bool)

(declare-fun e!776657 () Bool)

(assert (=> b!1370794 (= e!776656 e!776657)))

(declare-fun res!913474 () Bool)

(assert (=> b!1370794 (=> (not res!913474) (not e!776657))))

(assert (=> b!1370794 (= res!913474 (not (contains!9696 (t!46697 acc!866) (h!33225 acc!866))))))

(declare-fun b!1370795 () Bool)

(assert (=> b!1370795 (= e!776657 (noDuplicate!2527 (t!46697 acc!866)))))

(assert (= (and d!147487 (not res!913473)) b!1370794))

(assert (= (and b!1370794 res!913474) b!1370795))

(declare-fun m!1254847 () Bool)

(assert (=> b!1370794 m!1254847))

(declare-fun m!1254849 () Bool)

(assert (=> b!1370795 m!1254849))

(assert (=> b!1370609 d!147487))

(declare-fun d!147489 () Bool)

(declare-fun lt!602737 () Bool)

(assert (=> d!147489 (= lt!602737 (select (content!719 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776658 () Bool)

(assert (=> d!147489 (= lt!602737 e!776658)))

(declare-fun res!913476 () Bool)

(assert (=> d!147489 (=> (not res!913476) (not e!776658))))

(assert (=> d!147489 (= res!913476 ((_ is Cons!32007) newAcc!98))))

(assert (=> d!147489 (= (contains!9696 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602737)))

(declare-fun b!1370796 () Bool)

(declare-fun e!776659 () Bool)

(assert (=> b!1370796 (= e!776658 e!776659)))

(declare-fun res!913475 () Bool)

(assert (=> b!1370796 (=> res!913475 e!776659)))

(assert (=> b!1370796 (= res!913475 (= (h!33225 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370797 () Bool)

(assert (=> b!1370797 (= e!776659 (contains!9696 (t!46697 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147489 res!913476) b!1370796))

(assert (= (and b!1370796 (not res!913475)) b!1370797))

(assert (=> d!147489 m!1254775))

(declare-fun m!1254851 () Bool)

(assert (=> d!147489 m!1254851))

(declare-fun m!1254853 () Bool)

(assert (=> b!1370797 m!1254853))

(assert (=> b!1370614 d!147489))

(declare-fun d!147491 () Bool)

(declare-fun lt!602738 () Bool)

(assert (=> d!147491 (= lt!602738 (select (content!719 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776660 () Bool)

(assert (=> d!147491 (= lt!602738 e!776660)))

(declare-fun res!913478 () Bool)

(assert (=> d!147491 (=> (not res!913478) (not e!776660))))

(assert (=> d!147491 (= res!913478 ((_ is Cons!32007) acc!866))))

(assert (=> d!147491 (= (contains!9696 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602738)))

(declare-fun b!1370798 () Bool)

(declare-fun e!776661 () Bool)

(assert (=> b!1370798 (= e!776660 e!776661)))

(declare-fun res!913477 () Bool)

(assert (=> b!1370798 (=> res!913477 e!776661)))

(assert (=> b!1370798 (= res!913477 (= (h!33225 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370799 () Bool)

(assert (=> b!1370799 (= e!776661 (contains!9696 (t!46697 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147491 res!913478) b!1370798))

(assert (= (and b!1370798 (not res!913477)) b!1370799))

(declare-fun m!1254855 () Bool)

(assert (=> d!147491 m!1254855))

(declare-fun m!1254857 () Bool)

(assert (=> d!147491 m!1254857))

(declare-fun m!1254859 () Bool)

(assert (=> b!1370799 m!1254859))

(assert (=> b!1370612 d!147491))

(declare-fun d!147493 () Bool)

(declare-fun lt!602741 () Bool)

(assert (=> d!147493 (= lt!602741 (select (content!719 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776664 () Bool)

(assert (=> d!147493 (= lt!602741 e!776664)))

(declare-fun res!913482 () Bool)

(assert (=> d!147493 (=> (not res!913482) (not e!776664))))

(assert (=> d!147493 (= res!913482 ((_ is Cons!32007) acc!866))))

(assert (=> d!147493 (= (contains!9696 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602741)))

(declare-fun b!1370802 () Bool)

(declare-fun e!776665 () Bool)

(assert (=> b!1370802 (= e!776664 e!776665)))

(declare-fun res!913481 () Bool)

(assert (=> b!1370802 (=> res!913481 e!776665)))

(assert (=> b!1370802 (= res!913481 (= (h!33225 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370803 () Bool)

(assert (=> b!1370803 (= e!776665 (contains!9696 (t!46697 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147493 res!913482) b!1370802))

(assert (= (and b!1370802 (not res!913481)) b!1370803))

(assert (=> d!147493 m!1254855))

(declare-fun m!1254861 () Bool)

(assert (=> d!147493 m!1254861))

(declare-fun m!1254863 () Bool)

(assert (=> b!1370803 m!1254863))

(assert (=> b!1370613 d!147493))

(check-sat (not b!1370774) (not d!147491) (not b!1370732) (not bm!65574) (not d!147489) (not b!1370677) (not b!1370803) (not b!1370797) (not b!1370733) (not b!1370795) (not d!147451) (not b!1370799) (not b!1370709) (not b!1370793) (not b!1370708) (not b!1370772) (not b!1370794) (not b!1370773) (not d!147481) (not d!147493))
(check-sat)
