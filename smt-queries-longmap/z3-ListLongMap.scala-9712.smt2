; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115108 () Bool)

(assert start!115108)

(declare-fun b!1363200 () Bool)

(declare-fun res!906498 () Bool)

(declare-fun e!773430 () Bool)

(assert (=> b!1363200 (=> (not res!906498) (not e!773430))))

(declare-datatypes ((List!31825 0))(
  ( (Nil!31822) (Cons!31821 (h!33039 (_ BitVec 64)) (t!46502 List!31825)) )
))
(declare-fun lt!600798 () List!31825)

(declare-datatypes ((array!92734 0))(
  ( (array!92735 (arr!44797 (Array (_ BitVec 32) (_ BitVec 64))) (size!45348 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92734)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92734 (_ BitVec 32) List!31825) Bool)

(assert (=> b!1363200 (= res!906498 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600798))))

(declare-fun b!1363201 () Bool)

(declare-fun res!906501 () Bool)

(declare-fun e!773431 () Bool)

(assert (=> b!1363201 (=> (not res!906501) (not e!773431))))

(declare-fun acc!759 () List!31825)

(declare-fun contains!9537 (List!31825 (_ BitVec 64)) Bool)

(assert (=> b!1363201 (= res!906501 (not (contains!9537 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363202 () Bool)

(declare-fun res!906490 () Bool)

(assert (=> b!1363202 (=> (not res!906490) (not e!773431))))

(declare-fun noDuplicate!2368 (List!31825) Bool)

(assert (=> b!1363202 (= res!906490 (noDuplicate!2368 acc!759))))

(declare-fun res!906494 () Bool)

(assert (=> start!115108 (=> (not res!906494) (not e!773431))))

(assert (=> start!115108 (= res!906494 (and (bvslt (size!45348 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45348 a!3742))))))

(assert (=> start!115108 e!773431))

(assert (=> start!115108 true))

(declare-fun array_inv!34078 (array!92734) Bool)

(assert (=> start!115108 (array_inv!34078 a!3742)))

(declare-fun b!1363203 () Bool)

(declare-fun res!906487 () Bool)

(assert (=> b!1363203 (=> (not res!906487) (not e!773431))))

(assert (=> b!1363203 (= res!906487 (not (contains!9537 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363204 () Bool)

(declare-fun res!906496 () Bool)

(assert (=> b!1363204 (=> (not res!906496) (not e!773431))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363204 (= res!906496 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45348 a!3742))))))

(declare-fun b!1363205 () Bool)

(declare-fun res!906495 () Bool)

(assert (=> b!1363205 (=> (not res!906495) (not e!773431))))

(assert (=> b!1363205 (= res!906495 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45348 a!3742)))))

(declare-fun b!1363206 () Bool)

(declare-datatypes ((Unit!44831 0))(
  ( (Unit!44832) )
))
(declare-fun e!773434 () Unit!44831)

(declare-fun Unit!44833 () Unit!44831)

(assert (=> b!1363206 (= e!773434 Unit!44833)))

(declare-fun b!1363207 () Bool)

(declare-fun e!773433 () Bool)

(assert (=> b!1363207 (= e!773431 e!773433)))

(declare-fun res!906497 () Bool)

(assert (=> b!1363207 (=> (not res!906497) (not e!773433))))

(declare-fun lt!600795 () Bool)

(assert (=> b!1363207 (= res!906497 (and (not (= from!3120 i!1404)) lt!600795))))

(declare-fun lt!600797 () Unit!44831)

(assert (=> b!1363207 (= lt!600797 e!773434)))

(declare-fun c!127804 () Bool)

(assert (=> b!1363207 (= c!127804 lt!600795)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363207 (= lt!600795 (validKeyInArray!0 (select (arr!44797 a!3742) from!3120)))))

(declare-fun b!1363208 () Bool)

(declare-fun res!906499 () Bool)

(assert (=> b!1363208 (=> (not res!906499) (not e!773430))))

(assert (=> b!1363208 (= res!906499 (not (contains!9537 lt!600798 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363209 () Bool)

(declare-fun res!906493 () Bool)

(assert (=> b!1363209 (=> (not res!906493) (not e!773431))))

(assert (=> b!1363209 (= res!906493 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363210 () Bool)

(declare-fun res!906500 () Bool)

(assert (=> b!1363210 (=> (not res!906500) (not e!773430))))

(assert (=> b!1363210 (= res!906500 (not (contains!9537 lt!600798 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363211 () Bool)

(declare-fun res!906488 () Bool)

(assert (=> b!1363211 (=> (not res!906488) (not e!773430))))

(assert (=> b!1363211 (= res!906488 (noDuplicate!2368 lt!600798))))

(declare-fun b!1363212 () Bool)

(declare-fun res!906489 () Bool)

(assert (=> b!1363212 (=> (not res!906489) (not e!773431))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363212 (= res!906489 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363213 () Bool)

(assert (=> b!1363213 (= e!773430 (bvsge (bvsub (size!45348 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45348 a!3742) from!3120)))))

(declare-fun b!1363214 () Bool)

(declare-fun lt!600796 () Unit!44831)

(assert (=> b!1363214 (= e!773434 lt!600796)))

(declare-fun lt!600794 () Unit!44831)

(declare-fun lemmaListSubSeqRefl!0 (List!31825) Unit!44831)

(assert (=> b!1363214 (= lt!600794 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!896 (List!31825 List!31825) Bool)

(assert (=> b!1363214 (subseq!896 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92734 List!31825 List!31825 (_ BitVec 32)) Unit!44831)

(declare-fun $colon$colon!898 (List!31825 (_ BitVec 64)) List!31825)

(assert (=> b!1363214 (= lt!600796 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!898 acc!759 (select (arr!44797 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363214 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363215 () Bool)

(declare-fun res!906491 () Bool)

(assert (=> b!1363215 (=> (not res!906491) (not e!773431))))

(assert (=> b!1363215 (= res!906491 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31822))))

(declare-fun b!1363216 () Bool)

(assert (=> b!1363216 (= e!773433 e!773430)))

(declare-fun res!906492 () Bool)

(assert (=> b!1363216 (=> (not res!906492) (not e!773430))))

(assert (=> b!1363216 (= res!906492 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1363216 (= lt!600798 ($colon$colon!898 acc!759 (select (arr!44797 a!3742) from!3120)))))

(assert (= (and start!115108 res!906494) b!1363202))

(assert (= (and b!1363202 res!906490) b!1363201))

(assert (= (and b!1363201 res!906501) b!1363203))

(assert (= (and b!1363203 res!906487) b!1363215))

(assert (= (and b!1363215 res!906491) b!1363209))

(assert (= (and b!1363209 res!906493) b!1363204))

(assert (= (and b!1363204 res!906496) b!1363212))

(assert (= (and b!1363212 res!906489) b!1363205))

(assert (= (and b!1363205 res!906495) b!1363207))

(assert (= (and b!1363207 c!127804) b!1363214))

(assert (= (and b!1363207 (not c!127804)) b!1363206))

(assert (= (and b!1363207 res!906497) b!1363216))

(assert (= (and b!1363216 res!906492) b!1363211))

(assert (= (and b!1363211 res!906488) b!1363210))

(assert (= (and b!1363210 res!906500) b!1363208))

(assert (= (and b!1363208 res!906499) b!1363200))

(assert (= (and b!1363200 res!906498) b!1363213))

(declare-fun m!1248517 () Bool)

(assert (=> b!1363207 m!1248517))

(assert (=> b!1363207 m!1248517))

(declare-fun m!1248519 () Bool)

(assert (=> b!1363207 m!1248519))

(declare-fun m!1248521 () Bool)

(assert (=> b!1363215 m!1248521))

(declare-fun m!1248523 () Bool)

(assert (=> b!1363200 m!1248523))

(declare-fun m!1248525 () Bool)

(assert (=> b!1363201 m!1248525))

(declare-fun m!1248527 () Bool)

(assert (=> b!1363202 m!1248527))

(assert (=> b!1363216 m!1248517))

(assert (=> b!1363216 m!1248517))

(declare-fun m!1248529 () Bool)

(assert (=> b!1363216 m!1248529))

(declare-fun m!1248531 () Bool)

(assert (=> b!1363203 m!1248531))

(declare-fun m!1248533 () Bool)

(assert (=> b!1363212 m!1248533))

(declare-fun m!1248535 () Bool)

(assert (=> b!1363210 m!1248535))

(declare-fun m!1248537 () Bool)

(assert (=> b!1363208 m!1248537))

(declare-fun m!1248539 () Bool)

(assert (=> b!1363209 m!1248539))

(declare-fun m!1248541 () Bool)

(assert (=> b!1363214 m!1248541))

(assert (=> b!1363214 m!1248517))

(assert (=> b!1363214 m!1248529))

(declare-fun m!1248543 () Bool)

(assert (=> b!1363214 m!1248543))

(declare-fun m!1248545 () Bool)

(assert (=> b!1363214 m!1248545))

(assert (=> b!1363214 m!1248517))

(assert (=> b!1363214 m!1248529))

(declare-fun m!1248547 () Bool)

(assert (=> b!1363214 m!1248547))

(declare-fun m!1248549 () Bool)

(assert (=> start!115108 m!1248549))

(declare-fun m!1248551 () Bool)

(assert (=> b!1363211 m!1248551))

(check-sat (not b!1363212) (not b!1363210) (not b!1363203) (not b!1363208) (not b!1363202) (not b!1363209) (not b!1363211) (not b!1363215) (not b!1363216) (not b!1363200) (not b!1363214) (not start!115108) (not b!1363201) (not b!1363207))
(check-sat)
