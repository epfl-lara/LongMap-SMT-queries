; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114144 () Bool)

(assert start!114144)

(declare-fun b!1355798 () Bool)

(declare-fun res!900667 () Bool)

(declare-fun e!769866 () Bool)

(assert (=> b!1355798 (=> (not res!900667) (not e!769866))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92326 0))(
  ( (array!92327 (arr!44611 (Array (_ BitVec 32) (_ BitVec 64))) (size!45161 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92326)

(assert (=> b!1355798 (= res!900667 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45161 a!3742))))))

(declare-fun b!1355799 () Bool)

(declare-fun res!900664 () Bool)

(assert (=> b!1355799 (=> (not res!900664) (not e!769866))))

(declare-datatypes ((List!31652 0))(
  ( (Nil!31649) (Cons!31648 (h!32857 (_ BitVec 64)) (t!46310 List!31652)) )
))
(declare-fun acc!759 () List!31652)

(declare-fun noDuplicate!2218 (List!31652) Bool)

(assert (=> b!1355799 (= res!900664 (noDuplicate!2218 acc!759))))

(declare-fun b!1355800 () Bool)

(declare-fun res!900665 () Bool)

(assert (=> b!1355800 (=> (not res!900665) (not e!769866))))

(declare-fun contains!9361 (List!31652 (_ BitVec 64)) Bool)

(assert (=> b!1355800 (= res!900665 (not (contains!9361 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355801 () Bool)

(declare-fun res!900672 () Bool)

(assert (=> b!1355801 (=> (not res!900672) (not e!769866))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92326 (_ BitVec 32) List!31652) Bool)

(assert (=> b!1355801 (= res!900672 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355803 () Bool)

(declare-fun res!900670 () Bool)

(assert (=> b!1355803 (=> (not res!900670) (not e!769866))))

(assert (=> b!1355803 (= res!900670 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31649))))

(declare-fun b!1355804 () Bool)

(declare-fun e!769867 () Bool)

(assert (=> b!1355804 (= e!769867 false)))

(declare-fun lt!598783 () Bool)

(assert (=> b!1355804 (= lt!598783 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355805 () Bool)

(declare-fun res!900668 () Bool)

(assert (=> b!1355805 (=> (not res!900668) (not e!769866))))

(assert (=> b!1355805 (= res!900668 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45161 a!3742)))))

(declare-fun b!1355806 () Bool)

(declare-datatypes ((Unit!44574 0))(
  ( (Unit!44575) )
))
(declare-fun e!769864 () Unit!44574)

(declare-fun Unit!44576 () Unit!44574)

(assert (=> b!1355806 (= e!769864 Unit!44576)))

(declare-fun b!1355807 () Bool)

(assert (=> b!1355807 (= e!769866 e!769867)))

(declare-fun res!900673 () Bool)

(assert (=> b!1355807 (=> (not res!900673) (not e!769867))))

(declare-fun lt!598779 () Bool)

(assert (=> b!1355807 (= res!900673 (and (not (= from!3120 i!1404)) (not lt!598779) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598782 () Unit!44574)

(assert (=> b!1355807 (= lt!598782 e!769864)))

(declare-fun c!127007 () Bool)

(assert (=> b!1355807 (= c!127007 lt!598779)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355807 (= lt!598779 (validKeyInArray!0 (select (arr!44611 a!3742) from!3120)))))

(declare-fun b!1355808 () Bool)

(declare-fun res!900669 () Bool)

(assert (=> b!1355808 (=> (not res!900669) (not e!769866))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355808 (= res!900669 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355809 () Bool)

(declare-fun res!900666 () Bool)

(assert (=> b!1355809 (=> (not res!900666) (not e!769866))))

(assert (=> b!1355809 (= res!900666 (not (contains!9361 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900671 () Bool)

(assert (=> start!114144 (=> (not res!900671) (not e!769866))))

(assert (=> start!114144 (= res!900671 (and (bvslt (size!45161 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45161 a!3742))))))

(assert (=> start!114144 e!769866))

(assert (=> start!114144 true))

(declare-fun array_inv!33639 (array!92326) Bool)

(assert (=> start!114144 (array_inv!33639 a!3742)))

(declare-fun b!1355802 () Bool)

(declare-fun lt!598781 () Unit!44574)

(assert (=> b!1355802 (= e!769864 lt!598781)))

(declare-fun lt!598780 () Unit!44574)

(declare-fun lemmaListSubSeqRefl!0 (List!31652) Unit!44574)

(assert (=> b!1355802 (= lt!598780 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!781 (List!31652 List!31652) Bool)

(assert (=> b!1355802 (subseq!781 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92326 List!31652 List!31652 (_ BitVec 32)) Unit!44574)

(declare-fun $colon$colon!796 (List!31652 (_ BitVec 64)) List!31652)

(assert (=> b!1355802 (= lt!598781 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!796 acc!759 (select (arr!44611 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355802 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114144 res!900671) b!1355799))

(assert (= (and b!1355799 res!900664) b!1355800))

(assert (= (and b!1355800 res!900665) b!1355809))

(assert (= (and b!1355809 res!900666) b!1355803))

(assert (= (and b!1355803 res!900670) b!1355801))

(assert (= (and b!1355801 res!900672) b!1355798))

(assert (= (and b!1355798 res!900667) b!1355808))

(assert (= (and b!1355808 res!900669) b!1355805))

(assert (= (and b!1355805 res!900668) b!1355807))

(assert (= (and b!1355807 c!127007) b!1355802))

(assert (= (and b!1355807 (not c!127007)) b!1355806))

(assert (= (and b!1355807 res!900673) b!1355804))

(declare-fun m!1241901 () Bool)

(assert (=> b!1355808 m!1241901))

(declare-fun m!1241903 () Bool)

(assert (=> b!1355800 m!1241903))

(declare-fun m!1241905 () Bool)

(assert (=> b!1355804 m!1241905))

(declare-fun m!1241907 () Bool)

(assert (=> b!1355803 m!1241907))

(declare-fun m!1241909 () Bool)

(assert (=> b!1355799 m!1241909))

(declare-fun m!1241911 () Bool)

(assert (=> b!1355801 m!1241911))

(declare-fun m!1241913 () Bool)

(assert (=> b!1355809 m!1241913))

(declare-fun m!1241915 () Bool)

(assert (=> b!1355802 m!1241915))

(declare-fun m!1241917 () Bool)

(assert (=> b!1355802 m!1241917))

(declare-fun m!1241919 () Bool)

(assert (=> b!1355802 m!1241919))

(declare-fun m!1241921 () Bool)

(assert (=> b!1355802 m!1241921))

(assert (=> b!1355802 m!1241905))

(assert (=> b!1355802 m!1241917))

(assert (=> b!1355802 m!1241919))

(declare-fun m!1241923 () Bool)

(assert (=> b!1355802 m!1241923))

(declare-fun m!1241925 () Bool)

(assert (=> start!114144 m!1241925))

(assert (=> b!1355807 m!1241917))

(assert (=> b!1355807 m!1241917))

(declare-fun m!1241927 () Bool)

(assert (=> b!1355807 m!1241927))

(push 1)

(assert (not b!1355809))

(assert (not b!1355802))

(assert (not b!1355808))

(assert (not start!114144))

(assert (not b!1355800))

(assert (not b!1355799))

(assert (not b!1355807))

(assert (not b!1355801))

(assert (not b!1355803))

(assert (not b!1355804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

