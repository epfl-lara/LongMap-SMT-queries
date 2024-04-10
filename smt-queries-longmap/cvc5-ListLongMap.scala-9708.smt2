; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114806 () Bool)

(assert start!114806)

(declare-fun b!1361144 () Bool)

(declare-fun res!905325 () Bool)

(declare-fun e!772241 () Bool)

(assert (=> b!1361144 (=> (not res!905325) (not e!772241))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92592 0))(
  ( (array!92593 (arr!44732 (Array (_ BitVec 32) (_ BitVec 64))) (size!45282 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92592)

(assert (=> b!1361144 (= res!905325 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45282 a!3742))))))

(declare-fun b!1361145 () Bool)

(declare-datatypes ((Unit!44856 0))(
  ( (Unit!44857) )
))
(declare-fun e!772242 () Unit!44856)

(declare-fun Unit!44858 () Unit!44856)

(assert (=> b!1361145 (= e!772242 Unit!44858)))

(declare-fun b!1361146 () Bool)

(declare-fun res!905323 () Bool)

(assert (=> b!1361146 (=> (not res!905323) (not e!772241))))

(declare-datatypes ((List!31773 0))(
  ( (Nil!31770) (Cons!31769 (h!32978 (_ BitVec 64)) (t!46455 List!31773)) )
))
(declare-fun acc!759 () List!31773)

(declare-fun contains!9482 (List!31773 (_ BitVec 64)) Bool)

(assert (=> b!1361146 (= res!905323 (not (contains!9482 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361147 () Bool)

(declare-fun res!905326 () Bool)

(assert (=> b!1361147 (=> (not res!905326) (not e!772241))))

(assert (=> b!1361147 (= res!905326 (not (contains!9482 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361148 () Bool)

(declare-fun res!905322 () Bool)

(assert (=> b!1361148 (=> (not res!905322) (not e!772241))))

(declare-fun noDuplicate!2339 (List!31773) Bool)

(assert (=> b!1361148 (= res!905322 (noDuplicate!2339 acc!759))))

(declare-fun b!1361149 () Bool)

(declare-fun res!905321 () Bool)

(declare-fun e!772239 () Bool)

(assert (=> b!1361149 (=> (not res!905321) (not e!772239))))

(declare-fun lt!600082 () List!31773)

(assert (=> b!1361149 (= res!905321 (not (contains!9482 lt!600082 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361150 () Bool)

(declare-fun e!772243 () Bool)

(assert (=> b!1361150 (= e!772243 e!772239)))

(declare-fun res!905332 () Bool)

(assert (=> b!1361150 (=> (not res!905332) (not e!772239))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1361150 (= res!905332 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!887 (List!31773 (_ BitVec 64)) List!31773)

(assert (=> b!1361150 (= lt!600082 ($colon$colon!887 acc!759 (select (arr!44732 a!3742) from!3120)))))

(declare-fun b!1361151 () Bool)

(declare-fun res!905331 () Bool)

(assert (=> b!1361151 (=> (not res!905331) (not e!772239))))

(assert (=> b!1361151 (= res!905331 (noDuplicate!2339 lt!600082))))

(declare-fun b!1361153 () Bool)

(declare-fun res!905320 () Bool)

(assert (=> b!1361153 (=> (not res!905320) (not e!772241))))

(declare-fun arrayNoDuplicates!0 (array!92592 (_ BitVec 32) List!31773) Bool)

(assert (=> b!1361153 (= res!905320 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31770))))

(declare-fun b!1361154 () Bool)

(declare-fun res!905329 () Bool)

(assert (=> b!1361154 (=> (not res!905329) (not e!772241))))

(assert (=> b!1361154 (= res!905329 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361155 () Bool)

(declare-fun res!905324 () Bool)

(assert (=> b!1361155 (=> (not res!905324) (not e!772241))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361155 (= res!905324 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361156 () Bool)

(assert (=> b!1361156 (= e!772239 false)))

(declare-fun lt!600081 () Bool)

(assert (=> b!1361156 (= lt!600081 (contains!9482 lt!600082 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361157 () Bool)

(declare-fun lt!600079 () Unit!44856)

(assert (=> b!1361157 (= e!772242 lt!600079)))

(declare-fun lt!600077 () Unit!44856)

(declare-fun lemmaListSubSeqRefl!0 (List!31773) Unit!44856)

(assert (=> b!1361157 (= lt!600077 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!884 (List!31773 List!31773) Bool)

(assert (=> b!1361157 (subseq!884 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92592 List!31773 List!31773 (_ BitVec 32)) Unit!44856)

(assert (=> b!1361157 (= lt!600079 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!887 acc!759 (select (arr!44732 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361157 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361158 () Bool)

(declare-fun res!905327 () Bool)

(assert (=> b!1361158 (=> (not res!905327) (not e!772241))))

(assert (=> b!1361158 (= res!905327 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45282 a!3742)))))

(declare-fun b!1361152 () Bool)

(assert (=> b!1361152 (= e!772241 e!772243)))

(declare-fun res!905328 () Bool)

(assert (=> b!1361152 (=> (not res!905328) (not e!772243))))

(declare-fun lt!600078 () Bool)

(assert (=> b!1361152 (= res!905328 (and (not (= from!3120 i!1404)) lt!600078))))

(declare-fun lt!600080 () Unit!44856)

(assert (=> b!1361152 (= lt!600080 e!772242)))

(declare-fun c!127352 () Bool)

(assert (=> b!1361152 (= c!127352 lt!600078)))

(assert (=> b!1361152 (= lt!600078 (validKeyInArray!0 (select (arr!44732 a!3742) from!3120)))))

(declare-fun res!905330 () Bool)

(assert (=> start!114806 (=> (not res!905330) (not e!772241))))

(assert (=> start!114806 (= res!905330 (and (bvslt (size!45282 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45282 a!3742))))))

(assert (=> start!114806 e!772241))

(assert (=> start!114806 true))

(declare-fun array_inv!33760 (array!92592) Bool)

(assert (=> start!114806 (array_inv!33760 a!3742)))

(assert (= (and start!114806 res!905330) b!1361148))

(assert (= (and b!1361148 res!905322) b!1361146))

(assert (= (and b!1361146 res!905323) b!1361147))

(assert (= (and b!1361147 res!905326) b!1361153))

(assert (= (and b!1361153 res!905320) b!1361154))

(assert (= (and b!1361154 res!905329) b!1361144))

(assert (= (and b!1361144 res!905325) b!1361155))

(assert (= (and b!1361155 res!905324) b!1361158))

(assert (= (and b!1361158 res!905327) b!1361152))

(assert (= (and b!1361152 c!127352) b!1361157))

(assert (= (and b!1361152 (not c!127352)) b!1361145))

(assert (= (and b!1361152 res!905328) b!1361150))

(assert (= (and b!1361150 res!905332) b!1361151))

(assert (= (and b!1361151 res!905331) b!1361149))

(assert (= (and b!1361149 res!905321) b!1361156))

(declare-fun m!1246315 () Bool)

(assert (=> b!1361156 m!1246315))

(declare-fun m!1246317 () Bool)

(assert (=> b!1361150 m!1246317))

(assert (=> b!1361150 m!1246317))

(declare-fun m!1246319 () Bool)

(assert (=> b!1361150 m!1246319))

(assert (=> b!1361152 m!1246317))

(assert (=> b!1361152 m!1246317))

(declare-fun m!1246321 () Bool)

(assert (=> b!1361152 m!1246321))

(declare-fun m!1246323 () Bool)

(assert (=> b!1361153 m!1246323))

(declare-fun m!1246325 () Bool)

(assert (=> b!1361146 m!1246325))

(declare-fun m!1246327 () Bool)

(assert (=> b!1361157 m!1246327))

(assert (=> b!1361157 m!1246317))

(assert (=> b!1361157 m!1246319))

(declare-fun m!1246329 () Bool)

(assert (=> b!1361157 m!1246329))

(declare-fun m!1246331 () Bool)

(assert (=> b!1361157 m!1246331))

(assert (=> b!1361157 m!1246317))

(assert (=> b!1361157 m!1246319))

(declare-fun m!1246333 () Bool)

(assert (=> b!1361157 m!1246333))

(declare-fun m!1246335 () Bool)

(assert (=> b!1361148 m!1246335))

(declare-fun m!1246337 () Bool)

(assert (=> start!114806 m!1246337))

(declare-fun m!1246339 () Bool)

(assert (=> b!1361149 m!1246339))

(declare-fun m!1246341 () Bool)

(assert (=> b!1361154 m!1246341))

(declare-fun m!1246343 () Bool)

(assert (=> b!1361151 m!1246343))

(declare-fun m!1246345 () Bool)

(assert (=> b!1361147 m!1246345))

(declare-fun m!1246347 () Bool)

(assert (=> b!1361155 m!1246347))

(push 1)

