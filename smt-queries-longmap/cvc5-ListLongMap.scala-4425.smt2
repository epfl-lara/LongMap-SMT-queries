; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61274 () Bool)

(assert start!61274)

(declare-fun b!686487 () Bool)

(declare-fun e!390927 () Bool)

(assert (=> b!686487 (= e!390927 (not true))))

(declare-datatypes ((array!39658 0))(
  ( (array!39659 (arr!19005 (Array (_ BitVec 32) (_ BitVec 64))) (size!19379 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39658)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13046 0))(
  ( (Nil!13043) (Cons!13042 (h!14087 (_ BitVec 64)) (t!19301 List!13046)) )
))
(declare-fun lt!315068 () List!13046)

(declare-fun arrayNoDuplicates!0 (array!39658 (_ BitVec 32) List!13046) Bool)

(assert (=> b!686487 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315068)))

(declare-datatypes ((Unit!24192 0))(
  ( (Unit!24193) )
))
(declare-fun lt!315062 () Unit!24192)

(declare-fun acc!681 () List!13046)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39658 (_ BitVec 64) (_ BitVec 32) List!13046 List!13046) Unit!24192)

(assert (=> b!686487 (= lt!315062 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315068))))

(declare-fun -!174 (List!13046 (_ BitVec 64)) List!13046)

(assert (=> b!686487 (= (-!174 lt!315068 k!2843) acc!681)))

(declare-fun $colon$colon!374 (List!13046 (_ BitVec 64)) List!13046)

(assert (=> b!686487 (= lt!315068 ($colon$colon!374 acc!681 k!2843))))

(declare-fun lt!315067 () Unit!24192)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13046) Unit!24192)

(assert (=> b!686487 (= lt!315067 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!209 (List!13046 List!13046) Bool)

(assert (=> b!686487 (subseq!209 acc!681 acc!681)))

(declare-fun lt!315064 () Unit!24192)

(declare-fun lemmaListSubSeqRefl!0 (List!13046) Unit!24192)

(assert (=> b!686487 (= lt!315064 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686487 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315065 () Unit!24192)

(declare-fun e!390924 () Unit!24192)

(assert (=> b!686487 (= lt!315065 e!390924)))

(declare-fun c!77803 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686487 (= c!77803 (validKeyInArray!0 (select (arr!19005 a!3626) from!3004)))))

(declare-fun lt!315063 () Unit!24192)

(declare-fun e!390929 () Unit!24192)

(assert (=> b!686487 (= lt!315063 e!390929)))

(declare-fun c!77804 () Bool)

(declare-fun arrayContainsKey!0 (array!39658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686487 (= c!77804 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686487 (arrayContainsKey!0 (array!39659 (store (arr!19005 a!3626) i!1382 k!2843) (size!19379 a!3626)) k!2843 from!3004)))

(declare-fun b!686488 () Bool)

(declare-fun res!451621 () Bool)

(assert (=> b!686488 (=> (not res!451621) (not e!390927))))

(declare-fun contains!3623 (List!13046 (_ BitVec 64)) Bool)

(assert (=> b!686488 (= res!451621 (not (contains!3623 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686489 () Bool)

(declare-fun Unit!24194 () Unit!24192)

(assert (=> b!686489 (= e!390929 Unit!24194)))

(declare-fun lt!315066 () Unit!24192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39658 (_ BitVec 64) (_ BitVec 32)) Unit!24192)

(assert (=> b!686489 (= lt!315066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686489 false))

(declare-fun b!686490 () Bool)

(declare-fun res!451628 () Bool)

(assert (=> b!686490 (=> (not res!451628) (not e!390927))))

(assert (=> b!686490 (= res!451628 (not (contains!3623 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686491 () Bool)

(declare-fun res!451623 () Bool)

(assert (=> b!686491 (=> (not res!451623) (not e!390927))))

(assert (=> b!686491 (= res!451623 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686492 () Bool)

(declare-fun res!451625 () Bool)

(assert (=> b!686492 (=> (not res!451625) (not e!390927))))

(declare-fun e!390925 () Bool)

(assert (=> b!686492 (= res!451625 e!390925)))

(declare-fun res!451620 () Bool)

(assert (=> b!686492 (=> res!451620 e!390925)))

(declare-fun e!390926 () Bool)

(assert (=> b!686492 (= res!451620 e!390926)))

(declare-fun res!451624 () Bool)

(assert (=> b!686492 (=> (not res!451624) (not e!390926))))

(assert (=> b!686492 (= res!451624 (bvsgt from!3004 i!1382))))

(declare-fun b!686493 () Bool)

(assert (=> b!686493 (= e!390926 (contains!3623 acc!681 k!2843))))

(declare-fun b!686494 () Bool)

(declare-fun lt!315070 () Unit!24192)

(assert (=> b!686494 (= e!390924 lt!315070)))

(declare-fun lt!315069 () Unit!24192)

(assert (=> b!686494 (= lt!315069 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686494 (subseq!209 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39658 List!13046 List!13046 (_ BitVec 32)) Unit!24192)

(assert (=> b!686494 (= lt!315070 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!374 acc!681 (select (arr!19005 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686494 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686495 () Bool)

(declare-fun Unit!24195 () Unit!24192)

(assert (=> b!686495 (= e!390924 Unit!24195)))

(declare-fun b!686496 () Bool)

(declare-fun e!390930 () Bool)

(assert (=> b!686496 (= e!390930 (not (contains!3623 acc!681 k!2843)))))

(declare-fun b!686497 () Bool)

(declare-fun res!451617 () Bool)

(assert (=> b!686497 (=> (not res!451617) (not e!390927))))

(assert (=> b!686497 (= res!451617 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686498 () Bool)

(declare-fun res!451616 () Bool)

(assert (=> b!686498 (=> (not res!451616) (not e!390927))))

(assert (=> b!686498 (= res!451616 (validKeyInArray!0 k!2843))))

(declare-fun res!451627 () Bool)

(assert (=> start!61274 (=> (not res!451627) (not e!390927))))

(assert (=> start!61274 (= res!451627 (and (bvslt (size!19379 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19379 a!3626))))))

(assert (=> start!61274 e!390927))

(assert (=> start!61274 true))

(declare-fun array_inv!14801 (array!39658) Bool)

(assert (=> start!61274 (array_inv!14801 a!3626)))

(declare-fun b!686499 () Bool)

(declare-fun res!451619 () Bool)

(assert (=> b!686499 (=> (not res!451619) (not e!390927))))

(assert (=> b!686499 (= res!451619 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19379 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686500 () Bool)

(declare-fun res!451622 () Bool)

(assert (=> b!686500 (=> (not res!451622) (not e!390927))))

(assert (=> b!686500 (= res!451622 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13043))))

(declare-fun b!686501 () Bool)

(declare-fun res!451626 () Bool)

(assert (=> b!686501 (=> (not res!451626) (not e!390927))))

(assert (=> b!686501 (= res!451626 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19379 a!3626))))))

(declare-fun b!686502 () Bool)

(assert (=> b!686502 (= e!390925 e!390930)))

(declare-fun res!451615 () Bool)

(assert (=> b!686502 (=> (not res!451615) (not e!390930))))

(assert (=> b!686502 (= res!451615 (bvsle from!3004 i!1382))))

(declare-fun b!686503 () Bool)

(declare-fun res!451618 () Bool)

(assert (=> b!686503 (=> (not res!451618) (not e!390927))))

(declare-fun noDuplicate!870 (List!13046) Bool)

(assert (=> b!686503 (= res!451618 (noDuplicate!870 acc!681))))

(declare-fun b!686504 () Bool)

(declare-fun Unit!24196 () Unit!24192)

(assert (=> b!686504 (= e!390929 Unit!24196)))

(assert (= (and start!61274 res!451627) b!686503))

(assert (= (and b!686503 res!451618) b!686488))

(assert (= (and b!686488 res!451621) b!686490))

(assert (= (and b!686490 res!451628) b!686492))

(assert (= (and b!686492 res!451624) b!686493))

(assert (= (and b!686492 (not res!451620)) b!686502))

(assert (= (and b!686502 res!451615) b!686496))

(assert (= (and b!686492 res!451625) b!686500))

(assert (= (and b!686500 res!451622) b!686497))

(assert (= (and b!686497 res!451617) b!686501))

(assert (= (and b!686501 res!451626) b!686498))

(assert (= (and b!686498 res!451616) b!686491))

(assert (= (and b!686491 res!451623) b!686499))

(assert (= (and b!686499 res!451619) b!686487))

(assert (= (and b!686487 c!77804) b!686489))

(assert (= (and b!686487 (not c!77804)) b!686504))

(assert (= (and b!686487 c!77803) b!686494))

(assert (= (and b!686487 (not c!77803)) b!686495))

(declare-fun m!650579 () Bool)

(assert (=> b!686491 m!650579))

(declare-fun m!650581 () Bool)

(assert (=> b!686487 m!650581))

(declare-fun m!650583 () Bool)

(assert (=> b!686487 m!650583))

(declare-fun m!650585 () Bool)

(assert (=> b!686487 m!650585))

(declare-fun m!650587 () Bool)

(assert (=> b!686487 m!650587))

(declare-fun m!650589 () Bool)

(assert (=> b!686487 m!650589))

(declare-fun m!650591 () Bool)

(assert (=> b!686487 m!650591))

(declare-fun m!650593 () Bool)

(assert (=> b!686487 m!650593))

(declare-fun m!650595 () Bool)

(assert (=> b!686487 m!650595))

(assert (=> b!686487 m!650583))

(declare-fun m!650597 () Bool)

(assert (=> b!686487 m!650597))

(declare-fun m!650599 () Bool)

(assert (=> b!686487 m!650599))

(declare-fun m!650601 () Bool)

(assert (=> b!686487 m!650601))

(declare-fun m!650603 () Bool)

(assert (=> b!686487 m!650603))

(declare-fun m!650605 () Bool)

(assert (=> b!686487 m!650605))

(declare-fun m!650607 () Bool)

(assert (=> b!686489 m!650607))

(declare-fun m!650609 () Bool)

(assert (=> b!686493 m!650609))

(declare-fun m!650611 () Bool)

(assert (=> b!686490 m!650611))

(declare-fun m!650613 () Bool)

(assert (=> b!686498 m!650613))

(assert (=> b!686496 m!650609))

(declare-fun m!650615 () Bool)

(assert (=> b!686500 m!650615))

(declare-fun m!650617 () Bool)

(assert (=> b!686488 m!650617))

(declare-fun m!650619 () Bool)

(assert (=> b!686503 m!650619))

(assert (=> b!686494 m!650601))

(assert (=> b!686494 m!650583))

(declare-fun m!650621 () Bool)

(assert (=> b!686494 m!650621))

(declare-fun m!650623 () Bool)

(assert (=> b!686494 m!650623))

(assert (=> b!686494 m!650583))

(assert (=> b!686494 m!650621))

(assert (=> b!686494 m!650591))

(assert (=> b!686494 m!650605))

(declare-fun m!650625 () Bool)

(assert (=> start!61274 m!650625))

(declare-fun m!650627 () Bool)

(assert (=> b!686497 m!650627))

(push 1)

(assert (not b!686488))

(assert (not b!686494))

(assert (not b!686491))

(assert (not b!686500))

(assert (not b!686489))

(assert (not start!61274))

(assert (not b!686490))

(assert (not b!686496))

(assert (not b!686503))

(assert (not b!686498))

(assert (not b!686497))

(assert (not b!686493))

(assert (not b!686487))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

