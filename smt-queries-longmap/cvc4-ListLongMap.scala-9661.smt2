; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114108 () Bool)

(assert start!114108)

(declare-fun b!1355150 () Bool)

(declare-fun res!900125 () Bool)

(declare-fun e!769648 () Bool)

(assert (=> b!1355150 (=> (not res!900125) (not e!769648))))

(declare-datatypes ((array!92290 0))(
  ( (array!92291 (arr!44593 (Array (_ BitVec 32) (_ BitVec 64))) (size!45143 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92290)

(declare-datatypes ((List!31634 0))(
  ( (Nil!31631) (Cons!31630 (h!32839 (_ BitVec 64)) (t!46292 List!31634)) )
))
(declare-fun arrayNoDuplicates!0 (array!92290 (_ BitVec 32) List!31634) Bool)

(assert (=> b!1355150 (= res!900125 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31631))))

(declare-fun b!1355151 () Bool)

(declare-fun res!900127 () Bool)

(assert (=> b!1355151 (=> (not res!900127) (not e!769648))))

(declare-fun acc!759 () List!31634)

(declare-fun contains!9343 (List!31634 (_ BitVec 64)) Bool)

(assert (=> b!1355151 (= res!900127 (not (contains!9343 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355152 () Bool)

(declare-fun res!900129 () Bool)

(assert (=> b!1355152 (=> (not res!900129) (not e!769648))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355152 (= res!900129 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45143 a!3742))))))

(declare-fun b!1355153 () Bool)

(declare-fun res!900132 () Bool)

(assert (=> b!1355153 (=> (not res!900132) (not e!769648))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1355153 (= res!900132 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45143 a!3742)))))

(declare-fun b!1355154 () Bool)

(declare-fun res!900124 () Bool)

(assert (=> b!1355154 (=> (not res!900124) (not e!769648))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355154 (= res!900124 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355155 () Bool)

(declare-fun e!769649 () Bool)

(assert (=> b!1355155 (= e!769648 e!769649)))

(declare-fun res!900133 () Bool)

(assert (=> b!1355155 (=> (not res!900133) (not e!769649))))

(declare-fun lt!598511 () Bool)

(assert (=> b!1355155 (= res!900133 (and (not (= from!3120 i!1404)) (not lt!598511) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44520 0))(
  ( (Unit!44521) )
))
(declare-fun lt!598512 () Unit!44520)

(declare-fun e!769650 () Unit!44520)

(assert (=> b!1355155 (= lt!598512 e!769650)))

(declare-fun c!126953 () Bool)

(assert (=> b!1355155 (= c!126953 lt!598511)))

(assert (=> b!1355155 (= lt!598511 (validKeyInArray!0 (select (arr!44593 a!3742) from!3120)))))

(declare-fun b!1355156 () Bool)

(declare-fun lt!598513 () Unit!44520)

(assert (=> b!1355156 (= e!769650 lt!598513)))

(declare-fun lt!598510 () Unit!44520)

(declare-fun lemmaListSubSeqRefl!0 (List!31634) Unit!44520)

(assert (=> b!1355156 (= lt!598510 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!763 (List!31634 List!31634) Bool)

(assert (=> b!1355156 (subseq!763 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92290 List!31634 List!31634 (_ BitVec 32)) Unit!44520)

(declare-fun $colon$colon!778 (List!31634 (_ BitVec 64)) List!31634)

(assert (=> b!1355156 (= lt!598513 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!778 acc!759 (select (arr!44593 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355156 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355158 () Bool)

(declare-fun res!900130 () Bool)

(assert (=> b!1355158 (=> (not res!900130) (not e!769648))))

(declare-fun noDuplicate!2200 (List!31634) Bool)

(assert (=> b!1355158 (= res!900130 (noDuplicate!2200 acc!759))))

(declare-fun b!1355159 () Bool)

(declare-fun res!900126 () Bool)

(assert (=> b!1355159 (=> (not res!900126) (not e!769648))))

(assert (=> b!1355159 (= res!900126 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355157 () Bool)

(assert (=> b!1355157 (= e!769649 false)))

(declare-fun lt!598509 () Bool)

(assert (=> b!1355157 (= lt!598509 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!900128 () Bool)

(assert (=> start!114108 (=> (not res!900128) (not e!769648))))

(assert (=> start!114108 (= res!900128 (and (bvslt (size!45143 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45143 a!3742))))))

(assert (=> start!114108 e!769648))

(assert (=> start!114108 true))

(declare-fun array_inv!33621 (array!92290) Bool)

(assert (=> start!114108 (array_inv!33621 a!3742)))

(declare-fun b!1355160 () Bool)

(declare-fun Unit!44522 () Unit!44520)

(assert (=> b!1355160 (= e!769650 Unit!44522)))

(declare-fun b!1355161 () Bool)

(declare-fun res!900131 () Bool)

(assert (=> b!1355161 (=> (not res!900131) (not e!769648))))

(assert (=> b!1355161 (= res!900131 (not (contains!9343 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114108 res!900128) b!1355158))

(assert (= (and b!1355158 res!900130) b!1355161))

(assert (= (and b!1355161 res!900131) b!1355151))

(assert (= (and b!1355151 res!900127) b!1355150))

(assert (= (and b!1355150 res!900125) b!1355159))

(assert (= (and b!1355159 res!900126) b!1355152))

(assert (= (and b!1355152 res!900129) b!1355154))

(assert (= (and b!1355154 res!900124) b!1355153))

(assert (= (and b!1355153 res!900132) b!1355155))

(assert (= (and b!1355155 c!126953) b!1355156))

(assert (= (and b!1355155 (not c!126953)) b!1355160))

(assert (= (and b!1355155 res!900133) b!1355157))

(declare-fun m!1241397 () Bool)

(assert (=> b!1355158 m!1241397))

(declare-fun m!1241399 () Bool)

(assert (=> b!1355161 m!1241399))

(declare-fun m!1241401 () Bool)

(assert (=> b!1355159 m!1241401))

(declare-fun m!1241403 () Bool)

(assert (=> b!1355150 m!1241403))

(declare-fun m!1241405 () Bool)

(assert (=> b!1355154 m!1241405))

(declare-fun m!1241407 () Bool)

(assert (=> b!1355151 m!1241407))

(declare-fun m!1241409 () Bool)

(assert (=> b!1355157 m!1241409))

(declare-fun m!1241411 () Bool)

(assert (=> start!114108 m!1241411))

(declare-fun m!1241413 () Bool)

(assert (=> b!1355156 m!1241413))

(declare-fun m!1241415 () Bool)

(assert (=> b!1355156 m!1241415))

(declare-fun m!1241417 () Bool)

(assert (=> b!1355156 m!1241417))

(declare-fun m!1241419 () Bool)

(assert (=> b!1355156 m!1241419))

(assert (=> b!1355156 m!1241409))

(assert (=> b!1355156 m!1241415))

(assert (=> b!1355156 m!1241417))

(declare-fun m!1241421 () Bool)

(assert (=> b!1355156 m!1241421))

(assert (=> b!1355155 m!1241415))

(assert (=> b!1355155 m!1241415))

(declare-fun m!1241423 () Bool)

(assert (=> b!1355155 m!1241423))

(push 1)

(assert (not b!1355155))

(assert (not b!1355159))

