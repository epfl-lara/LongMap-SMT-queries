; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113916 () Bool)

(assert start!113916)

(declare-fun b!1351016 () Bool)

(declare-fun res!896476 () Bool)

(declare-fun e!768425 () Bool)

(assert (=> b!1351016 (=> (not res!896476) (not e!768425))))

(declare-datatypes ((array!92098 0))(
  ( (array!92099 (arr!44497 (Array (_ BitVec 32) (_ BitVec 64))) (size!45047 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92098)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351016 (= res!896476 (validKeyInArray!0 (select (arr!44497 a!3742) from!3120)))))

(declare-fun b!1351018 () Bool)

(declare-fun res!896475 () Bool)

(assert (=> b!1351018 (=> (not res!896475) (not e!768425))))

(declare-datatypes ((List!31538 0))(
  ( (Nil!31535) (Cons!31534 (h!32743 (_ BitVec 64)) (t!46196 List!31538)) )
))
(declare-fun acc!759 () List!31538)

(declare-fun contains!9247 (List!31538 (_ BitVec 64)) Bool)

(assert (=> b!1351018 (= res!896475 (not (contains!9247 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351019 () Bool)

(declare-fun res!896484 () Bool)

(assert (=> b!1351019 (=> (not res!896484) (not e!768425))))

(declare-fun arrayNoDuplicates!0 (array!92098 (_ BitVec 32) List!31538) Bool)

(assert (=> b!1351019 (= res!896484 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351020 () Bool)

(declare-fun e!768427 () Bool)

(assert (=> b!1351020 (= e!768425 (not e!768427))))

(declare-fun res!896474 () Bool)

(assert (=> b!1351020 (=> res!896474 e!768427)))

(assert (=> b!1351020 (= res!896474 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!597118 () List!31538)

(declare-fun $colon$colon!682 (List!31538 (_ BitVec 64)) List!31538)

(assert (=> b!1351020 (= lt!597118 ($colon$colon!682 acc!759 (select (arr!44497 a!3742) from!3120)))))

(declare-fun subseq!667 (List!31538 List!31538) Bool)

(assert (=> b!1351020 (subseq!667 acc!759 acc!759)))

(declare-datatypes ((Unit!44248 0))(
  ( (Unit!44249) )
))
(declare-fun lt!597115 () Unit!44248)

(declare-fun lemmaListSubSeqRefl!0 (List!31538) Unit!44248)

(assert (=> b!1351020 (= lt!597115 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351021 () Bool)

(declare-fun res!896482 () Bool)

(assert (=> b!1351021 (=> (not res!896482) (not e!768425))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351021 (= res!896482 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45047 a!3742))))))

(declare-fun b!1351022 () Bool)

(declare-fun res!896483 () Bool)

(assert (=> b!1351022 (=> res!896483 e!768427)))

(assert (=> b!1351022 (= res!896483 (contains!9247 lt!597118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351023 () Bool)

(declare-fun res!896487 () Bool)

(assert (=> b!1351023 (=> res!896487 e!768427)))

(assert (=> b!1351023 (= res!896487 (not (subseq!667 acc!759 lt!597118)))))

(declare-fun b!1351024 () Bool)

(declare-fun res!896480 () Bool)

(assert (=> b!1351024 (=> (not res!896480) (not e!768425))))

(assert (=> b!1351024 (= res!896480 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31535))))

(declare-fun res!896486 () Bool)

(assert (=> start!113916 (=> (not res!896486) (not e!768425))))

(assert (=> start!113916 (= res!896486 (and (bvslt (size!45047 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45047 a!3742))))))

(assert (=> start!113916 e!768425))

(assert (=> start!113916 true))

(declare-fun array_inv!33525 (array!92098) Bool)

(assert (=> start!113916 (array_inv!33525 a!3742)))

(declare-fun b!1351017 () Bool)

(declare-fun res!896479 () Bool)

(assert (=> b!1351017 (=> (not res!896479) (not e!768425))))

(assert (=> b!1351017 (= res!896479 (not (contains!9247 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351025 () Bool)

(assert (=> b!1351025 (= e!768427 true)))

(declare-fun lt!597116 () Bool)

(assert (=> b!1351025 (= lt!597116 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597118))))

(declare-fun lt!597117 () Unit!44248)

(declare-fun noDuplicateSubseq!118 (List!31538 List!31538) Unit!44248)

(assert (=> b!1351025 (= lt!597117 (noDuplicateSubseq!118 acc!759 lt!597118))))

(declare-fun b!1351026 () Bool)

(declare-fun res!896488 () Bool)

(assert (=> b!1351026 (=> (not res!896488) (not e!768425))))

(declare-fun noDuplicate!2104 (List!31538) Bool)

(assert (=> b!1351026 (= res!896488 (noDuplicate!2104 acc!759))))

(declare-fun b!1351027 () Bool)

(declare-fun res!896485 () Bool)

(assert (=> b!1351027 (=> res!896485 e!768427)))

(assert (=> b!1351027 (= res!896485 (not (noDuplicate!2104 lt!597118)))))

(declare-fun b!1351028 () Bool)

(declare-fun res!896478 () Bool)

(assert (=> b!1351028 (=> res!896478 e!768427)))

(assert (=> b!1351028 (= res!896478 (contains!9247 lt!597118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351029 () Bool)

(declare-fun res!896477 () Bool)

(assert (=> b!1351029 (=> (not res!896477) (not e!768425))))

(assert (=> b!1351029 (= res!896477 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45047 a!3742)))))

(declare-fun b!1351030 () Bool)

(declare-fun res!896481 () Bool)

(assert (=> b!1351030 (=> (not res!896481) (not e!768425))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351030 (= res!896481 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113916 res!896486) b!1351026))

(assert (= (and b!1351026 res!896488) b!1351017))

(assert (= (and b!1351017 res!896479) b!1351018))

(assert (= (and b!1351018 res!896475) b!1351024))

(assert (= (and b!1351024 res!896480) b!1351019))

(assert (= (and b!1351019 res!896484) b!1351021))

(assert (= (and b!1351021 res!896482) b!1351030))

(assert (= (and b!1351030 res!896481) b!1351029))

(assert (= (and b!1351029 res!896477) b!1351016))

(assert (= (and b!1351016 res!896476) b!1351020))

(assert (= (and b!1351020 (not res!896474)) b!1351027))

(assert (= (and b!1351027 (not res!896485)) b!1351022))

(assert (= (and b!1351022 (not res!896483)) b!1351028))

(assert (= (and b!1351028 (not res!896478)) b!1351023))

(assert (= (and b!1351023 (not res!896487)) b!1351025))

(declare-fun m!1238125 () Bool)

(assert (=> b!1351019 m!1238125))

(declare-fun m!1238127 () Bool)

(assert (=> b!1351024 m!1238127))

(declare-fun m!1238129 () Bool)

(assert (=> b!1351030 m!1238129))

(declare-fun m!1238131 () Bool)

(assert (=> b!1351026 m!1238131))

(declare-fun m!1238133 () Bool)

(assert (=> b!1351023 m!1238133))

(declare-fun m!1238135 () Bool)

(assert (=> b!1351027 m!1238135))

(declare-fun m!1238137 () Bool)

(assert (=> b!1351025 m!1238137))

(declare-fun m!1238139 () Bool)

(assert (=> b!1351025 m!1238139))

(declare-fun m!1238141 () Bool)

(assert (=> b!1351016 m!1238141))

(assert (=> b!1351016 m!1238141))

(declare-fun m!1238143 () Bool)

(assert (=> b!1351016 m!1238143))

(declare-fun m!1238145 () Bool)

(assert (=> b!1351028 m!1238145))

(declare-fun m!1238147 () Bool)

(assert (=> b!1351022 m!1238147))

(assert (=> b!1351020 m!1238141))

(assert (=> b!1351020 m!1238141))

(declare-fun m!1238149 () Bool)

(assert (=> b!1351020 m!1238149))

(declare-fun m!1238151 () Bool)

(assert (=> b!1351020 m!1238151))

(declare-fun m!1238153 () Bool)

(assert (=> b!1351020 m!1238153))

(declare-fun m!1238155 () Bool)

(assert (=> b!1351017 m!1238155))

(declare-fun m!1238157 () Bool)

(assert (=> start!113916 m!1238157))

(declare-fun m!1238159 () Bool)

(assert (=> b!1351018 m!1238159))

(push 1)

(assert (not b!1351022))

(assert (not b!1351025))

(assert (not b!1351016))

(assert (not b!1351019))

(assert (not b!1351018))

(assert (not b!1351023))

(assert (not b!1351017))

(assert (not b!1351030))

(assert (not b!1351026))

(assert (not b!1351028))

(assert (not b!1351024))

(assert (not b!1351027))

(assert (not start!113916))

(assert (not b!1351020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

