; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60882 () Bool)

(assert start!60882)

(declare-fun b!683001 () Bool)

(declare-fun e!389089 () Bool)

(assert (=> b!683001 (= e!389089 (not true))))

(declare-datatypes ((List!13006 0))(
  ( (Nil!13003) (Cons!13002 (h!14047 (_ BitVec 64)) (t!19249 List!13006)) )
))
(declare-fun acc!681 () List!13006)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun -!134 (List!13006 (_ BitVec 64)) List!13006)

(declare-fun $colon$colon!334 (List!13006 (_ BitVec 64)) List!13006)

(assert (=> b!683001 (= (-!134 ($colon$colon!334 acc!681 k!2843) k!2843) acc!681)))

(declare-datatypes ((Unit!23992 0))(
  ( (Unit!23993) )
))
(declare-fun lt!313735 () Unit!23992)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13006) Unit!23992)

(assert (=> b!683001 (= lt!313735 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!169 (List!13006 List!13006) Bool)

(assert (=> b!683001 (subseq!169 acc!681 acc!681)))

(declare-fun lt!313736 () Unit!23992)

(declare-fun lemmaListSubSeqRefl!0 (List!13006) Unit!23992)

(assert (=> b!683001 (= lt!313736 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39566 0))(
  ( (array!39567 (arr!18965 (Array (_ BitVec 32) (_ BitVec 64))) (size!19329 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39566)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39566 (_ BitVec 32) List!13006) Bool)

(assert (=> b!683001 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313732 () Unit!23992)

(declare-fun e!389086 () Unit!23992)

(assert (=> b!683001 (= lt!313732 e!389086)))

(declare-fun c!77432 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683001 (= c!77432 (validKeyInArray!0 (select (arr!18965 a!3626) from!3004)))))

(declare-fun lt!313737 () Unit!23992)

(declare-fun e!389088 () Unit!23992)

(assert (=> b!683001 (= lt!313737 e!389088)))

(declare-fun c!77431 () Bool)

(declare-fun arrayContainsKey!0 (array!39566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683001 (= c!77431 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683001 (arrayContainsKey!0 (array!39567 (store (arr!18965 a!3626) i!1382 k!2843) (size!19329 a!3626)) k!2843 from!3004)))

(declare-fun b!683002 () Bool)

(declare-fun res!448875 () Bool)

(assert (=> b!683002 (=> (not res!448875) (not e!389089))))

(assert (=> b!683002 (= res!448875 (validKeyInArray!0 k!2843))))

(declare-fun b!683003 () Bool)

(declare-fun res!448881 () Bool)

(assert (=> b!683003 (=> (not res!448881) (not e!389089))))

(declare-fun noDuplicate!830 (List!13006) Bool)

(assert (=> b!683003 (= res!448881 (noDuplicate!830 acc!681))))

(declare-fun b!683004 () Bool)

(declare-fun e!389087 () Bool)

(declare-fun e!389085 () Bool)

(assert (=> b!683004 (= e!389087 e!389085)))

(declare-fun res!448876 () Bool)

(assert (=> b!683004 (=> (not res!448876) (not e!389085))))

(assert (=> b!683004 (= res!448876 (bvsle from!3004 i!1382))))

(declare-fun b!683005 () Bool)

(declare-fun res!448883 () Bool)

(assert (=> b!683005 (=> (not res!448883) (not e!389089))))

(assert (=> b!683005 (= res!448883 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19329 a!3626))))))

(declare-fun b!683006 () Bool)

(declare-fun Unit!23994 () Unit!23992)

(assert (=> b!683006 (= e!389088 Unit!23994)))

(declare-fun lt!313738 () Unit!23992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39566 (_ BitVec 64) (_ BitVec 32)) Unit!23992)

(assert (=> b!683006 (= lt!313738 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683006 false))

(declare-fun b!683007 () Bool)

(declare-fun res!448885 () Bool)

(assert (=> b!683007 (=> (not res!448885) (not e!389089))))

(declare-fun contains!3583 (List!13006 (_ BitVec 64)) Bool)

(assert (=> b!683007 (= res!448885 (not (contains!3583 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683008 () Bool)

(declare-fun res!448877 () Bool)

(assert (=> b!683008 (=> (not res!448877) (not e!389089))))

(assert (=> b!683008 (= res!448877 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13003))))

(declare-fun res!448873 () Bool)

(assert (=> start!60882 (=> (not res!448873) (not e!389089))))

(assert (=> start!60882 (= res!448873 (and (bvslt (size!19329 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19329 a!3626))))))

(assert (=> start!60882 e!389089))

(assert (=> start!60882 true))

(declare-fun array_inv!14761 (array!39566) Bool)

(assert (=> start!60882 (array_inv!14761 a!3626)))

(declare-fun b!683009 () Bool)

(declare-fun res!448878 () Bool)

(assert (=> b!683009 (=> (not res!448878) (not e!389089))))

(assert (=> b!683009 (= res!448878 e!389087)))

(declare-fun res!448874 () Bool)

(assert (=> b!683009 (=> res!448874 e!389087)))

(declare-fun e!389090 () Bool)

(assert (=> b!683009 (= res!448874 e!389090)))

(declare-fun res!448884 () Bool)

(assert (=> b!683009 (=> (not res!448884) (not e!389090))))

(assert (=> b!683009 (= res!448884 (bvsgt from!3004 i!1382))))

(declare-fun b!683010 () Bool)

(declare-fun res!448882 () Bool)

(assert (=> b!683010 (=> (not res!448882) (not e!389089))))

(assert (=> b!683010 (= res!448882 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683011 () Bool)

(declare-fun res!448879 () Bool)

(assert (=> b!683011 (=> (not res!448879) (not e!389089))))

(assert (=> b!683011 (= res!448879 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683012 () Bool)

(declare-fun Unit!23995 () Unit!23992)

(assert (=> b!683012 (= e!389088 Unit!23995)))

(declare-fun b!683013 () Bool)

(declare-fun lt!313733 () Unit!23992)

(assert (=> b!683013 (= e!389086 lt!313733)))

(declare-fun lt!313734 () Unit!23992)

(assert (=> b!683013 (= lt!313734 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683013 (subseq!169 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39566 List!13006 List!13006 (_ BitVec 32)) Unit!23992)

(assert (=> b!683013 (= lt!313733 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!334 acc!681 (select (arr!18965 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683013 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683014 () Bool)

(declare-fun res!448880 () Bool)

(assert (=> b!683014 (=> (not res!448880) (not e!389089))))

(assert (=> b!683014 (= res!448880 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19329 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683015 () Bool)

(assert (=> b!683015 (= e!389085 (not (contains!3583 acc!681 k!2843)))))

(declare-fun b!683016 () Bool)

(assert (=> b!683016 (= e!389090 (contains!3583 acc!681 k!2843))))

(declare-fun b!683017 () Bool)

(declare-fun Unit!23996 () Unit!23992)

(assert (=> b!683017 (= e!389086 Unit!23996)))

(declare-fun b!683018 () Bool)

(declare-fun res!448886 () Bool)

(assert (=> b!683018 (=> (not res!448886) (not e!389089))))

(assert (=> b!683018 (= res!448886 (not (contains!3583 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60882 res!448873) b!683003))

(assert (= (and b!683003 res!448881) b!683007))

(assert (= (and b!683007 res!448885) b!683018))

(assert (= (and b!683018 res!448886) b!683009))

(assert (= (and b!683009 res!448884) b!683016))

(assert (= (and b!683009 (not res!448874)) b!683004))

(assert (= (and b!683004 res!448876) b!683015))

(assert (= (and b!683009 res!448878) b!683008))

(assert (= (and b!683008 res!448877) b!683011))

(assert (= (and b!683011 res!448879) b!683005))

(assert (= (and b!683005 res!448883) b!683002))

(assert (= (and b!683002 res!448875) b!683010))

(assert (= (and b!683010 res!448882) b!683014))

(assert (= (and b!683014 res!448880) b!683001))

(assert (= (and b!683001 c!77431) b!683006))

(assert (= (and b!683001 (not c!77431)) b!683012))

(assert (= (and b!683001 c!77432) b!683013))

(assert (= (and b!683001 (not c!77432)) b!683017))

(declare-fun m!647605 () Bool)

(assert (=> b!683002 m!647605))

(declare-fun m!647607 () Bool)

(assert (=> b!683008 m!647607))

(declare-fun m!647609 () Bool)

(assert (=> b!683018 m!647609))

(declare-fun m!647611 () Bool)

(assert (=> b!683015 m!647611))

(declare-fun m!647613 () Bool)

(assert (=> b!683001 m!647613))

(declare-fun m!647615 () Bool)

(assert (=> b!683001 m!647615))

(declare-fun m!647617 () Bool)

(assert (=> b!683001 m!647617))

(declare-fun m!647619 () Bool)

(assert (=> b!683001 m!647619))

(declare-fun m!647621 () Bool)

(assert (=> b!683001 m!647621))

(declare-fun m!647623 () Bool)

(assert (=> b!683001 m!647623))

(declare-fun m!647625 () Bool)

(assert (=> b!683001 m!647625))

(declare-fun m!647627 () Bool)

(assert (=> b!683001 m!647627))

(assert (=> b!683001 m!647613))

(assert (=> b!683001 m!647619))

(declare-fun m!647629 () Bool)

(assert (=> b!683001 m!647629))

(declare-fun m!647631 () Bool)

(assert (=> b!683001 m!647631))

(declare-fun m!647633 () Bool)

(assert (=> b!683001 m!647633))

(declare-fun m!647635 () Bool)

(assert (=> b!683003 m!647635))

(declare-fun m!647637 () Bool)

(assert (=> b!683007 m!647637))

(declare-fun m!647639 () Bool)

(assert (=> b!683011 m!647639))

(declare-fun m!647641 () Bool)

(assert (=> b!683006 m!647641))

(assert (=> b!683016 m!647611))

(assert (=> b!683013 m!647617))

(assert (=> b!683013 m!647619))

(declare-fun m!647643 () Bool)

(assert (=> b!683013 m!647643))

(declare-fun m!647645 () Bool)

(assert (=> b!683013 m!647645))

(assert (=> b!683013 m!647619))

(assert (=> b!683013 m!647643))

(assert (=> b!683013 m!647625))

(assert (=> b!683013 m!647633))

(declare-fun m!647647 () Bool)

(assert (=> start!60882 m!647647))

(declare-fun m!647649 () Bool)

(assert (=> b!683010 m!647649))

(push 1)

(assert (not b!683016))

(assert (not b!683013))

(assert (not b!683008))

(assert (not b!683007))

(assert (not b!683001))

(assert (not start!60882))

(assert (not b!683011))

(assert (not b!683015))

(assert (not b!683010))

(assert (not b!683006))

(assert (not b!683002))

(assert (not b!683018))

(assert (not b!683003))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

