; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115064 () Bool)

(assert start!115064)

(declare-fun b!1363468 () Bool)

(declare-fun res!907308 () Bool)

(declare-fun e!773260 () Bool)

(assert (=> b!1363468 (=> (not res!907308) (not e!773260))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92640 0))(
  ( (array!92641 (arr!44752 (Array (_ BitVec 32) (_ BitVec 64))) (size!45304 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92640)

(assert (=> b!1363468 (= res!907308 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45304 a!3742)))))

(declare-fun b!1363469 () Bool)

(declare-fun res!907307 () Bool)

(assert (=> b!1363469 (=> (not res!907307) (not e!773260))))

(declare-datatypes ((List!31871 0))(
  ( (Nil!31868) (Cons!31867 (h!33076 (_ BitVec 64)) (t!46554 List!31871)) )
))
(declare-fun acc!759 () List!31871)

(declare-fun contains!9491 (List!31871 (_ BitVec 64)) Bool)

(assert (=> b!1363469 (= res!907307 (not (contains!9491 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363470 () Bool)

(declare-fun res!907303 () Bool)

(assert (=> b!1363470 (=> (not res!907303) (not e!773260))))

(assert (=> b!1363470 (= res!907303 (not (contains!9491 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363471 () Bool)

(declare-fun res!907305 () Bool)

(assert (=> b!1363471 (=> (not res!907305) (not e!773260))))

(declare-fun arrayNoDuplicates!0 (array!92640 (_ BitVec 32) List!31871) Bool)

(assert (=> b!1363471 (= res!907305 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31868))))

(declare-fun b!1363472 () Bool)

(declare-fun e!773262 () Bool)

(assert (=> b!1363472 (= e!773260 e!773262)))

(declare-fun res!907306 () Bool)

(assert (=> b!1363472 (=> (not res!907306) (not e!773262))))

(declare-fun lt!600624 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363472 (= res!907306 (and (not (= from!3120 i!1404)) (not lt!600624) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44832 0))(
  ( (Unit!44833) )
))
(declare-fun lt!600621 () Unit!44832)

(declare-fun e!773263 () Unit!44832)

(assert (=> b!1363472 (= lt!600621 e!773263)))

(declare-fun c!127526 () Bool)

(assert (=> b!1363472 (= c!127526 lt!600624)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363472 (= lt!600624 (validKeyInArray!0 (select (arr!44752 a!3742) from!3120)))))

(declare-fun b!1363473 () Bool)

(declare-fun res!907310 () Bool)

(assert (=> b!1363473 (=> (not res!907310) (not e!773260))))

(declare-fun noDuplicate!2406 (List!31871) Bool)

(assert (=> b!1363473 (= res!907310 (noDuplicate!2406 acc!759))))

(declare-fun b!1363474 () Bool)

(declare-fun res!907309 () Bool)

(assert (=> b!1363474 (=> (not res!907309) (not e!773260))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363474 (= res!907309 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363475 () Bool)

(declare-fun lt!600625 () Unit!44832)

(assert (=> b!1363475 (= e!773263 lt!600625)))

(declare-fun lt!600623 () Unit!44832)

(declare-fun lemmaListSubSeqRefl!0 (List!31871) Unit!44832)

(assert (=> b!1363475 (= lt!600623 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!929 (List!31871 List!31871) Bool)

(assert (=> b!1363475 (subseq!929 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92640 List!31871 List!31871 (_ BitVec 32)) Unit!44832)

(declare-fun $colon$colon!934 (List!31871 (_ BitVec 64)) List!31871)

(assert (=> b!1363475 (= lt!600625 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!934 acc!759 (select (arr!44752 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363475 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363476 () Bool)

(declare-fun Unit!44834 () Unit!44832)

(assert (=> b!1363476 (= e!773263 Unit!44834)))

(declare-fun b!1363478 () Bool)

(declare-fun res!907301 () Bool)

(assert (=> b!1363478 (=> (not res!907301) (not e!773260))))

(assert (=> b!1363478 (= res!907301 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45304 a!3742))))))

(declare-fun b!1363479 () Bool)

(assert (=> b!1363479 (= e!773262 false)))

(declare-fun lt!600622 () Bool)

(assert (=> b!1363479 (= lt!600622 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363477 () Bool)

(declare-fun res!907302 () Bool)

(assert (=> b!1363477 (=> (not res!907302) (not e!773260))))

(assert (=> b!1363477 (= res!907302 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!907304 () Bool)

(assert (=> start!115064 (=> (not res!907304) (not e!773260))))

(assert (=> start!115064 (= res!907304 (and (bvslt (size!45304 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45304 a!3742))))))

(assert (=> start!115064 e!773260))

(assert (=> start!115064 true))

(declare-fun array_inv!33985 (array!92640) Bool)

(assert (=> start!115064 (array_inv!33985 a!3742)))

(assert (= (and start!115064 res!907304) b!1363473))

(assert (= (and b!1363473 res!907310) b!1363469))

(assert (= (and b!1363469 res!907307) b!1363470))

(assert (= (and b!1363470 res!907303) b!1363471))

(assert (= (and b!1363471 res!907305) b!1363477))

(assert (= (and b!1363477 res!907302) b!1363478))

(assert (= (and b!1363478 res!907301) b!1363474))

(assert (= (and b!1363474 res!907309) b!1363468))

(assert (= (and b!1363468 res!907308) b!1363472))

(assert (= (and b!1363472 c!127526) b!1363475))

(assert (= (and b!1363472 (not c!127526)) b!1363476))

(assert (= (and b!1363472 res!907306) b!1363479))

(declare-fun m!1247809 () Bool)

(assert (=> b!1363477 m!1247809))

(declare-fun m!1247811 () Bool)

(assert (=> b!1363474 m!1247811))

(declare-fun m!1247813 () Bool)

(assert (=> b!1363479 m!1247813))

(declare-fun m!1247815 () Bool)

(assert (=> b!1363471 m!1247815))

(declare-fun m!1247817 () Bool)

(assert (=> b!1363470 m!1247817))

(declare-fun m!1247819 () Bool)

(assert (=> b!1363469 m!1247819))

(declare-fun m!1247821 () Bool)

(assert (=> b!1363473 m!1247821))

(declare-fun m!1247823 () Bool)

(assert (=> start!115064 m!1247823))

(declare-fun m!1247825 () Bool)

(assert (=> b!1363472 m!1247825))

(assert (=> b!1363472 m!1247825))

(declare-fun m!1247827 () Bool)

(assert (=> b!1363472 m!1247827))

(declare-fun m!1247829 () Bool)

(assert (=> b!1363475 m!1247829))

(assert (=> b!1363475 m!1247825))

(declare-fun m!1247831 () Bool)

(assert (=> b!1363475 m!1247831))

(declare-fun m!1247833 () Bool)

(assert (=> b!1363475 m!1247833))

(assert (=> b!1363475 m!1247813))

(assert (=> b!1363475 m!1247825))

(assert (=> b!1363475 m!1247831))

(declare-fun m!1247835 () Bool)

(assert (=> b!1363475 m!1247835))

(check-sat (not b!1363477) (not b!1363475) (not start!115064) (not b!1363473) (not b!1363469) (not b!1363471) (not b!1363470) (not b!1363474) (not b!1363472) (not b!1363479))
(check-sat)
