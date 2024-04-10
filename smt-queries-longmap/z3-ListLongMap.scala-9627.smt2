; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113902 () Bool)

(assert start!113902)

(declare-fun b!1350701 () Bool)

(declare-fun e!768364 () Bool)

(declare-fun e!768362 () Bool)

(assert (=> b!1350701 (= e!768364 (not e!768362))))

(declare-fun res!896169 () Bool)

(assert (=> b!1350701 (=> res!896169 e!768362)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1350701 (= res!896169 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31531 0))(
  ( (Nil!31528) (Cons!31527 (h!32736 (_ BitVec 64)) (t!46189 List!31531)) )
))
(declare-fun lt!597031 () List!31531)

(declare-fun acc!759 () List!31531)

(declare-datatypes ((array!92084 0))(
  ( (array!92085 (arr!44490 (Array (_ BitVec 32) (_ BitVec 64))) (size!45040 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92084)

(declare-fun $colon$colon!675 (List!31531 (_ BitVec 64)) List!31531)

(assert (=> b!1350701 (= lt!597031 ($colon$colon!675 acc!759 (select (arr!44490 a!3742) from!3120)))))

(declare-fun subseq!660 (List!31531 List!31531) Bool)

(assert (=> b!1350701 (subseq!660 acc!759 acc!759)))

(declare-datatypes ((Unit!44234 0))(
  ( (Unit!44235) )
))
(declare-fun lt!597032 () Unit!44234)

(declare-fun lemmaListSubSeqRefl!0 (List!31531) Unit!44234)

(assert (=> b!1350701 (= lt!597032 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350702 () Bool)

(declare-fun res!896163 () Bool)

(assert (=> b!1350702 (=> (not res!896163) (not e!768364))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350702 (= res!896163 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!896171 () Bool)

(assert (=> start!113902 (=> (not res!896171) (not e!768364))))

(assert (=> start!113902 (= res!896171 (and (bvslt (size!45040 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45040 a!3742))))))

(assert (=> start!113902 e!768364))

(assert (=> start!113902 true))

(declare-fun array_inv!33518 (array!92084) Bool)

(assert (=> start!113902 (array_inv!33518 a!3742)))

(declare-fun b!1350703 () Bool)

(declare-fun res!896164 () Bool)

(assert (=> b!1350703 (=> (not res!896164) (not e!768364))))

(declare-fun arrayNoDuplicates!0 (array!92084 (_ BitVec 32) List!31531) Bool)

(assert (=> b!1350703 (= res!896164 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31528))))

(declare-fun b!1350704 () Bool)

(declare-fun res!896160 () Bool)

(assert (=> b!1350704 (=> res!896160 e!768362)))

(assert (=> b!1350704 (= res!896160 (not (subseq!660 acc!759 lt!597031)))))

(declare-fun b!1350705 () Bool)

(assert (=> b!1350705 (= e!768362 true)))

(declare-fun lt!597033 () Bool)

(assert (=> b!1350705 (= lt!597033 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597031))))

(declare-fun lt!597034 () Unit!44234)

(declare-fun noDuplicateSubseq!111 (List!31531 List!31531) Unit!44234)

(assert (=> b!1350705 (= lt!597034 (noDuplicateSubseq!111 acc!759 lt!597031))))

(declare-fun b!1350706 () Bool)

(declare-fun res!896165 () Bool)

(assert (=> b!1350706 (=> res!896165 e!768362)))

(declare-fun contains!9240 (List!31531 (_ BitVec 64)) Bool)

(assert (=> b!1350706 (= res!896165 (contains!9240 lt!597031 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350707 () Bool)

(declare-fun res!896161 () Bool)

(assert (=> b!1350707 (=> (not res!896161) (not e!768364))))

(assert (=> b!1350707 (= res!896161 (not (contains!9240 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350708 () Bool)

(declare-fun res!896168 () Bool)

(assert (=> b!1350708 (=> (not res!896168) (not e!768364))))

(assert (=> b!1350708 (= res!896168 (not (contains!9240 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350709 () Bool)

(declare-fun res!896170 () Bool)

(assert (=> b!1350709 (=> (not res!896170) (not e!768364))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350709 (= res!896170 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45040 a!3742))))))

(declare-fun b!1350710 () Bool)

(declare-fun res!896159 () Bool)

(assert (=> b!1350710 (=> res!896159 e!768362)))

(assert (=> b!1350710 (= res!896159 (contains!9240 lt!597031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350711 () Bool)

(declare-fun res!896173 () Bool)

(assert (=> b!1350711 (=> (not res!896173) (not e!768364))))

(assert (=> b!1350711 (= res!896173 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45040 a!3742)))))

(declare-fun b!1350712 () Bool)

(declare-fun res!896162 () Bool)

(assert (=> b!1350712 (=> (not res!896162) (not e!768364))))

(assert (=> b!1350712 (= res!896162 (validKeyInArray!0 (select (arr!44490 a!3742) from!3120)))))

(declare-fun b!1350713 () Bool)

(declare-fun res!896167 () Bool)

(assert (=> b!1350713 (=> (not res!896167) (not e!768364))))

(declare-fun noDuplicate!2097 (List!31531) Bool)

(assert (=> b!1350713 (= res!896167 (noDuplicate!2097 acc!759))))

(declare-fun b!1350714 () Bool)

(declare-fun res!896166 () Bool)

(assert (=> b!1350714 (=> res!896166 e!768362)))

(assert (=> b!1350714 (= res!896166 (not (noDuplicate!2097 lt!597031)))))

(declare-fun b!1350715 () Bool)

(declare-fun res!896172 () Bool)

(assert (=> b!1350715 (=> (not res!896172) (not e!768364))))

(assert (=> b!1350715 (= res!896172 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!113902 res!896171) b!1350713))

(assert (= (and b!1350713 res!896167) b!1350708))

(assert (= (and b!1350708 res!896168) b!1350707))

(assert (= (and b!1350707 res!896161) b!1350703))

(assert (= (and b!1350703 res!896164) b!1350715))

(assert (= (and b!1350715 res!896172) b!1350709))

(assert (= (and b!1350709 res!896170) b!1350702))

(assert (= (and b!1350702 res!896163) b!1350711))

(assert (= (and b!1350711 res!896173) b!1350712))

(assert (= (and b!1350712 res!896162) b!1350701))

(assert (= (and b!1350701 (not res!896169)) b!1350714))

(assert (= (and b!1350714 (not res!896166)) b!1350710))

(assert (= (and b!1350710 (not res!896159)) b!1350706))

(assert (= (and b!1350706 (not res!896165)) b!1350704))

(assert (= (and b!1350704 (not res!896160)) b!1350705))

(declare-fun m!1237873 () Bool)

(assert (=> b!1350715 m!1237873))

(declare-fun m!1237875 () Bool)

(assert (=> b!1350706 m!1237875))

(declare-fun m!1237877 () Bool)

(assert (=> b!1350710 m!1237877))

(declare-fun m!1237879 () Bool)

(assert (=> b!1350705 m!1237879))

(declare-fun m!1237881 () Bool)

(assert (=> b!1350705 m!1237881))

(declare-fun m!1237883 () Bool)

(assert (=> b!1350712 m!1237883))

(assert (=> b!1350712 m!1237883))

(declare-fun m!1237885 () Bool)

(assert (=> b!1350712 m!1237885))

(declare-fun m!1237887 () Bool)

(assert (=> b!1350714 m!1237887))

(declare-fun m!1237889 () Bool)

(assert (=> b!1350707 m!1237889))

(declare-fun m!1237891 () Bool)

(assert (=> start!113902 m!1237891))

(declare-fun m!1237893 () Bool)

(assert (=> b!1350704 m!1237893))

(assert (=> b!1350701 m!1237883))

(assert (=> b!1350701 m!1237883))

(declare-fun m!1237895 () Bool)

(assert (=> b!1350701 m!1237895))

(declare-fun m!1237897 () Bool)

(assert (=> b!1350701 m!1237897))

(declare-fun m!1237899 () Bool)

(assert (=> b!1350701 m!1237899))

(declare-fun m!1237901 () Bool)

(assert (=> b!1350708 m!1237901))

(declare-fun m!1237903 () Bool)

(assert (=> b!1350702 m!1237903))

(declare-fun m!1237905 () Bool)

(assert (=> b!1350713 m!1237905))

(declare-fun m!1237907 () Bool)

(assert (=> b!1350703 m!1237907))

(check-sat (not b!1350702) (not start!113902) (not b!1350714) (not b!1350710) (not b!1350705) (not b!1350715) (not b!1350706) (not b!1350701) (not b!1350713) (not b!1350712) (not b!1350707) (not b!1350704) (not b!1350708) (not b!1350703))
(check-sat)
