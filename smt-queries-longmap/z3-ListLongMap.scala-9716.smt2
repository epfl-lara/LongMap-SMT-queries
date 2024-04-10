; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114970 () Bool)

(assert start!114970)

(declare-fun b!1362705 () Bool)

(declare-fun res!906653 () Bool)

(declare-fun e!772956 () Bool)

(assert (=> b!1362705 (=> (not res!906653) (not e!772956))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92648 0))(
  ( (array!92649 (arr!44757 (Array (_ BitVec 32) (_ BitVec 64))) (size!45307 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92648)

(assert (=> b!1362705 (= res!906653 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45307 a!3742))))))

(declare-fun res!906647 () Bool)

(assert (=> start!114970 (=> (not res!906647) (not e!772956))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114970 (= res!906647 (and (bvslt (size!45307 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45307 a!3742))))))

(assert (=> start!114970 e!772956))

(assert (=> start!114970 true))

(declare-fun array_inv!33785 (array!92648) Bool)

(assert (=> start!114970 (array_inv!33785 a!3742)))

(declare-fun b!1362706 () Bool)

(declare-fun res!906651 () Bool)

(assert (=> b!1362706 (=> (not res!906651) (not e!772956))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362706 (= res!906651 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362707 () Bool)

(declare-datatypes ((Unit!44931 0))(
  ( (Unit!44932) )
))
(declare-fun e!772957 () Unit!44931)

(declare-fun lt!600563 () Unit!44931)

(assert (=> b!1362707 (= e!772957 lt!600563)))

(declare-fun lt!600565 () Unit!44931)

(declare-datatypes ((List!31798 0))(
  ( (Nil!31795) (Cons!31794 (h!33003 (_ BitVec 64)) (t!46486 List!31798)) )
))
(declare-fun acc!759 () List!31798)

(declare-fun lemmaListSubSeqRefl!0 (List!31798) Unit!44931)

(assert (=> b!1362707 (= lt!600565 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!909 (List!31798 List!31798) Bool)

(assert (=> b!1362707 (subseq!909 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92648 List!31798 List!31798 (_ BitVec 32)) Unit!44931)

(declare-fun $colon$colon!912 (List!31798 (_ BitVec 64)) List!31798)

(assert (=> b!1362707 (= lt!600563 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!912 acc!759 (select (arr!44757 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92648 (_ BitVec 32) List!31798) Bool)

(assert (=> b!1362707 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362708 () Bool)

(declare-fun res!906650 () Bool)

(assert (=> b!1362708 (=> (not res!906650) (not e!772956))))

(declare-fun contains!9507 (List!31798 (_ BitVec 64)) Bool)

(assert (=> b!1362708 (= res!906650 (not (contains!9507 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362709 () Bool)

(declare-fun Unit!44933 () Unit!44931)

(assert (=> b!1362709 (= e!772957 Unit!44933)))

(declare-fun b!1362710 () Bool)

(declare-fun res!906654 () Bool)

(assert (=> b!1362710 (=> (not res!906654) (not e!772956))))

(declare-fun noDuplicate!2364 (List!31798) Bool)

(assert (=> b!1362710 (= res!906654 (noDuplicate!2364 acc!759))))

(declare-fun b!1362711 () Bool)

(declare-fun res!906652 () Bool)

(assert (=> b!1362711 (=> (not res!906652) (not e!772956))))

(assert (=> b!1362711 (= res!906652 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362712 () Bool)

(declare-fun res!906648 () Bool)

(assert (=> b!1362712 (=> (not res!906648) (not e!772956))))

(assert (=> b!1362712 (= res!906648 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31795))))

(declare-fun b!1362713 () Bool)

(declare-fun lt!600564 () Bool)

(assert (=> b!1362713 (= e!772956 (and (not (= from!3120 i!1404)) (not lt!600564) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600562 () Unit!44931)

(assert (=> b!1362713 (= lt!600562 e!772957)))

(declare-fun c!127469 () Bool)

(assert (=> b!1362713 (= c!127469 lt!600564)))

(assert (=> b!1362713 (= lt!600564 (validKeyInArray!0 (select (arr!44757 a!3742) from!3120)))))

(declare-fun b!1362714 () Bool)

(declare-fun res!906655 () Bool)

(assert (=> b!1362714 (=> (not res!906655) (not e!772956))))

(assert (=> b!1362714 (= res!906655 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45307 a!3742)))))

(declare-fun b!1362715 () Bool)

(declare-fun res!906649 () Bool)

(assert (=> b!1362715 (=> (not res!906649) (not e!772956))))

(assert (=> b!1362715 (= res!906649 (not (contains!9507 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114970 res!906647) b!1362710))

(assert (= (and b!1362710 res!906654) b!1362708))

(assert (= (and b!1362708 res!906650) b!1362715))

(assert (= (and b!1362715 res!906649) b!1362712))

(assert (= (and b!1362712 res!906648) b!1362711))

(assert (= (and b!1362711 res!906652) b!1362705))

(assert (= (and b!1362705 res!906653) b!1362706))

(assert (= (and b!1362706 res!906651) b!1362714))

(assert (= (and b!1362714 res!906655) b!1362713))

(assert (= (and b!1362713 c!127469) b!1362707))

(assert (= (and b!1362713 (not c!127469)) b!1362709))

(declare-fun m!1247639 () Bool)

(assert (=> b!1362706 m!1247639))

(declare-fun m!1247641 () Bool)

(assert (=> b!1362708 m!1247641))

(declare-fun m!1247643 () Bool)

(assert (=> b!1362707 m!1247643))

(declare-fun m!1247645 () Bool)

(assert (=> b!1362707 m!1247645))

(declare-fun m!1247647 () Bool)

(assert (=> b!1362707 m!1247647))

(declare-fun m!1247649 () Bool)

(assert (=> b!1362707 m!1247649))

(declare-fun m!1247651 () Bool)

(assert (=> b!1362707 m!1247651))

(assert (=> b!1362707 m!1247645))

(assert (=> b!1362707 m!1247647))

(declare-fun m!1247653 () Bool)

(assert (=> b!1362707 m!1247653))

(declare-fun m!1247655 () Bool)

(assert (=> b!1362710 m!1247655))

(assert (=> b!1362713 m!1247645))

(assert (=> b!1362713 m!1247645))

(declare-fun m!1247657 () Bool)

(assert (=> b!1362713 m!1247657))

(declare-fun m!1247659 () Bool)

(assert (=> b!1362715 m!1247659))

(declare-fun m!1247661 () Bool)

(assert (=> b!1362711 m!1247661))

(declare-fun m!1247663 () Bool)

(assert (=> start!114970 m!1247663))

(declare-fun m!1247665 () Bool)

(assert (=> b!1362712 m!1247665))

(check-sat (not b!1362706) (not b!1362715) (not start!114970) (not b!1362708) (not b!1362707) (not b!1362713) (not b!1362712) (not b!1362710) (not b!1362711))
(check-sat)
