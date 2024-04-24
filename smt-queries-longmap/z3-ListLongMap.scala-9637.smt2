; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114184 () Bool)

(assert start!114184)

(declare-fun res!897885 () Bool)

(declare-fun e!769489 () Bool)

(assert (=> start!114184 (=> (not res!897885) (not e!769489))))

(declare-datatypes ((array!92257 0))(
  ( (array!92258 (arr!44572 (Array (_ BitVec 32) (_ BitVec 64))) (size!45123 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92257)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114184 (= res!897885 (and (bvslt (size!45123 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45123 a!3742))))))

(assert (=> start!114184 e!769489))

(assert (=> start!114184 true))

(declare-fun array_inv!33853 (array!92257) Bool)

(assert (=> start!114184 (array_inv!33853 a!3742)))

(declare-fun b!1353245 () Bool)

(declare-fun res!897888 () Bool)

(assert (=> b!1353245 (=> (not res!897888) (not e!769489))))

(declare-datatypes ((List!31600 0))(
  ( (Nil!31597) (Cons!31596 (h!32814 (_ BitVec 64)) (t!46250 List!31600)) )
))
(declare-fun acc!759 () List!31600)

(declare-fun noDuplicate!2143 (List!31600) Bool)

(assert (=> b!1353245 (= res!897888 (noDuplicate!2143 acc!759))))

(declare-fun b!1353246 () Bool)

(declare-fun res!897882 () Bool)

(assert (=> b!1353246 (=> (not res!897882) (not e!769489))))

(assert (=> b!1353246 (= res!897882 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45123 a!3742)))))

(declare-fun b!1353247 () Bool)

(declare-datatypes ((Unit!44237 0))(
  ( (Unit!44238) )
))
(declare-fun e!769487 () Unit!44237)

(declare-fun Unit!44239 () Unit!44237)

(assert (=> b!1353247 (= e!769487 Unit!44239)))

(declare-fun b!1353248 () Bool)

(declare-fun res!897890 () Bool)

(assert (=> b!1353248 (=> (not res!897890) (not e!769489))))

(declare-fun arrayNoDuplicates!0 (array!92257 (_ BitVec 32) List!31600) Bool)

(assert (=> b!1353248 (= res!897890 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353249 () Bool)

(declare-fun res!897884 () Bool)

(assert (=> b!1353249 (=> (not res!897884) (not e!769489))))

(declare-fun contains!9312 (List!31600 (_ BitVec 64)) Bool)

(assert (=> b!1353249 (= res!897884 (not (contains!9312 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353250 () Bool)

(declare-fun res!897889 () Bool)

(assert (=> b!1353250 (=> (not res!897889) (not e!769489))))

(assert (=> b!1353250 (= res!897889 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31597))))

(declare-fun b!1353251 () Bool)

(declare-fun e!769488 () Bool)

(assert (=> b!1353251 (= e!769489 e!769488)))

(declare-fun res!897883 () Bool)

(assert (=> b!1353251 (=> (not res!897883) (not e!769488))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353251 (= res!897883 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597858 () Unit!44237)

(assert (=> b!1353251 (= lt!597858 e!769487)))

(declare-fun c!127129 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353251 (= c!127129 (validKeyInArray!0 (select (arr!44572 a!3742) from!3120)))))

(declare-fun b!1353252 () Bool)

(declare-fun lt!597855 () Unit!44237)

(assert (=> b!1353252 (= e!769487 lt!597855)))

(declare-fun lt!597856 () Unit!44237)

(declare-fun lemmaListSubSeqRefl!0 (List!31600) Unit!44237)

(assert (=> b!1353252 (= lt!597856 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!689 (List!31600 List!31600) Bool)

(assert (=> b!1353252 (subseq!689 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92257 List!31600 List!31600 (_ BitVec 32)) Unit!44237)

(declare-fun $colon$colon!703 (List!31600 (_ BitVec 64)) List!31600)

(assert (=> b!1353252 (= lt!597855 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!703 acc!759 (select (arr!44572 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353252 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353253 () Bool)

(declare-fun res!897886 () Bool)

(assert (=> b!1353253 (=> (not res!897886) (not e!769489))))

(assert (=> b!1353253 (= res!897886 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45123 a!3742))))))

(declare-fun b!1353254 () Bool)

(declare-fun res!897887 () Bool)

(assert (=> b!1353254 (=> (not res!897887) (not e!769489))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353254 (= res!897887 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353255 () Bool)

(declare-fun res!897891 () Bool)

(assert (=> b!1353255 (=> (not res!897891) (not e!769489))))

(assert (=> b!1353255 (= res!897891 (not (contains!9312 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353256 () Bool)

(assert (=> b!1353256 (= e!769488 false)))

(declare-fun lt!597857 () Bool)

(assert (=> b!1353256 (= lt!597857 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114184 res!897885) b!1353245))

(assert (= (and b!1353245 res!897888) b!1353249))

(assert (= (and b!1353249 res!897884) b!1353255))

(assert (= (and b!1353255 res!897891) b!1353250))

(assert (= (and b!1353250 res!897889) b!1353248))

(assert (= (and b!1353248 res!897890) b!1353253))

(assert (= (and b!1353253 res!897886) b!1353254))

(assert (= (and b!1353254 res!897887) b!1353246))

(assert (= (and b!1353246 res!897882) b!1353251))

(assert (= (and b!1353251 c!127129) b!1353252))

(assert (= (and b!1353251 (not c!127129)) b!1353247))

(assert (= (and b!1353251 res!897883) b!1353256))

(declare-fun m!1240465 () Bool)

(assert (=> b!1353256 m!1240465))

(declare-fun m!1240467 () Bool)

(assert (=> b!1353252 m!1240467))

(declare-fun m!1240469 () Bool)

(assert (=> b!1353252 m!1240469))

(declare-fun m!1240471 () Bool)

(assert (=> b!1353252 m!1240471))

(declare-fun m!1240473 () Bool)

(assert (=> b!1353252 m!1240473))

(assert (=> b!1353252 m!1240465))

(assert (=> b!1353252 m!1240469))

(assert (=> b!1353252 m!1240471))

(declare-fun m!1240475 () Bool)

(assert (=> b!1353252 m!1240475))

(declare-fun m!1240477 () Bool)

(assert (=> b!1353255 m!1240477))

(declare-fun m!1240479 () Bool)

(assert (=> b!1353250 m!1240479))

(declare-fun m!1240481 () Bool)

(assert (=> b!1353254 m!1240481))

(declare-fun m!1240483 () Bool)

(assert (=> start!114184 m!1240483))

(declare-fun m!1240485 () Bool)

(assert (=> b!1353249 m!1240485))

(assert (=> b!1353251 m!1240469))

(assert (=> b!1353251 m!1240469))

(declare-fun m!1240487 () Bool)

(assert (=> b!1353251 m!1240487))

(declare-fun m!1240489 () Bool)

(assert (=> b!1353245 m!1240489))

(declare-fun m!1240491 () Bool)

(assert (=> b!1353248 m!1240491))

(check-sat (not b!1353251) (not b!1353255) (not b!1353256) (not b!1353245) (not b!1353252) (not b!1353250) (not b!1353248) (not start!114184) (not b!1353249) (not b!1353254))
(check-sat)
