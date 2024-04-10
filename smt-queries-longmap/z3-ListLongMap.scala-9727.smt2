; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115150 () Bool)

(assert start!115150)

(declare-fun b!1364190 () Bool)

(declare-fun res!907874 () Bool)

(declare-fun e!773611 () Bool)

(assert (=> b!1364190 (=> (not res!907874) (not e!773611))))

(declare-datatypes ((array!92720 0))(
  ( (array!92721 (arr!44790 (Array (_ BitVec 32) (_ BitVec 64))) (size!45340 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92720)

(declare-datatypes ((List!31831 0))(
  ( (Nil!31828) (Cons!31827 (h!33036 (_ BitVec 64)) (t!46525 List!31831)) )
))
(declare-fun arrayNoDuplicates!0 (array!92720 (_ BitVec 32) List!31831) Bool)

(assert (=> b!1364190 (= res!907874 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31828))))

(declare-fun b!1364191 () Bool)

(declare-fun res!907875 () Bool)

(assert (=> b!1364191 (=> (not res!907875) (not e!773611))))

(declare-fun acc!759 () List!31831)

(declare-fun contains!9540 (List!31831 (_ BitVec 64)) Bool)

(assert (=> b!1364191 (= res!907875 (not (contains!9540 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364192 () Bool)

(declare-fun res!907873 () Bool)

(assert (=> b!1364192 (=> (not res!907873) (not e!773611))))

(declare-fun noDuplicate!2397 (List!31831) Bool)

(assert (=> b!1364192 (= res!907873 (noDuplicate!2397 acc!759))))

(declare-fun b!1364193 () Bool)

(assert (=> b!1364193 (= e!773611 false)))

(declare-fun lt!601021 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1364193 (= lt!601021 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364194 () Bool)

(declare-fun res!907872 () Bool)

(assert (=> b!1364194 (=> (not res!907872) (not e!773611))))

(assert (=> b!1364194 (= res!907872 (not (contains!9540 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907876 () Bool)

(assert (=> start!115150 (=> (not res!907876) (not e!773611))))

(assert (=> start!115150 (= res!907876 (and (bvslt (size!45340 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45340 a!3742))))))

(assert (=> start!115150 e!773611))

(declare-fun array_inv!33818 (array!92720) Bool)

(assert (=> start!115150 (array_inv!33818 a!3742)))

(assert (=> start!115150 true))

(assert (= (and start!115150 res!907876) b!1364192))

(assert (= (and b!1364192 res!907873) b!1364191))

(assert (= (and b!1364191 res!907875) b!1364194))

(assert (= (and b!1364194 res!907872) b!1364190))

(assert (= (and b!1364190 res!907874) b!1364193))

(declare-fun m!1248901 () Bool)

(assert (=> b!1364193 m!1248901))

(declare-fun m!1248903 () Bool)

(assert (=> b!1364191 m!1248903))

(declare-fun m!1248905 () Bool)

(assert (=> start!115150 m!1248905))

(declare-fun m!1248907 () Bool)

(assert (=> b!1364194 m!1248907))

(declare-fun m!1248909 () Bool)

(assert (=> b!1364190 m!1248909))

(declare-fun m!1248911 () Bool)

(assert (=> b!1364192 m!1248911))

(check-sat (not b!1364194) (not b!1364191) (not start!115150) (not b!1364192) (not b!1364190) (not b!1364193))
(check-sat)
