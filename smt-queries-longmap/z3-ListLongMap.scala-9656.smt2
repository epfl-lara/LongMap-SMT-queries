; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114298 () Bool)

(assert start!114298)

(declare-fun b!1355629 () Bool)

(declare-fun e!770245 () Bool)

(assert (=> b!1355629 (= e!770245 false)))

(declare-fun lt!598687 () Bool)

(declare-datatypes ((List!31657 0))(
  ( (Nil!31654) (Cons!31653 (h!32871 (_ BitVec 64)) (t!46307 List!31657)) )
))
(declare-fun lt!598691 () List!31657)

(declare-datatypes ((array!92371 0))(
  ( (array!92372 (arr!44629 (Array (_ BitVec 32) (_ BitVec 64))) (size!45180 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92371)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92371 (_ BitVec 32) List!31657) Bool)

(assert (=> b!1355629 (= lt!598687 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598691))))

(declare-fun b!1355630 () Bool)

(declare-datatypes ((Unit!44408 0))(
  ( (Unit!44409) )
))
(declare-fun e!770247 () Unit!44408)

(declare-fun Unit!44410 () Unit!44408)

(assert (=> b!1355630 (= e!770247 Unit!44410)))

(declare-fun b!1355631 () Bool)

(declare-fun lt!598688 () Unit!44408)

(assert (=> b!1355631 (= e!770247 lt!598688)))

(declare-fun lt!598690 () Unit!44408)

(declare-fun acc!759 () List!31657)

(declare-fun lemmaListSubSeqRefl!0 (List!31657) Unit!44408)

(assert (=> b!1355631 (= lt!598690 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!746 (List!31657 List!31657) Bool)

(assert (=> b!1355631 (subseq!746 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92371 List!31657 List!31657 (_ BitVec 32)) Unit!44408)

(declare-fun $colon$colon!760 (List!31657 (_ BitVec 64)) List!31657)

(assert (=> b!1355631 (= lt!598688 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!760 acc!759 (select (arr!44629 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355631 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355632 () Bool)

(declare-fun res!899925 () Bool)

(declare-fun e!770244 () Bool)

(assert (=> b!1355632 (=> (not res!899925) (not e!770244))))

(assert (=> b!1355632 (= res!899925 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31654))))

(declare-fun b!1355633 () Bool)

(declare-fun res!899930 () Bool)

(assert (=> b!1355633 (=> (not res!899930) (not e!770245))))

(declare-fun noDuplicate!2200 (List!31657) Bool)

(assert (=> b!1355633 (= res!899930 (noDuplicate!2200 lt!598691))))

(declare-fun b!1355634 () Bool)

(declare-fun res!899935 () Bool)

(assert (=> b!1355634 (=> (not res!899935) (not e!770245))))

(declare-fun contains!9369 (List!31657 (_ BitVec 64)) Bool)

(assert (=> b!1355634 (= res!899935 (not (contains!9369 lt!598691 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355635 () Bool)

(declare-fun res!899929 () Bool)

(assert (=> b!1355635 (=> (not res!899929) (not e!770244))))

(assert (=> b!1355635 (= res!899929 (noDuplicate!2200 acc!759))))

(declare-fun res!899931 () Bool)

(assert (=> start!114298 (=> (not res!899931) (not e!770244))))

(assert (=> start!114298 (= res!899931 (and (bvslt (size!45180 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45180 a!3742))))))

(assert (=> start!114298 e!770244))

(assert (=> start!114298 true))

(declare-fun array_inv!33910 (array!92371) Bool)

(assert (=> start!114298 (array_inv!33910 a!3742)))

(declare-fun b!1355636 () Bool)

(declare-fun res!899937 () Bool)

(assert (=> b!1355636 (=> (not res!899937) (not e!770244))))

(assert (=> b!1355636 (= res!899937 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45180 a!3742)))))

(declare-fun b!1355637 () Bool)

(declare-fun res!899927 () Bool)

(assert (=> b!1355637 (=> (not res!899927) (not e!770244))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355637 (= res!899927 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45180 a!3742))))))

(declare-fun b!1355638 () Bool)

(declare-fun res!899932 () Bool)

(assert (=> b!1355638 (=> (not res!899932) (not e!770244))))

(assert (=> b!1355638 (= res!899932 (not (contains!9369 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355639 () Bool)

(declare-fun e!770248 () Bool)

(assert (=> b!1355639 (= e!770244 e!770248)))

(declare-fun res!899926 () Bool)

(assert (=> b!1355639 (=> (not res!899926) (not e!770248))))

(declare-fun lt!598689 () Bool)

(assert (=> b!1355639 (= res!899926 (and (not (= from!3120 i!1404)) lt!598689))))

(declare-fun lt!598692 () Unit!44408)

(assert (=> b!1355639 (= lt!598692 e!770247)))

(declare-fun c!127300 () Bool)

(assert (=> b!1355639 (= c!127300 lt!598689)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355639 (= lt!598689 (validKeyInArray!0 (select (arr!44629 a!3742) from!3120)))))

(declare-fun b!1355640 () Bool)

(declare-fun res!899934 () Bool)

(assert (=> b!1355640 (=> (not res!899934) (not e!770244))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355640 (= res!899934 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355641 () Bool)

(declare-fun res!899928 () Bool)

(assert (=> b!1355641 (=> (not res!899928) (not e!770244))))

(assert (=> b!1355641 (= res!899928 (not (contains!9369 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355642 () Bool)

(declare-fun res!899933 () Bool)

(assert (=> b!1355642 (=> (not res!899933) (not e!770245))))

(assert (=> b!1355642 (= res!899933 (not (contains!9369 lt!598691 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355643 () Bool)

(declare-fun res!899936 () Bool)

(assert (=> b!1355643 (=> (not res!899936) (not e!770244))))

(assert (=> b!1355643 (= res!899936 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355644 () Bool)

(assert (=> b!1355644 (= e!770248 e!770245)))

(declare-fun res!899924 () Bool)

(assert (=> b!1355644 (=> (not res!899924) (not e!770245))))

(assert (=> b!1355644 (= res!899924 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1355644 (= lt!598691 ($colon$colon!760 acc!759 (select (arr!44629 a!3742) from!3120)))))

(assert (= (and start!114298 res!899931) b!1355635))

(assert (= (and b!1355635 res!899929) b!1355638))

(assert (= (and b!1355638 res!899932) b!1355641))

(assert (= (and b!1355641 res!899928) b!1355632))

(assert (= (and b!1355632 res!899925) b!1355643))

(assert (= (and b!1355643 res!899936) b!1355637))

(assert (= (and b!1355637 res!899927) b!1355640))

(assert (= (and b!1355640 res!899934) b!1355636))

(assert (= (and b!1355636 res!899937) b!1355639))

(assert (= (and b!1355639 c!127300) b!1355631))

(assert (= (and b!1355639 (not c!127300)) b!1355630))

(assert (= (and b!1355639 res!899926) b!1355644))

(assert (= (and b!1355644 res!899924) b!1355633))

(assert (= (and b!1355633 res!899930) b!1355634))

(assert (= (and b!1355634 res!899935) b!1355642))

(assert (= (and b!1355642 res!899933) b!1355629))

(declare-fun m!1242325 () Bool)

(assert (=> b!1355644 m!1242325))

(assert (=> b!1355644 m!1242325))

(declare-fun m!1242327 () Bool)

(assert (=> b!1355644 m!1242327))

(declare-fun m!1242329 () Bool)

(assert (=> b!1355643 m!1242329))

(declare-fun m!1242331 () Bool)

(assert (=> b!1355631 m!1242331))

(assert (=> b!1355631 m!1242325))

(assert (=> b!1355631 m!1242327))

(declare-fun m!1242333 () Bool)

(assert (=> b!1355631 m!1242333))

(declare-fun m!1242335 () Bool)

(assert (=> b!1355631 m!1242335))

(assert (=> b!1355631 m!1242325))

(assert (=> b!1355631 m!1242327))

(declare-fun m!1242337 () Bool)

(assert (=> b!1355631 m!1242337))

(assert (=> b!1355639 m!1242325))

(assert (=> b!1355639 m!1242325))

(declare-fun m!1242339 () Bool)

(assert (=> b!1355639 m!1242339))

(declare-fun m!1242341 () Bool)

(assert (=> b!1355635 m!1242341))

(declare-fun m!1242343 () Bool)

(assert (=> b!1355642 m!1242343))

(declare-fun m!1242345 () Bool)

(assert (=> start!114298 m!1242345))

(declare-fun m!1242347 () Bool)

(assert (=> b!1355632 m!1242347))

(declare-fun m!1242349 () Bool)

(assert (=> b!1355634 m!1242349))

(declare-fun m!1242351 () Bool)

(assert (=> b!1355638 m!1242351))

(declare-fun m!1242353 () Bool)

(assert (=> b!1355633 m!1242353))

(declare-fun m!1242355 () Bool)

(assert (=> b!1355629 m!1242355))

(declare-fun m!1242357 () Bool)

(assert (=> b!1355640 m!1242357))

(declare-fun m!1242359 () Bool)

(assert (=> b!1355641 m!1242359))

(check-sat (not b!1355635) (not b!1355640) (not b!1355632) (not b!1355629) (not b!1355634) (not b!1355633) (not b!1355638) (not b!1355644) (not b!1355641) (not start!114298) (not b!1355639) (not b!1355642) (not b!1355643) (not b!1355631))
(check-sat)
