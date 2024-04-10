; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113932 () Bool)

(assert start!113932)

(declare-fun b!1351376 () Bool)

(declare-fun e!768498 () Bool)

(assert (=> b!1351376 (= e!768498 true)))

(declare-fun lt!597212 () Bool)

(declare-datatypes ((List!31546 0))(
  ( (Nil!31543) (Cons!31542 (h!32751 (_ BitVec 64)) (t!46204 List!31546)) )
))
(declare-fun lt!597213 () List!31546)

(declare-datatypes ((array!92114 0))(
  ( (array!92115 (arr!44505 (Array (_ BitVec 32) (_ BitVec 64))) (size!45055 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92114)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92114 (_ BitVec 32) List!31546) Bool)

(assert (=> b!1351376 (= lt!597212 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597213))))

(declare-datatypes ((Unit!44264 0))(
  ( (Unit!44265) )
))
(declare-fun lt!597214 () Unit!44264)

(declare-fun acc!759 () List!31546)

(declare-fun noDuplicateSubseq!126 (List!31546 List!31546) Unit!44264)

(assert (=> b!1351376 (= lt!597214 (noDuplicateSubseq!126 acc!759 lt!597213))))

(declare-fun b!1351377 () Bool)

(declare-fun res!896848 () Bool)

(declare-fun e!768499 () Bool)

(assert (=> b!1351377 (=> (not res!896848) (not e!768499))))

(declare-fun noDuplicate!2112 (List!31546) Bool)

(assert (=> b!1351377 (= res!896848 (noDuplicate!2112 acc!759))))

(declare-fun b!1351378 () Bool)

(declare-fun res!896841 () Bool)

(assert (=> b!1351378 (=> (not res!896841) (not e!768499))))

(assert (=> b!1351378 (= res!896841 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351379 () Bool)

(declare-fun res!896846 () Bool)

(assert (=> b!1351379 (=> res!896846 e!768498)))

(assert (=> b!1351379 (= res!896846 (not (noDuplicate!2112 lt!597213)))))

(declare-fun b!1351380 () Bool)

(declare-fun res!896845 () Bool)

(assert (=> b!1351380 (=> res!896845 e!768498)))

(declare-fun contains!9255 (List!31546 (_ BitVec 64)) Bool)

(assert (=> b!1351380 (= res!896845 (contains!9255 lt!597213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351381 () Bool)

(declare-fun res!896847 () Bool)

(assert (=> b!1351381 (=> (not res!896847) (not e!768499))))

(assert (=> b!1351381 (= res!896847 (not (contains!9255 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896835 () Bool)

(assert (=> start!113932 (=> (not res!896835) (not e!768499))))

(assert (=> start!113932 (= res!896835 (and (bvslt (size!45055 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45055 a!3742))))))

(assert (=> start!113932 e!768499))

(assert (=> start!113932 true))

(declare-fun array_inv!33533 (array!92114) Bool)

(assert (=> start!113932 (array_inv!33533 a!3742)))

(declare-fun b!1351382 () Bool)

(declare-fun res!896842 () Bool)

(assert (=> b!1351382 (=> (not res!896842) (not e!768499))))

(assert (=> b!1351382 (= res!896842 (not (contains!9255 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351383 () Bool)

(declare-fun res!896834 () Bool)

(assert (=> b!1351383 (=> (not res!896834) (not e!768499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351383 (= res!896834 (validKeyInArray!0 (select (arr!44505 a!3742) from!3120)))))

(declare-fun b!1351384 () Bool)

(declare-fun res!896840 () Bool)

(assert (=> b!1351384 (=> (not res!896840) (not e!768499))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351384 (= res!896840 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45055 a!3742))))))

(declare-fun b!1351385 () Bool)

(declare-fun res!896843 () Bool)

(assert (=> b!1351385 (=> (not res!896843) (not e!768499))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351385 (= res!896843 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351386 () Bool)

(declare-fun res!896836 () Bool)

(assert (=> b!1351386 (=> (not res!896836) (not e!768499))))

(assert (=> b!1351386 (= res!896836 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45055 a!3742)))))

(declare-fun b!1351387 () Bool)

(declare-fun res!896837 () Bool)

(assert (=> b!1351387 (=> res!896837 e!768498)))

(declare-fun subseq!675 (List!31546 List!31546) Bool)

(assert (=> b!1351387 (= res!896837 (not (subseq!675 acc!759 lt!597213)))))

(declare-fun b!1351388 () Bool)

(declare-fun res!896839 () Bool)

(assert (=> b!1351388 (=> (not res!896839) (not e!768499))))

(assert (=> b!1351388 (= res!896839 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31543))))

(declare-fun b!1351389 () Bool)

(assert (=> b!1351389 (= e!768499 (not e!768498))))

(declare-fun res!896838 () Bool)

(assert (=> b!1351389 (=> res!896838 e!768498)))

(assert (=> b!1351389 (= res!896838 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!690 (List!31546 (_ BitVec 64)) List!31546)

(assert (=> b!1351389 (= lt!597213 ($colon$colon!690 acc!759 (select (arr!44505 a!3742) from!3120)))))

(assert (=> b!1351389 (subseq!675 acc!759 acc!759)))

(declare-fun lt!597211 () Unit!44264)

(declare-fun lemmaListSubSeqRefl!0 (List!31546) Unit!44264)

(assert (=> b!1351389 (= lt!597211 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351390 () Bool)

(declare-fun res!896844 () Bool)

(assert (=> b!1351390 (=> res!896844 e!768498)))

(assert (=> b!1351390 (= res!896844 (contains!9255 lt!597213 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!113932 res!896835) b!1351377))

(assert (= (and b!1351377 res!896848) b!1351381))

(assert (= (and b!1351381 res!896847) b!1351382))

(assert (= (and b!1351382 res!896842) b!1351388))

(assert (= (and b!1351388 res!896839) b!1351378))

(assert (= (and b!1351378 res!896841) b!1351384))

(assert (= (and b!1351384 res!896840) b!1351385))

(assert (= (and b!1351385 res!896843) b!1351386))

(assert (= (and b!1351386 res!896836) b!1351383))

(assert (= (and b!1351383 res!896834) b!1351389))

(assert (= (and b!1351389 (not res!896838)) b!1351379))

(assert (= (and b!1351379 (not res!896846)) b!1351380))

(assert (= (and b!1351380 (not res!896845)) b!1351390))

(assert (= (and b!1351390 (not res!896844)) b!1351387))

(assert (= (and b!1351387 (not res!896837)) b!1351376))

(declare-fun m!1238413 () Bool)

(assert (=> b!1351377 m!1238413))

(declare-fun m!1238415 () Bool)

(assert (=> b!1351382 m!1238415))

(declare-fun m!1238417 () Bool)

(assert (=> b!1351388 m!1238417))

(declare-fun m!1238419 () Bool)

(assert (=> b!1351383 m!1238419))

(assert (=> b!1351383 m!1238419))

(declare-fun m!1238421 () Bool)

(assert (=> b!1351383 m!1238421))

(declare-fun m!1238423 () Bool)

(assert (=> b!1351385 m!1238423))

(declare-fun m!1238425 () Bool)

(assert (=> b!1351381 m!1238425))

(declare-fun m!1238427 () Bool)

(assert (=> b!1351376 m!1238427))

(declare-fun m!1238429 () Bool)

(assert (=> b!1351376 m!1238429))

(declare-fun m!1238431 () Bool)

(assert (=> b!1351378 m!1238431))

(declare-fun m!1238433 () Bool)

(assert (=> b!1351390 m!1238433))

(assert (=> b!1351389 m!1238419))

(assert (=> b!1351389 m!1238419))

(declare-fun m!1238435 () Bool)

(assert (=> b!1351389 m!1238435))

(declare-fun m!1238437 () Bool)

(assert (=> b!1351389 m!1238437))

(declare-fun m!1238439 () Bool)

(assert (=> b!1351389 m!1238439))

(declare-fun m!1238441 () Bool)

(assert (=> b!1351380 m!1238441))

(declare-fun m!1238443 () Bool)

(assert (=> b!1351379 m!1238443))

(declare-fun m!1238445 () Bool)

(assert (=> b!1351387 m!1238445))

(declare-fun m!1238447 () Bool)

(assert (=> start!113932 m!1238447))

(check-sat (not b!1351380) (not b!1351388) (not b!1351387) (not b!1351381) (not b!1351390) (not b!1351376) (not b!1351389) (not b!1351377) (not b!1351378) (not start!113932) (not b!1351382) (not b!1351379) (not b!1351383) (not b!1351385))
(check-sat)
