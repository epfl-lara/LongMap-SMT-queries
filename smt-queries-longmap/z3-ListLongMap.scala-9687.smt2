; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114356 () Bool)

(assert start!114356)

(declare-fun b!1357769 () Bool)

(declare-fun res!902525 () Bool)

(declare-fun e!770604 () Bool)

(assert (=> b!1357769 (=> (not res!902525) (not e!770604))))

(declare-datatypes ((List!31763 0))(
  ( (Nil!31760) (Cons!31759 (h!32968 (_ BitVec 64)) (t!46419 List!31763)) )
))
(declare-fun acc!759 () List!31763)

(declare-fun contains!9383 (List!31763 (_ BitVec 64)) Bool)

(assert (=> b!1357769 (= res!902525 (not (contains!9383 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357770 () Bool)

(declare-fun res!902524 () Bool)

(assert (=> b!1357770 (=> (not res!902524) (not e!770604))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357770 (= res!902524 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357771 () Bool)

(declare-fun res!902520 () Bool)

(assert (=> b!1357771 (=> (not res!902520) (not e!770604))))

(declare-datatypes ((array!92397 0))(
  ( (array!92398 (arr!44644 (Array (_ BitVec 32) (_ BitVec 64))) (size!45196 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92397)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357771 (= res!902520 (validKeyInArray!0 (select (arr!44644 a!3742) from!3120)))))

(declare-fun b!1357772 () Bool)

(declare-fun res!902528 () Bool)

(assert (=> b!1357772 (=> (not res!902528) (not e!770604))))

(declare-fun arrayNoDuplicates!0 (array!92397 (_ BitVec 32) List!31763) Bool)

(assert (=> b!1357772 (= res!902528 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357773 () Bool)

(declare-fun res!902519 () Bool)

(assert (=> b!1357773 (=> (not res!902519) (not e!770604))))

(assert (=> b!1357773 (= res!902519 (not (contains!9383 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357774 () Bool)

(declare-fun res!902527 () Bool)

(assert (=> b!1357774 (=> (not res!902527) (not e!770604))))

(assert (=> b!1357774 (= res!902527 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31760))))

(declare-fun b!1357776 () Bool)

(declare-fun e!770603 () Bool)

(declare-fun lt!599047 () List!31763)

(declare-fun subseq!821 (List!31763 List!31763) Bool)

(assert (=> b!1357776 (= e!770603 (subseq!821 acc!759 lt!599047))))

(declare-fun b!1357777 () Bool)

(declare-fun res!902518 () Bool)

(assert (=> b!1357777 (=> res!902518 e!770603)))

(declare-fun noDuplicate!2298 (List!31763) Bool)

(assert (=> b!1357777 (= res!902518 (not (noDuplicate!2298 lt!599047)))))

(declare-fun b!1357778 () Bool)

(declare-fun res!902526 () Bool)

(assert (=> b!1357778 (=> (not res!902526) (not e!770604))))

(assert (=> b!1357778 (= res!902526 (noDuplicate!2298 acc!759))))

(declare-fun b!1357779 () Bool)

(assert (=> b!1357779 (= e!770604 (not e!770603))))

(declare-fun res!902523 () Bool)

(assert (=> b!1357779 (=> res!902523 e!770603)))

(assert (=> b!1357779 (= res!902523 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!826 (List!31763 (_ BitVec 64)) List!31763)

(assert (=> b!1357779 (= lt!599047 ($colon$colon!826 acc!759 (select (arr!44644 a!3742) from!3120)))))

(assert (=> b!1357779 (subseq!821 acc!759 acc!759)))

(declare-datatypes ((Unit!44514 0))(
  ( (Unit!44515) )
))
(declare-fun lt!599046 () Unit!44514)

(declare-fun lemmaListSubSeqRefl!0 (List!31763) Unit!44514)

(assert (=> b!1357779 (= lt!599046 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357780 () Bool)

(declare-fun res!902530 () Bool)

(assert (=> b!1357780 (=> (not res!902530) (not e!770604))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357780 (= res!902530 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45196 a!3742))))))

(declare-fun b!1357781 () Bool)

(declare-fun res!902521 () Bool)

(assert (=> b!1357781 (=> res!902521 e!770603)))

(assert (=> b!1357781 (= res!902521 (contains!9383 lt!599047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357782 () Bool)

(declare-fun res!902529 () Bool)

(assert (=> b!1357782 (=> res!902529 e!770603)))

(assert (=> b!1357782 (= res!902529 (contains!9383 lt!599047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357775 () Bool)

(declare-fun res!902522 () Bool)

(assert (=> b!1357775 (=> (not res!902522) (not e!770604))))

(assert (=> b!1357775 (= res!902522 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45196 a!3742)))))

(declare-fun res!902531 () Bool)

(assert (=> start!114356 (=> (not res!902531) (not e!770604))))

(assert (=> start!114356 (= res!902531 (and (bvslt (size!45196 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45196 a!3742))))))

(assert (=> start!114356 e!770604))

(assert (=> start!114356 true))

(declare-fun array_inv!33877 (array!92397) Bool)

(assert (=> start!114356 (array_inv!33877 a!3742)))

(assert (= (and start!114356 res!902531) b!1357778))

(assert (= (and b!1357778 res!902526) b!1357769))

(assert (= (and b!1357769 res!902525) b!1357773))

(assert (= (and b!1357773 res!902519) b!1357774))

(assert (= (and b!1357774 res!902527) b!1357772))

(assert (= (and b!1357772 res!902528) b!1357780))

(assert (= (and b!1357780 res!902530) b!1357770))

(assert (= (and b!1357770 res!902524) b!1357775))

(assert (= (and b!1357775 res!902522) b!1357771))

(assert (= (and b!1357771 res!902520) b!1357779))

(assert (= (and b!1357779 (not res!902523)) b!1357777))

(assert (= (and b!1357777 (not res!902518)) b!1357781))

(assert (= (and b!1357781 (not res!902521)) b!1357782))

(assert (= (and b!1357782 (not res!902529)) b!1357776))

(declare-fun m!1242985 () Bool)

(assert (=> b!1357773 m!1242985))

(declare-fun m!1242987 () Bool)

(assert (=> b!1357769 m!1242987))

(declare-fun m!1242989 () Bool)

(assert (=> b!1357781 m!1242989))

(declare-fun m!1242991 () Bool)

(assert (=> start!114356 m!1242991))

(declare-fun m!1242993 () Bool)

(assert (=> b!1357778 m!1242993))

(declare-fun m!1242995 () Bool)

(assert (=> b!1357771 m!1242995))

(assert (=> b!1357771 m!1242995))

(declare-fun m!1242997 () Bool)

(assert (=> b!1357771 m!1242997))

(declare-fun m!1242999 () Bool)

(assert (=> b!1357776 m!1242999))

(declare-fun m!1243001 () Bool)

(assert (=> b!1357774 m!1243001))

(assert (=> b!1357779 m!1242995))

(assert (=> b!1357779 m!1242995))

(declare-fun m!1243003 () Bool)

(assert (=> b!1357779 m!1243003))

(declare-fun m!1243005 () Bool)

(assert (=> b!1357779 m!1243005))

(declare-fun m!1243007 () Bool)

(assert (=> b!1357779 m!1243007))

(declare-fun m!1243009 () Bool)

(assert (=> b!1357782 m!1243009))

(declare-fun m!1243011 () Bool)

(assert (=> b!1357777 m!1243011))

(declare-fun m!1243013 () Bool)

(assert (=> b!1357770 m!1243013))

(declare-fun m!1243015 () Bool)

(assert (=> b!1357772 m!1243015))

(check-sat (not b!1357774) (not b!1357773) (not b!1357772) (not b!1357778) (not b!1357771) (not b!1357770) (not b!1357781) (not start!114356) (not b!1357782) (not b!1357777) (not b!1357776) (not b!1357769) (not b!1357779))
(check-sat)
(get-model)

(declare-fun d!145133 () Bool)

(declare-fun lt!599062 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!678 (List!31763) (InoxSet (_ BitVec 64)))

(assert (=> d!145133 (= lt!599062 (select (content!678 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770628 () Bool)

(assert (=> d!145133 (= lt!599062 e!770628)))

(declare-fun res!902620 () Bool)

(assert (=> d!145133 (=> (not res!902620) (not e!770628))))

(get-info :version)

(assert (=> d!145133 (= res!902620 ((_ is Cons!31759) acc!759))))

(assert (=> d!145133 (= (contains!9383 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599062)))

(declare-fun b!1357871 () Bool)

(declare-fun e!770629 () Bool)

(assert (=> b!1357871 (= e!770628 e!770629)))

(declare-fun res!902621 () Bool)

(assert (=> b!1357871 (=> res!902621 e!770629)))

(assert (=> b!1357871 (= res!902621 (= (h!32968 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357872 () Bool)

(assert (=> b!1357872 (= e!770629 (contains!9383 (t!46419 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145133 res!902620) b!1357871))

(assert (= (and b!1357871 (not res!902621)) b!1357872))

(declare-fun m!1243081 () Bool)

(assert (=> d!145133 m!1243081))

(declare-fun m!1243083 () Bool)

(assert (=> d!145133 m!1243083))

(declare-fun m!1243085 () Bool)

(assert (=> b!1357872 m!1243085))

(assert (=> b!1357769 d!145133))

(declare-fun d!145135 () Bool)

(assert (=> d!145135 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357770 d!145135))

(declare-fun d!145137 () Bool)

(assert (=> d!145137 (= ($colon$colon!826 acc!759 (select (arr!44644 a!3742) from!3120)) (Cons!31759 (select (arr!44644 a!3742) from!3120) acc!759))))

(assert (=> b!1357779 d!145137))

(declare-fun b!1357883 () Bool)

(declare-fun e!770639 () Bool)

(assert (=> b!1357883 (= e!770639 (subseq!821 (t!46419 acc!759) (t!46419 acc!759)))))

(declare-fun d!145139 () Bool)

(declare-fun res!902632 () Bool)

(declare-fun e!770638 () Bool)

(assert (=> d!145139 (=> res!902632 e!770638)))

(assert (=> d!145139 (= res!902632 ((_ is Nil!31760) acc!759))))

(assert (=> d!145139 (= (subseq!821 acc!759 acc!759) e!770638)))

(declare-fun b!1357881 () Bool)

(declare-fun e!770640 () Bool)

(assert (=> b!1357881 (= e!770638 e!770640)))

(declare-fun res!902630 () Bool)

(assert (=> b!1357881 (=> (not res!902630) (not e!770640))))

(assert (=> b!1357881 (= res!902630 ((_ is Cons!31759) acc!759))))

(declare-fun b!1357882 () Bool)

(declare-fun e!770641 () Bool)

(assert (=> b!1357882 (= e!770640 e!770641)))

(declare-fun res!902631 () Bool)

(assert (=> b!1357882 (=> res!902631 e!770641)))

(assert (=> b!1357882 (= res!902631 e!770639)))

(declare-fun res!902633 () Bool)

(assert (=> b!1357882 (=> (not res!902633) (not e!770639))))

(assert (=> b!1357882 (= res!902633 (= (h!32968 acc!759) (h!32968 acc!759)))))

(declare-fun b!1357884 () Bool)

(assert (=> b!1357884 (= e!770641 (subseq!821 acc!759 (t!46419 acc!759)))))

(assert (= (and d!145139 (not res!902632)) b!1357881))

(assert (= (and b!1357881 res!902630) b!1357882))

(assert (= (and b!1357882 res!902633) b!1357883))

(assert (= (and b!1357882 (not res!902631)) b!1357884))

(declare-fun m!1243087 () Bool)

(assert (=> b!1357883 m!1243087))

(declare-fun m!1243089 () Bool)

(assert (=> b!1357884 m!1243089))

(assert (=> b!1357779 d!145139))

(declare-fun d!145141 () Bool)

(assert (=> d!145141 (subseq!821 acc!759 acc!759)))

(declare-fun lt!599065 () Unit!44514)

(declare-fun choose!36 (List!31763) Unit!44514)

(assert (=> d!145141 (= lt!599065 (choose!36 acc!759))))

(assert (=> d!145141 (= (lemmaListSubSeqRefl!0 acc!759) lt!599065)))

(declare-fun bs!38916 () Bool)

(assert (= bs!38916 d!145141))

(assert (=> bs!38916 m!1243005))

(declare-fun m!1243091 () Bool)

(assert (=> bs!38916 m!1243091))

(assert (=> b!1357779 d!145141))

(declare-fun d!145143 () Bool)

(assert (=> d!145143 (= (array_inv!33877 a!3742) (bvsge (size!45196 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114356 d!145143))

(declare-fun b!1357907 () Bool)

(declare-fun e!770662 () Bool)

(assert (=> b!1357907 (= e!770662 (contains!9383 acc!759 (select (arr!44644 a!3742) from!3120)))))

(declare-fun b!1357908 () Bool)

(declare-fun e!770665 () Bool)

(declare-fun e!770664 () Bool)

(assert (=> b!1357908 (= e!770665 e!770664)))

(declare-fun res!902653 () Bool)

(assert (=> b!1357908 (=> (not res!902653) (not e!770664))))

(assert (=> b!1357908 (= res!902653 (not e!770662))))

(declare-fun res!902654 () Bool)

(assert (=> b!1357908 (=> (not res!902654) (not e!770662))))

(assert (=> b!1357908 (= res!902654 (validKeyInArray!0 (select (arr!44644 a!3742) from!3120)))))

(declare-fun d!145145 () Bool)

(declare-fun res!902652 () Bool)

(assert (=> d!145145 (=> res!902652 e!770665)))

(assert (=> d!145145 (= res!902652 (bvsge from!3120 (size!45196 a!3742)))))

(assert (=> d!145145 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770665)))

(declare-fun b!1357909 () Bool)

(declare-fun e!770663 () Bool)

(declare-fun call!65248 () Bool)

(assert (=> b!1357909 (= e!770663 call!65248)))

(declare-fun bm!65245 () Bool)

(declare-fun c!127070 () Bool)

(assert (=> bm!65245 (= call!65248 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127070 (Cons!31759 (select (arr!44644 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1357910 () Bool)

(assert (=> b!1357910 (= e!770664 e!770663)))

(assert (=> b!1357910 (= c!127070 (validKeyInArray!0 (select (arr!44644 a!3742) from!3120)))))

(declare-fun b!1357911 () Bool)

(assert (=> b!1357911 (= e!770663 call!65248)))

(assert (= (and d!145145 (not res!902652)) b!1357908))

(assert (= (and b!1357908 res!902654) b!1357907))

(assert (= (and b!1357908 res!902653) b!1357910))

(assert (= (and b!1357910 c!127070) b!1357909))

(assert (= (and b!1357910 (not c!127070)) b!1357911))

(assert (= (or b!1357909 b!1357911) bm!65245))

(assert (=> b!1357907 m!1242995))

(assert (=> b!1357907 m!1242995))

(declare-fun m!1243103 () Bool)

(assert (=> b!1357907 m!1243103))

(assert (=> b!1357908 m!1242995))

(assert (=> b!1357908 m!1242995))

(assert (=> b!1357908 m!1242997))

(assert (=> bm!65245 m!1242995))

(declare-fun m!1243105 () Bool)

(assert (=> bm!65245 m!1243105))

(assert (=> b!1357910 m!1242995))

(assert (=> b!1357910 m!1242995))

(assert (=> b!1357910 m!1242997))

(assert (=> b!1357772 d!145145))

(declare-fun d!145165 () Bool)

(declare-fun lt!599071 () Bool)

(assert (=> d!145165 (= lt!599071 (select (content!678 lt!599047) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770670 () Bool)

(assert (=> d!145165 (= lt!599071 e!770670)))

(declare-fun res!902659 () Bool)

(assert (=> d!145165 (=> (not res!902659) (not e!770670))))

(assert (=> d!145165 (= res!902659 ((_ is Cons!31759) lt!599047))))

(assert (=> d!145165 (= (contains!9383 lt!599047 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599071)))

(declare-fun b!1357916 () Bool)

(declare-fun e!770671 () Bool)

(assert (=> b!1357916 (= e!770670 e!770671)))

(declare-fun res!902660 () Bool)

(assert (=> b!1357916 (=> res!902660 e!770671)))

(assert (=> b!1357916 (= res!902660 (= (h!32968 lt!599047) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357917 () Bool)

(assert (=> b!1357917 (= e!770671 (contains!9383 (t!46419 lt!599047) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145165 res!902659) b!1357916))

(assert (= (and b!1357916 (not res!902660)) b!1357917))

(declare-fun m!1243107 () Bool)

(assert (=> d!145165 m!1243107))

(declare-fun m!1243109 () Bool)

(assert (=> d!145165 m!1243109))

(declare-fun m!1243111 () Bool)

(assert (=> b!1357917 m!1243111))

(assert (=> b!1357781 d!145165))

(declare-fun d!145167 () Bool)

(assert (=> d!145167 (= (validKeyInArray!0 (select (arr!44644 a!3742) from!3120)) (and (not (= (select (arr!44644 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44644 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357771 d!145167))

(declare-fun d!145169 () Bool)

(declare-fun lt!599072 () Bool)

(assert (=> d!145169 (= lt!599072 (select (content!678 lt!599047) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770672 () Bool)

(assert (=> d!145169 (= lt!599072 e!770672)))

(declare-fun res!902661 () Bool)

(assert (=> d!145169 (=> (not res!902661) (not e!770672))))

(assert (=> d!145169 (= res!902661 ((_ is Cons!31759) lt!599047))))

(assert (=> d!145169 (= (contains!9383 lt!599047 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599072)))

(declare-fun b!1357918 () Bool)

(declare-fun e!770673 () Bool)

(assert (=> b!1357918 (= e!770672 e!770673)))

(declare-fun res!902662 () Bool)

(assert (=> b!1357918 (=> res!902662 e!770673)))

(assert (=> b!1357918 (= res!902662 (= (h!32968 lt!599047) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357919 () Bool)

(assert (=> b!1357919 (= e!770673 (contains!9383 (t!46419 lt!599047) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145169 res!902661) b!1357918))

(assert (= (and b!1357918 (not res!902662)) b!1357919))

(assert (=> d!145169 m!1243107))

(declare-fun m!1243113 () Bool)

(assert (=> d!145169 m!1243113))

(declare-fun m!1243115 () Bool)

(assert (=> b!1357919 m!1243115))

(assert (=> b!1357782 d!145169))

(declare-fun d!145171 () Bool)

(declare-fun lt!599073 () Bool)

(assert (=> d!145171 (= lt!599073 (select (content!678 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770674 () Bool)

(assert (=> d!145171 (= lt!599073 e!770674)))

(declare-fun res!902663 () Bool)

(assert (=> d!145171 (=> (not res!902663) (not e!770674))))

(assert (=> d!145171 (= res!902663 ((_ is Cons!31759) acc!759))))

(assert (=> d!145171 (= (contains!9383 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599073)))

(declare-fun b!1357920 () Bool)

(declare-fun e!770675 () Bool)

(assert (=> b!1357920 (= e!770674 e!770675)))

(declare-fun res!902664 () Bool)

(assert (=> b!1357920 (=> res!902664 e!770675)))

(assert (=> b!1357920 (= res!902664 (= (h!32968 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357921 () Bool)

(assert (=> b!1357921 (= e!770675 (contains!9383 (t!46419 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145171 res!902663) b!1357920))

(assert (= (and b!1357920 (not res!902664)) b!1357921))

(assert (=> d!145171 m!1243081))

(declare-fun m!1243117 () Bool)

(assert (=> d!145171 m!1243117))

(declare-fun m!1243119 () Bool)

(assert (=> b!1357921 m!1243119))

(assert (=> b!1357773 d!145171))

(declare-fun b!1357924 () Bool)

(declare-fun e!770678 () Bool)

(assert (=> b!1357924 (= e!770678 (contains!9383 Nil!31760 (select (arr!44644 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357925 () Bool)

(declare-fun e!770681 () Bool)

(declare-fun e!770680 () Bool)

(assert (=> b!1357925 (= e!770681 e!770680)))

(declare-fun res!902668 () Bool)

(assert (=> b!1357925 (=> (not res!902668) (not e!770680))))

(assert (=> b!1357925 (= res!902668 (not e!770678))))

(declare-fun res!902669 () Bool)

(assert (=> b!1357925 (=> (not res!902669) (not e!770678))))

(assert (=> b!1357925 (= res!902669 (validKeyInArray!0 (select (arr!44644 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145173 () Bool)

(declare-fun res!902667 () Bool)

(assert (=> d!145173 (=> res!902667 e!770681)))

(assert (=> d!145173 (= res!902667 (bvsge #b00000000000000000000000000000000 (size!45196 a!3742)))))

(assert (=> d!145173 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31760) e!770681)))

(declare-fun b!1357926 () Bool)

(declare-fun e!770679 () Bool)

(declare-fun call!65249 () Bool)

(assert (=> b!1357926 (= e!770679 call!65249)))

(declare-fun bm!65246 () Bool)

(declare-fun c!127071 () Bool)

(assert (=> bm!65246 (= call!65249 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127071 (Cons!31759 (select (arr!44644 a!3742) #b00000000000000000000000000000000) Nil!31760) Nil!31760)))))

(declare-fun b!1357927 () Bool)

(assert (=> b!1357927 (= e!770680 e!770679)))

(assert (=> b!1357927 (= c!127071 (validKeyInArray!0 (select (arr!44644 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357928 () Bool)

(assert (=> b!1357928 (= e!770679 call!65249)))

(assert (= (and d!145173 (not res!902667)) b!1357925))

(assert (= (and b!1357925 res!902669) b!1357924))

(assert (= (and b!1357925 res!902668) b!1357927))

(assert (= (and b!1357927 c!127071) b!1357926))

(assert (= (and b!1357927 (not c!127071)) b!1357928))

(assert (= (or b!1357926 b!1357928) bm!65246))

(declare-fun m!1243127 () Bool)

(assert (=> b!1357924 m!1243127))

(assert (=> b!1357924 m!1243127))

(declare-fun m!1243129 () Bool)

(assert (=> b!1357924 m!1243129))

(assert (=> b!1357925 m!1243127))

(assert (=> b!1357925 m!1243127))

(declare-fun m!1243131 () Bool)

(assert (=> b!1357925 m!1243131))

(assert (=> bm!65246 m!1243127))

(declare-fun m!1243133 () Bool)

(assert (=> bm!65246 m!1243133))

(assert (=> b!1357927 m!1243127))

(assert (=> b!1357927 m!1243127))

(assert (=> b!1357927 m!1243131))

(assert (=> b!1357774 d!145173))

(declare-fun d!145179 () Bool)

(declare-fun res!902688 () Bool)

(declare-fun e!770700 () Bool)

(assert (=> d!145179 (=> res!902688 e!770700)))

(assert (=> d!145179 (= res!902688 ((_ is Nil!31760) lt!599047))))

(assert (=> d!145179 (= (noDuplicate!2298 lt!599047) e!770700)))

(declare-fun b!1357947 () Bool)

(declare-fun e!770701 () Bool)

(assert (=> b!1357947 (= e!770700 e!770701)))

(declare-fun res!902689 () Bool)

(assert (=> b!1357947 (=> (not res!902689) (not e!770701))))

(assert (=> b!1357947 (= res!902689 (not (contains!9383 (t!46419 lt!599047) (h!32968 lt!599047))))))

(declare-fun b!1357948 () Bool)

(assert (=> b!1357948 (= e!770701 (noDuplicate!2298 (t!46419 lt!599047)))))

(assert (= (and d!145179 (not res!902688)) b!1357947))

(assert (= (and b!1357947 res!902689) b!1357948))

(declare-fun m!1243139 () Bool)

(assert (=> b!1357947 m!1243139))

(declare-fun m!1243141 () Bool)

(assert (=> b!1357948 m!1243141))

(assert (=> b!1357777 d!145179))

(declare-fun d!145183 () Bool)

(declare-fun res!902696 () Bool)

(declare-fun e!770708 () Bool)

(assert (=> d!145183 (=> res!902696 e!770708)))

(assert (=> d!145183 (= res!902696 ((_ is Nil!31760) acc!759))))

(assert (=> d!145183 (= (noDuplicate!2298 acc!759) e!770708)))

(declare-fun b!1357955 () Bool)

(declare-fun e!770709 () Bool)

(assert (=> b!1357955 (= e!770708 e!770709)))

(declare-fun res!902697 () Bool)

(assert (=> b!1357955 (=> (not res!902697) (not e!770709))))

(assert (=> b!1357955 (= res!902697 (not (contains!9383 (t!46419 acc!759) (h!32968 acc!759))))))

(declare-fun b!1357956 () Bool)

(assert (=> b!1357956 (= e!770709 (noDuplicate!2298 (t!46419 acc!759)))))

(assert (= (and d!145183 (not res!902696)) b!1357955))

(assert (= (and b!1357955 res!902697) b!1357956))

(declare-fun m!1243143 () Bool)

(assert (=> b!1357955 m!1243143))

(declare-fun m!1243145 () Bool)

(assert (=> b!1357956 m!1243145))

(assert (=> b!1357778 d!145183))

(declare-fun b!1357959 () Bool)

(declare-fun e!770711 () Bool)

(assert (=> b!1357959 (= e!770711 (subseq!821 (t!46419 acc!759) (t!46419 lt!599047)))))

(declare-fun d!145185 () Bool)

(declare-fun res!902700 () Bool)

(declare-fun e!770710 () Bool)

(assert (=> d!145185 (=> res!902700 e!770710)))

(assert (=> d!145185 (= res!902700 ((_ is Nil!31760) acc!759))))

(assert (=> d!145185 (= (subseq!821 acc!759 lt!599047) e!770710)))

(declare-fun b!1357957 () Bool)

(declare-fun e!770712 () Bool)

(assert (=> b!1357957 (= e!770710 e!770712)))

(declare-fun res!902698 () Bool)

(assert (=> b!1357957 (=> (not res!902698) (not e!770712))))

(assert (=> b!1357957 (= res!902698 ((_ is Cons!31759) lt!599047))))

(declare-fun b!1357958 () Bool)

(declare-fun e!770713 () Bool)

(assert (=> b!1357958 (= e!770712 e!770713)))

(declare-fun res!902699 () Bool)

(assert (=> b!1357958 (=> res!902699 e!770713)))

(assert (=> b!1357958 (= res!902699 e!770711)))

(declare-fun res!902701 () Bool)

(assert (=> b!1357958 (=> (not res!902701) (not e!770711))))

(assert (=> b!1357958 (= res!902701 (= (h!32968 acc!759) (h!32968 lt!599047)))))

(declare-fun b!1357960 () Bool)

(assert (=> b!1357960 (= e!770713 (subseq!821 acc!759 (t!46419 lt!599047)))))

(assert (= (and d!145185 (not res!902700)) b!1357957))

(assert (= (and b!1357957 res!902698) b!1357958))

(assert (= (and b!1357958 res!902701) b!1357959))

(assert (= (and b!1357958 (not res!902699)) b!1357960))

(declare-fun m!1243147 () Bool)

(assert (=> b!1357959 m!1243147))

(declare-fun m!1243149 () Bool)

(assert (=> b!1357960 m!1243149))

(assert (=> b!1357776 d!145185))

(check-sat (not d!145171) (not b!1357921) (not b!1357919) (not b!1357959) (not d!145141) (not b!1357917) (not b!1357925) (not bm!65245) (not b!1357947) (not d!145169) (not b!1357960) (not b!1357884) (not b!1357872) (not b!1357927) (not b!1357883) (not bm!65246) (not b!1357956) (not b!1357908) (not b!1357948) (not b!1357910) (not d!145165) (not b!1357907) (not d!145133) (not b!1357955) (not b!1357924))
(check-sat)
