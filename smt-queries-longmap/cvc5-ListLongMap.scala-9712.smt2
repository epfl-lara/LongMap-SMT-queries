; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114884 () Bool)

(assert start!114884)

(declare-fun b!1361901 () Bool)

(declare-fun res!905974 () Bool)

(declare-fun e!772588 () Bool)

(assert (=> b!1361901 (=> (not res!905974) (not e!772588))))

(declare-datatypes ((List!31785 0))(
  ( (Nil!31782) (Cons!31781 (h!32990 (_ BitVec 64)) (t!46470 List!31785)) )
))
(declare-fun lt!600320 () List!31785)

(declare-fun contains!9494 (List!31785 (_ BitVec 64)) Bool)

(assert (=> b!1361901 (= res!905974 (not (contains!9494 lt!600320 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361902 () Bool)

(declare-fun res!905981 () Bool)

(declare-fun e!772587 () Bool)

(assert (=> b!1361902 (=> (not res!905981) (not e!772587))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92619 0))(
  ( (array!92620 (arr!44744 (Array (_ BitVec 32) (_ BitVec 64))) (size!45294 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92619)

(assert (=> b!1361902 (= res!905981 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45294 a!3742)))))

(declare-fun b!1361903 () Bool)

(declare-fun res!905979 () Bool)

(assert (=> b!1361903 (=> (not res!905979) (not e!772587))))

(declare-fun acc!759 () List!31785)

(assert (=> b!1361903 (= res!905979 (not (contains!9494 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361904 () Bool)

(declare-fun res!905972 () Bool)

(assert (=> b!1361904 (=> (not res!905972) (not e!772587))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361904 (= res!905972 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361905 () Bool)

(declare-fun e!772590 () Bool)

(assert (=> b!1361905 (= e!772587 e!772590)))

(declare-fun res!905977 () Bool)

(assert (=> b!1361905 (=> (not res!905977) (not e!772590))))

(declare-fun lt!600319 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361905 (= res!905977 (and (not (= from!3120 i!1404)) lt!600319))))

(declare-datatypes ((Unit!44892 0))(
  ( (Unit!44893) )
))
(declare-fun lt!600322 () Unit!44892)

(declare-fun e!772589 () Unit!44892)

(assert (=> b!1361905 (= lt!600322 e!772589)))

(declare-fun c!127406 () Bool)

(assert (=> b!1361905 (= c!127406 lt!600319)))

(assert (=> b!1361905 (= lt!600319 (validKeyInArray!0 (select (arr!44744 a!3742) from!3120)))))

(declare-fun b!1361907 () Bool)

(declare-fun res!905978 () Bool)

(assert (=> b!1361907 (=> (not res!905978) (not e!772588))))

(declare-fun arrayNoDuplicates!0 (array!92619 (_ BitVec 32) List!31785) Bool)

(assert (=> b!1361907 (= res!905978 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600320))))

(declare-fun b!1361908 () Bool)

(assert (=> b!1361908 (= e!772590 e!772588)))

(declare-fun res!905976 () Bool)

(assert (=> b!1361908 (=> (not res!905976) (not e!772588))))

(assert (=> b!1361908 (= res!905976 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!899 (List!31785 (_ BitVec 64)) List!31785)

(assert (=> b!1361908 (= lt!600320 ($colon$colon!899 acc!759 (select (arr!44744 a!3742) from!3120)))))

(declare-fun b!1361909 () Bool)

(declare-fun res!905970 () Bool)

(assert (=> b!1361909 (=> (not res!905970) (not e!772588))))

(declare-fun noDuplicate!2351 (List!31785) Bool)

(assert (=> b!1361909 (= res!905970 (noDuplicate!2351 lt!600320))))

(declare-fun b!1361910 () Bool)

(declare-fun Unit!44894 () Unit!44892)

(assert (=> b!1361910 (= e!772589 Unit!44894)))

(declare-fun b!1361911 () Bool)

(assert (=> b!1361911 (= e!772588 (bvsge (bvsub (size!45294 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45294 a!3742) from!3120)))))

(declare-fun b!1361912 () Bool)

(declare-fun res!905980 () Bool)

(assert (=> b!1361912 (=> (not res!905980) (not e!772587))))

(assert (=> b!1361912 (= res!905980 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361913 () Bool)

(declare-fun res!905983 () Bool)

(assert (=> b!1361913 (=> (not res!905983) (not e!772587))))

(assert (=> b!1361913 (= res!905983 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45294 a!3742))))))

(declare-fun b!1361914 () Bool)

(declare-fun res!905969 () Bool)

(assert (=> b!1361914 (=> (not res!905969) (not e!772587))))

(assert (=> b!1361914 (= res!905969 (not (contains!9494 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361915 () Bool)

(declare-fun res!905971 () Bool)

(assert (=> b!1361915 (=> (not res!905971) (not e!772588))))

(assert (=> b!1361915 (= res!905971 (not (contains!9494 lt!600320 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361916 () Bool)

(declare-fun res!905975 () Bool)

(assert (=> b!1361916 (=> (not res!905975) (not e!772587))))

(assert (=> b!1361916 (= res!905975 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31782))))

(declare-fun b!1361917 () Bool)

(declare-fun res!905982 () Bool)

(assert (=> b!1361917 (=> (not res!905982) (not e!772587))))

(assert (=> b!1361917 (= res!905982 (noDuplicate!2351 acc!759))))

(declare-fun res!905973 () Bool)

(assert (=> start!114884 (=> (not res!905973) (not e!772587))))

(assert (=> start!114884 (= res!905973 (and (bvslt (size!45294 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45294 a!3742))))))

(assert (=> start!114884 e!772587))

(assert (=> start!114884 true))

(declare-fun array_inv!33772 (array!92619) Bool)

(assert (=> start!114884 (array_inv!33772 a!3742)))

(declare-fun b!1361906 () Bool)

(declare-fun lt!600321 () Unit!44892)

(assert (=> b!1361906 (= e!772589 lt!600321)))

(declare-fun lt!600318 () Unit!44892)

(declare-fun lemmaListSubSeqRefl!0 (List!31785) Unit!44892)

(assert (=> b!1361906 (= lt!600318 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!896 (List!31785 List!31785) Bool)

(assert (=> b!1361906 (subseq!896 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92619 List!31785 List!31785 (_ BitVec 32)) Unit!44892)

(assert (=> b!1361906 (= lt!600321 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!899 acc!759 (select (arr!44744 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361906 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114884 res!905973) b!1361917))

(assert (= (and b!1361917 res!905982) b!1361903))

(assert (= (and b!1361903 res!905979) b!1361914))

(assert (= (and b!1361914 res!905969) b!1361916))

(assert (= (and b!1361916 res!905975) b!1361912))

(assert (= (and b!1361912 res!905980) b!1361913))

(assert (= (and b!1361913 res!905983) b!1361904))

(assert (= (and b!1361904 res!905972) b!1361902))

(assert (= (and b!1361902 res!905981) b!1361905))

(assert (= (and b!1361905 c!127406) b!1361906))

(assert (= (and b!1361905 (not c!127406)) b!1361910))

(assert (= (and b!1361905 res!905977) b!1361908))

(assert (= (and b!1361908 res!905976) b!1361909))

(assert (= (and b!1361909 res!905970) b!1361901))

(assert (= (and b!1361901 res!905974) b!1361915))

(assert (= (and b!1361915 res!905971) b!1361907))

(assert (= (and b!1361907 res!905978) b!1361911))

(declare-fun m!1246921 () Bool)

(assert (=> b!1361901 m!1246921))

(declare-fun m!1246923 () Bool)

(assert (=> b!1361914 m!1246923))

(declare-fun m!1246925 () Bool)

(assert (=> b!1361912 m!1246925))

(declare-fun m!1246927 () Bool)

(assert (=> b!1361903 m!1246927))

(declare-fun m!1246929 () Bool)

(assert (=> b!1361908 m!1246929))

(assert (=> b!1361908 m!1246929))

(declare-fun m!1246931 () Bool)

(assert (=> b!1361908 m!1246931))

(declare-fun m!1246933 () Bool)

(assert (=> b!1361917 m!1246933))

(declare-fun m!1246935 () Bool)

(assert (=> b!1361909 m!1246935))

(declare-fun m!1246937 () Bool)

(assert (=> b!1361915 m!1246937))

(declare-fun m!1246939 () Bool)

(assert (=> b!1361907 m!1246939))

(declare-fun m!1246941 () Bool)

(assert (=> b!1361904 m!1246941))

(declare-fun m!1246943 () Bool)

(assert (=> b!1361916 m!1246943))

(declare-fun m!1246945 () Bool)

(assert (=> start!114884 m!1246945))

(declare-fun m!1246947 () Bool)

(assert (=> b!1361906 m!1246947))

(assert (=> b!1361906 m!1246929))

(assert (=> b!1361906 m!1246931))

(declare-fun m!1246949 () Bool)

(assert (=> b!1361906 m!1246949))

(declare-fun m!1246951 () Bool)

(assert (=> b!1361906 m!1246951))

(assert (=> b!1361906 m!1246929))

(assert (=> b!1361906 m!1246931))

(declare-fun m!1246953 () Bool)

(assert (=> b!1361906 m!1246953))

(assert (=> b!1361905 m!1246929))

(assert (=> b!1361905 m!1246929))

(declare-fun m!1246955 () Bool)

(assert (=> b!1361905 m!1246955))

(push 1)

(assert (not b!1361917))

(assert (not b!1361904))

(assert (not b!1361908))

(assert (not b!1361907))

(assert (not b!1361916))

(assert (not b!1361903))

(assert (not b!1361905))

(assert (not b!1361901))

(assert (not b!1361912))

(assert (not b!1361906))

(assert (not start!114884))

(assert (not b!1361914))

(assert (not b!1361909))

(assert (not b!1361915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

