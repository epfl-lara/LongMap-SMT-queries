; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114674 () Bool)

(assert start!114674)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!599678 () Bool)

(declare-fun e!771760 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun b!1360295 () Bool)

(assert (=> b!1360295 (= e!771760 (and (not (= from!3120 i!1404)) lt!599678 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44661 0))(
  ( (Unit!44662) )
))
(declare-fun lt!599680 () Unit!44661)

(declare-fun e!771758 () Unit!44661)

(assert (=> b!1360295 (= lt!599680 e!771758)))

(declare-fun c!127268 () Bool)

(assert (=> b!1360295 (= c!127268 lt!599678)))

(declare-datatypes ((array!92511 0))(
  ( (array!92512 (arr!44695 (Array (_ BitVec 32) (_ BitVec 64))) (size!45247 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92511)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360295 (= lt!599678 (validKeyInArray!0 (select (arr!44695 a!3742) from!3120)))))

(declare-fun b!1360296 () Bool)

(declare-fun res!904647 () Bool)

(assert (=> b!1360296 (=> (not res!904647) (not e!771760))))

(assert (=> b!1360296 (= res!904647 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45247 a!3742)))))

(declare-fun b!1360297 () Bool)

(declare-fun res!904651 () Bool)

(assert (=> b!1360297 (=> (not res!904651) (not e!771760))))

(declare-datatypes ((List!31814 0))(
  ( (Nil!31811) (Cons!31810 (h!33019 (_ BitVec 64)) (t!46482 List!31814)) )
))
(declare-fun acc!759 () List!31814)

(declare-fun contains!9434 (List!31814 (_ BitVec 64)) Bool)

(assert (=> b!1360297 (= res!904651 (not (contains!9434 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360298 () Bool)

(declare-fun lt!599677 () Unit!44661)

(assert (=> b!1360298 (= e!771758 lt!599677)))

(declare-fun lt!599679 () Unit!44661)

(declare-fun lemmaListSubSeqRefl!0 (List!31814) Unit!44661)

(assert (=> b!1360298 (= lt!599679 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!872 (List!31814 List!31814) Bool)

(assert (=> b!1360298 (subseq!872 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92511 List!31814 List!31814 (_ BitVec 32)) Unit!44661)

(declare-fun $colon$colon!877 (List!31814 (_ BitVec 64)) List!31814)

(assert (=> b!1360298 (= lt!599677 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!877 acc!759 (select (arr!44695 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92511 (_ BitVec 32) List!31814) Bool)

(assert (=> b!1360298 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360299 () Bool)

(declare-fun res!904648 () Bool)

(assert (=> b!1360299 (=> (not res!904648) (not e!771760))))

(assert (=> b!1360299 (= res!904648 (not (contains!9434 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360300 () Bool)

(declare-fun res!904644 () Bool)

(assert (=> b!1360300 (=> (not res!904644) (not e!771760))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360300 (= res!904644 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360301 () Bool)

(declare-fun res!904649 () Bool)

(assert (=> b!1360301 (=> (not res!904649) (not e!771760))))

(assert (=> b!1360301 (= res!904649 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45247 a!3742))))))

(declare-fun b!1360302 () Bool)

(declare-fun res!904646 () Bool)

(assert (=> b!1360302 (=> (not res!904646) (not e!771760))))

(declare-fun noDuplicate!2349 (List!31814) Bool)

(assert (=> b!1360302 (= res!904646 (noDuplicate!2349 acc!759))))

(declare-fun b!1360303 () Bool)

(declare-fun res!904645 () Bool)

(assert (=> b!1360303 (=> (not res!904645) (not e!771760))))

(assert (=> b!1360303 (= res!904645 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31811))))

(declare-fun res!904650 () Bool)

(assert (=> start!114674 (=> (not res!904650) (not e!771760))))

(assert (=> start!114674 (= res!904650 (and (bvslt (size!45247 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45247 a!3742))))))

(assert (=> start!114674 e!771760))

(assert (=> start!114674 true))

(declare-fun array_inv!33928 (array!92511) Bool)

(assert (=> start!114674 (array_inv!33928 a!3742)))

(declare-fun b!1360304 () Bool)

(declare-fun res!904652 () Bool)

(assert (=> b!1360304 (=> (not res!904652) (not e!771760))))

(assert (=> b!1360304 (= res!904652 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360305 () Bool)

(declare-fun Unit!44663 () Unit!44661)

(assert (=> b!1360305 (= e!771758 Unit!44663)))

(assert (= (and start!114674 res!904650) b!1360302))

(assert (= (and b!1360302 res!904646) b!1360297))

(assert (= (and b!1360297 res!904651) b!1360299))

(assert (= (and b!1360299 res!904648) b!1360303))

(assert (= (and b!1360303 res!904645) b!1360304))

(assert (= (and b!1360304 res!904652) b!1360301))

(assert (= (and b!1360301 res!904649) b!1360300))

(assert (= (and b!1360300 res!904644) b!1360296))

(assert (= (and b!1360296 res!904647) b!1360295))

(assert (= (and b!1360295 c!127268) b!1360298))

(assert (= (and b!1360295 (not c!127268)) b!1360305))

(declare-fun m!1245133 () Bool)

(assert (=> b!1360302 m!1245133))

(declare-fun m!1245135 () Bool)

(assert (=> b!1360299 m!1245135))

(declare-fun m!1245137 () Bool)

(assert (=> b!1360297 m!1245137))

(declare-fun m!1245139 () Bool)

(assert (=> b!1360304 m!1245139))

(declare-fun m!1245141 () Bool)

(assert (=> b!1360303 m!1245141))

(declare-fun m!1245143 () Bool)

(assert (=> b!1360300 m!1245143))

(declare-fun m!1245145 () Bool)

(assert (=> b!1360295 m!1245145))

(assert (=> b!1360295 m!1245145))

(declare-fun m!1245147 () Bool)

(assert (=> b!1360295 m!1245147))

(declare-fun m!1245149 () Bool)

(assert (=> b!1360298 m!1245149))

(assert (=> b!1360298 m!1245145))

(declare-fun m!1245151 () Bool)

(assert (=> b!1360298 m!1245151))

(declare-fun m!1245153 () Bool)

(assert (=> b!1360298 m!1245153))

(declare-fun m!1245155 () Bool)

(assert (=> b!1360298 m!1245155))

(assert (=> b!1360298 m!1245145))

(assert (=> b!1360298 m!1245151))

(declare-fun m!1245157 () Bool)

(assert (=> b!1360298 m!1245157))

(declare-fun m!1245159 () Bool)

(assert (=> start!114674 m!1245159))

(check-sat (not b!1360302) (not b!1360304) (not b!1360295) (not b!1360298) (not b!1360299) (not b!1360303) (not start!114674) (not b!1360297) (not b!1360300))
(check-sat)
