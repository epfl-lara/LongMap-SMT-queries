; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114078 () Bool)

(assert start!114078)

(declare-fun b!1354426 () Bool)

(declare-fun res!899501 () Bool)

(declare-fun e!769433 () Bool)

(assert (=> b!1354426 (=> (not res!899501) (not e!769433))))

(declare-datatypes ((List!31619 0))(
  ( (Nil!31616) (Cons!31615 (h!32824 (_ BitVec 64)) (t!46277 List!31619)) )
))
(declare-fun acc!759 () List!31619)

(declare-fun noDuplicate!2185 (List!31619) Bool)

(assert (=> b!1354426 (= res!899501 (noDuplicate!2185 acc!759))))

(declare-fun b!1354427 () Bool)

(declare-fun res!899494 () Bool)

(assert (=> b!1354427 (=> (not res!899494) (not e!769433))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354427 (= res!899494 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354428 () Bool)

(declare-fun res!899499 () Bool)

(assert (=> b!1354428 (=> (not res!899499) (not e!769433))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92260 0))(
  ( (array!92261 (arr!44578 (Array (_ BitVec 32) (_ BitVec 64))) (size!45128 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92260)

(assert (=> b!1354428 (= res!899499 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45128 a!3742))))))

(declare-fun b!1354429 () Bool)

(declare-fun res!899493 () Bool)

(assert (=> b!1354429 (=> (not res!899493) (not e!769433))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354429 (= res!899493 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45128 a!3742)))))

(declare-fun b!1354430 () Bool)

(declare-fun res!899498 () Bool)

(declare-fun e!769435 () Bool)

(assert (=> b!1354430 (=> (not res!899498) (not e!769435))))

(declare-fun lt!598251 () List!31619)

(assert (=> b!1354430 (= res!899498 (noDuplicate!2185 lt!598251))))

(declare-fun b!1354431 () Bool)

(declare-fun e!769431 () Bool)

(assert (=> b!1354431 (= e!769433 e!769431)))

(declare-fun res!899502 () Bool)

(assert (=> b!1354431 (=> (not res!899502) (not e!769431))))

(declare-fun lt!598247 () Bool)

(assert (=> b!1354431 (= res!899502 (and (not (= from!3120 i!1404)) lt!598247))))

(declare-datatypes ((Unit!44475 0))(
  ( (Unit!44476) )
))
(declare-fun lt!598252 () Unit!44475)

(declare-fun e!769432 () Unit!44475)

(assert (=> b!1354431 (= lt!598252 e!769432)))

(declare-fun c!126908 () Bool)

(assert (=> b!1354431 (= c!126908 lt!598247)))

(assert (=> b!1354431 (= lt!598247 (validKeyInArray!0 (select (arr!44578 a!3742) from!3120)))))

(declare-fun b!1354432 () Bool)

(declare-fun res!899490 () Bool)

(assert (=> b!1354432 (=> (not res!899490) (not e!769433))))

(declare-fun arrayNoDuplicates!0 (array!92260 (_ BitVec 32) List!31619) Bool)

(assert (=> b!1354432 (= res!899490 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31616))))

(declare-fun b!1354434 () Bool)

(declare-fun res!899495 () Bool)

(assert (=> b!1354434 (=> (not res!899495) (not e!769433))))

(assert (=> b!1354434 (= res!899495 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354435 () Bool)

(declare-fun Unit!44477 () Unit!44475)

(assert (=> b!1354435 (= e!769432 Unit!44477)))

(declare-fun b!1354436 () Bool)

(declare-fun res!899491 () Bool)

(assert (=> b!1354436 (=> (not res!899491) (not e!769433))))

(declare-fun contains!9328 (List!31619 (_ BitVec 64)) Bool)

(assert (=> b!1354436 (= res!899491 (not (contains!9328 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354437 () Bool)

(declare-fun res!899503 () Bool)

(assert (=> b!1354437 (=> (not res!899503) (not e!769435))))

(assert (=> b!1354437 (= res!899503 (not (contains!9328 lt!598251 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354438 () Bool)

(declare-fun lt!598249 () Unit!44475)

(assert (=> b!1354438 (= e!769432 lt!598249)))

(declare-fun lt!598248 () Unit!44475)

(declare-fun lemmaListSubSeqRefl!0 (List!31619) Unit!44475)

(assert (=> b!1354438 (= lt!598248 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!748 (List!31619 List!31619) Bool)

(assert (=> b!1354438 (subseq!748 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92260 List!31619 List!31619 (_ BitVec 32)) Unit!44475)

(declare-fun $colon$colon!763 (List!31619 (_ BitVec 64)) List!31619)

(assert (=> b!1354438 (= lt!598249 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!763 acc!759 (select (arr!44578 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354438 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354439 () Bool)

(declare-fun res!899497 () Bool)

(assert (=> b!1354439 (=> (not res!899497) (not e!769433))))

(assert (=> b!1354439 (= res!899497 (not (contains!9328 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354440 () Bool)

(declare-fun res!899500 () Bool)

(assert (=> b!1354440 (=> (not res!899500) (not e!769435))))

(assert (=> b!1354440 (= res!899500 (not (contains!9328 lt!598251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354441 () Bool)

(assert (=> b!1354441 (= e!769431 e!769435)))

(declare-fun res!899496 () Bool)

(assert (=> b!1354441 (=> (not res!899496) (not e!769435))))

(assert (=> b!1354441 (= res!899496 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354441 (= lt!598251 ($colon$colon!763 acc!759 (select (arr!44578 a!3742) from!3120)))))

(declare-fun b!1354433 () Bool)

(assert (=> b!1354433 (= e!769435 false)))

(declare-fun lt!598250 () Bool)

(assert (=> b!1354433 (= lt!598250 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598251))))

(declare-fun res!899492 () Bool)

(assert (=> start!114078 (=> (not res!899492) (not e!769433))))

(assert (=> start!114078 (= res!899492 (and (bvslt (size!45128 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45128 a!3742))))))

(assert (=> start!114078 e!769433))

(assert (=> start!114078 true))

(declare-fun array_inv!33606 (array!92260) Bool)

(assert (=> start!114078 (array_inv!33606 a!3742)))

(assert (= (and start!114078 res!899492) b!1354426))

(assert (= (and b!1354426 res!899501) b!1354439))

(assert (= (and b!1354439 res!899497) b!1354436))

(assert (= (and b!1354436 res!899491) b!1354432))

(assert (= (and b!1354432 res!899490) b!1354434))

(assert (= (and b!1354434 res!899495) b!1354428))

(assert (= (and b!1354428 res!899499) b!1354427))

(assert (= (and b!1354427 res!899494) b!1354429))

(assert (= (and b!1354429 res!899493) b!1354431))

(assert (= (and b!1354431 c!126908) b!1354438))

(assert (= (and b!1354431 (not c!126908)) b!1354435))

(assert (= (and b!1354431 res!899502) b!1354441))

(assert (= (and b!1354441 res!899496) b!1354430))

(assert (= (and b!1354430 res!899498) b!1354440))

(assert (= (and b!1354440 res!899500) b!1354437))

(assert (= (and b!1354437 res!899503) b!1354433))

(declare-fun m!1240801 () Bool)

(assert (=> b!1354427 m!1240801))

(declare-fun m!1240803 () Bool)

(assert (=> b!1354431 m!1240803))

(assert (=> b!1354431 m!1240803))

(declare-fun m!1240805 () Bool)

(assert (=> b!1354431 m!1240805))

(declare-fun m!1240807 () Bool)

(assert (=> b!1354437 m!1240807))

(assert (=> b!1354441 m!1240803))

(assert (=> b!1354441 m!1240803))

(declare-fun m!1240809 () Bool)

(assert (=> b!1354441 m!1240809))

(declare-fun m!1240811 () Bool)

(assert (=> b!1354439 m!1240811))

(declare-fun m!1240813 () Bool)

(assert (=> b!1354432 m!1240813))

(declare-fun m!1240815 () Bool)

(assert (=> b!1354434 m!1240815))

(declare-fun m!1240817 () Bool)

(assert (=> b!1354440 m!1240817))

(declare-fun m!1240819 () Bool)

(assert (=> b!1354438 m!1240819))

(assert (=> b!1354438 m!1240803))

(assert (=> b!1354438 m!1240809))

(declare-fun m!1240821 () Bool)

(assert (=> b!1354438 m!1240821))

(declare-fun m!1240823 () Bool)

(assert (=> b!1354438 m!1240823))

(assert (=> b!1354438 m!1240803))

(assert (=> b!1354438 m!1240809))

(declare-fun m!1240825 () Bool)

(assert (=> b!1354438 m!1240825))

(declare-fun m!1240827 () Bool)

(assert (=> start!114078 m!1240827))

(declare-fun m!1240829 () Bool)

(assert (=> b!1354436 m!1240829))

(declare-fun m!1240831 () Bool)

(assert (=> b!1354430 m!1240831))

(declare-fun m!1240833 () Bool)

(assert (=> b!1354426 m!1240833))

(declare-fun m!1240835 () Bool)

(assert (=> b!1354433 m!1240835))

(push 1)

