; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114890 () Bool)

(assert start!114890)

(declare-fun b!1362054 () Bool)

(declare-fun res!906104 () Bool)

(declare-fun e!772633 () Bool)

(assert (=> b!1362054 (=> (not res!906104) (not e!772633))))

(declare-datatypes ((List!31788 0))(
  ( (Nil!31785) (Cons!31784 (h!32993 (_ BitVec 64)) (t!46473 List!31788)) )
))
(declare-fun lt!600366 () List!31788)

(declare-fun contains!9497 (List!31788 (_ BitVec 64)) Bool)

(assert (=> b!1362054 (= res!906104 (not (contains!9497 lt!600366 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362055 () Bool)

(declare-fun res!906109 () Bool)

(assert (=> b!1362055 (=> (not res!906109) (not e!772633))))

(declare-datatypes ((array!92625 0))(
  ( (array!92626 (arr!44747 (Array (_ BitVec 32) (_ BitVec 64))) (size!45297 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92625)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92625 (_ BitVec 32) List!31788) Bool)

(assert (=> b!1362055 (= res!906109 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600366))))

(declare-fun b!1362056 () Bool)

(assert (=> b!1362056 (= e!772633 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362056 (arrayNoDuplicates!0 (array!92626 (store (arr!44747 a!3742) i!1404 l!3587) (size!45297 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600366)))

(declare-datatypes ((Unit!44901 0))(
  ( (Unit!44902) )
))
(declare-fun lt!600365 () Unit!44901)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31788) Unit!44901)

(assert (=> b!1362056 (= lt!600365 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600366))))

(declare-fun b!1362057 () Bool)

(declare-fun res!906115 () Bool)

(declare-fun e!772635 () Bool)

(assert (=> b!1362057 (=> (not res!906115) (not e!772635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362057 (= res!906115 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362058 () Bool)

(declare-fun res!906114 () Bool)

(assert (=> b!1362058 (=> (not res!906114) (not e!772635))))

(declare-fun acc!759 () List!31788)

(assert (=> b!1362058 (= res!906114 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!906113 () Bool)

(assert (=> start!114890 (=> (not res!906113) (not e!772635))))

(assert (=> start!114890 (= res!906113 (and (bvslt (size!45297 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45297 a!3742))))))

(assert (=> start!114890 e!772635))

(assert (=> start!114890 true))

(declare-fun array_inv!33775 (array!92625) Bool)

(assert (=> start!114890 (array_inv!33775 a!3742)))

(declare-fun b!1362059 () Bool)

(declare-fun res!906108 () Bool)

(assert (=> b!1362059 (=> (not res!906108) (not e!772635))))

(assert (=> b!1362059 (= res!906108 (not (contains!9497 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362060 () Bool)

(declare-fun e!772634 () Unit!44901)

(declare-fun Unit!44903 () Unit!44901)

(assert (=> b!1362060 (= e!772634 Unit!44903)))

(declare-fun b!1362061 () Bool)

(declare-fun e!772632 () Bool)

(assert (=> b!1362061 (= e!772635 e!772632)))

(declare-fun res!906105 () Bool)

(assert (=> b!1362061 (=> (not res!906105) (not e!772632))))

(declare-fun lt!600368 () Bool)

(assert (=> b!1362061 (= res!906105 (and (not (= from!3120 i!1404)) lt!600368))))

(declare-fun lt!600369 () Unit!44901)

(assert (=> b!1362061 (= lt!600369 e!772634)))

(declare-fun c!127415 () Bool)

(assert (=> b!1362061 (= c!127415 lt!600368)))

(assert (=> b!1362061 (= lt!600368 (validKeyInArray!0 (select (arr!44747 a!3742) from!3120)))))

(declare-fun b!1362062 () Bool)

(assert (=> b!1362062 (= e!772632 e!772633)))

(declare-fun res!906111 () Bool)

(assert (=> b!1362062 (=> (not res!906111) (not e!772633))))

(assert (=> b!1362062 (= res!906111 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!902 (List!31788 (_ BitVec 64)) List!31788)

(assert (=> b!1362062 (= lt!600366 ($colon$colon!902 acc!759 (select (arr!44747 a!3742) from!3120)))))

(declare-fun b!1362063 () Bool)

(declare-fun res!906116 () Bool)

(assert (=> b!1362063 (=> (not res!906116) (not e!772633))))

(assert (=> b!1362063 (= res!906116 (not (contains!9497 lt!600366 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362064 () Bool)

(declare-fun res!906110 () Bool)

(assert (=> b!1362064 (=> (not res!906110) (not e!772635))))

(assert (=> b!1362064 (= res!906110 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31785))))

(declare-fun b!1362065 () Bool)

(declare-fun res!906112 () Bool)

(assert (=> b!1362065 (=> (not res!906112) (not e!772635))))

(assert (=> b!1362065 (= res!906112 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45297 a!3742))))))

(declare-fun b!1362066 () Bool)

(declare-fun res!906107 () Bool)

(assert (=> b!1362066 (=> (not res!906107) (not e!772635))))

(assert (=> b!1362066 (= res!906107 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45297 a!3742)))))

(declare-fun b!1362067 () Bool)

(declare-fun res!906106 () Bool)

(assert (=> b!1362067 (=> (not res!906106) (not e!772635))))

(assert (=> b!1362067 (= res!906106 (not (contains!9497 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362068 () Bool)

(declare-fun res!906117 () Bool)

(assert (=> b!1362068 (=> (not res!906117) (not e!772633))))

(declare-fun noDuplicate!2354 (List!31788) Bool)

(assert (=> b!1362068 (= res!906117 (noDuplicate!2354 lt!600366))))

(declare-fun b!1362069 () Bool)

(declare-fun lt!600370 () Unit!44901)

(assert (=> b!1362069 (= e!772634 lt!600370)))

(declare-fun lt!600367 () Unit!44901)

(declare-fun lemmaListSubSeqRefl!0 (List!31788) Unit!44901)

(assert (=> b!1362069 (= lt!600367 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!899 (List!31788 List!31788) Bool)

(assert (=> b!1362069 (subseq!899 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92625 List!31788 List!31788 (_ BitVec 32)) Unit!44901)

(assert (=> b!1362069 (= lt!600370 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!902 acc!759 (select (arr!44747 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362069 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362070 () Bool)

(declare-fun res!906118 () Bool)

(assert (=> b!1362070 (=> (not res!906118) (not e!772635))))

(assert (=> b!1362070 (= res!906118 (noDuplicate!2354 acc!759))))

(assert (= (and start!114890 res!906113) b!1362070))

(assert (= (and b!1362070 res!906118) b!1362067))

(assert (= (and b!1362067 res!906106) b!1362059))

(assert (= (and b!1362059 res!906108) b!1362064))

(assert (= (and b!1362064 res!906110) b!1362058))

(assert (= (and b!1362058 res!906114) b!1362065))

(assert (= (and b!1362065 res!906112) b!1362057))

(assert (= (and b!1362057 res!906115) b!1362066))

(assert (= (and b!1362066 res!906107) b!1362061))

(assert (= (and b!1362061 c!127415) b!1362069))

(assert (= (and b!1362061 (not c!127415)) b!1362060))

(assert (= (and b!1362061 res!906105) b!1362062))

(assert (= (and b!1362062 res!906111) b!1362068))

(assert (= (and b!1362068 res!906117) b!1362063))

(assert (= (and b!1362063 res!906116) b!1362054))

(assert (= (and b!1362054 res!906104) b!1362055))

(assert (= (and b!1362055 res!906109) b!1362056))

(declare-fun m!1247029 () Bool)

(assert (=> b!1362069 m!1247029))

(declare-fun m!1247031 () Bool)

(assert (=> b!1362069 m!1247031))

(declare-fun m!1247033 () Bool)

(assert (=> b!1362069 m!1247033))

(declare-fun m!1247035 () Bool)

(assert (=> b!1362069 m!1247035))

(declare-fun m!1247037 () Bool)

(assert (=> b!1362069 m!1247037))

(assert (=> b!1362069 m!1247031))

(assert (=> b!1362069 m!1247033))

(declare-fun m!1247039 () Bool)

(assert (=> b!1362069 m!1247039))

(declare-fun m!1247041 () Bool)

(assert (=> b!1362058 m!1247041))

(declare-fun m!1247043 () Bool)

(assert (=> b!1362067 m!1247043))

(declare-fun m!1247045 () Bool)

(assert (=> b!1362057 m!1247045))

(declare-fun m!1247047 () Bool)

(assert (=> b!1362055 m!1247047))

(declare-fun m!1247049 () Bool)

(assert (=> b!1362064 m!1247049))

(declare-fun m!1247051 () Bool)

(assert (=> b!1362068 m!1247051))

(declare-fun m!1247053 () Bool)

(assert (=> b!1362056 m!1247053))

(declare-fun m!1247055 () Bool)

(assert (=> b!1362056 m!1247055))

(declare-fun m!1247057 () Bool)

(assert (=> b!1362056 m!1247057))

(assert (=> b!1362062 m!1247031))

(assert (=> b!1362062 m!1247031))

(assert (=> b!1362062 m!1247033))

(declare-fun m!1247059 () Bool)

(assert (=> start!114890 m!1247059))

(declare-fun m!1247061 () Bool)

(assert (=> b!1362070 m!1247061))

(declare-fun m!1247063 () Bool)

(assert (=> b!1362063 m!1247063))

(declare-fun m!1247065 () Bool)

(assert (=> b!1362054 m!1247065))

(assert (=> b!1362061 m!1247031))

(assert (=> b!1362061 m!1247031))

(declare-fun m!1247067 () Bool)

(assert (=> b!1362061 m!1247067))

(declare-fun m!1247069 () Bool)

(assert (=> b!1362059 m!1247069))

(push 1)

