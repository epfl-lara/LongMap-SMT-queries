; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115294 () Bool)

(assert start!115294)

(declare-fun b!1364947 () Bool)

(declare-fun res!907944 () Bool)

(declare-fun e!774174 () Bool)

(assert (=> b!1364947 (=> (not res!907944) (not e!774174))))

(declare-datatypes ((array!92812 0))(
  ( (array!92813 (arr!44833 (Array (_ BitVec 32) (_ BitVec 64))) (size!45384 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92812)

(declare-datatypes ((List!31861 0))(
  ( (Nil!31858) (Cons!31857 (h!33075 (_ BitVec 64)) (t!46544 List!31861)) )
))
(declare-fun arrayNoDuplicates!0 (array!92812 (_ BitVec 32) List!31861) Bool)

(assert (=> b!1364947 (= res!907944 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31858))))

(declare-fun b!1364948 () Bool)

(declare-fun res!907946 () Bool)

(assert (=> b!1364948 (=> (not res!907946) (not e!774174))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364948 (= res!907946 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364949 () Bool)

(declare-datatypes ((Unit!44939 0))(
  ( (Unit!44940) )
))
(declare-fun e!774173 () Unit!44939)

(declare-fun Unit!44941 () Unit!44939)

(assert (=> b!1364949 (= e!774173 Unit!44941)))

(declare-fun b!1364950 () Bool)

(declare-fun res!907943 () Bool)

(assert (=> b!1364950 (=> (not res!907943) (not e!774174))))

(declare-fun acc!759 () List!31861)

(declare-fun contains!9573 (List!31861 (_ BitVec 64)) Bool)

(assert (=> b!1364950 (= res!907943 (not (contains!9573 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364951 () Bool)

(declare-fun res!907942 () Bool)

(assert (=> b!1364951 (=> (not res!907942) (not e!774174))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1364951 (= res!907942 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364952 () Bool)

(declare-fun lt!601326 () Unit!44939)

(assert (=> b!1364952 (= e!774173 lt!601326)))

(declare-fun lt!601329 () Unit!44939)

(declare-fun lemmaListSubSeqRefl!0 (List!31861) Unit!44939)

(assert (=> b!1364952 (= lt!601329 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!932 (List!31861 List!31861) Bool)

(assert (=> b!1364952 (subseq!932 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92812 List!31861 List!31861 (_ BitVec 32)) Unit!44939)

(declare-fun $colon$colon!934 (List!31861 (_ BitVec 64)) List!31861)

(assert (=> b!1364952 (= lt!601326 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!934 acc!759 (select (arr!44833 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1364952 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364953 () Bool)

(declare-fun res!907948 () Bool)

(assert (=> b!1364953 (=> (not res!907948) (not e!774174))))

(assert (=> b!1364953 (= res!907948 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45384 a!3742)))))

(declare-fun b!1364954 () Bool)

(declare-fun e!774172 () Bool)

(assert (=> b!1364954 (= e!774174 e!774172)))

(declare-fun res!907941 () Bool)

(assert (=> b!1364954 (=> (not res!907941) (not e!774172))))

(declare-fun lt!601328 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1364954 (= res!907941 (and (not (= from!3120 i!1404)) (not lt!601328) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!601327 () Unit!44939)

(assert (=> b!1364954 (= lt!601327 e!774173)))

(declare-fun c!127951 () Bool)

(assert (=> b!1364954 (= c!127951 lt!601328)))

(assert (=> b!1364954 (= lt!601328 (validKeyInArray!0 (select (arr!44833 a!3742) from!3120)))))

(declare-fun b!1364956 () Bool)

(declare-fun res!907947 () Bool)

(assert (=> b!1364956 (=> (not res!907947) (not e!774174))))

(assert (=> b!1364956 (= res!907947 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45384 a!3742))))))

(declare-fun b!1364957 () Bool)

(declare-fun res!907945 () Bool)

(assert (=> b!1364957 (=> (not res!907945) (not e!774174))))

(declare-fun noDuplicate!2404 (List!31861) Bool)

(assert (=> b!1364957 (= res!907945 (noDuplicate!2404 acc!759))))

(declare-fun b!1364955 () Bool)

(declare-fun res!907950 () Bool)

(assert (=> b!1364955 (=> (not res!907950) (not e!774172))))

(assert (=> b!1364955 (= res!907950 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!907940 () Bool)

(assert (=> start!115294 (=> (not res!907940) (not e!774174))))

(assert (=> start!115294 (= res!907940 (and (bvslt (size!45384 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45384 a!3742))))))

(assert (=> start!115294 e!774174))

(assert (=> start!115294 true))

(declare-fun array_inv!34114 (array!92812) Bool)

(assert (=> start!115294 (array_inv!34114 a!3742)))

(declare-fun b!1364958 () Bool)

(declare-fun res!907949 () Bool)

(assert (=> b!1364958 (=> (not res!907949) (not e!774174))))

(assert (=> b!1364958 (= res!907949 (not (contains!9573 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364959 () Bool)

(assert (=> b!1364959 (= e!774172 (bvsge (bvsub (size!45384 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45384 a!3742) from!3120)))))

(assert (= (and start!115294 res!907940) b!1364957))

(assert (= (and b!1364957 res!907945) b!1364950))

(assert (= (and b!1364950 res!907943) b!1364958))

(assert (= (and b!1364958 res!907949) b!1364947))

(assert (= (and b!1364947 res!907944) b!1364951))

(assert (= (and b!1364951 res!907942) b!1364956))

(assert (= (and b!1364956 res!907947) b!1364948))

(assert (= (and b!1364948 res!907946) b!1364953))

(assert (= (and b!1364953 res!907948) b!1364954))

(assert (= (and b!1364954 c!127951) b!1364952))

(assert (= (and b!1364954 (not c!127951)) b!1364949))

(assert (= (and b!1364954 res!907941) b!1364955))

(assert (= (and b!1364955 res!907950) b!1364959))

(declare-fun m!1250005 () Bool)

(assert (=> b!1364951 m!1250005))

(declare-fun m!1250007 () Bool)

(assert (=> b!1364957 m!1250007))

(declare-fun m!1250009 () Bool)

(assert (=> b!1364947 m!1250009))

(declare-fun m!1250011 () Bool)

(assert (=> b!1364954 m!1250011))

(assert (=> b!1364954 m!1250011))

(declare-fun m!1250013 () Bool)

(assert (=> b!1364954 m!1250013))

(declare-fun m!1250015 () Bool)

(assert (=> b!1364950 m!1250015))

(declare-fun m!1250017 () Bool)

(assert (=> start!115294 m!1250017))

(declare-fun m!1250019 () Bool)

(assert (=> b!1364952 m!1250019))

(assert (=> b!1364952 m!1250011))

(declare-fun m!1250021 () Bool)

(assert (=> b!1364952 m!1250021))

(declare-fun m!1250023 () Bool)

(assert (=> b!1364952 m!1250023))

(declare-fun m!1250025 () Bool)

(assert (=> b!1364952 m!1250025))

(assert (=> b!1364952 m!1250011))

(assert (=> b!1364952 m!1250021))

(declare-fun m!1250027 () Bool)

(assert (=> b!1364952 m!1250027))

(declare-fun m!1250029 () Bool)

(assert (=> b!1364958 m!1250029))

(assert (=> b!1364955 m!1250025))

(declare-fun m!1250031 () Bool)

(assert (=> b!1364948 m!1250031))

(check-sat (not b!1364957) (not b!1364950) (not b!1364947) (not b!1364948) (not b!1364951) (not b!1364955) (not b!1364952) (not start!115294) (not b!1364954) (not b!1364958))
(check-sat)
