; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113984 () Bool)

(assert start!113984)

(declare-fun b!1352378 () Bool)

(declare-fun res!897725 () Bool)

(declare-fun e!768787 () Bool)

(assert (=> b!1352378 (=> (not res!897725) (not e!768787))))

(declare-datatypes ((array!92166 0))(
  ( (array!92167 (arr!44531 (Array (_ BitVec 32) (_ BitVec 64))) (size!45081 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92166)

(declare-datatypes ((List!31572 0))(
  ( (Nil!31569) (Cons!31568 (h!32777 (_ BitVec 64)) (t!46230 List!31572)) )
))
(declare-fun arrayNoDuplicates!0 (array!92166 (_ BitVec 32) List!31572) Bool)

(assert (=> b!1352378 (= res!897725 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31569))))

(declare-fun b!1352379 () Bool)

(declare-fun res!897729 () Bool)

(assert (=> b!1352379 (=> (not res!897729) (not e!768787))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352379 (= res!897729 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352380 () Bool)

(declare-datatypes ((Unit!44334 0))(
  ( (Unit!44335) )
))
(declare-fun e!768789 () Unit!44334)

(declare-fun Unit!44336 () Unit!44334)

(assert (=> b!1352380 (= e!768789 Unit!44336)))

(declare-fun b!1352381 () Bool)

(declare-fun res!897730 () Bool)

(assert (=> b!1352381 (=> (not res!897730) (not e!768787))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1352381 (= res!897730 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45081 a!3742)))))

(declare-fun b!1352382 () Bool)

(declare-fun res!897732 () Bool)

(assert (=> b!1352382 (=> (not res!897732) (not e!768787))))

(declare-fun acc!759 () List!31572)

(assert (=> b!1352382 (= res!897732 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352383 () Bool)

(declare-fun res!897733 () Bool)

(assert (=> b!1352383 (=> (not res!897733) (not e!768787))))

(declare-fun noDuplicate!2138 (List!31572) Bool)

(assert (=> b!1352383 (= res!897733 (noDuplicate!2138 acc!759))))

(declare-fun res!897724 () Bool)

(assert (=> start!113984 (=> (not res!897724) (not e!768787))))

(assert (=> start!113984 (= res!897724 (and (bvslt (size!45081 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45081 a!3742))))))

(assert (=> start!113984 e!768787))

(assert (=> start!113984 true))

(declare-fun array_inv!33559 (array!92166) Bool)

(assert (=> start!113984 (array_inv!33559 a!3742)))

(declare-fun b!1352384 () Bool)

(declare-fun res!897731 () Bool)

(assert (=> b!1352384 (=> (not res!897731) (not e!768787))))

(declare-fun contains!9281 (List!31572 (_ BitVec 64)) Bool)

(assert (=> b!1352384 (= res!897731 (not (contains!9281 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352385 () Bool)

(declare-fun e!768790 () Bool)

(assert (=> b!1352385 (= e!768787 e!768790)))

(declare-fun res!897727 () Bool)

(assert (=> b!1352385 (=> (not res!897727) (not e!768790))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352385 (= res!897727 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597525 () Unit!44334)

(assert (=> b!1352385 (= lt!597525 e!768789)))

(declare-fun c!126767 () Bool)

(assert (=> b!1352385 (= c!126767 (validKeyInArray!0 (select (arr!44531 a!3742) from!3120)))))

(declare-fun b!1352386 () Bool)

(assert (=> b!1352386 (= e!768790 false)))

(declare-fun lt!597523 () Bool)

(assert (=> b!1352386 (= lt!597523 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352387 () Bool)

(declare-fun lt!597524 () Unit!44334)

(assert (=> b!1352387 (= e!768789 lt!597524)))

(declare-fun lt!597526 () Unit!44334)

(declare-fun lemmaListSubSeqRefl!0 (List!31572) Unit!44334)

(assert (=> b!1352387 (= lt!597526 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!701 (List!31572 List!31572) Bool)

(assert (=> b!1352387 (subseq!701 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92166 List!31572 List!31572 (_ BitVec 32)) Unit!44334)

(declare-fun $colon$colon!716 (List!31572 (_ BitVec 64)) List!31572)

(assert (=> b!1352387 (= lt!597524 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!716 acc!759 (select (arr!44531 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352387 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352388 () Bool)

(declare-fun res!897728 () Bool)

(assert (=> b!1352388 (=> (not res!897728) (not e!768787))))

(assert (=> b!1352388 (= res!897728 (not (contains!9281 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352389 () Bool)

(declare-fun res!897726 () Bool)

(assert (=> b!1352389 (=> (not res!897726) (not e!768787))))

(assert (=> b!1352389 (= res!897726 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45081 a!3742))))))

(assert (= (and start!113984 res!897724) b!1352383))

(assert (= (and b!1352383 res!897733) b!1352384))

(assert (= (and b!1352384 res!897731) b!1352388))

(assert (= (and b!1352388 res!897728) b!1352378))

(assert (= (and b!1352378 res!897725) b!1352382))

(assert (= (and b!1352382 res!897732) b!1352389))

(assert (= (and b!1352389 res!897726) b!1352379))

(assert (= (and b!1352379 res!897729) b!1352381))

(assert (= (and b!1352381 res!897730) b!1352385))

(assert (= (and b!1352385 c!126767) b!1352387))

(assert (= (and b!1352385 (not c!126767)) b!1352380))

(assert (= (and b!1352385 res!897727) b!1352386))

(declare-fun m!1239205 () Bool)

(assert (=> b!1352384 m!1239205))

(declare-fun m!1239207 () Bool)

(assert (=> b!1352387 m!1239207))

(declare-fun m!1239209 () Bool)

(assert (=> b!1352387 m!1239209))

(declare-fun m!1239211 () Bool)

(assert (=> b!1352387 m!1239211))

(declare-fun m!1239213 () Bool)

(assert (=> b!1352387 m!1239213))

(declare-fun m!1239215 () Bool)

(assert (=> b!1352387 m!1239215))

(assert (=> b!1352387 m!1239209))

(assert (=> b!1352387 m!1239211))

(declare-fun m!1239217 () Bool)

(assert (=> b!1352387 m!1239217))

(declare-fun m!1239219 () Bool)

(assert (=> start!113984 m!1239219))

(declare-fun m!1239221 () Bool)

(assert (=> b!1352382 m!1239221))

(declare-fun m!1239223 () Bool)

(assert (=> b!1352383 m!1239223))

(assert (=> b!1352385 m!1239209))

(assert (=> b!1352385 m!1239209))

(declare-fun m!1239225 () Bool)

(assert (=> b!1352385 m!1239225))

(declare-fun m!1239227 () Bool)

(assert (=> b!1352379 m!1239227))

(declare-fun m!1239229 () Bool)

(assert (=> b!1352378 m!1239229))

(declare-fun m!1239231 () Bool)

(assert (=> b!1352388 m!1239231))

(assert (=> b!1352386 m!1239215))

(push 1)

