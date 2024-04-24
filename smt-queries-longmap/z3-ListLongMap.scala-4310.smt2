; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59946 () Bool)

(assert start!59946)

(declare-fun b!662992 () Bool)

(declare-fun res!430856 () Bool)

(declare-fun e!380570 () Bool)

(assert (=> b!662992 (=> (not res!430856) (not e!380570))))

(declare-datatypes ((array!38931 0))(
  ( (array!38932 (arr!18655 (Array (_ BitVec 32) (_ BitVec 64))) (size!19019 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38931)

(declare-datatypes ((List!12603 0))(
  ( (Nil!12600) (Cons!12599 (h!13647 (_ BitVec 64)) (t!18823 List!12603)) )
))
(declare-fun arrayNoDuplicates!0 (array!38931 (_ BitVec 32) List!12603) Bool)

(assert (=> b!662992 (= res!430856 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12600))))

(declare-fun b!662993 () Bool)

(declare-fun res!430851 () Bool)

(assert (=> b!662993 (=> (not res!430851) (not e!380570))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662993 (= res!430851 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662994 () Bool)

(declare-fun e!380571 () Bool)

(declare-fun e!380568 () Bool)

(assert (=> b!662994 (= e!380571 e!380568)))

(declare-fun res!430859 () Bool)

(assert (=> b!662994 (=> res!430859 e!380568)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662994 (= res!430859 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!309204 () List!12603)

(declare-fun acc!681 () List!12603)

(declare-fun $colon$colon!146 (List!12603 (_ BitVec 64)) List!12603)

(assert (=> b!662994 (= lt!309204 ($colon$colon!146 acc!681 (select (arr!18655 a!3626) from!3004)))))

(declare-fun subseq!17 (List!12603 List!12603) Bool)

(assert (=> b!662994 (subseq!17 acc!681 acc!681)))

(declare-datatypes ((Unit!23013 0))(
  ( (Unit!23014) )
))
(declare-fun lt!309207 () Unit!23013)

(declare-fun lemmaListSubSeqRefl!0 (List!12603) Unit!23013)

(assert (=> b!662994 (= lt!309207 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662995 () Bool)

(declare-fun e!380567 () Unit!23013)

(declare-fun Unit!23015 () Unit!23013)

(assert (=> b!662995 (= e!380567 Unit!23015)))

(declare-fun res!430852 () Bool)

(assert (=> start!59946 (=> (not res!430852) (not e!380570))))

(assert (=> start!59946 (= res!430852 (and (bvslt (size!19019 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19019 a!3626))))))

(assert (=> start!59946 e!380570))

(assert (=> start!59946 true))

(declare-fun array_inv!14514 (array!38931) Bool)

(assert (=> start!59946 (array_inv!14514 a!3626)))

(declare-fun b!662996 () Bool)

(declare-fun res!430869 () Bool)

(assert (=> b!662996 (=> res!430869 e!380568)))

(declare-fun contains!3255 (List!12603 (_ BitVec 64)) Bool)

(assert (=> b!662996 (= res!430869 (contains!3255 lt!309204 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662997 () Bool)

(declare-fun res!430864 () Bool)

(assert (=> b!662997 (=> (not res!430864) (not e!380570))))

(assert (=> b!662997 (= res!430864 (not (contains!3255 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662998 () Bool)

(declare-fun e!380565 () Bool)

(assert (=> b!662998 (= e!380565 (not (contains!3255 acc!681 k0!2843)))))

(declare-fun b!662999 () Bool)

(assert (=> b!662999 (= e!380568 true)))

(declare-fun lt!309203 () Bool)

(assert (=> b!662999 (= lt!309203 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309204))))

(declare-fun lt!309205 () Unit!23013)

(declare-fun noDuplicateSubseq!17 (List!12603 List!12603) Unit!23013)

(assert (=> b!662999 (= lt!309205 (noDuplicateSubseq!17 acc!681 lt!309204))))

(declare-fun b!663000 () Bool)

(declare-fun res!430855 () Bool)

(assert (=> b!663000 (=> (not res!430855) (not e!380570))))

(declare-fun e!380564 () Bool)

(assert (=> b!663000 (= res!430855 e!380564)))

(declare-fun res!430865 () Bool)

(assert (=> b!663000 (=> res!430865 e!380564)))

(declare-fun e!380566 () Bool)

(assert (=> b!663000 (= res!430865 e!380566)))

(declare-fun res!430866 () Bool)

(assert (=> b!663000 (=> (not res!430866) (not e!380566))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663000 (= res!430866 (bvsgt from!3004 i!1382))))

(declare-fun b!663001 () Bool)

(declare-fun res!430870 () Bool)

(assert (=> b!663001 (=> (not res!430870) (not e!380570))))

(assert (=> b!663001 (= res!430870 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19019 a!3626))))))

(declare-fun b!663002 () Bool)

(declare-fun res!430858 () Bool)

(assert (=> b!663002 (=> res!430858 e!380568)))

(assert (=> b!663002 (= res!430858 (not (subseq!17 acc!681 lt!309204)))))

(declare-fun b!663003 () Bool)

(declare-fun res!430857 () Bool)

(assert (=> b!663003 (=> (not res!430857) (not e!380570))))

(assert (=> b!663003 (= res!430857 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663004 () Bool)

(declare-fun res!430853 () Bool)

(assert (=> b!663004 (=> res!430853 e!380568)))

(declare-fun noDuplicate!529 (List!12603) Bool)

(assert (=> b!663004 (= res!430853 (not (noDuplicate!529 lt!309204)))))

(declare-fun b!663005 () Bool)

(declare-fun res!430867 () Bool)

(assert (=> b!663005 (=> (not res!430867) (not e!380570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663005 (= res!430867 (validKeyInArray!0 k0!2843))))

(declare-fun b!663006 () Bool)

(declare-fun res!430868 () Bool)

(assert (=> b!663006 (=> (not res!430868) (not e!380570))))

(assert (=> b!663006 (= res!430868 (not (contains!3255 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663007 () Bool)

(declare-fun Unit!23016 () Unit!23013)

(assert (=> b!663007 (= e!380567 Unit!23016)))

(declare-fun lt!309208 () Unit!23013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38931 (_ BitVec 64) (_ BitVec 32)) Unit!23013)

(assert (=> b!663007 (= lt!309208 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663007 false))

(declare-fun b!663008 () Bool)

(assert (=> b!663008 (= e!380566 (contains!3255 acc!681 k0!2843))))

(declare-fun b!663009 () Bool)

(assert (=> b!663009 (= e!380570 (not e!380571))))

(declare-fun res!430854 () Bool)

(assert (=> b!663009 (=> res!430854 e!380571)))

(assert (=> b!663009 (= res!430854 (not (validKeyInArray!0 (select (arr!18655 a!3626) from!3004))))))

(declare-fun lt!309206 () Unit!23013)

(assert (=> b!663009 (= lt!309206 e!380567)))

(declare-fun c!76439 () Bool)

(assert (=> b!663009 (= c!76439 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663009 (arrayContainsKey!0 (array!38932 (store (arr!18655 a!3626) i!1382 k0!2843) (size!19019 a!3626)) k0!2843 from!3004)))

(declare-fun b!663010 () Bool)

(assert (=> b!663010 (= e!380564 e!380565)))

(declare-fun res!430863 () Bool)

(assert (=> b!663010 (=> (not res!430863) (not e!380565))))

(assert (=> b!663010 (= res!430863 (bvsle from!3004 i!1382))))

(declare-fun b!663011 () Bool)

(declare-fun res!430861 () Bool)

(assert (=> b!663011 (=> (not res!430861) (not e!380570))))

(assert (=> b!663011 (= res!430861 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19019 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663012 () Bool)

(declare-fun res!430860 () Bool)

(assert (=> b!663012 (=> (not res!430860) (not e!380570))))

(assert (=> b!663012 (= res!430860 (noDuplicate!529 acc!681))))

(declare-fun b!663013 () Bool)

(declare-fun res!430862 () Bool)

(assert (=> b!663013 (=> res!430862 e!380568)))

(assert (=> b!663013 (= res!430862 (contains!3255 lt!309204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59946 res!430852) b!663012))

(assert (= (and b!663012 res!430860) b!662997))

(assert (= (and b!662997 res!430864) b!663006))

(assert (= (and b!663006 res!430868) b!663000))

(assert (= (and b!663000 res!430866) b!663008))

(assert (= (and b!663000 (not res!430865)) b!663010))

(assert (= (and b!663010 res!430863) b!662998))

(assert (= (and b!663000 res!430855) b!662992))

(assert (= (and b!662992 res!430856) b!663003))

(assert (= (and b!663003 res!430857) b!663001))

(assert (= (and b!663001 res!430870) b!663005))

(assert (= (and b!663005 res!430867) b!662993))

(assert (= (and b!662993 res!430851) b!663011))

(assert (= (and b!663011 res!430861) b!663009))

(assert (= (and b!663009 c!76439) b!663007))

(assert (= (and b!663009 (not c!76439)) b!662995))

(assert (= (and b!663009 (not res!430854)) b!662994))

(assert (= (and b!662994 (not res!430859)) b!663004))

(assert (= (and b!663004 (not res!430853)) b!663013))

(assert (= (and b!663013 (not res!430862)) b!662996))

(assert (= (and b!662996 (not res!430869)) b!663002))

(assert (= (and b!663002 (not res!430858)) b!662999))

(declare-fun m!635215 () Bool)

(assert (=> b!663004 m!635215))

(declare-fun m!635217 () Bool)

(assert (=> b!663007 m!635217))

(declare-fun m!635219 () Bool)

(assert (=> b!662992 m!635219))

(declare-fun m!635221 () Bool)

(assert (=> b!662993 m!635221))

(declare-fun m!635223 () Bool)

(assert (=> b!663002 m!635223))

(declare-fun m!635225 () Bool)

(assert (=> b!662996 m!635225))

(declare-fun m!635227 () Bool)

(assert (=> b!663005 m!635227))

(declare-fun m!635229 () Bool)

(assert (=> b!662998 m!635229))

(declare-fun m!635231 () Bool)

(assert (=> b!663013 m!635231))

(declare-fun m!635233 () Bool)

(assert (=> b!662999 m!635233))

(declare-fun m!635235 () Bool)

(assert (=> b!662999 m!635235))

(declare-fun m!635237 () Bool)

(assert (=> b!662994 m!635237))

(assert (=> b!662994 m!635237))

(declare-fun m!635239 () Bool)

(assert (=> b!662994 m!635239))

(declare-fun m!635241 () Bool)

(assert (=> b!662994 m!635241))

(declare-fun m!635243 () Bool)

(assert (=> b!662994 m!635243))

(declare-fun m!635245 () Bool)

(assert (=> b!662997 m!635245))

(assert (=> b!663008 m!635229))

(declare-fun m!635247 () Bool)

(assert (=> b!663003 m!635247))

(declare-fun m!635249 () Bool)

(assert (=> start!59946 m!635249))

(declare-fun m!635251 () Bool)

(assert (=> b!663006 m!635251))

(assert (=> b!663009 m!635237))

(declare-fun m!635253 () Bool)

(assert (=> b!663009 m!635253))

(declare-fun m!635255 () Bool)

(assert (=> b!663009 m!635255))

(assert (=> b!663009 m!635237))

(declare-fun m!635257 () Bool)

(assert (=> b!663009 m!635257))

(declare-fun m!635259 () Bool)

(assert (=> b!663009 m!635259))

(declare-fun m!635261 () Bool)

(assert (=> b!663012 m!635261))

(check-sat (not b!662992) (not b!663008) (not b!663006) (not b!663009) (not b!662998) (not b!663004) (not b!662999) (not b!663013) (not start!59946) (not b!663003) (not b!662997) (not b!662994) (not b!662993) (not b!663005) (not b!663002) (not b!663007) (not b!662996) (not b!663012))
(check-sat)
