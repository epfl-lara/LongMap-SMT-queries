; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60480 () Bool)

(assert start!60480)

(declare-fun b!679536 () Bool)

(declare-fun e!387172 () Bool)

(declare-fun e!387174 () Bool)

(assert (=> b!679536 (= e!387172 e!387174)))

(declare-fun res!445902 () Bool)

(assert (=> b!679536 (=> (not res!445902) (not e!387174))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679536 (= res!445902 (bvsle from!3004 i!1382))))

(declare-fun b!679537 () Bool)

(declare-fun res!445907 () Bool)

(declare-fun e!387169 () Bool)

(assert (=> b!679537 (=> (not res!445907) (not e!387169))))

(declare-datatypes ((array!39461 0))(
  ( (array!39462 (arr!18920 (Array (_ BitVec 32) (_ BitVec 64))) (size!19284 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39461)

(declare-datatypes ((List!12961 0))(
  ( (Nil!12958) (Cons!12957 (h!14002 (_ BitVec 64)) (t!19189 List!12961)) )
))
(declare-fun acc!681 () List!12961)

(declare-fun arrayNoDuplicates!0 (array!39461 (_ BitVec 32) List!12961) Bool)

(assert (=> b!679537 (= res!445907 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679538 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3538 (List!12961 (_ BitVec 64)) Bool)

(assert (=> b!679538 (= e!387174 (not (contains!3538 acc!681 k!2843)))))

(declare-fun b!679539 () Bool)

(declare-fun e!387173 () Bool)

(assert (=> b!679539 (= e!387173 (contains!3538 acc!681 k!2843))))

(declare-fun b!679540 () Bool)

(declare-fun res!445897 () Bool)

(assert (=> b!679540 (=> (not res!445897) (not e!387169))))

(assert (=> b!679540 (= res!445897 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19284 a!3626))))))

(declare-fun b!679542 () Bool)

(declare-fun e!387170 () Bool)

(assert (=> b!679542 (= e!387169 (not e!387170))))

(declare-fun res!445900 () Bool)

(assert (=> b!679542 (=> res!445900 e!387170)))

(declare-fun arrayContainsKey!0 (array!39461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679542 (= res!445900 (not (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!679542 (arrayContainsKey!0 (array!39462 (store (arr!18920 a!3626) i!1382 k!2843) (size!19284 a!3626)) k!2843 from!3004)))

(declare-fun b!679543 () Bool)

(declare-fun res!445901 () Bool)

(assert (=> b!679543 (=> (not res!445901) (not e!387169))))

(assert (=> b!679543 (= res!445901 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19284 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679544 () Bool)

(declare-fun res!445899 () Bool)

(assert (=> b!679544 (=> (not res!445899) (not e!387169))))

(declare-fun noDuplicate!785 (List!12961) Bool)

(assert (=> b!679544 (= res!445899 (noDuplicate!785 acc!681))))

(declare-fun b!679545 () Bool)

(declare-fun res!445908 () Bool)

(assert (=> b!679545 (=> (not res!445908) (not e!387169))))

(assert (=> b!679545 (= res!445908 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12958))))

(declare-fun b!679546 () Bool)

(assert (=> b!679546 (= e!387170 true)))

(assert (=> b!679546 false))

(declare-datatypes ((Unit!23800 0))(
  ( (Unit!23801) )
))
(declare-fun lt!312934 () Unit!23800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39461 (_ BitVec 64) (_ BitVec 32)) Unit!23800)

(assert (=> b!679546 (= lt!312934 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(declare-fun b!679547 () Bool)

(declare-fun res!445903 () Bool)

(assert (=> b!679547 (=> (not res!445903) (not e!387169))))

(assert (=> b!679547 (= res!445903 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679548 () Bool)

(declare-fun res!445909 () Bool)

(assert (=> b!679548 (=> (not res!445909) (not e!387169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679548 (= res!445909 (validKeyInArray!0 k!2843))))

(declare-fun b!679549 () Bool)

(declare-fun res!445896 () Bool)

(assert (=> b!679549 (=> (not res!445896) (not e!387169))))

(assert (=> b!679549 (= res!445896 (not (contains!3538 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679550 () Bool)

(declare-fun res!445898 () Bool)

(assert (=> b!679550 (=> (not res!445898) (not e!387169))))

(assert (=> b!679550 (= res!445898 (not (contains!3538 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!445910 () Bool)

(assert (=> start!60480 (=> (not res!445910) (not e!387169))))

(assert (=> start!60480 (= res!445910 (and (bvslt (size!19284 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19284 a!3626))))))

(assert (=> start!60480 e!387169))

(assert (=> start!60480 true))

(declare-fun array_inv!14716 (array!39461) Bool)

(assert (=> start!60480 (array_inv!14716 a!3626)))

(declare-fun b!679541 () Bool)

(declare-fun res!445904 () Bool)

(assert (=> b!679541 (=> (not res!445904) (not e!387169))))

(assert (=> b!679541 (= res!445904 e!387172)))

(declare-fun res!445906 () Bool)

(assert (=> b!679541 (=> res!445906 e!387172)))

(assert (=> b!679541 (= res!445906 e!387173)))

(declare-fun res!445905 () Bool)

(assert (=> b!679541 (=> (not res!445905) (not e!387173))))

(assert (=> b!679541 (= res!445905 (bvsgt from!3004 i!1382))))

(assert (= (and start!60480 res!445910) b!679544))

(assert (= (and b!679544 res!445899) b!679549))

(assert (= (and b!679549 res!445896) b!679550))

(assert (= (and b!679550 res!445898) b!679541))

(assert (= (and b!679541 res!445905) b!679539))

(assert (= (and b!679541 (not res!445906)) b!679536))

(assert (= (and b!679536 res!445902) b!679538))

(assert (= (and b!679541 res!445904) b!679545))

(assert (= (and b!679545 res!445908) b!679537))

(assert (= (and b!679537 res!445907) b!679540))

(assert (= (and b!679540 res!445897) b!679548))

(assert (= (and b!679548 res!445909) b!679547))

(assert (= (and b!679547 res!445903) b!679543))

(assert (= (and b!679543 res!445901) b!679542))

(assert (= (and b!679542 (not res!445900)) b!679546))

(declare-fun m!644913 () Bool)

(assert (=> b!679546 m!644913))

(declare-fun m!644915 () Bool)

(assert (=> b!679550 m!644915))

(declare-fun m!644917 () Bool)

(assert (=> b!679548 m!644917))

(declare-fun m!644919 () Bool)

(assert (=> b!679547 m!644919))

(declare-fun m!644921 () Bool)

(assert (=> b!679545 m!644921))

(declare-fun m!644923 () Bool)

(assert (=> b!679537 m!644923))

(declare-fun m!644925 () Bool)

(assert (=> b!679542 m!644925))

(declare-fun m!644927 () Bool)

(assert (=> b!679542 m!644927))

(declare-fun m!644929 () Bool)

(assert (=> b!679542 m!644929))

(declare-fun m!644931 () Bool)

(assert (=> start!60480 m!644931))

(declare-fun m!644933 () Bool)

(assert (=> b!679539 m!644933))

(assert (=> b!679538 m!644933))

(declare-fun m!644935 () Bool)

(assert (=> b!679549 m!644935))

(declare-fun m!644937 () Bool)

(assert (=> b!679544 m!644937))

(push 1)

(assert (not b!679537))

(assert (not b!679545))

(assert (not b!679550))

(assert (not start!60480))

(assert (not b!679544))

(assert (not b!679549))

(assert (not b!679542))

(assert (not b!679547))

(assert (not b!679539))

(assert (not b!679538))

(assert (not b!679546))

(assert (not b!679548))

(check-sat)

