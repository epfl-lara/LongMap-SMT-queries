; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114102 () Bool)

(assert start!114102)

(declare-fun b!1355037 () Bool)

(declare-fun e!769614 () Bool)

(declare-fun e!769615 () Bool)

(assert (=> b!1355037 (= e!769614 e!769615)))

(declare-fun res!900042 () Bool)

(assert (=> b!1355037 (=> (not res!900042) (not e!769615))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1355037 (= res!900042 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31631 0))(
  ( (Nil!31628) (Cons!31627 (h!32836 (_ BitVec 64)) (t!46289 List!31631)) )
))
(declare-fun acc!759 () List!31631)

(declare-datatypes ((array!92284 0))(
  ( (array!92285 (arr!44590 (Array (_ BitVec 32) (_ BitVec 64))) (size!45140 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92284)

(declare-fun lt!598466 () List!31631)

(declare-fun $colon$colon!775 (List!31631 (_ BitVec 64)) List!31631)

(assert (=> b!1355037 (= lt!598466 ($colon$colon!775 acc!759 (select (arr!44590 a!3742) from!3120)))))

(declare-fun b!1355038 () Bool)

(declare-fun res!900030 () Bool)

(declare-fun e!769613 () Bool)

(assert (=> b!1355038 (=> (not res!900030) (not e!769613))))

(declare-fun arrayNoDuplicates!0 (array!92284 (_ BitVec 32) List!31631) Bool)

(assert (=> b!1355038 (= res!900030 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!900043 () Bool)

(assert (=> start!114102 (=> (not res!900043) (not e!769613))))

(assert (=> start!114102 (= res!900043 (and (bvslt (size!45140 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45140 a!3742))))))

(assert (=> start!114102 e!769613))

(assert (=> start!114102 true))

(declare-fun array_inv!33618 (array!92284) Bool)

(assert (=> start!114102 (array_inv!33618 a!3742)))

(declare-fun b!1355039 () Bool)

(declare-datatypes ((Unit!44511 0))(
  ( (Unit!44512) )
))
(declare-fun e!769612 () Unit!44511)

(declare-fun Unit!44513 () Unit!44511)

(assert (=> b!1355039 (= e!769612 Unit!44513)))

(declare-fun b!1355040 () Bool)

(assert (=> b!1355040 (= e!769613 e!769614)))

(declare-fun res!900038 () Bool)

(assert (=> b!1355040 (=> (not res!900038) (not e!769614))))

(declare-fun lt!598468 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355040 (= res!900038 (and (not (= from!3120 i!1404)) lt!598468))))

(declare-fun lt!598463 () Unit!44511)

(assert (=> b!1355040 (= lt!598463 e!769612)))

(declare-fun c!126944 () Bool)

(assert (=> b!1355040 (= c!126944 lt!598468)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355040 (= lt!598468 (validKeyInArray!0 (select (arr!44590 a!3742) from!3120)))))

(declare-fun b!1355041 () Bool)

(assert (=> b!1355041 (= e!769615 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355041 (arrayNoDuplicates!0 (array!92285 (store (arr!44590 a!3742) i!1404 l!3587) (size!45140 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598466)))

(declare-fun lt!598465 () Unit!44511)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92284 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31631) Unit!44511)

(assert (=> b!1355041 (= lt!598465 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598466))))

(declare-fun b!1355042 () Bool)

(declare-fun res!900031 () Bool)

(assert (=> b!1355042 (=> (not res!900031) (not e!769615))))

(declare-fun contains!9340 (List!31631 (_ BitVec 64)) Bool)

(assert (=> b!1355042 (= res!900031 (not (contains!9340 lt!598466 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355043 () Bool)

(declare-fun res!900036 () Bool)

(assert (=> b!1355043 (=> (not res!900036) (not e!769613))))

(assert (=> b!1355043 (= res!900036 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355044 () Bool)

(declare-fun res!900040 () Bool)

(assert (=> b!1355044 (=> (not res!900040) (not e!769615))))

(assert (=> b!1355044 (= res!900040 (not (contains!9340 lt!598466 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355045 () Bool)

(declare-fun res!900032 () Bool)

(assert (=> b!1355045 (=> (not res!900032) (not e!769615))))

(assert (=> b!1355045 (= res!900032 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598466))))

(declare-fun b!1355046 () Bool)

(declare-fun res!900035 () Bool)

(assert (=> b!1355046 (=> (not res!900035) (not e!769613))))

(assert (=> b!1355046 (= res!900035 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31628))))

(declare-fun b!1355047 () Bool)

(declare-fun lt!598467 () Unit!44511)

(assert (=> b!1355047 (= e!769612 lt!598467)))

(declare-fun lt!598464 () Unit!44511)

(declare-fun lemmaListSubSeqRefl!0 (List!31631) Unit!44511)

(assert (=> b!1355047 (= lt!598464 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!760 (List!31631 List!31631) Bool)

(assert (=> b!1355047 (subseq!760 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92284 List!31631 List!31631 (_ BitVec 32)) Unit!44511)

(assert (=> b!1355047 (= lt!598467 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!775 acc!759 (select (arr!44590 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355047 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355048 () Bool)

(declare-fun res!900039 () Bool)

(assert (=> b!1355048 (=> (not res!900039) (not e!769613))))

(declare-fun noDuplicate!2197 (List!31631) Bool)

(assert (=> b!1355048 (= res!900039 (noDuplicate!2197 acc!759))))

(declare-fun b!1355049 () Bool)

(declare-fun res!900041 () Bool)

(assert (=> b!1355049 (=> (not res!900041) (not e!769615))))

(assert (=> b!1355049 (= res!900041 (noDuplicate!2197 lt!598466))))

(declare-fun b!1355050 () Bool)

(declare-fun res!900033 () Bool)

(assert (=> b!1355050 (=> (not res!900033) (not e!769613))))

(assert (=> b!1355050 (= res!900033 (not (contains!9340 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355051 () Bool)

(declare-fun res!900029 () Bool)

(assert (=> b!1355051 (=> (not res!900029) (not e!769613))))

(assert (=> b!1355051 (= res!900029 (not (contains!9340 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355052 () Bool)

(declare-fun res!900034 () Bool)

(assert (=> b!1355052 (=> (not res!900034) (not e!769613))))

(assert (=> b!1355052 (= res!900034 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45140 a!3742))))))

(declare-fun b!1355053 () Bool)

(declare-fun res!900037 () Bool)

(assert (=> b!1355053 (=> (not res!900037) (not e!769613))))

(assert (=> b!1355053 (= res!900037 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45140 a!3742)))))

(assert (= (and start!114102 res!900043) b!1355048))

(assert (= (and b!1355048 res!900039) b!1355051))

(assert (= (and b!1355051 res!900029) b!1355050))

(assert (= (and b!1355050 res!900033) b!1355046))

(assert (= (and b!1355046 res!900035) b!1355038))

(assert (= (and b!1355038 res!900030) b!1355052))

(assert (= (and b!1355052 res!900034) b!1355043))

(assert (= (and b!1355043 res!900036) b!1355053))

(assert (= (and b!1355053 res!900037) b!1355040))

(assert (= (and b!1355040 c!126944) b!1355047))

(assert (= (and b!1355040 (not c!126944)) b!1355039))

(assert (= (and b!1355040 res!900038) b!1355037))

(assert (= (and b!1355037 res!900042) b!1355049))

(assert (= (and b!1355049 res!900041) b!1355044))

(assert (= (and b!1355044 res!900040) b!1355042))

(assert (= (and b!1355042 res!900031) b!1355045))

(assert (= (and b!1355045 res!900032) b!1355041))

(declare-fun m!1241299 () Bool)

(assert (=> b!1355043 m!1241299))

(declare-fun m!1241301 () Bool)

(assert (=> b!1355045 m!1241301))

(declare-fun m!1241303 () Bool)

(assert (=> b!1355048 m!1241303))

(declare-fun m!1241305 () Bool)

(assert (=> b!1355037 m!1241305))

(assert (=> b!1355037 m!1241305))

(declare-fun m!1241307 () Bool)

(assert (=> b!1355037 m!1241307))

(declare-fun m!1241309 () Bool)

(assert (=> b!1355049 m!1241309))

(declare-fun m!1241311 () Bool)

(assert (=> b!1355046 m!1241311))

(declare-fun m!1241313 () Bool)

(assert (=> b!1355044 m!1241313))

(declare-fun m!1241315 () Bool)

(assert (=> b!1355041 m!1241315))

(declare-fun m!1241317 () Bool)

(assert (=> b!1355041 m!1241317))

(declare-fun m!1241319 () Bool)

(assert (=> b!1355041 m!1241319))

(declare-fun m!1241321 () Bool)

(assert (=> b!1355050 m!1241321))

(declare-fun m!1241323 () Bool)

(assert (=> start!114102 m!1241323))

(declare-fun m!1241325 () Bool)

(assert (=> b!1355047 m!1241325))

(assert (=> b!1355047 m!1241305))

(assert (=> b!1355047 m!1241307))

(declare-fun m!1241327 () Bool)

(assert (=> b!1355047 m!1241327))

(declare-fun m!1241329 () Bool)

(assert (=> b!1355047 m!1241329))

(assert (=> b!1355047 m!1241305))

(assert (=> b!1355047 m!1241307))

(declare-fun m!1241331 () Bool)

(assert (=> b!1355047 m!1241331))

(declare-fun m!1241333 () Bool)

(assert (=> b!1355038 m!1241333))

(declare-fun m!1241335 () Bool)

(assert (=> b!1355042 m!1241335))

(assert (=> b!1355040 m!1241305))

(assert (=> b!1355040 m!1241305))

(declare-fun m!1241337 () Bool)

(assert (=> b!1355040 m!1241337))

(declare-fun m!1241339 () Bool)

(assert (=> b!1355051 m!1241339))

(push 1)

