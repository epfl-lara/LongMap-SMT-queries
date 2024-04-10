; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61464 () Bool)

(assert start!61464)

(declare-fun b!687695 () Bool)

(declare-fun res!452556 () Bool)

(declare-fun e!391670 () Bool)

(assert (=> b!687695 (=> res!452556 e!391670)))

(declare-datatypes ((List!13057 0))(
  ( (Nil!13054) (Cons!13053 (h!14098 (_ BitVec 64)) (t!19318 List!13057)) )
))
(declare-fun lt!315503 () List!13057)

(declare-fun noDuplicate!881 (List!13057) Bool)

(assert (=> b!687695 (= res!452556 (not (noDuplicate!881 lt!315503)))))

(declare-fun b!687696 () Bool)

(declare-fun res!452560 () Bool)

(declare-fun e!391671 () Bool)

(assert (=> b!687696 (=> (not res!452560) (not e!391671))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39686 0))(
  ( (array!39687 (arr!19016 (Array (_ BitVec 32) (_ BitVec 64))) (size!19395 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39686)

(assert (=> b!687696 (= res!452560 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19395 a!3626))))))

(declare-fun b!687697 () Bool)

(declare-datatypes ((Unit!24247 0))(
  ( (Unit!24248) )
))
(declare-fun e!391663 () Unit!24247)

(declare-fun Unit!24249 () Unit!24247)

(assert (=> b!687697 (= e!391663 Unit!24249)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!315509 () Unit!24247)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39686 (_ BitVec 64) (_ BitVec 32)) Unit!24247)

(assert (=> b!687697 (= lt!315509 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!687697 false))

(declare-fun b!687698 () Bool)

(assert (=> b!687698 (= e!391671 (not e!391670))))

(declare-fun res!452551 () Bool)

(assert (=> b!687698 (=> res!452551 e!391670)))

(assert (=> b!687698 (= res!452551 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39686 (_ BitVec 32) List!13057) Bool)

(assert (=> b!687698 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315503)))

(declare-fun acc!681 () List!13057)

(declare-fun lt!315506 () Unit!24247)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39686 (_ BitVec 64) (_ BitVec 32) List!13057 List!13057) Unit!24247)

(assert (=> b!687698 (= lt!315506 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315503))))

(declare-fun -!185 (List!13057 (_ BitVec 64)) List!13057)

(assert (=> b!687698 (= (-!185 lt!315503 k!2843) acc!681)))

(declare-fun $colon$colon!385 (List!13057 (_ BitVec 64)) List!13057)

(assert (=> b!687698 (= lt!315503 ($colon$colon!385 acc!681 k!2843))))

(declare-fun lt!315507 () Unit!24247)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13057) Unit!24247)

(assert (=> b!687698 (= lt!315507 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!220 (List!13057 List!13057) Bool)

(assert (=> b!687698 (subseq!220 acc!681 acc!681)))

(declare-fun lt!315505 () Unit!24247)

(declare-fun lemmaListSubSeqRefl!0 (List!13057) Unit!24247)

(assert (=> b!687698 (= lt!315505 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687698 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315508 () Unit!24247)

(declare-fun e!391668 () Unit!24247)

(assert (=> b!687698 (= lt!315508 e!391668)))

(declare-fun c!77941 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687698 (= c!77941 (validKeyInArray!0 (select (arr!19016 a!3626) from!3004)))))

(declare-fun lt!315511 () Unit!24247)

(assert (=> b!687698 (= lt!315511 e!391663)))

(declare-fun c!77942 () Bool)

(declare-fun arrayContainsKey!0 (array!39686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687698 (= c!77942 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687698 (arrayContainsKey!0 (array!39687 (store (arr!19016 a!3626) i!1382 k!2843) (size!19395 a!3626)) k!2843 from!3004)))

(declare-fun b!687699 () Bool)

(declare-fun e!391666 () Bool)

(declare-fun contains!3634 (List!13057 (_ BitVec 64)) Bool)

(assert (=> b!687699 (= e!391666 (not (contains!3634 lt!315503 k!2843)))))

(declare-fun b!687700 () Bool)

(declare-fun Unit!24250 () Unit!24247)

(assert (=> b!687700 (= e!391668 Unit!24250)))

(declare-fun b!687701 () Bool)

(declare-fun res!452565 () Bool)

(assert (=> b!687701 (=> (not res!452565) (not e!391671))))

(assert (=> b!687701 (= res!452565 (validKeyInArray!0 k!2843))))

(declare-fun b!687702 () Bool)

(declare-fun res!452553 () Bool)

(assert (=> b!687702 (=> (not res!452553) (not e!391671))))

(assert (=> b!687702 (= res!452553 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687703 () Bool)

(declare-fun res!452555 () Bool)

(assert (=> b!687703 (=> (not res!452555) (not e!391671))))

(assert (=> b!687703 (= res!452555 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687705 () Bool)

(declare-fun e!391667 () Bool)

(assert (=> b!687705 (= e!391667 (not (contains!3634 acc!681 k!2843)))))

(declare-fun b!687706 () Bool)

(assert (=> b!687706 (= e!391670 e!391666)))

(declare-fun res!452549 () Bool)

(assert (=> b!687706 (=> (not res!452549) (not e!391666))))

(assert (=> b!687706 (= res!452549 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687707 () Bool)

(declare-fun Unit!24251 () Unit!24247)

(assert (=> b!687707 (= e!391663 Unit!24251)))

(declare-fun b!687708 () Bool)

(declare-fun lt!315504 () Unit!24247)

(assert (=> b!687708 (= e!391668 lt!315504)))

(declare-fun lt!315510 () Unit!24247)

(assert (=> b!687708 (= lt!315510 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687708 (subseq!220 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39686 List!13057 List!13057 (_ BitVec 32)) Unit!24247)

(assert (=> b!687708 (= lt!315504 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!385 acc!681 (select (arr!19016 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687708 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687709 () Bool)

(declare-fun res!452557 () Bool)

(assert (=> b!687709 (=> (not res!452557) (not e!391671))))

(assert (=> b!687709 (= res!452557 (noDuplicate!881 acc!681))))

(declare-fun b!687710 () Bool)

(declare-fun res!452562 () Bool)

(assert (=> b!687710 (=> (not res!452562) (not e!391671))))

(assert (=> b!687710 (= res!452562 (not (contains!3634 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687711 () Bool)

(declare-fun e!391665 () Bool)

(assert (=> b!687711 (= e!391665 (contains!3634 lt!315503 k!2843))))

(declare-fun b!687712 () Bool)

(declare-fun res!452566 () Bool)

(assert (=> b!687712 (=> res!452566 e!391670)))

(assert (=> b!687712 (= res!452566 (contains!3634 lt!315503 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687713 () Bool)

(declare-fun res!452563 () Bool)

(assert (=> b!687713 (=> (not res!452563) (not e!391671))))

(assert (=> b!687713 (= res!452563 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13054))))

(declare-fun b!687714 () Bool)

(declare-fun res!452552 () Bool)

(assert (=> b!687714 (=> (not res!452552) (not e!391671))))

(assert (=> b!687714 (= res!452552 (not (contains!3634 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687715 () Bool)

(declare-fun res!452561 () Bool)

(assert (=> b!687715 (=> res!452561 e!391670)))

(assert (=> b!687715 (= res!452561 e!391665)))

(declare-fun res!452558 () Bool)

(assert (=> b!687715 (=> (not res!452558) (not e!391665))))

(assert (=> b!687715 (= res!452558 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687716 () Bool)

(declare-fun e!391669 () Bool)

(assert (=> b!687716 (= e!391669 e!391667)))

(declare-fun res!452567 () Bool)

(assert (=> b!687716 (=> (not res!452567) (not e!391667))))

(assert (=> b!687716 (= res!452567 (bvsle from!3004 i!1382))))

(declare-fun b!687704 () Bool)

(declare-fun e!391662 () Bool)

(assert (=> b!687704 (= e!391662 (contains!3634 acc!681 k!2843))))

(declare-fun res!452548 () Bool)

(assert (=> start!61464 (=> (not res!452548) (not e!391671))))

(assert (=> start!61464 (= res!452548 (and (bvslt (size!19395 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19395 a!3626))))))

(assert (=> start!61464 e!391671))

(assert (=> start!61464 true))

(declare-fun array_inv!14812 (array!39686) Bool)

(assert (=> start!61464 (array_inv!14812 a!3626)))

(declare-fun b!687717 () Bool)

(declare-fun res!452547 () Bool)

(assert (=> b!687717 (=> res!452547 e!391670)))

(assert (=> b!687717 (= res!452547 (contains!3634 lt!315503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687718 () Bool)

(declare-fun res!452550 () Bool)

(assert (=> b!687718 (=> (not res!452550) (not e!391671))))

(assert (=> b!687718 (= res!452550 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19395 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687719 () Bool)

(declare-fun res!452554 () Bool)

(assert (=> b!687719 (=> (not res!452554) (not e!391671))))

(assert (=> b!687719 (= res!452554 e!391669)))

(declare-fun res!452559 () Bool)

(assert (=> b!687719 (=> res!452559 e!391669)))

(assert (=> b!687719 (= res!452559 e!391662)))

(declare-fun res!452564 () Bool)

(assert (=> b!687719 (=> (not res!452564) (not e!391662))))

(assert (=> b!687719 (= res!452564 (bvsgt from!3004 i!1382))))

(assert (= (and start!61464 res!452548) b!687709))

(assert (= (and b!687709 res!452557) b!687714))

(assert (= (and b!687714 res!452552) b!687710))

(assert (= (and b!687710 res!452562) b!687719))

(assert (= (and b!687719 res!452564) b!687704))

(assert (= (and b!687719 (not res!452559)) b!687716))

(assert (= (and b!687716 res!452567) b!687705))

(assert (= (and b!687719 res!452554) b!687713))

(assert (= (and b!687713 res!452563) b!687702))

(assert (= (and b!687702 res!452553) b!687696))

(assert (= (and b!687696 res!452560) b!687701))

(assert (= (and b!687701 res!452565) b!687703))

(assert (= (and b!687703 res!452555) b!687718))

(assert (= (and b!687718 res!452550) b!687698))

(assert (= (and b!687698 c!77942) b!687697))

(assert (= (and b!687698 (not c!77942)) b!687707))

(assert (= (and b!687698 c!77941) b!687708))

(assert (= (and b!687698 (not c!77941)) b!687700))

(assert (= (and b!687698 (not res!452551)) b!687695))

(assert (= (and b!687695 (not res!452556)) b!687717))

(assert (= (and b!687717 (not res!452547)) b!687712))

(assert (= (and b!687712 (not res!452566)) b!687715))

(assert (= (and b!687715 res!452558) b!687711))

(assert (= (and b!687715 (not res!452561)) b!687706))

(assert (= (and b!687706 res!452549) b!687699))

(declare-fun m!651685 () Bool)

(assert (=> b!687711 m!651685))

(declare-fun m!651687 () Bool)

(assert (=> start!61464 m!651687))

(declare-fun m!651689 () Bool)

(assert (=> b!687709 m!651689))

(declare-fun m!651691 () Bool)

(assert (=> b!687697 m!651691))

(declare-fun m!651693 () Bool)

(assert (=> b!687701 m!651693))

(declare-fun m!651695 () Bool)

(assert (=> b!687708 m!651695))

(declare-fun m!651697 () Bool)

(assert (=> b!687708 m!651697))

(declare-fun m!651699 () Bool)

(assert (=> b!687708 m!651699))

(declare-fun m!651701 () Bool)

(assert (=> b!687708 m!651701))

(assert (=> b!687708 m!651697))

(assert (=> b!687708 m!651699))

(declare-fun m!651703 () Bool)

(assert (=> b!687708 m!651703))

(declare-fun m!651705 () Bool)

(assert (=> b!687708 m!651705))

(declare-fun m!651707 () Bool)

(assert (=> b!687705 m!651707))

(declare-fun m!651709 () Bool)

(assert (=> b!687710 m!651709))

(assert (=> b!687698 m!651695))

(assert (=> b!687698 m!651697))

(declare-fun m!651711 () Bool)

(assert (=> b!687698 m!651711))

(declare-fun m!651713 () Bool)

(assert (=> b!687698 m!651713))

(assert (=> b!687698 m!651703))

(declare-fun m!651715 () Bool)

(assert (=> b!687698 m!651715))

(declare-fun m!651717 () Bool)

(assert (=> b!687698 m!651717))

(declare-fun m!651719 () Bool)

(assert (=> b!687698 m!651719))

(assert (=> b!687698 m!651697))

(declare-fun m!651721 () Bool)

(assert (=> b!687698 m!651721))

(declare-fun m!651723 () Bool)

(assert (=> b!687698 m!651723))

(declare-fun m!651725 () Bool)

(assert (=> b!687698 m!651725))

(assert (=> b!687698 m!651705))

(declare-fun m!651727 () Bool)

(assert (=> b!687698 m!651727))

(declare-fun m!651729 () Bool)

(assert (=> b!687703 m!651729))

(declare-fun m!651731 () Bool)

(assert (=> b!687702 m!651731))

(declare-fun m!651733 () Bool)

(assert (=> b!687712 m!651733))

(assert (=> b!687699 m!651685))

(declare-fun m!651735 () Bool)

(assert (=> b!687713 m!651735))

(declare-fun m!651737 () Bool)

(assert (=> b!687714 m!651737))

(declare-fun m!651739 () Bool)

(assert (=> b!687717 m!651739))

(declare-fun m!651741 () Bool)

(assert (=> b!687695 m!651741))

(assert (=> b!687704 m!651707))

(push 1)

(assert (not b!687713))

(assert (not b!687712))

(assert (not b!687705))

(assert (not b!687709))

(assert (not b!687702))

(assert (not b!687714))

(assert (not b!687717))

(assert (not b!687699))

(assert (not b!687697))

(assert (not b!687704))

(assert (not b!687710))

(assert (not b!687703))

(assert (not b!687698))

(assert (not b!687711))

(assert (not b!687701))

(assert (not b!687708))

(assert (not start!61464))

(assert (not b!687695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95073 () Bool)

(declare-fun lt!315514 () Bool)

(declare-fun content!300 (List!13057) (Set (_ BitVec 64)))

(assert (=> d!95073 (= lt!315514 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!300 acc!681)))))

(declare-fun e!391683 () Bool)

(assert (=> d!95073 (= lt!315514 e!391683)))

(declare-fun res!452579 () Bool)

(assert (=> d!95073 (=> (not res!452579) (not e!391683))))

(assert (=> d!95073 (= res!452579 (is-Cons!13053 acc!681))))

(assert (=> d!95073 (= (contains!3634 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315514)))

(declare-fun b!687730 () Bool)

(declare-fun e!391682 () Bool)

(assert (=> b!687730 (= e!391683 e!391682)))

(declare-fun res!452578 () Bool)

(assert (=> b!687730 (=> res!452578 e!391682)))

(assert (=> b!687730 (= res!452578 (= (h!14098 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687731 () Bool)

(assert (=> b!687731 (= e!391682 (contains!3634 (t!19318 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95073 res!452579) b!687730))

(assert (= (and b!687730 (not res!452578)) b!687731))

(declare-fun m!651747 () Bool)

(assert (=> d!95073 m!651747))

(declare-fun m!651749 () Bool)

(assert (=> d!95073 m!651749))

(declare-fun m!651751 () Bool)

(assert (=> b!687731 m!651751))

(assert (=> b!687710 d!95073))

(declare-fun d!95077 () Bool)

(assert (=> d!95077 (= (array_inv!14812 a!3626) (bvsge (size!19395 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61464 d!95077))

(declare-fun d!95079 () Bool)

(declare-fun lt!315515 () Bool)

(assert (=> d!95079 (= lt!315515 (member k!2843 (content!300 lt!315503)))))

(declare-fun e!391685 () Bool)

(assert (=> d!95079 (= lt!315515 e!391685)))

(declare-fun res!452581 () Bool)

(assert (=> d!95079 (=> (not res!452581) (not e!391685))))

(assert (=> d!95079 (= res!452581 (is-Cons!13053 lt!315503))))

(assert (=> d!95079 (= (contains!3634 lt!315503 k!2843) lt!315515)))

(declare-fun b!687732 () Bool)

(declare-fun e!391684 () Bool)

(assert (=> b!687732 (= e!391685 e!391684)))

(declare-fun res!452580 () Bool)

(assert (=> b!687732 (=> res!452580 e!391684)))

(assert (=> b!687732 (= res!452580 (= (h!14098 lt!315503) k!2843))))

(declare-fun b!687733 () Bool)

(assert (=> b!687733 (= e!391684 (contains!3634 (t!19318 lt!315503) k!2843))))

(assert (= (and d!95079 res!452581) b!687732))

(assert (= (and b!687732 (not res!452580)) b!687733))

(declare-fun m!651753 () Bool)

(assert (=> d!95079 m!651753))

(declare-fun m!651755 () Bool)

(assert (=> d!95079 m!651755))

(declare-fun m!651757 () Bool)

(assert (=> b!687733 m!651757))

(assert (=> b!687711 d!95079))

(declare-fun d!95081 () Bool)

(declare-fun res!452592 () Bool)

(declare-fun e!391696 () Bool)

(assert (=> d!95081 (=> res!452592 e!391696)))

(assert (=> d!95081 (= res!452592 (is-Nil!13054 acc!681))))

(assert (=> d!95081 (= (noDuplicate!881 acc!681) e!391696)))

(declare-fun b!687746 () Bool)

(declare-fun e!391697 () Bool)

(assert (=> b!687746 (= e!391696 e!391697)))

(declare-fun res!452593 () Bool)

(assert (=> b!687746 (=> (not res!452593) (not e!391697))))

(assert (=> b!687746 (= res!452593 (not (contains!3634 (t!19318 acc!681) (h!14098 acc!681))))))

(declare-fun b!687747 () Bool)

(assert (=> b!687747 (= e!391697 (noDuplicate!881 (t!19318 acc!681)))))

(assert (= (and d!95081 (not res!452592)) b!687746))

(assert (= (and b!687746 res!452593) b!687747))

(declare-fun m!651759 () Bool)

(assert (=> b!687746 m!651759))

(declare-fun m!651761 () Bool)

(assert (=> b!687747 m!651761))

(assert (=> b!687709 d!95081))

(declare-fun d!95083 () Bool)

(declare-fun res!452616 () Bool)

(declare-fun e!391724 () Bool)

(assert (=> d!95083 (=> res!452616 e!391724)))

(assert (=> d!95083 (= res!452616 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19395 a!3626)))))

(assert (=> d!95083 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315503) e!391724)))

(declare-fun b!687777 () Bool)

(declare-fun e!391725 () Bool)

(assert (=> b!687777 (= e!391725 (contains!3634 lt!315503 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687778 () Bool)

(declare-fun e!391727 () Bool)

(declare-fun e!391726 () Bool)

(assert (=> b!687778 (= e!391727 e!391726)))

(declare-fun c!77948 () Bool)

(assert (=> b!687778 (= c!77948 (validKeyInArray!0 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34160 () Bool)

(declare-fun bm!34157 () Bool)

(assert (=> bm!34157 (= call!34160 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77948 (Cons!13053 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315503) lt!315503)))))

(declare-fun b!687779 () Bool)

(assert (=> b!687779 (= e!391724 e!391727)))

(declare-fun res!452617 () Bool)

(assert (=> b!687779 (=> (not res!452617) (not e!391727))))

(assert (=> b!687779 (= res!452617 (not e!391725))))

(declare-fun res!452615 () Bool)

(assert (=> b!687779 (=> (not res!452615) (not e!391725))))

(assert (=> b!687779 (= res!452615 (validKeyInArray!0 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687780 () Bool)

(assert (=> b!687780 (= e!391726 call!34160)))

(declare-fun b!687781 () Bool)

(assert (=> b!687781 (= e!391726 call!34160)))

(assert (= (and d!95083 (not res!452616)) b!687779))

(assert (= (and b!687779 res!452615) b!687777))

(assert (= (and b!687779 res!452617) b!687778))

(assert (= (and b!687778 c!77948) b!687781))

(assert (= (and b!687778 (not c!77948)) b!687780))

(assert (= (or b!687781 b!687780) bm!34157))

(declare-fun m!651785 () Bool)

(assert (=> b!687777 m!651785))

(assert (=> b!687777 m!651785))

(declare-fun m!651787 () Bool)

(assert (=> b!687777 m!651787))

(assert (=> b!687778 m!651785))

(assert (=> b!687778 m!651785))

(declare-fun m!651789 () Bool)

(assert (=> b!687778 m!651789))

(assert (=> bm!34157 m!651785))

(declare-fun m!651791 () Bool)

(assert (=> bm!34157 m!651791))

(assert (=> b!687779 m!651785))

(assert (=> b!687779 m!651785))

(assert (=> b!687779 m!651789))

(assert (=> b!687698 d!95083))

(declare-fun b!687811 () Bool)

(declare-fun e!391753 () Bool)

(declare-fun e!391755 () Bool)

(assert (=> b!687811 (= e!391753 e!391755)))

(declare-fun res!452638 () Bool)

(assert (=> b!687811 (=> (not res!452638) (not e!391755))))

(assert (=> b!687811 (= res!452638 (is-Cons!13053 acc!681))))

(declare-fun d!95095 () Bool)

(declare-fun res!452639 () Bool)

(assert (=> d!95095 (=> res!452639 e!391753)))

(assert (=> d!95095 (= res!452639 (is-Nil!13054 acc!681))))

(assert (=> d!95095 (= (subseq!220 acc!681 acc!681) e!391753)))

(declare-fun b!687812 () Bool)

(declare-fun e!391754 () Bool)

(assert (=> b!687812 (= e!391755 e!391754)))

(declare-fun res!452637 () Bool)

(assert (=> b!687812 (=> res!452637 e!391754)))

(declare-fun e!391756 () Bool)

(assert (=> b!687812 (= res!452637 e!391756)))

(declare-fun res!452640 () Bool)

(assert (=> b!687812 (=> (not res!452640) (not e!391756))))

(assert (=> b!687812 (= res!452640 (= (h!14098 acc!681) (h!14098 acc!681)))))

(declare-fun b!687814 () Bool)

(assert (=> b!687814 (= e!391754 (subseq!220 acc!681 (t!19318 acc!681)))))

(declare-fun b!687813 () Bool)

(assert (=> b!687813 (= e!391756 (subseq!220 (t!19318 acc!681) (t!19318 acc!681)))))

(assert (= (and d!95095 (not res!452639)) b!687811))

(assert (= (and b!687811 res!452638) b!687812))

(assert (= (and b!687812 res!452640) b!687813))

(assert (= (and b!687812 (not res!452637)) b!687814))

(declare-fun m!651805 () Bool)

(assert (=> b!687814 m!651805))

(declare-fun m!651807 () Bool)

(assert (=> b!687813 m!651807))

(assert (=> b!687698 d!95095))

(declare-fun d!95103 () Bool)

(assert (=> d!95103 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315503)))

(declare-fun lt!315535 () Unit!24247)

(declare-fun choose!66 (array!39686 (_ BitVec 64) (_ BitVec 32) List!13057 List!13057) Unit!24247)

(assert (=> d!95103 (= lt!315535 (choose!66 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315503))))

(assert (=> d!95103 (bvslt (size!19395 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95103 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315503) lt!315535)))

(declare-fun bs!20169 () Bool)

(assert (= bs!20169 d!95103))

(assert (=> bs!20169 m!651715))

(declare-fun m!651825 () Bool)

(assert (=> bs!20169 m!651825))

(assert (=> b!687698 d!95103))

(declare-fun d!95111 () Bool)

(declare-fun res!452658 () Bool)

(declare-fun e!391776 () Bool)

(assert (=> d!95111 (=> res!452658 e!391776)))

(assert (=> d!95111 (= res!452658 (= (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!95111 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391776)))

(declare-fun b!687836 () Bool)

(declare-fun e!391777 () Bool)

(assert (=> b!687836 (= e!391776 e!391777)))

(declare-fun res!452659 () Bool)

(assert (=> b!687836 (=> (not res!452659) (not e!391777))))

(assert (=> b!687836 (= res!452659 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19395 a!3626)))))

(declare-fun b!687837 () Bool)

(assert (=> b!687837 (= e!391777 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95111 (not res!452658)) b!687836))

(assert (= (and b!687836 res!452659) b!687837))

(assert (=> d!95111 m!651785))

(declare-fun m!651829 () Bool)

(assert (=> b!687837 m!651829))

(assert (=> b!687698 d!95111))

(declare-fun d!95115 () Bool)

(declare-fun res!452664 () Bool)

(declare-fun e!391782 () Bool)

(assert (=> d!95115 (=> res!452664 e!391782)))

(assert (=> d!95115 (= res!452664 (= (select (arr!19016 (array!39687 (store (arr!19016 a!3626) i!1382 k!2843) (size!19395 a!3626))) from!3004) k!2843))))

(assert (=> d!95115 (= (arrayContainsKey!0 (array!39687 (store (arr!19016 a!3626) i!1382 k!2843) (size!19395 a!3626)) k!2843 from!3004) e!391782)))

(declare-fun b!687842 () Bool)

(declare-fun e!391783 () Bool)

(assert (=> b!687842 (= e!391782 e!391783)))

(declare-fun res!452665 () Bool)

(assert (=> b!687842 (=> (not res!452665) (not e!391783))))

(assert (=> b!687842 (= res!452665 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19395 (array!39687 (store (arr!19016 a!3626) i!1382 k!2843) (size!19395 a!3626)))))))

(declare-fun b!687843 () Bool)

(assert (=> b!687843 (= e!391783 (arrayContainsKey!0 (array!39687 (store (arr!19016 a!3626) i!1382 k!2843) (size!19395 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95115 (not res!452664)) b!687842))

(assert (= (and b!687842 res!452665) b!687843))

(declare-fun m!651833 () Bool)

(assert (=> d!95115 m!651833))

(declare-fun m!651837 () Bool)

(assert (=> b!687843 m!651837))

(assert (=> b!687698 d!95115))

(declare-fun d!95119 () Bool)

(assert (=> d!95119 (subseq!220 acc!681 acc!681)))

(declare-fun lt!315541 () Unit!24247)

(declare-fun choose!36 (List!13057) Unit!24247)

(assert (=> d!95119 (= lt!315541 (choose!36 acc!681))))

(assert (=> d!95119 (= (lemmaListSubSeqRefl!0 acc!681) lt!315541)))

(declare-fun bs!20171 () Bool)

(assert (= bs!20171 d!95119))

(assert (=> bs!20171 m!651705))

(declare-fun m!651839 () Bool)

(assert (=> bs!20171 m!651839))

(assert (=> b!687698 d!95119))

(declare-fun d!95121 () Bool)

(assert (=> d!95121 (= (validKeyInArray!0 (select (arr!19016 a!3626) from!3004)) (and (not (= (select (arr!19016 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19016 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687698 d!95121))

(declare-fun d!95123 () Bool)

(assert (=> d!95123 (= (-!185 ($colon$colon!385 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!315549 () Unit!24247)

(declare-fun choose!16 ((_ BitVec 64) List!13057) Unit!24247)

(assert (=> d!95123 (= lt!315549 (choose!16 k!2843 acc!681))))

(assert (=> d!95123 (not (contains!3634 acc!681 k!2843))))

(assert (=> d!95123 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!315549)))

(declare-fun bs!20173 () Bool)

(assert (= bs!20173 d!95123))

(assert (=> bs!20173 m!651719))

(assert (=> bs!20173 m!651719))

(declare-fun m!651845 () Bool)

(assert (=> bs!20173 m!651845))

(declare-fun m!651847 () Bool)

(assert (=> bs!20173 m!651847))

(assert (=> bs!20173 m!651707))

(assert (=> b!687698 d!95123))

(declare-fun bm!34169 () Bool)

(declare-fun call!34172 () List!13057)

(assert (=> bm!34169 (= call!34172 (-!185 (t!19318 lt!315503) k!2843))))

(declare-fun b!687897 () Bool)

(declare-fun e!391828 () List!13057)

(assert (=> b!687897 (= e!391828 (Cons!13053 (h!14098 lt!315503) call!34172))))

(declare-fun b!687898 () Bool)

(declare-fun e!391827 () List!13057)

(assert (=> b!687898 (= e!391827 e!391828)))

(declare-fun c!77968 () Bool)

(assert (=> b!687898 (= c!77968 (= k!2843 (h!14098 lt!315503)))))

(declare-fun b!687899 () Bool)

(assert (=> b!687899 (= e!391828 call!34172)))

(declare-fun d!95127 () Bool)

(declare-fun e!391829 () Bool)

(assert (=> d!95127 e!391829))

(declare-fun res!452695 () Bool)

(assert (=> d!95127 (=> (not res!452695) (not e!391829))))

(declare-fun lt!315553 () List!13057)

(declare-fun size!19398 (List!13057) Int)

(assert (=> d!95127 (= res!452695 (<= (size!19398 lt!315553) (size!19398 lt!315503)))))

(assert (=> d!95127 (= lt!315553 e!391827)))

(declare-fun c!77969 () Bool)

(assert (=> d!95127 (= c!77969 (is-Cons!13053 lt!315503))))

(assert (=> d!95127 (= (-!185 lt!315503 k!2843) lt!315553)))

(declare-fun b!687900 () Bool)

(assert (=> b!687900 (= e!391829 (= (content!300 lt!315553) (setminus (content!300 lt!315503) (insert k!2843 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!687901 () Bool)

(assert (=> b!687901 (= e!391827 Nil!13054)))

(assert (= (and d!95127 c!77969) b!687898))

(assert (= (and d!95127 (not c!77969)) b!687901))

(assert (= (and b!687898 c!77968) b!687899))

(assert (= (and b!687898 (not c!77968)) b!687897))

(assert (= (or b!687899 b!687897) bm!34169))

(assert (= (and d!95127 res!452695) b!687900))

(declare-fun m!651867 () Bool)

(assert (=> bm!34169 m!651867))

(declare-fun m!651869 () Bool)

(assert (=> d!95127 m!651869))

(declare-fun m!651871 () Bool)

(assert (=> d!95127 m!651871))

(declare-fun m!651873 () Bool)

(assert (=> b!687900 m!651873))

(assert (=> b!687900 m!651753))

(declare-fun m!651875 () Bool)

(assert (=> b!687900 m!651875))

(assert (=> b!687698 d!95127))

(declare-fun d!95135 () Bool)

(assert (=> d!95135 (= ($colon$colon!385 acc!681 k!2843) (Cons!13053 k!2843 acc!681))))

(assert (=> b!687698 d!95135))

(declare-fun d!95139 () Bool)

(declare-fun res!452699 () Bool)

(declare-fun e!391832 () Bool)

(assert (=> d!95139 (=> res!452699 e!391832)))

(assert (=> d!95139 (= res!452699 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19395 a!3626)))))

(assert (=> d!95139 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391832)))

(declare-fun b!687904 () Bool)

(declare-fun e!391833 () Bool)

(assert (=> b!687904 (= e!391833 (contains!3634 acc!681 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687905 () Bool)

(declare-fun e!391835 () Bool)

(declare-fun e!391834 () Bool)

(assert (=> b!687905 (= e!391835 e!391834)))

(declare-fun c!77970 () Bool)

(assert (=> b!687905 (= c!77970 (validKeyInArray!0 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34170 () Bool)

(declare-fun call!34173 () Bool)

(assert (=> bm!34170 (= call!34173 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77970 (Cons!13053 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687906 () Bool)

(assert (=> b!687906 (= e!391832 e!391835)))

(declare-fun res!452700 () Bool)

(assert (=> b!687906 (=> (not res!452700) (not e!391835))))

(assert (=> b!687906 (= res!452700 (not e!391833))))

(declare-fun res!452698 () Bool)

(assert (=> b!687906 (=> (not res!452698) (not e!391833))))

(assert (=> b!687906 (= res!452698 (validKeyInArray!0 (select (arr!19016 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687907 () Bool)

(assert (=> b!687907 (= e!391834 call!34173)))

(declare-fun b!687908 () Bool)

(assert (=> b!687908 (= e!391834 call!34173)))

(assert (= (and d!95139 (not res!452699)) b!687906))

(assert (= (and b!687906 res!452698) b!687904))

(assert (= (and b!687906 res!452700) b!687905))

(assert (= (and b!687905 c!77970) b!687908))

(assert (= (and b!687905 (not c!77970)) b!687907))

(assert (= (or b!687908 b!687907) bm!34170))

(assert (=> b!687904 m!651785))

(assert (=> b!687904 m!651785))

(declare-fun m!651881 () Bool)

(assert (=> b!687904 m!651881))

(assert (=> b!687905 m!651785))

(assert (=> b!687905 m!651785))

(assert (=> b!687905 m!651789))

(assert (=> bm!34170 m!651785))

(declare-fun m!651883 () Bool)

(assert (=> bm!34170 m!651883))

(assert (=> b!687906 m!651785))

(assert (=> b!687906 m!651785))

(assert (=> b!687906 m!651789))

(assert (=> b!687698 d!95139))

(assert (=> b!687699 d!95079))

(declare-fun d!95141 () Bool)

(declare-fun res!452702 () Bool)

(declare-fun e!391836 () Bool)

(assert (=> d!95141 (=> res!452702 e!391836)))

(assert (=> d!95141 (= res!452702 (bvsge #b00000000000000000000000000000000 (size!19395 a!3626)))))

(assert (=> d!95141 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13054) e!391836)))

(declare-fun b!687909 () Bool)

(declare-fun e!391837 () Bool)

(assert (=> b!687909 (= e!391837 (contains!3634 Nil!13054 (select (arr!19016 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687910 () Bool)

(declare-fun e!391839 () Bool)

(declare-fun e!391838 () Bool)

(assert (=> b!687910 (= e!391839 e!391838)))

(declare-fun c!77971 () Bool)

(assert (=> b!687910 (= c!77971 (validKeyInArray!0 (select (arr!19016 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34171 () Bool)

(declare-fun call!34174 () Bool)

(assert (=> bm!34171 (= call!34174 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77971 (Cons!13053 (select (arr!19016 a!3626) #b00000000000000000000000000000000) Nil!13054) Nil!13054)))))

(declare-fun b!687911 () Bool)

(assert (=> b!687911 (= e!391836 e!391839)))

(declare-fun res!452703 () Bool)

(assert (=> b!687911 (=> (not res!452703) (not e!391839))))

(assert (=> b!687911 (= res!452703 (not e!391837))))

(declare-fun res!452701 () Bool)

(assert (=> b!687911 (=> (not res!452701) (not e!391837))))

(assert (=> b!687911 (= res!452701 (validKeyInArray!0 (select (arr!19016 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687912 () Bool)

(assert (=> b!687912 (= e!391838 call!34174)))

(declare-fun b!687913 () Bool)

(assert (=> b!687913 (= e!391838 call!34174)))

(assert (= (and d!95141 (not res!452702)) b!687911))

(assert (= (and b!687911 res!452701) b!687909))

(assert (= (and b!687911 res!452703) b!687910))

(assert (= (and b!687910 c!77971) b!687913))

(assert (= (and b!687910 (not c!77971)) b!687912))

(assert (= (or b!687913 b!687912) bm!34171))

(declare-fun m!651885 () Bool)

(assert (=> b!687909 m!651885))

(assert (=> b!687909 m!651885))

(declare-fun m!651887 () Bool)

(assert (=> b!687909 m!651887))

(assert (=> b!687910 m!651885))

(assert (=> b!687910 m!651885))

(declare-fun m!651889 () Bool)

(assert (=> b!687910 m!651889))

(assert (=> bm!34171 m!651885))

(declare-fun m!651891 () Bool)

(assert (=> bm!34171 m!651891))

(assert (=> b!687911 m!651885))

(assert (=> b!687911 m!651885))

(assert (=> b!687911 m!651889))

(assert (=> b!687713 d!95141))

(declare-fun d!95143 () Bool)

(declare-fun res!452708 () Bool)

(declare-fun e!391844 () Bool)

(assert (=> d!95143 (=> res!452708 e!391844)))

(assert (=> d!95143 (= res!452708 (bvsge from!3004 (size!19395 a!3626)))))

(assert (=> d!95143 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391844)))

(declare-fun e!391845 () Bool)

(declare-fun b!687919 () Bool)

(assert (=> b!687919 (= e!391845 (contains!3634 acc!681 (select (arr!19016 a!3626) from!3004)))))

(declare-fun b!687920 () Bool)

(declare-fun e!391847 () Bool)

(declare-fun e!391846 () Bool)

(assert (=> b!687920 (= e!391847 e!391846)))

(declare-fun c!77973 () Bool)

(assert (=> b!687920 (= c!77973 (validKeyInArray!0 (select (arr!19016 a!3626) from!3004)))))

(declare-fun call!34176 () Bool)

(declare-fun bm!34173 () Bool)

(assert (=> bm!34173 (= call!34176 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77973 (Cons!13053 (select (arr!19016 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687921 () Bool)

(assert (=> b!687921 (= e!391844 e!391847)))

(declare-fun res!452709 () Bool)

(assert (=> b!687921 (=> (not res!452709) (not e!391847))))

(assert (=> b!687921 (= res!452709 (not e!391845))))

(declare-fun res!452707 () Bool)

(assert (=> b!687921 (=> (not res!452707) (not e!391845))))

(assert (=> b!687921 (= res!452707 (validKeyInArray!0 (select (arr!19016 a!3626) from!3004)))))

(declare-fun b!687922 () Bool)

(assert (=> b!687922 (= e!391846 call!34176)))

(declare-fun b!687923 () Bool)

(assert (=> b!687923 (= e!391846 call!34176)))

(assert (= (and d!95143 (not res!452708)) b!687921))

(assert (= (and b!687921 res!452707) b!687919))

(assert (= (and b!687921 res!452709) b!687920))

(assert (= (and b!687920 c!77973) b!687923))

(assert (= (and b!687920 (not c!77973)) b!687922))

(assert (= (or b!687923 b!687922) bm!34173))

(assert (=> b!687919 m!651697))

(assert (=> b!687919 m!651697))

(declare-fun m!651901 () Bool)

(assert (=> b!687919 m!651901))

(assert (=> b!687920 m!651697))

(assert (=> b!687920 m!651697))

(assert (=> b!687920 m!651721))

(assert (=> bm!34173 m!651697))

(declare-fun m!651907 () Bool)

(assert (=> bm!34173 m!651907))

(assert (=> b!687921 m!651697))

(assert (=> b!687921 m!651697))

(assert (=> b!687921 m!651721))

(assert (=> b!687702 d!95143))

(declare-fun d!95149 () Bool)

(declare-fun res!452715 () Bool)

(declare-fun e!391854 () Bool)

(assert (=> d!95149 (=> res!452715 e!391854)))

(assert (=> d!95149 (= res!452715 (= (select (arr!19016 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95149 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!391854)))

(declare-fun b!687931 () Bool)

(declare-fun e!391855 () Bool)

(assert (=> b!687931 (= e!391854 e!391855)))

(declare-fun res!452716 () Bool)

(assert (=> b!687931 (=> (not res!452716) (not e!391855))))

(assert (=> b!687931 (= res!452716 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19395 a!3626)))))

(declare-fun b!687932 () Bool)

(assert (=> b!687932 (= e!391855 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95149 (not res!452715)) b!687931))

(assert (= (and b!687931 res!452716) b!687932))

(assert (=> d!95149 m!651885))

(declare-fun m!651911 () Bool)

(assert (=> b!687932 m!651911))

(assert (=> b!687703 d!95149))

(declare-fun d!95153 () Bool)

(assert (=> d!95153 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687701 d!95153))

(declare-fun d!95155 () Bool)

(declare-fun lt!315557 () Bool)

(assert (=> d!95155 (= lt!315557 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!300 lt!315503)))))

(declare-fun e!391857 () Bool)

(assert (=> d!95155 (= lt!315557 e!391857)))

(declare-fun res!452718 () Bool)

(assert (=> d!95155 (=> (not res!452718) (not e!391857))))

(assert (=> d!95155 (= res!452718 (is-Cons!13053 lt!315503))))

(assert (=> d!95155 (= (contains!3634 lt!315503 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315557)))

(declare-fun b!687933 () Bool)

(declare-fun e!391856 () Bool)

(assert (=> b!687933 (= e!391857 e!391856)))

(declare-fun res!452717 () Bool)

(assert (=> b!687933 (=> res!452717 e!391856)))

(assert (=> b!687933 (= res!452717 (= (h!14098 lt!315503) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687934 () Bool)

(assert (=> b!687934 (= e!391856 (contains!3634 (t!19318 lt!315503) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95155 res!452718) b!687933))

(assert (= (and b!687933 (not res!452717)) b!687934))

(assert (=> d!95155 m!651753))

(declare-fun m!651917 () Bool)

(assert (=> d!95155 m!651917))

(declare-fun m!651919 () Bool)

(assert (=> b!687934 m!651919))

(assert (=> b!687712 d!95155))

(declare-fun d!95157 () Bool)

(declare-fun lt!315558 () Bool)

(assert (=> d!95157 (= lt!315558 (member k!2843 (content!300 acc!681)))))

(declare-fun e!391859 () Bool)

(assert (=> d!95157 (= lt!315558 e!391859)))

(declare-fun res!452720 () Bool)

(assert (=> d!95157 (=> (not res!452720) (not e!391859))))

(assert (=> d!95157 (= res!452720 (is-Cons!13053 acc!681))))

(assert (=> d!95157 (= (contains!3634 acc!681 k!2843) lt!315558)))

(declare-fun b!687935 () Bool)

(declare-fun e!391858 () Bool)

(assert (=> b!687935 (= e!391859 e!391858)))

(declare-fun res!452719 () Bool)

(assert (=> b!687935 (=> res!452719 e!391858)))

(assert (=> b!687935 (= res!452719 (= (h!14098 acc!681) k!2843))))

(declare-fun b!687936 () Bool)

(assert (=> b!687936 (= e!391858 (contains!3634 (t!19318 acc!681) k!2843))))

(assert (= (and d!95157 res!452720) b!687935))

(assert (= (and b!687935 (not res!452719)) b!687936))

(assert (=> d!95157 m!651747))

(declare-fun m!651923 () Bool)

(assert (=> d!95157 m!651923))

(declare-fun m!651925 () Bool)

(assert (=> b!687936 m!651925))

(assert (=> b!687705 d!95157))

(declare-fun d!95161 () Bool)

(declare-fun res!452723 () Bool)

(declare-fun e!391862 () Bool)

(assert (=> d!95161 (=> res!452723 e!391862)))

(assert (=> d!95161 (= res!452723 (is-Nil!13054 lt!315503))))

(assert (=> d!95161 (= (noDuplicate!881 lt!315503) e!391862)))

(declare-fun b!687939 () Bool)

(declare-fun e!391863 () Bool)

(assert (=> b!687939 (= e!391862 e!391863)))

(declare-fun res!452724 () Bool)

(assert (=> b!687939 (=> (not res!452724) (not e!391863))))

(assert (=> b!687939 (= res!452724 (not (contains!3634 (t!19318 lt!315503) (h!14098 lt!315503))))))

(declare-fun b!687940 () Bool)

(assert (=> b!687940 (= e!391863 (noDuplicate!881 (t!19318 lt!315503)))))

(assert (= (and d!95161 (not res!452723)) b!687939))

(assert (= (and b!687939 res!452724) b!687940))

(declare-fun m!651931 () Bool)

(assert (=> b!687939 m!651931))

(declare-fun m!651933 () Bool)

(assert (=> b!687940 m!651933))

(assert (=> b!687695 d!95161))

(declare-fun d!95165 () Bool)

(declare-fun lt!315562 () Bool)

(assert (=> d!95165 (= lt!315562 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!300 acc!681)))))

(declare-fun e!391865 () Bool)

(assert (=> d!95165 (= lt!315562 e!391865)))

(declare-fun res!452726 () Bool)

(assert (=> d!95165 (=> (not res!452726) (not e!391865))))

(assert (=> d!95165 (= res!452726 (is-Cons!13053 acc!681))))

(assert (=> d!95165 (= (contains!3634 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315562)))

(declare-fun b!687941 () Bool)

(declare-fun e!391864 () Bool)

(assert (=> b!687941 (= e!391865 e!391864)))

(declare-fun res!452725 () Bool)

(assert (=> b!687941 (=> res!452725 e!391864)))

(assert (=> b!687941 (= res!452725 (= (h!14098 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687942 () Bool)

(assert (=> b!687942 (= e!391864 (contains!3634 (t!19318 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95165 res!452726) b!687941))

(assert (= (and b!687941 (not res!452725)) b!687942))

(assert (=> d!95165 m!651747))

(declare-fun m!651937 () Bool)

(assert (=> d!95165 m!651937))

(declare-fun m!651939 () Bool)

(assert (=> b!687942 m!651939))

(assert (=> b!687714 d!95165))

(assert (=> b!687704 d!95157))

(declare-fun d!95169 () Bool)

(assert (=> d!95169 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315568 () Unit!24247)

(declare-fun choose!13 (array!39686 (_ BitVec 64) (_ BitVec 32)) Unit!24247)

(assert (=> d!95169 (= lt!315568 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95169 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95169 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!315568)))

(declare-fun bs!20177 () Bool)

(assert (= bs!20177 d!95169))

(assert (=> bs!20177 m!651729))

(declare-fun m!651945 () Bool)

(assert (=> bs!20177 m!651945))

(assert (=> b!687697 d!95169))

(declare-fun d!95179 () Bool)

(assert (=> d!95179 (= ($colon$colon!385 acc!681 (select (arr!19016 a!3626) from!3004)) (Cons!13053 (select (arr!19016 a!3626) from!3004) acc!681))))

(assert (=> b!687708 d!95179))

(assert (=> b!687708 d!95095))

(declare-fun d!95185 () Bool)

(assert (=> d!95185 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315573 () Unit!24247)

(declare-fun choose!80 (array!39686 List!13057 List!13057 (_ BitVec 32)) Unit!24247)

(assert (=> d!95185 (= lt!315573 (choose!80 a!3626 ($colon$colon!385 acc!681 (select (arr!19016 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95185 (bvslt (size!19395 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95185 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!385 acc!681 (select (arr!19016 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315573)))

(declare-fun bs!20178 () Bool)

(assert (= bs!20178 d!95185))

(assert (=> bs!20178 m!651695))

(assert (=> bs!20178 m!651699))

(declare-fun m!651977 () Bool)

(assert (=> bs!20178 m!651977))

(assert (=> b!687708 d!95185))

(assert (=> b!687708 d!95119))

(assert (=> b!687708 d!95139))

(declare-fun d!95203 () Bool)

(declare-fun lt!315575 () Bool)

(assert (=> d!95203 (= lt!315575 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!300 lt!315503)))))

(declare-fun e!391891 () Bool)

(assert (=> d!95203 (= lt!315575 e!391891)))

(declare-fun res!452748 () Bool)

(assert (=> d!95203 (=> (not res!452748) (not e!391891))))

(assert (=> d!95203 (= res!452748 (is-Cons!13053 lt!315503))))

(assert (=> d!95203 (= (contains!3634 lt!315503 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315575)))

(declare-fun b!687971 () Bool)

(declare-fun e!391890 () Bool)

(assert (=> b!687971 (= e!391891 e!391890)))

(declare-fun res!452747 () Bool)

(assert (=> b!687971 (=> res!452747 e!391890)))

(assert (=> b!687971 (= res!452747 (= (h!14098 lt!315503) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687972 () Bool)

(assert (=> b!687972 (= e!391890 (contains!3634 (t!19318 lt!315503) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95203 res!452748) b!687971))

(assert (= (and b!687971 (not res!452747)) b!687972))

(assert (=> d!95203 m!651753))

(declare-fun m!651983 () Bool)

(assert (=> d!95203 m!651983))

(declare-fun m!651985 () Bool)

(assert (=> b!687972 m!651985))

(assert (=> b!687717 d!95203))

(push 1)

