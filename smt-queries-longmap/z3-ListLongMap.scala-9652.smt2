; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114274 () Bool)

(assert start!114274)

(declare-fun b!1355053 () Bool)

(declare-fun res!899431 () Bool)

(declare-fun e!770066 () Bool)

(assert (=> b!1355053 (=> (not res!899431) (not e!770066))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355053 (= res!899431 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355054 () Bool)

(declare-fun e!770068 () Bool)

(assert (=> b!1355054 (= e!770066 e!770068)))

(declare-fun res!899433 () Bool)

(assert (=> b!1355054 (=> (not res!899433) (not e!770068))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598476 () Bool)

(assert (=> b!1355054 (= res!899433 (and (not (= from!3120 i!1404)) lt!598476))))

(declare-datatypes ((Unit!44372 0))(
  ( (Unit!44373) )
))
(declare-fun lt!598474 () Unit!44372)

(declare-fun e!770067 () Unit!44372)

(assert (=> b!1355054 (= lt!598474 e!770067)))

(declare-fun c!127264 () Bool)

(assert (=> b!1355054 (= c!127264 lt!598476)))

(declare-datatypes ((array!92347 0))(
  ( (array!92348 (arr!44617 (Array (_ BitVec 32) (_ BitVec 64))) (size!45168 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92347)

(assert (=> b!1355054 (= lt!598476 (validKeyInArray!0 (select (arr!44617 a!3742) from!3120)))))

(declare-fun b!1355055 () Bool)

(declare-fun res!899426 () Bool)

(assert (=> b!1355055 (=> (not res!899426) (not e!770066))))

(declare-datatypes ((List!31645 0))(
  ( (Nil!31642) (Cons!31641 (h!32859 (_ BitVec 64)) (t!46295 List!31645)) )
))
(declare-fun acc!759 () List!31645)

(declare-fun contains!9357 (List!31645 (_ BitVec 64)) Bool)

(assert (=> b!1355055 (= res!899426 (not (contains!9357 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355056 () Bool)

(declare-fun res!899427 () Bool)

(assert (=> b!1355056 (=> (not res!899427) (not e!770066))))

(declare-fun arrayNoDuplicates!0 (array!92347 (_ BitVec 32) List!31645) Bool)

(assert (=> b!1355056 (= res!899427 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31642))))

(declare-fun b!1355057 () Bool)

(declare-fun res!899425 () Bool)

(assert (=> b!1355057 (=> (not res!899425) (not e!770066))))

(assert (=> b!1355057 (= res!899425 (not (contains!9357 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355058 () Bool)

(declare-fun e!770064 () Bool)

(assert (=> b!1355058 (= e!770064 false)))

(declare-fun lt!598475 () List!31645)

(declare-fun lt!598472 () Bool)

(assert (=> b!1355058 (= lt!598472 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598475))))

(declare-fun b!1355059 () Bool)

(declare-fun res!899423 () Bool)

(assert (=> b!1355059 (=> (not res!899423) (not e!770064))))

(assert (=> b!1355059 (= res!899423 (not (contains!9357 lt!598475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355060 () Bool)

(declare-fun res!899430 () Bool)

(assert (=> b!1355060 (=> (not res!899430) (not e!770066))))

(assert (=> b!1355060 (= res!899430 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45168 a!3742))))))

(declare-fun b!1355061 () Bool)

(assert (=> b!1355061 (= e!770068 e!770064)))

(declare-fun res!899428 () Bool)

(assert (=> b!1355061 (=> (not res!899428) (not e!770064))))

(assert (=> b!1355061 (= res!899428 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!748 (List!31645 (_ BitVec 64)) List!31645)

(assert (=> b!1355061 (= lt!598475 ($colon$colon!748 acc!759 (select (arr!44617 a!3742) from!3120)))))

(declare-fun res!899421 () Bool)

(assert (=> start!114274 (=> (not res!899421) (not e!770066))))

(assert (=> start!114274 (= res!899421 (and (bvslt (size!45168 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45168 a!3742))))))

(assert (=> start!114274 e!770066))

(assert (=> start!114274 true))

(declare-fun array_inv!33898 (array!92347) Bool)

(assert (=> start!114274 (array_inv!33898 a!3742)))

(declare-fun b!1355062 () Bool)

(declare-fun res!899424 () Bool)

(assert (=> b!1355062 (=> (not res!899424) (not e!770064))))

(assert (=> b!1355062 (= res!899424 (not (contains!9357 lt!598475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355063 () Bool)

(declare-fun res!899429 () Bool)

(assert (=> b!1355063 (=> (not res!899429) (not e!770066))))

(assert (=> b!1355063 (= res!899429 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45168 a!3742)))))

(declare-fun b!1355064 () Bool)

(declare-fun res!899420 () Bool)

(assert (=> b!1355064 (=> (not res!899420) (not e!770066))))

(declare-fun noDuplicate!2188 (List!31645) Bool)

(assert (=> b!1355064 (= res!899420 (noDuplicate!2188 acc!759))))

(declare-fun b!1355065 () Bool)

(declare-fun res!899422 () Bool)

(assert (=> b!1355065 (=> (not res!899422) (not e!770066))))

(assert (=> b!1355065 (= res!899422 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355066 () Bool)

(declare-fun lt!598473 () Unit!44372)

(assert (=> b!1355066 (= e!770067 lt!598473)))

(declare-fun lt!598471 () Unit!44372)

(declare-fun lemmaListSubSeqRefl!0 (List!31645) Unit!44372)

(assert (=> b!1355066 (= lt!598471 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!734 (List!31645 List!31645) Bool)

(assert (=> b!1355066 (subseq!734 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92347 List!31645 List!31645 (_ BitVec 32)) Unit!44372)

(assert (=> b!1355066 (= lt!598473 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!748 acc!759 (select (arr!44617 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355066 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355067 () Bool)

(declare-fun Unit!44374 () Unit!44372)

(assert (=> b!1355067 (= e!770067 Unit!44374)))

(declare-fun b!1355068 () Bool)

(declare-fun res!899432 () Bool)

(assert (=> b!1355068 (=> (not res!899432) (not e!770064))))

(assert (=> b!1355068 (= res!899432 (noDuplicate!2188 lt!598475))))

(assert (= (and start!114274 res!899421) b!1355064))

(assert (= (and b!1355064 res!899420) b!1355057))

(assert (= (and b!1355057 res!899425) b!1355055))

(assert (= (and b!1355055 res!899426) b!1355056))

(assert (= (and b!1355056 res!899427) b!1355065))

(assert (= (and b!1355065 res!899422) b!1355060))

(assert (= (and b!1355060 res!899430) b!1355053))

(assert (= (and b!1355053 res!899431) b!1355063))

(assert (= (and b!1355063 res!899429) b!1355054))

(assert (= (and b!1355054 c!127264) b!1355066))

(assert (= (and b!1355054 (not c!127264)) b!1355067))

(assert (= (and b!1355054 res!899433) b!1355061))

(assert (= (and b!1355061 res!899428) b!1355068))

(assert (= (and b!1355068 res!899432) b!1355062))

(assert (= (and b!1355062 res!899424) b!1355059))

(assert (= (and b!1355059 res!899423) b!1355058))

(declare-fun m!1241893 () Bool)

(assert (=> b!1355066 m!1241893))

(declare-fun m!1241895 () Bool)

(assert (=> b!1355066 m!1241895))

(declare-fun m!1241897 () Bool)

(assert (=> b!1355066 m!1241897))

(declare-fun m!1241899 () Bool)

(assert (=> b!1355066 m!1241899))

(declare-fun m!1241901 () Bool)

(assert (=> b!1355066 m!1241901))

(assert (=> b!1355066 m!1241895))

(assert (=> b!1355066 m!1241897))

(declare-fun m!1241903 () Bool)

(assert (=> b!1355066 m!1241903))

(declare-fun m!1241905 () Bool)

(assert (=> b!1355065 m!1241905))

(declare-fun m!1241907 () Bool)

(assert (=> b!1355064 m!1241907))

(declare-fun m!1241909 () Bool)

(assert (=> b!1355053 m!1241909))

(declare-fun m!1241911 () Bool)

(assert (=> b!1355058 m!1241911))

(assert (=> b!1355054 m!1241895))

(assert (=> b!1355054 m!1241895))

(declare-fun m!1241913 () Bool)

(assert (=> b!1355054 m!1241913))

(declare-fun m!1241915 () Bool)

(assert (=> b!1355059 m!1241915))

(assert (=> b!1355061 m!1241895))

(assert (=> b!1355061 m!1241895))

(assert (=> b!1355061 m!1241897))

(declare-fun m!1241917 () Bool)

(assert (=> b!1355068 m!1241917))

(declare-fun m!1241919 () Bool)

(assert (=> start!114274 m!1241919))

(declare-fun m!1241921 () Bool)

(assert (=> b!1355055 m!1241921))

(declare-fun m!1241923 () Bool)

(assert (=> b!1355056 m!1241923))

(declare-fun m!1241925 () Bool)

(assert (=> b!1355057 m!1241925))

(declare-fun m!1241927 () Bool)

(assert (=> b!1355062 m!1241927))

(check-sat (not b!1355061) (not b!1355068) (not b!1355055) (not b!1355057) (not b!1355058) (not b!1355062) (not start!114274) (not b!1355054) (not b!1355059) (not b!1355066) (not b!1355064) (not b!1355056) (not b!1355053) (not b!1355065))
(check-sat)
