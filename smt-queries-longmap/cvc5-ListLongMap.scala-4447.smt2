; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61784 () Bool)

(assert start!61784)

(declare-fun b!691630 () Bool)

(declare-fun res!455970 () Bool)

(declare-fun e!393578 () Bool)

(assert (=> b!691630 (=> (not res!455970) (not e!393578))))

(declare-datatypes ((array!39805 0))(
  ( (array!39806 (arr!19071 (Array (_ BitVec 32) (_ BitVec 64))) (size!19456 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39805)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691630 (= res!455970 (validKeyInArray!0 (select (arr!19071 a!3626) from!3004)))))

(declare-fun b!691631 () Bool)

(declare-fun res!455980 () Bool)

(assert (=> b!691631 (=> (not res!455980) (not e!393578))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691631 (= res!455980 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691632 () Bool)

(declare-fun e!393577 () Bool)

(declare-datatypes ((List!13112 0))(
  ( (Nil!13109) (Cons!13108 (h!14153 (_ BitVec 64)) (t!19379 List!13112)) )
))
(declare-fun acc!681 () List!13112)

(declare-fun contains!3689 (List!13112 (_ BitVec 64)) Bool)

(assert (=> b!691632 (= e!393577 (contains!3689 acc!681 k!2843))))

(declare-fun b!691633 () Bool)

(declare-fun res!455975 () Bool)

(assert (=> b!691633 (=> (not res!455975) (not e!393578))))

(declare-fun arrayNoDuplicates!0 (array!39805 (_ BitVec 32) List!13112) Bool)

(assert (=> b!691633 (= res!455975 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691634 () Bool)

(declare-datatypes ((Unit!24402 0))(
  ( (Unit!24403) )
))
(declare-fun e!393579 () Unit!24402)

(declare-fun Unit!24404 () Unit!24402)

(assert (=> b!691634 (= e!393579 Unit!24404)))

(declare-fun b!691635 () Bool)

(declare-fun Unit!24405 () Unit!24402)

(assert (=> b!691635 (= e!393579 Unit!24405)))

(assert (=> b!691635 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316488 () Unit!24402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39805 (_ BitVec 64) (_ BitVec 32)) Unit!24402)

(assert (=> b!691635 (= lt!316488 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691635 false))

(declare-fun b!691636 () Bool)

(declare-fun res!455981 () Bool)

(assert (=> b!691636 (=> (not res!455981) (not e!393578))))

(assert (=> b!691636 (= res!455981 (not (contains!3689 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691637 () Bool)

(declare-fun res!455978 () Bool)

(assert (=> b!691637 (=> (not res!455978) (not e!393578))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691637 (= res!455978 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19456 a!3626))))))

(declare-fun b!691638 () Bool)

(declare-fun res!455984 () Bool)

(assert (=> b!691638 (=> (not res!455984) (not e!393578))))

(assert (=> b!691638 (= res!455984 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19456 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691639 () Bool)

(declare-fun e!393581 () Bool)

(declare-fun e!393582 () Bool)

(assert (=> b!691639 (= e!393581 e!393582)))

(declare-fun res!455976 () Bool)

(assert (=> b!691639 (=> (not res!455976) (not e!393582))))

(assert (=> b!691639 (= res!455976 (bvsle from!3004 i!1382))))

(declare-fun res!455974 () Bool)

(assert (=> start!61784 (=> (not res!455974) (not e!393578))))

(assert (=> start!61784 (= res!455974 (and (bvslt (size!19456 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19456 a!3626))))))

(assert (=> start!61784 e!393578))

(assert (=> start!61784 true))

(declare-fun array_inv!14867 (array!39805) Bool)

(assert (=> start!61784 (array_inv!14867 a!3626)))

(declare-fun b!691640 () Bool)

(assert (=> b!691640 (= e!393582 (not (contains!3689 acc!681 k!2843)))))

(declare-fun b!691641 () Bool)

(assert (=> b!691641 (= e!393578 false)))

(declare-fun lt!316489 () Unit!24402)

(assert (=> b!691641 (= lt!316489 e!393579)))

(declare-fun c!78197 () Bool)

(assert (=> b!691641 (= c!78197 (= (select (arr!19071 a!3626) from!3004) k!2843))))

(declare-fun b!691642 () Bool)

(declare-fun res!455971 () Bool)

(assert (=> b!691642 (=> (not res!455971) (not e!393578))))

(assert (=> b!691642 (= res!455971 (validKeyInArray!0 k!2843))))

(declare-fun b!691643 () Bool)

(declare-fun res!455982 () Bool)

(assert (=> b!691643 (=> (not res!455982) (not e!393578))))

(assert (=> b!691643 (= res!455982 (not (contains!3689 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691644 () Bool)

(declare-fun res!455979 () Bool)

(assert (=> b!691644 (=> (not res!455979) (not e!393578))))

(declare-fun noDuplicate!936 (List!13112) Bool)

(assert (=> b!691644 (= res!455979 (noDuplicate!936 acc!681))))

(declare-fun b!691645 () Bool)

(declare-fun res!455973 () Bool)

(assert (=> b!691645 (=> (not res!455973) (not e!393578))))

(assert (=> b!691645 (= res!455973 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13109))))

(declare-fun b!691646 () Bool)

(declare-fun res!455972 () Bool)

(assert (=> b!691646 (=> (not res!455972) (not e!393578))))

(assert (=> b!691646 (= res!455972 e!393581)))

(declare-fun res!455977 () Bool)

(assert (=> b!691646 (=> res!455977 e!393581)))

(assert (=> b!691646 (= res!455977 e!393577)))

(declare-fun res!455983 () Bool)

(assert (=> b!691646 (=> (not res!455983) (not e!393577))))

(assert (=> b!691646 (= res!455983 (bvsgt from!3004 i!1382))))

(assert (= (and start!61784 res!455974) b!691644))

(assert (= (and b!691644 res!455979) b!691636))

(assert (= (and b!691636 res!455981) b!691643))

(assert (= (and b!691643 res!455982) b!691646))

(assert (= (and b!691646 res!455983) b!691632))

(assert (= (and b!691646 (not res!455977)) b!691639))

(assert (= (and b!691639 res!455976) b!691640))

(assert (= (and b!691646 res!455972) b!691645))

(assert (= (and b!691645 res!455973) b!691633))

(assert (= (and b!691633 res!455975) b!691637))

(assert (= (and b!691637 res!455978) b!691642))

(assert (= (and b!691642 res!455971) b!691631))

(assert (= (and b!691631 res!455980) b!691638))

(assert (= (and b!691638 res!455984) b!691630))

(assert (= (and b!691630 res!455970) b!691641))

(assert (= (and b!691641 c!78197) b!691635))

(assert (= (and b!691641 (not c!78197)) b!691634))

(declare-fun m!654563 () Bool)

(assert (=> b!691633 m!654563))

(declare-fun m!654565 () Bool)

(assert (=> b!691631 m!654565))

(declare-fun m!654567 () Bool)

(assert (=> b!691641 m!654567))

(declare-fun m!654569 () Bool)

(assert (=> b!691640 m!654569))

(declare-fun m!654571 () Bool)

(assert (=> b!691642 m!654571))

(declare-fun m!654573 () Bool)

(assert (=> b!691645 m!654573))

(declare-fun m!654575 () Bool)

(assert (=> start!61784 m!654575))

(declare-fun m!654577 () Bool)

(assert (=> b!691643 m!654577))

(declare-fun m!654579 () Bool)

(assert (=> b!691635 m!654579))

(declare-fun m!654581 () Bool)

(assert (=> b!691635 m!654581))

(declare-fun m!654583 () Bool)

(assert (=> b!691644 m!654583))

(assert (=> b!691632 m!654569))

(assert (=> b!691630 m!654567))

(assert (=> b!691630 m!654567))

(declare-fun m!654585 () Bool)

(assert (=> b!691630 m!654585))

(declare-fun m!654587 () Bool)

(assert (=> b!691636 m!654587))

(push 1)

(assert (not b!691642))

(assert (not b!691644))

(assert (not b!691632))

(assert (not b!691631))

(assert (not b!691640))

(assert (not b!691643))

(assert (not b!691645))

(assert (not start!61784))

(assert (not b!691633))

(assert (not b!691636))

(assert (not b!691635))

(assert (not b!691630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

