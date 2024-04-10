; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113832 () Bool)

(assert start!113832)

(declare-fun b!1350297 () Bool)

(declare-fun e!768138 () Bool)

(declare-datatypes ((List!31514 0))(
  ( (Nil!31511) (Cons!31510 (h!32719 (_ BitVec 64)) (t!46172 List!31514)) )
))
(declare-fun noDuplicate!2080 (List!31514) Bool)

(assert (=> b!1350297 (= e!768138 (not (noDuplicate!2080 Nil!31511)))))

(declare-fun b!1350298 () Bool)

(declare-fun res!895759 () Bool)

(assert (=> b!1350298 (=> (not res!895759) (not e!768138))))

(declare-fun acc!759 () List!31514)

(declare-fun contains!9223 (List!31514 (_ BitVec 64)) Bool)

(assert (=> b!1350298 (= res!895759 (not (contains!9223 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350299 () Bool)

(declare-fun res!895758 () Bool)

(assert (=> b!1350299 (=> (not res!895758) (not e!768138))))

(declare-datatypes ((array!92044 0))(
  ( (array!92045 (arr!44473 (Array (_ BitVec 32) (_ BitVec 64))) (size!45023 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92044)

(assert (=> b!1350299 (= res!895758 (bvsle #b00000000000000000000000000000000 (size!45023 a!3742)))))

(declare-fun b!1350300 () Bool)

(declare-fun res!895756 () Bool)

(assert (=> b!1350300 (=> (not res!895756) (not e!768138))))

(assert (=> b!1350300 (= res!895756 (not (contains!9223 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!895755 () Bool)

(assert (=> start!113832 (=> (not res!895755) (not e!768138))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113832 (= res!895755 (and (bvslt (size!45023 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45023 a!3742))))))

(assert (=> start!113832 e!768138))

(declare-fun array_inv!33501 (array!92044) Bool)

(assert (=> start!113832 (array_inv!33501 a!3742)))

(assert (=> start!113832 true))

(declare-fun b!1350301 () Bool)

(declare-fun res!895757 () Bool)

(assert (=> b!1350301 (=> (not res!895757) (not e!768138))))

(assert (=> b!1350301 (= res!895757 (noDuplicate!2080 acc!759))))

(assert (= (and start!113832 res!895755) b!1350301))

(assert (= (and b!1350301 res!895757) b!1350300))

(assert (= (and b!1350300 res!895756) b!1350298))

(assert (= (and b!1350298 res!895759) b!1350299))

(assert (= (and b!1350299 res!895758) b!1350297))

(declare-fun m!1237527 () Bool)

(assert (=> b!1350301 m!1237527))

(declare-fun m!1237529 () Bool)

(assert (=> b!1350300 m!1237529))

(declare-fun m!1237531 () Bool)

(assert (=> b!1350297 m!1237531))

(declare-fun m!1237533 () Bool)

(assert (=> start!113832 m!1237533))

(declare-fun m!1237535 () Bool)

(assert (=> b!1350298 m!1237535))

(push 1)

(assert (not start!113832))

(assert (not b!1350301))

(assert (not b!1350298))

(assert (not b!1350297))

(assert (not b!1350300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144891 () Bool)

(assert (=> d!144891 (= (array_inv!33501 a!3742) (bvsge (size!45023 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!113832 d!144891))

(declare-fun d!144893 () Bool)

(declare-fun res!895774 () Bool)

(declare-fun e!768154 () Bool)

(assert (=> d!144893 (=> res!895774 e!768154)))

(assert (=> d!144893 (= res!895774 (is-Nil!31511 Nil!31511))))

(assert (=> d!144893 (= (noDuplicate!2080 Nil!31511) e!768154)))

(declare-fun b!1350316 () Bool)

(declare-fun e!768155 () Bool)

(assert (=> b!1350316 (= e!768154 e!768155)))

(declare-fun res!895775 () Bool)

(assert (=> b!1350316 (=> (not res!895775) (not e!768155))))

(assert (=> b!1350316 (= res!895775 (not (contains!9223 (t!46172 Nil!31511) (h!32719 Nil!31511))))))

(declare-fun b!1350317 () Bool)

(assert (=> b!1350317 (= e!768155 (noDuplicate!2080 (t!46172 Nil!31511)))))

(assert (= (and d!144893 (not res!895774)) b!1350316))

(assert (= (and b!1350316 res!895775) b!1350317))

(declare-fun m!1237543 () Bool)

(assert (=> b!1350316 m!1237543))

(declare-fun m!1237545 () Bool)

(assert (=> b!1350317 m!1237545))

(assert (=> b!1350297 d!144893))

(declare-fun d!144899 () Bool)

(declare-fun lt!596964 () Bool)

(declare-fun content!670 (List!31514) (Set (_ BitVec 64)))

(assert (=> d!144899 (= lt!596964 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!670 acc!759)))))

(declare-fun e!768175 () Bool)

(assert (=> d!144899 (= lt!596964 e!768175)))

(declare-fun res!895794 () Bool)

(assert (=> d!144899 (=> (not res!895794) (not e!768175))))

(assert (=> d!144899 (= res!895794 (is-Cons!31510 acc!759))))

(assert (=> d!144899 (= (contains!9223 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596964)))

(declare-fun b!1350336 () Bool)

(declare-fun e!768174 () Bool)

(assert (=> b!1350336 (= e!768175 e!768174)))

(declare-fun res!895795 () Bool)

(assert (=> b!1350336 (=> res!895795 e!768174)))

(assert (=> b!1350336 (= res!895795 (= (h!32719 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350337 () Bool)

(assert (=> b!1350337 (= e!768174 (contains!9223 (t!46172 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144899 res!895794) b!1350336))

(assert (= (and b!1350336 (not res!895795)) b!1350337))

(declare-fun m!1237569 () Bool)

(assert (=> d!144899 m!1237569))

(declare-fun m!1237571 () Bool)

(assert (=> d!144899 m!1237571))

(declare-fun m!1237573 () Bool)

(assert (=> b!1350337 m!1237573))

(assert (=> b!1350298 d!144899))

(declare-fun d!144913 () Bool)

(declare-fun lt!596965 () Bool)

(assert (=> d!144913 (= lt!596965 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!670 acc!759)))))

(declare-fun e!768177 () Bool)

(assert (=> d!144913 (= lt!596965 e!768177)))

(declare-fun res!895796 () Bool)

