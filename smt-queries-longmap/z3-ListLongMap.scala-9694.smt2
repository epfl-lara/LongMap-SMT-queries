; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114502 () Bool)

(assert start!114502)

(declare-fun b!1358982 () Bool)

(declare-fun res!903541 () Bool)

(declare-fun e!771168 () Bool)

(assert (=> b!1358982 (=> (not res!903541) (not e!771168))))

(declare-datatypes ((List!31732 0))(
  ( (Nil!31729) (Cons!31728 (h!32937 (_ BitVec 64)) (t!46402 List!31732)) )
))
(declare-fun acc!759 () List!31732)

(declare-fun contains!9441 (List!31732 (_ BitVec 64)) Bool)

(assert (=> b!1358982 (= res!903541 (not (contains!9441 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358983 () Bool)

(declare-fun res!903544 () Bool)

(assert (=> b!1358983 (=> (not res!903544) (not e!771168))))

(declare-datatypes ((array!92498 0))(
  ( (array!92499 (arr!44691 (Array (_ BitVec 32) (_ BitVec 64))) (size!45241 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92498)

(declare-fun arrayNoDuplicates!0 (array!92498 (_ BitVec 32) List!31732) Bool)

(assert (=> b!1358983 (= res!903544 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31729))))

(declare-fun b!1358984 () Bool)

(declare-datatypes ((Unit!44733 0))(
  ( (Unit!44734) )
))
(declare-fun e!771167 () Unit!44733)

(declare-fun lt!599488 () Unit!44733)

(assert (=> b!1358984 (= e!771167 lt!599488)))

(declare-fun lt!599487 () Unit!44733)

(declare-fun lemmaListSubSeqRefl!0 (List!31732) Unit!44733)

(assert (=> b!1358984 (= lt!599487 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!843 (List!31732 List!31732) Bool)

(assert (=> b!1358984 (subseq!843 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92498 List!31732 List!31732 (_ BitVec 32)) Unit!44733)

(declare-fun $colon$colon!846 (List!31732 (_ BitVec 64)) List!31732)

(assert (=> b!1358984 (= lt!599488 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!846 acc!759 (select (arr!44691 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358984 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!903538 () Bool)

(assert (=> start!114502 (=> (not res!903538) (not e!771168))))

(assert (=> start!114502 (= res!903538 (and (bvslt (size!45241 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45241 a!3742))))))

(assert (=> start!114502 e!771168))

(assert (=> start!114502 true))

(declare-fun array_inv!33719 (array!92498) Bool)

(assert (=> start!114502 (array_inv!33719 a!3742)))

(declare-fun b!1358985 () Bool)

(declare-fun res!903539 () Bool)

(assert (=> b!1358985 (=> (not res!903539) (not e!771168))))

(declare-fun noDuplicate!2298 (List!31732) Bool)

(assert (=> b!1358985 (= res!903539 (noDuplicate!2298 acc!759))))

(declare-fun b!1358986 () Bool)

(declare-fun res!903543 () Bool)

(assert (=> b!1358986 (=> (not res!903543) (not e!771168))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358986 (= res!903543 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45241 a!3742))))))

(declare-fun b!1358987 () Bool)

(declare-fun res!903542 () Bool)

(assert (=> b!1358987 (=> (not res!903542) (not e!771168))))

(assert (=> b!1358987 (= res!903542 (not (contains!9441 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358988 () Bool)

(declare-fun res!903540 () Bool)

(assert (=> b!1358988 (=> (not res!903540) (not e!771168))))

(assert (=> b!1358988 (= res!903540 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45241 a!3742)))))

(declare-fun b!1358989 () Bool)

(declare-fun Unit!44735 () Unit!44733)

(assert (=> b!1358989 (= e!771167 Unit!44735)))

(declare-fun b!1358990 () Bool)

(declare-fun res!903536 () Bool)

(assert (=> b!1358990 (=> (not res!903536) (not e!771168))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358990 (= res!903536 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358991 () Bool)

(assert (=> b!1358991 (= e!771168 false)))

(declare-fun lt!599486 () Unit!44733)

(assert (=> b!1358991 (= lt!599486 e!771167)))

(declare-fun c!127163 () Bool)

(assert (=> b!1358991 (= c!127163 (validKeyInArray!0 (select (arr!44691 a!3742) from!3120)))))

(declare-fun b!1358992 () Bool)

(declare-fun res!903537 () Bool)

(assert (=> b!1358992 (=> (not res!903537) (not e!771168))))

(assert (=> b!1358992 (= res!903537 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114502 res!903538) b!1358985))

(assert (= (and b!1358985 res!903539) b!1358982))

(assert (= (and b!1358982 res!903541) b!1358987))

(assert (= (and b!1358987 res!903542) b!1358983))

(assert (= (and b!1358983 res!903544) b!1358992))

(assert (= (and b!1358992 res!903537) b!1358986))

(assert (= (and b!1358986 res!903543) b!1358990))

(assert (= (and b!1358990 res!903536) b!1358988))

(assert (= (and b!1358988 res!903540) b!1358991))

(assert (= (and b!1358991 c!127163) b!1358984))

(assert (= (and b!1358991 (not c!127163)) b!1358989))

(declare-fun m!1244483 () Bool)

(assert (=> b!1358990 m!1244483))

(declare-fun m!1244485 () Bool)

(assert (=> start!114502 m!1244485))

(declare-fun m!1244487 () Bool)

(assert (=> b!1358984 m!1244487))

(declare-fun m!1244489 () Bool)

(assert (=> b!1358984 m!1244489))

(declare-fun m!1244491 () Bool)

(assert (=> b!1358984 m!1244491))

(declare-fun m!1244493 () Bool)

(assert (=> b!1358984 m!1244493))

(declare-fun m!1244495 () Bool)

(assert (=> b!1358984 m!1244495))

(assert (=> b!1358984 m!1244489))

(assert (=> b!1358984 m!1244491))

(declare-fun m!1244497 () Bool)

(assert (=> b!1358984 m!1244497))

(declare-fun m!1244499 () Bool)

(assert (=> b!1358987 m!1244499))

(declare-fun m!1244501 () Bool)

(assert (=> b!1358982 m!1244501))

(declare-fun m!1244503 () Bool)

(assert (=> b!1358983 m!1244503))

(assert (=> b!1358991 m!1244489))

(assert (=> b!1358991 m!1244489))

(declare-fun m!1244505 () Bool)

(assert (=> b!1358991 m!1244505))

(declare-fun m!1244507 () Bool)

(assert (=> b!1358992 m!1244507))

(declare-fun m!1244509 () Bool)

(assert (=> b!1358985 m!1244509))

(check-sat (not b!1358987) (not b!1358991) (not b!1358992) (not b!1358983) (not start!114502) (not b!1358984) (not b!1358985) (not b!1358982) (not b!1358990))
