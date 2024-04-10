; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113930 () Bool)

(assert start!113930)

(declare-fun b!1351331 () Bool)

(declare-fun e!768489 () Bool)

(assert (=> b!1351331 (= e!768489 true)))

(declare-fun lt!597201 () Bool)

(declare-datatypes ((List!31545 0))(
  ( (Nil!31542) (Cons!31541 (h!32750 (_ BitVec 64)) (t!46203 List!31545)) )
))
(declare-fun lt!597200 () List!31545)

(declare-datatypes ((array!92112 0))(
  ( (array!92113 (arr!44504 (Array (_ BitVec 32) (_ BitVec 64))) (size!45054 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92112)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92112 (_ BitVec 32) List!31545) Bool)

(assert (=> b!1351331 (= lt!597201 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597200))))

(declare-datatypes ((Unit!44262 0))(
  ( (Unit!44263) )
))
(declare-fun lt!597199 () Unit!44262)

(declare-fun acc!759 () List!31545)

(declare-fun noDuplicateSubseq!125 (List!31545 List!31545) Unit!44262)

(assert (=> b!1351331 (= lt!597199 (noDuplicateSubseq!125 acc!759 lt!597200))))

(declare-fun b!1351332 () Bool)

(declare-fun res!896801 () Bool)

(declare-fun e!768488 () Bool)

(assert (=> b!1351332 (=> (not res!896801) (not e!768488))))

(declare-fun noDuplicate!2111 (List!31545) Bool)

(assert (=> b!1351332 (= res!896801 (noDuplicate!2111 acc!759))))

(declare-fun b!1351334 () Bool)

(declare-fun res!896789 () Bool)

(assert (=> b!1351334 (=> (not res!896789) (not e!768488))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351334 (= res!896789 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351335 () Bool)

(declare-fun res!896798 () Bool)

(assert (=> b!1351335 (=> (not res!896798) (not e!768488))))

(assert (=> b!1351335 (= res!896798 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351336 () Bool)

(declare-fun res!896793 () Bool)

(assert (=> b!1351336 (=> res!896793 e!768489)))

(assert (=> b!1351336 (= res!896793 (not (noDuplicate!2111 lt!597200)))))

(declare-fun b!1351337 () Bool)

(declare-fun res!896796 () Bool)

(assert (=> b!1351337 (=> (not res!896796) (not e!768488))))

(declare-fun contains!9254 (List!31545 (_ BitVec 64)) Bool)

(assert (=> b!1351337 (= res!896796 (not (contains!9254 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351338 () Bool)

(declare-fun res!896797 () Bool)

(assert (=> b!1351338 (=> (not res!896797) (not e!768488))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351338 (= res!896797 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45054 a!3742))))))

(declare-fun b!1351339 () Bool)

(declare-fun res!896795 () Bool)

(assert (=> b!1351339 (=> (not res!896795) (not e!768488))))

(assert (=> b!1351339 (= res!896795 (validKeyInArray!0 (select (arr!44504 a!3742) from!3120)))))

(declare-fun b!1351340 () Bool)

(declare-fun res!896791 () Bool)

(assert (=> b!1351340 (=> (not res!896791) (not e!768488))))

(assert (=> b!1351340 (= res!896791 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45054 a!3742)))))

(declare-fun b!1351341 () Bool)

(declare-fun res!896799 () Bool)

(assert (=> b!1351341 (=> res!896799 e!768489)))

(assert (=> b!1351341 (= res!896799 (contains!9254 lt!597200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!896790 () Bool)

(assert (=> start!113930 (=> (not res!896790) (not e!768488))))

(assert (=> start!113930 (= res!896790 (and (bvslt (size!45054 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45054 a!3742))))))

(assert (=> start!113930 e!768488))

(assert (=> start!113930 true))

(declare-fun array_inv!33532 (array!92112) Bool)

(assert (=> start!113930 (array_inv!33532 a!3742)))

(declare-fun b!1351333 () Bool)

(declare-fun res!896803 () Bool)

(assert (=> b!1351333 (=> (not res!896803) (not e!768488))))

(assert (=> b!1351333 (= res!896803 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31542))))

(declare-fun b!1351342 () Bool)

(declare-fun res!896792 () Bool)

(assert (=> b!1351342 (=> (not res!896792) (not e!768488))))

(assert (=> b!1351342 (= res!896792 (not (contains!9254 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351343 () Bool)

(assert (=> b!1351343 (= e!768488 (not e!768489))))

(declare-fun res!896802 () Bool)

(assert (=> b!1351343 (=> res!896802 e!768489)))

(assert (=> b!1351343 (= res!896802 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!689 (List!31545 (_ BitVec 64)) List!31545)

(assert (=> b!1351343 (= lt!597200 ($colon$colon!689 acc!759 (select (arr!44504 a!3742) from!3120)))))

(declare-fun subseq!674 (List!31545 List!31545) Bool)

(assert (=> b!1351343 (subseq!674 acc!759 acc!759)))

(declare-fun lt!597202 () Unit!44262)

(declare-fun lemmaListSubSeqRefl!0 (List!31545) Unit!44262)

(assert (=> b!1351343 (= lt!597202 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351344 () Bool)

(declare-fun res!896794 () Bool)

(assert (=> b!1351344 (=> res!896794 e!768489)))

(assert (=> b!1351344 (= res!896794 (contains!9254 lt!597200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351345 () Bool)

(declare-fun res!896800 () Bool)

(assert (=> b!1351345 (=> res!896800 e!768489)))

(assert (=> b!1351345 (= res!896800 (not (subseq!674 acc!759 lt!597200)))))

(assert (= (and start!113930 res!896790) b!1351332))

(assert (= (and b!1351332 res!896801) b!1351342))

(assert (= (and b!1351342 res!896792) b!1351337))

(assert (= (and b!1351337 res!896796) b!1351333))

(assert (= (and b!1351333 res!896803) b!1351335))

(assert (= (and b!1351335 res!896798) b!1351338))

(assert (= (and b!1351338 res!896797) b!1351334))

(assert (= (and b!1351334 res!896789) b!1351340))

(assert (= (and b!1351340 res!896791) b!1351339))

(assert (= (and b!1351339 res!896795) b!1351343))

(assert (= (and b!1351343 (not res!896802)) b!1351336))

(assert (= (and b!1351336 (not res!896793)) b!1351344))

(assert (= (and b!1351344 (not res!896794)) b!1351341))

(assert (= (and b!1351341 (not res!896799)) b!1351345))

(assert (= (and b!1351345 (not res!896800)) b!1351331))

(declare-fun m!1238377 () Bool)

(assert (=> start!113930 m!1238377))

(declare-fun m!1238379 () Bool)

(assert (=> b!1351339 m!1238379))

(assert (=> b!1351339 m!1238379))

(declare-fun m!1238381 () Bool)

(assert (=> b!1351339 m!1238381))

(declare-fun m!1238383 () Bool)

(assert (=> b!1351341 m!1238383))

(declare-fun m!1238385 () Bool)

(assert (=> b!1351336 m!1238385))

(declare-fun m!1238387 () Bool)

(assert (=> b!1351335 m!1238387))

(declare-fun m!1238389 () Bool)

(assert (=> b!1351345 m!1238389))

(declare-fun m!1238391 () Bool)

(assert (=> b!1351334 m!1238391))

(declare-fun m!1238393 () Bool)

(assert (=> b!1351337 m!1238393))

(declare-fun m!1238395 () Bool)

(assert (=> b!1351332 m!1238395))

(declare-fun m!1238397 () Bool)

(assert (=> b!1351344 m!1238397))

(declare-fun m!1238399 () Bool)

(assert (=> b!1351333 m!1238399))

(declare-fun m!1238401 () Bool)

(assert (=> b!1351331 m!1238401))

(declare-fun m!1238403 () Bool)

(assert (=> b!1351331 m!1238403))

(declare-fun m!1238405 () Bool)

(assert (=> b!1351342 m!1238405))

(assert (=> b!1351343 m!1238379))

(assert (=> b!1351343 m!1238379))

(declare-fun m!1238407 () Bool)

(assert (=> b!1351343 m!1238407))

(declare-fun m!1238409 () Bool)

(assert (=> b!1351343 m!1238409))

(declare-fun m!1238411 () Bool)

(assert (=> b!1351343 m!1238411))

(push 1)

(assert (not b!1351332))

(assert (not b!1351344))

(assert (not b!1351333))

(assert (not b!1351341))

(assert (not b!1351336))

(assert (not b!1351337))

(assert (not b!1351331))

(assert (not b!1351343))

(assert (not b!1351335))

(assert (not b!1351339))

(assert (not b!1351345))

(assert (not b!1351342))

(assert (not start!113930))

(assert (not b!1351334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

