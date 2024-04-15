; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115148 () Bool)

(assert start!115148)

(declare-fun b!1364105 () Bool)

(declare-fun res!907830 () Bool)

(declare-fun e!773571 () Bool)

(assert (=> b!1364105 (=> (not res!907830) (not e!773571))))

(declare-datatypes ((array!92667 0))(
  ( (array!92668 (arr!44764 (Array (_ BitVec 32) (_ BitVec 64))) (size!45316 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92667)

(declare-datatypes ((List!31883 0))(
  ( (Nil!31880) (Cons!31879 (h!33088 (_ BitVec 64)) (t!46569 List!31883)) )
))
(declare-fun arrayNoDuplicates!0 (array!92667 (_ BitVec 32) List!31883) Bool)

(assert (=> b!1364105 (= res!907830 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31880))))

(declare-fun b!1364106 () Bool)

(declare-fun res!907828 () Bool)

(assert (=> b!1364106 (=> (not res!907828) (not e!773571))))

(declare-fun acc!759 () List!31883)

(declare-fun noDuplicate!2418 (List!31883) Bool)

(assert (=> b!1364106 (= res!907828 (noDuplicate!2418 acc!759))))

(declare-fun b!1364107 () Bool)

(declare-fun res!907832 () Bool)

(assert (=> b!1364107 (=> (not res!907832) (not e!773571))))

(declare-fun contains!9503 (List!31883 (_ BitVec 64)) Bool)

(assert (=> b!1364107 (= res!907832 (not (contains!9503 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907829 () Bool)

(assert (=> start!115148 (=> (not res!907829) (not e!773571))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!115148 (= res!907829 (and (bvslt (size!45316 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45316 a!3742))))))

(assert (=> start!115148 e!773571))

(declare-fun array_inv!33997 (array!92667) Bool)

(assert (=> start!115148 (array_inv!33997 a!3742)))

(assert (=> start!115148 true))

(declare-fun b!1364108 () Bool)

(assert (=> b!1364108 (= e!773571 false)))

(declare-fun lt!600832 () Bool)

(assert (=> b!1364108 (= lt!600832 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364109 () Bool)

(declare-fun res!907831 () Bool)

(assert (=> b!1364109 (=> (not res!907831) (not e!773571))))

(assert (=> b!1364109 (= res!907831 (not (contains!9503 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115148 res!907829) b!1364106))

(assert (= (and b!1364106 res!907828) b!1364109))

(assert (= (and b!1364109 res!907831) b!1364107))

(assert (= (and b!1364107 res!907832) b!1364105))

(assert (= (and b!1364105 res!907830) b!1364108))

(declare-fun m!1248373 () Bool)

(assert (=> b!1364106 m!1248373))

(declare-fun m!1248375 () Bool)

(assert (=> b!1364109 m!1248375))

(declare-fun m!1248377 () Bool)

(assert (=> b!1364107 m!1248377))

(declare-fun m!1248379 () Bool)

(assert (=> b!1364105 m!1248379))

(declare-fun m!1248381 () Bool)

(assert (=> b!1364108 m!1248381))

(declare-fun m!1248383 () Bool)

(assert (=> start!115148 m!1248383))

(check-sat (not start!115148) (not b!1364109) (not b!1364105) (not b!1364106) (not b!1364108) (not b!1364107))
(check-sat)
