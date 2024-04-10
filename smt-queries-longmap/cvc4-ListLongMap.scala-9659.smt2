; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114096 () Bool)

(assert start!114096)

(declare-fun b!1354884 () Bool)

(declare-fun res!899902 () Bool)

(declare-fun e!769570 () Bool)

(assert (=> b!1354884 (=> (not res!899902) (not e!769570))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92278 0))(
  ( (array!92279 (arr!44587 (Array (_ BitVec 32) (_ BitVec 64))) (size!45137 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92278)

(assert (=> b!1354884 (= res!899902 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45137 a!3742))))))

(declare-fun b!1354885 () Bool)

(declare-fun e!769566 () Bool)

(assert (=> b!1354885 (= e!769566 (not true))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun l!3587 () (_ BitVec 64))

(declare-datatypes ((List!31628 0))(
  ( (Nil!31625) (Cons!31624 (h!32833 (_ BitVec 64)) (t!46286 List!31628)) )
))
(declare-fun lt!598409 () List!31628)

(declare-fun arrayNoDuplicates!0 (array!92278 (_ BitVec 32) List!31628) Bool)

(assert (=> b!1354885 (arrayNoDuplicates!0 (array!92279 (store (arr!44587 a!3742) i!1404 l!3587) (size!45137 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598409)))

(declare-datatypes ((Unit!44502 0))(
  ( (Unit!44503) )
))
(declare-fun lt!598411 () Unit!44502)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92278 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31628) Unit!44502)

(assert (=> b!1354885 (= lt!598411 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598409))))

(declare-fun b!1354886 () Bool)

(declare-fun e!769569 () Bool)

(assert (=> b!1354886 (= e!769569 e!769566)))

(declare-fun res!899903 () Bool)

(assert (=> b!1354886 (=> (not res!899903) (not e!769566))))

(assert (=> b!1354886 (= res!899903 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31628)

(declare-fun $colon$colon!772 (List!31628 (_ BitVec 64)) List!31628)

(assert (=> b!1354886 (= lt!598409 ($colon$colon!772 acc!759 (select (arr!44587 a!3742) from!3120)))))

(declare-fun b!1354887 () Bool)

(declare-fun res!899908 () Bool)

(assert (=> b!1354887 (=> (not res!899908) (not e!769570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354887 (= res!899908 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354888 () Bool)

(declare-fun res!899894 () Bool)

(assert (=> b!1354888 (=> (not res!899894) (not e!769566))))

(declare-fun noDuplicate!2194 (List!31628) Bool)

(assert (=> b!1354888 (= res!899894 (noDuplicate!2194 lt!598409))))

(declare-fun b!1354889 () Bool)

(declare-fun e!769567 () Unit!44502)

(declare-fun Unit!44504 () Unit!44502)

(assert (=> b!1354889 (= e!769567 Unit!44504)))

(declare-fun b!1354890 () Bool)

(declare-fun res!899899 () Bool)

(assert (=> b!1354890 (=> (not res!899899) (not e!769566))))

(declare-fun contains!9337 (List!31628 (_ BitVec 64)) Bool)

(assert (=> b!1354890 (= res!899899 (not (contains!9337 lt!598409 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354891 () Bool)

(declare-fun res!899901 () Bool)

(assert (=> b!1354891 (=> (not res!899901) (not e!769570))))

(assert (=> b!1354891 (= res!899901 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354893 () Bool)

(declare-fun res!899906 () Bool)

(assert (=> b!1354893 (=> (not res!899906) (not e!769570))))

(assert (=> b!1354893 (= res!899906 (not (contains!9337 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354894 () Bool)

(assert (=> b!1354894 (= e!769570 e!769569)))

(declare-fun res!899897 () Bool)

(assert (=> b!1354894 (=> (not res!899897) (not e!769569))))

(declare-fun lt!598412 () Bool)

(assert (=> b!1354894 (= res!899897 (and (not (= from!3120 i!1404)) lt!598412))))

(declare-fun lt!598410 () Unit!44502)

(assert (=> b!1354894 (= lt!598410 e!769567)))

(declare-fun c!126935 () Bool)

(assert (=> b!1354894 (= c!126935 lt!598412)))

(assert (=> b!1354894 (= lt!598412 (validKeyInArray!0 (select (arr!44587 a!3742) from!3120)))))

(declare-fun b!1354895 () Bool)

(declare-fun res!899898 () Bool)

(assert (=> b!1354895 (=> (not res!899898) (not e!769566))))

(assert (=> b!1354895 (= res!899898 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598409))))

(declare-fun b!1354896 () Bool)

(declare-fun res!899895 () Bool)

(assert (=> b!1354896 (=> (not res!899895) (not e!769570))))

(assert (=> b!1354896 (= res!899895 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31625))))

(declare-fun b!1354897 () Bool)

(declare-fun res!899905 () Bool)

(assert (=> b!1354897 (=> (not res!899905) (not e!769570))))

(assert (=> b!1354897 (= res!899905 (noDuplicate!2194 acc!759))))

(declare-fun b!1354898 () Bool)

(declare-fun res!899904 () Bool)

(assert (=> b!1354898 (=> (not res!899904) (not e!769570))))

(assert (=> b!1354898 (= res!899904 (not (contains!9337 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354899 () Bool)

(declare-fun res!899900 () Bool)

(assert (=> b!1354899 (=> (not res!899900) (not e!769566))))

(assert (=> b!1354899 (= res!899900 (not (contains!9337 lt!598409 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354900 () Bool)

(declare-fun res!899896 () Bool)

(assert (=> b!1354900 (=> (not res!899896) (not e!769570))))

(assert (=> b!1354900 (= res!899896 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45137 a!3742)))))

(declare-fun res!899907 () Bool)

(assert (=> start!114096 (=> (not res!899907) (not e!769570))))

(assert (=> start!114096 (= res!899907 (and (bvslt (size!45137 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45137 a!3742))))))

(assert (=> start!114096 e!769570))

(assert (=> start!114096 true))

(declare-fun array_inv!33615 (array!92278) Bool)

(assert (=> start!114096 (array_inv!33615 a!3742)))

(declare-fun b!1354892 () Bool)

(declare-fun lt!598413 () Unit!44502)

(assert (=> b!1354892 (= e!769567 lt!598413)))

(declare-fun lt!598414 () Unit!44502)

(declare-fun lemmaListSubSeqRefl!0 (List!31628) Unit!44502)

(assert (=> b!1354892 (= lt!598414 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!757 (List!31628 List!31628) Bool)

(assert (=> b!1354892 (subseq!757 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92278 List!31628 List!31628 (_ BitVec 32)) Unit!44502)

(assert (=> b!1354892 (= lt!598413 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!772 acc!759 (select (arr!44587 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354892 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114096 res!899907) b!1354897))

(assert (= (and b!1354897 res!899905) b!1354898))

(assert (= (and b!1354898 res!899904) b!1354893))

(assert (= (and b!1354893 res!899906) b!1354896))

(assert (= (and b!1354896 res!899895) b!1354891))

(assert (= (and b!1354891 res!899901) b!1354884))

(assert (= (and b!1354884 res!899902) b!1354887))

(assert (= (and b!1354887 res!899908) b!1354900))

(assert (= (and b!1354900 res!899896) b!1354894))

(assert (= (and b!1354894 c!126935) b!1354892))

(assert (= (and b!1354894 (not c!126935)) b!1354889))

(assert (= (and b!1354894 res!899897) b!1354886))

(assert (= (and b!1354886 res!899903) b!1354888))

(assert (= (and b!1354888 res!899894) b!1354899))

(assert (= (and b!1354899 res!899900) b!1354890))

(assert (= (and b!1354890 res!899899) b!1354895))

(assert (= (and b!1354895 res!899898) b!1354885))

(declare-fun m!1241173 () Bool)

(assert (=> b!1354887 m!1241173))

(declare-fun m!1241175 () Bool)

(assert (=> b!1354894 m!1241175))

(assert (=> b!1354894 m!1241175))

(declare-fun m!1241177 () Bool)

(assert (=> b!1354894 m!1241177))

(declare-fun m!1241179 () Bool)

(assert (=> start!114096 m!1241179))

(assert (=> b!1354886 m!1241175))

(assert (=> b!1354886 m!1241175))

(declare-fun m!1241181 () Bool)

(assert (=> b!1354886 m!1241181))

(declare-fun m!1241183 () Bool)

(assert (=> b!1354890 m!1241183))

(declare-fun m!1241185 () Bool)

(assert (=> b!1354888 m!1241185))

(declare-fun m!1241187 () Bool)

(assert (=> b!1354898 m!1241187))

(declare-fun m!1241189 () Bool)

(assert (=> b!1354899 m!1241189))

(declare-fun m!1241191 () Bool)

(assert (=> b!1354896 m!1241191))

(declare-fun m!1241193 () Bool)

(assert (=> b!1354891 m!1241193))

(declare-fun m!1241195 () Bool)

(assert (=> b!1354893 m!1241195))

(declare-fun m!1241197 () Bool)

(assert (=> b!1354897 m!1241197))

(declare-fun m!1241199 () Bool)

(assert (=> b!1354885 m!1241199))

(declare-fun m!1241201 () Bool)

(assert (=> b!1354885 m!1241201))

(declare-fun m!1241203 () Bool)

(assert (=> b!1354885 m!1241203))

(declare-fun m!1241205 () Bool)

(assert (=> b!1354892 m!1241205))

(assert (=> b!1354892 m!1241175))

(assert (=> b!1354892 m!1241181))

(declare-fun m!1241207 () Bool)

(assert (=> b!1354892 m!1241207))

(declare-fun m!1241209 () Bool)

(assert (=> b!1354892 m!1241209))

(assert (=> b!1354892 m!1241175))

(assert (=> b!1354892 m!1241181))

(declare-fun m!1241211 () Bool)

(assert (=> b!1354892 m!1241211))

(declare-fun m!1241213 () Bool)

(assert (=> b!1354895 m!1241213))

(push 1)

