; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60020 () Bool)

(assert start!60020)

(declare-fun b!667328 () Bool)

(declare-datatypes ((Unit!23355 0))(
  ( (Unit!23356) )
))
(declare-fun e!381969 () Unit!23355)

(declare-fun Unit!23357 () Unit!23355)

(assert (=> b!667328 (= e!381969 Unit!23357)))

(declare-fun b!667329 () Bool)

(declare-fun res!434573 () Bool)

(declare-fun e!381976 () Bool)

(assert (=> b!667329 (=> (not res!434573) (not e!381976))))

(declare-datatypes ((List!12767 0))(
  ( (Nil!12764) (Cons!12763 (h!13808 (_ BitVec 64)) (t!18995 List!12767)) )
))
(declare-fun acc!681 () List!12767)

(declare-fun contains!3344 (List!12767 (_ BitVec 64)) Bool)

(assert (=> b!667329 (= res!434573 (not (contains!3344 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667330 () Bool)

(declare-fun res!434572 () Bool)

(assert (=> b!667330 (=> (not res!434572) (not e!381976))))

(declare-datatypes ((array!39067 0))(
  ( (array!39068 (arr!18726 (Array (_ BitVec 32) (_ BitVec 64))) (size!19090 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39067)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39067 (_ BitVec 32) List!12767) Bool)

(assert (=> b!667330 (= res!434572 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!434563 () Bool)

(assert (=> start!60020 (=> (not res!434563) (not e!381976))))

(assert (=> start!60020 (= res!434563 (and (bvslt (size!19090 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19090 a!3626))))))

(assert (=> start!60020 e!381976))

(assert (=> start!60020 true))

(declare-fun array_inv!14522 (array!39067) Bool)

(assert (=> start!60020 (array_inv!14522 a!3626)))

(declare-fun b!667331 () Bool)

(declare-fun res!434571 () Bool)

(declare-fun e!381977 () Bool)

(assert (=> b!667331 (=> res!434571 e!381977)))

(declare-fun lt!310775 () List!12767)

(declare-fun noDuplicate!591 (List!12767) Bool)

(assert (=> b!667331 (= res!434571 (not (noDuplicate!591 lt!310775)))))

(declare-fun b!667332 () Bool)

(assert (=> b!667332 (= e!381977 true)))

(declare-fun lt!310779 () Bool)

(declare-fun e!381968 () Bool)

(assert (=> b!667332 (= lt!310779 e!381968)))

(declare-fun res!434561 () Bool)

(assert (=> b!667332 (=> res!434561 e!381968)))

(declare-fun e!381973 () Bool)

(assert (=> b!667332 (= res!434561 e!381973)))

(declare-fun res!434570 () Bool)

(assert (=> b!667332 (=> (not res!434570) (not e!381973))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667332 (= res!434570 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667333 () Bool)

(declare-fun e!381970 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!667333 (= e!381970 (not (contains!3344 lt!310775 k!2843)))))

(declare-fun b!667334 () Bool)

(declare-fun e!381971 () Unit!23355)

(declare-fun Unit!23358 () Unit!23355)

(assert (=> b!667334 (= e!381971 Unit!23358)))

(declare-fun lt!310783 () Unit!23355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39067 (_ BitVec 64) (_ BitVec 32)) Unit!23355)

(assert (=> b!667334 (= lt!310783 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667334 false))

(declare-fun b!667335 () Bool)

(declare-fun e!381978 () Bool)

(assert (=> b!667335 (= e!381978 (contains!3344 acc!681 k!2843))))

(declare-fun b!667336 () Bool)

(declare-fun res!434560 () Bool)

(assert (=> b!667336 (=> (not res!434560) (not e!381976))))

(assert (=> b!667336 (= res!434560 (noDuplicate!591 acc!681))))

(declare-fun b!667337 () Bool)

(declare-fun res!434574 () Bool)

(assert (=> b!667337 (=> (not res!434574) (not e!381976))))

(assert (=> b!667337 (= res!434574 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12764))))

(declare-fun b!667338 () Bool)

(declare-fun lt!310780 () Unit!23355)

(assert (=> b!667338 (= e!381969 lt!310780)))

(declare-fun lt!310782 () Unit!23355)

(declare-fun lemmaListSubSeqRefl!0 (List!12767) Unit!23355)

(assert (=> b!667338 (= lt!310782 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!83 (List!12767 List!12767) Bool)

(assert (=> b!667338 (subseq!83 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39067 List!12767 List!12767 (_ BitVec 32)) Unit!23355)

(declare-fun $colon$colon!215 (List!12767 (_ BitVec 64)) List!12767)

(assert (=> b!667338 (= lt!310780 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!215 acc!681 (select (arr!18726 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667338 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667339 () Bool)

(declare-fun res!434562 () Bool)

(assert (=> b!667339 (=> (not res!434562) (not e!381976))))

(assert (=> b!667339 (= res!434562 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19090 a!3626))))))

(declare-fun b!667340 () Bool)

(declare-fun Unit!23359 () Unit!23355)

(assert (=> b!667340 (= e!381971 Unit!23359)))

(declare-fun b!667341 () Bool)

(declare-fun res!434558 () Bool)

(assert (=> b!667341 (=> (not res!434558) (not e!381976))))

(declare-fun e!381972 () Bool)

(assert (=> b!667341 (= res!434558 e!381972)))

(declare-fun res!434564 () Bool)

(assert (=> b!667341 (=> res!434564 e!381972)))

(assert (=> b!667341 (= res!434564 e!381978)))

(declare-fun res!434569 () Bool)

(assert (=> b!667341 (=> (not res!434569) (not e!381978))))

(assert (=> b!667341 (= res!434569 (bvsgt from!3004 i!1382))))

(declare-fun b!667342 () Bool)

(assert (=> b!667342 (= e!381976 (not e!381977))))

(declare-fun res!434568 () Bool)

(assert (=> b!667342 (=> res!434568 e!381977)))

(assert (=> b!667342 (= res!434568 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667342 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310775)))

(declare-fun lt!310777 () Unit!23355)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39067 (_ BitVec 64) (_ BitVec 32) List!12767 List!12767) Unit!23355)

(assert (=> b!667342 (= lt!310777 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310775))))

(declare-fun -!81 (List!12767 (_ BitVec 64)) List!12767)

(assert (=> b!667342 (= (-!81 lt!310775 k!2843) acc!681)))

(assert (=> b!667342 (= lt!310775 ($colon$colon!215 acc!681 k!2843))))

(declare-fun lt!310778 () Unit!23355)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12767) Unit!23355)

(assert (=> b!667342 (= lt!310778 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667342 (subseq!83 acc!681 acc!681)))

(declare-fun lt!310781 () Unit!23355)

(assert (=> b!667342 (= lt!310781 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667342 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310774 () Unit!23355)

(assert (=> b!667342 (= lt!310774 e!381969)))

(declare-fun c!76754 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667342 (= c!76754 (validKeyInArray!0 (select (arr!18726 a!3626) from!3004)))))

(declare-fun lt!310776 () Unit!23355)

(assert (=> b!667342 (= lt!310776 e!381971)))

(declare-fun c!76753 () Bool)

(declare-fun arrayContainsKey!0 (array!39067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667342 (= c!76753 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667342 (arrayContainsKey!0 (array!39068 (store (arr!18726 a!3626) i!1382 k!2843) (size!19090 a!3626)) k!2843 from!3004)))

(declare-fun b!667343 () Bool)

(declare-fun e!381975 () Bool)

(assert (=> b!667343 (= e!381972 e!381975)))

(declare-fun res!434576 () Bool)

(assert (=> b!667343 (=> (not res!434576) (not e!381975))))

(assert (=> b!667343 (= res!434576 (bvsle from!3004 i!1382))))

(declare-fun b!667344 () Bool)

(declare-fun res!434559 () Bool)

(assert (=> b!667344 (=> res!434559 e!381977)))

(assert (=> b!667344 (= res!434559 (contains!3344 lt!310775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667345 () Bool)

(assert (=> b!667345 (= e!381973 (contains!3344 lt!310775 k!2843))))

(declare-fun b!667346 () Bool)

(assert (=> b!667346 (= e!381968 e!381970)))

(declare-fun res!434556 () Bool)

(assert (=> b!667346 (=> (not res!434556) (not e!381970))))

(assert (=> b!667346 (= res!434556 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667347 () Bool)

(declare-fun res!434566 () Bool)

(assert (=> b!667347 (=> (not res!434566) (not e!381976))))

(assert (=> b!667347 (= res!434566 (not (contains!3344 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667348 () Bool)

(declare-fun res!434575 () Bool)

(assert (=> b!667348 (=> (not res!434575) (not e!381976))))

(assert (=> b!667348 (= res!434575 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19090 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667349 () Bool)

(declare-fun res!434557 () Bool)

(assert (=> b!667349 (=> (not res!434557) (not e!381976))))

(assert (=> b!667349 (= res!434557 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667350 () Bool)

(declare-fun res!434565 () Bool)

(assert (=> b!667350 (=> (not res!434565) (not e!381976))))

(assert (=> b!667350 (= res!434565 (validKeyInArray!0 k!2843))))

(declare-fun b!667351 () Bool)

(declare-fun res!434567 () Bool)

(assert (=> b!667351 (=> res!434567 e!381977)))

(assert (=> b!667351 (= res!434567 (contains!3344 lt!310775 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667352 () Bool)

(assert (=> b!667352 (= e!381975 (not (contains!3344 acc!681 k!2843)))))

(assert (= (and start!60020 res!434563) b!667336))

(assert (= (and b!667336 res!434560) b!667329))

(assert (= (and b!667329 res!434573) b!667347))

(assert (= (and b!667347 res!434566) b!667341))

(assert (= (and b!667341 res!434569) b!667335))

(assert (= (and b!667341 (not res!434564)) b!667343))

(assert (= (and b!667343 res!434576) b!667352))

(assert (= (and b!667341 res!434558) b!667337))

(assert (= (and b!667337 res!434574) b!667330))

(assert (= (and b!667330 res!434572) b!667339))

(assert (= (and b!667339 res!434562) b!667350))

(assert (= (and b!667350 res!434565) b!667349))

(assert (= (and b!667349 res!434557) b!667348))

(assert (= (and b!667348 res!434575) b!667342))

(assert (= (and b!667342 c!76753) b!667334))

(assert (= (and b!667342 (not c!76753)) b!667340))

(assert (= (and b!667342 c!76754) b!667338))

(assert (= (and b!667342 (not c!76754)) b!667328))

(assert (= (and b!667342 (not res!434568)) b!667331))

(assert (= (and b!667331 (not res!434571)) b!667344))

(assert (= (and b!667344 (not res!434559)) b!667351))

(assert (= (and b!667351 (not res!434567)) b!667332))

(assert (= (and b!667332 res!434570) b!667345))

(assert (= (and b!667332 (not res!434561)) b!667346))

(assert (= (and b!667346 res!434556) b!667333))

(declare-fun m!637901 () Bool)

(assert (=> b!667335 m!637901))

(declare-fun m!637903 () Bool)

(assert (=> b!667345 m!637903))

(declare-fun m!637905 () Bool)

(assert (=> b!667336 m!637905))

(declare-fun m!637907 () Bool)

(assert (=> b!667342 m!637907))

(declare-fun m!637909 () Bool)

(assert (=> b!667342 m!637909))

(declare-fun m!637911 () Bool)

(assert (=> b!667342 m!637911))

(declare-fun m!637913 () Bool)

(assert (=> b!667342 m!637913))

(declare-fun m!637915 () Bool)

(assert (=> b!667342 m!637915))

(declare-fun m!637917 () Bool)

(assert (=> b!667342 m!637917))

(assert (=> b!667342 m!637909))

(declare-fun m!637919 () Bool)

(assert (=> b!667342 m!637919))

(declare-fun m!637921 () Bool)

(assert (=> b!667342 m!637921))

(declare-fun m!637923 () Bool)

(assert (=> b!667342 m!637923))

(declare-fun m!637925 () Bool)

(assert (=> b!667342 m!637925))

(declare-fun m!637927 () Bool)

(assert (=> b!667342 m!637927))

(declare-fun m!637929 () Bool)

(assert (=> b!667342 m!637929))

(declare-fun m!637931 () Bool)

(assert (=> b!667342 m!637931))

(declare-fun m!637933 () Bool)

(assert (=> b!667344 m!637933))

(declare-fun m!637935 () Bool)

(assert (=> b!667331 m!637935))

(declare-fun m!637937 () Bool)

(assert (=> b!667337 m!637937))

(assert (=> b!667338 m!637907))

(assert (=> b!667338 m!637909))

(declare-fun m!637939 () Bool)

(assert (=> b!667338 m!637939))

(declare-fun m!637941 () Bool)

(assert (=> b!667338 m!637941))

(assert (=> b!667338 m!637909))

(assert (=> b!667338 m!637939))

(assert (=> b!667338 m!637913))

(assert (=> b!667338 m!637931))

(assert (=> b!667352 m!637901))

(declare-fun m!637943 () Bool)

(assert (=> b!667347 m!637943))

(declare-fun m!637945 () Bool)

(assert (=> b!667330 m!637945))

(assert (=> b!667333 m!637903))

(declare-fun m!637947 () Bool)

(assert (=> b!667351 m!637947))

(declare-fun m!637949 () Bool)

(assert (=> b!667329 m!637949))

(declare-fun m!637951 () Bool)

(assert (=> b!667334 m!637951))

(declare-fun m!637953 () Bool)

(assert (=> start!60020 m!637953))

(declare-fun m!637955 () Bool)

(assert (=> b!667349 m!637955))

(declare-fun m!637957 () Bool)

(assert (=> b!667350 m!637957))

(push 1)

(assert (not b!667342))

(assert (not b!667331))

(assert (not b!667329))

(assert (not b!667351))

(assert (not b!667347))

(assert (not start!60020))

(assert (not b!667338))

(assert (not b!667350))

(assert (not b!667330))

(assert (not b!667336))

(assert (not b!667345))

(assert (not b!667349))

(assert (not b!667333))

(assert (not b!667334))

(assert (not b!667337))

(assert (not b!667335))

(assert (not b!667344))

(assert (not b!667352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

