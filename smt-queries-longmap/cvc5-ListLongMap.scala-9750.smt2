; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115484 () Bool)

(assert start!115484)

(declare-fun b!1366241 () Bool)

(declare-fun res!909824 () Bool)

(declare-fun e!774389 () Bool)

(assert (=> b!1366241 (=> (not res!909824) (not e!774389))))

(declare-datatypes ((array!92805 0))(
  ( (array!92806 (arr!44831 (Array (_ BitVec 32) (_ BitVec 64))) (size!45381 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92805)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31899 0))(
  ( (Nil!31896) (Cons!31895 (h!33104 (_ BitVec 64)) (t!46593 List!31899)) )
))
(declare-fun acc!866 () List!31899)

(declare-fun contains!9581 (List!31899 (_ BitVec 64)) Bool)

(assert (=> b!1366241 (= res!909824 (not (contains!9581 acc!866 (select (arr!44831 a!3861) from!3239))))))

(declare-fun b!1366242 () Bool)

(declare-fun res!909828 () Bool)

(declare-fun e!774391 () Bool)

(assert (=> b!1366242 (=> (not res!909828) (not e!774391))))

(declare-fun newAcc!98 () List!31899)

(declare-fun subseq!983 (List!31899 List!31899) Bool)

(assert (=> b!1366242 (= res!909828 (subseq!983 newAcc!98 acc!866))))

(declare-fun b!1366243 () Bool)

(declare-fun res!909819 () Bool)

(assert (=> b!1366243 (=> (not res!909819) (not e!774391))))

(assert (=> b!1366243 (= res!909819 (not (contains!9581 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366244 () Bool)

(declare-fun res!909823 () Bool)

(declare-fun e!774388 () Bool)

(assert (=> b!1366244 (=> (not res!909823) (not e!774388))))

(declare-fun lt!601513 () List!31899)

(assert (=> b!1366244 (= res!909823 (not (contains!9581 lt!601513 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366245 () Bool)

(declare-fun res!909825 () Bool)

(assert (=> b!1366245 (=> (not res!909825) (not e!774389))))

(assert (=> b!1366245 (= res!909825 (bvslt from!3239 (size!45381 a!3861)))))

(declare-fun b!1366246 () Bool)

(declare-fun res!909820 () Bool)

(assert (=> b!1366246 (=> (not res!909820) (not e!774388))))

(declare-fun lt!601511 () List!31899)

(assert (=> b!1366246 (= res!909820 (subseq!983 lt!601511 lt!601513))))

(declare-fun b!1366247 () Bool)

(declare-fun res!909826 () Bool)

(assert (=> b!1366247 (=> (not res!909826) (not e!774388))))

(declare-fun noDuplicate!2438 (List!31899) Bool)

(assert (=> b!1366247 (= res!909826 (noDuplicate!2438 lt!601513))))

(declare-fun b!1366249 () Bool)

(declare-fun res!909831 () Bool)

(assert (=> b!1366249 (=> (not res!909831) (not e!774391))))

(assert (=> b!1366249 (= res!909831 (noDuplicate!2438 acc!866))))

(declare-fun b!1366250 () Bool)

(declare-fun res!909827 () Bool)

(assert (=> b!1366250 (=> (not res!909827) (not e!774391))))

(assert (=> b!1366250 (= res!909827 (not (contains!9581 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366251 () Bool)

(declare-fun res!909830 () Bool)

(assert (=> b!1366251 (=> (not res!909830) (not e!774391))))

(assert (=> b!1366251 (= res!909830 (not (contains!9581 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366252 () Bool)

(assert (=> b!1366252 (= e!774389 e!774388)))

(declare-fun res!909829 () Bool)

(assert (=> b!1366252 (=> (not res!909829) (not e!774388))))

(assert (=> b!1366252 (= res!909829 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366252 (= lt!601511 (Cons!31895 (select (arr!44831 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366252 (= lt!601513 (Cons!31895 (select (arr!44831 a!3861) from!3239) acc!866))))

(declare-fun res!909816 () Bool)

(assert (=> start!115484 (=> (not res!909816) (not e!774391))))

(assert (=> start!115484 (= res!909816 (and (bvslt (size!45381 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45381 a!3861))))))

(assert (=> start!115484 e!774391))

(declare-fun array_inv!33859 (array!92805) Bool)

(assert (=> start!115484 (array_inv!33859 a!3861)))

(assert (=> start!115484 true))

(declare-fun b!1366248 () Bool)

(declare-fun res!909818 () Bool)

(assert (=> b!1366248 (=> (not res!909818) (not e!774388))))

(assert (=> b!1366248 (= res!909818 (not (contains!9581 lt!601513 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366253 () Bool)

(declare-fun res!909821 () Bool)

(assert (=> b!1366253 (=> (not res!909821) (not e!774389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366253 (= res!909821 (validKeyInArray!0 (select (arr!44831 a!3861) from!3239)))))

(declare-fun b!1366254 () Bool)

(declare-fun res!909815 () Bool)

(assert (=> b!1366254 (=> (not res!909815) (not e!774388))))

(assert (=> b!1366254 (= res!909815 (not (contains!9581 lt!601511 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366255 () Bool)

(declare-fun res!909822 () Bool)

(assert (=> b!1366255 (=> (not res!909822) (not e!774388))))

(assert (=> b!1366255 (= res!909822 (not (contains!9581 lt!601511 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366256 () Bool)

(assert (=> b!1366256 (= e!774391 e!774389)))

(declare-fun res!909832 () Bool)

(assert (=> b!1366256 (=> (not res!909832) (not e!774389))))

(declare-fun arrayNoDuplicates!0 (array!92805 (_ BitVec 32) List!31899) Bool)

(assert (=> b!1366256 (= res!909832 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45099 0))(
  ( (Unit!45100) )
))
(declare-fun lt!601509 () Unit!45099)

(declare-fun noDuplicateSubseq!170 (List!31899 List!31899) Unit!45099)

(assert (=> b!1366256 (= lt!601509 (noDuplicateSubseq!170 newAcc!98 acc!866))))

(declare-fun b!1366257 () Bool)

(assert (=> b!1366257 (= e!774388 false)))

(declare-fun lt!601510 () Bool)

(assert (=> b!1366257 (= lt!601510 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601513))))

(declare-fun lt!601512 () Unit!45099)

(assert (=> b!1366257 (= lt!601512 (noDuplicateSubseq!170 lt!601511 lt!601513))))

(declare-fun b!1366258 () Bool)

(declare-fun res!909817 () Bool)

(assert (=> b!1366258 (=> (not res!909817) (not e!774391))))

(assert (=> b!1366258 (= res!909817 (not (contains!9581 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115484 res!909816) b!1366249))

(assert (= (and b!1366249 res!909831) b!1366251))

(assert (= (and b!1366251 res!909830) b!1366243))

(assert (= (and b!1366243 res!909819) b!1366250))

(assert (= (and b!1366250 res!909827) b!1366258))

(assert (= (and b!1366258 res!909817) b!1366242))

(assert (= (and b!1366242 res!909828) b!1366256))

(assert (= (and b!1366256 res!909832) b!1366245))

(assert (= (and b!1366245 res!909825) b!1366253))

(assert (= (and b!1366253 res!909821) b!1366241))

(assert (= (and b!1366241 res!909824) b!1366252))

(assert (= (and b!1366252 res!909829) b!1366247))

(assert (= (and b!1366247 res!909826) b!1366248))

(assert (= (and b!1366248 res!909818) b!1366244))

(assert (= (and b!1366244 res!909823) b!1366255))

(assert (= (and b!1366255 res!909822) b!1366254))

(assert (= (and b!1366254 res!909815) b!1366246))

(assert (= (and b!1366246 res!909820) b!1366257))

(declare-fun m!1250581 () Bool)

(assert (=> b!1366256 m!1250581))

(declare-fun m!1250583 () Bool)

(assert (=> b!1366256 m!1250583))

(declare-fun m!1250585 () Bool)

(assert (=> b!1366241 m!1250585))

(assert (=> b!1366241 m!1250585))

(declare-fun m!1250587 () Bool)

(assert (=> b!1366241 m!1250587))

(declare-fun m!1250589 () Bool)

(assert (=> b!1366249 m!1250589))

(declare-fun m!1250591 () Bool)

(assert (=> b!1366244 m!1250591))

(declare-fun m!1250593 () Bool)

(assert (=> b!1366242 m!1250593))

(declare-fun m!1250595 () Bool)

(assert (=> b!1366251 m!1250595))

(declare-fun m!1250597 () Bool)

(assert (=> b!1366243 m!1250597))

(declare-fun m!1250599 () Bool)

(assert (=> start!115484 m!1250599))

(declare-fun m!1250601 () Bool)

(assert (=> b!1366246 m!1250601))

(declare-fun m!1250603 () Bool)

(assert (=> b!1366250 m!1250603))

(assert (=> b!1366252 m!1250585))

(declare-fun m!1250605 () Bool)

(assert (=> b!1366248 m!1250605))

(assert (=> b!1366253 m!1250585))

(assert (=> b!1366253 m!1250585))

(declare-fun m!1250607 () Bool)

(assert (=> b!1366253 m!1250607))

(declare-fun m!1250609 () Bool)

(assert (=> b!1366257 m!1250609))

(declare-fun m!1250611 () Bool)

(assert (=> b!1366257 m!1250611))

(declare-fun m!1250613 () Bool)

(assert (=> b!1366258 m!1250613))

(declare-fun m!1250615 () Bool)

(assert (=> b!1366254 m!1250615))

(declare-fun m!1250617 () Bool)

(assert (=> b!1366255 m!1250617))

(declare-fun m!1250619 () Bool)

(assert (=> b!1366247 m!1250619))

(push 1)

