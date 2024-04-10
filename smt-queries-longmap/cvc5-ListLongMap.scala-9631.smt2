; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113924 () Bool)

(assert start!113924)

(declare-fun b!1351196 () Bool)

(declare-fun res!896661 () Bool)

(declare-fun e!768462 () Bool)

(assert (=> b!1351196 (=> res!896661 e!768462)))

(declare-datatypes ((List!31542 0))(
  ( (Nil!31539) (Cons!31538 (h!32747 (_ BitVec 64)) (t!46200 List!31542)) )
))
(declare-fun lt!597166 () List!31542)

(declare-fun noDuplicate!2108 (List!31542) Bool)

(assert (=> b!1351196 (= res!896661 (not (noDuplicate!2108 lt!597166)))))

(declare-fun res!896654 () Bool)

(declare-fun e!768461 () Bool)

(assert (=> start!113924 (=> (not res!896654) (not e!768461))))

(declare-datatypes ((array!92106 0))(
  ( (array!92107 (arr!44501 (Array (_ BitVec 32) (_ BitVec 64))) (size!45051 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92106)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113924 (= res!896654 (and (bvslt (size!45051 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45051 a!3742))))))

(assert (=> start!113924 e!768461))

(assert (=> start!113924 true))

(declare-fun array_inv!33529 (array!92106) Bool)

(assert (=> start!113924 (array_inv!33529 a!3742)))

(declare-fun b!1351197 () Bool)

(declare-fun res!896662 () Bool)

(assert (=> b!1351197 (=> (not res!896662) (not e!768461))))

(declare-fun acc!759 () List!31542)

(declare-fun contains!9251 (List!31542 (_ BitVec 64)) Bool)

(assert (=> b!1351197 (= res!896662 (not (contains!9251 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351198 () Bool)

(declare-fun res!896665 () Bool)

(assert (=> b!1351198 (=> (not res!896665) (not e!768461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351198 (= res!896665 (validKeyInArray!0 (select (arr!44501 a!3742) from!3120)))))

(declare-fun b!1351199 () Bool)

(declare-fun res!896657 () Bool)

(assert (=> b!1351199 (=> (not res!896657) (not e!768461))))

(assert (=> b!1351199 (= res!896657 (noDuplicate!2108 acc!759))))

(declare-fun b!1351200 () Bool)

(declare-fun res!896655 () Bool)

(assert (=> b!1351200 (=> res!896655 e!768462)))

(assert (=> b!1351200 (= res!896655 (contains!9251 lt!597166 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351201 () Bool)

(declare-fun res!896660 () Bool)

(assert (=> b!1351201 (=> res!896660 e!768462)))

(declare-fun subseq!671 (List!31542 List!31542) Bool)

(assert (=> b!1351201 (= res!896660 (not (subseq!671 acc!759 lt!597166)))))

(declare-fun b!1351202 () Bool)

(declare-fun res!896656 () Bool)

(assert (=> b!1351202 (=> (not res!896656) (not e!768461))))

(declare-fun arrayNoDuplicates!0 (array!92106 (_ BitVec 32) List!31542) Bool)

(assert (=> b!1351202 (= res!896656 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31539))))

(declare-fun b!1351203 () Bool)

(assert (=> b!1351203 (= e!768461 (not e!768462))))

(declare-fun res!896668 () Bool)

(assert (=> b!1351203 (=> res!896668 e!768462)))

(assert (=> b!1351203 (= res!896668 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!686 (List!31542 (_ BitVec 64)) List!31542)

(assert (=> b!1351203 (= lt!597166 ($colon$colon!686 acc!759 (select (arr!44501 a!3742) from!3120)))))

(assert (=> b!1351203 (subseq!671 acc!759 acc!759)))

(declare-datatypes ((Unit!44256 0))(
  ( (Unit!44257) )
))
(declare-fun lt!597163 () Unit!44256)

(declare-fun lemmaListSubSeqRefl!0 (List!31542) Unit!44256)

(assert (=> b!1351203 (= lt!597163 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351204 () Bool)

(declare-fun res!896658 () Bool)

(assert (=> b!1351204 (=> (not res!896658) (not e!768461))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351204 (= res!896658 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351205 () Bool)

(assert (=> b!1351205 (= e!768462 true)))

(declare-fun lt!597165 () Bool)

(assert (=> b!1351205 (= lt!597165 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597166))))

(declare-fun lt!597164 () Unit!44256)

(declare-fun noDuplicateSubseq!122 (List!31542 List!31542) Unit!44256)

(assert (=> b!1351205 (= lt!597164 (noDuplicateSubseq!122 acc!759 lt!597166))))

(declare-fun b!1351206 () Bool)

(declare-fun res!896664 () Bool)

(assert (=> b!1351206 (=> (not res!896664) (not e!768461))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351206 (= res!896664 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45051 a!3742))))))

(declare-fun b!1351207 () Bool)

(declare-fun res!896663 () Bool)

(assert (=> b!1351207 (=> (not res!896663) (not e!768461))))

(assert (=> b!1351207 (= res!896663 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45051 a!3742)))))

(declare-fun b!1351208 () Bool)

(declare-fun res!896667 () Bool)

(assert (=> b!1351208 (=> res!896667 e!768462)))

(assert (=> b!1351208 (= res!896667 (contains!9251 lt!597166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351209 () Bool)

(declare-fun res!896666 () Bool)

(assert (=> b!1351209 (=> (not res!896666) (not e!768461))))

(assert (=> b!1351209 (= res!896666 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351210 () Bool)

(declare-fun res!896659 () Bool)

(assert (=> b!1351210 (=> (not res!896659) (not e!768461))))

(assert (=> b!1351210 (= res!896659 (not (contains!9251 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113924 res!896654) b!1351199))

(assert (= (and b!1351199 res!896657) b!1351210))

(assert (= (and b!1351210 res!896659) b!1351197))

(assert (= (and b!1351197 res!896662) b!1351202))

(assert (= (and b!1351202 res!896656) b!1351209))

(assert (= (and b!1351209 res!896666) b!1351206))

(assert (= (and b!1351206 res!896664) b!1351204))

(assert (= (and b!1351204 res!896658) b!1351207))

(assert (= (and b!1351207 res!896663) b!1351198))

(assert (= (and b!1351198 res!896665) b!1351203))

(assert (= (and b!1351203 (not res!896668)) b!1351196))

(assert (= (and b!1351196 (not res!896661)) b!1351208))

(assert (= (and b!1351208 (not res!896667)) b!1351200))

(assert (= (and b!1351200 (not res!896655)) b!1351201))

(assert (= (and b!1351201 (not res!896660)) b!1351205))

(declare-fun m!1238269 () Bool)

(assert (=> b!1351203 m!1238269))

(assert (=> b!1351203 m!1238269))

(declare-fun m!1238271 () Bool)

(assert (=> b!1351203 m!1238271))

(declare-fun m!1238273 () Bool)

(assert (=> b!1351203 m!1238273))

(declare-fun m!1238275 () Bool)

(assert (=> b!1351203 m!1238275))

(declare-fun m!1238277 () Bool)

(assert (=> b!1351196 m!1238277))

(declare-fun m!1238279 () Bool)

(assert (=> b!1351209 m!1238279))

(declare-fun m!1238281 () Bool)

(assert (=> b!1351208 m!1238281))

(assert (=> b!1351198 m!1238269))

(assert (=> b!1351198 m!1238269))

(declare-fun m!1238283 () Bool)

(assert (=> b!1351198 m!1238283))

(declare-fun m!1238285 () Bool)

(assert (=> b!1351204 m!1238285))

(declare-fun m!1238287 () Bool)

(assert (=> b!1351200 m!1238287))

(declare-fun m!1238289 () Bool)

(assert (=> b!1351210 m!1238289))

(declare-fun m!1238291 () Bool)

(assert (=> start!113924 m!1238291))

(declare-fun m!1238293 () Bool)

(assert (=> b!1351205 m!1238293))

(declare-fun m!1238295 () Bool)

(assert (=> b!1351205 m!1238295))

(declare-fun m!1238297 () Bool)

(assert (=> b!1351201 m!1238297))

(declare-fun m!1238299 () Bool)

(assert (=> b!1351202 m!1238299))

(declare-fun m!1238301 () Bool)

(assert (=> b!1351199 m!1238301))

(declare-fun m!1238303 () Bool)

(assert (=> b!1351197 m!1238303))

(push 1)

(assert (not b!1351210))

(assert (not b!1351198))

(assert (not start!113924))

(assert (not b!1351205))

(assert (not b!1351199))

(assert (not b!1351209))

(assert (not b!1351204))

(assert (not b!1351208))

(assert (not b!1351203))

(assert (not b!1351202))

(assert (not b!1351200))

(assert (not b!1351197))

(assert (not b!1351201))

(assert (not b!1351196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

