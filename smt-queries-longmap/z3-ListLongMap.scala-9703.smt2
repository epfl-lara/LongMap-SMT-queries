; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114670 () Bool)

(assert start!114670)

(declare-fun b!1360299 () Bool)

(declare-fun res!904625 () Bool)

(declare-fun e!771773 () Bool)

(assert (=> b!1360299 (=> (not res!904625) (not e!771773))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360299 (= res!904625 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360300 () Bool)

(declare-datatypes ((Unit!44814 0))(
  ( (Unit!44815) )
))
(declare-fun e!771774 () Unit!44814)

(declare-fun lt!599843 () Unit!44814)

(assert (=> b!1360300 (= e!771774 lt!599843)))

(declare-fun lt!599844 () Unit!44814)

(declare-datatypes ((List!31759 0))(
  ( (Nil!31756) (Cons!31755 (h!32964 (_ BitVec 64)) (t!46435 List!31759)) )
))
(declare-fun acc!759 () List!31759)

(declare-fun lemmaListSubSeqRefl!0 (List!31759) Unit!44814)

(assert (=> b!1360300 (= lt!599844 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!870 (List!31759 List!31759) Bool)

(assert (=> b!1360300 (subseq!870 acc!759 acc!759)))

(declare-datatypes ((array!92558 0))(
  ( (array!92559 (arr!44718 (Array (_ BitVec 32) (_ BitVec 64))) (size!45268 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92558)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92558 List!31759 List!31759 (_ BitVec 32)) Unit!44814)

(declare-fun $colon$colon!873 (List!31759 (_ BitVec 64)) List!31759)

(assert (=> b!1360300 (= lt!599843 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!873 acc!759 (select (arr!44718 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92558 (_ BitVec 32) List!31759) Bool)

(assert (=> b!1360300 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360301 () Bool)

(declare-fun Unit!44816 () Unit!44814)

(assert (=> b!1360301 (= e!771774 Unit!44816)))

(declare-fun b!1360302 () Bool)

(declare-fun res!904627 () Bool)

(assert (=> b!1360302 (=> (not res!904627) (not e!771773))))

(declare-fun contains!9468 (List!31759 (_ BitVec 64)) Bool)

(assert (=> b!1360302 (= res!904627 (not (contains!9468 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360303 () Bool)

(declare-fun res!904624 () Bool)

(assert (=> b!1360303 (=> (not res!904624) (not e!771773))))

(assert (=> b!1360303 (= res!904624 (not (contains!9468 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360304 () Bool)

(assert (=> b!1360304 (= e!771773 false)))

(declare-fun lt!599845 () Unit!44814)

(assert (=> b!1360304 (= lt!599845 e!771774)))

(declare-fun c!127280 () Bool)

(assert (=> b!1360304 (= c!127280 (validKeyInArray!0 (select (arr!44718 a!3742) from!3120)))))

(declare-fun b!1360305 () Bool)

(declare-fun res!904620 () Bool)

(assert (=> b!1360305 (=> (not res!904620) (not e!771773))))

(assert (=> b!1360305 (= res!904620 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45268 a!3742)))))

(declare-fun b!1360306 () Bool)

(declare-fun res!904623 () Bool)

(assert (=> b!1360306 (=> (not res!904623) (not e!771773))))

(declare-fun noDuplicate!2325 (List!31759) Bool)

(assert (=> b!1360306 (= res!904623 (noDuplicate!2325 acc!759))))

(declare-fun res!904619 () Bool)

(assert (=> start!114670 (=> (not res!904619) (not e!771773))))

(assert (=> start!114670 (= res!904619 (and (bvslt (size!45268 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45268 a!3742))))))

(assert (=> start!114670 e!771773))

(assert (=> start!114670 true))

(declare-fun array_inv!33746 (array!92558) Bool)

(assert (=> start!114670 (array_inv!33746 a!3742)))

(declare-fun b!1360307 () Bool)

(declare-fun res!904626 () Bool)

(assert (=> b!1360307 (=> (not res!904626) (not e!771773))))

(assert (=> b!1360307 (= res!904626 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360308 () Bool)

(declare-fun res!904622 () Bool)

(assert (=> b!1360308 (=> (not res!904622) (not e!771773))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360308 (= res!904622 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45268 a!3742))))))

(declare-fun b!1360309 () Bool)

(declare-fun res!904621 () Bool)

(assert (=> b!1360309 (=> (not res!904621) (not e!771773))))

(assert (=> b!1360309 (= res!904621 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31756))))

(assert (= (and start!114670 res!904619) b!1360306))

(assert (= (and b!1360306 res!904623) b!1360303))

(assert (= (and b!1360303 res!904624) b!1360302))

(assert (= (and b!1360302 res!904627) b!1360309))

(assert (= (and b!1360309 res!904621) b!1360307))

(assert (= (and b!1360307 res!904626) b!1360308))

(assert (= (and b!1360308 res!904622) b!1360299))

(assert (= (and b!1360299 res!904625) b!1360305))

(assert (= (and b!1360305 res!904620) b!1360304))

(assert (= (and b!1360304 c!127280) b!1360300))

(assert (= (and b!1360304 (not c!127280)) b!1360301))

(declare-fun m!1245593 () Bool)

(assert (=> b!1360307 m!1245593))

(declare-fun m!1245595 () Bool)

(assert (=> b!1360299 m!1245595))

(declare-fun m!1245597 () Bool)

(assert (=> b!1360300 m!1245597))

(declare-fun m!1245599 () Bool)

(assert (=> b!1360300 m!1245599))

(declare-fun m!1245601 () Bool)

(assert (=> b!1360300 m!1245601))

(declare-fun m!1245603 () Bool)

(assert (=> b!1360300 m!1245603))

(declare-fun m!1245605 () Bool)

(assert (=> b!1360300 m!1245605))

(assert (=> b!1360300 m!1245599))

(assert (=> b!1360300 m!1245601))

(declare-fun m!1245607 () Bool)

(assert (=> b!1360300 m!1245607))

(assert (=> b!1360304 m!1245599))

(assert (=> b!1360304 m!1245599))

(declare-fun m!1245609 () Bool)

(assert (=> b!1360304 m!1245609))

(declare-fun m!1245611 () Bool)

(assert (=> b!1360306 m!1245611))

(declare-fun m!1245613 () Bool)

(assert (=> start!114670 m!1245613))

(declare-fun m!1245615 () Bool)

(assert (=> b!1360303 m!1245615))

(declare-fun m!1245617 () Bool)

(assert (=> b!1360309 m!1245617))

(declare-fun m!1245619 () Bool)

(assert (=> b!1360302 m!1245619))

(check-sat (not b!1360307) (not b!1360306) (not b!1360299) (not start!114670) (not b!1360303) (not b!1360300) (not b!1360302) (not b!1360309) (not b!1360304))
