; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62484 () Bool)

(assert start!62484)

(declare-fun res!467091 () Bool)

(declare-fun e!397591 () Bool)

(assert (=> start!62484 (=> (not res!467091) (not e!397591))))

(declare-datatypes ((array!40163 0))(
  ( (array!40164 (arr!19238 (Array (_ BitVec 32) (_ BitVec 64))) (size!19623 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40163)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62484 (= res!467091 (and (bvslt (size!19623 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19623 a!3591))))))

(assert (=> start!62484 e!397591))

(assert (=> start!62484 true))

(declare-fun array_inv!15034 (array!40163) Bool)

(assert (=> start!62484 (array_inv!15034 a!3591)))

(declare-fun b!703270 () Bool)

(declare-fun res!467089 () Bool)

(assert (=> b!703270 (=> (not res!467089) (not e!397591))))

(declare-datatypes ((List!13279 0))(
  ( (Nil!13276) (Cons!13275 (h!14320 (_ BitVec 64)) (t!19561 List!13279)) )
))
(declare-fun acc!652 () List!13279)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3856 (List!13279 (_ BitVec 64)) Bool)

(assert (=> b!703270 (= res!467089 (not (contains!3856 acc!652 k!2824)))))

(declare-fun b!703271 () Bool)

(declare-fun res!467086 () Bool)

(assert (=> b!703271 (=> (not res!467086) (not e!397591))))

(assert (=> b!703271 (= res!467086 (not (contains!3856 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703272 () Bool)

(declare-fun res!467097 () Bool)

(assert (=> b!703272 (=> (not res!467097) (not e!397591))))

(assert (=> b!703272 (= res!467097 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703273 () Bool)

(declare-fun res!467096 () Bool)

(assert (=> b!703273 (=> (not res!467096) (not e!397591))))

(declare-fun newAcc!49 () List!13279)

(assert (=> b!703273 (= res!467096 (not (contains!3856 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703274 () Bool)

(declare-fun res!467090 () Bool)

(assert (=> b!703274 (=> (not res!467090) (not e!397591))))

(assert (=> b!703274 (= res!467090 (not (contains!3856 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703275 () Bool)

(declare-fun res!467092 () Bool)

(assert (=> b!703275 (=> (not res!467092) (not e!397591))))

(declare-fun subseq!301 (List!13279 List!13279) Bool)

(assert (=> b!703275 (= res!467092 (subseq!301 acc!652 newAcc!49))))

(declare-fun b!703276 () Bool)

(declare-fun res!467083 () Bool)

(assert (=> b!703276 (=> (not res!467083) (not e!397591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703276 (= res!467083 (not (validKeyInArray!0 (select (arr!19238 a!3591) from!2969))))))

(declare-fun b!703277 () Bool)

(declare-fun res!467087 () Bool)

(assert (=> b!703277 (=> (not res!467087) (not e!397591))))

(declare-fun -!266 (List!13279 (_ BitVec 64)) List!13279)

(assert (=> b!703277 (= res!467087 (= (-!266 newAcc!49 k!2824) acc!652))))

(declare-fun b!703278 () Bool)

(assert (=> b!703278 (= e!397591 false)))

(declare-fun lt!317778 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40163 (_ BitVec 32) List!13279) Bool)

(assert (=> b!703278 (= lt!317778 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703279 () Bool)

(declare-fun res!467093 () Bool)

(assert (=> b!703279 (=> (not res!467093) (not e!397591))))

(declare-fun arrayContainsKey!0 (array!40163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703279 (= res!467093 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703280 () Bool)

(declare-fun res!467080 () Bool)

(assert (=> b!703280 (=> (not res!467080) (not e!397591))))

(assert (=> b!703280 (= res!467080 (not (contains!3856 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703281 () Bool)

(declare-fun res!467088 () Bool)

(assert (=> b!703281 (=> (not res!467088) (not e!397591))))

(assert (=> b!703281 (= res!467088 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19623 a!3591)))))

(declare-fun b!703282 () Bool)

(declare-fun res!467084 () Bool)

(assert (=> b!703282 (=> (not res!467084) (not e!397591))))

(declare-fun noDuplicate!1103 (List!13279) Bool)

(assert (=> b!703282 (= res!467084 (noDuplicate!1103 newAcc!49))))

(declare-fun b!703283 () Bool)

(declare-fun res!467082 () Bool)

(assert (=> b!703283 (=> (not res!467082) (not e!397591))))

(assert (=> b!703283 (= res!467082 (contains!3856 newAcc!49 k!2824))))

(declare-fun b!703284 () Bool)

(declare-fun res!467081 () Bool)

(assert (=> b!703284 (=> (not res!467081) (not e!397591))))

(assert (=> b!703284 (= res!467081 (noDuplicate!1103 acc!652))))

(declare-fun b!703285 () Bool)

(declare-fun res!467085 () Bool)

(assert (=> b!703285 (=> (not res!467085) (not e!397591))))

(assert (=> b!703285 (= res!467085 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703286 () Bool)

(declare-fun res!467094 () Bool)

(assert (=> b!703286 (=> (not res!467094) (not e!397591))))

(assert (=> b!703286 (= res!467094 (validKeyInArray!0 k!2824))))

(declare-fun b!703287 () Bool)

(declare-fun res!467095 () Bool)

(assert (=> b!703287 (=> (not res!467095) (not e!397591))))

(assert (=> b!703287 (= res!467095 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(assert (= (and start!62484 res!467091) b!703284))

(assert (= (and b!703284 res!467081) b!703282))

(assert (= (and b!703282 res!467084) b!703271))

(assert (= (and b!703271 res!467086) b!703274))

(assert (= (and b!703274 res!467090) b!703287))

(assert (= (and b!703287 res!467095) b!703270))

(assert (= (and b!703270 res!467089) b!703286))

(assert (= (and b!703286 res!467094) b!703285))

(assert (= (and b!703285 res!467085) b!703275))

(assert (= (and b!703275 res!467092) b!703283))

(assert (= (and b!703283 res!467082) b!703277))

(assert (= (and b!703277 res!467087) b!703273))

(assert (= (and b!703273 res!467096) b!703280))

(assert (= (and b!703280 res!467080) b!703281))

(assert (= (and b!703281 res!467088) b!703276))

(assert (= (and b!703276 res!467083) b!703272))

(assert (= (and b!703272 res!467097) b!703279))

(assert (= (and b!703279 res!467093) b!703278))

(declare-fun m!662155 () Bool)

(assert (=> b!703274 m!662155))

(declare-fun m!662157 () Bool)

(assert (=> b!703279 m!662157))

(declare-fun m!662159 () Bool)

(assert (=> b!703271 m!662159))

(declare-fun m!662161 () Bool)

(assert (=> b!703273 m!662161))

(declare-fun m!662163 () Bool)

(assert (=> start!62484 m!662163))

(declare-fun m!662165 () Bool)

(assert (=> b!703284 m!662165))

(declare-fun m!662167 () Bool)

(assert (=> b!703282 m!662167))

(declare-fun m!662169 () Bool)

(assert (=> b!703278 m!662169))

(declare-fun m!662171 () Bool)

(assert (=> b!703277 m!662171))

(declare-fun m!662173 () Bool)

(assert (=> b!703270 m!662173))

(declare-fun m!662175 () Bool)

(assert (=> b!703276 m!662175))

(assert (=> b!703276 m!662175))

(declare-fun m!662177 () Bool)

(assert (=> b!703276 m!662177))

(declare-fun m!662179 () Bool)

(assert (=> b!703286 m!662179))

(declare-fun m!662181 () Bool)

(assert (=> b!703275 m!662181))

(declare-fun m!662183 () Bool)

(assert (=> b!703280 m!662183))

(declare-fun m!662185 () Bool)

(assert (=> b!703285 m!662185))

(declare-fun m!662187 () Bool)

(assert (=> b!703287 m!662187))

(declare-fun m!662189 () Bool)

(assert (=> b!703283 m!662189))

(push 1)

(assert (not start!62484))

(assert (not b!703282))

(assert (not b!703278))

(assert (not b!703280))

(assert (not b!703273))

(assert (not b!703277))

(assert (not b!703286))

(assert (not b!703279))

(assert (not b!703274))

(assert (not b!703284))

(assert (not b!703275))

(assert (not b!703270))

(assert (not b!703276))

(assert (not b!703285))

(assert (not b!703283))

(assert (not b!703287))

(assert (not b!703271))

(check-sat)

