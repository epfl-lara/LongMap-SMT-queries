; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114158 () Bool)

(assert start!114158)

(declare-fun res!900857 () Bool)

(declare-fun e!769915 () Bool)

(assert (=> start!114158 (=> (not res!900857) (not e!769915))))

(declare-datatypes ((array!92289 0))(
  ( (array!92290 (arr!44593 (Array (_ BitVec 32) (_ BitVec 64))) (size!45145 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92289)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114158 (= res!900857 (and (bvslt (size!45145 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45145 a!3742))))))

(assert (=> start!114158 e!769915))

(assert (=> start!114158 true))

(declare-fun array_inv!33826 (array!92289) Bool)

(assert (=> start!114158 (array_inv!33826 a!3742)))

(declare-fun b!1355982 () Bool)

(declare-fun e!769917 () Bool)

(assert (=> b!1355982 (= e!769915 e!769917)))

(declare-fun res!900849 () Bool)

(assert (=> b!1355982 (=> (not res!900849) (not e!769917))))

(declare-fun lt!598702 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355982 (= res!900849 (and (not (= from!3120 i!1404)) (not lt!598702) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44436 0))(
  ( (Unit!44437) )
))
(declare-fun lt!598701 () Unit!44436)

(declare-fun e!769918 () Unit!44436)

(assert (=> b!1355982 (= lt!598701 e!769918)))

(declare-fun c!127010 () Bool)

(assert (=> b!1355982 (= c!127010 lt!598702)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355982 (= lt!598702 (validKeyInArray!0 (select (arr!44593 a!3742) from!3120)))))

(declare-fun b!1355983 () Bool)

(declare-fun res!900848 () Bool)

(assert (=> b!1355983 (=> (not res!900848) (not e!769915))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355983 (= res!900848 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355984 () Bool)

(declare-fun Unit!44438 () Unit!44436)

(assert (=> b!1355984 (= e!769918 Unit!44438)))

(declare-fun b!1355985 () Bool)

(declare-fun res!900847 () Bool)

(assert (=> b!1355985 (=> (not res!900847) (not e!769915))))

(assert (=> b!1355985 (= res!900847 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45145 a!3742))))))

(declare-fun b!1355986 () Bool)

(declare-fun res!900855 () Bool)

(assert (=> b!1355986 (=> (not res!900855) (not e!769915))))

(declare-datatypes ((List!31712 0))(
  ( (Nil!31709) (Cons!31708 (h!32917 (_ BitVec 64)) (t!46362 List!31712)) )
))
(declare-fun acc!759 () List!31712)

(declare-fun contains!9332 (List!31712 (_ BitVec 64)) Bool)

(assert (=> b!1355986 (= res!900855 (not (contains!9332 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355987 () Bool)

(declare-fun res!900853 () Bool)

(assert (=> b!1355987 (=> (not res!900853) (not e!769915))))

(declare-fun arrayNoDuplicates!0 (array!92289 (_ BitVec 32) List!31712) Bool)

(assert (=> b!1355987 (= res!900853 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31709))))

(declare-fun b!1355988 () Bool)

(declare-fun res!900856 () Bool)

(assert (=> b!1355988 (=> (not res!900856) (not e!769915))))

(declare-fun noDuplicate!2247 (List!31712) Bool)

(assert (=> b!1355988 (= res!900856 (noDuplicate!2247 acc!759))))

(declare-fun b!1355989 () Bool)

(declare-fun res!900851 () Bool)

(assert (=> b!1355989 (=> (not res!900851) (not e!769915))))

(assert (=> b!1355989 (= res!900851 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355990 () Bool)

(declare-fun res!900854 () Bool)

(assert (=> b!1355990 (=> (not res!900854) (not e!769917))))

(assert (=> b!1355990 (= res!900854 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355991 () Bool)

(declare-fun res!900850 () Bool)

(assert (=> b!1355991 (=> (not res!900850) (not e!769915))))

(assert (=> b!1355991 (= res!900850 (not (contains!9332 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355992 () Bool)

(declare-fun res!900852 () Bool)

(assert (=> b!1355992 (=> (not res!900852) (not e!769915))))

(assert (=> b!1355992 (= res!900852 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45145 a!3742)))))

(declare-fun b!1355993 () Bool)

(declare-fun lt!598699 () Unit!44436)

(assert (=> b!1355993 (= e!769918 lt!598699)))

(declare-fun lt!598700 () Unit!44436)

(declare-fun lemmaListSubSeqRefl!0 (List!31712) Unit!44436)

(assert (=> b!1355993 (= lt!598700 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!788 (List!31712 List!31712) Bool)

(assert (=> b!1355993 (subseq!788 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92289 List!31712 List!31712 (_ BitVec 32)) Unit!44436)

(declare-fun $colon$colon!805 (List!31712 (_ BitVec 64)) List!31712)

(assert (=> b!1355993 (= lt!598699 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!805 acc!759 (select (arr!44593 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355993 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355994 () Bool)

(assert (=> b!1355994 (= e!769917 (not (bvsle from!3120 (size!45145 a!3742))))))

(assert (=> b!1355994 (arrayNoDuplicates!0 (array!92290 (store (arr!44593 a!3742) i!1404 l!3587) (size!45145 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598698 () Unit!44436)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31712) Unit!44436)

(assert (=> b!1355994 (= lt!598698 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114158 res!900857) b!1355988))

(assert (= (and b!1355988 res!900856) b!1355991))

(assert (= (and b!1355991 res!900850) b!1355986))

(assert (= (and b!1355986 res!900855) b!1355987))

(assert (= (and b!1355987 res!900853) b!1355989))

(assert (= (and b!1355989 res!900851) b!1355985))

(assert (= (and b!1355985 res!900847) b!1355983))

(assert (= (and b!1355983 res!900848) b!1355992))

(assert (= (and b!1355992 res!900852) b!1355982))

(assert (= (and b!1355982 c!127010) b!1355993))

(assert (= (and b!1355982 (not c!127010)) b!1355984))

(assert (= (and b!1355982 res!900849) b!1355990))

(assert (= (and b!1355990 res!900854) b!1355994))

(declare-fun m!1241581 () Bool)

(assert (=> start!114158 m!1241581))

(declare-fun m!1241583 () Bool)

(assert (=> b!1355988 m!1241583))

(declare-fun m!1241585 () Bool)

(assert (=> b!1355989 m!1241585))

(declare-fun m!1241587 () Bool)

(assert (=> b!1355990 m!1241587))

(declare-fun m!1241589 () Bool)

(assert (=> b!1355994 m!1241589))

(declare-fun m!1241591 () Bool)

(assert (=> b!1355994 m!1241591))

(declare-fun m!1241593 () Bool)

(assert (=> b!1355994 m!1241593))

(declare-fun m!1241595 () Bool)

(assert (=> b!1355991 m!1241595))

(declare-fun m!1241597 () Bool)

(assert (=> b!1355986 m!1241597))

(declare-fun m!1241599 () Bool)

(assert (=> b!1355987 m!1241599))

(declare-fun m!1241601 () Bool)

(assert (=> b!1355983 m!1241601))

(declare-fun m!1241603 () Bool)

(assert (=> b!1355982 m!1241603))

(assert (=> b!1355982 m!1241603))

(declare-fun m!1241605 () Bool)

(assert (=> b!1355982 m!1241605))

(declare-fun m!1241607 () Bool)

(assert (=> b!1355993 m!1241607))

(assert (=> b!1355993 m!1241603))

(declare-fun m!1241609 () Bool)

(assert (=> b!1355993 m!1241609))

(declare-fun m!1241611 () Bool)

(assert (=> b!1355993 m!1241611))

(assert (=> b!1355993 m!1241587))

(assert (=> b!1355993 m!1241603))

(assert (=> b!1355993 m!1241609))

(declare-fun m!1241613 () Bool)

(assert (=> b!1355993 m!1241613))

(check-sat (not b!1355987) (not b!1355991) (not b!1355989) (not b!1355988) (not b!1355994) (not b!1355983) (not b!1355982) (not b!1355986) (not start!114158) (not b!1355993) (not b!1355990))
(check-sat)
