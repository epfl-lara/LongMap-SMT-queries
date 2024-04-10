; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114072 () Bool)

(assert start!114072)

(declare-fun b!1354282 () Bool)

(declare-fun res!899374 () Bool)

(declare-fun e!769387 () Bool)

(assert (=> b!1354282 (=> (not res!899374) (not e!769387))))

(declare-datatypes ((List!31616 0))(
  ( (Nil!31613) (Cons!31612 (h!32821 (_ BitVec 64)) (t!46274 List!31616)) )
))
(declare-fun acc!759 () List!31616)

(declare-fun contains!9325 (List!31616 (_ BitVec 64)) Bool)

(assert (=> b!1354282 (= res!899374 (not (contains!9325 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354283 () Bool)

(declare-fun res!899365 () Bool)

(assert (=> b!1354283 (=> (not res!899365) (not e!769387))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354283 (= res!899365 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354284 () Bool)

(declare-datatypes ((Unit!44466 0))(
  ( (Unit!44467) )
))
(declare-fun e!769386 () Unit!44466)

(declare-fun lt!598195 () Unit!44466)

(assert (=> b!1354284 (= e!769386 lt!598195)))

(declare-fun lt!598194 () Unit!44466)

(declare-fun lemmaListSubSeqRefl!0 (List!31616) Unit!44466)

(assert (=> b!1354284 (= lt!598194 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!745 (List!31616 List!31616) Bool)

(assert (=> b!1354284 (subseq!745 acc!759 acc!759)))

(declare-datatypes ((array!92254 0))(
  ( (array!92255 (arr!44575 (Array (_ BitVec 32) (_ BitVec 64))) (size!45125 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92254)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92254 List!31616 List!31616 (_ BitVec 32)) Unit!44466)

(declare-fun $colon$colon!760 (List!31616 (_ BitVec 64)) List!31616)

(assert (=> b!1354284 (= lt!598195 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!760 acc!759 (select (arr!44575 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92254 (_ BitVec 32) List!31616) Bool)

(assert (=> b!1354284 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354285 () Bool)

(declare-fun res!899371 () Bool)

(declare-fun e!769389 () Bool)

(assert (=> b!1354285 (=> (not res!899371) (not e!769389))))

(declare-fun lt!598197 () List!31616)

(declare-fun noDuplicate!2182 (List!31616) Bool)

(assert (=> b!1354285 (= res!899371 (noDuplicate!2182 lt!598197))))

(declare-fun b!1354286 () Bool)

(declare-fun res!899372 () Bool)

(assert (=> b!1354286 (=> (not res!899372) (not e!769387))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354286 (= res!899372 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45125 a!3742))))))

(declare-fun b!1354287 () Bool)

(declare-fun res!899377 () Bool)

(assert (=> b!1354287 (=> (not res!899377) (not e!769387))))

(assert (=> b!1354287 (= res!899377 (noDuplicate!2182 acc!759))))

(declare-fun b!1354288 () Bool)

(declare-fun Unit!44468 () Unit!44466)

(assert (=> b!1354288 (= e!769386 Unit!44468)))

(declare-fun b!1354289 () Bool)

(assert (=> b!1354289 (= e!769389 false)))

(declare-fun lt!598193 () Bool)

(assert (=> b!1354289 (= lt!598193 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598197))))

(declare-fun b!1354290 () Bool)

(declare-fun res!899370 () Bool)

(assert (=> b!1354290 (=> (not res!899370) (not e!769387))))

(assert (=> b!1354290 (= res!899370 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354291 () Bool)

(declare-fun res!899364 () Bool)

(assert (=> b!1354291 (=> (not res!899364) (not e!769387))))

(assert (=> b!1354291 (= res!899364 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31613))))

(declare-fun b!1354293 () Bool)

(declare-fun res!899367 () Bool)

(assert (=> b!1354293 (=> (not res!899367) (not e!769389))))

(assert (=> b!1354293 (= res!899367 (not (contains!9325 lt!598197 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354294 () Bool)

(declare-fun res!899376 () Bool)

(assert (=> b!1354294 (=> (not res!899376) (not e!769389))))

(assert (=> b!1354294 (= res!899376 (not (contains!9325 lt!598197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354295 () Bool)

(declare-fun e!769388 () Bool)

(assert (=> b!1354295 (= e!769388 e!769389)))

(declare-fun res!899373 () Bool)

(assert (=> b!1354295 (=> (not res!899373) (not e!769389))))

(assert (=> b!1354295 (= res!899373 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354295 (= lt!598197 ($colon$colon!760 acc!759 (select (arr!44575 a!3742) from!3120)))))

(declare-fun b!1354296 () Bool)

(declare-fun res!899368 () Bool)

(assert (=> b!1354296 (=> (not res!899368) (not e!769387))))

(assert (=> b!1354296 (= res!899368 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45125 a!3742)))))

(declare-fun b!1354297 () Bool)

(assert (=> b!1354297 (= e!769387 e!769388)))

(declare-fun res!899366 () Bool)

(assert (=> b!1354297 (=> (not res!899366) (not e!769388))))

(declare-fun lt!598198 () Bool)

(assert (=> b!1354297 (= res!899366 (and (not (= from!3120 i!1404)) lt!598198))))

(declare-fun lt!598196 () Unit!44466)

(assert (=> b!1354297 (= lt!598196 e!769386)))

(declare-fun c!126899 () Bool)

(assert (=> b!1354297 (= c!126899 lt!598198)))

(assert (=> b!1354297 (= lt!598198 (validKeyInArray!0 (select (arr!44575 a!3742) from!3120)))))

(declare-fun res!899375 () Bool)

(assert (=> start!114072 (=> (not res!899375) (not e!769387))))

(assert (=> start!114072 (= res!899375 (and (bvslt (size!45125 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45125 a!3742))))))

(assert (=> start!114072 e!769387))

(assert (=> start!114072 true))

(declare-fun array_inv!33603 (array!92254) Bool)

(assert (=> start!114072 (array_inv!33603 a!3742)))

(declare-fun b!1354292 () Bool)

(declare-fun res!899369 () Bool)

(assert (=> b!1354292 (=> (not res!899369) (not e!769387))))

(assert (=> b!1354292 (= res!899369 (not (contains!9325 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114072 res!899375) b!1354287))

(assert (= (and b!1354287 res!899377) b!1354282))

(assert (= (and b!1354282 res!899374) b!1354292))

(assert (= (and b!1354292 res!899369) b!1354291))

(assert (= (and b!1354291 res!899364) b!1354290))

(assert (= (and b!1354290 res!899370) b!1354286))

(assert (= (and b!1354286 res!899372) b!1354283))

(assert (= (and b!1354283 res!899365) b!1354296))

(assert (= (and b!1354296 res!899368) b!1354297))

(assert (= (and b!1354297 c!126899) b!1354284))

(assert (= (and b!1354297 (not c!126899)) b!1354288))

(assert (= (and b!1354297 res!899366) b!1354295))

(assert (= (and b!1354295 res!899373) b!1354285))

(assert (= (and b!1354285 res!899371) b!1354294))

(assert (= (and b!1354294 res!899376) b!1354293))

(assert (= (and b!1354293 res!899367) b!1354289))

(declare-fun m!1240693 () Bool)

(assert (=> b!1354292 m!1240693))

(declare-fun m!1240695 () Bool)

(assert (=> b!1354295 m!1240695))

(assert (=> b!1354295 m!1240695))

(declare-fun m!1240697 () Bool)

(assert (=> b!1354295 m!1240697))

(declare-fun m!1240699 () Bool)

(assert (=> b!1354291 m!1240699))

(declare-fun m!1240701 () Bool)

(assert (=> b!1354287 m!1240701))

(declare-fun m!1240703 () Bool)

(assert (=> b!1354293 m!1240703))

(assert (=> b!1354297 m!1240695))

(assert (=> b!1354297 m!1240695))

(declare-fun m!1240705 () Bool)

(assert (=> b!1354297 m!1240705))

(declare-fun m!1240707 () Bool)

(assert (=> b!1354289 m!1240707))

(declare-fun m!1240709 () Bool)

(assert (=> start!114072 m!1240709))

(declare-fun m!1240711 () Bool)

(assert (=> b!1354285 m!1240711))

(declare-fun m!1240713 () Bool)

(assert (=> b!1354294 m!1240713))

(declare-fun m!1240715 () Bool)

(assert (=> b!1354283 m!1240715))

(declare-fun m!1240717 () Bool)

(assert (=> b!1354284 m!1240717))

(assert (=> b!1354284 m!1240695))

(assert (=> b!1354284 m!1240697))

(declare-fun m!1240719 () Bool)

(assert (=> b!1354284 m!1240719))

(declare-fun m!1240721 () Bool)

(assert (=> b!1354284 m!1240721))

(assert (=> b!1354284 m!1240695))

(assert (=> b!1354284 m!1240697))

(declare-fun m!1240723 () Bool)

(assert (=> b!1354284 m!1240723))

(declare-fun m!1240725 () Bool)

(assert (=> b!1354282 m!1240725))

(declare-fun m!1240727 () Bool)

(assert (=> b!1354290 m!1240727))

(push 1)

