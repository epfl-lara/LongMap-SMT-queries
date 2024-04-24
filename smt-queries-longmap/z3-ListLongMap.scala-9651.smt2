; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114268 () Bool)

(assert start!114268)

(declare-fun b!1354909 () Bool)

(declare-fun e!770019 () Bool)

(declare-fun e!770022 () Bool)

(assert (=> b!1354909 (= e!770019 e!770022)))

(declare-fun res!899307 () Bool)

(assert (=> b!1354909 (=> (not res!899307) (not e!770022))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354909 (= res!899307 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31642 0))(
  ( (Nil!31639) (Cons!31638 (h!32856 (_ BitVec 64)) (t!46292 List!31642)) )
))
(declare-fun lt!598421 () List!31642)

(declare-fun acc!759 () List!31642)

(declare-datatypes ((array!92341 0))(
  ( (array!92342 (arr!44614 (Array (_ BitVec 32) (_ BitVec 64))) (size!45165 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92341)

(declare-fun $colon$colon!745 (List!31642 (_ BitVec 64)) List!31642)

(assert (=> b!1354909 (= lt!598421 ($colon$colon!745 acc!759 (select (arr!44614 a!3742) from!3120)))))

(declare-fun b!1354910 () Bool)

(declare-fun e!770021 () Bool)

(assert (=> b!1354910 (= e!770021 e!770019)))

(declare-fun res!899302 () Bool)

(assert (=> b!1354910 (=> (not res!899302) (not e!770019))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598422 () Bool)

(assert (=> b!1354910 (= res!899302 (and (not (= from!3120 i!1404)) lt!598422))))

(declare-datatypes ((Unit!44363 0))(
  ( (Unit!44364) )
))
(declare-fun lt!598419 () Unit!44363)

(declare-fun e!770023 () Unit!44363)

(assert (=> b!1354910 (= lt!598419 e!770023)))

(declare-fun c!127255 () Bool)

(assert (=> b!1354910 (= c!127255 lt!598422)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354910 (= lt!598422 (validKeyInArray!0 (select (arr!44614 a!3742) from!3120)))))

(declare-fun b!1354911 () Bool)

(declare-fun res!899299 () Bool)

(assert (=> b!1354911 (=> (not res!899299) (not e!770022))))

(declare-fun noDuplicate!2185 (List!31642) Bool)

(assert (=> b!1354911 (= res!899299 (noDuplicate!2185 lt!598421))))

(declare-fun b!1354912 () Bool)

(declare-fun res!899296 () Bool)

(assert (=> b!1354912 (=> (not res!899296) (not e!770021))))

(declare-fun contains!9354 (List!31642 (_ BitVec 64)) Bool)

(assert (=> b!1354912 (= res!899296 (not (contains!9354 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354913 () Bool)

(declare-fun Unit!44365 () Unit!44363)

(assert (=> b!1354913 (= e!770023 Unit!44365)))

(declare-fun b!1354914 () Bool)

(declare-fun res!899298 () Bool)

(assert (=> b!1354914 (=> (not res!899298) (not e!770022))))

(assert (=> b!1354914 (= res!899298 (not (contains!9354 lt!598421 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354915 () Bool)

(declare-fun res!899305 () Bool)

(assert (=> b!1354915 (=> (not res!899305) (not e!770021))))

(declare-fun arrayNoDuplicates!0 (array!92341 (_ BitVec 32) List!31642) Bool)

(assert (=> b!1354915 (= res!899305 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31639))))

(declare-fun b!1354916 () Bool)

(declare-fun res!899301 () Bool)

(assert (=> b!1354916 (=> (not res!899301) (not e!770021))))

(assert (=> b!1354916 (= res!899301 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45165 a!3742)))))

(declare-fun b!1354917 () Bool)

(declare-fun res!899304 () Bool)

(assert (=> b!1354917 (=> (not res!899304) (not e!770021))))

(assert (=> b!1354917 (= res!899304 (noDuplicate!2185 acc!759))))

(declare-fun b!1354918 () Bool)

(declare-fun res!899297 () Bool)

(assert (=> b!1354918 (=> (not res!899297) (not e!770022))))

(assert (=> b!1354918 (= res!899297 (not (contains!9354 lt!598421 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354919 () Bool)

(assert (=> b!1354919 (= e!770022 false)))

(declare-fun lt!598420 () Bool)

(assert (=> b!1354919 (= lt!598420 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598421))))

(declare-fun res!899300 () Bool)

(assert (=> start!114268 (=> (not res!899300) (not e!770021))))

(assert (=> start!114268 (= res!899300 (and (bvslt (size!45165 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45165 a!3742))))))

(assert (=> start!114268 e!770021))

(assert (=> start!114268 true))

(declare-fun array_inv!33895 (array!92341) Bool)

(assert (=> start!114268 (array_inv!33895 a!3742)))

(declare-fun b!1354920 () Bool)

(declare-fun res!899303 () Bool)

(assert (=> b!1354920 (=> (not res!899303) (not e!770021))))

(assert (=> b!1354920 (= res!899303 (not (contains!9354 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354921 () Bool)

(declare-fun lt!598417 () Unit!44363)

(assert (=> b!1354921 (= e!770023 lt!598417)))

(declare-fun lt!598418 () Unit!44363)

(declare-fun lemmaListSubSeqRefl!0 (List!31642) Unit!44363)

(assert (=> b!1354921 (= lt!598418 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!731 (List!31642 List!31642) Bool)

(assert (=> b!1354921 (subseq!731 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92341 List!31642 List!31642 (_ BitVec 32)) Unit!44363)

(assert (=> b!1354921 (= lt!598417 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!745 acc!759 (select (arr!44614 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354921 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354922 () Bool)

(declare-fun res!899294 () Bool)

(assert (=> b!1354922 (=> (not res!899294) (not e!770021))))

(assert (=> b!1354922 (= res!899294 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354923 () Bool)

(declare-fun res!899295 () Bool)

(assert (=> b!1354923 (=> (not res!899295) (not e!770021))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354923 (= res!899295 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354924 () Bool)

(declare-fun res!899306 () Bool)

(assert (=> b!1354924 (=> (not res!899306) (not e!770021))))

(assert (=> b!1354924 (= res!899306 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45165 a!3742))))))

(assert (= (and start!114268 res!899300) b!1354917))

(assert (= (and b!1354917 res!899304) b!1354920))

(assert (= (and b!1354920 res!899303) b!1354912))

(assert (= (and b!1354912 res!899296) b!1354915))

(assert (= (and b!1354915 res!899305) b!1354922))

(assert (= (and b!1354922 res!899294) b!1354924))

(assert (= (and b!1354924 res!899306) b!1354923))

(assert (= (and b!1354923 res!899295) b!1354916))

(assert (= (and b!1354916 res!899301) b!1354910))

(assert (= (and b!1354910 c!127255) b!1354921))

(assert (= (and b!1354910 (not c!127255)) b!1354913))

(assert (= (and b!1354910 res!899302) b!1354909))

(assert (= (and b!1354909 res!899307) b!1354911))

(assert (= (and b!1354911 res!899299) b!1354914))

(assert (= (and b!1354914 res!899298) b!1354918))

(assert (= (and b!1354918 res!899297) b!1354919))

(declare-fun m!1241785 () Bool)

(assert (=> b!1354911 m!1241785))

(declare-fun m!1241787 () Bool)

(assert (=> b!1354917 m!1241787))

(declare-fun m!1241789 () Bool)

(assert (=> b!1354910 m!1241789))

(assert (=> b!1354910 m!1241789))

(declare-fun m!1241791 () Bool)

(assert (=> b!1354910 m!1241791))

(declare-fun m!1241793 () Bool)

(assert (=> b!1354922 m!1241793))

(declare-fun m!1241795 () Bool)

(assert (=> start!114268 m!1241795))

(declare-fun m!1241797 () Bool)

(assert (=> b!1354921 m!1241797))

(assert (=> b!1354921 m!1241789))

(declare-fun m!1241799 () Bool)

(assert (=> b!1354921 m!1241799))

(declare-fun m!1241801 () Bool)

(assert (=> b!1354921 m!1241801))

(declare-fun m!1241803 () Bool)

(assert (=> b!1354921 m!1241803))

(assert (=> b!1354921 m!1241789))

(assert (=> b!1354921 m!1241799))

(declare-fun m!1241805 () Bool)

(assert (=> b!1354921 m!1241805))

(declare-fun m!1241807 () Bool)

(assert (=> b!1354914 m!1241807))

(declare-fun m!1241809 () Bool)

(assert (=> b!1354918 m!1241809))

(declare-fun m!1241811 () Bool)

(assert (=> b!1354919 m!1241811))

(assert (=> b!1354909 m!1241789))

(assert (=> b!1354909 m!1241789))

(assert (=> b!1354909 m!1241799))

(declare-fun m!1241813 () Bool)

(assert (=> b!1354920 m!1241813))

(declare-fun m!1241815 () Bool)

(assert (=> b!1354915 m!1241815))

(declare-fun m!1241817 () Bool)

(assert (=> b!1354923 m!1241817))

(declare-fun m!1241819 () Bool)

(assert (=> b!1354912 m!1241819))

(check-sat (not b!1354918) (not b!1354910) (not b!1354914) (not b!1354917) (not b!1354912) (not b!1354909) (not b!1354923) (not b!1354915) (not b!1354922) (not b!1354911) (not b!1354920) (not b!1354921) (not b!1354919) (not start!114268))
(check-sat)
