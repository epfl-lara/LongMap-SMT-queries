; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114046 () Bool)

(assert start!114046)

(declare-fun res!898826 () Bool)

(declare-fun e!769193 () Bool)

(assert (=> start!114046 (=> (not res!898826) (not e!769193))))

(declare-datatypes ((array!92228 0))(
  ( (array!92229 (arr!44562 (Array (_ BitVec 32) (_ BitVec 64))) (size!45112 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92228)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114046 (= res!898826 (and (bvslt (size!45112 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45112 a!3742))))))

(assert (=> start!114046 e!769193))

(assert (=> start!114046 true))

(declare-fun array_inv!33590 (array!92228) Bool)

(assert (=> start!114046 (array_inv!33590 a!3742)))

(declare-fun b!1353658 () Bool)

(declare-fun res!898830 () Bool)

(assert (=> b!1353658 (=> (not res!898830) (not e!769193))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353658 (= res!898830 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45112 a!3742))))))

(declare-fun b!1353659 () Bool)

(declare-datatypes ((Unit!44427 0))(
  ( (Unit!44428) )
))
(declare-fun e!769191 () Unit!44427)

(declare-fun lt!597963 () Unit!44427)

(assert (=> b!1353659 (= e!769191 lt!597963)))

(declare-fun lt!597960 () Unit!44427)

(declare-datatypes ((List!31603 0))(
  ( (Nil!31600) (Cons!31599 (h!32808 (_ BitVec 64)) (t!46261 List!31603)) )
))
(declare-fun acc!759 () List!31603)

(declare-fun lemmaListSubSeqRefl!0 (List!31603) Unit!44427)

(assert (=> b!1353659 (= lt!597960 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!732 (List!31603 List!31603) Bool)

(assert (=> b!1353659 (subseq!732 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92228 List!31603 List!31603 (_ BitVec 32)) Unit!44427)

(declare-fun $colon$colon!747 (List!31603 (_ BitVec 64)) List!31603)

(assert (=> b!1353659 (= lt!597963 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!747 acc!759 (select (arr!44562 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92228 (_ BitVec 32) List!31603) Bool)

(assert (=> b!1353659 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353660 () Bool)

(declare-fun res!898829 () Bool)

(declare-fun e!769195 () Bool)

(assert (=> b!1353660 (=> (not res!898829) (not e!769195))))

(declare-fun lt!597962 () List!31603)

(declare-fun contains!9312 (List!31603 (_ BitVec 64)) Bool)

(assert (=> b!1353660 (= res!898829 (not (contains!9312 lt!597962 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353661 () Bool)

(declare-fun res!898823 () Bool)

(assert (=> b!1353661 (=> (not res!898823) (not e!769193))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353661 (= res!898823 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353662 () Bool)

(declare-fun res!898827 () Bool)

(assert (=> b!1353662 (=> (not res!898827) (not e!769195))))

(assert (=> b!1353662 (= res!898827 (not (contains!9312 lt!597962 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353663 () Bool)

(declare-fun res!898818 () Bool)

(assert (=> b!1353663 (=> (not res!898818) (not e!769193))))

(assert (=> b!1353663 (= res!898818 (not (contains!9312 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353664 () Bool)

(declare-fun e!769192 () Bool)

(assert (=> b!1353664 (= e!769193 e!769192)))

(declare-fun res!898820 () Bool)

(assert (=> b!1353664 (=> (not res!898820) (not e!769192))))

(declare-fun lt!597961 () Bool)

(assert (=> b!1353664 (= res!898820 (and (not (= from!3120 i!1404)) lt!597961))))

(declare-fun lt!597964 () Unit!44427)

(assert (=> b!1353664 (= lt!597964 e!769191)))

(declare-fun c!126860 () Bool)

(assert (=> b!1353664 (= c!126860 lt!597961)))

(assert (=> b!1353664 (= lt!597961 (validKeyInArray!0 (select (arr!44562 a!3742) from!3120)))))

(declare-fun b!1353665 () Bool)

(assert (=> b!1353665 (= e!769192 e!769195)))

(declare-fun res!898824 () Bool)

(assert (=> b!1353665 (=> (not res!898824) (not e!769195))))

(assert (=> b!1353665 (= res!898824 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353665 (= lt!597962 ($colon$colon!747 acc!759 (select (arr!44562 a!3742) from!3120)))))

(declare-fun b!1353666 () Bool)

(declare-fun res!898825 () Bool)

(assert (=> b!1353666 (=> (not res!898825) (not e!769193))))

(assert (=> b!1353666 (= res!898825 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45112 a!3742)))))

(declare-fun b!1353667 () Bool)

(declare-fun res!898821 () Bool)

(assert (=> b!1353667 (=> (not res!898821) (not e!769195))))

(declare-fun noDuplicate!2169 (List!31603) Bool)

(assert (=> b!1353667 (= res!898821 (noDuplicate!2169 lt!597962))))

(declare-fun b!1353668 () Bool)

(declare-fun res!898831 () Bool)

(assert (=> b!1353668 (=> (not res!898831) (not e!769193))))

(assert (=> b!1353668 (= res!898831 (noDuplicate!2169 acc!759))))

(declare-fun b!1353669 () Bool)

(declare-fun Unit!44429 () Unit!44427)

(assert (=> b!1353669 (= e!769191 Unit!44429)))

(declare-fun b!1353670 () Bool)

(declare-fun res!898819 () Bool)

(assert (=> b!1353670 (=> (not res!898819) (not e!769193))))

(assert (=> b!1353670 (= res!898819 (not (contains!9312 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353671 () Bool)

(declare-fun res!898828 () Bool)

(assert (=> b!1353671 (=> (not res!898828) (not e!769193))))

(assert (=> b!1353671 (= res!898828 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353672 () Bool)

(declare-fun res!898822 () Bool)

(assert (=> b!1353672 (=> (not res!898822) (not e!769193))))

(assert (=> b!1353672 (= res!898822 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31600))))

(declare-fun b!1353673 () Bool)

(assert (=> b!1353673 (= e!769195 false)))

(declare-fun lt!597959 () Bool)

(assert (=> b!1353673 (= lt!597959 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597962))))

(assert (= (and start!114046 res!898826) b!1353668))

(assert (= (and b!1353668 res!898831) b!1353670))

(assert (= (and b!1353670 res!898819) b!1353663))

(assert (= (and b!1353663 res!898818) b!1353672))

(assert (= (and b!1353672 res!898822) b!1353671))

(assert (= (and b!1353671 res!898828) b!1353658))

(assert (= (and b!1353658 res!898830) b!1353661))

(assert (= (and b!1353661 res!898823) b!1353666))

(assert (= (and b!1353666 res!898825) b!1353664))

(assert (= (and b!1353664 c!126860) b!1353659))

(assert (= (and b!1353664 (not c!126860)) b!1353669))

(assert (= (and b!1353664 res!898820) b!1353665))

(assert (= (and b!1353665 res!898824) b!1353667))

(assert (= (and b!1353667 res!898821) b!1353662))

(assert (= (and b!1353662 res!898827) b!1353660))

(assert (= (and b!1353660 res!898829) b!1353673))

(declare-fun m!1240225 () Bool)

(assert (=> b!1353667 m!1240225))

(declare-fun m!1240227 () Bool)

(assert (=> b!1353660 m!1240227))

(declare-fun m!1240229 () Bool)

(assert (=> b!1353670 m!1240229))

(declare-fun m!1240231 () Bool)

(assert (=> b!1353668 m!1240231))

(declare-fun m!1240233 () Bool)

(assert (=> b!1353663 m!1240233))

(declare-fun m!1240235 () Bool)

(assert (=> start!114046 m!1240235))

(declare-fun m!1240237 () Bool)

(assert (=> b!1353664 m!1240237))

(assert (=> b!1353664 m!1240237))

(declare-fun m!1240239 () Bool)

(assert (=> b!1353664 m!1240239))

(declare-fun m!1240241 () Bool)

(assert (=> b!1353673 m!1240241))

(declare-fun m!1240243 () Bool)

(assert (=> b!1353661 m!1240243))

(declare-fun m!1240245 () Bool)

(assert (=> b!1353662 m!1240245))

(declare-fun m!1240247 () Bool)

(assert (=> b!1353659 m!1240247))

(assert (=> b!1353659 m!1240237))

(declare-fun m!1240249 () Bool)

(assert (=> b!1353659 m!1240249))

(declare-fun m!1240251 () Bool)

(assert (=> b!1353659 m!1240251))

(declare-fun m!1240253 () Bool)

(assert (=> b!1353659 m!1240253))

(assert (=> b!1353659 m!1240237))

(assert (=> b!1353659 m!1240249))

(declare-fun m!1240255 () Bool)

(assert (=> b!1353659 m!1240255))

(declare-fun m!1240257 () Bool)

(assert (=> b!1353671 m!1240257))

(declare-fun m!1240259 () Bool)

(assert (=> b!1353672 m!1240259))

(assert (=> b!1353665 m!1240237))

(assert (=> b!1353665 m!1240237))

(assert (=> b!1353665 m!1240249))

(check-sat (not b!1353671) (not b!1353668) (not start!114046) (not b!1353664) (not b!1353661) (not b!1353660) (not b!1353665) (not b!1353659) (not b!1353673) (not b!1353670) (not b!1353662) (not b!1353672) (not b!1353663) (not b!1353667))
(check-sat)
