; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102578 () Bool)

(assert start!102578)

(declare-fun b!1233293 () Bool)

(declare-fun res!821514 () Bool)

(declare-fun e!699624 () Bool)

(assert (=> b!1233293 (=> res!821514 e!699624)))

(declare-datatypes ((List!27137 0))(
  ( (Nil!27134) (Cons!27133 (h!28342 (_ BitVec 64)) (t!40600 List!27137)) )
))
(declare-fun lt!559658 () List!27137)

(declare-fun contains!7199 (List!27137 (_ BitVec 64)) Bool)

(assert (=> b!1233293 (= res!821514 (contains!7199 lt!559658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233294 () Bool)

(declare-fun res!821518 () Bool)

(assert (=> b!1233294 (=> res!821518 e!699624)))

(declare-fun noDuplicate!1796 (List!27137) Bool)

(assert (=> b!1233294 (= res!821518 (not (noDuplicate!1796 lt!559658)))))

(declare-fun b!1233295 () Bool)

(declare-fun e!699625 () Bool)

(declare-datatypes ((array!79507 0))(
  ( (array!79508 (arr!38364 (Array (_ BitVec 32) (_ BitVec 64))) (size!38900 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79507)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79507 (_ BitVec 32) List!27137) Bool)

(assert (=> b!1233295 (= e!699625 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38364 a!3806) from!3184) Nil!27134)))))

(declare-fun b!1233296 () Bool)

(declare-fun e!699626 () Bool)

(assert (=> b!1233296 (= e!699626 (not e!699624))))

(declare-fun res!821513 () Bool)

(assert (=> b!1233296 (=> res!821513 e!699624)))

(assert (=> b!1233296 (= res!821513 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1233296 (= lt!559658 (Cons!27133 (select (arr!38364 a!3806) from!3184) Nil!27134))))

(assert (=> b!1233296 e!699625))

(declare-fun res!821519 () Bool)

(assert (=> b!1233296 (=> (not res!821519) (not e!699625))))

(assert (=> b!1233296 (= res!821519 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27134))))

(declare-fun acc!823 () List!27137)

(declare-datatypes ((Unit!40834 0))(
  ( (Unit!40835) )
))
(declare-fun lt!559657 () Unit!40834)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79507 List!27137 List!27137 (_ BitVec 32)) Unit!40834)

(assert (=> b!1233296 (= lt!559657 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27134 from!3184))))

(assert (=> b!1233296 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38364 a!3806) from!3184) acc!823))))

(declare-fun b!1233297 () Bool)

(declare-fun res!821521 () Bool)

(assert (=> b!1233297 (=> (not res!821521) (not e!699626))))

(assert (=> b!1233297 (= res!821521 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38900 a!3806)) (bvslt from!3184 (size!38900 a!3806))))))

(declare-fun b!1233298 () Bool)

(declare-fun res!821511 () Bool)

(assert (=> b!1233298 (=> (not res!821511) (not e!699626))))

(assert (=> b!1233298 (= res!821511 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233299 () Bool)

(declare-fun res!821517 () Bool)

(assert (=> b!1233299 (=> (not res!821517) (not e!699626))))

(assert (=> b!1233299 (= res!821517 (not (contains!7199 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233300 () Bool)

(declare-fun res!821510 () Bool)

(assert (=> b!1233300 (=> (not res!821510) (not e!699626))))

(assert (=> b!1233300 (= res!821510 (noDuplicate!1796 acc!823))))

(declare-fun b!1233302 () Bool)

(declare-fun res!821520 () Bool)

(assert (=> b!1233302 (=> (not res!821520) (not e!699626))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233302 (= res!821520 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233303 () Bool)

(declare-fun res!821512 () Bool)

(assert (=> b!1233303 (=> (not res!821512) (not e!699626))))

(assert (=> b!1233303 (= res!821512 (not (contains!7199 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233304 () Bool)

(declare-fun res!821509 () Bool)

(assert (=> b!1233304 (=> (not res!821509) (not e!699626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233304 (= res!821509 (validKeyInArray!0 (select (arr!38364 a!3806) from!3184)))))

(declare-fun b!1233305 () Bool)

(declare-fun res!821515 () Bool)

(assert (=> b!1233305 (=> (not res!821515) (not e!699626))))

(assert (=> b!1233305 (= res!821515 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233301 () Bool)

(assert (=> b!1233301 (= e!699624 true)))

(declare-fun lt!559656 () Bool)

(assert (=> b!1233301 (= lt!559656 (contains!7199 lt!559658 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!821516 () Bool)

(assert (=> start!102578 (=> (not res!821516) (not e!699626))))

(assert (=> start!102578 (= res!821516 (bvslt (size!38900 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102578 e!699626))

(declare-fun array_inv!29212 (array!79507) Bool)

(assert (=> start!102578 (array_inv!29212 a!3806)))

(assert (=> start!102578 true))

(assert (= (and start!102578 res!821516) b!1233305))

(assert (= (and b!1233305 res!821515) b!1233297))

(assert (= (and b!1233297 res!821521) b!1233300))

(assert (= (and b!1233300 res!821510) b!1233303))

(assert (= (and b!1233303 res!821512) b!1233299))

(assert (= (and b!1233299 res!821517) b!1233302))

(assert (= (and b!1233302 res!821520) b!1233298))

(assert (= (and b!1233298 res!821511) b!1233304))

(assert (= (and b!1233304 res!821509) b!1233296))

(assert (= (and b!1233296 res!821519) b!1233295))

(assert (= (and b!1233296 (not res!821513)) b!1233294))

(assert (= (and b!1233294 (not res!821518)) b!1233293))

(assert (= (and b!1233293 (not res!821514)) b!1233301))

(declare-fun m!1137387 () Bool)

(assert (=> start!102578 m!1137387))

(declare-fun m!1137389 () Bool)

(assert (=> b!1233293 m!1137389))

(declare-fun m!1137391 () Bool)

(assert (=> b!1233302 m!1137391))

(declare-fun m!1137393 () Bool)

(assert (=> b!1233304 m!1137393))

(assert (=> b!1233304 m!1137393))

(declare-fun m!1137395 () Bool)

(assert (=> b!1233304 m!1137395))

(declare-fun m!1137397 () Bool)

(assert (=> b!1233305 m!1137397))

(declare-fun m!1137399 () Bool)

(assert (=> b!1233301 m!1137399))

(declare-fun m!1137401 () Bool)

(assert (=> b!1233294 m!1137401))

(declare-fun m!1137403 () Bool)

(assert (=> b!1233303 m!1137403))

(declare-fun m!1137405 () Bool)

(assert (=> b!1233298 m!1137405))

(assert (=> b!1233296 m!1137393))

(declare-fun m!1137407 () Bool)

(assert (=> b!1233296 m!1137407))

(declare-fun m!1137409 () Bool)

(assert (=> b!1233296 m!1137409))

(declare-fun m!1137411 () Bool)

(assert (=> b!1233296 m!1137411))

(assert (=> b!1233295 m!1137393))

(declare-fun m!1137413 () Bool)

(assert (=> b!1233295 m!1137413))

(declare-fun m!1137415 () Bool)

(assert (=> b!1233299 m!1137415))

(declare-fun m!1137417 () Bool)

(assert (=> b!1233300 m!1137417))

(check-sat (not b!1233305) (not b!1233299) (not b!1233300) (not b!1233294) (not b!1233304) (not b!1233298) (not b!1233293) (not b!1233301) (not b!1233295) (not b!1233302) (not b!1233303) (not b!1233296) (not start!102578))
(check-sat)
