; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60236 () Bool)

(assert start!60236)

(declare-fun b!674865 () Bool)

(declare-fun res!441325 () Bool)

(declare-fun e!385160 () Bool)

(assert (=> b!674865 (=> (not res!441325) (not e!385160))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39283 0))(
  ( (array!39284 (arr!18834 (Array (_ BitVec 32) (_ BitVec 64))) (size!19198 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39283)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!674865 (= res!441325 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19198 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674866 () Bool)

(declare-fun res!441323 () Bool)

(assert (=> b!674866 (=> (not res!441323) (not e!385160))))

(declare-datatypes ((List!12875 0))(
  ( (Nil!12872) (Cons!12871 (h!13916 (_ BitVec 64)) (t!19103 List!12875)) )
))
(declare-fun arrayNoDuplicates!0 (array!39283 (_ BitVec 32) List!12875) Bool)

(assert (=> b!674866 (= res!441323 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12872))))

(declare-fun b!674867 () Bool)

(declare-fun res!441329 () Bool)

(declare-fun e!385155 () Bool)

(assert (=> b!674867 (=> (not res!441329) (not e!385155))))

(declare-fun e!385161 () Bool)

(assert (=> b!674867 (= res!441329 e!385161)))

(declare-fun res!441318 () Bool)

(assert (=> b!674867 (=> res!441318 e!385161)))

(declare-fun e!385159 () Bool)

(assert (=> b!674867 (= res!441318 e!385159)))

(declare-fun res!441316 () Bool)

(assert (=> b!674867 (=> (not res!441316) (not e!385159))))

(assert (=> b!674867 (= res!441316 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674868 () Bool)

(declare-fun e!385158 () Bool)

(assert (=> b!674868 (= e!385160 e!385158)))

(declare-fun res!441320 () Bool)

(assert (=> b!674868 (=> (not res!441320) (not e!385158))))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!674868 (= res!441320 (not (= (select (arr!18834 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23748 0))(
  ( (Unit!23749) )
))
(declare-fun lt!312680 () Unit!23748)

(declare-fun e!385163 () Unit!23748)

(assert (=> b!674868 (= lt!312680 e!385163)))

(declare-fun c!77147 () Bool)

(assert (=> b!674868 (= c!77147 (= (select (arr!18834 a!3626) from!3004) k!2843))))

(declare-fun b!674869 () Bool)

(declare-fun e!385154 () Bool)

(declare-fun acc!681 () List!12875)

(declare-fun contains!3452 (List!12875 (_ BitVec 64)) Bool)

(assert (=> b!674869 (= e!385154 (not (contains!3452 acc!681 k!2843)))))

(declare-fun b!674870 () Bool)

(declare-fun res!441315 () Bool)

(assert (=> b!674870 (=> (not res!441315) (not e!385160))))

(assert (=> b!674870 (= res!441315 (not (contains!3452 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674871 () Bool)

(declare-fun lt!312681 () List!12875)

(assert (=> b!674871 (= e!385159 (contains!3452 lt!312681 k!2843))))

(declare-fun b!674872 () Bool)

(declare-fun e!385162 () Bool)

(assert (=> b!674872 (= e!385162 (contains!3452 acc!681 k!2843))))

(declare-fun b!674873 () Bool)

(declare-fun res!441310 () Bool)

(assert (=> b!674873 (=> (not res!441310) (not e!385160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674873 (= res!441310 (validKeyInArray!0 k!2843))))

(declare-fun b!674874 () Bool)

(declare-fun res!441322 () Bool)

(assert (=> b!674874 (=> (not res!441322) (not e!385160))))

(declare-fun noDuplicate!699 (List!12875) Bool)

(assert (=> b!674874 (= res!441322 (noDuplicate!699 acc!681))))

(declare-fun b!674875 () Bool)

(declare-fun res!441327 () Bool)

(assert (=> b!674875 (=> (not res!441327) (not e!385160))))

(assert (=> b!674875 (= res!441327 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19198 a!3626))))))

(declare-fun b!674877 () Bool)

(declare-fun res!441313 () Bool)

(assert (=> b!674877 (=> (not res!441313) (not e!385155))))

(assert (=> b!674877 (= res!441313 (noDuplicate!699 lt!312681))))

(declare-fun b!674878 () Bool)

(declare-fun e!385164 () Bool)

(assert (=> b!674878 (= e!385164 (not (contains!3452 lt!312681 k!2843)))))

(declare-fun b!674879 () Bool)

(declare-fun Unit!23750 () Unit!23748)

(assert (=> b!674879 (= e!385163 Unit!23750)))

(declare-fun b!674880 () Bool)

(declare-fun res!441306 () Bool)

(assert (=> b!674880 (=> (not res!441306) (not e!385160))))

(assert (=> b!674880 (= res!441306 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674881 () Bool)

(declare-fun res!441311 () Bool)

(assert (=> b!674881 (=> (not res!441311) (not e!385160))))

(declare-fun arrayContainsKey!0 (array!39283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674881 (= res!441311 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674882 () Bool)

(declare-fun res!441305 () Bool)

(assert (=> b!674882 (=> (not res!441305) (not e!385155))))

(assert (=> b!674882 (= res!441305 (not (contains!3452 lt!312681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674883 () Bool)

(declare-fun e!385157 () Bool)

(assert (=> b!674883 (= e!385157 e!385154)))

(declare-fun res!441321 () Bool)

(assert (=> b!674883 (=> (not res!441321) (not e!385154))))

(assert (=> b!674883 (= res!441321 (bvsle from!3004 i!1382))))

(declare-fun b!674884 () Bool)

(assert (=> b!674884 (= e!385161 e!385164)))

(declare-fun res!441324 () Bool)

(assert (=> b!674884 (=> (not res!441324) (not e!385164))))

(assert (=> b!674884 (= res!441324 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674885 () Bool)

(declare-fun Unit!23751 () Unit!23748)

(assert (=> b!674885 (= e!385163 Unit!23751)))

(assert (=> b!674885 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312682 () Unit!23748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39283 (_ BitVec 64) (_ BitVec 32)) Unit!23748)

(assert (=> b!674885 (= lt!312682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674885 false))

(declare-fun b!674886 () Bool)

(declare-fun res!441308 () Bool)

(assert (=> b!674886 (=> (not res!441308) (not e!385155))))

(assert (=> b!674886 (= res!441308 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312681))))

(declare-fun b!674887 () Bool)

(declare-fun res!441309 () Bool)

(assert (=> b!674887 (=> (not res!441309) (not e!385160))))

(assert (=> b!674887 (= res!441309 (not (contains!3452 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674888 () Bool)

(assert (=> b!674888 (= e!385155 (not true))))

(assert (=> b!674888 (arrayNoDuplicates!0 (array!39284 (store (arr!18834 a!3626) i!1382 k!2843) (size!19198 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312681)))

(declare-fun lt!312679 () Unit!23748)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12875) Unit!23748)

(assert (=> b!674888 (= lt!312679 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312681))))

(declare-fun b!674889 () Bool)

(assert (=> b!674889 (= e!385158 e!385155)))

(declare-fun res!441312 () Bool)

(assert (=> b!674889 (=> (not res!441312) (not e!385155))))

(assert (=> b!674889 (= res!441312 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!302 (List!12875 (_ BitVec 64)) List!12875)

(assert (=> b!674889 (= lt!312681 ($colon$colon!302 acc!681 (select (arr!18834 a!3626) from!3004)))))

(declare-fun b!674890 () Bool)

(declare-fun res!441328 () Bool)

(assert (=> b!674890 (=> (not res!441328) (not e!385160))))

(assert (=> b!674890 (= res!441328 e!385157)))

(declare-fun res!441326 () Bool)

(assert (=> b!674890 (=> res!441326 e!385157)))

(assert (=> b!674890 (= res!441326 e!385162)))

(declare-fun res!441314 () Bool)

(assert (=> b!674890 (=> (not res!441314) (not e!385162))))

(assert (=> b!674890 (= res!441314 (bvsgt from!3004 i!1382))))

(declare-fun b!674891 () Bool)

(declare-fun res!441307 () Bool)

(assert (=> b!674891 (=> (not res!441307) (not e!385155))))

(assert (=> b!674891 (= res!441307 (not (contains!3452 lt!312681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!441319 () Bool)

(assert (=> start!60236 (=> (not res!441319) (not e!385160))))

(assert (=> start!60236 (= res!441319 (and (bvslt (size!19198 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19198 a!3626))))))

(assert (=> start!60236 e!385160))

(assert (=> start!60236 true))

(declare-fun array_inv!14630 (array!39283) Bool)

(assert (=> start!60236 (array_inv!14630 a!3626)))

(declare-fun b!674876 () Bool)

(declare-fun res!441317 () Bool)

(assert (=> b!674876 (=> (not res!441317) (not e!385160))))

(assert (=> b!674876 (= res!441317 (validKeyInArray!0 (select (arr!18834 a!3626) from!3004)))))

(assert (= (and start!60236 res!441319) b!674874))

(assert (= (and b!674874 res!441322) b!674870))

(assert (= (and b!674870 res!441315) b!674887))

(assert (= (and b!674887 res!441309) b!674890))

(assert (= (and b!674890 res!441314) b!674872))

(assert (= (and b!674890 (not res!441326)) b!674883))

(assert (= (and b!674883 res!441321) b!674869))

(assert (= (and b!674890 res!441328) b!674866))

(assert (= (and b!674866 res!441323) b!674880))

(assert (= (and b!674880 res!441306) b!674875))

(assert (= (and b!674875 res!441327) b!674873))

(assert (= (and b!674873 res!441310) b!674881))

(assert (= (and b!674881 res!441311) b!674865))

(assert (= (and b!674865 res!441325) b!674876))

(assert (= (and b!674876 res!441317) b!674868))

(assert (= (and b!674868 c!77147) b!674885))

(assert (= (and b!674868 (not c!77147)) b!674879))

(assert (= (and b!674868 res!441320) b!674889))

(assert (= (and b!674889 res!441312) b!674877))

(assert (= (and b!674877 res!441313) b!674891))

(assert (= (and b!674891 res!441307) b!674882))

(assert (= (and b!674882 res!441305) b!674867))

(assert (= (and b!674867 res!441316) b!674871))

(assert (= (and b!674867 (not res!441318)) b!674884))

(assert (= (and b!674884 res!441324) b!674878))

(assert (= (and b!674867 res!441329) b!674886))

(assert (= (and b!674886 res!441308) b!674888))

(declare-fun m!642623 () Bool)

(assert (=> b!674880 m!642623))

(declare-fun m!642625 () Bool)

(assert (=> b!674866 m!642625))

(declare-fun m!642627 () Bool)

(assert (=> b!674881 m!642627))

(declare-fun m!642629 () Bool)

(assert (=> b!674889 m!642629))

(assert (=> b!674889 m!642629))

(declare-fun m!642631 () Bool)

(assert (=> b!674889 m!642631))

(declare-fun m!642633 () Bool)

(assert (=> b!674882 m!642633))

(declare-fun m!642635 () Bool)

(assert (=> b!674870 m!642635))

(declare-fun m!642637 () Bool)

(assert (=> b!674873 m!642637))

(declare-fun m!642639 () Bool)

(assert (=> b!674871 m!642639))

(declare-fun m!642641 () Bool)

(assert (=> b!674877 m!642641))

(declare-fun m!642643 () Bool)

(assert (=> b!674872 m!642643))

(assert (=> b!674868 m!642629))

(declare-fun m!642645 () Bool)

(assert (=> b!674891 m!642645))

(declare-fun m!642647 () Bool)

(assert (=> b!674874 m!642647))

(assert (=> b!674878 m!642639))

(declare-fun m!642649 () Bool)

(assert (=> b!674886 m!642649))

(assert (=> b!674876 m!642629))

(assert (=> b!674876 m!642629))

(declare-fun m!642651 () Bool)

(assert (=> b!674876 m!642651))

(declare-fun m!642653 () Bool)

(assert (=> b!674887 m!642653))

(assert (=> b!674869 m!642643))

(declare-fun m!642655 () Bool)

(assert (=> start!60236 m!642655))

(declare-fun m!642657 () Bool)

(assert (=> b!674888 m!642657))

(declare-fun m!642659 () Bool)

(assert (=> b!674888 m!642659))

(declare-fun m!642661 () Bool)

(assert (=> b!674888 m!642661))

(declare-fun m!642663 () Bool)

(assert (=> b!674885 m!642663))

(declare-fun m!642665 () Bool)

(assert (=> b!674885 m!642665))

(push 1)

