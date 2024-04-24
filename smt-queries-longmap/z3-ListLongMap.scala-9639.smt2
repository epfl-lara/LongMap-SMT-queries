; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114196 () Bool)

(assert start!114196)

(declare-fun b!1353461 () Bool)

(declare-fun e!769558 () Bool)

(assert (=> b!1353461 (= e!769558 false)))

(declare-datatypes ((List!31606 0))(
  ( (Nil!31603) (Cons!31602 (h!32820 (_ BitVec 64)) (t!46256 List!31606)) )
))
(declare-fun acc!759 () List!31606)

(declare-fun lt!597927 () Bool)

(declare-datatypes ((array!92269 0))(
  ( (array!92270 (arr!44578 (Array (_ BitVec 32) (_ BitVec 64))) (size!45129 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92269)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92269 (_ BitVec 32) List!31606) Bool)

(assert (=> b!1353461 (= lt!597927 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353462 () Bool)

(declare-datatypes ((Unit!44255 0))(
  ( (Unit!44256) )
))
(declare-fun e!769560 () Unit!44255)

(declare-fun Unit!44257 () Unit!44255)

(assert (=> b!1353462 (= e!769560 Unit!44257)))

(declare-fun b!1353463 () Bool)

(declare-fun res!898064 () Bool)

(declare-fun e!769559 () Bool)

(assert (=> b!1353463 (=> (not res!898064) (not e!769559))))

(assert (=> b!1353463 (= res!898064 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353464 () Bool)

(declare-fun res!898069 () Bool)

(assert (=> b!1353464 (=> (not res!898069) (not e!769559))))

(assert (=> b!1353464 (= res!898069 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31603))))

(declare-fun b!1353465 () Bool)

(declare-fun res!898071 () Bool)

(assert (=> b!1353465 (=> (not res!898071) (not e!769559))))

(declare-fun noDuplicate!2149 (List!31606) Bool)

(assert (=> b!1353465 (= res!898071 (noDuplicate!2149 acc!759))))

(declare-fun res!898065 () Bool)

(assert (=> start!114196 (=> (not res!898065) (not e!769559))))

(assert (=> start!114196 (= res!898065 (and (bvslt (size!45129 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45129 a!3742))))))

(assert (=> start!114196 e!769559))

(assert (=> start!114196 true))

(declare-fun array_inv!33859 (array!92269) Bool)

(assert (=> start!114196 (array_inv!33859 a!3742)))

(declare-fun b!1353466 () Bool)

(declare-fun res!898070 () Bool)

(assert (=> b!1353466 (=> (not res!898070) (not e!769559))))

(assert (=> b!1353466 (= res!898070 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45129 a!3742)))))

(declare-fun b!1353467 () Bool)

(assert (=> b!1353467 (= e!769559 e!769558)))

(declare-fun res!898063 () Bool)

(assert (=> b!1353467 (=> (not res!898063) (not e!769558))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353467 (= res!898063 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597930 () Unit!44255)

(assert (=> b!1353467 (= lt!597930 e!769560)))

(declare-fun c!127147 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353467 (= c!127147 (validKeyInArray!0 (select (arr!44578 a!3742) from!3120)))))

(declare-fun b!1353468 () Bool)

(declare-fun res!898068 () Bool)

(assert (=> b!1353468 (=> (not res!898068) (not e!769559))))

(assert (=> b!1353468 (= res!898068 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45129 a!3742))))))

(declare-fun b!1353469 () Bool)

(declare-fun res!898066 () Bool)

(assert (=> b!1353469 (=> (not res!898066) (not e!769559))))

(declare-fun contains!9318 (List!31606 (_ BitVec 64)) Bool)

(assert (=> b!1353469 (= res!898066 (not (contains!9318 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353470 () Bool)

(declare-fun res!898067 () Bool)

(assert (=> b!1353470 (=> (not res!898067) (not e!769559))))

(assert (=> b!1353470 (= res!898067 (not (contains!9318 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353471 () Bool)

(declare-fun res!898062 () Bool)

(assert (=> b!1353471 (=> (not res!898062) (not e!769559))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353471 (= res!898062 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353472 () Bool)

(declare-fun lt!597929 () Unit!44255)

(assert (=> b!1353472 (= e!769560 lt!597929)))

(declare-fun lt!597928 () Unit!44255)

(declare-fun lemmaListSubSeqRefl!0 (List!31606) Unit!44255)

(assert (=> b!1353472 (= lt!597928 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!695 (List!31606 List!31606) Bool)

(assert (=> b!1353472 (subseq!695 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92269 List!31606 List!31606 (_ BitVec 32)) Unit!44255)

(declare-fun $colon$colon!709 (List!31606 (_ BitVec 64)) List!31606)

(assert (=> b!1353472 (= lt!597929 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!709 acc!759 (select (arr!44578 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353472 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114196 res!898065) b!1353465))

(assert (= (and b!1353465 res!898071) b!1353470))

(assert (= (and b!1353470 res!898067) b!1353469))

(assert (= (and b!1353469 res!898066) b!1353464))

(assert (= (and b!1353464 res!898069) b!1353463))

(assert (= (and b!1353463 res!898064) b!1353468))

(assert (= (and b!1353468 res!898068) b!1353471))

(assert (= (and b!1353471 res!898062) b!1353466))

(assert (= (and b!1353466 res!898070) b!1353467))

(assert (= (and b!1353467 c!127147) b!1353472))

(assert (= (and b!1353467 (not c!127147)) b!1353462))

(assert (= (and b!1353467 res!898063) b!1353461))

(declare-fun m!1240633 () Bool)

(assert (=> b!1353472 m!1240633))

(declare-fun m!1240635 () Bool)

(assert (=> b!1353472 m!1240635))

(declare-fun m!1240637 () Bool)

(assert (=> b!1353472 m!1240637))

(declare-fun m!1240639 () Bool)

(assert (=> b!1353472 m!1240639))

(declare-fun m!1240641 () Bool)

(assert (=> b!1353472 m!1240641))

(assert (=> b!1353472 m!1240635))

(assert (=> b!1353472 m!1240637))

(declare-fun m!1240643 () Bool)

(assert (=> b!1353472 m!1240643))

(declare-fun m!1240645 () Bool)

(assert (=> start!114196 m!1240645))

(declare-fun m!1240647 () Bool)

(assert (=> b!1353464 m!1240647))

(declare-fun m!1240649 () Bool)

(assert (=> b!1353463 m!1240649))

(declare-fun m!1240651 () Bool)

(assert (=> b!1353465 m!1240651))

(declare-fun m!1240653 () Bool)

(assert (=> b!1353471 m!1240653))

(assert (=> b!1353467 m!1240635))

(assert (=> b!1353467 m!1240635))

(declare-fun m!1240655 () Bool)

(assert (=> b!1353467 m!1240655))

(assert (=> b!1353461 m!1240641))

(declare-fun m!1240657 () Bool)

(assert (=> b!1353469 m!1240657))

(declare-fun m!1240659 () Bool)

(assert (=> b!1353470 m!1240659))

(check-sat (not b!1353470) (not b!1353464) (not start!114196) (not b!1353461) (not b!1353467) (not b!1353469) (not b!1353465) (not b!1353471) (not b!1353463) (not b!1353472))
(check-sat)
