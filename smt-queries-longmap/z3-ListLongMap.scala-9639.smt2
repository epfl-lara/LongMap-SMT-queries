; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113974 () Bool)

(assert start!113974)

(declare-fun b!1352198 () Bool)

(declare-fun res!897578 () Bool)

(declare-fun e!768729 () Bool)

(assert (=> b!1352198 (=> (not res!897578) (not e!768729))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92156 0))(
  ( (array!92157 (arr!44526 (Array (_ BitVec 32) (_ BitVec 64))) (size!45076 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92156)

(assert (=> b!1352198 (= res!897578 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45076 a!3742)))))

(declare-fun b!1352199 () Bool)

(declare-fun e!768730 () Bool)

(assert (=> b!1352199 (= e!768729 e!768730)))

(declare-fun res!897575 () Bool)

(assert (=> b!1352199 (=> (not res!897575) (not e!768730))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352199 (= res!897575 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44319 0))(
  ( (Unit!44320) )
))
(declare-fun lt!597465 () Unit!44319)

(declare-fun e!768728 () Unit!44319)

(assert (=> b!1352199 (= lt!597465 e!768728)))

(declare-fun c!126752 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352199 (= c!126752 (validKeyInArray!0 (select (arr!44526 a!3742) from!3120)))))

(declare-fun b!1352200 () Bool)

(declare-fun lt!597464 () Unit!44319)

(assert (=> b!1352200 (= e!768728 lt!597464)))

(declare-fun lt!597466 () Unit!44319)

(declare-datatypes ((List!31567 0))(
  ( (Nil!31564) (Cons!31563 (h!32772 (_ BitVec 64)) (t!46225 List!31567)) )
))
(declare-fun acc!759 () List!31567)

(declare-fun lemmaListSubSeqRefl!0 (List!31567) Unit!44319)

(assert (=> b!1352200 (= lt!597466 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!696 (List!31567 List!31567) Bool)

(assert (=> b!1352200 (subseq!696 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92156 List!31567 List!31567 (_ BitVec 32)) Unit!44319)

(declare-fun $colon$colon!711 (List!31567 (_ BitVec 64)) List!31567)

(assert (=> b!1352200 (= lt!597464 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!711 acc!759 (select (arr!44526 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92156 (_ BitVec 32) List!31567) Bool)

(assert (=> b!1352200 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!897576 () Bool)

(assert (=> start!113974 (=> (not res!897576) (not e!768729))))

(assert (=> start!113974 (= res!897576 (and (bvslt (size!45076 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45076 a!3742))))))

(assert (=> start!113974 e!768729))

(assert (=> start!113974 true))

(declare-fun array_inv!33554 (array!92156) Bool)

(assert (=> start!113974 (array_inv!33554 a!3742)))

(declare-fun b!1352201 () Bool)

(declare-fun res!897574 () Bool)

(assert (=> b!1352201 (=> (not res!897574) (not e!768729))))

(declare-fun noDuplicate!2133 (List!31567) Bool)

(assert (=> b!1352201 (= res!897574 (noDuplicate!2133 acc!759))))

(declare-fun b!1352202 () Bool)

(declare-fun res!897580 () Bool)

(assert (=> b!1352202 (=> (not res!897580) (not e!768729))))

(declare-fun contains!9276 (List!31567 (_ BitVec 64)) Bool)

(assert (=> b!1352202 (= res!897580 (not (contains!9276 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352203 () Bool)

(declare-fun res!897583 () Bool)

(assert (=> b!1352203 (=> (not res!897583) (not e!768729))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352203 (= res!897583 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352204 () Bool)

(declare-fun res!897577 () Bool)

(assert (=> b!1352204 (=> (not res!897577) (not e!768729))))

(assert (=> b!1352204 (= res!897577 (not (contains!9276 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352205 () Bool)

(declare-fun res!897581 () Bool)

(assert (=> b!1352205 (=> (not res!897581) (not e!768729))))

(assert (=> b!1352205 (= res!897581 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31564))))

(declare-fun b!1352206 () Bool)

(assert (=> b!1352206 (= e!768730 false)))

(declare-fun lt!597463 () Bool)

(assert (=> b!1352206 (= lt!597463 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352207 () Bool)

(declare-fun res!897582 () Bool)

(assert (=> b!1352207 (=> (not res!897582) (not e!768729))))

(assert (=> b!1352207 (= res!897582 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352208 () Bool)

(declare-fun Unit!44321 () Unit!44319)

(assert (=> b!1352208 (= e!768728 Unit!44321)))

(declare-fun b!1352209 () Bool)

(declare-fun res!897579 () Bool)

(assert (=> b!1352209 (=> (not res!897579) (not e!768729))))

(assert (=> b!1352209 (= res!897579 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45076 a!3742))))))

(assert (= (and start!113974 res!897576) b!1352201))

(assert (= (and b!1352201 res!897574) b!1352202))

(assert (= (and b!1352202 res!897580) b!1352204))

(assert (= (and b!1352204 res!897577) b!1352205))

(assert (= (and b!1352205 res!897581) b!1352207))

(assert (= (and b!1352207 res!897582) b!1352209))

(assert (= (and b!1352209 res!897579) b!1352203))

(assert (= (and b!1352203 res!897583) b!1352198))

(assert (= (and b!1352198 res!897578) b!1352199))

(assert (= (and b!1352199 c!126752) b!1352200))

(assert (= (and b!1352199 (not c!126752)) b!1352208))

(assert (= (and b!1352199 res!897575) b!1352206))

(declare-fun m!1239065 () Bool)

(assert (=> b!1352206 m!1239065))

(declare-fun m!1239067 () Bool)

(assert (=> start!113974 m!1239067))

(declare-fun m!1239069 () Bool)

(assert (=> b!1352207 m!1239069))

(declare-fun m!1239071 () Bool)

(assert (=> b!1352200 m!1239071))

(declare-fun m!1239073 () Bool)

(assert (=> b!1352200 m!1239073))

(declare-fun m!1239075 () Bool)

(assert (=> b!1352200 m!1239075))

(declare-fun m!1239077 () Bool)

(assert (=> b!1352200 m!1239077))

(assert (=> b!1352200 m!1239065))

(assert (=> b!1352200 m!1239073))

(assert (=> b!1352200 m!1239075))

(declare-fun m!1239079 () Bool)

(assert (=> b!1352200 m!1239079))

(declare-fun m!1239081 () Bool)

(assert (=> b!1352201 m!1239081))

(declare-fun m!1239083 () Bool)

(assert (=> b!1352205 m!1239083))

(declare-fun m!1239085 () Bool)

(assert (=> b!1352203 m!1239085))

(declare-fun m!1239087 () Bool)

(assert (=> b!1352204 m!1239087))

(assert (=> b!1352199 m!1239073))

(assert (=> b!1352199 m!1239073))

(declare-fun m!1239089 () Bool)

(assert (=> b!1352199 m!1239089))

(declare-fun m!1239091 () Bool)

(assert (=> b!1352202 m!1239091))

(check-sat (not b!1352205) (not b!1352206) (not b!1352204) (not b!1352207) (not b!1352200) (not b!1352199) (not b!1352202) (not b!1352203) (not start!113974) (not b!1352201))
(check-sat)
