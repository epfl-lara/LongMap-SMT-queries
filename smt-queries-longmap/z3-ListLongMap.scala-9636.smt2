; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113954 () Bool)

(assert start!113954)

(declare-fun res!897247 () Bool)

(declare-fun e!768577 () Bool)

(assert (=> start!113954 (=> (not res!897247) (not e!768577))))

(declare-datatypes ((array!92085 0))(
  ( (array!92086 (arr!44491 (Array (_ BitVec 32) (_ BitVec 64))) (size!45043 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92085)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113954 (= res!897247 (and (bvslt (size!45043 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45043 a!3742))))))

(assert (=> start!113954 e!768577))

(assert (=> start!113954 true))

(declare-fun array_inv!33724 (array!92085) Bool)

(assert (=> start!113954 (array_inv!33724 a!3742)))

(declare-fun b!1351768 () Bool)

(declare-fun e!768576 () Bool)

(assert (=> b!1351768 (= e!768577 e!768576)))

(declare-fun res!897246 () Bool)

(assert (=> b!1351768 (=> (not res!897246) (not e!768576))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351768 (= res!897246 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44130 0))(
  ( (Unit!44131) )
))
(declare-fun lt!597160 () Unit!44130)

(declare-fun e!768575 () Unit!44130)

(assert (=> b!1351768 (= lt!597160 e!768575)))

(declare-fun c!126704 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351768 (= c!126704 (validKeyInArray!0 (select (arr!44491 a!3742) from!3120)))))

(declare-fun b!1351769 () Bool)

(declare-fun res!897250 () Bool)

(assert (=> b!1351769 (=> (not res!897250) (not e!768577))))

(declare-datatypes ((List!31610 0))(
  ( (Nil!31607) (Cons!31606 (h!32815 (_ BitVec 64)) (t!46260 List!31610)) )
))
(declare-fun arrayNoDuplicates!0 (array!92085 (_ BitVec 32) List!31610) Bool)

(assert (=> b!1351769 (= res!897250 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31607))))

(declare-fun b!1351770 () Bool)

(declare-fun Unit!44132 () Unit!44130)

(assert (=> b!1351770 (= e!768575 Unit!44132)))

(declare-fun b!1351771 () Bool)

(declare-fun res!897251 () Bool)

(assert (=> b!1351771 (=> (not res!897251) (not e!768577))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351771 (= res!897251 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351772 () Bool)

(declare-fun res!897245 () Bool)

(assert (=> b!1351772 (=> (not res!897245) (not e!768577))))

(declare-fun acc!759 () List!31610)

(declare-fun noDuplicate!2145 (List!31610) Bool)

(assert (=> b!1351772 (= res!897245 (noDuplicate!2145 acc!759))))

(declare-fun b!1351773 () Bool)

(declare-fun res!897249 () Bool)

(assert (=> b!1351773 (=> (not res!897249) (not e!768577))))

(assert (=> b!1351773 (= res!897249 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45043 a!3742)))))

(declare-fun b!1351774 () Bool)

(declare-fun res!897252 () Bool)

(assert (=> b!1351774 (=> (not res!897252) (not e!768577))))

(declare-fun contains!9230 (List!31610 (_ BitVec 64)) Bool)

(assert (=> b!1351774 (= res!897252 (not (contains!9230 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351775 () Bool)

(declare-fun res!897253 () Bool)

(assert (=> b!1351775 (=> (not res!897253) (not e!768577))))

(assert (=> b!1351775 (= res!897253 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45043 a!3742))))))

(declare-fun b!1351776 () Bool)

(declare-fun res!897254 () Bool)

(assert (=> b!1351776 (=> (not res!897254) (not e!768577))))

(assert (=> b!1351776 (= res!897254 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351777 () Bool)

(assert (=> b!1351777 (= e!768576 false)))

(declare-fun lt!597158 () Bool)

(assert (=> b!1351777 (= lt!597158 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351778 () Bool)

(declare-fun res!897248 () Bool)

(assert (=> b!1351778 (=> (not res!897248) (not e!768577))))

(assert (=> b!1351778 (= res!897248 (not (contains!9230 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351779 () Bool)

(declare-fun lt!597159 () Unit!44130)

(assert (=> b!1351779 (= e!768575 lt!597159)))

(declare-fun lt!597157 () Unit!44130)

(declare-fun lemmaListSubSeqRefl!0 (List!31610) Unit!44130)

(assert (=> b!1351779 (= lt!597157 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!686 (List!31610 List!31610) Bool)

(assert (=> b!1351779 (subseq!686 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92085 List!31610 List!31610 (_ BitVec 32)) Unit!44130)

(declare-fun $colon$colon!703 (List!31610 (_ BitVec 64)) List!31610)

(assert (=> b!1351779 (= lt!597159 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!703 acc!759 (select (arr!44491 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351779 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!113954 res!897247) b!1351772))

(assert (= (and b!1351772 res!897245) b!1351778))

(assert (= (and b!1351778 res!897248) b!1351774))

(assert (= (and b!1351774 res!897252) b!1351769))

(assert (= (and b!1351769 res!897250) b!1351776))

(assert (= (and b!1351776 res!897254) b!1351775))

(assert (= (and b!1351775 res!897253) b!1351771))

(assert (= (and b!1351771 res!897251) b!1351773))

(assert (= (and b!1351773 res!897249) b!1351768))

(assert (= (and b!1351768 c!126704) b!1351779))

(assert (= (and b!1351768 (not c!126704)) b!1351770))

(assert (= (and b!1351768 res!897246) b!1351777))

(declare-fun m!1238269 () Bool)

(assert (=> start!113954 m!1238269))

(declare-fun m!1238271 () Bool)

(assert (=> b!1351777 m!1238271))

(declare-fun m!1238273 () Bool)

(assert (=> b!1351772 m!1238273))

(declare-fun m!1238275 () Bool)

(assert (=> b!1351768 m!1238275))

(assert (=> b!1351768 m!1238275))

(declare-fun m!1238277 () Bool)

(assert (=> b!1351768 m!1238277))

(declare-fun m!1238279 () Bool)

(assert (=> b!1351776 m!1238279))

(declare-fun m!1238281 () Bool)

(assert (=> b!1351774 m!1238281))

(declare-fun m!1238283 () Bool)

(assert (=> b!1351769 m!1238283))

(declare-fun m!1238285 () Bool)

(assert (=> b!1351778 m!1238285))

(declare-fun m!1238287 () Bool)

(assert (=> b!1351779 m!1238287))

(assert (=> b!1351779 m!1238275))

(declare-fun m!1238289 () Bool)

(assert (=> b!1351779 m!1238289))

(declare-fun m!1238291 () Bool)

(assert (=> b!1351779 m!1238291))

(assert (=> b!1351779 m!1238271))

(assert (=> b!1351779 m!1238275))

(assert (=> b!1351779 m!1238289))

(declare-fun m!1238293 () Bool)

(assert (=> b!1351779 m!1238293))

(declare-fun m!1238295 () Bool)

(assert (=> b!1351771 m!1238295))

(check-sat (not b!1351768) (not b!1351779) (not b!1351778) (not b!1351774) (not b!1351771) (not b!1351776) (not start!113954) (not b!1351769) (not b!1351777) (not b!1351772))
(check-sat)
