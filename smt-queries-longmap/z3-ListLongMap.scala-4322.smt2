; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60018 () Bool)

(assert start!60018)

(declare-fun b!665302 () Bool)

(declare-fun res!432796 () Bool)

(declare-fun e!381387 () Bool)

(assert (=> b!665302 (=> res!432796 e!381387)))

(declare-datatypes ((List!12639 0))(
  ( (Nil!12636) (Cons!12635 (h!13683 (_ BitVec 64)) (t!18859 List!12639)) )
))
(declare-fun lt!309977 () List!12639)

(declare-fun noDuplicate!565 (List!12639) Bool)

(assert (=> b!665302 (= res!432796 (not (noDuplicate!565 lt!309977)))))

(declare-fun b!665303 () Bool)

(declare-datatypes ((Unit!23184 0))(
  ( (Unit!23185) )
))
(declare-fun e!381390 () Unit!23184)

(declare-fun Unit!23186 () Unit!23184)

(assert (=> b!665303 (= e!381390 Unit!23186)))

(declare-fun b!665304 () Bool)

(declare-fun res!432785 () Bool)

(declare-fun e!381388 () Bool)

(assert (=> b!665304 (=> (not res!432785) (not e!381388))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39003 0))(
  ( (array!39004 (arr!18691 (Array (_ BitVec 32) (_ BitVec 64))) (size!19055 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39003)

(assert (=> b!665304 (= res!432785 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19055 a!3626))))))

(declare-fun b!665306 () Bool)

(assert (=> b!665306 (= e!381387 true)))

(declare-fun lt!309982 () Bool)

(declare-fun contains!3291 (List!12639 (_ BitVec 64)) Bool)

(assert (=> b!665306 (= lt!309982 (contains!3291 lt!309977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665307 () Bool)

(declare-fun e!381383 () Bool)

(declare-fun e!381386 () Bool)

(assert (=> b!665307 (= e!381383 e!381386)))

(declare-fun res!432792 () Bool)

(assert (=> b!665307 (=> (not res!432792) (not e!381386))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665307 (= res!432792 (bvsle from!3004 i!1382))))

(declare-fun b!665308 () Bool)

(declare-fun res!432794 () Bool)

(assert (=> b!665308 (=> res!432794 e!381387)))

(declare-fun acc!681 () List!12639)

(declare-fun subseq!53 (List!12639 List!12639) Bool)

(assert (=> b!665308 (= res!432794 (not (subseq!53 acc!681 lt!309977)))))

(declare-fun b!665309 () Bool)

(declare-fun res!432784 () Bool)

(assert (=> b!665309 (=> (not res!432784) (not e!381388))))

(assert (=> b!665309 (= res!432784 (noDuplicate!565 acc!681))))

(declare-fun b!665310 () Bool)

(declare-fun res!432789 () Bool)

(assert (=> b!665310 (=> res!432789 e!381387)))

(assert (=> b!665310 (= res!432789 (contains!3291 lt!309977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665311 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!665311 (= e!381386 (not (contains!3291 acc!681 k0!2843)))))

(declare-fun b!665312 () Bool)

(assert (=> b!665312 (= e!381388 (not e!381387))))

(declare-fun res!432790 () Bool)

(assert (=> b!665312 (=> res!432790 e!381387)))

(assert (=> b!665312 (= res!432790 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!50 (List!12639 (_ BitVec 64)) List!12639)

(assert (=> b!665312 (= (-!50 lt!309977 k0!2843) acc!681)))

(declare-fun $colon$colon!182 (List!12639 (_ BitVec 64)) List!12639)

(assert (=> b!665312 (= lt!309977 ($colon$colon!182 acc!681 k0!2843))))

(declare-fun lt!309983 () Unit!23184)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12639) Unit!23184)

(assert (=> b!665312 (= lt!309983 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665312 (subseq!53 acc!681 acc!681)))

(declare-fun lt!309984 () Unit!23184)

(declare-fun lemmaListSubSeqRefl!0 (List!12639) Unit!23184)

(assert (=> b!665312 (= lt!309984 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39003 (_ BitVec 32) List!12639) Bool)

(assert (=> b!665312 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309978 () Unit!23184)

(declare-fun e!381384 () Unit!23184)

(assert (=> b!665312 (= lt!309978 e!381384)))

(declare-fun c!76630 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665312 (= c!76630 (validKeyInArray!0 (select (arr!18691 a!3626) from!3004)))))

(declare-fun lt!309981 () Unit!23184)

(assert (=> b!665312 (= lt!309981 e!381390)))

(declare-fun c!76631 () Bool)

(declare-fun lt!309979 () Bool)

(assert (=> b!665312 (= c!76631 lt!309979)))

(declare-fun arrayContainsKey!0 (array!39003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665312 (= lt!309979 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665312 (arrayContainsKey!0 (array!39004 (store (arr!18691 a!3626) i!1382 k0!2843) (size!19055 a!3626)) k0!2843 from!3004)))

(declare-fun b!665313 () Bool)

(declare-fun res!432781 () Bool)

(assert (=> b!665313 (=> (not res!432781) (not e!381388))))

(assert (=> b!665313 (= res!432781 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665314 () Bool)

(declare-fun Unit!23187 () Unit!23184)

(assert (=> b!665314 (= e!381390 Unit!23187)))

(declare-fun lt!309976 () Unit!23184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39003 (_ BitVec 64) (_ BitVec 32)) Unit!23184)

(assert (=> b!665314 (= lt!309976 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665314 false))

(declare-fun b!665315 () Bool)

(declare-fun Unit!23188 () Unit!23184)

(assert (=> b!665315 (= e!381384 Unit!23188)))

(declare-fun b!665316 () Bool)

(declare-fun res!432799 () Bool)

(assert (=> b!665316 (=> res!432799 e!381387)))

(assert (=> b!665316 (= res!432799 (not (contains!3291 lt!309977 k0!2843)))))

(declare-fun b!665317 () Bool)

(declare-fun res!432798 () Bool)

(assert (=> b!665317 (=> (not res!432798) (not e!381388))))

(assert (=> b!665317 (= res!432798 e!381383)))

(declare-fun res!432797 () Bool)

(assert (=> b!665317 (=> res!432797 e!381383)))

(declare-fun e!381385 () Bool)

(assert (=> b!665317 (= res!432797 e!381385)))

(declare-fun res!432788 () Bool)

(assert (=> b!665317 (=> (not res!432788) (not e!381385))))

(assert (=> b!665317 (= res!432788 (bvsgt from!3004 i!1382))))

(declare-fun b!665318 () Bool)

(declare-fun res!432793 () Bool)

(assert (=> b!665318 (=> (not res!432793) (not e!381388))))

(assert (=> b!665318 (= res!432793 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12636))))

(declare-fun b!665319 () Bool)

(declare-fun res!432782 () Bool)

(assert (=> b!665319 (=> res!432782 e!381387)))

(assert (=> b!665319 (= res!432782 (contains!3291 acc!681 k0!2843))))

(declare-fun b!665320 () Bool)

(declare-fun res!432780 () Bool)

(assert (=> b!665320 (=> (not res!432780) (not e!381388))))

(assert (=> b!665320 (= res!432780 (not (contains!3291 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665305 () Bool)

(declare-fun res!432783 () Bool)

(assert (=> b!665305 (=> (not res!432783) (not e!381388))))

(assert (=> b!665305 (= res!432783 (not (contains!3291 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!432786 () Bool)

(assert (=> start!60018 (=> (not res!432786) (not e!381388))))

(assert (=> start!60018 (= res!432786 (and (bvslt (size!19055 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19055 a!3626))))))

(assert (=> start!60018 e!381388))

(assert (=> start!60018 true))

(declare-fun array_inv!14550 (array!39003) Bool)

(assert (=> start!60018 (array_inv!14550 a!3626)))

(declare-fun b!665321 () Bool)

(declare-fun res!432787 () Bool)

(assert (=> b!665321 (=> res!432787 e!381387)))

(assert (=> b!665321 (= res!432787 lt!309979)))

(declare-fun b!665322 () Bool)

(declare-fun res!432779 () Bool)

(assert (=> b!665322 (=> (not res!432779) (not e!381388))))

(assert (=> b!665322 (= res!432779 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665323 () Bool)

(declare-fun lt!309985 () Unit!23184)

(assert (=> b!665323 (= e!381384 lt!309985)))

(declare-fun lt!309980 () Unit!23184)

(assert (=> b!665323 (= lt!309980 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665323 (subseq!53 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39003 List!12639 List!12639 (_ BitVec 32)) Unit!23184)

(assert (=> b!665323 (= lt!309985 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!182 acc!681 (select (arr!18691 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665323 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665324 () Bool)

(declare-fun res!432791 () Bool)

(assert (=> b!665324 (=> (not res!432791) (not e!381388))))

(assert (=> b!665324 (= res!432791 (validKeyInArray!0 k0!2843))))

(declare-fun b!665325 () Bool)

(assert (=> b!665325 (= e!381385 (contains!3291 acc!681 k0!2843))))

(declare-fun b!665326 () Bool)

(declare-fun res!432795 () Bool)

(assert (=> b!665326 (=> (not res!432795) (not e!381388))))

(assert (=> b!665326 (= res!432795 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19055 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60018 res!432786) b!665309))

(assert (= (and b!665309 res!432784) b!665320))

(assert (= (and b!665320 res!432780) b!665305))

(assert (= (and b!665305 res!432783) b!665317))

(assert (= (and b!665317 res!432788) b!665325))

(assert (= (and b!665317 (not res!432797)) b!665307))

(assert (= (and b!665307 res!432792) b!665311))

(assert (= (and b!665317 res!432798) b!665318))

(assert (= (and b!665318 res!432793) b!665313))

(assert (= (and b!665313 res!432781) b!665304))

(assert (= (and b!665304 res!432785) b!665324))

(assert (= (and b!665324 res!432791) b!665322))

(assert (= (and b!665322 res!432779) b!665326))

(assert (= (and b!665326 res!432795) b!665312))

(assert (= (and b!665312 c!76631) b!665314))

(assert (= (and b!665312 (not c!76631)) b!665303))

(assert (= (and b!665312 c!76630) b!665323))

(assert (= (and b!665312 (not c!76630)) b!665315))

(assert (= (and b!665312 (not res!432790)) b!665302))

(assert (= (and b!665302 (not res!432796)) b!665321))

(assert (= (and b!665321 (not res!432787)) b!665319))

(assert (= (and b!665319 (not res!432782)) b!665308))

(assert (= (and b!665308 (not res!432794)) b!665316))

(assert (= (and b!665316 (not res!432799)) b!665310))

(assert (= (and b!665310 (not res!432789)) b!665306))

(declare-fun m!636919 () Bool)

(assert (=> b!665313 m!636919))

(declare-fun m!636921 () Bool)

(assert (=> b!665319 m!636921))

(declare-fun m!636923 () Bool)

(assert (=> b!665314 m!636923))

(declare-fun m!636925 () Bool)

(assert (=> b!665308 m!636925))

(declare-fun m!636927 () Bool)

(assert (=> start!60018 m!636927))

(declare-fun m!636929 () Bool)

(assert (=> b!665309 m!636929))

(declare-fun m!636931 () Bool)

(assert (=> b!665320 m!636931))

(declare-fun m!636933 () Bool)

(assert (=> b!665306 m!636933))

(declare-fun m!636935 () Bool)

(assert (=> b!665318 m!636935))

(declare-fun m!636937 () Bool)

(assert (=> b!665322 m!636937))

(assert (=> b!665311 m!636921))

(assert (=> b!665325 m!636921))

(declare-fun m!636939 () Bool)

(assert (=> b!665312 m!636939))

(declare-fun m!636941 () Bool)

(assert (=> b!665312 m!636941))

(declare-fun m!636943 () Bool)

(assert (=> b!665312 m!636943))

(declare-fun m!636945 () Bool)

(assert (=> b!665312 m!636945))

(declare-fun m!636947 () Bool)

(assert (=> b!665312 m!636947))

(declare-fun m!636949 () Bool)

(assert (=> b!665312 m!636949))

(assert (=> b!665312 m!636941))

(declare-fun m!636951 () Bool)

(assert (=> b!665312 m!636951))

(declare-fun m!636953 () Bool)

(assert (=> b!665312 m!636953))

(declare-fun m!636955 () Bool)

(assert (=> b!665312 m!636955))

(declare-fun m!636957 () Bool)

(assert (=> b!665312 m!636957))

(declare-fun m!636959 () Bool)

(assert (=> b!665312 m!636959))

(declare-fun m!636961 () Bool)

(assert (=> b!665305 m!636961))

(declare-fun m!636963 () Bool)

(assert (=> b!665316 m!636963))

(declare-fun m!636965 () Bool)

(assert (=> b!665310 m!636965))

(declare-fun m!636967 () Bool)

(assert (=> b!665324 m!636967))

(declare-fun m!636969 () Bool)

(assert (=> b!665302 m!636969))

(assert (=> b!665323 m!636939))

(assert (=> b!665323 m!636941))

(declare-fun m!636971 () Bool)

(assert (=> b!665323 m!636971))

(declare-fun m!636973 () Bool)

(assert (=> b!665323 m!636973))

(assert (=> b!665323 m!636941))

(assert (=> b!665323 m!636971))

(assert (=> b!665323 m!636945))

(assert (=> b!665323 m!636959))

(check-sat (not b!665322) (not b!665323) (not b!665310) (not start!60018) (not b!665325) (not b!665308) (not b!665305) (not b!665302) (not b!665312) (not b!665318) (not b!665306) (not b!665311) (not b!665320) (not b!665316) (not b!665313) (not b!665319) (not b!665324) (not b!665314) (not b!665309))
(check-sat)
