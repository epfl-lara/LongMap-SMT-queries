; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116092 () Bool)

(assert start!116092)

(declare-fun b!1370980 () Bool)

(declare-fun e!776734 () Bool)

(assert (=> b!1370980 (= e!776734 false)))

(declare-datatypes ((array!93097 0))(
  ( (array!93098 (arr!44965 (Array (_ BitVec 32) (_ BitVec 64))) (size!45516 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93097)

(declare-datatypes ((List!32020 0))(
  ( (Nil!32017) (Cons!32016 (h!33234 (_ BitVec 64)) (t!46706 List!32020)) )
))
(declare-fun acc!866 () List!32020)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602792 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93097 (_ BitVec 32) List!32020) Bool)

(assert (=> b!1370980 (= lt!602792 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45200 0))(
  ( (Unit!45201) )
))
(declare-fun lt!602793 () Unit!45200)

(declare-fun newAcc!98 () List!32020)

(declare-fun noDuplicateSubseq!251 (List!32020 List!32020) Unit!45200)

(assert (=> b!1370980 (= lt!602793 (noDuplicateSubseq!251 newAcc!98 acc!866))))

(declare-fun b!1370981 () Bool)

(declare-fun res!913660 () Bool)

(assert (=> b!1370981 (=> (not res!913660) (not e!776734))))

(declare-fun noDuplicate!2536 (List!32020) Bool)

(assert (=> b!1370981 (= res!913660 (noDuplicate!2536 acc!866))))

(declare-fun b!1370982 () Bool)

(declare-fun res!913663 () Bool)

(assert (=> b!1370982 (=> (not res!913663) (not e!776734))))

(declare-fun contains!9705 (List!32020 (_ BitVec 64)) Bool)

(assert (=> b!1370982 (= res!913663 (not (contains!9705 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370983 () Bool)

(declare-fun res!913662 () Bool)

(assert (=> b!1370983 (=> (not res!913662) (not e!776734))))

(assert (=> b!1370983 (= res!913662 (not (contains!9705 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913661 () Bool)

(assert (=> start!116092 (=> (not res!913661) (not e!776734))))

(assert (=> start!116092 (= res!913661 (and (bvslt (size!45516 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45516 a!3861))))))

(assert (=> start!116092 e!776734))

(declare-fun array_inv!34246 (array!93097) Bool)

(assert (=> start!116092 (array_inv!34246 a!3861)))

(assert (=> start!116092 true))

(declare-fun b!1370984 () Bool)

(declare-fun res!913665 () Bool)

(assert (=> b!1370984 (=> (not res!913665) (not e!776734))))

(assert (=> b!1370984 (= res!913665 (not (contains!9705 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370985 () Bool)

(declare-fun res!913659 () Bool)

(assert (=> b!1370985 (=> (not res!913659) (not e!776734))))

(assert (=> b!1370985 (= res!913659 (not (contains!9705 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370986 () Bool)

(declare-fun res!913664 () Bool)

(assert (=> b!1370986 (=> (not res!913664) (not e!776734))))

(declare-fun subseq!1064 (List!32020 List!32020) Bool)

(assert (=> b!1370986 (= res!913664 (subseq!1064 newAcc!98 acc!866))))

(assert (= (and start!116092 res!913661) b!1370981))

(assert (= (and b!1370981 res!913660) b!1370983))

(assert (= (and b!1370983 res!913662) b!1370985))

(assert (= (and b!1370985 res!913659) b!1370984))

(assert (= (and b!1370984 res!913665) b!1370982))

(assert (= (and b!1370982 res!913663) b!1370986))

(assert (= (and b!1370986 res!913664) b!1370980))

(declare-fun m!1255015 () Bool)

(assert (=> start!116092 m!1255015))

(declare-fun m!1255017 () Bool)

(assert (=> b!1370986 m!1255017))

(declare-fun m!1255019 () Bool)

(assert (=> b!1370980 m!1255019))

(declare-fun m!1255021 () Bool)

(assert (=> b!1370980 m!1255021))

(declare-fun m!1255023 () Bool)

(assert (=> b!1370981 m!1255023))

(declare-fun m!1255025 () Bool)

(assert (=> b!1370984 m!1255025))

(declare-fun m!1255027 () Bool)

(assert (=> b!1370982 m!1255027))

(declare-fun m!1255029 () Bool)

(assert (=> b!1370985 m!1255029))

(declare-fun m!1255031 () Bool)

(assert (=> b!1370983 m!1255031))

(check-sat (not start!116092) (not b!1370984) (not b!1370982) (not b!1370980) (not b!1370981) (not b!1370983) (not b!1370986) (not b!1370985))
(check-sat)
