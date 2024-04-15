; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114806 () Bool)

(assert start!114806)

(declare-fun b!1361074 () Bool)

(declare-fun res!905300 () Bool)

(declare-fun e!772206 () Bool)

(assert (=> b!1361074 (=> (not res!905300) (not e!772206))))

(declare-datatypes ((List!31826 0))(
  ( (Nil!31823) (Cons!31822 (h!33031 (_ BitVec 64)) (t!46500 List!31826)) )
))
(declare-fun acc!759 () List!31826)

(declare-datatypes ((array!92541 0))(
  ( (array!92542 (arr!44707 (Array (_ BitVec 32) (_ BitVec 64))) (size!45259 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92541)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92541 (_ BitVec 32) List!31826) Bool)

(assert (=> b!1361074 (= res!905300 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361075 () Bool)

(declare-fun res!905295 () Bool)

(assert (=> b!1361075 (=> (not res!905295) (not e!772206))))

(assert (=> b!1361075 (= res!905295 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31823))))

(declare-fun res!905296 () Bool)

(assert (=> start!114806 (=> (not res!905296) (not e!772206))))

(assert (=> start!114806 (= res!905296 (and (bvslt (size!45259 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45259 a!3742))))))

(assert (=> start!114806 e!772206))

(assert (=> start!114806 true))

(declare-fun array_inv!33940 (array!92541) Bool)

(assert (=> start!114806 (array_inv!33940 a!3742)))

(declare-fun b!1361076 () Bool)

(declare-fun res!905293 () Bool)

(declare-fun e!772209 () Bool)

(assert (=> b!1361076 (=> (not res!905293) (not e!772209))))

(declare-fun lt!599895 () List!31826)

(declare-fun noDuplicate!2361 (List!31826) Bool)

(assert (=> b!1361076 (= res!905293 (noDuplicate!2361 lt!599895))))

(declare-fun b!1361077 () Bool)

(declare-fun e!772210 () Bool)

(assert (=> b!1361077 (= e!772206 e!772210)))

(declare-fun res!905297 () Bool)

(assert (=> b!1361077 (=> (not res!905297) (not e!772210))))

(declare-fun lt!599894 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361077 (= res!905297 (and (not (= from!3120 i!1404)) lt!599894))))

(declare-datatypes ((Unit!44697 0))(
  ( (Unit!44698) )
))
(declare-fun lt!599892 () Unit!44697)

(declare-fun e!772208 () Unit!44697)

(assert (=> b!1361077 (= lt!599892 e!772208)))

(declare-fun c!127334 () Bool)

(assert (=> b!1361077 (= c!127334 lt!599894)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361077 (= lt!599894 (validKeyInArray!0 (select (arr!44707 a!3742) from!3120)))))

(declare-fun b!1361078 () Bool)

(declare-fun res!905302 () Bool)

(assert (=> b!1361078 (=> (not res!905302) (not e!772206))))

(assert (=> b!1361078 (= res!905302 (noDuplicate!2361 acc!759))))

(declare-fun b!1361079 () Bool)

(declare-fun res!905301 () Bool)

(assert (=> b!1361079 (=> (not res!905301) (not e!772206))))

(declare-fun contains!9446 (List!31826 (_ BitVec 64)) Bool)

(assert (=> b!1361079 (= res!905301 (not (contains!9446 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361080 () Bool)

(declare-fun res!905291 () Bool)

(assert (=> b!1361080 (=> (not res!905291) (not e!772209))))

(assert (=> b!1361080 (= res!905291 (not (contains!9446 lt!599895 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361081 () Bool)

(declare-fun res!905299 () Bool)

(assert (=> b!1361081 (=> (not res!905299) (not e!772206))))

(assert (=> b!1361081 (= res!905299 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45259 a!3742))))))

(declare-fun b!1361082 () Bool)

(declare-fun res!905294 () Bool)

(assert (=> b!1361082 (=> (not res!905294) (not e!772206))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361082 (= res!905294 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361083 () Bool)

(assert (=> b!1361083 (= e!772210 e!772209)))

(declare-fun res!905303 () Bool)

(assert (=> b!1361083 (=> (not res!905303) (not e!772209))))

(assert (=> b!1361083 (= res!905303 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!889 (List!31826 (_ BitVec 64)) List!31826)

(assert (=> b!1361083 (= lt!599895 ($colon$colon!889 acc!759 (select (arr!44707 a!3742) from!3120)))))

(declare-fun b!1361084 () Bool)

(declare-fun res!905292 () Bool)

(assert (=> b!1361084 (=> (not res!905292) (not e!772206))))

(assert (=> b!1361084 (= res!905292 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45259 a!3742)))))

(declare-fun b!1361085 () Bool)

(declare-fun res!905298 () Bool)

(assert (=> b!1361085 (=> (not res!905298) (not e!772206))))

(assert (=> b!1361085 (= res!905298 (not (contains!9446 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361086 () Bool)

(declare-fun lt!599896 () Unit!44697)

(assert (=> b!1361086 (= e!772208 lt!599896)))

(declare-fun lt!599891 () Unit!44697)

(declare-fun lemmaListSubSeqRefl!0 (List!31826) Unit!44697)

(assert (=> b!1361086 (= lt!599891 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!884 (List!31826 List!31826) Bool)

(assert (=> b!1361086 (subseq!884 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92541 List!31826 List!31826 (_ BitVec 32)) Unit!44697)

(assert (=> b!1361086 (= lt!599896 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!889 acc!759 (select (arr!44707 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361086 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361087 () Bool)

(assert (=> b!1361087 (= e!772209 false)))

(declare-fun lt!599893 () Bool)

(assert (=> b!1361087 (= lt!599893 (contains!9446 lt!599895 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361088 () Bool)

(declare-fun Unit!44699 () Unit!44697)

(assert (=> b!1361088 (= e!772208 Unit!44699)))

(assert (= (and start!114806 res!905296) b!1361078))

(assert (= (and b!1361078 res!905302) b!1361085))

(assert (= (and b!1361085 res!905298) b!1361079))

(assert (= (and b!1361079 res!905301) b!1361075))

(assert (= (and b!1361075 res!905295) b!1361074))

(assert (= (and b!1361074 res!905300) b!1361081))

(assert (= (and b!1361081 res!905299) b!1361082))

(assert (= (and b!1361082 res!905294) b!1361084))

(assert (= (and b!1361084 res!905292) b!1361077))

(assert (= (and b!1361077 c!127334) b!1361086))

(assert (= (and b!1361077 (not c!127334)) b!1361088))

(assert (= (and b!1361077 res!905297) b!1361083))

(assert (= (and b!1361083 res!905303) b!1361076))

(assert (= (and b!1361076 res!905293) b!1361080))

(assert (= (and b!1361080 res!905291) b!1361087))

(declare-fun m!1245799 () Bool)

(assert (=> b!1361083 m!1245799))

(assert (=> b!1361083 m!1245799))

(declare-fun m!1245801 () Bool)

(assert (=> b!1361083 m!1245801))

(declare-fun m!1245803 () Bool)

(assert (=> b!1361078 m!1245803))

(assert (=> b!1361077 m!1245799))

(assert (=> b!1361077 m!1245799))

(declare-fun m!1245805 () Bool)

(assert (=> b!1361077 m!1245805))

(declare-fun m!1245807 () Bool)

(assert (=> b!1361075 m!1245807))

(declare-fun m!1245809 () Bool)

(assert (=> b!1361082 m!1245809))

(declare-fun m!1245811 () Bool)

(assert (=> b!1361086 m!1245811))

(assert (=> b!1361086 m!1245799))

(assert (=> b!1361086 m!1245801))

(declare-fun m!1245813 () Bool)

(assert (=> b!1361086 m!1245813))

(declare-fun m!1245815 () Bool)

(assert (=> b!1361086 m!1245815))

(assert (=> b!1361086 m!1245799))

(assert (=> b!1361086 m!1245801))

(declare-fun m!1245817 () Bool)

(assert (=> b!1361086 m!1245817))

(declare-fun m!1245819 () Bool)

(assert (=> b!1361087 m!1245819))

(declare-fun m!1245821 () Bool)

(assert (=> b!1361080 m!1245821))

(declare-fun m!1245823 () Bool)

(assert (=> b!1361079 m!1245823))

(declare-fun m!1245825 () Bool)

(assert (=> start!114806 m!1245825))

(declare-fun m!1245827 () Bool)

(assert (=> b!1361076 m!1245827))

(declare-fun m!1245829 () Bool)

(assert (=> b!1361085 m!1245829))

(declare-fun m!1245831 () Bool)

(assert (=> b!1361074 m!1245831))

(check-sat (not b!1361078) (not b!1361077) (not b!1361087) (not b!1361086) (not b!1361074) (not b!1361085) (not b!1361082) (not start!114806) (not b!1361079) (not b!1361076) (not b!1361080) (not b!1361075) (not b!1361083))
(check-sat)
