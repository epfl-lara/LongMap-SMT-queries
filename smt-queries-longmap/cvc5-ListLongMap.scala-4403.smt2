; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60578 () Bool)

(assert start!60578)

(declare-fun b!680689 () Bool)

(declare-fun e!387745 () Bool)

(declare-datatypes ((List!12980 0))(
  ( (Nil!12977) (Cons!12976 (h!14021 (_ BitVec 64)) (t!19211 List!12980)) )
))
(declare-fun lt!313132 () List!12980)

(declare-fun contains!3557 (List!12980 (_ BitVec 64)) Bool)

(assert (=> b!680689 (= e!387745 (not (contains!3557 lt!313132 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680691 () Bool)

(declare-fun e!387742 () Bool)

(declare-fun e!387746 () Bool)

(assert (=> b!680691 (= e!387742 e!387746)))

(declare-fun res!446927 () Bool)

(assert (=> b!680691 (=> res!446927 e!387746)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!680691 (= res!446927 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39502 0))(
  ( (array!39503 (arr!18939 (Array (_ BitVec 32) (_ BitVec 64))) (size!19303 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39502)

(declare-fun acc!681 () List!12980)

(declare-fun $colon$colon!308 (List!12980 (_ BitVec 64)) List!12980)

(assert (=> b!680691 (= lt!313132 ($colon$colon!308 acc!681 (select (arr!18939 a!3626) from!3004)))))

(declare-fun subseq!143 (List!12980 List!12980) Bool)

(assert (=> b!680691 (subseq!143 acc!681 acc!681)))

(declare-datatypes ((Unit!23874 0))(
  ( (Unit!23875) )
))
(declare-fun lt!313130 () Unit!23874)

(declare-fun lemmaListSubSeqRefl!0 (List!12980) Unit!23874)

(assert (=> b!680691 (= lt!313130 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680692 () Bool)

(declare-fun e!387747 () Bool)

(declare-fun e!387744 () Bool)

(assert (=> b!680692 (= e!387747 e!387744)))

(declare-fun res!446930 () Bool)

(assert (=> b!680692 (=> (not res!446930) (not e!387744))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680692 (= res!446930 (bvsle from!3004 i!1382))))

(declare-fun b!680693 () Bool)

(declare-fun e!387743 () Bool)

(assert (=> b!680693 (= e!387743 (not e!387742))))

(declare-fun res!446915 () Bool)

(assert (=> b!680693 (=> res!446915 e!387742)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680693 (= res!446915 (not (validKeyInArray!0 (select (arr!18939 a!3626) from!3004))))))

(declare-fun lt!313131 () Unit!23874)

(declare-fun e!387741 () Unit!23874)

(assert (=> b!680693 (= lt!313131 e!387741)))

(declare-fun c!77255 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680693 (= c!77255 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680693 (arrayContainsKey!0 (array!39503 (store (arr!18939 a!3626) i!1382 k!2843) (size!19303 a!3626)) k!2843 from!3004)))

(declare-fun b!680694 () Bool)

(declare-fun res!446918 () Bool)

(assert (=> b!680694 (=> (not res!446918) (not e!387743))))

(declare-fun arrayNoDuplicates!0 (array!39502 (_ BitVec 32) List!12980) Bool)

(assert (=> b!680694 (= res!446918 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12977))))

(declare-fun b!680695 () Bool)

(declare-fun Unit!23876 () Unit!23874)

(assert (=> b!680695 (= e!387741 Unit!23876)))

(declare-fun lt!313129 () Unit!23874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39502 (_ BitVec 64) (_ BitVec 32)) Unit!23874)

(assert (=> b!680695 (= lt!313129 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680695 false))

(declare-fun b!680696 () Bool)

(declare-fun res!446924 () Bool)

(assert (=> b!680696 (=> (not res!446924) (not e!387743))))

(assert (=> b!680696 (= res!446924 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19303 a!3626))))))

(declare-fun b!680697 () Bool)

(declare-fun res!446921 () Bool)

(assert (=> b!680697 (=> (not res!446921) (not e!387743))))

(assert (=> b!680697 (= res!446921 (not (contains!3557 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680698 () Bool)

(declare-fun res!446914 () Bool)

(assert (=> b!680698 (=> (not res!446914) (not e!387743))))

(declare-fun noDuplicate!804 (List!12980) Bool)

(assert (=> b!680698 (= res!446914 (noDuplicate!804 acc!681))))

(declare-fun b!680699 () Bool)

(declare-fun res!446913 () Bool)

(assert (=> b!680699 (=> (not res!446913) (not e!387743))))

(assert (=> b!680699 (= res!446913 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19303 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680700 () Bool)

(declare-fun res!446923 () Bool)

(assert (=> b!680700 (=> (not res!446923) (not e!387743))))

(assert (=> b!680700 (= res!446923 (not (contains!3557 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!446916 () Bool)

(assert (=> start!60578 (=> (not res!446916) (not e!387743))))

(assert (=> start!60578 (= res!446916 (and (bvslt (size!19303 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19303 a!3626))))))

(assert (=> start!60578 e!387743))

(assert (=> start!60578 true))

(declare-fun array_inv!14735 (array!39502) Bool)

(assert (=> start!60578 (array_inv!14735 a!3626)))

(declare-fun b!680690 () Bool)

(declare-fun Unit!23877 () Unit!23874)

(assert (=> b!680690 (= e!387741 Unit!23877)))

(declare-fun b!680701 () Bool)

(assert (=> b!680701 (= e!387744 (not (contains!3557 acc!681 k!2843)))))

(declare-fun b!680702 () Bool)

(assert (=> b!680702 (= e!387746 e!387745)))

(declare-fun res!446920 () Bool)

(assert (=> b!680702 (=> (not res!446920) (not e!387745))))

(assert (=> b!680702 (= res!446920 (not (contains!3557 lt!313132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680703 () Bool)

(declare-fun e!387739 () Bool)

(assert (=> b!680703 (= e!387739 (contains!3557 acc!681 k!2843))))

(declare-fun b!680704 () Bool)

(declare-fun res!446929 () Bool)

(assert (=> b!680704 (=> res!446929 e!387746)))

(assert (=> b!680704 (= res!446929 (not (noDuplicate!804 lt!313132)))))

(declare-fun b!680705 () Bool)

(declare-fun res!446917 () Bool)

(assert (=> b!680705 (=> (not res!446917) (not e!387743))))

(assert (=> b!680705 (= res!446917 (validKeyInArray!0 k!2843))))

(declare-fun b!680706 () Bool)

(declare-fun res!446919 () Bool)

(assert (=> b!680706 (=> (not res!446919) (not e!387743))))

(assert (=> b!680706 (= res!446919 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680707 () Bool)

(declare-fun res!446926 () Bool)

(assert (=> b!680707 (=> (not res!446926) (not e!387743))))

(assert (=> b!680707 (= res!446926 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680708 () Bool)

(declare-fun res!446922 () Bool)

(assert (=> b!680708 (=> (not res!446922) (not e!387743))))

(assert (=> b!680708 (= res!446922 e!387747)))

(declare-fun res!446925 () Bool)

(assert (=> b!680708 (=> res!446925 e!387747)))

(assert (=> b!680708 (= res!446925 e!387739)))

(declare-fun res!446928 () Bool)

(assert (=> b!680708 (=> (not res!446928) (not e!387739))))

(assert (=> b!680708 (= res!446928 (bvsgt from!3004 i!1382))))

(assert (= (and start!60578 res!446916) b!680698))

(assert (= (and b!680698 res!446914) b!680700))

(assert (= (and b!680700 res!446923) b!680697))

(assert (= (and b!680697 res!446921) b!680708))

(assert (= (and b!680708 res!446928) b!680703))

(assert (= (and b!680708 (not res!446925)) b!680692))

(assert (= (and b!680692 res!446930) b!680701))

(assert (= (and b!680708 res!446922) b!680694))

(assert (= (and b!680694 res!446918) b!680706))

(assert (= (and b!680706 res!446919) b!680696))

(assert (= (and b!680696 res!446924) b!680705))

(assert (= (and b!680705 res!446917) b!680707))

(assert (= (and b!680707 res!446926) b!680699))

(assert (= (and b!680699 res!446913) b!680693))

(assert (= (and b!680693 c!77255) b!680695))

(assert (= (and b!680693 (not c!77255)) b!680690))

(assert (= (and b!680693 (not res!446915)) b!680691))

(assert (= (and b!680691 (not res!446927)) b!680704))

(assert (= (and b!680704 (not res!446929)) b!680702))

(assert (= (and b!680702 res!446920) b!680689))

(declare-fun m!645695 () Bool)

(assert (=> b!680697 m!645695))

(declare-fun m!645697 () Bool)

(assert (=> b!680689 m!645697))

(declare-fun m!645699 () Bool)

(assert (=> b!680694 m!645699))

(declare-fun m!645701 () Bool)

(assert (=> b!680704 m!645701))

(declare-fun m!645703 () Bool)

(assert (=> b!680695 m!645703))

(declare-fun m!645705 () Bool)

(assert (=> b!680702 m!645705))

(declare-fun m!645707 () Bool)

(assert (=> b!680691 m!645707))

(assert (=> b!680691 m!645707))

(declare-fun m!645709 () Bool)

(assert (=> b!680691 m!645709))

(declare-fun m!645711 () Bool)

(assert (=> b!680691 m!645711))

(declare-fun m!645713 () Bool)

(assert (=> b!680691 m!645713))

(declare-fun m!645715 () Bool)

(assert (=> b!680705 m!645715))

(declare-fun m!645717 () Bool)

(assert (=> start!60578 m!645717))

(declare-fun m!645719 () Bool)

(assert (=> b!680701 m!645719))

(declare-fun m!645721 () Bool)

(assert (=> b!680707 m!645721))

(assert (=> b!680693 m!645707))

(declare-fun m!645723 () Bool)

(assert (=> b!680693 m!645723))

(declare-fun m!645725 () Bool)

(assert (=> b!680693 m!645725))

(assert (=> b!680693 m!645707))

(declare-fun m!645727 () Bool)

(assert (=> b!680693 m!645727))

(declare-fun m!645729 () Bool)

(assert (=> b!680693 m!645729))

(declare-fun m!645731 () Bool)

(assert (=> b!680700 m!645731))

(declare-fun m!645733 () Bool)

(assert (=> b!680706 m!645733))

(declare-fun m!645735 () Bool)

(assert (=> b!680698 m!645735))

(assert (=> b!680703 m!645719))

(push 1)

(assert (not b!680700))

(assert (not b!680703))

(assert (not b!680705))

(assert (not b!680706))

(assert (not start!60578))

(assert (not b!680702))

(assert (not b!680698))

(assert (not b!680701))

(assert (not b!680704))

(assert (not b!680694))

(assert (not b!680693))

(assert (not b!680707))

(assert (not b!680691))

(assert (not b!680697))

(assert (not b!680695))

(assert (not b!680689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93697 () Bool)

(declare-fun res!447089 () Bool)

(declare-fun e!387852 () Bool)

(assert (=> d!93697 (=> res!447089 e!387852)))

(assert (=> d!93697 (= res!447089 (is-Nil!12977 acc!681))))

(assert (=> d!93697 (= (noDuplicate!804 acc!681) e!387852)))

(declare-fun b!680879 () Bool)

(declare-fun e!387853 () Bool)

(assert (=> b!680879 (= e!387852 e!387853)))

(declare-fun res!447090 () Bool)

(assert (=> b!680879 (=> (not res!447090) (not e!387853))))

(assert (=> b!680879 (= res!447090 (not (contains!3557 (t!19211 acc!681) (h!14021 acc!681))))))

(declare-fun b!680880 () Bool)

(assert (=> b!680880 (= e!387853 (noDuplicate!804 (t!19211 acc!681)))))

(assert (= (and d!93697 (not res!447089)) b!680879))

(assert (= (and b!680879 res!447090) b!680880))

(declare-fun m!645861 () Bool)

(assert (=> b!680879 m!645861))

(declare-fun m!645863 () Bool)

(assert (=> b!680880 m!645863))

(assert (=> b!680698 d!93697))

(declare-fun d!93707 () Bool)

(declare-fun res!447107 () Bool)

(declare-fun e!387870 () Bool)

(assert (=> d!93707 (=> res!447107 e!387870)))

(assert (=> d!93707 (= res!447107 (= (select (arr!18939 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93707 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!387870)))

(declare-fun b!680897 () Bool)

(declare-fun e!387871 () Bool)

(assert (=> b!680897 (= e!387870 e!387871)))

(declare-fun res!447108 () Bool)

(assert (=> b!680897 (=> (not res!447108) (not e!387871))))

(assert (=> b!680897 (= res!447108 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19303 a!3626)))))

(declare-fun b!680898 () Bool)

(assert (=> b!680898 (= e!387871 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93707 (not res!447107)) b!680897))

(assert (= (and b!680897 res!447108) b!680898))

(declare-fun m!645881 () Bool)

(assert (=> d!93707 m!645881))

(declare-fun m!645883 () Bool)

(assert (=> b!680898 m!645883))

(assert (=> b!680707 d!93707))

(declare-fun d!93717 () Bool)

(declare-fun lt!313170 () Bool)

(declare-fun content!272 (List!12980) (Set (_ BitVec 64)))

(assert (=> d!93717 (= lt!313170 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!272 acc!681)))))

(declare-fun e!387893 () Bool)

(assert (=> d!93717 (= lt!313170 e!387893)))

(declare-fun res!447126 () Bool)

(assert (=> d!93717 (=> (not res!447126) (not e!387893))))

(assert (=> d!93717 (= res!447126 (is-Cons!12976 acc!681))))

(assert (=> d!93717 (= (contains!3557 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313170)))

(declare-fun b!680923 () Bool)

(declare-fun e!387892 () Bool)

(assert (=> b!680923 (= e!387893 e!387892)))

(declare-fun res!447125 () Bool)

(assert (=> b!680923 (=> res!447125 e!387892)))

(assert (=> b!680923 (= res!447125 (= (h!14021 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680924 () Bool)

(assert (=> b!680924 (= e!387892 (contains!3557 (t!19211 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93717 res!447126) b!680923))

(assert (= (and b!680923 (not res!447125)) b!680924))

(declare-fun m!645885 () Bool)

(assert (=> d!93717 m!645885))

(declare-fun m!645887 () Bool)

(assert (=> d!93717 m!645887))

(declare-fun m!645889 () Bool)

(assert (=> b!680924 m!645889))

(assert (=> b!680697 d!93717))

(declare-fun d!93719 () Bool)

(assert (=> d!93719 (= (array_inv!14735 a!3626) (bvsge (size!19303 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60578 d!93719))

(declare-fun d!93721 () Bool)

(declare-fun lt!313171 () Bool)

(assert (=> d!93721 (= lt!313171 (set.member k!2843 (content!272 acc!681)))))

(declare-fun e!387895 () Bool)

(assert (=> d!93721 (= lt!313171 e!387895)))

(declare-fun res!447128 () Bool)

(assert (=> d!93721 (=> (not res!447128) (not e!387895))))

(assert (=> d!93721 (= res!447128 (is-Cons!12976 acc!681))))

(assert (=> d!93721 (= (contains!3557 acc!681 k!2843) lt!313171)))

(declare-fun b!680925 () Bool)

(declare-fun e!387894 () Bool)

(assert (=> b!680925 (= e!387895 e!387894)))

(declare-fun res!447127 () Bool)

(assert (=> b!680925 (=> res!447127 e!387894)))

(assert (=> b!680925 (= res!447127 (= (h!14021 acc!681) k!2843))))

(declare-fun b!680926 () Bool)

(assert (=> b!680926 (= e!387894 (contains!3557 (t!19211 acc!681) k!2843))))

(assert (= (and d!93721 res!447128) b!680925))

(assert (= (and b!680925 (not res!447127)) b!680926))

(assert (=> d!93721 m!645885))

(declare-fun m!645891 () Bool)

(assert (=> d!93721 m!645891))

(declare-fun m!645893 () Bool)

(assert (=> b!680926 m!645893))

(assert (=> b!680701 d!93721))

(declare-fun d!93723 () Bool)

(declare-fun lt!313172 () Bool)

(assert (=> d!93723 (= lt!313172 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!272 acc!681)))))

(declare-fun e!387901 () Bool)

(assert (=> d!93723 (= lt!313172 e!387901)))

(declare-fun res!447133 () Bool)

(assert (=> d!93723 (=> (not res!447133) (not e!387901))))

(assert (=> d!93723 (= res!447133 (is-Cons!12976 acc!681))))

(assert (=> d!93723 (= (contains!3557 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313172)))

(declare-fun b!680932 () Bool)

(declare-fun e!387900 () Bool)

(assert (=> b!680932 (= e!387901 e!387900)))

(declare-fun res!447132 () Bool)

(assert (=> b!680932 (=> res!447132 e!387900)))

(assert (=> b!680932 (= res!447132 (= (h!14021 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680933 () Bool)

(assert (=> b!680933 (= e!387900 (contains!3557 (t!19211 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93723 res!447133) b!680932))

(assert (= (and b!680932 (not res!447132)) b!680933))

(assert (=> d!93723 m!645885))

(declare-fun m!645895 () Bool)

(assert (=> d!93723 m!645895))

(declare-fun m!645899 () Bool)

(assert (=> b!680933 m!645899))

(assert (=> b!680700 d!93723))

(declare-fun d!93725 () Bool)

(declare-fun lt!313173 () Bool)

(assert (=> d!93725 (= lt!313173 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!272 lt!313132)))))

(declare-fun e!387903 () Bool)

(assert (=> d!93725 (= lt!313173 e!387903)))

(declare-fun res!447135 () Bool)

(assert (=> d!93725 (=> (not res!447135) (not e!387903))))

(assert (=> d!93725 (= res!447135 (is-Cons!12976 lt!313132))))

(assert (=> d!93725 (= (contains!3557 lt!313132 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313173)))

(declare-fun b!680934 () Bool)

(declare-fun e!387902 () Bool)

(assert (=> b!680934 (= e!387903 e!387902)))

(declare-fun res!447134 () Bool)

(assert (=> b!680934 (=> res!447134 e!387902)))

(assert (=> b!680934 (= res!447134 (= (h!14021 lt!313132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680935 () Bool)

(assert (=> b!680935 (= e!387902 (contains!3557 (t!19211 lt!313132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93725 res!447135) b!680934))

(assert (= (and b!680934 (not res!447134)) b!680935))

(declare-fun m!645903 () Bool)

(assert (=> d!93725 m!645903))

(declare-fun m!645905 () Bool)

(assert (=> d!93725 m!645905))

(declare-fun m!645907 () Bool)

(assert (=> b!680935 m!645907))

(assert (=> b!680689 d!93725))

(assert (=> b!680703 d!93721))

(declare-fun d!93729 () Bool)

(declare-fun res!447136 () Bool)

(declare-fun e!387904 () Bool)

(assert (=> d!93729 (=> res!447136 e!387904)))

(assert (=> d!93729 (= res!447136 (is-Nil!12977 lt!313132))))

(assert (=> d!93729 (= (noDuplicate!804 lt!313132) e!387904)))

(declare-fun b!680936 () Bool)

(declare-fun e!387905 () Bool)

(assert (=> b!680936 (= e!387904 e!387905)))

(declare-fun res!447137 () Bool)

(assert (=> b!680936 (=> (not res!447137) (not e!387905))))

(assert (=> b!680936 (= res!447137 (not (contains!3557 (t!19211 lt!313132) (h!14021 lt!313132))))))

(declare-fun b!680937 () Bool)

(assert (=> b!680937 (= e!387905 (noDuplicate!804 (t!19211 lt!313132)))))

(assert (= (and d!93729 (not res!447136)) b!680936))

(assert (= (and b!680936 res!447137) b!680937))

(declare-fun m!645909 () Bool)

(assert (=> b!680936 m!645909))

(declare-fun m!645911 () Bool)

(assert (=> b!680937 m!645911))

(assert (=> b!680704 d!93729))

(declare-fun d!93731 () Bool)

(assert (=> d!93731 (= (validKeyInArray!0 (select (arr!18939 a!3626) from!3004)) (and (not (= (select (arr!18939 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18939 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680693 d!93731))

(declare-fun d!93735 () Bool)

(declare-fun res!447143 () Bool)

(declare-fun e!387912 () Bool)

(assert (=> d!93735 (=> res!447143 e!387912)))

(assert (=> d!93735 (= res!447143 (= (select (arr!18939 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93735 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387912)))

(declare-fun b!680945 () Bool)

(declare-fun e!387913 () Bool)

(assert (=> b!680945 (= e!387912 e!387913)))

(declare-fun res!447144 () Bool)

(assert (=> b!680945 (=> (not res!447144) (not e!387913))))

(assert (=> b!680945 (= res!447144 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19303 a!3626)))))

(declare-fun b!680946 () Bool)

(assert (=> b!680946 (= e!387913 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93735 (not res!447143)) b!680945))

(assert (= (and b!680945 res!447144) b!680946))

(declare-fun m!645921 () Bool)

(assert (=> d!93735 m!645921))

(declare-fun m!645923 () Bool)

(assert (=> b!680946 m!645923))

(assert (=> b!680693 d!93735))

(declare-fun d!93739 () Bool)

(declare-fun res!447147 () Bool)

(declare-fun e!387916 () Bool)

(assert (=> d!93739 (=> res!447147 e!387916)))

(assert (=> d!93739 (= res!447147 (= (select (arr!18939 (array!39503 (store (arr!18939 a!3626) i!1382 k!2843) (size!19303 a!3626))) from!3004) k!2843))))

(assert (=> d!93739 (= (arrayContainsKey!0 (array!39503 (store (arr!18939 a!3626) i!1382 k!2843) (size!19303 a!3626)) k!2843 from!3004) e!387916)))

(declare-fun b!680949 () Bool)

(declare-fun e!387917 () Bool)

(assert (=> b!680949 (= e!387916 e!387917)))

(declare-fun res!447148 () Bool)

(assert (=> b!680949 (=> (not res!447148) (not e!387917))))

(assert (=> b!680949 (= res!447148 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19303 (array!39503 (store (arr!18939 a!3626) i!1382 k!2843) (size!19303 a!3626)))))))

(declare-fun b!680950 () Bool)

(assert (=> b!680950 (= e!387917 (arrayContainsKey!0 (array!39503 (store (arr!18939 a!3626) i!1382 k!2843) (size!19303 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93739 (not res!447147)) b!680949))

(assert (= (and b!680949 res!447148) b!680950))

(declare-fun m!645931 () Bool)

(assert (=> d!93739 m!645931))

(declare-fun m!645933 () Bool)

(assert (=> b!680950 m!645933))

(assert (=> b!680693 d!93739))

(declare-fun d!93745 () Bool)

(declare-fun lt!313178 () Bool)

(assert (=> d!93745 (= lt!313178 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!272 lt!313132)))))

(declare-fun e!387919 () Bool)

(assert (=> d!93745 (= lt!313178 e!387919)))

(declare-fun res!447150 () Bool)

(assert (=> d!93745 (=> (not res!447150) (not e!387919))))

(assert (=> d!93745 (= res!447150 (is-Cons!12976 lt!313132))))

(assert (=> d!93745 (= (contains!3557 lt!313132 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313178)))

(declare-fun b!680951 () Bool)

(declare-fun e!387918 () Bool)

(assert (=> b!680951 (= e!387919 e!387918)))

(declare-fun res!447149 () Bool)

(assert (=> b!680951 (=> res!447149 e!387918)))

(assert (=> b!680951 (= res!447149 (= (h!14021 lt!313132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680952 () Bool)

(assert (=> b!680952 (= e!387918 (contains!3557 (t!19211 lt!313132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93745 res!447150) b!680951))

(assert (= (and b!680951 (not res!447149)) b!680952))

(assert (=> d!93745 m!645903))

(declare-fun m!645935 () Bool)

(assert (=> d!93745 m!645935))

(declare-fun m!645937 () Bool)

(assert (=> b!680952 m!645937))

(assert (=> b!680702 d!93745))

(declare-fun d!93749 () Bool)

(assert (=> d!93749 (= ($colon$colon!308 acc!681 (select (arr!18939 a!3626) from!3004)) (Cons!12976 (select (arr!18939 a!3626) from!3004) acc!681))))

(assert (=> b!680691 d!93749))

(declare-fun d!93751 () Bool)

(declare-fun res!447179 () Bool)

(declare-fun e!387950 () Bool)

(assert (=> d!93751 (=> res!447179 e!387950)))

(assert (=> d!93751 (= res!447179 (is-Nil!12977 acc!681))))

(assert (=> d!93751 (= (subseq!143 acc!681 acc!681) e!387950)))

(declare-fun b!680982 () Bool)

(declare-fun e!387948 () Bool)

(assert (=> b!680982 (= e!387950 e!387948)))

(declare-fun res!447180 () Bool)

(assert (=> b!680982 (=> (not res!447180) (not e!387948))))

(assert (=> b!680982 (= res!447180 (is-Cons!12976 acc!681))))

(declare-fun b!680984 () Bool)

(declare-fun e!387949 () Bool)

(assert (=> b!680984 (= e!387949 (subseq!143 (t!19211 acc!681) (t!19211 acc!681)))))

(declare-fun b!680983 () Bool)

(declare-fun e!387951 () Bool)

(assert (=> b!680983 (= e!387948 e!387951)))

(declare-fun res!447178 () Bool)

(assert (=> b!680983 (=> res!447178 e!387951)))

(assert (=> b!680983 (= res!447178 e!387949)))

(declare-fun res!447181 () Bool)

(assert (=> b!680983 (=> (not res!447181) (not e!387949))))

(assert (=> b!680983 (= res!447181 (= (h!14021 acc!681) (h!14021 acc!681)))))

(declare-fun b!680985 () Bool)

(assert (=> b!680985 (= e!387951 (subseq!143 acc!681 (t!19211 acc!681)))))

(assert (= (and d!93751 (not res!447179)) b!680982))

(assert (= (and b!680982 res!447180) b!680983))

(assert (= (and b!680983 res!447181) b!680984))

(assert (= (and b!680983 (not res!447178)) b!680985))

(declare-fun m!645963 () Bool)

(assert (=> b!680984 m!645963))

(declare-fun m!645965 () Bool)

(assert (=> b!680985 m!645965))

(assert (=> b!680691 d!93751))

(declare-fun d!93767 () Bool)

(assert (=> d!93767 (subseq!143 acc!681 acc!681)))

(declare-fun lt!313186 () Unit!23874)

(declare-fun choose!36 (List!12980) Unit!23874)

(assert (=> d!93767 (= lt!313186 (choose!36 acc!681))))

(assert (=> d!93767 (= (lemmaListSubSeqRefl!0 acc!681) lt!313186)))

(declare-fun bs!19990 () Bool)

(assert (= bs!19990 d!93767))

(assert (=> bs!19990 m!645711))

(declare-fun m!645967 () Bool)

(assert (=> bs!19990 m!645967))

(assert (=> b!680691 d!93767))

(declare-fun bm!33958 () Bool)

(declare-fun call!33961 () Bool)

(declare-fun c!77272 () Bool)

(assert (=> bm!33958 (= call!33961 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77272 (Cons!12976 (select (arr!18939 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!93769 () Bool)

(declare-fun res!447201 () Bool)

(declare-fun e!387977 () Bool)

(assert (=> d!93769 (=> res!447201 e!387977)))

(assert (=> d!93769 (= res!447201 (bvsge from!3004 (size!19303 a!3626)))))

(assert (=> d!93769 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387977)))

(declare-fun b!681011 () Bool)

(declare-fun e!387974 () Bool)

(assert (=> b!681011 (= e!387974 (contains!3557 acc!681 (select (arr!18939 a!3626) from!3004)))))

(declare-fun b!681012 () Bool)

(declare-fun e!387975 () Bool)

(assert (=> b!681012 (= e!387975 call!33961)))

(declare-fun b!681013 () Bool)

(assert (=> b!681013 (= e!387975 call!33961)))

(declare-fun b!681014 () Bool)

(declare-fun e!387976 () Bool)

(assert (=> b!681014 (= e!387977 e!387976)))

(declare-fun res!447203 () Bool)

(assert (=> b!681014 (=> (not res!447203) (not e!387976))))

(assert (=> b!681014 (= res!447203 (not e!387974))))

(declare-fun res!447202 () Bool)

(assert (=> b!681014 (=> (not res!447202) (not e!387974))))

(assert (=> b!681014 (= res!447202 (validKeyInArray!0 (select (arr!18939 a!3626) from!3004)))))

(declare-fun b!681015 () Bool)

(assert (=> b!681015 (= e!387976 e!387975)))

(assert (=> b!681015 (= c!77272 (validKeyInArray!0 (select (arr!18939 a!3626) from!3004)))))

(assert (= (and d!93769 (not res!447201)) b!681014))

(assert (= (and b!681014 res!447202) b!681011))

(assert (= (and b!681014 res!447203) b!681015))

(assert (= (and b!681015 c!77272) b!681012))

(assert (= (and b!681015 (not c!77272)) b!681013))

(assert (= (or b!681012 b!681013) bm!33958))

(assert (=> bm!33958 m!645707))

(declare-fun m!645995 () Bool)

(assert (=> bm!33958 m!645995))

(assert (=> b!681011 m!645707))

(assert (=> b!681011 m!645707))

(declare-fun m!645997 () Bool)

(assert (=> b!681011 m!645997))

(assert (=> b!681014 m!645707))

(assert (=> b!681014 m!645707))

(assert (=> b!681014 m!645727))

(assert (=> b!681015 m!645707))

(assert (=> b!681015 m!645707))

(assert (=> b!681015 m!645727))

(assert (=> b!680706 d!93769))

(declare-fun d!93785 () Bool)

(assert (=> d!93785 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313195 () Unit!23874)

(declare-fun choose!13 (array!39502 (_ BitVec 64) (_ BitVec 32)) Unit!23874)

(assert (=> d!93785 (= lt!313195 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!93785 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93785 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313195)))

(declare-fun bs!19992 () Bool)

(assert (= bs!19992 d!93785))

(assert (=> bs!19992 m!645721))

(declare-fun m!645999 () Bool)

(assert (=> bs!19992 m!645999))

(assert (=> b!680695 d!93785))

(declare-fun bm!33959 () Bool)

(declare-fun call!33962 () Bool)

(declare-fun c!77273 () Bool)

(assert (=> bm!33959 (= call!33962 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77273 (Cons!12976 (select (arr!18939 a!3626) #b00000000000000000000000000000000) Nil!12977) Nil!12977)))))

(declare-fun d!93787 () Bool)

(declare-fun res!447204 () Bool)

(declare-fun e!387981 () Bool)

(assert (=> d!93787 (=> res!447204 e!387981)))

(assert (=> d!93787 (= res!447204 (bvsge #b00000000000000000000000000000000 (size!19303 a!3626)))))

(assert (=> d!93787 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12977) e!387981)))

(declare-fun b!681016 () Bool)

(declare-fun e!387978 () Bool)

(assert (=> b!681016 (= e!387978 (contains!3557 Nil!12977 (select (arr!18939 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681017 () Bool)

(declare-fun e!387979 () Bool)

(assert (=> b!681017 (= e!387979 call!33962)))

(declare-fun b!681018 () Bool)

(assert (=> b!681018 (= e!387979 call!33962)))

(declare-fun b!681019 () Bool)

(declare-fun e!387980 () Bool)

(assert (=> b!681019 (= e!387981 e!387980)))

(declare-fun res!447206 () Bool)

(assert (=> b!681019 (=> (not res!447206) (not e!387980))))

(assert (=> b!681019 (= res!447206 (not e!387978))))

(declare-fun res!447205 () Bool)

(assert (=> b!681019 (=> (not res!447205) (not e!387978))))

(assert (=> b!681019 (= res!447205 (validKeyInArray!0 (select (arr!18939 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681020 () Bool)

(assert (=> b!681020 (= e!387980 e!387979)))

(assert (=> b!681020 (= c!77273 (validKeyInArray!0 (select (arr!18939 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93787 (not res!447204)) b!681019))

(assert (= (and b!681019 res!447205) b!681016))

(assert (= (and b!681019 res!447206) b!681020))

(assert (= (and b!681020 c!77273) b!681017))

(assert (= (and b!681020 (not c!77273)) b!681018))

(assert (= (or b!681017 b!681018) bm!33959))

(assert (=> bm!33959 m!645881))

(declare-fun m!646001 () Bool)

(assert (=> bm!33959 m!646001))

(assert (=> b!681016 m!645881))

(assert (=> b!681016 m!645881))

(declare-fun m!646003 () Bool)

(assert (=> b!681016 m!646003))

(assert (=> b!681019 m!645881))

(assert (=> b!681019 m!645881))

(declare-fun m!646005 () Bool)

(assert (=> b!681019 m!646005))

(assert (=> b!681020 m!645881))

(assert (=> b!681020 m!645881))

(assert (=> b!681020 m!646005))

(assert (=> b!680694 d!93787))

(declare-fun d!93789 () Bool)

(assert (=> d!93789 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680705 d!93789))

(push 1)

