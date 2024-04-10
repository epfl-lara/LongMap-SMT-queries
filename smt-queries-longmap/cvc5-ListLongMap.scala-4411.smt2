; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60878 () Bool)

(assert start!60878)

(declare-fun b!682893 () Bool)

(declare-datatypes ((Unit!23982 0))(
  ( (Unit!23983) )
))
(declare-fun e!389047 () Unit!23982)

(declare-fun Unit!23984 () Unit!23982)

(assert (=> b!682893 (= e!389047 Unit!23984)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!313696 () Unit!23982)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39562 0))(
  ( (array!39563 (arr!18963 (Array (_ BitVec 32) (_ BitVec 64))) (size!19327 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39562 (_ BitVec 64) (_ BitVec 32)) Unit!23982)

(assert (=> b!682893 (= lt!313696 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682893 false))

(declare-fun b!682894 () Bool)

(declare-fun res!448799 () Bool)

(declare-fun e!389043 () Bool)

(assert (=> b!682894 (=> (not res!448799) (not e!389043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682894 (= res!448799 (validKeyInArray!0 k!2843))))

(declare-fun b!682895 () Bool)

(assert (=> b!682895 (= e!389043 (not true))))

(declare-datatypes ((List!13004 0))(
  ( (Nil!13001) (Cons!13000 (h!14045 (_ BitVec 64)) (t!19247 List!13004)) )
))
(declare-fun acc!681 () List!13004)

(declare-fun -!132 (List!13004 (_ BitVec 64)) List!13004)

(declare-fun $colon$colon!332 (List!13004 (_ BitVec 64)) List!13004)

(assert (=> b!682895 (= (-!132 ($colon$colon!332 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313693 () Unit!23982)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13004) Unit!23982)

(assert (=> b!682895 (= lt!313693 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!167 (List!13004 List!13004) Bool)

(assert (=> b!682895 (subseq!167 acc!681 acc!681)))

(declare-fun lt!313695 () Unit!23982)

(declare-fun lemmaListSubSeqRefl!0 (List!13004) Unit!23982)

(assert (=> b!682895 (= lt!313695 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39562 (_ BitVec 32) List!13004) Bool)

(assert (=> b!682895 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313690 () Unit!23982)

(declare-fun e!389044 () Unit!23982)

(assert (=> b!682895 (= lt!313690 e!389044)))

(declare-fun c!77419 () Bool)

(assert (=> b!682895 (= c!77419 (validKeyInArray!0 (select (arr!18963 a!3626) from!3004)))))

(declare-fun lt!313692 () Unit!23982)

(assert (=> b!682895 (= lt!313692 e!389047)))

(declare-fun c!77420 () Bool)

(declare-fun arrayContainsKey!0 (array!39562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682895 (= c!77420 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682895 (arrayContainsKey!0 (array!39563 (store (arr!18963 a!3626) i!1382 k!2843) (size!19327 a!3626)) k!2843 from!3004)))

(declare-fun b!682896 () Bool)

(declare-fun res!448796 () Bool)

(assert (=> b!682896 (=> (not res!448796) (not e!389043))))

(assert (=> b!682896 (= res!448796 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19327 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682897 () Bool)

(declare-fun res!448801 () Bool)

(assert (=> b!682897 (=> (not res!448801) (not e!389043))))

(assert (=> b!682897 (= res!448801 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13001))))

(declare-fun b!682898 () Bool)

(declare-fun res!448795 () Bool)

(assert (=> b!682898 (=> (not res!448795) (not e!389043))))

(assert (=> b!682898 (= res!448795 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682899 () Bool)

(declare-fun Unit!23985 () Unit!23982)

(assert (=> b!682899 (= e!389047 Unit!23985)))

(declare-fun b!682900 () Bool)

(declare-fun e!389045 () Bool)

(declare-fun contains!3581 (List!13004 (_ BitVec 64)) Bool)

(assert (=> b!682900 (= e!389045 (not (contains!3581 acc!681 k!2843)))))

(declare-fun b!682901 () Bool)

(declare-fun e!389049 () Bool)

(assert (=> b!682901 (= e!389049 (contains!3581 acc!681 k!2843))))

(declare-fun res!448792 () Bool)

(assert (=> start!60878 (=> (not res!448792) (not e!389043))))

(assert (=> start!60878 (= res!448792 (and (bvslt (size!19327 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19327 a!3626))))))

(assert (=> start!60878 e!389043))

(assert (=> start!60878 true))

(declare-fun array_inv!14759 (array!39562) Bool)

(assert (=> start!60878 (array_inv!14759 a!3626)))

(declare-fun b!682902 () Bool)

(declare-fun Unit!23986 () Unit!23982)

(assert (=> b!682902 (= e!389044 Unit!23986)))

(declare-fun b!682903 () Bool)

(declare-fun res!448789 () Bool)

(assert (=> b!682903 (=> (not res!448789) (not e!389043))))

(assert (=> b!682903 (= res!448789 (not (contains!3581 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682904 () Bool)

(declare-fun res!448800 () Bool)

(assert (=> b!682904 (=> (not res!448800) (not e!389043))))

(declare-fun e!389046 () Bool)

(assert (=> b!682904 (= res!448800 e!389046)))

(declare-fun res!448797 () Bool)

(assert (=> b!682904 (=> res!448797 e!389046)))

(assert (=> b!682904 (= res!448797 e!389049)))

(declare-fun res!448798 () Bool)

(assert (=> b!682904 (=> (not res!448798) (not e!389049))))

(assert (=> b!682904 (= res!448798 (bvsgt from!3004 i!1382))))

(declare-fun b!682905 () Bool)

(declare-fun res!448793 () Bool)

(assert (=> b!682905 (=> (not res!448793) (not e!389043))))

(declare-fun noDuplicate!828 (List!13004) Bool)

(assert (=> b!682905 (= res!448793 (noDuplicate!828 acc!681))))

(declare-fun b!682906 () Bool)

(declare-fun res!448802 () Bool)

(assert (=> b!682906 (=> (not res!448802) (not e!389043))))

(assert (=> b!682906 (= res!448802 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19327 a!3626))))))

(declare-fun b!682907 () Bool)

(declare-fun res!448794 () Bool)

(assert (=> b!682907 (=> (not res!448794) (not e!389043))))

(assert (=> b!682907 (= res!448794 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682908 () Bool)

(declare-fun res!448790 () Bool)

(assert (=> b!682908 (=> (not res!448790) (not e!389043))))

(assert (=> b!682908 (= res!448790 (not (contains!3581 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682909 () Bool)

(declare-fun lt!313694 () Unit!23982)

(assert (=> b!682909 (= e!389044 lt!313694)))

(declare-fun lt!313691 () Unit!23982)

(assert (=> b!682909 (= lt!313691 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682909 (subseq!167 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39562 List!13004 List!13004 (_ BitVec 32)) Unit!23982)

(assert (=> b!682909 (= lt!313694 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!332 acc!681 (select (arr!18963 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682909 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682910 () Bool)

(assert (=> b!682910 (= e!389046 e!389045)))

(declare-fun res!448791 () Bool)

(assert (=> b!682910 (=> (not res!448791) (not e!389045))))

(assert (=> b!682910 (= res!448791 (bvsle from!3004 i!1382))))

(assert (= (and start!60878 res!448792) b!682905))

(assert (= (and b!682905 res!448793) b!682908))

(assert (= (and b!682908 res!448790) b!682903))

(assert (= (and b!682903 res!448789) b!682904))

(assert (= (and b!682904 res!448798) b!682901))

(assert (= (and b!682904 (not res!448797)) b!682910))

(assert (= (and b!682910 res!448791) b!682900))

(assert (= (and b!682904 res!448800) b!682897))

(assert (= (and b!682897 res!448801) b!682898))

(assert (= (and b!682898 res!448795) b!682906))

(assert (= (and b!682906 res!448802) b!682894))

(assert (= (and b!682894 res!448799) b!682907))

(assert (= (and b!682907 res!448794) b!682896))

(assert (= (and b!682896 res!448796) b!682895))

(assert (= (and b!682895 c!77420) b!682893))

(assert (= (and b!682895 (not c!77420)) b!682899))

(assert (= (and b!682895 c!77419) b!682909))

(assert (= (and b!682895 (not c!77419)) b!682902))

(declare-fun m!647513 () Bool)

(assert (=> start!60878 m!647513))

(declare-fun m!647515 () Bool)

(assert (=> b!682898 m!647515))

(declare-fun m!647517 () Bool)

(assert (=> b!682900 m!647517))

(assert (=> b!682901 m!647517))

(declare-fun m!647519 () Bool)

(assert (=> b!682907 m!647519))

(declare-fun m!647521 () Bool)

(assert (=> b!682903 m!647521))

(declare-fun m!647523 () Bool)

(assert (=> b!682905 m!647523))

(declare-fun m!647525 () Bool)

(assert (=> b!682894 m!647525))

(declare-fun m!647527 () Bool)

(assert (=> b!682897 m!647527))

(declare-fun m!647529 () Bool)

(assert (=> b!682909 m!647529))

(declare-fun m!647531 () Bool)

(assert (=> b!682909 m!647531))

(declare-fun m!647533 () Bool)

(assert (=> b!682909 m!647533))

(declare-fun m!647535 () Bool)

(assert (=> b!682909 m!647535))

(assert (=> b!682909 m!647531))

(assert (=> b!682909 m!647533))

(declare-fun m!647537 () Bool)

(assert (=> b!682909 m!647537))

(declare-fun m!647539 () Bool)

(assert (=> b!682909 m!647539))

(declare-fun m!647541 () Bool)

(assert (=> b!682893 m!647541))

(declare-fun m!647543 () Bool)

(assert (=> b!682908 m!647543))

(declare-fun m!647545 () Bool)

(assert (=> b!682895 m!647545))

(declare-fun m!647547 () Bool)

(assert (=> b!682895 m!647547))

(assert (=> b!682895 m!647529))

(assert (=> b!682895 m!647531))

(declare-fun m!647549 () Bool)

(assert (=> b!682895 m!647549))

(declare-fun m!647551 () Bool)

(assert (=> b!682895 m!647551))

(assert (=> b!682895 m!647537))

(declare-fun m!647553 () Bool)

(assert (=> b!682895 m!647553))

(assert (=> b!682895 m!647545))

(assert (=> b!682895 m!647531))

(declare-fun m!647555 () Bool)

(assert (=> b!682895 m!647555))

(declare-fun m!647557 () Bool)

(assert (=> b!682895 m!647557))

(assert (=> b!682895 m!647539))

(push 1)

(assert (not b!682908))

(assert (not b!682897))

(assert (not b!682909))

(assert (not b!682901))

(assert (not b!682893))

(assert (not b!682907))

(assert (not b!682898))

(assert (not b!682894))

(assert (not b!682905))

(assert (not b!682895))

(assert (not start!60878))

(assert (not b!682900))

(assert (not b!682903))

(check-sat)

