; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61254 () Bool)

(assert start!61254)

(declare-fun b!685975 () Bool)

(declare-fun res!451322 () Bool)

(declare-fun e!390652 () Bool)

(assert (=> b!685975 (=> (not res!451322) (not e!390652))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39649 0))(
  ( (array!39650 (arr!19000 (Array (_ BitVec 32) (_ BitVec 64))) (size!19374 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39649)

(assert (=> b!685975 (= res!451322 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19374 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685976 () Bool)

(declare-fun e!390653 () Bool)

(declare-datatypes ((List!13080 0))(
  ( (Nil!13077) (Cons!13076 (h!14121 (_ BitVec 64)) (t!19326 List!13080)) )
))
(declare-fun acc!681 () List!13080)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3602 (List!13080 (_ BitVec 64)) Bool)

(assert (=> b!685976 (= e!390653 (not (contains!3602 acc!681 k!2843)))))

(declare-fun b!685977 () Bool)

(declare-fun e!390650 () Bool)

(assert (=> b!685977 (= e!390650 (contains!3602 acc!681 k!2843))))

(declare-fun b!685978 () Bool)

(declare-datatypes ((Unit!24150 0))(
  ( (Unit!24151) )
))
(declare-fun e!390656 () Unit!24150)

(declare-fun Unit!24152 () Unit!24150)

(assert (=> b!685978 (= e!390656 Unit!24152)))

(declare-fun b!685979 () Bool)

(declare-fun res!451319 () Bool)

(assert (=> b!685979 (=> (not res!451319) (not e!390652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685979 (= res!451319 (validKeyInArray!0 k!2843))))

(declare-fun b!685980 () Bool)

(declare-fun res!451320 () Bool)

(assert (=> b!685980 (=> (not res!451320) (not e!390652))))

(declare-fun arrayContainsKey!0 (array!39649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685980 (= res!451320 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685981 () Bool)

(declare-fun res!451311 () Bool)

(assert (=> b!685981 (=> (not res!451311) (not e!390652))))

(declare-fun e!390651 () Bool)

(assert (=> b!685981 (= res!451311 e!390651)))

(declare-fun res!451312 () Bool)

(assert (=> b!685981 (=> res!451312 e!390651)))

(assert (=> b!685981 (= res!451312 e!390650)))

(declare-fun res!451324 () Bool)

(assert (=> b!685981 (=> (not res!451324) (not e!390650))))

(assert (=> b!685981 (= res!451324 (bvsgt from!3004 i!1382))))

(declare-fun b!685983 () Bool)

(declare-fun res!451313 () Bool)

(assert (=> b!685983 (=> (not res!451313) (not e!390652))))

(assert (=> b!685983 (= res!451313 (not (contains!3602 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685984 () Bool)

(declare-fun e!390654 () Unit!24150)

(declare-fun Unit!24153 () Unit!24150)

(assert (=> b!685984 (= e!390654 Unit!24153)))

(declare-fun lt!314706 () Unit!24150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39649 (_ BitVec 64) (_ BitVec 32)) Unit!24150)

(assert (=> b!685984 (= lt!314706 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685984 false))

(declare-fun b!685985 () Bool)

(assert (=> b!685985 (= e!390652 (not true))))

(declare-fun lt!314703 () List!13080)

(declare-fun arrayNoDuplicates!0 (array!39649 (_ BitVec 32) List!13080) Bool)

(assert (=> b!685985 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314703)))

(declare-fun lt!314701 () Unit!24150)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39649 (_ BitVec 64) (_ BitVec 32) List!13080 List!13080) Unit!24150)

(assert (=> b!685985 (= lt!314701 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314703))))

(declare-fun -!170 (List!13080 (_ BitVec 64)) List!13080)

(assert (=> b!685985 (= (-!170 lt!314703 k!2843) acc!681)))

(declare-fun $colon$colon!369 (List!13080 (_ BitVec 64)) List!13080)

(assert (=> b!685985 (= lt!314703 ($colon$colon!369 acc!681 k!2843))))

(declare-fun lt!314702 () Unit!24150)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13080) Unit!24150)

(assert (=> b!685985 (= lt!314702 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!205 (List!13080 List!13080) Bool)

(assert (=> b!685985 (subseq!205 acc!681 acc!681)))

(declare-fun lt!314699 () Unit!24150)

(declare-fun lemmaListSubSeqRefl!0 (List!13080) Unit!24150)

(assert (=> b!685985 (= lt!314699 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685985 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314698 () Unit!24150)

(assert (=> b!685985 (= lt!314698 e!390656)))

(declare-fun c!77699 () Bool)

(assert (=> b!685985 (= c!77699 (validKeyInArray!0 (select (arr!19000 a!3626) from!3004)))))

(declare-fun lt!314704 () Unit!24150)

(assert (=> b!685985 (= lt!314704 e!390654)))

(declare-fun c!77700 () Bool)

(assert (=> b!685985 (= c!77700 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685985 (arrayContainsKey!0 (array!39650 (store (arr!19000 a!3626) i!1382 k!2843) (size!19374 a!3626)) k!2843 from!3004)))

(declare-fun b!685986 () Bool)

(declare-fun lt!314705 () Unit!24150)

(assert (=> b!685986 (= e!390656 lt!314705)))

(declare-fun lt!314700 () Unit!24150)

(assert (=> b!685986 (= lt!314700 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685986 (subseq!205 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39649 List!13080 List!13080 (_ BitVec 32)) Unit!24150)

(assert (=> b!685986 (= lt!314705 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!369 acc!681 (select (arr!19000 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685986 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685987 () Bool)

(declare-fun res!451315 () Bool)

(assert (=> b!685987 (=> (not res!451315) (not e!390652))))

(assert (=> b!685987 (= res!451315 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19374 a!3626))))))

(declare-fun b!685988 () Bool)

(declare-fun res!451314 () Bool)

(assert (=> b!685988 (=> (not res!451314) (not e!390652))))

(declare-fun noDuplicate!871 (List!13080) Bool)

(assert (=> b!685988 (= res!451314 (noDuplicate!871 acc!681))))

(declare-fun b!685989 () Bool)

(assert (=> b!685989 (= e!390651 e!390653)))

(declare-fun res!451316 () Bool)

(assert (=> b!685989 (=> (not res!451316) (not e!390653))))

(assert (=> b!685989 (= res!451316 (bvsle from!3004 i!1382))))

(declare-fun b!685990 () Bool)

(declare-fun Unit!24154 () Unit!24150)

(assert (=> b!685990 (= e!390654 Unit!24154)))

(declare-fun b!685982 () Bool)

(declare-fun res!451318 () Bool)

(assert (=> b!685982 (=> (not res!451318) (not e!390652))))

(assert (=> b!685982 (= res!451318 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13077))))

(declare-fun res!451317 () Bool)

(assert (=> start!61254 (=> (not res!451317) (not e!390652))))

(assert (=> start!61254 (= res!451317 (and (bvslt (size!19374 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19374 a!3626))))))

(assert (=> start!61254 e!390652))

(assert (=> start!61254 true))

(declare-fun array_inv!14883 (array!39649) Bool)

(assert (=> start!61254 (array_inv!14883 a!3626)))

(declare-fun b!685991 () Bool)

(declare-fun res!451321 () Bool)

(assert (=> b!685991 (=> (not res!451321) (not e!390652))))

(assert (=> b!685991 (= res!451321 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685992 () Bool)

(declare-fun res!451323 () Bool)

(assert (=> b!685992 (=> (not res!451323) (not e!390652))))

(assert (=> b!685992 (= res!451323 (not (contains!3602 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61254 res!451317) b!685988))

(assert (= (and b!685988 res!451314) b!685983))

(assert (= (and b!685983 res!451313) b!685992))

(assert (= (and b!685992 res!451323) b!685981))

(assert (= (and b!685981 res!451324) b!685977))

(assert (= (and b!685981 (not res!451312)) b!685989))

(assert (= (and b!685989 res!451316) b!685976))

(assert (= (and b!685981 res!451311) b!685982))

(assert (= (and b!685982 res!451318) b!685991))

(assert (= (and b!685991 res!451321) b!685987))

(assert (= (and b!685987 res!451315) b!685979))

(assert (= (and b!685979 res!451319) b!685980))

(assert (= (and b!685980 res!451320) b!685975))

(assert (= (and b!685975 res!451322) b!685985))

(assert (= (and b!685985 c!77700) b!685984))

(assert (= (and b!685985 (not c!77700)) b!685990))

(assert (= (and b!685985 c!77699) b!685986))

(assert (= (and b!685985 (not c!77699)) b!685978))

(declare-fun m!649597 () Bool)

(assert (=> b!685988 m!649597))

(declare-fun m!649599 () Bool)

(assert (=> b!685977 m!649599))

(declare-fun m!649601 () Bool)

(assert (=> b!685982 m!649601))

(declare-fun m!649603 () Bool)

(assert (=> b!685979 m!649603))

(declare-fun m!649605 () Bool)

(assert (=> b!685985 m!649605))

(declare-fun m!649607 () Bool)

(assert (=> b!685985 m!649607))

(declare-fun m!649609 () Bool)

(assert (=> b!685985 m!649609))

(declare-fun m!649611 () Bool)

(assert (=> b!685985 m!649611))

(declare-fun m!649613 () Bool)

(assert (=> b!685985 m!649613))

(declare-fun m!649615 () Bool)

(assert (=> b!685985 m!649615))

(declare-fun m!649617 () Bool)

(assert (=> b!685985 m!649617))

(declare-fun m!649619 () Bool)

(assert (=> b!685985 m!649619))

(assert (=> b!685985 m!649605))

(declare-fun m!649621 () Bool)

(assert (=> b!685985 m!649621))

(declare-fun m!649623 () Bool)

(assert (=> b!685985 m!649623))

(declare-fun m!649625 () Bool)

(assert (=> b!685985 m!649625))

(declare-fun m!649627 () Bool)

(assert (=> b!685985 m!649627))

(declare-fun m!649629 () Bool)

(assert (=> b!685985 m!649629))

(declare-fun m!649631 () Bool)

(assert (=> b!685983 m!649631))

(declare-fun m!649633 () Bool)

(assert (=> b!685984 m!649633))

(declare-fun m!649635 () Bool)

(assert (=> b!685991 m!649635))

(assert (=> b!685986 m!649625))

(assert (=> b!685986 m!649605))

(declare-fun m!649637 () Bool)

(assert (=> b!685986 m!649637))

(declare-fun m!649639 () Bool)

(assert (=> b!685986 m!649639))

(assert (=> b!685986 m!649605))

(assert (=> b!685986 m!649637))

(assert (=> b!685986 m!649615))

(assert (=> b!685986 m!649629))

(declare-fun m!649641 () Bool)

(assert (=> b!685980 m!649641))

(declare-fun m!649643 () Bool)

(assert (=> start!61254 m!649643))

(assert (=> b!685976 m!649599))

(declare-fun m!649645 () Bool)

(assert (=> b!685992 m!649645))

(push 1)

(assert (not b!685984))

(assert (not b!685991))

(assert (not b!685992))

(assert (not b!685979))

(assert (not b!685976))

(assert (not b!685982))

(assert (not b!685988))

(assert (not b!685985))

(assert (not start!61254))

(assert (not b!685986))

(assert (not b!685983))

(assert (not b!685980))

(assert (not b!685977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

