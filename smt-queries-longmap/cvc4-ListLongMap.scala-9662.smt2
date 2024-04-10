; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114114 () Bool)

(assert start!114114)

(declare-fun res!900214 () Bool)

(declare-fun e!769684 () Bool)

(assert (=> start!114114 (=> (not res!900214) (not e!769684))))

(declare-datatypes ((array!92296 0))(
  ( (array!92297 (arr!44596 (Array (_ BitVec 32) (_ BitVec 64))) (size!45146 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92296)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114114 (= res!900214 (and (bvslt (size!45146 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45146 a!3742))))))

(assert (=> start!114114 e!769684))

(assert (=> start!114114 true))

(declare-fun array_inv!33624 (array!92296) Bool)

(assert (=> start!114114 (array_inv!33624 a!3742)))

(declare-fun b!1355258 () Bool)

(declare-fun res!900215 () Bool)

(assert (=> b!1355258 (=> (not res!900215) (not e!769684))))

(assert (=> b!1355258 (= res!900215 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45146 a!3742)))))

(declare-fun b!1355259 () Bool)

(declare-fun res!900216 () Bool)

(assert (=> b!1355259 (=> (not res!900216) (not e!769684))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355259 (= res!900216 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45146 a!3742))))))

(declare-fun b!1355260 () Bool)

(declare-fun e!769687 () Bool)

(assert (=> b!1355260 (= e!769684 e!769687)))

(declare-fun res!900217 () Bool)

(assert (=> b!1355260 (=> (not res!900217) (not e!769687))))

(declare-fun lt!598556 () Bool)

(assert (=> b!1355260 (= res!900217 (and (not (= from!3120 i!1404)) (not lt!598556) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44529 0))(
  ( (Unit!44530) )
))
(declare-fun lt!598555 () Unit!44529)

(declare-fun e!769686 () Unit!44529)

(assert (=> b!1355260 (= lt!598555 e!769686)))

(declare-fun c!126962 () Bool)

(assert (=> b!1355260 (= c!126962 lt!598556)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355260 (= lt!598556 (validKeyInArray!0 (select (arr!44596 a!3742) from!3120)))))

(declare-fun b!1355261 () Bool)

(declare-fun Unit!44531 () Unit!44529)

(assert (=> b!1355261 (= e!769686 Unit!44531)))

(declare-fun b!1355262 () Bool)

(declare-fun res!900220 () Bool)

(assert (=> b!1355262 (=> (not res!900220) (not e!769684))))

(declare-datatypes ((List!31637 0))(
  ( (Nil!31634) (Cons!31633 (h!32842 (_ BitVec 64)) (t!46295 List!31637)) )
))
(declare-fun acc!759 () List!31637)

(declare-fun contains!9346 (List!31637 (_ BitVec 64)) Bool)

(assert (=> b!1355262 (= res!900220 (not (contains!9346 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355263 () Bool)

(declare-fun lt!598554 () Unit!44529)

(assert (=> b!1355263 (= e!769686 lt!598554)))

(declare-fun lt!598557 () Unit!44529)

(declare-fun lemmaListSubSeqRefl!0 (List!31637) Unit!44529)

(assert (=> b!1355263 (= lt!598557 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!766 (List!31637 List!31637) Bool)

(assert (=> b!1355263 (subseq!766 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92296 List!31637 List!31637 (_ BitVec 32)) Unit!44529)

(declare-fun $colon$colon!781 (List!31637 (_ BitVec 64)) List!31637)

(assert (=> b!1355263 (= lt!598554 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!781 acc!759 (select (arr!44596 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92296 (_ BitVec 32) List!31637) Bool)

(assert (=> b!1355263 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355264 () Bool)

(declare-fun res!900223 () Bool)

(assert (=> b!1355264 (=> (not res!900223) (not e!769684))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355264 (= res!900223 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355265 () Bool)

(declare-fun res!900221 () Bool)

(assert (=> b!1355265 (=> (not res!900221) (not e!769684))))

(assert (=> b!1355265 (= res!900221 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355266 () Bool)

(assert (=> b!1355266 (= e!769687 false)))

(declare-fun lt!598558 () Bool)

(assert (=> b!1355266 (= lt!598558 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355267 () Bool)

(declare-fun res!900222 () Bool)

(assert (=> b!1355267 (=> (not res!900222) (not e!769684))))

(assert (=> b!1355267 (= res!900222 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31634))))

(declare-fun b!1355268 () Bool)

(declare-fun res!900218 () Bool)

(assert (=> b!1355268 (=> (not res!900218) (not e!769684))))

(assert (=> b!1355268 (= res!900218 (not (contains!9346 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355269 () Bool)

(declare-fun res!900219 () Bool)

(assert (=> b!1355269 (=> (not res!900219) (not e!769684))))

(declare-fun noDuplicate!2203 (List!31637) Bool)

(assert (=> b!1355269 (= res!900219 (noDuplicate!2203 acc!759))))

(assert (= (and start!114114 res!900214) b!1355269))

(assert (= (and b!1355269 res!900219) b!1355262))

(assert (= (and b!1355262 res!900220) b!1355268))

(assert (= (and b!1355268 res!900218) b!1355267))

(assert (= (and b!1355267 res!900222) b!1355265))

(assert (= (and b!1355265 res!900221) b!1355259))

(assert (= (and b!1355259 res!900216) b!1355264))

(assert (= (and b!1355264 res!900223) b!1355258))

(assert (= (and b!1355258 res!900215) b!1355260))

(assert (= (and b!1355260 c!126962) b!1355263))

(assert (= (and b!1355260 (not c!126962)) b!1355261))

(assert (= (and b!1355260 res!900217) b!1355266))

(declare-fun m!1241481 () Bool)

(assert (=> b!1355264 m!1241481))

(declare-fun m!1241483 () Bool)

(assert (=> b!1355263 m!1241483))

(declare-fun m!1241485 () Bool)

(assert (=> b!1355263 m!1241485))

(declare-fun m!1241487 () Bool)

(assert (=> b!1355263 m!1241487))

(declare-fun m!1241489 () Bool)

(assert (=> b!1355263 m!1241489))

(declare-fun m!1241491 () Bool)

(assert (=> b!1355263 m!1241491))

(assert (=> b!1355263 m!1241485))

(assert (=> b!1355263 m!1241487))

(declare-fun m!1241493 () Bool)

(assert (=> b!1355263 m!1241493))

(assert (=> b!1355260 m!1241485))

(assert (=> b!1355260 m!1241485))

(declare-fun m!1241495 () Bool)

(assert (=> b!1355260 m!1241495))

(declare-fun m!1241497 () Bool)

(assert (=> b!1355265 m!1241497))

(assert (=> b!1355266 m!1241491))

(declare-fun m!1241499 () Bool)

(assert (=> start!114114 m!1241499))

(declare-fun m!1241501 () Bool)

(assert (=> b!1355267 m!1241501))

(declare-fun m!1241503 () Bool)

(assert (=> b!1355269 m!1241503))

(declare-fun m!1241505 () Bool)

(assert (=> b!1355262 m!1241505))

(declare-fun m!1241507 () Bool)

(assert (=> b!1355268 m!1241507))

(push 1)

(assert (not b!1355262))

