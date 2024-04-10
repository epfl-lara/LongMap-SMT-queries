; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63446 () Bool)

(assert start!63446)

(declare-fun b!714737 () Bool)

(declare-fun res!477773 () Bool)

(declare-fun e!401602 () Bool)

(assert (=> b!714737 (=> (not res!477773) (not e!401602))))

(declare-datatypes ((List!13432 0))(
  ( (Nil!13429) (Cons!13428 (h!14473 (_ BitVec 64)) (t!19747 List!13432)) )
))
(declare-fun acc!652 () List!13432)

(declare-fun contains!4009 (List!13432 (_ BitVec 64)) Bool)

(assert (=> b!714737 (= res!477773 (not (contains!4009 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714738 () Bool)

(declare-fun res!477784 () Bool)

(assert (=> b!714738 (=> (not res!477784) (not e!401602))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!714738 (= res!477784 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714739 () Bool)

(declare-fun res!477776 () Bool)

(assert (=> b!714739 (=> (not res!477776) (not e!401602))))

(declare-fun newAcc!49 () List!13432)

(declare-fun noDuplicate!1256 (List!13432) Bool)

(assert (=> b!714739 (= res!477776 (noDuplicate!1256 newAcc!49))))

(declare-fun b!714741 () Bool)

(declare-fun res!477767 () Bool)

(assert (=> b!714741 (=> (not res!477767) (not e!401602))))

(declare-datatypes ((array!40505 0))(
  ( (array!40506 (arr!19391 (Array (_ BitVec 32) (_ BitVec 64))) (size!19804 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40505)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714741 (= res!477767 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714742 () Bool)

(declare-fun res!477772 () Bool)

(assert (=> b!714742 (=> (not res!477772) (not e!401602))))

(declare-fun subseq!454 (List!13432 List!13432) Bool)

(assert (=> b!714742 (= res!477772 (subseq!454 acc!652 newAcc!49))))

(declare-fun b!714743 () Bool)

(declare-fun res!477778 () Bool)

(assert (=> b!714743 (=> (not res!477778) (not e!401602))))

(assert (=> b!714743 (= res!477778 (not (contains!4009 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714744 () Bool)

(declare-fun res!477780 () Bool)

(assert (=> b!714744 (=> (not res!477780) (not e!401602))))

(declare-fun -!419 (List!13432 (_ BitVec 64)) List!13432)

(assert (=> b!714744 (= res!477780 (= (-!419 newAcc!49 k!2824) acc!652))))

(declare-fun b!714745 () Bool)

(declare-fun res!477779 () Bool)

(assert (=> b!714745 (=> (not res!477779) (not e!401602))))

(assert (=> b!714745 (= res!477779 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19804 a!3591)))))

(declare-fun b!714746 () Bool)

(declare-fun res!477771 () Bool)

(assert (=> b!714746 (=> (not res!477771) (not e!401602))))

(assert (=> b!714746 (= res!477771 (noDuplicate!1256 acc!652))))

(declare-fun b!714747 () Bool)

(declare-fun res!477781 () Bool)

(assert (=> b!714747 (=> (not res!477781) (not e!401602))))

(assert (=> b!714747 (= res!477781 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714748 () Bool)

(declare-fun res!477782 () Bool)

(assert (=> b!714748 (=> (not res!477782) (not e!401602))))

(assert (=> b!714748 (= res!477782 (not (contains!4009 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714749 () Bool)

(declare-fun res!477770 () Bool)

(assert (=> b!714749 (=> (not res!477770) (not e!401602))))

(declare-fun arrayNoDuplicates!0 (array!40505 (_ BitVec 32) List!13432) Bool)

(assert (=> b!714749 (= res!477770 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714750 () Bool)

(declare-fun res!477769 () Bool)

(assert (=> b!714750 (=> (not res!477769) (not e!401602))))

(assert (=> b!714750 (= res!477769 (contains!4009 newAcc!49 k!2824))))

(declare-fun b!714751 () Bool)

(assert (=> b!714751 (= e!401602 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652)))))

(declare-fun b!714752 () Bool)

(declare-fun res!477777 () Bool)

(assert (=> b!714752 (=> (not res!477777) (not e!401602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714752 (= res!477777 (not (validKeyInArray!0 (select (arr!19391 a!3591) from!2969))))))

(declare-fun b!714753 () Bool)

(declare-fun res!477775 () Bool)

(assert (=> b!714753 (=> (not res!477775) (not e!401602))))

(assert (=> b!714753 (= res!477775 (not (contains!4009 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714754 () Bool)

(declare-fun res!477774 () Bool)

(assert (=> b!714754 (=> (not res!477774) (not e!401602))))

(assert (=> b!714754 (= res!477774 (not (contains!4009 acc!652 k!2824)))))

(declare-fun b!714740 () Bool)

(declare-fun res!477768 () Bool)

(assert (=> b!714740 (=> (not res!477768) (not e!401602))))

(assert (=> b!714740 (= res!477768 (validKeyInArray!0 k!2824))))

(declare-fun res!477783 () Bool)

(assert (=> start!63446 (=> (not res!477783) (not e!401602))))

(assert (=> start!63446 (= res!477783 (and (bvslt (size!19804 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19804 a!3591))))))

(assert (=> start!63446 e!401602))

(assert (=> start!63446 true))

(declare-fun array_inv!15187 (array!40505) Bool)

(assert (=> start!63446 (array_inv!15187 a!3591)))

(assert (= (and start!63446 res!477783) b!714746))

(assert (= (and b!714746 res!477771) b!714739))

(assert (= (and b!714739 res!477776) b!714737))

(assert (= (and b!714737 res!477773) b!714753))

(assert (= (and b!714753 res!477775) b!714741))

(assert (= (and b!714741 res!477767) b!714754))

(assert (= (and b!714754 res!477774) b!714740))

(assert (= (and b!714740 res!477768) b!714749))

(assert (= (and b!714749 res!477770) b!714742))

(assert (= (and b!714742 res!477772) b!714750))

(assert (= (and b!714750 res!477769) b!714744))

(assert (= (and b!714744 res!477780) b!714748))

(assert (= (and b!714748 res!477782) b!714743))

(assert (= (and b!714743 res!477778) b!714745))

(assert (= (and b!714745 res!477779) b!714752))

(assert (= (and b!714752 res!477777) b!714738))

(assert (= (and b!714738 res!477784) b!714747))

(assert (= (and b!714747 res!477781) b!714751))

(declare-fun m!671173 () Bool)

(assert (=> b!714746 m!671173))

(declare-fun m!671175 () Bool)

(assert (=> b!714749 m!671175))

(declare-fun m!671177 () Bool)

(assert (=> b!714752 m!671177))

(assert (=> b!714752 m!671177))

(declare-fun m!671179 () Bool)

(assert (=> b!714752 m!671179))

(declare-fun m!671181 () Bool)

(assert (=> b!714741 m!671181))

(declare-fun m!671183 () Bool)

(assert (=> b!714750 m!671183))

(declare-fun m!671185 () Bool)

(assert (=> b!714742 m!671185))

(declare-fun m!671187 () Bool)

(assert (=> b!714748 m!671187))

(declare-fun m!671189 () Bool)

(assert (=> b!714754 m!671189))

(declare-fun m!671191 () Bool)

(assert (=> b!714739 m!671191))

(declare-fun m!671193 () Bool)

(assert (=> b!714751 m!671193))

(declare-fun m!671195 () Bool)

(assert (=> b!714743 m!671195))

(declare-fun m!671197 () Bool)

(assert (=> b!714744 m!671197))

(declare-fun m!671199 () Bool)

(assert (=> b!714740 m!671199))

(declare-fun m!671201 () Bool)

(assert (=> b!714753 m!671201))

(declare-fun m!671203 () Bool)

(assert (=> b!714737 m!671203))

(declare-fun m!671205 () Bool)

(assert (=> b!714747 m!671205))

(declare-fun m!671207 () Bool)

(assert (=> start!63446 m!671207))

(push 1)

(assert (not b!714739))

(assert (not start!63446))

(assert (not b!714751))

(assert (not b!714748))

(assert (not b!714753))

(assert (not b!714752))

(assert (not b!714744))

(assert (not b!714754))

(assert (not b!714741))

(assert (not b!714746))

(assert (not b!714749))

(assert (not b!714737))

(assert (not b!714742))

(assert (not b!714747))

(assert (not b!714740))

(assert (not b!714750))

(assert (not b!714743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98337 () Bool)

(declare-fun lt!318791 () Bool)

(declare-fun content!368 (List!13432) (Set (_ BitVec 64)))

(assert (=> d!98337 (= lt!318791 (member k!2824 (content!368 acc!652)))))

(declare-fun e!401634 () Bool)

(assert (=> d!98337 (= lt!318791 e!401634)))

(declare-fun res!477815 () Bool)

(assert (=> d!98337 (=> (not res!477815) (not e!401634))))

(assert (=> d!98337 (= res!477815 (is-Cons!13428 acc!652))))

(assert (=> d!98337 (= (contains!4009 acc!652 k!2824) lt!318791)))

(declare-fun b!714785 () Bool)

(declare-fun e!401635 () Bool)

(assert (=> b!714785 (= e!401634 e!401635)))

(declare-fun res!477816 () Bool)

(assert (=> b!714785 (=> res!477816 e!401635)))

(assert (=> b!714785 (= res!477816 (= (h!14473 acc!652) k!2824))))

(declare-fun b!714786 () Bool)

(assert (=> b!714786 (= e!401635 (contains!4009 (t!19747 acc!652) k!2824))))

(assert (= (and d!98337 res!477815) b!714785))

(assert (= (and b!714785 (not res!477816)) b!714786))

(declare-fun m!671239 () Bool)

(assert (=> d!98337 m!671239))

(declare-fun m!671241 () Bool)

(assert (=> d!98337 m!671241))

(declare-fun m!671243 () Bool)

(assert (=> b!714786 m!671243))

(assert (=> b!714754 d!98337))

(declare-fun bm!34617 () Bool)

(declare-fun call!34620 () List!13432)

(assert (=> bm!34617 (= call!34620 (-!419 (t!19747 newAcc!49) k!2824))))

(declare-fun d!98351 () Bool)

(declare-fun e!401677 () Bool)

(assert (=> d!98351 e!401677))

(declare-fun res!477845 () Bool)

(assert (=> d!98351 (=> (not res!477845) (not e!401677))))

(declare-fun lt!318797 () List!13432)

(declare-fun size!19805 (List!13432) Int)

(assert (=> d!98351 (= res!477845 (<= (size!19805 lt!318797) (size!19805 newAcc!49)))))

(declare-fun e!401675 () List!13432)

(assert (=> d!98351 (= lt!318797 e!401675)))

(declare-fun c!78863 () Bool)

(assert (=> d!98351 (= c!78863 (is-Cons!13428 newAcc!49))))

(assert (=> d!98351 (= (-!419 newAcc!49 k!2824) lt!318797)))

(declare-fun b!714835 () Bool)

(assert (=> b!714835 (= e!401675 Nil!13429)))

(declare-fun b!714836 () Bool)

(declare-fun e!401676 () List!13432)

(assert (=> b!714836 (= e!401676 (Cons!13428 (h!14473 newAcc!49) call!34620))))

(declare-fun b!714837 () Bool)

(assert (=> b!714837 (= e!401677 (= (content!368 lt!318797) (setminus (content!368 newAcc!49) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!714838 () Bool)

(assert (=> b!714838 (= e!401676 call!34620)))

(declare-fun b!714839 () Bool)

(assert (=> b!714839 (= e!401675 e!401676)))

(declare-fun c!78862 () Bool)

(assert (=> b!714839 (= c!78862 (= k!2824 (h!14473 newAcc!49)))))

(assert (= (and d!98351 c!78863) b!714839))

(assert (= (and d!98351 (not c!78863)) b!714835))

(assert (= (and b!714839 c!78862) b!714838))

(assert (= (and b!714839 (not c!78862)) b!714836))

(assert (= (or b!714838 b!714836) bm!34617))

(assert (= (and d!98351 res!477845) b!714837))

(declare-fun m!671265 () Bool)

(assert (=> bm!34617 m!671265))

(declare-fun m!671267 () Bool)

(assert (=> d!98351 m!671267))

(declare-fun m!671269 () Bool)

(assert (=> d!98351 m!671269))

(declare-fun m!671271 () Bool)

(assert (=> b!714837 m!671271))

(declare-fun m!671273 () Bool)

(assert (=> b!714837 m!671273))

(declare-fun m!671275 () Bool)

(assert (=> b!714837 m!671275))

(assert (=> b!714744 d!98351))

(declare-fun d!98363 () Bool)

(declare-fun res!477852 () Bool)

(declare-fun e!401684 () Bool)

(assert (=> d!98363 (=> res!477852 e!401684)))

(assert (=> d!98363 (= res!477852 (= (select (arr!19391 a!3591) from!2969) k!2824))))

(assert (=> d!98363 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!401684)))

(declare-fun b!714846 () Bool)

(declare-fun e!401685 () Bool)

(assert (=> b!714846 (= e!401684 e!401685)))

(declare-fun res!477853 () Bool)

(assert (=> b!714846 (=> (not res!477853) (not e!401685))))

(assert (=> b!714846 (= res!477853 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19804 a!3591)))))

(declare-fun b!714847 () Bool)

(assert (=> b!714847 (= e!401685 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98363 (not res!477852)) b!714846))

(assert (= (and b!714846 res!477853) b!714847))

(assert (=> d!98363 m!671177))

(declare-fun m!671283 () Bool)

(assert (=> b!714847 m!671283))

(assert (=> b!714741 d!98363))

(declare-fun d!98371 () Bool)

(assert (=> d!98371 (= (validKeyInArray!0 (select (arr!19391 a!3591) from!2969)) (and (not (= (select (arr!19391 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19391 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714752 d!98371))

(declare-fun d!98373 () Bool)

(declare-fun lt!318801 () Bool)

(assert (=> d!98373 (= lt!318801 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!368 acc!652)))))

(declare-fun e!401695 () Bool)

(assert (=> d!98373 (= lt!318801 e!401695)))

(declare-fun res!477858 () Bool)

(assert (=> d!98373 (=> (not res!477858) (not e!401695))))

(assert (=> d!98373 (= res!477858 (is-Cons!13428 acc!652))))

(assert (=> d!98373 (= (contains!4009 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318801)))

(declare-fun b!714858 () Bool)

(declare-fun e!401696 () Bool)

(assert (=> b!714858 (= e!401695 e!401696)))

(declare-fun res!477859 () Bool)

(assert (=> b!714858 (=> res!477859 e!401696)))

(assert (=> b!714858 (= res!477859 (= (h!14473 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714859 () Bool)

(assert (=> b!714859 (= e!401696 (contains!4009 (t!19747 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98373 res!477858) b!714858))

(assert (= (and b!714858 (not res!477859)) b!714859))

(assert (=> d!98373 m!671239))

(declare-fun m!671285 () Bool)

(assert (=> d!98373 m!671285))

(declare-fun m!671287 () Bool)

(assert (=> b!714859 m!671287))

(assert (=> b!714753 d!98373))

(declare-fun b!714889 () Bool)

(declare-fun e!401723 () Bool)

(assert (=> b!714889 (= e!401723 (subseq!454 (t!19747 acc!652) (t!19747 newAcc!49)))))

(declare-fun d!98375 () Bool)

(declare-fun res!477881 () Bool)

(declare-fun e!401720 () Bool)

(assert (=> d!98375 (=> res!477881 e!401720)))

(assert (=> d!98375 (= res!477881 (is-Nil!13429 acc!652))))

(assert (=> d!98375 (= (subseq!454 acc!652 newAcc!49) e!401720)))

(declare-fun b!714887 () Bool)

(declare-fun e!401722 () Bool)

(assert (=> b!714887 (= e!401720 e!401722)))

(declare-fun res!477884 () Bool)

(assert (=> b!714887 (=> (not res!477884) (not e!401722))))

(assert (=> b!714887 (= res!477884 (is-Cons!13428 newAcc!49))))

(declare-fun b!714888 () Bool)

(declare-fun e!401721 () Bool)

(assert (=> b!714888 (= e!401722 e!401721)))

(declare-fun res!477882 () Bool)

(assert (=> b!714888 (=> res!477882 e!401721)))

(assert (=> b!714888 (= res!477882 e!401723)))

(declare-fun res!477883 () Bool)

(assert (=> b!714888 (=> (not res!477883) (not e!401723))))

(assert (=> b!714888 (= res!477883 (= (h!14473 acc!652) (h!14473 newAcc!49)))))

(declare-fun b!714890 () Bool)

(assert (=> b!714890 (= e!401721 (subseq!454 acc!652 (t!19747 newAcc!49)))))

(assert (= (and d!98375 (not res!477881)) b!714887))

(assert (= (and b!714887 res!477884) b!714888))

(assert (= (and b!714888 res!477883) b!714889))

(assert (= (and b!714888 (not res!477882)) b!714890))

(declare-fun m!671307 () Bool)

(assert (=> b!714889 m!671307))

(declare-fun m!671311 () Bool)

(assert (=> b!714890 m!671311))

(assert (=> b!714742 d!98375))

(declare-fun d!98385 () Bool)

(declare-fun lt!318804 () Bool)

(assert (=> d!98385 (= lt!318804 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!368 newAcc!49)))))

(declare-fun e!401726 () Bool)

(assert (=> d!98385 (= lt!318804 e!401726)))

(declare-fun res!477887 () Bool)

(assert (=> d!98385 (=> (not res!477887) (not e!401726))))

(assert (=> d!98385 (= res!477887 (is-Cons!13428 newAcc!49))))

(assert (=> d!98385 (= (contains!4009 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318804)))

(declare-fun b!714893 () Bool)

(declare-fun e!401727 () Bool)

(assert (=> b!714893 (= e!401726 e!401727)))

(declare-fun res!477888 () Bool)

(assert (=> b!714893 (=> res!477888 e!401727)))

(assert (=> b!714893 (= res!477888 (= (h!14473 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714894 () Bool)

(assert (=> b!714894 (= e!401727 (contains!4009 (t!19747 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98385 res!477887) b!714893))

(assert (= (and b!714893 (not res!477888)) b!714894))

(assert (=> d!98385 m!671273))

(declare-fun m!671315 () Bool)

(assert (=> d!98385 m!671315))

(declare-fun m!671317 () Bool)

(assert (=> b!714894 m!671317))

(assert (=> b!714743 d!98385))

(declare-fun d!98389 () Bool)

(declare-fun res!477930 () Bool)

(declare-fun e!401772 () Bool)

(assert (=> d!98389 (=> res!477930 e!401772)))

(assert (=> d!98389 (= res!477930 (bvsge from!2969 (size!19804 a!3591)))))

(assert (=> d!98389 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401772)))

(declare-fun b!714940 () Bool)

(declare-fun e!401771 () Bool)

(declare-fun call!34627 () Bool)

(assert (=> b!714940 (= e!401771 call!34627)))

(declare-fun b!714941 () Bool)

(declare-fun e!401773 () Bool)

(assert (=> b!714941 (= e!401773 (contains!4009 acc!652 (select (arr!19391 a!3591) from!2969)))))

(declare-fun b!714942 () Bool)

(assert (=> b!714942 (= e!401771 call!34627)))

(declare-fun c!78873 () Bool)

(declare-fun bm!34624 () Bool)

(assert (=> bm!34624 (= call!34627 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78873 (Cons!13428 (select (arr!19391 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!714943 () Bool)

(declare-fun e!401770 () Bool)

(assert (=> b!714943 (= e!401772 e!401770)))

(declare-fun res!477928 () Bool)

(assert (=> b!714943 (=> (not res!477928) (not e!401770))))

(assert (=> b!714943 (= res!477928 (not e!401773))))

(declare-fun res!477929 () Bool)

(assert (=> b!714943 (=> (not res!477929) (not e!401773))))

(assert (=> b!714943 (= res!477929 (validKeyInArray!0 (select (arr!19391 a!3591) from!2969)))))

(declare-fun b!714944 () Bool)

(assert (=> b!714944 (= e!401770 e!401771)))

(assert (=> b!714944 (= c!78873 (validKeyInArray!0 (select (arr!19391 a!3591) from!2969)))))

(assert (= (and d!98389 (not res!477930)) b!714943))

(assert (= (and b!714943 res!477929) b!714941))

(assert (= (and b!714943 res!477928) b!714944))

(assert (= (and b!714944 c!78873) b!714942))

(assert (= (and b!714944 (not c!78873)) b!714940))

(assert (= (or b!714942 b!714940) bm!34624))

(assert (=> b!714941 m!671177))

(assert (=> b!714941 m!671177))

(declare-fun m!671347 () Bool)

(assert (=> b!714941 m!671347))

(assert (=> bm!34624 m!671177))

(declare-fun m!671349 () Bool)

(assert (=> bm!34624 m!671349))

(assert (=> b!714943 m!671177))

(assert (=> b!714943 m!671177))

(assert (=> b!714943 m!671179))

(assert (=> b!714944 m!671177))

(assert (=> b!714944 m!671177))

(assert (=> b!714944 m!671179))

(assert (=> b!714749 d!98389))

(declare-fun d!98403 () Bool)

(declare-fun res!477937 () Bool)

(declare-fun e!401785 () Bool)

(assert (=> d!98403 (=> res!477937 e!401785)))

(assert (=> d!98403 (= res!477937 (is-Nil!13429 newAcc!49))))

(assert (=> d!98403 (= (noDuplicate!1256 newAcc!49) e!401785)))

(declare-fun b!714959 () Bool)

(declare-fun e!401786 () Bool)

(assert (=> b!714959 (= e!401785 e!401786)))

(declare-fun res!477938 () Bool)

(assert (=> b!714959 (=> (not res!477938) (not e!401786))))

(assert (=> b!714959 (= res!477938 (not (contains!4009 (t!19747 newAcc!49) (h!14473 newAcc!49))))))

(declare-fun b!714960 () Bool)

(assert (=> b!714960 (= e!401786 (noDuplicate!1256 (t!19747 newAcc!49)))))

(assert (= (and d!98403 (not res!477937)) b!714959))

(assert (= (and b!714959 res!477938) b!714960))

(declare-fun m!671351 () Bool)

(assert (=> b!714959 m!671351))

(declare-fun m!671353 () Bool)

(assert (=> b!714960 m!671353))

(assert (=> b!714739 d!98403))

(declare-fun d!98405 () Bool)

(declare-fun lt!318810 () Bool)

(assert (=> d!98405 (= lt!318810 (member k!2824 (content!368 newAcc!49)))))

(declare-fun e!401787 () Bool)

(assert (=> d!98405 (= lt!318810 e!401787)))

(declare-fun res!477939 () Bool)

(assert (=> d!98405 (=> (not res!477939) (not e!401787))))

(assert (=> d!98405 (= res!477939 (is-Cons!13428 newAcc!49))))

(assert (=> d!98405 (= (contains!4009 newAcc!49 k!2824) lt!318810)))

(declare-fun b!714961 () Bool)

(declare-fun e!401788 () Bool)

(assert (=> b!714961 (= e!401787 e!401788)))

(declare-fun res!477940 () Bool)

