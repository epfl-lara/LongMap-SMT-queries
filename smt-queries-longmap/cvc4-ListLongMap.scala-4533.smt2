; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62786 () Bool)

(assert start!62786)

(declare-fun b!708471 () Bool)

(declare-fun res!472138 () Bool)

(declare-fun e!398679 () Bool)

(assert (=> b!708471 (=> (not res!472138) (not e!398679))))

(declare-datatypes ((List!13372 0))(
  ( (Nil!13369) (Cons!13368 (h!14413 (_ BitVec 64)) (t!19660 List!13372)) )
))
(declare-fun acc!652 () List!13372)

(declare-fun contains!3949 (List!13372 (_ BitVec 64)) Bool)

(assert (=> b!708471 (= res!472138 (not (contains!3949 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!472133 () Bool)

(assert (=> start!62786 (=> (not res!472133) (not e!398679))))

(declare-datatypes ((array!40355 0))(
  ( (array!40356 (arr!19331 (Array (_ BitVec 32) (_ BitVec 64))) (size!19721 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40355)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62786 (= res!472133 (and (bvslt (size!19721 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19721 a!3591))))))

(assert (=> start!62786 e!398679))

(assert (=> start!62786 true))

(declare-fun array_inv!15127 (array!40355) Bool)

(assert (=> start!62786 (array_inv!15127 a!3591)))

(declare-fun b!708472 () Bool)

(declare-fun res!472136 () Bool)

(declare-fun e!398681 () Bool)

(assert (=> b!708472 (=> (not res!472136) (not e!398681))))

(declare-fun newAcc!49 () List!13372)

(declare-fun noDuplicate!1196 (List!13372) Bool)

(declare-fun $colon$colon!505 (List!13372 (_ BitVec 64)) List!13372)

(assert (=> b!708472 (= res!472136 (noDuplicate!1196 ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969))))))

(declare-fun b!708473 () Bool)

(declare-fun res!472134 () Bool)

(assert (=> b!708473 (=> (not res!472134) (not e!398679))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!359 (List!13372 (_ BitVec 64)) List!13372)

(assert (=> b!708473 (= res!472134 (= (-!359 newAcc!49 k!2824) acc!652))))

(declare-fun b!708474 () Bool)

(declare-fun res!472129 () Bool)

(assert (=> b!708474 (=> (not res!472129) (not e!398679))))

(assert (=> b!708474 (= res!472129 (noDuplicate!1196 acc!652))))

(declare-fun b!708475 () Bool)

(declare-fun e!398678 () Bool)

(declare-fun lt!318110 () List!13372)

(assert (=> b!708475 (= e!398678 (contains!3949 lt!318110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708476 () Bool)

(declare-fun res!472126 () Bool)

(assert (=> b!708476 (=> (not res!472126) (not e!398679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708476 (= res!472126 (validKeyInArray!0 k!2824))))

(declare-fun b!708477 () Bool)

(declare-fun res!472128 () Bool)

(assert (=> b!708477 (=> (not res!472128) (not e!398679))))

(assert (=> b!708477 (= res!472128 (validKeyInArray!0 (select (arr!19331 a!3591) from!2969)))))

(declare-fun b!708478 () Bool)

(declare-fun res!472135 () Bool)

(assert (=> b!708478 (=> (not res!472135) (not e!398679))))

(assert (=> b!708478 (= res!472135 (contains!3949 newAcc!49 k!2824))))

(declare-fun b!708479 () Bool)

(assert (=> b!708479 (= e!398679 e!398681)))

(declare-fun res!472143 () Bool)

(assert (=> b!708479 (=> (not res!472143) (not e!398681))))

(assert (=> b!708479 (= res!472143 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708479 (= lt!318110 ($colon$colon!505 acc!652 (select (arr!19331 a!3591) from!2969)))))

(declare-fun b!708480 () Bool)

(declare-fun res!472140 () Bool)

(assert (=> b!708480 (=> (not res!472140) (not e!398679))))

(declare-fun arrayContainsKey!0 (array!40355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708480 (= res!472140 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!708481 () Bool)

(declare-fun res!472139 () Bool)

(assert (=> b!708481 (=> (not res!472139) (not e!398679))))

(declare-fun subseq!394 (List!13372 List!13372) Bool)

(assert (=> b!708481 (= res!472139 (subseq!394 acc!652 newAcc!49))))

(declare-fun b!708482 () Bool)

(declare-fun res!472132 () Bool)

(assert (=> b!708482 (=> (not res!472132) (not e!398679))))

(assert (=> b!708482 (= res!472132 (not (contains!3949 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708483 () Bool)

(declare-fun res!472137 () Bool)

(assert (=> b!708483 (=> (not res!472137) (not e!398681))))

(assert (=> b!708483 (= res!472137 (noDuplicate!1196 lt!318110))))

(declare-fun b!708484 () Bool)

(declare-fun res!472130 () Bool)

(assert (=> b!708484 (=> (not res!472130) (not e!398679))))

(assert (=> b!708484 (= res!472130 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19721 a!3591)))))

(declare-fun b!708485 () Bool)

(declare-fun res!472125 () Bool)

(assert (=> b!708485 (=> (not res!472125) (not e!398679))))

(assert (=> b!708485 (= res!472125 (not (contains!3949 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708486 () Bool)

(declare-fun res!472144 () Bool)

(assert (=> b!708486 (=> (not res!472144) (not e!398679))))

(assert (=> b!708486 (= res!472144 (not (contains!3949 acc!652 k!2824)))))

(declare-fun b!708487 () Bool)

(assert (=> b!708487 (= e!398681 e!398678)))

(declare-fun res!472142 () Bool)

(assert (=> b!708487 (=> res!472142 e!398678)))

(assert (=> b!708487 (= res!472142 (contains!3949 lt!318110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708488 () Bool)

(declare-fun res!472131 () Bool)

(assert (=> b!708488 (=> (not res!472131) (not e!398679))))

(assert (=> b!708488 (= res!472131 (not (contains!3949 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708489 () Bool)

(declare-fun res!472141 () Bool)

(assert (=> b!708489 (=> (not res!472141) (not e!398679))))

(declare-fun arrayNoDuplicates!0 (array!40355 (_ BitVec 32) List!13372) Bool)

(assert (=> b!708489 (= res!472141 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708490 () Bool)

(declare-fun res!472127 () Bool)

(assert (=> b!708490 (=> (not res!472127) (not e!398679))))

(assert (=> b!708490 (= res!472127 (noDuplicate!1196 newAcc!49))))

(assert (= (and start!62786 res!472133) b!708474))

(assert (= (and b!708474 res!472129) b!708490))

(assert (= (and b!708490 res!472127) b!708471))

(assert (= (and b!708471 res!472138) b!708485))

(assert (= (and b!708485 res!472125) b!708480))

(assert (= (and b!708480 res!472140) b!708486))

(assert (= (and b!708486 res!472144) b!708476))

(assert (= (and b!708476 res!472126) b!708489))

(assert (= (and b!708489 res!472141) b!708481))

(assert (= (and b!708481 res!472139) b!708478))

(assert (= (and b!708478 res!472135) b!708473))

(assert (= (and b!708473 res!472134) b!708488))

(assert (= (and b!708488 res!472131) b!708482))

(assert (= (and b!708482 res!472132) b!708484))

(assert (= (and b!708484 res!472130) b!708477))

(assert (= (and b!708477 res!472128) b!708479))

(assert (= (and b!708479 res!472143) b!708483))

(assert (= (and b!708483 res!472137) b!708472))

(assert (= (and b!708472 res!472136) b!708487))

(assert (= (and b!708487 (not res!472142)) b!708475))

(declare-fun m!665903 () Bool)

(assert (=> b!708482 m!665903))

(declare-fun m!665905 () Bool)

(assert (=> b!708477 m!665905))

(assert (=> b!708477 m!665905))

(declare-fun m!665907 () Bool)

(assert (=> b!708477 m!665907))

(declare-fun m!665909 () Bool)

(assert (=> b!708483 m!665909))

(declare-fun m!665911 () Bool)

(assert (=> b!708471 m!665911))

(assert (=> b!708479 m!665905))

(assert (=> b!708479 m!665905))

(declare-fun m!665913 () Bool)

(assert (=> b!708479 m!665913))

(declare-fun m!665915 () Bool)

(assert (=> b!708476 m!665915))

(declare-fun m!665917 () Bool)

(assert (=> b!708480 m!665917))

(declare-fun m!665919 () Bool)

(assert (=> b!708481 m!665919))

(declare-fun m!665921 () Bool)

(assert (=> b!708478 m!665921))

(declare-fun m!665923 () Bool)

(assert (=> b!708490 m!665923))

(declare-fun m!665925 () Bool)

(assert (=> b!708475 m!665925))

(declare-fun m!665927 () Bool)

(assert (=> b!708485 m!665927))

(declare-fun m!665929 () Bool)

(assert (=> start!62786 m!665929))

(declare-fun m!665931 () Bool)

(assert (=> b!708474 m!665931))

(declare-fun m!665933 () Bool)

(assert (=> b!708473 m!665933))

(declare-fun m!665935 () Bool)

(assert (=> b!708487 m!665935))

(assert (=> b!708472 m!665905))

(assert (=> b!708472 m!665905))

(declare-fun m!665937 () Bool)

(assert (=> b!708472 m!665937))

(assert (=> b!708472 m!665937))

(declare-fun m!665939 () Bool)

(assert (=> b!708472 m!665939))

(declare-fun m!665941 () Bool)

(assert (=> b!708488 m!665941))

(declare-fun m!665943 () Bool)

(assert (=> b!708489 m!665943))

(declare-fun m!665945 () Bool)

(assert (=> b!708486 m!665945))

(push 1)

(assert (not b!708474))

(assert (not b!708489))

(assert (not b!708477))

(assert (not b!708478))

(assert (not b!708479))

(assert (not b!708471))

(assert (not b!708487))

(assert (not b!708480))

(assert (not b!708482))

(assert (not b!708490))

(assert (not b!708485))

(assert (not b!708483))

(assert (not b!708486))

(assert (not b!708476))

(assert (not b!708488))

(assert (not start!62786))

(assert (not b!708473))

(assert (not b!708481))

(assert (not b!708475))

(assert (not b!708472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96851 () Bool)

(declare-fun res!472202 () Bool)

(declare-fun e!398747 () Bool)

(assert (=> d!96851 (=> res!472202 e!398747)))

(assert (=> d!96851 (= res!472202 (is-Nil!13369 newAcc!49))))

(assert (=> d!96851 (= (noDuplicate!1196 newAcc!49) e!398747)))

(declare-fun b!708562 () Bool)

(declare-fun e!398748 () Bool)

(assert (=> b!708562 (= e!398747 e!398748)))

(declare-fun res!472203 () Bool)

(assert (=> b!708562 (=> (not res!472203) (not e!398748))))

(assert (=> b!708562 (= res!472203 (not (contains!3949 (t!19660 newAcc!49) (h!14413 newAcc!49))))))

(declare-fun b!708563 () Bool)

(assert (=> b!708563 (= e!398748 (noDuplicate!1196 (t!19660 newAcc!49)))))

(assert (= (and d!96851 (not res!472202)) b!708562))

(assert (= (and b!708562 res!472203) b!708563))

(declare-fun m!665995 () Bool)

(assert (=> b!708562 m!665995))

(declare-fun m!665997 () Bool)

(assert (=> b!708563 m!665997))

(assert (=> b!708490 d!96851))

(declare-fun d!96855 () Bool)

(assert (=> d!96855 (= ($colon$colon!505 acc!652 (select (arr!19331 a!3591) from!2969)) (Cons!13368 (select (arr!19331 a!3591) from!2969) acc!652))))

(assert (=> b!708479 d!96855))

(declare-fun b!708595 () Bool)

(declare-fun e!398777 () Bool)

(declare-fun e!398779 () Bool)

(assert (=> b!708595 (= e!398777 e!398779)))

(declare-fun res!472228 () Bool)

(assert (=> b!708595 (=> (not res!472228) (not e!398779))))

(assert (=> b!708595 (= res!472228 (is-Cons!13368 newAcc!49))))

(declare-fun b!708597 () Bool)

(declare-fun e!398778 () Bool)

(assert (=> b!708597 (= e!398778 (subseq!394 (t!19660 acc!652) (t!19660 newAcc!49)))))

(declare-fun b!708596 () Bool)

(declare-fun e!398776 () Bool)

(assert (=> b!708596 (= e!398779 e!398776)))

(declare-fun res!472230 () Bool)

(assert (=> b!708596 (=> res!472230 e!398776)))

(assert (=> b!708596 (= res!472230 e!398778)))

(declare-fun res!472229 () Bool)

(assert (=> b!708596 (=> (not res!472229) (not e!398778))))

(assert (=> b!708596 (= res!472229 (= (h!14413 acc!652) (h!14413 newAcc!49)))))

(declare-fun b!708598 () Bool)

(assert (=> b!708598 (= e!398776 (subseq!394 acc!652 (t!19660 newAcc!49)))))

(declare-fun d!96861 () Bool)

(declare-fun res!472227 () Bool)

(assert (=> d!96861 (=> res!472227 e!398777)))

(assert (=> d!96861 (= res!472227 (is-Nil!13369 acc!652))))

(assert (=> d!96861 (= (subseq!394 acc!652 newAcc!49) e!398777)))

(assert (= (and d!96861 (not res!472227)) b!708595))

(assert (= (and b!708595 res!472228) b!708596))

(assert (= (and b!708596 res!472229) b!708597))

(assert (= (and b!708596 (not res!472230)) b!708598))

(declare-fun m!666025 () Bool)

(assert (=> b!708597 m!666025))

(declare-fun m!666027 () Bool)

(assert (=> b!708598 m!666027))

(assert (=> b!708481 d!96861))

(declare-fun d!96869 () Bool)

(declare-fun res!472238 () Bool)

(declare-fun e!398788 () Bool)

(assert (=> d!96869 (=> res!472238 e!398788)))

(assert (=> d!96869 (= res!472238 (= (select (arr!19331 a!3591) from!2969) k!2824))))

(assert (=> d!96869 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!398788)))

(declare-fun b!708608 () Bool)

(declare-fun e!398789 () Bool)

(assert (=> b!708608 (= e!398788 e!398789)))

(declare-fun res!472239 () Bool)

(assert (=> b!708608 (=> (not res!472239) (not e!398789))))

