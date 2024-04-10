; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114154 () Bool)

(assert start!114154)

(declare-fun b!1355978 () Bool)

(declare-datatypes ((Unit!44589 0))(
  ( (Unit!44590) )
))
(declare-fun e!769924 () Unit!44589)

(declare-fun lt!598857 () Unit!44589)

(assert (=> b!1355978 (= e!769924 lt!598857)))

(declare-fun lt!598855 () Unit!44589)

(declare-datatypes ((List!31657 0))(
  ( (Nil!31654) (Cons!31653 (h!32862 (_ BitVec 64)) (t!46315 List!31657)) )
))
(declare-fun acc!759 () List!31657)

(declare-fun lemmaListSubSeqRefl!0 (List!31657) Unit!44589)

(assert (=> b!1355978 (= lt!598855 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!786 (List!31657 List!31657) Bool)

(assert (=> b!1355978 (subseq!786 acc!759 acc!759)))

(declare-datatypes ((array!92336 0))(
  ( (array!92337 (arr!44616 (Array (_ BitVec 32) (_ BitVec 64))) (size!45166 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92336)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92336 List!31657 List!31657 (_ BitVec 32)) Unit!44589)

(declare-fun $colon$colon!801 (List!31657 (_ BitVec 64)) List!31657)

(assert (=> b!1355978 (= lt!598857 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!801 acc!759 (select (arr!44616 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92336 (_ BitVec 32) List!31657) Bool)

(assert (=> b!1355978 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355979 () Bool)

(declare-fun Unit!44591 () Unit!44589)

(assert (=> b!1355979 (= e!769924 Unit!44591)))

(declare-fun b!1355980 () Bool)

(declare-fun e!769926 () Bool)

(assert (=> b!1355980 (= e!769926 false)))

(declare-fun lt!598854 () Bool)

(assert (=> b!1355980 (= lt!598854 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355981 () Bool)

(declare-fun res!900815 () Bool)

(declare-fun e!769927 () Bool)

(assert (=> b!1355981 (=> (not res!900815) (not e!769927))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355981 (= res!900815 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355982 () Bool)

(declare-fun res!900823 () Bool)

(assert (=> b!1355982 (=> (not res!900823) (not e!769927))))

(declare-fun contains!9366 (List!31657 (_ BitVec 64)) Bool)

(assert (=> b!1355982 (= res!900823 (not (contains!9366 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355984 () Bool)

(declare-fun res!900820 () Bool)

(assert (=> b!1355984 (=> (not res!900820) (not e!769927))))

(assert (=> b!1355984 (= res!900820 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355985 () Bool)

(declare-fun res!900814 () Bool)

(assert (=> b!1355985 (=> (not res!900814) (not e!769927))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355985 (= res!900814 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45166 a!3742))))))

(declare-fun b!1355986 () Bool)

(declare-fun res!900817 () Bool)

(assert (=> b!1355986 (=> (not res!900817) (not e!769927))))

(assert (=> b!1355986 (= res!900817 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31654))))

(declare-fun b!1355987 () Bool)

(assert (=> b!1355987 (= e!769927 e!769926)))

(declare-fun res!900818 () Bool)

(assert (=> b!1355987 (=> (not res!900818) (not e!769926))))

(declare-fun lt!598856 () Bool)

(assert (=> b!1355987 (= res!900818 (and (not (= from!3120 i!1404)) (not lt!598856) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598858 () Unit!44589)

(assert (=> b!1355987 (= lt!598858 e!769924)))

(declare-fun c!127022 () Bool)

(assert (=> b!1355987 (= c!127022 lt!598856)))

(assert (=> b!1355987 (= lt!598856 (validKeyInArray!0 (select (arr!44616 a!3742) from!3120)))))

(declare-fun res!900822 () Bool)

(assert (=> start!114154 (=> (not res!900822) (not e!769927))))

(assert (=> start!114154 (= res!900822 (and (bvslt (size!45166 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45166 a!3742))))))

(assert (=> start!114154 e!769927))

(assert (=> start!114154 true))

(declare-fun array_inv!33644 (array!92336) Bool)

(assert (=> start!114154 (array_inv!33644 a!3742)))

(declare-fun b!1355983 () Bool)

(declare-fun res!900821 () Bool)

(assert (=> b!1355983 (=> (not res!900821) (not e!769927))))

(declare-fun noDuplicate!2223 (List!31657) Bool)

(assert (=> b!1355983 (= res!900821 (noDuplicate!2223 acc!759))))

(declare-fun b!1355988 () Bool)

(declare-fun res!900819 () Bool)

(assert (=> b!1355988 (=> (not res!900819) (not e!769927))))

(assert (=> b!1355988 (= res!900819 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45166 a!3742)))))

(declare-fun b!1355989 () Bool)

(declare-fun res!900816 () Bool)

(assert (=> b!1355989 (=> (not res!900816) (not e!769927))))

(assert (=> b!1355989 (= res!900816 (not (contains!9366 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114154 res!900822) b!1355983))

(assert (= (and b!1355983 res!900821) b!1355989))

(assert (= (and b!1355989 res!900816) b!1355982))

(assert (= (and b!1355982 res!900823) b!1355986))

(assert (= (and b!1355986 res!900817) b!1355984))

(assert (= (and b!1355984 res!900820) b!1355985))

(assert (= (and b!1355985 res!900814) b!1355981))

(assert (= (and b!1355981 res!900815) b!1355988))

(assert (= (and b!1355988 res!900819) b!1355987))

(assert (= (and b!1355987 c!127022) b!1355978))

(assert (= (and b!1355987 (not c!127022)) b!1355979))

(assert (= (and b!1355987 res!900818) b!1355980))

(declare-fun m!1242041 () Bool)

(assert (=> b!1355981 m!1242041))

(declare-fun m!1242043 () Bool)

(assert (=> b!1355987 m!1242043))

(assert (=> b!1355987 m!1242043))

(declare-fun m!1242045 () Bool)

(assert (=> b!1355987 m!1242045))

(declare-fun m!1242047 () Bool)

(assert (=> b!1355983 m!1242047))

(declare-fun m!1242049 () Bool)

(assert (=> b!1355978 m!1242049))

(assert (=> b!1355978 m!1242043))

(declare-fun m!1242051 () Bool)

(assert (=> b!1355978 m!1242051))

(declare-fun m!1242053 () Bool)

(assert (=> b!1355978 m!1242053))

(declare-fun m!1242055 () Bool)

(assert (=> b!1355978 m!1242055))

(assert (=> b!1355978 m!1242043))

(assert (=> b!1355978 m!1242051))

(declare-fun m!1242057 () Bool)

(assert (=> b!1355978 m!1242057))

(declare-fun m!1242059 () Bool)

(assert (=> start!114154 m!1242059))

(declare-fun m!1242061 () Bool)

(assert (=> b!1355989 m!1242061))

(declare-fun m!1242063 () Bool)

(assert (=> b!1355986 m!1242063))

(declare-fun m!1242065 () Bool)

(assert (=> b!1355982 m!1242065))

(assert (=> b!1355980 m!1242055))

(declare-fun m!1242067 () Bool)

(assert (=> b!1355984 m!1242067))

(check-sat (not b!1355984) (not start!114154) (not b!1355981) (not b!1355982) (not b!1355980) (not b!1355989) (not b!1355986) (not b!1355987) (not b!1355978) (not b!1355983))
(check-sat)
