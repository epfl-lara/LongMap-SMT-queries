; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60986 () Bool)

(assert start!60986)

(declare-fun b!683985 () Bool)

(declare-fun res!449638 () Bool)

(declare-fun e!389603 () Bool)

(assert (=> b!683985 (=> (not res!449638) (not e!389603))))

(declare-datatypes ((List!13019 0))(
  ( (Nil!13016) (Cons!13015 (h!14060 (_ BitVec 64)) (t!19265 List!13019)) )
))
(declare-fun acc!681 () List!13019)

(declare-fun contains!3596 (List!13019 (_ BitVec 64)) Bool)

(assert (=> b!683985 (= res!449638 (not (contains!3596 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683986 () Bool)

(declare-fun res!449651 () Bool)

(assert (=> b!683986 (=> (not res!449651) (not e!389603))))

(declare-fun noDuplicate!843 (List!13019) Bool)

(assert (=> b!683986 (= res!449651 (noDuplicate!843 acc!681))))

(declare-fun b!683987 () Bool)

(declare-fun e!389599 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!683987 (= e!389599 (contains!3596 acc!681 k!2843))))

(declare-fun b!683988 () Bool)

(declare-fun res!449640 () Bool)

(assert (=> b!683988 (=> (not res!449640) (not e!389603))))

(declare-datatypes ((array!39595 0))(
  ( (array!39596 (arr!18978 (Array (_ BitVec 32) (_ BitVec 64))) (size!19345 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39595)

(declare-fun arrayContainsKey!0 (array!39595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683988 (= res!449640 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683989 () Bool)

(declare-fun res!449636 () Bool)

(assert (=> b!683989 (=> (not res!449636) (not e!389603))))

(declare-fun e!389602 () Bool)

(assert (=> b!683989 (= res!449636 e!389602)))

(declare-fun res!449637 () Bool)

(assert (=> b!683989 (=> res!449637 e!389602)))

(assert (=> b!683989 (= res!449637 e!389599)))

(declare-fun res!449645 () Bool)

(assert (=> b!683989 (=> (not res!449645) (not e!389599))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683989 (= res!449645 (bvsgt from!3004 i!1382))))

(declare-fun b!683990 () Bool)

(declare-datatypes ((Unit!24057 0))(
  ( (Unit!24058) )
))
(declare-fun e!389601 () Unit!24057)

(declare-fun lt!314114 () Unit!24057)

(assert (=> b!683990 (= e!389601 lt!314114)))

(declare-fun lt!314115 () Unit!24057)

(declare-fun lemmaListSubSeqRefl!0 (List!13019) Unit!24057)

(assert (=> b!683990 (= lt!314115 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!182 (List!13019 List!13019) Bool)

(assert (=> b!683990 (subseq!182 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39595 List!13019 List!13019 (_ BitVec 32)) Unit!24057)

(declare-fun $colon$colon!347 (List!13019 (_ BitVec 64)) List!13019)

(assert (=> b!683990 (= lt!314114 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!347 acc!681 (select (arr!18978 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39595 (_ BitVec 32) List!13019) Bool)

(assert (=> b!683990 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!449649 () Bool)

(assert (=> start!60986 (=> (not res!449649) (not e!389603))))

(assert (=> start!60986 (= res!449649 (and (bvslt (size!19345 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19345 a!3626))))))

(assert (=> start!60986 e!389603))

(assert (=> start!60986 true))

(declare-fun array_inv!14774 (array!39595) Bool)

(assert (=> start!60986 (array_inv!14774 a!3626)))

(declare-fun b!683991 () Bool)

(declare-fun e!389600 () Bool)

(assert (=> b!683991 (= e!389600 (not (contains!3596 acc!681 k!2843)))))

(declare-fun b!683992 () Bool)

(declare-fun res!449646 () Bool)

(assert (=> b!683992 (=> (not res!449646) (not e!389603))))

(assert (=> b!683992 (= res!449646 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19345 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683993 () Bool)

(declare-fun e!389598 () Bool)

(assert (=> b!683993 (= e!389598 (not (contains!3596 acc!681 k!2843)))))

(declare-fun b!683994 () Bool)

(declare-fun res!449650 () Bool)

(assert (=> b!683994 (=> (not res!449650) (not e!389603))))

(assert (=> b!683994 (= res!449650 (not (contains!3596 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683995 () Bool)

(declare-fun res!449644 () Bool)

(assert (=> b!683995 (=> res!449644 e!389598)))

(declare-fun lt!314118 () List!13019)

(assert (=> b!683995 (= res!449644 (not (noDuplicate!843 lt!314118)))))

(declare-fun b!683996 () Bool)

(declare-fun e!389604 () Unit!24057)

(declare-fun Unit!24059 () Unit!24057)

(assert (=> b!683996 (= e!389604 Unit!24059)))

(declare-fun b!683997 () Bool)

(declare-fun res!449635 () Bool)

(assert (=> b!683997 (=> (not res!449635) (not e!389603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683997 (= res!449635 (validKeyInArray!0 k!2843))))

(declare-fun b!683998 () Bool)

(declare-fun res!449643 () Bool)

(assert (=> b!683998 (=> (not res!449643) (not e!389603))))

(assert (=> b!683998 (= res!449643 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683999 () Bool)

(assert (=> b!683999 (= e!389602 e!389600)))

(declare-fun res!449642 () Bool)

(assert (=> b!683999 (=> (not res!449642) (not e!389600))))

(assert (=> b!683999 (= res!449642 (bvsle from!3004 i!1382))))

(declare-fun b!684000 () Bool)

(declare-fun res!449639 () Bool)

(assert (=> b!684000 (=> res!449639 e!389598)))

(declare-fun lt!314121 () Bool)

(assert (=> b!684000 (= res!449639 lt!314121)))

(declare-fun b!684001 () Bool)

(assert (=> b!684001 (= e!389603 (not e!389598))))

(declare-fun res!449648 () Bool)

(assert (=> b!684001 (=> res!449648 e!389598)))

(assert (=> b!684001 (= res!449648 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!147 (List!13019 (_ BitVec 64)) List!13019)

(assert (=> b!684001 (= (-!147 lt!314118 k!2843) acc!681)))

(assert (=> b!684001 (= lt!314118 ($colon$colon!347 acc!681 k!2843))))

(declare-fun lt!314116 () Unit!24057)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13019) Unit!24057)

(assert (=> b!684001 (= lt!314116 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!684001 (subseq!182 acc!681 acc!681)))

(declare-fun lt!314119 () Unit!24057)

(assert (=> b!684001 (= lt!314119 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684001 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314117 () Unit!24057)

(assert (=> b!684001 (= lt!314117 e!389601)))

(declare-fun c!77543 () Bool)

(assert (=> b!684001 (= c!77543 (validKeyInArray!0 (select (arr!18978 a!3626) from!3004)))))

(declare-fun lt!314120 () Unit!24057)

(assert (=> b!684001 (= lt!314120 e!389604)))

(declare-fun c!77542 () Bool)

(assert (=> b!684001 (= c!77542 lt!314121)))

(assert (=> b!684001 (= lt!314121 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684001 (arrayContainsKey!0 (array!39596 (store (arr!18978 a!3626) i!1382 k!2843) (size!19345 a!3626)) k!2843 from!3004)))

(declare-fun b!684002 () Bool)

(declare-fun Unit!24060 () Unit!24057)

(assert (=> b!684002 (= e!389604 Unit!24060)))

(declare-fun lt!314122 () Unit!24057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39595 (_ BitVec 64) (_ BitVec 32)) Unit!24057)

(assert (=> b!684002 (= lt!314122 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684002 false))

(declare-fun b!684003 () Bool)

(declare-fun res!449641 () Bool)

(assert (=> b!684003 (=> (not res!449641) (not e!389603))))

(assert (=> b!684003 (= res!449641 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13016))))

(declare-fun b!684004 () Bool)

(declare-fun res!449647 () Bool)

(assert (=> b!684004 (=> (not res!449647) (not e!389603))))

(assert (=> b!684004 (= res!449647 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19345 a!3626))))))

(declare-fun b!684005 () Bool)

(declare-fun Unit!24061 () Unit!24057)

(assert (=> b!684005 (= e!389601 Unit!24061)))

(assert (= (and start!60986 res!449649) b!683986))

(assert (= (and b!683986 res!449651) b!683994))

(assert (= (and b!683994 res!449650) b!683985))

(assert (= (and b!683985 res!449638) b!683989))

(assert (= (and b!683989 res!449645) b!683987))

(assert (= (and b!683989 (not res!449637)) b!683999))

(assert (= (and b!683999 res!449642) b!683991))

(assert (= (and b!683989 res!449636) b!684003))

(assert (= (and b!684003 res!449641) b!683998))

(assert (= (and b!683998 res!449643) b!684004))

(assert (= (and b!684004 res!449647) b!683997))

(assert (= (and b!683997 res!449635) b!683988))

(assert (= (and b!683988 res!449640) b!683992))

(assert (= (and b!683992 res!449646) b!684001))

(assert (= (and b!684001 c!77542) b!684002))

(assert (= (and b!684001 (not c!77542)) b!683996))

(assert (= (and b!684001 c!77543) b!683990))

(assert (= (and b!684001 (not c!77543)) b!684005))

(assert (= (and b!684001 (not res!449648)) b!683995))

(assert (= (and b!683995 (not res!449644)) b!684000))

(assert (= (and b!684000 (not res!449639)) b!683993))

(declare-fun m!648449 () Bool)

(assert (=> b!683991 m!648449))

(declare-fun m!648451 () Bool)

(assert (=> b!684003 m!648451))

(declare-fun m!648453 () Bool)

(assert (=> b!683995 m!648453))

(declare-fun m!648455 () Bool)

(assert (=> b!683986 m!648455))

(declare-fun m!648457 () Bool)

(assert (=> b!683998 m!648457))

(declare-fun m!648459 () Bool)

(assert (=> b!683994 m!648459))

(declare-fun m!648461 () Bool)

(assert (=> b!683997 m!648461))

(declare-fun m!648463 () Bool)

(assert (=> b!684001 m!648463))

(declare-fun m!648465 () Bool)

(assert (=> b!684001 m!648465))

(declare-fun m!648467 () Bool)

(assert (=> b!684001 m!648467))

(declare-fun m!648469 () Bool)

(assert (=> b!684001 m!648469))

(declare-fun m!648471 () Bool)

(assert (=> b!684001 m!648471))

(declare-fun m!648473 () Bool)

(assert (=> b!684001 m!648473))

(declare-fun m!648475 () Bool)

(assert (=> b!684001 m!648475))

(declare-fun m!648477 () Bool)

(assert (=> b!684001 m!648477))

(assert (=> b!684001 m!648467))

(declare-fun m!648479 () Bool)

(assert (=> b!684001 m!648479))

(declare-fun m!648481 () Bool)

(assert (=> b!684001 m!648481))

(declare-fun m!648483 () Bool)

(assert (=> b!684001 m!648483))

(declare-fun m!648485 () Bool)

(assert (=> b!683988 m!648485))

(assert (=> b!683987 m!648449))

(declare-fun m!648487 () Bool)

(assert (=> b!684002 m!648487))

(assert (=> b!683990 m!648463))

(assert (=> b!683990 m!648467))

(declare-fun m!648489 () Bool)

(assert (=> b!683990 m!648489))

(declare-fun m!648491 () Bool)

(assert (=> b!683990 m!648491))

(assert (=> b!683990 m!648467))

(assert (=> b!683990 m!648489))

(assert (=> b!683990 m!648473))

(assert (=> b!683990 m!648483))

(assert (=> b!683993 m!648449))

(declare-fun m!648493 () Bool)

(assert (=> start!60986 m!648493))

(declare-fun m!648495 () Bool)

(assert (=> b!683985 m!648495))

(push 1)

