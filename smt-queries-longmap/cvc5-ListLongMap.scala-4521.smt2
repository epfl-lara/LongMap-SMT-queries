; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62594 () Bool)

(assert start!62594)

(declare-fun b!706230 () Bool)

(declare-fun e!397920 () Bool)

(assert (=> b!706230 (= e!397920 false)))

(declare-fun lt!317934 () Bool)

(declare-datatypes ((List!13334 0))(
  ( (Nil!13331) (Cons!13330 (h!14375 (_ BitVec 64)) (t!19616 List!13334)) )
))
(declare-fun newAcc!49 () List!13334)

(declare-fun contains!3911 (List!13334 (_ BitVec 64)) Bool)

(assert (=> b!706230 (= lt!317934 (contains!3911 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706231 () Bool)

(declare-fun res!470050 () Bool)

(assert (=> b!706231 (=> (not res!470050) (not e!397920))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706231 (= res!470050 (validKeyInArray!0 k!2824))))

(declare-fun b!706232 () Bool)

(declare-fun res!470042 () Bool)

(assert (=> b!706232 (=> (not res!470042) (not e!397920))))

(declare-datatypes ((array!40273 0))(
  ( (array!40274 (arr!19293 (Array (_ BitVec 32) (_ BitVec 64))) (size!19678 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40273)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706232 (= res!470042 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706233 () Bool)

(declare-fun res!470048 () Bool)

(assert (=> b!706233 (=> (not res!470048) (not e!397920))))

(declare-fun acc!652 () List!13334)

(declare-fun subseq!356 (List!13334 List!13334) Bool)

(assert (=> b!706233 (= res!470048 (subseq!356 acc!652 newAcc!49))))

(declare-fun b!706235 () Bool)

(declare-fun res!470041 () Bool)

(assert (=> b!706235 (=> (not res!470041) (not e!397920))))

(assert (=> b!706235 (= res!470041 (contains!3911 newAcc!49 k!2824))))

(declare-fun b!706236 () Bool)

(declare-fun res!470043 () Bool)

(assert (=> b!706236 (=> (not res!470043) (not e!397920))))

(declare-fun noDuplicate!1158 (List!13334) Bool)

(assert (=> b!706236 (= res!470043 (noDuplicate!1158 newAcc!49))))

(declare-fun b!706237 () Bool)

(declare-fun res!470046 () Bool)

(assert (=> b!706237 (=> (not res!470046) (not e!397920))))

(declare-fun arrayNoDuplicates!0 (array!40273 (_ BitVec 32) List!13334) Bool)

(assert (=> b!706237 (= res!470046 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706238 () Bool)

(declare-fun res!470051 () Bool)

(assert (=> b!706238 (=> (not res!470051) (not e!397920))))

(assert (=> b!706238 (= res!470051 (not (contains!3911 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706239 () Bool)

(declare-fun res!470047 () Bool)

(assert (=> b!706239 (=> (not res!470047) (not e!397920))))

(assert (=> b!706239 (= res!470047 (not (contains!3911 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706240 () Bool)

(declare-fun res!470052 () Bool)

(assert (=> b!706240 (=> (not res!470052) (not e!397920))))

(declare-fun -!321 (List!13334 (_ BitVec 64)) List!13334)

(assert (=> b!706240 (= res!470052 (= (-!321 newAcc!49 k!2824) acc!652))))

(declare-fun b!706234 () Bool)

(declare-fun res!470045 () Bool)

(assert (=> b!706234 (=> (not res!470045) (not e!397920))))

(assert (=> b!706234 (= res!470045 (noDuplicate!1158 acc!652))))

(declare-fun res!470044 () Bool)

(assert (=> start!62594 (=> (not res!470044) (not e!397920))))

(assert (=> start!62594 (= res!470044 (and (bvslt (size!19678 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19678 a!3591))))))

(assert (=> start!62594 e!397920))

(assert (=> start!62594 true))

(declare-fun array_inv!15089 (array!40273) Bool)

(assert (=> start!62594 (array_inv!15089 a!3591)))

(declare-fun b!706241 () Bool)

(declare-fun res!470040 () Bool)

(assert (=> b!706241 (=> (not res!470040) (not e!397920))))

(assert (=> b!706241 (= res!470040 (not (contains!3911 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706242 () Bool)

(declare-fun res!470049 () Bool)

(assert (=> b!706242 (=> (not res!470049) (not e!397920))))

(assert (=> b!706242 (= res!470049 (not (contains!3911 acc!652 k!2824)))))

(assert (= (and start!62594 res!470044) b!706234))

(assert (= (and b!706234 res!470045) b!706236))

(assert (= (and b!706236 res!470043) b!706241))

(assert (= (and b!706241 res!470040) b!706238))

(assert (= (and b!706238 res!470051) b!706232))

(assert (= (and b!706232 res!470042) b!706242))

(assert (= (and b!706242 res!470049) b!706231))

(assert (= (and b!706231 res!470050) b!706237))

(assert (= (and b!706237 res!470046) b!706233))

(assert (= (and b!706233 res!470048) b!706235))

(assert (= (and b!706235 res!470041) b!706240))

(assert (= (and b!706240 res!470052) b!706239))

(assert (= (and b!706239 res!470047) b!706230))

(declare-fun m!664159 () Bool)

(assert (=> b!706242 m!664159))

(declare-fun m!664161 () Bool)

(assert (=> start!62594 m!664161))

(declare-fun m!664163 () Bool)

(assert (=> b!706231 m!664163))

(declare-fun m!664165 () Bool)

(assert (=> b!706232 m!664165))

(declare-fun m!664167 () Bool)

(assert (=> b!706233 m!664167))

(declare-fun m!664169 () Bool)

(assert (=> b!706239 m!664169))

(declare-fun m!664171 () Bool)

(assert (=> b!706230 m!664171))

(declare-fun m!664173 () Bool)

(assert (=> b!706238 m!664173))

(declare-fun m!664175 () Bool)

(assert (=> b!706237 m!664175))

(declare-fun m!664177 () Bool)

(assert (=> b!706234 m!664177))

(declare-fun m!664179 () Bool)

(assert (=> b!706235 m!664179))

(declare-fun m!664181 () Bool)

(assert (=> b!706236 m!664181))

(declare-fun m!664183 () Bool)

(assert (=> b!706240 m!664183))

(declare-fun m!664185 () Bool)

(assert (=> b!706241 m!664185))

(push 1)

(assert (not b!706242))

(assert (not b!706231))

(assert (not b!706241))

(assert (not b!706234))

(assert (not b!706233))

(assert (not b!706239))

(assert (not b!706238))

(assert (not b!706232))

(assert (not b!706237))

(assert (not b!706240))

(assert (not start!62594))

(assert (not b!706235))

(assert (not b!706236))

(assert (not b!706230))

(check-sat)

