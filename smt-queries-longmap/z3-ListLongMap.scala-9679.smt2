; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114436 () Bool)

(assert start!114436)

(declare-fun b!1358082 () Bool)

(declare-fun res!902060 () Bool)

(declare-fun e!771022 () Bool)

(assert (=> b!1358082 (=> (not res!902060) (not e!771022))))

(declare-datatypes ((List!31726 0))(
  ( (Nil!31723) (Cons!31722 (h!32940 (_ BitVec 64)) (t!46376 List!31726)) )
))
(declare-fun acc!759 () List!31726)

(declare-fun noDuplicate!2269 (List!31726) Bool)

(assert (=> b!1358082 (= res!902060 (noDuplicate!2269 acc!759))))

(declare-fun b!1358083 () Bool)

(assert (=> b!1358083 (= e!771022 false)))

(declare-fun lt!599559 () Bool)

(declare-datatypes ((array!92509 0))(
  ( (array!92510 (arr!44698 (Array (_ BitVec 32) (_ BitVec 64))) (size!45249 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92509)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92509 (_ BitVec 32) List!31726) Bool)

(assert (=> b!1358083 (= lt!599559 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358084 () Bool)

(declare-fun res!902057 () Bool)

(assert (=> b!1358084 (=> (not res!902057) (not e!771022))))

(assert (=> b!1358084 (= res!902057 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31723))))

(declare-fun b!1358085 () Bool)

(declare-fun res!902059 () Bool)

(assert (=> b!1358085 (=> (not res!902059) (not e!771022))))

(declare-fun contains!9438 (List!31726 (_ BitVec 64)) Bool)

(assert (=> b!1358085 (= res!902059 (not (contains!9438 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358086 () Bool)

(declare-fun res!902061 () Bool)

(assert (=> b!1358086 (=> (not res!902061) (not e!771022))))

(assert (=> b!1358086 (= res!902061 (not (contains!9438 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!902058 () Bool)

(assert (=> start!114436 (=> (not res!902058) (not e!771022))))

(assert (=> start!114436 (= res!902058 (and (bvslt (size!45249 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45249 a!3742))))))

(assert (=> start!114436 e!771022))

(declare-fun array_inv!33979 (array!92509) Bool)

(assert (=> start!114436 (array_inv!33979 a!3742)))

(assert (=> start!114436 true))

(assert (= (and start!114436 res!902058) b!1358082))

(assert (= (and b!1358082 res!902060) b!1358085))

(assert (= (and b!1358085 res!902059) b!1358086))

(assert (= (and b!1358086 res!902061) b!1358084))

(assert (= (and b!1358084 res!902057) b!1358083))

(declare-fun m!1244293 () Bool)

(assert (=> b!1358084 m!1244293))

(declare-fun m!1244295 () Bool)

(assert (=> b!1358085 m!1244295))

(declare-fun m!1244297 () Bool)

(assert (=> b!1358082 m!1244297))

(declare-fun m!1244299 () Bool)

(assert (=> start!114436 m!1244299))

(declare-fun m!1244301 () Bool)

(assert (=> b!1358083 m!1244301))

(declare-fun m!1244303 () Bool)

(assert (=> b!1358086 m!1244303))

(check-sat (not b!1358083) (not b!1358086) (not b!1358084) (not b!1358085) (not start!114436) (not b!1358082))
(check-sat)
