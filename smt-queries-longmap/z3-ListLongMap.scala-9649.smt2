; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114034 () Bool)

(assert start!114034)

(declare-fun b!1353370 () Bool)

(declare-fun e!769104 () Bool)

(declare-fun e!769101 () Bool)

(assert (=> b!1353370 (= e!769104 e!769101)))

(declare-fun res!898567 () Bool)

(assert (=> b!1353370 (=> (not res!898567) (not e!769101))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1353370 (= res!898567 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31597 0))(
  ( (Nil!31594) (Cons!31593 (h!32802 (_ BitVec 64)) (t!46255 List!31597)) )
))
(declare-fun lt!597851 () List!31597)

(declare-fun acc!759 () List!31597)

(declare-datatypes ((array!92216 0))(
  ( (array!92217 (arr!44556 (Array (_ BitVec 32) (_ BitVec 64))) (size!45106 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92216)

(declare-fun $colon$colon!741 (List!31597 (_ BitVec 64)) List!31597)

(assert (=> b!1353370 (= lt!597851 ($colon$colon!741 acc!759 (select (arr!44556 a!3742) from!3120)))))

(declare-fun b!1353371 () Bool)

(declare-fun e!769103 () Bool)

(assert (=> b!1353371 (= e!769103 e!769104)))

(declare-fun res!898577 () Bool)

(assert (=> b!1353371 (=> (not res!898577) (not e!769104))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!597856 () Bool)

(assert (=> b!1353371 (= res!898577 (and (not (= from!3120 i!1404)) lt!597856))))

(declare-datatypes ((Unit!44409 0))(
  ( (Unit!44410) )
))
(declare-fun lt!597854 () Unit!44409)

(declare-fun e!769102 () Unit!44409)

(assert (=> b!1353371 (= lt!597854 e!769102)))

(declare-fun c!126842 () Bool)

(assert (=> b!1353371 (= c!126842 lt!597856)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353371 (= lt!597856 (validKeyInArray!0 (select (arr!44556 a!3742) from!3120)))))

(declare-fun b!1353372 () Bool)

(declare-fun lt!597853 () Unit!44409)

(assert (=> b!1353372 (= e!769102 lt!597853)))

(declare-fun lt!597855 () Unit!44409)

(declare-fun lemmaListSubSeqRefl!0 (List!31597) Unit!44409)

(assert (=> b!1353372 (= lt!597855 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!726 (List!31597 List!31597) Bool)

(assert (=> b!1353372 (subseq!726 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92216 List!31597 List!31597 (_ BitVec 32)) Unit!44409)

(assert (=> b!1353372 (= lt!597853 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!741 acc!759 (select (arr!44556 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92216 (_ BitVec 32) List!31597) Bool)

(assert (=> b!1353372 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353373 () Bool)

(declare-fun res!898566 () Bool)

(assert (=> b!1353373 (=> (not res!898566) (not e!769103))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353373 (= res!898566 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353374 () Bool)

(declare-fun Unit!44411 () Unit!44409)

(assert (=> b!1353374 (= e!769102 Unit!44411)))

(declare-fun b!1353375 () Bool)

(declare-fun res!898572 () Bool)

(assert (=> b!1353375 (=> (not res!898572) (not e!769103))))

(assert (=> b!1353375 (= res!898572 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45106 a!3742)))))

(declare-fun res!898569 () Bool)

(assert (=> start!114034 (=> (not res!898569) (not e!769103))))

(assert (=> start!114034 (= res!898569 (and (bvslt (size!45106 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45106 a!3742))))))

(assert (=> start!114034 e!769103))

(assert (=> start!114034 true))

(declare-fun array_inv!33584 (array!92216) Bool)

(assert (=> start!114034 (array_inv!33584 a!3742)))

(declare-fun b!1353376 () Bool)

(declare-fun res!898578 () Bool)

(assert (=> b!1353376 (=> (not res!898578) (not e!769103))))

(assert (=> b!1353376 (= res!898578 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45106 a!3742))))))

(declare-fun b!1353377 () Bool)

(declare-fun res!898576 () Bool)

(assert (=> b!1353377 (=> (not res!898576) (not e!769103))))

(assert (=> b!1353377 (= res!898576 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353378 () Bool)

(declare-fun res!898579 () Bool)

(assert (=> b!1353378 (=> (not res!898579) (not e!769101))))

(declare-fun contains!9306 (List!31597 (_ BitVec 64)) Bool)

(assert (=> b!1353378 (= res!898579 (not (contains!9306 lt!597851 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353379 () Bool)

(assert (=> b!1353379 (= e!769101 false)))

(declare-fun lt!597852 () Bool)

(assert (=> b!1353379 (= lt!597852 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597851))))

(declare-fun b!1353380 () Bool)

(declare-fun res!898573 () Bool)

(assert (=> b!1353380 (=> (not res!898573) (not e!769101))))

(assert (=> b!1353380 (= res!898573 (not (contains!9306 lt!597851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353381 () Bool)

(declare-fun res!898575 () Bool)

(assert (=> b!1353381 (=> (not res!898575) (not e!769103))))

(assert (=> b!1353381 (= res!898575 (not (contains!9306 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353382 () Bool)

(declare-fun res!898570 () Bool)

(assert (=> b!1353382 (=> (not res!898570) (not e!769103))))

(declare-fun noDuplicate!2163 (List!31597) Bool)

(assert (=> b!1353382 (= res!898570 (noDuplicate!2163 acc!759))))

(declare-fun b!1353383 () Bool)

(declare-fun res!898568 () Bool)

(assert (=> b!1353383 (=> (not res!898568) (not e!769103))))

(assert (=> b!1353383 (= res!898568 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31594))))

(declare-fun b!1353384 () Bool)

(declare-fun res!898571 () Bool)

(assert (=> b!1353384 (=> (not res!898571) (not e!769103))))

(assert (=> b!1353384 (= res!898571 (not (contains!9306 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353385 () Bool)

(declare-fun res!898574 () Bool)

(assert (=> b!1353385 (=> (not res!898574) (not e!769101))))

(assert (=> b!1353385 (= res!898574 (noDuplicate!2163 lt!597851))))

(assert (= (and start!114034 res!898569) b!1353382))

(assert (= (and b!1353382 res!898570) b!1353384))

(assert (= (and b!1353384 res!898571) b!1353381))

(assert (= (and b!1353381 res!898575) b!1353383))

(assert (= (and b!1353383 res!898568) b!1353377))

(assert (= (and b!1353377 res!898576) b!1353376))

(assert (= (and b!1353376 res!898578) b!1353373))

(assert (= (and b!1353373 res!898566) b!1353375))

(assert (= (and b!1353375 res!898572) b!1353371))

(assert (= (and b!1353371 c!126842) b!1353372))

(assert (= (and b!1353371 (not c!126842)) b!1353374))

(assert (= (and b!1353371 res!898577) b!1353370))

(assert (= (and b!1353370 res!898567) b!1353385))

(assert (= (and b!1353385 res!898574) b!1353380))

(assert (= (and b!1353380 res!898573) b!1353378))

(assert (= (and b!1353378 res!898579) b!1353379))

(declare-fun m!1240009 () Bool)

(assert (=> b!1353370 m!1240009))

(assert (=> b!1353370 m!1240009))

(declare-fun m!1240011 () Bool)

(assert (=> b!1353370 m!1240011))

(declare-fun m!1240013 () Bool)

(assert (=> b!1353372 m!1240013))

(assert (=> b!1353372 m!1240009))

(assert (=> b!1353372 m!1240011))

(declare-fun m!1240015 () Bool)

(assert (=> b!1353372 m!1240015))

(declare-fun m!1240017 () Bool)

(assert (=> b!1353372 m!1240017))

(assert (=> b!1353372 m!1240009))

(assert (=> b!1353372 m!1240011))

(declare-fun m!1240019 () Bool)

(assert (=> b!1353372 m!1240019))

(declare-fun m!1240021 () Bool)

(assert (=> b!1353382 m!1240021))

(declare-fun m!1240023 () Bool)

(assert (=> b!1353378 m!1240023))

(declare-fun m!1240025 () Bool)

(assert (=> b!1353380 m!1240025))

(assert (=> b!1353371 m!1240009))

(assert (=> b!1353371 m!1240009))

(declare-fun m!1240027 () Bool)

(assert (=> b!1353371 m!1240027))

(declare-fun m!1240029 () Bool)

(assert (=> b!1353377 m!1240029))

(declare-fun m!1240031 () Bool)

(assert (=> start!114034 m!1240031))

(declare-fun m!1240033 () Bool)

(assert (=> b!1353385 m!1240033))

(declare-fun m!1240035 () Bool)

(assert (=> b!1353379 m!1240035))

(declare-fun m!1240037 () Bool)

(assert (=> b!1353381 m!1240037))

(declare-fun m!1240039 () Bool)

(assert (=> b!1353384 m!1240039))

(declare-fun m!1240041 () Bool)

(assert (=> b!1353373 m!1240041))

(declare-fun m!1240043 () Bool)

(assert (=> b!1353383 m!1240043))

(check-sat (not b!1353378) (not b!1353372) (not b!1353385) (not b!1353380) (not b!1353377) (not b!1353371) (not b!1353373) (not b!1353383) (not b!1353381) (not b!1353379) (not start!114034) (not b!1353370) (not b!1353382) (not b!1353384))
(check-sat)
