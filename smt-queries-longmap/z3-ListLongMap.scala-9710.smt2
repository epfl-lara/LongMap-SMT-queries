; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114874 () Bool)

(assert start!114874)

(declare-fun b!1361659 () Bool)

(declare-fun res!905760 () Bool)

(declare-fun e!772516 () Bool)

(assert (=> b!1361659 (=> (not res!905760) (not e!772516))))

(declare-datatypes ((List!31780 0))(
  ( (Nil!31777) (Cons!31776 (h!32985 (_ BitVec 64)) (t!46465 List!31780)) )
))
(declare-fun lt!600233 () List!31780)

(declare-fun contains!9489 (List!31780 (_ BitVec 64)) Bool)

(assert (=> b!1361659 (= res!905760 (not (contains!9489 lt!600233 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905763 () Bool)

(declare-fun e!772514 () Bool)

(assert (=> start!114874 (=> (not res!905763) (not e!772514))))

(declare-datatypes ((array!92609 0))(
  ( (array!92610 (arr!44739 (Array (_ BitVec 32) (_ BitVec 64))) (size!45289 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92609)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114874 (= res!905763 (and (bvslt (size!45289 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45289 a!3742))))))

(assert (=> start!114874 e!772514))

(assert (=> start!114874 true))

(declare-fun array_inv!33767 (array!92609) Bool)

(assert (=> start!114874 (array_inv!33767 a!3742)))

(declare-fun b!1361660 () Bool)

(declare-fun res!905764 () Bool)

(assert (=> b!1361660 (=> (not res!905764) (not e!772514))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361660 (= res!905764 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45289 a!3742))))))

(declare-fun b!1361661 () Bool)

(declare-datatypes ((Unit!44877 0))(
  ( (Unit!44878) )
))
(declare-fun e!772513 () Unit!44877)

(declare-fun Unit!44879 () Unit!44877)

(assert (=> b!1361661 (= e!772513 Unit!44879)))

(declare-fun b!1361662 () Bool)

(declare-fun res!905761 () Bool)

(assert (=> b!1361662 (=> (not res!905761) (not e!772514))))

(declare-fun acc!759 () List!31780)

(declare-fun arrayNoDuplicates!0 (array!92609 (_ BitVec 32) List!31780) Bool)

(assert (=> b!1361662 (= res!905761 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361663 () Bool)

(declare-fun res!905762 () Bool)

(assert (=> b!1361663 (=> (not res!905762) (not e!772514))))

(assert (=> b!1361663 (= res!905762 (not (contains!9489 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361664 () Bool)

(declare-fun res!905758 () Bool)

(assert (=> b!1361664 (=> (not res!905758) (not e!772516))))

(declare-fun noDuplicate!2346 (List!31780) Bool)

(assert (=> b!1361664 (= res!905758 (noDuplicate!2346 lt!600233))))

(declare-fun b!1361665 () Bool)

(declare-fun res!905768 () Bool)

(assert (=> b!1361665 (=> (not res!905768) (not e!772516))))

(assert (=> b!1361665 (= res!905768 (not (contains!9489 lt!600233 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361666 () Bool)

(declare-fun lt!600232 () Unit!44877)

(assert (=> b!1361666 (= e!772513 lt!600232)))

(declare-fun lt!600235 () Unit!44877)

(declare-fun lemmaListSubSeqRefl!0 (List!31780) Unit!44877)

(assert (=> b!1361666 (= lt!600235 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!891 (List!31780 List!31780) Bool)

(assert (=> b!1361666 (subseq!891 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92609 List!31780 List!31780 (_ BitVec 32)) Unit!44877)

(declare-fun $colon$colon!894 (List!31780 (_ BitVec 64)) List!31780)

(assert (=> b!1361666 (= lt!600232 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!894 acc!759 (select (arr!44739 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361666 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361667 () Bool)

(declare-fun res!905766 () Bool)

(assert (=> b!1361667 (=> (not res!905766) (not e!772514))))

(assert (=> b!1361667 (= res!905766 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31777))))

(declare-fun b!1361668 () Bool)

(declare-fun res!905769 () Bool)

(assert (=> b!1361668 (=> (not res!905769) (not e!772514))))

(assert (=> b!1361668 (= res!905769 (noDuplicate!2346 acc!759))))

(declare-fun b!1361669 () Bool)

(declare-fun res!905767 () Bool)

(assert (=> b!1361669 (=> (not res!905767) (not e!772514))))

(assert (=> b!1361669 (= res!905767 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45289 a!3742)))))

(declare-fun b!1361670 () Bool)

(declare-fun res!905759 () Bool)

(assert (=> b!1361670 (=> (not res!905759) (not e!772514))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361670 (= res!905759 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361671 () Bool)

(declare-fun res!905765 () Bool)

(assert (=> b!1361671 (=> (not res!905765) (not e!772514))))

(assert (=> b!1361671 (= res!905765 (not (contains!9489 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361672 () Bool)

(declare-fun e!772512 () Bool)

(assert (=> b!1361672 (= e!772512 e!772516)))

(declare-fun res!905770 () Bool)

(assert (=> b!1361672 (=> (not res!905770) (not e!772516))))

(assert (=> b!1361672 (= res!905770 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1361672 (= lt!600233 ($colon$colon!894 acc!759 (select (arr!44739 a!3742) from!3120)))))

(declare-fun b!1361673 () Bool)

(assert (=> b!1361673 (= e!772516 false)))

(declare-fun lt!600234 () Bool)

(assert (=> b!1361673 (= lt!600234 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600233))))

(declare-fun b!1361674 () Bool)

(assert (=> b!1361674 (= e!772514 e!772512)))

(declare-fun res!905757 () Bool)

(assert (=> b!1361674 (=> (not res!905757) (not e!772512))))

(declare-fun lt!600231 () Bool)

(assert (=> b!1361674 (= res!905757 (and (not (= from!3120 i!1404)) lt!600231))))

(declare-fun lt!600230 () Unit!44877)

(assert (=> b!1361674 (= lt!600230 e!772513)))

(declare-fun c!127391 () Bool)

(assert (=> b!1361674 (= c!127391 lt!600231)))

(assert (=> b!1361674 (= lt!600231 (validKeyInArray!0 (select (arr!44739 a!3742) from!3120)))))

(assert (= (and start!114874 res!905763) b!1361668))

(assert (= (and b!1361668 res!905769) b!1361671))

(assert (= (and b!1361671 res!905765) b!1361663))

(assert (= (and b!1361663 res!905762) b!1361667))

(assert (= (and b!1361667 res!905766) b!1361662))

(assert (= (and b!1361662 res!905761) b!1361660))

(assert (= (and b!1361660 res!905764) b!1361670))

(assert (= (and b!1361670 res!905759) b!1361669))

(assert (= (and b!1361669 res!905767) b!1361674))

(assert (= (and b!1361674 c!127391) b!1361666))

(assert (= (and b!1361674 (not c!127391)) b!1361661))

(assert (= (and b!1361674 res!905757) b!1361672))

(assert (= (and b!1361672 res!905770) b!1361664))

(assert (= (and b!1361664 res!905758) b!1361659))

(assert (= (and b!1361659 res!905760) b!1361665))

(assert (= (and b!1361665 res!905768) b!1361673))

(declare-fun m!1246741 () Bool)

(assert (=> b!1361673 m!1246741))

(declare-fun m!1246743 () Bool)

(assert (=> b!1361664 m!1246743))

(declare-fun m!1246745 () Bool)

(assert (=> b!1361670 m!1246745))

(declare-fun m!1246747 () Bool)

(assert (=> start!114874 m!1246747))

(declare-fun m!1246749 () Bool)

(assert (=> b!1361668 m!1246749))

(declare-fun m!1246751 () Bool)

(assert (=> b!1361672 m!1246751))

(assert (=> b!1361672 m!1246751))

(declare-fun m!1246753 () Bool)

(assert (=> b!1361672 m!1246753))

(declare-fun m!1246755 () Bool)

(assert (=> b!1361666 m!1246755))

(assert (=> b!1361666 m!1246751))

(assert (=> b!1361666 m!1246753))

(declare-fun m!1246757 () Bool)

(assert (=> b!1361666 m!1246757))

(declare-fun m!1246759 () Bool)

(assert (=> b!1361666 m!1246759))

(assert (=> b!1361666 m!1246751))

(assert (=> b!1361666 m!1246753))

(declare-fun m!1246761 () Bool)

(assert (=> b!1361666 m!1246761))

(declare-fun m!1246763 () Bool)

(assert (=> b!1361671 m!1246763))

(declare-fun m!1246765 () Bool)

(assert (=> b!1361667 m!1246765))

(declare-fun m!1246767 () Bool)

(assert (=> b!1361665 m!1246767))

(declare-fun m!1246769 () Bool)

(assert (=> b!1361663 m!1246769))

(assert (=> b!1361674 m!1246751))

(assert (=> b!1361674 m!1246751))

(declare-fun m!1246771 () Bool)

(assert (=> b!1361674 m!1246771))

(declare-fun m!1246773 () Bool)

(assert (=> b!1361659 m!1246773))

(declare-fun m!1246775 () Bool)

(assert (=> b!1361662 m!1246775))

(check-sat (not b!1361672) (not b!1361664) (not b!1361665) (not b!1361674) (not b!1361668) (not b!1361667) (not start!114874) (not b!1361670) (not b!1361662) (not b!1361659) (not b!1361673) (not b!1361663) (not b!1361666) (not b!1361671))
(check-sat)
