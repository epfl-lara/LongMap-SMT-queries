; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113946 () Bool)

(assert start!113946)

(declare-fun b!1351621 () Bool)

(declare-fun res!897124 () Bool)

(declare-fun e!768527 () Bool)

(assert (=> b!1351621 (=> res!897124 e!768527)))

(declare-datatypes ((List!31606 0))(
  ( (Nil!31603) (Cons!31602 (h!32811 (_ BitVec 64)) (t!46256 List!31606)) )
))
(declare-fun acc!759 () List!31606)

(declare-fun lt!597110 () List!31606)

(declare-fun subseq!682 (List!31606 List!31606) Bool)

(assert (=> b!1351621 (= res!897124 (not (subseq!682 acc!759 lt!597110)))))

(declare-fun b!1351622 () Bool)

(declare-fun res!897131 () Bool)

(declare-fun e!768529 () Bool)

(assert (=> b!1351622 (=> (not res!897131) (not e!768529))))

(declare-datatypes ((array!92077 0))(
  ( (array!92078 (arr!44487 (Array (_ BitVec 32) (_ BitVec 64))) (size!45039 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92077)

(declare-fun arrayNoDuplicates!0 (array!92077 (_ BitVec 32) List!31606) Bool)

(assert (=> b!1351622 (= res!897131 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31603))))

(declare-fun b!1351623 () Bool)

(declare-fun res!897122 () Bool)

(assert (=> b!1351623 (=> (not res!897122) (not e!768529))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1351623 (= res!897122 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351624 () Bool)

(declare-fun res!897132 () Bool)

(assert (=> b!1351624 (=> res!897132 e!768527)))

(declare-fun contains!9226 (List!31606 (_ BitVec 64)) Bool)

(assert (=> b!1351624 (= res!897132 (contains!9226 lt!597110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351625 () Bool)

(declare-fun res!897129 () Bool)

(assert (=> b!1351625 (=> (not res!897129) (not e!768529))))

(declare-fun noDuplicate!2141 (List!31606) Bool)

(assert (=> b!1351625 (= res!897129 (noDuplicate!2141 acc!759))))

(declare-fun b!1351626 () Bool)

(assert (=> b!1351626 (= e!768529 (not e!768527))))

(declare-fun res!897123 () Bool)

(assert (=> b!1351626 (=> res!897123 e!768527)))

(assert (=> b!1351626 (= res!897123 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!699 (List!31606 (_ BitVec 64)) List!31606)

(assert (=> b!1351626 (= lt!597110 ($colon$colon!699 acc!759 (select (arr!44487 a!3742) from!3120)))))

(assert (=> b!1351626 (subseq!682 acc!759 acc!759)))

(declare-datatypes ((Unit!44119 0))(
  ( (Unit!44120) )
))
(declare-fun lt!597111 () Unit!44119)

(declare-fun lemmaListSubSeqRefl!0 (List!31606) Unit!44119)

(assert (=> b!1351626 (= lt!597111 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351627 () Bool)

(declare-fun res!897130 () Bool)

(assert (=> b!1351627 (=> (not res!897130) (not e!768529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351627 (= res!897130 (validKeyInArray!0 (select (arr!44487 a!3742) from!3120)))))

(declare-fun b!1351628 () Bool)

(declare-fun res!897133 () Bool)

(assert (=> b!1351628 (=> (not res!897133) (not e!768529))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351628 (= res!897133 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45039 a!3742))))))

(declare-fun b!1351629 () Bool)

(declare-fun res!897127 () Bool)

(assert (=> b!1351629 (=> (not res!897127) (not e!768529))))

(assert (=> b!1351629 (= res!897127 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45039 a!3742)))))

(declare-fun b!1351630 () Bool)

(declare-fun res!897125 () Bool)

(assert (=> b!1351630 (=> res!897125 e!768527)))

(assert (=> b!1351630 (= res!897125 (not (noDuplicate!2141 lt!597110)))))

(declare-fun b!1351631 () Bool)

(declare-fun res!897121 () Bool)

(assert (=> b!1351631 (=> (not res!897121) (not e!768529))))

(assert (=> b!1351631 (= res!897121 (not (contains!9226 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351632 () Bool)

(declare-fun res!897134 () Bool)

(assert (=> b!1351632 (=> (not res!897134) (not e!768529))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351632 (= res!897134 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351633 () Bool)

(declare-fun res!897128 () Bool)

(assert (=> b!1351633 (=> res!897128 e!768527)))

(assert (=> b!1351633 (= res!897128 (contains!9226 lt!597110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!897120 () Bool)

(assert (=> start!113946 (=> (not res!897120) (not e!768529))))

(assert (=> start!113946 (= res!897120 (and (bvslt (size!45039 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45039 a!3742))))))

(assert (=> start!113946 e!768529))

(assert (=> start!113946 true))

(declare-fun array_inv!33720 (array!92077) Bool)

(assert (=> start!113946 (array_inv!33720 a!3742)))

(declare-fun b!1351634 () Bool)

(declare-fun res!897126 () Bool)

(assert (=> b!1351634 (=> (not res!897126) (not e!768529))))

(assert (=> b!1351634 (= res!897126 (not (contains!9226 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351635 () Bool)

(assert (=> b!1351635 (= e!768527 true)))

(declare-fun lt!597112 () Bool)

(assert (=> b!1351635 (= lt!597112 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597110))))

(declare-fun lt!597109 () Unit!44119)

(declare-fun noDuplicateSubseq!133 (List!31606 List!31606) Unit!44119)

(assert (=> b!1351635 (= lt!597109 (noDuplicateSubseq!133 acc!759 lt!597110))))

(assert (= (and start!113946 res!897120) b!1351625))

(assert (= (and b!1351625 res!897129) b!1351634))

(assert (= (and b!1351634 res!897126) b!1351631))

(assert (= (and b!1351631 res!897121) b!1351622))

(assert (= (and b!1351622 res!897131) b!1351623))

(assert (= (and b!1351623 res!897122) b!1351628))

(assert (= (and b!1351628 res!897133) b!1351632))

(assert (= (and b!1351632 res!897134) b!1351629))

(assert (= (and b!1351629 res!897127) b!1351627))

(assert (= (and b!1351627 res!897130) b!1351626))

(assert (= (and b!1351626 (not res!897123)) b!1351630))

(assert (= (and b!1351630 (not res!897125)) b!1351624))

(assert (= (and b!1351624 (not res!897132)) b!1351633))

(assert (= (and b!1351633 (not res!897128)) b!1351621))

(assert (= (and b!1351621 (not res!897124)) b!1351635))

(declare-fun m!1238149 () Bool)

(assert (=> b!1351624 m!1238149))

(declare-fun m!1238151 () Bool)

(assert (=> start!113946 m!1238151))

(declare-fun m!1238153 () Bool)

(assert (=> b!1351633 m!1238153))

(declare-fun m!1238155 () Bool)

(assert (=> b!1351630 m!1238155))

(declare-fun m!1238157 () Bool)

(assert (=> b!1351635 m!1238157))

(declare-fun m!1238159 () Bool)

(assert (=> b!1351635 m!1238159))

(declare-fun m!1238161 () Bool)

(assert (=> b!1351626 m!1238161))

(assert (=> b!1351626 m!1238161))

(declare-fun m!1238163 () Bool)

(assert (=> b!1351626 m!1238163))

(declare-fun m!1238165 () Bool)

(assert (=> b!1351626 m!1238165))

(declare-fun m!1238167 () Bool)

(assert (=> b!1351626 m!1238167))

(declare-fun m!1238169 () Bool)

(assert (=> b!1351622 m!1238169))

(declare-fun m!1238171 () Bool)

(assert (=> b!1351621 m!1238171))

(declare-fun m!1238173 () Bool)

(assert (=> b!1351623 m!1238173))

(declare-fun m!1238175 () Bool)

(assert (=> b!1351634 m!1238175))

(declare-fun m!1238177 () Bool)

(assert (=> b!1351625 m!1238177))

(assert (=> b!1351627 m!1238161))

(assert (=> b!1351627 m!1238161))

(declare-fun m!1238179 () Bool)

(assert (=> b!1351627 m!1238179))

(declare-fun m!1238181 () Bool)

(assert (=> b!1351631 m!1238181))

(declare-fun m!1238183 () Bool)

(assert (=> b!1351632 m!1238183))

(push 1)

(assert (not b!1351634))

(assert (not b!1351625))

(assert (not b!1351626))

(assert (not b!1351632))

(assert (not b!1351631))

(assert (not b!1351624))

(assert (not b!1351635))

(assert (not b!1351623))

(assert (not start!113946))

(assert (not b!1351627))

(assert (not b!1351622))

(assert (not b!1351621))

(assert (not b!1351633))

(assert (not b!1351630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

