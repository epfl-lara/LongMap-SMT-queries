; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114050 () Bool)

(assert start!114050)

(declare-fun b!1353685 () Bool)

(declare-fun res!898873 () Bool)

(declare-fun e!769191 () Bool)

(assert (=> b!1353685 (=> (not res!898873) (not e!769191))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353685 (= res!898873 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353686 () Bool)

(declare-fun e!769188 () Bool)

(declare-fun e!769192 () Bool)

(assert (=> b!1353686 (= e!769188 e!769192)))

(declare-fun res!898881 () Bool)

(assert (=> b!1353686 (=> (not res!898881) (not e!769192))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1353686 (= res!898881 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31658 0))(
  ( (Nil!31655) (Cons!31654 (h!32863 (_ BitVec 64)) (t!46308 List!31658)) )
))
(declare-fun acc!759 () List!31658)

(declare-fun lt!597810 () List!31658)

(declare-datatypes ((array!92181 0))(
  ( (array!92182 (arr!44539 (Array (_ BitVec 32) (_ BitVec 64))) (size!45091 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92181)

(declare-fun $colon$colon!751 (List!31658 (_ BitVec 64)) List!31658)

(assert (=> b!1353686 (= lt!597810 ($colon$colon!751 acc!759 (select (arr!44539 a!3742) from!3120)))))

(declare-fun b!1353687 () Bool)

(declare-fun res!898882 () Bool)

(assert (=> b!1353687 (=> (not res!898882) (not e!769191))))

(assert (=> b!1353687 (= res!898882 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45091 a!3742)))))

(declare-fun b!1353688 () Bool)

(declare-datatypes ((Unit!44274 0))(
  ( (Unit!44275) )
))
(declare-fun e!769189 () Unit!44274)

(declare-fun Unit!44276 () Unit!44274)

(assert (=> b!1353688 (= e!769189 Unit!44276)))

(declare-fun b!1353689 () Bool)

(declare-fun lt!597812 () Unit!44274)

(assert (=> b!1353689 (= e!769189 lt!597812)))

(declare-fun lt!597814 () Unit!44274)

(declare-fun lemmaListSubSeqRefl!0 (List!31658) Unit!44274)

(assert (=> b!1353689 (= lt!597814 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!734 (List!31658 List!31658) Bool)

(assert (=> b!1353689 (subseq!734 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92181 List!31658 List!31658 (_ BitVec 32)) Unit!44274)

(assert (=> b!1353689 (= lt!597812 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!751 acc!759 (select (arr!44539 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92181 (_ BitVec 32) List!31658) Bool)

(assert (=> b!1353689 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353690 () Bool)

(declare-fun res!898878 () Bool)

(assert (=> b!1353690 (=> (not res!898878) (not e!769191))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353690 (= res!898878 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45091 a!3742))))))

(declare-fun b!1353691 () Bool)

(declare-fun res!898877 () Bool)

(assert (=> b!1353691 (=> (not res!898877) (not e!769191))))

(declare-fun contains!9278 (List!31658 (_ BitVec 64)) Bool)

(assert (=> b!1353691 (= res!898877 (not (contains!9278 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353692 () Bool)

(declare-fun res!898880 () Bool)

(assert (=> b!1353692 (=> (not res!898880) (not e!769191))))

(assert (=> b!1353692 (= res!898880 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353693 () Bool)

(declare-fun res!898885 () Bool)

(assert (=> b!1353693 (=> (not res!898885) (not e!769191))))

(assert (=> b!1353693 (= res!898885 (not (contains!9278 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898883 () Bool)

(assert (=> start!114050 (=> (not res!898883) (not e!769191))))

(assert (=> start!114050 (= res!898883 (and (bvslt (size!45091 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45091 a!3742))))))

(assert (=> start!114050 e!769191))

(assert (=> start!114050 true))

(declare-fun array_inv!33772 (array!92181) Bool)

(assert (=> start!114050 (array_inv!33772 a!3742)))

(declare-fun b!1353684 () Bool)

(declare-fun res!898875 () Bool)

(assert (=> b!1353684 (=> (not res!898875) (not e!769191))))

(declare-fun noDuplicate!2193 (List!31658) Bool)

(assert (=> b!1353684 (= res!898875 (noDuplicate!2193 acc!759))))

(declare-fun b!1353694 () Bool)

(declare-fun res!898876 () Bool)

(assert (=> b!1353694 (=> (not res!898876) (not e!769192))))

(assert (=> b!1353694 (= res!898876 (not (contains!9278 lt!597810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353695 () Bool)

(declare-fun res!898886 () Bool)

(assert (=> b!1353695 (=> (not res!898886) (not e!769192))))

(assert (=> b!1353695 (= res!898886 (noDuplicate!2193 lt!597810))))

(declare-fun b!1353696 () Bool)

(declare-fun res!898874 () Bool)

(assert (=> b!1353696 (=> (not res!898874) (not e!769191))))

(assert (=> b!1353696 (= res!898874 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31655))))

(declare-fun b!1353697 () Bool)

(assert (=> b!1353697 (= e!769191 e!769188)))

(declare-fun res!898884 () Bool)

(assert (=> b!1353697 (=> (not res!898884) (not e!769188))))

(declare-fun lt!597813 () Bool)

(assert (=> b!1353697 (= res!898884 (and (not (= from!3120 i!1404)) lt!597813))))

(declare-fun lt!597811 () Unit!44274)

(assert (=> b!1353697 (= lt!597811 e!769189)))

(declare-fun c!126848 () Bool)

(assert (=> b!1353697 (= c!126848 lt!597813)))

(assert (=> b!1353697 (= lt!597813 (validKeyInArray!0 (select (arr!44539 a!3742) from!3120)))))

(declare-fun b!1353698 () Bool)

(declare-fun res!898879 () Bool)

(assert (=> b!1353698 (=> (not res!898879) (not e!769192))))

(assert (=> b!1353698 (= res!898879 (not (contains!9278 lt!597810 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353699 () Bool)

(assert (=> b!1353699 (= e!769192 false)))

(declare-fun lt!597809 () Bool)

(assert (=> b!1353699 (= lt!597809 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597810))))

(assert (= (and start!114050 res!898883) b!1353684))

(assert (= (and b!1353684 res!898875) b!1353691))

(assert (= (and b!1353691 res!898877) b!1353693))

(assert (= (and b!1353693 res!898885) b!1353696))

(assert (= (and b!1353696 res!898874) b!1353692))

(assert (= (and b!1353692 res!898880) b!1353690))

(assert (= (and b!1353690 res!898878) b!1353685))

(assert (= (and b!1353685 res!898873) b!1353687))

(assert (= (and b!1353687 res!898882) b!1353697))

(assert (= (and b!1353697 c!126848) b!1353689))

(assert (= (and b!1353697 (not c!126848)) b!1353688))

(assert (= (and b!1353697 res!898884) b!1353686))

(assert (= (and b!1353686 res!898881) b!1353695))

(assert (= (and b!1353695 res!898886) b!1353694))

(assert (= (and b!1353694 res!898876) b!1353698))

(assert (= (and b!1353698 res!898879) b!1353699))

(declare-fun m!1239781 () Bool)

(assert (=> b!1353689 m!1239781))

(declare-fun m!1239783 () Bool)

(assert (=> b!1353689 m!1239783))

(declare-fun m!1239785 () Bool)

(assert (=> b!1353689 m!1239785))

(declare-fun m!1239787 () Bool)

(assert (=> b!1353689 m!1239787))

(declare-fun m!1239789 () Bool)

(assert (=> b!1353689 m!1239789))

(assert (=> b!1353689 m!1239783))

(assert (=> b!1353689 m!1239785))

(declare-fun m!1239791 () Bool)

(assert (=> b!1353689 m!1239791))

(declare-fun m!1239793 () Bool)

(assert (=> b!1353684 m!1239793))

(assert (=> b!1353697 m!1239783))

(assert (=> b!1353697 m!1239783))

(declare-fun m!1239795 () Bool)

(assert (=> b!1353697 m!1239795))

(declare-fun m!1239797 () Bool)

(assert (=> b!1353695 m!1239797))

(declare-fun m!1239799 () Bool)

(assert (=> b!1353685 m!1239799))

(declare-fun m!1239801 () Bool)

(assert (=> b!1353692 m!1239801))

(declare-fun m!1239803 () Bool)

(assert (=> start!114050 m!1239803))

(declare-fun m!1239805 () Bool)

(assert (=> b!1353693 m!1239805))

(declare-fun m!1239807 () Bool)

(assert (=> b!1353696 m!1239807))

(declare-fun m!1239809 () Bool)

(assert (=> b!1353698 m!1239809))

(declare-fun m!1239811 () Bool)

(assert (=> b!1353699 m!1239811))

(declare-fun m!1239813 () Bool)

(assert (=> b!1353691 m!1239813))

(declare-fun m!1239815 () Bool)

(assert (=> b!1353694 m!1239815))

(assert (=> b!1353686 m!1239783))

(assert (=> b!1353686 m!1239783))

(assert (=> b!1353686 m!1239785))

(check-sat (not b!1353685) (not start!114050) (not b!1353699) (not b!1353694) (not b!1353698) (not b!1353686) (not b!1353691) (not b!1353696) (not b!1353697) (not b!1353692) (not b!1353689) (not b!1353695) (not b!1353693) (not b!1353684))
(check-sat)
