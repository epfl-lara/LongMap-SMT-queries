; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114128 () Bool)

(assert start!114128)

(declare-fun b!1355440 () Bool)

(declare-fun res!900404 () Bool)

(declare-fun e!769738 () Bool)

(assert (=> b!1355440 (=> (not res!900404) (not e!769738))))

(declare-datatypes ((List!31697 0))(
  ( (Nil!31694) (Cons!31693 (h!32902 (_ BitVec 64)) (t!46347 List!31697)) )
))
(declare-fun acc!759 () List!31697)

(declare-fun noDuplicate!2232 (List!31697) Bool)

(assert (=> b!1355440 (= res!900404 (noDuplicate!2232 acc!759))))

(declare-fun b!1355441 () Bool)

(declare-fun res!900401 () Bool)

(assert (=> b!1355441 (=> (not res!900401) (not e!769738))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355441 (= res!900401 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355442 () Bool)

(declare-fun res!900399 () Bool)

(assert (=> b!1355442 (=> (not res!900399) (not e!769738))))

(declare-fun contains!9317 (List!31697 (_ BitVec 64)) Bool)

(assert (=> b!1355442 (= res!900399 (not (contains!9317 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355443 () Bool)

(declare-fun res!900400 () Bool)

(assert (=> b!1355443 (=> (not res!900400) (not e!769738))))

(declare-datatypes ((array!92259 0))(
  ( (array!92260 (arr!44578 (Array (_ BitVec 32) (_ BitVec 64))) (size!45130 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92259)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92259 (_ BitVec 32) List!31697) Bool)

(assert (=> b!1355443 (= res!900400 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355445 () Bool)

(declare-datatypes ((Unit!44391 0))(
  ( (Unit!44392) )
))
(declare-fun e!769737 () Unit!44391)

(declare-fun lt!598473 () Unit!44391)

(assert (=> b!1355445 (= e!769737 lt!598473)))

(declare-fun lt!598475 () Unit!44391)

(declare-fun lemmaListSubSeqRefl!0 (List!31697) Unit!44391)

(assert (=> b!1355445 (= lt!598475 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!773 (List!31697 List!31697) Bool)

(assert (=> b!1355445 (subseq!773 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92259 List!31697 List!31697 (_ BitVec 32)) Unit!44391)

(declare-fun $colon$colon!790 (List!31697 (_ BitVec 64)) List!31697)

(assert (=> b!1355445 (= lt!598473 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!790 acc!759 (select (arr!44578 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355445 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355446 () Bool)

(declare-fun res!900397 () Bool)

(assert (=> b!1355446 (=> (not res!900397) (not e!769738))))

(assert (=> b!1355446 (= res!900397 (not (contains!9317 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355447 () Bool)

(declare-fun e!769735 () Bool)

(assert (=> b!1355447 (= e!769735 false)))

(declare-fun lt!598477 () Bool)

(assert (=> b!1355447 (= lt!598477 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!900403 () Bool)

(assert (=> start!114128 (=> (not res!900403) (not e!769738))))

(assert (=> start!114128 (= res!900403 (and (bvslt (size!45130 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45130 a!3742))))))

(assert (=> start!114128 e!769738))

(assert (=> start!114128 true))

(declare-fun array_inv!33811 (array!92259) Bool)

(assert (=> start!114128 (array_inv!33811 a!3742)))

(declare-fun b!1355444 () Bool)

(assert (=> b!1355444 (= e!769738 e!769735)))

(declare-fun res!900395 () Bool)

(assert (=> b!1355444 (=> (not res!900395) (not e!769735))))

(declare-fun lt!598476 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355444 (= res!900395 (and (not (= from!3120 i!1404)) (not lt!598476) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598474 () Unit!44391)

(assert (=> b!1355444 (= lt!598474 e!769737)))

(declare-fun c!126965 () Bool)

(assert (=> b!1355444 (= c!126965 lt!598476)))

(assert (=> b!1355444 (= lt!598476 (validKeyInArray!0 (select (arr!44578 a!3742) from!3120)))))

(declare-fun b!1355448 () Bool)

(declare-fun res!900398 () Bool)

(assert (=> b!1355448 (=> (not res!900398) (not e!769738))))

(assert (=> b!1355448 (= res!900398 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45130 a!3742)))))

(declare-fun b!1355449 () Bool)

(declare-fun Unit!44393 () Unit!44391)

(assert (=> b!1355449 (= e!769737 Unit!44393)))

(declare-fun b!1355450 () Bool)

(declare-fun res!900396 () Bool)

(assert (=> b!1355450 (=> (not res!900396) (not e!769738))))

(assert (=> b!1355450 (= res!900396 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31694))))

(declare-fun b!1355451 () Bool)

(declare-fun res!900402 () Bool)

(assert (=> b!1355451 (=> (not res!900402) (not e!769738))))

(assert (=> b!1355451 (= res!900402 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45130 a!3742))))))

(assert (= (and start!114128 res!900403) b!1355440))

(assert (= (and b!1355440 res!900404) b!1355442))

(assert (= (and b!1355442 res!900399) b!1355446))

(assert (= (and b!1355446 res!900397) b!1355450))

(assert (= (and b!1355450 res!900396) b!1355443))

(assert (= (and b!1355443 res!900400) b!1355451))

(assert (= (and b!1355451 res!900402) b!1355441))

(assert (= (and b!1355441 res!900401) b!1355448))

(assert (= (and b!1355448 res!900398) b!1355444))

(assert (= (and b!1355444 c!126965) b!1355445))

(assert (= (and b!1355444 (not c!126965)) b!1355449))

(assert (= (and b!1355444 res!900395) b!1355447))

(declare-fun m!1241161 () Bool)

(assert (=> b!1355443 m!1241161))

(declare-fun m!1241163 () Bool)

(assert (=> start!114128 m!1241163))

(declare-fun m!1241165 () Bool)

(assert (=> b!1355441 m!1241165))

(declare-fun m!1241167 () Bool)

(assert (=> b!1355450 m!1241167))

(declare-fun m!1241169 () Bool)

(assert (=> b!1355446 m!1241169))

(declare-fun m!1241171 () Bool)

(assert (=> b!1355440 m!1241171))

(declare-fun m!1241173 () Bool)

(assert (=> b!1355447 m!1241173))

(declare-fun m!1241175 () Bool)

(assert (=> b!1355442 m!1241175))

(declare-fun m!1241177 () Bool)

(assert (=> b!1355445 m!1241177))

(declare-fun m!1241179 () Bool)

(assert (=> b!1355445 m!1241179))

(declare-fun m!1241181 () Bool)

(assert (=> b!1355445 m!1241181))

(declare-fun m!1241183 () Bool)

(assert (=> b!1355445 m!1241183))

(assert (=> b!1355445 m!1241173))

(assert (=> b!1355445 m!1241179))

(assert (=> b!1355445 m!1241181))

(declare-fun m!1241185 () Bool)

(assert (=> b!1355445 m!1241185))

(assert (=> b!1355444 m!1241179))

(assert (=> b!1355444 m!1241179))

(declare-fun m!1241187 () Bool)

(assert (=> b!1355444 m!1241187))

(check-sat (not b!1355450) (not b!1355447) (not start!114128) (not b!1355441) (not b!1355444) (not b!1355443) (not b!1355445) (not b!1355446) (not b!1355440) (not b!1355442))
(check-sat)
