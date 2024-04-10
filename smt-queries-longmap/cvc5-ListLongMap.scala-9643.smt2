; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113996 () Bool)

(assert start!113996)

(declare-fun b!1352594 () Bool)

(declare-fun res!897904 () Bool)

(declare-fun e!768859 () Bool)

(assert (=> b!1352594 (=> (not res!897904) (not e!768859))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92178 0))(
  ( (array!92179 (arr!44537 (Array (_ BitVec 32) (_ BitVec 64))) (size!45087 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92178)

(assert (=> b!1352594 (= res!897904 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45087 a!3742))))))

(declare-fun b!1352595 () Bool)

(declare-fun res!897910 () Bool)

(assert (=> b!1352595 (=> (not res!897910) (not e!768859))))

(declare-datatypes ((List!31578 0))(
  ( (Nil!31575) (Cons!31574 (h!32783 (_ BitVec 64)) (t!46236 List!31578)) )
))
(declare-fun acc!759 () List!31578)

(declare-fun contains!9287 (List!31578 (_ BitVec 64)) Bool)

(assert (=> b!1352595 (= res!897910 (not (contains!9287 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352596 () Bool)

(declare-fun res!897906 () Bool)

(assert (=> b!1352596 (=> (not res!897906) (not e!768859))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92178 (_ BitVec 32) List!31578) Bool)

(assert (=> b!1352596 (= res!897906 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352597 () Bool)

(declare-fun res!897907 () Bool)

(assert (=> b!1352597 (=> (not res!897907) (not e!768859))))

(assert (=> b!1352597 (= res!897907 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45087 a!3742)))))

(declare-fun b!1352598 () Bool)

(declare-fun res!897908 () Bool)

(assert (=> b!1352598 (=> (not res!897908) (not e!768859))))

(assert (=> b!1352598 (= res!897908 (not (contains!9287 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352599 () Bool)

(declare-fun e!768860 () Bool)

(assert (=> b!1352599 (= e!768859 e!768860)))

(declare-fun res!897905 () Bool)

(assert (=> b!1352599 (=> (not res!897905) (not e!768860))))

(assert (=> b!1352599 (= res!897905 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44352 0))(
  ( (Unit!44353) )
))
(declare-fun lt!597597 () Unit!44352)

(declare-fun e!768862 () Unit!44352)

(assert (=> b!1352599 (= lt!597597 e!768862)))

(declare-fun c!126785 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352599 (= c!126785 (validKeyInArray!0 (select (arr!44537 a!3742) from!3120)))))

(declare-fun b!1352600 () Bool)

(declare-fun Unit!44354 () Unit!44352)

(assert (=> b!1352600 (= e!768862 Unit!44354)))

(declare-fun b!1352601 () Bool)

(declare-fun res!897912 () Bool)

(assert (=> b!1352601 (=> (not res!897912) (not e!768859))))

(assert (=> b!1352601 (= res!897912 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31575))))

(declare-fun b!1352602 () Bool)

(declare-fun lt!597595 () Unit!44352)

(assert (=> b!1352602 (= e!768862 lt!597595)))

(declare-fun lt!597596 () Unit!44352)

(declare-fun lemmaListSubSeqRefl!0 (List!31578) Unit!44352)

(assert (=> b!1352602 (= lt!597596 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!707 (List!31578 List!31578) Bool)

(assert (=> b!1352602 (subseq!707 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92178 List!31578 List!31578 (_ BitVec 32)) Unit!44352)

(declare-fun $colon$colon!722 (List!31578 (_ BitVec 64)) List!31578)

(assert (=> b!1352602 (= lt!597595 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!722 acc!759 (select (arr!44537 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352602 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!897911 () Bool)

(assert (=> start!113996 (=> (not res!897911) (not e!768859))))

(assert (=> start!113996 (= res!897911 (and (bvslt (size!45087 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45087 a!3742))))))

(assert (=> start!113996 e!768859))

(assert (=> start!113996 true))

(declare-fun array_inv!33565 (array!92178) Bool)

(assert (=> start!113996 (array_inv!33565 a!3742)))

(declare-fun b!1352603 () Bool)

(assert (=> b!1352603 (= e!768860 false)))

(declare-fun lt!597598 () Bool)

(assert (=> b!1352603 (= lt!597598 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352604 () Bool)

(declare-fun res!897913 () Bool)

(assert (=> b!1352604 (=> (not res!897913) (not e!768859))))

(declare-fun noDuplicate!2144 (List!31578) Bool)

(assert (=> b!1352604 (= res!897913 (noDuplicate!2144 acc!759))))

(declare-fun b!1352605 () Bool)

(declare-fun res!897909 () Bool)

(assert (=> b!1352605 (=> (not res!897909) (not e!768859))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352605 (= res!897909 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113996 res!897911) b!1352604))

(assert (= (and b!1352604 res!897913) b!1352598))

(assert (= (and b!1352598 res!897908) b!1352595))

(assert (= (and b!1352595 res!897910) b!1352601))

(assert (= (and b!1352601 res!897912) b!1352596))

(assert (= (and b!1352596 res!897906) b!1352594))

(assert (= (and b!1352594 res!897904) b!1352605))

(assert (= (and b!1352605 res!897909) b!1352597))

(assert (= (and b!1352597 res!897907) b!1352599))

(assert (= (and b!1352599 c!126785) b!1352602))

(assert (= (and b!1352599 (not c!126785)) b!1352600))

(assert (= (and b!1352599 res!897905) b!1352603))

(declare-fun m!1239373 () Bool)

(assert (=> b!1352595 m!1239373))

(declare-fun m!1239375 () Bool)

(assert (=> b!1352599 m!1239375))

(assert (=> b!1352599 m!1239375))

(declare-fun m!1239377 () Bool)

(assert (=> b!1352599 m!1239377))

(declare-fun m!1239379 () Bool)

(assert (=> b!1352602 m!1239379))

(assert (=> b!1352602 m!1239375))

(declare-fun m!1239381 () Bool)

(assert (=> b!1352602 m!1239381))

(declare-fun m!1239383 () Bool)

(assert (=> b!1352602 m!1239383))

(declare-fun m!1239385 () Bool)

(assert (=> b!1352602 m!1239385))

(assert (=> b!1352602 m!1239375))

(assert (=> b!1352602 m!1239381))

(declare-fun m!1239387 () Bool)

(assert (=> b!1352602 m!1239387))

(declare-fun m!1239389 () Bool)

(assert (=> b!1352601 m!1239389))

(declare-fun m!1239391 () Bool)

(assert (=> b!1352605 m!1239391))

(declare-fun m!1239393 () Bool)

(assert (=> b!1352604 m!1239393))

(declare-fun m!1239395 () Bool)

(assert (=> b!1352598 m!1239395))

(declare-fun m!1239397 () Bool)

(assert (=> b!1352596 m!1239397))

(assert (=> b!1352603 m!1239385))

(declare-fun m!1239399 () Bool)

(assert (=> start!113996 m!1239399))

(push 1)

