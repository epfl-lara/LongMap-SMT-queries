; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61952 () Bool)

(assert start!61952)

(declare-fun b!692829 () Bool)

(declare-fun e!394209 () Bool)

(declare-fun e!394205 () Bool)

(assert (=> b!692829 (= e!394209 e!394205)))

(declare-fun res!457168 () Bool)

(assert (=> b!692829 (=> (not res!457168) (not e!394205))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!692829 (= res!457168 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39849 0))(
  ( (array!39850 (arr!19088 (Array (_ BitVec 32) (_ BitVec 64))) (size!19470 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39849)

(declare-datatypes ((List!13168 0))(
  ( (Nil!13165) (Cons!13164 (h!14209 (_ BitVec 64)) (t!19435 List!13168)) )
))
(declare-fun lt!316451 () List!13168)

(declare-fun acc!681 () List!13168)

(declare-fun $colon$colon!418 (List!13168 (_ BitVec 64)) List!13168)

(assert (=> b!692829 (= lt!316451 ($colon$colon!418 acc!681 (select (arr!19088 a!3626) from!3004)))))

(declare-fun b!692830 () Bool)

(declare-fun res!457171 () Bool)

(declare-fun e!394207 () Bool)

(assert (=> b!692830 (=> (not res!457171) (not e!394207))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692830 (= res!457171 (validKeyInArray!0 k0!2843))))

(declare-fun b!692831 () Bool)

(assert (=> b!692831 (= e!394205 false)))

(declare-fun lt!316449 () Bool)

(declare-fun e!394201 () Bool)

(assert (=> b!692831 (= lt!316449 e!394201)))

(declare-fun res!457166 () Bool)

(assert (=> b!692831 (=> res!457166 e!394201)))

(declare-fun e!394210 () Bool)

(assert (=> b!692831 (= res!457166 e!394210)))

(declare-fun res!457161 () Bool)

(assert (=> b!692831 (=> (not res!457161) (not e!394210))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692831 (= res!457161 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692832 () Bool)

(declare-fun res!457151 () Bool)

(assert (=> b!692832 (=> (not res!457151) (not e!394207))))

(declare-fun arrayNoDuplicates!0 (array!39849 (_ BitVec 32) List!13168) Bool)

(assert (=> b!692832 (= res!457151 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692833 () Bool)

(declare-fun res!457167 () Bool)

(assert (=> b!692833 (=> (not res!457167) (not e!394207))))

(declare-fun contains!3690 (List!13168 (_ BitVec 64)) Bool)

(assert (=> b!692833 (= res!457167 (not (contains!3690 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692834 () Bool)

(declare-fun res!457170 () Bool)

(assert (=> b!692834 (=> (not res!457170) (not e!394205))))

(declare-fun noDuplicate!959 (List!13168) Bool)

(assert (=> b!692834 (= res!457170 (noDuplicate!959 lt!316451))))

(declare-fun b!692835 () Bool)

(declare-datatypes ((Unit!24452 0))(
  ( (Unit!24453) )
))
(declare-fun e!394202 () Unit!24452)

(declare-fun Unit!24454 () Unit!24452)

(assert (=> b!692835 (= e!394202 Unit!24454)))

(declare-fun b!692836 () Bool)

(declare-fun e!394204 () Bool)

(assert (=> b!692836 (= e!394201 e!394204)))

(declare-fun res!457164 () Bool)

(assert (=> b!692836 (=> (not res!457164) (not e!394204))))

(assert (=> b!692836 (= res!457164 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692837 () Bool)

(declare-fun res!457162 () Bool)

(assert (=> b!692837 (=> (not res!457162) (not e!394207))))

(declare-fun e!394208 () Bool)

(assert (=> b!692837 (= res!457162 e!394208)))

(declare-fun res!457158 () Bool)

(assert (=> b!692837 (=> res!457158 e!394208)))

(declare-fun e!394203 () Bool)

(assert (=> b!692837 (= res!457158 e!394203)))

(declare-fun res!457156 () Bool)

(assert (=> b!692837 (=> (not res!457156) (not e!394203))))

(assert (=> b!692837 (= res!457156 (bvsgt from!3004 i!1382))))

(declare-fun b!692838 () Bool)

(declare-fun e!394206 () Bool)

(assert (=> b!692838 (= e!394206 (not (contains!3690 acc!681 k0!2843)))))

(declare-fun b!692839 () Bool)

(declare-fun res!457159 () Bool)

(assert (=> b!692839 (=> (not res!457159) (not e!394207))))

(assert (=> b!692839 (= res!457159 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13165))))

(declare-fun b!692840 () Bool)

(assert (=> b!692840 (= e!394203 (contains!3690 acc!681 k0!2843))))

(declare-fun b!692841 () Bool)

(declare-fun res!457152 () Bool)

(assert (=> b!692841 (=> (not res!457152) (not e!394207))))

(declare-fun arrayContainsKey!0 (array!39849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692841 (= res!457152 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692842 () Bool)

(declare-fun res!457155 () Bool)

(assert (=> b!692842 (=> (not res!457155) (not e!394207))))

(assert (=> b!692842 (= res!457155 (noDuplicate!959 acc!681))))

(declare-fun b!692843 () Bool)

(assert (=> b!692843 (= e!394207 e!394209)))

(declare-fun res!457149 () Bool)

(assert (=> b!692843 (=> (not res!457149) (not e!394209))))

(assert (=> b!692843 (= res!457149 (not (= (select (arr!19088 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316450 () Unit!24452)

(assert (=> b!692843 (= lt!316450 e!394202)))

(declare-fun c!78207 () Bool)

(assert (=> b!692843 (= c!78207 (= (select (arr!19088 a!3626) from!3004) k0!2843))))

(declare-fun b!692844 () Bool)

(declare-fun res!457150 () Bool)

(assert (=> b!692844 (=> (not res!457150) (not e!394207))))

(assert (=> b!692844 (= res!457150 (not (contains!3690 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692845 () Bool)

(declare-fun res!457169 () Bool)

(assert (=> b!692845 (=> (not res!457169) (not e!394207))))

(assert (=> b!692845 (= res!457169 (validKeyInArray!0 (select (arr!19088 a!3626) from!3004)))))

(declare-fun b!692846 () Bool)

(assert (=> b!692846 (= e!394204 (not (contains!3690 lt!316451 k0!2843)))))

(declare-fun b!692847 () Bool)

(declare-fun res!457153 () Bool)

(assert (=> b!692847 (=> (not res!457153) (not e!394205))))

(assert (=> b!692847 (= res!457153 (not (contains!3690 lt!316451 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692848 () Bool)

(declare-fun Unit!24455 () Unit!24452)

(assert (=> b!692848 (= e!394202 Unit!24455)))

(assert (=> b!692848 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316452 () Unit!24452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39849 (_ BitVec 64) (_ BitVec 32)) Unit!24452)

(assert (=> b!692848 (= lt!316452 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692848 false))

(declare-fun b!692849 () Bool)

(assert (=> b!692849 (= e!394208 e!394206)))

(declare-fun res!457160 () Bool)

(assert (=> b!692849 (=> (not res!457160) (not e!394206))))

(assert (=> b!692849 (= res!457160 (bvsle from!3004 i!1382))))

(declare-fun b!692850 () Bool)

(assert (=> b!692850 (= e!394210 (contains!3690 lt!316451 k0!2843))))

(declare-fun res!457157 () Bool)

(assert (=> start!61952 (=> (not res!457157) (not e!394207))))

(assert (=> start!61952 (= res!457157 (and (bvslt (size!19470 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19470 a!3626))))))

(assert (=> start!61952 e!394207))

(assert (=> start!61952 true))

(declare-fun array_inv!14971 (array!39849) Bool)

(assert (=> start!61952 (array_inv!14971 a!3626)))

(declare-fun b!692851 () Bool)

(declare-fun res!457165 () Bool)

(assert (=> b!692851 (=> (not res!457165) (not e!394207))))

(assert (=> b!692851 (= res!457165 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19470 a!3626))))))

(declare-fun b!692852 () Bool)

(declare-fun res!457163 () Bool)

(assert (=> b!692852 (=> (not res!457163) (not e!394207))))

(assert (=> b!692852 (= res!457163 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19470 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692853 () Bool)

(declare-fun res!457154 () Bool)

(assert (=> b!692853 (=> (not res!457154) (not e!394205))))

(assert (=> b!692853 (= res!457154 (not (contains!3690 lt!316451 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61952 res!457157) b!692842))

(assert (= (and b!692842 res!457155) b!692844))

(assert (= (and b!692844 res!457150) b!692833))

(assert (= (and b!692833 res!457167) b!692837))

(assert (= (and b!692837 res!457156) b!692840))

(assert (= (and b!692837 (not res!457158)) b!692849))

(assert (= (and b!692849 res!457160) b!692838))

(assert (= (and b!692837 res!457162) b!692839))

(assert (= (and b!692839 res!457159) b!692832))

(assert (= (and b!692832 res!457151) b!692851))

(assert (= (and b!692851 res!457165) b!692830))

(assert (= (and b!692830 res!457171) b!692841))

(assert (= (and b!692841 res!457152) b!692852))

(assert (= (and b!692852 res!457163) b!692845))

(assert (= (and b!692845 res!457169) b!692843))

(assert (= (and b!692843 c!78207) b!692848))

(assert (= (and b!692843 (not c!78207)) b!692835))

(assert (= (and b!692843 res!457149) b!692829))

(assert (= (and b!692829 res!457168) b!692834))

(assert (= (and b!692834 res!457170) b!692853))

(assert (= (and b!692853 res!457154) b!692847))

(assert (= (and b!692847 res!457153) b!692831))

(assert (= (and b!692831 res!457161) b!692850))

(assert (= (and b!692831 (not res!457166)) b!692836))

(assert (= (and b!692836 res!457164) b!692846))

(declare-fun m!654747 () Bool)

(assert (=> b!692848 m!654747))

(declare-fun m!654749 () Bool)

(assert (=> b!692848 m!654749))

(declare-fun m!654751 () Bool)

(assert (=> b!692838 m!654751))

(declare-fun m!654753 () Bool)

(assert (=> b!692833 m!654753))

(declare-fun m!654755 () Bool)

(assert (=> b!692841 m!654755))

(declare-fun m!654757 () Bool)

(assert (=> b!692847 m!654757))

(declare-fun m!654759 () Bool)

(assert (=> b!692853 m!654759))

(declare-fun m!654761 () Bool)

(assert (=> b!692850 m!654761))

(assert (=> b!692846 m!654761))

(declare-fun m!654763 () Bool)

(assert (=> b!692830 m!654763))

(declare-fun m!654765 () Bool)

(assert (=> b!692839 m!654765))

(assert (=> b!692840 m!654751))

(declare-fun m!654767 () Bool)

(assert (=> b!692842 m!654767))

(declare-fun m!654769 () Bool)

(assert (=> start!61952 m!654769))

(declare-fun m!654771 () Bool)

(assert (=> b!692843 m!654771))

(assert (=> b!692845 m!654771))

(assert (=> b!692845 m!654771))

(declare-fun m!654773 () Bool)

(assert (=> b!692845 m!654773))

(declare-fun m!654775 () Bool)

(assert (=> b!692844 m!654775))

(declare-fun m!654777 () Bool)

(assert (=> b!692834 m!654777))

(declare-fun m!654779 () Bool)

(assert (=> b!692832 m!654779))

(assert (=> b!692829 m!654771))

(assert (=> b!692829 m!654771))

(declare-fun m!654781 () Bool)

(assert (=> b!692829 m!654781))

(check-sat (not b!692842) (not b!692853) (not b!692841) (not b!692832) (not b!692833) (not b!692847) (not b!692829) (not b!692834) (not b!692830) (not b!692839) (not b!692838) (not b!692844) (not b!692845) (not b!692846) (not b!692840) (not b!692850) (not start!61952) (not b!692848))
(check-sat)
