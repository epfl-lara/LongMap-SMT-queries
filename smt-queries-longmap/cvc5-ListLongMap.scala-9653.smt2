; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114056 () Bool)

(assert start!114056)

(declare-fun b!1353898 () Bool)

(declare-fun res!899038 () Bool)

(declare-fun e!769266 () Bool)

(assert (=> b!1353898 (=> (not res!899038) (not e!769266))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92238 0))(
  ( (array!92239 (arr!44567 (Array (_ BitVec 32) (_ BitVec 64))) (size!45117 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92238)

(assert (=> b!1353898 (= res!899038 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45117 a!3742))))))

(declare-fun b!1353899 () Bool)

(declare-fun res!899036 () Bool)

(assert (=> b!1353899 (=> (not res!899036) (not e!769266))))

(declare-datatypes ((List!31608 0))(
  ( (Nil!31605) (Cons!31604 (h!32813 (_ BitVec 64)) (t!46266 List!31608)) )
))
(declare-fun acc!759 () List!31608)

(declare-fun noDuplicate!2174 (List!31608) Bool)

(assert (=> b!1353899 (= res!899036 (noDuplicate!2174 acc!759))))

(declare-fun b!1353900 () Bool)

(declare-datatypes ((Unit!44442 0))(
  ( (Unit!44443) )
))
(declare-fun e!769269 () Unit!44442)

(declare-fun lt!598051 () Unit!44442)

(assert (=> b!1353900 (= e!769269 lt!598051)))

(declare-fun lt!598054 () Unit!44442)

(declare-fun lemmaListSubSeqRefl!0 (List!31608) Unit!44442)

(assert (=> b!1353900 (= lt!598054 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!737 (List!31608 List!31608) Bool)

(assert (=> b!1353900 (subseq!737 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92238 List!31608 List!31608 (_ BitVec 32)) Unit!44442)

(declare-fun $colon$colon!752 (List!31608 (_ BitVec 64)) List!31608)

(assert (=> b!1353900 (= lt!598051 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!752 acc!759 (select (arr!44567 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92238 (_ BitVec 32) List!31608) Bool)

(assert (=> b!1353900 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353901 () Bool)

(declare-fun Unit!44444 () Unit!44442)

(assert (=> b!1353901 (= e!769269 Unit!44444)))

(declare-fun b!1353902 () Bool)

(declare-fun e!769268 () Bool)

(assert (=> b!1353902 (= e!769266 e!769268)))

(declare-fun res!899029 () Bool)

(assert (=> b!1353902 (=> (not res!899029) (not e!769268))))

(declare-fun lt!598052 () Bool)

(assert (=> b!1353902 (= res!899029 (and (not (= from!3120 i!1404)) lt!598052))))

(declare-fun lt!598049 () Unit!44442)

(assert (=> b!1353902 (= lt!598049 e!769269)))

(declare-fun c!126875 () Bool)

(assert (=> b!1353902 (= c!126875 lt!598052)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353902 (= lt!598052 (validKeyInArray!0 (select (arr!44567 a!3742) from!3120)))))

(declare-fun b!1353903 () Bool)

(declare-fun res!899035 () Bool)

(assert (=> b!1353903 (=> (not res!899035) (not e!769266))))

(assert (=> b!1353903 (= res!899035 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353904 () Bool)

(declare-fun e!769267 () Bool)

(assert (=> b!1353904 (= e!769268 e!769267)))

(declare-fun res!899031 () Bool)

(assert (=> b!1353904 (=> (not res!899031) (not e!769267))))

(assert (=> b!1353904 (= res!899031 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!598053 () List!31608)

(assert (=> b!1353904 (= lt!598053 ($colon$colon!752 acc!759 (select (arr!44567 a!3742) from!3120)))))

(declare-fun b!1353905 () Bool)

(declare-fun res!899034 () Bool)

(assert (=> b!1353905 (=> (not res!899034) (not e!769267))))

(assert (=> b!1353905 (= res!899034 (noDuplicate!2174 lt!598053))))

(declare-fun b!1353906 () Bool)

(declare-fun res!899041 () Bool)

(assert (=> b!1353906 (=> (not res!899041) (not e!769266))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353906 (= res!899041 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!899028 () Bool)

(assert (=> start!114056 (=> (not res!899028) (not e!769266))))

(assert (=> start!114056 (= res!899028 (and (bvslt (size!45117 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45117 a!3742))))))

(assert (=> start!114056 e!769266))

(assert (=> start!114056 true))

(declare-fun array_inv!33595 (array!92238) Bool)

(assert (=> start!114056 (array_inv!33595 a!3742)))

(declare-fun b!1353907 () Bool)

(declare-fun res!899032 () Bool)

(assert (=> b!1353907 (=> (not res!899032) (not e!769267))))

(declare-fun contains!9317 (List!31608 (_ BitVec 64)) Bool)

(assert (=> b!1353907 (= res!899032 (not (contains!9317 lt!598053 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353908 () Bool)

(declare-fun res!899037 () Bool)

(assert (=> b!1353908 (=> (not res!899037) (not e!769266))))

(assert (=> b!1353908 (= res!899037 (not (contains!9317 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353909 () Bool)

(declare-fun res!899039 () Bool)

(assert (=> b!1353909 (=> (not res!899039) (not e!769267))))

(assert (=> b!1353909 (= res!899039 (not (contains!9317 lt!598053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353910 () Bool)

(assert (=> b!1353910 (= e!769267 false)))

(declare-fun lt!598050 () Bool)

(assert (=> b!1353910 (= lt!598050 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598053))))

(declare-fun b!1353911 () Bool)

(declare-fun res!899033 () Bool)

(assert (=> b!1353911 (=> (not res!899033) (not e!769266))))

(assert (=> b!1353911 (= res!899033 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45117 a!3742)))))

(declare-fun b!1353912 () Bool)

(declare-fun res!899040 () Bool)

(assert (=> b!1353912 (=> (not res!899040) (not e!769266))))

(assert (=> b!1353912 (= res!899040 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31605))))

(declare-fun b!1353913 () Bool)

(declare-fun res!899030 () Bool)

(assert (=> b!1353913 (=> (not res!899030) (not e!769266))))

(assert (=> b!1353913 (= res!899030 (not (contains!9317 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114056 res!899028) b!1353899))

(assert (= (and b!1353899 res!899036) b!1353908))

(assert (= (and b!1353908 res!899037) b!1353913))

(assert (= (and b!1353913 res!899030) b!1353912))

(assert (= (and b!1353912 res!899040) b!1353903))

(assert (= (and b!1353903 res!899035) b!1353898))

(assert (= (and b!1353898 res!899038) b!1353906))

(assert (= (and b!1353906 res!899041) b!1353911))

(assert (= (and b!1353911 res!899033) b!1353902))

(assert (= (and b!1353902 c!126875) b!1353900))

(assert (= (and b!1353902 (not c!126875)) b!1353901))

(assert (= (and b!1353902 res!899029) b!1353904))

(assert (= (and b!1353904 res!899031) b!1353905))

(assert (= (and b!1353905 res!899034) b!1353907))

(assert (= (and b!1353907 res!899032) b!1353909))

(assert (= (and b!1353909 res!899039) b!1353910))

(declare-fun m!1240405 () Bool)

(assert (=> b!1353902 m!1240405))

(assert (=> b!1353902 m!1240405))

(declare-fun m!1240407 () Bool)

(assert (=> b!1353902 m!1240407))

(declare-fun m!1240409 () Bool)

(assert (=> b!1353899 m!1240409))

(declare-fun m!1240411 () Bool)

(assert (=> b!1353906 m!1240411))

(assert (=> b!1353904 m!1240405))

(assert (=> b!1353904 m!1240405))

(declare-fun m!1240413 () Bool)

(assert (=> b!1353904 m!1240413))

(declare-fun m!1240415 () Bool)

(assert (=> b!1353903 m!1240415))

(declare-fun m!1240417 () Bool)

(assert (=> b!1353909 m!1240417))

(declare-fun m!1240419 () Bool)

(assert (=> b!1353913 m!1240419))

(declare-fun m!1240421 () Bool)

(assert (=> start!114056 m!1240421))

(declare-fun m!1240423 () Bool)

(assert (=> b!1353900 m!1240423))

(assert (=> b!1353900 m!1240405))

(assert (=> b!1353900 m!1240413))

(declare-fun m!1240425 () Bool)

(assert (=> b!1353900 m!1240425))

(declare-fun m!1240427 () Bool)

(assert (=> b!1353900 m!1240427))

(assert (=> b!1353900 m!1240405))

(assert (=> b!1353900 m!1240413))

(declare-fun m!1240429 () Bool)

(assert (=> b!1353900 m!1240429))

(declare-fun m!1240431 () Bool)

(assert (=> b!1353908 m!1240431))

(declare-fun m!1240433 () Bool)

(assert (=> b!1353910 m!1240433))

(declare-fun m!1240435 () Bool)

(assert (=> b!1353912 m!1240435))

(declare-fun m!1240437 () Bool)

(assert (=> b!1353907 m!1240437))

(declare-fun m!1240439 () Bool)

(assert (=> b!1353905 m!1240439))

(push 1)

