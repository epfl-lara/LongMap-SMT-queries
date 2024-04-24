; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114226 () Bool)

(assert start!114226)

(declare-fun b!1354003 () Bool)

(declare-datatypes ((Unit!44300 0))(
  ( (Unit!44301) )
))
(declare-fun e!769740 () Unit!44300)

(declare-fun lt!598109 () Unit!44300)

(assert (=> b!1354003 (= e!769740 lt!598109)))

(declare-fun lt!598110 () Unit!44300)

(declare-datatypes ((List!31621 0))(
  ( (Nil!31618) (Cons!31617 (h!32835 (_ BitVec 64)) (t!46271 List!31621)) )
))
(declare-fun acc!759 () List!31621)

(declare-fun lemmaListSubSeqRefl!0 (List!31621) Unit!44300)

(assert (=> b!1354003 (= lt!598110 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!710 (List!31621 List!31621) Bool)

(assert (=> b!1354003 (subseq!710 acc!759 acc!759)))

(declare-datatypes ((array!92299 0))(
  ( (array!92300 (arr!44593 (Array (_ BitVec 32) (_ BitVec 64))) (size!45144 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92299)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92299 List!31621 List!31621 (_ BitVec 32)) Unit!44300)

(declare-fun $colon$colon!724 (List!31621 (_ BitVec 64)) List!31621)

(assert (=> b!1354003 (= lt!598109 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!724 acc!759 (select (arr!44593 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92299 (_ BitVec 32) List!31621) Bool)

(assert (=> b!1354003 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354004 () Bool)

(declare-fun res!898524 () Bool)

(declare-fun e!769741 () Bool)

(assert (=> b!1354004 (=> (not res!898524) (not e!769741))))

(declare-fun noDuplicate!2164 (List!31621) Bool)

(assert (=> b!1354004 (= res!898524 (noDuplicate!2164 acc!759))))

(declare-fun b!1354005 () Bool)

(declare-fun res!898515 () Bool)

(assert (=> b!1354005 (=> (not res!898515) (not e!769741))))

(assert (=> b!1354005 (= res!898515 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31618))))

(declare-fun b!1354006 () Bool)

(declare-fun res!898520 () Bool)

(assert (=> b!1354006 (=> (not res!898520) (not e!769741))))

(declare-fun contains!9333 (List!31621 (_ BitVec 64)) Bool)

(assert (=> b!1354006 (= res!898520 (not (contains!9333 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354007 () Bool)

(declare-fun res!898517 () Bool)

(assert (=> b!1354007 (=> (not res!898517) (not e!769741))))

(assert (=> b!1354007 (= res!898517 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45144 a!3742)))))

(declare-fun res!898521 () Bool)

(assert (=> start!114226 (=> (not res!898521) (not e!769741))))

(assert (=> start!114226 (= res!898521 (and (bvslt (size!45144 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45144 a!3742))))))

(assert (=> start!114226 e!769741))

(assert (=> start!114226 true))

(declare-fun array_inv!33874 (array!92299) Bool)

(assert (=> start!114226 (array_inv!33874 a!3742)))

(declare-fun b!1354008 () Bool)

(declare-fun res!898516 () Bool)

(assert (=> b!1354008 (=> (not res!898516) (not e!769741))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354008 (= res!898516 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45144 a!3742))))))

(declare-fun b!1354009 () Bool)

(declare-fun res!898514 () Bool)

(declare-fun e!769739 () Bool)

(assert (=> b!1354009 (=> (not res!898514) (not e!769739))))

(assert (=> b!1354009 (= res!898514 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1354010 () Bool)

(assert (=> b!1354010 (= e!769741 e!769739)))

(declare-fun res!898522 () Bool)

(assert (=> b!1354010 (=> (not res!898522) (not e!769739))))

(assert (=> b!1354010 (= res!898522 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598107 () Unit!44300)

(assert (=> b!1354010 (= lt!598107 e!769740)))

(declare-fun c!127192 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354010 (= c!127192 (validKeyInArray!0 (select (arr!44593 a!3742) from!3120)))))

(declare-fun b!1354011 () Bool)

(declare-fun Unit!44302 () Unit!44300)

(assert (=> b!1354011 (= e!769740 Unit!44302)))

(declare-fun b!1354012 () Bool)

(declare-fun res!898518 () Bool)

(assert (=> b!1354012 (=> (not res!898518) (not e!769741))))

(assert (=> b!1354012 (= res!898518 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354013 () Bool)

(declare-fun res!898523 () Bool)

(assert (=> b!1354013 (=> (not res!898523) (not e!769741))))

(assert (=> b!1354013 (= res!898523 (not (contains!9333 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354014 () Bool)

(declare-fun res!898519 () Bool)

(assert (=> b!1354014 (=> (not res!898519) (not e!769741))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354014 (= res!898519 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354015 () Bool)

(assert (=> b!1354015 (= e!769739 (not (bvsle from!3120 (size!45144 a!3742))))))

(assert (=> b!1354015 (arrayNoDuplicates!0 (array!92300 (store (arr!44593 a!3742) i!1404 l!3587) (size!45144 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598108 () Unit!44300)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31621) Unit!44300)

(assert (=> b!1354015 (= lt!598108 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114226 res!898521) b!1354004))

(assert (= (and b!1354004 res!898524) b!1354013))

(assert (= (and b!1354013 res!898523) b!1354006))

(assert (= (and b!1354006 res!898520) b!1354005))

(assert (= (and b!1354005 res!898515) b!1354012))

(assert (= (and b!1354012 res!898518) b!1354008))

(assert (= (and b!1354008 res!898516) b!1354014))

(assert (= (and b!1354014 res!898519) b!1354007))

(assert (= (and b!1354007 res!898517) b!1354010))

(assert (= (and b!1354010 c!127192) b!1354003))

(assert (= (and b!1354010 (not c!127192)) b!1354011))

(assert (= (and b!1354010 res!898522) b!1354009))

(assert (= (and b!1354009 res!898514) b!1354015))

(declare-fun m!1241053 () Bool)

(assert (=> b!1354015 m!1241053))

(declare-fun m!1241055 () Bool)

(assert (=> b!1354015 m!1241055))

(declare-fun m!1241057 () Bool)

(assert (=> b!1354015 m!1241057))

(declare-fun m!1241059 () Bool)

(assert (=> b!1354012 m!1241059))

(declare-fun m!1241061 () Bool)

(assert (=> b!1354004 m!1241061))

(declare-fun m!1241063 () Bool)

(assert (=> b!1354014 m!1241063))

(declare-fun m!1241065 () Bool)

(assert (=> b!1354009 m!1241065))

(declare-fun m!1241067 () Bool)

(assert (=> b!1354005 m!1241067))

(declare-fun m!1241069 () Bool)

(assert (=> b!1354010 m!1241069))

(assert (=> b!1354010 m!1241069))

(declare-fun m!1241071 () Bool)

(assert (=> b!1354010 m!1241071))

(declare-fun m!1241073 () Bool)

(assert (=> b!1354013 m!1241073))

(declare-fun m!1241075 () Bool)

(assert (=> b!1354003 m!1241075))

(assert (=> b!1354003 m!1241069))

(declare-fun m!1241077 () Bool)

(assert (=> b!1354003 m!1241077))

(declare-fun m!1241079 () Bool)

(assert (=> b!1354003 m!1241079))

(assert (=> b!1354003 m!1241065))

(assert (=> b!1354003 m!1241069))

(assert (=> b!1354003 m!1241077))

(declare-fun m!1241081 () Bool)

(assert (=> b!1354003 m!1241081))

(declare-fun m!1241083 () Bool)

(assert (=> b!1354006 m!1241083))

(declare-fun m!1241085 () Bool)

(assert (=> start!114226 m!1241085))

(check-sat (not b!1354012) (not b!1354013) (not b!1354005) (not b!1354004) (not b!1354003) (not b!1354009) (not b!1354010) (not b!1354015) (not b!1354006) (not b!1354014) (not start!114226))
(check-sat)
