; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114992 () Bool)

(assert start!114992)

(declare-fun b!1363068 () Bool)

(declare-fun res!906952 () Bool)

(declare-fun e!773055 () Bool)

(assert (=> b!1363068 (=> (not res!906952) (not e!773055))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363068 (= res!906952 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363069 () Bool)

(declare-fun res!906944 () Bool)

(assert (=> b!1363069 (=> (not res!906944) (not e!773055))))

(declare-datatypes ((array!92670 0))(
  ( (array!92671 (arr!44768 (Array (_ BitVec 32) (_ BitVec 64))) (size!45318 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92670)

(declare-datatypes ((List!31809 0))(
  ( (Nil!31806) (Cons!31805 (h!33014 (_ BitVec 64)) (t!46497 List!31809)) )
))
(declare-fun arrayNoDuplicates!0 (array!92670 (_ BitVec 32) List!31809) Bool)

(assert (=> b!1363069 (= res!906944 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31806))))

(declare-fun b!1363070 () Bool)

(assert (=> b!1363070 (= e!773055 false)))

(declare-datatypes ((Unit!44964 0))(
  ( (Unit!44965) )
))
(declare-fun lt!600666 () Unit!44964)

(declare-fun e!773054 () Unit!44964)

(assert (=> b!1363070 (= lt!600666 e!773054)))

(declare-fun c!127502 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1363070 (= c!127502 (validKeyInArray!0 (select (arr!44768 a!3742) from!3120)))))

(declare-fun b!1363071 () Bool)

(declare-fun Unit!44966 () Unit!44964)

(assert (=> b!1363071 (= e!773054 Unit!44966)))

(declare-fun b!1363072 () Bool)

(declare-fun res!906950 () Bool)

(assert (=> b!1363072 (=> (not res!906950) (not e!773055))))

(declare-fun acc!759 () List!31809)

(declare-fun contains!9518 (List!31809 (_ BitVec 64)) Bool)

(assert (=> b!1363072 (= res!906950 (not (contains!9518 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363073 () Bool)

(declare-fun res!906948 () Bool)

(assert (=> b!1363073 (=> (not res!906948) (not e!773055))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363073 (= res!906948 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45318 a!3742))))))

(declare-fun b!1363075 () Bool)

(declare-fun lt!600665 () Unit!44964)

(assert (=> b!1363075 (= e!773054 lt!600665)))

(declare-fun lt!600667 () Unit!44964)

(declare-fun lemmaListSubSeqRefl!0 (List!31809) Unit!44964)

(assert (=> b!1363075 (= lt!600667 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!920 (List!31809 List!31809) Bool)

(assert (=> b!1363075 (subseq!920 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92670 List!31809 List!31809 (_ BitVec 32)) Unit!44964)

(declare-fun $colon$colon!923 (List!31809 (_ BitVec 64)) List!31809)

(assert (=> b!1363075 (= lt!600665 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!923 acc!759 (select (arr!44768 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363075 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363076 () Bool)

(declare-fun res!906946 () Bool)

(assert (=> b!1363076 (=> (not res!906946) (not e!773055))))

(assert (=> b!1363076 (= res!906946 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363077 () Bool)

(declare-fun res!906951 () Bool)

(assert (=> b!1363077 (=> (not res!906951) (not e!773055))))

(assert (=> b!1363077 (= res!906951 (not (contains!9518 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363078 () Bool)

(declare-fun res!906945 () Bool)

(assert (=> b!1363078 (=> (not res!906945) (not e!773055))))

(declare-fun noDuplicate!2375 (List!31809) Bool)

(assert (=> b!1363078 (= res!906945 (noDuplicate!2375 acc!759))))

(declare-fun res!906947 () Bool)

(assert (=> start!114992 (=> (not res!906947) (not e!773055))))

(assert (=> start!114992 (= res!906947 (and (bvslt (size!45318 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45318 a!3742))))))

(assert (=> start!114992 e!773055))

(assert (=> start!114992 true))

(declare-fun array_inv!33796 (array!92670) Bool)

(assert (=> start!114992 (array_inv!33796 a!3742)))

(declare-fun b!1363074 () Bool)

(declare-fun res!906949 () Bool)

(assert (=> b!1363074 (=> (not res!906949) (not e!773055))))

(assert (=> b!1363074 (= res!906949 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45318 a!3742)))))

(assert (= (and start!114992 res!906947) b!1363078))

(assert (= (and b!1363078 res!906945) b!1363077))

(assert (= (and b!1363077 res!906951) b!1363072))

(assert (= (and b!1363072 res!906950) b!1363069))

(assert (= (and b!1363069 res!906944) b!1363076))

(assert (= (and b!1363076 res!906946) b!1363073))

(assert (= (and b!1363073 res!906948) b!1363068))

(assert (= (and b!1363068 res!906952) b!1363074))

(assert (= (and b!1363074 res!906949) b!1363070))

(assert (= (and b!1363070 c!127502) b!1363075))

(assert (= (and b!1363070 (not c!127502)) b!1363071))

(declare-fun m!1247947 () Bool)

(assert (=> b!1363075 m!1247947))

(declare-fun m!1247949 () Bool)

(assert (=> b!1363075 m!1247949))

(declare-fun m!1247951 () Bool)

(assert (=> b!1363075 m!1247951))

(declare-fun m!1247953 () Bool)

(assert (=> b!1363075 m!1247953))

(declare-fun m!1247955 () Bool)

(assert (=> b!1363075 m!1247955))

(assert (=> b!1363075 m!1247949))

(assert (=> b!1363075 m!1247951))

(declare-fun m!1247957 () Bool)

(assert (=> b!1363075 m!1247957))

(declare-fun m!1247959 () Bool)

(assert (=> start!114992 m!1247959))

(declare-fun m!1247961 () Bool)

(assert (=> b!1363068 m!1247961))

(declare-fun m!1247963 () Bool)

(assert (=> b!1363076 m!1247963))

(declare-fun m!1247965 () Bool)

(assert (=> b!1363077 m!1247965))

(declare-fun m!1247967 () Bool)

(assert (=> b!1363072 m!1247967))

(assert (=> b!1363070 m!1247949))

(assert (=> b!1363070 m!1247949))

(declare-fun m!1247969 () Bool)

(assert (=> b!1363070 m!1247969))

(declare-fun m!1247971 () Bool)

(assert (=> b!1363078 m!1247971))

(declare-fun m!1247973 () Bool)

(assert (=> b!1363069 m!1247973))

(push 1)

(assert (not b!1363072))

(assert (not b!1363070))

(assert (not b!1363069))

(assert (not b!1363078))

(assert (not b!1363077))

(assert (not b!1363076))

(assert (not b!1363068))

(assert (not b!1363075))

(assert (not start!114992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

