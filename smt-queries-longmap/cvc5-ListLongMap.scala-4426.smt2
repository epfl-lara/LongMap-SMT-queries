; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61280 () Bool)

(assert start!61280)

(declare-fun b!686651 () Bool)

(declare-fun res!451750 () Bool)

(declare-fun e!390992 () Bool)

(assert (=> b!686651 (=> (not res!451750) (not e!390992))))

(declare-fun e!390990 () Bool)

(assert (=> b!686651 (= res!451750 e!390990)))

(declare-fun res!451744 () Bool)

(assert (=> b!686651 (=> res!451744 e!390990)))

(declare-fun e!390996 () Bool)

(assert (=> b!686651 (= res!451744 e!390996)))

(declare-fun res!451743 () Bool)

(assert (=> b!686651 (=> (not res!451743) (not e!390996))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686651 (= res!451743 (bvsgt from!3004 i!1382))))

(declare-fun b!686652 () Bool)

(declare-datatypes ((Unit!24207 0))(
  ( (Unit!24208) )
))
(declare-fun e!390991 () Unit!24207)

(declare-fun Unit!24209 () Unit!24207)

(assert (=> b!686652 (= e!390991 Unit!24209)))

(declare-fun lt!315149 () Unit!24207)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39664 0))(
  ( (array!39665 (arr!19008 (Array (_ BitVec 32) (_ BitVec 64))) (size!19382 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39664 (_ BitVec 64) (_ BitVec 32)) Unit!24207)

(assert (=> b!686652 (= lt!315149 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686652 false))

(declare-fun b!686653 () Bool)

(declare-fun res!451754 () Bool)

(assert (=> b!686653 (=> (not res!451754) (not e!390992))))

(declare-datatypes ((List!13049 0))(
  ( (Nil!13046) (Cons!13045 (h!14090 (_ BitVec 64)) (t!19304 List!13049)) )
))
(declare-fun acc!681 () List!13049)

(declare-fun contains!3626 (List!13049 (_ BitVec 64)) Bool)

(assert (=> b!686653 (= res!451754 (not (contains!3626 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686654 () Bool)

(declare-fun e!390994 () Unit!24207)

(declare-fun Unit!24210 () Unit!24207)

(assert (=> b!686654 (= e!390994 Unit!24210)))

(declare-fun b!686655 () Bool)

(declare-fun Unit!24211 () Unit!24207)

(assert (=> b!686655 (= e!390991 Unit!24211)))

(declare-fun b!686656 () Bool)

(declare-fun res!451752 () Bool)

(assert (=> b!686656 (=> (not res!451752) (not e!390992))))

(declare-fun arrayNoDuplicates!0 (array!39664 (_ BitVec 32) List!13049) Bool)

(assert (=> b!686656 (= res!451752 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686657 () Bool)

(declare-fun e!390989 () Bool)

(assert (=> b!686657 (= e!390992 (not e!390989))))

(declare-fun res!451755 () Bool)

(assert (=> b!686657 (=> res!451755 e!390989)))

(assert (=> b!686657 (= res!451755 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!315147 () List!13049)

(assert (=> b!686657 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315147)))

(declare-fun lt!315151 () Unit!24207)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39664 (_ BitVec 64) (_ BitVec 32) List!13049 List!13049) Unit!24207)

(assert (=> b!686657 (= lt!315151 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315147))))

(declare-fun -!177 (List!13049 (_ BitVec 64)) List!13049)

(assert (=> b!686657 (= (-!177 lt!315147 k!2843) acc!681)))

(declare-fun $colon$colon!377 (List!13049 (_ BitVec 64)) List!13049)

(assert (=> b!686657 (= lt!315147 ($colon$colon!377 acc!681 k!2843))))

(declare-fun lt!315145 () Unit!24207)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13049) Unit!24207)

(assert (=> b!686657 (= lt!315145 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!212 (List!13049 List!13049) Bool)

(assert (=> b!686657 (subseq!212 acc!681 acc!681)))

(declare-fun lt!315144 () Unit!24207)

(declare-fun lemmaListSubSeqRefl!0 (List!13049) Unit!24207)

(assert (=> b!686657 (= lt!315144 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686657 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315150 () Unit!24207)

(assert (=> b!686657 (= lt!315150 e!390994)))

(declare-fun c!77821 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686657 (= c!77821 (validKeyInArray!0 (select (arr!19008 a!3626) from!3004)))))

(declare-fun lt!315148 () Unit!24207)

(assert (=> b!686657 (= lt!315148 e!390991)))

(declare-fun c!77822 () Bool)

(declare-fun arrayContainsKey!0 (array!39664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686657 (= c!77822 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686657 (arrayContainsKey!0 (array!39665 (store (arr!19008 a!3626) i!1382 k!2843) (size!19382 a!3626)) k!2843 from!3004)))

(declare-fun b!686658 () Bool)

(declare-fun res!451757 () Bool)

(assert (=> b!686658 (=> (not res!451757) (not e!390992))))

(assert (=> b!686658 (= res!451757 (validKeyInArray!0 k!2843))))

(declare-fun b!686659 () Bool)

(declare-fun noDuplicate!873 (List!13049) Bool)

(assert (=> b!686659 (= e!390989 (noDuplicate!873 lt!315147))))

(declare-fun b!686660 () Bool)

(declare-fun res!451753 () Bool)

(assert (=> b!686660 (=> (not res!451753) (not e!390992))))

(assert (=> b!686660 (= res!451753 (not (contains!3626 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686661 () Bool)

(declare-fun res!451746 () Bool)

(assert (=> b!686661 (=> (not res!451746) (not e!390992))))

(assert (=> b!686661 (= res!451746 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19382 a!3626))))))

(declare-fun b!686662 () Bool)

(declare-fun res!451751 () Bool)

(assert (=> b!686662 (=> (not res!451751) (not e!390992))))

(assert (=> b!686662 (= res!451751 (noDuplicate!873 acc!681))))

(declare-fun b!686663 () Bool)

(assert (=> b!686663 (= e!390996 (contains!3626 acc!681 k!2843))))

(declare-fun b!686664 () Bool)

(declare-fun res!451756 () Bool)

(assert (=> b!686664 (=> (not res!451756) (not e!390992))))

(assert (=> b!686664 (= res!451756 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19382 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686665 () Bool)

(declare-fun lt!315146 () Unit!24207)

(assert (=> b!686665 (= e!390994 lt!315146)))

(declare-fun lt!315143 () Unit!24207)

(assert (=> b!686665 (= lt!315143 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686665 (subseq!212 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39664 List!13049 List!13049 (_ BitVec 32)) Unit!24207)

(assert (=> b!686665 (= lt!315146 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!377 acc!681 (select (arr!19008 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686665 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686667 () Bool)

(declare-fun e!390995 () Bool)

(assert (=> b!686667 (= e!390995 (not (contains!3626 acc!681 k!2843)))))

(declare-fun b!686668 () Bool)

(assert (=> b!686668 (= e!390990 e!390995)))

(declare-fun res!451747 () Bool)

(assert (=> b!686668 (=> (not res!451747) (not e!390995))))

(assert (=> b!686668 (= res!451747 (bvsle from!3004 i!1382))))

(declare-fun b!686669 () Bool)

(declare-fun res!451745 () Bool)

(assert (=> b!686669 (=> (not res!451745) (not e!390992))))

(assert (=> b!686669 (= res!451745 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13046))))

(declare-fun b!686666 () Bool)

(declare-fun res!451749 () Bool)

(assert (=> b!686666 (=> (not res!451749) (not e!390992))))

(assert (=> b!686666 (= res!451749 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!451748 () Bool)

(assert (=> start!61280 (=> (not res!451748) (not e!390992))))

(assert (=> start!61280 (= res!451748 (and (bvslt (size!19382 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19382 a!3626))))))

(assert (=> start!61280 e!390992))

(assert (=> start!61280 true))

(declare-fun array_inv!14804 (array!39664) Bool)

(assert (=> start!61280 (array_inv!14804 a!3626)))

(assert (= (and start!61280 res!451748) b!686662))

(assert (= (and b!686662 res!451751) b!686653))

(assert (= (and b!686653 res!451754) b!686660))

(assert (= (and b!686660 res!451753) b!686651))

(assert (= (and b!686651 res!451743) b!686663))

(assert (= (and b!686651 (not res!451744)) b!686668))

(assert (= (and b!686668 res!451747) b!686667))

(assert (= (and b!686651 res!451750) b!686669))

(assert (= (and b!686669 res!451745) b!686656))

(assert (= (and b!686656 res!451752) b!686661))

(assert (= (and b!686661 res!451746) b!686658))

(assert (= (and b!686658 res!451757) b!686666))

(assert (= (and b!686666 res!451749) b!686664))

(assert (= (and b!686664 res!451756) b!686657))

(assert (= (and b!686657 c!77822) b!686652))

(assert (= (and b!686657 (not c!77822)) b!686655))

(assert (= (and b!686657 c!77821) b!686665))

(assert (= (and b!686657 (not c!77821)) b!686654))

(assert (= (and b!686657 (not res!451755)) b!686659))

(declare-fun m!650729 () Bool)

(assert (=> b!686663 m!650729))

(declare-fun m!650731 () Bool)

(assert (=> b!686669 m!650731))

(declare-fun m!650733 () Bool)

(assert (=> b!686662 m!650733))

(declare-fun m!650735 () Bool)

(assert (=> b!686660 m!650735))

(declare-fun m!650737 () Bool)

(assert (=> b!686656 m!650737))

(declare-fun m!650739 () Bool)

(assert (=> b!686658 m!650739))

(declare-fun m!650741 () Bool)

(assert (=> b!686652 m!650741))

(declare-fun m!650743 () Bool)

(assert (=> start!61280 m!650743))

(declare-fun m!650745 () Bool)

(assert (=> b!686653 m!650745))

(declare-fun m!650747 () Bool)

(assert (=> b!686666 m!650747))

(declare-fun m!650749 () Bool)

(assert (=> b!686657 m!650749))

(declare-fun m!650751 () Bool)

(assert (=> b!686657 m!650751))

(declare-fun m!650753 () Bool)

(assert (=> b!686657 m!650753))

(declare-fun m!650755 () Bool)

(assert (=> b!686657 m!650755))

(declare-fun m!650757 () Bool)

(assert (=> b!686657 m!650757))

(declare-fun m!650759 () Bool)

(assert (=> b!686657 m!650759))

(declare-fun m!650761 () Bool)

(assert (=> b!686657 m!650761))

(declare-fun m!650763 () Bool)

(assert (=> b!686657 m!650763))

(declare-fun m!650765 () Bool)

(assert (=> b!686657 m!650765))

(declare-fun m!650767 () Bool)

(assert (=> b!686657 m!650767))

(assert (=> b!686657 m!650753))

(declare-fun m!650769 () Bool)

(assert (=> b!686657 m!650769))

(declare-fun m!650771 () Bool)

(assert (=> b!686657 m!650771))

(declare-fun m!650773 () Bool)

(assert (=> b!686657 m!650773))

(declare-fun m!650775 () Bool)

(assert (=> b!686659 m!650775))

(assert (=> b!686667 m!650729))

(assert (=> b!686665 m!650751))

(assert (=> b!686665 m!650753))

(declare-fun m!650777 () Bool)

(assert (=> b!686665 m!650777))

(declare-fun m!650779 () Bool)

(assert (=> b!686665 m!650779))

(assert (=> b!686665 m!650753))

(assert (=> b!686665 m!650777))

(assert (=> b!686665 m!650761))

(assert (=> b!686665 m!650773))

(push 1)

(assert (not b!686660))

(assert (not b!686652))

(assert (not b!686665))

(assert (not b!686662))

(assert (not b!686667))

(assert (not b!686666))

(assert (not b!686669))

(assert (not b!686659))

(assert (not b!686657))

(assert (not b!686656))

(assert (not start!61280))

(assert (not b!686658))

(assert (not b!686653))

(assert (not b!686663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94771 () Bool)

(assert (=> d!94771 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686658 d!94771))

(declare-fun b!686814 () Bool)

(declare-fun e!391074 () Bool)

(declare-fun e!391071 () Bool)

(assert (=> b!686814 (= e!391074 e!391071)))

(declare-fun res!451869 () Bool)

(assert (=> b!686814 (=> (not res!451869) (not e!391071))))

(declare-fun e!391072 () Bool)

(assert (=> b!686814 (= res!451869 (not e!391072))))

(declare-fun res!451866 () Bool)

(assert (=> b!686814 (=> (not res!451866) (not e!391072))))

(assert (=> b!686814 (= res!451866 (validKeyInArray!0 (select (arr!19008 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34104 () Bool)

(declare-fun call!34107 () Bool)

(declare-fun c!77841 () Bool)

(assert (=> bm!34104 (= call!34107 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77841 (Cons!13045 (select (arr!19008 a!3626) #b00000000000000000000000000000000) Nil!13046) Nil!13046)))))

(declare-fun b!686815 () Bool)

(declare-fun e!391073 () Bool)

(assert (=> b!686815 (= e!391073 call!34107)))

(declare-fun d!94773 () Bool)

(declare-fun res!451870 () Bool)

(assert (=> d!94773 (=> res!451870 e!391074)))

(assert (=> d!94773 (= res!451870 (bvsge #b00000000000000000000000000000000 (size!19382 a!3626)))))

(assert (=> d!94773 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13046) e!391074)))

(declare-fun b!686816 () Bool)

(assert (=> b!686816 (= e!391072 (contains!3626 Nil!13046 (select (arr!19008 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686817 () Bool)

(assert (=> b!686817 (= e!391073 call!34107)))

(declare-fun b!686818 () Bool)

(assert (=> b!686818 (= e!391071 e!391073)))

(assert (=> b!686818 (= c!77841 (validKeyInArray!0 (select (arr!19008 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94773 (not res!451870)) b!686814))

(assert (= (and b!686814 res!451866) b!686816))

(assert (= (and b!686814 res!451869) b!686818))

(assert (= (and b!686818 c!77841) b!686815))

(assert (= (and b!686818 (not c!77841)) b!686817))

(assert (= (or b!686815 b!686817) bm!34104))

(declare-fun m!650897 () Bool)

(assert (=> b!686814 m!650897))

(assert (=> b!686814 m!650897))

(declare-fun m!650899 () Bool)

(assert (=> b!686814 m!650899))

(assert (=> bm!34104 m!650897))

(declare-fun m!650901 () Bool)

(assert (=> bm!34104 m!650901))

(assert (=> b!686816 m!650897))

(assert (=> b!686816 m!650897))

(declare-fun m!650903 () Bool)

(assert (=> b!686816 m!650903))

(assert (=> b!686818 m!650897))

(assert (=> b!686818 m!650897))

(assert (=> b!686818 m!650899))

(assert (=> b!686669 d!94773))

(declare-fun d!94783 () Bool)

(assert (=> d!94783 (= (array_inv!14804 a!3626) (bvsge (size!19382 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61280 d!94783))

(declare-fun d!94787 () Bool)

(declare-fun res!451888 () Bool)

(declare-fun e!391093 () Bool)

(assert (=> d!94787 (=> res!451888 e!391093)))

(assert (=> d!94787 (= res!451888 (is-Nil!13046 lt!315147))))

(assert (=> d!94787 (= (noDuplicate!873 lt!315147) e!391093)))

(declare-fun b!686840 () Bool)

(declare-fun e!391094 () Bool)

(assert (=> b!686840 (= e!391093 e!391094)))

(declare-fun res!451889 () Bool)

(assert (=> b!686840 (=> (not res!451889) (not e!391094))))

(assert (=> b!686840 (= res!451889 (not (contains!3626 (t!19304 lt!315147) (h!14090 lt!315147))))))

(declare-fun b!686841 () Bool)

(assert (=> b!686841 (= e!391094 (noDuplicate!873 (t!19304 lt!315147)))))

(assert (= (and d!94787 (not res!451888)) b!686840))

(assert (= (and b!686840 res!451889) b!686841))

(declare-fun m!650925 () Bool)

(assert (=> b!686840 m!650925))

(declare-fun m!650927 () Bool)

(assert (=> b!686841 m!650927))

(assert (=> b!686659 d!94787))

(declare-fun d!94797 () Bool)

(declare-fun res!451900 () Bool)

(declare-fun e!391110 () Bool)

(assert (=> d!94797 (=> res!451900 e!391110)))

(assert (=> d!94797 (= res!451900 (= (select (arr!19008 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94797 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!391110)))

(declare-fun b!686860 () Bool)

(declare-fun e!391111 () Bool)

(assert (=> b!686860 (= e!391110 e!391111)))

(declare-fun res!451901 () Bool)

(assert (=> b!686860 (=> (not res!451901) (not e!391111))))

(assert (=> b!686860 (= res!451901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19382 a!3626)))))

(declare-fun b!686861 () Bool)

(assert (=> b!686861 (= e!391111 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94797 (not res!451900)) b!686860))

(assert (= (and b!686860 res!451901) b!686861))

(assert (=> d!94797 m!650897))

(declare-fun m!650935 () Bool)

(assert (=> b!686861 m!650935))

(assert (=> b!686666 d!94797))

(declare-fun d!94801 () Bool)

(declare-fun res!451904 () Bool)

(declare-fun e!391114 () Bool)

(assert (=> d!94801 (=> res!451904 e!391114)))

(assert (=> d!94801 (= res!451904 (= (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94801 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391114)))

(declare-fun b!686864 () Bool)

(declare-fun e!391115 () Bool)

(assert (=> b!686864 (= e!391114 e!391115)))

(declare-fun res!451905 () Bool)

(assert (=> b!686864 (=> (not res!451905) (not e!391115))))

(assert (=> b!686864 (= res!451905 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19382 a!3626)))))

(declare-fun b!686865 () Bool)

(assert (=> b!686865 (= e!391115 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94801 (not res!451904)) b!686864))

(assert (= (and b!686864 res!451905) b!686865))

(declare-fun m!650937 () Bool)

(assert (=> d!94801 m!650937))

(declare-fun m!650939 () Bool)

(assert (=> b!686865 m!650939))

(assert (=> b!686657 d!94801))

(declare-fun d!94803 () Bool)

(assert (=> d!94803 (= (-!177 ($colon$colon!377 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!315220 () Unit!24207)

(declare-fun choose!16 ((_ BitVec 64) List!13049) Unit!24207)

(assert (=> d!94803 (= lt!315220 (choose!16 k!2843 acc!681))))

(assert (=> d!94803 (not (contains!3626 acc!681 k!2843))))

(assert (=> d!94803 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!315220)))

(declare-fun bs!20132 () Bool)

(assert (= bs!20132 d!94803))

(assert (=> bs!20132 m!650765))

(assert (=> bs!20132 m!650765))

(declare-fun m!650953 () Bool)

(assert (=> bs!20132 m!650953))

(declare-fun m!650955 () Bool)

(assert (=> bs!20132 m!650955))

(assert (=> bs!20132 m!650729))

(assert (=> b!686657 d!94803))

(declare-fun b!686928 () Bool)

(declare-fun e!391170 () List!13049)

(declare-fun call!34117 () List!13049)

(assert (=> b!686928 (= e!391170 call!34117)))

(declare-fun d!94807 () Bool)

(declare-fun e!391169 () Bool)

(assert (=> d!94807 e!391169))

(declare-fun res!451944 () Bool)

(assert (=> d!94807 (=> (not res!451944) (not e!391169))))

(declare-fun lt!315228 () List!13049)

(declare-fun size!19387 (List!13049) Int)

(assert (=> d!94807 (= res!451944 (<= (size!19387 lt!315228) (size!19387 lt!315147)))))

(declare-fun e!391168 () List!13049)

(assert (=> d!94807 (= lt!315228 e!391168)))

(declare-fun c!77859 () Bool)

(assert (=> d!94807 (= c!77859 (is-Cons!13045 lt!315147))))

(assert (=> d!94807 (= (-!177 lt!315147 k!2843) lt!315228)))

(declare-fun b!686929 () Bool)

(declare-fun content!296 (List!13049) (Set (_ BitVec 64)))

(assert (=> b!686929 (= e!391169 (= (content!296 lt!315228) (set.minus (content!296 lt!315147) (set.insert k!2843 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!686930 () Bool)

(assert (=> b!686930 (= e!391168 Nil!13046)))

(declare-fun b!686931 () Bool)

(assert (=> b!686931 (= e!391168 e!391170)))

(declare-fun c!77860 () Bool)

(assert (=> b!686931 (= c!77860 (= k!2843 (h!14090 lt!315147)))))

(declare-fun b!686932 () Bool)

(assert (=> b!686932 (= e!391170 (Cons!13045 (h!14090 lt!315147) call!34117))))

(declare-fun bm!34114 () Bool)

(assert (=> bm!34114 (= call!34117 (-!177 (t!19304 lt!315147) k!2843))))

(assert (= (and d!94807 c!77859) b!686931))

(assert (= (and d!94807 (not c!77859)) b!686930))

(assert (= (and b!686931 c!77860) b!686928))

(assert (= (and b!686931 (not c!77860)) b!686932))

(assert (= (or b!686928 b!686932) bm!34114))

(assert (= (and d!94807 res!451944) b!686929))

(declare-fun m!650987 () Bool)

(assert (=> d!94807 m!650987))

(declare-fun m!650989 () Bool)

(assert (=> d!94807 m!650989))

(declare-fun m!650991 () Bool)

(assert (=> b!686929 m!650991))

(declare-fun m!650993 () Bool)

(assert (=> b!686929 m!650993))

(declare-fun m!650995 () Bool)

(assert (=> b!686929 m!650995))

(declare-fun m!650997 () Bool)

(assert (=> bm!34114 m!650997))

(assert (=> b!686657 d!94807))

(declare-fun d!94821 () Bool)

(declare-fun res!451947 () Bool)

(declare-fun e!391173 () Bool)

(assert (=> d!94821 (=> res!451947 e!391173)))

(assert (=> d!94821 (= res!451947 (= (select (arr!19008 (array!39665 (store (arr!19008 a!3626) i!1382 k!2843) (size!19382 a!3626))) from!3004) k!2843))))

(assert (=> d!94821 (= (arrayContainsKey!0 (array!39665 (store (arr!19008 a!3626) i!1382 k!2843) (size!19382 a!3626)) k!2843 from!3004) e!391173)))

(declare-fun b!686935 () Bool)

(declare-fun e!391174 () Bool)

(assert (=> b!686935 (= e!391173 e!391174)))

(declare-fun res!451948 () Bool)

(assert (=> b!686935 (=> (not res!451948) (not e!391174))))

(assert (=> b!686935 (= res!451948 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19382 (array!39665 (store (arr!19008 a!3626) i!1382 k!2843) (size!19382 a!3626)))))))

(declare-fun b!686936 () Bool)

(assert (=> b!686936 (= e!391174 (arrayContainsKey!0 (array!39665 (store (arr!19008 a!3626) i!1382 k!2843) (size!19382 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94821 (not res!451947)) b!686935))

(assert (= (and b!686935 res!451948) b!686936))

(declare-fun m!651003 () Bool)

(assert (=> d!94821 m!651003))

(declare-fun m!651005 () Bool)

(assert (=> b!686936 m!651005))

(assert (=> b!686657 d!94821))

(declare-fun b!686937 () Bool)

(declare-fun e!391178 () Bool)

(declare-fun e!391175 () Bool)

(assert (=> b!686937 (= e!391178 e!391175)))

(declare-fun res!451950 () Bool)

(assert (=> b!686937 (=> (not res!451950) (not e!391175))))

(declare-fun e!391176 () Bool)

(assert (=> b!686937 (= res!451950 (not e!391176))))

(declare-fun res!451949 () Bool)

(assert (=> b!686937 (=> (not res!451949) (not e!391176))))

(assert (=> b!686937 (= res!451949 (validKeyInArray!0 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun c!77861 () Bool)

(declare-fun bm!34115 () Bool)

(declare-fun call!34118 () Bool)

(assert (=> bm!34115 (= call!34118 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77861 (Cons!13045 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315147) lt!315147)))))

(declare-fun b!686938 () Bool)

(declare-fun e!391177 () Bool)

(assert (=> b!686938 (= e!391177 call!34118)))

(declare-fun d!94825 () Bool)

(declare-fun res!451951 () Bool)

(assert (=> d!94825 (=> res!451951 e!391178)))

(assert (=> d!94825 (= res!451951 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19382 a!3626)))))

(assert (=> d!94825 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315147) e!391178)))

(declare-fun b!686939 () Bool)

(assert (=> b!686939 (= e!391176 (contains!3626 lt!315147 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686940 () Bool)

(assert (=> b!686940 (= e!391177 call!34118)))

(declare-fun b!686941 () Bool)

(assert (=> b!686941 (= e!391175 e!391177)))

(assert (=> b!686941 (= c!77861 (validKeyInArray!0 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94825 (not res!451951)) b!686937))

(assert (= (and b!686937 res!451949) b!686939))

(assert (= (and b!686937 res!451950) b!686941))

(assert (= (and b!686941 c!77861) b!686938))

(assert (= (and b!686941 (not c!77861)) b!686940))

(assert (= (or b!686938 b!686940) bm!34115))

(assert (=> b!686937 m!650937))

(assert (=> b!686937 m!650937))

(declare-fun m!651011 () Bool)

(assert (=> b!686937 m!651011))

(assert (=> bm!34115 m!650937))

(declare-fun m!651013 () Bool)

(assert (=> bm!34115 m!651013))

(assert (=> b!686939 m!650937))

(assert (=> b!686939 m!650937))

(declare-fun m!651017 () Bool)

(assert (=> b!686939 m!651017))

(assert (=> b!686941 m!650937))

(assert (=> b!686941 m!650937))

(assert (=> b!686941 m!651011))

(assert (=> b!686657 d!94825))

(declare-fun d!94831 () Bool)

(declare-fun res!451974 () Bool)

(declare-fun e!391201 () Bool)

(assert (=> d!94831 (=> res!451974 e!391201)))

(assert (=> d!94831 (= res!451974 (is-Nil!13046 acc!681))))

(assert (=> d!94831 (= (subseq!212 acc!681 acc!681) e!391201)))

(declare-fun b!686968 () Bool)

(declare-fun e!391203 () Bool)

(declare-fun e!391204 () Bool)

(assert (=> b!686968 (= e!391203 e!391204)))

(declare-fun res!451973 () Bool)

(assert (=> b!686968 (=> res!451973 e!391204)))

(declare-fun e!391202 () Bool)

(assert (=> b!686968 (= res!451973 e!391202)))

(declare-fun res!451971 () Bool)

(assert (=> b!686968 (=> (not res!451971) (not e!391202))))

(assert (=> b!686968 (= res!451971 (= (h!14090 acc!681) (h!14090 acc!681)))))

(declare-fun b!686967 () Bool)

(assert (=> b!686967 (= e!391201 e!391203)))

(declare-fun res!451972 () Bool)

(assert (=> b!686967 (=> (not res!451972) (not e!391203))))

(assert (=> b!686967 (= res!451972 (is-Cons!13045 acc!681))))

(declare-fun b!686970 () Bool)

(assert (=> b!686970 (= e!391204 (subseq!212 acc!681 (t!19304 acc!681)))))

(declare-fun b!686969 () Bool)

(assert (=> b!686969 (= e!391202 (subseq!212 (t!19304 acc!681) (t!19304 acc!681)))))

(assert (= (and d!94831 (not res!451974)) b!686967))

(assert (= (and b!686967 res!451972) b!686968))

(assert (= (and b!686968 res!451971) b!686969))

(assert (= (and b!686968 (not res!451973)) b!686970))

(declare-fun m!651029 () Bool)

(assert (=> b!686970 m!651029))

(declare-fun m!651031 () Bool)

(assert (=> b!686969 m!651031))

(assert (=> b!686657 d!94831))

(declare-fun d!94843 () Bool)

(assert (=> d!94843 (subseq!212 acc!681 acc!681)))

(declare-fun lt!315246 () Unit!24207)

(declare-fun choose!36 (List!13049) Unit!24207)

(assert (=> d!94843 (= lt!315246 (choose!36 acc!681))))

(assert (=> d!94843 (= (lemmaListSubSeqRefl!0 acc!681) lt!315246)))

(declare-fun bs!20138 () Bool)

(assert (= bs!20138 d!94843))

(assert (=> bs!20138 m!650773))

(declare-fun m!651045 () Bool)

(assert (=> bs!20138 m!651045))

(assert (=> b!686657 d!94843))

(declare-fun d!94851 () Bool)

(assert (=> d!94851 (= (validKeyInArray!0 (select (arr!19008 a!3626) from!3004)) (and (not (= (select (arr!19008 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19008 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686657 d!94851))

(declare-fun d!94855 () Bool)

(assert (=> d!94855 (= ($colon$colon!377 acc!681 k!2843) (Cons!13045 k!2843 acc!681))))

(assert (=> b!686657 d!94855))

(declare-fun b!686980 () Bool)

(declare-fun e!391216 () Bool)

(declare-fun e!391213 () Bool)

(assert (=> b!686980 (= e!391216 e!391213)))

(declare-fun res!451983 () Bool)

(assert (=> b!686980 (=> (not res!451983) (not e!391213))))

(declare-fun e!391214 () Bool)

(assert (=> b!686980 (= res!451983 (not e!391214))))

(declare-fun res!451982 () Bool)

(assert (=> b!686980 (=> (not res!451982) (not e!391214))))

(assert (=> b!686980 (= res!451982 (validKeyInArray!0 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34120 () Bool)

(declare-fun call!34123 () Bool)

(declare-fun c!77866 () Bool)

(assert (=> bm!34120 (= call!34123 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77866 (Cons!13045 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!686981 () Bool)

(declare-fun e!391215 () Bool)

(assert (=> b!686981 (= e!391215 call!34123)))

(declare-fun d!94859 () Bool)

(declare-fun res!451984 () Bool)

(assert (=> d!94859 (=> res!451984 e!391216)))

(assert (=> d!94859 (= res!451984 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19382 a!3626)))))

(assert (=> d!94859 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391216)))

(declare-fun b!686982 () Bool)

(assert (=> b!686982 (= e!391214 (contains!3626 acc!681 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686983 () Bool)

(assert (=> b!686983 (= e!391215 call!34123)))

(declare-fun b!686984 () Bool)

(assert (=> b!686984 (= e!391213 e!391215)))

(assert (=> b!686984 (= c!77866 (validKeyInArray!0 (select (arr!19008 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94859 (not res!451984)) b!686980))

(assert (= (and b!686980 res!451982) b!686982))

(assert (= (and b!686980 res!451983) b!686984))

(assert (= (and b!686984 c!77866) b!686981))

(assert (= (and b!686984 (not c!77866)) b!686983))

(assert (= (or b!686981 b!686983) bm!34120))

(assert (=> b!686980 m!650937))

(assert (=> b!686980 m!650937))

(assert (=> b!686980 m!651011))

(assert (=> bm!34120 m!650937))

(declare-fun m!651053 () Bool)

(assert (=> bm!34120 m!651053))

(assert (=> b!686982 m!650937))

(assert (=> b!686982 m!650937))

(declare-fun m!651055 () Bool)

(assert (=> b!686982 m!651055))

(assert (=> b!686984 m!650937))

(assert (=> b!686984 m!650937))

(assert (=> b!686984 m!651011))

(assert (=> b!686657 d!94859))

(declare-fun d!94865 () Bool)

(assert (=> d!94865 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315147)))

(declare-fun lt!315258 () Unit!24207)

(declare-fun choose!66 (array!39664 (_ BitVec 64) (_ BitVec 32) List!13049 List!13049) Unit!24207)

(assert (=> d!94865 (= lt!315258 (choose!66 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315147))))

(assert (=> d!94865 (bvslt (size!19382 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94865 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315147) lt!315258)))

(declare-fun bs!20142 () Bool)

(assert (= bs!20142 d!94865))

(assert (=> bs!20142 m!650767))

(declare-fun m!651061 () Bool)

(assert (=> bs!20142 m!651061))

(assert (=> b!686657 d!94865))

(declare-fun b!686996 () Bool)

(declare-fun e!391230 () Bool)

(declare-fun e!391227 () Bool)

(assert (=> b!686996 (= e!391230 e!391227)))

(declare-fun res!451995 () Bool)

(assert (=> b!686996 (=> (not res!451995) (not e!391227))))

(declare-fun e!391228 () Bool)

(assert (=> b!686996 (= res!451995 (not e!391228))))

(declare-fun res!451994 () Bool)

(assert (=> b!686996 (=> (not res!451994) (not e!391228))))

(assert (=> b!686996 (= res!451994 (validKeyInArray!0 (select (arr!19008 a!3626) from!3004)))))

(declare-fun c!77868 () Bool)

(declare-fun call!34125 () Bool)

(declare-fun bm!34122 () Bool)

(assert (=> bm!34122 (= call!34125 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77868 (Cons!13045 (select (arr!19008 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!686997 () Bool)

(declare-fun e!391229 () Bool)

(assert (=> b!686997 (= e!391229 call!34125)))

(declare-fun d!94873 () Bool)

(declare-fun res!451996 () Bool)

(assert (=> d!94873 (=> res!451996 e!391230)))

(assert (=> d!94873 (= res!451996 (bvsge from!3004 (size!19382 a!3626)))))

(assert (=> d!94873 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391230)))

(declare-fun b!686998 () Bool)

(assert (=> b!686998 (= e!391228 (contains!3626 acc!681 (select (arr!19008 a!3626) from!3004)))))

(declare-fun b!686999 () Bool)

(assert (=> b!686999 (= e!391229 call!34125)))

(declare-fun b!687000 () Bool)

(assert (=> b!687000 (= e!391227 e!391229)))

(assert (=> b!687000 (= c!77868 (validKeyInArray!0 (select (arr!19008 a!3626) from!3004)))))

(assert (= (and d!94873 (not res!451996)) b!686996))

(assert (= (and b!686996 res!451994) b!686998))

(assert (= (and b!686996 res!451995) b!687000))

(assert (= (and b!687000 c!77868) b!686997))

(assert (= (and b!687000 (not c!77868)) b!686999))

(assert (= (or b!686997 b!686999) bm!34122))

(assert (=> b!686996 m!650753))

(assert (=> b!686996 m!650753))

(assert (=> b!686996 m!650769))

(assert (=> bm!34122 m!650753))

(declare-fun m!651077 () Bool)

(assert (=> bm!34122 m!651077))

(assert (=> b!686998 m!650753))

(assert (=> b!686998 m!650753))

(declare-fun m!651079 () Bool)

(assert (=> b!686998 m!651079))

(assert (=> b!687000 m!650753))

(assert (=> b!687000 m!650753))

(assert (=> b!687000 m!650769))

(assert (=> b!686656 d!94873))

(declare-fun d!94881 () Bool)

(declare-fun lt!315261 () Bool)

(assert (=> d!94881 (= lt!315261 (set.member k!2843 (content!296 acc!681)))))

(declare-fun e!391245 () Bool)

(assert (=> d!94881 (= lt!315261 e!391245)))

(declare-fun res!452011 () Bool)

(assert (=> d!94881 (=> (not res!452011) (not e!391245))))

(assert (=> d!94881 (= res!452011 (is-Cons!13045 acc!681))))

(assert (=> d!94881 (= (contains!3626 acc!681 k!2843) lt!315261)))

(declare-fun b!687015 () Bool)

(declare-fun e!391246 () Bool)

(assert (=> b!687015 (= e!391245 e!391246)))

(declare-fun res!452012 () Bool)

(assert (=> b!687015 (=> res!452012 e!391246)))

(assert (=> b!687015 (= res!452012 (= (h!14090 acc!681) k!2843))))

(declare-fun b!687016 () Bool)

(assert (=> b!687016 (= e!391246 (contains!3626 (t!19304 acc!681) k!2843))))

(assert (= (and d!94881 res!452011) b!687015))

(assert (= (and b!687015 (not res!452012)) b!687016))

(declare-fun m!651085 () Bool)

(assert (=> d!94881 m!651085))

(declare-fun m!651087 () Bool)

(assert (=> d!94881 m!651087))

(declare-fun m!651089 () Bool)

(assert (=> b!687016 m!651089))

(assert (=> b!686667 d!94881))

(declare-fun d!94889 () Bool)

(declare-fun lt!315262 () Bool)

(assert (=> d!94889 (= lt!315262 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!296 acc!681)))))

(declare-fun e!391247 () Bool)

(assert (=> d!94889 (= lt!315262 e!391247)))

(declare-fun res!452013 () Bool)

(assert (=> d!94889 (=> (not res!452013) (not e!391247))))

(assert (=> d!94889 (= res!452013 (is-Cons!13045 acc!681))))

(assert (=> d!94889 (= (contains!3626 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315262)))

(declare-fun b!687017 () Bool)

(declare-fun e!391248 () Bool)

(assert (=> b!687017 (= e!391247 e!391248)))

(declare-fun res!452014 () Bool)

(assert (=> b!687017 (=> res!452014 e!391248)))

(assert (=> b!687017 (= res!452014 (= (h!14090 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687018 () Bool)

(assert (=> b!687018 (= e!391248 (contains!3626 (t!19304 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94889 res!452013) b!687017))

(assert (= (and b!687017 (not res!452014)) b!687018))

(assert (=> d!94889 m!651085))

