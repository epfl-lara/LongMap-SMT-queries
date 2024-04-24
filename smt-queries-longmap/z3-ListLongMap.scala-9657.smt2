; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114304 () Bool)

(assert start!114304)

(declare-fun b!1355775 () Bool)

(declare-fun e!770289 () Bool)

(declare-fun e!770291 () Bool)

(assert (=> b!1355775 (= e!770289 e!770291)))

(declare-fun res!900064 () Bool)

(assert (=> b!1355775 (=> (not res!900064) (not e!770291))))

(declare-fun lt!598744 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355775 (= res!900064 (and (not (= from!3120 i!1404)) lt!598744))))

(declare-datatypes ((Unit!44417 0))(
  ( (Unit!44418) )
))
(declare-fun lt!598746 () Unit!44417)

(declare-fun e!770292 () Unit!44417)

(assert (=> b!1355775 (= lt!598746 e!770292)))

(declare-fun c!127309 () Bool)

(assert (=> b!1355775 (= c!127309 lt!598744)))

(declare-datatypes ((array!92377 0))(
  ( (array!92378 (arr!44632 (Array (_ BitVec 32) (_ BitVec 64))) (size!45183 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92377)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355775 (= lt!598744 (validKeyInArray!0 (select (arr!44632 a!3742) from!3120)))))

(declare-fun b!1355776 () Bool)

(declare-fun lt!598741 () Unit!44417)

(assert (=> b!1355776 (= e!770292 lt!598741)))

(declare-fun lt!598742 () Unit!44417)

(declare-datatypes ((List!31660 0))(
  ( (Nil!31657) (Cons!31656 (h!32874 (_ BitVec 64)) (t!46310 List!31660)) )
))
(declare-fun acc!759 () List!31660)

(declare-fun lemmaListSubSeqRefl!0 (List!31660) Unit!44417)

(assert (=> b!1355776 (= lt!598742 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!749 (List!31660 List!31660) Bool)

(assert (=> b!1355776 (subseq!749 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92377 List!31660 List!31660 (_ BitVec 32)) Unit!44417)

(declare-fun $colon$colon!763 (List!31660 (_ BitVec 64)) List!31660)

(assert (=> b!1355776 (= lt!598741 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!763 acc!759 (select (arr!44632 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92377 (_ BitVec 32) List!31660) Bool)

(assert (=> b!1355776 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355777 () Bool)

(declare-fun e!770290 () Bool)

(assert (=> b!1355777 (= e!770291 e!770290)))

(declare-fun res!900052 () Bool)

(assert (=> b!1355777 (=> (not res!900052) (not e!770290))))

(assert (=> b!1355777 (= res!900052 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!598743 () List!31660)

(assert (=> b!1355777 (= lt!598743 ($colon$colon!763 acc!759 (select (arr!44632 a!3742) from!3120)))))

(declare-fun b!1355778 () Bool)

(declare-fun Unit!44419 () Unit!44417)

(assert (=> b!1355778 (= e!770292 Unit!44419)))

(declare-fun res!900054 () Bool)

(assert (=> start!114304 (=> (not res!900054) (not e!770289))))

(assert (=> start!114304 (= res!900054 (and (bvslt (size!45183 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45183 a!3742))))))

(assert (=> start!114304 e!770289))

(assert (=> start!114304 true))

(declare-fun array_inv!33913 (array!92377) Bool)

(assert (=> start!114304 (array_inv!33913 a!3742)))

(declare-fun b!1355779 () Bool)

(declare-fun res!900061 () Bool)

(assert (=> b!1355779 (=> (not res!900061) (not e!770290))))

(assert (=> b!1355779 (= res!900061 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598743))))

(declare-fun b!1355780 () Bool)

(declare-fun res!900066 () Bool)

(assert (=> b!1355780 (=> (not res!900066) (not e!770289))))

(assert (=> b!1355780 (= res!900066 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355781 () Bool)

(declare-fun res!900053 () Bool)

(assert (=> b!1355781 (=> (not res!900053) (not e!770289))))

(assert (=> b!1355781 (= res!900053 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31657))))

(declare-fun b!1355782 () Bool)

(declare-fun res!900060 () Bool)

(assert (=> b!1355782 (=> (not res!900060) (not e!770290))))

(declare-fun noDuplicate!2203 (List!31660) Bool)

(assert (=> b!1355782 (= res!900060 (noDuplicate!2203 lt!598743))))

(declare-fun b!1355783 () Bool)

(declare-fun res!900057 () Bool)

(assert (=> b!1355783 (=> (not res!900057) (not e!770289))))

(assert (=> b!1355783 (= res!900057 (noDuplicate!2203 acc!759))))

(declare-fun b!1355784 () Bool)

(declare-fun res!900055 () Bool)

(assert (=> b!1355784 (=> (not res!900055) (not e!770289))))

(declare-fun contains!9372 (List!31660 (_ BitVec 64)) Bool)

(assert (=> b!1355784 (= res!900055 (not (contains!9372 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355785 () Bool)

(declare-fun res!900065 () Bool)

(assert (=> b!1355785 (=> (not res!900065) (not e!770290))))

(assert (=> b!1355785 (= res!900065 (not (contains!9372 lt!598743 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355786 () Bool)

(declare-fun res!900059 () Bool)

(assert (=> b!1355786 (=> (not res!900059) (not e!770289))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355786 (= res!900059 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355787 () Bool)

(declare-fun res!900063 () Bool)

(assert (=> b!1355787 (=> (not res!900063) (not e!770289))))

(assert (=> b!1355787 (= res!900063 (not (contains!9372 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355788 () Bool)

(declare-fun res!900062 () Bool)

(assert (=> b!1355788 (=> (not res!900062) (not e!770289))))

(assert (=> b!1355788 (= res!900062 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45183 a!3742))))))

(declare-fun b!1355789 () Bool)

(declare-fun res!900056 () Bool)

(assert (=> b!1355789 (=> (not res!900056) (not e!770289))))

(assert (=> b!1355789 (= res!900056 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45183 a!3742)))))

(declare-fun b!1355790 () Bool)

(declare-fun res!900058 () Bool)

(assert (=> b!1355790 (=> (not res!900058) (not e!770290))))

(assert (=> b!1355790 (= res!900058 (not (contains!9372 lt!598743 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355791 () Bool)

(assert (=> b!1355791 (= e!770290 (not (bvsle from!3120 (size!45183 a!3742))))))

(assert (=> b!1355791 (arrayNoDuplicates!0 (array!92378 (store (arr!44632 a!3742) i!1404 l!3587) (size!45183 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598743)))

(declare-fun lt!598745 () Unit!44417)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31660) Unit!44417)

(assert (=> b!1355791 (= lt!598745 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598743))))

(assert (= (and start!114304 res!900054) b!1355783))

(assert (= (and b!1355783 res!900057) b!1355784))

(assert (= (and b!1355784 res!900055) b!1355787))

(assert (= (and b!1355787 res!900063) b!1355781))

(assert (= (and b!1355781 res!900053) b!1355780))

(assert (= (and b!1355780 res!900066) b!1355788))

(assert (= (and b!1355788 res!900062) b!1355786))

(assert (= (and b!1355786 res!900059) b!1355789))

(assert (= (and b!1355789 res!900056) b!1355775))

(assert (= (and b!1355775 c!127309) b!1355776))

(assert (= (and b!1355775 (not c!127309)) b!1355778))

(assert (= (and b!1355775 res!900064) b!1355777))

(assert (= (and b!1355777 res!900052) b!1355782))

(assert (= (and b!1355782 res!900060) b!1355785))

(assert (= (and b!1355785 res!900065) b!1355790))

(assert (= (and b!1355790 res!900058) b!1355779))

(assert (= (and b!1355779 res!900061) b!1355791))

(declare-fun m!1242433 () Bool)

(assert (=> b!1355780 m!1242433))

(declare-fun m!1242435 () Bool)

(assert (=> b!1355783 m!1242435))

(declare-fun m!1242437 () Bool)

(assert (=> b!1355786 m!1242437))

(declare-fun m!1242439 () Bool)

(assert (=> b!1355790 m!1242439))

(declare-fun m!1242441 () Bool)

(assert (=> b!1355776 m!1242441))

(declare-fun m!1242443 () Bool)

(assert (=> b!1355776 m!1242443))

(declare-fun m!1242445 () Bool)

(assert (=> b!1355776 m!1242445))

(declare-fun m!1242447 () Bool)

(assert (=> b!1355776 m!1242447))

(declare-fun m!1242449 () Bool)

(assert (=> b!1355776 m!1242449))

(assert (=> b!1355776 m!1242443))

(assert (=> b!1355776 m!1242445))

(declare-fun m!1242451 () Bool)

(assert (=> b!1355776 m!1242451))

(declare-fun m!1242453 () Bool)

(assert (=> b!1355791 m!1242453))

(declare-fun m!1242455 () Bool)

(assert (=> b!1355791 m!1242455))

(declare-fun m!1242457 () Bool)

(assert (=> b!1355791 m!1242457))

(declare-fun m!1242459 () Bool)

(assert (=> b!1355784 m!1242459))

(declare-fun m!1242461 () Bool)

(assert (=> b!1355785 m!1242461))

(declare-fun m!1242463 () Bool)

(assert (=> b!1355779 m!1242463))

(declare-fun m!1242465 () Bool)

(assert (=> b!1355781 m!1242465))

(declare-fun m!1242467 () Bool)

(assert (=> start!114304 m!1242467))

(assert (=> b!1355777 m!1242443))

(assert (=> b!1355777 m!1242443))

(assert (=> b!1355777 m!1242445))

(assert (=> b!1355775 m!1242443))

(assert (=> b!1355775 m!1242443))

(declare-fun m!1242469 () Bool)

(assert (=> b!1355775 m!1242469))

(declare-fun m!1242471 () Bool)

(assert (=> b!1355787 m!1242471))

(declare-fun m!1242473 () Bool)

(assert (=> b!1355782 m!1242473))

(check-sat (not b!1355790) (not b!1355779) (not b!1355785) (not b!1355787) (not start!114304) (not b!1355786) (not b!1355782) (not b!1355777) (not b!1355784) (not b!1355775) (not b!1355776) (not b!1355780) (not b!1355791) (not b!1355783) (not b!1355781))
(check-sat)
