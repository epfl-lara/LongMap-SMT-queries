; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59980 () Bool)

(assert start!59980)

(declare-fun b!665828 () Bool)

(declare-fun res!433301 () Bool)

(declare-fun e!381483 () Bool)

(assert (=> b!665828 (=> (not res!433301) (not e!381483))))

(declare-datatypes ((array!39027 0))(
  ( (array!39028 (arr!18706 (Array (_ BitVec 32) (_ BitVec 64))) (size!19070 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39027)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12747 0))(
  ( (Nil!12744) (Cons!12743 (h!13788 (_ BitVec 64)) (t!18975 List!12747)) )
))
(declare-fun acc!681 () List!12747)

(declare-fun arrayNoDuplicates!0 (array!39027 (_ BitVec 32) List!12747) Bool)

(assert (=> b!665828 (= res!433301 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665829 () Bool)

(declare-fun res!433315 () Bool)

(assert (=> b!665829 (=> (not res!433315) (not e!381483))))

(assert (=> b!665829 (= res!433315 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12744))))

(declare-fun b!665830 () Bool)

(declare-fun res!433304 () Bool)

(declare-fun e!381485 () Bool)

(assert (=> b!665830 (=> res!433304 e!381485)))

(declare-fun lt!310175 () List!12747)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3324 (List!12747 (_ BitVec 64)) Bool)

(assert (=> b!665830 (= res!433304 (not (contains!3324 lt!310175 k0!2843)))))

(declare-fun b!665831 () Bool)

(declare-fun e!381488 () Bool)

(declare-fun e!381486 () Bool)

(assert (=> b!665831 (= e!381488 e!381486)))

(declare-fun res!433297 () Bool)

(assert (=> b!665831 (=> (not res!433297) (not e!381486))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665831 (= res!433297 (bvsle from!3004 i!1382))))

(declare-fun b!665832 () Bool)

(declare-fun res!433299 () Bool)

(assert (=> b!665832 (=> (not res!433299) (not e!381483))))

(declare-fun noDuplicate!571 (List!12747) Bool)

(assert (=> b!665832 (= res!433299 (noDuplicate!571 acc!681))))

(declare-fun b!665833 () Bool)

(declare-fun res!433307 () Bool)

(assert (=> b!665833 (=> res!433307 e!381485)))

(assert (=> b!665833 (= res!433307 (contains!3324 acc!681 k0!2843))))

(declare-fun b!665834 () Bool)

(assert (=> b!665834 (= e!381486 (not (contains!3324 acc!681 k0!2843)))))

(declare-fun b!665835 () Bool)

(declare-fun res!433310 () Bool)

(assert (=> b!665835 (=> (not res!433310) (not e!381483))))

(assert (=> b!665835 (= res!433310 (not (contains!3324 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665836 () Bool)

(declare-fun res!433312 () Bool)

(assert (=> b!665836 (=> (not res!433312) (not e!381483))))

(assert (=> b!665836 (= res!433312 (not (contains!3324 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665837 () Bool)

(declare-fun res!433309 () Bool)

(assert (=> b!665837 (=> (not res!433309) (not e!381483))))

(declare-fun arrayContainsKey!0 (array!39027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665837 (= res!433309 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665838 () Bool)

(declare-fun res!433305 () Bool)

(assert (=> b!665838 (=> res!433305 e!381485)))

(declare-fun subseq!63 (List!12747 List!12747) Bool)

(assert (=> b!665838 (= res!433305 (not (subseq!63 acc!681 lt!310175)))))

(declare-fun res!433296 () Bool)

(assert (=> start!59980 (=> (not res!433296) (not e!381483))))

(assert (=> start!59980 (= res!433296 (and (bvslt (size!19070 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19070 a!3626))))))

(assert (=> start!59980 e!381483))

(assert (=> start!59980 true))

(declare-fun array_inv!14502 (array!39027) Bool)

(assert (=> start!59980 (array_inv!14502 a!3626)))

(declare-fun b!665839 () Bool)

(declare-fun res!433302 () Bool)

(assert (=> b!665839 (=> (not res!433302) (not e!381483))))

(assert (=> b!665839 (= res!433302 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19070 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665840 () Bool)

(declare-fun e!381489 () Bool)

(assert (=> b!665840 (= e!381489 (contains!3324 acc!681 k0!2843))))

(declare-fun b!665841 () Bool)

(assert (=> b!665841 (= e!381483 (not e!381485))))

(declare-fun res!433311 () Bool)

(assert (=> b!665841 (=> res!433311 e!381485)))

(assert (=> b!665841 (= res!433311 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!61 (List!12747 (_ BitVec 64)) List!12747)

(assert (=> b!665841 (= (-!61 lt!310175 k0!2843) acc!681)))

(declare-fun $colon$colon!195 (List!12747 (_ BitVec 64)) List!12747)

(assert (=> b!665841 (= lt!310175 ($colon$colon!195 acc!681 k0!2843))))

(declare-datatypes ((Unit!23255 0))(
  ( (Unit!23256) )
))
(declare-fun lt!310181 () Unit!23255)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12747) Unit!23255)

(assert (=> b!665841 (= lt!310181 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665841 (subseq!63 acc!681 acc!681)))

(declare-fun lt!310182 () Unit!23255)

(declare-fun lemmaListSubSeqRefl!0 (List!12747) Unit!23255)

(assert (=> b!665841 (= lt!310182 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665841 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310183 () Unit!23255)

(declare-fun e!381487 () Unit!23255)

(assert (=> b!665841 (= lt!310183 e!381487)))

(declare-fun c!76634 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665841 (= c!76634 (validKeyInArray!0 (select (arr!18706 a!3626) from!3004)))))

(declare-fun lt!310179 () Unit!23255)

(declare-fun e!381482 () Unit!23255)

(assert (=> b!665841 (= lt!310179 e!381482)))

(declare-fun c!76633 () Bool)

(declare-fun lt!310178 () Bool)

(assert (=> b!665841 (= c!76633 lt!310178)))

(assert (=> b!665841 (= lt!310178 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665841 (arrayContainsKey!0 (array!39028 (store (arr!18706 a!3626) i!1382 k0!2843) (size!19070 a!3626)) k0!2843 from!3004)))

(declare-fun b!665842 () Bool)

(declare-fun res!433298 () Bool)

(assert (=> b!665842 (=> (not res!433298) (not e!381483))))

(assert (=> b!665842 (= res!433298 e!381488)))

(declare-fun res!433306 () Bool)

(assert (=> b!665842 (=> res!433306 e!381488)))

(assert (=> b!665842 (= res!433306 e!381489)))

(declare-fun res!433300 () Bool)

(assert (=> b!665842 (=> (not res!433300) (not e!381489))))

(assert (=> b!665842 (= res!433300 (bvsgt from!3004 i!1382))))

(declare-fun b!665843 () Bool)

(declare-fun res!433308 () Bool)

(assert (=> b!665843 (=> res!433308 e!381485)))

(assert (=> b!665843 (= res!433308 (contains!3324 lt!310175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665844 () Bool)

(declare-fun Unit!23257 () Unit!23255)

(assert (=> b!665844 (= e!381482 Unit!23257)))

(declare-fun b!665845 () Bool)

(declare-fun res!433313 () Bool)

(assert (=> b!665845 (=> (not res!433313) (not e!381483))))

(assert (=> b!665845 (= res!433313 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19070 a!3626))))))

(declare-fun b!665846 () Bool)

(assert (=> b!665846 (= e!381485 true)))

(declare-fun lt!310176 () Bool)

(assert (=> b!665846 (= lt!310176 (contains!3324 lt!310175 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665847 () Bool)

(declare-fun lt!310174 () Unit!23255)

(assert (=> b!665847 (= e!381487 lt!310174)))

(declare-fun lt!310180 () Unit!23255)

(assert (=> b!665847 (= lt!310180 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665847 (subseq!63 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39027 List!12747 List!12747 (_ BitVec 32)) Unit!23255)

(assert (=> b!665847 (= lt!310174 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!195 acc!681 (select (arr!18706 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665847 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665848 () Bool)

(declare-fun res!433316 () Bool)

(assert (=> b!665848 (=> res!433316 e!381485)))

(assert (=> b!665848 (= res!433316 (not (noDuplicate!571 lt!310175)))))

(declare-fun b!665849 () Bool)

(declare-fun res!433303 () Bool)

(assert (=> b!665849 (=> res!433303 e!381485)))

(assert (=> b!665849 (= res!433303 lt!310178)))

(declare-fun b!665850 () Bool)

(declare-fun res!433314 () Bool)

(assert (=> b!665850 (=> (not res!433314) (not e!381483))))

(assert (=> b!665850 (= res!433314 (validKeyInArray!0 k0!2843))))

(declare-fun b!665851 () Bool)

(declare-fun Unit!23258 () Unit!23255)

(assert (=> b!665851 (= e!381487 Unit!23258)))

(declare-fun b!665852 () Bool)

(declare-fun Unit!23259 () Unit!23255)

(assert (=> b!665852 (= e!381482 Unit!23259)))

(declare-fun lt!310177 () Unit!23255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39027 (_ BitVec 64) (_ BitVec 32)) Unit!23255)

(assert (=> b!665852 (= lt!310177 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665852 false))

(assert (= (and start!59980 res!433296) b!665832))

(assert (= (and b!665832 res!433299) b!665835))

(assert (= (and b!665835 res!433310) b!665836))

(assert (= (and b!665836 res!433312) b!665842))

(assert (= (and b!665842 res!433300) b!665840))

(assert (= (and b!665842 (not res!433306)) b!665831))

(assert (= (and b!665831 res!433297) b!665834))

(assert (= (and b!665842 res!433298) b!665829))

(assert (= (and b!665829 res!433315) b!665828))

(assert (= (and b!665828 res!433301) b!665845))

(assert (= (and b!665845 res!433313) b!665850))

(assert (= (and b!665850 res!433314) b!665837))

(assert (= (and b!665837 res!433309) b!665839))

(assert (= (and b!665839 res!433302) b!665841))

(assert (= (and b!665841 c!76633) b!665852))

(assert (= (and b!665841 (not c!76633)) b!665844))

(assert (= (and b!665841 c!76634) b!665847))

(assert (= (and b!665841 (not c!76634)) b!665851))

(assert (= (and b!665841 (not res!433311)) b!665848))

(assert (= (and b!665848 (not res!433316)) b!665849))

(assert (= (and b!665849 (not res!433303)) b!665833))

(assert (= (and b!665833 (not res!433307)) b!665838))

(assert (= (and b!665838 (not res!433305)) b!665830))

(assert (= (and b!665830 (not res!433304)) b!665843))

(assert (= (and b!665843 (not res!433308)) b!665846))

(declare-fun m!636781 () Bool)

(assert (=> b!665852 m!636781))

(declare-fun m!636783 () Bool)

(assert (=> b!665843 m!636783))

(declare-fun m!636785 () Bool)

(assert (=> b!665828 m!636785))

(declare-fun m!636787 () Bool)

(assert (=> b!665838 m!636787))

(declare-fun m!636789 () Bool)

(assert (=> b!665830 m!636789))

(declare-fun m!636791 () Bool)

(assert (=> b!665833 m!636791))

(declare-fun m!636793 () Bool)

(assert (=> b!665832 m!636793))

(assert (=> b!665834 m!636791))

(declare-fun m!636795 () Bool)

(assert (=> b!665846 m!636795))

(declare-fun m!636797 () Bool)

(assert (=> b!665835 m!636797))

(declare-fun m!636799 () Bool)

(assert (=> b!665850 m!636799))

(declare-fun m!636801 () Bool)

(assert (=> b!665847 m!636801))

(declare-fun m!636803 () Bool)

(assert (=> b!665847 m!636803))

(declare-fun m!636805 () Bool)

(assert (=> b!665847 m!636805))

(declare-fun m!636807 () Bool)

(assert (=> b!665847 m!636807))

(assert (=> b!665847 m!636803))

(assert (=> b!665847 m!636805))

(declare-fun m!636809 () Bool)

(assert (=> b!665847 m!636809))

(declare-fun m!636811 () Bool)

(assert (=> b!665847 m!636811))

(assert (=> b!665841 m!636801))

(assert (=> b!665841 m!636803))

(declare-fun m!636813 () Bool)

(assert (=> b!665841 m!636813))

(declare-fun m!636815 () Bool)

(assert (=> b!665841 m!636815))

(declare-fun m!636817 () Bool)

(assert (=> b!665841 m!636817))

(assert (=> b!665841 m!636809))

(declare-fun m!636819 () Bool)

(assert (=> b!665841 m!636819))

(declare-fun m!636821 () Bool)

(assert (=> b!665841 m!636821))

(assert (=> b!665841 m!636803))

(declare-fun m!636823 () Bool)

(assert (=> b!665841 m!636823))

(declare-fun m!636825 () Bool)

(assert (=> b!665841 m!636825))

(assert (=> b!665841 m!636811))

(assert (=> b!665840 m!636791))

(declare-fun m!636827 () Bool)

(assert (=> b!665837 m!636827))

(declare-fun m!636829 () Bool)

(assert (=> b!665836 m!636829))

(declare-fun m!636831 () Bool)

(assert (=> b!665848 m!636831))

(declare-fun m!636833 () Bool)

(assert (=> start!59980 m!636833))

(declare-fun m!636835 () Bool)

(assert (=> b!665829 m!636835))

(check-sat (not b!665838) (not b!665841) (not b!665837) (not b!665846) (not b!665848) (not start!59980) (not b!665852) (not b!665843) (not b!665830) (not b!665835) (not b!665850) (not b!665828) (not b!665829) (not b!665833) (not b!665834) (not b!665840) (not b!665832) (not b!665836) (not b!665847))
(check-sat)
