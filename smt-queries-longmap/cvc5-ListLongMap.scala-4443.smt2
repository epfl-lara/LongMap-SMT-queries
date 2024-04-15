; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61752 () Bool)

(assert start!61752)

(declare-fun b!690834 () Bool)

(declare-fun res!455381 () Bool)

(declare-fun e!393221 () Bool)

(assert (=> b!690834 (=> (not res!455381) (not e!393221))))

(declare-datatypes ((array!39784 0))(
  ( (array!39785 (arr!19060 (Array (_ BitVec 32) (_ BitVec 64))) (size!19442 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39784)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13140 0))(
  ( (Nil!13137) (Cons!13136 (h!14181 (_ BitVec 64)) (t!19398 List!13140)) )
))
(declare-fun acc!681 () List!13140)

(declare-fun arrayNoDuplicates!0 (array!39784 (_ BitVec 32) List!13140) Bool)

(assert (=> b!690834 (= res!455381 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690835 () Bool)

(declare-fun e!393220 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3662 (List!13140 (_ BitVec 64)) Bool)

(assert (=> b!690835 (= e!393220 (not (contains!3662 acc!681 k!2843)))))

(declare-fun b!690836 () Bool)

(declare-fun res!455374 () Bool)

(assert (=> b!690836 (=> (not res!455374) (not e!393221))))

(assert (=> b!690836 (= res!455374 (not (contains!3662 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690837 () Bool)

(declare-fun res!455379 () Bool)

(assert (=> b!690837 (=> (not res!455379) (not e!393221))))

(assert (=> b!690837 (= res!455379 (not (contains!3662 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690838 () Bool)

(declare-fun res!455375 () Bool)

(assert (=> b!690838 (=> (not res!455375) (not e!393221))))

(assert (=> b!690838 (= res!455375 (= (select (arr!19060 a!3626) from!3004) k!2843))))

(declare-fun b!690839 () Bool)

(declare-fun res!455384 () Bool)

(assert (=> b!690839 (=> (not res!455384) (not e!393221))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690839 (= res!455384 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19442 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690840 () Bool)

(declare-fun res!455388 () Bool)

(assert (=> b!690840 (=> (not res!455388) (not e!393221))))

(assert (=> b!690840 (= res!455388 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13137))))

(declare-fun b!690841 () Bool)

(declare-fun res!455387 () Bool)

(assert (=> b!690841 (=> (not res!455387) (not e!393221))))

(declare-fun e!393218 () Bool)

(assert (=> b!690841 (= res!455387 e!393218)))

(declare-fun res!455380 () Bool)

(assert (=> b!690841 (=> res!455380 e!393218)))

(declare-fun e!393217 () Bool)

(assert (=> b!690841 (= res!455380 e!393217)))

(declare-fun res!455389 () Bool)

(assert (=> b!690841 (=> (not res!455389) (not e!393217))))

(assert (=> b!690841 (= res!455389 (bvsgt from!3004 i!1382))))

(declare-fun b!690843 () Bool)

(assert (=> b!690843 (= e!393217 (contains!3662 acc!681 k!2843))))

(declare-fun b!690844 () Bool)

(declare-fun res!455383 () Bool)

(assert (=> b!690844 (=> (not res!455383) (not e!393221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690844 (= res!455383 (validKeyInArray!0 (select (arr!19060 a!3626) from!3004)))))

(declare-fun b!690845 () Bool)

(declare-fun res!455376 () Bool)

(assert (=> b!690845 (=> (not res!455376) (not e!393221))))

(declare-fun arrayContainsKey!0 (array!39784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690845 (= res!455376 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690846 () Bool)

(declare-fun res!455385 () Bool)

(assert (=> b!690846 (=> (not res!455385) (not e!393221))))

(assert (=> b!690846 (= res!455385 (validKeyInArray!0 k!2843))))

(declare-fun b!690847 () Bool)

(declare-fun res!455386 () Bool)

(assert (=> b!690847 (=> (not res!455386) (not e!393221))))

(assert (=> b!690847 (= res!455386 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19442 a!3626))))))

(declare-fun b!690842 () Bool)

(assert (=> b!690842 (= e!393218 e!393220)))

(declare-fun res!455382 () Bool)

(assert (=> b!690842 (=> (not res!455382) (not e!393220))))

(assert (=> b!690842 (= res!455382 (bvsle from!3004 i!1382))))

(declare-fun res!455377 () Bool)

(assert (=> start!61752 (=> (not res!455377) (not e!393221))))

(assert (=> start!61752 (= res!455377 (and (bvslt (size!19442 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19442 a!3626))))))

(assert (=> start!61752 e!393221))

(assert (=> start!61752 true))

(declare-fun array_inv!14943 (array!39784) Bool)

(assert (=> start!61752 (array_inv!14943 a!3626)))

(declare-fun b!690848 () Bool)

(assert (=> b!690848 (= e!393221 (not true))))

(assert (=> b!690848 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690849 () Bool)

(declare-fun res!455378 () Bool)

(assert (=> b!690849 (=> (not res!455378) (not e!393221))))

(declare-fun noDuplicate!931 (List!13140) Bool)

(assert (=> b!690849 (= res!455378 (noDuplicate!931 acc!681))))

(assert (= (and start!61752 res!455377) b!690849))

(assert (= (and b!690849 res!455378) b!690836))

(assert (= (and b!690836 res!455374) b!690837))

(assert (= (and b!690837 res!455379) b!690841))

(assert (= (and b!690841 res!455389) b!690843))

(assert (= (and b!690841 (not res!455380)) b!690842))

(assert (= (and b!690842 res!455382) b!690835))

(assert (= (and b!690841 res!455387) b!690840))

(assert (= (and b!690840 res!455388) b!690834))

(assert (= (and b!690834 res!455381) b!690847))

(assert (= (and b!690847 res!455386) b!690846))

(assert (= (and b!690846 res!455385) b!690845))

(assert (= (and b!690845 res!455376) b!690839))

(assert (= (and b!690839 res!455384) b!690844))

(assert (= (and b!690844 res!455383) b!690838))

(assert (= (and b!690838 res!455375) b!690848))

(declare-fun m!653523 () Bool)

(assert (=> b!690837 m!653523))

(declare-fun m!653525 () Bool)

(assert (=> start!61752 m!653525))

(declare-fun m!653527 () Bool)

(assert (=> b!690834 m!653527))

(declare-fun m!653529 () Bool)

(assert (=> b!690836 m!653529))

(declare-fun m!653531 () Bool)

(assert (=> b!690846 m!653531))

(declare-fun m!653533 () Bool)

(assert (=> b!690849 m!653533))

(declare-fun m!653535 () Bool)

(assert (=> b!690840 m!653535))

(declare-fun m!653537 () Bool)

(assert (=> b!690845 m!653537))

(declare-fun m!653539 () Bool)

(assert (=> b!690843 m!653539))

(declare-fun m!653541 () Bool)

(assert (=> b!690844 m!653541))

(assert (=> b!690844 m!653541))

(declare-fun m!653543 () Bool)

(assert (=> b!690844 m!653543))

(assert (=> b!690838 m!653541))

(declare-fun m!653545 () Bool)

(assert (=> b!690848 m!653545))

(assert (=> b!690835 m!653539))

(push 1)

(assert (not b!690849))

(assert (not b!690846))

(assert (not b!690848))

(assert (not start!61752))

(assert (not b!690837))

(assert (not b!690835))

(assert (not b!690840))

(assert (not b!690845))

(assert (not b!690836))

(assert (not b!690834))

(assert (not b!690844))

(assert (not b!690843))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

