; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60570 () Bool)

(assert start!60570)

(declare-fun b!680567 () Bool)

(declare-fun res!446722 () Bool)

(declare-fun e!387644 () Bool)

(assert (=> b!680567 (=> (not res!446722) (not e!387644))))

(declare-datatypes ((List!12879 0))(
  ( (Nil!12876) (Cons!12875 (h!13923 (_ BitVec 64)) (t!19099 List!12879)) )
))
(declare-fun acc!681 () List!12879)

(declare-fun contains!3531 (List!12879 (_ BitVec 64)) Bool)

(assert (=> b!680567 (= res!446722 (not (contains!3531 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680568 () Bool)

(declare-fun res!446730 () Bool)

(assert (=> b!680568 (=> (not res!446730) (not e!387644))))

(assert (=> b!680568 (= res!446730 (not (contains!3531 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680569 () Bool)

(declare-fun res!446733 () Bool)

(assert (=> b!680569 (=> (not res!446733) (not e!387644))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39489 0))(
  ( (array!39490 (arr!18931 (Array (_ BitVec 32) (_ BitVec 64))) (size!19295 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39489)

(assert (=> b!680569 (= res!446733 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19295 a!3626))))))

(declare-fun b!680570 () Bool)

(declare-fun res!446728 () Bool)

(assert (=> b!680570 (=> (not res!446728) (not e!387644))))

(declare-fun arrayNoDuplicates!0 (array!39489 (_ BitVec 32) List!12879) Bool)

(assert (=> b!680570 (= res!446728 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12876))))

(declare-fun b!680571 () Bool)

(declare-fun res!446726 () Bool)

(assert (=> b!680571 (=> (not res!446726) (not e!387644))))

(declare-fun e!387639 () Bool)

(assert (=> b!680571 (= res!446726 e!387639)))

(declare-fun res!446732 () Bool)

(assert (=> b!680571 (=> res!446732 e!387639)))

(declare-fun e!387641 () Bool)

(assert (=> b!680571 (= res!446732 e!387641)))

(declare-fun res!446725 () Bool)

(assert (=> b!680571 (=> (not res!446725) (not e!387641))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!680571 (= res!446725 (bvsgt from!3004 i!1382))))

(declare-fun b!680572 () Bool)

(declare-fun res!446731 () Bool)

(assert (=> b!680572 (=> (not res!446731) (not e!387644))))

(declare-fun noDuplicate!805 (List!12879) Bool)

(assert (=> b!680572 (= res!446731 (noDuplicate!805 acc!681))))

(declare-fun b!680573 () Bool)

(declare-fun res!446734 () Bool)

(assert (=> b!680573 (=> (not res!446734) (not e!387644))))

(assert (=> b!680573 (= res!446734 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19295 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!446727 () Bool)

(assert (=> start!60570 (=> (not res!446727) (not e!387644))))

(assert (=> start!60570 (= res!446727 (and (bvslt (size!19295 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19295 a!3626))))))

(assert (=> start!60570 e!387644))

(assert (=> start!60570 true))

(declare-fun array_inv!14790 (array!39489) Bool)

(assert (=> start!60570 (array_inv!14790 a!3626)))

(declare-fun b!680574 () Bool)

(declare-datatypes ((Unit!23841 0))(
  ( (Unit!23842) )
))
(declare-fun e!387643 () Unit!23841)

(declare-fun Unit!23843 () Unit!23841)

(assert (=> b!680574 (= e!387643 Unit!23843)))

(declare-fun lt!313171 () Unit!23841)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39489 (_ BitVec 64) (_ BitVec 32)) Unit!23841)

(assert (=> b!680574 (= lt!313171 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680574 false))

(declare-fun b!680575 () Bool)

(declare-fun res!446736 () Bool)

(assert (=> b!680575 (=> (not res!446736) (not e!387644))))

(assert (=> b!680575 (= res!446736 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680576 () Bool)

(declare-fun e!387645 () Bool)

(assert (=> b!680576 (= e!387644 (not e!387645))))

(declare-fun res!446724 () Bool)

(assert (=> b!680576 (=> res!446724 e!387645)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680576 (= res!446724 (not (validKeyInArray!0 (select (arr!18931 a!3626) from!3004))))))

(declare-fun lt!313170 () Unit!23841)

(assert (=> b!680576 (= lt!313170 e!387643)))

(declare-fun c!77291 () Bool)

(declare-fun arrayContainsKey!0 (array!39489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680576 (= c!77291 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680576 (arrayContainsKey!0 (array!39490 (store (arr!18931 a!3626) i!1382 k0!2843) (size!19295 a!3626)) k0!2843 from!3004)))

(declare-fun b!680577 () Bool)

(declare-fun e!387642 () Bool)

(assert (=> b!680577 (= e!387642 (not (contains!3531 acc!681 k0!2843)))))

(declare-fun b!680578 () Bool)

(declare-fun e!387640 () Bool)

(assert (=> b!680578 (= e!387645 e!387640)))

(declare-fun res!446735 () Bool)

(assert (=> b!680578 (=> res!446735 e!387640)))

(assert (=> b!680578 (= res!446735 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!140 (List!12879 List!12879) Bool)

(assert (=> b!680578 (subseq!140 acc!681 acc!681)))

(declare-fun lt!313169 () Unit!23841)

(declare-fun lemmaListSubSeqRefl!0 (List!12879) Unit!23841)

(assert (=> b!680578 (= lt!313169 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680579 () Bool)

(declare-fun $colon$colon!302 (List!12879 (_ BitVec 64)) List!12879)

(assert (=> b!680579 (= e!387640 (noDuplicate!805 ($colon$colon!302 acc!681 (select (arr!18931 a!3626) from!3004))))))

(declare-fun b!680580 () Bool)

(declare-fun res!446723 () Bool)

(assert (=> b!680580 (=> (not res!446723) (not e!387644))))

(assert (=> b!680580 (= res!446723 (validKeyInArray!0 k0!2843))))

(declare-fun b!680581 () Bool)

(assert (=> b!680581 (= e!387641 (contains!3531 acc!681 k0!2843))))

(declare-fun b!680582 () Bool)

(declare-fun Unit!23844 () Unit!23841)

(assert (=> b!680582 (= e!387643 Unit!23844)))

(declare-fun b!680583 () Bool)

(declare-fun res!446737 () Bool)

(assert (=> b!680583 (=> (not res!446737) (not e!387644))))

(assert (=> b!680583 (= res!446737 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680584 () Bool)

(assert (=> b!680584 (= e!387639 e!387642)))

(declare-fun res!446729 () Bool)

(assert (=> b!680584 (=> (not res!446729) (not e!387642))))

(assert (=> b!680584 (= res!446729 (bvsle from!3004 i!1382))))

(assert (= (and start!60570 res!446727) b!680572))

(assert (= (and b!680572 res!446731) b!680567))

(assert (= (and b!680567 res!446722) b!680568))

(assert (= (and b!680568 res!446730) b!680571))

(assert (= (and b!680571 res!446725) b!680581))

(assert (= (and b!680571 (not res!446732)) b!680584))

(assert (= (and b!680584 res!446729) b!680577))

(assert (= (and b!680571 res!446726) b!680570))

(assert (= (and b!680570 res!446728) b!680575))

(assert (= (and b!680575 res!446736) b!680569))

(assert (= (and b!680569 res!446733) b!680580))

(assert (= (and b!680580 res!446723) b!680583))

(assert (= (and b!680583 res!446737) b!680573))

(assert (= (and b!680573 res!446734) b!680576))

(assert (= (and b!680576 c!77291) b!680574))

(assert (= (and b!680576 (not c!77291)) b!680582))

(assert (= (and b!680576 (not res!446724)) b!680578))

(assert (= (and b!680578 (not res!446735)) b!680579))

(declare-fun m!646123 () Bool)

(assert (=> b!680581 m!646123))

(declare-fun m!646125 () Bool)

(assert (=> b!680570 m!646125))

(declare-fun m!646127 () Bool)

(assert (=> b!680579 m!646127))

(assert (=> b!680579 m!646127))

(declare-fun m!646129 () Bool)

(assert (=> b!680579 m!646129))

(assert (=> b!680579 m!646129))

(declare-fun m!646131 () Bool)

(assert (=> b!680579 m!646131))

(declare-fun m!646133 () Bool)

(assert (=> b!680578 m!646133))

(declare-fun m!646135 () Bool)

(assert (=> b!680578 m!646135))

(declare-fun m!646137 () Bool)

(assert (=> b!680574 m!646137))

(assert (=> b!680577 m!646123))

(declare-fun m!646139 () Bool)

(assert (=> b!680568 m!646139))

(declare-fun m!646141 () Bool)

(assert (=> b!680575 m!646141))

(declare-fun m!646143 () Bool)

(assert (=> b!680580 m!646143))

(declare-fun m!646145 () Bool)

(assert (=> b!680572 m!646145))

(declare-fun m!646147 () Bool)

(assert (=> start!60570 m!646147))

(declare-fun m!646149 () Bool)

(assert (=> b!680583 m!646149))

(assert (=> b!680576 m!646127))

(declare-fun m!646151 () Bool)

(assert (=> b!680576 m!646151))

(declare-fun m!646153 () Bool)

(assert (=> b!680576 m!646153))

(assert (=> b!680576 m!646127))

(declare-fun m!646155 () Bool)

(assert (=> b!680576 m!646155))

(declare-fun m!646157 () Bool)

(assert (=> b!680576 m!646157))

(declare-fun m!646159 () Bool)

(assert (=> b!680567 m!646159))

(check-sat (not b!680579) (not b!680567) (not b!680576) (not b!680570) (not b!680578) (not b!680581) (not b!680572) (not start!60570) (not b!680583) (not b!680575) (not b!680577) (not b!680574) (not b!680580) (not b!680568))
(check-sat)
(get-model)

(declare-fun b!680704 () Bool)

(declare-fun e!387703 () Bool)

(assert (=> b!680704 (= e!387703 (subseq!140 acc!681 (t!19099 acc!681)))))

(declare-fun b!680701 () Bool)

(declare-fun e!387705 () Bool)

(declare-fun e!387702 () Bool)

(assert (=> b!680701 (= e!387705 e!387702)))

(declare-fun res!446844 () Bool)

(assert (=> b!680701 (=> (not res!446844) (not e!387702))))

(get-info :version)

(assert (=> b!680701 (= res!446844 ((_ is Cons!12875) acc!681))))

(declare-fun d!93695 () Bool)

(declare-fun res!446843 () Bool)

(assert (=> d!93695 (=> res!446843 e!387705)))

(assert (=> d!93695 (= res!446843 ((_ is Nil!12876) acc!681))))

(assert (=> d!93695 (= (subseq!140 acc!681 acc!681) e!387705)))

(declare-fun b!680703 () Bool)

(declare-fun e!387704 () Bool)

(assert (=> b!680703 (= e!387704 (subseq!140 (t!19099 acc!681) (t!19099 acc!681)))))

(declare-fun b!680702 () Bool)

(assert (=> b!680702 (= e!387702 e!387703)))

(declare-fun res!446845 () Bool)

(assert (=> b!680702 (=> res!446845 e!387703)))

(assert (=> b!680702 (= res!446845 e!387704)))

(declare-fun res!446842 () Bool)

(assert (=> b!680702 (=> (not res!446842) (not e!387704))))

(assert (=> b!680702 (= res!446842 (= (h!13923 acc!681) (h!13923 acc!681)))))

(assert (= (and d!93695 (not res!446843)) b!680701))

(assert (= (and b!680701 res!446844) b!680702))

(assert (= (and b!680702 res!446842) b!680703))

(assert (= (and b!680702 (not res!446845)) b!680704))

(declare-fun m!646237 () Bool)

(assert (=> b!680704 m!646237))

(declare-fun m!646239 () Bool)

(assert (=> b!680703 m!646239))

(assert (=> b!680578 d!93695))

(declare-fun d!93701 () Bool)

(assert (=> d!93701 (subseq!140 acc!681 acc!681)))

(declare-fun lt!313192 () Unit!23841)

(declare-fun choose!36 (List!12879) Unit!23841)

(assert (=> d!93701 (= lt!313192 (choose!36 acc!681))))

(assert (=> d!93701 (= (lemmaListSubSeqRefl!0 acc!681) lt!313192)))

(declare-fun bs!19997 () Bool)

(assert (= bs!19997 d!93701))

(assert (=> bs!19997 m!646133))

(declare-fun m!646241 () Bool)

(assert (=> bs!19997 m!646241))

(assert (=> b!680578 d!93701))

(declare-fun d!93705 () Bool)

(declare-fun lt!313201 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!269 (List!12879) (InoxSet (_ BitVec 64)))

(assert (=> d!93705 (= lt!313201 (select (content!269 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387722 () Bool)

(assert (=> d!93705 (= lt!313201 e!387722)))

(declare-fun res!446862 () Bool)

(assert (=> d!93705 (=> (not res!446862) (not e!387722))))

(assert (=> d!93705 (= res!446862 ((_ is Cons!12875) acc!681))))

(assert (=> d!93705 (= (contains!3531 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313201)))

(declare-fun b!680721 () Bool)

(declare-fun e!387723 () Bool)

(assert (=> b!680721 (= e!387722 e!387723)))

(declare-fun res!446863 () Bool)

(assert (=> b!680721 (=> res!446863 e!387723)))

(assert (=> b!680721 (= res!446863 (= (h!13923 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680722 () Bool)

(assert (=> b!680722 (= e!387723 (contains!3531 (t!19099 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93705 res!446862) b!680721))

(assert (= (and b!680721 (not res!446863)) b!680722))

(declare-fun m!646255 () Bool)

(assert (=> d!93705 m!646255))

(declare-fun m!646257 () Bool)

(assert (=> d!93705 m!646257))

(declare-fun m!646259 () Bool)

(assert (=> b!680722 m!646259))

(assert (=> b!680567 d!93705))

(declare-fun d!93713 () Bool)

(declare-fun lt!313202 () Bool)

(assert (=> d!93713 (= lt!313202 (select (content!269 acc!681) k0!2843))))

(declare-fun e!387724 () Bool)

(assert (=> d!93713 (= lt!313202 e!387724)))

(declare-fun res!446864 () Bool)

(assert (=> d!93713 (=> (not res!446864) (not e!387724))))

(assert (=> d!93713 (= res!446864 ((_ is Cons!12875) acc!681))))

(assert (=> d!93713 (= (contains!3531 acc!681 k0!2843) lt!313202)))

(declare-fun b!680723 () Bool)

(declare-fun e!387725 () Bool)

(assert (=> b!680723 (= e!387724 e!387725)))

(declare-fun res!446865 () Bool)

(assert (=> b!680723 (=> res!446865 e!387725)))

(assert (=> b!680723 (= res!446865 (= (h!13923 acc!681) k0!2843))))

(declare-fun b!680724 () Bool)

(assert (=> b!680724 (= e!387725 (contains!3531 (t!19099 acc!681) k0!2843))))

(assert (= (and d!93713 res!446864) b!680723))

(assert (= (and b!680723 (not res!446865)) b!680724))

(assert (=> d!93713 m!646255))

(declare-fun m!646261 () Bool)

(assert (=> d!93713 m!646261))

(declare-fun m!646263 () Bool)

(assert (=> b!680724 m!646263))

(assert (=> b!680577 d!93713))

(declare-fun d!93715 () Bool)

(assert (=> d!93715 (= (validKeyInArray!0 (select (arr!18931 a!3626) from!3004)) (and (not (= (select (arr!18931 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18931 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680576 d!93715))

(declare-fun d!93717 () Bool)

(declare-fun res!446884 () Bool)

(declare-fun e!387746 () Bool)

(assert (=> d!93717 (=> res!446884 e!387746)))

(assert (=> d!93717 (= res!446884 (= (select (arr!18931 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93717 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387746)))

(declare-fun b!680747 () Bool)

(declare-fun e!387747 () Bool)

(assert (=> b!680747 (= e!387746 e!387747)))

(declare-fun res!446885 () Bool)

(assert (=> b!680747 (=> (not res!446885) (not e!387747))))

(assert (=> b!680747 (= res!446885 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19295 a!3626)))))

(declare-fun b!680748 () Bool)

(assert (=> b!680748 (= e!387747 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93717 (not res!446884)) b!680747))

(assert (= (and b!680747 res!446885) b!680748))

(declare-fun m!646273 () Bool)

(assert (=> d!93717 m!646273))

(declare-fun m!646275 () Bool)

(assert (=> b!680748 m!646275))

(assert (=> b!680576 d!93717))

(declare-fun d!93723 () Bool)

(declare-fun res!446886 () Bool)

(declare-fun e!387748 () Bool)

(assert (=> d!93723 (=> res!446886 e!387748)))

(assert (=> d!93723 (= res!446886 (= (select (arr!18931 (array!39490 (store (arr!18931 a!3626) i!1382 k0!2843) (size!19295 a!3626))) from!3004) k0!2843))))

(assert (=> d!93723 (= (arrayContainsKey!0 (array!39490 (store (arr!18931 a!3626) i!1382 k0!2843) (size!19295 a!3626)) k0!2843 from!3004) e!387748)))

(declare-fun b!680749 () Bool)

(declare-fun e!387749 () Bool)

(assert (=> b!680749 (= e!387748 e!387749)))

(declare-fun res!446887 () Bool)

(assert (=> b!680749 (=> (not res!446887) (not e!387749))))

(assert (=> b!680749 (= res!446887 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19295 (array!39490 (store (arr!18931 a!3626) i!1382 k0!2843) (size!19295 a!3626)))))))

(declare-fun b!680750 () Bool)

(assert (=> b!680750 (= e!387749 (arrayContainsKey!0 (array!39490 (store (arr!18931 a!3626) i!1382 k0!2843) (size!19295 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93723 (not res!446886)) b!680749))

(assert (= (and b!680749 res!446887) b!680750))

(declare-fun m!646277 () Bool)

(assert (=> d!93723 m!646277))

(declare-fun m!646279 () Bool)

(assert (=> b!680750 m!646279))

(assert (=> b!680576 d!93723))

(declare-fun b!680793 () Bool)

(declare-fun e!387787 () Bool)

(assert (=> b!680793 (= e!387787 (contains!3531 Nil!12876 (select (arr!18931 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680794 () Bool)

(declare-fun e!387788 () Bool)

(declare-fun e!387786 () Bool)

(assert (=> b!680794 (= e!387788 e!387786)))

(declare-fun res!446920 () Bool)

(assert (=> b!680794 (=> (not res!446920) (not e!387786))))

(assert (=> b!680794 (= res!446920 (not e!387787))))

(declare-fun res!446919 () Bool)

(assert (=> b!680794 (=> (not res!446919) (not e!387787))))

(assert (=> b!680794 (= res!446919 (validKeyInArray!0 (select (arr!18931 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680795 () Bool)

(declare-fun e!387789 () Bool)

(declare-fun call!33954 () Bool)

(assert (=> b!680795 (= e!387789 call!33954)))

(declare-fun d!93725 () Bool)

(declare-fun res!446918 () Bool)

(assert (=> d!93725 (=> res!446918 e!387788)))

(assert (=> d!93725 (= res!446918 (bvsge #b00000000000000000000000000000000 (size!19295 a!3626)))))

(assert (=> d!93725 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12876) e!387788)))

(declare-fun b!680796 () Bool)

(assert (=> b!680796 (= e!387789 call!33954)))

(declare-fun b!680797 () Bool)

(assert (=> b!680797 (= e!387786 e!387789)))

(declare-fun c!77306 () Bool)

(assert (=> b!680797 (= c!77306 (validKeyInArray!0 (select (arr!18931 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33951 () Bool)

(assert (=> bm!33951 (= call!33954 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77306 (Cons!12875 (select (arr!18931 a!3626) #b00000000000000000000000000000000) Nil!12876) Nil!12876)))))

(assert (= (and d!93725 (not res!446918)) b!680794))

(assert (= (and b!680794 res!446919) b!680793))

(assert (= (and b!680794 res!446920) b!680797))

(assert (= (and b!680797 c!77306) b!680796))

(assert (= (and b!680797 (not c!77306)) b!680795))

(assert (= (or b!680796 b!680795) bm!33951))

(declare-fun m!646297 () Bool)

(assert (=> b!680793 m!646297))

(assert (=> b!680793 m!646297))

(declare-fun m!646299 () Bool)

(assert (=> b!680793 m!646299))

(assert (=> b!680794 m!646297))

(assert (=> b!680794 m!646297))

(declare-fun m!646301 () Bool)

(assert (=> b!680794 m!646301))

(assert (=> b!680797 m!646297))

(assert (=> b!680797 m!646297))

(assert (=> b!680797 m!646301))

(assert (=> bm!33951 m!646297))

(declare-fun m!646303 () Bool)

(assert (=> bm!33951 m!646303))

(assert (=> b!680570 d!93725))

(assert (=> b!680581 d!93713))

(declare-fun d!93737 () Bool)

(assert (=> d!93737 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680580 d!93737))

(declare-fun d!93739 () Bool)

(declare-fun lt!313203 () Bool)

(assert (=> d!93739 (= lt!313203 (select (content!269 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387792 () Bool)

(assert (=> d!93739 (= lt!313203 e!387792)))

(declare-fun res!446923 () Bool)

(assert (=> d!93739 (=> (not res!446923) (not e!387792))))

(assert (=> d!93739 (= res!446923 ((_ is Cons!12875) acc!681))))

(assert (=> d!93739 (= (contains!3531 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313203)))

(declare-fun b!680800 () Bool)

(declare-fun e!387793 () Bool)

(assert (=> b!680800 (= e!387792 e!387793)))

(declare-fun res!446924 () Bool)

(assert (=> b!680800 (=> res!446924 e!387793)))

(assert (=> b!680800 (= res!446924 (= (h!13923 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680801 () Bool)

(assert (=> b!680801 (= e!387793 (contains!3531 (t!19099 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93739 res!446923) b!680800))

(assert (= (and b!680800 (not res!446924)) b!680801))

(assert (=> d!93739 m!646255))

(declare-fun m!646309 () Bool)

(assert (=> d!93739 m!646309))

(declare-fun m!646311 () Bool)

(assert (=> b!680801 m!646311))

(assert (=> b!680568 d!93739))

(declare-fun d!93745 () Bool)

(declare-fun res!446937 () Bool)

(declare-fun e!387808 () Bool)

(assert (=> d!93745 (=> res!446937 e!387808)))

(assert (=> d!93745 (= res!446937 ((_ is Nil!12876) ($colon$colon!302 acc!681 (select (arr!18931 a!3626) from!3004))))))

(assert (=> d!93745 (= (noDuplicate!805 ($colon$colon!302 acc!681 (select (arr!18931 a!3626) from!3004))) e!387808)))

(declare-fun b!680818 () Bool)

(declare-fun e!387809 () Bool)

(assert (=> b!680818 (= e!387808 e!387809)))

(declare-fun res!446938 () Bool)

(assert (=> b!680818 (=> (not res!446938) (not e!387809))))

(assert (=> b!680818 (= res!446938 (not (contains!3531 (t!19099 ($colon$colon!302 acc!681 (select (arr!18931 a!3626) from!3004))) (h!13923 ($colon$colon!302 acc!681 (select (arr!18931 a!3626) from!3004))))))))

(declare-fun b!680819 () Bool)

(assert (=> b!680819 (= e!387809 (noDuplicate!805 (t!19099 ($colon$colon!302 acc!681 (select (arr!18931 a!3626) from!3004)))))))

(assert (= (and d!93745 (not res!446937)) b!680818))

(assert (= (and b!680818 res!446938) b!680819))

(declare-fun m!646335 () Bool)

(assert (=> b!680818 m!646335))

(declare-fun m!646337 () Bool)

(assert (=> b!680819 m!646337))

(assert (=> b!680579 d!93745))

(declare-fun d!93755 () Bool)

(assert (=> d!93755 (= ($colon$colon!302 acc!681 (select (arr!18931 a!3626) from!3004)) (Cons!12875 (select (arr!18931 a!3626) from!3004) acc!681))))

(assert (=> b!680579 d!93755))

(declare-fun d!93757 () Bool)

(declare-fun res!446943 () Bool)

(declare-fun e!387814 () Bool)

(assert (=> d!93757 (=> res!446943 e!387814)))

(assert (=> d!93757 (= res!446943 ((_ is Nil!12876) acc!681))))

(assert (=> d!93757 (= (noDuplicate!805 acc!681) e!387814)))

(declare-fun b!680824 () Bool)

(declare-fun e!387815 () Bool)

(assert (=> b!680824 (= e!387814 e!387815)))

(declare-fun res!446944 () Bool)

(assert (=> b!680824 (=> (not res!446944) (not e!387815))))

(assert (=> b!680824 (= res!446944 (not (contains!3531 (t!19099 acc!681) (h!13923 acc!681))))))

(declare-fun b!680825 () Bool)

(assert (=> b!680825 (= e!387815 (noDuplicate!805 (t!19099 acc!681)))))

(assert (= (and d!93757 (not res!446943)) b!680824))

(assert (= (and b!680824 res!446944) b!680825))

(declare-fun m!646341 () Bool)

(assert (=> b!680824 m!646341))

(declare-fun m!646343 () Bool)

(assert (=> b!680825 m!646343))

(assert (=> b!680572 d!93757))

(declare-fun d!93761 () Bool)

(declare-fun res!446945 () Bool)

(declare-fun e!387816 () Bool)

(assert (=> d!93761 (=> res!446945 e!387816)))

(assert (=> d!93761 (= res!446945 (= (select (arr!18931 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93761 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!387816)))

(declare-fun b!680826 () Bool)

(declare-fun e!387817 () Bool)

(assert (=> b!680826 (= e!387816 e!387817)))

(declare-fun res!446946 () Bool)

(assert (=> b!680826 (=> (not res!446946) (not e!387817))))

(assert (=> b!680826 (= res!446946 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19295 a!3626)))))

(declare-fun b!680827 () Bool)

(assert (=> b!680827 (= e!387817 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93761 (not res!446945)) b!680826))

(assert (= (and b!680826 res!446946) b!680827))

(assert (=> d!93761 m!646297))

(declare-fun m!646345 () Bool)

(assert (=> b!680827 m!646345))

(assert (=> b!680583 d!93761))

(declare-fun e!387821 () Bool)

(declare-fun b!680830 () Bool)

(assert (=> b!680830 (= e!387821 (contains!3531 acc!681 (select (arr!18931 a!3626) from!3004)))))

(declare-fun b!680831 () Bool)

(declare-fun e!387822 () Bool)

(declare-fun e!387820 () Bool)

(assert (=> b!680831 (= e!387822 e!387820)))

(declare-fun res!446951 () Bool)

(assert (=> b!680831 (=> (not res!446951) (not e!387820))))

(assert (=> b!680831 (= res!446951 (not e!387821))))

(declare-fun res!446950 () Bool)

(assert (=> b!680831 (=> (not res!446950) (not e!387821))))

(assert (=> b!680831 (= res!446950 (validKeyInArray!0 (select (arr!18931 a!3626) from!3004)))))

(declare-fun b!680832 () Bool)

(declare-fun e!387823 () Bool)

(declare-fun call!33957 () Bool)

(assert (=> b!680832 (= e!387823 call!33957)))

(declare-fun d!93763 () Bool)

(declare-fun res!446949 () Bool)

(assert (=> d!93763 (=> res!446949 e!387822)))

(assert (=> d!93763 (= res!446949 (bvsge from!3004 (size!19295 a!3626)))))

(assert (=> d!93763 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387822)))

(declare-fun b!680833 () Bool)

(assert (=> b!680833 (= e!387823 call!33957)))

(declare-fun b!680834 () Bool)

(assert (=> b!680834 (= e!387820 e!387823)))

(declare-fun c!77309 () Bool)

(assert (=> b!680834 (= c!77309 (validKeyInArray!0 (select (arr!18931 a!3626) from!3004)))))

(declare-fun bm!33954 () Bool)

(assert (=> bm!33954 (= call!33957 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77309 (Cons!12875 (select (arr!18931 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!93763 (not res!446949)) b!680831))

(assert (= (and b!680831 res!446950) b!680830))

(assert (= (and b!680831 res!446951) b!680834))

(assert (= (and b!680834 c!77309) b!680833))

(assert (= (and b!680834 (not c!77309)) b!680832))

(assert (= (or b!680833 b!680832) bm!33954))

(assert (=> b!680830 m!646127))

(assert (=> b!680830 m!646127))

(declare-fun m!646351 () Bool)

(assert (=> b!680830 m!646351))

(assert (=> b!680831 m!646127))

(assert (=> b!680831 m!646127))

(assert (=> b!680831 m!646155))

(assert (=> b!680834 m!646127))

(assert (=> b!680834 m!646127))

(assert (=> b!680834 m!646155))

(assert (=> bm!33954 m!646127))

(declare-fun m!646353 () Bool)

(assert (=> bm!33954 m!646353))

(assert (=> b!680575 d!93763))

(declare-fun d!93767 () Bool)

(assert (=> d!93767 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313213 () Unit!23841)

(declare-fun choose!13 (array!39489 (_ BitVec 64) (_ BitVec 32)) Unit!23841)

(assert (=> d!93767 (= lt!313213 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93767 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93767 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313213)))

(declare-fun bs!20000 () Bool)

(assert (= bs!20000 d!93767))

(assert (=> bs!20000 m!646149))

(declare-fun m!646355 () Bool)

(assert (=> bs!20000 m!646355))

(assert (=> b!680574 d!93767))

(declare-fun d!93769 () Bool)

(assert (=> d!93769 (= (array_inv!14790 a!3626) (bvsge (size!19295 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60570 d!93769))

(check-sat (not b!680722) (not b!680825) (not bm!33954) (not b!680819) (not b!680827) (not d!93767) (not b!680703) (not bm!33951) (not d!93701) (not b!680750) (not d!93739) (not b!680831) (not b!680797) (not b!680724) (not b!680793) (not d!93705) (not b!680818) (not b!680830) (not d!93713) (not b!680704) (not b!680801) (not b!680834) (not b!680824) (not b!680748) (not b!680794))
(check-sat)
