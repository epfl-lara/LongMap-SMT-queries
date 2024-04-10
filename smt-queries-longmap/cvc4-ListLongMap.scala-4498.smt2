; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62460 () Bool)

(assert start!62460)

(declare-fun b!702314 () Bool)

(declare-fun res!466129 () Bool)

(declare-fun e!397490 () Bool)

(assert (=> b!702314 (=> (not res!466129) (not e!397490))))

(declare-datatypes ((List!13267 0))(
  ( (Nil!13264) (Cons!13263 (h!14308 (_ BitVec 64)) (t!19549 List!13267)) )
))
(declare-fun lt!317687 () List!13267)

(declare-fun noDuplicate!1091 (List!13267) Bool)

(assert (=> b!702314 (= res!466129 (noDuplicate!1091 lt!317687))))

(declare-fun b!702315 () Bool)

(declare-fun res!466124 () Bool)

(declare-fun e!397492 () Bool)

(assert (=> b!702315 (=> (not res!466124) (not e!397492))))

(declare-fun acc!652 () List!13267)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3844 (List!13267 (_ BitVec 64)) Bool)

(assert (=> b!702315 (= res!466124 (not (contains!3844 acc!652 k!2824)))))

(declare-fun b!702316 () Bool)

(declare-fun res!466150 () Bool)

(assert (=> b!702316 (=> (not res!466150) (not e!397490))))

(declare-fun lt!317688 () List!13267)

(declare-fun subseq!289 (List!13267 List!13267) Bool)

(assert (=> b!702316 (= res!466150 (subseq!289 lt!317687 lt!317688))))

(declare-fun res!466128 () Bool)

(assert (=> start!62460 (=> (not res!466128) (not e!397492))))

(declare-datatypes ((array!40139 0))(
  ( (array!40140 (arr!19226 (Array (_ BitVec 32) (_ BitVec 64))) (size!19611 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40139)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62460 (= res!466128 (and (bvslt (size!19611 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19611 a!3591))))))

(assert (=> start!62460 e!397492))

(assert (=> start!62460 true))

(declare-fun array_inv!15022 (array!40139) Bool)

(assert (=> start!62460 (array_inv!15022 a!3591)))

(declare-fun b!702317 () Bool)

(assert (=> b!702317 (= e!397492 e!397490)))

(declare-fun res!466148 () Bool)

(assert (=> b!702317 (=> (not res!466148) (not e!397490))))

(assert (=> b!702317 (= res!466148 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13267)

(declare-fun $colon$colon!487 (List!13267 (_ BitVec 64)) List!13267)

(assert (=> b!702317 (= lt!317688 ($colon$colon!487 newAcc!49 (select (arr!19226 a!3591) from!2969)))))

(assert (=> b!702317 (= lt!317687 ($colon$colon!487 acc!652 (select (arr!19226 a!3591) from!2969)))))

(declare-fun b!702318 () Bool)

(assert (=> b!702318 (= e!397490 (not (bvsle from!2969 (size!19611 a!3591))))))

(declare-fun arrayNoDuplicates!0 (array!40139 (_ BitVec 32) List!13267) Bool)

(assert (=> b!702318 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317688)))

(declare-datatypes ((Unit!24586 0))(
  ( (Unit!24587) )
))
(declare-fun lt!317686 () Unit!24586)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40139 (_ BitVec 64) (_ BitVec 32) List!13267 List!13267) Unit!24586)

(assert (=> b!702318 (= lt!317686 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317687 lt!317688))))

(declare-fun b!702319 () Bool)

(declare-fun res!466151 () Bool)

(assert (=> b!702319 (=> (not res!466151) (not e!397492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702319 (= res!466151 (validKeyInArray!0 (select (arr!19226 a!3591) from!2969)))))

(declare-fun b!702320 () Bool)

(declare-fun res!466149 () Bool)

(assert (=> b!702320 (=> (not res!466149) (not e!397490))))

(assert (=> b!702320 (= res!466149 (not (contains!3844 lt!317687 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702321 () Bool)

(declare-fun res!466135 () Bool)

(assert (=> b!702321 (=> (not res!466135) (not e!397490))))

(assert (=> b!702321 (= res!466135 (not (contains!3844 lt!317688 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702322 () Bool)

(declare-fun res!466130 () Bool)

(assert (=> b!702322 (=> (not res!466130) (not e!397492))))

(assert (=> b!702322 (= res!466130 (noDuplicate!1091 acc!652))))

(declare-fun b!702323 () Bool)

(declare-fun res!466126 () Bool)

(assert (=> b!702323 (=> (not res!466126) (not e!397490))))

(assert (=> b!702323 (= res!466126 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317687))))

(declare-fun b!702324 () Bool)

(declare-fun res!466131 () Bool)

(assert (=> b!702324 (=> (not res!466131) (not e!397492))))

(assert (=> b!702324 (= res!466131 (noDuplicate!1091 newAcc!49))))

(declare-fun b!702325 () Bool)

(declare-fun res!466134 () Bool)

(assert (=> b!702325 (=> (not res!466134) (not e!397490))))

(assert (=> b!702325 (= res!466134 (noDuplicate!1091 lt!317688))))

(declare-fun b!702326 () Bool)

(declare-fun res!466139 () Bool)

(assert (=> b!702326 (=> (not res!466139) (not e!397492))))

(assert (=> b!702326 (= res!466139 (subseq!289 acc!652 newAcc!49))))

(declare-fun b!702327 () Bool)

(declare-fun res!466138 () Bool)

(assert (=> b!702327 (=> (not res!466138) (not e!397492))))

(assert (=> b!702327 (= res!466138 (not (contains!3844 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702328 () Bool)

(declare-fun res!466146 () Bool)

(assert (=> b!702328 (=> (not res!466146) (not e!397492))))

(assert (=> b!702328 (= res!466146 (contains!3844 newAcc!49 k!2824))))

(declare-fun b!702329 () Bool)

(declare-fun res!466141 () Bool)

(assert (=> b!702329 (=> (not res!466141) (not e!397492))))

(assert (=> b!702329 (= res!466141 (validKeyInArray!0 k!2824))))

(declare-fun b!702330 () Bool)

(declare-fun res!466145 () Bool)

(assert (=> b!702330 (=> (not res!466145) (not e!397490))))

(assert (=> b!702330 (= res!466145 (not (contains!3844 lt!317687 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702331 () Bool)

(declare-fun res!466133 () Bool)

(assert (=> b!702331 (=> (not res!466133) (not e!397492))))

(declare-fun arrayContainsKey!0 (array!40139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702331 (= res!466133 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!702332 () Bool)

(declare-fun res!466147 () Bool)

(assert (=> b!702332 (=> (not res!466147) (not e!397490))))

(assert (=> b!702332 (= res!466147 (contains!3844 lt!317688 k!2824))))

(declare-fun b!702333 () Bool)

(declare-fun res!466152 () Bool)

(assert (=> b!702333 (=> (not res!466152) (not e!397492))))

(assert (=> b!702333 (= res!466152 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19611 a!3591)))))

(declare-fun b!702334 () Bool)

(declare-fun res!466142 () Bool)

(assert (=> b!702334 (=> (not res!466142) (not e!397490))))

(assert (=> b!702334 (= res!466142 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702335 () Bool)

(declare-fun res!466144 () Bool)

(assert (=> b!702335 (=> (not res!466144) (not e!397490))))

(assert (=> b!702335 (= res!466144 (not (contains!3844 lt!317688 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702336 () Bool)

(declare-fun res!466137 () Bool)

(assert (=> b!702336 (=> (not res!466137) (not e!397492))))

(declare-fun -!254 (List!13267 (_ BitVec 64)) List!13267)

(assert (=> b!702336 (= res!466137 (= (-!254 newAcc!49 k!2824) acc!652))))

(declare-fun b!702337 () Bool)

(declare-fun res!466125 () Bool)

(assert (=> b!702337 (=> (not res!466125) (not e!397492))))

(assert (=> b!702337 (= res!466125 (not (contains!3844 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702338 () Bool)

(declare-fun res!466143 () Bool)

(assert (=> b!702338 (=> (not res!466143) (not e!397492))))

(assert (=> b!702338 (= res!466143 (not (contains!3844 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702339 () Bool)

(declare-fun res!466140 () Bool)

(assert (=> b!702339 (=> (not res!466140) (not e!397490))))

(assert (=> b!702339 (= res!466140 (= (-!254 lt!317688 k!2824) lt!317687))))

(declare-fun b!702340 () Bool)

(declare-fun res!466127 () Bool)

(assert (=> b!702340 (=> (not res!466127) (not e!397490))))

(assert (=> b!702340 (= res!466127 (not (contains!3844 lt!317687 k!2824)))))

(declare-fun b!702341 () Bool)

(declare-fun res!466132 () Bool)

(assert (=> b!702341 (=> (not res!466132) (not e!397492))))

(assert (=> b!702341 (= res!466132 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702342 () Bool)

(declare-fun res!466136 () Bool)

(assert (=> b!702342 (=> (not res!466136) (not e!397492))))

(assert (=> b!702342 (= res!466136 (not (contains!3844 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62460 res!466128) b!702322))

(assert (= (and b!702322 res!466130) b!702324))

(assert (= (and b!702324 res!466131) b!702327))

(assert (= (and b!702327 res!466138) b!702337))

(assert (= (and b!702337 res!466125) b!702331))

(assert (= (and b!702331 res!466133) b!702315))

(assert (= (and b!702315 res!466124) b!702329))

(assert (= (and b!702329 res!466141) b!702341))

(assert (= (and b!702341 res!466132) b!702326))

(assert (= (and b!702326 res!466139) b!702328))

(assert (= (and b!702328 res!466146) b!702336))

(assert (= (and b!702336 res!466137) b!702342))

(assert (= (and b!702342 res!466136) b!702338))

(assert (= (and b!702338 res!466143) b!702333))

(assert (= (and b!702333 res!466152) b!702319))

(assert (= (and b!702319 res!466151) b!702317))

(assert (= (and b!702317 res!466148) b!702314))

(assert (= (and b!702314 res!466129) b!702325))

(assert (= (and b!702325 res!466134) b!702330))

(assert (= (and b!702330 res!466145) b!702320))

(assert (= (and b!702320 res!466149) b!702334))

(assert (= (and b!702334 res!466142) b!702340))

(assert (= (and b!702340 res!466127) b!702323))

(assert (= (and b!702323 res!466126) b!702316))

(assert (= (and b!702316 res!466150) b!702332))

(assert (= (and b!702332 res!466147) b!702339))

(assert (= (and b!702339 res!466140) b!702321))

(assert (= (and b!702321 res!466135) b!702335))

(assert (= (and b!702335 res!466144) b!702318))

(declare-fun m!661443 () Bool)

(assert (=> b!702338 m!661443))

(declare-fun m!661445 () Bool)

(assert (=> b!702316 m!661445))

(declare-fun m!661447 () Bool)

(assert (=> b!702324 m!661447))

(declare-fun m!661449 () Bool)

(assert (=> start!62460 m!661449))

(declare-fun m!661451 () Bool)

(assert (=> b!702329 m!661451))

(declare-fun m!661453 () Bool)

(assert (=> b!702340 m!661453))

(declare-fun m!661455 () Bool)

(assert (=> b!702328 m!661455))

(declare-fun m!661457 () Bool)

(assert (=> b!702342 m!661457))

(declare-fun m!661459 () Bool)

(assert (=> b!702318 m!661459))

(declare-fun m!661461 () Bool)

(assert (=> b!702318 m!661461))

(declare-fun m!661463 () Bool)

(assert (=> b!702321 m!661463))

(declare-fun m!661465 () Bool)

(assert (=> b!702337 m!661465))

(declare-fun m!661467 () Bool)

(assert (=> b!702320 m!661467))

(declare-fun m!661469 () Bool)

(assert (=> b!702323 m!661469))

(declare-fun m!661471 () Bool)

(assert (=> b!702341 m!661471))

(declare-fun m!661473 () Bool)

(assert (=> b!702330 m!661473))

(declare-fun m!661475 () Bool)

(assert (=> b!702317 m!661475))

(assert (=> b!702317 m!661475))

(declare-fun m!661477 () Bool)

(assert (=> b!702317 m!661477))

(assert (=> b!702317 m!661475))

(declare-fun m!661479 () Bool)

(assert (=> b!702317 m!661479))

(declare-fun m!661481 () Bool)

(assert (=> b!702325 m!661481))

(declare-fun m!661483 () Bool)

(assert (=> b!702327 m!661483))

(declare-fun m!661485 () Bool)

(assert (=> b!702335 m!661485))

(assert (=> b!702319 m!661475))

(assert (=> b!702319 m!661475))

(declare-fun m!661487 () Bool)

(assert (=> b!702319 m!661487))

(declare-fun m!661489 () Bool)

(assert (=> b!702326 m!661489))

(declare-fun m!661491 () Bool)

(assert (=> b!702339 m!661491))

(declare-fun m!661493 () Bool)

(assert (=> b!702322 m!661493))

(declare-fun m!661495 () Bool)

(assert (=> b!702331 m!661495))

(declare-fun m!661497 () Bool)

(assert (=> b!702332 m!661497))

(declare-fun m!661499 () Bool)

(assert (=> b!702336 m!661499))

(declare-fun m!661501 () Bool)

(assert (=> b!702334 m!661501))

(declare-fun m!661503 () Bool)

(assert (=> b!702314 m!661503))

(declare-fun m!661505 () Bool)

(assert (=> b!702315 m!661505))

(push 1)

(assert (not b!702323))

(assert (not b!702322))

(assert (not b!702315))

(assert (not b!702324))

(assert (not b!702342))

(assert (not b!702316))

(assert (not b!702325))

(assert (not b!702328))

(assert (not b!702320))

(assert (not b!702341))

(assert (not b!702326))

(assert (not b!702318))

(assert (not b!702314))

(assert (not start!62460))

(assert (not b!702327))

(assert (not b!702330))

(assert (not b!702321))

(assert (not b!702334))

(assert (not b!702331))

(assert (not b!702336))

(assert (not b!702317))

(assert (not b!702340))

(assert (not b!702319))

(assert (not b!702329))

(assert (not b!702338))

(assert (not b!702332))

(assert (not b!702337))

(assert (not b!702339))

(assert (not b!702335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

