; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60188 () Bool)

(assert start!60188)

(declare-fun b!672964 () Bool)

(declare-fun res!439557 () Bool)

(declare-fun e!384370 () Bool)

(assert (=> b!672964 (=> (not res!439557) (not e!384370))))

(declare-datatypes ((array!39235 0))(
  ( (array!39236 (arr!18810 (Array (_ BitVec 32) (_ BitVec 64))) (size!19174 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39235)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672964 (= res!439557 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672965 () Bool)

(declare-fun res!439550 () Bool)

(assert (=> b!672965 (=> (not res!439550) (not e!384370))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672965 (= res!439550 (validKeyInArray!0 (select (arr!18810 a!3626) from!3004)))))

(declare-fun res!439563 () Bool)

(assert (=> start!60188 (=> (not res!439563) (not e!384370))))

(assert (=> start!60188 (= res!439563 (and (bvslt (size!19174 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19174 a!3626))))))

(assert (=> start!60188 e!384370))

(assert (=> start!60188 true))

(declare-fun array_inv!14606 (array!39235) Bool)

(assert (=> start!60188 (array_inv!14606 a!3626)))

(declare-fun b!672966 () Bool)

(declare-fun res!439565 () Bool)

(assert (=> b!672966 (=> (not res!439565) (not e!384370))))

(declare-datatypes ((List!12851 0))(
  ( (Nil!12848) (Cons!12847 (h!13892 (_ BitVec 64)) (t!19079 List!12851)) )
))
(declare-fun arrayNoDuplicates!0 (array!39235 (_ BitVec 32) List!12851) Bool)

(assert (=> b!672966 (= res!439565 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12848))))

(declare-fun b!672967 () Bool)

(declare-fun e!384368 () Bool)

(declare-fun e!384371 () Bool)

(assert (=> b!672967 (= e!384368 e!384371)))

(declare-fun res!439568 () Bool)

(assert (=> b!672967 (=> (not res!439568) (not e!384371))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672967 (= res!439568 (bvsle from!3004 i!1382))))

(declare-fun b!672968 () Bool)

(declare-fun res!439558 () Bool)

(assert (=> b!672968 (=> (not res!439558) (not e!384370))))

(assert (=> b!672968 (= res!439558 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19174 a!3626))))))

(declare-fun b!672969 () Bool)

(declare-datatypes ((Unit!23652 0))(
  ( (Unit!23653) )
))
(declare-fun e!384363 () Unit!23652)

(declare-fun Unit!23654 () Unit!23652)

(assert (=> b!672969 (= e!384363 Unit!23654)))

(assert (=> b!672969 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312392 () Unit!23652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39235 (_ BitVec 64) (_ BitVec 32)) Unit!23652)

(assert (=> b!672969 (= lt!312392 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672969 false))

(declare-fun b!672970 () Bool)

(declare-fun Unit!23655 () Unit!23652)

(assert (=> b!672970 (= e!384363 Unit!23655)))

(declare-fun b!672971 () Bool)

(declare-fun e!384362 () Bool)

(declare-fun lt!312391 () List!12851)

(declare-fun contains!3428 (List!12851 (_ BitVec 64)) Bool)

(assert (=> b!672971 (= e!384362 (contains!3428 lt!312391 k!2843))))

(declare-fun b!672972 () Bool)

(declare-fun res!439559 () Bool)

(assert (=> b!672972 (=> (not res!439559) (not e!384370))))

(assert (=> b!672972 (= res!439559 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19174 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672973 () Bool)

(declare-fun res!439556 () Bool)

(assert (=> b!672973 (=> (not res!439556) (not e!384370))))

(assert (=> b!672973 (= res!439556 e!384368)))

(declare-fun res!439569 () Bool)

(assert (=> b!672973 (=> res!439569 e!384368)))

(declare-fun e!384365 () Bool)

(assert (=> b!672973 (= res!439569 e!384365)))

(declare-fun res!439567 () Bool)

(assert (=> b!672973 (=> (not res!439567) (not e!384365))))

(assert (=> b!672973 (= res!439567 (bvsgt from!3004 i!1382))))

(declare-fun b!672974 () Bool)

(declare-fun acc!681 () List!12851)

(assert (=> b!672974 (= e!384365 (contains!3428 acc!681 k!2843))))

(declare-fun b!672975 () Bool)

(assert (=> b!672975 (= e!384371 (not (contains!3428 acc!681 k!2843)))))

(declare-fun b!672976 () Bool)

(declare-fun e!384372 () Bool)

(assert (=> b!672976 (= e!384372 false)))

(declare-fun lt!312394 () Bool)

(assert (=> b!672976 (= lt!312394 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312391))))

(declare-fun b!672977 () Bool)

(declare-fun e!384369 () Bool)

(assert (=> b!672977 (= e!384369 e!384372)))

(declare-fun res!439561 () Bool)

(assert (=> b!672977 (=> (not res!439561) (not e!384372))))

(assert (=> b!672977 (= res!439561 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!278 (List!12851 (_ BitVec 64)) List!12851)

(assert (=> b!672977 (= lt!312391 ($colon$colon!278 acc!681 (select (arr!18810 a!3626) from!3004)))))

(declare-fun b!672978 () Bool)

(declare-fun res!439571 () Bool)

(assert (=> b!672978 (=> (not res!439571) (not e!384370))))

(assert (=> b!672978 (= res!439571 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672979 () Bool)

(declare-fun res!439560 () Bool)

(assert (=> b!672979 (=> (not res!439560) (not e!384372))))

(assert (=> b!672979 (= res!439560 (not (contains!3428 lt!312391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672980 () Bool)

(declare-fun e!384364 () Bool)

(assert (=> b!672980 (= e!384364 (not (contains!3428 lt!312391 k!2843)))))

(declare-fun b!672981 () Bool)

(declare-fun res!439555 () Bool)

(assert (=> b!672981 (=> (not res!439555) (not e!384370))))

(assert (=> b!672981 (= res!439555 (not (contains!3428 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672982 () Bool)

(declare-fun e!384367 () Bool)

(assert (=> b!672982 (= e!384367 e!384364)))

(declare-fun res!439562 () Bool)

(assert (=> b!672982 (=> (not res!439562) (not e!384364))))

(assert (=> b!672982 (= res!439562 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672983 () Bool)

(declare-fun res!439564 () Bool)

(assert (=> b!672983 (=> (not res!439564) (not e!384372))))

(assert (=> b!672983 (= res!439564 (not (contains!3428 lt!312391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672984 () Bool)

(assert (=> b!672984 (= e!384370 e!384369)))

(declare-fun res!439551 () Bool)

(assert (=> b!672984 (=> (not res!439551) (not e!384369))))

(assert (=> b!672984 (= res!439551 (not (= (select (arr!18810 a!3626) from!3004) k!2843)))))

(declare-fun lt!312393 () Unit!23652)

(assert (=> b!672984 (= lt!312393 e!384363)))

(declare-fun c!77075 () Bool)

(assert (=> b!672984 (= c!77075 (= (select (arr!18810 a!3626) from!3004) k!2843))))

(declare-fun b!672985 () Bool)

(declare-fun res!439553 () Bool)

(assert (=> b!672985 (=> (not res!439553) (not e!384372))))

(declare-fun noDuplicate!675 (List!12851) Bool)

(assert (=> b!672985 (= res!439553 (noDuplicate!675 lt!312391))))

(declare-fun b!672986 () Bool)

(declare-fun res!439549 () Bool)

(assert (=> b!672986 (=> (not res!439549) (not e!384370))))

(assert (=> b!672986 (= res!439549 (validKeyInArray!0 k!2843))))

(declare-fun b!672987 () Bool)

(declare-fun res!439552 () Bool)

(assert (=> b!672987 (=> (not res!439552) (not e!384370))))

(assert (=> b!672987 (= res!439552 (not (contains!3428 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672988 () Bool)

(declare-fun res!439548 () Bool)

(assert (=> b!672988 (=> (not res!439548) (not e!384370))))

(assert (=> b!672988 (= res!439548 (noDuplicate!675 acc!681))))

(declare-fun b!672989 () Bool)

(declare-fun res!439570 () Bool)

(assert (=> b!672989 (=> (not res!439570) (not e!384372))))

(assert (=> b!672989 (= res!439570 e!384367)))

(declare-fun res!439566 () Bool)

(assert (=> b!672989 (=> res!439566 e!384367)))

(assert (=> b!672989 (= res!439566 e!384362)))

(declare-fun res!439554 () Bool)

(assert (=> b!672989 (=> (not res!439554) (not e!384362))))

(assert (=> b!672989 (= res!439554 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60188 res!439563) b!672988))

(assert (= (and b!672988 res!439548) b!672981))

(assert (= (and b!672981 res!439555) b!672987))

(assert (= (and b!672987 res!439552) b!672973))

(assert (= (and b!672973 res!439567) b!672974))

(assert (= (and b!672973 (not res!439569)) b!672967))

(assert (= (and b!672967 res!439568) b!672975))

(assert (= (and b!672973 res!439556) b!672966))

(assert (= (and b!672966 res!439565) b!672978))

(assert (= (and b!672978 res!439571) b!672968))

(assert (= (and b!672968 res!439558) b!672986))

(assert (= (and b!672986 res!439549) b!672964))

(assert (= (and b!672964 res!439557) b!672972))

(assert (= (and b!672972 res!439559) b!672965))

(assert (= (and b!672965 res!439550) b!672984))

(assert (= (and b!672984 c!77075) b!672969))

(assert (= (and b!672984 (not c!77075)) b!672970))

(assert (= (and b!672984 res!439551) b!672977))

(assert (= (and b!672977 res!439561) b!672985))

(assert (= (and b!672985 res!439553) b!672979))

(assert (= (and b!672979 res!439560) b!672983))

(assert (= (and b!672983 res!439564) b!672989))

(assert (= (and b!672989 res!439554) b!672971))

(assert (= (and b!672989 (not res!439566)) b!672982))

(assert (= (and b!672982 res!439562) b!672980))

(assert (= (and b!672989 res!439570) b!672976))

(declare-fun m!641657 () Bool)

(assert (=> b!672981 m!641657))

(declare-fun m!641659 () Bool)

(assert (=> b!672971 m!641659))

(assert (=> b!672980 m!641659))

(declare-fun m!641661 () Bool)

(assert (=> b!672983 m!641661))

(declare-fun m!641663 () Bool)

(assert (=> start!60188 m!641663))

(declare-fun m!641665 () Bool)

(assert (=> b!672979 m!641665))

(declare-fun m!641667 () Bool)

(assert (=> b!672965 m!641667))

(assert (=> b!672965 m!641667))

(declare-fun m!641669 () Bool)

(assert (=> b!672965 m!641669))

(declare-fun m!641671 () Bool)

(assert (=> b!672966 m!641671))

(declare-fun m!641673 () Bool)

(assert (=> b!672976 m!641673))

(declare-fun m!641675 () Bool)

(assert (=> b!672988 m!641675))

(assert (=> b!672977 m!641667))

(assert (=> b!672977 m!641667))

(declare-fun m!641677 () Bool)

(assert (=> b!672977 m!641677))

(assert (=> b!672984 m!641667))

(declare-fun m!641679 () Bool)

(assert (=> b!672986 m!641679))

(declare-fun m!641681 () Bool)

(assert (=> b!672985 m!641681))

(declare-fun m!641683 () Bool)

(assert (=> b!672975 m!641683))

(assert (=> b!672974 m!641683))

(declare-fun m!641685 () Bool)

(assert (=> b!672978 m!641685))

(declare-fun m!641687 () Bool)

(assert (=> b!672987 m!641687))

(declare-fun m!641689 () Bool)

(assert (=> b!672969 m!641689))

(declare-fun m!641691 () Bool)

(assert (=> b!672969 m!641691))

(declare-fun m!641693 () Bool)

(assert (=> b!672964 m!641693))

(push 1)

