; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114166 () Bool)

(assert start!114166)

(declare-fun b!1352900 () Bool)

(declare-fun res!897586 () Bool)

(declare-fun e!769385 () Bool)

(assert (=> b!1352900 (=> res!897586 e!769385)))

(declare-datatypes ((List!31591 0))(
  ( (Nil!31588) (Cons!31587 (h!32805 (_ BitVec 64)) (t!46241 List!31591)) )
))
(declare-fun lt!597749 () List!31591)

(declare-fun contains!9303 (List!31591 (_ BitVec 64)) Bool)

(assert (=> b!1352900 (= res!897586 (contains!9303 lt!597749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352901 () Bool)

(declare-fun res!897590 () Bool)

(declare-fun e!769386 () Bool)

(assert (=> b!1352901 (=> (not res!897590) (not e!769386))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352901 (= res!897590 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352902 () Bool)

(declare-fun res!897581 () Bool)

(assert (=> b!1352902 (=> res!897581 e!769385)))

(assert (=> b!1352902 (= res!897581 (contains!9303 lt!597749 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352903 () Bool)

(declare-fun res!897583 () Bool)

(assert (=> b!1352903 (=> (not res!897583) (not e!769386))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92239 0))(
  ( (array!92240 (arr!44563 (Array (_ BitVec 32) (_ BitVec 64))) (size!45114 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92239)

(assert (=> b!1352903 (= res!897583 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45114 a!3742)))))

(declare-fun b!1352904 () Bool)

(declare-fun res!897580 () Bool)

(assert (=> b!1352904 (=> (not res!897580) (not e!769386))))

(declare-fun acc!759 () List!31591)

(declare-fun noDuplicate!2134 (List!31591) Bool)

(assert (=> b!1352904 (= res!897580 (noDuplicate!2134 acc!759))))

(declare-fun b!1352905 () Bool)

(declare-fun res!897578 () Bool)

(assert (=> b!1352905 (=> res!897578 e!769385)))

(assert (=> b!1352905 (= res!897578 (not (noDuplicate!2134 lt!597749)))))

(declare-fun b!1352906 () Bool)

(declare-fun res!897577 () Bool)

(assert (=> b!1352906 (=> (not res!897577) (not e!769386))))

(assert (=> b!1352906 (= res!897577 (validKeyInArray!0 (select (arr!44563 a!3742) from!3120)))))

(declare-fun b!1352907 () Bool)

(declare-fun res!897589 () Bool)

(assert (=> b!1352907 (=> (not res!897589) (not e!769386))))

(assert (=> b!1352907 (= res!897589 (not (contains!9303 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352908 () Bool)

(assert (=> b!1352908 (= e!769385 true)))

(declare-fun lt!597750 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92239 (_ BitVec 32) List!31591) Bool)

(assert (=> b!1352908 (= lt!597750 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597749))))

(declare-datatypes ((Unit!44213 0))(
  ( (Unit!44214) )
))
(declare-fun lt!597748 () Unit!44213)

(declare-fun noDuplicateSubseq!131 (List!31591 List!31591) Unit!44213)

(assert (=> b!1352908 (= lt!597748 (noDuplicateSubseq!131 acc!759 lt!597749))))

(declare-fun b!1352909 () Bool)

(declare-fun res!897579 () Bool)

(assert (=> b!1352909 (=> res!897579 e!769385)))

(declare-fun subseq!680 (List!31591 List!31591) Bool)

(assert (=> b!1352909 (= res!897579 (not (subseq!680 acc!759 lt!597749)))))

(declare-fun b!1352910 () Bool)

(declare-fun res!897585 () Bool)

(assert (=> b!1352910 (=> (not res!897585) (not e!769386))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352910 (= res!897585 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45114 a!3742))))))

(declare-fun res!897591 () Bool)

(assert (=> start!114166 (=> (not res!897591) (not e!769386))))

(assert (=> start!114166 (= res!897591 (and (bvslt (size!45114 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45114 a!3742))))))

(assert (=> start!114166 e!769386))

(assert (=> start!114166 true))

(declare-fun array_inv!33844 (array!92239) Bool)

(assert (=> start!114166 (array_inv!33844 a!3742)))

(declare-fun b!1352911 () Bool)

(assert (=> b!1352911 (= e!769386 (not e!769385))))

(declare-fun res!897588 () Bool)

(assert (=> b!1352911 (=> res!897588 e!769385)))

(assert (=> b!1352911 (= res!897588 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!694 (List!31591 (_ BitVec 64)) List!31591)

(assert (=> b!1352911 (= lt!597749 ($colon$colon!694 acc!759 (select (arr!44563 a!3742) from!3120)))))

(assert (=> b!1352911 (subseq!680 acc!759 acc!759)))

(declare-fun lt!597747 () Unit!44213)

(declare-fun lemmaListSubSeqRefl!0 (List!31591) Unit!44213)

(assert (=> b!1352911 (= lt!597747 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1352912 () Bool)

(declare-fun res!897582 () Bool)

(assert (=> b!1352912 (=> (not res!897582) (not e!769386))))

(assert (=> b!1352912 (= res!897582 (not (contains!9303 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352913 () Bool)

(declare-fun res!897584 () Bool)

(assert (=> b!1352913 (=> (not res!897584) (not e!769386))))

(assert (=> b!1352913 (= res!897584 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31588))))

(declare-fun b!1352914 () Bool)

(declare-fun res!897587 () Bool)

(assert (=> b!1352914 (=> (not res!897587) (not e!769386))))

(assert (=> b!1352914 (= res!897587 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114166 res!897591) b!1352904))

(assert (= (and b!1352904 res!897580) b!1352907))

(assert (= (and b!1352907 res!897589) b!1352912))

(assert (= (and b!1352912 res!897582) b!1352913))

(assert (= (and b!1352913 res!897584) b!1352914))

(assert (= (and b!1352914 res!897587) b!1352910))

(assert (= (and b!1352910 res!897585) b!1352901))

(assert (= (and b!1352901 res!897590) b!1352903))

(assert (= (and b!1352903 res!897583) b!1352906))

(assert (= (and b!1352906 res!897577) b!1352911))

(assert (= (and b!1352911 (not res!897588)) b!1352905))

(assert (= (and b!1352905 (not res!897578)) b!1352900))

(assert (= (and b!1352900 (not res!897586)) b!1352902))

(assert (= (and b!1352902 (not res!897581)) b!1352909))

(assert (= (and b!1352909 (not res!897579)) b!1352908))

(declare-fun m!1240189 () Bool)

(assert (=> b!1352902 m!1240189))

(declare-fun m!1240191 () Bool)

(assert (=> b!1352909 m!1240191))

(declare-fun m!1240193 () Bool)

(assert (=> start!114166 m!1240193))

(declare-fun m!1240195 () Bool)

(assert (=> b!1352907 m!1240195))

(declare-fun m!1240197 () Bool)

(assert (=> b!1352906 m!1240197))

(assert (=> b!1352906 m!1240197))

(declare-fun m!1240199 () Bool)

(assert (=> b!1352906 m!1240199))

(declare-fun m!1240201 () Bool)

(assert (=> b!1352912 m!1240201))

(declare-fun m!1240203 () Bool)

(assert (=> b!1352908 m!1240203))

(declare-fun m!1240205 () Bool)

(assert (=> b!1352908 m!1240205))

(declare-fun m!1240207 () Bool)

(assert (=> b!1352913 m!1240207))

(declare-fun m!1240209 () Bool)

(assert (=> b!1352900 m!1240209))

(declare-fun m!1240211 () Bool)

(assert (=> b!1352914 m!1240211))

(declare-fun m!1240213 () Bool)

(assert (=> b!1352901 m!1240213))

(assert (=> b!1352911 m!1240197))

(assert (=> b!1352911 m!1240197))

(declare-fun m!1240215 () Bool)

(assert (=> b!1352911 m!1240215))

(declare-fun m!1240217 () Bool)

(assert (=> b!1352911 m!1240217))

(declare-fun m!1240219 () Bool)

(assert (=> b!1352911 m!1240219))

(declare-fun m!1240221 () Bool)

(assert (=> b!1352904 m!1240221))

(declare-fun m!1240223 () Bool)

(assert (=> b!1352905 m!1240223))

(check-sat (not b!1352901) (not b!1352900) (not b!1352909) (not start!114166) (not b!1352904) (not b!1352902) (not b!1352914) (not b!1352906) (not b!1352908) (not b!1352913) (not b!1352911) (not b!1352912) (not b!1352905) (not b!1352907))
(check-sat)
