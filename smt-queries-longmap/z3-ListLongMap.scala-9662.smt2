; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114112 () Bool)

(assert start!114112)

(declare-fun b!1355222 () Bool)

(declare-fun res!900184 () Bool)

(declare-fun e!769672 () Bool)

(assert (=> b!1355222 (=> (not res!900184) (not e!769672))))

(declare-datatypes ((List!31636 0))(
  ( (Nil!31633) (Cons!31632 (h!32841 (_ BitVec 64)) (t!46294 List!31636)) )
))
(declare-fun acc!759 () List!31636)

(declare-fun noDuplicate!2202 (List!31636) Bool)

(assert (=> b!1355222 (= res!900184 (noDuplicate!2202 acc!759))))

(declare-fun b!1355223 () Bool)

(declare-datatypes ((Unit!44526 0))(
  ( (Unit!44527) )
))
(declare-fun e!769673 () Unit!44526)

(declare-fun lt!598543 () Unit!44526)

(assert (=> b!1355223 (= e!769673 lt!598543)))

(declare-fun lt!598539 () Unit!44526)

(declare-fun lemmaListSubSeqRefl!0 (List!31636) Unit!44526)

(assert (=> b!1355223 (= lt!598539 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!765 (List!31636 List!31636) Bool)

(assert (=> b!1355223 (subseq!765 acc!759 acc!759)))

(declare-datatypes ((array!92294 0))(
  ( (array!92295 (arr!44595 (Array (_ BitVec 32) (_ BitVec 64))) (size!45145 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92294)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92294 List!31636 List!31636 (_ BitVec 32)) Unit!44526)

(declare-fun $colon$colon!780 (List!31636 (_ BitVec 64)) List!31636)

(assert (=> b!1355223 (= lt!598543 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!780 acc!759 (select (arr!44595 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92294 (_ BitVec 32) List!31636) Bool)

(assert (=> b!1355223 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355224 () Bool)

(declare-fun res!900193 () Bool)

(assert (=> b!1355224 (=> (not res!900193) (not e!769672))))

(assert (=> b!1355224 (= res!900193 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31633))))

(declare-fun b!1355225 () Bool)

(declare-fun e!769674 () Bool)

(assert (=> b!1355225 (= e!769674 false)))

(declare-fun lt!598542 () Bool)

(assert (=> b!1355225 (= lt!598542 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355226 () Bool)

(declare-fun res!900192 () Bool)

(assert (=> b!1355226 (=> (not res!900192) (not e!769672))))

(declare-fun contains!9345 (List!31636 (_ BitVec 64)) Bool)

(assert (=> b!1355226 (= res!900192 (not (contains!9345 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355227 () Bool)

(declare-fun res!900185 () Bool)

(assert (=> b!1355227 (=> (not res!900185) (not e!769672))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355227 (= res!900185 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355228 () Bool)

(assert (=> b!1355228 (= e!769672 e!769674)))

(declare-fun res!900186 () Bool)

(assert (=> b!1355228 (=> (not res!900186) (not e!769674))))

(declare-fun lt!598541 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355228 (= res!900186 (and (not (= from!3120 i!1404)) (not lt!598541) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598540 () Unit!44526)

(assert (=> b!1355228 (= lt!598540 e!769673)))

(declare-fun c!126959 () Bool)

(assert (=> b!1355228 (= c!126959 lt!598541)))

(assert (=> b!1355228 (= lt!598541 (validKeyInArray!0 (select (arr!44595 a!3742) from!3120)))))

(declare-fun b!1355229 () Bool)

(declare-fun res!900188 () Bool)

(assert (=> b!1355229 (=> (not res!900188) (not e!769672))))

(assert (=> b!1355229 (= res!900188 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355230 () Bool)

(declare-fun res!900190 () Bool)

(assert (=> b!1355230 (=> (not res!900190) (not e!769672))))

(assert (=> b!1355230 (= res!900190 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45145 a!3742)))))

(declare-fun res!900189 () Bool)

(assert (=> start!114112 (=> (not res!900189) (not e!769672))))

(assert (=> start!114112 (= res!900189 (and (bvslt (size!45145 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45145 a!3742))))))

(assert (=> start!114112 e!769672))

(assert (=> start!114112 true))

(declare-fun array_inv!33623 (array!92294) Bool)

(assert (=> start!114112 (array_inv!33623 a!3742)))

(declare-fun b!1355231 () Bool)

(declare-fun Unit!44528 () Unit!44526)

(assert (=> b!1355231 (= e!769673 Unit!44528)))

(declare-fun b!1355232 () Bool)

(declare-fun res!900191 () Bool)

(assert (=> b!1355232 (=> (not res!900191) (not e!769672))))

(assert (=> b!1355232 (= res!900191 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45145 a!3742))))))

(declare-fun b!1355233 () Bool)

(declare-fun res!900187 () Bool)

(assert (=> b!1355233 (=> (not res!900187) (not e!769672))))

(assert (=> b!1355233 (= res!900187 (not (contains!9345 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114112 res!900189) b!1355222))

(assert (= (and b!1355222 res!900184) b!1355233))

(assert (= (and b!1355233 res!900187) b!1355226))

(assert (= (and b!1355226 res!900192) b!1355224))

(assert (= (and b!1355224 res!900193) b!1355229))

(assert (= (and b!1355229 res!900188) b!1355232))

(assert (= (and b!1355232 res!900191) b!1355227))

(assert (= (and b!1355227 res!900185) b!1355230))

(assert (= (and b!1355230 res!900190) b!1355228))

(assert (= (and b!1355228 c!126959) b!1355223))

(assert (= (and b!1355228 (not c!126959)) b!1355231))

(assert (= (and b!1355228 res!900186) b!1355225))

(declare-fun m!1241453 () Bool)

(assert (=> b!1355233 m!1241453))

(declare-fun m!1241455 () Bool)

(assert (=> b!1355224 m!1241455))

(declare-fun m!1241457 () Bool)

(assert (=> start!114112 m!1241457))

(declare-fun m!1241459 () Bool)

(assert (=> b!1355223 m!1241459))

(declare-fun m!1241461 () Bool)

(assert (=> b!1355223 m!1241461))

(declare-fun m!1241463 () Bool)

(assert (=> b!1355223 m!1241463))

(declare-fun m!1241465 () Bool)

(assert (=> b!1355223 m!1241465))

(declare-fun m!1241467 () Bool)

(assert (=> b!1355223 m!1241467))

(assert (=> b!1355223 m!1241461))

(assert (=> b!1355223 m!1241463))

(declare-fun m!1241469 () Bool)

(assert (=> b!1355223 m!1241469))

(assert (=> b!1355225 m!1241467))

(declare-fun m!1241471 () Bool)

(assert (=> b!1355227 m!1241471))

(declare-fun m!1241473 () Bool)

(assert (=> b!1355229 m!1241473))

(declare-fun m!1241475 () Bool)

(assert (=> b!1355226 m!1241475))

(assert (=> b!1355228 m!1241461))

(assert (=> b!1355228 m!1241461))

(declare-fun m!1241477 () Bool)

(assert (=> b!1355228 m!1241477))

(declare-fun m!1241479 () Bool)

(assert (=> b!1355222 m!1241479))

(check-sat (not b!1355222) (not b!1355225) (not b!1355226) (not b!1355228) (not b!1355223) (not b!1355227) (not b!1355224) (not b!1355229) (not start!114112) (not b!1355233))
(check-sat)
