; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114892 () Bool)

(assert start!114892)

(declare-fun b!1362105 () Bool)

(declare-fun res!906158 () Bool)

(declare-fun e!772650 () Bool)

(assert (=> b!1362105 (=> (not res!906158) (not e!772650))))

(declare-datatypes ((List!31789 0))(
  ( (Nil!31786) (Cons!31785 (h!32994 (_ BitVec 64)) (t!46474 List!31789)) )
))
(declare-fun lt!600386 () List!31789)

(declare-fun noDuplicate!2355 (List!31789) Bool)

(assert (=> b!1362105 (= res!906158 (noDuplicate!2355 lt!600386))))

(declare-fun b!1362107 () Bool)

(declare-datatypes ((Unit!44904 0))(
  ( (Unit!44905) )
))
(declare-fun e!772649 () Unit!44904)

(declare-fun lt!600385 () Unit!44904)

(assert (=> b!1362107 (= e!772649 lt!600385)))

(declare-fun lt!600383 () Unit!44904)

(declare-fun acc!759 () List!31789)

(declare-fun lemmaListSubSeqRefl!0 (List!31789) Unit!44904)

(assert (=> b!1362107 (= lt!600383 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!900 (List!31789 List!31789) Bool)

(assert (=> b!1362107 (subseq!900 acc!759 acc!759)))

(declare-datatypes ((array!92627 0))(
  ( (array!92628 (arr!44748 (Array (_ BitVec 32) (_ BitVec 64))) (size!45298 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92627)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92627 List!31789 List!31789 (_ BitVec 32)) Unit!44904)

(declare-fun $colon$colon!903 (List!31789 (_ BitVec 64)) List!31789)

(assert (=> b!1362107 (= lt!600385 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!903 acc!759 (select (arr!44748 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92627 (_ BitVec 32) List!31789) Bool)

(assert (=> b!1362107 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362108 () Bool)

(declare-fun res!906156 () Bool)

(declare-fun e!772647 () Bool)

(assert (=> b!1362108 (=> (not res!906156) (not e!772647))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362108 (= res!906156 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362109 () Bool)

(declare-fun Unit!44906 () Unit!44904)

(assert (=> b!1362109 (= e!772649 Unit!44906)))

(declare-fun b!1362110 () Bool)

(declare-fun res!906161 () Bool)

(assert (=> b!1362110 (=> (not res!906161) (not e!772647))))

(declare-fun contains!9498 (List!31789 (_ BitVec 64)) Bool)

(assert (=> b!1362110 (= res!906161 (not (contains!9498 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362111 () Bool)

(declare-fun res!906159 () Bool)

(assert (=> b!1362111 (=> (not res!906159) (not e!772650))))

(assert (=> b!1362111 (= res!906159 (not (contains!9498 lt!600386 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362112 () Bool)

(declare-fun res!906149 () Bool)

(assert (=> b!1362112 (=> (not res!906149) (not e!772647))))

(assert (=> b!1362112 (= res!906149 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31786))))

(declare-fun b!1362113 () Bool)

(declare-fun res!906162 () Bool)

(assert (=> b!1362113 (=> (not res!906162) (not e!772650))))

(assert (=> b!1362113 (= res!906162 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600386))))

(declare-fun b!1362114 () Bool)

(declare-fun res!906153 () Bool)

(assert (=> b!1362114 (=> (not res!906153) (not e!772647))))

(assert (=> b!1362114 (= res!906153 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362115 () Bool)

(declare-fun e!772651 () Bool)

(assert (=> b!1362115 (= e!772647 e!772651)))

(declare-fun res!906154 () Bool)

(assert (=> b!1362115 (=> (not res!906154) (not e!772651))))

(declare-fun lt!600387 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362115 (= res!906154 (and (not (= from!3120 i!1404)) lt!600387))))

(declare-fun lt!600384 () Unit!44904)

(assert (=> b!1362115 (= lt!600384 e!772649)))

(declare-fun c!127418 () Bool)

(assert (=> b!1362115 (= c!127418 lt!600387)))

(assert (=> b!1362115 (= lt!600387 (validKeyInArray!0 (select (arr!44748 a!3742) from!3120)))))

(declare-fun b!1362106 () Bool)

(declare-fun res!906163 () Bool)

(assert (=> b!1362106 (=> (not res!906163) (not e!772647))))

(assert (=> b!1362106 (= res!906163 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45298 a!3742))))))

(declare-fun res!906150 () Bool)

(assert (=> start!114892 (=> (not res!906150) (not e!772647))))

(assert (=> start!114892 (= res!906150 (and (bvslt (size!45298 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45298 a!3742))))))

(assert (=> start!114892 e!772647))

(assert (=> start!114892 true))

(declare-fun array_inv!33776 (array!92627) Bool)

(assert (=> start!114892 (array_inv!33776 a!3742)))

(declare-fun b!1362116 () Bool)

(assert (=> b!1362116 (= e!772650 (not true))))

(assert (=> b!1362116 (arrayNoDuplicates!0 (array!92628 (store (arr!44748 a!3742) i!1404 l!3587) (size!45298 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600386)))

(declare-fun lt!600388 () Unit!44904)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92627 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31789) Unit!44904)

(assert (=> b!1362116 (= lt!600388 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600386))))

(declare-fun b!1362117 () Bool)

(declare-fun res!906152 () Bool)

(assert (=> b!1362117 (=> (not res!906152) (not e!772647))))

(assert (=> b!1362117 (= res!906152 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45298 a!3742)))))

(declare-fun b!1362118 () Bool)

(declare-fun res!906160 () Bool)

(assert (=> b!1362118 (=> (not res!906160) (not e!772647))))

(assert (=> b!1362118 (= res!906160 (noDuplicate!2355 acc!759))))

(declare-fun b!1362119 () Bool)

(assert (=> b!1362119 (= e!772651 e!772650)))

(declare-fun res!906157 () Bool)

(assert (=> b!1362119 (=> (not res!906157) (not e!772650))))

(assert (=> b!1362119 (= res!906157 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1362119 (= lt!600386 ($colon$colon!903 acc!759 (select (arr!44748 a!3742) from!3120)))))

(declare-fun b!1362120 () Bool)

(declare-fun res!906151 () Bool)

(assert (=> b!1362120 (=> (not res!906151) (not e!772650))))

(assert (=> b!1362120 (= res!906151 (not (contains!9498 lt!600386 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362121 () Bool)

(declare-fun res!906155 () Bool)

(assert (=> b!1362121 (=> (not res!906155) (not e!772647))))

(assert (=> b!1362121 (= res!906155 (not (contains!9498 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114892 res!906150) b!1362118))

(assert (= (and b!1362118 res!906160) b!1362121))

(assert (= (and b!1362121 res!906155) b!1362110))

(assert (= (and b!1362110 res!906161) b!1362112))

(assert (= (and b!1362112 res!906149) b!1362114))

(assert (= (and b!1362114 res!906153) b!1362106))

(assert (= (and b!1362106 res!906163) b!1362108))

(assert (= (and b!1362108 res!906156) b!1362117))

(assert (= (and b!1362117 res!906152) b!1362115))

(assert (= (and b!1362115 c!127418) b!1362107))

(assert (= (and b!1362115 (not c!127418)) b!1362109))

(assert (= (and b!1362115 res!906154) b!1362119))

(assert (= (and b!1362119 res!906157) b!1362105))

(assert (= (and b!1362105 res!906158) b!1362111))

(assert (= (and b!1362111 res!906159) b!1362120))

(assert (= (and b!1362120 res!906151) b!1362113))

(assert (= (and b!1362113 res!906162) b!1362116))

(declare-fun m!1247071 () Bool)

(assert (=> b!1362111 m!1247071))

(declare-fun m!1247073 () Bool)

(assert (=> b!1362107 m!1247073))

(declare-fun m!1247075 () Bool)

(assert (=> b!1362107 m!1247075))

(declare-fun m!1247077 () Bool)

(assert (=> b!1362107 m!1247077))

(declare-fun m!1247079 () Bool)

(assert (=> b!1362107 m!1247079))

(declare-fun m!1247081 () Bool)

(assert (=> b!1362107 m!1247081))

(assert (=> b!1362107 m!1247075))

(assert (=> b!1362107 m!1247077))

(declare-fun m!1247083 () Bool)

(assert (=> b!1362107 m!1247083))

(declare-fun m!1247085 () Bool)

(assert (=> b!1362120 m!1247085))

(assert (=> b!1362119 m!1247075))

(assert (=> b!1362119 m!1247075))

(assert (=> b!1362119 m!1247077))

(declare-fun m!1247087 () Bool)

(assert (=> b!1362108 m!1247087))

(declare-fun m!1247089 () Bool)

(assert (=> b!1362105 m!1247089))

(declare-fun m!1247091 () Bool)

(assert (=> b!1362118 m!1247091))

(declare-fun m!1247093 () Bool)

(assert (=> b!1362113 m!1247093))

(assert (=> b!1362115 m!1247075))

(assert (=> b!1362115 m!1247075))

(declare-fun m!1247095 () Bool)

(assert (=> b!1362115 m!1247095))

(declare-fun m!1247097 () Bool)

(assert (=> start!114892 m!1247097))

(declare-fun m!1247099 () Bool)

(assert (=> b!1362121 m!1247099))

(declare-fun m!1247101 () Bool)

(assert (=> b!1362114 m!1247101))

(declare-fun m!1247103 () Bool)

(assert (=> b!1362112 m!1247103))

(declare-fun m!1247105 () Bool)

(assert (=> b!1362116 m!1247105))

(declare-fun m!1247107 () Bool)

(assert (=> b!1362116 m!1247107))

(declare-fun m!1247109 () Bool)

(assert (=> b!1362116 m!1247109))

(declare-fun m!1247111 () Bool)

(assert (=> b!1362110 m!1247111))

(check-sat (not b!1362118) (not b!1362119) (not b!1362107) (not b!1362121) (not start!114892) (not b!1362120) (not b!1362111) (not b!1362110) (not b!1362108) (not b!1362116) (not b!1362115) (not b!1362113) (not b!1362105) (not b!1362114) (not b!1362112))
(check-sat)
