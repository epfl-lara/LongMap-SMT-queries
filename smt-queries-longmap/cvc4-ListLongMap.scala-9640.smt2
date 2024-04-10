; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113982 () Bool)

(assert start!113982)

(declare-fun b!1352342 () Bool)

(declare-fun e!768778 () Bool)

(declare-fun e!768777 () Bool)

(assert (=> b!1352342 (= e!768778 e!768777)))

(declare-fun res!897702 () Bool)

(assert (=> b!1352342 (=> (not res!897702) (not e!768777))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352342 (= res!897702 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44331 0))(
  ( (Unit!44332) )
))
(declare-fun lt!597511 () Unit!44331)

(declare-fun e!768775 () Unit!44331)

(assert (=> b!1352342 (= lt!597511 e!768775)))

(declare-fun c!126764 () Bool)

(declare-datatypes ((array!92164 0))(
  ( (array!92165 (arr!44530 (Array (_ BitVec 32) (_ BitVec 64))) (size!45080 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92164)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352342 (= c!126764 (validKeyInArray!0 (select (arr!44530 a!3742) from!3120)))))

(declare-fun b!1352343 () Bool)

(declare-fun res!897699 () Bool)

(assert (=> b!1352343 (=> (not res!897699) (not e!768778))))

(declare-datatypes ((List!31571 0))(
  ( (Nil!31568) (Cons!31567 (h!32776 (_ BitVec 64)) (t!46229 List!31571)) )
))
(declare-fun acc!759 () List!31571)

(declare-fun contains!9280 (List!31571 (_ BitVec 64)) Bool)

(assert (=> b!1352343 (= res!897699 (not (contains!9280 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!897703 () Bool)

(assert (=> start!113982 (=> (not res!897703) (not e!768778))))

(assert (=> start!113982 (= res!897703 (and (bvslt (size!45080 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45080 a!3742))))))

(assert (=> start!113982 e!768778))

(assert (=> start!113982 true))

(declare-fun array_inv!33558 (array!92164) Bool)

(assert (=> start!113982 (array_inv!33558 a!3742)))

(declare-fun b!1352344 () Bool)

(declare-fun res!897694 () Bool)

(assert (=> b!1352344 (=> (not res!897694) (not e!768778))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352344 (= res!897694 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352345 () Bool)

(declare-fun res!897700 () Bool)

(assert (=> b!1352345 (=> (not res!897700) (not e!768778))))

(assert (=> b!1352345 (= res!897700 (not (contains!9280 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352346 () Bool)

(declare-fun res!897698 () Bool)

(assert (=> b!1352346 (=> (not res!897698) (not e!768778))))

(declare-fun noDuplicate!2137 (List!31571) Bool)

(assert (=> b!1352346 (= res!897698 (noDuplicate!2137 acc!759))))

(declare-fun b!1352347 () Bool)

(declare-fun res!897697 () Bool)

(assert (=> b!1352347 (=> (not res!897697) (not e!768778))))

(assert (=> b!1352347 (= res!897697 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45080 a!3742)))))

(declare-fun b!1352348 () Bool)

(declare-fun res!897695 () Bool)

(assert (=> b!1352348 (=> (not res!897695) (not e!768778))))

(declare-fun arrayNoDuplicates!0 (array!92164 (_ BitVec 32) List!31571) Bool)

(assert (=> b!1352348 (= res!897695 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352349 () Bool)

(declare-fun res!897701 () Bool)

(assert (=> b!1352349 (=> (not res!897701) (not e!768778))))

(assert (=> b!1352349 (= res!897701 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45080 a!3742))))))

(declare-fun b!1352350 () Bool)

(assert (=> b!1352350 (= e!768777 false)))

(declare-fun lt!597513 () Bool)

(assert (=> b!1352350 (= lt!597513 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352351 () Bool)

(declare-fun Unit!44333 () Unit!44331)

(assert (=> b!1352351 (= e!768775 Unit!44333)))

(declare-fun b!1352352 () Bool)

(declare-fun res!897696 () Bool)

(assert (=> b!1352352 (=> (not res!897696) (not e!768778))))

(assert (=> b!1352352 (= res!897696 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31568))))

(declare-fun b!1352353 () Bool)

(declare-fun lt!597514 () Unit!44331)

(assert (=> b!1352353 (= e!768775 lt!597514)))

(declare-fun lt!597512 () Unit!44331)

(declare-fun lemmaListSubSeqRefl!0 (List!31571) Unit!44331)

(assert (=> b!1352353 (= lt!597512 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!700 (List!31571 List!31571) Bool)

(assert (=> b!1352353 (subseq!700 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92164 List!31571 List!31571 (_ BitVec 32)) Unit!44331)

(declare-fun $colon$colon!715 (List!31571 (_ BitVec 64)) List!31571)

(assert (=> b!1352353 (= lt!597514 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!715 acc!759 (select (arr!44530 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352353 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!113982 res!897703) b!1352346))

(assert (= (and b!1352346 res!897698) b!1352343))

(assert (= (and b!1352343 res!897699) b!1352345))

(assert (= (and b!1352345 res!897700) b!1352352))

(assert (= (and b!1352352 res!897696) b!1352348))

(assert (= (and b!1352348 res!897695) b!1352349))

(assert (= (and b!1352349 res!897701) b!1352344))

(assert (= (and b!1352344 res!897694) b!1352347))

(assert (= (and b!1352347 res!897697) b!1352342))

(assert (= (and b!1352342 c!126764) b!1352353))

(assert (= (and b!1352342 (not c!126764)) b!1352351))

(assert (= (and b!1352342 res!897702) b!1352350))

(declare-fun m!1239177 () Bool)

(assert (=> b!1352346 m!1239177))

(declare-fun m!1239179 () Bool)

(assert (=> b!1352343 m!1239179))

(declare-fun m!1239181 () Bool)

(assert (=> b!1352352 m!1239181))

(declare-fun m!1239183 () Bool)

(assert (=> b!1352342 m!1239183))

(assert (=> b!1352342 m!1239183))

(declare-fun m!1239185 () Bool)

(assert (=> b!1352342 m!1239185))

(declare-fun m!1239187 () Bool)

(assert (=> b!1352348 m!1239187))

(declare-fun m!1239189 () Bool)

(assert (=> b!1352353 m!1239189))

(assert (=> b!1352353 m!1239183))

(declare-fun m!1239191 () Bool)

(assert (=> b!1352353 m!1239191))

(declare-fun m!1239193 () Bool)

(assert (=> b!1352353 m!1239193))

(declare-fun m!1239195 () Bool)

(assert (=> b!1352353 m!1239195))

(assert (=> b!1352353 m!1239183))

(assert (=> b!1352353 m!1239191))

(declare-fun m!1239197 () Bool)

(assert (=> b!1352353 m!1239197))

(declare-fun m!1239199 () Bool)

(assert (=> b!1352344 m!1239199))

(declare-fun m!1239201 () Bool)

(assert (=> b!1352345 m!1239201))

(assert (=> b!1352350 m!1239195))

(declare-fun m!1239203 () Bool)

(assert (=> start!113982 m!1239203))

(push 1)

(assert (not b!1352344))

(assert (not b!1352345))

