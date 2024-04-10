; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63274 () Bool)

(assert start!63274)

(declare-fun b!712710 () Bool)

(declare-fun res!475896 () Bool)

(declare-fun e!400904 () Bool)

(assert (=> b!712710 (=> (not res!475896) (not e!400904))))

(declare-datatypes ((List!13400 0))(
  ( (Nil!13397) (Cons!13396 (h!14441 (_ BitVec 64)) (t!19712 List!13400)) )
))
(declare-fun acc!652 () List!13400)

(declare-fun noDuplicate!1224 (List!13400) Bool)

(assert (=> b!712710 (= res!475896 (noDuplicate!1224 acc!652))))

(declare-fun newAcc!49 () List!13400)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun e!400903 () Bool)

(declare-datatypes ((array!40435 0))(
  ( (array!40436 (arr!19359 (Array (_ BitVec 32) (_ BitVec 64))) (size!19767 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40435)

(declare-fun b!712711 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40435 (_ BitVec 32) List!13400) Bool)

(assert (=> b!712711 (= e!400903 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(declare-fun lt!318603 () List!13400)

(assert (=> b!712711 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318603)))

(declare-fun lt!318605 () List!13400)

(declare-fun k!2824 () (_ BitVec 64))

(declare-datatypes ((Unit!24630 0))(
  ( (Unit!24631) )
))
(declare-fun lt!318604 () Unit!24630)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40435 (_ BitVec 64) (_ BitVec 32) List!13400 List!13400) Unit!24630)

(assert (=> b!712711 (= lt!318604 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318605 lt!318603))))

(declare-fun b!712712 () Bool)

(declare-fun res!475906 () Bool)

(assert (=> b!712712 (=> (not res!475906) (not e!400903))))

(declare-fun -!387 (List!13400 (_ BitVec 64)) List!13400)

(assert (=> b!712712 (= res!475906 (= (-!387 lt!318603 k!2824) lt!318605))))

(declare-fun b!712713 () Bool)

(declare-fun res!475901 () Bool)

(assert (=> b!712713 (=> (not res!475901) (not e!400904))))

(assert (=> b!712713 (= res!475901 (noDuplicate!1224 newAcc!49))))

(declare-fun b!712714 () Bool)

(declare-fun res!475880 () Bool)

(assert (=> b!712714 (=> (not res!475880) (not e!400904))))

(assert (=> b!712714 (= res!475880 (= (-!387 newAcc!49 k!2824) acc!652))))

(declare-fun b!712715 () Bool)

(declare-fun res!475895 () Bool)

(assert (=> b!712715 (=> (not res!475895) (not e!400904))))

(declare-fun contains!3977 (List!13400 (_ BitVec 64)) Bool)

(assert (=> b!712715 (= res!475895 (not (contains!3977 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712716 () Bool)

(declare-fun res!475878 () Bool)

(assert (=> b!712716 (=> (not res!475878) (not e!400904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712716 (= res!475878 (validKeyInArray!0 (select (arr!19359 a!3591) from!2969)))))

(declare-fun b!712717 () Bool)

(declare-fun res!475882 () Bool)

(assert (=> b!712717 (=> (not res!475882) (not e!400903))))

(assert (=> b!712717 (= res!475882 (contains!3977 lt!318603 k!2824))))

(declare-fun b!712719 () Bool)

(declare-fun res!475883 () Bool)

(assert (=> b!712719 (=> (not res!475883) (not e!400904))))

(assert (=> b!712719 (= res!475883 (not (contains!3977 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712720 () Bool)

(declare-fun res!475900 () Bool)

(assert (=> b!712720 (=> (not res!475900) (not e!400904))))

(assert (=> b!712720 (= res!475900 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19767 a!3591)))))

(declare-fun b!712721 () Bool)

(assert (=> b!712721 (= e!400904 e!400903)))

(declare-fun res!475890 () Bool)

(assert (=> b!712721 (=> (not res!475890) (not e!400903))))

(assert (=> b!712721 (= res!475890 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!533 (List!13400 (_ BitVec 64)) List!13400)

(assert (=> b!712721 (= lt!318603 ($colon$colon!533 newAcc!49 (select (arr!19359 a!3591) from!2969)))))

(assert (=> b!712721 (= lt!318605 ($colon$colon!533 acc!652 (select (arr!19359 a!3591) from!2969)))))

(declare-fun b!712722 () Bool)

(declare-fun res!475886 () Bool)

(assert (=> b!712722 (=> (not res!475886) (not e!400904))))

(declare-fun arrayContainsKey!0 (array!40435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712722 (= res!475886 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!712723 () Bool)

(declare-fun res!475881 () Bool)

(assert (=> b!712723 (=> (not res!475881) (not e!400904))))

(declare-fun subseq!422 (List!13400 List!13400) Bool)

(assert (=> b!712723 (= res!475881 (subseq!422 acc!652 newAcc!49))))

(declare-fun b!712724 () Bool)

(declare-fun res!475885 () Bool)

(assert (=> b!712724 (=> (not res!475885) (not e!400903))))

(assert (=> b!712724 (= res!475885 (noDuplicate!1224 lt!318605))))

(declare-fun b!712718 () Bool)

(declare-fun res!475902 () Bool)

(assert (=> b!712718 (=> (not res!475902) (not e!400903))))

(assert (=> b!712718 (= res!475902 (noDuplicate!1224 lt!318603))))

(declare-fun res!475892 () Bool)

(assert (=> start!63274 (=> (not res!475892) (not e!400904))))

(assert (=> start!63274 (= res!475892 (and (bvslt (size!19767 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19767 a!3591))))))

(assert (=> start!63274 e!400904))

(assert (=> start!63274 true))

(declare-fun array_inv!15155 (array!40435) Bool)

(assert (=> start!63274 (array_inv!15155 a!3591)))

(declare-fun b!712725 () Bool)

(declare-fun res!475887 () Bool)

(assert (=> b!712725 (=> (not res!475887) (not e!400903))))

(assert (=> b!712725 (= res!475887 (not (contains!3977 lt!318603 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712726 () Bool)

(declare-fun res!475904 () Bool)

(assert (=> b!712726 (=> (not res!475904) (not e!400903))))

(assert (=> b!712726 (= res!475904 (not (contains!3977 lt!318605 k!2824)))))

(declare-fun b!712727 () Bool)

(declare-fun res!475888 () Bool)

(assert (=> b!712727 (=> (not res!475888) (not e!400904))))

(assert (=> b!712727 (= res!475888 (validKeyInArray!0 k!2824))))

(declare-fun b!712728 () Bool)

(declare-fun res!475894 () Bool)

(assert (=> b!712728 (=> (not res!475894) (not e!400903))))

(assert (=> b!712728 (= res!475894 (subseq!422 lt!318605 lt!318603))))

(declare-fun b!712729 () Bool)

(declare-fun res!475884 () Bool)

(assert (=> b!712729 (=> (not res!475884) (not e!400904))))

(assert (=> b!712729 (= res!475884 (contains!3977 newAcc!49 k!2824))))

(declare-fun b!712730 () Bool)

(declare-fun res!475879 () Bool)

(assert (=> b!712730 (=> (not res!475879) (not e!400904))))

(assert (=> b!712730 (= res!475879 (not (contains!3977 acc!652 k!2824)))))

(declare-fun b!712731 () Bool)

(declare-fun res!475897 () Bool)

(assert (=> b!712731 (=> (not res!475897) (not e!400903))))

(assert (=> b!712731 (= res!475897 (not (contains!3977 lt!318605 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712732 () Bool)

(declare-fun res!475903 () Bool)

(assert (=> b!712732 (=> (not res!475903) (not e!400903))))

(assert (=> b!712732 (= res!475903 (not (contains!3977 lt!318603 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712733 () Bool)

(declare-fun res!475891 () Bool)

(assert (=> b!712733 (=> (not res!475891) (not e!400903))))

(assert (=> b!712733 (= res!475891 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318605))))

(declare-fun b!712734 () Bool)

(declare-fun res!475893 () Bool)

(assert (=> b!712734 (=> (not res!475893) (not e!400903))))

(assert (=> b!712734 (= res!475893 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712735 () Bool)

(declare-fun res!475898 () Bool)

(assert (=> b!712735 (=> (not res!475898) (not e!400904))))

(assert (=> b!712735 (= res!475898 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712736 () Bool)

(declare-fun res!475899 () Bool)

(assert (=> b!712736 (=> (not res!475899) (not e!400904))))

(assert (=> b!712736 (= res!475899 (not (contains!3977 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712737 () Bool)

(declare-fun res!475905 () Bool)

(assert (=> b!712737 (=> (not res!475905) (not e!400904))))

(assert (=> b!712737 (= res!475905 (not (contains!3977 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712738 () Bool)

(declare-fun res!475889 () Bool)

(assert (=> b!712738 (=> (not res!475889) (not e!400903))))

(assert (=> b!712738 (= res!475889 (not (contains!3977 lt!318605 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63274 res!475892) b!712710))

(assert (= (and b!712710 res!475896) b!712713))

(assert (= (and b!712713 res!475901) b!712715))

(assert (= (and b!712715 res!475895) b!712736))

(assert (= (and b!712736 res!475899) b!712722))

(assert (= (and b!712722 res!475886) b!712730))

(assert (= (and b!712730 res!475879) b!712727))

(assert (= (and b!712727 res!475888) b!712735))

(assert (= (and b!712735 res!475898) b!712723))

(assert (= (and b!712723 res!475881) b!712729))

(assert (= (and b!712729 res!475884) b!712714))

(assert (= (and b!712714 res!475880) b!712719))

(assert (= (and b!712719 res!475883) b!712737))

(assert (= (and b!712737 res!475905) b!712720))

(assert (= (and b!712720 res!475900) b!712716))

(assert (= (and b!712716 res!475878) b!712721))

(assert (= (and b!712721 res!475890) b!712724))

(assert (= (and b!712724 res!475885) b!712718))

(assert (= (and b!712718 res!475902) b!712738))

(assert (= (and b!712738 res!475889) b!712731))

(assert (= (and b!712731 res!475897) b!712734))

(assert (= (and b!712734 res!475893) b!712726))

(assert (= (and b!712726 res!475904) b!712733))

(assert (= (and b!712733 res!475891) b!712728))

(assert (= (and b!712728 res!475894) b!712717))

(assert (= (and b!712717 res!475882) b!712712))

(assert (= (and b!712712 res!475906) b!712725))

(assert (= (and b!712725 res!475887) b!712732))

(assert (= (and b!712732 res!475903) b!712711))

(declare-fun m!669565 () Bool)

(assert (=> b!712716 m!669565))

(assert (=> b!712716 m!669565))

(declare-fun m!669567 () Bool)

(assert (=> b!712716 m!669567))

(declare-fun m!669569 () Bool)

(assert (=> b!712734 m!669569))

(declare-fun m!669571 () Bool)

(assert (=> b!712710 m!669571))

(declare-fun m!669573 () Bool)

(assert (=> b!712731 m!669573))

(declare-fun m!669575 () Bool)

(assert (=> b!712723 m!669575))

(declare-fun m!669577 () Bool)

(assert (=> b!712737 m!669577))

(assert (=> b!712721 m!669565))

(assert (=> b!712721 m!669565))

(declare-fun m!669579 () Bool)

(assert (=> b!712721 m!669579))

(assert (=> b!712721 m!669565))

(declare-fun m!669581 () Bool)

(assert (=> b!712721 m!669581))

(declare-fun m!669583 () Bool)

(assert (=> b!712725 m!669583))

(declare-fun m!669585 () Bool)

(assert (=> b!712727 m!669585))

(declare-fun m!669587 () Bool)

(assert (=> b!712730 m!669587))

(declare-fun m!669589 () Bool)

(assert (=> b!712715 m!669589))

(declare-fun m!669591 () Bool)

(assert (=> b!712738 m!669591))

(declare-fun m!669593 () Bool)

(assert (=> b!712713 m!669593))

(declare-fun m!669595 () Bool)

(assert (=> b!712732 m!669595))

(declare-fun m!669597 () Bool)

(assert (=> b!712733 m!669597))

(declare-fun m!669599 () Bool)

(assert (=> b!712736 m!669599))

(declare-fun m!669601 () Bool)

(assert (=> b!712714 m!669601))

(declare-fun m!669603 () Bool)

(assert (=> b!712711 m!669603))

(declare-fun m!669605 () Bool)

(assert (=> b!712711 m!669605))

(declare-fun m!669607 () Bool)

(assert (=> b!712711 m!669607))

(declare-fun m!669609 () Bool)

(assert (=> b!712718 m!669609))

(declare-fun m!669611 () Bool)

(assert (=> start!63274 m!669611))

(declare-fun m!669613 () Bool)

(assert (=> b!712712 m!669613))

(declare-fun m!669615 () Bool)

(assert (=> b!712724 m!669615))

(declare-fun m!669617 () Bool)

(assert (=> b!712726 m!669617))

(declare-fun m!669619 () Bool)

(assert (=> b!712722 m!669619))

(declare-fun m!669621 () Bool)

(assert (=> b!712729 m!669621))

(declare-fun m!669623 () Bool)

(assert (=> b!712728 m!669623))

(declare-fun m!669625 () Bool)

(assert (=> b!712717 m!669625))

(declare-fun m!669627 () Bool)

(assert (=> b!712735 m!669627))

(declare-fun m!669629 () Bool)

(assert (=> b!712719 m!669629))

(push 1)

(assert (not start!63274))

(assert (not b!712730))

(assert (not b!712736))

(assert (not b!712716))

(assert (not b!712721))

(assert (not b!712718))

(assert (not b!712714))

(assert (not b!712738))

(assert (not b!712712))

(assert (not b!712722))

(assert (not b!712715))

(assert (not b!712734))

(assert (not b!712724))

(assert (not b!712726))

(assert (not b!712710))

(assert (not b!712713))

(assert (not b!712719))

(assert (not b!712732))

(assert (not b!712731))

(assert (not b!712717))

(assert (not b!712725))

(assert (not b!712711))

(assert (not b!712737))

(assert (not b!712729))

(assert (not b!712727))

(assert (not b!712733))

(assert (not b!712728))

(assert (not b!712735))

(assert (not b!712723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98031 () Bool)

(declare-fun lt!318633 () Bool)

(declare-fun content!362 (List!13400) (Set (_ BitVec 64)))

(assert (=> d!98031 (= lt!318633 (set.member k!2824 (content!362 lt!318605)))))

(declare-fun e!400966 () Bool)

(assert (=> d!98031 (= lt!318633 e!400966)))

(declare-fun res!476114 () Bool)

(assert (=> d!98031 (=> (not res!476114) (not e!400966))))

(assert (=> d!98031 (= res!476114 (is-Cons!13396 lt!318605))))

(assert (=> d!98031 (= (contains!3977 lt!318605 k!2824) lt!318633)))

(declare-fun b!712961 () Bool)

(declare-fun e!400965 () Bool)

(assert (=> b!712961 (= e!400966 e!400965)))

(declare-fun res!476113 () Bool)

(assert (=> b!712961 (=> res!476113 e!400965)))

(assert (=> b!712961 (= res!476113 (= (h!14441 lt!318605) k!2824))))

(declare-fun b!712962 () Bool)

(assert (=> b!712962 (= e!400965 (contains!3977 (t!19712 lt!318605) k!2824))))

(assert (= (and d!98031 res!476114) b!712961))

(assert (= (and b!712961 (not res!476113)) b!712962))

(declare-fun m!669777 () Bool)

(assert (=> d!98031 m!669777))

(declare-fun m!669779 () Bool)

(assert (=> d!98031 m!669779))

(declare-fun m!669781 () Bool)

(assert (=> b!712962 m!669781))

(assert (=> b!712726 d!98031))

(declare-fun d!98033 () Bool)

(assert (=> d!98033 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712727 d!98033))

(declare-fun b!713002 () Bool)

(declare-fun e!401000 () Bool)

(assert (=> b!713002 (= e!401000 (subseq!422 lt!318605 (t!19712 lt!318603)))))

(declare-fun b!713000 () Bool)

(declare-fun e!400999 () Bool)

(assert (=> b!713000 (= e!400999 e!401000)))

(declare-fun res!476144 () Bool)

(assert (=> b!713000 (=> res!476144 e!401000)))

(declare-fun e!401002 () Bool)

(assert (=> b!713000 (= res!476144 e!401002)))

(declare-fun res!476143 () Bool)

(assert (=> b!713000 (=> (not res!476143) (not e!401002))))

(assert (=> b!713000 (= res!476143 (= (h!14441 lt!318605) (h!14441 lt!318603)))))

(declare-fun d!98037 () Bool)

(declare-fun res!476146 () Bool)

(declare-fun e!401001 () Bool)

(assert (=> d!98037 (=> res!476146 e!401001)))

(assert (=> d!98037 (= res!476146 (is-Nil!13397 lt!318605))))

(assert (=> d!98037 (= (subseq!422 lt!318605 lt!318603) e!401001)))

(declare-fun b!713001 () Bool)

(assert (=> b!713001 (= e!401002 (subseq!422 (t!19712 lt!318605) (t!19712 lt!318603)))))

(declare-fun b!712999 () Bool)

(assert (=> b!712999 (= e!401001 e!400999)))

(declare-fun res!476145 () Bool)

(assert (=> b!712999 (=> (not res!476145) (not e!400999))))

(assert (=> b!712999 (= res!476145 (is-Cons!13396 lt!318603))))

(assert (= (and d!98037 (not res!476146)) b!712999))

(assert (= (and b!712999 res!476145) b!713000))

(assert (= (and b!713000 res!476143) b!713001))

(assert (= (and b!713000 (not res!476144)) b!713002))

(declare-fun m!669827 () Bool)

(assert (=> b!713002 m!669827))

(declare-fun m!669829 () Bool)

(assert (=> b!713001 m!669829))

(assert (=> b!712728 d!98037))

(declare-fun d!98053 () Bool)

(declare-fun lt!318638 () Bool)

(assert (=> d!98053 (= lt!318638 (set.member k!2824 (content!362 newAcc!49)))))

(declare-fun e!401004 () Bool)

(assert (=> d!98053 (= lt!318638 e!401004)))

(declare-fun res!476148 () Bool)

(assert (=> d!98053 (=> (not res!476148) (not e!401004))))

(assert (=> d!98053 (= res!476148 (is-Cons!13396 newAcc!49))))

(assert (=> d!98053 (= (contains!3977 newAcc!49 k!2824) lt!318638)))

(declare-fun b!713003 () Bool)

(declare-fun e!401003 () Bool)

(assert (=> b!713003 (= e!401004 e!401003)))

(declare-fun res!476147 () Bool)

(assert (=> b!713003 (=> res!476147 e!401003)))

(assert (=> b!713003 (= res!476147 (= (h!14441 newAcc!49) k!2824))))

(declare-fun b!713004 () Bool)

(assert (=> b!713004 (= e!401003 (contains!3977 (t!19712 newAcc!49) k!2824))))

(assert (= (and d!98053 res!476148) b!713003))

(assert (= (and b!713003 (not res!476147)) b!713004))

(declare-fun m!669831 () Bool)

(assert (=> d!98053 m!669831))

(declare-fun m!669833 () Bool)

(assert (=> d!98053 m!669833))

(declare-fun m!669835 () Bool)

(assert (=> b!713004 m!669835))

(assert (=> b!712729 d!98053))

(declare-fun d!98055 () Bool)

(declare-fun lt!318639 () Bool)

(assert (=> d!98055 (= lt!318639 (set.member k!2824 (content!362 acc!652)))))

(declare-fun e!401006 () Bool)

(assert (=> d!98055 (= lt!318639 e!401006)))

(declare-fun res!476150 () Bool)

(assert (=> d!98055 (=> (not res!476150) (not e!401006))))

(assert (=> d!98055 (= res!476150 (is-Cons!13396 acc!652))))

(assert (=> d!98055 (= (contains!3977 acc!652 k!2824) lt!318639)))

(declare-fun b!713005 () Bool)

(declare-fun e!401005 () Bool)

(assert (=> b!713005 (= e!401006 e!401005)))

(declare-fun res!476149 () Bool)

(assert (=> b!713005 (=> res!476149 e!401005)))

(assert (=> b!713005 (= res!476149 (= (h!14441 acc!652) k!2824))))

(declare-fun b!713006 () Bool)

(assert (=> b!713006 (= e!401005 (contains!3977 (t!19712 acc!652) k!2824))))

(assert (= (and d!98055 res!476150) b!713005))

(assert (= (and b!713005 (not res!476149)) b!713006))

(declare-fun m!669837 () Bool)

(assert (=> d!98055 m!669837))

(declare-fun m!669839 () Bool)

(assert (=> d!98055 m!669839))

(declare-fun m!669841 () Bool)

(assert (=> b!713006 m!669841))

(assert (=> b!712730 d!98055))

(declare-fun d!98057 () Bool)

(declare-fun lt!318642 () Bool)

(assert (=> d!98057 (= lt!318642 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!362 lt!318605)))))

(declare-fun e!401008 () Bool)

(assert (=> d!98057 (= lt!318642 e!401008)))

(declare-fun res!476152 () Bool)

(assert (=> d!98057 (=> (not res!476152) (not e!401008))))

(assert (=> d!98057 (= res!476152 (is-Cons!13396 lt!318605))))

(assert (=> d!98057 (= (contains!3977 lt!318605 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318642)))

(declare-fun b!713007 () Bool)

(declare-fun e!401007 () Bool)

(assert (=> b!713007 (= e!401008 e!401007)))

(declare-fun res!476151 () Bool)

(assert (=> b!713007 (=> res!476151 e!401007)))

(assert (=> b!713007 (= res!476151 (= (h!14441 lt!318605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713008 () Bool)

(assert (=> b!713008 (= e!401007 (contains!3977 (t!19712 lt!318605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98057 res!476152) b!713007))

(assert (= (and b!713007 (not res!476151)) b!713008))

(assert (=> d!98057 m!669777))

(declare-fun m!669843 () Bool)

(assert (=> d!98057 m!669843))

(declare-fun m!669845 () Bool)

(assert (=> b!713008 m!669845))

(assert (=> b!712731 d!98057))

(declare-fun d!98059 () Bool)

(declare-fun res!476175 () Bool)

(declare-fun e!401033 () Bool)

(assert (=> d!98059 (=> res!476175 e!401033)))

(assert (=> d!98059 (= res!476175 (is-Nil!13397 acc!652))))

(assert (=> d!98059 (= (noDuplicate!1224 acc!652) e!401033)))

(declare-fun b!713035 () Bool)

(declare-fun e!401034 () Bool)

(assert (=> b!713035 (= e!401033 e!401034)))

(declare-fun res!476176 () Bool)

(assert (=> b!713035 (=> (not res!476176) (not e!401034))))

(assert (=> b!713035 (= res!476176 (not (contains!3977 (t!19712 acc!652) (h!14441 acc!652))))))

(declare-fun b!713036 () Bool)

(assert (=> b!713036 (= e!401034 (noDuplicate!1224 (t!19712 acc!652)))))

(assert (= (and d!98059 (not res!476175)) b!713035))

(assert (= (and b!713035 res!476176) b!713036))

(declare-fun m!669865 () Bool)

(assert (=> b!713035 m!669865))

(declare-fun m!669869 () Bool)

(assert (=> b!713036 m!669869))

(assert (=> b!712710 d!98059))

(declare-fun b!713074 () Bool)

(declare-fun e!401064 () Bool)

(declare-fun call!34579 () Bool)

(assert (=> b!713074 (= e!401064 call!34579)))

(declare-fun d!98069 () Bool)

(declare-fun res!476200 () Bool)

(declare-fun e!401065 () Bool)

(assert (=> d!98069 (=> res!476200 e!401065)))

(assert (=> d!98069 (= res!476200 (bvsge from!2969 (size!19767 a!3591)))))

(assert (=> d!98069 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!401065)))

(declare-fun b!713075 () Bool)

(assert (=> b!713075 (= e!401064 call!34579)))

(declare-fun bm!34576 () Bool)

(declare-fun c!78805 () Bool)

(assert (=> bm!34576 (= call!34579 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78805 (Cons!13396 (select (arr!19359 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!713076 () Bool)

(declare-fun e!401067 () Bool)

(assert (=> b!713076 (= e!401067 (contains!3977 newAcc!49 (select (arr!19359 a!3591) from!2969)))))

(declare-fun b!713077 () Bool)

(declare-fun e!401066 () Bool)

(assert (=> b!713077 (= e!401065 e!401066)))

(declare-fun res!476198 () Bool)

(assert (=> b!713077 (=> (not res!476198) (not e!401066))))

(assert (=> b!713077 (= res!476198 (not e!401067))))

(declare-fun res!476199 () Bool)

(assert (=> b!713077 (=> (not res!476199) (not e!401067))))

(assert (=> b!713077 (= res!476199 (validKeyInArray!0 (select (arr!19359 a!3591) from!2969)))))

(declare-fun b!713078 () Bool)

(assert (=> b!713078 (= e!401066 e!401064)))

(assert (=> b!713078 (= c!78805 (validKeyInArray!0 (select (arr!19359 a!3591) from!2969)))))

(assert (= (and d!98069 (not res!476200)) b!713077))

(assert (= (and b!713077 res!476199) b!713076))

(assert (= (and b!713077 res!476198) b!713078))

(assert (= (and b!713078 c!78805) b!713074))

(assert (= (and b!713078 (not c!78805)) b!713075))

(assert (= (or b!713074 b!713075) bm!34576))

(assert (=> bm!34576 m!669565))

(declare-fun m!669897 () Bool)

(assert (=> bm!34576 m!669897))

(assert (=> b!713076 m!669565))

(assert (=> b!713076 m!669565))

(declare-fun m!669901 () Bool)

(assert (=> b!713076 m!669901))

(assert (=> b!713077 m!669565))

(assert (=> b!713077 m!669565))

(assert (=> b!713077 m!669567))

(assert (=> b!713078 m!669565))

(assert (=> b!713078 m!669565))

(assert (=> b!713078 m!669567))

(assert (=> b!712711 d!98069))

(declare-fun b!713084 () Bool)

(declare-fun e!401072 () Bool)

(declare-fun call!34581 () Bool)

(assert (=> b!713084 (= e!401072 call!34581)))

(declare-fun d!98085 () Bool)

(declare-fun res!476206 () Bool)

(declare-fun e!401073 () Bool)

(assert (=> d!98085 (=> res!476206 e!401073)))

(assert (=> d!98085 (= res!476206 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19767 a!3591)))))

(assert (=> d!98085 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318603) e!401073)))

(declare-fun b!713085 () Bool)

(assert (=> b!713085 (= e!401072 call!34581)))

(declare-fun bm!34578 () Bool)

(declare-fun c!78807 () Bool)

(assert (=> bm!34578 (= call!34581 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78807 (Cons!13396 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318603) lt!318603)))))

(declare-fun b!713086 () Bool)

(declare-fun e!401075 () Bool)

(assert (=> b!713086 (= e!401075 (contains!3977 lt!318603 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713087 () Bool)

(declare-fun e!401074 () Bool)

(assert (=> b!713087 (= e!401073 e!401074)))

(declare-fun res!476204 () Bool)

(assert (=> b!713087 (=> (not res!476204) (not e!401074))))

(assert (=> b!713087 (= res!476204 (not e!401075))))

(declare-fun res!476205 () Bool)

(assert (=> b!713087 (=> (not res!476205) (not e!401075))))

(assert (=> b!713087 (= res!476205 (validKeyInArray!0 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713089 () Bool)

(assert (=> b!713089 (= e!401074 e!401072)))

(assert (=> b!713089 (= c!78807 (validKeyInArray!0 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!98085 (not res!476206)) b!713087))

(assert (= (and b!713087 res!476205) b!713086))

(assert (= (and b!713087 res!476204) b!713089))

(assert (= (and b!713089 c!78807) b!713084))

(assert (= (and b!713089 (not c!78807)) b!713085))

(assert (= (or b!713084 b!713085) bm!34578))

(declare-fun m!669911 () Bool)

(assert (=> bm!34578 m!669911))

(declare-fun m!669913 () Bool)

(assert (=> bm!34578 m!669913))

(assert (=> b!713086 m!669911))

(assert (=> b!713086 m!669911))

(declare-fun m!669915 () Bool)

(assert (=> b!713086 m!669915))

(assert (=> b!713087 m!669911))

(assert (=> b!713087 m!669911))

(declare-fun m!669921 () Bool)

(assert (=> b!713087 m!669921))

(assert (=> b!713089 m!669911))

(assert (=> b!713089 m!669911))

(assert (=> b!713089 m!669921))

(assert (=> b!712711 d!98085))

(declare-fun d!98095 () Bool)

(assert (=> d!98095 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318603)))

(declare-fun lt!318657 () Unit!24630)

(declare-fun choose!66 (array!40435 (_ BitVec 64) (_ BitVec 32) List!13400 List!13400) Unit!24630)

(assert (=> d!98095 (= lt!318657 (choose!66 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318605 lt!318603))))

(assert (=> d!98095 (bvslt (size!19767 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98095 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318605 lt!318603) lt!318657)))

(declare-fun bs!20558 () Bool)

(assert (= bs!20558 d!98095))

(assert (=> bs!20558 m!669605))

(declare-fun m!669953 () Bool)

(assert (=> bs!20558 m!669953))

(assert (=> b!712711 d!98095))

(declare-fun d!98113 () Bool)

(declare-fun lt!318658 () Bool)

(assert (=> d!98113 (= lt!318658 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!362 lt!318603)))))

(declare-fun e!401104 () Bool)

(assert (=> d!98113 (= lt!318658 e!401104)))

(declare-fun res!476230 () Bool)

(assert (=> d!98113 (=> (not res!476230) (not e!401104))))

(assert (=> d!98113 (= res!476230 (is-Cons!13396 lt!318603))))

(assert (=> d!98113 (= (contains!3977 lt!318603 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318658)))

(declare-fun b!713121 () Bool)

(declare-fun e!401103 () Bool)

(assert (=> b!713121 (= e!401104 e!401103)))

(declare-fun res!476229 () Bool)

(assert (=> b!713121 (=> res!476229 e!401103)))

(assert (=> b!713121 (= res!476229 (= (h!14441 lt!318603) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713122 () Bool)

(assert (=> b!713122 (= e!401103 (contains!3977 (t!19712 lt!318603) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98113 res!476230) b!713121))

(assert (= (and b!713121 (not res!476229)) b!713122))

(declare-fun m!669955 () Bool)

(assert (=> d!98113 m!669955))

(declare-fun m!669957 () Bool)

(assert (=> d!98113 m!669957))

(declare-fun m!669959 () Bool)

(assert (=> b!713122 m!669959))

(assert (=> b!712732 d!98113))

(declare-fun b!713123 () Bool)

(declare-fun e!401105 () Bool)

(declare-fun call!34586 () Bool)

(assert (=> b!713123 (= e!401105 call!34586)))

(declare-fun d!98115 () Bool)

(declare-fun res!476233 () Bool)

(declare-fun e!401106 () Bool)

(assert (=> d!98115 (=> res!476233 e!401106)))

(assert (=> d!98115 (= res!476233 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19767 a!3591)))))

(assert (=> d!98115 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318605) e!401106)))

(declare-fun b!713124 () Bool)

(assert (=> b!713124 (= e!401105 call!34586)))

(declare-fun c!78813 () Bool)

(declare-fun bm!34583 () Bool)

(assert (=> bm!34583 (= call!34586 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78813 (Cons!13396 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318605) lt!318605)))))

(declare-fun b!713125 () Bool)

(declare-fun e!401108 () Bool)

(assert (=> b!713125 (= e!401108 (contains!3977 lt!318605 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713126 () Bool)

(declare-fun e!401107 () Bool)

(assert (=> b!713126 (= e!401106 e!401107)))

(declare-fun res!476231 () Bool)

(assert (=> b!713126 (=> (not res!476231) (not e!401107))))

(assert (=> b!713126 (= res!476231 (not e!401108))))

(declare-fun res!476232 () Bool)

(assert (=> b!713126 (=> (not res!476232) (not e!401108))))

(assert (=> b!713126 (= res!476232 (validKeyInArray!0 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713127 () Bool)

(assert (=> b!713127 (= e!401107 e!401105)))

(assert (=> b!713127 (= c!78813 (validKeyInArray!0 (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!98115 (not res!476233)) b!713126))

(assert (= (and b!713126 res!476232) b!713125))

(assert (= (and b!713126 res!476231) b!713127))

(assert (= (and b!713127 c!78813) b!713123))

(assert (= (and b!713127 (not c!78813)) b!713124))

(assert (= (or b!713123 b!713124) bm!34583))

(assert (=> bm!34583 m!669911))

(declare-fun m!669965 () Bool)

(assert (=> bm!34583 m!669965))

(assert (=> b!713125 m!669911))

(assert (=> b!713125 m!669911))

(declare-fun m!669971 () Bool)

(assert (=> b!713125 m!669971))

(assert (=> b!713126 m!669911))

(assert (=> b!713126 m!669911))

(assert (=> b!713126 m!669921))

(assert (=> b!713127 m!669911))

(assert (=> b!713127 m!669911))

(assert (=> b!713127 m!669921))

(assert (=> b!712733 d!98115))

(declare-fun lt!318670 () List!13400)

(declare-fun b!713182 () Bool)

(declare-fun e!401160 () Bool)

(assert (=> b!713182 (= e!401160 (= (content!362 lt!318670) (set.minus (content!362 lt!318603) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!713183 () Bool)

(declare-fun e!401161 () List!13400)

(assert (=> b!713183 (= e!401161 Nil!13397)))

(declare-fun b!713184 () Bool)

(declare-fun e!401162 () List!13400)

(assert (=> b!713184 (= e!401161 e!401162)))

(declare-fun c!78819 () Bool)

(assert (=> b!713184 (= c!78819 (= k!2824 (h!14441 lt!318603)))))

(declare-fun b!713185 () Bool)

(declare-fun call!34589 () List!13400)

(assert (=> b!713185 (= e!401162 (Cons!13396 (h!14441 lt!318603) call!34589))))

(declare-fun d!98125 () Bool)

(assert (=> d!98125 e!401160))

(declare-fun res!476280 () Bool)

(assert (=> d!98125 (=> (not res!476280) (not e!401160))))

(declare-fun size!19772 (List!13400) Int)

(assert (=> d!98125 (= res!476280 (<= (size!19772 lt!318670) (size!19772 lt!318603)))))

(assert (=> d!98125 (= lt!318670 e!401161)))

(declare-fun c!78818 () Bool)

(assert (=> d!98125 (= c!78818 (is-Cons!13396 lt!318603))))

(assert (=> d!98125 (= (-!387 lt!318603 k!2824) lt!318670)))

(declare-fun bm!34586 () Bool)

(assert (=> bm!34586 (= call!34589 (-!387 (t!19712 lt!318603) k!2824))))

(declare-fun b!713186 () Bool)

(assert (=> b!713186 (= e!401162 call!34589)))

(assert (= (and d!98125 c!78818) b!713184))

(assert (= (and d!98125 (not c!78818)) b!713183))

(assert (= (and b!713184 c!78819) b!713186))

(assert (= (and b!713184 (not c!78819)) b!713185))

(assert (= (or b!713186 b!713185) bm!34586))

(assert (= (and d!98125 res!476280) b!713182))

(declare-fun m!670027 () Bool)

(assert (=> b!713182 m!670027))

(assert (=> b!713182 m!669955))

(declare-fun m!670029 () Bool)

(assert (=> b!713182 m!670029))

(declare-fun m!670031 () Bool)

(assert (=> d!98125 m!670031))

(declare-fun m!670033 () Bool)

(assert (=> d!98125 m!670033))

(declare-fun m!670035 () Bool)

(assert (=> bm!34586 m!670035))

(assert (=> b!712712 d!98125))

(declare-fun d!98151 () Bool)

(declare-fun res!476281 () Bool)

(declare-fun e!401163 () Bool)

(assert (=> d!98151 (=> res!476281 e!401163)))

(assert (=> d!98151 (= res!476281 (is-Nil!13397 newAcc!49))))

(assert (=> d!98151 (= (noDuplicate!1224 newAcc!49) e!401163)))

(declare-fun b!713187 () Bool)

(declare-fun e!401164 () Bool)

(assert (=> b!713187 (= e!401163 e!401164)))

(declare-fun res!476282 () Bool)

(assert (=> b!713187 (=> (not res!476282) (not e!401164))))

(assert (=> b!713187 (= res!476282 (not (contains!3977 (t!19712 newAcc!49) (h!14441 newAcc!49))))))

(declare-fun b!713188 () Bool)

(assert (=> b!713188 (= e!401164 (noDuplicate!1224 (t!19712 newAcc!49)))))

(assert (= (and d!98151 (not res!476281)) b!713187))

(assert (= (and b!713187 res!476282) b!713188))

(declare-fun m!670037 () Bool)

(assert (=> b!713187 m!670037))

(declare-fun m!670039 () Bool)

(assert (=> b!713188 m!670039))

(assert (=> b!712713 d!98151))

(declare-fun d!98155 () Bool)

(declare-fun res!476299 () Bool)

(declare-fun e!401181 () Bool)

(assert (=> d!98155 (=> res!476299 e!401181)))

(assert (=> d!98155 (= res!476299 (= (select (arr!19359 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!98155 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401181)))

(declare-fun b!713205 () Bool)

(declare-fun e!401182 () Bool)

(assert (=> b!713205 (= e!401181 e!401182)))

(declare-fun res!476300 () Bool)

(assert (=> b!713205 (=> (not res!476300) (not e!401182))))

(assert (=> b!713205 (= res!476300 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19767 a!3591)))))

(declare-fun b!713206 () Bool)

(assert (=> b!713206 (= e!401182 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98155 (not res!476299)) b!713205))

(assert (= (and b!713205 res!476300) b!713206))

(assert (=> d!98155 m!669911))

(declare-fun m!670065 () Bool)

(assert (=> b!713206 m!670065))

(assert (=> b!712734 d!98155))

(declare-fun b!713212 () Bool)

(declare-fun e!401187 () Bool)

(declare-fun call!34591 () Bool)

(assert (=> b!713212 (= e!401187 call!34591)))

(declare-fun d!98171 () Bool)

(declare-fun res!476306 () Bool)

(declare-fun e!401188 () Bool)

(assert (=> d!98171 (=> res!476306 e!401188)))

(assert (=> d!98171 (= res!476306 (bvsge from!2969 (size!19767 a!3591)))))

(assert (=> d!98171 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401188)))

(declare-fun b!713213 () Bool)

(assert (=> b!713213 (= e!401187 call!34591)))

(declare-fun c!78821 () Bool)

(declare-fun bm!34588 () Bool)

(assert (=> bm!34588 (= call!34591 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78821 (Cons!13396 (select (arr!19359 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!713214 () Bool)

(declare-fun e!401190 () Bool)

(assert (=> b!713214 (= e!401190 (contains!3977 acc!652 (select (arr!19359 a!3591) from!2969)))))

(declare-fun b!713215 () Bool)

(declare-fun e!401189 () Bool)

(assert (=> b!713215 (= e!401188 e!401189)))

(declare-fun res!476304 () Bool)

(assert (=> b!713215 (=> (not res!476304) (not e!401189))))

(assert (=> b!713215 (= res!476304 (not e!401190))))

(declare-fun res!476305 () Bool)

(assert (=> b!713215 (=> (not res!476305) (not e!401190))))

(assert (=> b!713215 (= res!476305 (validKeyInArray!0 (select (arr!19359 a!3591) from!2969)))))

(declare-fun b!713216 () Bool)

(assert (=> b!713216 (= e!401189 e!401187)))

(assert (=> b!713216 (= c!78821 (validKeyInArray!0 (select (arr!19359 a!3591) from!2969)))))

(assert (= (and d!98171 (not res!476306)) b!713215))

(assert (= (and b!713215 res!476305) b!713214))

(assert (= (and b!713215 res!476304) b!713216))

(assert (= (and b!713216 c!78821) b!713212))

(assert (= (and b!713216 (not c!78821)) b!713213))

(assert (= (or b!713212 b!713213) bm!34588))

(assert (=> bm!34588 m!669565))

(declare-fun m!670071 () Bool)

(assert (=> bm!34588 m!670071))

(assert (=> b!713214 m!669565))

(assert (=> b!713214 m!669565))

(declare-fun m!670073 () Bool)

(assert (=> b!713214 m!670073))

(assert (=> b!713215 m!669565))

(assert (=> b!713215 m!669565))

(assert (=> b!713215 m!669567))

(assert (=> b!713216 m!669565))

(assert (=> b!713216 m!669565))

(assert (=> b!713216 m!669567))

(assert (=> b!712735 d!98171))

(declare-fun b!713222 () Bool)

(declare-fun e!401195 () Bool)

(declare-fun lt!318676 () List!13400)

(assert (=> b!713222 (= e!401195 (= (content!362 lt!318676) (set.minus (content!362 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!713223 () Bool)

(declare-fun e!401196 () List!13400)

(assert (=> b!713223 (= e!401196 Nil!13397)))

(declare-fun b!713224 () Bool)

(declare-fun e!401197 () List!13400)

(assert (=> b!713224 (= e!401196 e!401197)))

(declare-fun c!78824 () Bool)

(assert (=> b!713224 (= c!78824 (= k!2824 (h!14441 newAcc!49)))))

(declare-fun b!713225 () Bool)

(declare-fun call!34593 () List!13400)

(assert (=> b!713225 (= e!401197 (Cons!13396 (h!14441 newAcc!49) call!34593))))

(declare-fun d!98175 () Bool)

(assert (=> d!98175 e!401195))

(declare-fun res!476310 () Bool)

(assert (=> d!98175 (=> (not res!476310) (not e!401195))))

(assert (=> d!98175 (= res!476310 (<= (size!19772 lt!318676) (size!19772 newAcc!49)))))

(assert (=> d!98175 (= lt!318676 e!401196)))

(declare-fun c!78823 () Bool)

(assert (=> d!98175 (= c!78823 (is-Cons!13396 newAcc!49))))

(assert (=> d!98175 (= (-!387 newAcc!49 k!2824) lt!318676)))

(declare-fun bm!34590 () Bool)

(assert (=> bm!34590 (= call!34593 (-!387 (t!19712 newAcc!49) k!2824))))

(declare-fun b!713226 () Bool)

(assert (=> b!713226 (= e!401197 call!34593)))

(assert (= (and d!98175 c!78823) b!713224))

(assert (= (and d!98175 (not c!78823)) b!713223))

(assert (= (and b!713224 c!78824) b!713226))

(assert (= (and b!713224 (not c!78824)) b!713225))

(assert (= (or b!713226 b!713225) bm!34590))

(assert (= (and d!98175 res!476310) b!713222))

(declare-fun m!670079 () Bool)

(assert (=> b!713222 m!670079))

(assert (=> b!713222 m!669831))

(assert (=> b!713222 m!670029))

(declare-fun m!670081 () Bool)

(assert (=> d!98175 m!670081))

(declare-fun m!670083 () Bool)

(assert (=> d!98175 m!670083))

(declare-fun m!670085 () Bool)

(assert (=> bm!34590 m!670085))

(assert (=> b!712714 d!98175))

(declare-fun d!98179 () Bool)

(declare-fun lt!318677 () Bool)

(assert (=> d!98179 (= lt!318677 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!362 acc!652)))))

(declare-fun e!401199 () Bool)

(assert (=> d!98179 (= lt!318677 e!401199)))

(declare-fun res!476312 () Bool)

(assert (=> d!98179 (=> (not res!476312) (not e!401199))))

(assert (=> d!98179 (= res!476312 (is-Cons!13396 acc!652))))

(assert (=> d!98179 (= (contains!3977 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318677)))

(declare-fun b!713227 () Bool)

(declare-fun e!401198 () Bool)

(assert (=> b!713227 (= e!401199 e!401198)))

(declare-fun res!476311 () Bool)

(assert (=> b!713227 (=> res!476311 e!401198)))

(assert (=> b!713227 (= res!476311 (= (h!14441 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713228 () Bool)

(assert (=> b!713228 (= e!401198 (contains!3977 (t!19712 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98179 res!476312) b!713227))

(assert (= (and b!713227 (not res!476311)) b!713228))

(assert (=> d!98179 m!669837))

(declare-fun m!670087 () Bool)

(assert (=> d!98179 m!670087))

(declare-fun m!670089 () Bool)

(assert (=> b!713228 m!670089))

(assert (=> b!712715 d!98179))

(declare-fun d!98181 () Bool)

(declare-fun lt!318678 () Bool)

(assert (=> d!98181 (= lt!318678 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!362 acc!652)))))

(declare-fun e!401201 () Bool)

(assert (=> d!98181 (= lt!318678 e!401201)))

(declare-fun res!476314 () Bool)

(assert (=> d!98181 (=> (not res!476314) (not e!401201))))

(assert (=> d!98181 (= res!476314 (is-Cons!13396 acc!652))))

(assert (=> d!98181 (= (contains!3977 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318678)))

(declare-fun b!713229 () Bool)

(declare-fun e!401200 () Bool)

(assert (=> b!713229 (= e!401201 e!401200)))

(declare-fun res!476313 () Bool)

(assert (=> b!713229 (=> res!476313 e!401200)))

(assert (=> b!713229 (= res!476313 (= (h!14441 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713230 () Bool)

(assert (=> b!713230 (= e!401200 (contains!3977 (t!19712 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98181 res!476314) b!713229))

(assert (= (and b!713229 (not res!476313)) b!713230))

(assert (=> d!98181 m!669837))

(declare-fun m!670091 () Bool)

(assert (=> d!98181 m!670091))

(declare-fun m!670093 () Bool)

(assert (=> b!713230 m!670093))

(assert (=> b!712736 d!98181))

(declare-fun d!98183 () Bool)

(declare-fun lt!318679 () Bool)

(assert (=> d!98183 (= lt!318679 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!362 newAcc!49)))))

(declare-fun e!401203 () Bool)

(assert (=> d!98183 (= lt!318679 e!401203)))

(declare-fun res!476316 () Bool)

(assert (=> d!98183 (=> (not res!476316) (not e!401203))))

(assert (=> d!98183 (= res!476316 (is-Cons!13396 newAcc!49))))

(assert (=> d!98183 (= (contains!3977 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318679)))

(declare-fun b!713231 () Bool)

(declare-fun e!401202 () Bool)

(assert (=> b!713231 (= e!401203 e!401202)))

(declare-fun res!476315 () Bool)

(assert (=> b!713231 (=> res!476315 e!401202)))

(assert (=> b!713231 (= res!476315 (= (h!14441 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713232 () Bool)

(assert (=> b!713232 (= e!401202 (contains!3977 (t!19712 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98183 res!476316) b!713231))

(assert (= (and b!713231 (not res!476315)) b!713232))

(assert (=> d!98183 m!669831))

(declare-fun m!670095 () Bool)

(assert (=> d!98183 m!670095))

(declare-fun m!670097 () Bool)

(assert (=> b!713232 m!670097))

(assert (=> b!712737 d!98183))

(declare-fun d!98185 () Bool)

(assert (=> d!98185 (= (validKeyInArray!0 (select (arr!19359 a!3591) from!2969)) (and (not (= (select (arr!19359 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19359 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712716 d!98185))

(declare-fun d!98187 () Bool)

(declare-fun lt!318680 () Bool)

(assert (=> d!98187 (= lt!318680 (set.member k!2824 (content!362 lt!318603)))))

(declare-fun e!401205 () Bool)

(assert (=> d!98187 (= lt!318680 e!401205)))

(declare-fun res!476318 () Bool)

(assert (=> d!98187 (=> (not res!476318) (not e!401205))))

(assert (=> d!98187 (= res!476318 (is-Cons!13396 lt!318603))))

(assert (=> d!98187 (= (contains!3977 lt!318603 k!2824) lt!318680)))

(declare-fun b!713233 () Bool)

(declare-fun e!401204 () Bool)

(assert (=> b!713233 (= e!401205 e!401204)))

(declare-fun res!476317 () Bool)

(assert (=> b!713233 (=> res!476317 e!401204)))

(assert (=> b!713233 (= res!476317 (= (h!14441 lt!318603) k!2824))))

(declare-fun b!713234 () Bool)

(assert (=> b!713234 (= e!401204 (contains!3977 (t!19712 lt!318603) k!2824))))

(assert (= (and d!98187 res!476318) b!713233))

(assert (= (and b!713233 (not res!476317)) b!713234))

(assert (=> d!98187 m!669955))

(declare-fun m!670099 () Bool)

(assert (=> d!98187 m!670099))

(declare-fun m!670101 () Bool)

(assert (=> b!713234 m!670101))

(assert (=> b!712717 d!98187))

(declare-fun d!98189 () Bool)

(declare-fun lt!318681 () Bool)

(assert (=> d!98189 (= lt!318681 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!362 lt!318605)))))

(declare-fun e!401207 () Bool)

(assert (=> d!98189 (= lt!318681 e!401207)))

(declare-fun res!476320 () Bool)

(assert (=> d!98189 (=> (not res!476320) (not e!401207))))

(assert (=> d!98189 (= res!476320 (is-Cons!13396 lt!318605))))

(assert (=> d!98189 (= (contains!3977 lt!318605 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318681)))

(declare-fun b!713235 () Bool)

(declare-fun e!401206 () Bool)

(assert (=> b!713235 (= e!401207 e!401206)))

(declare-fun res!476319 () Bool)

(assert (=> b!713235 (=> res!476319 e!401206)))

(assert (=> b!713235 (= res!476319 (= (h!14441 lt!318605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713236 () Bool)

(assert (=> b!713236 (= e!401206 (contains!3977 (t!19712 lt!318605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98189 res!476320) b!713235))

(assert (= (and b!713235 (not res!476319)) b!713236))

(assert (=> d!98189 m!669777))

(declare-fun m!670103 () Bool)

(assert (=> d!98189 m!670103))

(declare-fun m!670105 () Bool)

(assert (=> b!713236 m!670105))

(assert (=> b!712738 d!98189))

(declare-fun d!98191 () Bool)

(assert (=> d!98191 (= (array_inv!15155 a!3591) (bvsge (size!19767 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63274 d!98191))

(declare-fun d!98193 () Bool)

(declare-fun res!476321 () Bool)

(declare-fun e!401208 () Bool)

(assert (=> d!98193 (=> res!476321 e!401208)))

(assert (=> d!98193 (= res!476321 (is-Nil!13397 lt!318603))))

(assert (=> d!98193 (= (noDuplicate!1224 lt!318603) e!401208)))

(declare-fun b!713237 () Bool)

(declare-fun e!401209 () Bool)

(assert (=> b!713237 (= e!401208 e!401209)))

(declare-fun res!476322 () Bool)

(assert (=> b!713237 (=> (not res!476322) (not e!401209))))

(assert (=> b!713237 (= res!476322 (not (contains!3977 (t!19712 lt!318603) (h!14441 lt!318603))))))

(declare-fun b!713238 () Bool)

(assert (=> b!713238 (= e!401209 (noDuplicate!1224 (t!19712 lt!318603)))))

(assert (= (and d!98193 (not res!476321)) b!713237))

(assert (= (and b!713237 res!476322) b!713238))

(declare-fun m!670109 () Bool)

(assert (=> b!713237 m!670109))

(declare-fun m!670111 () Bool)

(assert (=> b!713238 m!670111))

(assert (=> b!712718 d!98193))

(declare-fun d!98199 () Bool)

(declare-fun lt!318685 () Bool)

(assert (=> d!98199 (= lt!318685 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!362 newAcc!49)))))

(declare-fun e!401215 () Bool)

(assert (=> d!98199 (= lt!318685 e!401215)))

(declare-fun res!476328 () Bool)

(assert (=> d!98199 (=> (not res!476328) (not e!401215))))

(assert (=> d!98199 (= res!476328 (is-Cons!13396 newAcc!49))))

(assert (=> d!98199 (= (contains!3977 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318685)))

(declare-fun b!713243 () Bool)

(declare-fun e!401214 () Bool)

(assert (=> b!713243 (= e!401215 e!401214)))

(declare-fun res!476327 () Bool)

(assert (=> b!713243 (=> res!476327 e!401214)))

(assert (=> b!713243 (= res!476327 (= (h!14441 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713244 () Bool)

(assert (=> b!713244 (= e!401214 (contains!3977 (t!19712 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98199 res!476328) b!713243))

(assert (= (and b!713243 (not res!476327)) b!713244))

(assert (=> d!98199 m!669831))

(declare-fun m!670113 () Bool)

(assert (=> d!98199 m!670113))

(declare-fun m!670117 () Bool)

(assert (=> b!713244 m!670117))

(assert (=> b!712719 d!98199))

(declare-fun d!98201 () Bool)

(assert (=> d!98201 (= ($colon$colon!533 newAcc!49 (select (arr!19359 a!3591) from!2969)) (Cons!13396 (select (arr!19359 a!3591) from!2969) newAcc!49))))

(assert (=> b!712721 d!98201))

(declare-fun d!98203 () Bool)

(assert (=> d!98203 (= ($colon$colon!533 acc!652 (select (arr!19359 a!3591) from!2969)) (Cons!13396 (select (arr!19359 a!3591) from!2969) acc!652))))

(assert (=> b!712721 d!98203))

(declare-fun d!98205 () Bool)

(declare-fun res!476329 () Bool)

(declare-fun e!401216 () Bool)

(assert (=> d!98205 (=> res!476329 e!401216)))

(assert (=> d!98205 (= res!476329 (= (select (arr!19359 a!3591) from!2969) k!2824))))

(assert (=> d!98205 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!401216)))

(declare-fun b!713245 () Bool)

(declare-fun e!401217 () Bool)

(assert (=> b!713245 (= e!401216 e!401217)))

(declare-fun res!476330 () Bool)

(assert (=> b!713245 (=> (not res!476330) (not e!401217))))

(assert (=> b!713245 (= res!476330 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19767 a!3591)))))

(declare-fun b!713246 () Bool)

(assert (=> b!713246 (= e!401217 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98205 (not res!476329)) b!713245))

(assert (= (and b!713245 res!476330) b!713246))

(assert (=> d!98205 m!669565))

(declare-fun m!670121 () Bool)

(assert (=> b!713246 m!670121))

(assert (=> b!712722 d!98205))

(declare-fun b!713250 () Bool)

(declare-fun e!401219 () Bool)

(assert (=> b!713250 (= e!401219 (subseq!422 acc!652 (t!19712 newAcc!49)))))

(declare-fun b!713248 () Bool)

(declare-fun e!401218 () Bool)

(assert (=> b!713248 (= e!401218 e!401219)))

(declare-fun res!476332 () Bool)

(assert (=> b!713248 (=> res!476332 e!401219)))

(declare-fun e!401221 () Bool)

(assert (=> b!713248 (= res!476332 e!401221)))

(declare-fun res!476331 () Bool)

(assert (=> b!713248 (=> (not res!476331) (not e!401221))))

(assert (=> b!713248 (= res!476331 (= (h!14441 acc!652) (h!14441 newAcc!49)))))

(declare-fun d!98207 () Bool)

(declare-fun res!476334 () Bool)

(declare-fun e!401220 () Bool)

(assert (=> d!98207 (=> res!476334 e!401220)))

(assert (=> d!98207 (= res!476334 (is-Nil!13397 acc!652))))

(assert (=> d!98207 (= (subseq!422 acc!652 newAcc!49) e!401220)))

(declare-fun b!713249 () Bool)

(assert (=> b!713249 (= e!401221 (subseq!422 (t!19712 acc!652) (t!19712 newAcc!49)))))

(declare-fun b!713247 () Bool)

(assert (=> b!713247 (= e!401220 e!401218)))

(declare-fun res!476333 () Bool)

(assert (=> b!713247 (=> (not res!476333) (not e!401218))))

(assert (=> b!713247 (= res!476333 (is-Cons!13396 newAcc!49))))

(assert (= (and d!98207 (not res!476334)) b!713247))

(assert (= (and b!713247 res!476333) b!713248))

(assert (= (and b!713248 res!476331) b!713249))

(assert (= (and b!713248 (not res!476332)) b!713250))

(declare-fun m!670123 () Bool)

(assert (=> b!713250 m!670123))

(declare-fun m!670125 () Bool)

(assert (=> b!713249 m!670125))

(assert (=> b!712723 d!98207))

(declare-fun d!98209 () Bool)

(declare-fun res!476335 () Bool)

(declare-fun e!401222 () Bool)

(assert (=> d!98209 (=> res!476335 e!401222)))

(assert (=> d!98209 (= res!476335 (is-Nil!13397 lt!318605))))

(assert (=> d!98209 (= (noDuplicate!1224 lt!318605) e!401222)))

(declare-fun b!713251 () Bool)

(declare-fun e!401223 () Bool)

(assert (=> b!713251 (= e!401222 e!401223)))

(declare-fun res!476336 () Bool)

(assert (=> b!713251 (=> (not res!476336) (not e!401223))))

(assert (=> b!713251 (= res!476336 (not (contains!3977 (t!19712 lt!318605) (h!14441 lt!318605))))))

(declare-fun b!713252 () Bool)

(assert (=> b!713252 (= e!401223 (noDuplicate!1224 (t!19712 lt!318605)))))

(assert (= (and d!98209 (not res!476335)) b!713251))

(assert (= (and b!713251 res!476336) b!713252))

(declare-fun m!670127 () Bool)

(assert (=> b!713251 m!670127))

(declare-fun m!670129 () Bool)

(assert (=> b!713252 m!670129))

(assert (=> b!712724 d!98209))

(declare-fun d!98211 () Bool)

(declare-fun lt!318686 () Bool)

(assert (=> d!98211 (= lt!318686 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!362 lt!318603)))))

(declare-fun e!401225 () Bool)

(assert (=> d!98211 (= lt!318686 e!401225)))

(declare-fun res!476338 () Bool)

(assert (=> d!98211 (=> (not res!476338) (not e!401225))))

(assert (=> d!98211 (= res!476338 (is-Cons!13396 lt!318603))))

(assert (=> d!98211 (= (contains!3977 lt!318603 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318686)))

(declare-fun b!713253 () Bool)

(declare-fun e!401224 () Bool)

(assert (=> b!713253 (= e!401225 e!401224)))

(declare-fun res!476337 () Bool)

(assert (=> b!713253 (=> res!476337 e!401224)))

(assert (=> b!713253 (= res!476337 (= (h!14441 lt!318603) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713254 () Bool)

(assert (=> b!713254 (= e!401224 (contains!3977 (t!19712 lt!318603) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98211 res!476338) b!713253))

(assert (= (and b!713253 (not res!476337)) b!713254))

(assert (=> d!98211 m!669955))

(declare-fun m!670131 () Bool)

(assert (=> d!98211 m!670131))

(declare-fun m!670133 () Bool)

(assert (=> b!713254 m!670133))

(assert (=> b!712725 d!98211))

(push 1)

