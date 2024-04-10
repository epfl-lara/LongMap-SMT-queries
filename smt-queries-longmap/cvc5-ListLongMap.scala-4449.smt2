; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61796 () Bool)

(assert start!61796)

(declare-fun b!691936 () Bool)

(declare-fun res!456254 () Bool)

(declare-fun e!393690 () Bool)

(assert (=> b!691936 (=> (not res!456254) (not e!393690))))

(declare-datatypes ((List!13118 0))(
  ( (Nil!13115) (Cons!13114 (h!14159 (_ BitVec 64)) (t!19385 List!13118)) )
))
(declare-fun acc!681 () List!13118)

(declare-fun noDuplicate!942 (List!13118) Bool)

(assert (=> b!691936 (= res!456254 (noDuplicate!942 acc!681))))

(declare-fun b!691937 () Bool)

(declare-fun e!393685 () Bool)

(declare-fun e!393687 () Bool)

(assert (=> b!691937 (= e!393685 e!393687)))

(declare-fun res!456249 () Bool)

(assert (=> b!691937 (=> (not res!456249) (not e!393687))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691937 (= res!456249 (bvsle from!3004 i!1382))))

(declare-fun b!691938 () Bool)

(assert (=> b!691938 (= e!393690 false)))

(declare-datatypes ((Unit!24426 0))(
  ( (Unit!24427) )
))
(declare-fun lt!316525 () Unit!24426)

(declare-fun e!393688 () Unit!24426)

(assert (=> b!691938 (= lt!316525 e!393688)))

(declare-fun c!78215 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39817 0))(
  ( (array!39818 (arr!19077 (Array (_ BitVec 32) (_ BitVec 64))) (size!19462 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39817)

(assert (=> b!691938 (= c!78215 (= (select (arr!19077 a!3626) from!3004) k!2843))))

(declare-fun b!691939 () Bool)

(declare-fun contains!3695 (List!13118 (_ BitVec 64)) Bool)

(assert (=> b!691939 (= e!393687 (not (contains!3695 acc!681 k!2843)))))

(declare-fun b!691940 () Bool)

(declare-fun res!456251 () Bool)

(assert (=> b!691940 (=> (not res!456251) (not e!393690))))

(assert (=> b!691940 (= res!456251 (not (contains!3695 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691941 () Bool)

(declare-fun Unit!24428 () Unit!24426)

(assert (=> b!691941 (= e!393688 Unit!24428)))

(declare-fun b!691942 () Bool)

(declare-fun res!456242 () Bool)

(assert (=> b!691942 (=> (not res!456242) (not e!393690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691942 (= res!456242 (validKeyInArray!0 k!2843))))

(declare-fun b!691943 () Bool)

(declare-fun res!456247 () Bool)

(assert (=> b!691943 (=> (not res!456247) (not e!393690))))

(declare-fun arrayContainsKey!0 (array!39817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691943 (= res!456247 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691944 () Bool)

(declare-fun e!393689 () Bool)

(assert (=> b!691944 (= e!393689 (contains!3695 acc!681 k!2843))))

(declare-fun b!691945 () Bool)

(declare-fun res!456240 () Bool)

(assert (=> b!691945 (=> (not res!456240) (not e!393690))))

(assert (=> b!691945 (= res!456240 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19462 a!3626))))))

(declare-fun b!691946 () Bool)

(declare-fun res!456244 () Bool)

(assert (=> b!691946 (=> (not res!456244) (not e!393690))))

(declare-fun arrayNoDuplicates!0 (array!39817 (_ BitVec 32) List!13118) Bool)

(assert (=> b!691946 (= res!456244 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691947 () Bool)

(declare-fun res!456243 () Bool)

(assert (=> b!691947 (=> (not res!456243) (not e!393690))))

(assert (=> b!691947 (= res!456243 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13115))))

(declare-fun b!691949 () Bool)

(declare-fun res!456253 () Bool)

(assert (=> b!691949 (=> (not res!456253) (not e!393690))))

(assert (=> b!691949 (= res!456253 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19462 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691950 () Bool)

(declare-fun res!456245 () Bool)

(assert (=> b!691950 (=> (not res!456245) (not e!393690))))

(assert (=> b!691950 (= res!456245 e!393685)))

(declare-fun res!456252 () Bool)

(assert (=> b!691950 (=> res!456252 e!393685)))

(assert (=> b!691950 (= res!456252 e!393689)))

(declare-fun res!456241 () Bool)

(assert (=> b!691950 (=> (not res!456241) (not e!393689))))

(assert (=> b!691950 (= res!456241 (bvsgt from!3004 i!1382))))

(declare-fun b!691951 () Bool)

(declare-fun res!456250 () Bool)

(assert (=> b!691951 (=> (not res!456250) (not e!393690))))

(assert (=> b!691951 (= res!456250 (not (contains!3695 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691952 () Bool)

(declare-fun Unit!24429 () Unit!24426)

(assert (=> b!691952 (= e!393688 Unit!24429)))

(assert (=> b!691952 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316524 () Unit!24426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39817 (_ BitVec 64) (_ BitVec 32)) Unit!24426)

(assert (=> b!691952 (= lt!316524 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691952 false))

(declare-fun b!691948 () Bool)

(declare-fun res!456248 () Bool)

(assert (=> b!691948 (=> (not res!456248) (not e!393690))))

(assert (=> b!691948 (= res!456248 (validKeyInArray!0 (select (arr!19077 a!3626) from!3004)))))

(declare-fun res!456246 () Bool)

(assert (=> start!61796 (=> (not res!456246) (not e!393690))))

(assert (=> start!61796 (= res!456246 (and (bvslt (size!19462 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19462 a!3626))))))

(assert (=> start!61796 e!393690))

(assert (=> start!61796 true))

(declare-fun array_inv!14873 (array!39817) Bool)

(assert (=> start!61796 (array_inv!14873 a!3626)))

(assert (= (and start!61796 res!456246) b!691936))

(assert (= (and b!691936 res!456254) b!691940))

(assert (= (and b!691940 res!456251) b!691951))

(assert (= (and b!691951 res!456250) b!691950))

(assert (= (and b!691950 res!456241) b!691944))

(assert (= (and b!691950 (not res!456252)) b!691937))

(assert (= (and b!691937 res!456249) b!691939))

(assert (= (and b!691950 res!456245) b!691947))

(assert (= (and b!691947 res!456243) b!691946))

(assert (= (and b!691946 res!456244) b!691945))

(assert (= (and b!691945 res!456240) b!691942))

(assert (= (and b!691942 res!456242) b!691943))

(assert (= (and b!691943 res!456247) b!691949))

(assert (= (and b!691949 res!456253) b!691948))

(assert (= (and b!691948 res!456248) b!691938))

(assert (= (and b!691938 c!78215) b!691952))

(assert (= (and b!691938 (not c!78215)) b!691941))

(declare-fun m!654719 () Bool)

(assert (=> b!691952 m!654719))

(declare-fun m!654721 () Bool)

(assert (=> b!691952 m!654721))

(declare-fun m!654723 () Bool)

(assert (=> b!691936 m!654723))

(declare-fun m!654725 () Bool)

(assert (=> b!691943 m!654725))

(declare-fun m!654727 () Bool)

(assert (=> b!691938 m!654727))

(declare-fun m!654729 () Bool)

(assert (=> b!691942 m!654729))

(declare-fun m!654731 () Bool)

(assert (=> start!61796 m!654731))

(declare-fun m!654733 () Bool)

(assert (=> b!691939 m!654733))

(declare-fun m!654735 () Bool)

(assert (=> b!691947 m!654735))

(assert (=> b!691944 m!654733))

(declare-fun m!654737 () Bool)

(assert (=> b!691946 m!654737))

(declare-fun m!654739 () Bool)

(assert (=> b!691951 m!654739))

(declare-fun m!654741 () Bool)

(assert (=> b!691940 m!654741))

(assert (=> b!691948 m!654727))

(assert (=> b!691948 m!654727))

(declare-fun m!654743 () Bool)

(assert (=> b!691948 m!654743))

(push 1)

(assert (not b!691952))

(assert (not b!691948))

(assert (not b!691943))

(assert (not b!691936))

(assert (not start!61796))

(assert (not b!691940))

(assert (not b!691939))

(assert (not b!691947))

(assert (not b!691942))

(assert (not b!691944))

(assert (not b!691951))

(assert (not b!691946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

