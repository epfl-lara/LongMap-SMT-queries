; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114032 () Bool)

(assert start!114032)

(declare-fun b!1353322 () Bool)

(declare-fun res!898534 () Bool)

(declare-fun e!769089 () Bool)

(assert (=> b!1353322 (=> (not res!898534) (not e!769089))))

(declare-datatypes ((List!31596 0))(
  ( (Nil!31593) (Cons!31592 (h!32801 (_ BitVec 64)) (t!46254 List!31596)) )
))
(declare-fun acc!759 () List!31596)

(declare-fun noDuplicate!2162 (List!31596) Bool)

(assert (=> b!1353322 (= res!898534 (noDuplicate!2162 acc!759))))

(declare-fun b!1353323 () Bool)

(declare-fun e!769088 () Bool)

(assert (=> b!1353323 (= e!769089 e!769088)))

(declare-fun res!898536 () Bool)

(assert (=> b!1353323 (=> (not res!898536) (not e!769088))))

(declare-fun lt!597836 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353323 (= res!898536 (and (not (= from!3120 i!1404)) lt!597836))))

(declare-datatypes ((Unit!44406 0))(
  ( (Unit!44407) )
))
(declare-fun lt!597835 () Unit!44406)

(declare-fun e!769086 () Unit!44406)

(assert (=> b!1353323 (= lt!597835 e!769086)))

(declare-fun c!126839 () Bool)

(assert (=> b!1353323 (= c!126839 lt!597836)))

(declare-datatypes ((array!92214 0))(
  ( (array!92215 (arr!44555 (Array (_ BitVec 32) (_ BitVec 64))) (size!45105 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92214)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353323 (= lt!597836 (validKeyInArray!0 (select (arr!44555 a!3742) from!3120)))))

(declare-fun b!1353324 () Bool)

(declare-fun Unit!44408 () Unit!44406)

(assert (=> b!1353324 (= e!769086 Unit!44408)))

(declare-fun res!898524 () Bool)

(assert (=> start!114032 (=> (not res!898524) (not e!769089))))

(assert (=> start!114032 (= res!898524 (and (bvslt (size!45105 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45105 a!3742))))))

(assert (=> start!114032 e!769089))

(assert (=> start!114032 true))

(declare-fun array_inv!33583 (array!92214) Bool)

(assert (=> start!114032 (array_inv!33583 a!3742)))

(declare-fun b!1353325 () Bool)

(declare-fun res!898535 () Bool)

(assert (=> b!1353325 (=> (not res!898535) (not e!769089))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353325 (= res!898535 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353326 () Bool)

(declare-fun res!898537 () Bool)

(declare-fun e!769087 () Bool)

(assert (=> b!1353326 (=> (not res!898537) (not e!769087))))

(declare-fun lt!597833 () List!31596)

(declare-fun contains!9305 (List!31596 (_ BitVec 64)) Bool)

(assert (=> b!1353326 (= res!898537 (not (contains!9305 lt!597833 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353327 () Bool)

(declare-fun res!898527 () Bool)

(assert (=> b!1353327 (=> (not res!898527) (not e!769087))))

(assert (=> b!1353327 (= res!898527 (not (contains!9305 lt!597833 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353328 () Bool)

(declare-fun res!898532 () Bool)

(assert (=> b!1353328 (=> (not res!898532) (not e!769089))))

(declare-fun arrayNoDuplicates!0 (array!92214 (_ BitVec 32) List!31596) Bool)

(assert (=> b!1353328 (= res!898532 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353329 () Bool)

(declare-fun res!898525 () Bool)

(assert (=> b!1353329 (=> (not res!898525) (not e!769089))))

(assert (=> b!1353329 (= res!898525 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45105 a!3742)))))

(declare-fun b!1353330 () Bool)

(declare-fun res!898528 () Bool)

(assert (=> b!1353330 (=> (not res!898528) (not e!769089))))

(assert (=> b!1353330 (= res!898528 (not (contains!9305 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353331 () Bool)

(declare-fun res!898526 () Bool)

(assert (=> b!1353331 (=> (not res!898526) (not e!769087))))

(assert (=> b!1353331 (= res!898526 (noDuplicate!2162 lt!597833))))

(declare-fun b!1353332 () Bool)

(declare-fun res!898533 () Bool)

(assert (=> b!1353332 (=> (not res!898533) (not e!769089))))

(assert (=> b!1353332 (= res!898533 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31593))))

(declare-fun b!1353333 () Bool)

(assert (=> b!1353333 (= e!769088 e!769087)))

(declare-fun res!898531 () Bool)

(assert (=> b!1353333 (=> (not res!898531) (not e!769087))))

(assert (=> b!1353333 (= res!898531 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!740 (List!31596 (_ BitVec 64)) List!31596)

(assert (=> b!1353333 (= lt!597833 ($colon$colon!740 acc!759 (select (arr!44555 a!3742) from!3120)))))

(declare-fun b!1353334 () Bool)

(assert (=> b!1353334 (= e!769087 false)))

(declare-fun lt!597837 () Bool)

(assert (=> b!1353334 (= lt!597837 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597833))))

(declare-fun b!1353335 () Bool)

(declare-fun res!898530 () Bool)

(assert (=> b!1353335 (=> (not res!898530) (not e!769089))))

(assert (=> b!1353335 (= res!898530 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45105 a!3742))))))

(declare-fun b!1353336 () Bool)

(declare-fun lt!597834 () Unit!44406)

(assert (=> b!1353336 (= e!769086 lt!597834)))

(declare-fun lt!597838 () Unit!44406)

(declare-fun lemmaListSubSeqRefl!0 (List!31596) Unit!44406)

(assert (=> b!1353336 (= lt!597838 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!725 (List!31596 List!31596) Bool)

(assert (=> b!1353336 (subseq!725 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92214 List!31596 List!31596 (_ BitVec 32)) Unit!44406)

(assert (=> b!1353336 (= lt!597834 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!740 acc!759 (select (arr!44555 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353336 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353337 () Bool)

(declare-fun res!898529 () Bool)

(assert (=> b!1353337 (=> (not res!898529) (not e!769089))))

(assert (=> b!1353337 (= res!898529 (not (contains!9305 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114032 res!898524) b!1353322))

(assert (= (and b!1353322 res!898534) b!1353337))

(assert (= (and b!1353337 res!898529) b!1353330))

(assert (= (and b!1353330 res!898528) b!1353332))

(assert (= (and b!1353332 res!898533) b!1353328))

(assert (= (and b!1353328 res!898532) b!1353335))

(assert (= (and b!1353335 res!898530) b!1353325))

(assert (= (and b!1353325 res!898535) b!1353329))

(assert (= (and b!1353329 res!898525) b!1353323))

(assert (= (and b!1353323 c!126839) b!1353336))

(assert (= (and b!1353323 (not c!126839)) b!1353324))

(assert (= (and b!1353323 res!898536) b!1353333))

(assert (= (and b!1353333 res!898531) b!1353331))

(assert (= (and b!1353331 res!898526) b!1353326))

(assert (= (and b!1353326 res!898537) b!1353327))

(assert (= (and b!1353327 res!898527) b!1353334))

(declare-fun m!1239973 () Bool)

(assert (=> start!114032 m!1239973))

(declare-fun m!1239975 () Bool)

(assert (=> b!1353322 m!1239975))

(declare-fun m!1239977 () Bool)

(assert (=> b!1353336 m!1239977))

(declare-fun m!1239979 () Bool)

(assert (=> b!1353336 m!1239979))

(declare-fun m!1239981 () Bool)

(assert (=> b!1353336 m!1239981))

(declare-fun m!1239983 () Bool)

(assert (=> b!1353336 m!1239983))

(declare-fun m!1239985 () Bool)

(assert (=> b!1353336 m!1239985))

(assert (=> b!1353336 m!1239979))

(assert (=> b!1353336 m!1239981))

(declare-fun m!1239987 () Bool)

(assert (=> b!1353336 m!1239987))

(assert (=> b!1353323 m!1239979))

(assert (=> b!1353323 m!1239979))

(declare-fun m!1239989 () Bool)

(assert (=> b!1353323 m!1239989))

(declare-fun m!1239991 () Bool)

(assert (=> b!1353325 m!1239991))

(declare-fun m!1239993 () Bool)

(assert (=> b!1353326 m!1239993))

(declare-fun m!1239995 () Bool)

(assert (=> b!1353331 m!1239995))

(declare-fun m!1239997 () Bool)

(assert (=> b!1353334 m!1239997))

(assert (=> b!1353333 m!1239979))

(assert (=> b!1353333 m!1239979))

(assert (=> b!1353333 m!1239981))

(declare-fun m!1239999 () Bool)

(assert (=> b!1353327 m!1239999))

(declare-fun m!1240001 () Bool)

(assert (=> b!1353337 m!1240001))

(declare-fun m!1240003 () Bool)

(assert (=> b!1353328 m!1240003))

(declare-fun m!1240005 () Bool)

(assert (=> b!1353330 m!1240005))

(declare-fun m!1240007 () Bool)

(assert (=> b!1353332 m!1240007))

(push 1)

