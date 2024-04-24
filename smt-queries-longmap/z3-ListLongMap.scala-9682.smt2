; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114454 () Bool)

(assert start!114454)

(declare-fun b!1358317 () Bool)

(declare-fun res!902295 () Bool)

(declare-fun e!771076 () Bool)

(assert (=> b!1358317 (=> (not res!902295) (not e!771076))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358317 (= res!902295 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358318 () Bool)

(declare-fun res!902293 () Bool)

(assert (=> b!1358318 (=> (not res!902293) (not e!771076))))

(declare-datatypes ((List!31735 0))(
  ( (Nil!31732) (Cons!31731 (h!32949 (_ BitVec 64)) (t!46385 List!31735)) )
))
(declare-fun acc!759 () List!31735)

(declare-fun contains!9447 (List!31735 (_ BitVec 64)) Bool)

(assert (=> b!1358318 (= res!902293 (not (contains!9447 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358319 () Bool)

(declare-fun res!902294 () Bool)

(assert (=> b!1358319 (=> (not res!902294) (not e!771076))))

(declare-datatypes ((array!92527 0))(
  ( (array!92528 (arr!44707 (Array (_ BitVec 32) (_ BitVec 64))) (size!45258 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92527)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92527 (_ BitVec 32) List!31735) Bool)

(assert (=> b!1358319 (= res!902294 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358320 () Bool)

(assert (=> b!1358320 (= e!771076 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun subseq!806 (List!31735 List!31735) Bool)

(assert (=> b!1358320 (subseq!806 acc!759 acc!759)))

(declare-datatypes ((Unit!44582 0))(
  ( (Unit!44583) )
))
(declare-fun lt!599586 () Unit!44582)

(declare-fun lemmaListSubSeqRefl!0 (List!31735) Unit!44582)

(assert (=> b!1358320 (= lt!599586 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun res!902301 () Bool)

(assert (=> start!114454 (=> (not res!902301) (not e!771076))))

(assert (=> start!114454 (= res!902301 (and (bvslt (size!45258 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45258 a!3742))))))

(assert (=> start!114454 e!771076))

(assert (=> start!114454 true))

(declare-fun array_inv!33988 (array!92527) Bool)

(assert (=> start!114454 (array_inv!33988 a!3742)))

(declare-fun b!1358321 () Bool)

(declare-fun res!902300 () Bool)

(assert (=> b!1358321 (=> (not res!902300) (not e!771076))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358321 (= res!902300 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45258 a!3742))))))

(declare-fun b!1358322 () Bool)

(declare-fun res!902298 () Bool)

(assert (=> b!1358322 (=> (not res!902298) (not e!771076))))

(assert (=> b!1358322 (= res!902298 (validKeyInArray!0 (select (arr!44707 a!3742) from!3120)))))

(declare-fun b!1358323 () Bool)

(declare-fun res!902297 () Bool)

(assert (=> b!1358323 (=> (not res!902297) (not e!771076))))

(assert (=> b!1358323 (= res!902297 (not (contains!9447 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358324 () Bool)

(declare-fun res!902292 () Bool)

(assert (=> b!1358324 (=> (not res!902292) (not e!771076))))

(assert (=> b!1358324 (= res!902292 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31732))))

(declare-fun b!1358325 () Bool)

(declare-fun res!902296 () Bool)

(assert (=> b!1358325 (=> (not res!902296) (not e!771076))))

(declare-fun noDuplicate!2278 (List!31735) Bool)

(assert (=> b!1358325 (= res!902296 (noDuplicate!2278 acc!759))))

(declare-fun b!1358326 () Bool)

(declare-fun res!902299 () Bool)

(assert (=> b!1358326 (=> (not res!902299) (not e!771076))))

(assert (=> b!1358326 (= res!902299 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45258 a!3742)))))

(assert (= (and start!114454 res!902301) b!1358325))

(assert (= (and b!1358325 res!902296) b!1358323))

(assert (= (and b!1358323 res!902297) b!1358318))

(assert (= (and b!1358318 res!902293) b!1358324))

(assert (= (and b!1358324 res!902292) b!1358319))

(assert (= (and b!1358319 res!902294) b!1358321))

(assert (= (and b!1358321 res!902300) b!1358317))

(assert (= (and b!1358317 res!902295) b!1358326))

(assert (= (and b!1358326 res!902299) b!1358322))

(assert (= (and b!1358322 res!902298) b!1358320))

(declare-fun m!1244461 () Bool)

(assert (=> b!1358320 m!1244461))

(declare-fun m!1244463 () Bool)

(assert (=> b!1358320 m!1244463))

(declare-fun m!1244465 () Bool)

(assert (=> b!1358323 m!1244465))

(declare-fun m!1244467 () Bool)

(assert (=> b!1358318 m!1244467))

(declare-fun m!1244469 () Bool)

(assert (=> start!114454 m!1244469))

(declare-fun m!1244471 () Bool)

(assert (=> b!1358322 m!1244471))

(assert (=> b!1358322 m!1244471))

(declare-fun m!1244473 () Bool)

(assert (=> b!1358322 m!1244473))

(declare-fun m!1244475 () Bool)

(assert (=> b!1358319 m!1244475))

(declare-fun m!1244477 () Bool)

(assert (=> b!1358325 m!1244477))

(declare-fun m!1244479 () Bool)

(assert (=> b!1358324 m!1244479))

(declare-fun m!1244481 () Bool)

(assert (=> b!1358317 m!1244481))

(check-sat (not b!1358323) (not b!1358317) (not b!1358318) (not b!1358322) (not b!1358325) (not b!1358319) (not b!1358320) (not start!114454) (not b!1358324))
(check-sat)
