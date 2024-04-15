; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59966 () Bool)

(assert start!59966)

(declare-fun b!665457 () Bool)

(declare-fun res!433103 () Bool)

(declare-fun e!381270 () Bool)

(assert (=> b!665457 (=> (not res!433103) (not e!381270))))

(declare-datatypes ((array!39024 0))(
  ( (array!39025 (arr!18704 (Array (_ BitVec 32) (_ BitVec 64))) (size!19069 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39024)

(declare-datatypes ((List!12784 0))(
  ( (Nil!12781) (Cons!12780 (h!13825 (_ BitVec 64)) (t!19003 List!12784)) )
))
(declare-fun arrayNoDuplicates!0 (array!39024 (_ BitVec 32) List!12784) Bool)

(assert (=> b!665457 (= res!433103 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12781))))

(declare-fun b!665458 () Bool)

(declare-fun res!433097 () Bool)

(declare-fun e!381273 () Bool)

(assert (=> b!665458 (=> res!433097 e!381273)))

(declare-fun acc!681 () List!12784)

(declare-fun lt!309894 () List!12784)

(declare-fun subseq!62 (List!12784 List!12784) Bool)

(assert (=> b!665458 (= res!433097 (not (subseq!62 acc!681 lt!309894)))))

(declare-fun b!665459 () Bool)

(declare-fun e!381275 () Bool)

(declare-fun e!381271 () Bool)

(assert (=> b!665459 (= e!381275 e!381271)))

(declare-fun res!433106 () Bool)

(assert (=> b!665459 (=> (not res!433106) (not e!381271))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665459 (= res!433106 (bvsle from!3004 i!1382))))

(declare-fun b!665460 () Bool)

(declare-fun res!433110 () Bool)

(assert (=> b!665460 (=> (not res!433110) (not e!381270))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665460 (= res!433110 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665461 () Bool)

(declare-fun contains!3306 (List!12784 (_ BitVec 64)) Bool)

(assert (=> b!665461 (= e!381271 (not (contains!3306 acc!681 k0!2843)))))

(declare-fun b!665462 () Bool)

(declare-datatypes ((Unit!23228 0))(
  ( (Unit!23229) )
))
(declare-fun e!381274 () Unit!23228)

(declare-fun Unit!23230 () Unit!23228)

(assert (=> b!665462 (= e!381274 Unit!23230)))

(declare-fun res!433117 () Bool)

(assert (=> start!59966 (=> (not res!433117) (not e!381270))))

(assert (=> start!59966 (= res!433117 (and (bvslt (size!19069 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19069 a!3626))))))

(assert (=> start!59966 e!381270))

(assert (=> start!59966 true))

(declare-fun array_inv!14587 (array!39024) Bool)

(assert (=> start!59966 (array_inv!14587 a!3626)))

(declare-fun b!665463 () Bool)

(declare-fun res!433109 () Bool)

(assert (=> b!665463 (=> res!433109 e!381273)))

(declare-fun lt!309897 () Bool)

(assert (=> b!665463 (= res!433109 lt!309897)))

(declare-fun b!665464 () Bool)

(declare-fun res!433112 () Bool)

(assert (=> b!665464 (=> (not res!433112) (not e!381270))))

(assert (=> b!665464 (= res!433112 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665465 () Bool)

(declare-fun res!433111 () Bool)

(assert (=> b!665465 (=> res!433111 e!381273)))

(assert (=> b!665465 (= res!433111 (not (contains!3306 lt!309894 k0!2843)))))

(declare-fun b!665466 () Bool)

(declare-fun e!381268 () Bool)

(assert (=> b!665466 (= e!381268 (contains!3306 acc!681 k0!2843))))

(declare-fun b!665467 () Bool)

(declare-fun res!433114 () Bool)

(assert (=> b!665467 (=> res!433114 e!381273)))

(assert (=> b!665467 (= res!433114 (contains!3306 lt!309894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665468 () Bool)

(declare-fun res!433102 () Bool)

(assert (=> b!665468 (=> res!433102 e!381273)))

(declare-fun noDuplicate!575 (List!12784) Bool)

(assert (=> b!665468 (= res!433102 (not (noDuplicate!575 lt!309894)))))

(declare-fun b!665469 () Bool)

(assert (=> b!665469 (= e!381270 (not e!381273))))

(declare-fun res!433105 () Bool)

(assert (=> b!665469 (=> res!433105 e!381273)))

(assert (=> b!665469 (= res!433105 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!60 (List!12784 (_ BitVec 64)) List!12784)

(assert (=> b!665469 (= (-!60 lt!309894 k0!2843) acc!681)))

(declare-fun $colon$colon!193 (List!12784 (_ BitVec 64)) List!12784)

(assert (=> b!665469 (= lt!309894 ($colon$colon!193 acc!681 k0!2843))))

(declare-fun lt!309888 () Unit!23228)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12784) Unit!23228)

(assert (=> b!665469 (= lt!309888 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665469 (subseq!62 acc!681 acc!681)))

(declare-fun lt!309893 () Unit!23228)

(declare-fun lemmaListSubSeqRefl!0 (List!12784) Unit!23228)

(assert (=> b!665469 (= lt!309893 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665469 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309896 () Unit!23228)

(assert (=> b!665469 (= lt!309896 e!381274)))

(declare-fun c!76548 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665469 (= c!76548 (validKeyInArray!0 (select (arr!18704 a!3626) from!3004)))))

(declare-fun lt!309890 () Unit!23228)

(declare-fun e!381269 () Unit!23228)

(assert (=> b!665469 (= lt!309890 e!381269)))

(declare-fun c!76547 () Bool)

(assert (=> b!665469 (= c!76547 lt!309897)))

(assert (=> b!665469 (= lt!309897 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665469 (arrayContainsKey!0 (array!39025 (store (arr!18704 a!3626) i!1382 k0!2843) (size!19069 a!3626)) k0!2843 from!3004)))

(declare-fun b!665470 () Bool)

(declare-fun res!433107 () Bool)

(assert (=> b!665470 (=> res!433107 e!381273)))

(assert (=> b!665470 (= res!433107 (contains!3306 acc!681 k0!2843))))

(declare-fun b!665471 () Bool)

(declare-fun res!433108 () Bool)

(assert (=> b!665471 (=> (not res!433108) (not e!381270))))

(assert (=> b!665471 (= res!433108 e!381275)))

(declare-fun res!433113 () Bool)

(assert (=> b!665471 (=> res!433113 e!381275)))

(assert (=> b!665471 (= res!433113 e!381268)))

(declare-fun res!433100 () Bool)

(assert (=> b!665471 (=> (not res!433100) (not e!381268))))

(assert (=> b!665471 (= res!433100 (bvsgt from!3004 i!1382))))

(declare-fun b!665472 () Bool)

(declare-fun Unit!23231 () Unit!23228)

(assert (=> b!665472 (= e!381269 Unit!23231)))

(declare-fun b!665473 () Bool)

(declare-fun res!433104 () Bool)

(assert (=> b!665473 (=> (not res!433104) (not e!381270))))

(assert (=> b!665473 (= res!433104 (not (contains!3306 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665474 () Bool)

(declare-fun res!433098 () Bool)

(assert (=> b!665474 (=> (not res!433098) (not e!381270))))

(assert (=> b!665474 (= res!433098 (not (contains!3306 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665475 () Bool)

(declare-fun res!433099 () Bool)

(assert (=> b!665475 (=> (not res!433099) (not e!381270))))

(assert (=> b!665475 (= res!433099 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19069 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665476 () Bool)

(declare-fun res!433116 () Bool)

(assert (=> b!665476 (=> (not res!433116) (not e!381270))))

(assert (=> b!665476 (= res!433116 (validKeyInArray!0 k0!2843))))

(declare-fun b!665477 () Bool)

(declare-fun Unit!23232 () Unit!23228)

(assert (=> b!665477 (= e!381269 Unit!23232)))

(declare-fun lt!309891 () Unit!23228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39024 (_ BitVec 64) (_ BitVec 32)) Unit!23228)

(assert (=> b!665477 (= lt!309891 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665477 false))

(declare-fun b!665478 () Bool)

(declare-fun res!433101 () Bool)

(assert (=> b!665478 (=> (not res!433101) (not e!381270))))

(assert (=> b!665478 (= res!433101 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19069 a!3626))))))

(declare-fun b!665479 () Bool)

(declare-fun lt!309889 () Unit!23228)

(assert (=> b!665479 (= e!381274 lt!309889)))

(declare-fun lt!309895 () Unit!23228)

(assert (=> b!665479 (= lt!309895 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665479 (subseq!62 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39024 List!12784 List!12784 (_ BitVec 32)) Unit!23228)

(assert (=> b!665479 (= lt!309889 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!193 acc!681 (select (arr!18704 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665479 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665480 () Bool)

(assert (=> b!665480 (= e!381273 true)))

(declare-fun lt!309892 () Bool)

(assert (=> b!665480 (= lt!309892 (contains!3306 lt!309894 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665481 () Bool)

(declare-fun res!433115 () Bool)

(assert (=> b!665481 (=> (not res!433115) (not e!381270))))

(assert (=> b!665481 (= res!433115 (noDuplicate!575 acc!681))))

(assert (= (and start!59966 res!433117) b!665481))

(assert (= (and b!665481 res!433115) b!665473))

(assert (= (and b!665473 res!433104) b!665474))

(assert (= (and b!665474 res!433098) b!665471))

(assert (= (and b!665471 res!433100) b!665466))

(assert (= (and b!665471 (not res!433113)) b!665459))

(assert (= (and b!665459 res!433106) b!665461))

(assert (= (and b!665471 res!433108) b!665457))

(assert (= (and b!665457 res!433103) b!665464))

(assert (= (and b!665464 res!433112) b!665478))

(assert (= (and b!665478 res!433101) b!665476))

(assert (= (and b!665476 res!433116) b!665460))

(assert (= (and b!665460 res!433110) b!665475))

(assert (= (and b!665475 res!433099) b!665469))

(assert (= (and b!665469 c!76547) b!665477))

(assert (= (and b!665469 (not c!76547)) b!665472))

(assert (= (and b!665469 c!76548) b!665479))

(assert (= (and b!665469 (not c!76548)) b!665462))

(assert (= (and b!665469 (not res!433105)) b!665468))

(assert (= (and b!665468 (not res!433102)) b!665463))

(assert (= (and b!665463 (not res!433109)) b!665470))

(assert (= (and b!665470 (not res!433107)) b!665458))

(assert (= (and b!665458 (not res!433097)) b!665465))

(assert (= (and b!665465 (not res!433111)) b!665467))

(assert (= (and b!665467 (not res!433114)) b!665480))

(declare-fun m!635943 () Bool)

(assert (=> b!665474 m!635943))

(declare-fun m!635945 () Bool)

(assert (=> b!665468 m!635945))

(declare-fun m!635947 () Bool)

(assert (=> b!665464 m!635947))

(declare-fun m!635949 () Bool)

(assert (=> b!665470 m!635949))

(declare-fun m!635951 () Bool)

(assert (=> start!59966 m!635951))

(declare-fun m!635953 () Bool)

(assert (=> b!665460 m!635953))

(declare-fun m!635955 () Bool)

(assert (=> b!665479 m!635955))

(declare-fun m!635957 () Bool)

(assert (=> b!665479 m!635957))

(declare-fun m!635959 () Bool)

(assert (=> b!665479 m!635959))

(declare-fun m!635961 () Bool)

(assert (=> b!665479 m!635961))

(assert (=> b!665479 m!635957))

(assert (=> b!665479 m!635959))

(declare-fun m!635963 () Bool)

(assert (=> b!665479 m!635963))

(declare-fun m!635965 () Bool)

(assert (=> b!665479 m!635965))

(declare-fun m!635967 () Bool)

(assert (=> b!665467 m!635967))

(declare-fun m!635969 () Bool)

(assert (=> b!665465 m!635969))

(declare-fun m!635971 () Bool)

(assert (=> b!665476 m!635971))

(assert (=> b!665461 m!635949))

(declare-fun m!635973 () Bool)

(assert (=> b!665457 m!635973))

(declare-fun m!635975 () Bool)

(assert (=> b!665477 m!635975))

(declare-fun m!635977 () Bool)

(assert (=> b!665480 m!635977))

(assert (=> b!665466 m!635949))

(assert (=> b!665469 m!635955))

(assert (=> b!665469 m!635957))

(declare-fun m!635979 () Bool)

(assert (=> b!665469 m!635979))

(declare-fun m!635981 () Bool)

(assert (=> b!665469 m!635981))

(declare-fun m!635983 () Bool)

(assert (=> b!665469 m!635983))

(assert (=> b!665469 m!635963))

(declare-fun m!635985 () Bool)

(assert (=> b!665469 m!635985))

(declare-fun m!635987 () Bool)

(assert (=> b!665469 m!635987))

(assert (=> b!665469 m!635957))

(declare-fun m!635989 () Bool)

(assert (=> b!665469 m!635989))

(declare-fun m!635991 () Bool)

(assert (=> b!665469 m!635991))

(assert (=> b!665469 m!635965))

(declare-fun m!635993 () Bool)

(assert (=> b!665473 m!635993))

(declare-fun m!635995 () Bool)

(assert (=> b!665481 m!635995))

(declare-fun m!635997 () Bool)

(assert (=> b!665458 m!635997))

(check-sat (not b!665465) (not b!665464) (not b!665476) (not b!665477) (not b!665467) (not b!665468) (not b!665481) (not b!665457) (not b!665461) (not b!665469) (not b!665480) (not b!665474) (not b!665470) (not b!665466) (not b!665458) (not b!665479) (not b!665473) (not b!665460) (not start!59966))
(check-sat)
