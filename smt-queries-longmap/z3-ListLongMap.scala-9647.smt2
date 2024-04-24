; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114244 () Bool)

(assert start!114244)

(declare-fun b!1354354 () Bool)

(declare-fun e!769846 () Bool)

(declare-fun e!769849 () Bool)

(assert (=> b!1354354 (= e!769846 e!769849)))

(declare-fun res!898817 () Bool)

(assert (=> b!1354354 (=> (not res!898817) (not e!769849))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354354 (= res!898817 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44327 0))(
  ( (Unit!44328) )
))
(declare-fun lt!598218 () Unit!44327)

(declare-fun e!769847 () Unit!44327)

(assert (=> b!1354354 (= lt!598218 e!769847)))

(declare-fun c!127219 () Bool)

(declare-datatypes ((array!92317 0))(
  ( (array!92318 (arr!44602 (Array (_ BitVec 32) (_ BitVec 64))) (size!45153 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92317)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354354 (= c!127219 (validKeyInArray!0 (select (arr!44602 a!3742) from!3120)))))

(declare-fun b!1354355 () Bool)

(declare-fun res!898818 () Bool)

(assert (=> b!1354355 (=> (not res!898818) (not e!769846))))

(declare-datatypes ((List!31630 0))(
  ( (Nil!31627) (Cons!31626 (h!32844 (_ BitVec 64)) (t!46280 List!31630)) )
))
(declare-fun arrayNoDuplicates!0 (array!92317 (_ BitVec 32) List!31630) Bool)

(assert (=> b!1354355 (= res!898818 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31627))))

(declare-fun b!1354356 () Bool)

(declare-fun lt!598217 () Unit!44327)

(assert (=> b!1354356 (= e!769847 lt!598217)))

(declare-fun lt!598216 () Unit!44327)

(declare-fun acc!759 () List!31630)

(declare-fun lemmaListSubSeqRefl!0 (List!31630) Unit!44327)

(assert (=> b!1354356 (= lt!598216 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!719 (List!31630 List!31630) Bool)

(assert (=> b!1354356 (subseq!719 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92317 List!31630 List!31630 (_ BitVec 32)) Unit!44327)

(declare-fun $colon$colon!733 (List!31630 (_ BitVec 64)) List!31630)

(assert (=> b!1354356 (= lt!598217 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!733 acc!759 (select (arr!44602 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354356 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354357 () Bool)

(declare-fun res!898816 () Bool)

(assert (=> b!1354357 (=> (not res!898816) (not e!769846))))

(assert (=> b!1354357 (= res!898816 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45153 a!3742))))))

(declare-fun b!1354358 () Bool)

(declare-fun res!898814 () Bool)

(assert (=> b!1354358 (=> (not res!898814) (not e!769846))))

(assert (=> b!1354358 (= res!898814 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45153 a!3742)))))

(declare-fun res!898813 () Bool)

(assert (=> start!114244 (=> (not res!898813) (not e!769846))))

(assert (=> start!114244 (= res!898813 (and (bvslt (size!45153 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45153 a!3742))))))

(assert (=> start!114244 e!769846))

(assert (=> start!114244 true))

(declare-fun array_inv!33883 (array!92317) Bool)

(assert (=> start!114244 (array_inv!33883 a!3742)))

(declare-fun b!1354359 () Bool)

(declare-fun res!898819 () Bool)

(assert (=> b!1354359 (=> (not res!898819) (not e!769846))))

(assert (=> b!1354359 (= res!898819 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354360 () Bool)

(declare-fun res!898820 () Bool)

(assert (=> b!1354360 (=> (not res!898820) (not e!769846))))

(declare-fun noDuplicate!2173 (List!31630) Bool)

(assert (=> b!1354360 (= res!898820 (noDuplicate!2173 acc!759))))

(declare-fun b!1354361 () Bool)

(declare-fun res!898812 () Bool)

(assert (=> b!1354361 (=> (not res!898812) (not e!769846))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354361 (= res!898812 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354362 () Bool)

(declare-fun res!898815 () Bool)

(assert (=> b!1354362 (=> (not res!898815) (not e!769846))))

(declare-fun contains!9342 (List!31630 (_ BitVec 64)) Bool)

(assert (=> b!1354362 (= res!898815 (not (contains!9342 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354363 () Bool)

(assert (=> b!1354363 (= e!769849 (not true))))

(assert (=> b!1354363 (arrayNoDuplicates!0 (array!92318 (store (arr!44602 a!3742) i!1404 l!3587) (size!45153 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598215 () Unit!44327)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31630) Unit!44327)

(assert (=> b!1354363 (= lt!598215 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1354364 () Bool)

(declare-fun Unit!44329 () Unit!44327)

(assert (=> b!1354364 (= e!769847 Unit!44329)))

(declare-fun b!1354365 () Bool)

(declare-fun res!898821 () Bool)

(assert (=> b!1354365 (=> (not res!898821) (not e!769846))))

(assert (=> b!1354365 (= res!898821 (not (contains!9342 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354366 () Bool)

(declare-fun res!898811 () Bool)

(assert (=> b!1354366 (=> (not res!898811) (not e!769849))))

(assert (=> b!1354366 (= res!898811 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114244 res!898813) b!1354360))

(assert (= (and b!1354360 res!898820) b!1354362))

(assert (= (and b!1354362 res!898815) b!1354365))

(assert (= (and b!1354365 res!898821) b!1354355))

(assert (= (and b!1354355 res!898818) b!1354359))

(assert (= (and b!1354359 res!898819) b!1354357))

(assert (= (and b!1354357 res!898816) b!1354361))

(assert (= (and b!1354361 res!898812) b!1354358))

(assert (= (and b!1354358 res!898814) b!1354354))

(assert (= (and b!1354354 c!127219) b!1354356))

(assert (= (and b!1354354 (not c!127219)) b!1354364))

(assert (= (and b!1354354 res!898817) b!1354366))

(assert (= (and b!1354366 res!898811) b!1354363))

(declare-fun m!1241359 () Bool)

(assert (=> b!1354356 m!1241359))

(declare-fun m!1241361 () Bool)

(assert (=> b!1354356 m!1241361))

(declare-fun m!1241363 () Bool)

(assert (=> b!1354356 m!1241363))

(declare-fun m!1241365 () Bool)

(assert (=> b!1354356 m!1241365))

(declare-fun m!1241367 () Bool)

(assert (=> b!1354356 m!1241367))

(assert (=> b!1354356 m!1241361))

(assert (=> b!1354356 m!1241363))

(declare-fun m!1241369 () Bool)

(assert (=> b!1354356 m!1241369))

(declare-fun m!1241371 () Bool)

(assert (=> b!1354359 m!1241371))

(declare-fun m!1241373 () Bool)

(assert (=> b!1354360 m!1241373))

(declare-fun m!1241375 () Bool)

(assert (=> b!1354361 m!1241375))

(declare-fun m!1241377 () Bool)

(assert (=> start!114244 m!1241377))

(declare-fun m!1241379 () Bool)

(assert (=> b!1354365 m!1241379))

(declare-fun m!1241381 () Bool)

(assert (=> b!1354363 m!1241381))

(declare-fun m!1241383 () Bool)

(assert (=> b!1354363 m!1241383))

(declare-fun m!1241385 () Bool)

(assert (=> b!1354363 m!1241385))

(declare-fun m!1241387 () Bool)

(assert (=> b!1354355 m!1241387))

(assert (=> b!1354354 m!1241361))

(assert (=> b!1354354 m!1241361))

(declare-fun m!1241389 () Bool)

(assert (=> b!1354354 m!1241389))

(assert (=> b!1354366 m!1241367))

(declare-fun m!1241391 () Bool)

(assert (=> b!1354362 m!1241391))

(check-sat (not b!1354363) (not start!114244) (not b!1354360) (not b!1354354) (not b!1354366) (not b!1354361) (not b!1354356) (not b!1354359) (not b!1354365) (not b!1354362) (not b!1354355))
(check-sat)
